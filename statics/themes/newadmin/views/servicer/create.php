<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Servicer */

$this->title = 'Create Servicer';
$this->params['breadcrumbs'][] = ['label' => 'Servicers', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="servicer-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
