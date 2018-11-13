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

class KeepController extends Controller
{
    public function actionWork()
    {
        // 查询所有订单
        $orders = Order::find()->all();
        foreach ($orders as $key => $order) {
            echo "{$key}".PHP_EOL;
            //记录快照
            $snapShot = Snapshot::findOne(['id' => (int)($order->combo_id)]);
            if (!empty($snapShot)) {
                    Order::updateAll(['cost' => $snapShot->combo_cost], [
                        'id' => $order->id
                    ]);
            }
        }

        echo "完成";
    }

    public function delSnapshot()
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