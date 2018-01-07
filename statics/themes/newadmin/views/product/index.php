<?php

use yii\helpers\Html;
use yii\grid\GridView;

/* @var $this yii\web\View */
/* @var $searchModel common\models\ProductQuery */
/* @var $dataProvider yii\data\ActiveDataProvider */

$this->title = Yii::t('backend', 'Products');
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="product-index">

    <?php  echo  GridView::widget([
            'dataProvider' => $dataProvider,
            'filterModel' => $searchModel,
            'tableOptions' => ['class' => 'table table-bordered'],
            'layout' => '{items}{summary}{pager}',
            'columns' => [
                [
                    'class' => 'yii\grid\SerialColumn',
                    'header' => '序号',
                    'options' => ['width'=>'50px;']
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
                    'options' => ['width'=>'150px']
                ],
                [
                    'attribute' => 'country_id',
                    'value'     => 'country.cinfo',
                    'filter'    => \common\models\Country::find()
                                                        ->select(['cinfo','id'])
                                                        ->orderBy('id desc')
                                                        ->indexBy('id')
                                                        ->column(),
                    'options'   => ['style'=>'width:250px;text-align:center' ]
                ],
                [
                    'header' => '操作',
                    'class'    => 'yii\grid\ActionColumn',
                    'template' => '{combo}&nbsp{view}&nbsp;{update}&nbsp;{delete}&nbsp;{check}',
                    'options' => ['style'=>'width: 300px'],
                    'buttons'  => [
                        //查看按钮
                        'view' => function($url, $model, $key) {
                            $options = [
                                    'title' => Yii::t('backend', 'View'),
                                    'aria-label' => Yii::t('backend', 'View'),
                                    'data-pjax' => '0',
                                    'class' => 'btn btn-primary btn-sm',
                            ];
                            return Html::a(Yii::t('backend','View'), $url, $options);
                        },
                        //更新按钮
                        'update' => function ($url, $model, $key) {
                            $options = [
                                    'title' => Yii::t('backend', 'Edit'),
                                    'aria-label' => Yii::t('backend', 'Edit'),
                                    'data-pjax' => '0',
                                    'class' => 'btn btn-info btn-sm'
                            ];
                            return Html::a(Yii::t('backend','Edit'), $url, $options);
                        },
                        //删除按钮
                        'delete' => function ($url, $model, $key) {
                            $options = [
                                    'title' => Yii::t('backend', 'Delete'),
                                    'aria-lable' => Yii::t('yii', 'Delete'),
                                    'data-pjax' => '0',
                                    'class' => 'btn btn-danger btn-sm'
                            ];
                            return Html::a(Yii::t('backend', 'Delete'), $url, $options);
                        },
                        /*//发布套餐按钮
                        'combo' => function ($url, $model, $key) {
                            $url = \yii\helpers\Url::toRoute(['combo/index', 'id' => $key]);
                            $options = [
                                'title' => Yii::t('backend', 'ComboIndex'),
                                'aria-lable' => Yii::t('yii', 'ComboIndex'),
                                'data-pjax' => '0',
                                'class' => 'btn btn-info btn-sm'
                            ];
                            return Html::a(Yii::t('backend', 'ComboIndex'), $url, $options);
                        }*/
                    ]
                ],
            ],
        ]);


    ?>
</div>
<hr>

<div class="col-md-12">
    <div class="col-md-11"></div>
    <div >
        <p>
            <?= Html::a('录入产品', ['create'], ['class' => 'btn btn-success']) ?>
        </p>
    </div>
</div>