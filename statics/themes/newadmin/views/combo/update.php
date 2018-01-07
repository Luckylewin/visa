<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Combo */

$this->title = Yii::t('backend', 'Combo') . Yii::t('backend', 'Detail');
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Products'), 'url' => \yii\helpers\Url::to(['product/index'])];
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Product') . Yii::t('backend', 'Update'), 'url' => \yii\helpers\Url::to(['product/view', 'id' => $model->product->id])];
$this->params['breadcrumbs'][] = $this->title;

$productModel = $model->product;
?>
<div class="combo-update">


    <?= DetailView::widget([
        'model' => $productModel,
        'attributes' => [
            'id',
            'name',
            'picture',
            'cost',
            [
                'attribute' => 'country_id',
                'value' => $productModel->country->cinfo
            ],
            [
                'label' => Yii::t('backend' ,'Combo'),
                'format' => 'html',
                'value' => function ($model){

                    $str='';
                    foreach($model->combo as $value){
                        $text = "<i class='fa fa-coffee'></i> " . $value->combo_name;
                        $str = $str . \yii\helpers\Html::a( $text, \yii\helpers\Url::to(['combo/view', 'id' => $value->combo_id]), [
                                'class' => 'btn btn-info'
                            ]) . "&nbsp;";
                    }
                    return $str;
                }
            ],
        ],
    ]) ?>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>
