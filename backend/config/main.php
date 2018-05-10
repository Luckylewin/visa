<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/params.php')
);

return [
    'id' => 'app-backend',
    'basePath' => dirname(__DIR__),
    'controllerNamespace' => 'backend\controllers', //控制器默认命名空间
    'bootstrap' => [],
    'modules' => [
        'db-manager' => [
            'class' => 'bs\dbManager\Module',
            // path to directory for the dumps
            'path' => '@storage/backups',
            // list of registerd db-components
            'dbList' => ['db'],
            'as access' => [
                'class' => 'yii\filters\AccessControl',
                'rules' => [
                    [
                        'allow' => true,
                        'roles' => ['@'],
                    ],
                ],
            ],
        ],
    ],    //模块
    'defaultRoute' => 'index/frame',   //默认路由
    'layout' => 'main',//布局文件 优先级: 控制器>配置文件>系统默认
    //组件
    'components' => [
        //cache组件
        'cache' => [
            'class' => 'yii\caching\FileCache',
            'cachePath' => '@runtime/myCache',
        ],
        //request组件
        'request' => [
            'csrfParam' => '_csrf-backend',
            // !!! insert a secret key in the following (if it is empty) - this is required by cookie validation
            'cookieValidationKey' => 'EJBy8WRohzpqJY7BTurjQaft2NV-g1cA',
        ],
        //身份认证类
        'user' => [
            'class' => 'yii\web\User',
            'identityClass' => 'backend\models\Admin',
            'enableAutoLogin' => true,
            'identityCookie' => ['name' => '_identity-backend', 'httpOnly' => true],
            'loginUrl' => ['index/login'], //配置登录url
        ],
        'session' => [
            'class' => 'yii\web\CacheSession',

            //'db' => 'db',   //数据库连接的应用组件ID,默认为'db'
            //'sessionTable' => '', //session数据表名,默认为'session'
        ],
        //Rbac权限控制
        'authManager' => [
            'class' => 'yii\rbac\DbManager',
            'cache' => 'yii\caching\FileCache'
        ],
        'log' => [
            'traceLevel' => YII_DEBUG ? 3 : 0,
            'targets' => [
                [

                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                    'enabled' => false,
                ],
            ],
        ],
        'errorHandler' => [
            'errorAction' => 'index/error',
        ],
        //
        /*'urlManager' => [
            'enablePrettyUrl' => true,  //开启url规则
            'showScriptName' => false,  //是否显示url中的index.php
            'suffix' => '.html',    //后缀
            'rules' => [
            ],
        ],*/
    ],
    'params' => $params,
    'timeZone'=>'Asia/Shanghai',
];
