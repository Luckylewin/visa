<?php
/**
 * Created by PhpStorm.
 * User: lychee
 * Date: 2018/8/21
 * Time: 10:35
 */

namespace console\controllers;

use common\models\Order;
use common\models\Snapshot;
use yii\console\Controller;

class MaintenanceController extends Controller
{
    public function actionWork()
    {
        // 查询所有订单
        $combo_id = Order::find()->select('combo_id')->column();

        // 查询快照
        $snapshots = Snapshot::find()->all();
        foreach ($snapshots as $snapshot) {
            if (!in_array($snapshot->id, $combo_id)) {
                $snapshot->delete();
            }
        }
        
    }
}