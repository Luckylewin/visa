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
 * @property integer $country_id
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
            [['id', 'name', 'picture', 'cost', 'country_id'], 'required'],
            [['id', 'country_id'], 'integer'],
            [['cost'], 'number'],
            [['name', 'picture'], 'string', 'max' => 255],
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
            'picture' => '产品图片',
            'cost' => '支出成本',
            'country_id' => '国家',
        ];
    }

    public function getCountry()
    {
        return $this->hasOne(Country::className(), ['id'=>'country_id']);
    }
}
