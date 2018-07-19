<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Servicer */

$this->title = '帐号绑定';
$this->params['breadcrumbs'][] = ['label' => '客服列表', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="servicer-create col-md-6">



    <?= Html::beginForm(
        \yii\helpers\Url::to(['operator/grant','sid'=> $model->id]), 'post'
    ); ?>

    <?= Html::hiddenInput('id',$model->id); ?>

    <label for="id">当前操人员</label>
    <?= Html::input('text', 'name', $model->name,['class'=>'form-control','readonly'=>true]) ?>
    <br>

    <label for="admin_id">帐号</label>
    <?= Html::dropDownList('admin_id',$model->admin_id, \common\models\Type::getAccount() ,['class'=>'form-control','id'=>'admin_id']) ?>
    <br>

    <?= Html::submitButton('绑定帐号',['class'=>'btn btn-info']) ?>
    <?= Html::a('返回',\yii\helpers\Url::to(['servicer/index']),['class'=>'btn btn-default']) ?>

    <?= Html::endForm(); ?>

</div>
