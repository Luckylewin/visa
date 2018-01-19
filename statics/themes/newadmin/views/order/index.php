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
?>


<div class="order-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>



    <?= $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
//        'filterModel' => $searchModel,
        'pager'=>[
            //'options'=>['class'=>'hidden']//关闭自带分页
            'firstPageLabel'=>"第一页",
            'prevPageLabel'=>'上一页',
            'nextPageLabel'=>'下一页',
            'lastPageLabel'=>'最后一页',
        ],
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            //客人ID
            [
                    'attribute' => 'customer_id',
                    'label' => '客户ID'
            ],
            //淘宝订单号
            [
                    'attribute' => 'order_num',
                    'label' => '淘宝订单号'
            ],
            //订单日期
            [
                'attribute' => 'order_date',
                'value' => function($model) {
                    if ($model->order_date != '0000-00-00') {
                        return $model->order_date;
                    }

                },
                'options' => ['style'=>'width:100px;']
            ],

            //订单分类
            [
                    'attribute' => 'order_classify',
                    'value' => function($model) {
                        $classify = Type::getComboClassify();
                        return $classify[$model->order_classify];
                    },
                    'filter' => Type::getComboClassify(),
                    'options' => ['style'=>'width:100px;']
            ],

            //收资料日
            [
                'attribute' => 'collect_date',
                'value' => function($model) {
                    if ($model->collect_date != '0000-00-00') {
                        return $model->collect_date;
                    }

                },
                'options' => ['style'=>'width:100px;']
            ],

            //送证日
            [
                'attribute' => 'deliver_date',
                'value' => function($model) {
                    if ($model->deliver_date != '0000-00-00') {
                        return $model->deliver_date;
                    }
                },
                 'options' => ['style'=>'width:100px;']
            ],

            //入管日
            [
                'attribute' => 'entry_date',
                'value' => function($model) {
                    if ($model->entry_date != '0000-00-00') {
                        return $model->entry_date;
                    }
                },
                'options' => ['style'=>'width:100px;']
            ],

            //国家ID
            [
                'attribute' => 'cid',
                'value' => 'country.cinfo',
                'filter' => Country::find()
                    ->select(['cinfo','id'])
                    ->orderBy('id desc')
                    ->indexBy('id')
                    ->column(),
                'options' => ['style'=>'width:95px'],
            ],
            //分类
            [
                 'attribute' => 'order_type',
                 'filter' => Type::getComboType(),
                 'value' => function($model) {
                    $type = Type::getComboType();
                    return $type[$model->order_type];
                 },
                'options' => ['style'=>'width:100px;']
            ],
            //接待销售
            [
                'attribute' => 'custom_servicer_id',
                'format' => 'raw',
                'value' => function($model){
                    $servicer = $model->servicer;
                    return Html::a($servicer->name, \yii\helpers\Url::to(['servicer/view', 'id' => $servicer->id]));
                },
                'options' => ['style'=>'width:100px;']
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
            'single_sum',

            //'entry_date',
            //'putsign_date',
            //'delivergood_date',
            //'back_addressee',
            //'back_telphone',
            //'deliver_order',
            [
                    'class' => 'yii\grid\ActionColumn',
                    'header' => '操作',
                    'options' => ['style'=>'width:75px;']
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
</p>


