<?php

namespace backend\models\search;

use common\models\Order;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use backend\models\Operator;

/**
 * OperatorSearch represents the model behind the search form about `backend\models\Operator`.
 */
class StaticsSearch extends Order
{
    public $dateOneStart; // 时间段1 start
    public $dateOneEnd;   // 时间段1 end
    public $dateTwoStart; // 时间段2 start
    public $dateTwoEnd;   // 时间段2 end

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['dateOneStart'], 'required'],
            [['dateOneStart', 'dateOneEnd', 'dateTwoStart', 'dateTwoEnd'], 'date'],
            ['dateTwoStart', 'required', 'when' => function($model) {
                return !empty($this->dateTwoEnd);
            }]
        ];
    }

    /**
     * @inheritdoc
     */
    public function scenarios()
    {
        // bypass scenarios() implementation in the parent class
        return Model::scenarios();
    }

    /**
     * Creates data provider instance with search query applied
     *
     * @param array $params
     *
     * @return ActiveDataProvider
     */
    public function search($params)
    {
        $query = Operator::find()->where(['is_del' => 0]);

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
        ]);

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
            'admin_id' => $this->admin_id,
        ]);

        $query->andFilterWhere(['like', 'name', $this->name]);

        return $dataProvider;
    }
}
