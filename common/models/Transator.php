<?php

namespace common\models;

use Yii;
use yii\helpers\ArrayHelper;

/**
 * This is the model class for table "yii2_transator".
 *
 * @property integer $tid
 * @property string $name
 * @property string $sex
 * @property string $phone
 * @property string $address
 * @property string $identify
 * @property string $is_valid
 * @property integer $expire_time
 * @property integer $order_id
 * @property string $remark
 */
class Transator extends \yii\db\ActiveRecord
{
    public $historyOrder;

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
            [['name'], 'required'],
            [['expire_time','order_id'], 'integer'],
            [['name'], 'string', 'max' => 50],
            [['address','remark'], 'string', 'max' => 255],
            [['sex', 'is_valid'], 'string', 'max' => 1],
            [['phone'], 'string', 'max' => 32],
            [['identify'], 'string', 'max' => 30],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'tid' => 'Tid',
            'name' => '姓名',
            'sex' => '性别',
            'phone' => '手机号',
            'address' => '地址',
            'identify' => '身份证',
            'is_valid' => '是否有效',
            'expire_time' => '操作过期时间',
            'order_id' => '订单ID',
            'remark' => '个人信息'
        ];
    }
    
    public function beforeSave($insert)
    {
        if (parent::beforeSave($insert)) {
            if ($this->isNewRecord) {
                $this->expire_time = time() + 86400;
            }
            return true;
        }
       return false;
    }

    /**
     * 绑定订单关系
     * @param $ids
     * @param $order_id
     * @param $isNewRecord
     * @return bool
     * @throws
     */
    public static function appendToOrder($ids,$order_id,$isNewRecord)
    {
        if (!$order_id || empty($ids)) {
            return false;
        }
        //先找出所有的
        $originTid = Yii::$app->db->createCommand("SELECT * FROM yii2_order_to_transactor WHERE o_id = $order_id")->queryAll();
        $originTid = ArrayHelper::getColumn($originTid, 't_id');

        if ($isNewRecord) {
            $batchInsert = [];
            foreach ($ids as $id) {
                if ($transactor = self::findOne(['tid' => $id])) {
                    $transactor->is_valid = 1;
                    $transactor->update(false);

                    $batchInsert[] = [$id, $order_id];
                }
            }
            //批量插入关联关系
            if (!empty($batchInsert)) {
                Yii::$app->getDb()->createCommand()->batchInsert('yii2_order_to_transactor', ['t_id', 'o_id'], $batchInsert)->execute();
            }
        } else {
            //删除更新时剔除的
            foreach ($originTid as $tid) {
                if (!in_array($tid, $ids)) {
                    //self::findOne(['tid' => $tid])->delete();
                    Yii::$app->db->createCommand()->delete('yii2_order_to_transactor',['t_id'=>$tid,'o_id'=>$order_id])->execute();
                }
            }
            $updateDiff = array_diff($ids,$originTid);
            //增加更新时增加的
            if (!empty($updateDiff)) {
                 foreach ($updateDiff as $tid) {
                    Yii::$app->db->createCommand()->insert('yii2_order_to_transactor',['o_id'=>$order_id , 't_id'=>$tid])->execute();
                 }
            }
        }
    }

    //办理人 多对多关系
    public function getRelatedOrder()
    {
        $sql = "SELECT o_id FROM  yii2_transator AS b LEFT JOIN yii2_order_to_transactor AS a  ON  a.t_id = b.tid WHERE a.t_id = " . $this->tid;
        $data = Yii::$app->db->createCommand($sql)->queryAll();
        if (!empty($data)) {
            $oid = ArrayHelper::getColumn($data, 'o_id');
            $oid = implode(',', $oid);

           return $data = Order::find()->where("id in ($oid)")->select('id,order_num,order_date')->all();

        }

    }
}
