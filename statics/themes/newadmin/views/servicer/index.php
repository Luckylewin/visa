<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '客服列表';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="servicer-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('添加客服', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],
            'name',
            'tb_servicer_id',
            [
                    'attribute' => 'name',
                    'label' => '帐号绑定',
                    'format' => 'raw',
                    'value' => function($model) {
                        $account = $model->account;
                        if (!$account) {
                            return Html::a('点击绑定', \yii\helpers\Url::to(['servicer/grant','sid' => $model->id]),[
                                'class' => 'btn btn-info btn-xs'
                            ]);
                        }
                        return Html::button($account->username, ['class' => 'btn btn-default btn-xs'])
                               . ' ' .
                               Html::a('解除绑定', \yii\helpers\Url::to(['servicer/unbind', 'id' => $model->id]), [
                                'class' => 'btn btn-warning btn-xs'
                            ]);
                    },
                    'options' => [
                        'style' => 'width:250px;'
                    ],
            ],
            [
                'class' => 'common\grid\MyActionColumn',
                'header' => '操作',
            ],
        ],
    ]); ?>
</div>
