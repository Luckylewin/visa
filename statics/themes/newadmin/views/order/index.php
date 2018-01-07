<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\OrderQuery */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Orders';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="order-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Order', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'order_classify',
            'order_date',
            'customer_id',
            'order_num',

            'collect_date',
            'deliver_date',
            'entry_date',
            'putsign_date',
            'delivergood_date',

            'transactor_name',
            'back_addressee',
            'back_telphone',
            'deliver_order',

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


            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
