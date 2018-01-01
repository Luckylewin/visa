<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "yii2_product_combo".
 *
 * @property integer $pid
 * @property string $combo_name
 * @property integer $cid
 */
class ProductCombo extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_product_combo';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pid', 'combo_name', 'cid'], 'required'],
            [['pid', 'cid'], 'integer'],
            [['combo_name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'pid' => 'Pid',
            'combo_name' => '套餐名称',
            'cid' => 'Cid',
        ];
    }
}
