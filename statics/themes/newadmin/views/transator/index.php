<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\TransatorQuery */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Transators';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="transator-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Transator', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'tid',
            'name',
            'sex',
            'phone',
            'address',
            // 'identify',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
