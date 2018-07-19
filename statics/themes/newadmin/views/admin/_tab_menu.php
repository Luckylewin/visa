<?php
use yii\bootstrap\Nav;

echo Nav::widget([
    'items' => [
        [
            'label' => '管理员管理',
            'url' => ['admin/index'],
            'options'=> [
                'class' => Yii::$app->controller->action->id =="index" ? "active" : ""
            ],
        ],
        [
            'label' => '添加管理员',
            'url' => ['admin/create'],
            'options'=> [
                'class' => Yii::$app->controller->action->id =="create" ? "active" : ""
            ],
        ],
    ],
    'options' => ['class' => 'nav-tabs'],
]);