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
     * @return bool
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
            return false;
        }
    }


    private static function checkFormat($cell, $currentColumn)
    {
        //检查excel的格式
        $th = array_values(self::setThName());
        $data = self::getCellValue($cell); //获取cell中数据

        if (str_replace(["\n"," "],["",""], $th[$currentColumn-1]) != str_replace(["\n"," "],["",""], $data)) {
            \Yii::$app->session->setFlash('error', ":(  Excel表格式错误,请检查");
            return false;
        }

        return true;
    }

    /**
     * sheet读取器
     * @param \PHPExcel_Worksheet $sheet
     * @param $highestRow
     * @return bool
     * @throws \yii\db\Exception
     */
    private static function sheetReader(\PHPExcel_Worksheet $sheet, $highestRow)
    {
        //逐行处理
        foreach ($sheet->getRowIterator() as $row) {
            $currentRow = $row->getRowIndex();
            if ($currentRow > 1) {  //确定从哪一行开始读取
                //对象收集数据
                $object   = Excel::rowReader($row, $highestRow);
                if ($object == false) {
                    return false;
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
            \Yii::$app->session->setFlash('success', "本次成功导入{$total}条订单数据");
            return true;
        } else if(self::$updatedTotal > 0 ){
            $updateTotal = self::$updatedTotal;
            \Yii::$app->session->setFlash('success', "本次导入更新了{$updateTotal}条订单数据");
            return true;
        }


        if (!empty(self::$errorMsg)) {
            \Yii::$app->session->setFlash('error', json_encode(self::$errorMsg));
        } else {
            \Yii::$app->session->setFlash('warning', "没有找到需要更新的订单");
        }

        return false;
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