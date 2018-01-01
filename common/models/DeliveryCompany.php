<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "yii2_delivery_company".
 *
 * @property integer $id
 * @property string $companyname
 */
class DeliveryCompany extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_delivery_company';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['companyname'], 'required'],
            [['companyname'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'companyname' => '公司名称',
        ];
    }
}
