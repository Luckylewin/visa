<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\OrderQuery */
/* @var $form yii\widgets\ActiveForm */
?>

<?php \common\widgets\Cssblock::begin() ?>
.my-search{cursor:pointer;}
.s-label{font-size:11px;}
<?php \common\widgets\Cssblock::end() ?>


<div class="order-search">

    <?php $form = ActiveForm::begin([
        'action' => ['index'],
        'method' => 'get',
    ]); ?>

    <div class="panel panel-primary">
        <div class="panel-heading">
            <h3 class="panel-title">
                <span class="my-search" value="hide">
                    条件搜索 <i class="fa fa-angle-double-down"></i>
                            <i class="fa fa-angle-double-up hide"></i>
                </span>

            </h3>
        </div>

        <div class="panel-body search-body hide">
            <div class="col-md-12">

                <div class="col-md-2">

                    <?= $form->field($model, 'order_type')->dropDownList(\common\models\Type::getComboType(), [
                        'prompt' => '请选择',
                        'prompt_val' => '0',
                    ]) ?>

                    <?= $form->field($model, 'order_classify')->dropDownList(\common\models\Type::getComboClassify(),[
                        'prompt' => '请选择',
                        'prompt_val' => '0',
                    ]) ?>

                    <?= $form->field($model, 'customer_id') ?>

                    <?= $form->field($model, 'order_num') ?>


                </div>

                <div class="col-md-4">

                    <div >
                        <div class="col-md-6">
                            <?= $form->field($model, 'order_date_start')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("订单日期开始", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-6">
                            <?= $form->field($model, 'order_date_end')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("订单日期结束", [
                                'class' => 's-label'
                            ]) ?>
                        </div>
                    </div>

                    <div >
                        <div class="col-md-6">
                            <?= $form->field($model, 'collect_date_start')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("收资料日开始", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-6">
                            <?= $form->field($model, 'collect_date_end')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("收资料日期结束", [
                                'class' => 's-label'
                            ]) ?>
                        </div>
                    </div>

                    <div >
                        <div class="col-md-6">
                            <?= $form->field($model, 'deliver_date_start')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("送证日期开始", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-6">
                            <?= $form->field($model, 'deliver_date_end')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("送证日期结束", [
                                'class' => 's-label'
                            ]) ?>
                        </div>
                    </div>

                    <div >
                        <div class="col-md-6">
                            <?= $form->field($model, 'entry_date_start')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("入馆日期开始", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-6">
                            <?= $form->field($model, 'entry_date_end')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("入馆日期结束", [
                                'class' => 's-label'
                            ]) ?>
                        </div>
                    </div>

                    <div >
                        <div class="col-md-6">
                            <?= $form->field($model, 'putsign_date_start')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("出签日期开始", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-6">
                            <?= $form->field($model, 'putsign_date_end')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("出签日期结束", [
                                'class' => 's-label'
                            ]) ?>
                        </div>
                    </div>

                    <div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'delivergood_date_start')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("发货日期开始", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-6">
                            <?= $form->field($model, 'delivergood_date_end')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("发货日期结束", [
                                'class' => 's-label'
                            ]) ?>
                        </div>
                    </div>



                </div>

                <div class="col-md-2">

                    <?= $form->field($model, 'transactor_id') ?>

                    <?= $form->field($model, 'back_addressee') ?>

                    <?= $form->field($model, 'back_telphone') ?>

                    <?= $form->field($model, 'deliver_order') ?>


                </div>

                <div class="col-md-4">

                    <div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'pay_date_start')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("支付日期开始", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-6">
                            <?= $form->field($model, 'pay_date_end')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("支付日期结束", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                    </div>

                    <div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'receipt_date_start')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("店铺收款日期开始", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-6">
                            <?= $form->field($model, 'receipt_date_end')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("店铺收款日期结束", [
                                'class' => 's-label'
                            ]) ?>
                        </div>
                    </div>


                    <div>
                        <div class="col-md-6">
                            <?= $form->field($model, 'company_receipt_date_start')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("公司收款日期开始", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-6">
                            <?= $form->field($model, 'company_receipt_date_end')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("公司收款日期结束", [
                                    'class' => 's-label'
                            ]) ?>
                        </div>

                    </div>

                </div>

            </div>

            <div class="col-md-12" style="border-top: 1px dashed #ccc">
                <div style="float: right">
                    <br>
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



<?php \common\widgets\Jsblock::begin(); ?>

$('.my-search').click(function() {
        var _switch = $(this).attr('value');
        if (_switch == 'hide') {
            $('i').removeClass('hide');
            $('.fa-angle-double-down').addClass('hide');
            $(this).attr('value', 'show');
            $('.search-body').removeClass('hide');
        } else {
            $('i').addClass('hide');
            $('.fa-angle-double-down').removeClass('hide');
            $(this).attr('value', 'hide');
            $('.search-body').addClass('hide');
        }
    });
<?php \common\widgets\Jsblock::end(); ?>
