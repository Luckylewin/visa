<?php
namespace backend\controllers;

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
        return $this->render('index');
    }

}
