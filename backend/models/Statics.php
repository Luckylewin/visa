<?php
/**
 * Created by PhpStorm.
 * User: lychee
 * Date: 2018/11/7
 * Time: 14:06
 */

namespace backend\models;

use common\models\Order;
use common\models\Product;
use common\models\Snapshot;
use yii\db\Query;
use yii\helpers\ArrayHelper;

class Statics
{

    public static function getBalance()
    {
        return Snapshot::find()->select('id')
                               ->filterWhere(['like', 'combo_product', '补差'])
                               ->column();
    }

    private static function getQuery(Query $query, $key)
    {
        return $status = $query->andWhere(['>', 'combo_id', 0 ])
                               ->andWhere(['=', 'order_classify', $key])
                               ->asArray()
                                ->limit(1)
                                ->one();
    }

    private static function getProductQuery(Query $query, $product)
    {
        return $order = $query->andwhere(['=', 'combo_product', $product])
            ->asArray()
            ->limit(1)
            ->one();
    }

    private static function getSelectField()
    {
       return $selectField = "combo_id,
                            sum(cost*total_person) as cost_total,
                            sum(flushphoto_sum*combo_charge) as flushphoto_total,
                            sum(output_flushphoto_sum) as output_flushphoto_total,
                            sum(carrier_sum*combo_charge) as carrier_total,
                            sum(output_carrier_sum) as output_carrier_total,
                            sum(balance_sum*combo_charge) as balance_total,
                            sum(output_balance_sum) as output_balance_total,
                            sum(single_sum*total_person*combo_charge) as sale_total,
                            sum(total_person) as total_person";
    }

    public static function getTypeStatics($start, $end)
    {
        $data = [];

        // 三种类型统计
        $classifies = [
            Order::CLASSIFY_STATUS_SHOP     => '网店',
            Order::CLASSIFY_STATUS_CLIENT   => '直客',
            Order::CLASSIFY_STATUS_BUSINESS => '同业',
        ];

        // 查询哪些是补差
        $balances = self::getBalance();

        foreach ($classifies as $key => $val) {
            $classify_data = [
                'cost_total'   => 0,
                'sale_total'   => 0,
                'total_person' => 0,
                'fee'          => 0,
            ];

            if ($start == $end) {
                $query = Order::find()->select(self::getSelectField())
                                      ->joinWith('snapshot',false, 'LEFT JOIN')
                                      ->where(['=', 'order_date', $start]);
                // 重新计算订单人数
                $totalPersonQuery = Order::find()->select("sum(total_person) as total_person")
                                                 ->joinWith('snapshot',false, 'LEFT JOIN')
                                                 ->where(['=', 'order_date', $start])
                                                 ->andwhere(['NOT IN', 'yii2_snapshot.id', $balances]);

            } else {
                $query = Order::find()->select(self::getSelectField())
                                      ->joinWith('snapshot',false, 'LEFT JOIN')
                                      ->where(['>=', 'order_date', $start])
                                      ->andWhere(['<=', 'order_date', $end ]);

                // 重新计算订单人数
                $totalPersonQuery = Order::find()->select("sum(total_person) as total_person")
                                    ->joinWith('snapshot',false, 'LEFT JOIN')
                                    ->where(['>=', 'order_date', $start])
                                    ->andWhere(['<=', 'order_date', $end ])
                                    ->andwhere(['NOT IN', 'yii2_snapshot.id', $balances]);
            }

            $status                 = self::getQuery($query, $key);
            $totalPersonQuery       = self::getQuery( $totalPersonQuery, $key);
            $status['total_person'] = $totalPersonQuery['total_person'];
            $status['income']       = $status['sale_total'] + $status['carrier_total'] + $status['balance_total'] + $status['flushphoto_total'];
            $status['output']       = $status['cost_total'] + $status['output_carrier_total'] + $status['output_balance_total'] + $status['output_flushphoto_total'];
            $status['fee']          = sprintf('%.2f', $status['income'] - $status['output']);
            $status['cost_total']   = sprintf('%.2f',  $status['cost_total']);
            $status['sale_total']   = sprintf('%.2f',  $status['sale_total']);




            $data[$classifies[$key]] = $status ? $status : $classify_data;
        }

        return $data;
    }

    public static function getProductStatics($start, $end)
    {
        $data = [];
        // 产品列表中的数据
        $productsDB = Product::find()->select('name')->asArray()->column();

        // 快照中每个产品分别统计
        $query = Order::find()->select("combo_product,combo_id,count(*)")
            ->joinWith('snapshot')
            ->groupBy('combo_product');



        if ($start == $end) {
            $query->andWhere(['=', 'order_date', $start]);
        } else {
            $query->andWhere(['>=', 'order_date', $start])->andWhere(['<=', 'order_date', $end ]);
        }

        $orders = $query->asArray()->all();

        $products = ArrayHelper::merge($productsDB, ArrayHelper::getColumn($orders, 'combo_product'));
        $products = array_unique($products);

        // 查询哪些是补差
        $balances = self::getBalance();

        if (!empty($products)) {
            foreach ($products as $product) {
                $query = Order::find()
                            ->select(self::getSelectField())
                            ->joinWith('snapshot',false, 'Left JOIN');

                if ($start == $end) {
                    $query->where(['=', 'order_date', $start]);

                    // 重新计算订单人数
                    $totalPersonQuery = Order::find()->select("sum(total_person) as total_person")
                        ->joinWith('snapshot',false, 'LEFT JOIN')
                        ->where(['=', 'order_date', $start])
                        ->andwhere(['NOT IN', 'yii2_snapshot.id', $balances]);
                } else {
                    $query->where(['>=', 'order_date', $start])
                          ->andWhere(['<=', 'order_date', $end ]);

                    // 重新计算订单人数
                    $totalPersonQuery = Order::find()->select("sum(total_person) as total_person")
                                    ->joinWith('snapshot',false, 'LEFT JOIN')
                                    ->where(['>=', 'order_date', $start])
                                    ->andWhere(['<=', 'order_date', $end ])
                                    ->andwhere(['NOT IN', 'yii2_snapshot.id', $balances]);

                }

                $order                 = self::getProductQuery($query, $product);
                $totalPersonQuery      = self::getProductQuery($totalPersonQuery, $product);
                $order['total_person'] = $totalPersonQuery['total_person'];
                $order['income']       = $order['sale_total'] + $order['carrier_total'] + $order['balance_total'] + $order['flushphoto_total'];
                $order['output']       = $order['cost_total'] + $order['output_carrier_total'] + $order['output_balance_total'] + $order['output_flushphoto_total'];
                $order['fee']          = sprintf('%.2f', $order['income'] - $order['output']);
                $order['cost_total']   = sprintf('%.2f',  $order['cost_total']);
                $order['sale_total']   = sprintf('%.2f',  $order['sale_total']);

                $data[$product] = $order;
            }
        }

        return $data;
    }

    public static function work($start, $end)
    {
        $types    = self::getTypeStatics($start, $end);
        $products = self::getProductStatics($start, $end);

        return array_merge($types, $products);
    }
}