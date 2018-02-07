<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "yii2_export_setting".
 *
 * @property integer $id
 * @property string $rolename
 * @property string $showfinance
 */
class ExportSetting extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_export_setting';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['rolename'], 'required'],
            [['rolename'], 'string', 'max' => 30],
            [['showfinance'], 'string', 'max' => 1],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'rolename' => '角色id',
            'showfinance' => '是否展示财务信息',
        ];
    }
}
