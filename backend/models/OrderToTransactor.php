<?php

namespace app\models;

use common\models\Order;
use common\models\Transator;
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

    public function getOrder()
    {
        return $this->hasOne(Order::className(), ['id' => 'o_id']);
    }

    public function getTransator()
    {
        return $this->hasOne(Transator::className(), ['tid' => 't_id']);
    }

    public static function clearTransator($id)
    {
        $relations = self::find()->where(['t_id' => $id])->all();

        $flag = false;
        foreach ($relations as $relation) {
            $order = Order::findOne($relation->o_id);
            if (is_null($order)) {
                self::deleteAll(['o_id' => $relation->o_id, 't_id'=> $relation->t_id]);
            } else {
                $flag = true;
            }
        }

        return $flag;
    }
}
