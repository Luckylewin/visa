<?php

namespace common\models;

use backend\models\Admin;
use Yii;
use yii\behaviors\TimestampBehavior;
use yii\db\ActiveRecord;

/**
 * This is the model class for table "yii2_order".
 *
 * @property string $id
 * @property string $pid
 * @property string $order_num;
 * @property string $order_classify
 * @property string $order_type
 * @property string $order_date
 * @property integer $customer_id
 * @property integer $combo_id
 * @property integer $custom_servicer_id
 * @property string $single_sum
 * @property integer $total_person
 * @property string $balance_order
 * @property string $balance_sum
 * @property string $flushphoto_order
 * @property string $flushphoto_sum
 * @property string $carrier_order
 * @property string $carrier_sum
 * @property string $collect_date
 * @property string $deliver_date
 * @property string $entry_date
 * @property string $putsign_date
 * @property string $operator_id
 * @property string $back_address
 * @property string $back_addressee
 * @property string $back_telphone
 * @property string $delivergood_date
 * @property string $deliver_order
 * @property integer $delivercompany
 * @property string $remark
 * @property string $receipt_date
 * @property string $company_receipt_date
 * @property string $pay_date
 * @property string $audit_status
 */
class Order extends \yii\db\ActiveRecord
{

    public $transactor_id;
    public $custom_servicer;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_order';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['order_num', 'order_classify', 'customer_id', 'combo_id', 'custom_servicer_id', 'transactor_id','pid', 'total_person', 'single_sum'], 'required'],
            [['pid', 'combo_id', 'custom_servicer_id',  'total_person'], 'integer'],
            [['order_date', 'collect_date', 'deliver_date', 'entry_date', 'putsign_date', 'delivergood_date', 'receipt_date', 'pay_date','cid', 'transactor_id', 'operator_id', 'company_receipt_date'], 'safe'],
            [['single_sum', 'balance_sum', 'flushphoto_sum', 'carrier_sum','output_balance_sum', 'output_flushphoto_sum', 'output_carrier_sum'], 'number'],
            [['back_address', 'remark'], 'string','max' => 300],
            [['delivercompany'], 'string', 'max' => 50],
            [['order_classify', 'order_type', 'audit_status'], 'string', 'max' => 1],
            [['back_addressee'], 'string', 'max' => 50],
            [['balance_order', 'flushphoto_order', 'carrier_order', 'deliver_order'], 'string', 'max' => 64],
            [['back_telphone'], 'string', 'max' => 36],
            [['balance_sum','flushphoto_sum','carrier_sum','output_balance_sum','output_flushphoto_sum','output_carrier_sum'], 'default', 'value' => '0.00'],
            [['order_date','collect_date','deliver_date','entry_date','putsign_date','delivergood_date','pay_date','receipt_date'],'default','value' => ''],
            [['single_sum'],'default','value' => '0.00'],
            [['total_person'],'default','value' => '1'],

        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pid' => '产品id',
            'order_num' => '订单号',
            'order_classify' => '订单分类',//1网店2直客3同业
            'order_type' => '分类',//1正常2加急3特急
            'order_date' => '订单日期',
            'customer_id' => '客户ID(淘宝ID等)',
            'combo_id' => '套餐名称',
            'custom_servicer_id' => '接待客服',
            'custom_servicer' => '接待客服',
            'single_sum' => '单项实收金额',
            'total_person' => '人数',
            'balance_order' => '补差订单号',
            'balance_sum' => '补差收入金额',
            'output_balance_sum' => '补差支出金额',
            'flushphoto_order' => '代冲洗照片订单号',
            'flushphoto_sum' => '代洗照片收入金额',
            'output_flushphoto_sum' => '代冲洗照片支出金额',
            'carrier_order' => '快递费补差订单号',
            'carrier_sum' => '快递补差收入金额',
            'output_carrier_sum' => '快递费补差支出金额',
            'collect_date' => '收资料日',
            'deliver_date' => '送证日',
            'entry_date' => '入馆日',
            'putsign_date' => '出签日',
            'operator_id' => '操作员',
            'back_address' => '回寄地址',
            'back_addressee' => '收件人',
            'back_telphone' => '收件人电话',
            'delivergood_date' => '发货日期',
            'deliver_order' => '快递单号',
            'delivercompany_id' => '快递公司ID',
            'delivercompany' => '快递公司',
            'remark' => '备注',
            'receipt_date' => '店铺收款日期',
            'company_receipt_date' => '公司收款日期',
            'pay_date' => '支付日期',
            'cid' => '国家',
            'audit_status' => '审核状态',//1审核中2审核未通过3审核通过
            'created_at' => '创建时间',
            'updated_at' => '修改时间',
            'transactor_id' => '办理人'
        ];
    }

    //行为
    public function behaviors()
    {
       //自动更新时间
       return [
           [
               'class' => TimestampBehavior::className(),
               'createdAtAttribute' => 'created_at',
               'updatedAtAttribute' => 'updated_at',
               'attributes' => [
                   ActiveRecord::EVENT_BEFORE_INSERT => ['created_at', 'updated_at'],
                   ActiveRecord::EVENT_BEFORE_UPDATE => ['updated_at']
               ],
               'value' => time()
           ]
       ];
    }



    public function beforeSave($insert)
    {
       if (parent::beforeSave($insert)) {
           unset($this->transactor_id);

           //记录操作用户
           $this->operator_id = Yii::$app->getUser()->id;


           if ($this->isNewRecord) {
               //记录快照
               $snapShot = Snapshot::findOne(['snap_combo_id' => (int)($this->combo_id), 'is_valid' => '1']);
               if (!is_null($snapShot)) {
                   $this->combo_id = $snapShot->id;
               }
           }else {
               $snapShot = Snapshot::findOne(['id' => (int)($this->combo_id), 'is_valid' => '1']);
               if (!$snapShot) {
                   $snapShot = Snapshot::findOne(['snap_combo_id' => (int)($this->combo_id), 'is_valid' => '1']);
                   if (!is_null($snapShot)) {
                       $this->combo_id = $snapShot->id;
                   }
               }
           }

           //判断日期 决定审核状态
           if ($this->audit_status != 5) {
               if ($this->collect_date != '0000-00-00') {
                   $this->audit_status = 1;
               }

               if ($this->deliver_date != '0000-00-00') {
                   $this->audit_status = 2;
               }

               if ($this->entry_date != '0000-00-00') {
                   $this->audit_status = 3;
               }

               if ($this->putsign_date != '0000-00-00') {
                   $this->audit_status = 4;
               }
           }
           
           return true;
       }
       return false;
    }

    public function beforeDelete()
    {
        if (parent::beforeDelete()) {
            Transator::deleteAll(['order_id' => $this->id]);
            return true;
        }
    }

    //国家
    public function getCountry()
    {
        return $this->hasOne(Country::className(), ['id' => 'cid']);
    }

    //套餐
    public function getCombo()
    {
        return $this->hasOne(Combo::className(), ['combo_id' =>'combo_id']);
    }

    //快照
    public function getSnapshot()
    {
        return $this->hasOne(Snapshot::className(), ['id' => 'combo_id']);
    }

    //客服
    public function getServicer()
    {
        return $this->hasOne(Servicer::className(), ['id' => 'custom_servicer_id']);
    }

    //办理人
    public function getTransactor()
    {
        return $this->hasMany(Transator::className(), ['order_id' => 'id']);
    }

    //办理人 多对多关系
    public function getRelatedTransactor()
    {
        $sql = "SELECT * FROM yii2_order_to_transactor AS a LEFT JOIN yii2_transator AS b ON  a.t_id = b.tid WHERE a.o_id = " . $this->id;
        return $data = Yii::$app->db->createCommand($sql)->queryAll();
    }

    //前端选择框
    public function getTransactorJson()
    {
        $transactor = $this->getRelatedTransactor();
        $str = '';
        if (!empty($transactor)) {
            foreach ($transactor as $t) {
                $str .= '{id:'. $t['tid'] . ",text:'". $t['name'] . "'},";
            }
            return trim($str, ',');
        }
        return "";
    }

    //操作员
    public function getOperator()
    {
        return $this->hasOne(Admin::className(), ['id' => 'operator_id']);
    }
}
