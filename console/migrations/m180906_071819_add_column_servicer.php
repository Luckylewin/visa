<?php

use yii\db\Migration;

class m180906_071819_add_column_servicer extends Migration
{
    public function up()
    {
      //  $this->addColumn('yii2_servicer', 'is_del', "char(1) not null default '0'");
    }

    public function down()
    {
        echo "m180906_071819_add_column_servicer cannot be reverted.\n";

        return true;
    }


   /* // Use safeUp/safeDown to run migration code within a transaction
    public function safeUp()
    {
        $this->addColumn('yii2_servicer', 'is_del', "char(1) not null default '0'");
    }

    public function safeDown()
    {
    }*/

}
