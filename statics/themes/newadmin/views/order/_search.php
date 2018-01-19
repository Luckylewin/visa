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



    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">
                条件搜索
            </h3>
        </div>
        <div class="panel-body">
            <div class="col-md-12">

                <div class="col-md-3">

                    <?= $form->field($model, 'order_classify')->dropDownList(\common\models\Type::getComboClassify()) ?>

                    <?= $form->field($model, 'order_type')->dropDownList(\common\models\Type::getComboType()) ?>

                    <?= $form->field($model, 'order_date')->textInput([
                        'class' => 'form-control layer-date',
                        'placeholder' => '请选择日期',
                        'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                        'style' => 'display:block!important;max-width:380px!important'
                    ]) ?>

                    <?= $form->field($model, 'customer_id') ?>

                    <?= $form->field($model, 'order_num') ?>

                </div>

                <div class="col-md-3">

                    <?= $form->field($model, 'collect_date')->textInput([
                        'class' => 'form-control layer-date',
                        'placeholder' => '请选择日期',
                        'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                        'style' => 'display:block!important;max-width:380px!important'
                    ]) ?>

                    <?= $form->field($model, 'deliver_date')->textInput([
                        'class' => 'form-control layer-date',
                        'placeholder' => '请选择日期',
                        'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                        'style' => 'display:block!important;max-width:380px!important'
                    ]) ?>

                    <?= $form->field($model, 'entry_date')->textInput([
                        'class' => 'form-control layer-date',
                        'placeholder' => '请选择日期',
                        'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                        'style' => 'display:block!important;max-width:380px!important'
                    ]) ?>

                    <?= $form->field($model, 'putsign_date')->textInput([
                        'class' => 'form-control layer-date',
                        'placeholder' => '请选择日期',
                        'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                        'style' => 'display:block!important;max-width:380px!important'
                    ]) ?>

                    <?= $form->field($model, 'delivergood_date')->textInput([
                        'class' => 'form-control layer-date',
                        'placeholder' => '请选择日期',
                        'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                        'style' => 'display:block!important;max-width:380px!important'
                    ]) ?>

                </div>

                <div class="col-md-3">

                    <?= $form->field($model, 'transactor_id') ?>

                    <?= $form->field($model, 'back_addressee') ?>

                    <?= $form->field($model, 'back_telphone') ?>

                    <?= $form->field($model, 'deliver_order') ?>

                    <label for="aa">提交查询</label>
                    <div id="aa" class="form-group">
                        <?= Html::submitButton('<i class="fa fa-search"></i>查询', ['class' => 'btn btn-primary']) ?>
                        <?= Html::resetButton('<i class="fa fa-hand-stop-o"></i>重置', ['class' => 'btn btn-default']) ?>
                    </div>
                </div>

            </div>
        </div>
    </div>





    <?php ActiveForm::end(); ?>

</div>

<?php //$form->field($model, 'order_type') ?>

<?php //$form->field($model, 'id') ?>

<?php //$form->field($model, 'pid') ?>

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
