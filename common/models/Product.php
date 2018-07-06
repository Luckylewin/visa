<?php

namespace common\models;

use Yii;

/**
 * This is the model class for table "yii2_product".
 *
 * @property integer $id
 * @property string $name
 * @property string $picture
 * @property string $cost
 */
class Product extends \yii\db\ActiveRecord
{

    public $countryname;

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return 'yii2_product';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['name'], 'required'],
            [['id'], 'integer'],
            [['name'], 'string', 'max' => 255],
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => '产品id',
            'name' => '产品名称',
        ];
    }

    public function getCombo()
    {
        return $this->hasMany(Combo::className(), ['product_id'=>'id'])->orderBy('combo_classify asc,combo_type asc');
    }

    public function getSomeCombo($combo_type)
    {
        return $this->hasMany(Combo::className(), ['product_id'=>'id'])->where("combo_type", $combo_type);
    }

    public static function getJsonData()
    {
        return self::find()->select(['id','name'])->asArray()->limit(100)->all();
    }

    public static function getAll()
    {
        return self::find()->select('name')->asArray()->all();
    }

    public function beforeDelete()
    {
        if (parent::beforeDelete()) {
            Combo::deleteAll(['product_id' => $this->id]);
            return true;
        }
    }


}
