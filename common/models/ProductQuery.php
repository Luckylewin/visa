<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;


/**
 * ProductQuery represents the model behind the search form about `common\models\Product`.
 */
class ProductQuery extends Product
{

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id'], 'integer'],
            [['name', 'type', 'order_type', 'country_id'], 'safe'],
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
        $query = Product::find();

        // add conditions that should always apply here

        $dataProvider = new ActiveDataProvider([
            'query' => $query,
            'pagination' => ['pageSize'=>20],
            'sort' => [
//                'defaultOrder' => [
//                    'id' => SORT_DESC
//                ],
/*                'attributes' => [
                    'authorName' => [
                        'desc' => [
                            'adminuser.nickname' => SORT_DESC,
                        ],
                        'asc'  => [
                            'adminuser.nickname' => SORT_ASC
                        ],
                    ]
                ]*/
            ]
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
        ]);

        $query->andFilterWhere(['like', 'name', $this->name]);

        return $dataProvider;
    }
}
