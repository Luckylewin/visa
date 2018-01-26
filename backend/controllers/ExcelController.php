<?php

namespace backend\controllers;


use common\models\OrderQuery;
use common\models\ProductQuery;
use common\models\Type;

class ExcelController extends BaseController
{
    public function actionIndex()
    {

        //初始化实例
        $objPHPExcel = new \PHPExcel();
        $objWriter = new \PHPExcel_Writer_Excel5($objPHPExcel);


        //设置表头
        $headStyle = array(
            'font' => array(
                'bold' => true,
                'name' => '宋体'
            ),
            'alignment' => array(
                'horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
                'vertical' => \PHPExcel_Style_Alignment::VERTICAL_CENTER
            ),
            'borders' => array(
                'top' => array(
                    'style' => \PHPExcel_Style_Border::BORDER_THIN,
                ),
                'left' => array(
                    'style' => \PHPExcel_Style_Border::BORDER_THIN,
                ),
                'right' => array(
                    'style' => \PHPExcel_Style_Border::BORDER_THIN,
                ),
                'bottom' => array(
                    'style' => \PHPExcel_Style_Border::BORDER_THIN,
                ),
            ),
            'fill' => array(
                'type' => \PHPExcel_Style_Fill::FILL_SOLID,
                'startcolor' => array(
                    'rgb' => '92D050',
                ),

            ),
        );

        $sheet = $objPHPExcel->getActiveSheet();

        $columns = [
                    ['A1','B1','C1','D1','E1','F1','G1','H1','I1','J1','K1','L1','M1','N1','O1','P1','Q1','R1','S1','T1','U1','V1','W1','X1','Y1','Z1','AA1','AB1','AC1','AD1','AE1','AF1','AG1','AH1','AI1'],
                    ['A2','B2','C2','D2','E2','F2','G2','H2','I2','J2','K2','L2','M2','N2','O2','P2','Q2','R2','S2','T2','U2','V2','W2','X2','Y2','Z2','AA2','AB2','AC2','AD2','AE2','AF2','AG2','AH2','AI2']
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
        $objPHPExcel->getActiveSheet()->getRowDimension('1')->setRowHeight(25);
        $objPHPExcel->getActiveSheet()->getRowDimension('2')->setRowHeight(35);

        //设置宽度
        $objPHPExcel->getActiveSheet()->getColumnDimension('A')->setWidth(12);
        $objPHPExcel->getActiveSheet()->getColumnDimension('B')->setWidth(12);
        $objPHPExcel->getActiveSheet()->getColumnDimension('C')->setWidth(7);
        $objPHPExcel->getActiveSheet()->getColumnDimension('D')->setWidth(7);
        $objPHPExcel->getActiveSheet()->getColumnDimension('E')->setWidth(7);
        $objPHPExcel->getActiveSheet()->getColumnDimension('F')->setWidth(7);
        $objPHPExcel->getActiveSheet()->getColumnDimension('G')->setWidth(7);
        $objPHPExcel->getActiveSheet()->getColumnDimension('H')->setWidth(7);
        $objPHPExcel->getActiveSheet()->getColumnDimension('I')->setWidth(7);
        $objPHPExcel->getActiveSheet()->getColumnDimension('J')->setWidth(35);
        $objPHPExcel->getActiveSheet()->getColumnDimension('AB')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('AC')->setWidth(35);
        $objPHPExcel->getActiveSheet()->getColumnDimension('AD')->setWidth(8);
        $objPHPExcel->getActiveSheet()->getColumnDimension('AE')->setWidth(8);
        $objPHPExcel->getActiveSheet()->getColumnDimension('AF')->setWidth(15);
        $objPHPExcel->getActiveSheet()->getColumnDimension('AG')->setWidth(7);
        $objPHPExcel->getActiveSheet()->getColumnDimension('AH')->setWidth(7);
        $objPHPExcel->getActiveSheet()->getColumnDimension('AI')->setWidth(20);

        //设置边框
        $borderStyle = array(
            'borders' => array(
                'allborders' => array(
                    'style' => \PHPExcel_Style_Border::BORDER_THIN,//细边框
                    'color' => array('argb' => '00000000'),
                ),
            ),
        );


        $fieldAttribute = [
            'A1' => '订单详情',
            'L1' => '收入',
            'R1' => '支出',
            'AA1' => '发货',
            'AG1' => '结算',
            'A2' => '客人ID',
            'B2' => '淘宝订单号',
            'C2' => '订单日期',
            'D2' => '收资料日',
            'E2' => '寄珠海日期',
            'F2' => '入馆日',
            'G2' => '国家',
            'H2' => '类型',
            'I2' => "接待\n销售",
            'J2' => '办理人',
            'K2' => '套餐类型',
            'L2' => '单项实收',
            'M2' => '数量',
            'N2' => '补差',
            'O2' => '照片',
            'P2' => '快递',
            'Q2' => '合计',
            'R2' => '手续费',
            'S2' => '实收',
            'T2' => '单项实付',
            'U2' => '数量',
            'V2' => '补差',
            'W2' => '照片',
            'X2' => '快递',
            'Y2' => '实付合计',
            'Z2' => '利润',
            'AA2' => '收件人',
            'AB2' => '收件电话',
            'AC2' => '收件地址',
            'AD2' => "出签\n日期",
            'AE2' => "发货\n日期",
            'AF2' => '寄回客人单号',
            'AG2' => "支出结\n算日",
            'AH2' => "收款结\n算日",
            'AI2' => '备注'
        ];

        foreach ($fieldAttribute as $column_x => $field) {
            $objPHPExcel->getActiveSheet()->setCellValue($column_x,  $field);
        }


        $headOne = ['A1:K1', 'L1:Q1', 'R1:Y1', 'AA1:AF1', 'AG1:AH1'];
        foreach ($headOne as $head) {
            $objPHPExcel->getActiveSheet()->mergeCells($head);
        }


        //填充内容
        $columnFieldMap = [
            'A' => 'customer_id',
            'B' => '',
            'C' => 'order_date',
            'D' => 'collect_date',
            'E' => 'deliver_date',
            'F' => 'entry_date',
            'G' => ['snapshot','combo_product'],
            'H' => '',
            'I' => ['servicer','name'],
            'J' => '',
            'K' => '',
            'L' => 'single_sum',
            'M' => 'total_person',
            'N' => 'balance_sum',
            'O' => 'flushphoto_sum',
            'P' => 'carrier_sum',
            'Q' => '',
            'R' => '',
            'S' => '',
            'T' => '',
            'U' => '',
            'V' => '',
            'W' => '',
            'X' => '',
            'Y' => '',
            'Z' => '',
            'AA' => 'back_addressee',
            'AB' => 'back_telphone',
            'AC' => 'back_address',
            'AD' => 'putsign_date',
            'AE' => 'delivergood_date',
            'AF' => '',
            'AG' => '',
            'AH' => 'receipt_date',
            'AI' => 'remark'
        ];

        
        $start = 3;
        $data =  OrderQuery::find()->limit(10)->all();
        foreach ($data as $object) {
             foreach ($columnFieldMap as $_column => $_field) {
                 //设置行高
                 $objPHPExcel->getActiveSheet()->getRowDimension($start)->setRowHeight(24);

                 //设置边框
                 $objPHPExcel->getActiveSheet()->getStyle("A{$start}:AI{$start}")->applyFromArray($borderStyle);

                 //设置居中
                 $sheet->getStyle($_column . $start)->getAlignment()->setHorizontal(\PHPExcel_Style_Alignment::HORIZONTAL_CENTER);
                 $sheet->getStyle($_column . $start)->getAlignment()->setVertical(\PHPExcel_Style_Alignment::VERTICAL_CENTER);

                 //设置宽度
                 $width = $objPHPExcel->getActiveSheet()->getColumnDimension($_column)->getWidth();
                 $objPHPExcel->getActiveSheet()->getColumnDimension($_column)->setWidth($width * 1.1);


                 $objRichText = false;
                 //填充数据
                 if (!empty($_field) && !is_array($_field)) {

                    if (strpos($_field, 'date') !== false ) {

                         if ($object->$_field !== '1970-011-01') {
                             $object->$_field = date('n月j日', strtotime($object->$_field));
                         } else {
                             $object->$_field = "未设置";
                         }

                         $objPHPExcel->getActiveSheet()
                            ->getStyleByColumnAndRow($_column, $start)
                            ->getNumberFormat()->setFormatCode('m/d');
                     }

                     //添加文字并设置这段文字粗体斜体和文字颜色
                     if ($object->$_field) {
                         $objRichText = $this->setColor($object->$_field);
                     }
                  } elseif ($_column == 'B') {
                     $order = $object->order_num;
                     $order = str_replace([',','，'],"  ", $order);
                     $objRichText = $this->setColor($order);
                     $objPHPExcel->getActiveSheet()->getStyle($_column . $start)->getAlignment()->setWrapText(true);

                 } elseif ($_column == 'G') {
                     $product = $object->snapshot->combo_product;
                     $product = $product ? $product : '已删除';
                     $objRichText = $this->setColor($product);

                  } elseif ($_column == 'H') {
                     $type = Type::getComboType();
                     $objRichText = $this->setColor($type[$object->order_type]);

                  } elseif ($_column == 'I') {
                     $servicer = $object->servicer->name;
                     $servicer = $servicer ? $servicer : '已删除';
                     $objRichText = $this->setColor($servicer);

                 } elseif ($_column == 'J') {
                     $transators = $object->relatedTransactor;
                     $str = "";
                     foreach ($transators as $transator) {
                         $str .= $transator['name'] . " ";
                     }
                     $str = $str ? $str : '已删除';
                     $objRichText = $this->setColor($str);

                 } elseif ($_column == 'K') {
                     $classify = Type::getComboClassify();
                     $classify = isset($classify[$object->order_classify]) ? $classify[$object->order_classify] : '未设置';
                     $objRichText = $this->setColor($classify);
                 }

                 if ($objRichText) {
                     $objPHPExcel->getActiveSheet()->getCell( $_column . $start)->setValue($objRichText);
                 }

             }
             $start++;
        }



        //设置文件名称
        $file_name = "阳光假日天猫报表" . date('Ymd_His');

        header("Pragma: public");
        header("Expires: 0");
        header("Cache-Control:must-revalidate, post-check=0, pre-check=0");
        header("Content-Type:application/force-download");
        header("Content-Type:application/vnd.ms-execl");
        header("Content-Type:application/octet-stream");
        header("Content-Type:application/download");;
        header('Content-Disposition:attachment;filename='.$file_name.'.xls');
        header("Content-Transfer-Encoding:binary");
        $objWriter->save('php://output');

    }
    
    
    private function setColor($string)
    {
        $objRichText = new \PHPExcel_RichText();
        $objPayable = $objRichText->createTextRun( $string);
        $objPayable->getFont()->setBold(false)->setName('宋体')->setSize(9)->setColor( new \PHPExcel_Style_Color( \PHPExcel_Style_Color::COLOR_RED));
        $objRichText->createText(' ');
        return $objRichText;
    }
    
    public function actionIndex2()
    {
       $cellStyle = [
           'font' => [
               'bold' => false,
               'color' => ['rgb' => 'FF0000'],
               'size' => 9,
               'name' => '宋体'
           ],
           'alignment' => [
               'horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
           ],
           'borders' => [
               'top' => [
                   'style' => \PHPExcel_Style_Border::BORDER_THIN,
               ],
           ],
       ];

        /*设置单元格颜色*/
       $file = \Yii::createObject([
            'class' => 'codemix\excelexport\ExcelFile',
            'sheets' => [
                'Users' => [
                    'class' => 'codemix\excelexport\ActiveExcelSheet',
                    'query' => ProductQuery::find()->limit(10),
                    'callbacks' => [
                        // $cell is a PHPExcel_Cell object
                        'A' => function ($cell, $row, $column) use ($cellStyle) {
                            $cell->getStyle()->applyFromArray($cellStyle);
                        },
                        'B' => function ($cell, $row, $column)  use ($cellStyle)  {
                            $cell->getStyle()->applyFromArray($cellStyle);
                        },
                        'C' => function ($cell, $row, $column)  use ($cellStyle)  {
                            $cell->getStyle()->applyFromArray($cellStyle);
                        },
                        'D' => function ($cell, $row, $column)  use ($cellStyle)  {
                            $cell->getStyle()->applyFromArray($cellStyle);
                        },
                        'E' => function ($cell, $row, $column)  use ($cellStyle)  {
                            $cell->getStyle()->applyFromArray($cellStyle);
                        },
                    ],
                ],
            ],
        ]);

        $headColumn = ['A1:K1', 'L1:Q1', 'R1:Y1', 'AA1:AF1', 'AG1:AH1'];
        foreach ($headColumn as $head) {
           // $file->getWorkbook()->getSheet(0)->mergeCells($head);
        }

       //设置表头颜色
        $headStyle = array(

            'font' => array(
                'bold' => true,
            ),
            'alignment' => array(
                'horizontal' => \PHPExcel_Style_Alignment::HORIZONTAL_CENTER,
            ),
            'borders' => array(
                    'top' => array(
                        'style' => \PHPExcel_Style_Border::BORDER_THIN,
                    ),
                    'left' => array(
                        'style' => \PHPExcel_Style_Border::BORDER_THIN,
                    ),
                    'right' => array(
                        'style' => \PHPExcel_Style_Border::BORDER_THIN,
                    ),
                    'bottom' => array(
                        'style' => \PHPExcel_Style_Border::BORDER_THIN,
                    ),
            ),
            'fill' => array(
                'type' => \PHPExcel_Style_Fill::FILL_SOLID,
                'startcolor' => array(
                    'argb' => '92d050',
                ),
            ),
        );



        $file->getWorkbook()->getSheet(0)->getStyle("A1")->applyFromArray($headStyle);
        $file->getWorkbook()->getSheet(0)->getStyle("B1")->applyFromArray($headStyle);

       // $file->getWorkbook()->getSheet(0)->getStyle("L1")->applyFromArray($headStyle);


        $file->send(date('YMDHIs').'.xlsx');
        return $this->render('index');
    }

}
