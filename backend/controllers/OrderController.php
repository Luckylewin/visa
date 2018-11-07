<?php

namespace backend\controllers;

use app\models\OrderToTransactor;
use backend\components\Excel;
use backend\models\Admin;
use backend\models\form\StaticsForm;
use backend\models\Statics;
use common\models\ExportSetting;
use common\models\Type;
use Yii;
use common\models\Order;
use common\models\OrderQuery;
use common\models\Transator;
use yii\bootstrap\ActiveForm;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

/**
 * OrderController implements the CRUD actions for Order model.
 */
class OrderController extends BaseController
{

    public function beforeAction($action)
    {
        if (in_array($action->id, ['update', 'create'])) {

            if (Type::isSuperAdmin() == true) {
                 $allow = ['custom_servicer_id' => true];
            } else {
                 $allow = ['custom_servicer_id' => false];
            }

            Yii::$app->params['allow'] = $allow;
        }

        return true;
    }


    public function actionIndex()
    {
        $searchModel = new OrderQuery();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        if ($orderQuery = Yii::$app->request->get('OrderQuery')) {
            $queryParams = base64_encode(json_encode(Yii::$app->request->queryParams));
        } else {
            $queryParams = '';
        }

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'queryParams' => $queryParams
        ]);
    }

    public function actionView($id)
    {
        $isShow = ExportSetting::getShowSetting();

        return $this->render('view', [
            'model' => $this->findModel($id),
            'showCost' => $isShow
        ]);
    }


    public function actionCreate()
    {
        $model = new Order();
        $data = Yii::$app->request->post();

        if (Yii::$app->request->isGet) {
            // 判断是否为操作者
            if (Type::isOperator()) {
                Yii::$app->session->setFlash('info', '没有新增订单权限');
                return $this->redirect(['order/index']);
            } else if (!Type::isServicer() && !Type::isSuperAdmin()) {
                Yii::$app->session->setFlash('info', '请联系管理员，绑定帐号');
                return $this->redirect(['order/index']);
            }
        }

        if ($model->load($data) && ($order_id = $model->save())) {
            Transator::appendToOrder($data[$model->formName()]['transactor_id'], $model->id ,$model->isNewRecord);
            Yii::$app->session->setFlash('success', "创建成功");
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            if ($model->hasErrors()) {
                $error = isset($model->getErrors()[0]) ? $model->getErrors()[0] : '未知错误,请通知开发者';
                Yii::$app->session->setFlash('error', $error);
            }

            // 默认值载入
            $model->refund_status    = Order::REFUND_STATUS_PENDING;
            $model->draw_bill_status = Order::STATUS_NO;

            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }


    public function actionValidateForm()
    {
        Yii::$app->response->format = Response::FORMAT_JSON;
        if (Yii::$app->request->isAjax) {
            $model = new Order();
            $model->load(Yii::$app->request->post());
            $model->scenario = 'create';
            return ActiveForm::validate($model);
        }
    }

    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $data = Yii::$app->request->post();

        if ($model->load($data) && $model->save()) {

            Transator::appendToOrder($data[$model->formName()]['transactor_id'], $model->id ,$model->isNewRecord);
            Yii::$app->getSession()->setFlash('success', '保存成功');
            return $this->redirect(['view', 'id' => $model->id]);
        } else {

            if (Yii::$app->getRequest()->isPost) {
                $error = $model->getFirstErrors();
                $error = !empty($error) ? $error : "未知错误";
                Yii::$app->getSession()->setFlash('error', $error);
            }
            
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        //删除订单-办理者关联关系
        $model->delete();

        Yii::$app->session->setFlash('success', '操作成功');
        return $this->redirect(['index']);
    }

    public function actionDeleteAll()
    {
        $response = Yii::$app->response;
        $response->format = Response::FORMAT_JSON;
        $post_ids = implode(',', Yii::$app->request->post('ids'));

        $order = new Order();
        $order->deleteAll("id in ($post_ids)");

        Yii::$app->session->setFlash('success', '操作成功');
        $response->data = ['code'=>'0','msg'=>'success','data'=>''];
        $response->send();
    }

    protected function findModel($id)
    {
        if (($model = Order::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionExportStatics($post)
    {
        if ($post) {
            $model = new StaticsForm();
            if ($model->load(json_decode(base64_decode($post), true))) {
                $data = $model->statics();

                if (empty($data[0]['data']) && empty($data[0]['data'])) {
                    Yii::$app->session->setFlash('error', '没有统计数据可导出');
                    return $this->redirect(Yii::$app->request->referrer);
                }

                if ($data) {
                    Excel::exportStatics($data);
                }
            }
        }


    }

    public function actionReport()
    {
        // 今天 昨天 这个月 上个月 的统计
        $during = [
            [
                'start' => date('Y-m-d'),
                'end'   => date('Y-m-d'),
                'title' => '今天'
            ],
            [
                'start' => date('Y-m-d', strtotime('yesterday')),
                'end'   => date('Y-m-d', strtotime('yesterday')),
                'title' => '昨天'
            ],
            [
                'start' => date('Y-m-d', strtotime('first day of this month')),
                'end'   => date('Y-m-d', strtotime('last day of this month')),
                'title' => '本月'
            ],
            [
                'start' => date('Y-m-d', strtotime('first day of last month')),
                'end'   => date('Y-m-d', strtotime('last day of last month')),
                'title' => '上月'
            ]
        ];

        $data = [];

        foreach ($during as $key => $during) {
            $data[] = [
                'start' => $during['start'],
                'end'   => $during['end'],
                'title' => $during['title'],
                'data'  => Statics::work($during['start'], $during['end'])
            ];

        }

        $fields = array_keys($data[0]['data']);

        foreach ($fields as $field) {
            $flag = false;
            for ($i=0; $i<=3; $i++) {
                if (!empty($data[$i]['data'][$field]['cost_total']) || !empty($data[$i]['data'][$field]['sale_total'])) {
                    $flag = true;
                }
            }

            if ($flag == false) {
                unset($data[0]['data'][$field], $data[1]['data'][$field], $data[2]['data'][$field], $data[3]['data'][$field]);
            }
        }

        return $this->render('report', ['data' => $data]);
    }

    public function actionChart()
    {

        // 今天 昨天 这个月 上个月 的统计
        $during = [
            [
                'start' => date('Y-m-d'),
                'end'   => date('Y-m-d'),
                'title' => '今天'
            ],
            [
                'start' => date('Y-m-d', strtotime('yesterday')),
                'end'   => date('Y-m-d', strtotime('yesterday')),
                'title' => '昨天'
            ]
        ];

        $data = [];

        foreach ($during as $key => $during) {
            $data[] = [
                'start' => $during['start'],
                'end'   => $during['end'],
                'title' => $during['title'],
                'data'  => Statics::getTypeStatics($during['start'], $during['end'])
            ];
        }

        $chartData = [];
        $types = Type::getComboClassify();
        foreach ($types as $type) {
            $chartData[$type] = [
                '销售额' => [
                    '今天' => empty($data[0]['data'][$type]['sale_total']) ? 0 : $data[0]['data'][$type]['sale_total'],
                    '昨天' => empty($data[1]['data'][$type]['sale_total']) ? 0 : $data[1]['data'][$type]['sale_total'],
                ],
                '订单人数' => [
                    '今天' => empty($data[0]['data'][$type]['total_person']) ? 0 : $data[0]['data'][$type]['total_person'],
                    '昨天' => empty($data[1]['data'][$type]['total_person']) ? 0 : $data[1]['data'][$type]['total_person'] ,
                ],
                '毛利' => [
                    '今天' => empty($data[0]['data'][$type]['total_person']) ? 0 : $data[0]['data'][$type]['total_person'],
                    '昨天' => empty($data[1]['data'][$type]['total_person']) ? 0 : $data[1]['data'][$type]['total_person'] ,
                ]
            ];
        }

       return $this->render('echart', ['data' => $chartData]);

    }

    public function actionStatics()
    {
        if (Type::isSuperAdmin() == false) {
            Yii::$app->session->setFlash('error', '没有操作权限');
            return $this->redirect(Yii::$app->request->referrer);
        }

        $model = new StaticsForm();
        $data  = false;

        if (Yii::$app->request->isPost) {
            if ($model->load(Yii::$app->request->post())) {
                $data = $model->statics();
            }
        }

        return $this->render('statics', [
            'model' => $model,
            'data'  => $data,
            'post'  => base64_encode(json_encode(Yii::$app->request->post()))
        ]);
    }
}
