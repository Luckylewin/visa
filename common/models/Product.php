<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "yii2_product".
 *
 * @property integer $id
 * @property string $name
 * @property string $picture
 * @property string $type
 * @property string $cost
 * @property integer $country_id
 * @property string $order_type
 */
class Product extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_product';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'name', 'picture', 'cost', 'country_id'], 'required'],
            [['id', 'country_id'], 'integer'],
            [['cost'], 'number'],
            [['name', 'picture'], 'string', 'max' => 255],
            [['type', 'order_type'], 'string', 'max' => 1],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '产品id',
            'name' => '产品名称',
            'picture' => '产品图片',
            'type' => '产品类型',// 1正常2加急3特急
            'cost' => '支出成本',
            'country_id' => '国家ID',
            'order_type' => '订单类型',//(1网店 2直客 3同业)
        ];
    }
}
