<?php
/**
 * Created by PhpStorm.
 * User: lychee
 * Date: 2018/1/15
 * Time: 21:29
 */

namespace common\models;


use backend\models\Admin;
use backend\models\Operator;
use yii\helpers\ArrayHelper;
use Yii;


class Type
{

    public static function getYesOrNo()
    {
        return [
            Order::STATUS_YES => '是',
            Order::STATUS_NO  => '否',
        ];
    }

    public static function getRefundStatus()
    {
        return [
            Order::REFUND_STATUS_PENDING    => '未退款',
            Order::REFUND_STATUS_NO_HANDLED => '未办理退款',
            Order::REFUND_STATUS_DENIED     => '拒签退款'
        ];
    }

    public static function getStatus()
    {
        return [
            Order::AUDIT_STATUS_UNCHECKED => '未审核',
            Order::AUDIT_STATUS_RECEIVED  => '已收到',
            Order::AUDIT_STATUS_CHECKED   => '已审核',
            Order::AUDIT_STATUS_SEND      =>'已送签',
            Order::AUDIT_STATUS_PASS      =>'已通过',
            Order::AUDIT_STATUS_DENIED    => '已拒签'
        ];
    }

    public static function getSex()
    {
        return [1=>'男',2=>'女'];
    }

    public static function getComboType()
    {
        return [
            Order::TYPE_STATUS_NORMAL  => '正常',
            Order::TYPE_STATUS_ANXIOUS => '加急',
            Order::TYPE_STATUS_URGENT  => '特急'
        ];
    }

    public static function getComboClassify()
    {
        return [
            Order::CLASSIFY_STATUS_SHOP     => '网店',
            Order::CLASSIFY_STATUS_CLIENT   => '直客',
            Order::CLASSIFY_STATUS_BUSINESS => '同业'
        ];
    }

    public static function getExportSetting()
    {
        return [
                Order::DISPLAY_STATUS_HIDE => '不显示',
                Order::DISPLAY_STATUS_SHOW => '显示'
        ];
    }

    public static function getGroup($combos)
    {
        $rowSpan = ['1'=>['status'=>true,'rowspan'=>0],'2'=>['status'=>true,'rowspan'=>0], '3'=>['status'=>true,'rowspan'=>0] ];
        foreach ($combos as $combo) {
             $rowSpan[$combo->combo_classify]['rowspan']++;
        }

        return $rowSpan;
    }

    //客服绑定帐号
    public static function getAccount()
    {
        //除去已经被绑定的客服
        $servicer_admin_id = array_filter(array_values(ArrayHelper::getColumn(Servicer::getValidPerson(),'admin_id')));

        //除去已经被绑定的操作人员
        $operator_admin_id = array_filter(array_values(ArrayHelper::getColumn(Operator::find()->all(),'admin_id')));

        $admin_id = $servicer_admin_id + $operator_admin_id;

        if (!empty($admin_id)) {
            $data =Admin::find()->where(['not in','id', $admin_id])->all();
        } else {
            $data = Admin::find()->all();
        }

        return ArrayHelper::map($data,'id','username');
    }

    /**
     * 查询当前用户是否为超级管理员
     * @return bool
     */
    public static function isSuperAdmin()
    {
        $authManager = Yii::$app->authManager;
        $role = $authManager->getRolesByUser(Yii::$app->user->id);
        $role = isset(current($role)->name)? current($role)->name : false;

        return $role == Admin::SUPER_ADMIN;
    }

    // 查询当前用户是否为客服
    public static function isServicer()
    {
        $exist = Servicer::find()->where(['admin_id' => Yii::$app->getUser()->id])->exists();

        return $exist;
    }

    // 查询当前用户是否为操作人员
    public static function isOperator()
    {
        $exist = Operator::find()->where(['admin_id' => Yii::$app->getUser()->id])->exists();

        return $exist;
    }

}