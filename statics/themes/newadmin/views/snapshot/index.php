<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Snapshots';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="snapshot-index">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Create Snapshot', ['create'], ['class' => 'btn btn-success']) ?>
    </p>
    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'columns' => [
            ['class' => 'yii\grid\SerialColumn'],

            'id',
            'combo_name',
            'combo_cost',
            'combo_classify',
            'combo_type',
            // 'combo_country',
            // 'snap_combo_id',
            // 'is_valid',

            ['class' => 'yii\grid\ActionColumn'],
        ],
    ]); ?>
</div>
