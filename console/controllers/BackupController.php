<?php
/**
 * Created by PhpStorm.
 * User: lychee
 * Date: 2018/7/15
 * Time: 16:21
 */

namespace console\controllers;

use Yii;
use yii\console\Controller;
use bs\dbManager\commands\DumpController;
class BackupController extends Controller
{
    public function actionCreate()
    {
        $dumper = new DumpController('db-manager', Yii::$app->getModule('db-manager'));
        $dumper->runAction('create');
    }
}