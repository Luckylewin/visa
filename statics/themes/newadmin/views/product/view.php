<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use \common\models\Combo;

/* @var $this yii\web\View */
/* @var $model common\models\Product */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => 'Products', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>

<div class="product-form col-md-12">

    <div class="panel panel-default">
        <div class="panel-heading">
            <h3 class="panel-title">
                <h4><?= Html::encode($this->title) ?></h4>
            </h3>
        </div>
        <div class="panel-body">
            <div class="col-md-6">
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
                                'label' => '套餐',
                                'format' => 'html',
                                'value' => function ($model){

                                    $str='';
                                    foreach($model->combo as $value){
                                        $str = $str. ("<span class='btn btn-info'>" . $value->combo_name . "</span>&nbsp;");
                                    }
                                    return $str;
                                }
                            ],
                        ],
                    ]) ?>
                </div>


                <p>
                    <?= Html::a(Yii::t('backend', 'Edit'), ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
                    <?= Html::a(Yii::t('backend', 'RelatedCombo'), \yii\helpers\Url::toRoute(['combo/create','id'=>$model->id]), ['class' => 'btn btn-success']) ?>
                   <!-- Html::a('Delete', ['delete', 'id' => $model->id], [
                        'class' => 'btn btn-danger',
                        'data' => [
                            'confirm' => 'Are you sure you want to delete this item?',
                            'method' => 'post',
                        ],
                    ])-->
                </p>
            </div>
        </div>
    </div>


</div>


