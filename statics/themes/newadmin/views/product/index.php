<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ProductQuery */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = 'Products';
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-index">

    <h1><?= Html::encode($this->title) ?></h1>
    <?php // echo $this->render('_search', ['model' => $searchModel]); ?>

    <p>
        <?= Html::a('Create Product', ['create'], ['class' => 'btn btn-success']) ?>
    </p>

    <?=
    GridView::widget([
        'dataProvider' => $dataProvider,
        'filterModel' => $searchModel,
        'columns' => [
            [
                    'class' => 'yii\grid\SerialColumn',
                    'header' => '序号',
                    'options' => ['width'=>'70px;']
            ],
            [
                'attribute' => 'id',
                'options' => ['width'=>'80px']
            ],
            'name',
           /* [
                'attribute' => 'type',
                'value' =>  function ($model,$key,$index,$column) {
                                return $model->type==1?'男':'女';
                            },
                'filter' => array('1'=>'正常',2=>'加急',3=>'特急')
            ],*/
            [
                'attribute' => 'cost',
                'options' => ['width'=>'140px']
            ],
            [
                'attribute' => 'country_id',
                'value'     => 'country.cinfo',
                'filter'    => \common\models\Country::find()
                                ->select(['cinfo','id'])
                                ->orderBy('id desc')
                                ->indexBy('id')
                                ->column(),
                'options'   => [ 'width'=>'80px']
            ],
            [
                'class' => 'yii\grid\ActionColumn',
                'header' => '操作',
                'options' => ['width'=>'300px']
            ],
        ],
    ]);
    ?>
</div>
