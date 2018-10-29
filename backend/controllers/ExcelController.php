<?php

namespace backend\controllers;

use backend\components\Excel;
use Yii;

use common\models\OrderQuery;
use common\models\Type;
use common\models\UploadForm;
use yii\web\UploadedFile;

class ExcelController extends BaseController
{
    public function actionIndex()
    {
        set_time_limit(0);
        $queryParams = Yii::$app->request->get('orderQuery');
        $selected_id = Yii::$app->request->get('selected_id');

        if ($selected_id) {
            //直接选中的导出
            $data = OrderQuery::find()->where("id in ($selected_id)")->all();

        } elseif ($queryParams) {
            //查询时的导出
            $queryParams = json_decode(base64_decode($queryParams), true);
            $searchModel = new OrderQuery();
            $data = $searchModel->search($queryParams, $all = true)->getModels();

        } else {
            //非查询时的导出
            $data = OrderQuery::find()->all();
        }

        if (empty($data)) {
           Yii::$app->session->setFlash('error', '没有可以导出的数据');
           return $this->redirect(Yii::$app->request->referrer);
        }

        $file_name = "订单" . date('Y_m_d');
        if (isset($queryParams['OrderQuery']['order_classify']) && !empty($queryParams['OrderQuery']['order_classify'])) {
            $classify = Type::getComboClassify();
            $file_name = isset($classify[$queryParams['OrderQuery']['order_classify']]) ? $classify[$queryParams['OrderQuery']['order_classify']]  : '';
            $file_name .= "订单" . date('Y_m_d');
        }

        Excel::excelExport($data, $file_name);

        return true;
    }

    public function actionImport()
    {
        set_time_limit(0);
        $model = new UploadForm();

        if (Yii::$app->request->isPost) {
            $uploadFile = UploadedFile::getInstance($model,'file');
            Excel::ExcelReader($uploadFile->tempName);
        }

        return $this->render('import', [
            'model' => $model
        ]);
    }

    public function actionPercent()
    {
        $data = Yii::$app->cache->get(Yii::$app->user->getId());

        $response = Yii::$app->response;
        $response->format = $response::FORMAT_JSON;
        $response->data = ['status' => 0, 'data'=> $data];
        $response->send();
    }
}
