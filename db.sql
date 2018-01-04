# ************************************************************
# Sequel Pro SQL dump
# Version 4096
#
# http://www.sequelpro.com/
# http://code.google.com/p/sequel-pro/
#
# Host: 127.0.0.1 (MySQL 5.7.17)
# Database: yii2cms
# Generation Time: 2017-02-07 08:22:55 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE=''NO_AUTO_VALUE_ON_ZERO'' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table yii2_admin
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yii2_admin`;

CREATE TABLE `yii2_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(255) NOT NULL COMMENT ''用户名'',
  `auth_key` varchar(32) NOT NULL,
  `password_hash` varchar(255) NOT NULL COMMENT ''密码'',
  `email` varchar(255) NOT NULL COMMENT ''邮箱'',
  `reg_ip` int(11) NOT NULL DEFAULT ''0'' COMMENT ''创建或注册IP'',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT ''0'' COMMENT ''最后登录时间'',
  `last_login_ip` int(11) NOT NULL DEFAULT ''0'' COMMENT ''最后登录IP'',
  `status` tinyint(4) NOT NULL DEFAULT ''1'' COMMENT ''用户状态 1正常 0禁用'',
  `created_at` int(11) NOT NULL COMMENT ''创建或注册时间'',
  `updated_at` int(11) NOT NULL COMMENT ''更新时间'',
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `yii2_admin` WRITE;
/*!40000 ALTER TABLE `yii2_admin` DISABLE KEYS */;

INSERT INTO `yii2_admin` (`id`, `username`, `auth_key`, `password_hash`, `email`, `reg_ip`, `last_login_time`, `last_login_ip`, `status`, `created_at`, `updated_at`)
VALUES
	(1,''admin'',''SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ'',''$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i'',''771405950@qq.com'',2130706433,1484733705,2130706433,1,1482305564,1484733705);

/*!40000 ALTER TABLE `yii2_admin` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table yii2_auth_assignment
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yii2_auth_assignment`;

CREATE TABLE `yii2_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `yii2_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `yii2_auth_assignment` WRITE;
/*!40000 ALTER TABLE `yii2_auth_assignment` DISABLE KEYS */;

INSERT INTO `yii2_auth_assignment` (`item_name`, `user_id`, `created_at`)
VALUES
	(''administors'',''1'',1484712737);

/*!40000 ALTER TABLE `yii2_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table yii2_auth_item
# ------------------------------------------------------------

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

LOCK TABLES `yii2_auth_item` WRITE;
/*!40000 ALTER TABLE `yii2_auth_item` DISABLE KEYS */;

INSERT INTO `yii2_auth_item` (`name`, `type`, `description`, `rule_name`, `data`, `created_at`, `updated_at`)
VALUES
	(''admin/auth'',2,'''',''admin/auth'',NULL,1484734191,1484734305),
	(''admin/create'',2,'''',''admin/create'',NULL,1484734191,1484734305),
	(''admin/delete'',2,'''',''admin/delete'',NULL,1484734191,1484734305),
	(''admin/index'',2,'''',''admin/index'',NULL,1484734191,1484734305),
	(''admin/update'',2,'''',''admin/update'',NULL,1484734191,1484734305),
	(''administors'',1,''授权所有权限'',NULL,NULL,1484712662,1484712662),
	(''config/attachment'',2,'''',''config/attachment'',NULL,1484734191,1484734305),
	(''config/basic'',2,'''',''config/basic'',NULL,1484734191,1484734305),
	(''config/send-mail'',2,'''',''config/send-mail'',NULL,1484734191,1484734305),
	(''database/export'',2,'''',''database/export'',NULL,1484734305,1484734305),
	(''editors'',1,''网站编辑'',NULL,NULL,1484712712,1484712712),
	(''index/index'',2,'''',''index/index'',NULL,1484734191,1484734305),
	(''menu/create'',2,'''',''menu/create'',NULL,1484734191,1484734305),
	(''menu/delete'',2,'''',''menu/delete'',NULL,1484734191,1484734305),
	(''menu/index'',2,'''',''menu/index'',NULL,1484734191,1484734305),
	(''menu/update'',2,'''',''menu/update'',NULL,1484734191,1484734305),
	(''role/auth'',2,'''',''role/auth'',NULL,1484734191,1484734305),
	(''role/create'',2,'''',''role/create'',NULL,1484734191,1484734305),
	(''role/delete'',2,'''',''role/delete'',NULL,1484734191,1484734305),
	(''role/index'',2,'''',''role/index'',NULL,1484734191,1484734305),
	(''role/update'',2,'''',''role/update'',NULL,1484734191,1484734305);

/*!40000 ALTER TABLE `yii2_auth_item` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table yii2_auth_item_child
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yii2_auth_item_child`;

CREATE TABLE `yii2_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `yii2_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yii2_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `yii2_auth_item_child` WRITE;
/*!40000 ALTER TABLE `yii2_auth_item_child` DISABLE KEYS */;

INSERT INTO `yii2_auth_item_child` (`parent`, `child`)
VALUES
	(''administors'',''admin/auth''),
	(''administors'',''admin/create''),
	(''administors'',''admin/delete''),
	(''administors'',''admin/index''),
	(''administors'',''admin/update''),
	(''administors'',''config/attachment''),
	(''administors'',''config/basic''),
	(''administors'',''config/send-mail''),
	(''administors'',''database/export''),
	(''administors'',''index/index''),
	(''administors'',''menu/create''),
	(''administors'',''menu/delete''),
	(''administors'',''menu/index''),
	(''administors'',''menu/update''),
	(''administors'',''role/auth''),
	(''administors'',''role/create''),
	(''administors'',''role/delete''),
	(''administors'',''role/index''),
	(''administors'',''role/update'');

/*!40000 ALTER TABLE `yii2_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table yii2_auth_rule
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yii2_auth_rule`;

CREATE TABLE `yii2_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `yii2_auth_rule` WRITE;
/*!40000 ALTER TABLE `yii2_auth_rule` DISABLE KEYS */;

INSERT INTO `yii2_auth_rule` (`name`, `data`, `created_at`, `updated_at`)
VALUES
	('''',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:0:\"\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734275;}'',1484734191,1484734275),
	(''admin/auth'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"admin/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''admin/create'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''admin/delete'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''admin/index'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"admin/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''admin/update'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''config/attachment'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:17:\"config/attachment\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''config/basic'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"config/basic\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''config/send-mail'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:16:\"config/send-mail\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''database/export'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"database/export\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734305;s:9:\"updatedAt\";i:1484734305;}'',1484734305,1484734305),
	(''index/index'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"index/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''menu/create'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''menu/delete'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''menu/index'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"menu/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''menu/update'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''role/auth'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:9:\"role/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''role/create'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''role/delete'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''role/index'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"role/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305),
	(''role/update'',''O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}'',1484734191,1484734305);

/*!40000 ALTER TABLE `yii2_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table yii2_config
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yii2_config`;

CREATE TABLE `yii2_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyid` varchar(20) NOT NULL DEFAULT '''',
  `title` varchar(100) NOT NULL DEFAULT '''',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `keyid` (`keyid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `yii2_config` WRITE;
/*!40000 ALTER TABLE `yii2_config` DISABLE KEYS */;

INSERT INTO `yii2_config` (`id`, `keyid`, `title`, `data`)
VALUES
	(1,''basic'','''',''{\"sitename\":\"Yii2 CMS\",\"url\":\"http:\\/\\/www.test-yii2cms.com\",\"logo\":\"\\/statics\\/themes\\/admin\\/images\\/logo.png\",\"seo_keywords\":\"Yii2,CMS\",\"seo_description\":\"Yii2,CMS\",\"copyright\":\"@Yii2 CMS\",\"statcode\":\"\",\"close\":\"0\",\"close_reason\":\"\\u7ad9\\u70b9\\u5347\\u7ea7\\u4e2d, \\u8bf7\\u7a0d\\u540e\\u8bbf\\u95ee!\"}''),
	(2,''sendmail'','''',''{\"mail_type\":\"0\",\"smtp_server\":\"smtp.qq.com\",\"smtp_port\":\"25\",\"auth\":\"1\",\"openssl\":\"1\",\"smtp_user\":\"771405950\",\"smtp_pwd\":\"qiaoBo1989122\",\"send_email\":\"771405950@qq.com\",\"nickname\":\"\\u8fb9\\u8d70\\u8fb9\\u4e54\",\"sign\":\"<hr \\/>\\r\\n\\u90ae\\u4ef6\\u7b7e\\u540d\\uff1a\\u6b22\\u8fce\\u8bbf\\u95ee <a href=\\\"http:\\/\\/www.test-yii2cms.com\\\" target=\\\"_blank\\\">Yii2 CMS<\\/a>\"}''),
	(3,''attachment'','''',''{\"attachment_size\":\"2048\",\"attachment_suffix\":\"jpg|jpeg|gif|bmp|png\",\"watermark_enable\":\"1\",\"watermark_pos\":\"0\",\"watermark_text\":\"Yii2 CMS\"}'');

/*!40000 ALTER TABLE `yii2_config` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table yii2_menu
# ------------------------------------------------------------

#DROP TABLE IF EXISTS `yii2_menu`;
drop table if exists `yii2_menu`;
CREATE TABLE `yii2_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT ''0'',
  `name` varchar(50) NOT NULL DEFAULT '''',
  `url` varchar(60) NOT NULL DEFAULT '''',
  `icon_style` varchar(50) NOT NULL DEFAULT '''',
  `display` tinyint(3) unsigned NOT NULL DEFAULT ''1'',
  `sort` smallint(5) unsigned NOT NULL DEFAULT ''0'',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `yii2_menu` WRITE;
/*!40000 ALTER TABLE `yii2_menu` DISABLE KEYS */;

INSERT INTO `yii2_menu` (`id`, `pid`, `name`, `url`, `icon_style`, `display`, `sort`)
VALUES
	(1,0,''我的面板'',''index/index'',''fa-home'',1,0),
	(2,0,''站点设置'',''config/basic'',''fa-cogs'',1,0),
	(3,0,''管理员设置'',''admin/index'',''fa-user'',1,0),
	(4,0,''内容设置'','''',''fa-edit'',1,0),
	(5,0,''用户设置'','''',''fa-users'',1,0),
	(6,0,''数据库设置'',''database/export'',''fa-hdd-o'',0,0),
	(7,0,''界面设置'','''',''fa-picture-o'',1,0),
	(8,1,''系统信息'',''index/index'','''',1,0),
	(9,2,''站点配置'',''config/basic'','''',1,0),
	(10,2,''后台菜单管理'',''menu/index'','''',1,0),
	(11,3,''管理员管理'',''admin/index'','''',1,0),
	(12,3,''角色管理'',''role/index'','''',1,0),
	(13,4,''内容管理'','''','''',1,0),
	(14,4,''栏目管理'','''','''',1,0),
	(15,4,''模型管理'','''','''',1,0),
	(16,5,''用户管理'','''','''',0,0),
	(17,6,''数据库管理'',''database/export'','''',1,0),
	(18,7,''主题管理'','''','''',0,0),
	(19,7,''模板管理'','''','''',0,0),
	(20,9,''基本配置'',''config/basic'','''',1,0),
	(21,9,''邮箱配置'',''config/send-mail'','''',1,0),
	(22,9,''附件配置'',''config/attachment'','''',1,0),
	(23,10,''添加菜单'',''menu/create'','''',1,0),
	(24,10,''更新'',''menu/update'','''',1,0),
	(25,10,''删除'',''menu/delete'','''',1,0),
	(26,11,''添加'',''admin/create'','''',1,0),
	(27,11,''更新'',''admin/update'','''',1,0),
	(28,11,''授权'',''admin/auth'','''',1,0),
	(29,11,''删除'',''admin/delete'','''',1,0),
	(30,12,''添加'',''role/create'','''',1,0),
	(31,12,''更新'',''role/update'','''',1,0),
	(32,12,''授权'',''role/auth'','''',1,0),
	(33,12,''删除'',''role/delete'','''',1,0),
	(34,0, ''产品管理'',''product/index'',''fa-coffee'',1,0),
	(35,34, ''产品管理'',''product/index'',''fa-coffee'',1,0),
	(36,0, ''套餐管理'',''combo/index'',''fa-coffee'',1,0),
	(37,36, ''套餐管理'',''combo/index'',''fa-coffee'',1,0);

/*!40000 ALTER TABLE `yii2_menu` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table yii2_migration
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yii2_migration`;

CREATE TABLE `yii2_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `yii2_migration` WRITE;
/*!40000 ALTER TABLE `yii2_migration` DISABLE KEYS */;

INSERT INTO `yii2_migration` (`version`, `apply_time`)
VALUES
	(''m000000_000000_base'',1482231528),
	(''m130524_201442_init'',1482231534);

/*!40000 ALTER TABLE `yii2_migration` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table yii2_session
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yii2_session`;

CREATE TABLE `yii2_session` (
  `id` char(40) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

LOCK TABLES `yii2_session` WRITE;
/*!40000 ALTER TABLE `yii2_session` DISABLE KEYS */;

INSERT INTO `yii2_session` (`id`, `expire`, `data`)
VALUES
	(''50mv18unkq46q5t94n0tv7t1l3'',1484732865,X''5F5F666C6173687C613A303A7B7D5F5F69647C693A313B''),
	(''5c589uela7jkdc7s7lijpu71e1'',1482319990,X''5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B''),
	(''5e7jksn25g5a69rmmkcv6v3jh2'',1482234228,X''5F5F666C6173687C613A303A7B7D''),
	(''bfffpuqu46gt0t857r53382o56'',1482249265,X''5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A32363A222F61646D696E2E7068703F723D696E6465782532466C6F67696E223B''),
	(''c9ive1r6ogid1c9gp1tdsmis76'',1486376936,X''5F5F666C6173687C613A303A7B7D5F5F69647C693A313B''),
	(''cdfe9o8aegeg2c4lfovbsq8ai6'',1482328081,X''5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B''),
	(''muupqb3dhiko9m8j14u0a41f37'',1484737919,X''5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A32343A222F61646D696E2E7068703F723D696E6465782F6C6F67696E223B5F5F69647C693A313B''),
	(''pkega8ai18h7scjtb5gd3lamq3'',1482332077,X''5F5F666C6173687C613A303A7B7D5F5F69647C693A313B'');

/*!40000 ALTER TABLE `yii2_session` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table yii2_user
# ------------------------------------------------------------

DROP TABLE IF EXISTS `yii2_user`;

CREATE TABLE `yii2_user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `auth_key` varchar(32) COLLATE utf8_unicode_ci NOT NULL,
  `password_hash` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `password_reset_token` varchar(255) COLLATE utf8_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8_unicode_ci NOT NULL,
  `status` smallint(6) NOT NULL DEFAULT ''10'',
  `created_at` int(11) NOT NULL,
  `updated_at` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `username` (`username`),
  UNIQUE KEY `email` (`email`),
  UNIQUE KEY `password_reset_token` (`password_reset_token`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

/*套餐表*/
DROP TABLE IF EXISTS `yii2_combo`;
CREATE TABLE `yii2_combo` (
`combo_id` int(10)  NOT NULL AUTO_INCREMENT,
`combo_name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''套餐名称'',
`created_at` date NOT NULL,
`updated_at` date NOT NULL,
`uid` smallint(6) NOT NULL COMMENT ''用户id'',
`product_id` int(11) NOT NULL,
PRIMARY KEY (`combo_id`) ,
INDEX `ppid` (`product_id` ASC) USING BTREE
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;

/*订单表*/
DROP TABLE IF EXISTS `yii2_order`;
CREATE TABLE `yii2_order` (
`id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT,
`pid` int(11) UNSIGNED NOT NULL COMMENT ''产品id'',
`order_classify` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''1'' COMMENT ''1网店2直客3同业'',
`order_type` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''1'' COMMENT ''1正常2加急3特急'',
`order_date` date NOT NULL COMMENT ''订单日期'',
`customer_id` int(11) NOT NULL COMMENT ''客户id'',
`combo_id` int(11) NOT NULL COMMENT ''套餐id'',
`custom_servicer_id` smallint(6) NOT NULL COMMENT ''客服id'',
`transactor_id` int(11) NOT NULL COMMENT ''办理人ID'',
`transactor_name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''办理人名称'',
`product_id` int(11) NOT NULL COMMENT ''产品id'',
`single_sum` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT ''单项实收金额'',
`total_person` smallint(5) NOT NULL DEFAULT 0 COMMENT ''人数'',
`balance_order` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''0.00'' COMMENT ''补差订单号'',
`balance_sum` decimal(10,2) NOT NULL COMMENT ''补差订单金额'',
`flushphoto_order` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''代冲洗照片订单号'',
`flushphoto_sum` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT ''代冲洗照片订单金额'',
`carrier_order` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''快递费补差订单号'',
`carrier_sum` decimal(10,2) NOT NULL DEFAULT 0.00 COMMENT ''快递费补差订单金额'',
`collect_date` date NOT NULL COMMENT ''收资料日'',
`deliver_date` date NOT NULL COMMENT ''送证日'',
`entry_date` date NOT NULL COMMENT ''入馆日'',
`putsign_date` date NOT NULL COMMENT ''出签日'',
`operator` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''操作员'',
`back_address` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''回寄地址'',
`back_addressee` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''收件人'',
`back_telphone` varchar(36) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''回寄地址'',
`delivergood_date` date NOT NULL COMMENT ''发货日期'',
`deliver_order` varchar(64) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''订单编号'',
`delivercompany_id` smallint(6) NULL COMMENT ''订单公司ID'',
`remark` tinytext CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''备注'',
`receipt_date` date NOT NULL COMMENT ''收款日期'',
`pay_date` date NOT NULL COMMENT ''支付日期'',
`audit_status` char(1) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL DEFAULT ''1'' COMMENT ''1审核中2审核未通过3审核通过'',
PRIMARY KEY (`id`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;

/*产品表*/
DROP TABLE IF EXISTS `yii2_product`;
CREATE TABLE `yii2_product` (
`id` int(11) NOT NULL COMMENT ''产品id'' AUTO_INCREMENT,
`name` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`picture` varchar(255) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`cost` decimal(10,2) NOT NULL COMMENT ''支出成本'',
`country_id` smallint(4),
PRIMARY KEY (`id`)
)
ENGINE = InnoDB
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;

/*国家列表*/
DROP TABLE IF EXISTS `yii2_country`;
CREATE TABLE `yii2_country` (
`id` smallint(4)  NOT NULL AUTO_INCREMENT,
`abbr` char(5) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''国家简写'',
`cinfo` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''国家中文'',
PRIMARY KEY (`id`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;

/*快递公司表*/
DROP TABLE IF EXISTS `yii2_delivery_company`;
CREATE TABLE `yii2_delivery_company` (
`id` smallint(11)  NOT NULL AUTO_INCREMENT,
`companyname` varchar(100) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL COMMENT ''公司名称'',
PRIMARY KEY (`id`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;

/*办理人信息表*/
DROP TABLE IF EXISTS `yii2_transator`;
CREATE TABLE `yii2_transator` (
`tid` int(11) NOT NULL AUTO_INCREMENT,
`name` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`phone` varchar(32) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
`address` varchar(50) CHARACTER SET utf8 COLLATE utf8_general_ci NOT NULL,
PRIMARY KEY (`tid`)
)
ENGINE = InnoDB
AUTO_INCREMENT = 1
DEFAULT CHARACTER SET = utf8
COLLATE = utf8_general_ci
ROW_FORMAT = Dynamic;

/*国家表*/
DROP TABLE IF EXISTS `yii2_country`;
CREATE TABLE `yii2_country` (
  `id` SMALLINT(4) NOT NULL AUTO_INCREMENT,
  `abbr` varchar(100) DEFAULT NULL COMMENT ''英文缩写'',
  `cinfo` varchar(200) DEFAULT NULL COMMENT ''中文名'',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;
insert  into `yii2_country`(`id`,`abbr`,`cinfo`) values (1,''AL'',''阿尔巴尼亚''),(2,''DZ'',''阿尔及利亚''),(3,''AF'',''阿富汗''),(4,''AR'',''阿根廷''),(5,''AE'',''阿拉伯联合酋长国''),(6,''AW'',''阿鲁巴''),(7,''OM'',''阿曼''),(8,''AZ'',''阿塞拜疆''),(9,''EG'',''埃及''),(10,''ET'',''埃塞俄比亚''),(11,''IE'',''爱尔兰''),(12,''EE'',''爱沙尼亚''),(13,''AD'',''安道尔''),(14,''AO'',''安哥拉''),(15,''AI'',''安圭拉岛''),(16,''AG'',''安提瓜和巴布达''),(17,''AT'',''奥地利''),(18,''AX'',''奥兰岛''),(19,''AU'',''澳大利亚''),(20,''MO'',''澳门特别行政区''),(21,''BB'',''巴巴多斯''),(22,''PG'',''巴布亚新几内亚''),(23,''BS'',''巴哈马''),(24,''PK'',''巴基斯坦''),(25,''PY'',''巴拉圭''),(26,''PS'',''巴勒斯坦民族权力机构''),(27,''BH'',''巴林''),(28,''PA'',''巴拿马''),(29,''BR'',''巴西''),(30,''BY'',''白俄罗斯''),(31,''BM'',''百慕大群岛''),(32,''BG'',''保加利亚''),(33,''MP'',''北马里亚纳群岛''),(34,''BJ'',''贝宁''),(35,''BE'',''比利时''),(36,''IS'',''冰岛''),(37,''PR'',''波多黎各''),(38,''PL'',''波兰''),(39,''BA'',''波斯尼亚和黑塞哥维那''),(40,''BO'',''玻利维亚''),(41,''BZ'',''伯利兹''),(42,''BW'',''博茨瓦纳''),(43,''BQ'',''博内尔''),(44,''BT'',''不丹''),(45,''BF'',''布基纳法索''),(46,''BI'',''布隆迪''),(47,''BV'',''布韦岛''),(48,''KP'',''朝鲜''),(49,''GQ'',''赤道几内亚''),(50,''DK'',''丹麦''),(51,''DE'',''德国''),(52,''TL'',''东帝汶''),(53,''TG'',''多哥''),(54,''DO'',''多米尼加共和国''),(55,''DM'',''多米尼克''),(56,''RU'',''俄罗斯''),(57,''EC'',''厄瓜多尔''),(58,''ER'',''厄立特里亚''),(59,''FR'',''法国''),(60,''FO'',''法罗群岛''),(61,''PF'',''法属波利尼西亚''),(62,''GF'',''法属圭亚那''),(63,''TF'',''法属南极地区''),(64,''VA'',''梵蒂冈城''),(65,''PH'',''菲律宾''),(66,''FJ'',''斐济群岛''),(67,''FI'',''芬兰''),(68,''CV'',''佛得角''),(69,''FK'',''福克兰群岛(马尔维纳斯群岛)''),(70,''GM'',''冈比亚''),(71,''CD'',''刚果(DRC)''),(72,''CG'',''刚果共和国''),(73,''CO'',''哥伦比亚''),(74,''CR'',''哥斯达黎加''),(75,''GG'',''格恩西岛''),(76,''GD'',''格林纳达''),(77,''GL'',''格陵兰''),(78,''GE'',''格鲁吉亚''),(79,''CU'',''古巴''),(80,''GP'',''瓜德罗普岛''),(81,''GU'',''关岛''),(82,''GY'',''圭亚那''),(83,''KZ'',''哈萨克斯坦''),(84,''HT'',''海地''),(85,''KR'',''韩国''),(86,''NL'',''荷兰''),(87,''HM'',''赫德和麦克唐纳群岛''),(88,''ME'',''黑山共和国''),(89,''HN'',''洪都拉斯''),(90,''KI'',''基里巴斯''),(91,''DJ'',''吉布提''),(92,''KG'',''吉尔吉斯斯坦''),(93,''GN'',''几内亚''),(94,''GW'',''几内亚比绍''),(95,''CA'',''加拿大''),(96,''GH'',''加纳''),(97,''GA'',''加蓬''),(98,''KH'',''柬埔寨''),(99,''CZ'',''捷克共和国''),(100,''ZW'',''津巴布韦''),(101,''CM'',''喀麦隆''),(102,''QA'',''卡塔尔''),(103,''KY'',''开曼群岛''),(104,''CC'',''科科斯群岛(基灵群岛)''),(105,''KM'',''科摩罗联盟''),(106,''CI'',''科特迪瓦共和国''),(107,''KW'',''科威特''),(108,''HR'',''克罗地亚''),(109,''KE'',''肯尼亚''),(110,''CK'',''库可群岛''),(111,''CW'',''库拉索''),(112,''LV'',''拉脱维亚''),(113,''LS'',''莱索托''),(114,''LA'',''老挝''),(115,''LB'',''黎巴嫩''),(116,''LT'',''立陶宛''),(117,''LR'',''利比里亚''),(118,''LY'',''利比亚''),(119,''LI'',''列支敦士登''),(120,''RE'',''留尼汪岛''),(121,''LU'',''卢森堡''),(122,''RW'',''卢旺达''),(123,''RO'',''罗马尼亚''),(124,''MG'',''马达加斯加''),(125,''IM'',''马恩岛''),(126,''MV'',''马尔代夫''),(127,''MT'',''马耳他''),(128,''MW'',''马拉维''),(129,''MY'',''马来西亚''),(130,''ML'',''马里''),(131,''MK'',''马其顿, 前南斯拉夫共和国''),(132,''MH'',''马绍尔群岛''),(133,''MQ'',''马提尼克岛''),(134,''YT'',''马约特岛''),(135,''MU'',''毛里求斯''),(136,''MR'',''毛利塔尼亚''),(137,''US'',''美国''),(138,''AS'',''美属萨摩亚''),(139,''UM'',''美属外岛''),(140,''VI'',''美属维尔京群岛''),(141,''MN'',''蒙古''),(142,''MS'',''蒙特塞拉特''),(143,''BD'',''孟加拉国''),(144,''PE'',''秘鲁''),(145,''FM'',''密克罗尼西亚''),(146,''MM'',''缅甸''),(147,''MD'',''摩尔多瓦''),(148,''MA'',''摩洛哥''),(149,''MC'',''摩纳哥''),(150,''MZ'',''莫桑比克''),(151,''MX'',''墨西哥''),(152,''NA'',''纳米比亚''),(153,''ZA'',''南非''),(154,''AQ'',''南极洲''),(155,''GS'',''南乔治亚和南德桑威奇群岛''),(156,''NR'',''瑙鲁''),(157,''NP'',''尼泊尔''),(158,''NI'',''尼加拉瓜''),(159,''NE'',''尼日尔''),(160,''NG'',''尼日利亚''),(161,''NU'',''纽埃''),(162,''NO'',''挪威''),(163,''NF'',''诺福克岛''),(164,''PW'',''帕劳群岛''),(165,''PN'',''皮特凯恩群岛''),(166,''PT'',''葡萄牙''),(167,''JP'',''日本''),(168,''SE'',''瑞典''),(169,''CH'',''瑞士''),(170,''SV'',''萨尔瓦多''),(171,''WS'',''萨摩亚''),(172,''RS'',''塞尔维亚共和国''),(173,''SL'',''塞拉利昂''),(174,''SN'',''塞内加尔''),(175,''CY'',''塞浦路斯''),(176,''SC'',''塞舌尔''),(177,''XS'',''沙巴岛''),(178,''SA'',''沙特阿拉伯''),(179,''BL'',''圣巴泰勒米岛''),(180,''CX'',''圣诞岛''),(181,''ST'',''圣多美和普林西比''),(182,''SH'',''圣赫勒拿岛''),(183,''KN'',''圣基茨和尼维斯''),(184,''LC'',''圣卢西亚''),(185,''MF'',''圣马丁岛''),(186,''SX'',''圣马丁岛''),(187,''SM'',''圣马力诺''),(188,''PM'',''圣皮埃尔岛和密克隆岛''),(189,''VC'',''圣文森特和格林纳丁斯''),(190,''XE'',''圣尤斯特歇斯岛''),(191,''LK'',''斯里兰卡''),(192,''SK'',''斯洛伐克''),(193,''SI'',''斯洛文尼亚''),(194,''SZ'',''斯威士兰''),(195,''SD'',''苏丹''),(196,''SR'',''苏里南''),(197,''SB'',''所罗门群岛''),(198,''SO'',''索马里''),(199,''TJ'',''塔吉克斯坦''),(200,''TW'',''台湾''),(201,''TH'',''泰国''),(202,''TZ'',''坦桑尼亚''),(203,''TO'',''汤加''),(204,''TC'',''特克斯和凯科斯群岛''),(205,''TT'',''特立尼达和多巴哥''),(206,''TN'',''突尼斯''),(207,''TV'',''图瓦卢''),(208,''TR'',''土耳其''),(209,''TM'',''土库曼斯坦''),(210,''TK'',''托克劳''),(211,''WF'',''瓦利斯和富图纳''),(212,''VU'',''瓦努阿图''),(213,''GT'',''危地马拉''),(214,''VG'',''维尔京群岛(英属)''),(215,''VE'',''委内瑞拉''),(216,''BN'',''文莱''),(217,''UG'',''乌干达''),(218,''UA'',''乌克兰''),(219,''UY'',''乌拉圭''),(220,''UZ'',''乌兹别克斯坦''),(221,''ES'',''西班牙''),(222,''GR'',''希腊''),(223,''HK'',''香港特别行政区''),(224,''SG'',''新加坡''),(225,''NC'',''新喀里多尼亚''),(226,''NZ'',''新西兰''),(227,''HU'',''匈牙利''),(228,''SY'',''叙利亚''),(229,''JM'',''牙买加''),(230,''AM'',''亚美尼亚''),(231,''SJ'',''扬马延岛''),(232,''YE'',''也门''),(233,''IQ'',''伊拉克''),(234,''IR'',''伊朗''),(235,''IL'',''以色列''),(236,''IT'',''意大利''),(237,''IN'',''印度''),(238,''ID'',''印度尼西亚''),(239,''UK'',''英国''),(240,''IO'',''英属印度洋领地''),(241,''JO'',''约旦''),(242,''VN'',''越南''),(243,''ZM'',''赞比亚''),(244,''JE'',''泽西''),(245,''TD'',''乍得''),(246,''GI'',''直布罗陀''),(247,''CL'',''智利''),(248,''CF'',''中非共和国''),(249,''CN'',''中国'');


/*建立外键关联关系*/
ALTER TABLE `yii2_product` ADD CONSTRAINT `product_country_id` FOREIGN KEY (`country_id`) REFERENCES `yii2_country` (`id`) ON DELETE RESTRICT ON UPDATE NO ACTION;
ALTER TABLE `yii2_combo` ADD CONSTRAINT `combo_product_id` FOREIGN KEY (`product_id`) REFERENCES `yii2_product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION;
ALTER TABLE `yii2_order` ADD CONSTRAINT `order_transator_id` FOREIGN KEY (`transactor_id`) REFERENCES `yii2_transator` (`tid`) ON DELETE RESTRICT ON UPDATE NO ACTION;
ALTER TABLE `yii2_order` ADD CONSTRAINT `order_deliverycompany_id` FOREIGN KEY (`delivercompany_id`) REFERENCES `yii2_delivery_company` (`id`) ON DELETE RESTRICT ON UPDATE NO ACTION;
ALTER TABLE `yii2_order` ADD CONSTRAINT `order_product_id` FOREIGN KEY (`product_id`) REFERENCES `yii2_product` (`id`) ON DELETE RESTRICT ON UPDATE NO ACTION;
