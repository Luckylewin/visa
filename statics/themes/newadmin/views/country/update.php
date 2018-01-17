<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Country */

$this->title = '编辑: ' . $model->cinfo;
$this->params['breadcrumbs'][] = ['label' => '国家列表', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->cinfo, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = '更新';
?>
<div class="country-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
