<?php
namespace backend\controllers;

use backend\models\LoginForm;
use Yii;

class IndexController extends BaseController
{

    public function actionFrame()
    {
        $this->layout = false;
        return $this->render('frame');
    }

    public function actionIndex()
    {
        $this->layout = false;
        return $this->render('index');
    }

    /**
     * 后台登录
     */
    public function actionLogin()
    {
        $this->layout = false;
        if (!Yii::$app->user->isGuest) return $this->goHome();

        $model = new LoginForm();
        if ($model->load(Yii::$app->request->post()) && $model->login()) return $this->goBack();
        else return $this->render('login', [
            'model' => $model,
        ]);
    }

    /**
     * 退出登录
     */
    public function actionLogout()
    {
        Yii::$app->user->logout();
        return $this->goHome();
    }
}
