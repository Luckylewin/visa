<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "yii2_servicer".
 *
 * @property integer $id
 * @property string $name
 * @property string $tb_servicer_id
 */
class Servicer extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_servicer';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['name'], 'string', 'max' => 50],
            [['tb_servicer_id'], 'string', 'max' => 30],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => '客服名字',
            'tb_servicer_id' => '淘宝客服id',
        ];
    }
}
