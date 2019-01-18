<?php
namespace backend\controllers;

use backend\models\form\ResetAdminPasswordForm;
use backend\models\LoginForm;
use backend\models\form\PasswordResetRequestForm;
use Yii;
use yii\base\InvalidParamException;
use yii\web\BadRequestHttpException;

class IndexController extends BaseController
{

    public function actionFrame()
    {
        $this->layout = false;
        $authManager = Yii::$app->authManager;
        $role = $authManager->getRolesByUser(Yii::$app->user->id);

        return $this->render('frame', [
            'username' => Yii::$app->user->identity->username,
            'rolename' => isset(current($role)->name)? current($role)->name : '未分配角色'
        ]);
    }

    public function actionIndex()
    {
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


    public function actionRequestPasswordReset()
    {
        $model = new PasswordResetRequestForm();
        if ($model->load(Yii::$app->request->post()) && $model->validate()) {
            try {
                if ($model->sendEmail()) {
                    Yii::$app->session->setFlash('success', '请检查你的邮箱是否有新的邮件');
                    return $this->goHome();
                } else {
                    Yii::$app->session->setFlash('error', '抱歉，邮箱配置有误，暂时不能通过邮箱重置密码');
                }
            }catch (\Exception $e) {
                Yii::$app->session->setFlash('error', '抱歉，邮箱配置有误，暂时不能通过邮箱重置密码');
            }

        }

        return $this->render('requestPasswordResetToken', [
            'model' => $model,
        ]);
    }


    public function actionResetPassword($token)
    {
        try {
            $model = new ResetAdminPasswordForm($token);
        } catch (InvalidParamException $e) {
            throw new BadRequestHttpException($e->getMessage());
        }

        if ($model->load(Yii::$app->request->post()) && $model->validate() && $model->resetPassword()) {
            Yii::$app->session->setFlash('success', '新密码已经生效');

            return $this->goHome();
        }

        return $this->render('resetPassword', [
            'model' => $model,
        ]);
    }
}
