<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Order */
/* @var $form yii\widgets\ActiveForm */
?>




<div class="order-form">

    <div class="well">
        <div style="cursor: pointer;">
            <h4><i class="fa fa-plus"></i> 添加产品</h4>
        </div>
        <div class="row">
            <div class="col-md-3">
                <div class="input-group" style="width: 300px;">
                    <input type="text" class="form-control" id="taobao">
                    <div class="input-group-btn">
                        <button type="button" class="btn btn-white dropdown-toggle" data-toggle="dropdown">
                            <span class="caret"></span>
                        </button>
                        <ul class="dropdown-menu dropdown-menu-right" role="menu">
                        </ul>
                    </div>
                </div>
            </div>
            <div class="col-md-3" style="margin-left: 20px;">
                <div class="input-group col-md-12">
                    <select id="combo" data-placeholder="请选择套餐" class="form-control m-b" name="account">

                    </select>
                </div>
            </div>
            <div class="col-md-3">
                <div class="input-group" style="width: 300px;">
                    <button id="add-to-body" class="btn btn-info">添加</button>
                </div>
            </div>
        </div>
    </div>

    <div class="product-chose hidden">
        <table class="table table-bordered">
            <thead>
            <tr>
                <th>产品名称</th>
                <th>套餐名称</th>
                <th>操作</th>
            </tr>
            </thead>
            <tbody class="product-body">

            </tbody>
        </table>
    </div>

    <?php $form = ActiveForm::begin(); ?>

    <?= $form->field($model, 'pid')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'combo_id')->textInput() ?>

    <?= $form->field($model, 'order_num')->textInput() ?>

    <?= $form->field($model, 'order_classify')->dropDownList(['1' => '网店', '2' => '直客', '3' => '同业']) ?>

    <?= $form->field($model, 'order_type')->dropDownList(['1' => '正常', '2' => '加急', '3' => '特急']) ?>

    <?= $form->field($model, 'order_date')->textInput([
            'class' => 'form-control layer-date',
            'placeholder' => 'YYYY-MM-DD',
            'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
            'style' => 'display:block!important'
    ]) ?>

    <?= $form->field($model, 'customer_id')->textInput() ?>



    <?= $form->field($model, 'custom_servicer_id')->textInput() ?>

    <?= $form->field($model, 'transactor_id')->textInput() ?>

    <?= $form->field($model, 'transactor_name')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'single_sum')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'total_person')->textInput() ?>

    <?= $form->field($model, 'balance_order')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'balance_sum')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'flushphoto_order')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'flushphoto_sum')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'carrier_order')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'carrier_sum')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'collect_date')->textInput([
        'class' => 'form-control layer-date',
        'placeholder' => 'YYYY-MM-DD',
        'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
        'style' => 'display:block!important'
    ]) ?>

    <?= $form->field($model, 'deliver_date')->textInput([
        'class' => 'form-control layer-date',
        'placeholder' => 'YYYY-MM-DD',
        'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
        'style' => 'display:block!important'
    ]) ?>

    <?= $form->field($model, 'entry_date')->textInput([
        'class' => 'form-control layer-date',
        'placeholder' => 'YYYY-MM-DD',
        'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
        'style' => 'display:block!important'
    ]) ?>

    <?= $form->field($model, 'putsign_date')->textInput([
        'class' => 'form-control layer-date',
        'placeholder' => 'YYYY-MM-DD',
        'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
        'style' => 'display:block!important'
    ]) ?>

    <?= $form->field($model, 'operator')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'back_address')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'back_addressee')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'back_telphone')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'delivergood_date')->textInput() ?>

    <?= $form->field($model, 'deliver_order')->textInput(['maxlength' => true]) ?>

    <?= $form->field($model, 'delivercompany_id')->textInput() ?>

    <?= $form->field($model, 'remark')->textarea(['rows' => 6]) ?>

    <?= $form->field($model, 'receipt_date')->textInput([
        'class' => 'form-control layer-date',
        'placeholder' => 'YYYY-MM-DD',
        'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
        'style' => 'display:block!important'
    ]) ?>

    <?= $form->field($model, 'pay_date')->textInput([
        'class' => 'form-control layer-date',
        'placeholder' => 'YYYY-MM-DD',
        'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
        'style' => 'display:block!important'
    ]) ?>

    <?= $form->field($model, 'audit_status')->dropDownList(['1'=>'未提交','2'=>'审核中','3'=>'已通过','4'=>'未通过'], [
            'style' => 'width:240px;'
    ]) ?>

    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? 'Create' : 'Update', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

    <script src="/statics/themes/newadmin/js/plugins/layer/laydate/laydate.js"></script>
</div>

<script>

</script>



