<?php

use yii\db\Migration;

class m190118_080858_alter_order_table extends Migration
{
    public function up()
    {
        $this->alterColumn(\common\models\Order::tableName(), 'operator_id','char(10)');
    }

    public function down()
    {
        echo "m190118_080858_alter_order_table cannot be reverted.\n";

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
