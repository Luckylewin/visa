<?php
namespace backend\models;

use Yii;
use yii\base\Model;

class LoginForm extends Model
{

    public $username;
    public $password;
    public $rememberMe = true;

    private $_user;

    public function attributeLabels()
    {
        return [
            'username' => '用户名',
            'password' => '密码'
        ];
    }

    public function rules()
    {
        return [
            // username and password are both required
            [['username', 'password'], 'required'],
            // rememberMe must be a boolean value
            ['rememberMe', 'boolean'],
            // password is validated by validatePassword()
            ['password', 'errorTime'],
            ['password', 'validatePassword'],
        ];
    }

    /**
     * 验证密码
     */
    public function errorTime($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $ip = Yii::$app->request->getUserIP();
            $cache = Yii::$app->cache;
            $loginFail = $cache->get($ip);

            if ($loginFail && $loginFail > 6) {
                $this->addError($attribute, '错误次数过多，请半小时后重试');
            }
        }
    }

    /**
     * 验证密码
     */
    public function validatePassword($attribute, $params)
    {
        if (!$this->hasErrors()) {
            $user = $this->getUser();
            if (!$user || !$user->validatePassword($this->password)) {
                $this->addError($attribute, '用户名/密码不正确');
            }
        }
    }

    /**
     * 使用用户名和密码登录
     * @return boolean
     */
    public function login()
    {

        if ($this->validate())
        {
            $model = $this->getUser();
            $isLogin = Yii::$app->user->login($model, $this->rememberMe ? 86400 * 0.7 : 0);
            //登录成功,记录登录时间和IP
            if($isLogin) {
                $model->last_login_time = time();
                $model->last_login_ip = ip2long(Yii::$app->getRequest()->getUserIP());
                $model->save(false);
            }
            return $isLogin;
        } else {
            $ip = Yii::$app->request->getUserIP();
            $cache = Yii::$app->cache;
            if ($cache->exists($ip)) {
                $cache->set($ip, $cache->get($ip) + 1,1800);
            } else {
                $cache->set($ip, 1, 1800);
            }

            return false;
        }
    }

    /**
     * 通过username查找用户
     */
    protected function getUser()
    {
        if ($this->_user === null) {
            $this->_user = Admin::findByUsername($this->username);
        }
        return $this->_user;
    }

}