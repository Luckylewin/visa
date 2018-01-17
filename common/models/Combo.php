<?php

namespace common\models;

use backend\models\Admin;
use yii\behaviors\TimestampBehavior;
use \yii\db\ActiveRecord;
use Yii;

/**
 * This is the model class for table "yii2_combo".
 *
 * @property string $combo_id
 * @property string $combo_name
 * @property string $created_at
 * @property string $updated_at
 * @property string $product_id
 * @property string $combo_cost
 * @property string $combo_type
 * @property string $combo_classify
 * @property integer $uid
 */
class Combo extends ActiveRecord
{

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_combo';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['combo_name','product_id','combo_cost','combo_type','combo_classify'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['uid','product_id'], 'integer'],
            [['combo_name'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'combo_id' => 'ID',
            'combo_name' => '套餐名称',
            'created_at' => '创建时间',
            'updated_at' => '更新时间',
            'country' => '国家',
            'combo_type' => '套餐类型',
            'uid' => '用户id',
            'product_id' => '产品id',
            'combo_cost' => '支出成本',
            'combo_classify' => '订单分类'
        ];
    }

    public function behaviors()
    {
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

    public function getCountry()
    {
        $this->hasOne(Country::className(), ['id' => 'country_id']);
    }

    public function getProduct()
    {
        return $this->hasOne(Product::className(), ['id' => 'product_id']);
    }

    public function getUser()
    {
        return $this->hasOne(Admin::className(), ['id' => 'uid']);
    }
}
