/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : visa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-23 18:28:38
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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_admin
-- ----------------------------
INSERT INTO `yii2_admin` VALUES ('1', 'admin', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i', '771405950@qq.com', '2130706433', '1516350969', '2130706433', '1', '1482305564', '1516350969');
INSERT INTO `yii2_admin` VALUES ('4', 'admin2', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i', '876505905@qq.com', '2130706433', '1484733705', '2130706433', '1', '1482305564', '1484733705');

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
  `created_at` int(10) NOT NULL,
  `updated_at` int(10) NOT NULL,
  `uid` smallint(6) NOT NULL COMMENT '用户id',
  `product_id` int(11) NOT NULL COMMENT '产品id',
  PRIMARY KEY (`combo_id`),
  KEY `ppid` (`product_id`) USING BTREE,
  CONSTRAINT `combo_product_id` FOREIGN KEY (`product_id`) REFERENCES `yii2_product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39336 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_combo
-- ----------------------------
INSERT INTO `yii2_combo` VALUES ('39310', '298/5', '', '200.000', '1', '1', '1516207892', '1516207892', '1', '67632');
INSERT INTO `yii2_combo` VALUES ('39311', '398/3', '', '300.000', '2', '1', '1516207903', '1516207903', '1', '67632');
INSERT INTO `yii2_combo` VALUES ('39312', '520/2', '', '400.000', '3', '1', '1516207921', '1516207921', '1', '67632');
INSERT INTO `yii2_combo` VALUES ('39313', '330/5', '', '230.000', '1', '2', '1516207960', '1516207960', '1', '67632');
INSERT INTO `yii2_combo` VALUES ('39314', '430/3', '', '330.000', '2', '2', '1516207974', '1516207974', '1', '67632');
INSERT INTO `yii2_combo` VALUES ('39315', '540/1', '', '330.000', '3', '2', '1516207987', '1516207994', '1', '67632');
INSERT INTO `yii2_combo` VALUES ('39316', '333/3', '', '11.000', '1', '1', '1516208079', '1516208079', '1', '67633');
INSERT INTO `yii2_combo` VALUES ('39317', '555/5', '', '33.000', '2', '1', '1516208091', '1516208091', '1', '67633');
INSERT INTO `yii2_combo` VALUES ('39318', '555/1', '', '11.000', '3', '1', '1516208099', '1516208099', '1', '67633');
INSERT INTO `yii2_combo` VALUES ('39319', '223/3', '', '34.000', '1', '2', '1516208109', '1516208109', '1', '67633');
INSERT INTO `yii2_combo` VALUES ('39320', '330/5', '', '444.000', '2', '2', '1516208118', '1516208118', '1', '67633');
INSERT INTO `yii2_combo` VALUES ('39321', '666/3', '', '222.000', '3', '2', '1516208130', '1516208130', '1', '67633');
INSERT INTO `yii2_combo` VALUES ('39322', '333/2', '', '222.000', '1', '3', '1516208148', '1516690602', '1', '67633');
INSERT INTO `yii2_combo` VALUES ('39323', '555/3', '', '333.000', '2', '3', '1516208160', '1516208160', '1', '67633');
INSERT INTO `yii2_combo` VALUES ('39324', '666/2', '', '555.000', '3', '3', '1516208171', '1516703259', '1', '67633');
INSERT INTO `yii2_combo` VALUES ('39325', '788/10', '', '445.000', '1', '3', '1516209171', '1516209171', '1', '67632');
INSERT INTO `yii2_combo` VALUES ('39326', '888/5', '', '666.000', '2', '3', '1516209186', '1516209186', '1', '67632');
INSERT INTO `yii2_combo` VALUES ('39327', '889/2', '', '777.000', '3', '3', '1516209200', '1516209200', '1', '67632');

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
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_menu
-- ----------------------------
INSERT INTO `yii2_menu` VALUES ('1', '0', '我的面板', 'index/index', 'fa-home', '0', '0');
INSERT INTO `yii2_menu` VALUES ('2', '0', '系统设置', 'config/basic', 'fa-cogs', '1', '99');
INSERT INTO `yii2_menu` VALUES ('3', '0', '管理员设置', 'admin/index', 'fa-user', '1', '98');
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
INSERT INTO `yii2_menu` VALUES ('34', '0', '产品管理', 'product/index', 'fa-coffee', '1', '1');
INSERT INTO `yii2_menu` VALUES ('35', '34', '产品管理', 'product/index', 'fa-coffee', '1', '0');
INSERT INTO `yii2_menu` VALUES ('36', '0', '套餐管理', 'combo/index', 'fa-coffee', '0', '0');
INSERT INTO `yii2_menu` VALUES ('37', '36', '套餐管理', 'combo/index', 'fa-coffee', '1', '0');
INSERT INTO `yii2_menu` VALUES ('38', '0', '订单管理', 'order/index', 'fa-dollar', '1', '2');
INSERT INTO `yii2_menu` VALUES ('39', '38', '订单列表', 'order/index', 'fa-dollar', '1', '0');
INSERT INTO `yii2_menu` VALUES ('41', '40', '国家列表', 'country/index', 'fa-flag', '1', '1');
INSERT INTO `yii2_menu` VALUES ('42', '0', '客服管理', 'servicer/index', 'fa-users', '0', '14');
INSERT INTO `yii2_menu` VALUES ('43', '42', '客服列表', 'servicer/index', 'fa-users', '1', '1');
INSERT INTO `yii2_menu` VALUES ('45', '46', '客服列表', 'servicer/index', 'fa-users', '1', '1');
INSERT INTO `yii2_menu` VALUES ('46', '0', '人员管理', 'transator/index', 'fa-user', '1', '13');
INSERT INTO `yii2_menu` VALUES ('47', '46', '办理人列表', 'transator/index', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('48', '0', '系统信息', 'index/index', 'fa-home', '1', '0');
INSERT INTO `yii2_menu` VALUES ('49', '48', '系统信息', 'index/index', '', '1', '0');

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
  `order_num` varchar(100) NOT NULL COMMENT '订单号',
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
  `operator_id` smallint(6) NOT NULL COMMENT '操作员',
  `back_address` tinytext NOT NULL COMMENT '回寄地址',
  `back_addressee` varchar(50) NOT NULL COMMENT '收件人',
  `back_telphone` varchar(36) NOT NULL COMMENT '收件人电话',
  `delivergood_date` date NOT NULL COMMENT '发货日期',
  `deliver_order` varchar(64) NOT NULL COMMENT '快递单号',
  `delivercompany` varchar(50) DEFAULT NULL COMMENT '快递公司ID',
  `remark` tinytext NOT NULL COMMENT '备注',
  `receipt_date` date NOT NULL COMMENT '收款日期',
  `pay_date` date NOT NULL COMMENT '支付日期',
  `audit_status` char(1) NOT NULL DEFAULT '1' COMMENT '1审核中2审核未通过3审核通过',
  `cid` smallint(4) NOT NULL COMMENT '国家id',
  `created_at` int(10) NOT NULL COMMENT '创建时间',
  `updated_at` int(10) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `order_deliverycompany_id` (`delivercompany`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_order
-- ----------------------------
INSERT INTO `yii2_order` VALUES ('31', '67633', '435345', '1', '3', '2018-01-23', 'zy2010816', '30', '1', '', '555.00', '1', '', '0.000', '', '0.00', '', '0.00', '1970-01-01', '1970-01-01', '1970-01-01', '1970-01-01', '1', '', '王', '18040631522', '1970-01-01', '234342', '顺风快递', '', '1970-01-01', '1970-01-01', '1', '0', '1516690307', '1516703298');
INSERT INTO `yii2_order` VALUES ('32', '67632', '353453453', '3', '2', '2018-01-23', 'zy2010816', '5', '2', '', '393.00', '1', '', '0.000', '', '0.00', '', '0.00', '1970-01-01', '1970-01-01', '1970-01-01', '1970-01-01', '1', '', '张旭', '18040631522', '1970-01-01', '324234324', '顺风快递', '', '1970-01-01', '1970-01-01', '1', '0', '1516693301', '1516693301');

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
-- Table structure for yii2_order_to_transactor
-- ----------------------------
DROP TABLE IF EXISTS `yii2_order_to_transactor`;
CREATE TABLE `yii2_order_to_transactor` (
  `o_id` int(11) NOT NULL COMMENT '订单id',
  `t_id` int(11) NOT NULL COMMENT '办理人id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_order_to_transactor
-- ----------------------------
INSERT INTO `yii2_order_to_transactor` VALUES ('27', '73');
INSERT INTO `yii2_order_to_transactor` VALUES ('30', '76');
INSERT INTO `yii2_order_to_transactor` VALUES ('29', '74');
INSERT INTO `yii2_order_to_transactor` VALUES ('28', '74');
INSERT INTO `yii2_order_to_transactor` VALUES ('28', '75');
INSERT INTO `yii2_order_to_transactor` VALUES ('30', '75');
INSERT INTO `yii2_order_to_transactor` VALUES ('30', '74');
INSERT INTO `yii2_order_to_transactor` VALUES ('31', '76');
INSERT INTO `yii2_order_to_transactor` VALUES ('31', '74');
INSERT INTO `yii2_order_to_transactor` VALUES ('32', '74');

-- ----------------------------
-- Table structure for yii2_product
-- ----------------------------
DROP TABLE IF EXISTS `yii2_product`;
CREATE TABLE `yii2_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `name` varchar(255) NOT NULL,
  `cost` decimal(10,2) NOT NULL COMMENT '支出成本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67637 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_product
-- ----------------------------
INSERT INTO `yii2_product` VALUES ('67632', '菲律宾签证', '0.00');
INSERT INTO `yii2_product` VALUES ('67633', '泰国签证', '0.00');

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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

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
INSERT INTO `yii2_session` VALUES ('53pac5u5kn9u6mp5kkaqagl977', '1516185566', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A3235303A222F61646D696E2E7068703F6E73756B65793D3752796F7A6534544A6D474E434434797558253242375077324E6536554E43735A65364B2532427663304865644B47564D683077643057376172736E5869307751384B31344D4A58654644675874386C7A584F6A76746B656F6246413238795475647A4958484265355544253246484B5462587565394E6C384B57493461656D61585078743825324241313577622532427175704A373961595748572532467044374735515677444B3573574B504475496A483465694B53666A6D7A68623268653550384A336D714258536543354A566953765665744C303346636D6557786A7951253344253344223B);
INSERT INTO `yii2_session` VALUES ('7io8gv784mehmv0dqtfifbr3g2', '1516184089', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('7ruekmm0d00rjumdr9v98d22d7', '1516034922', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B);
INSERT INTO `yii2_session` VALUES ('8br30qogg1dj2n22th0jqcl3k1', '1516242942', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B);
INSERT INTO `yii2_session` VALUES ('8pn4o1cqqesi6p9e6fiqcfq3s4', '1516457185', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('aijpnudqhtpr8pi78st6qpqfp1', '1516272953', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('b2jslmj7a8s18rm8q0r6lh11o2', '1516185924', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A303B);
INSERT INTO `yii2_session` VALUES ('ejpj9ct17u9b1df626qnbp88m7', '1516186497', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('fphem2hpu3n1ueove7mq7retk5', '1516185735', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('gqfnu7v9eafs9lluu1j3dp1rm6', '1516185831', 0x5F5F666C6173687C613A303A7B7D);
INSERT INTO `yii2_session` VALUES ('gr1igne5trh39u4lfmaosdgeh5', '1516210896', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('idargovfon3cdq73l721veg084', '1516360016', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('j388lm6clfn73l1gpv96gmtfk6', '1516185506', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A3235303A222F61646D696E2E7068703F6E73756B65793D3752796F7A6534544A6D474E434434797558253242375077324E6536554E43735A65364B2532427663304865644B47564D683077643057376172736E5869307751384B31344D4A58654644675874386C7A584F6A76746B656F6246413238795475647A4958484265355544253246484B5462587565394E6C384B57493461656D61585078743825324241313577622532427175704A373961595748572532467044374735515677444B3573574B504475496A483465694B53666A6D7A68623268653550384A336D714258536543354A566953765665744C303346636D6557786A7951253344253344223B);
INSERT INTO `yii2_session` VALUES ('junort8b944uii799ndj4bq8b7', '1516704742', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('lhvl17vlureu3c69mf5g58hej2', '1516352451', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('m7opu5pt4q7gm80771mvocj3j5', '1516185766', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('n04f4ukpiij9lcg7n9dsgmpdg6', '1516186425', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('neddt6hlqnmkd47vi5pajk1964', '1516532684', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A32363A222F61646D696E2E7068703F723D696E6465782532466C6F67696E223B);
INSERT INTO `yii2_session` VALUES ('nlvsl8ec5q2jlnf2bcfronf1q3', '1516186324', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('nn1ss1f3jt0n39fgfo1gbbfv01', '1516180548', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('p0c9qlmt7kfd2msihciu0t4d34', '1516185613', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('sqomo878c59cjuaelf9ce9j8v7', '1516185506', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A3235303A222F61646D696E2E7068703F6E73756B65793D3752796F7A6534544A6D474E434434797558253242375077324E6536554E43735A65364B2532427663304865644B47564D683077643057376172736E5869307751384B31344D4A58654644675874386C7A584F6A76746B656F6246413238795475647A4958484265355544253246484B5462587565394E6C384B57493461656D61585078743825324241313577622532427175704A373961595748572532467044374735515677444B3573574B504475496A483465694B53666A6D7A68623268653550384A336D714258536543354A566953765665744C303346636D6557786A7951253344253344223B);
INSERT INTO `yii2_session` VALUES ('u0tjt9j8ckeltp4pua2ns02rs6', '1516185668', 0x5F5F666C6173687C613A303A7B7D);

-- ----------------------------
-- Table structure for yii2_snapshot
-- ----------------------------
DROP TABLE IF EXISTS `yii2_snapshot`;
CREATE TABLE `yii2_snapshot` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `combo_name` varchar(255) NOT NULL COMMENT '套餐名称',
  `combo_cost` decimal(10,3) NOT NULL COMMENT '支出成本',
  `combo_classify` char(1) NOT NULL COMMENT '订单分类',
  `combo_type` char(1) NOT NULL COMMENT '类型',
  `snap_combo_id` int(10) NOT NULL COMMENT '快照ID',
  `is_valid` char(1) DEFAULT '1' COMMENT '是否有效',
  `combo_product` varchar(50) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=31 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_snapshot
-- ----------------------------
INSERT INTO `yii2_snapshot` VALUES ('4', '298/5', '200.000', '1', '1', '39310', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('5', '398/3', '300.000', '1', '2', '39311', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('6', '520/2', '400.000', '1', '3', '39312', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('7', '330/5', '230.000', '2', '1', '39313', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('8', '430/3', '330.000', '2', '2', '39314', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('11', '333/3', '11.000', '1', '1', '39316', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('10', '540/1', '330.000', '2', '3', '39315', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('12', '555/5', '33.000', '1', '2', '39317', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('13', '555/1', '11.000', '1', '3', '39318', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('14', '223/3', '34.000', '2', '1', '39319', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('15', '330/5', '444.000', '2', '2', '39320', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('16', '666/3', '222.000', '2', '3', '39321', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('17', '333/3', '222.000', '3', '1', '39322', '0', '');
INSERT INTO `yii2_snapshot` VALUES ('18', '555/3', '333.000', '3', '2', '39323', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('19', '666/1', '555.000', '3', '3', '39324', '0', '');
INSERT INTO `yii2_snapshot` VALUES ('20', '788/10', '445.000', '3', '1', '39325', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('21', '888/5', '666.000', '3', '2', '39326', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('22', '889/2', '777.000', '3', '3', '39327', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('23', '11', '1.000', '1', '1', '39332', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('24', '1', '1.000', '1', '1', '39333', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('25', '1', '1.000', '1', '1', '39334', '1', '');
INSERT INTO `yii2_snapshot` VALUES ('26', '333/2', '222.000', '3', '1', '39322', '1', '泰国签证');
INSERT INTO `yii2_snapshot` VALUES ('27', '233/3', '210.000', '1', '2', '39335', '0', '越南签证');
INSERT INTO `yii2_snapshot` VALUES ('28', '233/2', '210.000', '1', '2', '39335', '0', '越南签证');
INSERT INTO `yii2_snapshot` VALUES ('29', '233/3', '210.000', '1', '2', '39335', '1', '越南签证');
INSERT INTO `yii2_snapshot` VALUES ('30', '666/2', '555.000', '3', '3', '39324', '1', '泰国签证');

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
  `sex` char(1) NOT NULL DEFAULT '1' COMMENT '性别',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `identify` varchar(30) NOT NULL DEFAULT '' COMMENT '身份证',
  `is_valid` char(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `expire_time` int(10) NOT NULL COMMENT '操作过期时间',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`tid`),
  KEY `nameindex` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_transator
-- ----------------------------
INSERT INTO `yii2_transator` VALUES ('74', '张旭', '1', '', '', '', '1', '1516430261', '0', '');
INSERT INTO `yii2_transator` VALUES ('75', '黄晓霞', '', '', '', '', '1', '1516434366', '0', '');
INSERT INTO `yii2_transator` VALUES ('76', '杨杰', '1', '', '', '', '0', '1516435299', '0', '故事');

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
