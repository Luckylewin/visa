<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Combo */

$this->title = 'Update Combo: ' . $model->combo_id;
$this->params['breadcrumbs'][] = ['label' => 'Combos', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->combo_id, 'url' => ['view', 'id' => $model->combo_id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="combo-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
