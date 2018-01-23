<?php
/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\web\AssetBundle as AppAsset;
use yii\widgets\Breadcrumbs;
use common\widgets\Alert;
use backend\models\Menu;

AppAsset::register($this);
$allMenus = Menu::getMenu();
?>
<?php $this->beginPage() ?>
<!DOCTYPE html>
<html lang="<?= Yii::$app->language ?>">
<head>
    <meta charset="<?= Yii::$app->charset ?>">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <?= Html::csrfMetaTags() ?>
    <title><?= Yii::$app->params['basic']['sitename'].' - '.Html::encode($this->title) ?></title>
    <?php $this->head() ?>
    <link href="/statics/themes/newadmin/css/style.css?v=4.1.0" rel="stylesheet">
    <link href="/statics/themes/newadmin/css/bootstrap.min.css?v=3.3.6" rel="stylesheet">
    <link href="/statics/themes/newadmin/css/font-awesome.css?v=4.4.0" rel="stylesheet">

<body>
<?php $this->beginBody() ?>


<div class="wrapper">
    <div class="panel">
        <div class="panel-body">
            <div class="col-md-12">
                <!-- 面包屑导航 -->
                <div>
                    <?=    Breadcrumbs::widget([
                        'links' => isset($this->params['breadcrumbs']) ? $this->params['breadcrumbs'] : [],
                        'homeLink' => false
                    ]); ?>
                </div>

                <?= $content ?>
                <!--alert 表单-->
                <div class="col-md-12">
                    <?= Alert::widget();?>
                </div>
            </div>
        </div>
    </div>
</div>

<?php $this->endBody() ?>
</body>
</html>
<?php $this->endPage() ?>

