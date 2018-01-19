<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Snapshot */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="snapshot-form">

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'combo_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'combo_cost')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'combo_classify')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'combo_type')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'combo_country')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'snap_combo_id')->textInput() ?>

    <?= $form->field($model, 'is_valid')->textInput(['maxlength' => true]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
