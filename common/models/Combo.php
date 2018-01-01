<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "yii2_combo".
 *
 * @property string $combo_id
 * @property string $combo_name
 * @property string $created_at
 * @property string $updated_at
 * @property integer $uid
 */
class Combo extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_combo';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['combo_name', 'created_at', 'updated_at', 'uid'], 'required'],
            [['created_at', 'updated_at'], 'safe'],
            [['uid'], 'integer'],
            [['combo_name'], 'string', 'max' => 100],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'combo_id' => 'Combo ID',
            'combo_name' => '套餐名称',
            'created_at' => 'Created At',
            'updated_at' => 'Updated At',
            'uid' => '用户id',
        ];
    }
}
