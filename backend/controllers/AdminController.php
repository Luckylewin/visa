<?php
namespace backend\controllers;

use backend\models\form\ResetPasswordForm;
use Yii;
use backend\models\Admin;
use backend\models\search\AdminSearch;
use yii\web\NotFoundHttpException;
use yii\filters\VerbFilter;
use yii\rbac\Item;
use backend\models\search\AuthItemSearch;

/**
 * AdminController implements the CRUD actions for Admin model.
 */
class AdminController extends BaseController
{

    public $type = Item::TYPE_ROLE;


    public function actionIndex()
    {
        $searchModel = new AdminSearch();
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        $dataProvider->setSort(false); //禁止表头排序

        return $this->render('index', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
        ]);
    }

    public function actionView($id)
    {
        return $this->render('view', [
            'model' => $this->findModel($id),
        ]);
    }


    public function actionCreate()
    {
        $model = new Admin();
        $model->scenario = 'create';
        $model->status = Admin::STATUS_ACTIVE;
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            Yii::$app->session->setFlash('info', '请赋予帐号角色');
            return $this->redirect(['admin/auth', 'id' => $model->id]);
        } else {
            return $this->render('create', [
                'model' => $model,
            ]);
        }
    }


    public function actionUpdate($id)
    {
        $model = $this->findModel($id);
        $model->scenario = 'update';

        if (Yii::$app->user->id != $id) {
            Yii::$app->session->setFlash('danger', '只能修改自己的信息');
            return $this->redirect(['index']);
        }
        if ($model->load(Yii::$app->request->post()) && $model->save()) {
            return $this->redirect(['index']);
        } else {
            return $this->render('update', [
                'model' => $model,
            ]);
        }
    }

    public function actionDelete($id)
    {
        $this->findModel($id)->delete();

        return $this->redirect(['index']);
    }

    public function actionAuth($id)
    {
        $authManager = Yii::$app->authManager;
        $adminModel = $this->findModel($id);

        if(Yii::$app->request->isPost) {
            $roleName = Yii::$app->request->post('roleName', '');
            //删除用户所在的用户组
            $authManager->revokeAll($id);
            //添加用户组
            $authManager->assign($authManager->getRole($roleName), $id);
            Yii::$app->session->setFlash('success', '操作成功');
        }
        $searchModel = new AuthItemSearch();
        $searchModel->type = $this->type;
        $dataProvider = $searchModel->search(Yii::$app->request->queryParams);
        //获取当前用户的所有用户组
        $adminGroups = array_keys($authManager->getAssignments($id));
        //var_dump($dataProvider);exit();
        return $this->render('auth', [
            'searchModel' => $searchModel,
            'dataProvider' => $dataProvider,
            'adminGroups' => $adminGroups,
            'user' => $adminModel
        ]);
    }

    /**
     * @param $id
     * @return Admin
     * @throws NotFoundHttpException
     */
    protected function findModel($id)
    {
        if (($model = Admin::findOne($id)) !== null) {
            return $model;
        } else {
            throw new NotFoundHttpException('The requested page does not exist.');
        }
    }

    public function actionChangePassword()
    {
        $form = new ResetPasswordForm();

        if ($form->load(Yii::$app->request->post()) && $form->resetPassword()) {
            Yii::$app->session->setFlash('success', '密码修改成功');
            return $this->redirect(['index/index']);
        }

        return $this->render('change-password', [
            'model' => $form
        ]);

    }

}
