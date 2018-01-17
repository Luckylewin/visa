<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use common\models\Type;

/* @var $this yii\web\View */
/* @var $model common\models\Combo */

$this->title = Yii::t('backend', 'Combo') . Yii::t('backend', 'Detail');
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Products'), 'url' => \yii\helpers\Url::to(['product/index'])];
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Product') . Yii::t('backend', 'Detail'), 'url' => \yii\helpers\Url::to(['product/view', 'id' => $model->product->id])];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="combo-view">
    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'combo_id',
            [
                'label' => Yii::t('backend','Belong') . Yii::t('backend', 'Product'),
                'value' => $model->product->name,
            ],
            [
                 'attribute' => 'combo_type',
                 'value' => function($model) {
                    $data = Type::getComboType();
                    return $data[$model->combo_type];
                 } ,
            ],
            [
                'attribute' => 'combo_classify',
                'value' => function($model) {
                    $data = Type::getComboClassify();
                    return $data[$model->combo_classify];
                } ,
            ],
            'combo_name',
            'combo_cost',
            'created_at',
            [
                'attribute' => 'updated_at',
                'label' => Yii::t('backend','Last Update')
            ],
            [
                 'label' => Yii::t('backend','Input User'),
                 'value' => $model->user->username
            ]
        ],
    ]) ?>

    <div>
        <p>
            <?php $form = \yii\widgets\ActiveForm::begin([
                    'action' => \yii\helpers\Url::to(['combo/delete', 'id' => $model->combo_id]),
                    'method' => 'get'
            ]);?>
            <?= Html::hiddenInput('id',$model->combo_id);?>
            <?= Html::a(Yii::t('backend', 'Edit'), ['update', 'id' => $model->combo_id], ['class' => 'btn btn-primary']) ?>
            <?= Html::submitButton(Yii::t('backend', 'Delete'), [
                'class' => 'btn btn-danger',
                'data' => [
                    'confirm' => 'Are you sure you want to delete this item?',
                    'method' => 'get',
                ],
            ]) ?>
            <?php $form::end(); ?>
        </p>
    </div>

</div>
