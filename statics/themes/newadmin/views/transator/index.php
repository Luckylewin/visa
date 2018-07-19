<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\TransatorQuery */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = '办理人列表';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="transator-index">

    <h1><?php //Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <?= GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            'name',
             [
                     'attribute' => 'sex',
                     'filter' => \common\models\Type::getSex(),
                     'value' => function($model) {
                        if (isset($model->sex)) {
                            $type = \common\models\Type::getSex();
                            return isset($type[$model->sex]) ?  $type[$model->sex] : null;
                        }
                     },
                     'options' => ['style'=>'width:100px;']
             ],
             [
                     'attribute' => 'phone',
                     'options' => ['style'=>'width:180px;']
             ],
            'address',
            'identify',
            [
                'attribute' => 'remark',
                'options' => ['style'=>'width:220px;']
            ],
            [
                    'header' => '操作',
                    'class' => 'common\grid\myActionColumn',
                    'options' => ['style'=>'width:140px;']
            ],
        ],
    ]); ?>

    <p>
        <?php echo Html::a("清除无效数据", \yii\helpers\Url::to(['transator/clear']),[
                'class' => 'btn btn-warning'
        ]) ?>
    </p>
</div>
