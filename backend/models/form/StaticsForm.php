<?php
/**
 * Created by PhpStorm.
 * User: lychee
 * Date: 2018/10/29
 * Time: 9:37
 */

namespace backend\models\form;


use common\models\Order;
use common\models\Product;
use common\models\Type;
use yii\base\Model;
use yii\helpers\ArrayHelper;

/**
 * Class StaticsForm
 * @package backend\models\form
 *
 * @property string $dateOneStart
 * @property string $dateOneEnd
 * @property string $dateTwoStart
 * @property string $dateTwoEnd
 */
class StaticsForm extends  Model
{
    public $dateOneStart; // 时间段1 start
    public $dateOneEnd;   // 时间段1 end
    public $dateTwoStart; // 时间段2 start
    public $dateTwoEnd;   // 时间段2 end
    private $during = [];

    public function rules()
    {
        return [
            [['dateOneStart'], 'required'],
            [['dateOneStart', 'dateOneEnd', 'dateTwoStart', 'dateTwoEnd'], 'date'],
            ['dateTwoStart', 'required',
                'when' => function($model) {
                            return !empty($model->dateTwoEnd);
                         },
                'whenClient' => "function(attribute, value){
                    return $('#staticsform-datetwoend').val() != ''
                }"
            ],
            [
                ['dateTwoEnd'],
                'required',
                'when' => function($model) {
                    return !empty($model->dateOneEnd) && !empty($model->dateTwoStart);
                },
                'whenClient' => "function(attribute, value){
                    return $('#staticsform-dateoneend').val() != '' && $('#staticsform-datetwostart').val() != ''
                }"
            ]
        ];
    }

    public function attributeLabels()
    {
        return [
            'dateOneStart' => '时间一开始',
            'dateOneEnd'   => '时间一结束',
            'dateTwoStart' => '时间二开始',
            'dateTwoEnd'   => '时间二结束',
        ];
    }

    public function statics()
    {
        $this->filterCondition();
        $data = [];

        foreach ($this->during as $key => $during) {
            $data[] = [
                'start' => $during['start'],
                'end'   => $during['end'],
                'title' => $during['title'],
                'data'  => $this->work($during['start'], $during['end'])
            ];

        }

        foreach ($data[0]['data'] as $field => $item) {
            if ($item['total_person'] == 0 && empty($data[1]['data'][$field]['total_person'])) {
                unset($data[0]['data'][$field], $data[1]['data'][$field]);
            }
        }

        return $data;
    }

    protected function work($start, $end)
    {
        $data = [];

        // 三种类型统计
        $classifies = [
            Order::CLASSIFY_STATUS_SHOP     => '网店',
            Order::CLASSIFY_STATUS_CLIENT   => '直客',
            Order::CLASSIFY_STATUS_BUSINESS => '同业',
        ];

       foreach ($classifies as $key => $val) {
            $classify_data = [
                'cost_total'   => 0,
                'sale_total'   => 0,
                'total_person' => 0,
            ];
            $status = Order::find()->select("combo_id,sum(combo_cost*total_person) as cost_total,sum(single_sum*total_person) as sale_total,sum(total_person) as total_person")
                                    ->joinWith('snapshot',false, 'LEFT JOIN')
                                    ->where(['>=', 'order_date', $start])
                                    ->andWhere(['<=', 'order_date', $end ])
                                    ->andWhere(['>', 'combo_id', 0 ])
                                    ->andWhere(['=', 'order_classify', $key])
                                    ->asArray()
                                    ->limit(1)
                                    ->one();
            $data[$classifies[$key]] = $status ? $status : $classify_data;

        }

        // 产品列表中的数据
        $productsDB = Product::find()->select('name')->asArray()->column();

        // 快照中每个产品分别统计
        $orders = Order::find()->select("combo_product,combo_id,count(*)")
                                ->joinWith('snapshot')
                                ->groupBy('combo_product')
                                ->andWhere(['>=', 'order_date', $start])
                                ->andWhere(['<=', 'order_date', $end ])
                                ->asArray()
                                ->all();

        $products = ArrayHelper::merge($productsDB, ArrayHelper::getColumn($orders, 'combo_product'));
        $products = array_unique($products);

        if (!empty($products)) {
            foreach ($products as $product) {
                $order = Order::find()->select("combo_id,sum(combo_cost*total_person) as cost_total,sum(single_sum*total_person) as sale_total,sum(total_person) as total_person")
                                    ->joinWith('snapshot',false, 'Left JOIN')
                                    ->where(['>=', 'order_date', $start])
                                    ->andWhere(['<=', 'order_date', $end ])
                                    ->andwhere(['=', 'combo_product', $product])
                                    ->asArray()
                                    ->limit(1)
                                    ->one();

                $data[$product] = $order;
            }
        }

        return $data;
    }

    protected function filterCondition()
    {
        $during = [];
        // 判断时间
        if ($this->dateOneEnd) {
            $during[] = [
                'start' => $this->dateOneStart,
                'end'   => $this->dateOneEnd,
                'title' => $this->dateOneStart. '到' . $this->dateOneEnd . '数据'
            ];

            // 如果时间1，时间2全部参数都填写了，正常显示
            if ($this->dateTwoStart) {
                $during[] = [
                    'start' => $this->dateTwoStart,
                    'end'   => $this->dateTwoEnd,
                    'title' => $this->dateTwoStart. '到' . $this->dateTwoEnd . '数据'
                ];
            } else {
                // 如果只填时间1段，就显示时间1段，就显示时间段1和时间1段上个月的数据
                $start = date('Y-m-d', strtotime($this->dateOneStart . '-1 month'));
                $end   = date('Y-m-d', strtotime($this->dateOneEnd . '-1 month'));
                $during[] = [
                    'start' => $start,
                    'end'   => $end,
                    'title' => $start. '到' . $end . '数据'
                ];

            }
        } else {
            // 如果只填时间1（不是时间段，只是1天），就显示时间1和时间前1天的数据
            $during[] = [
                'start' => $this->dateOneStart,
                'end'   => $this->dateOneStart,
                'title' => $this->dateOneStart . '的数据',
            ];

            $during[] = [
                'start' => date('Y-m-d', strtotime($this->dateOneStart . '-1 day')),
                'end'   => date('Y-m-d', strtotime($this->dateOneStart . '-1 day')),
                'title'   => date('Y-m-d', strtotime($this->dateOneStart . '-1 day')) . '的数据',
            ];

        }

        $this->during = $during;
    }





}