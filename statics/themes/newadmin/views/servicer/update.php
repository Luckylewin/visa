<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Servicer */

$this->title = 'Update Servicer: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Servicers', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="servicer-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
