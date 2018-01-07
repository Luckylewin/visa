<?php

/* @var $this yii\web\View */
/* @var $model common\models\Combo */
$this->title = Yii::t('backend', 'Create') . Yii::t('backend', 'Combo');
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Products'), 'url' => \yii\helpers\Url::to(['product/index'])];
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Product') . Yii::t('backend', 'Detail'), 'url' => \yii\helpers\Url::to(['product/view', 'id' => $product_id])];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="combo-create">

    <?= $this->render('_form', [
        'model' => $model,
        'product_id' => $productModel->id,
        'productModel' => $productModel
    ]) ?>
</div>
