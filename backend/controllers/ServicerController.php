<?php

namespace backend\controllers;

use backend\models\Admin;
use Yii;
use common\models\Servicer;
use yii\data\ActiveDataProvider;
use yii\web\NotFoundHttpException;


/**
 * ServicerController implements the CRUD actions for Servicer model.
 */
class ServicerController extends BaseController
{

    /**
     * Lists all Servicer models.
     * @return mixed
     */
    public function actionIndex()
    {
        $dataProvider = new ActiveDataProvider([
            'query' => Servicer::find()->where(['is_del' => 0]),
        ]);

        return $this->render('index', [
            'dataProvider' => $dataProvider,
        ]);
    }


    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }

    /**
     * Creates a new Servicer model.
     * If creation is successful, the browser will be redirected to the 'view' page.
     * @return mixed
     */
    public function actionCreate()
    {
        $model = new Servicer();

        if ($model->load(Yii::$app->request->post()) && $model->save()) {

            Yii::$app->session->setFlash('info', '操作成功');
            return $this->redirect(['view', 'id' => $model->id]);
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

            Yii::$app->session->setFlash('info', '操作成功');
            return $this->redirect(['view', 'id' => $model->id]);
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
        $model->save(false);

        if ($account = $model->account) {
            $account->status = Admin::STATUS_SOFT_DELETE;
            $account->save(false);
        }

        Yii::$app->session->setFlash('success', '操作成功');
        return $this->redirect(['index']);
    }

    public function actionGrant($sid)
    {
        $model = $this->findModel($sid);

        if (Yii::$app->request->isPost) {
            $model->admin_id = Yii::$app->request->post('admin_id');
            $model->save();
            Yii::$app->session->setFlash('success','帐号绑定成功');
            return $this->redirect(['servicer/index']);
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
            return $this->redirect(['servicer/index']);
        }
    }

    /**
     * Finds the Servicer model based on its primary key value.
     * If the model is not found, a 404 HTTP exception will be thrown.
     * @param integer $id
     * @return Servicer the loaded model
     * @throws NotFoundHttpException if the model cannot be found
     */
    protected function findModel($id)
    {
        if (($model = Servicer::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }
}
