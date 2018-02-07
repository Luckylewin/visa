<?php

namespace backend\controllers;

use Yii;
use common\models\ExportSetting;

class ExcelSettingController extends BaseController
{
    public function actionUpdate()
    {
        $request = Yii::$app->request->post('ExportSetting');
        $roleName = $request['rolename'];
        $showFinance = $request['showfinance'];
        $setting = ExportSetting::findOne(['rolename' => $roleName]);

        if (is_null($setting)) {
            $setting = new ExportSetting();
            $setting->rolename = $roleName;
            $setting->showfinance = $showFinance;
            $setting->save();
        } else {
            $setting->showfinance = $showFinance;
            $setting->update();
        }

        Yii::$app->session->setFlash('success', '修改成功');
        return $this->redirect(Yii::$app->request->referrer);

    }
}
