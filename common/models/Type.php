<?php
/**
 * Created by PhpStorm.
 * User: lychee
 * Date: 2018/1/15
 * Time: 21:29
 */

namespace common\models;


class Type
{

    public static function getStatus()
    {
        return ['1'=>'未提交','2'=>'审核中','3'=>'已通过','4'=>'未通过'];
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

    public static function getGroup($combos)
    {
        $rowspan = ['1'=>['status'=>true,'rowspan'=>0],'2'=>['status'=>true,'rowspan'=>0], '3'=>['status'=>true,'rowspan'=>0] ];
        foreach ($combos as $combo) {
             $rowspan[$combo->combo_classify]['rowspan']++;
        }
        return $rowspan;
    }
}