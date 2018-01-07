<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "yii2_order_product".
 *
 * @property string $order_id
 * @property integer $product_id
 */
class OrderProduct extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_order_product';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['order_id', 'product_id'], 'required'],
            [['order_id', 'product_id'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'order_id' => 'Order ID',
            'product_id' => 'Product ID',
        ];
    }
}
