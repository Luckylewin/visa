<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\ResetPasswordForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = '重置密码';

?>
<div class="site-reset-password">

    <div class="col-md-6 col-md-offset-3">
        <h1><?= Html::encode($this->title) ?></h1>
        <div class="well">
            <p>请填写你的新密码:</p>

            <div class="row">
                <div class="col-lg-8">
                    <?php $form = ActiveForm::begin(['id' => 'reset-password-form']); ?>

                    <?= $form->field($model, 'password')->label('密码')->passwordInput(['autofocus' => true]) ?>
                    <?= $form->field($model, 're_password')->label('再次确认')->passwordInput(['autofocus' => true]) ?>

                    <div class="form-group">
                        <?= Html::submitButton('重置密码', ['class' => 'btn btn-primary']) ?>
                    </div>

                    <?php ActiveForm::end(); ?>
                </div>
            </div>
        </div>
    </div>

</div>
