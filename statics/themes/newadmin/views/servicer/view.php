<?php

use yii\helpers\Html;
use yii\widgets\DetailView;

/* @var $this yii\web\View */
/* @var $model common\models\Servicer */

$this->title = $model->name;
$this->params['breadcrumbs'][] = ['label' => '客服列表', 'url' => ['index']];
$this->params['breadcrumbs'][] = $this->title;
?>
<div class="servicer-view">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= DetailView::widget([
        'model' => $model,
        'attributes' => [
            'id',
            'name',
            'tb_servicer_id',
            [
                'attribute' => 'name',
                'label' => '帐号绑定',
                'format' => 'raw',
                'value' => function($model) {
                    $account = $model->account;
                    if (!$account) {
                        return Html::a('点击绑定', \yii\helpers\Url::to(['servicer/grant','sid' => $model->id]),[
                            'class' => 'btn btn-info btn-xs'
                        ]);
                    }
                    return Html::a($account->username,\yii\helpers\Url::to(['admin/view','id'=>$account->id]));
                },
                'options' => [
                    'style' => 'width:150px;'
                ],
            ],
        ],
    ]) ?>

    <p>
        <?php if(strpos(Yii::$app->request->referrer, 'order') === false): ?>

            <?php if($model->account): ?>
            <?= Html::a('重新绑定帐号', \yii\helpers\Url::to(['servicer/grant','sid' => $model->id]),[
                    'class' => 'btn btn-info'
                ]); ?>
            <?php endif; ?>
            <?= Html::a('编辑', ['update', 'id' => $model->id], ['class' => 'btn btn-primary']) ?>
            <?= Html::a('删除', ['delete', 'id' => $model->id], [
                'class' => 'btn btn-danger',
                'data' => [
                    'confirm' => '确定要删除该项吗?',
                    'method' => 'post',
                ],
            ]) ?>

        <?php else: ?>

            <?= Html::a('返回', Yii::$app->request->referrer, ['class' => 'btn btn-default']) ?>

        <?php endif;?>
    </p>

</div>
