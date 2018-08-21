<?php
/**
 * Created by PhpStorm.
 * User: lychee
 * Date: 2018/8/21
 * Time: 10:35
 */

namespace console\controllers;

use common\models\Order;
use yii\console\Controller;

class MaintenanceController extends Controller
{

    public function updateAction()
    {
        $orders = Order::find()->all();
        if (!empty($orders)) {
            foreach ($orders as $order) {
                if (!empty($order->operator_id)) {
                    $order->creator_id = $order->operator_id;
                    $order->save(false);
                }
            }
        }

        echo 'ok';
    }
}