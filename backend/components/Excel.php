<?php
/**
 * Created by PhpStorm.
 * User: lychee
 * Date: 2018/10/27
 * Time: 19:31
 */

namespace backend\components;

use Yii;
use app\models\OrderToTransactor;
use backend\models\Admin;
use common\models\Transator;
use common\models\Type;
use common\models\Order;
use common\models\Snapshot;
use PHPExcel_Worksheet_Row;
use common\models\ExportSetting;

class Excel
{
    private static $importTotal  = 0;
    private static $updatedTotal = 0;
    private static $errorMsg     = [];

    /**
     * 获取更新 或者 插入的值
     * @return int
     */
    public static function getAffectedTotal()
    {
        return self::$importTotal + self::$updatedTotal;
    }

    /**
     * 合并表头
     * @return array
     */
    public static function setMergeName()
    {
        return [
            'A1' => '订单详情',
            'N1' => '收入',
            'V1' => '支出',
            'AE1' => '发货',
            'AL1' => '结算',
            'AQ1' => '其他'
        ];
    }

    public static function getHeaderStyle()
    {
        return  $headStyle = array(
            'font' => [
                'bold' => true,
                'name' => '宋体'
            ],
            'alignment' => [
                'horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                'vertical'   => \PHPExcel_Style_Alignment::VERTICAL_CENTER
            ],
            'borders'   => [
                'top'    => ['style' => \PHPExcel_Style_Border::BORDER_THIN],
                'left'   => ['style' => \PHPExcel_Style_Border::BORDER_THIN],
                'right'  => ['style' => \PHPExcel_Style_Border::BORDER_THIN],
                'bottom' => ['style' => \PHPExcel_Style_Border::BORDER_THIN]
            ],
            'fill' => [
                'type' => \PHPExcel_Style_Fill::FILL_SOLID,
                'startcolor' => [
                    'rgb' => '92D050'
                ]
            ]
        );
    }

    /**
     * EXCEL 导入更新处理
     * @param $excelFilename
     * @return array
     */
    public static function ExcelReader($excelFilename)
    {
        try {
            // 读取 excel 文档
            $reader = \PHPExcel_IOFactory::createReader('Excel2007');
            // 文档名称
            $PHPExcel = $reader->load($excelFilename);
            // 读取第一个工作表(编号从 0 开始)
            $sheet = $PHPExcel->getSheet(0);
            // 取得总行数
            $highestRow = $sheet->getHighestRow();
            return self::sheetReader($sheet, $highestRow);

        } catch (\Exception $e) {
            return ['status' => false, 'msg' => '导入过程发生错误'];
        }
    }


    /**
     * @param $statics
     * @throws \PHPExcel_Exception
     * @throws \PHPExcel_Writer_Exception
     */
    public static function exportStatics($statics)
    {
        //初始化实例
        $objPHPExcel = new \PHPExcel();
        $objWriter = new \PHPExcel_Writer_Excel2007($objPHPExcel);

        //设置表头
        $headStyle = Excel::getHeaderStyle();
        $sheet = $objPHPExcel->getActiveSheet();

        $columns = ['A1','B1','C1','D1','E1','F1','G1'];

        foreach ($columns as $column) {
            //设置自动换行
            $sheet->getStyle($column)->getAlignment()->setWrapText(true);
            //设置原谅色
            $sheet->getStyle($column)->applyFromArray($headStyle);
        }

        $sheet->getRowDimension('1')->setRowHeight(15);

        //设置宽度
        $sheet->getColumnDimension('A')->setWidth(25);
        $sheet->getColumnDimension('E')->setWidth(20);

        $headOne = ['A1:D1', 'E1:G1'];
        foreach ($headOne as $head) {
            $sheet->mergeCells($head);
        }

        $sheet->setCellValue('A1',  $statics[0]['title']);
        $sheet->setCellValue('E1',  $statics[1]['title']);
        $sheet->setCellValue('A2', '');
        $sheet->setCellValue('B2', '销售总额');
        $sheet->setCellValue('C2', '订单总数');
        $sheet->setCellValue('D2', '毛利');
        $sheet->setCellValue('E2', '销售总额');
        $sheet->setCellValue('F2', '订单总数');
        $sheet->setCellValue('G2', '毛利');

        //设置边框
        self::setBorder($sheet, 2, 'A', 'G');

        // $items
        $items = array_keys($statics[0]['data']);

        $columnFieldMap = ['A', 'B', 'C', 'D', 'E', 'F', 'G'];
        $row = 3;
        foreach ($items as $item) {
            self::setBorder($sheet, $row, 'A', 'G');
            foreach ($columnFieldMap as $_column) {
                switch ($_column)
                {
                    case 'A':
                        $sheet->setCellValue($_column . $row, $item);
                        break;

                    case 'B':
                        $sheet->setCellValue($_column . $row, $statics[0]['data'][$item]['sale_total']);
                        break;
                    case 'C':
                        $sheet->setCellValue($_column . $row, $statics[0]['data'][$item]['total_person']);
                        break;
                    case 'D':
                        $sheet->setCellValue($_column . $row, $statics[0]['data'][$item]['sale_total'] - $statics[0]['data'][$item]['cost_total']);
                        break;
                    case 'E':
                        $sheet->setCellValue($_column . $row, isset($statics[1]['data'][$item]) ? $statics[1]['data'][$item]['sale_total'] : '0');
                        break;
                    case 'F':
                        $sheet->setCellValue($_column . $row, isset($statics[1]['data'][$item]) ? $statics[1]['data'][$item]['total_person'] : 0);
                        break;
                    case 'G':
                        $sheet->setCellValue($_column . $row, isset($statics[1]['data'][$item]) ? $statics[1]['data'][$item]['sale_total'] - $statics[1]['data'][$item]['cost_total'] : 0);
                        break;
                }

                $sheet->freezePane($_column . $row);
            }

            $row++;
        }

        //设置文件名称
        $file_name = !empty($file_name)? $file_name : "订单统计" . date('Ymd_His');
        self::setDownloadHeader($file_name);

        $objWriter->save('php://output');
    }

    /**
     * @param \PHPExcel_Worksheet $sheet
     * @param $row
     * @param $startRow
     * @param $endRow
     * @throws \PHPExcel_Exception
     */
    protected static function setBorder(\PHPExcel_Worksheet $sheet, $row, $startRow, $endRow)
    {
        $sheet->getStyle("{$startRow}{$row}:{$endRow}{$row}")->applyFromArray([
            'borders' => [
                'allborders' => [
                    'style' => \PHPExcel_Style_Border::BORDER_THIN,//细边框
                    'color' => ['argb' => '00000000'],
                ],
            ],
        ]);
    }

    /**
     * @param $data
     * @param $file_name
     * @throws \PHPExcel_Exception
     * @throws \PHPExcel_Writer_Exception
     */
    public static function excelExport($data, $file_name)
    {
        $cacheObject = Yii::$app->cache;
        $uid = Yii::$app->user->getId();
        $cacheObject->set($uid, 0, 3600);

        //权限判断
        $showFlag = ExportSetting::getShowSetting();
        $cacheMethod = \PHPExcel_CachedObjectStorageFactory::cache_to_discISAM;
        $cacheSettings = array('memoryCacheSize'=>'512MB');
        \PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings);

        //初始化实例
        $objPHPExcel = new \PHPExcel();
        $objWriter = new \PHPExcel_Writer_Excel2007($objPHPExcel);

        //设置表头
        $headStyle = Excel::getHeaderStyle();

        $sheet = $objPHPExcel->getActiveSheet();

        $columns = [
            ['A1','B1','C1','D1','E1','F1','G1','H1','I1','J1','K1','L1','M1','N1','O1','P1','Q1','R1','S1','T1','U1','V1','W1','X1','Y1','Z1','AA1','AB1','AC1','AD1','AE1','AF1','AG1','AH1','AI1','AJ1','AK1','AL1','AM1','AN1','AO1','AP1',"AQ1", "AR1", "AS1"],
            ['A2','B2','C2','D2','E2','F2','G2','H2','I2','J2','K2','L2','M2','N2','O2','P2','Q2','R2','S2','T2','U2','V2','W2','X2','Y2','Z2','AA2','AB2','AC2','AD2','AE2','AF2','AG2','AH2','AI2','AJ2','AK2','AL2','AM2','AN2','AO2','AP2',"AQ2", "AR2", "AS2"]
        ];

        foreach ($columns as $lines) {
            foreach ($lines as $column) {
                //设置自动换行
                $sheet->getStyle($column)->getAlignment()->setWrapText(true);
                //设置原谅色
                $sheet->getStyle($column)->applyFromArray($headStyle);
            }
        }

        //设置行高
        $sheet->getRowDimension('1')->setRowHeight(25);
        $sheet->getRowDimension('2')->setRowHeight(35);

        //设置宽度
        $sheet->getColumnDimension('A')->setWidth(22);
        $sheet->getColumnDimension('B')->setWidth(22);
        $sheet->getColumnDimension('C')->setWidth(16);
        $sheet->getColumnDimension('D')->setWidth(16);
        $sheet->getColumnDimension('E')->setWidth(16);
        $sheet->getColumnDimension('U')->setWidth(20);
        $sheet->getColumnDimension('F')->setWidth(16);
        $sheet->getColumnDimension('G')->setWidth(20);
        $sheet->getColumnDimension('H')->setWidth(10);
        $sheet->getColumnDimension('I')->setWidth(10);
        $sheet->getColumnDimension('K')->setWidth(35);
        $sheet->getColumnDimension('J')->setWidth(25);
        $sheet->getColumnDimension('M')->setWidth(10);
        $sheet->getColumnDimension('AB')->setWidth(15);
        $sheet->getColumnDimension('AC')->setWidth(15);
        $sheet->getColumnDimension('AD')->setWidth(15);
        $sheet->getColumnDimension('AE')->setWidth(15);
        $sheet->getColumnDimension('AF')->setWidth(15);
        $sheet->getColumnDimension('AG')->setWidth(45);
        $sheet->getColumnDimension('AH')->setWidth(16);
        $sheet->getColumnDimension('AI')->setWidth(16);
        $sheet->getColumnDimension('AJ')->setWidth(16);
        $sheet->getColumnDimension('AK')->setWidth(16);
        $sheet->getColumnDimension('AL')->setWidth(20);
        $sheet->getColumnDimension('AM')->setWidth(16);
        $sheet->getColumnDimension('AN')->setWidth(16);

        $sheet->getColumnDimension('AO')->setWidth(20);
        $sheet->getColumnDimension('AP')->setWidth(25);
        $sheet->getColumnDimension('AQ')->setWidth(25);
        $sheet->getColumnDimension('AR')->setWidth(25);
        $sheet->getColumnDimension('AS')->setWidth(25);


        $fieldAttribute = Excel::setMergeName() + Excel::setThName();
        foreach ($fieldAttribute as $column_x => $field) {
            $sheet->setCellValue($column_x,  $field);
        }

        $headOne = ['A1:M1', 'N1:U1', 'V1:AD1', 'AE1:AK1', 'AL1:AO1','AQ1:AS1'];
        foreach ($headOne as $head) {
            $sheet->mergeCells($head);
        }

        //填充内容
        $columnFieldMap = [
            'A' => 'customer_id',
            'B' => 'order_num',
            'C' => 'order_date',//order_date
            'D' => 'collect_date',
            'E' => 'deliver_date',
            'F' => 'entry_date',
            'G' => 'combo_product',
            'H' => 'combo_classify',
            'I' => 'service_name',
            'J' => 'operator',//操作人员
            'K' => 'transactor',//办理人名称
            'L' => 'combo_type',//套餐类型
            'M' => 'combo_name',//套餐名称

            'N' => 'single_sum',
            'O' => 'total_person',
            'P' => 'balance_sum',//补差收入
            'Q' => 'flushphoto_sum',//冲洗照片补差收入
            'R' => 'carrier_sum',//快递补差收入
            'S' => 'cal_charge',//合计
            'T' => 'charge',//手续费
            'U' => 'total_charge',//实收

            'V' => 'combo_cost',//单项实付合计
            'W' => 'total_person',//数量
            'X' => 'output_balance_sum',//补差
            'Y' => 'output_flushphoto_sum',//照片
            'Z' => 'output_carrier_sum',//快递
            'AA' => 'total_pay',//实付合计
            'AB' => 'fee',//利润

            'AC' => 'draw_bill_status',
            'AD' => 'refund_status',
            'AE' => 'back_addressee',
            'AF' => 'back_telphone',
            'AG' => 'back_address',
            'AH' => 'putsign_date',
            'AI' => 'delivergood_date',
            'AJ' => 'delivercompany',
            'AK' => 'deliver_order',//寄回客人单号

            'AL' => 'pay_date', //店铺收款日
            'AM' => 'receipt_date',
            'AN' => 'company_receipt_date',
            'AO' => 'pay_account',

            'AP' => 'remark',

            'AQ' => 'balance_order',
            'AR' => 'flushphoto_order',
            'AS' => 'carrier_order',
        ];

        $startColumn = 'A';
        $endColumn = "AS";
        $row = 3;

        //设置默认字体 大小 颜色
        $objPHPExcel->getDefaultStyle()->getFont()->setName( '宋体');
        $objPHPExcel->getDefaultStyle()->getFont()->setSize(9);
        $objPHPExcel->getDefaultStyle()->getFont()->setColor(new \PHPExcel_Style_Color(\PHPExcel_Style_Color::COLOR_RED));

        //统计
        $total_person_sum = 0;
        $totalData = count($data);

        foreach ($data as $key => $object) {

            $cacheObject->set($uid, floor(($key+1)*100/$totalData), 3600);

            //数据准备
            try {
                $charge = $object->snapshot->combo_charge;
                $cost = $object->snapshot->combo_cost;
            } catch (\Exception $e) {
                //$object->id
                continue;
            }

            foreach ($columnFieldMap as $_column => $_field) {
                //自动换行
                $sheet->getStyle($_column . $row)->getAlignment()->setWrapText(true);

                //设置行高
                $sheet->getRowDimension($row)->setRowHeight(23);

                //设置边框
                self::setBorder($sheet, $row, $startColumn, $endColumn);

                //设置水平竖直居中
                $sheet->getStyle($_column . $row)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
                $sheet->getStyle($_column . $row)->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);

                //设置自动换行
                $sheet->getStyle($_column)->getAlignment()->setWrapText(true);

                //填充数据
                $cellValue = false;

                switch ($_field)
                {
                    case 'order_num':
                        $cellValue = "'" . str_replace([',','，'],"  ", $object->order_num);
                        $sheet->getStyle($_column . $row)->getAlignment()->setWrapText(true);
                        $sheet->getStyle($_column . $row)->getNumberFormat()->setFormatCode(\PHPExcel_Style_NumberFormat::FORMAT_TEXT);
                        break;

                    case 'combo_product':
                        $product = $object->snapshot;
                        $cellValue = $product ? $product->combo_product : '已删除';
                        break;

                    case 'combo_type':
                        $type = Type::getComboType();
                        $cellValue = isset($type[$object->order_type]) ? $type[$object->order_type] : '已删除';
                        break;

                    case 'service_name':
                        $servicer = $object->servicer;
                        $cellValue = $servicer ? $servicer->name : '已删除';
                        break;

                    case 'operator':
                        $operator = $object->operator;
                        if (!is_null($operator)) {
                            $cellValue = $operator->username;
                        } else {
                            $cellValue = ' ';
                        }

                        break;

                    case 'combo_cost':
                        if ($showFlag) {
                            if ($cost = $object->snapshot) {
                                $cellValue = $cost ? $cost->combo_cost : '数据丢失';
                                $cost = $cost->combo_cost;
                            }

                        }
                        break;
                    case 'draw_bill_status':
                        $statuses = Type::getYesOrNo();
                        $cellValue = $statuses[$object->draw_bill_status];
                        break;
                    case 'refund_status':
                        $refundStatus = Type::getRefundStatus();
                        $cellValue =  $refundStatus[$object->refund_status];
                        break;
                    case 'combo_classify':
                        $classify = Type::getComboClassify();
                        $cellValue = $classify[$object->snapshot->combo_classify];
                        break;

                    case 'combo_name':
                        $combo = $object->snapshot;
                        $cellValue = $combo ? $combo->combo_name : "丢失数据";
                        break;

                    case 'total_person':
                        $cellValue = $object->total_person;
                        $total_person_sum += $cellValue;
                        break;

                    case 'charge': //手续费率
                        $cellValue = $charge;
                        break;

                    case 'cal_charge':
                        $cellValue = $object->total_person * $object->single_sum +
                            $object->flushphoto_sum +
                            $object->carrier_sum +
                            $object->balance_sum;
                        break;

                    case 'total_charge': //累加处理
                        $income = $object->total_person * $object->single_sum +
                            $object->flushphoto_sum +
                            $object->carrier_sum +
                            $object->balance_sum;

                        $cellValue = $income * ( $charge > 0 ? $charge : 1);
                        break;

                    case 'total_pay':
                        //累加处理
                        if ($showFlag) {
                            $cellValue = $object->output_total_person * $cost +
                                $object->output_flushphoto_sum +
                                $object->output_carrier_sum +
                                $object->output_balance_sum;
                        }
                        break;

                    case 'fee':
                        //收入减支出
                        if ($showFlag) {
                            $income = ($object->total_person * $object->single_sum +
                                    $object->flushphoto_sum +
                                    $object->carrier_sum +
                                    $object->balance_sum) * ( $charge > 0 ? $charge : 1);

                            $costValue = $object->output_total_person * $cost +
                                $object->output_flushphoto_sum +
                                $object->output_carrier_sum +
                                $object->output_balance_sum;

                            $cellValue = $income - $costValue;
                        }
                        break;

                    case 'balance_order':
                    case 'flushphoto_order':
                    case 'carrier_order':
                    case 'deliver_order':
                        if ($object->$_field) {
                            $cellValue = "'" . $object->$_field;
                        }
                        break;

                    case 'transactor':
                        $transactors = $object->relatedTransactor;
                        $str = "";
                        foreach ($transactors as $transator) {
                            $str .= $transator['name'] . " ";
                        }
                        $cellValue = $str ? $str : '已删除';

                        //设置批注
                        if ($object->remark) {
                            $commentAuthor = !empty($object->operator->username) ? $object->operator->username : "PHPExcel";
                            $sheet->getComment( $_column . $row)->setAuthor($commentAuthor);     //设置作者
                            $objCommentRichText = $sheet->getComment($_column . $row )->getText()->createTextRun($commentAuthor . " :");  //添加批注
                            $objCommentRichText->getFont()->setBold( true);  //将现有批注加粗
                            $sheet->getComment( $_column . $row)->getText()->createTextRun("\r\n" );      //添加更多批注
                            $sheet->getComment( $_column . $row)->getText()->createTextRun($object->remark);
                            $sheet->getComment( $_column . $row)->setWidth('100pt' );      //设置批注显示的宽高 ，在office中有效在wps中无效
                            $sheet->getComment( $_column . $row)->setHeight('100pt' );
                            $sheet->getComment( $_column . $row)->setMarginLeft('150pt' );
                            $sheet->getComment( $_column . $row)->getFillColor()->setRGB('FFFFD8' );      //设置背景色 ，在office中有效在wps中无效
                        }
                        break;

                    default:
                        $cellValue = "";
                        if ($object->$_field) {
                            if (strpos($_field, 'date') !== false ) {
                                $cellValue = date('Y年n月j日', strtotime($object->$_field));
                            } else {
                                $cellValue = !empty($object->$_field) ? $object->$_field : '';
                            }
                        }
                        break;
                }

                if ($cellValue) {
                    $sheet->setCellValue($_column . $row, $cellValue);
                }
            }
            $row++;
        }

        $sheet->getRowDimension($row)->setRowHeight(23);


        //设置边框
        self::setBorder($sheet, $row, $startColumn, $endColumn);
        //填充统计数据颜色
        $hoverColumn = ['O'=>'ffff00','S'=>'ff0000','U'=>'ff0000','V'=>'ff0000','P'=>'','Q'=>'','R'=>'','W'=>'','X'=>'','Y'=>'','Z'=>'','AA'=>'','AB'=>'','N'=>''];
        foreach ($hoverColumn as $column => $colorCode) {
            //居中
            $sheet->getStyle( $column . $row)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_JUSTIFY);
            $sheet->getStyle(  $column . $row)->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);
            //设置字体
            $sheet->getStyle( $column . $row)->getFont()->setSize(11);
            $sheet->getStyle( $column . $row)->getFont()->setBold(true);
            $sheet->getStyle( $column . $row)->getFont()->getColor()->setARGB(\PHPExcel_Style_Color::COLOR_BLACK);
            //设置颜色
            if ($colorCode) {
                $sheet->getStyle( $column . $row)->getFill()->setFillType(\PHPExcel_Style_Fill::FILL_SOLID);
                $sheet->getStyle($column . $row)->getFill()->getStartColor()->setRGB($colorCode);
            }
        }

        //填充统计数据
        $calculate = ['N','O','P','Q','R','S','U','V','W','X','Y','Z','AA','AB'];
        foreach ($calculate as $col) {
            $sheet->setCellValue($col . $row, self::getSumString($col,3,$row-1));
        }

        //设置文件名称
        $file_name = !empty($file_name)? $file_name : "阳光假日报表" . date('Ymd_His');
        self::setDownloadHeader($file_name);

        $objWriter->save('php://output');
    }



    private static function setDownloadHeader($file_name)
    {
        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
        header("Content-Type:application/force-download");
        header("Content-Type:application/vnd.ms-execl");
        header('Content-Type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet');

        header("Content-Type:application/octet-stream");
        header("Content-Type:application/download");;
        header('Content-Disposition:attachment;filename='.$file_name.'.xlsx');
        header("Content-Transfer-Encoding:binary");
    }

    /**
     * 统计表头字符串
     * @param $col
     * @param $start
     * @param $end
     * @return string
     */
    private static function getSumString($col,$start,$end)
    {
        $str = $col . $start . ':' . $col . $end;
        $str = trim($str, ':');
        $str = "=SUM(" . $str . ")";
        return $str;
    }


    private static function checkFormat($cell, $currentColumn)
    {
        //检查excel的格式
        $th = array_values(self::setThName());
        $data = self::getCellValue($cell); //获取cell中数据

        if (str_replace(["\n"," "],["",""], $th[$currentColumn-1]) != str_replace(["\n"," "],["",""], $data)) {
            return false;
        }

        return true;
    }

    /**
     * sheet读取器
     * @param \PHPExcel_Worksheet $sheet
     * @param $highestRow
     * @return array
     * @throws \yii\db\Exception
     */
    private static function sheetReader(\PHPExcel_Worksheet $sheet, $highestRow)
    {
        //逐行处理
        foreach ($sheet->getRowIterator() as $row) {
            $currentRow = $row->getRowIndex();
            //确定从哪一行开始读取
            if ($currentRow > 1) {
                //对象收集数据
                $object   = Excel::rowReader($row, $highestRow);
                if ($object == false) {
                    return ['status' => false, 'msg' => '格式错误'];
                }
                if ($currentRow == 2) {
                    continue;
                }

                /**
                 * @var Snapshot $snapshot
                 * @var Order $order
                 */
                $snapshot = $object['snapshot'];
                $order    = $object['order'];

                //判断订单是否不存在 办理人是否存在
                $isExistOrder = Order::findOne(['order_num' => $order->order_num]);

                if (!is_null($isExistOrder) ) {
                    $order = self::updateByExcel($isExistOrder,$order);

                    if ($order === true) {
                        self::$updatedTotal++;
                    } else if (!is_null($order)) {
                        $error = array_values($order->getFirstErrors());
                        $errorMsg[$currentRow] = ['row' => $currentRow,'msg' => $error[0]];
                    }

                    continue;
                }

                $transaction = Yii::$app->db->beginTransaction();

                try {
                    $result = Excel::createOrder($order, $snapshot, $currentRow);
                    if ($result === false) {
                        throw new \Exception('导入保存发生错误');
                    }

                    $transaction->commit();
                    self::$importTotal++;
                } catch (\Exception $e) {
                    $transaction->rollBack();
                }
            }
        }

        if (self::$importTotal > 0) {
            $total = self::$importTotal;
            return ['status' => true, 'msg' => "本次成功导入{$total}条订单数据"];
        } else if(self::$updatedTotal > 0 ){
            $updateTotal = self::$updatedTotal;
            return ['status' => true, 'msg' => "本次导入更新了{$updateTotal}条订单数据"];
        }

        if (!empty(self::$errorMsg)) {
            return ['status' => false, 'msg' => self::$errorMsg];
        }

        return ['status' => false, 'msg' => "没有找到需要更新的订单"];
    }

    private static function updateByExcel(Order $order, $excelOrder)
    {
        //对比数据进行更新
        $checkFields = [
            'delivercompany', 'deliver_order',
            'balance_order', 'flushphoto_order', 'carrier_order',
            'balance_order', 'balance_sum', 'output_balance_sum',
            'flushphoto_order', 'flushphoto_sum', 'output_flushphoto_sum',
            'carrier_order', 'carrier_sum', 'output_carrier_sum',
            'collect_date','deliver_date','entry_date','putsign_date', 'delivergood_date', 'receipt_date', 'company_receipt_date', 'pay_date',
            'back_address','back_addressee','back_telphone','deliver_order','delivercompany','remark','pay_account', 'refund_status', 'draw_bill_status'
        ];

        $isNewRecord = false;

        foreach ($checkFields as $field) {
            $data = $excelOrder->$field;
            if (is_null($data)) continue;

            if (strpos($field, 'date')) {
                //如果是浮点数 则转换
                if (is_float($data)) {
                    $data = \PHPExcel_Shared_Date::ExcelToPHP($data);
                    $data = date('Y-m-d', $data);
                }
                $data = date('Y-m-d', strtotime(str_replace(['年', '月', '日'],['-', '-',''], $data)));

            } else if (is_float($data)){
                $data = (string)$data;
            }

            if (($order->$field != $data)) {

                $order->$field = $data;
                $isNewRecord = true;
            }
        }

        if ($isNewRecord) {
            $order->scenario = 'updateByExcel';
            if ($order->save()) {
                return true;
            }

            return $order;
        }
        return null;
    }

    /**
     * 行读取
     * @param PHPExcel_Worksheet_Row $row
     * @param $highestRow
     * @return array|boolean
     */
    private static function rowReader(PHPExcel_Worksheet_Row $row, $highestRow)
    {
        $order    = new Order();
        $snapshot = new Snapshot();

        $order->scenario = 'importFromExcel';
        $currentRow      = $row->getRowIndex();
        $currentColumn   = 1;

        //逐列读取
        foreach ($row->getCellIterator() as $columnIndex => $cell) {

            if (!isset(self::IndexToColumn()[$currentColumn])) {
                continue;
            }

            if ($currentRow == 2) {
                $result = self::checkFormat($cell, $currentColumn);
                if ($result == false) {
                    return false;
                }
                $currentColumn++;
                continue;
            }

            $field = self::ColumnToField()[self::IndexToColumn()[$currentColumn]];

            if ($field) {
                //获取cell中数据
                $data = self::getCellValue($cell);

                // 如果是空的 那么将忽略掉 避免两个人操作时冲突
                if (empty($data)) {
                    $currentColumn++;
                    continue;
                }

                // 如果最后一行的第一个单元是是空的 那么将会当成统计行 不作统计处理
                if ($currentRow == $highestRow && $columnIndex == 'A' && empty($data)) {
                    //echo "INDEX: {$columnIndex} {$field} {$data} <br/>";
                    break;
                }

                switch ($field)
                {
                    case 'order_num':
                        //判断订单号是否存在
                        $order->order_num = trim($data,  "'");
                        break;

                    case 'combo_type':
                        $types = Type::getComboType();
                        $type = array_search(trim($data), $types);

                        $snapshot->$field = (string)$type;
                        $order->order_type = (string)$type;
                        break;

                    case 'servicer':
                        //查找系统 有没有此客服 不再支持excel方式 改变客服
                        /* $servicerData = Servicer::findOne(['name' => trim($data)]);
                        if (!is_null($servicerData)) {
                            $servicer->name = trim($data);
                            $order->custom_servicer_id = $servicerData->id;
                        }*/
                        break;
                    // 操作者 不再支持由excel 导入改变，除非当前用户为超级管理员
                    case 'operator_id':
                        //查找操作用户
                        if (Type::isSuperAdmin()) {
                            $uid = Admin::findOne(['username' => trim($data)]);
                            if ($uid) {
                                $order->$field = $uid->id;
                            }
                        }

                        break;
                    case 'refund_status':
                        $refundStatus = Type::getRefundStatus();
                        if (in_array($data, $refundStatus)) {
                            $order->$field = array_search($data, $refundStatus);
                        }
                        break;

                    case 'draw_bill_status';
                        $drawStatus = Type::getYesOrNo();
                        if (in_array($data, $drawStatus)) {
                            $order->$field = array_search($data, $drawStatus);
                        }

                        break;
                    case 'transator_id':

                        //过滤字符串
                        if (($pos = strpos($data, '【')) !== false) {
                            preg_match('/(?<=【)[^】]+/', $data, $preg);
                            isset($preg[0]) && !empty($preg[0]) && $order->remark = $preg[0];
                            $data = substr($data, 0, $pos);

                        } elseif (($pos = strpos($data, '(')) !== false) {

                            preg_match('/(?<=\()[^\)]+/', $data, $preg);
                            isset($preg[0]) && !empty($preg[0]) && $order->remark = $preg[0];
                            $data = substr($data, 0, $pos);
                        }  elseif (($pos = strpos($data, '（')) !== false) {

                            preg_match('/(?<=（)[^）]+/', $data, $preg);
                            isset($preg[0]) && !empty($preg[0]) && $order->remark = $preg[0];
                            $data = substr($data, 0, $pos);
                        }

                        $data = str_replace([',', '，', '、'], [' ',' ', ' '], $data);
                        //查找办理人
                        $transactors = explode(' ', trim($data));

                        array_walk($transactors, function(&$v){
                            $v = trim($v);
                        });

                        $transactors = array_filter($transactors);

                        if (!empty($transactors)) {
                            foreach ($transactors as $transactor) {
                                $_transactor = Transator::findOne(['name' => $transactor]);
                                if ($_transactor) {
                                    $existTransactor[] = $_transactor->tid;
                                } else {
                                    $notExistTransactorName[] = $transactor;
                                }

                            }
                        }
                        break;

                    case 'combo_classify':
                        $classify = Type::getComboClassify();

                        $type = array_search($data, $classify);
                        $snapshot->combo_classify = (string)$type;
                        $snapshot->snap_combo_id = '0';
                        $order->order_classify = (string)$type;
                        break;

                    case 'combo_name':
                    case 'combo_product':
                    case 'combo_charge':
                    case 'combo_cost':
                        $snapshot->$field = empty($data)? 0.00 : (string)$data;
                        break;
                    case 'back_telphone':
                        $data = trim($data, "'");
                        $order->$field = (string)$data;
                        break;
                    case 'order_date':
                    case 'collect_date':
                    case 'deliver_date':
                    case 'entry_date':
                    case 'putsign_date':
                    case 'delivergood_date':
                    case 'pay_date':
                    case 'receipt_date':
                    case 'company_receipt_date':
                        //检测是否有年份
                        if ($data) {
                            //如果是浮点数 则转换
                            if (is_float($data)) {
                                $data = \PHPExcel_Shared_Date::ExcelToPHP($data);
                                $data = date('Y-m-d', $data);
                            }

                            $data = date('Y-m-d', strtotime(str_replace(['年', '月', '日'],['-', '-',''], $data)));
                            $order->$field = $data;
                        }
                        break;

                    case 'deliver_order':

                        $order->deliver_order = str_replace("'","",$data);
                        break;

                    case 'remark':
                        if (!$order->remark) {
                            $order->remark = $data;
                        }
                        break;

                    default:
                        if (strpos($field, 'sum') !== false) {
                            $order->$field = (float)$data;
                        } elseif (strpos($field, 'order') !== false){
                            $order->$field = (string)$data;
                        } else {
                            $order->$field = $data;
                        }
                        break;
                }
            }
            $currentColumn++;
        }

        return [
            'order'     => $order,
            'snapshot' => $snapshot,
        ];
    }

    /**
     * @param Order $order
     * @param Snapshot $snapshot
     * @param $currentRow
     * @return boolean
     */
    private static function createOrder(Order $order, Snapshot $snapshot, $currentRow)
    {
        $errorMsg               = [];
        $existTransactor        = [];
        $notExistTransactorName = [];

        //新增快照
        $snapshotResult         = $snapshot->save();

        //新增订单
        $order->transactor_id       = "0";
        $order->combo_id            = $snapshot->id;
        $order->back_addressee      = empty($order->back_addressee)? "-" : $order->back_addressee;
        $order->output_balance_sum  = empty($order->output_balance_sum) ? '0.00' : $order->output_balance_sum;
        $orderResult = $order->save();

        //处理不存在的办理人
        if (!empty($notExistTransactorName)) {
            foreach ($notExistTransactorName as $newTrName) {
                $newTransactor       = new Transator();
                $newTransactor->name = $newTrName;
                $transactorResult    = $newTransactor->save(false);
                $existTransactor[]   = $isExistOrder[] = $newTransactor->tid;
            }
        }

        //处理所有办理人的 订单-办理人关系
        if (!empty($existTransactor)) {
            foreach ($existTransactor as $existTrId) {
                $orderToTran = (new OrderToTransactor());
                $orderToTran->t_id = $existTrId;
                $orderToTran->o_id = $order->id;
                $orderToTran->save();
            }
        }

        if (!$orderResult || !$snapshotResult || (isset($transactorResult) && !$transactorResult)) {

            $snapshotError = array_values($snapshot->getFirstErrors());
            $orderError    = array_values($order->getFirstErrors());

            if (!empty($snapshotError)) {
                $errorMsg[$currentRow]     = ['row' => $currentRow,'msg' => $snapshotError[0]];
            } else if (!empty($orderError)) {
                $errorMsg[$currentRow]     = ['row' => $currentRow,'msg' => $orderError[0]];
            } else if (isset($newTransactor)) {
                $newTransactorError = $newTransactor->getFirstErrors();
                if (!empty($newTransactorError)) {
                    $errorMsg[$currentRow] = ['row' => $currentRow,'msg' => $newTransactorError[0]];
                }
            }
            self::$errorMsg = $errorMsg;

            return false;
        }

        return true;
    }

    // 索引与列
    public static function IndexToColumn()
    {
        return [
            1=>'A',2=>'B',3=>'C',4=>'D',5=>'E',6=>'F',7=>'G',8=>'H',9=>'I',10=>'J',
            11=>'K',12=>'L',13=>'M', 14=>'N',15=>'O',16=>'P',17=>'Q',18=>'R',19=>'S',20=>'T',
            21=>'U',22=>'V',23=>'W',24=>'X',25=>'Y',26=>'Z',27=>'AA',28=>'AB',29=>'AC',30=>'AD',
            31=>'AE',32=>'AF',33=>'AG',34=>'AH',35=>'AI',36=>'AJ',37=>'AK',38=>'AL',39=>'AM',40=>'AN',
            41 => 'AO', '42'=>'AP',43=>'AQ', '44' => 'AR', '45' => 'AS'
        ];
    }

    // 列与字段
    public static function ColumnToField()
    {
        return [
            'A' => 'customer_id',
            'B' => 'order_num',
            'C' => 'order_date',//order_date
            'D' => 'collect_date',
            'E' => 'deliver_date',
            'F' => 'entry_date',
            'G' => 'combo_product',
            'H' => 'combo_classify',
            'I' => 'servicer',
            'J' => 'operator_id',//操作人员
            'K' => 'transator_id',//办理人名称
            'L' => 'combo_type',//套餐类型
            'M' => 'combo_name',
            'N' => 'single_sum',
            'O' => 'total_person',
            'P' => 'balance_sum',
            'Q' => 'flushphoto_sum',
            'R' => 'carrier_sum', // 快递
            'S' => '', // 合计
            'T' => 'combo_charge', // 手续费
            'U' => '', // 实收
            'V' => 'combo_cost', //单项实付合计
            'W' => 'output_total_person',  //数量
            'X' => 'output_balance_sum',   //补差
            'Y' => 'output_flushphoto_sum',//照片
            'Z' => 'output_carrier_sum',   //快递
            'AA' => '', // 实付合计
            'AB' => '', // 利润
            'AC' => 'draw_bill_status',
            'AD' => 'refund_status',
            'AE' => 'back_addressee',
            'AF' => 'back_telphone',
            'AG' => 'back_address',
            'AH' => 'putsign_date',
            'AI' => 'delivergood_date',//寄回客人单号

            'AJ' => 'delivercompany', //店铺收款日
            'AK' => 'deliver_order',
            'AL' => 'pay_date',
            'AM' => 'receipt_date',

            'AN' => 'company_receipt_date',

            'AO' => 'pay_account',
            'AP' => 'remark',
            'AQ' => 'balance_order',
            'AR' => 'flushphoto_order',
            'AS' => 'carrier_order',
        ];
    }

    //设置表头
    public static function setThName()
    {
        $fieldAttribute = [
            'A2' => '客人ID',
            'B2' => '淘宝订单号',
            'C2' => '订单日期',
            'D2' => '收资料日',
            'E2' => '送证日',
            'F2' => '入馆日',
            'G2' => '名称',
            'H2' => '类型',
            'I2' => "接待\n销售",
            'J2' => "操作\n人员",
            'K2' => '办理人',
            'L2' => "套餐\n类型",
            'M2' => "套餐\n名称",

            'N2' => '单项实收',
            'O2' => '数量',
            'P2' => '补差',
            'Q2' => '照片',
            'R2' => '快递',
            'S2' => '合计',
            'T2' => '手续费',
            'U2' => '实收',

            'V2' => '单项实付',
            'W2' => '数量',
            'X2' => '补差',
            'Y2' => '照片',
            'Z2' => '快递',
            'AA2' => '实付合计',
            'AB2' => '利润',
            'AC2' => '是否开票',
            'AD2' => '是否退款',

            'AE2' => '收件人',
            'AF2' => '收件电话',
            'AG2' => '收件地址',
            'AH2' => "出签\n日期",
            'AI2' => "发货\n日期",
            'AJ2' => "快递公司",
            'AK2' => "寄回客人\n单号",

            'AL2' => '支付日期',
            'AM2' => "店铺收款日",
            'AN2' => "公司收款日",
            'AO2' => "收款帐户",
            'AP2' => '备注',
            'AQ2' => '补差订单',
            'AR2' => '代冲洗照片订单',
            'AS2' => '快递费补差订单',
        ];

        return $fieldAttribute;
    }

    public static function getCellValue($cell)
    {
        $data = $cell->getValue();
        if (is_object($data)) {
            return $data->__toString();
        }

        return $data;
    }

}