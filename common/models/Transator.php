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
     * @return bool
     * @throws
     */
    public static function appendToOrder($ids,$order_id)
    {
        if (!$order_id) {
            return false;
        }
        //先找出所有的
        $originTid = self::find()->where(['order_id' => $order_id])->select('tid')->all();
        $originTid = ArrayHelper::getColumn($originTid, 'tid');


        if (!empty($ids)) {
            //删除更新时剔除的
            foreach ($originTid as $tid) {
                if (!in_array($tid, $ids)) {
                    self::findOne(['tid' => $tid])->delete();
                }
            }
            foreach ($ids as $id) {
                if ($transactor = self::findOne(['tid' => $id])) {
                    $transactor->order_id = $order_id;
                    $transactor->is_valid = 1;
                    $transactor->update(false);
                }
            }
        }
    }
}
