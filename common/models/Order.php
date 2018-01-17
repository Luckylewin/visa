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
 * @property string $cid
 * @property integer $combo_id
 * @property integer $custom_servicer_id
 * @property string $transactor_name
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
            [['order_num', 'order_date', 'customer_id', 'combo_id', 'custom_servicer_id', 'transactor_name', 'collect_date', 'deliver_date', 'entry_date', 'putsign_date', 'back_address', 'back_addressee', 'back_telphone', 'delivergood_date', 'deliver_order', 'receipt_date', 'pay_date', 'cid', 'total_person', 'single_sum', 'delivercompany'], 'required'],
            [['pid', 'combo_id', 'custom_servicer_id',  'total_person'], 'integer'],
            [['order_date', 'collect_date', 'deliver_date', 'entry_date', 'putsign_date', 'delivergood_date', 'receipt_date', 'pay_date','cid', 'transactor_id', 'operator_id'], 'safe'],
            [['single_sum', 'balance_sum', 'flushphoto_sum', 'carrier_sum'], 'number'],
            [['back_address', 'remark','cid'], 'string','max' => 300],
            [['delivercompany'], 'string', 'max' => 50],
            [['order_classify', 'order_type', 'audit_status'], 'string', 'max' => 1],
            [['transactor_name', 'back_addressee'], 'string', 'max' => 50],
            [['balance_order', 'flushphoto_order', 'carrier_order', 'deliver_order'], 'string', 'max' => 64],
            [['back_telphone'], 'string', 'max' => 36],
            [['balance_sum','flushphoto_sum','carrier_sum'], 'default', 'value' => '0.000'],
            [['order_date','collect_date','deliver_date','entry_date','putsign_date','delivergood_date','pay_date','receipt_date'],'default','value' => date('Y-m-d')],
            [['single_sum'],'default','value' => '0.000'],
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
            'customer_id' => '客人ID',
            'combo_id' => '套餐名称',
            'custom_servicer_id' => '接待客服',
            'custom_servicer' => '接待客服',
            'transactor_name' => '办理人',
            'single_sum' => '单项实收金额',
            'total_person' => '人数',
            'balance_order' => '补差订单号',
            'balance_sum' => '补差订单金额',
            'flushphoto_order' => '代冲洗照片订单号',
            'flushphoto_sum' => '代冲洗照片订单金额',
            'carrier_order' => '快递费补差订单号',
            'carrier_sum' => '快递费补差订单金额',
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
            'receipt_date' => '收款日期',
            'pay_date' => '支付日期',
            'cid' => '国家',
            'audit_status' => '审核状态',//1审核中2审核未通过3审核通过
            'created_at' => '创建时间',
            'updated_at' => '修改时间'
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
           if ($this->isNewRecord) {
               $this->operator_id = Yii::$app->getUser()->id;
           }
           $this->transactor_name = trim($this->transactor_name, '|');
           return true;
       }
       return false;
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

    //操作员
    public function getOperator()
    {
        return $this->hasOne(Admin::className(), ['id' => 'operator_id']);
    }
}
