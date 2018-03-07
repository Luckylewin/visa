<?php

namespace backend\controllers;

use app\models\OrderToTransactor;
use common\models\Order;
use Yii;
use common\models\Transator;
use common\models\TransatorQuery;
use backend\controllers\BaseController;
use yii\db\Exception;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

/**
 * TransatorController implements the CRUD actions for Transator model.
 */
class TransatorController extends BaseController
{
    
    /**
     * Lists all Transator models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new TransatorQuery();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Transator model.
     * @param integer $id
     * @return mixed
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Transator model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Transator();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            Yii::$app->session->setFlash('success', '操作成功');
            return $this->redirect(['view', 'id' => $model->tid]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    public function actionCreateByAjax()
    {
        $this->enableCsrfValidation = false;
        $model = new Transator();
        $response = Yii::$app->getResponse();
        $response->format = Response::FORMAT_JSON;

        $post = Yii::$app->request->post();
        //先查找一下有没有这个人

        $transactor = Transator::findOne(['name'=>$post[$model->formName()]['name'], 'is_valid' => '0']);

        if (!is_null($transactor) && $transactor->expire_time < (time() +86400)) {
            return $data = ['error' => 'success','msg' => 'success', 'data'=>['tid'=>$transactor->tid,'name'=>$transactor->name]];
        }

        if ($model->load($post) && $model->save()) {
           return $data = ['error' => 'success','msg' => 'success', 'data'=>['tid'=>$model->tid,'name'=>$model->name]];
        }else {
           return $data = ['error' => 'error','msg' => current($model->getFirstErrors()), 'data'=>''];
        }

    }

    public function actionUpdateByAjax()
    {
        $model = new Transator();
        $post = Yii::$app->request->post();
        $transactor = $model->findOne(['tid' => $post[$model->formName()]['tid']]);
        $transactor->remark = $post[$model->formName()]['remark'];
        $transactor->update();
    }

    //添加联系人查询
    public function actionQuery()
    {
        $this->layout = false;
        $callback = Yii::$app->getRequest()->get('callback');
        $keyword = Yii::$app->getRequest()->get('q');

        try {
            $data = Yii::$app->db->createCommand("SELECT tid, name,remark from yii2_transator WHERE NAME LIKE '%$keyword%' LIMIT 100")->queryAll();
        }catch (Exception $e) {
            $data = [];
        }

        array_walk($data, function (&$v,$k){
            return $v = array_values($v);
        });
        $data = json_encode(['result'=>$data]);

        $response = Yii::$app->response;
        $response->format = Response::FORMAT_HTML;
        $response->data = $callback . "($data)";
        $response->send();
    }

    /**
     * Updates an existing Transator model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            Yii::$app->session->setFlash('info', '操作成功');
            return $this->redirect(['view', 'id' => $model->tid]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Transator model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     */
    public function actionDelete($id)
    {
        //删除之前判断下 这个人有没有订单
        $relations = OrderToTransactor::find()->where(['t_id' => $id])->all();

        $flag = false;
        foreach ($relations as $relation) {
            $order = Order::findOne($relation->o_id);
            if (is_null($order)) {
                OrderToTransactor::deleteAll(['o_id' => $relation->o_id, 't_id'=> $relation->t_id]);
            } else {
                $flag = true;
            }
        }

        if ($flag === false) {
            $this->findModel($id)->delete();
            Yii::$app->session->setFlash('success', '操作成功');
        } else {
            Yii::$app->session->setFlash('error', '该用户有订单数据，无法删除');
        }

        return $this->redirect(['index']);
    }

    /**
     * Finds the Transator model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Transator the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Transator::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
