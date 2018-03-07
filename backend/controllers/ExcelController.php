<?php

namespace backend\controllers;

use Codeception\Lib\Generator\Helper;
use Yii;
use app\models\OrderToTransactor;
use backend\models\Admin;
use common\models\ExportSetting;
use common\models\Order;
use common\models\Servicer;
use common\models\Snapshot;
use common\models\Transator;
use common\models\OrderQuery;
use common\models\Type;
use common\models\UploadForm;
use yii\web\UploadedFile;

class ExcelController extends BaseController
{
    public function actionIndex()
    {
        set_time_limit(0);
        $queryParams = Yii::$app->request->get('orderQuery');
        $selected_id = Yii::$app->request->get('selected_id');

        if ($selected_id) {
            //直接选中的导出
            $data = OrderQuery::find()->where("id in ($selected_id)")->all();

        } elseif ($queryParams) {
            //查询时的导出
            $queryParams = json_decode(base64_decode($queryParams), true);
            $searchModel = new OrderQuery();
            $data = $searchModel->search($queryParams, $all = true)->getModels();

        } else {
            //非查询时的导出
            $data = OrderQuery::find()->all();
        }

        if (empty($data)) {
           Yii::$app->session->setFlash('error', '没有可以导出的数据');
           return $this->redirect(Yii::$app->request->referrer);
        }

        $file_name = "订单" . date('Y_m_d');
        if (isset($queryParams['OrderQuery']['order_classify']) && !empty($queryParams['OrderQuery']['order_classify'])) {
            $classify = Type::getComboClassify();
            $file_name = isset($classify[$queryParams['OrderQuery']['order_classify']]) ? $classify[$queryParams['OrderQuery']['order_classify']]  : '';
            $file_name .= "订单" . date('Y_m_d');
        }

        return $this->_exportExcel($data, $file_name);

    }


    public function actionImport()
    {
        set_time_limit(0);
        $model = new UploadForm();

        if (Yii::$app->request->isPost) {
            $uploadFile = UploadedFile::getInstance($model,'file');
            $this->_importExcel($uploadFile->tempName);
        }

        return $this->render('import', [
            'model' => $model
        ]);
    }

    private function _importExcel($excelFilename)
    {
        $reader = \PHPExcel_IOFactory::createReader('Excel2007'); // 读取 excel 文档
        $PHPExcel = $reader->load($excelFilename); // 文档名称
        $sheet = $PHPExcel->getSheet(0); // 读取第一个工作表(编号从 0 开始)
        $highestRow = $sheet->getHighestRow(); // 取得总行数

        $indexToColumn =  [
            1=>'A',2=>'B',3=>'C',4=>'D',5=>'E',6=>'F',7=>'G',8=>'H',9=>'I',10=>'J',
            11=>'K',12=>'L',13=>'M', 14=>'N',15=>'O',16=>'P',17=>'Q',18=>'R',19=>'S',20=>'T',
            21=>'U',22=>'V',23=>'W',24=>'X',25=>'Y',26=>'Z',27=>'AA',28=>'AB',29=>'AC',30=>'AD',
            31=>'AE',32=>'AF',33=>'AG',34=>'AH',35=>'AI',36=>'AJ',37=>'AK',38=>'AL',39=>'AM',40=>'AN',
            41 => 'AO', '42'=>'AP',43=>'AQ'
        ];

        $columnToField = [
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
            'R' => 'carrier_sum',//快递
            'S' => '',//合计
            'T' => 'combo_charge',//手续费
            'U' => '',//实收
            'V' => 'combo_cost',//单项实付合计
            'W' => 'output_total_person',//数量
            'X' => 'output_balance_sum',//补差
            'Y' => 'output_flushphoto_sum',//照片
            'Z' => 'output_carrier_sum',//快递
            'AA' => '',//实付合计
            'AB' => '',//利润
            'AC' => 'back_addressee',
            'AD' => 'back_telphone',
            'AE' => 'back_address',
            'AF' => 'putsign_date',
            'AG' => 'delivergood_date',
            'AH' => 'delivercompany',
            'AI' => 'deliver_order',//寄回客人单号

            'AJ' => 'pay_date', //店铺收款日
            'AK' => 'receipt_date',
            'AL' => 'company_receipt_date',
            'AM' => 'pay_account',

            'AN' => 'remark',

            'AO' => 'balance_order',
            'AP' => 'flushphoto_order',
            'AQ' => 'carrier_order',

        ];

        $importTotal = 0;
        $updateTotal = 0;
        $errorMsg = [];

        foreach ($sheet->getRowIterator() as $row) {  //逐行处理

            //创建order对象
            $order = new Order();
            $snapshot = new Snapshot();
            $servicer = new Servicer();
            $existTransactor = [];
            $notExistTransactorName = [];

            $currentRow = $row->getRowIndex();

            if ($currentRow > 1 && $currentRow != $highestRow) {  //确定从哪一行开始读取

                $column = 1;

                foreach ($row->getCellIterator() as $cell) { //逐列读取

                    if (!isset($indexToColumn[$column])) {
                        continue;
                    }

                    if ($currentRow == 2) {
                        //检查excel的格式
                        $th = array_values($this->setThName());
                        $data = $cell->getValue(); //获取cell中数据
                        if ($th[$column-1] != $data) {
                            return \Yii::$app->session->setFlash('error', ":(  Excel表格式错误,请检查");
                        }
                        $column++;
                        continue;

                    }

                    $field = $columnToField[$indexToColumn[$column]];

                    if ($field) {
                        //获取cell中数据
                        $data = $cell->getValue();

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
                                //查找系统 有没有此客服
                                $servicerData = Servicer::findOne(['name' => trim($data)]);
                                if (!is_null($servicerData)) {
                                    $servicer->name = trim($data);
                                    $order->custom_servicer_id = $servicerData->id;
                                }
                                break;

                            case 'operator_id':
                                //查找操作用户
                                $uid = Admin::findOne(['username' => trim($data)]);
                                if ($uid) {
                                    $order->$field = $uid->id;
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

                                array_walk($transactors, function(&$v,$k){
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
                                } else {
                                    $order->$field = $data;
                                }
                                break;
                        }
                    }
                    $column++;
                }

                if ($currentRow == 2) {
                    continue;
                }

                //对象已经收集数据完毕
                //判断订单是否不存在 办理人是否存在
                $isExistOrder = Order::findOne(['order_num' => $order->order_num]);

                if (!is_null($isExistOrder) ) {
                    //echo $isExistOrder->id,'-',$currentRow,'<br/>';
                    $order = $this->_updateByExcel($isExistOrder,$order);

                    if ($order === true) {
                        $updateTotal++;
                    } elseif (!is_null($order)) {
                        $error = array_values($order->getFirstErrors());
                        $errorMsg[$row->getRowIndex()] = ['row'=>$row->getRowIndex(),'msg' => $error[0]];
                    }
                    continue;
                }

                /*
                   if ($importTotal >= 1) {
                        continue;
                   }
                */
                // echo "<hr/>";
                // var_dump($existTransactor);
                // var_dump($notExistTransactorName);
                // echo "<hr/>";

                // print_r($snapshot);
                // echo "<hr/>";
                // print_r($servicer); ok 保存之前检查name
                // echo "<hr/>";

                $transaction = Yii::$app->db->beginTransaction();
                try {
                    //新增快照
                    $snapshotResult = $snapshot->save();

                    //新增订单
                    $order->transactor_id = "0";
                    $order->combo_id = $snapshot->id;
                    $order->back_addressee = empty($order->back_addressee)? "-" : $order->back_addressee;

                    $order->output_balance_sum = empty($order->output_balance_sum) ? '0.00' : $order->output_balance_sum;
                    $orderResult = $order->save();

                    //处理不存在的办理人
                    if (!empty($notExistTransactorName)) {
                        foreach ($notExistTransactorName as $newTrName) {
                            $newTransactor = new Transator();
                            $newTransactor->name = $newTrName;
                            $transactorResult = $newTransactor->save(false);
                            $existTransactor[] = $isExistOrder[] = $newTransactor->tid;
                        }
                    }

                    //处理所有办理人的 订单-办理人关系
                    foreach ($existTransactor as $existTrId) {
                        $orderToTran = (new OrderToTransactor());
                        $orderToTran->t_id = $existTrId;
                        $orderToTran->o_id = $order->id;
                        $orderToTran->save();
                    }

                    if (!$orderResult || !$snapshotResult || (isset($transactorResult) && !$transactorResult)) {

                        $snapshotError = array_values($snapshot->getFirstErrors());
                        $orderError = array_values($order->getFirstErrors());

                        if (!empty($snapshotError)) {

                            $errorMsg[$row->getRowIndex()] = ['row'=>$row->getRowIndex(),'msg'=>$snapshotError[0]];
                        } else if (!empty($orderError)) {

                            $errorMsg[$row->getRowIndex()] = ['row'=>$row->getRowIndex(),'msg'=>$orderError[0]];
                        } else if (isset($newTransactor)) {
                            $newTransactorError = $newTransactor->getFirstErrors();
                            if (!empty($newTransactorError)) {
                                $errorMsg[$row->getRowIndex()] = ['row'=>$row->getRowIndex(),'msg' => $newTransactorError[0]];
                            }
                        }
                        throw new \Exception('导入保存发生错误');
                    }

                    $transaction->commit();
                    $importTotal++;
                } catch (\Exception $e) {
                    $transaction->rollBack();
                }
            }
        }

        if ($importTotal > 0) {
            \Yii::$app->session->setFlash('success', "本次成功导入{$importTotal}条订单数据");
        } else if($updateTotal > 0 ){
            \Yii::$app->session->setFlash('success', "本次导入更新了{$updateTotal}条订单数据");
        } else {
            \Yii::$app->session->setFlash('warning', "没有符合条件的订单");
        }

        if (!empty($errorMsg)) {
            \Yii::$app->session->setFlash('error', json_encode($errorMsg));
        }

        return true;
    }

    private function _updateByExcel(Order $order, $excelOrder)
    {
        //对比数据进行更新
        $checkFields = [
            'delivercompany', 'deliver_order',
            'balance_order', 'flushphoto_order', 'carrier_order',
            'balance_order', 'balance_sum', 'output_balance_sum',
            'flushphoto_order', 'flushphoto_sum', 'output_flushphoto_sum',
            'carrier_order', 'carrier_sum', 'output_carrier_sum',
            'collect_date','deliver_date','entry_date','putsign_date', 'delivergood_date', 'receipt_date', 'company_receipt_date', 'pay_date',
            'back_address','back_addressee','back_telphone','deliver_order','delivercompany','remark','pay_account'
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

    private function getHeaderStyle()
    {
        return  $headStyle = array(
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
    }

    /**
     * 合并表头
     * @return array
     */
    public function setMergeName()
    {
        return [
            'A1' => '订单详情',
            'N1' => '收入',
            'V1' => '支出',
            'AC1' => '发货',
            'AK1' => '结算',
            'AO1' => '其他'
        ];
    }

    //设置表头
    public function setThName()
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
            'AC2' => '收件人',
            'AD2' => '收件电话',
            'AE2' => '收件地址',
            'AF2' => "出签\n日期",
            'AG2' => "发货\n日期",
            'AH2' => "快递公司",
            'AI2' => "寄回客人\n单号",

            'AJ2' => '支付日期',
            'AK2' => "店铺收款日",
            'AL2' => "公司收款日",
            'AM2' => "收款帐户",
            'AN2' => '备注',
            'AO2' => '补差订单',
            'AP2' => '代冲洗照片订单',
            'AQ2' => '快递费补差订单',
        ];

        return $fieldAttribute;
    }

    /**
     * 导出全部
     * @param $data
     * @param $file_name
     */
    private function _exportExcel($data, $file_name)
    {
        $cacheObject = Yii::$app->cache;
        $uid = Yii::$app->user->getId();
        $cacheObject->set($uid, 0, 3600);

        //权限判断
        $showFlag = ExportSetting::getShowSetting();

        \PHPExcel_CachedObjectStorageFactory::cache_in_memory_serialized;
        \PHPExcel_CachedObjectStorageFactory::cache_in_memory_gzip;
        $cacheMethod = \PHPExcel_CachedObjectStorageFactory::cache_to_discISAM;
        $cacheSettings = array('memoryCacheSize'=>'512MB');
        \PHPExcel_Settings::setCacheStorageMethod($cacheMethod, $cacheSettings);

        //初始化实例
        $objPHPExcel = new \PHPExcel();
        $objWriter = new \PHPExcel_Writer_Excel2007($objPHPExcel);

        //设置表头
        $headStyle = $this->getHeaderStyle();

        $sheet = $objPHPExcel->getActiveSheet();

        $columns = [
            ['A1','B1','C1','D1','E1','F1','G1','H1','I1','J1','K1','L1','M1','N1','O1','P1','Q1','R1','S1','T1','U1','V1','W1','X1','Y1','Z1','AA1','AB1','AC1','AD1','AE1','AF1','AG1','AH1','AI1','AJ1','AK1','AL1','AM1','AN1','AO1','AP1',"AQ1"],
            ['A2','B2','C2','D2','E2','F2','G2','H2','I2','J2','K2','L2','M2','N2','O2','P2','Q2','R2','S2','T2','U2','V2','W2','X2','Y2','Z2','AA2','AB2','AC2','AD2','AE2','AF2','AG2','AH2','AI2','AJ2','AK2','AL2','AM2','AN2','AO2','AP2',"AQ2"]
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
        $sheet->getColumnDimension('M')->setWidth(10);
        $sheet->getColumnDimension('AB')->setWidth(15);
        $sheet->getColumnDimension('AC')->setWidth(15);
        $sheet->getColumnDimension('AD')->setWidth(15);
        $sheet->getColumnDimension('AE')->setWidth(45);
        $sheet->getColumnDimension('AF')->setWidth(16);
        $sheet->getColumnDimension('AG')->setWidth(16);
        $sheet->getColumnDimension('AH')->setWidth(16);
        $sheet->getColumnDimension('AI')->setWidth(16);
        $sheet->getColumnDimension('AJ')->setWidth(20);
        $sheet->getColumnDimension('AK')->setWidth(16);
        $sheet->getColumnDimension('AL')->setWidth(16);

        $sheet->getColumnDimension('AM')->setWidth(20);
        $sheet->getColumnDimension('AN')->setWidth(25);
        $sheet->getColumnDimension('AO')->setWidth(25);
        $sheet->getColumnDimension('AP')->setWidth(25);
        $sheet->getColumnDimension('AQ')->setWidth(25);


        //设置边框
        $borderStyle = array(
            'borders' => array(
                'allborders' => array(
                    'style' => \PHPExcel_Style_Border::BORDER_THIN,//细边框
                    'color' => array('argb' => '00000000'),
                ),
            ),
        );

        $fieldAttribute = $this->setMergeName() + $this->setThName();

        foreach ($fieldAttribute as $column_x => $field) {
            $sheet->setCellValue($column_x,  $field);
        }

        $headOne = ['A1:M1', 'N1:U1', 'V1:AB1', 'AC1:AI1', 'AJ1:AM1','AO1:AQ1'];
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

            'AC' => 'back_addressee',
            'AD' => 'back_telphone',
            'AE' => 'back_address',
            'AF' => 'putsign_date',
            'AG' => 'deliver_date',
            'AH' => 'delivercompany',
            'AI' => 'deliver_order',//寄回客人单号

            'AJ' => 'pay_date', //店铺收款日
            'AK' => 'receipt_date',
            'AL' => 'company_receipt_date',
            'AM' => 'pay_account',

            'AN' => 'remark',

            'AO' => 'balance_order',
            'AP' => 'flushphoto_order',
            'AQ' => 'carrier_order',
        ];

        $startColumn = 'A';
        $endColumn = "AQ";
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
                $sheet->getStyle("{$startColumn}{$row}:{$endColumn}{$row}")->applyFromArray($borderStyle);

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
                        $product = $object->snapshot->combo_product;
                        $cellValue = $product ? $product : '已删除';
                        break;

                    case 'combo_type':
                        $type = Type::getComboType();
                        $cellValue = isset($type[$object->order_type]) ? $type[$object->order_type] : '已删除';
                        break;

                    case 'service_name':
                        $servicer = $object->servicer->name;
                        $cellValue = $servicer ? $servicer : '已删除';
                        break;

                    case 'operator':
                        $operator = $object->operator->username;
                        $cellValue = $operator ? $operator : '已删除';
                        break;

                    case 'combo_cost':
                        if ($showFlag) {
                            $cost = $object->snapshot->combo_cost;
                            $cellValue = $cost ? $cost : '数据丢失';
                        }
                        break;

                    case 'combo_classify':
                        $classify = Type::getComboClassify();
                        $cellValue = $classify[$object->snapshot->combo_classify];
                        break;

                    case 'combo_name':
                        $combo = $object->snapshot->combo_name;
                        $cellValue = $combo ? $combo : "丢失数据";
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

                            $cost = $object->output_total_person * $cost +
                                $object->output_flushphoto_sum +
                                $object->output_carrier_sum +
                                $object->output_balance_sum;

                            $cellValue = $income - $cost;
                        }
                        break;

                    case 'deliver_order':
                        if ($object->deliver_order) {
                            $cellValue = "'" . $object->deliver_order;
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
                            $commentAuthor = $object->operator->username;
                            $commentAuthor = !empty($commentAuthor) ? $commentAuthor : "PHPExcel";
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
        $sheet->getStyle("{$startColumn}{$row}:{$endColumn}{$row}")->applyFromArray($borderStyle);
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
            $sheet->setCellValue($col . $row, $this->getSumString($col,3,$row-1));
        }

        //设置文件名称
        $file_name = !empty($file_name)? $file_name : "阳光假日报表" . date('Ymd_His');

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

        $objWriter->save('php://output');

    }

    /**
     * 统计表头字符串
     * @param $col
     * @param $start
     * @param $end
     * @return string
     */
    private function getSumString($col,$start,$end)
    {
        $str = $col . $start . ':' . $col . $end;
        $str = trim($str, ':');
        $str = "=SUM(" . $str . ")";
        return $str;
    }


    public function actionPercent()
    {
        $data = Yii::$app->cache->get(Yii::$app->user->getId());

        $response = Yii::$app->response;
        $response->format = $response::FORMAT_JSON;
        $response->data = ['status' => 0, 'data'=> $data];
        $response->send();
    }



}
