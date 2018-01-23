<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Transator */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => '办理人列表', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;


?>
<div class="transator-view">

    <h1><?= Html::encode($this->title) ?></h1>
    <p>
        <?= Html::a('编辑', ['update', 'id' => $model->tid], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('删除', ['delete', 'id' => $model->tid], [
            'class' => 'btn btn-danger',
            'data' => [
                'confirm' => '确定要删除该项吗?',
                'method' => 'post',
            ],
        ]) ?>
    </p>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'name',
             [
                        'attribute' => 'sex',
                        'value' => function($model) {
                         $sex = \common\models\Type::getSex();
                         return $sex[$model->sex?$model->sex:1];
                     }
             ],
            'phone',
            'address',
            'identify',
            'remark',
            [
                    'attribute' => 'historyOrder',
                    'format' => 'raw',
                    'value' => function($model) {
                        $myOrder = $model->getRelatedOrder();
                        if (!empty($myOrder)) {
                            $str = "";
                            foreach ($myOrder as $order) {
                               $str .= Html::a( $order->order_date . " 订单号" . $order->order_num, \yii\helpers\Url::to(['order/view','id'=>$order->id])) . "<br/>";
                            }
                            return $str;
                        }
                    },
                    'label' => '历史订单'
            ]
        ],
    ]) ?>
</div>
