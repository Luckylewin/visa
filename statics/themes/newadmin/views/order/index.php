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
?>
<div class="order-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('创建订单', ['create'], ['class' => 'btn btn-primary']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'pager'=>[
            //'options'=>['class'=>'hidden']//关闭自带分页
            'firstPageLabel'=>"第一页",
            'prevPageLabel'=>'上一页',
            'nextPageLabel'=>'下一页',
            'lastPageLabel'=>'最后一页',
        ],
        'columns' => [
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
            [
                    'attribute' => 'order_classify',
                    'value' => function($model) {
                        $classify = Type::getComboClassify();
                        return $classify[$model->order_classify];
                    },
                    'filter' => Type::getComboClassify(),
                    'options' => ['style'=>'width:100px;']
            ],
            [
                    'attribute' => 'order_date',
                    'options' => ['style'=>'width:95px;']
            ],
            [
                'attribute' => 'transactor_name',
                'value' => function($model) {
                    return trim($model->transactor_name,'|');
                },
                'options' => ['style'=>'width:75px;']
            ],
            'customer_id',
            'order_num',

            'collect_date',
            'deliver_date',
            'entry_date',
            'putsign_date',
            'delivergood_date',


            'back_addressee',
            'back_telphone',
            'deliver_order',
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

