<?php

use yii\helpers\Html;
use yii\widgets\DetailView;
use common\models\Type;
/* @var $this yii\web\View */
/* @var $model common\models\Product */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Products'), 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;

$combos = $model->combo;
$combosRowSpan = Type::getGroup($combos);

$types = Type::getComboType();
$classify = Type::getComboClassify();
$colors = ['1'=>'label label-success','2'=>'label label-warning','3'=>'label label-danger'];

?>


<div class="product-form col-md-6 col-md-offset-0">

    <div class="product-view">
        <?= DetailView::widget([
            'model' => $model,
            'attributes' => [
                'name',
            ],
        ]) ?>

    <table class="table table-hover">
        <caption>套餐列表</caption>
        <thead>
        <tr>
            <th>订单分类</th>
            <th>分类</th>
            <th>套餐名称</th>
            <th>支出成本</th>
            <th>手续费率</th>
            <th>添加用户</th>
            <th>操作</th>
        </tr>
        </thead>
        <tbody>
        <?php foreach ($combos as $combo){ ?>
            <tr>
                <?php if($combosRowSpan[$combo->combo_classify]['status']):?>
                <td style="text-align:center;font-weight:bolder;vertical-align: middle !important;" rowspan="<?= $combosRowSpan[$combo->combo_classify]['rowspan'] ?>">
                    <?= $classify[$combo->combo_classify] ?>
                </td>
                <?php $combosRowSpan[$combo->combo_classify]['status'] = false; ?>
                <?php endif; ?>
                <td>
                <span class="<?= $colors[$combo->combo_type] ?>"><?= $types[$combo->combo_type] ?></span>
                </td>
                <td><?= $combo->combo_name; ?></td>
                <td><?= $combo->combo_cost; ?></td>
                <td><?= $combo->combo_charge; ?></td>
                <td><?= $combo->user->username; ?></td>
                <td>
                    <?= Html::a("修改", \yii\helpers\Url::to(['combo/update', 'id' => $combo->combo_id]), [
                        'class' => 'btn btn-info btn-xs'
                    ]); ?>&nbsp;
                    <?= Html::a("删除", ['combo/delete', 'id' => $combo->combo_id], [
                        'class' => 'btn btn-danger btn-xs',
                        'data' => [
                            'confirm' => '确定要删除该套餐吗?',
                            'method' => 'post',
                        ],
                    ]); ?>
                </td>
            </tr>
        <?php } ?>
        </tbody>
    </table>
    <p>
        <?= Html::a(Yii::t('backend', 'Edit'), ['update', 'id' => $model->id], ['class' => 'btn btn-info']) ?>
        <?= Html::a(Yii::t('backend', 'RelatedCombo'), \yii\helpers\Url::toRoute(['combo/create','id'=>$model->id]), ['class' => 'btn btn-primary']) ?>
    </p>
</div>



