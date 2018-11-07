<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;
use yii\helpers\ArrayHelper;
use common\models\Servicer;
use common\models\Transator;
use \backend\models\Operator;
use \common\models\Type;


/* @var $this yii\web\View */
/* @var $model common\models\Order */
/* @var $form yii\widgets\ActiveForm */
$this->registerCssFile('/statics/themes/newadmin/js/plugins/select2/select2.min.css');
$this->registerJsFile('/statics/themes/newadmin/js/plugins/select2/select2.min.js', ['depends'=>['yii\web\JqueryAsset']]);
$this->registerJsFile('/statics/themes/newadmin/js/bootstrap.min.js', ['depends'=>['yii\web\JqueryAsset']]);
$this->registerJsFile('/statics/themes/newadmin/js/plugins/layer/layer.min.js', ['depends'=>['yii\web\JqueryAsset']]);
$this->registerJsFile('/statics/themes/newadmin/js/plugins/layer/laydate/laydate.js', ['depends'=>['yii\web\JqueryAsset']]);
$this->registerJsFile('/statics/themes/newadmin/js/plugins/suggest/bootstrap-suggest.min.js', ['depends'=>['yii\web\JqueryAsset']]);

$tranlator = new Transator();
?>

<?php \common\widgets\Cssblock::begin() ?>
<style>
    .control-label {
        min-width: 200px;
    }
    div.required label:after {
        content: " *";
        color: red;
        vertical-align: middle;
    }
    #order-transactor_id{
        max-height: 33px;
    }
</style>
<?php \common\widgets\Cssblock::end() ?>

<div class="order-form">

    <?php $form = ActiveForm::begin([
        'id' => 'form-id',
        'enableAjaxValidation' => $model->isNewRecord ? true : false, // 开启ajax验证
        'enableClientValidation' => true,
        'validationUrl' => \yii\helpers\Url::toRoute(['validate-form']),
    ]); ?>
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

    <div class="panel panel-info">
        <div class="panel-heading">
            <h3 class="panel-title"><b>填写订单信息</b></h3>
        </div>

        <div class="panel-body">
            <div class="col-md-3">

                <?= $form->field($model, 'order_classify')->dropDownList(\common\models\Type::getComboClassify(),[
                    'prompt' => '请选择产品',
                    'prompt_val' => '0',
                ]) ?>

                <?= $form->field($model, 'order_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

                <?php
                    if (Yii::$app->params['allow']['custom_servicer_id']) {
                        $servicer = ArrayHelper::map(Servicer::getValidPerson(),'id','name');
                    } else {
                        if ($model->isNewRecord) {
                            $servicer = Servicer::findOne(['admin_id' => Yii::$app->user->getId()]);
                        } else {
                            $servicer = Servicer::findOne(['id' => $model->custom_servicer_id]);
                        }
                        $servicer = [$servicer->id => $servicer->name];
                    }
                ?>

                <?= $form->field($model, 'custom_servicer_id')->dropDownList($servicer, [
                        'readonly' => Yii::$app->params['allow']['custom_servicer_id'] ? false : true
                ]); ?>

                <?= $form->field($model, 'order_num')->textInput() ?>

                <?= $form->field($model, 'pid')->dropDownList(ArrayHelper::map(\common\models\Product::find()->orderBy('id desc')->all(), 'id' ,'name'),[
                    'disabled' => $model->isNewRecord ? false : false,
                    'prompt' => '请选择产品',
                    'prompt_val' => '0',
                ])->label('产品'); ?>

                <?= $form->field($model, 'order_type')->dropDownList(Type::getComboType(), [
                    'prompt' => '请选择分类',
                    'prompt_val' => '0',
                    'disabled' => $model->isNewRecord ? false : false
                ]) ?>


                <?php if($model->isNewRecord): ?>
                    <?= $form->field($model, 'combo_id')->dropDownList([], ['prompt' => '请选择套餐'])->label('套餐'); ?>
                <?php else: ?>
                    <?= $form->field($model, 'combo_id')->dropDownList(ArrayHelper::map(\common\models\Snapshot::findAll(['id'=>$model->combo_id]),'id','combo_name'), [
                        'disabled' => $model->isNewRecord ? false : false
                    ])->label('当前套餐'); ?>
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
                        'style' => 'max-width:210px;',
                        'multiple' => "multiple",
                    ]); ?>

                    <i class="fa fa-plus-square-o add-transator" style="position: absolute;top: 42%;left: 89%;font-size: 36px;cursor: pointer"></i>
                </div>

                <?= $form->field($model, 'customer_id')->textInput() ?>

                <div style="margin-top: 540px;"></div>

                <div class="col-md-6">
                    <?= $form->field($model, 'balance_sum')->textInput(['maxlength' => true,'placeholder'=>'￥']) ?>

                    <?= $form->field($model, 'flushphoto_sum')->textInput(['maxlength' => true,'placeholder'=>'￥']) ?>

                    <?= $form->field($model, 'carrier_sum')->textInput(['maxlength' => true, 'placeholder'=>'￥']) ?>
                </div>

                <div class="col-md-6">
                    <?= $form->field($model, 'output_balance_sum')->textInput(['maxlength' => true, 'placeholder'=>'￥']) ?>

                    <?= $form->field($model, 'output_flushphoto_sum')->textInput(['maxlength' => true, 'placeholder'=>'￥']) ?>

                    <?= $form->field($model, 'output_carrier_sum')->textInput(['maxlength' => true, 'placeholder'=>'￥']) ?>
                </div>


            </div>

            <div class="col-md-3">

                <?= $form->field($model, 'collect_date')->textInput([
                    'class' => 'form-control layer-date date-status',
                    'status' => '2',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

                <?= $form->field($model, 'deliver_date')->textInput([
                    'class' => 'form-control layer-date date-status',
                    'status' => '3',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

                <?= $form->field($model, 'entry_date')->textInput([
                    'class' => 'form-control layer-date date-status',
                    'status' => '4',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

                <?= $form->field($model, 'putsign_date')->textInput([
                    'class' => 'form-control layer-date date-status',
                    'status' => '5',
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

                <?= $form->field($model, 'audit_status')->dropDownList(Type::getStatus(), [
                    'style' => 'max-width:350px;',
                    'readonly' => true
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

                <?= $form->field($model, 'company_receipt_date')->textInput([
                    'class' => 'form-control layer-date',
                    'placeholder' => '请选择日期',
                    'onclick' => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                    'style' => 'display:block!important;max-width:350px!important'
                ]) ?>

                <?= $form->field($model, 'pay_account')->textInput(); ?>

                <?php if(Type::isSuperAdmin()): ?>
                    <?= $form->field($model, 'refund_status')->radioList(Type::getRefundStatus()); ?>
                    <?= $form->field($model, 'draw_bill_status')->radioList(Type::getYesOrNo()); ?>
                <?php else: ?>
                    <?= $form->field($model, 'refund_status')->radioList(Type::getRefundStatus(), ['itemOptions' => ['disabled' => true]]); ?>
                    <?= $form->field($model, 'draw_bill_status')->radioList(Type::getYesOrNo(),  ['itemOptions' => ['disabled' => true]]); ?>
                <?php endif ?>


                <?php if(\common\models\Type::isSuperAdmin()): ?>
                <?= $form->field($model, 'operator_id')->dropDownList(Operator::getAllOperator(), [
                        'prompt' => '请选择操作员'
                    ]); ?>
                <?php elseif (\common\models\Type::isOperator()): ?>
                    <?= $form->field($model, 'operator_id')->dropDownList(Operator::getCurrentOperator(Yii::$app->user->getId()), [
                            'disabled' => true,
                            'readonly' => true
                    ]); ?>
                <?php else: ?>
                    <?= $form->field($model, 'operator_id')->dropDownList(Operator::getCurrentOperator($model->operator_id), [
                        'disabled' => true,
                        'readonly' => true
                    ]); ?>
                <?php endif; ?>

            </div>
        </div>
    </div>


    <div class="form-group">
        <?= Html::submitButton($model->isNewRecord ? '创建' : '更新', ['class' => $model->isNewRecord ? 'btn btn-success' : 'btn btn-primary']) ?>

        <?= Html::a('返回', strpos(Yii::$app->request->referrer,'r=') !== false ? Yii::$app->request->referrer : \yii\helpers\Url::to(['index/index']), ['class' => 'btn btn-default']) ?>

    </div>

    <?php ActiveForm::end(); ?>

    <?php $form = ActiveForm::begin(); ?>
    <!--   layer隐藏页面层     -->

    <div class="transactor hide" id="add-transactor">
        <div style="width: 86%;margin: 10px auto">
            <label for="taobao">姓名</label>
            <div class="input-group" >
                <input onkeydown="if(event.keyCode === 13){return false;}" type="text" name="Transator[name]" placeholder="搜索或者新输入" class="form-control" id="transator-name">
                <div class="input-group-btn">
                    <button type="button" class="btn btn-default dropdown-toggle" data-toggle="dropdown">
                        <span class="caret"></span>
                    </button>
                    <ul class="dropdown-menu dropdown-menu-right" role="menu">
                    </ul>
                </div>
            </div>

            <?= $form->field($tranlator, 'remark')->textarea(['rows'=>3]) ?>
            <input type="hidden" id="originRemark">
            <input type="hidden" id="isNewTransactor" value="1">
            <button class="btn btn-primary create-transator">添加</button>
            <button class="btn btn-default cancel-create-transator">取消</button>
        </div>
    </div>
    <?php ActiveForm::end(); ?>

</div>

<script>
    //办理人json字符串
    var data = [<?= $model->isNewRecord ? "" : $model->getTransactorJson();?>];
</script>

<?php \common\widgets\Jsblock::begin() ?>

<script type="text/javascript">

    //当前选择的产品-套餐
    var currentProductCombo = [];
    var currentTransactor = [];
    var isNewTransactor = false;

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
            } else {
                this[i].push(id);
            }
        }
        return this;
    };


    function updateSelect2(id,name)
    {
        var data = [];
        var selected = [];
        currentTransactor.add(id,name);
        for (var i=0; i<currentTransactor[0].length; i++) {
            data.push({id:currentTransactor[0][i],text:currentTransactor[1][i]});
            selected.push(currentTransactor[0][i]);
        }
        //console.log(data);
        var transactor_select = $('.js-example-basic-multiple');
        transactor_select.select2({
            data:data
        }).val(selected).trigger('change');
    }


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

    //搜索建议
    var Suggest = $("#transator-name").bsSuggest({
        //url :'http://suggest.taobao.com/sug?code=utf-8&extras=1&q=',
        url:"<?= \yii\helpers\Url::to(['transator/query','q'=>''])?>",
        indexId: 1, //data.value 的第几个数据，作为input输入框的内容
        indexKey: 2, //data.value 的第几个数据，作为input输入框的内容
        allowNoKeyword: false, //是否允许无关键字时请求数据
        multiWord: true, //以分隔符号分割的多关键字支持
        separator: ",", //多关键字支持时的分隔符，默认为空格
        getDataMethod: "url", //获取数据的方式，总是从 URL 获取
        effectiveFields: ["Id", "Keyword",'Count','Remark'],
        delay: 100,
        effectiveFieldsAlias: {
            Id: "序号",
            Keyword: "办理人ID",
            Count: "姓名",
            Remark : "个人信息"
        },
        //UI
        inputWarnColor: 'rgba(255,0,0,.1)',
        showHeader: true,
        /*优先从url ajax 请求 json 帮助数据，注意最后一个参数为关键字请求参数*/
        jsonp: 'callback',
        /*如果从 url 获取数据，并且需要跨域，则该参数必须设置*/
        fnProcessData: function (json) { // url 获取数据时，对数据的处理，作为 getData 的回调函数

            var i, len, data = {
                value: []
            };

            if (!json || !json.result || json.result.length == 0) {
                return false;
            }

            console.log(json.result[0]);


            len = json.result.length;
            if (len === 0) {
                isNewTransactor = false;
            }
            for (i = 0; i < len; i++) {
                data.value.push({
                    "Id": (i + 1),
                    "Keyword": json.result[i][0],
                    "Count"  : json.result[i][1],
                    "Remark" : json.result[i][2]
                });
            }
            //console.table(data);

            return data;
        }
    }).on('onSetSelectValue', function (e, keyword, data) {
        $('#transator-name').attr('disabled',true);
        $('#transator-remark').val(data.Remark);
        $('#originRemark').val(data.Remark);
        isNewTransactor = keyword.id;
        //远程加载数据
    }).on('onUnsetSelectValue', function (e) {
        isNewTransactor = false;
    });

    var select = {
        change:function() {
            var order_classify = $('#order-order_classify').val();
            var product_id = $('#order-pid').val();
            var order_type = $('#order-order_type').val();
            var url = '<?= \yii\helpers\Url::to(['product/my-product']);?>';
            var data = {product_id:product_id,type:order_type,classify:order_classify};

            if (!order_type) {
                if (!product_id) {
                    $('#order-pid').focus();
                }else if(!order_type) {
                    $('#order-order_type').focus();
                }
                return false;
            }

            $.getJSON(url, data, function(back) {
                var select = $('#order-combo_id');
                if (back.error === 'success') {
                    select.empty();
                    var str = '';
                    for (var i in back.value) {
                        if ( typeof (back.value[i].combo_id) !== 'undefined') {
                            str += ('<option value="' + back.value[i].combo_id + '">' +  back.value[i].combo_name + '</option>');
                        }
                    }
                    select.append(str);
                }else {
                    select.empty();
                    select.append('<option>该分类没有套餐<option>');
                }
            });
        }
    };

    //选择套餐
    $("#order-order_type").change(function() {
       select.change();
    });

    $("#order-pid").change(function() {
        select.change();
    });

    $("#order-order_classify").change(function() {
       select.change();
    });

    //弹窗显示添加
    $('.add-transator').click(function() {
        //var html = "<div style='width: 80%;margin: 10px auto'>" + $('.transactor').html() + '</div>';
        //页面层
        layer.open({
            title:'添加办理人信息',
            type: 1,
            skin: 'layui-layer-rim', //加上边框
            area: ['600px', '330px'], //宽高
            content: $('#add-transactor'),
            success: function(layero, index){
                // 移除hide
                $('.layui-layer-content').find('#add-transactor').removeClass('hide');
                // 初始化
                $('#transator-name').attr('disabled', false).val('');
                $('#transator-remark').val('');
            }
        });
    });

    $('.cancel-create-transator').click(function() {
       layer.closeAll();
       return false;
    });

    //添加办理人
    $('.create-transator').click(function() {

        var content = $('.layui-layer-content');
        var name = content.find('#transator-name').val();
        var remark = content.find('#transator-remark').val();
        var _csrf = '<?= Yii::$app->request->getCsrfToken()?>';
        var data = {Transator:{name:name,_csrf:_csrf,remark:remark}};
        var url = '<?= \yii\helpers\Url::to(['transator/create-by-ajax'])?>';
        var tid = isNewTransactor;

        //如果不是新增办理人
        if ( tid !== false) {
            updateSelect2(tid, name);
            layer.closeAll();
            isNewTransactor = false;
            if (remark !== $('#originRemark').val()) {
                var _url = '<?= \yii\helpers\Url::to(['transator/update-by-ajax'])?>';
                var _data = {Transator:{tid:tid,remark:remark,_csrf:_csrf}};
                $.post(_url,_data);
            }
            layer.msg('添加成功',{time:1000},function(){
                layer.closeAll();
            });
            return false;
        }

        $.post(url, data, function(d){
            if(d.error === 'success') {
                updateSelect2(d.data.tid, d.data.name);
                layer.closeAll();
                layer.msg('添加成功',{time:1300},function(){
                    layer.closeAll();
                });

            }else {
                layer.msg(d.msg, function() {

                });
            }
        });

        return false;
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

    function change()
    {
        var statusSelector = $('#order-audit_status');
        var curStatus = statusSelector.find("option:selected").val();
        var date_status = $('.date-status');
        var newOne = 1;
        var emptyData = [];

        for (var i=0; i < date_status.length; i++) {
            var val = date_status.eq(i).val();
            var nowInput = date_status.eq(i).attr('status');

            if (val) {
                if (nowInput > curStatus) {
                    newOne = nowInput;
                } else {
                    newOne = curStatus;
                }
            } else {
                emptyData.push(nowInput);
            }
        }
            console.log(emptyData);


        if (emptyData.length >= 1) {

        }else {
            newOne = 5;
        }

        statusSelector.find("option").attr("selected",false);
        statusSelector.find("option[value='" + newOne +"']").prop("selected",true);

    }

    $('.date-status').blur(function() {
        setTimeout(function(){
           change();
        },300);
    });

</script>


<?php \common\widgets\Jsblock::end()?>
