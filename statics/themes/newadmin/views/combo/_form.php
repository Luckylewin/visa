<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Combo */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="product-form col-md-12">

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <?= $model->isNewRecord ? '新增套餐' : '编辑套餐内容';?>
            </h3>
        </div>
        <div class="panel-body">
            <div class="col-md-6">

                <?php $form = ActiveForm::begin(); ?>

                <?= $form->field($model, 'combo_name')->textInput() ?>

                <?= $form->field($model, 'product_id')->hiddenInput(['value'=>$product_id])->label(false) ?>

                <div class="form-group">
                    <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
                </div>

                <?php ActiveForm::end(); ?>
        </div>
    </div>


</div>

