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

    public function beforeSave($insert)
    {
        if ($this->isNewRecord == false) {
            // 判断名称是否有更改 如果更改了则修改数据
            if ($this->getOldAttribute('name') != $this->name) {
                $this->cutRelation();
            }
        }

        return true;
    }

    /**
     * 切断该产品下面的所有套餐与快照的联系
     */
    private function cutRelation()
    {
        $comboId = Combo::find()->where(['product_id' => $this->id])->select('combo_id')->column();
        if (!empty($comboId)) {
            $snapshots = Snapshot::find()->where(['in','snap_combo_id',$comboId])->all();
            if (!is_null($snapshots)) {
                foreach ($snapshots as $snapshot) {
                    $snapshot->snap_combo_id = 0;
                    $snapshot->save(false);
                }
            }
        }
    }
}
