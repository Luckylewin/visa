<?php

namespace common\models;

use Yii;
use yii\base\Model;
use yii\data\ActiveDataProvider;
use common\models\Order;
use yii\helpers\ArrayHelper;

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
            [['id', 'pid',  'combo_id', 'custom_servicer_id', 'total_person'], 'integer'],
            [['customer_id', 'order_num', 'order_classify', 'order_type', 'order_date', 'transactor_name', 'balance_order', 'flushphoto_order', 'carrier_order', 'collect_date', 'deliver_date', 'entry_date', 'putsign_date', 'operator', 'back_address', 'back_addressee', 'back_telphone', 'delivergood_date', 'deliver_order', 'remark', 'receipt_date', 'pay_date', 'audit_status', 'cid'], 'safe'],
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
     * @param $params
     * @param bool $all
     * @return ActiveDataProvider
     * @throws \yii\db\Exception
     */
    public function search($params, $all = false)
    {

        //处理没有


        $query = Order::find();

        // add conditions that should always apply here
        if ($all) {
            $condition = [
                'query' => $query,
                'pagination' => false,
            ];
        } else {
            $condition = [
                'query' => $query,
                'pagination' => ['pageSize'=>8],
            ];
        }

        $dataProvider = new ActiveDataProvider($condition);

        if (isset($params['OrderQuery'])) {
            $params['OrderQuery'] = array_filter($params['OrderQuery']);

            //关联表处理
            if (isset($params['OrderQuery']['transactor_id'])) {
                 $transator = Transator::findOne(['name' => $params['OrderQuery']['transactor_id']]);
                 $transator_name = $params['OrderQuery']['transactor_id'];

                 $ids = 0;
                 if ($transator) {
                     $transators = Yii::$app->db->createCommand('SELECT o_id FROM yii2_order_to_transactor WHERE t_id = '. $transator->tid)->queryAll();

                     if (!empty($transators)) {
                         $ids = ArrayHelper::getColumn($transators, 'o_id');
                         $ids = implode(',', $ids);
                     }
                 }
            }
        }

        $this->load($params);

        if (!$this->validate()) {
            // uncomment the following line if you do not want to return any records when validation fails
            // $query->where('0=1');
            return $dataProvider;
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,
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
            'receipt_date' => $this->receipt_date,
            'pay_date' => $this->pay_date,
            'cid' => $this->cid,
            'order_classify' => $this->order_classify,
            'order_type' => $this->order_type,
        ]);

        $query->andFilterWhere(['like', 'transactor_name', $this->transactor_name])
            ->andFilterWhere(['like', 'carrier_order', $this->carrier_order])
            ->andFilterWhere(['like', 'operator', $this->operator])
            ->andFilterWhere(['like', 'back_address', $this->back_address])
            ->andFilterWhere(['like', 'back_addressee', $this->back_addressee])
            ->andFilterWhere(['like', 'back_telphone', $this->back_telphone])
            ->andFilterWhere(['like', 'deliver_order', $this->deliver_order]);

        if (isset($ids) && isset($transator_name)) {

            $query->andOnCondition("id in ($ids)");
            $this->transactor_id = $transator_name;
        }

      //$commandQuery = clone $query;
       //echo $commandQuery->createCommand()->getRawSql();

        return $dataProvider;
    }

    public function exportSearch($params)
    {

    }
}
