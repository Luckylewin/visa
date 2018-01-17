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
            'tid',
            'name',
            'sex',
            'phone',
            'address',
            'identify',
        ],
    ]) ?>

</div>
