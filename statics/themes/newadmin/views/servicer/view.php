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
        ],
    ]) ?>

    <p>
        <?php if(strpos(Yii::$app->request->referrer, 'order') === false): ?>

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
