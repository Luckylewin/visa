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
use yii\db\Query;
use yii\helpers\ArrayHelper;
use Yii;


class Type
{

    public static function getStatus()
    {
        return ['1'=>'未审核','2'=>'已收到','3'=>'已审核','4'=>'已送签','5'=>'已通过', '6' => '已拒签'];
    }

    public static function getSex()
    {
        return [1=>'男',2=>'女'];
    }

    public static function getComboType()
    {
        return ['1'=>'正常','2'=>'加急','3' => '特急'];
    }

    public static function getComboClassify()
    {
        return ['1'=>'网店','2'=>'直客','3'=>'同业'];
    }

    public static function getExportSetting()
    {
        return ['0'=>'不显示','1'=>'显示'];
    }

    public static function getGroup($combos)
    {
        $rowspan = ['1'=>['status'=>true,'rowspan'=>0],'2'=>['status'=>true,'rowspan'=>0], '3'=>['status'=>true,'rowspan'=>0] ];
        foreach ($combos as $combo) {
             $rowspan[$combo->combo_classify]['rowspan']++;
        }
        return $rowspan;
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