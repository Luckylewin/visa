<?php
/**
 * Created by PhpStorm.
 * User: lychee
 * Date: 2018/1/15
 * Time: 21:29
 */

namespace common\models;


use backend\models\Admin;
use yii\db\Query;
use yii\helpers\ArrayHelper;

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
        //除去已经被绑定的
        $admin_id = array_filter(array_values(ArrayHelper::getColumn(Servicer::find()->all(),'admin_id')));
        if (!empty($admin_id)) {
            $data =Admin::find()->where(['not in','id', $admin_id])->all();
        } else {
            $data = Admin::find()->all();
        }

        return ArrayHelper::map($data,'id','username');
    }

}