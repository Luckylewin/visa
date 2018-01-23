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
            'tableOptions' => ['class' => 'table table-bordered'],
            'layout' => '{items}{pager}',
            'pager'=>[
                //'options'=>['class'=>'hidden']//关闭自带分页
                'firstPageLabel'=>"第一页",
                'prevPageLabel'=>'上一页',
                'nextPageLabel'=>'下一页',
                'lastPageLabel'=>'最后一页',
            ],
            'columns' => [
                'name',

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