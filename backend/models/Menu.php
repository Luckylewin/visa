<?php
namespace backend\models;

use Yii;
use common\libs\Tree;

/**
 * This is the model class for table "{{%menu}}".
 *
 * @property integer $id
 * @property integer $pid
 * @property string $name
 * @property string $url
 * @property string $group
 * @property integer $hide
 * @property integer $sort
 */
class Menu extends \yii\db\ActiveRecord
{

    const DISPLAY = 1;
    const HIDE = 0;

    public static $displays = [
        self::DISPLAY => '显示',
        self::HIDE => '隐藏',
    ];

    public static $displayStyles = [
        self::HIDE => 'label-warning',
        self::DISPLAY => 'label-info',
    ];

    public function __construct() {
        $this->display = self::DISPLAY;
    }

    /**
     * @inheritdoc
     */
    public static function tableName()
    {
        return '{{%menu}}';
    }

    /**
     * @inheritdoc
     */
    public function rules()
    {
        return [
            [['pid', 'display', 'sort'], 'integer'],
            [['name', 'icon_style'], 'string', 'max' => 50],
            [['url'], 'string', 'max' => 60],
            [['sort'],'default','value' => '0']
        ];
    }

    /**
     * @inheritdoc
     */
    public function attributeLabels()
    {
        return [
            'id' => 'ID',
            'pid' => '上级菜单',
            'name' => '菜单名称',
            'url' => 'URL',
            'icon_style' => '图标样式',
            'display' => '是否显示',
            'sort' => '排序',
        ];
    }

    public function getDisplays() {
        return self::$displays;
    }

    /**
     * 获取菜单状态
     */
    public static function getDisplayText($display) {
        return self::$displays[$display];
    }

    /**
     * 获取菜单状态样式
     */
    public static function getDisplayStyle($display) {
        return self::$displayStyles[$display];
    }

    public static function getMenu() {
        $menus = static::find()->where(['display' => 1])->orderBy('sort asc')->asArray()->all();
        $treeObj = new Tree($menus);
        return $treeObj->getTreeArray();
    }

    public static function getActualMenu()
    {
        $allMenus = self::getMenu();
       /* */
       $username = Yii::$app->authManager->getRolesByUser(Yii::$app->user->getId());
       if (isset(array_keys($username)[0])) {
            $rolename = array_keys($username)[0];
       }

       foreach ($allMenus as $key => $menus) {
            foreach ($menus['_child'] as $_key => $menu) {
               if (!isset($rolename) || $rolename != '超级管理员') {
                    if (!\Yii::$app->user->can($menu['url'])) {
                        unset($allMenus[$key]['_child'][$_key]);
                    }
                }
            }
            if (!isset($allMenus[$key]['_child']) || count($allMenus[$key]['_child']) <= 0) {
                unset($allMenus[$key]);
            }
        }

        return $allMenus;
    }

}
