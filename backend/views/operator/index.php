<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel backend\models\search\OperatorSearch */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Operators';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="operator-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Operator', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'name',
            [
                'attribute' => 'admin_id',
                'label' => '帐号绑定',
                'format' => 'raw',
                'value' => function($model) {
                    $account = $model->account;
                    if (!$account) {
                        return Html::a('点击绑定', \yii\helpers\Url::to(['operator/grant','sid' => $model->id]),[
                            'class' => 'btn btn-info btn-xs'
                        ]);
                    }
                    return Html::button($account->username, ['class' => 'btn btn-default btn-xs'])
                        . ' ' .
                        Html::a('解除绑定', \yii\helpers\Url::to(['operator/unbind', 'id' => $model->id]), [
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
                'size' => 'btn-sm',
                'template' => '{update} {delete}'
            ],
        ],
    ]); ?>
</div>
