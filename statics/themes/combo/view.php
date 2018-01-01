<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Combo */

$this->title = $model->combo_id;
$this->params['breadcrumbs'][] = ['label' => 'Combos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="combo-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <p>
        <?= Html::a('Update', ['update', 'id' => $model->combo_id], ['class' => 'btn btn-primary']) ?>
        <?= Html::a('Delete', ['delete', 'id' => $model->combo_id], [
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
            'combo_id',
            'combo_name',
            'created_at',
            'updated_at',
            'uid',
        ],
    ]) ?>

</div>
