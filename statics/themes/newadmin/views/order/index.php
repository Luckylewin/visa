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
                    'attribute' => 'customer_id',
                    'label' => '客户ID'
            ],

            [
                    'attribute' => 'order_num',
                    'label' => '淘宝订单号'
            ],

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
                'value' => function($model) {
                    if ($model->order_date != '0000-00-00') {
                        return $model->order_date;
                    }

                }
            ],
           
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
                'attribute' => 'transactor_id',
                'format' => 'raw',
                'value' => function($model) {
                   $transactors = $model->relatedTransactor;

                   $str = '';
                   foreach ($transactors as $transactor) {
                       $str .= Html::a($transactor['name'], \yii\helpers\Url::to('transator/view', ['id' => $transactor['tid']])) . "&nbsp;";
                   }
                   return $str;
                },
                'options' => ['style'=>'width:125px;']
            ],

            [
                'attribute' => 'collect_date',
                'value' => function($model) {
                    if ($model->collect_date != '0000-00-00') {
                        return $model->collect_date;
                    }

                }
            ],
            [
                'attribute' => 'deliver_date',
                'value' => function($model) {
                    if ($model->deliver_date != '0000-00-00') {
                        return $model->deliver_date;
                    }

                }
            ],

            //'entry_date',
            //'putsign_date',
            //'delivergood_date',
            //'back_addressee',
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


