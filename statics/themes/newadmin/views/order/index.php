<?php

use yii\helpers\Html;
use yii\grid\GridView;
use common\models\Type;
use yii\widgets\Pjax;
use \yii\bootstrap\Modal;
/* @var $this yii\web\View */
/* @var $searchModel common\models\OrderQuery */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '订单列表';
$this->params['breadcrumbs'][] = $this->title;
$this->registerJsFile('/statics/themes/newadmin/js/plugins/layer/laydate/laydate.js', ['depends'=>['yii\web\JqueryAsset']]);
//$this->registerJsFile('/statics/themes/newadmin/js/plugins/layer/laydate-v5/laydate.js', ['depends'=>['yii\web\JqueryAsset']]);
$this->registerJsFile('/statics/themes/newadmin/js/plugins/layer/layer.min.js', ['depends'=>['yii\web\JqueryAsset']]);
?>

    <style>
        .btn-xs{margin-bottom:6px;}
    </style>

<div class="order-index">
    
    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <?= $this->render('_search', ['model' => $searchModel]); ?>
        

    <?php

    try {
        echo GridView::widget([
            'tableOptions' => ['class' => 'table table-hover table-bordered'],
            //分页
            'dataProvider' => $dataProvider,
            //'filterModel' => $searchModel,
            'options' => [
                "class" => "grid-view",
                "style" =>"overflow:auto",
                "id" => "grid"
            ],
            'pager'=>[
                'class' => 'common\widgets\goPager',
                'go' => true,
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
                    'options' => ['style'=>'width:108px;'],
                    'contentOptions' => [
                           'style'=>'font-size:8px;word-wrap:break-word;word-break:break-all;',
                    ],
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
                    'contentOptions' => ['style'=>'font-size:8px;'],
                ],
                //订单日期
                [
                    'label' => '日期',
                    'attribute' => 'order_date',
                    'value' => function($model) {
                        if ($model->order_date ) {
                            return str_replace('-','/', substr($model->order_date, 2));
                        } else {
                            return '-';
                        }

                    },
                    'options' => ['style'=>'width:70px;'],
                    'contentOptions' => ['style'=>'font-size:12px;'],
                ],

                //订单分类
                [
                    'label' => '分类',
                    'attribute' => 'order_classify',
                    'format' => 'raw',
                    'value' => function($model) {
                        try{
                            $classify = Type::getComboClassify();
                            $classifyIndex = $model->snapshot->combo_classify;
                            $classify = isset($classify[$classifyIndex]) ? $classify[$classifyIndex] : '未设置';
                            return Html::button(substr($classify,0,6), [
                                'class' => 'btn btn-info btn-xs'
                            ]);
                        }catch (\Exception $e) {
                            return "-";
                        }
                    },
                    'filter' => Type::getComboClassify(),
                    'options' => ['style'=>'width:34px;']
                ],

                //收资料日
                [
                    'attribute' => 'collect_date',
                    'value' => function($model) {
                        if ($model->collect_date ) {
                            return str_replace('-','/', substr($model->collect_date, 2));
                        } else {
                            return '-';
                        }

                    },
                    'options' => ['style'=>'width:85px;'],
                    'contentOptions' => ['style'=>'font-size:12px;'],
                ],

                //送证日
                [
                    'attribute' => 'deliver_date',
                    'value' => function($model) {
                        if ($model->deliver_date) {
                            return str_replace('-','/', substr($model->deliver_date, 2));
                        } else {
                            return '-';
                        }
                    },
                    'options' => ['style'=>'width:60px;'],
                    'contentOptions' => ['style'=>'font-size:12px;'],
                ],

                //入管日
                [
                    'attribute' => 'entry_date',
                    'value' => function($model) {
                        if ($model->entry_date ) {
                            return str_replace('-','/', substr($model->entry_date, 2));
                        } else {
                            return '-';
                        }
                    },
                    'options' => ['style'=>'width:60px;'],
                    'contentOptions' => ['style'=>'font-size:12px;'],
                ],
                [
                    'attribute' => 'combo_id',
                    'format' => 'raw',
                    'label' => '产品名称',
                    'value' => function($model) {
                        try {
                            $combo = $model->snapshot;
                            return Html::button($combo->combo_product, [
                                'class' => 'btn btn-default btn-xs combo-view',
                                'data-toggle' => 'modal',
                                'data-target' => '#show-modal',
                                'data-id'     => $combo->id,
                                'data-oid'    => $model->id
                            ]);
                        }catch (\Exception $e) {
                            return '<i class="fa fa-trash"></i>已被删除';
                        }
                    },
                    'options' => ['style'=>'width:80px;'],
                    'contentOptions' => ['style'=>'font-size:5px;'],
                ],
                //分类
                [
                    'attribute' => 'order_type',
                    'filter' => Type::getComboType(),
                    'format' => 'raw',
                    'value' => function($model) {
                        $type = Type::getComboType();
                        if ($model->order_type == 1) {
                            return Html::button('正常', [
                                'class' => 'btn btn-default btn-xs'
                            ]);
                        } else if($model->order_type == 2) {
                            return Html::button('加急', [
                                'class' => 'btn btn-warning btn-xs'
                            ]);
                        } else {
                            return Html::button('特急', [
                                'class' => 'btn btn-danger btn-xs'
                            ]);
                        }

                    },
                    'options' => ['style'=>'width:30px;']
                ],
                //接待销售
                [
                    'attribute' => 'custom_servicer_id',
                    'label' => '客服',
                    'format' => 'raw',
                    'value' => function($model){
                        if ($servicer = $model->servicer) {
                            return Html::a($servicer->name, \yii\helpers\Url::to(['servicer/view', 'id' => $servicer->id]));
                        } else {
                            return '-';
                        }
                    },
                    'options' => ['style'=>'width:55px;'],
                ],
                //办理人
                [
                    'attribute' => 'transactor_id',
                    'format' => 'raw',
                    'value' => function($model) {

                        $str = '<div>';
                        foreach ($model->middleTransator as $key => $transactor) {
                            $transactor = $transactor->transator;
                            $str .=  Html::a($transactor['name'], \yii\helpers\Url::to(['transator/view', 'id' => $transactor['tid']]), [
                                    'class' => 'label label-default label-xs',
                            ]);

                            if ($key!= 0 && ($key + 1) % 3 == 0) {
                                $str .= '</div><br/><div>';
                            } else {
                                $str .= '&nbsp;';
                            }
                        }

                        $str .= '</div>';

                        return $str;
                    },

                    'contentOptions' => ['style' => 'font-size:2px;']
                ],
                //套餐类型
                [
                    'attribute' => 'combo_id',
                    'label' => '套餐',
                    'format' => 'raw',
                    'value' => function($model) {
                        try {
                            $combo = $model->snapshot;
                            return Html::a($combo->combo_name, \yii\helpers\Url::to(['snapshot/view','id' => $combo->id]));
                        }catch (\Exception $e) {
                            return '<i class="fa fa-trash"></i>已被删除';
                        }
                    },
                    'contentOptions' => ['style' => 'font-size:8px;']

                ],
                [
                    'attribute' => 'single_sum',
                    'value' => function($model) {
                        return (int) $model->single_sum;
                    },
                    'label' => '单项实收'
                ],
                [
                    'attribute' => 'remark',
                    'format' => 'raw',
                    'value' => function($model) {
                        if ($model->remark) {
                            return Html::a('<i class="fa fa-bookmark"></i>',null, [
                                'id' => "remark-" . $model->id,
                                'class' => 'remark-show',
                                "text" => $model->remark
                            ]);
                        }
                        return '';
                    }
                ],
                //'entry_date',
                //'putsign_date',
                //'delivergood_date',
                //'back_addressee',
                //'back_telphone',
                //'deliver_order',
                [
                    'class' => 'common\grid\MyActionColumn',
                    'header' => '操作',
                    'options' => ['style'=>'width:160px;']
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
        ]);
    }catch (\Exception $e) {
        echo "发生错误";
    }

    ?>

</div>


<div class="progress progress-striped active" style="display: none">
    <div style="width: 0%" aria-valuemax="100" aria-valuemin="0" aria-valuenow="75" role="progressbar" class="progress-bar progress-bar-info" >
        <span class="sr-only">40% Complete (success)</span>
    </div>
</div>

<p>
    <?= Html::a('创建订单', ['create'], ['class' => 'btn btn-primary']) ?>
    <?= Html::button('导出excel', ['class' => 'btn btn-info', 'id'=>'export_link']) ?>
    <?= Html::a("批量删除", "javascript:void(0);", ["class" => "btn btn-danger gridview"]) ?>

    &nbsp; &nbsp; &nbsp; &nbsp; &nbsp;
    <?= Html::a('导入excel', \yii\helpers\Url::to(['excel/import']), ['class' => 'btn btn-info', 'id'=>'export_link']) ?>
</p>

<?php \common\widgets\Jsblock::begin() ?>
<script>

    $('.remark-show').click(function() {
        layer.tips($(this).attr('text'), "#" + $(this).attr('id'),{time: 5000, tipsMore: true, tips: [1, '#FF9933']});
    });

    $('tr').hover(function () {
        var td = $(this).find('td').eq(15);
        var obj = td.find('.remark-show');
        if (obj) {

        }
    });

    $(function(){
       $('.remark-show').click();
    });

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
            _this.attr("disabled", true);
            var percentUrl = '<?php echo \yii\helpers\Url::to(['excel/percent']); ?>';
            var url = '<?= \yii\helpers\Url::to(['excel/index','orderQuery' => $queryParams]);?>';
            url += ('&selected_id=' + keys);
            $('.progress-striped').slideDown();

            var timer = setInterval(function(){
                $.getJSON(percentUrl,"",function(d){
                    //console.log(d.data,d.memory);
                    if (d.data>0 && d.data <100) {
                        var width = d.data + '%';
                        $('.progress-bar').css('width', width);
                    }else if(d.data === 100) {
                        $('.progress-striped').slideUp(2000);
                        clearInterval(timer);
                        _this.attr("disabled", false);
                    }

                })
            },4000);
            //_this.attr('href', _this.attr('href') + '&selected_id=' + keys);
            window.location.href = url;
    });
</script>

<?php \common\widgets\Jsblock::end(); ?>


<?php
Modal::begin([
    'id' => 'show-modal',
    'size' => Modal::SIZE_DEFAULT,
    'header' => '<h4 class="modal-title">套餐详情</h4>',
    'footer' => '<a href="#" class="btn btn-default" data-dismiss="modal">关闭</a>',
]);
$requestUrl = \yii\helpers\Url::to(['snapshot/view']);
$requestJs=<<<JS
     $(document).on('click', '.combo-view', function() {
                var id = $(this).data('id');
                var oid = $(this).data('oid');
                
                $.get('{$requestUrl}', {'id':id, 'oid':oid},
                    function (data) {
                        $('.modal-body').css('min-height', '200px').html(data);
                    }
                )
            })
JS;
$this->registerJs($requestJs);
Modal::end();

