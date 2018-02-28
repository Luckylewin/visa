<?php

namespace backend\controllers;

use app\models\OrderToTransactor;
use common\models\ExportSetting;
use Yii;
use common\models\Order;
use common\models\OrderQuery;
use common\models\Transator;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

/**
 * OrderController implements the CRUD actions for Order model.
 */
class OrderController extends BaseController
{

    /**
     * Lists all Order models.
     * @return mixed
     */
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

    /**
     * Displays a single Order model.
     * @param string $id
     * @return mixed
     * @throws
     */
    public function actionView($id)
    {
        $isShow = ExportSetting::getShowSetting();

        return $this->render('view', [
            'model' => $this->findModel($id),
            'showCost' => $isShow
        ]);
    }

    /**
     * Creates a new Order model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Order();
        $data = Yii::$app->request->post();

        if ($model->load($data) && ($order_id = $model->save())) {
            Transator::appendToOrder($data[$model->formName()]['transactor_id'], $model->id ,$model->isNewRecord);
            Yii::$app->session->setFlash('success', "创建成功");
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            if ($model->hasErrors()) {
                $error = isset($model->getErrors()[0]) ? $model->getErrors()[0] : '未知错误,请通知开发者';
                Yii::$app->session->setFlash('error', $error);
            }
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Order model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     */
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

            $identity = Yii::$app->user->identity;
            //判断订单所属者
            if ( $identity->username != 'admin' && $identity->getId() != $model->operator_id ) {
                Yii::$app->getSession()->setFlash('error', '操作失败: 只能修改自己创建的订单');
                return $this->redirect(Yii::$app->request->referrer);
            }
            
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Order model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param string $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        $model = $this->findModel($id);

        //判断订单所属者
        $identity = Yii::$app->user->identity;
            if ( $identity->username != 'admin' && $identity->getId() != $model->operator_id ) {
                Yii::$app->getSession()->setFlash('error', '操作失败: 只能删除自己创建的订单');
                return $this->redirect(Yii::$app->request->referrer);
        }

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
        return $response->send();
    }

    /**
     * Finds the Order model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Order the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Order::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
