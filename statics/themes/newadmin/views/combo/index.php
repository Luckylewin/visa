<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ComboQuery */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'ComboIndex');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="combo-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'combo_id',
            'product_id',
            'combo_name',
            'created_at',
            'updated_at',
            'uid',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
