<?php

namespace backend\controllers;

use backend\components\Excel;
use Yii;

use common\models\OrderQuery;
use common\models\Type;
use common\models\UploadForm;
use yii\web\Response;
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

        $total = count($data);

        if ($total > 800) {
            Yii::$app->session->setFlash('error', "导出{$total}条,已超出最大支持数:800条");
            return $this->redirect(Yii::$app->request->referrer);
        }

        $file_name = "订单" . date('Y_m_d');
        if (isset($queryParams['OrderQuery']['order_classify']) && !empty($queryParams['OrderQuery']['order_classify'])) {
            $classify = Type::getComboClassify();
            $file_name = isset($classify[$queryParams['OrderQuery']['order_classify']]) ? $classify[$queryParams['OrderQuery']['order_classify']]  : '';
            $file_name .= "订单" . date('Y_m_d');
        }

        Excel::excelExport($data, $file_name);
        exit;

    }

    public function actionImport()
    {
        set_time_limit(0);
        $model = new UploadForm();

        if (Yii::$app->request->isPost) {
            Yii::$app->response->format = Response::FORMAT_JSON;
            $uploadFile = UploadedFile::getInstance($model,'file');
            $result = Excel::ExcelReader($uploadFile->tempName);
            if ($result['status'] == false) {
                Yii::$app->response->statusCode = 400;

                if (is_array($result['msg'])) {
                    $errorData = array_shift($result['msg']);
                    $error = "第{$errorData['row']}行 {$errorData['msg']}";
                } else {
                    $error = $result['msg'];
                }

                return ['error' => $error];
            }

            return $result;
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
