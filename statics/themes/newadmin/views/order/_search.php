<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\OrderQuery */
/* @var $form yii\widgets\ActiveForm */
?>

<div class="order-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <?= $form->field($model, 'id') ?>

    <?= $form->field($model, 'pid') ?>

    <?= $form->field($model, 'order_classify') ?>

    <?= $form->field($model, 'order_type') ?>

    <?= $form->field($model, 'order_date') ?>

    <?php // echo $form->field($model, 'customer_id') ?>

    <?php // echo $form->field($model, 'combo_id') ?>

    <?php // echo $form->field($model, 'custom_servicer_id') ?>

    <?php // echo $form->field($model, 'transactor_id') ?>

    <?php // echo $form->field($model, 'transactor_name') ?>

    <?php // echo $form->field($model, 'single_sum') ?>

    <?php // echo $form->field($model, 'total_person') ?>

    <?php // echo $form->field($model, 'balance_order') ?>

    <?php // echo $form->field($model, 'balance_sum') ?>

    <?php // echo $form->field($model, 'flushphoto_order') ?>

    <?php // echo $form->field($model, 'flushphoto_sum') ?>

    <?php // echo $form->field($model, 'carrier_order') ?>

    <?php // echo $form->field($model, 'carrier_sum') ?>

    <?php // echo $form->field($model, 'collect_date') ?>

    <?php // echo $form->field($model, 'deliver_date') ?>

    <?php // echo $form->field($model, 'entry_date') ?>

    <?php // echo $form->field($model, 'putsign_date') ?>

    <?php // echo $form->field($model, 'operator') ?>

    <?php // echo $form->field($model, 'back_address') ?>

    <?php // echo $form->field($model, 'back_addressee') ?>

    <?php // echo $form->field($model, 'back_telphone') ?>

    <?php // echo $form->field($model, 'delivergood_date') ?>

    <?php // echo $form->field($model, 'deliver_order') ?>

    <?php // echo $form->field($model, 'delivercompany_id') ?>

    <?php // echo $form->field($model, 'remark') ?>

    <?php // echo $form->field($model, 'receipt_date') ?>

    <?php // echo $form->field($model, 'pay_date') ?>

    <?php // echo $form->field($model, 'audit_status') ?>

    <div class="form-group">
        <?= Html::submitButton('Search', ['class' => 'btn btn-primary']) ?>
        <?= Html::resetButton('Reset', ['class' => 'btn btn-default']) ?>
    </div>

    <?php ActiveForm::end(); ?>

</div>
