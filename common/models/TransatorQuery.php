<?php

namespace common\models;

/**
 * This is the ActiveQuery class for [[Transator]].
 *
 * @see Transator
 */
class TransatorQuery extends \yii\db\ActiveQuery
{
    /*public function active()
    {
        return $this->andWhere('[[status]]=1');
    }*/

    /**
     * @inheritdoc
     * @return Transator[]|array
     */
    public function all($db = null)
    {
        return parent::all($db);
    }

    /**
     * @inheritdoc
     * @return Transator|array|null
     */
    public function one($db = null)
    {
        return parent::one($db);
    }
}
