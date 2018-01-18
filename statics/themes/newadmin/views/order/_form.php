<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Servicer;
use common\models\Transator;

/* @var $this yii\web\View */
/* @var $model common\models\Order */
/* @var $form yii\widgets\ActiveForm */
$this->registerCssFile('/statics/themes/newadmin/js/plugins/select2/select2.min.css');
$this->registerJsFile('/statics/themes/newadmin/js/plugins/select2/select2.min.js', ['depends'=>['yii\web\JqueryAsset']]);
$this->registerJsFile('/statics/themes/newadmin/js/bootstrap.min.js', ['depends'=>['yii\web\JqueryAsset']]);
$this->registerJsFile('/statics/themes/newadmin/js/plugins/layer/layer.min.js', ['depends'=>['yii\web\JqueryAsset']]);
$this->registerJsFile('/statics/themes/newadmin/js/plugins/layer/laydate/laydate.js', ['depends'=>['yii\web\JqueryAsset']]);

$tranlator = new Transator();
?>

<style>
    .control-label {
        min-width: 200px;
    }
    div.required label:after {
        content: " *";
        color: red;
        vertical-align: middle;
    }
</style>
<div class="order-form">

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
                    <?= $form->field($model, 'combo_id')->dropDownList([], ['prompt' => '请选择套餐'])->label('套餐'); ?>
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
                    <?= $form->field($model, 'transactor_id')->dropDownList([],[
                        'class'=>'form-control js-example-basic-multiple',
                        'style' => 'width:230px;',
                        'multiple' => "multiple",
                    ]); ?>
                    <i class="fa fa-plus-square-o add-transator" style="position: absolute;top: 42%;left: 89%;font-size: 36px;cursor: pointer"></i>
                </div>

                <?= $form->field($model, 'customer_id')->textInput() ?>

                <div style="margin-top: 540px;"></div>

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
        <?= $form->field($tranlator, 'remark')->textarea(['rows'=>3]) ?>
        <button class="btn btn-primary create-transator">添加</button>
    </div>
    <?php ActiveForm::end(); ?>

</div>

<script>
    //办理人json字符串
    var data = [<?= $model->isNewRecord ? "" : $model->getTransactorJson();?>];
</script>

<?php \common\widgets\Jsblock::begin() ?>

<script type="text/javascript">

    Array.prototype.del=function(value) {
        for (var i=0; i < this.length; i++) {

            if(value === this[i]) {
                this.splice(i,1);
            }
        }
    };

    Array.prototype.add = function(id, name) {
        for (var i=0; i<2; i++) {
            //保存添加人id
            if (!(this[i] instanceof Array)) {
                this[i] = [];
            }
            //保存添加人名字
            if (i) {
                this[i].push(name);
            }else{
                this[i].push(id);
            }
        }
        return this;
    };

    //当前选择的产品-套餐
    var currentProductCombo = [];
    var currentTransactor = [];
    //初始化currentTransactor
    for (i=0; i<data.length; i++) {
        currentTransactor.add(data[i].id,data[i].text);
    }
    var checkTer = {
        //判断是否重复
        'checkIsRepeat' : function(key) {

            if (currentProductCombo.length !== 0) {
                for (var i in currentProductCombo) {
                    if (currentProductCombo[i] === key) return false;
                }
            }
            currentProductCombo.push(key);
            //console.log(currentProductCombo);
            return true;
        }
    };

    //选择套餐
    $("#order-order_type").change(function() {
        var country_id = $('#order-cid').val();
        var order_type = $('#order-order_type').val();
        var url = '<?= \yii\helpers\Url::to(['product/my-product']);?>';
        var data = {country_id:country_id,type:order_type};

        $.getJSON(url, data, function(back) {
            var select = $('#order-combo_id');
            if (back.error === 'success') {
                select.empty();
                var str = '';
                for (var i in back.value) {
                    if ( i !=='del') {
                        str += ('<option value="' + back.value[i].combo_id + '">' +  back.value[i].combo_name + '</option>');
                    }
                }
                select.append(str);
            }else {
                select.empty();
                select.append('<option>该分类没有套餐<option>');
            }
        });
    });

    //弹窗显示添加
    $('.add-transator').click(function() {
        var html = "<div style='width: 80%;margin: 10px auto'>" + $('.transactor').html() + '</div>';
        //页面层
        layer.open({
            title:'添加办理人信息',
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            area: ['450px', '330px'], //宽高
            content: html
        });
    });

    //添加办理人
    $('body').on('click','.create-transator', function() {
        var content = $('.layui-layer-content');
        var name = content.find('#transator-name').val();
        var remark = content.find('#transator-remark').val();
        var _csrf = '<?= Yii::$app->request->getCsrfToken()?>';
        var data = {Transator:{name:name,_csrf:_csrf,remark:remark}};
        var url = '<?= \yii\helpers\Url::to(['transator/create-by-ajax'])?>';

        $.post(url, data, function(d){
            if(d.error === 'success') {
                var data = [];
                var selected = [];
                currentTransactor.add(d.data.tid, d.data.name);
                for (var i=0; i<currentTransactor[0].length; i++) {
                    data.push({id:currentTransactor[0][i],text:currentTransactor[1][i]});
                    selected.push(currentTransactor[0][i]);
                }
                //console.log(data);
                var transactor_select = $('.js-example-basic-multiple');
                transactor_select.select2({
                    data:data
                }).val(selected).trigger('change');

                layer.closeAll();
                layer.msg('添加成功',{time:1300},function(){
                    layer.closeAll();
                });

            }else {
                layer.msg(d.msg, function() {

                });
            }
        });
    });

    //默认选中
    var selected = [];
    for (var i in data) {
        selected.push(data[i].id);
    }
    var transactor_select = $('.js-example-basic-multiple');
    transactor_select.select2({
        data:data,
        placeholder: '请点击右侧加号添加',
        "language": {
            "noResults": function(){
                return "请点击右侧加号 :)";
            }
        }
    }).val(selected).trigger('change');

    transactor_select.on("change",function(e){
        // e 的话就是一个对象 然后需要什么就 “e.参数” 形式 进行获取
        // console.log(e);
    });
</script>

<?php \common\widgets\Jsblock::end()?>





