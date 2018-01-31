<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use common\models\Type;
use yii\helpers\Url;

/* @var $this yii\web\View */
/* @var $model common\models\Order */

$this->title = $model->id;
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
                        return isset($classify[$model->order_classify]) ? $classify[$model->order_classify] : '未设置';
                    }
            ],
            [
                'attribute' => 'order_type',
                'value' => function($model) {
                    $type = Type::getComboType();
                    return isset($type[$model->order_type]) ? $type[$model->order_type] : '未设置';
                }
            ],
            'order_num',
            'order_date',
            'customer_id',
            [
                    'attribute' => 'combo_id',
                    'format' => 'raw',
                    'value' => function($model) {
                           try {
                                $combo = $model->snapshot;
                                return Html::a($combo->combo_product ."|".Type::getComboType()[$combo->combo_type] . "|" .  $combo->combo_name, Url::to(['snapshot/view','id' => $combo->id]));
                           }catch (\Exception $e) {
                               return '<i class="fa fa-trash"></i>已被删除';
                           }
                    },
            ],
            [
                    'attribute' => 'combo_id',
                    'format' =>'raw',
                    'value' => function($model) {
                        try {
                            return $model->snapshot->combo_cost . "元";
                        }catch (\Exception $e) {
                            return '<i class="fa fa-trash"></i>已被删除';
                        }
                    },
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
                'attribute' => 'transactor_id',
                'format' => 'raw',
                'value' => function($model) {
                    $str = '';
                    $transactor = $model->relatedTransactor;
                    if (!empty($transactor)) {
                        foreach ($transactor as $_transactor) {
                            $str .= Html::a($_transactor['name'], \yii\helpers\Url::to(['transator/view','id' => $_transactor['tid']])) . "&nbsp;";
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

            [
                 'attribute' => 'balance_order',
                 'format' => 'raw',
                 'value' => function($model) {
                    if (!empty($model->balance_order)) {
                        return $model->balance_order;
                    }
                    return '-';
                 }
            ],
            [
                'attribute' => 'balance_sum',
                'value' => function($model) {
                    if ($model->balance_sum != '0.000') {
                        return $model->balance_sum . "元";
                    }
                    return "-";
                }
            ],

            [
                'attribute' => 'output_balance_sum',
                'value' => function($model) {
                    if ($model->output_balance_sum != '0.000') {
                        return $model->output_balance_sum . "元";
                    }
                    return "-";
                }
            ],



            [
                'attribute' => 'flushphoto_order',
                'value' => function($model) {
                    if ($model->flushphoto_order) {
                        return $model->flushphoto_order;
                    }
                    return "-";
                }
            ],

            [
                'attribute' => 'flushphoto_sum',
                'value' => function($model) {
                    if ($model->flushphoto_sum != '0.00') {
                        return $model->flushphoto_sum . "元";
                    }
                    return "-";
                }
            ],

            [
                'attribute' => 'output_flushphoto_sum',
                'value' => function($model) {
                    if ($model->output_flushphoto_sum != '0.00') {
                        return $model->output_flushphoto_sum . "元";
                    }
                    return "-";
                }
            ],

            [
                'attribute' => 'carrier_order',
                'value' => function($model) {
                    if ($model->carrier_order) {
                        return $model->carrier_order;
                    }
                    return "-";
                }
            ],

            [
                'attribute' => 'carrier_sum',
                'value' => function($model) {
                    if ($model->carrier_sum != '0.00') {
                        return $model->carrier_sum . "元";
                    }
                    return "-";
                }
            ],

            [
                'attribute' => 'output_carrier_sum',
                'value' => function($model) {
                    if ($model->output_carrier_sum != '0.00') {
                        return $model->output_carrier_sum . "元";
                    }
                    return "-";
                }
            ],


            [
               'attribute' => 'collect_date',
               'value' => function($model) {
                   if ($model->collect_date != '0000-00-00') {
                        return $model->collect_date;
                   }
                   return '-';
                },

            ],
            [
                'attribute' => 'deliver_date',
                'value' => function($model) {
                    if ($model->deliver_date != '0000-00-00') {
                        return $model->deliver_date;
                    }
                    return '-';
                }
            ],

            [
                'attribute' => 'entry_date',
                'value' => function($model) {
                    if ($model->entry_date != '0000-00-00') {
                        return $model->entry_date;
                    }
                    return '-';
                }
            ],

            [
                'attribute' => 'putsign_date',
                'value' => function($model) {
                    if ($model->putsign_date != '0000-00-00') {
                        return $model->putsign_date;
                    }
                    return '-';
                }
            ],


            'back_addressee',
            'back_telphone',
            [
                'attribute' => 'back_address',
                'format' => 'ntext',
                'value' => function($model) {
                    if ($model->back_address ) {
                        return $model->back_address;
                    }
                    return '-';
                }
            ],

            [
                'attribute' => 'delivergood_date',
                'value' => function($model) {
                    if ($model->delivergood_date != '0000-00-00') {
                        return $model->delivergood_date;
                    }
                    return '-';
                }
            ],
            'deliver_order',
//            'delivercompany_id',
            'delivercompany',
            [
                 'attribute' => 'remark',
                 'format' => 'ntext',
                 'value' => function($model) {
                    if ($model->remark) {
                        return $model->remark;
                    }
                    return "-";
                 }
            ],
            [
                'attribute' => 'receipt_date',
                'value' => function($model) {
                    if ($model->receipt_date != '0000-00-00') {
                        return $model->receipt_date;
                    }
                    return '-';
                }
            ],
            [
                'attribute' => 'company_receipt_date',
                'value' => function($model) {
                    if ($model->receipt_date != '0000-00-00') {
                        return $model->receipt_date;
                    }
                    return '-';
                }
            ],
            [
                'attribute' => 'pay_date',
                'value' => function($model) {
                    if ($model->pay_date != '0000-00-00') {
                        return $model->pay_date;
                    }
                    return '-';
                }
            ],
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
            ],
            [
                'attribute' => 'operator_id',
                'value' => $model->operator->username
            ],

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
        &nbsp;&nbsp;

        <?php if (preg_match('/(create|update|view)/',Yii::$app->request->referrer)) { ?>
            <?= Html::a('返回',Url::to(['order/index']), [
                'class' => 'btn btn-default'
            ])?>

        <?php }else{?>
            <?= Html::button('返回', [
                'onclick' => 'history.go(-1)',
                'class' => 'btn btn-default'
            ])?>

        <?php } ?>
    </p>
</div>
