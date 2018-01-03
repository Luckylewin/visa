<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "yii2_country".
 *
 * @property integer $id
 * @property string $abbr
 * @property string $cinfo
 */
class Country extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_country';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['abbr', 'cinfo'], 'required'],
            [['abbr'], 'string', 'max' => 5],
            [['cinfo'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'abbr' => '国家简写',
            'cinfo' => '国家中文',
        ];
    }

    public static function getDropdownList()
    {
        return self::find()->orderBy('id desc')->all();
    }
}
