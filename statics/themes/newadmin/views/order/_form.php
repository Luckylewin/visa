<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Servicer;
use common\models\Transator;

/* @var $this yii\web\View */
/* @var $model common\models\Order */
/* @var $form yii\widgets\ActiveForm */
$tranlator = new Transator();
?>

<style>
    div.required label:after {
        content: " *";
        color: red;
        vertical-align: middle;
    }
</style>
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
                <?= $form->field($model, 'order_classify')->dropDownList(\common\models\Type::getComboClassify()) ?>
                <?= $form->field($model, 'order_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>
                <?= $form->field($model, 'custom_servicer_id')->dropDownList(ArrayHelper::map(Servicer::find()->all(),'id','name')); ?>

                <?= $form->field($model, 'order_num')->textInput() ?>

                <?= $form->field($model, 'cid')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\Country::find()->orderBy('id desc')->all(), 'id' ,'cinfo'))->label('国家'); ?>
                <?= $form->field($model, 'order_type')->dropDownList(\common\models\Type::getComboType(), ['prompt'=>'请选择','prompt_val'=>'0']) ?>

                <?php if($model->isNewRecord): ?>
                    <?= $form->field($model, 'combo_id')->dropDownList(['1'=>'无'])->label('套餐'); ?>
                <?php else: ?>
                    <?= $form->field($model, 'combo_id')->dropDownList(\yii\helpers\ArrayHelper::map(\common\models\Combo::findAll(['combo_id'=>$model->combo_id]),'combo_id','combo_name'))->label('当前套餐'); ?>
                <?php endif; ?>

                <?= $form->field($model, 'single_sum')->textInput(['maxlength' => true]) ?>
                <?= $form->field($model, 'total_person')->textInput() ?>
                <?= $form->field($model, 'balance_order')->textInput(['maxlength' => true, 'placeholder'=>'默认为空']) ?>
                <?= $form->field($model, 'flushphoto_order')->textInput(['maxlength' => true, 'placeholder'=>'默认为空']) ?>
                <?= $form->field($model, 'carrier_order')->textInput(['maxlength' => true, 'placeholder'=>'默认为空']) ?>
            </div>
            <div class="col-md-3">

                <div style="position: relative;">

                    <?= $form->field($model, 'transactor_name')->textInput([
                        'class'=>'form-control',
                        'style' => 'width:200px;',
                        'readonly' => true,
                        'placeholder' => '请点击右边加号添加'
                    ],[
                            'template' => '{input}'
                    ])->label('办理人'); ?>
                    <i class="fa fa-plus-square-o add-transator" style="position: absolute;top: 40%;left: 90%;font-size: 36px;cursor: pointer"></i>
                </div>
                <?= $form->field($model, 'customer_id')->textInput() ?>

                <div style="margin-top: 535px;">

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

                <!--$form->field($model, 'operator')->hiddenInput(['maxlength' => true])-->

                <?= $form->field($model, 'back_address')->textarea(['rows'=>3,'maxlength' => true]) ?>

                <?= $form->field($model, 'back_addressee')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'back_telphone')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'delivergood_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

                <?= $form->field($model, 'deliver_order')->textInput(['maxlength' => true]) ?>

                <?= $form->field($model, 'delivercompany')->textInput() ?>

                <?= $form->field($model, 'remark')->textarea(['rows' => 3]) ?>
            </div>
            <div class="col-md-3">
                <?= $form->field($model, 'audit_status')->dropDownList(\common\models\Type::getStatus(), [
                    'style' => 'max-width:350px;'
                ]) ?>

                <?= $form->field($model, 'pay_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

                <?= $form->field($model, 'receipt_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>



                <?= $form->field($model, 'transactor_id')->hiddenInput(['rows'=>4])->label(false) ?>

            </div>
        </div>
    </div>


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '创建' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>
    </div>

    <?php ActiveForm::end(); ?>

    <?php $form = ActiveForm::begin(); ?>
    <div class="well transactor hidden">
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
        <button class="btn btn-primary create-transator">添加</button>
    </div>
    <?php ActiveForm::end(); ?>


    <script src="/statics/themes/newadmin/js/plugins/layer/laydate/laydate.js"></script>
</div>





