<?php

use yii\helpers\Html;

/* @var $this yii\web\View */
/* @var $model common\models\Order */

$this->title = 'Update Order: ' . $model->id;
$this->params['breadcrumbs'][] = ['label' => 'Orders', 'url' => ['index']];
$this->params['breadcrumbs'][] = ['label' => $model->id, 'url' => ['view', 'id' => $model->id]];
$this->params['breadcrumbs'][] = 'Update';
?>
<div class="order-update">

    <h1><?= Html::encode($this->title) ?></h1>

    <?= $this->render('_form', [
        'model' => $model,
    ]) ?>

</div>

<script src="/statics/themes/newadmin/js/jquery.min.js?v=2.1.4"></script>
<script>
    $("#order-order_type").change(function() {
        var country_id = $('#order-cid').val();
        var order_type = $('#order-order_type').val();
        var url = '<?= \yii\helpers\Url::to(['product/my-product']);?>';
        var data = {country_id:country_id,type:order_type};

        $.getJSON(url, data, function(back) {
            var select = $('#order-combo_id');
            if (back.error === 'success') {
                select.empty();
                var str = '';
                for (var i in back.value) {
                    if ( i !=='del') {
                        str += ('<option value="' + back.value[i].combo_id + '">' +  back.value[i].combo_name + '</option>');
                    }
                }
                select.append(str);
            }else {
                select.empty();
                select.append('<option>该分类没有套餐<option>');
            }
        });
    });
</script>
