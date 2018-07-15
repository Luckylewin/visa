<?php
$params = array_merge(
    require(__DIR__ . '/../../common/config/params.php'),
    require(__DIR__ . '/params.php')
);

return [
    'id' => 'app-console',
    'basePath' => dirname(__DIR__),
    'bootstrap' => ['log'],
    'controllerNamespace' => 'console\controllers',
    'components' => [
        'mailer' => [
            'class' => 'yii\swiftmailer\Mailer',
            'viewPath' => '@common/mail',
            'useFileTransport' => false,
            'transport' => [
                //qq的邮箱http://service.mail.qq.com/cgi-bin/help?subtype=1&&id=28&&no=1001256
                'class' => 'Swift_SmtpTransport',
                'host' => 'smtp.qq.com',
                'username' => '',
                'password' => '',
                'port' => '25',
                'encryption' => 'tls',
            ],
            'messageConfig'=>[
                'charset'=>'UTF-8',
                'from'=>['876505905@qq.com'=>'十年']
            ],
        ],
        'log' => [
            'targets' => [
                [
                    'class' => 'yii\log\FileTarget',
                    'levels' => ['error', 'warning'],
                ],
            ],
        ],
        //配置数据库
        'db' => [
            'class' => 'yii\db\Connection',
            'dsn' => 'mysql:host=127.0.0.1;dbname=visa',
            'username' => 'root',
            'password' => '12345678',
            'charset' => 'utf8',
            'tablePrefix' => 'yii2_',
        ],
    ],

    'params' => $params,
    'modules' => [
        'db-manager' => [
            'class' => 'bs\dbManager\Module',
            // path to directory for the dumps
            'path' => '@storage/backups',
            // list of registerd db-components
            'dbList' => ['db'],

        ],
    ],
];
