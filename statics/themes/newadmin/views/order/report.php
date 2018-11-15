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


<div style="margin: 0 auto;width: 90%;">
    <?php if($data): ?>
        <table class="table table-bordered table-striped table-condensed">

            <thead>
            <tr>
                <th></th>
                <th class="text-center" colspan="3"><?= isset($data[0]) ? $data[0]['title'] : '' ?></th>
                <th class="text-center" colspan="3"><?= isset($data[1]) ? $data[1]['title'] : '' ?></th>
                <th class="text-center" colspan="3"><?= isset($data[2]) ? $data[2]['title'] : '' ?></th>
                <th class="text-center" colspan="3"><?= isset($data[3]) ? $data[3]['title'] : '' ?></th>
            </tr>
            <tr>
                <th>统计维度</th>
                <th>销售额</th>
                <th>订单人数</th>
                <th>毛利</th>

                <th>销售额</th>
                <th>订单人数</th>
                <th>毛利</th>

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
                    <td colspan="13">
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
                                <b> <?= Html::tag('font', $earning, ['color' => 'red' ]); ?></b>
                            <?php endif; ?>

                    </td>

                    <td><?= isset($data[2]['data'][$field]['sale_total']) ? $data[2]['data'][$field]['sale_total'] : '0' ?></td>
                    <td><?= isset($data[2]['data'][$field]['total_person']) ? $data[2]['data'][$field]['total_person'] : '0' ?></td>
                    <td>
                            <?php $earning = $data[2]['data'][$field]['fee'] ?>
                            <?php if($earning > 0 ): ?>
                                <b><?= Html::tag('font', $earning, ['color' => 'green' ]); ?>  </b>
                            <?php elseif($earning == 0): ?>
                                <?= Html::tag('font', $earning); ?>
                            <?php else: ?>
                                <b><?= Html::tag('font', $earning, ['color' => 'red' ]); ?></b>
                            <?php endif; ?>

                    </td>

                    <td><?= isset($data[3]['data'][$field]['sale_total']) ? $data[3]['data'][$field]['sale_total'] : '0' ?></td>
                    <td><?= isset($data[3]['data'][$field]['total_person']) ? $data[3]['data'][$field]['total_person'] : '0' ?></td>
                    <td>
                            <?php $earning = $data[3]['data'][$field]['fee'] ?>
                            <?php if($earning > 0 ): ?>
                                <b><?= Html::tag('font', $earning, ['color' => 'green' ]); ?> </b>
                            <?php elseif($earning == 0): ?>
                                <?= Html::tag('font', $earning); ?>
                            <?php else: ?>
                                <b><?= Html::tag('font', $earning, ['color' => 'red' ]); ?> </b>
                            <?php endif; ?>

                    </td>

                </tr>
            <?php endforeach; ?>
            </tbody>

        </table>



    <?php endif; ?>
</div>



<div class="col-md-12 text-center">
    <?php echo Html::a('<i class="fa fa-hand-o-right"></i>昨日数据对比', ['order/chart'], ['class' => 'btn btn-link']) ?>
    &nbsp;
    <?php echo Html::a('<i class="fa fa-hand-o-right"></i>指定日期统计', ['order/statics'], ['class' => 'btn btn-link']) ?>
</div>