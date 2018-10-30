<?php

use \yii\helpers\Url;
$this->title = '导入excel 更新数据';
$this->params['breadcrumbs'][] = ['label' => Yii::t('backend', 'Orders'), 'url' => Url::to(['order/index'])];
$this->params['breadcrumbs'][] = $this->title;
$this->registerJsFile('/statics/themes/newadmin/js/plugins/layer/layer.min.js', ['depends' => 'yii\web\JqueryAsset']);
$this->registerJsFile('/statics/themes/newadmin/plugins/drag/dropzone.min.js', ['depends' => 'yii\web\JqueryAsset']);
$this->registerCssFile('/statics/themes/newadmin/plugins/drag/basic.min.css');
$this->registerCssFile('/statics/themes/newadmin/plugins/drag/dropzone.min.css');
?>

<style>
    .dz-filename{
        margin-top: 75px;
    }
    .dropzone {
        border: 2px dashed #0087F7;
        border-radius: 5px;
        background: white;
    }
</style>

<div class="panel panel-default">
    <div class="panel-heading">
        <h3 class="panel-title">
            导入Excel表格
        </h3>
    </div>
    <div class="panel-body">
        <form action="/upload" class="dropzone needsclick dz-clickable" id="my-awesome-dropzone">
            <div class="dz-message needsclick">
                将文件拖拽到此处<br>或点此打开文件管理器选择文件
            </div>
        </form>
    </div>
</div>
    <div class="col-md-12 text-center">
        <?= \yii\helpers\Html::a('返回', ['order/index'], ['class' => 'btn btn-default']) ?>
    </div>

<?php

$uploadUrl = Url::to(['excel/import']);

$js =<<<JS
            Dropzone.autoDiscover = false;
            var csrf = $('meta[name="csrf-token"]').attr('content');
            
            var myDropzone = new Dropzone("#my-awesome-dropzone", {
                url: '{$uploadUrl}',
                addRemoveLinks: false,
                acceptedFiles: ".xlsx,.xls",
                method: 'post',
                maxFiles: 10,
                maxFilesize:10,
                filesizeBase: 1024,
                dictFallbackMessage:"当前浏览器不支持拖拽上传，推荐您使用chrome浏览器",
                headers: {'X-CSRF-Token':csrf},
                paramName: "UploadForm[file]",
                sending: function(file, xhr, formData) {
                    formData.append("filesize", file.size);
                    formData.append("_csrf", csrf);
                },
                success: function (file, response, e) {
                    $(file.previewTemplate).children('.dz-success-mark').css('opacity', '1')
                    layer.alert(response.msg, {icon: 1});
                },
                error: function (file, response, e) {
                    $(file.previewTemplate).children('.dz-error-mark').css('opacity', '1');
                    layer.alert(response.error, {icon: 5});
                }
            });
JS;

$this->registerJs($js);
?>






