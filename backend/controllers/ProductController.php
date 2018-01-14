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

        /*
         ini_set("max_execution_time", "300");
           $db = \Yii::$app->db->createCommand();
           for ($i=1300;$i<=10000;$i++) {
               Yii::$app->db->createCommand()->insert('yii2_product', [
                   'name' => '测试' . $i,
                   'picture' => 'null.jpg',
                   'country_id' => mt_rand(1,249),
               ])->execute();
           }*/
        $this->layout = false;
       /* $data = '{"message":"2222","value":[{"userName":"淳芸","shortAccount":"chunyun","userId":20001},{"userName":"orion-01","shortAccount":"orion-01","userId":20000},{"userName":"唐宏禹14","shortAccount":"TANGHONGYU","userId":20011},{"userName":"唐宏禹13","shortAccount":"tanghongyu","userId":20011},{"userName":"穆晓晨","shortAccount":"mUXIAOCHEN","userId":20002},{"userName":"张欢引","shortAccount":"zhanghuanyin","userId":20003},{"userName":"吴琼","shortAccount":"wuqiong","userId":20004},{"userName":"吴东鹏","shortAccount":"wudongpeng","userId":20005},{"userName":"黄少铅","shortAccount":"huangshaoqian","userId":20006},{"userName":"胡运燕","shortAccount":"yunyan","userId":20007},{"userName":"刘幸","shortAccount":"liuxing","userId":20008},{"userName":"陈媛媛","shortAccount":"CHENYUANYUAN","userId":20009},{"userName":"李大鹏","shortAccount":"dapeng","userId":20010},{"userName":"唐宏禹","shortAccount":"tanghongyu","userId":20011},{"userName":"旷东林","shortAccount":"kuangdonglin","userId":20010},{"userName":"唐宏禹15","shortAccount":"TANGhongyu","userId":20011},{"userName":"唐宏禹12","shortAccount":"tanghongyu","userId":20011},{"userName":"唐宏禹11","shortAccount":"TangHongYu","userId":20011},{"userName":"旷东林","shortAccount":"kuangdonglin","userId":20010},{"userName":"唐宏禹10","shortAccount":"tanghongyu","userId":20011},{"userName":"唐宏禹","shortAccount":"tanghongyu","userId":20011},{"userName":"唐宏禹9","shortAccount":"tanghongyu","userId":20011},{"userName":"唐宏禹8","shortAccount":"tanghongyu","userId":20011},{"userName":"唐宏禹7","shortAccount":"tanghongyu","userId":20011},{"userName":"旷东林","shortAccount":"kuangdonglin","userId":20010},{"userName":"唐宏禹6","shortAccount":"tanghongyu","userId":20011},{"userName":"唐宏禹5","shortAccount":"tanghongyu","userId":20011},{"userName":"唐宏禹4","shortAccount":"tanghongyu","userId":20011},{"userName":"唐宏禹3","shortAccount":"tanghongyu","userId":20011},{"userName":"唐宏禹2","shortAccount":"tanghongyu","userId":20011},{"userName":"唐宏禹1","shortAccount":"tanghongyu","userId":20011}],"code":200,"redirect":""}';
        $data = json_decode($data, true);
        print_r($data);exit;*/
        $response = Yii::$app->response;
        $response->format = Response::FORMAT_JSON;
        $response->data = ['message'=>'success', 'value' => Product::getJsonData()];
        $response->send();
    }

    /**
     * @param $country_id
     * @param $type
     */
    public function actionMyProduct($country_id, $type)
    {
        $this->layout = false;
        $response = Yii::$app->response;
        $response->format = Response::FORMAT_JSON;
        $query = (new Query())
                ->select('c.*')
                ->from('yii2_product AS a')
                ->leftJoin('yii2_combo AS c','c.product_id = a.id')
                ->where(['country_id'=>$country_id,'combo_type'=>$type])
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
