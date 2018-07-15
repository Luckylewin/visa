<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model common\models\OrderQuery */
/* @var $form yii\widgets\ActiveForm */

$this->registerJsFile('/statics/themes/newadmin/js/plugins/select2/select2.min.js', ['depends' => 'yii\web\JqueryAsset']);
$this->registerCssFile('/statics/themes/newadmin/js/plugins/select2/select2.min.css');

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

                           <span style="float: right" id="fixed" >
                                <i class="fa fa-anchor"><span>固定</span></i>
                           </span>

                </span>

            </h3>
        </div>

        <?php $is_query = Yii::$app->request->get('OrderQuery')?"":"hide"; ?>

        <div class="panel-body search-body <?= $is_query?>">
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

                    <div>
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

                        <div class="col-md-12">
                            <?php $model->is_pay = isset($model->is_pay) ? $model->is_pay : 0 ?>
                            <?= $form->field($model, "is_pay")->radioList([0=>"全部",1=>"未支付",2=>"已支付"],[
                                'class' => 'form-control'
                            ]) ?>
                        </div>

                        <?php $display = $model->is_pay == '2'? 'block':'none'; ?>

                        <div class="col-md-6 is_pay" style="display: <?= $display?>">
                            <?= $form->field($model, 'pay_date_start')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("支付日期开始", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-6 is_pay" style="display: <?= $display?>">
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

                        <div class="col-md-12">
                            <?php $model->is_shop_receipt = isset($model->is_shop_receipt)? $model->is_shop_receipt : '0'; ?>
                            <?= $form->field($model, "is_shop_receipt")->radioList([0=>"全部",1=>"未收款",2=>"已收款"],[
                                'class' => 'form-control'
                            ]) ?>
                        </div>

                        <?php $display = $model->is_shop_receipt == '2'? 'block':'none'; ?>

                        <div class="col-md-6 is_shop_receipt" style="display: <?= $display?>">
                            <?= $form->field($model, 'receipt_date_start')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("店铺收款日期开始", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-6 is_shop_receipt" style="display: <?= $display?>">
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

                        <div class="col-md-12">
                            <?php  $model->is_company_receipt = isset($model->is_company_receipt)? $model->is_company_receipt : 0; ?>
                            <?= $form->field($model, "is_company_receipt")->radioList([0=>"全部",1=>"未收款",2=>"已收款"],[
                                'class' => 'form-control',
                            ]) ?>
                        </div>

                        <?php $display = $model->is_company_receipt == '2'? 'block':'none'; ?>

                        <div class="col-md-6 is_company_receipt" style="display: <?= $display?>">
                            <?= $form->field($model, 'company_receipt_date_start')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("公司收款日期开始", [
                                'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-6 is_company_receipt" style="display: <?= $display?>">
                            <?= $form->field($model, 'company_receipt_date_end')->textInput([
                                'class' => 'form-control layer-date',
                                'placeholder' => '请选择日期',
                                'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                                'style' => 'display:block!important;max-width:380px!important'
                            ])->label("公司收款日期结束", [
                                    'class' => 's-label'
                            ]) ?>
                        </div>

                        <div class="col-md-12">
                            <label for="js-example-basic-single">
                                产品名称
                            </label>
                            <div class="form-group">



                                <?php $product = \yii\helpers\ArrayHelper::map(\common\models\Product::getAll(), 'name', 'name'); ?>
                                <?= $form->field($model, 'total_person')->dropDownList($product, [
                                    'class' => 'js-example-basic-single',
                                    'id' => 'js-example-basic-single',
                                    'style' => 'width:100%;'
                                ])->label(false) ?>

                                <?= $form->field($model, 'combo_id')->hiddenInput([
                                    'id' => 'combo_id'
                                ])->label(false); ?>

                            </div>
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


<?php

$comboArray = Yii::$app->request->get('OrderQuery');
if (isset($comboArray)) {
    $comboArray = $comboArray['combo_id'];
    $comboArray = explode(',', $comboArray);
    $comboArray = "'" . implode("','", $comboArray) . "'";

} else {
    $comboArray = '';
}
?>

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

var searcher = {
   change:function _change(elements, input){
        $(elements).change(function(){
        var val = $(this).val();
        if (val == 2) {
            $(input).css('display', 'block');
        }else {
            $(input).css('display', 'none');
        }
        });
    }
}

searcher.change('#orderquery-is_pay input','.is_pay');
searcher.change('#orderquery-is_shop_receipt input','.is_shop_receipt');
searcher.change('#orderquery-is_company_receipt input','.is_company_receipt');

$(document).ready(function() {
    $('.js-example-basic-single').select2({multiple:true});
    $('.js-example-basic-single').on('select2:opening select2:closing', function( event ) {
        var $searchfield = $(this).parent().find('.select2-search__field');
        $searchfield.prop('disabled', true);
     });

    $('.js-example-basic-single').on('select2:select', function (e) {
        $('#combo_id').val($('.js-example-basic-single').val());
    }).on('select2:unselect', function() {
        $('#combo_id').val($('.js-example-basic-single').val());
    });

    $(".js-example-basic-single").val([<?= $comboArray ?>]).trigger("change")

    var flag = localStorage.getItem('fixed')

    if (flag == 1 || flag == 'undefined') {
    $('.my-search').click();
    $('#fixed').find('span').text('已固定');
    }

});

$('#fixed').click(function() {
    var flag = localStorage.getItem('fixed');

    if (flag == 1 || flag == 'undefined') {
        $(this).find('span').text('固定')
        localStorage.setItem("fixed", 0);
    } else {
        $(this).find('span').text('已固定')
        localStorage.setItem("fixed", 1);
    }

    return false;

});


<?php \common\widgets\Jsblock::end(); ?>
