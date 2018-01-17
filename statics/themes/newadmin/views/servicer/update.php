<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Servicer */

$this->title = '编辑客服资料: ' . $model->name;
$this->params['breadcrumbs'][] = ['label' => '客服列表', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->name, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = '编辑';
?>
<div class="servicer-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
