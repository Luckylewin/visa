<?php

use yii\db\Migration;

class m180906_075235_add_columnb_operator extends Migration
{
    public function up()
    {
        $this->addColumn('yii2_operator', 'is_del', "char(1) not null default '0'");
    }

    public function down()
    {
        echo "m180906_075235_add_columnb_operator cannot be reverted.\n";

        return false;
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
