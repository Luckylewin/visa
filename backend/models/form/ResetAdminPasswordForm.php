<?php
/**
 * Created by PhpStorm.
 * User: lychee
 * Date: 2019/1/18
 * Time: 17:17
 */

namespace backend\models\form;

use backend\models\Admin;
use yii\base\InvalidParamException;
use yii\base\Model;

/**
 * Password reset form
 */
class ResetAdminPasswordForm extends Model
{
    public $password;
    public $re_password;

    /**
     * @var \common\models\User
     */
    private $_user;


    /**
     * Creates a form model given a token.
     *
     * @param string $token
     * @param array $config name-value pairs that will be used to initialize the object properties
     * @throws \yii\base\InvalidParamException if token is empty or not valid
     */
    public function __construct($token, $config = [])
    {
        if (empty($token) || !is_string($token)) {
            throw new InvalidParamException('Password reset token cannot be blank.');
        }
        $this->_user = Admin::findByPasswordResetToken($token);
        if (!$this->_user) {
            throw new InvalidParamException('Wrong password reset token.');
        }

        parent::__construct($config);
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            ['password', 'required'],
            ['password', 'string', 'min' => 6],
            ['re_password','compare','compareAttribute' => 'password']
        ];
    }

    public function attributeLabels()
    {
        return [
            'password' => '密码',
            're_password' => '密码确认'
        ];
    }

    /**
     * Resets password.
     *
     * @return bool if password was reset.
     */
    public function resetPassword()
    {
        $user = $this->_user;
        $user->setPassword($this->password);
        $user->removePasswordResetToken();

        return $user->save(false);
    }
}
