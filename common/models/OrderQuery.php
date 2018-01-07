<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Order;

/**
 * OrderQuery represents the model behind the search form about `common\models\Order`.
 */
class OrderQuery extends Order
{
    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'pid', 'customer_id', 'combo_id', 'custom_servicer_id', 'transactor_id', 'total_person', 'delivercompany_id'], 'integer'],
            [['order_num', 'order_classify', 'order_type', 'order_date', 'transactor_name', 'balance_order', 'flushphoto_order', 'carrier_order', 'collect_date', 'deliver_date', 'entry_date', 'putsign_date', 'operator', 'back_address', 'back_addressee', 'back_telphone', 'delivergood_date', 'deliver_order', 'remark', 'receipt_date', 'pay_date', 'audit_status'], 'safe'],
            [['single_sum', 'balance_sum', 'flushphoto_sum', 'carrier_sum'], 'number'],
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
        $query = Order::find();

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
            'pid' => $this->pid,
            'order_num' => $this->order_num,
            'order_date' => $this->order_date,
            'customer_id' => $this->customer_id,
            'combo_id' => $this->combo_id,
            'custom_servicer_id' => $this->custom_servicer_id,
            'transactor_id' => $this->transactor_id,
            'single_sum' => $this->single_sum,
            'total_person' => $this->total_person,
            'balance_sum' => $this->balance_sum,
            'flushphoto_sum' => $this->flushphoto_sum,
            'carrier_sum' => $this->carrier_sum,
            'collect_date' => $this->collect_date,
            'deliver_date' => $this->deliver_date,
            'entry_date' => $this->entry_date,
            'putsign_date' => $this->putsign_date,
            'delivergood_date' => $this->delivergood_date,
            'delivercompany_id' => $this->delivercompany_id,
            'receipt_date' => $this->receipt_date,
            'pay_date' => $this->pay_date,
        ]);

        $query->andFilterWhere(['like', 'order_classify', $this->order_classify])
            ->andFilterWhere(['like', 'order_type', $this->order_type])
            ->andFilterWhere(['like', 'transactor_name', $this->transactor_name])
            ->andFilterWhere(['like', 'balance_order', $this->balance_order])
            ->andFilterWhere(['like', 'flushphoto_order', $this->flushphoto_order])
            ->andFilterWhere(['like', 'carrier_order', $this->carrier_order])
            ->andFilterWhere(['like', 'operator', $this->operator])
            ->andFilterWhere(['like', 'back_address', $this->back_address])
            ->andFilterWhere(['like', 'back_addressee', $this->back_addressee])
            ->andFilterWhere(['like', 'back_telphone', $this->back_telphone])
            ->andFilterWhere(['like', 'deliver_order', $this->deliver_order])
            ->andFilterWhere(['like', 'remark', $this->remark])
            ->andFilterWhere(['like', 'audit_status', $this->audit_status]);

        return $dataProvider;
    }
}
