<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "yii2_snapshot".
 *
 * @property integer $id
 * @property string $combo_name
 * @property string $combo_cost
 * @property string $combo_classify
 * @property string $combo_type
 * @property string $combo_product
 * @property integer $snap_combo_id
 * @property integer $combo_charge
 * @property string $is_valid
 * @property integer $quote
 */
class Snapshot extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_snapshot';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['combo_name', 'combo_cost', 'combo_classify', 'combo_type', 'snap_combo_id','combo_product','combo_charge'], 'required'],
            [['snap_combo_id', 'is_valid'], 'integer'],
            [['quote'], 'safe'],
            [['combo_cost'], 'number'],
            [['combo_name'], 'string', 'max' => 255],
            [['combo_classify', 'combo_type'], 'string', 'max' => 1],
            [['combo_cost'], 'default', 'value' => 0.00],
            [['quote'], 'default', 'value' => 1]
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'combo_name' => '套餐名称',
            'combo_cost' => '支出成本',
            'combo_charge' => '手续费',
            'combo_classify' => '订单分类',
            'combo_product' => '产品名称',
            'combo_type' => '类型',
            'snap_combo_id' => '快照ID',
            'is_valid' => '是否有效',
        ];
    }

    public static function duplicateOne(Combo $combo)
    {
        $snapShot = new Snapshot();
        $snapShot->combo_name = $combo->combo_name;
        $snapShot->combo_cost = $combo->combo_cost;
        $snapShot->combo_classify = $combo->combo_classify;
        $snapShot->combo_type = $combo->combo_type;
        $snapShot->snap_combo_id = $combo->combo_id;
        $snapShot->combo_product = $combo->product->name;
        $snapShot->combo_charge = $combo->combo_charge;
        $snapShot->save(false);

        return $snapShot->id;
    }

    //一个快照对应一个或多个订单
    public function getOrder()
    {
        return $this->hasMany(Order::className(), ['combo_id' => 'id']);
    }

}
