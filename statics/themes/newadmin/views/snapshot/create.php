<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Snapshot */

$this->title = 'Create Snapshot';
$this->params['breadcrumbs'][] = ['label' => 'Snapshots', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="snapshot-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
