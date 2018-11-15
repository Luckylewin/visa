<?php

use yii\helpers\Html;
use yii\widgets\ActiveForm;

/* @var $this yii\web\View */
/* @var $model backend\models\form\StaticsForm */
/* @var $form yii\widgets\ActiveForm */
$this->title = '订单统计';
$this->params['breadcrumbs'][] = $this->title;
$this->registerJsFile('/statics/themes/newadmin/js/plugins/layer/laydate/laydate.js', ['depends'=>['yii\web\JqueryAsset']])
?>

<?php \common\widgets\Cssblock::begin() ?>
.my-search{cursor:pointer;}
.s-label{font-size:11px;}
<?php \common\widgets\Cssblock::end() ?>


<div class="order-search">

    <?php $form = ActiveForm::begin([
        'action' => ['order/statics'],
        'method' => 'POST',
    ]); ?>

    <div class="panel panel-primary">

        <div class="panel-body search-body">
            <div class="col-md-12">


                <div class="col-md-3">
                    <?= $form->field($model, 'dateOneStart')->textInput([
                        'class'        => 'form-control layer-date',
                        'autocomplete' => 'off',
                        'placeholder'  => '请选择日期',
                        'onclick'      => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                        'style'        => 'display:block!important;max-width:380px!important'
                    ])->label("时间一开始", [
                        'class' => 's-label'
                    ]) ?>
                </div>

                <div class="col-md-3">
                    <?= $form->field($model, 'dateOneEnd')->textInput([
                        'class'         => 'form-control layer-date',
                        'autocomplete'  => 'off',
                        'placeholder'   => '请选择日期',
                        'onclick'       => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                        'style'         => 'display:block!important;max-width:380px!important'
                    ])->label("时间一结束", [
                        'class' => 's-label'
                    ]) ?>
                </div>


                <div class="col-md-3">
                    <?= $form->field($model, 'dateTwoStart')->textInput([
                        'class'         => 'form-control layer-date',
                        'autocomplete'  => 'off',
                        'placeholder'   => '请选择日期',
                        'onclick'       => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                        'style'         => 'display:block!important;max-width:380px!important'
                    ])->label("时间二开始", [
                        'class' => 's-label'
                    ]) ?>
                </div>

                <div class="col-md-3">
                    <?= $form->field($model, 'dateTwoEnd')->textInput([
                        'class'         => 'form-control layer-date',
                        'autocomplete'  => 'off',
                        'placeholder'   => '请选择日期',
                        'onclick'       => "laydate({istime: true, format: 'YYYY-MM-DD'})",
                        'style'         => 'display:block!important;max-width:380px!important'
                    ])->label("时间二结束", [
                        'class' => 's-label'
                    ]) ?>
                </div>

               </div>

            <div class="col-md-12" style="border-top: 1px dashed #ccc">
                <div style="float: right">
                    <br>
                    <div id="aa" class="form-group">
                        <?= Html::submitButton('<i class="fa fa-search"></i>查询', ['class' => 'btn btn-primary']) ?>
                        <?= Html::resetButton('<i class="fa fa-hand-stop-o"></i>重置', ['class' => 'btn btn-default']) ?>
                        <?php if($data && !(empty($data[0]['data']) && empty($data[0]['data']))): ?>
                        <?= Html::a('导出统计', ['order/export-statics', 'post' => $post], ['class' => 'btn btn-success']) ?>
                        <?php endif; ?>

                    </div>
                </div>
            </div>
        </div>
    </div>
    <?php ActiveForm::end(); ?>
</div>

<style>

</style>
<div>
    <?php if($data): ?>
    <table class="table table-bordered table-striped">
        <caption>统计项</caption>
        <thead>
        <tr>
            <th></th>
            <th colspan="3"><?= isset($data[0]) ? $data[0]['title'] : '' ?></th>
            <th colspan="3"><?= isset($data[1]) ? $data[1]['title'] : '' ?></th>
        </tr>
        <tr>
            <th>统计维度</th>
            <th>销售额</th>
            <th>订单人数</th>
            <th>毛利</th>

            <th>销售额</th>
            <th>订单人数</th>
            <th>毛利</th>
        </tr>
        </thead>

        <tbody>

        <?php if(empty($data[0]['data']) && empty($data[0]['data'])): ?>
        <tr>
            <td colspan="7">
                没有订单统计数据
            </td>
        </tr>
        <?php endif; ?>

            <?php $fields = array_keys($data[0]['data']); ?>
            <?php foreach ($fields as $field): ?>
            <tr>
                <th><?= $field ?></th>
                <td><?= isset($data[0]['data'][$field]['sale_total']) ? $data[0]['data'][$field]['sale_total'] : 0 ?></td>
                <td><?= isset($data[0]['data'][$field]['total_person']) ? $data[0]['data'][$field]['total_person'] : 0 ?></td>
                <td>
                        <?php $earning = $data[0]['data'][$field]['fee'] ?>

                        <?php if($earning > 0 ): ?>
                            <b><?= Html::tag('font', $earning, ['color' => 'green' ]); ?></b>
                        <?php elseif($earning == 0): ?>
                            <?= Html::tag('font', $earning); ?>
                        <?php else: ?>
                            <b><?= Html::tag('font', $earning, ['color' => 'red' ]); ?></b>
                        <?php endif; ?>
                </td>

                <td><?= isset($data[1]['data'][$field]['sale_total']) ? $data[1]['data'][$field]['sale_total'] : '0' ?></td>
                <td><?= isset($data[1]['data'][$field]['total_person']) ? $data[1]['data'][$field]['total_person'] : '0' ?></td>
                <td>

                        <?php $earning = $data[1]['data'][$field]['fee'] ?>
                        <?php if($earning > 0 ): ?>
                            <b><?= Html::tag('font', $earning, ['color' => 'green' ]); ?></b>
                        <?php elseif($earning == 0): ?>
                            <?= Html::tag('font', $earning); ?>
                        <?php else: ?>
                            <b><?= Html::tag('font', $earning, ['color' => 'red' ]); ?></b>
                        <?php endif; ?>

                </td>

            </tr>
            <?php endforeach; ?>
        </tbody>

    </table>



    <?php endif; ?>
</div>

<div class="col-md-12 text-center">
    <?= Html::a('返回', ['order/report'], ['class' => 'btn btn-default']) ?>
</div>
