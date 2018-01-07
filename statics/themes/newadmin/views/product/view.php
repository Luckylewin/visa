<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use \common\models\Combo;

/* @var $this yii\web\View */
/* @var $model common\models\Product */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Products'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>


<div class="product-form">

    <div class="product-view">
        <?= DetailView::widget([
            'model' => $model,
            'attributes' => [
                'id',
                'name',
                'picture',
                'cost',
                [
                    'attribute' => 'country_id',
                    'value' => $model->country->cinfo
                ],
                [
                    'label' => Yii::t('backend', 'Combo'),
                    'format' => 'html',
                    'value' => function ($model){

                        $str='';
                        foreach($model->combo as $value){
                            $text = "<i class='fa fa-coffee'></i> " . $value->combo_name;
                            $str = $str . Html::a( $text, \yii\helpers\Url::to(['combo/view', 'id' => $value->combo_id]), [
                                    'class' => 'btn btn-default'
                                ]) . "&nbsp;";
                        }
                        return $str;
                    }
                ],
            ],
        ]) ?>
    </div>


    <p>
        <?= Html::a(Yii::t('backend', 'Edit'), ['update', 'id' => $model->id], ['class' => 'btn btn-info']) ?>
        <?= Html::a(Yii::t('backend', 'RelatedCombo'), \yii\helpers\Url::toRoute(['combo/create','id'=>$model->id]), ['class' => 'btn btn-primary']) ?>
        <!-- Html::a('Delete', ['delete', 'id' => $model->id], [
             'class' => 'btn btn-danger',
             'data' => [
                 'confirm' => 'Are you sure you want to delete this item?',
                 'method' => 'post',
             ],
         ])-->
    </p>


</div>


