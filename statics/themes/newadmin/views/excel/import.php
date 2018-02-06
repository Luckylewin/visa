<?php

use yii\helpers\Html;
use \yii\helpers\Url;

$this->title = '导入excel表格';
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Orders'), 'url' => Url::to(['order/index'])];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            导入Excel表格
        </h3>
    </div>
    <div class="panel-body">

        <?php $form = \yii\widgets\ActiveForm::begin([
            'options' => [
                'action' => 'post',
                'enctype' => 'multipart/form-data'
            ]
        ]) ?>

        <?= $form->field($model, 'file')->fileInput()->label('excel文件'); ?>

        <div class="form-group">
            <?= Html::submitButton('导入', ['class' => 'btn btn-primary']) ?>

            <?= Html::a('返回', ['order/index'], ['class' => 'btn btn-default']) ?>

        </div>

        <?php \yii\widgets\ActiveForm::end() ?>
    </div>
</div>






