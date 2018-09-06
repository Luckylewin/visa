<?php

namespace backend\controllers;

use backend\models\Admin;
use Yii;
use backend\models\Operator;
use backend\models\search\OperatorSearch;
use yii\web\Controller;
use yii\web\NotFoundHttpException;


/**
 * OperatorController implements the CRUD actions for Operator model.
 */
class OperatorController extends Controller
{

    /**
     * Lists all Operator models.
     * @return mixed
     */
    public function actionIndex()
    {
        $searchModel = new OperatorSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }


    public function actionCreate()
    {
        $model = new Operator();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', '操作成功');
            return $this->redirect(['index', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }


    public function actionUpdate($id)
    {
        $model = $this->findModel($id);

        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('success', '操作成功');
            return $this->redirect(['index', 'id' => $model->id]);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }


    public function actionDelete($id)
    {
        $model = $this->findModel($id);
        $model->is_del = 1;
        $result = $model->save(false);

        if ($account = $model->account) {
            $account->status = Admin::STATUS_SOFT_DELETE;
            $account->save(false);
        }

        return $this->redirect(['index']);
    }

    /**
     * Finds the Operator model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Operator the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Operator::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionGrant($sid)
    {
        $model = $this->findModel($sid);

        if (Yii::$app->request->isPost) {
            $model->admin_id = Yii::$app->request->post('admin_id');
            $model->save();
            Yii::$app->session->setFlash('success','帐号绑定成功');
            return $this->redirect(['index'
            ]);
        }

        return $this->render('grant', [
            'model' => $model
        ]);
    }

    public function actionUnbind($id)
    {
        $model = $this->findModel($id);
        if ($model) {
            $model->admin_id = '';
            $model->save(false);
            Yii::$app->session->setFlash('info','帐号解除绑定成功');
            return $this->redirect(['operator/index']);
        }
    }

}
