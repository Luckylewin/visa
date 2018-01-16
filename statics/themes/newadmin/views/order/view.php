<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Order */

$this->title = $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Orders', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="order-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
//            'pid',
            'order_classify',
            'order_type',
            'order_date',
            'customer_id',
            [
                    'attribute' => 'cid',
                    'value' => $model->country->cinfo
            ],
            'combo_id',
            'custom_servicer_id',
            'transactor_id',
            'transactor_name',
            'single_sum',
            'total_person',
            'balance_order',
            'balance_sum',
            'flushphoto_order',
            'flushphoto_sum',
            'carrier_order',
            'carrier_sum',
            'collect_date',
            'deliver_date',
            'entry_date',
            'putsign_date',
            'operator',
            'back_address:ntext',
            'back_addressee',
            'back_telphone',
            'delivergood_date',
            'deliver_order',
//            'delivercompany_id',
            'delivercompany',
            'remark:ntext',
            'receipt_date',
            'pay_date',
            'audit_status',
        ],
    ]) ?>

</div>
