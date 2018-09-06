<?php

namespace common\models;

use backend\models\Admin;
use Yii;

/**
 * This is the model class for table "yii2_servicer".
 *
 * @property integer $id
 * @property string $name
 * @property string $tb_servicer_id
 * @property integer $admin_id
 * @property string $is_del
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
            [['admin_id'], 'safe'],
            ['is_del', 'default', 'value' => 0]
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
            'admin_id' => '绑定帐号'
        ];
    }

    public function getAccount()
    {
        return $this->hasOne(Admin::className(),['id' => 'admin_id']);
    }

    public static function getValidPerson()
    {
        return self::find()->where(['is_del' => 0])->all();
    }

}
