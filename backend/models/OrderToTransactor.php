<?php

namespace app\models;

use Yii;

/**
 * This is the model class for table "yii2_order_to_transactor".
 *
 * @property integer $o_id
 * @property integer $t_id
 */
class OrderToTransactor extends \yii\db\ActiveRecord
{
    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_order_to_transactor';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['o_id', 't_id'], 'required'],
            [['o_id', 't_id'], 'integer'],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'o_id' => 'O ID',
            't_id' => 'T ID',
        ];
    }
}
