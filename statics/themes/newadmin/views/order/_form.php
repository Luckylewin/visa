<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\Order */
/* @var $form yii\widgets\ActiveForm */
?>


<div class="order-form">
    <div class="panel panel-danger  hidden">
        <div class="panel-heading">
            <h3 class="panel-title">
                <b>不清楚的地方</b>
            </h3>
        </div>
        <div class="panel-body">
            <ul>
                由于文档描述不够清晰 现提出几点问题

                <li>
                    1.产品里面有什么字段
                </li>
                <li>
                    2.套餐里面又有什么字段
                </li>
                <li>
                    3.产品和套餐是什么关系，订单和他们又是怎样的一个关联关系
                </li>
                <li>
                    4.国家是谁的字段？是属于产品还是属于订单？
                </li>
                <li>
                    5.订单创建时，哪些字段是直接人工输入，哪些字段是下拉选择的，比如说办理人，客服等
                </li>
                <li>
                    6.办理人需要哪些基本信息？
                </li>

            </ul>
        </div>
    </div>

    <div class="panel panel-info hidden">
        <div class="panel-heading">
            <h3 class="panel-title">
                <b>选择产品-套餐</b>
            </h3>
        </div>
        <div class="panel-body">
            <!--<div style="cursor: pointer;">
                <h4><i class="fa fa-plus"></i> 添加产品</h4>
            </div>-->
            <div class="row">
                <div class="col-md-3">
                    <div class="input-group" style="width: 300px;">
                        <input type="text" placeholder="可输入 “测试”  " class="form-control" id="taobao">
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



    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><b>填写订单信息</b></h3>
        </div>
        <div class="panel-body">
            <div class="col-md-3">
                <?= $form->field($model, 'order_classify')->dropDownList(['1' => '网店', '2' => '直客', '3' => '同业']) ?>
                <?= $form->field($model, 'order_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>
                <?= $form->field($model, 'custom_servicer_id')->textInput() ?>
                <?= $form->field($model, 'custom_servicer_id')->textInput()->label('接待客服'); ?>
                <?= $form->field($model, 'order_num')->textInput() ?>

                <?= $form->field($model, 'country_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\Country::find()->orderBy('id desc')->all(), 'id' ,'cinfo'))->label('国家'); ?>
                <?= $form->field($model, 'order_type')->dropDownList(['1' => '正常', '2' => '加急', '3' => '特急'], ['prompt'=>'请选择','prompt_val'=>'0']) ?>
                <?= $form->field($model, 'customer_id')->dropDownList(['1'=>'加载中 '])->label('套餐'); ?>

                <?= $form->field($model, 'single_sum')->textInput(['maxlength' => true]) ?>
                <?= $form->field($model, 'total_person')->textInput() ?>
                <?= $form->field($model, 'balance_order')->textInput(['maxlength' => true]) ?>
                <?= $form->field($model, 'flushphoto_order')->textInput(['maxlength' => true]) ?>
                <?= $form->field($model, 'carrier_order')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-3">
                <?= $form->field($model, 'transactor_name')->textInput(['maxlength' => true]) ?>
                <?= $form->field($model, 'customer_id')->textInput() ?>
                <?= $form->field($model, 'transactor_id')->textInput() ?>

                <div style="height: 517px">

                </div>

                <?= $form->field($model, 'balance_sum')->textInput(['maxlength' => true]) ?>
                <?= $form->field($model, 'flushphoto_sum')->textInput(['maxlength' => true]) ?>
                <?= $form->field($model, 'carrier_sum')->textInput(['maxlength' => true]) ?>
            </div>
            <div class="col-md-3">
                <?= $form->field($model, 'collect_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

                <?= $form->field($model, 'deliver_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

                <?= $form->field($model, 'entry_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

                <?= $form->field($model, 'putsign_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

                <?= $form->field($model, 'operator')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'back_address')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'back_addressee')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'back_telphone')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'delivergood_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

                <?= $form->field($model, 'deliver_order')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'delivercompany_id')->textInput() ?>
                <?= $form->field($model, 'remark')->textInput() ?>
                <?= $form->field($model, 'receipt_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

            </div>
            <div class="col-md-3">
                <?= $form->field($model, 'audit_status')->dropDownList(['1'=>'未提交','2'=>'审核中','3'=>'已通过','4'=>'未通过'], [
                    'style' => 'max-width:350px;'
                ]) ?>



                <?= $form->field($model, 'pay_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>
            </div>
        </div>
    </div>


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '创建' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

    <script src="/statics/themes/newadmin/js/plugins/layer/laydate/laydate.js"></script>
</div>

<script>

</script>



