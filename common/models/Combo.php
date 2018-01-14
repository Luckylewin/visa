<?php

namespace common\models;

use backend\models\Admin;
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
            [['combo_name','product_id','combo_cost','combo_type'], 'required'],
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
        ];
    }

    public function getCountry()
    {
        $this->hasOne(Country::className(), ['id' => 'country_id']);
    }

    /**
     * @param bool $insert
     * @return bool
     */
    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if ($this->isNewRecord) {
                $this->created_at = $this->updated_at = date('Y-m-d');
            } else {
                $this->updated_at = date('Y-m-d');
            }
            return true;
        }
        return false;
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
