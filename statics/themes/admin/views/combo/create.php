<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Combo */

$this->title = 'Create Combo';
$this->params['breadcrumbs'][] = ['label' => 'Combos', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="combo-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
