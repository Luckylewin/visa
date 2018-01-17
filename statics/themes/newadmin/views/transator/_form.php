<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Transator */
/* @var $form yii\widgets\ActiveForm */
$tranlator = $model;
?>

<div class="col-md-6">
    <div class="transator-form">

        <?php $form = ActiveForm::begin(); ?>

        <?= $form->field($tranlator, 'name')->textInput([
            'class' => 'form-control',
        ]) ?>

        <?= $form->field($tranlator, 'sex')->dropDownList(\common\models\Type::getSex(),[
            'class' => 'form-control',
            'style' => 'width:100px;'
        ]) ?>

        <?= $form->field($tranlator, 'phone')->textInput() ?>

        <?= $form->field($tranlator, 'identify')->textInput() ?>

        <?= $form->field($tranlator, 'address')->textarea(['rows'=>2]) ?>

        <?= $form->field($tranlator, 'remark')->textarea(['rows'=>2]) ?>

        <div class="form-group">
            <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
        </div>

        <?php ActiveForm::end(); ?>

    </div>
</div>
