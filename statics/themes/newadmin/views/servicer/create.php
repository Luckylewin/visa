<?php

use yii\helpers\Html;


/* @var $this yii\web\View */
/* @var $model common\models\Servicer */

$this->title = '添加客服';
$this->params['breadcrumbs'][] = ['label' => '客服列表', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="servicer-create">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
