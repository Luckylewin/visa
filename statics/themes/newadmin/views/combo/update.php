<?php

use yii\helpers\Html;
/* @var $this yii\web\View */
/* @var $model common\models\Combo */

$this->title = Yii::t('backend', 'Combo') . Yii::t('backend', 'Detail');
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Products'), 'url' => \yii\helpers\Url::to(['product/index'])];
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Product') . Yii::t('backend', 'Update'), 'url' => \yii\helpers\Url::to(['product/view', 'id' => $model->product->id])];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="combo-update">
    <?= $this->render('_form', [
        'model' => $model,
        'productModel' => $productModel
    ]); ?>

</div>
