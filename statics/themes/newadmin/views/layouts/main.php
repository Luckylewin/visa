<?php
/* @var $this \yii\web\View */
/* @var $content string */

use yii\helpers\Html;
use yii\helpers\Url;
use yii\bootstrap\Nav;
use yii\bootstrap\NavBar;
use yii\widgets\Breadcrumbs;
use yii\web\AssetBundle as AppAsset;
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
    <link href="/statics/themes/newadmin/css/bootstrap.min.css" rel="stylesheet">
<body>
<?php $this->beginBody() ?>

<?= Alert::widget() ?>
<div class="wrapper">
    <div class="panel">
        <div class="panel-body">
            <?= $content ?>
        </div>
    </div>
</div>

<?php $this->endBody() ?>
<script src="/statics/themes/admin/js/jquery-ui-1.9.2.custom.min.js"></script>
<script src="/statics/themes/admin/js/jquery.nicescroll.js"></script>
<script src="/statics/themes/admin/js/scripts.js"></script>
</body>
</html>
<?php $this->endPage() ?>
