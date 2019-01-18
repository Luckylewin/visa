<?php

/* @var $this yii\web\View */
/* @var $form yii\bootstrap\ActiveForm */
/* @var $model \frontend\models\PasswordResetRequestForm */

use yii\helpers\Html;
use yii\bootstrap\ActiveForm;

$this->title = '请求重置密码';

?>
<div class="site-request-password-reset">
    <div class="col-md-6 col-md-offset-3">
        <div class="well">
            <h1><?= Html::encode($this->title) ?></h1>

            <p>请填写与账号绑定的邮箱，提交后将发送重置密码的链接。</p>

            <div class="row">
                <div class="col-lg-5">
                    <?php $form = ActiveForm::begin(['id' => 'request-password-reset-form']); ?>

                    <?= $form->field($model, 'email')->textInput(['autofocus' => true])->label('邮箱') ?>

                    <div class="form-group">
                        <?= Html::submitButton('提交', ['class' => 'btn btn-primary']) ?>
                    </div>

                    <?php ActiveForm::end(); ?>
                </div>
            </div>
        </div>
    </div>
</div>
