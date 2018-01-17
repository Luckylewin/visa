<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use common\models\Type;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model common\models\Order */

$this->title = $model->order_num;
$this->params['breadcrumbs'][] = ['label' => '订单列表', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

?>
<div class="order-view">

    <h1>订单详情</h1>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
       //     'id',
//            'pid',
            [
                    'attribute' => 'order_classify',
                    'value' => function($model) {
                        $classify = Type::getComboClassify();
                        return $classify[$model->order_classify];
                    }
            ],
            [
                'attribute' => 'order_type',
                'value' => function($model) {
                    $type = Type::getComboType();
                    return $type[$model->order_classify];
                }
            ],
            'order_num',
            'order_date',
            'customer_id',
            [
                    'attribute' => 'cid',
                    'value' => $model->country->cinfo
            ],
            [
                    'attribute' => 'combo_id',
                    'format' => 'raw',
                    'value' => function($model) {
                           $combo = $model->combo;
                           return Html::a($combo->combo_name, Url::to(['combo/view', 'id' => $combo->combo_id]));
                    },
            ],
            [
                    'attribute' => 'combo_id',
                    'value' => $model->combo->combo_cost . "元",
                    'label' => '支出成本'
            ],
            [
                    'attribute' => 'custom_servicer_id',
                    'format' => 'raw',
                    'value' => function($model){
                        $servicer = $model->servicer;
                        return Html::a($servicer->name, Url::to(['servicer/view', 'id' => $servicer->id]));
                    },
            ],
            [
                'attribute' => 'transactor_name',
                'format' => 'raw',
                'value' => function($model) {
                    $str = '';
                    $transactor = $model->transactor;
                    if (!empty($transactor)) {
                        foreach ($transactor as $_transactor) {
                            $str .= Html::a($_transactor->name, \yii\helpers\Url::to(['transator/view','id' => $_transactor->tid])) . "&nbsp;";
                        }
                    }
                    return $str;
                }
            ],
            [
                    'attribute' => 'single_sum',
                    'value' => $model->single_sum . "元"
            ],
            [
                'attribute' => 'total_person',
                'value' => $model->total_person . "人"
            ],

            'balance_order',
            [
                'attribute' => 'balance_sum',
                'value' => $model->balance_sum . "元"
            ],

            'flushphoto_order',
            [
                'attribute' => 'flushphoto_sum',
                'value' => $model->flushphoto_sum . "元"
            ],

            'carrier_order',
            [
                'attribute' => 'carrier_sum',
                'value' => $model->carrier_sum . "元"
            ],

            'collect_date',
            'deliver_date',
            'entry_date',
            'putsign_date',
             [
                 'attribute' => 'operator_id',
                 'value' => $model->operator->username
             ],
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
            [
                    'attribute' => 'audit_status',
                    'value' => function($model) {
                        $status = \common\models\Type::getStatus();
                        return $status[$model->audit_status];
                    }
            ],
            [
                    'attribute' => 'created_at',
                    'value' => function($model) {
                        return date('Y-m-d H:i:s', $model->created_at);
                    }
            ],
            [
                'attribute' => 'updated_at',
                'value' => function($model) {
                    return date('Y-m-d H:i:s', $model->updated_at);
                    }
            ]
        ],
    ]) ?>

    <p>
        <?= Html::a('编辑', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('删除', ['delete', 'id' => $model->id], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => 'Are you sure you want to delete this item?',
                'method' => 'post',
            ],
        ]) ?>
    </p>
</div>
