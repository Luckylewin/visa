<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\TransatorQuery */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '办理人列表';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="transator-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            'name',
            'sex',
            'phone',
            'address',
            'identify',
            'remark',
            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
