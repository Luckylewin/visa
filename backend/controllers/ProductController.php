<?php

namespace backend\controllers;

use Yii;
use common\models\Product;
use common\models\ProductQuery;
use backend\controllers\BaseController;
use yii\db\Query;
use yii\helpers\Json;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\web\Response;

/**
 * ProductController implements the CRUD actions for Product model.
 */
class ProductController extends BaseController
{

    /**
     * Lists all Product models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ProductQuery();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Product model.
     * @param integer $id
     * @return mixed
     * @throws
     */
    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Product model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Product();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            Yii::$app->getSession()->setFlash('success','操作成功');
	        return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Updates an existing Product model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param integer $id
     * @return mixed
     * @throws
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->getSession()->setFlash('info','操作成功');
            return $this->redirect(['view', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    /**
     * Deletes an existing Product model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @param integer $id
     * @return mixed
     * @throws
     */
    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        Yii::$app->session->setFlash('success', '操作成功');
        return $this->redirect(['index']);
    }

    /**
     * Finds the Product model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Product the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Product::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionQuery()
    {
        $this->layout = false;
        $callback = Yii::$app->getRequest()->get('callback');
        $keyword = Yii::$app->getRequest()->get('q');

        try {
            $data = Yii::$app->db->createCommand("SELECT id,name FROM yii2_product WHERE name LIKE '%$keyword%' ORDER BY id desc LIMIT 500")->queryAll();
        }catch(\Exception $e) {
            $data = [];
        }
        array_walk($data, function (&$v,$k){
           return $v = array_values($v);
        });
        $data = json_encode(['result'=>$data]);

        $response = Yii::$app->response;
        $response->format = Response::FORMAT_HTML;
        $response->data = $callback . "($data)";
        //$response->data = $callback . '({"result":[["最初的爱情最后的仪式","1204"],["最初的你是我最后的爱","68"],["最初和最终的自由","453"],["最初的梦想","358"],["最初三分钟","179"],["最初的90天","119"],["最初梦想潮流店","552"],["最初的梦想伴奏","44"],["最初的爱情,最后的仪式","83"],["最初的爱最后的爱","318"]]})';
        $response->send();
    }

    public function actionProduct()
    {
        $this->layout = false;
        $response = Yii::$app->response;
        $response->format = Response::FORMAT_JSON;
        $response->data = ['message'=>'success', 'value' => Product::getJsonData()];
        $response->send();
    }

    /**
     * @param $product_id
     * @param $type
     */
    public function actionMyProduct($product_id, $type, $classify)
    {
        $this->layout = false;
        $response = Yii::$app->response;
        $response->format = Response::FORMAT_JSON;

        if ($classify) {
            $where = ['product_id'=>$product_id,'combo_type'=>$type, 'combo_classify'=>$classify];
        }else {
            $where = ['product_id'=>$product_id,'combo_type'=>$type];
        }

        $query = (new Query())
                ->select('c.*')
                ->from('yii2_product AS a')
                ->leftJoin('yii2_combo AS c','c.product_id = a.id')
                ->where($where)
                ->orderBy('combo_type ASC')
                ->all();

        if (isset($query[0]) && !empty($query)) {
            $response->data = ['error'=>'success','message'=>'success', 'value' => $query];
        } else {
            $response->data = ['error'=>'fail','message'=>'no data', 'value' => ''];
        }

        $response->send();

    }
}
