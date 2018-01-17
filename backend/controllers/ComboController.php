<?php

namespace backend\controllers;

use common\models\Product;
use Yii;
use common\models\Combo;
use common\models\ComboQuery;
use yii\web\NotFoundHttpException;
use yii\web\Response;

/**
 * ComboController implements the CRUD actions for Combo model.
 */
class ComboController extends BaseController
{

    /**
     * Lists all Combo models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new ComboQuery();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    /**
     * Displays a single Combo model.
     * @param string $id
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
     * Creates a new Combo model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Combo();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            Yii::$app->getSession()->setFlash('success','操作成功');
            return $this->redirect(['product/view', 'id' => $model->product_id]);
        } else {
            $product_id = Yii::$app->request->get('id');
            $productModel = Product::findOne($product_id);

            return $this->render('create', [
                'model' => $model,
                'productModel' => $productModel,
                'product_id' => $product_id
            ]);
        }
    }

    /**
     * Updates an existing Combo model.
     * If update is successful, the browser will be redirected to the 'view' page.
     * @param string $id
     * @return mixed
     * @throws
     */
    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->getSession()->setFlash('info','操作成功');
            return $this->redirect(['product/view', 'id' => $model->product->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
                'productModel' => $model->getProduct(),
            ]);
        }
    }

    /**
     * Deletes an existing Combo model.
     * If deletion is successful, the browser will be redirected to the 'index' page.
     * @return mixed
     * @throws
     */
    public function actionDelete()
    {
        $combo = $this->findModel(Yii::$app->request->post('id'));
        $product_id = $combo->product->id;
        $combo->delete();

        Yii::$app->getSession()->setFlash('success','删除成功');
        return $this->redirect(['product/view', 'id'=>$product_id]);
    }

    /**
     * Finds the Combo model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param string $id
     * @return Combo the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Combo::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionQueryCombo($id)
    {
       $response = Yii::$app->getResponse();
       $response->format = Response::FORMAT_JSON;
       $response->data = Combo::find()->select(['combo_id','combo_name'])->where(['product_id' => $id])->limit(100)->all();
       return $response->send();
    }
}
