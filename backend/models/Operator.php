<?php

namespace backend\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "yii2_operator".
 *
 * @property integer $id
 * @property string $name
 * @property integer $admin_id
 */
class Operator extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_operator';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['admin_id'], 'integer'],
            [['name'], 'string', 'max' => 50],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'name' => '操作者名称',
            'admin_id' => '后台帐号id',
        ];
    }

    public function getAccount()
    {
        return $this->hasOne(Admin::className(),['id' => 'admin_id']);
    }

    public static function getAllOperator()
    {
        $data = self::find()->where(['>', 'admin_id', 0])->asArray()->all();
        return ArrayHelper::map($data, 'admin_id', 'name');
    }

    public static function getCurrentOperator($id)
    {
        $data = self::find()->where(['admin_id' => $id])->asArray()->all();
        return ArrayHelper::map($data, 'admin_id', 'name');
    }


}
