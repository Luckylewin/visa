<?php

use yii\db\Migration;

class m181026_091728_add_draw_bill_to_orders extends Migration
{
    public function up()
    {
        // 是否开票
        $default = \common\models\Order::STATUS_NO;
        $this->addColumn('yii2_order', 'draw_bill_status', "tinyint(1) default $default");

        // 是否退款
        $default = \common\models\Order::REFUND_STATUS_PENDING;
        $this->addColumn('yii2_order', 'refund_status', "char(10) not null default '{$default}'");

    }

    public function down()
    {
        $this->dropColumn('yii2_order', 'draw_bill_status');
        $this->dropColumn('yii2_order', 'refund_status');

        return true;
    }

}
