/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : visa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-17 01:25:11
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yii2_admin
-- ----------------------------
DROP TABLE IF EXISTS `yii2_admin`;
CREATE TABLE `yii2_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL COMMENT '密码',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `reg_ip` int(11) NOT NULL DEFAULT '0' COMMENT '创建或注册IP',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后登录时间',
  `last_login_ip` int(11) NOT NULL DEFAULT '0' COMMENT '最后登录IP',
  `status` tinyint(4) NOT NULL DEFAULT '1' COMMENT '用户状态 1正常 0禁用',
  `created_at` int(11) NOT NULL COMMENT '创建或注册时间',
  `updated_at` int(11) NOT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_admin
-- ----------------------------
INSERT INTO `yii2_admin` VALUES ('0', 'admin2', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i', '876505905@qq.com', '2130706433', '1484733705', '2130706433', '1', '1482305564', '1484733705');
INSERT INTO `yii2_admin` VALUES ('1', 'admin', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i', '771405950@qq.com', '2130706433', '1515432671', '2130706433', '1', '1482305564', '1515432671');

-- ----------------------------
-- Table structure for yii2_auth_assignment
-- ----------------------------
DROP TABLE IF EXISTS `yii2_auth_assignment`;
CREATE TABLE `yii2_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `yii2_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_auth_assignment
-- ----------------------------
INSERT INTO `yii2_auth_assignment` VALUES ('administors', '1', '1484712737');

-- ----------------------------
-- Table structure for yii2_auth_item
-- ----------------------------
DROP TABLE IF EXISTS `yii2_auth_item`;
CREATE TABLE `yii2_auth_item` (
  `name` varchar(64) NOT NULL,
  `type` int(11) NOT NULL,
  `description` text,
  `rule_name` varchar(64) DEFAULT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`),
  KEY `rule_name` (`rule_name`),
  KEY `type` (`type`),
  CONSTRAINT `yii2_auth_item_ibfk_1` FOREIGN KEY (`rule_name`) REFERENCES `yii2_auth_rule` (`name`) ON DELETE SET NULL ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_auth_item
-- ----------------------------
INSERT INTO `yii2_auth_item` VALUES ('admin/auth', '2', '', 'admin/auth', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('admin/create', '2', '', 'admin/create', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('admin/delete', '2', '', 'admin/delete', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('admin/index', '2', '', 'admin/index', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('admin/update', '2', '', 'admin/update', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('administors', '1', '授权所有权限', null, null, '1484712662', '1484712662');
INSERT INTO `yii2_auth_item` VALUES ('config/attachment', '2', '', 'config/attachment', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('config/basic', '2', '', 'config/basic', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('config/send-mail', '2', '', 'config/send-mail', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('database/export', '2', '', 'database/export', null, '1484734305', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('editors', '1', '网站编辑', null, null, '1484712712', '1484712712');
INSERT INTO `yii2_auth_item` VALUES ('index/index', '2', '', 'index/index', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('menu/create', '2', '', 'menu/create', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('menu/delete', '2', '', 'menu/delete', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('menu/index', '2', '', 'menu/index', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('menu/update', '2', '', 'menu/update', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('role/auth', '2', '', 'role/auth', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('role/create', '2', '', 'role/create', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('role/delete', '2', '', 'role/delete', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('role/index', '2', '', 'role/index', null, '1484734191', '1484734305');
INSERT INTO `yii2_auth_item` VALUES ('role/update', '2', '', 'role/update', null, '1484734191', '1484734305');

-- ----------------------------
-- Table structure for yii2_auth_item_child
-- ----------------------------
DROP TABLE IF EXISTS `yii2_auth_item_child`;
CREATE TABLE `yii2_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `yii2_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yii2_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_auth_item_child
-- ----------------------------
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'admin/auth');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'admin/create');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'admin/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'admin/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'admin/update');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'config/attachment');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'config/basic');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'config/send-mail');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'database/export');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'index/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'menu/create');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'menu/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'menu/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'menu/update');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/auth');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/create');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/update');

-- ----------------------------
-- Table structure for yii2_auth_rule
-- ----------------------------
DROP TABLE IF EXISTS `yii2_auth_rule`;
CREATE TABLE `yii2_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_auth_rule
-- ----------------------------
INSERT INTO `yii2_auth_rule` VALUES ('', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:0:\"\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734275;}', '1484734191', '1484734275');
INSERT INTO `yii2_auth_rule` VALUES ('admin/auth', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"admin/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('admin/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('admin/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('admin/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"admin/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('admin/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('config/attachment', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:17:\"config/attachment\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('config/basic', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"config/basic\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('config/send-mail', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:16:\"config/send-mail\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('database/export', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"database/export\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734305;s:9:\"updatedAt\";i:1484734305;}', '1484734305', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('index/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"index/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('menu/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('menu/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('menu/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"menu/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('menu/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('role/auth', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:9:\"role/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('role/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('role/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('role/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"role/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');
INSERT INTO `yii2_auth_rule` VALUES ('role/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}', '1484734191', '1484734305');

-- ----------------------------
-- Table structure for yii2_combo
-- ----------------------------
DROP TABLE IF EXISTS `yii2_combo`;
CREATE TABLE `yii2_combo` (
  `combo_id` int(10) NOT NULL AUTO_INCREMENT,
  `combo_name` varchar(255) NOT NULL COMMENT '套餐名称',
  `combo_content` varchar(255) NOT NULL COMMENT '套餐内容',
  `combo_cost` decimal(10,3) DEFAULT '0.000' COMMENT '支出成本',
  `combo_type` char(1) NOT NULL COMMENT '套餐类型',
  `combo_classify` char(1) NOT NULL DEFAULT '1' COMMENT '来源分类',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `uid` smallint(6) NOT NULL COMMENT '用户id',
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`combo_id`),
  KEY `ppid` (`product_id`) USING BTREE,
  CONSTRAINT `combo_product_id` FOREIGN KEY (`product_id`) REFERENCES `yii2_product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39301 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_combo
-- ----------------------------
INSERT INTO `yii2_combo` VALUES ('39288', '198/7', '', '170.000', '1', '1', '2018-01-14', '2018-01-14', '0', '67632');
INSERT INTO `yii2_combo` VALUES ('39289', '258/5', '', '210.000', '2', '1', '2018-01-14', '2018-01-14', '0', '67632');
INSERT INTO `yii2_combo` VALUES ('39290', '520/3', '', '400.000', '3', '1', '2018-01-14', '2018-01-14', '0', '67632');
INSERT INTO `yii2_combo` VALUES ('39292', '268/3', '', '210.000', '1', '1', '2018-01-14', '2018-01-14', '0', '67633');
INSERT INTO `yii2_combo` VALUES ('39293', '278/3', '', '220.000', '2', '1', '2018-01-14', '2018-01-14', '0', '67633');
INSERT INTO `yii2_combo` VALUES ('39294', '520/2', '', '450.000', '3', '2', '2018-01-14', '2018-01-14', '0', '67633');
INSERT INTO `yii2_combo` VALUES ('39295', '259/5', '', '210.000', '1', '2', '2018-01-15', '2018-01-15', '0', '67632');
INSERT INTO `yii2_combo` VALUES ('39296', '445/3', '', '310.000', '3', '2', '2018-01-15', '2018-01-15', '0', '67632');
INSERT INTO `yii2_combo` VALUES ('39297', '666/3', '', '550.000', '2', '2', '2018-01-15', '2018-01-15', '0', '67632');
INSERT INTO `yii2_combo` VALUES ('39298', '223/3', '', '210.000', '1', '3', '2018-01-15', '2018-01-15', '0', '67632');
INSERT INTO `yii2_combo` VALUES ('39299', '450/2', '', '360.000', '2', '3', '2018-01-15', '2018-01-15', '0', '67632');
INSERT INTO `yii2_combo` VALUES ('39300', '666/1', '', '500.000', '3', '3', '2018-01-15', '2018-01-15', '0', '67632');

-- ----------------------------
-- Table structure for yii2_config
-- ----------------------------
DROP TABLE IF EXISTS `yii2_config`;
CREATE TABLE `yii2_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyid` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `keyid` (`keyid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_config
-- ----------------------------
INSERT INTO `yii2_config` VALUES ('1', 'basic', '', '{\"sitename\":\"Yii2 CMS\",\"url\":\"http:\\/\\/www.test-yii2cms.com\",\"logo\":\"\\/statics\\/themes\\/admin\\/images\\/logo.png\",\"seo_keywords\":\"Yii2,CMS\",\"seo_description\":\"Yii2,CMS\",\"copyright\":\"@Yii2 CMS\",\"statcode\":\"\",\"close\":\"0\",\"close_reason\":\"\\u7ad9\\u70b9\\u5347\\u7ea7\\u4e2d, \\u8bf7\\u7a0d\\u540e\\u8bbf\\u95ee!\"}');
INSERT INTO `yii2_config` VALUES ('2', 'sendmail', '', '{\"mail_type\":\"0\",\"smtp_server\":\"smtp.qq.com\",\"smtp_port\":\"25\",\"auth\":\"1\",\"openssl\":\"1\",\"smtp_user\":\"771405950\",\"smtp_pwd\":\"qiaoBo1989122\",\"send_email\":\"771405950@qq.com\",\"nickname\":\"\\u8fb9\\u8d70\\u8fb9\\u4e54\",\"sign\":\"<hr \\/>\\r\\n\\u90ae\\u4ef6\\u7b7e\\u540d\\uff1a\\u6b22\\u8fce\\u8bbf\\u95ee <a href=\\\"http:\\/\\/www.test-yii2cms.com\\\" target=\\\"_blank\\\">Yii2 CMS<\\/a>\"}');
INSERT INTO `yii2_config` VALUES ('3', 'attachment', '', '{\"attachment_size\":\"2048\",\"attachment_suffix\":\"jpg|jpeg|gif|bmp|png\",\"watermark_enable\":\"1\",\"watermark_pos\":\"0\",\"watermark_text\":\"Yii2 CMS\"}');

-- ----------------------------
-- Table structure for yii2_country
-- ----------------------------
DROP TABLE IF EXISTS `yii2_country`;
CREATE TABLE `yii2_country` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `abbr` varchar(100) DEFAULT NULL COMMENT '英文缩写',
  `cinfo` varchar(200) DEFAULT NULL COMMENT '中文名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_country
-- ----------------------------
INSERT INTO `yii2_country` VALUES ('250', 'cn', '中国');
INSERT INTO `yii2_country` VALUES ('251', 'ph', '菲律宾');
INSERT INTO `yii2_country` VALUES ('252', 'th', '泰国');

-- ----------------------------
-- Table structure for yii2_delivery_company
-- ----------------------------
DROP TABLE IF EXISTS `yii2_delivery_company`;
CREATE TABLE `yii2_delivery_company` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(100) NOT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_delivery_company
-- ----------------------------

-- ----------------------------
-- Table structure for yii2_menu
-- ----------------------------
DROP TABLE IF EXISTS `yii2_menu`;
CREATE TABLE `yii2_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `icon_style` varchar(50) NOT NULL DEFAULT '',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=44 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_menu
-- ----------------------------
INSERT INTO `yii2_menu` VALUES ('1', '0', '我的面板', 'index/index', 'fa-home', '1', '0');
INSERT INTO `yii2_menu` VALUES ('2', '0', '站点设置', 'config/basic', 'fa-cogs', '1', '0');
INSERT INTO `yii2_menu` VALUES ('3', '0', '管理员设置', 'admin/index', 'fa-user', '1', '0');
INSERT INTO `yii2_menu` VALUES ('4', '0', '内容设置', '', 'fa-edit', '0', '0');
INSERT INTO `yii2_menu` VALUES ('5', '0', '用户设置', '', 'fa-users', '0', '0');
INSERT INTO `yii2_menu` VALUES ('6', '0', '数据库设置', 'database/export', 'fa-hdd-o', '0', '0');
INSERT INTO `yii2_menu` VALUES ('7', '0', '界面设置', '', 'fa-picture-o', '0', '0');
INSERT INTO `yii2_menu` VALUES ('8', '1', '系统信息', 'index/index', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('9', '2', '站点配置', 'config/basic', '', '0', '0');
INSERT INTO `yii2_menu` VALUES ('10', '2', '后台菜单管理', 'menu/index', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('11', '3', '管理员管理', 'admin/index', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('12', '3', '角色管理', 'role/index', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('13', '4', '内容管理', '', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('14', '4', '栏目管理', '', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('15', '4', '模型管理', '', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('16', '5', '用户管理', '', '', '0', '0');
INSERT INTO `yii2_menu` VALUES ('17', '6', '数据库管理', 'database/export', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('18', '7', '主题管理', '', '', '0', '0');
INSERT INTO `yii2_menu` VALUES ('19', '7', '模板管理', '', '', '0', '0');
INSERT INTO `yii2_menu` VALUES ('20', '9', '基本配置', 'config/basic', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('21', '9', '邮箱配置', 'config/send-mail', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('22', '9', '附件配置', 'config/attachment', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('23', '10', '添加菜单', 'menu/create', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('24', '10', '更新', 'menu/update', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('25', '10', '删除', 'menu/delete', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('26', '11', '添加', 'admin/create', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('27', '11', '更新', 'admin/update', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('28', '11', '授权', 'admin/auth', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('29', '11', '删除', 'admin/delete', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('30', '12', '添加', 'role/create', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('31', '12', '更新', 'role/update', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('32', '12', '授权', 'role/auth', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('33', '12', '删除', 'role/delete', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('34', '0', '产品管理', 'product/index', 'fa-coffee', '1', '0');
INSERT INTO `yii2_menu` VALUES ('35', '34', '产品管理', 'product/index', 'fa-coffee', '1', '0');
INSERT INTO `yii2_menu` VALUES ('36', '0', '套餐管理', 'combo/index', 'fa-coffee', '1', '0');
INSERT INTO `yii2_menu` VALUES ('37', '36', '套餐管理', 'combo/index', 'fa-coffee', '1', '0');
INSERT INTO `yii2_menu` VALUES ('38', '0', '订单管理', 'order/index', 'fa-dollar', '1', '0');
INSERT INTO `yii2_menu` VALUES ('39', '38', '订单列表', 'order/index', 'fa-dollar', '1', '0');
INSERT INTO `yii2_menu` VALUES ('40', '0', '国家管理', 'country/index', 'fa-flag', '1', '12');
INSERT INTO `yii2_menu` VALUES ('41', '40', '国家列表', 'country/index', 'fa-flag', '1', '1');
INSERT INTO `yii2_menu` VALUES ('42', '0', '客服管理', 'servicer/index', 'fa-users', '1', '14');
INSERT INTO `yii2_menu` VALUES ('43', '42', '客服列表', 'servicer/index', 'fa-users', '1', '1');

-- ----------------------------
-- Table structure for yii2_migration
-- ----------------------------
DROP TABLE IF EXISTS `yii2_migration`;
CREATE TABLE `yii2_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_migration
-- ----------------------------
INSERT INTO `yii2_migration` VALUES ('m000000_000000_base', '1482231528');
INSERT INTO `yii2_migration` VALUES ('m130524_201442_init', '1482231534');

-- ----------------------------
-- Table structure for yii2_order
-- ----------------------------
DROP TABLE IF EXISTS `yii2_order`;
CREATE TABLE `yii2_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL COMMENT '产品id',
  `order_num` varchar(24) NOT NULL COMMENT '订单号',
  `order_classify` char(1) NOT NULL DEFAULT '1' COMMENT '1网店2直客3同业',
  `order_type` char(1) NOT NULL DEFAULT '1' COMMENT '1正常2加急3特急',
  `order_date` date NOT NULL COMMENT '订单日期',
  `customer_id` varchar(100) NOT NULL COMMENT '客户id',
  `combo_id` int(11) NOT NULL COMMENT '套餐id',
  `custom_servicer_id` smallint(6) NOT NULL COMMENT '客服id',
  `transactor_name` varchar(50) NOT NULL COMMENT '办理人名称',
  `single_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单项实收金额',
  `total_person` smallint(5) NOT NULL DEFAULT '0' COMMENT '人数',
  `balance_order` varchar(64) NOT NULL DEFAULT '0.00' COMMENT '补差订单号',
  `balance_sum` decimal(10,3) NOT NULL DEFAULT '0.000' COMMENT '补差订单金额',
  `flushphoto_order` varchar(64) NOT NULL COMMENT '代冲洗照片订单号',
  `flushphoto_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '代冲洗照片订单金额',
  `carrier_order` varchar(64) NOT NULL COMMENT '快递费补差订单号',
  `carrier_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '快递费补差订单金额',
  `collect_date` date NOT NULL COMMENT '收资料日',
  `deliver_date` date NOT NULL COMMENT '送证日',
  `entry_date` date NOT NULL COMMENT '入馆日',
  `putsign_date` date NOT NULL COMMENT '出签日',
  `operator` varchar(50) NOT NULL COMMENT '操作员',
  `back_address` tinytext NOT NULL COMMENT '回寄地址',
  `back_addressee` varchar(50) NOT NULL COMMENT '收件人',
  `back_telphone` varchar(36) NOT NULL COMMENT '收件人电话',
  `delivergood_date` date NOT NULL COMMENT '发货日期',
  `deliver_order` varchar(64) NOT NULL COMMENT '快递单号',
  `delivercompany_id` smallint(6) DEFAULT NULL COMMENT '快递公司ID',
  `remark` tinytext NOT NULL COMMENT '备注',
  `receipt_date` date NOT NULL COMMENT '收款日期',
  `pay_date` date NOT NULL COMMENT '支付日期',
  `audit_status` char(1) NOT NULL DEFAULT '1' COMMENT '1审核中2审核未通过3审核通过',
  `cid` smallint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `order_deliverycompany_id` (`delivercompany_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_order
-- ----------------------------
INSERT INTO `yii2_order` VALUES ('2', '0', '73464844660638393', '1', '2', '2018-01-15', 'xqf90000', '1', '1', '许青峰2', '198.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-15', '2018-01-15', '2018-01-15', '2018-01-15', '小阳', '海南省  海口市  秀英区  长流镇长滨东四街6号海口市中改院专家公寓1-2-1303  570311', '许青峰', '13807590000', '2018-01-15', '72582469886030839', '1', '测试', '2018-01-15', '2018-01-15', '2', '251');
INSERT INTO `yii2_order` VALUES ('3', '0', '5634534545', '1', '1', '2018-01-16', 'xyz', '39288', '233', '小阳', '198.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '测试', '测试', '测试', '13807590000', '2018-01-16', '72582469886030839', '1', '1', '2018-01-16', '2018-01-16', '1', '251');
INSERT INTO `yii2_order` VALUES ('4', '0', '5634534545', '1', '1', '2018-01-16', 'xyz', '39288', '233', '小阳', '198.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '测试', '测试', '测试', '13807590000', '2018-01-16', '72582469886030839', '1', '1', '2018-01-16', '2018-01-16', '1', '251');
INSERT INTO `yii2_order` VALUES ('5', '0', '5634534545', '1', '3', '2018-01-16', 'xyz', '39290', '233', '小阳', '198.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '测试', '测试', '测试', '13807590000', '2018-01-16', '72582469886030839', '1', '1', '2018-01-16', '2018-01-16', '1', '251');
INSERT INTO `yii2_order` VALUES ('6', '0', '', '1', '', '2018-01-16', '', '1', '1', '', '0.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '', '', '', '', '2018-01-16', '', null, '', '2018-01-16', '2018-01-16', '1', '252');
INSERT INTO `yii2_order` VALUES ('7', '0', '', '1', '', '2018-01-16', '', '1', '1', '', '0.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '', '', '', '', '2018-01-16', '', null, '', '2018-01-16', '2018-01-16', '1', '252');
INSERT INTO `yii2_order` VALUES ('8', '0', '', '1', '', '2018-01-16', '', '1', '1', '黄飞鸿|', '0.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '', '', '', '', '2018-01-16', '', null, '', '2018-01-16', '2018-01-16', '1', '252');
INSERT INTO `yii2_order` VALUES ('9', '0', '', '1', '', '2018-01-16', '', '1', '1', '黄飞鸿|', '0.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '', '', '', '', '2018-01-16', '', null, '', '2018-01-16', '2018-01-16', '1', '252');
INSERT INTO `yii2_order` VALUES ('10', '0', '', '1', '', '2018-01-16', '', '1', '1', '666|', '0.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '', '', '', '', '2018-01-16', '', null, '', '2018-01-16', '2018-01-16', '1', '252');
INSERT INTO `yii2_order` VALUES ('11', '0', '', '1', '', '2018-01-16', '', '1', '1', '666|', '0.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '', '', '', '', '2018-01-16', '', null, '', '2018-01-16', '2018-01-16', '1', '252');
INSERT INTO `yii2_order` VALUES ('12', '0', '', '1', '', '2018-01-16', '', '1', '1', '777|', '0.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '', '', '', '', '2018-01-16', '', null, '', '2018-01-16', '2018-01-16', '1', '252');
INSERT INTO `yii2_order` VALUES ('13', '0', '', '1', '', '2018-01-16', '', '1', '1', '777|', '0.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '', '', '', '', '2018-01-16', '', null, '', '2018-01-16', '2018-01-16', '1', '252');
INSERT INTO `yii2_order` VALUES ('14', '0', '', '1', '', '2018-01-16', '', '1', '1', '777|', '0.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '', '', '', '', '2018-01-16', '', null, '', '2018-01-16', '2018-01-16', '1', '252');
INSERT INTO `yii2_order` VALUES ('15', '0', '', '1', '', '2018-01-16', '', '1', '1', '777|', '0.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '', '', '', '', '2018-01-16', '', null, '', '2018-01-16', '2018-01-16', '1', '252');
INSERT INTO `yii2_order` VALUES ('16', '0', '', '1', '', '2018-01-16', '', '1', '1', '黎明|张学友|', '0.00', '1', '', '0.000', '', '0.00', '', '0.00', '2018-01-16', '2018-01-16', '2018-01-16', '2018-01-16', '', '', '', '', '2018-01-16', '', null, '', '2018-01-16', '2018-01-16', '1', '252');

-- ----------------------------
-- Table structure for yii2_order_product
-- ----------------------------
DROP TABLE IF EXISTS `yii2_order_product`;
CREATE TABLE `yii2_order_product` (
  `order_id` int(11) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  KEY `fk_order_id` (`order_id`),
  KEY `fk_product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_order_product
-- ----------------------------

-- ----------------------------
-- Table structure for yii2_product
-- ----------------------------
DROP TABLE IF EXISTS `yii2_product`;
CREATE TABLE `yii2_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `name` varchar(255) NOT NULL,
  `cost` decimal(10,2) NOT NULL COMMENT '支出成本',
  `country_id` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_country_id` (`country_id`),
  CONSTRAINT `product_country_id` FOREIGN KEY (`country_id`) REFERENCES `yii2_country` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=67634 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_product
-- ----------------------------
INSERT INTO `yii2_product` VALUES ('67632', '菲律宾签证', '0.00', '251');
INSERT INTO `yii2_product` VALUES ('67633', '泰国签证', '0.00', '252');

-- ----------------------------
-- Table structure for yii2_product_combo
-- ----------------------------
DROP TABLE IF EXISTS `yii2_product_combo`;
CREATE TABLE `yii2_product_combo` (
  `pid` int(11) NOT NULL,
  `combo_name` varchar(255) NOT NULL COMMENT '套餐名称',
  `cid` int(11) NOT NULL,
  KEY `ppid` (`pid`),
  KEY `ccid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_product_combo
-- ----------------------------

-- ----------------------------
-- Table structure for yii2_servicer
-- ----------------------------
DROP TABLE IF EXISTS `yii2_servicer`;
CREATE TABLE `yii2_servicer` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '客服名字',
  `tb_servicer_id` varchar(30) DEFAULT NULL COMMENT '淘宝客服id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_servicer
-- ----------------------------
INSERT INTO `yii2_servicer` VALUES ('1', '小肖', '23');
INSERT INTO `yii2_servicer` VALUES ('2', '小阳', 'xiaoyang');

-- ----------------------------
-- Table structure for yii2_session
-- ----------------------------
DROP TABLE IF EXISTS `yii2_session`;
CREATE TABLE `yii2_session` (
  `id` char(40) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_session
-- ----------------------------
INSERT INTO `yii2_session` VALUES ('7ruekmm0d00rjumdr9v98d22d7', '1516034922', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B);
INSERT INTO `yii2_session` VALUES ('hl1ivbk291ef208m1er5ec8q03', '1516124901', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);

-- ----------------------------
-- Table structure for yii2_test
-- ----------------------------
DROP TABLE IF EXISTS `yii2_test`;
CREATE TABLE `yii2_test` (
  `id` int(255) NOT NULL,
  `test` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_test
-- ----------------------------
INSERT INTO `yii2_test` VALUES ('1', 'aa');

-- ----------------------------
-- Table structure for yii2_transator
-- ----------------------------
DROP TABLE IF EXISTS `yii2_transator`;
CREATE TABLE `yii2_transator` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `sex` char(1) NOT NULL COMMENT '性别',
  `phone` varchar(32) NOT NULL COMMENT '手机号',
  `address` varchar(50) NOT NULL COMMENT '地址',
  `identify` varchar(30) NOT NULL COMMENT '身份证',
  `is_valid` char(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `expire_time` int(10) NOT NULL COMMENT '操作过期时间',
  `order_id` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_transator
-- ----------------------------
INSERT INTO `yii2_transator` VALUES ('1', '李大海', '1', '18040631515', '荆州市', '', '0', '0', '0');
INSERT INTO `yii2_transator` VALUES ('2', '李明', '1', '18938904293', '地址', '', '0', '1516205519', '0');
INSERT INTO `yii2_transator` VALUES ('3', '测试', '2', '18930904292', '测试', '3423423534656456', '0', '1516205695', '0');
INSERT INTO `yii2_transator` VALUES ('4', '测试', '1', '18930904292', '18930904292', '18930904292', '0', '1516205728', '0');
INSERT INTO `yii2_transator` VALUES ('5', '测试2', '1', '18930904292', '测试', '', '0', '1516205756', '0');
INSERT INTO `yii2_transator` VALUES ('6', '测测试', '1', '12323', '32323', '', '0', '1516206015', '0');
INSERT INTO `yii2_transator` VALUES ('7', '222', '1', '222', '22', '22', '0', '1516206037', '0');
INSERT INTO `yii2_transator` VALUES ('8', '1', '1', '11', '11', '111', '0', '1516206099', '0');
INSERT INTO `yii2_transator` VALUES ('9', '黄飞鸿', '1', '111', '111', '11', '0', '1516208780', '0');
INSERT INTO `yii2_transator` VALUES ('10', '666', '1', '66', '666', '66', '0', '1516209442', '0');
INSERT INTO `yii2_transator` VALUES ('11', '777', '1', '777', '777', '77', '1', '1516209546', '15');
INSERT INTO `yii2_transator` VALUES ('12', '黎明', '1', '18938904293', '2222', '', '1', '1516209713', '16');
INSERT INTO `yii2_transator` VALUES ('13', '张学友', '1', '18938904293', '656456', '546456456', '1', '1516209729', '16');

-- ----------------------------
-- Table structure for yii2_user
-- ----------------------------
DROP TABLE IF EXISTS `yii2_user`;
CREATE TABLE `yii2_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT '10',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- ----------------------------
-- Records of yii2_user
-- ----------------------------
