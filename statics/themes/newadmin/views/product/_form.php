<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Product */
/* @var $form yii\widgets\ActiveForm */
?>


<div class="product-form">

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
               <?= $model->isNewRecord ? '新增产品' : '编辑产品';?>
            </h3>
        </div>
        <div class="panel-body">
            <div >

            <?php $form = ActiveForm::begin(); ?>

            <?= $form->field($model, 'name')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'picture')->textInput(['maxlength' => true]) ?>

            <?= $form->field($model, 'cost')->textInput(['maxlength' => true]); ?>

            <?= $form->field($model, 'country_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\Country::getDropdownList(), 'id', 'cinfo')); ?>

            <div class="form-group">
                <?= Html::submitButton($model->isNewRecord ? Yii::t('backend', 'Create') : Yii::t('backend', 'Save'), ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
                <?= Html::button(Yii::t('backend', 'GoBack'), [
                        'class' => 'btn btn-danger',
                        'onclick' => 'history.go(-1)'
                ]) ?>
            </div>

            </div>
            <?php ActiveForm::end(); ?>
        </div>
    </div>


</div>
