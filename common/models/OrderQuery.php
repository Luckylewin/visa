<?php

namespace common\models;

use app\models\OrderToTransactor;
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
    public $order_date_start;
    public $order_date_end;
    public $deliver_date_start;
    public $deliver_date_end;
    public $entry_date_start;
    public $entry_date_end;
    public $putsign_date_start;
    public $putsign_date_end;
    public $delivergood_date_start;
    public $delivergood_date_end;
    public $receipt_date_start;
    public $receipt_date_end;
    public $pay_date_start;
    public $pay_date_end;
    public $collect_date_start;
    public $collect_date_end;
    public $company_receipt_date_start;
    public $company_receipt_date_end;
    public $is_pay;
    public $is_shop_receipt;
    public $is_company_receipt;

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['id', 'pid',  'combo_id', 'custom_servicer_id', 'total_person'], 'integer'],
            [
                [   "order_date_start", "order_date_end",
                    "deliver_date_start", "deliver_date_end",
                    "entry_date_start", "entry_date_end",
                    "putsign_date_start", "putsign_date_end",
                    "delivergood_date_start", "delivergood_date_end",
                    "receipt_date_start", "receipt_date_end",
                    "pay_date_start",   "pay_date_end",
                    "collect_date_start", "collect_date_end",
                    'company_receipt_date_start', "company_receipt_date_end",
                    'customer_id', 'order_num', 'order_classify',
                    'order_type', 'order_date', 'transactor_name',
                    'balance_order', 'flushphoto_order', 'carrier_order',
                    'collect_date', 'deliver_date', 'entry_date', 'putsign_date',
                    'operator', 'back_address', 'back_addressee', 'back_telphone',
                    'delivergood_date', 'deliver_order', 'remark', 'receipt_date',
                    'pay_date', 'audit_status', 'cid', 'company_receipt_date',
                    'is_pay', 'is_company_receipt','is_shop_receipt'
                ], 'safe'],
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
        $query = Order::find()->with(['middleTransator.transator','snapshot', 'servicer']);

        // add conditions that should always apply here
        if ($all) {
            $condition = [
                'query' => $query,
                'pagination' => false,
                'sort'=> [
                    'defaultOrder' => [
                        'id'=>SORT_DESC
                    ]
                ]
            ];
        } else {
            $condition = [
                'query' => $query,
                'pagination' => ['pageSize' => 20],
                'sort'=> [
                    'defaultOrder' => [
                        'id'=>SORT_DESC
                    ]
                ]
            ];
        }

        $dataProvider = new ActiveDataProvider($condition);

        if (isset($params['OrderQuery'])) {
            $params['OrderQuery'] = array_filter($params['OrderQuery']);

            //关联表处理
            if (isset($params['OrderQuery']['transactor_id'])) {
                 $transator = Transator::find()->select('tid')->andFilterWhere(['like', 'name', $params['OrderQuery']['transactor_id']])->asArray()->all();
                 $transator = ArrayHelper::getColumn($transator, 'tid');
                 $transator_name = $params['OrderQuery']['transactor_id'];
                 $ids = 0;
                 if (!empty($transator)) {
                        $transators = OrderToTransactor::find()->where(['in','t_id', $transator])->asArray()->all();
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

        $payFields = [
            'is_pay', 'is_shop_receipt', 'is_company_receipt'
        ];

        foreach ($payFields as $payField) {
                 if (!$this->$payField) {
                    continue;
                 }
                 switch ($payField)
                 {
                     case 'is_pay' :
                         if ($this->$payField == 1) {
                             $query->andFilterWhere(["<", 'pay_date', '0']);
                         } else {
                             $query->andFilterWhere([">", 'pay_date', '0']);
                         }
                     break;

                     case 'is_shop_receipt' :
                         if ($this->$payField  == 1) {
                             $query->andFilterWhere(["<", 'receipt_date', '0']);
                         }else{
                             $query->andFilterWhere([">", 'receipt_date', '0']);
                         }
                         break;

                     case 'is_company_receipt':
                         if ($this->$payField  == 1) {
                             $query->andFilterWhere(["<", 'company_receipt_date', '0']);
                         }else{
                             $query->andFilterWhere([">", 'company_receipt_date', '0']);
                         }
                         break;
                 }
        }

        $dateFields = [
                        "order_date_start", "order_date_end",
                        "deliver_date_start", "deliver_date_end",
                        "entry_date_start", "entry_date_end",
                        "putsign_date_start", "putsign_date_end",
                        "delivergood_date_start", "delivergood_date_end",
                        "receipt_date_start", "receipt_date_end",
                        "pay_date_start",   "pay_date_end",
                        "collect_date_start", "collect_date_end",
                        'company_receipt_date_start', "company_receipt_date_end"
        ];

        foreach ($dateFields as $dateField) {

            if ($this->$dateField) {
                $value = trim($this->$dateField);
                if (strpos($dateField, "start") !== false) {
                    $field = str_replace('_start', "", $dateField);

                    $endField = $field . '_end';
                    if ($this->$endField) {
                        $query->andFilterWhere([">=", $field, $value]);
                    } else {
                        $query->andFilterWhere(["=", $field, $value]);
                    }
                } else {
                    $field = str_replace('_end', "", $dateField);
                    $query->andFilterWhere(["<=", $field, $value]);
                }
            }
        }

        // grid filtering conditions
        $query->andFilterWhere([
            'id' => $this->id,

            'customer_id' => $this->customer_id,
            'combo_id' => $this->combo_id,
            'custom_servicer_id' => $this->custom_servicer_id,
            'transactor_id' => $this->transactor_id,
            'total_person' => $this->total_person,
            'cid' => $this->cid,
            'order_classify' => $this->order_classify,
            'order_type' => $this->order_type,
        ]);

        $query->andFilterWhere(['like', 'carrier_order', $this->carrier_order])
            ->andFilterWhere(['like', 'operator', $this->operator])
            ->andFilterWhere(['like', 'back_address', $this->back_address])
            ->andFilterWhere(['like', 'order_num', $this->order_num])
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
