<?php

namespace common\assets;

use yii\web\AssetBundle;

/**
 * Main backend application asset bundle.
 */
class ListAsset extends AssetBundle
{
    public $basePath = '@webroot';
    public $baseUrl = '@web';
    public $css = [

    ];
    public $js = [
    ];
    public $depends = [
        'yii\web\YiiAsset',
        'common\assets\BootstrapAsset',
    ];
}
