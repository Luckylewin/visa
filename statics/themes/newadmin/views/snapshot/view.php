<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Snapshot */

$this->title = '套餐快照';
$this->params['breadcrumbs'][] = ['label' => '订单详情', 'url' => Yii::$app->request->referrer];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="snapshot-view">

    <h1><?= Html::encode($this->title) ?></h1>



    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
             //'id',
            'combo_product',
            'combo_name',
            'combo_cost',
             [
                     'attribute' => 'combo_classify',
                     'value' => function($model) {
                          $class = \common\models\Type::getComboClassify();
                          return $class[$model->combo_classify];
                     }
             ],
            [
                'attribute' => 'combo_type',
                'value' => function($model) {
                    $combo_type = \common\models\Type::getComboType();
                    return $combo_type[$model->combo_type];
                }
            ],

            //'snap_combo_id',
            //'is_valid',
        ],
    ]) ?>

</div>
