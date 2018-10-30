<?php

use yii\db\Migration;

class m181030_053129_add_order_cost extends Migration
{
    public function up()
    {
        $this->addColumn('yii2_order', 'cost', 'decimal(10,2) not null default 0.00');
    }

    public function down()
    {
        echo "m181030_053129_add_order_cost cannot be reverted.\n";
        $this->dropColumn('yii2_order', 'cost');
        return true;
    }

    /*
    // Use safeUp/safeDown to run migration code within a transaction
    public function safeUp()
    {
    }

    public function safeDown()
    {
    }
    */
}
