<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Transator */

$this->title = 'Update Transator: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Transators', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->tid]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="transator-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
