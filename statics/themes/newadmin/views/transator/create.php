<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Transator */

$this->title = 'Create Transator';
$this->params['breadcrumbs'][] = ['label' => 'Transators', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="transator-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
