<?php

use yii\db\Migration;

class m190118_084228_add_password_reset_token extends Migration
{
    public function up()
    {
        $this->addColumn(\backend\models\Admin::tableName(),'password_reset_token','varchar(255)');
    }

    public function down()
    {
        echo "m190118_084228_add_password_reset_token cannot be reverted.\n";

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
