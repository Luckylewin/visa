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
use yii\helpers\ArrayHelper;

class BackupController extends Controller
{

    private function getBackupFile()
    {
        $dbManager = Yii::$app->getModule('db-manager');
        foreach ($dbManager->getFileList() as $id => $file) {
            $columns = [];
            $columns['id'] = $id;
            $columns['path'] = $file;
            $dataArray[] = $columns;
        }

        ArrayHelper::multisort($dataArray, ['id'], [SORT_DESC]);

        if (!empty($dataArray)) {
            return current($dataArray);
        }

        return false;
    }

    public function actionCreate()
    {
        $dumper = new DumpController('db-manager', Yii::$app->getModule('db-manager'));

        try {
            $dumper->runAction('create',['_aliases' => ['db'=>'db','gz'=>1,'s'=>1]]);
        } catch (\Exception $e) {
            echo $e->getMessage();
        }
        
        $file = $this->getBackupFile();

        if ($file) {
            $message = Yii::$app->mailer->compose();
            $message->attachContent('Attachment content', ['fileName' => basename($file['path']), 'contentType' => 'text/plain']);
            $message->setTo(Yii::$app->params['adminEmail']);
            $message->setSubject(date('Y年m月d日') . "网站数据库备份文件");
            $res = $message->send();

            if ($res) {
                $this->stdout('发送成功');
            } else {
                $this->stdout('发送失败');
            }
        }

    }

    public function actionHello()
    {
        echo 'OK';
        exit;
    }
}