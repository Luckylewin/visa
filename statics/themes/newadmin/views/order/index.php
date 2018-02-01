<?php

use yii\helpers\Html;
use yii\grid\GridView;
use common\models\Type;
use common\models\Country;

/* @var $this yii\web\View */
/* @var $searchModel common\models\OrderQuery */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '订单列表';
$this->params['breadcrumbs'][] = $this->title;
$this->registerJsFile('/statics/themes/newadmin/js/plugins/layer/laydate/laydate.js', ['depends'=>['yii\web\JqueryAsset']]);
$this->registerJsFile('/statics/themes/newadmin/js/plugins/layer/layer.min.js', ['depends'=>['yii\web\JqueryAsset']]);
?>

<?php \common\widgets\Cssblock::begin() ?>

<?php \common\widgets\Cssblock::end() ?>

<div class="order-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <?= $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
         //分页
        'dataProvider' => $dataProvider,
        //'filterModel' => $searchModel,
        'options' => [
                "class" => "grid-view",
                "style" =>"overflow:auto",
                "id" => "grid"
        ],
        'pager'=>[
            //'options'=>['class'=>'hidden']//关闭自带分页
            'firstPageLabel'=>"第一页",
            'prevPageLabel'=>'上一页',
            'nextPageLabel'=>'下一页',
            'lastPageLabel'=>'最后一页',
        ],
        'columns' => [
            [
                "class" => "yii\grid\CheckboxColumn",
                "name" => "id",
            ],
            ['class' => 'yii\grid\SerialColumn'],
            //客人ID
            [
                    'attribute' => 'customer_id',
                    'label' => '客户ID',
            ],
            //淘宝订单号
            [
                    'attribute' => 'order_num',
                    'format' => 'raw',
                    'label' => '淘宝订单',
                    'value' => function($model) {
                        if (strpos($model->order_num,',')) {
                          return str_replace(',','<br/>', $model->order_num);
                        }
                        return $model->order_num;
                    },
            ],
            //订单日期
            [
                'attribute' => 'order_date',
                'value' => function($model) {
                    if ($model->order_date ) {
                        return str_replace('-','/', substr($model->order_date, 2));
                    }

                },
                'options' => ['style'=>'width:90px;']
            ],

            //订单分类
            [
                    'attribute' => 'order_classify',
                    'value' => function($model) {
                        $classify = Type::getComboClassify();
                        $classify = isset($classify[$model->order_classify]) ? $classify[$model->order_classify] : '未设置';
                        return $classify;
                    },
                    'filter' => Type::getComboClassify(),
                    'options' => ['style'=>'width:54px;']
            ],

            //收资料日
            [
                'attribute' => 'collect_date',
                'value' => function($model) {
                    if ($model->collect_date ) {
                        return str_replace('-','/', substr($model->collect_date, 2));
                    }

                },
                'options' => ['style'=>'width:90px;']
            ],

            //送证日
            [
                'attribute' => 'deliver_date',
                'value' => function($model) {
                    if ($model->deliver_date) {
                        return str_replace('-','/', substr($model->deliver_date, 2));
                    }
                },
                'options' => ['style'=>'width:90px;']
            ],

            //入管日
            [
                'attribute' => 'entry_date',
                'value' => function($model) {
                    if ($model->entry_date ) {
                        return str_replace('-','/', substr($model->entry_date, 2));
                    }
                },
                'options' => ['style'=>'width:90px;']
            ],
            [
                'attribute' => 'combo_id',
                'format' => 'raw',
                'label' => '产品名称',
                'value' => function($model) {
                    try {
                        $combo = $model->snapshot;
                        return Html::a($combo->combo_product, \yii\helpers\Url::to(['snapshot/view','id' => $combo->id]));
                    }catch (\Exception $e) {
                        return '<i class="fa fa-trash"></i>已被删除';
                    }
                },
                'options' => ['style'=>'width:120px;']
            ],
            //分类
            [
                 'attribute' => 'order_type',
                 'filter' => Type::getComboType(),
                 'value' => function($model) {
                    $type = Type::getComboType();
                    return $type[$model->order_type];
                 },
                'options' => ['style'=>'width:54px;']
            ],
            //接待销售
            [
                'attribute' => 'custom_servicer_id',
                'format' => 'raw',
                'value' => function($model){
                    $servicer = $model->servicer;
                    return Html::a($servicer->name, \yii\helpers\Url::to(['servicer/view', 'id' => $servicer->id]));
                },
                'options' => ['style'=>'width:60px;']
            ],
            //办理人
            [
                'attribute' => 'transactor_id',
                'format' => 'raw',
                'value' => function($model) {
                    $transactors = $model->relatedTransactor;

                    $str = '';
                    foreach ($transactors as $transactor) {
                        $str .= Html::a($transactor['name'], \yii\helpers\Url::to(['transator/view', 'id' => $transactor['tid']])) . "&nbsp;";
                    }
                    return $str;
                },
                'options' => ['style'=>'width:125px;']
            ],
            //套餐类型
            [
                'attribute' => 'combo_id',
                'format' => 'raw',
                'value' => function($model) {
                    try {
                        $combo = $model->snapshot;
                        return Html::a($combo->combo_name, \yii\helpers\Url::to(['snapshot/view','id' => $combo->id]));
                    }catch (\Exception $e) {
                        return '<i class="fa fa-trash"></i>已被删除';
                    }
                },
            ],
            [
                    'attribute' => 'single_sum',
                    'label' => '单项实收'
            ],

            //'entry_date',
            //'putsign_date',
            //'delivergood_date',
            //'back_addressee',
            //'back_telphone',
            //'deliver_order',
            [
                    'class' => 'yii\grid\ActionColumn',
                    'header' => '操作',
                    'options' => ['style'=>'width:105px;']
            ],
            // 'id',
            //'pid',
            // 'order_type',
            // 'combo_id',
            // 'custom_servicer_id',
            // 'transactor_id',
            // 'single_sum',
            // 'total_person',
            // 'balance_order',
            // 'balance_sum',
            // 'flushphoto_order',
            // 'flushphoto_sum',
            // 'carrier_order',
            // 'carrier_sum',
            // 'operator',
            // 'back_address:ntext',
            // 'delivercompany_id',
            // 'remark:ntext',
            // 'receipt_date',
            // 'pay_date',
            // 'audit_status',
        ],
    ]); ?>
</div>

<p>
    <?= Html::a('创建订单', ['create'], ['class' => 'btn btn-primary']) ?>
    <?= Html::a('导出excel', \yii\helpers\Url::to(['excel/index','orderQuery' => $queryParams]), ['class' => 'btn btn-info', 'id'=>'export_link']) ?>
    <?= Html::a("批量删除", "javascript:void(0);", ["class" => "btn btn-warning gridview"]) ?>

    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <?= Html::a('导入excel', \yii\helpers\Url::to(['excel/import']), ['class' => 'btn btn-info', 'id'=>'export_link']) ?>
</p>

<?php \common\widgets\Jsblock::begin() ?>
<script>
    $(".gridview").on("click", function () {
        var keys = $("#grid").yiiGridView("getSelectedRows");
        if (keys.length < 1) {
            layer.msg("没有选中任何数据");
            return false;
        }

        var ids = {ids:keys};

        layer.confirm('确定要删除勾选的选项吗', {
            title: '<i class="fa fa-warning" style="color: #953b39"></i> 操作警告',
            btn: ['确定','取消'] //按钮
        }, function() {
            var url = '<?= \yii\helpers\Url::to(['order/delete-all']);?>';

            $.post(url,ids,function(b){
                if (b.code === '0') {
                    window.location.href = '<?= \yii\helpers\Url::to(['order/index']);?>'
                }else{
                    layer.alert('删除失败', {
                        icon: 2
                    });
                }
            },'json');
        });
    });

    //选中导出
    $('#export_link').click(function() {
            var keys = $("#grid").yiiGridView("getSelectedRows");
            var _this = $(this);
            _this.attr('href', _this.attr('href') + '&selected_id=' + keys);
    });
</script>

<?php \common\widgets\Jsblock::end(); ?>

