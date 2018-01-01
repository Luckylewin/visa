<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "yii2_transator".
 *
 * @property string $tid
 * @property string $name
 * @property string $phone
 * @property string $address
 */
class Transator extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_transator';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name', 'phone', 'address'], 'required'],
            [['name', 'address'], 'string', 'max' => 50],
            [['phone'], 'string', 'max' => 32],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'tid' => 'Tid',
            'name' => 'Name',
            'phone' => 'Phone',
            'address' => 'Address',
        ];
    }
}
