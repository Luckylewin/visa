/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : visa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-02-24 10:30:03
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_admin
-- ----------------------------
INSERT INTO `yii2_admin` VALUES ('1', 'admin', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i', '771405950@qq.com', '2130706433', '1519435871', '2130706433', '1', '1482305564', '1519435871');
INSERT INTO `yii2_admin` VALUES ('4', 'admin2', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$DPm3NP2B4HDth70cflSqCeC0k562iwHf9P1gsBT728WrFA8oYcy2C', '876505905@qq.com', '2130706433', '1519439344', '2130706433', '1', '1482305564', '1519439344');
INSERT INTO `yii2_admin` VALUES ('5', 'test_admin', 'WEjgqej0F5wm2302g_8YBgWdspPNZaZQ', '$2y$13$ZgBVcI.l1LTMGjRlULoaiu7TrrGLKQpl0G4uH4Mal424PmBmAmxnu', 'test@qq.com', '2130706433', '1517996294', '2130706433', '1', '1517996226', '1517996294');

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
INSERT INTO `yii2_auth_assignment` VALUES ('editors', '4', '1517974399');
INSERT INTO `yii2_auth_assignment` VALUES ('editors', '5', '1517996235');

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
INSERT INTO `yii2_auth_item` VALUES ('admin/auth', '2', '', 'admin/auth', null, '1484734191', '1519375309');
INSERT INTO `yii2_auth_item` VALUES ('admin/create', '2', '', 'admin/create', null, '1484734191', '1519375308');
INSERT INTO `yii2_auth_item` VALUES ('admin/delete', '2', '', 'admin/delete', null, '1484734191', '1519375309');
INSERT INTO `yii2_auth_item` VALUES ('admin/index', '2', '', 'admin/index', null, '1484734191', '1519377059');
INSERT INTO `yii2_auth_item` VALUES ('admin/update', '2', '', 'admin/update', null, '1484734191', '1519375308');
INSERT INTO `yii2_auth_item` VALUES ('administors', '1', '授权所有权限', null, null, '1484712662', '1484712662');
INSERT INTO `yii2_auth_item` VALUES ('combo/index', '2', '', 'combo/index', null, '1517996186', '1519439326');
INSERT INTO `yii2_auth_item` VALUES ('combo/view', '2', '', 'combo/view', null, '1519378925', '1519439326');
INSERT INTO `yii2_auth_item` VALUES ('config/attachment', '2', '', 'config/attachment', null, '1484734191', '1519378537');
INSERT INTO `yii2_auth_item` VALUES ('config/basic', '2', '', 'config/basic', null, '1484734191', '1519378537');
INSERT INTO `yii2_auth_item` VALUES ('config/send-mail', '2', '', 'config/send-mail', null, '1484734191', '1519378537');
INSERT INTO `yii2_auth_item` VALUES ('database/export', '2', '', 'database/export', null, '1484734305', '1519375257');
INSERT INTO `yii2_auth_item` VALUES ('editors', '1', '网站编辑', null, null, '1484712712', '1484712712');
INSERT INTO `yii2_auth_item` VALUES ('excel/import', '2', '', 'excel/import', null, '1519436284', '1519439327');
INSERT INTO `yii2_auth_item` VALUES ('excel/index', '2', '', 'excel/index', null, '1519436031', '1519439327');
INSERT INTO `yii2_auth_item` VALUES ('index/frame', '2', '', 'index/frame', null, '1518057962', '1519439327');
INSERT INTO `yii2_auth_item` VALUES ('index/index', '2', '', 'index/index', null, '1484734191', '1519439327');
INSERT INTO `yii2_auth_item` VALUES ('menu/create', '2', '', 'menu/create', null, '1484734191', '1519378499');
INSERT INTO `yii2_auth_item` VALUES ('menu/delete', '2', '', 'menu/delete', null, '1484734191', '1519378499');
INSERT INTO `yii2_auth_item` VALUES ('menu/index', '2', '', 'menu/index', null, '1484734191', '1519378499');
INSERT INTO `yii2_auth_item` VALUES ('menu/update', '2', '', 'menu/update', null, '1484734191', '1519378499');
INSERT INTO `yii2_auth_item` VALUES ('order/create', '2', '', 'order/create', null, '1518074401', '1519439326');
INSERT INTO `yii2_auth_item` VALUES ('order/index', '2', '', 'order/index', null, '1517996186', '1519439326');
INSERT INTO `yii2_auth_item` VALUES ('order/view', '2', '', 'order/view', null, '1519377930', '1519439326');
INSERT INTO `yii2_auth_item` VALUES ('product/index', '2', '', 'product/index', null, '1517996186', '1519439326');
INSERT INTO `yii2_auth_item` VALUES ('product/view', '2', '', 'product/view', null, '1519378499', '1519439326');
INSERT INTO `yii2_auth_item` VALUES ('role/auth', '2', '', 'role/auth', null, '1484734191', '1519375309');
INSERT INTO `yii2_auth_item` VALUES ('role/create', '2', '', 'role/create', null, '1484734191', '1519377049');
INSERT INTO `yii2_auth_item` VALUES ('role/delete', '2', '', 'role/delete', null, '1484734191', '1519377049');
INSERT INTO `yii2_auth_item` VALUES ('role/export-setting', '2', '', 'role/export-setting', null, '1519438814', '1519438814');
INSERT INTO `yii2_auth_item` VALUES ('role/index', '2', '', 'role/index', null, '1484734191', '1519439325');
INSERT INTO `yii2_auth_item` VALUES ('role/update', '2', '', 'role/update', null, '1484734191', '1519375309');
INSERT INTO `yii2_auth_item` VALUES ('servicer/index', '2', '', 'servicer/index', null, '1517996187', '1519439327');
INSERT INTO `yii2_auth_item` VALUES ('transator/index', '2', '', 'transator/index', null, '1517996187', '1519439327');

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
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'combo/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'combo/view');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'config/attachment');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'config/basic');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'config/send-mail');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'database/export');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'excel/import');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'excel/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'index/frame');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'index/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'index/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'menu/create');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'menu/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'menu/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'menu/update');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'order/create');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'order/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'order/view');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'product/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'product/view');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/auth');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/create');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'role/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/update');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'servicer/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'transator/index');

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
INSERT INTO `yii2_auth_rule` VALUES ('', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:0:\"\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518057980;}', '1484734191', '1518057980');
INSERT INTO `yii2_auth_rule` VALUES ('admin/auth', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"admin/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519375309;}', '1484734191', '1519375309');
INSERT INTO `yii2_auth_rule` VALUES ('admin/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519375308;}', '1484734191', '1519375308');
INSERT INTO `yii2_auth_rule` VALUES ('admin/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519375309;}', '1484734191', '1519375309');
INSERT INTO `yii2_auth_rule` VALUES ('admin/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"admin/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519377059;}', '1484734191', '1519377059');
INSERT INTO `yii2_auth_rule` VALUES ('admin/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519375308;}', '1484734191', '1519375308');
INSERT INTO `yii2_auth_rule` VALUES ('combo/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"combo/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996186;s:9:\"updatedAt\";i:1519439326;}', '1517996186', '1519439326');
INSERT INTO `yii2_auth_rule` VALUES ('combo/view', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"combo/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519378925;s:9:\"updatedAt\";i:1519439326;}', '1519378925', '1519439326');
INSERT INTO `yii2_auth_rule` VALUES ('config/attachment', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:17:\"config/attachment\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519378537;}', '1484734191', '1519378537');
INSERT INTO `yii2_auth_rule` VALUES ('config/basic', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"config/basic\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519378537;}', '1484734191', '1519378537');
INSERT INTO `yii2_auth_rule` VALUES ('config/send-mail', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:16:\"config/send-mail\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519378537;}', '1484734191', '1519378537');
INSERT INTO `yii2_auth_rule` VALUES ('database/export', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"database/export\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734305;s:9:\"updatedAt\";i:1519375257;}', '1484734305', '1519375257');
INSERT INTO `yii2_auth_rule` VALUES ('excel/import', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"excel/import\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519436284;s:9:\"updatedAt\";i:1519439327;}', '1519436284', '1519439327');
INSERT INTO `yii2_auth_rule` VALUES ('excel/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"excel/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519436031;s:9:\"updatedAt\";i:1519439326;}', '1519436031', '1519439326');
INSERT INTO `yii2_auth_rule` VALUES ('index/frame', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"index/frame\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1518057962;s:9:\"updatedAt\";i:1519439327;}', '1518057962', '1519439327');
INSERT INTO `yii2_auth_rule` VALUES ('index/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"index/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519439327;}', '1484734191', '1519439327');
INSERT INTO `yii2_auth_rule` VALUES ('menu/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519378499;}', '1484734191', '1519378499');
INSERT INTO `yii2_auth_rule` VALUES ('menu/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519378499;}', '1484734191', '1519378499');
INSERT INTO `yii2_auth_rule` VALUES ('menu/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"menu/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519378499;}', '1484734191', '1519378499');
INSERT INTO `yii2_auth_rule` VALUES ('menu/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519378499;}', '1484734191', '1519378499');
INSERT INTO `yii2_auth_rule` VALUES ('order/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"order/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1518074401;s:9:\"updatedAt\";i:1519439326;}', '1518074401', '1519439326');
INSERT INTO `yii2_auth_rule` VALUES ('order/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"order/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996186;s:9:\"updatedAt\";i:1519439326;}', '1517996186', '1519439326');
INSERT INTO `yii2_auth_rule` VALUES ('order/view', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"order/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519377930;s:9:\"updatedAt\";i:1519439326;}', '1519377930', '1519439326');
INSERT INTO `yii2_auth_rule` VALUES ('product/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:13:\"product/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996186;s:9:\"updatedAt\";i:1519439326;}', '1517996186', '1519439326');
INSERT INTO `yii2_auth_rule` VALUES ('product/view', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"product/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519378499;s:9:\"updatedAt\";i:1519439326;}', '1519378499', '1519439326');
INSERT INTO `yii2_auth_rule` VALUES ('role/auth', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:9:\"role/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519375309;}', '1484734191', '1519375309');
INSERT INTO `yii2_auth_rule` VALUES ('role/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519377049;}', '1484734191', '1519377049');
INSERT INTO `yii2_auth_rule` VALUES ('role/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519377049;}', '1484734191', '1519377049');
INSERT INTO `yii2_auth_rule` VALUES ('role/export-setting', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:19:\"role/export-setting\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519438814;s:9:\"updatedAt\";i:1519438814;}', '1519438814', '1519438814');
INSERT INTO `yii2_auth_rule` VALUES ('role/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"role/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519439325;}', '1484734191', '1519439325');
INSERT INTO `yii2_auth_rule` VALUES ('role/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519375309;}', '1484734191', '1519375309');
INSERT INTO `yii2_auth_rule` VALUES ('servicer/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:14:\"servicer/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996187;s:9:\"updatedAt\";i:1519439327;}', '1517996187', '1519439327');
INSERT INTO `yii2_auth_rule` VALUES ('transator/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"transator/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996187;s:9:\"updatedAt\";i:1519439327;}', '1517996187', '1519439327');

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
  `combo_charge` float(5,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`combo_id`),
  KEY `ppid` (`product_id`) USING BTREE,
  CONSTRAINT `combo_product_id` FOREIGN KEY (`product_id`) REFERENCES `yii2_product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39404 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_combo
-- ----------------------------
INSERT INTO `yii2_combo` VALUES ('39342', '218/10天', '', '200.000', '1', '1', '1516961512', '1517627390', '1', '67639', '0.965');
INSERT INTO `yii2_combo` VALUES ('39343', '248/8天', '', '200.000', '1', '1', '1516961528', '1517627399', '1', '67639', '0.965');
INSERT INTO `yii2_combo` VALUES ('39344', '268/5天', '', '200.000', '1', '1', '1516961542', '1517627407', '1', '67639', '0.965');
INSERT INTO `yii2_combo` VALUES ('39345', '520/3天', '', '401.000', '2', '1', '1516961556', '1517627415', '1', '67639', '0.965');
INSERT INTO `yii2_combo` VALUES ('39346', '1200/1天', '', '950.000', '3', '1', '1516961580', '1517627424', '1', '67639', '0.965');
INSERT INTO `yii2_combo` VALUES ('39347', '248/8天', '', '200.000', '1', '2', '1516961603', '1517627432', '1', '67639', '1.000');
INSERT INTO `yii2_combo` VALUES ('39348', '260/5天', '', '200.000', '1', '2', '1516961618', '1517627436', '1', '67639', '1.000');
INSERT INTO `yii2_combo` VALUES ('39350', '510/3天', '', '401.000', '2', '2', '1516961679', '1517627442', '1', '67639', '1.000');
INSERT INTO `yii2_combo` VALUES ('39351', '1200/1天', '', '950.000', '3', '2', '1516961704', '1517627448', '1', '67639', '1.000');
INSERT INTO `yii2_combo` VALUES ('39352', '220/4-5工', '', '200.000', '1', '3', '1516961723', '1517627453', '1', '67639', '1.000');
INSERT INTO `yii2_combo` VALUES ('39353', '425/2-3工', '', '401.000', '2', '3', '1516961741', '1517627459', '1', '67639', '1.000');
INSERT INTO `yii2_combo` VALUES ('39354', '990/1天', '', '950.000', '3', '3', '1516961756', '1517627464', '1', '67639', '1.000');
INSERT INTO `yii2_combo` VALUES ('39355', '940/7天', '', '550.000', '1', '1', '1516961957', '1517456694', '1', '67640', '0.965');
INSERT INTO `yii2_combo` VALUES ('39356', '1240/5天', '', '550.000', '2', '1', '1516961988', '1517456698', '1', '67640', '0.965');
INSERT INTO `yii2_combo` VALUES ('39357', '920/7天', '', '550.000', '1', '2', '1516962154', '1517627482', '1', '67640', '1.000');
INSERT INTO `yii2_combo` VALUES ('39358', '1200/4天', '', '550.000', '2', '2', '1516962178', '1517627485', '1', '67640', '1.000');
INSERT INTO `yii2_combo` VALUES ('39359', '600/5-6工', '', '550.000', '1', '3', '1516962206', '1517627489', '1', '67640', '1.000');
INSERT INTO `yii2_combo` VALUES ('39360', '900/3-4工', '', '550.000', '2', '3', '1516962309', '1517627494', '1', '67640', '1.000');
INSERT INTO `yii2_combo` VALUES ('39361', '1440/7天', '', '1000.000', '1', '1', '1516962387', '1517462842', '1', '67641', '0.965');
INSERT INTO `yii2_combo` VALUES ('39362', '1550/5天', '', '1000.000', '2', '1', '1516962406', '1517462854', '1', '67641', '0.965');
INSERT INTO `yii2_combo` VALUES ('39363', '1400/7天', '', '1000.000', '1', '2', '1516962436', '1517627526', '1', '67641', '1.000');
INSERT INTO `yii2_combo` VALUES ('39364', '1500/5天', '', '1000.000', '2', '2', '1516962452', '1517627530', '1', '67641', '1.000');
INSERT INTO `yii2_combo` VALUES ('39365', '1100/5-6工', '', '1000.000', '1', '3', '1516962474', '1517627535', '1', '67641', '1.000');
INSERT INTO `yii2_combo` VALUES ('39366', '1200/3-4工', '', '1000.000', '2', '3', '1516962491', '1517627540', '1', '67641', '1.000');
INSERT INTO `yii2_combo` VALUES ('39367', '175/3天', '', '160.000', '1', '1', '1517626325', '1517626325', '1', '67642', '0.965');
INSERT INTO `yii2_combo` VALUES ('39368', '198/1天', '', '160.000', '2', '1', '1517626349', '1517626349', '1', '67642', '0.965');
INSERT INTO `yii2_combo` VALUES ('39369', '248/3小时', '', '160.000', '3', '1', '1517626681', '1517626681', '1', '67642', '0.965');
INSERT INTO `yii2_combo` VALUES ('39370', '175/3天', '', '160.000', '1', '2', '1517626705', '1517626739', '1', '67642', '1.000');
INSERT INTO `yii2_combo` VALUES ('39371', '190/1天', '', '160.000', '2', '2', '1517626760', '1517626760', '1', '67642', '1.000');
INSERT INTO `yii2_combo` VALUES ('39372', '240/3小时', '', '160.000', '3', '2', '1517626778', '1517626778', '1', '67642', '1.000');
INSERT INTO `yii2_combo` VALUES ('39373', '180/1天', '', '160.000', '1', '3', '1517626816', '1517626816', '1', '67642', '1.000');
INSERT INTO `yii2_combo` VALUES ('39374', '200/3小时', '', '160.000', '3', '3', '1517626844', '1517626844', '1', '67642', '1.000');
INSERT INTO `yii2_combo` VALUES ('39375', '320/4天', '', '280.000', '1', '1', '1517627078', '1517627078', '1', '67643', '0.965');
INSERT INTO `yii2_combo` VALUES ('39376', '343/2天', '', '280.000', '2', '1', '1517627192', '1517627192', '1', '67643', '0.965');
INSERT INTO `yii2_combo` VALUES ('39377', '395/1天', '', '280.000', '3', '1', '1517627213', '1517627213', '1', '67643', '1.000');
INSERT INTO `yii2_combo` VALUES ('39378', '310/4天', '', '280.000', '1', '2', '1517627237', '1517627237', '1', '67643', '1.000');
INSERT INTO `yii2_combo` VALUES ('39379', '343/1天', '', '280.000', '2', '2', '1517627260', '1517627260', '1', '67643', '1.000');
INSERT INTO `yii2_combo` VALUES ('39380', '395/1天', '', '280.000', '3', '2', '1517627280', '1517627280', '1', '67643', '1.000');
INSERT INTO `yii2_combo` VALUES ('39381', '300/2天', '', '280.000', '1', '3', '1517627308', '1517627308', '1', '67643', '1.000');
INSERT INTO `yii2_combo` VALUES ('39382', '320/1天', '', '280.000', '3', '3', '1517627331', '1517627331', '1', '67643', '1.000');
INSERT INTO `yii2_combo` VALUES ('39383', '320/6天', '', '290.000', '1', '1', '1517627767', '1517627767', '1', '67644', '0.965');
INSERT INTO `yii2_combo` VALUES ('39384', '390/4天', '', '290.000', '2', '1', '1517627787', '1517627787', '1', '67644', '0.965');
INSERT INTO `yii2_combo` VALUES ('39385', '310/6天', '', '290.000', '1', '2', '1517627804', '1517627804', '1', '67644', '1.000');
INSERT INTO `yii2_combo` VALUES ('39386', '380/4天', '', '290.000', '1', '2', '1517627818', '1517627818', '1', '67644', '1.000');
INSERT INTO `yii2_combo` VALUES ('39387', '300/4天', '', '290.000', '1', '3', '1517627855', '1517627855', '1', '67644', '1.000');
INSERT INTO `yii2_combo` VALUES ('39388', '268/4天', '', '242.000', '1', '1', '1517627930', '1517627930', '1', '67645', '0.965');
INSERT INTO `yii2_combo` VALUES ('39389', '299/1天', '', '242.000', '2', '1', '1517627946', '1517627946', '1', '67645', '0.965');
INSERT INTO `yii2_combo` VALUES ('39390', '358/3小时', '', '242.000', '3', '1', '1517627965', '1517627965', '1', '67645', '0.965');
INSERT INTO `yii2_combo` VALUES ('39391', '260/4天', '', '242.000', '1', '2', '1517628015', '1517628015', '1', '67645', '1.000');
INSERT INTO `yii2_combo` VALUES ('39392', '290/1天', '', '242.000', '2', '2', '1517628030', '1517628030', '1', '67645', '1.000');
INSERT INTO `yii2_combo` VALUES ('39393', '350/3小时', '', '242.000', '3', '2', '1517628044', '1517628044', '1', '67645', '1.000');
INSERT INTO `yii2_combo` VALUES ('39394', '270/3天', '', '242.000', '1', '3', '1517628114', '1517628114', '1', '67645', '1.000');
INSERT INTO `yii2_combo` VALUES ('39395', '290/3小时', '', '242.000', '2', '3', '1517628137', '1517628137', '1', '67645', '1.000');
INSERT INTO `yii2_combo` VALUES ('39396', '255/3天', '', '240.000', '1', '1', '1517628205', '1517628205', '1', '67646', '0.965');
INSERT INTO `yii2_combo` VALUES ('39397', '270/2天', '', '240.000', '2', '1', '1517628228', '1517628228', '1', '67646', '1.000');
INSERT INTO `yii2_combo` VALUES ('39398', '298/1天', '', '260.000', '3', '1', '1517628353', '1517628353', '1', '67646', '0.965');
INSERT INTO `yii2_combo` VALUES ('39399', '250/3天', '', '240.000', '1', '2', '1517628379', '1517628379', '1', '67646', '1.000');
INSERT INTO `yii2_combo` VALUES ('39400', '260/2天', '', '240.000', '2', '2', '1517628396', '1517628396', '1', '67646', '1.000');
INSERT INTO `yii2_combo` VALUES ('39401', '288/1天', '', '260.000', '3', '2', '1517628413', '1517628413', '1', '67646', '1.000');
INSERT INTO `yii2_combo` VALUES ('39402', '250/2天', '', '240.000', '1', '3', '1517628430', '1517628430', '1', '67646', '1.000');
INSERT INTO `yii2_combo` VALUES ('39403', '280/1天', '', '260.000', '2', '3', '1517628446', '1517628446', '1', '67646', '1.000');

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
-- Table structure for yii2_export_setting
-- ----------------------------
DROP TABLE IF EXISTS `yii2_export_setting`;
CREATE TABLE `yii2_export_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` char(30) NOT NULL COMMENT '角色id',
  `showfinance` char(1) NOT NULL DEFAULT '0' COMMENT '是否展示财务信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_export_setting
-- ----------------------------
INSERT INTO `yii2_export_setting` VALUES ('1', 'editors', '0');
INSERT INTO `yii2_export_setting` VALUES ('2', 'administors', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_menu
-- ----------------------------
INSERT INTO `yii2_menu` VALUES ('1', '0', '我的面板', 'index/index', 'fa-home', '0', '0');
INSERT INTO `yii2_menu` VALUES ('2', '0', '系统设置', 'config/basic', 'fa-cogs', '1', '99');
INSERT INTO `yii2_menu` VALUES ('3', '0', '管理员设置', 'admin/index', 'fa-user', '1', '98');
INSERT INTO `yii2_menu` VALUES ('6', '0', '数据库设置', 'database/export', 'fa-hdd-o', '0', '0');
INSERT INTO `yii2_menu` VALUES ('8', '1', '系统信息', 'index/index', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('9', '2', '站点配置', 'config/basic', '', '0', '0');
INSERT INTO `yii2_menu` VALUES ('10', '2', '后台菜单管理', 'menu/index', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('11', '3', '管理员管理', 'admin/index', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('12', '3', '角色管理', 'role/index', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('16', '5', '用户管理', '', '', '0', '0');
INSERT INTO `yii2_menu` VALUES ('17', '6', '数据库管理', 'backup/default/index', '', '1', '0');
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
INSERT INTO `yii2_menu` VALUES ('35', '34', '产品列表', 'product/index', 'fa-coffee', '1', '0');
INSERT INTO `yii2_menu` VALUES ('36', '0', '套餐管理', 'combo/index', 'fa-coffee', '0', '0');
INSERT INTO `yii2_menu` VALUES ('37', '36', '套餐列表', 'combo/index', 'fa-coffee', '1', '0');
INSERT INTO `yii2_menu` VALUES ('38', '0', '订单管理', 'order/index', 'fa-dollar', '1', '2');
INSERT INTO `yii2_menu` VALUES ('39', '38', '订单列表', 'order/index', 'fa-dollar', '1', '0');
INSERT INTO `yii2_menu` VALUES ('41', '40', '国家列表', 'country/index', 'fa-flag', '1', '1');
INSERT INTO `yii2_menu` VALUES ('45', '46', '客服列表', 'servicer/index', 'fa-users', '1', '1');
INSERT INTO `yii2_menu` VALUES ('46', '0', '人员管理', 'transator/index', 'fa-user', '1', '13');
INSERT INTO `yii2_menu` VALUES ('47', '46', '办理人列表', 'transator/index', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('48', '0', '系统信息', 'index/index', 'fa-home', '1', '0');
INSERT INTO `yii2_menu` VALUES ('49', '48', '系统信息', 'index/index', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('50', '38', '订单添加', 'order/create', '', '1', '1');
INSERT INTO `yii2_menu` VALUES ('51', '48', '左侧菜单', 'index/frame', '', '0', '0');
INSERT INTO `yii2_menu` VALUES ('52', '38', '订单删除', 'order/delete', '', '0', '2');
INSERT INTO `yii2_menu` VALUES ('53', '38', '订单更新', 'order/update', '', '0', '3');
INSERT INTO `yii2_menu` VALUES ('54', '38', '订单查看', 'order/view', '', '0', '4');
INSERT INTO `yii2_menu` VALUES ('55', '34', '产品删除', 'product/delete', '', '0', '1');
INSERT INTO `yii2_menu` VALUES ('56', '34', '产品更新', 'product/update', '', '0', '2');
INSERT INTO `yii2_menu` VALUES ('57', '34', '产品查看', 'product/view', '', '0', '4');
INSERT INTO `yii2_menu` VALUES ('58', '47', '删除', 'transator/delete', '', '0', '25');
INSERT INTO `yii2_menu` VALUES ('59', '47', '更新', 'transator/update', '', '0', '0');
INSERT INTO `yii2_menu` VALUES ('60', '45', '新增', 'servicer/create', '', '0', '1');
INSERT INTO `yii2_menu` VALUES ('61', '45', '删除', 'transator/delete', '', '0', '25');
INSERT INTO `yii2_menu` VALUES ('62', '36', '套餐添加', 'combo/create', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('63', '36', '套餐删除', 'combo/delete', '', '0', '2');
INSERT INTO `yii2_menu` VALUES ('64', '36', '套餐更新', 'order/update', '', '0', '3');
INSERT INTO `yii2_menu` VALUES ('65', '36', '套餐查看', 'combo/view', '', '0', '0');
INSERT INTO `yii2_menu` VALUES ('66', '38', '订单导出', 'excel/index', '', '0', '5');
INSERT INTO `yii2_menu` VALUES ('67', '38', '订单导入', 'excel/import', '', '0', '6');
INSERT INTO `yii2_menu` VALUES ('68', '0', 'excel设置', 'role/export-setting', '', '0', '40');
INSERT INTO `yii2_menu` VALUES ('69', '68', '敏感字段显示设置', 'excel-setting/update', '', '0', '0');

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
  `order_date` char(10) NOT NULL COMMENT '订单日期',
  `customer_id` varchar(100) NOT NULL COMMENT '客户id',
  `combo_id` int(11) NOT NULL COMMENT '套餐id',
  `custom_servicer_id` smallint(6) NOT NULL COMMENT '客服id',
  `transactor_name` varchar(50) NOT NULL COMMENT '办理人名称',
  `single_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单项实收金额',
  `total_person` smallint(5) NOT NULL DEFAULT '0' COMMENT '人数',
  `output_total_person` smallint(5) NOT NULL DEFAULT '0' COMMENT '支出总人数',
  `balance_order` varchar(64) NOT NULL DEFAULT '' COMMENT '补差订单号',
  `balance_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '收入补差订单金额',
  `output_balance_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支出补差订单金额',
  `flushphoto_order` varchar(64) NOT NULL COMMENT '代冲洗照片订单号',
  `flushphoto_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '代冲洗照片订单金额',
  `output_flushphoto_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支出代冲洗照片订单金额',
  `carrier_order` varchar(64) NOT NULL COMMENT '快递费补差订单号',
  `carrier_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '快递费补差订单金额',
  `output_carrier_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '支出快递费补差订单金额',
  `collect_date` char(10) NOT NULL COMMENT '收资料日',
  `deliver_date` char(10) NOT NULL COMMENT '送证日',
  `entry_date` char(10) NOT NULL COMMENT '入馆日',
  `putsign_date` char(10) NOT NULL COMMENT '出签日',
  `operator_id` smallint(6) NOT NULL COMMENT '操作员',
  `back_address` tinytext NOT NULL COMMENT '回寄地址',
  `back_addressee` varchar(50) NOT NULL COMMENT '收件人',
  `back_telphone` varchar(36) NOT NULL COMMENT '收件人电话',
  `delivergood_date` char(10) NOT NULL COMMENT '发货日期',
  `deliver_order` varchar(64) NOT NULL COMMENT '快递单号',
  `delivercompany` varchar(50) DEFAULT NULL COMMENT '快递公司ID',
  `remark` tinytext NOT NULL COMMENT '备注',
  `receipt_date` char(10) NOT NULL COMMENT '店铺收款日期',
  `company_receipt_date` char(10) NOT NULL,
  `pay_account` varchar(100) NOT NULL DEFAULT '' COMMENT '支付帐号',
  `pay_date` char(10) NOT NULL COMMENT '支付日期',
  `audit_status` char(1) NOT NULL DEFAULT '1' COMMENT '1审核中2审核未通过3审核通过',
  `cid` smallint(4) NOT NULL COMMENT '国家id',
  `created_at` int(10) NOT NULL COMMENT '创建时间',
  `updated_at` int(10) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `order_deliverycompany_id` (`delivercompany`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2157 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_order
-- ----------------------------
INSERT INTO `yii2_order` VALUES ('2001', '0', '121502847275586872', '1', '1', '2018-01-31', '多边贸易部', '3307', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '浙江省  嘉兴市  桐乡市  高桥镇悦容路288号9栋201单元  314500  \n', '胡奇峰  ', '13372541690', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374308', '1519374308');
INSERT INTO `yii2_order` VALUES ('2002', '0', '114981751275756550', '1', '1', '2018-02-01', 'zzxsherry4869', '3308', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '湖北省  武汉市  汉阳区  江汉二桥街道知音西村74号  430050  ', ' 张爱芳', '15871798508', '', '', null, '', '', '', '', '', '4', '0', '1519374308', '1519374308');
INSERT INTO `yii2_order` VALUES ('2003', '0', '126836412468982711', '1', '2', '2018-02-01', '兔兔小店铺01', '3309', '1', '', '390.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-02', '', '2018-02-05', '', '1', '云南省  昆明市  呈贡区  锦绣园 5组团 18栋  650500    ', '汤师  ', '13987447771', '', '', null, '', '', '', '', '', '4', '0', '1519374308', '1519374308');
INSERT INTO `yii2_order` VALUES ('2004', '0', '121707330254375660', '1', '1', '2018-02-01', 'pfy965790118 ', '3310', '1', '', '268.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-08', '1', '福建省  泉州市  永春县  桃城镇桃东路121号  236200', '  潘凤英 ', '15294509848', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2005', '0', '121675436556258886', '1', '1', '2018-02-01', '艺术人生artlife', '3311', '1', '', '175.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2006', '0', '114964446998855258', '1', '2', '2018-02-01', '可爱惬意 ', '3312', '1', '', '520.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-02', '2018-02-04', '2018-02-05', '2018-02-06', '1', '浙江省  金华市  东阳市  江北街道甘溪西街5号  322100 ', ' 蒋惬惬 ', '13967434574', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2007', '0', '126915988825585506', '1', '1', '2018-02-01', '毛毛247537337 ', '3313', '1', '', '268.00', '7', '7', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-08', '1', '河南省  南阳市  卧龙区  卧龙岗街道汉江路和车站路交叉口  473003 ', ' 小鑫 ', '18567265090', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2008', '0', '121640719701240698', '1', '2', '2018-02-01', 'beebeefeng89 ', '3314', '1', '', '198.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 370898652@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2009', '0', '121715560805623378 122134331166623378 ', '1', '2', '2018-02-01', '健黑黑的李白白', '3315', '1', '', '520.00', '2', '2', '', '0.00', '0.00', '', '10.00', '0.00', '', '36.00', '0.00', '2018-02-02', '2018-02-02', '2018-02-04', '2018-02-05', '1', '贵州省  贵阳市  观山湖区  林城西路通源沃尔沃4s店  550000   ', '孙永健', '15761609087', '2018-02-08', '', null, '出生日期有误 寄回领馆修改', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2010', '0', '121718836910089875', '1', '1', '2018-02-01', '07八佰拜 ', '3316', '1', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '黑龙江省  哈尔滨市  南岗区  先锋路街道先锋路591号中发郦苑小区、1栋6单元501室  150000  ', ' 张晨蕾', '13796655657', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2011', '0', '121790602531657884', '1', '2', '2018-02-01', 'caboo6 ', '3317', '1', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-06', '1', '湖南省  株洲市  天元区  泰山路街道滨江南路88号蓝盾景园2期21栋2604室  412000  ', '帅莎  ', '13601869229', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2012', '0', '121795726777370771', '1', '1', '2018-02-01', '我是购物狂85', '3318', '1', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-02', '2018-02-04', '2018-02-05', '2018-02-08', '1', '四川省  泸州市  合江县  合江镇人和巷荔香苑格力空调  646200 ', ' 文海鹰 ', '13158602100', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2013', '0', '127030816136083825', '1', '1', '2018-02-01', '日光倾城_00', '3319', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-02', '2018-02-02', '2018-02-04', '2018-02-07', '1', '广东省  清远市  英德市  英城街道和平广场保安室  513000  ', '苏嘉莉  ', '13431990777', '2018-02-08', '', null, '', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2014', '0', '121883982532512999', '1', '1', '2018-02-01', '你的路鸟', '3320', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-02', '2018-02-04', '2018-02-05', '2018-02-08', '1', '广东省  汕头市  潮阳区  谷饶镇大坑村大亨桥旁（弘雅新楼内）晨星针织厂的对面厂楼  515100  ', '张琳 ', '13288007874', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2015', '0', '115030720877321838', '1', '2', '2018-02-01', '过站不停a ', '3321', '1', '', '198.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 1224643589@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2016', '0', '127196578597994222', '1', '1', '2018-02-01', '不该选择沦落 ', '3322', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省  汕头市  潮阳区  谷饶镇华光小学南侧雄盛针织厂  515100', '  张雪霞  ', '13417039753', '', '', null, '', '', '', '', '', '4', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2017', '0', '115045672603943257', '1', '1', '2018-02-01', 'tb2887427_2011 ', '3323', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-02', '2018-02-04', '2018-02-05', '2018-02-08', '1', '广东省 汕头市 潮阳区 贵屿镇南阳西美心之韵隔壁', '依婷', '13592887427', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2018', '0', '127101964221794729', '1', '1', '2018-02-01', '懒猫l2008', '3324', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-08', '1', '重庆  重庆市  江北区  华新街街道金源路55号  400021 ', '刘阳婕', '15683875702', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2019', '0', '127128480199337929', '1', '2', '2018-02-01', 'terminator93 ', '3325', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '2018-02-08', '1', '四川省  成都市  金牛区  金牛区花牌坊街筒车巷29号2栋3单元13号  610000', '华梦', '15281052442', '', '', null, '同黄凌翔 华梦一起寄回', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2020', '0', '127297070913165512 127153232945165512', '1', '2', '2018-02-01', 'maskjane', '3326', '2', '', '175.00', '1', '1', '', '23.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '1351067868@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2021', '0', '127191900831895018', '1', '1', '2018-02-01', 'chjp2046', '3327', '2', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '广东省  深圳市  南山区  南山街道登良路65号荔雅居A4 3D  518052', '陈杰平', '13760456157', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2022', '0', '127447655647406113', '1', '1', '2018-02-01', '球球小妞', '3328', '2', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '江苏省,无锡市,新区,花样年花郡（春阳路与太湖大道交汇处）53幢401室  214000', '邱园园', '15190217852', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2023', '0', '127258541025511615', '1', '2', '2018-02-02', 'hyhls91', '3329', '2', '', '358.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '151479698@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2024', '0', '127275172627178416', '1', '2', '2018-02-02', 'gotodoit', '3330', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-02', '2018-02-02', '2018-02-04', '2018-02-05', '1', '自取', '-', '', '', '', null, '自取', '', '', '', '', '5', '0', '1519374309', '1519374309');
INSERT INTO `yii2_order` VALUES ('2025', '0', '115283141881811342', '1', '2', '2018-02-02', '李杰骏', '3331', '2', '', '198.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：maxlijiejun1990@163.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2026', '0', '127276013085265427', '1', '1', '2018-02-02', 'yoyottkl ', '3332', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-08', '1', '河北省  保定市  徐水区  安肃镇迁民庄  072550 ', '李秀丽  ', '13590259636', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2027', '0', '115284820206059437', '1', '1', '2018-02-02', 'tb9609969', '3333', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '海南省,海口市,美兰区,海甸街道海甸岛胜景西路3号花语庭苑A6-108', '陈成', '0898-66259555 18789609969', '2018-02-09', '', null, '与陈成 吴忠军 ', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2028', '0', '122130859861055399', '1', '1', '2018-02-02', 'jmyjn2011', '3334', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-08', '1', '四川省  成都市  邛崃市  四川省成都邛崃市夹关镇大桥街37号  611541 ', '王晓蕾', '13980548102', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2029', '0', '115303973069578843', '1', '1', '2018-02-02', '1panxiaoli', '3335', '2', '', '268.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '1970-01-01', '1', '福建省  福州市  仓山区  城门镇潘墩路105号盛景黄山2#206  350019 ', '潘小丽', '13615040907', '2018-02-12', '', null, '照片不合格，延迟出签', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2030', '0', '127451882569868506  127306000155868506', '1', '1', '2018-02-02', 'sylviawang019', '3336', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '出签后确认地址', '-', '', '', '', null, '其他资料在聊天记录', '', '', '', '', '4', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2031', '0', '127300149742674624', '1', '2', '2018-02-02', '周子现', '3337', '2', '', '198.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '429272655@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2032', '0', '122248738529220881', '1', '1', '2018-02-02', 'cm19860207 ', '3338', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '湖南省  常德市  澧县  大堰垱镇大堰当中学  415500 ', '周亚军', '18216167152', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2033', '0', '115322900643405159', '1', '2', '2018-02-02', 'huling213420', '3339', '2', '', '198.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：624534875@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2034', '0', '127608179630337120', '1', '2', '2018-02-02', 'liming19850105 ', '3340', '2', '', '520.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-06', '1', '辽宁省  辽阳市  宏伟区  丰德园 2号楼 1组7号  111003 ', '李明', '18698270911  0419-5308288', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2035', '0', '122275700250197269 122217687700197269', '1', '1', '2018-02-02', 'nan1307 ', '3341', '2', '', '218.00', '2', '2', '', '100.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '四川省  遂宁市  船山区  慈音街道德水中路奥城花园4栋1203  629000 ', '杨楠 ', '15683759917', '', '', null, '', '', '', '', '', '4', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2036', '0', '127364213705366104', '1', '1', '2018-02-02', '诸葛0007', '3342', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '浙江省  衢州市  龙游县  詹家镇龙游占家镇新安村95号  324400', ' 诸葛婷', '13456625505', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2037', '0', '122228999046481365', '1', '1', '2018-02-02', '2wwwee', '3343', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '广东省东莞市长安镇锦江花园丽景庭4F 0402 ', '薛志敏', '13533096962', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2038', '0', '115362856021057059 116867044374057059', '1', '2', '2018-02-02', '玲玲7m ', '3344', '2', '', '268.00', '1', '1', '', '252.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-09', '2018-02-11', '', '1', '重庆市南岸区弹子石国际社区 观园一期 3-7-1', '张晓玲 ', '18602376285', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2039', '0', '127373985972811804 127729391748811804', '1', '2', '2018-02-02', 'qst9989', '3345', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-06', '1', '福建省南安市金淘镇海伦箱包厂', '谢瑶地', '13590121799', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2040', '0', '127389104137588619', '1', '1', '2018-02-02', 'june891207 ', '3346', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '湖南省  长沙市  雨花区  雨花亭街道树木岭路兴旺双铁城1栋觅途酒店一楼一页咖啡  410007', '李军', '18674851207', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2041', '0', '122310532676607069', '1', '2', '2018-02-02', '梁晔舒 ', '3347', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-06', '1', '四川省  乐山市  市中区  通江街道市中区龙游路242号1栋1单元7楼2号  614000', '史清  ', '18683315544', '2018-02-07', '', null, '与高山', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2042', '0', '115390016578512740', '1', '2', '2018-02-02', '水下期', '3348', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-06', '1', '广东省阳江市阳西县御景湾翠湖峰二街二号之二', '庞基健', '18316154631', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2043', '0', '127418281202700519', '1', '1', '2018-02-02', '英子407', '3349', '1', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-04', '2018-02-06', '2018-02-07', '', '1', '广东省  深圳市  宝安区  大浪街道宝安龙华大浪华昌北路春兴工业园3楼  518000  ', '刘敏 ', '13410123030', '', '', null, '', '', '', '', '', '4', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2044', '0', '127628198432700519', '1', '1', '2018-02-02', '英子407', '3350', '1', '', '268.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '四川省自贡市荣县星河湾18-1-4', '银波 ', '18123099966', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374310', '1519374310');
INSERT INTO `yii2_order` VALUES ('2045', '0', '122375828226263782', '1', '1', '2018-02-02', 'ocean8266 ', '3351', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '江苏省  南京市  秦淮区  瑞金路街道瑞金路6-1号学府瑞苑1-210  000000 ', '唐乃武', '13951811316', '2018-02-09', '', null, '照', '', '', '', '', '5', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2046', '0', '128006563591811804', '1', '1', '2018-02-03', 'qst9989 ', '3352', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-08', '1', '福建省南安市金淘镇海伦箱包厂   ', '谢龙江 ', '13590121799', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2047', '0', '122582666271108881  122596020586108881   122771723667108881', '1', '1', '2018-02-03', '为啥东东5', '3353', '2', '', '248.00', '4', '4', '', '80.00', '0.00', '', '40.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '广东省珠海市斗门区井岸镇里维埃拉4区52栋602\n', ' 张浩森  ', '13203861555', '2018-02-09', '', null, '资料和照', '', '', '', '', '5', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2048', '0', '115605169606934944', '1', '1', '2018-02-03', '陈冲199686', '3354', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '湖北省洪湖市黄家口 自取', '陈冲', '17720363872 \n18235435240 ', '', '', null, '', '', '', '', '', '4', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2049', '0', '122628475037284195', '1', '2', '2018-02-03', '软件工程师 ', '3355', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-06', '1', '湖南省  常德市  桃源县  漳江镇伯赞路御景园15栋  000000', '朱文娟', '18507366665', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2050', '0', '115736685069705432', '1', '1', '2018-02-03', '中华群英会菲律宾分会', '3356', '2', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2051', '0', '122838951460309685', '1', '2', '2018-02-03', '胡芳芳1234567', '3357', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '2018-02-08', '1', '江西省,萍乡市,安源区,金三角博昌家具城对面利得楼小区,,337000', '胡寒芳', '15079952096', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2052', '0', '127997042297868506   127837777147868506', '1', '1', '2018-02-03', 'sylviawang019', '3358', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-05', '2018-02-07', '', '1', '出签确认和王婧骅 一起 出签后确认地址', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2053', '0', '122840853360396791', '1', '1', '2018-02-03', '刘依洋1', '3359', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '地址没确认', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2054', '0', '122776343217660697', '1', '2', '2018-02-03', '很普通的买家', '3360', '2', '', '198.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：258013531@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2055', '0', '115756032748004634', '1', '1', '2018-02-03', 'vv_v2', '3361', '2', '', '268.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省  潮州市  湘桥区  凤新街道粤潮新园18栋2梯  521000   \n', '小v ', '13433758211', '', '', null, 'heng', '', '', '', '', '4', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2056', '0', '122798012467800973', '1', '2', '2018-02-03', '吉小希', '3362', '2', '', '198.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：329292309@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2057', '0', '122729331355827278', '1', '1', '2018-02-03', 'wsq515', '3363', '2', '', '175.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2058', '0', '127889186783832725', '1', '1', '2018-02-03', 'ar_迪77777', '3364', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '广东省  深圳市  宝安区  西乡街道西乡安居家园2栋D单元901  518101  ', '康美迪  ', '15622876956', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2059', '0', '122947617962252376  124200700435252376', '1', '2', '2018-02-04', '我是李富生 ', '3365', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-09', '2018-02-11', '', '1', '河南省,商丘市,睢县,后台乡李庄村73号,476900', '李富生', '18551509972', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2060', '0', '115882032094187147', '1', '1', '2018-02-04', '寒冰神射手23', '3366', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '', '1', '福建省,三明市,沙县,高桥镇安田村33号,365500', '余顺平', '18650977358', '', '', null, '旧签', '', '', '', '', '4', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2061', '0', '128181115323651011', '1', '2', '2018-02-04', 'tg88798879 ', '3367', '1', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2062', '0', '128073146799456127', '1', '2', '2018-02-04', '踏途人生', '3368', '1', '', '520.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '2018-02-08', '1', '广东省  深圳市  南山区  南山区登良路汉京国际13A  518000  ', '王公翠  ', '13480672880', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2063', '0', '122992277888665994', '1', '1', '2018-02-04', '顾红卫3476 ', '3369', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '', '1', '上海市奉贤区奉浦工业园区环城北路1299号            马勒发动机工装设备有限公司,,201400', '王燕庭', '15216779186', '', '', null, '缺照片', '', '', '', '', '4', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2064', '0', '122943783874481365', '1', '1', '2018-02-04', '2wwwee', '3370', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省  佛山市  顺德区  龙江镇南坑村河柏街德门巷11号  528300 ', ' 谭先森 ', '15920702554', '', '', null, '', '', '', '', '', '4', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2065', '0', '122970915665077287', '1', '1', '2018-02-04', 'tb90345608', '3371', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '', '1', ' ', '郑美远  ', '18065011860', '', '', null, '出签后再确认地址', '', '', '', '', '4', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2066', '0', '122992419132432070', '1', '2', '2018-02-04', '飞扬充值服务', '3372', '1', '', '198.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 499083401@qq.com ', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2067', '0', '128269931414493524', '1', '1', '2018-02-04', 'loolivez', '3373', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省,广州市,天河区,车陂街道天河广场天德阁1902,,510510', '周琛', '18681446618', '', '', null, '', '', '', '', '', '4', '0', '1519374311', '1519374311');
INSERT INTO `yii2_order` VALUES ('2068', '0', '115991512599564047', '1', '1', '2018-02-04', '一一无忧', '3374', '1', '', '268.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省  深圳市  南山区  南山街道桂湾三路龙海家园11栋A1915  518000  ', '刘祎', '15914004235', '', '', null, '', '', '', '', '', '4', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2069', '0', '116000500138527957', '1', '1', '2018-02-04', '或事事通通不过一场梦 ', '3375', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省  茂名市  电白县  水东镇人民路193号盐业公司A栋801房  525000  ', '袁伟辉  ', '15119688730', '', '', null, '', '', '', '', '', '4', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2070', '0', '116092454711704649', '1', '2', '2018-02-04', 'fayesmiling', '3376', '1', '', '198.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '3个人', '', '', '', '', '1', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2071', '0', '116096038090601139  116624343935601139', '1', '2', '2018-02-04', '我的东西到了2000', '3377', '1', '', '268.00', '1', '1', '', '252.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-06', '2018-02-07', '2018-02-11', '', '1', '河南省,信阳市,淮滨县,顺河街道城关镇南大街143-81,,464400', '陈升栋', '13382158803', '', '', null, '', '', '', '', '', '4', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2072', '0', '116105250357352657', '1', '2', '2018-02-04', 'zhuzhexuan920', '3378', '1', '', '198.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2073', '0', '128086500358893622', '1', '1', '2018-02-04', '傻乐高', '3379', '1', '', '268.00', '5', '5', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省,深圳市,宝安区,新安街道创业二路与公园路交叉口勤诚达和园4B栋301,518101', '高峰', '18576428377', '', '', null, '', '', '', '', '', '4', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2074', '0', '123231200299087292', '1', '2', '2018-02-04', 'annebestfriend', '3380', '1', '', '198.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2075', '0', '128397387308758820', '1', '2', '2018-02-04', 'holilly', '3381', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', ',安徽省,合肥市,庐阳区,阿奎利亚城果89栋1401室,230001', '赵云', '17730040982', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2076', '0', '123367393090879567', '1', '1', '2018-02-05', '2252131747哦', '3382', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2077', '0', '127342372766337929', '1', '2', '2018-02-05', 'terminator93 ', '3383', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '2018-02-08', '1', '四川省  成都市  金牛区  金牛区花牌坊街筒车巷29号2栋3单元13号  610000  ', '华梦 ', '15281052442', '', '', null, '同胡尧 华梦一起寄回', '', '', '', '', '5', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2078', '0', '123314780481667166', '1', '1', '2018-02-05', '孔林天', '3384', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '', '1', '江苏省  南京市  高淳区  淳溪镇北漪园9栋3单元104室  211300    ', '孔先生', '13776532162', '', '', null, '', '', '', '', '', '4', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2079', '0', '116161249991209142', '1', '2', '2018-02-05', 'xiecanjian1 ', '3385', '1', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '2018-02-08', '1', '福建省  泉州市  德化县  浔中镇环城东路百德畔山1号 百德畔山1号1栋  000000 ', ' 郑美桂 ', '15159571510', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2080', '0', '116251942737188657', '1', '2', '2018-02-05', 'venusyjw', '3386', '1', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '2018-02-08', '1', '广东省  佛山市  顺德区  乐从镇乐从居委会兴乐路A31号喜联大厦A座伊丽莎白  528300   ', '杨小姐 ', '18823105866', '2018-02-11', '', null, ' 同何就妹一起', '', '', '', '', '5', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2081', '0', '123389764890004987', '1', '2', '2018-02-05', 'wusammi8200 ', '3387', '1', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 184124338@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2082', '0', '123426418212004987', '1', '2', '2018-02-05', 'wusammi8200 ', '3388', '1', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 184124338@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2083', '0', '123448704661956788  123690738946956788', '1', '2', '2018-02-05', 'jms37zdy ', '3389', '1', '', '520.00', '2', '2', '', '0.00', '0.00', '', '20.00', '0.00', '', '0.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '2018-02-08', '1', '福建省  厦门市  思明区  筼筜街道湖滨北路101号商业银行大厦  361001    ', '张丹阳', '15105977747', '2018-02-09', '', null, '照', '', '', '', '', '5', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2084', '0', '116311162518207857', '1', '2', '2018-02-05', 'qiyi123ly ', '3390', '1', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '陕西省  宝鸡市  渭滨区  高新10路宝钛家园小区  721000  ', '刘洋', '15279982012', '', '', null, '年初三出行，珠海代寄', '', '', '', '', '4', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2085', '0', '116329194401785640', '1', '1', '2018-02-05', 'mubenwei', '3391', '1', '', '268.00', '20', '20', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '福建省  厦门市  思明区  云顶中路515号C4-02  361000  ', '颜晓玲  ', '13301272872', '', '', null, '', '', '', '', '', '1', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2086', '0', '123417963163899467', '1', '2', '2018-02-05', 'nbzjlyj', '3392', '2', '', '198.00', '7', '7', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2087', '0', '123521952802812690', '1', '2', '2018-02-05', 'cookleliu', '3393', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '2018-02-08', '1', '广东省  深圳市  宝安区  南航明珠花园2栋2单元14B  518100 ', '刘东海', '13960421999', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374312', '1519374312');
INSERT INTO `yii2_order` VALUES ('2088', '0', '123545782301719260 ', '1', '2', '2018-02-05', 'michelleou2', '3394', '2', '', '520.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '2018-02-08', '1', '广东省  中山市  板芙镇白溪幼儿园  528459 ', '吴钦兰', '13528298535', '', '', null, '同张厚磊一起寄回', '', '', '', '', '5', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2089', '0', '116313177459125756', '1', '2', '2018-02-05', 'wobenjiarend ', '3395', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '北京  北京市  东城区  安定门街道安定门外大街上龙西里42号楼3单元1001  100011', ' 丁家红', '13681513810', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2090', '0', '123642971738055677  123734474977055677', '1', '2', '2018-02-06', 'lyz830520', '3396', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '2018-02-08', '1', '贵州省  贵阳市  南明区  宝山南路179号幸福家园B栋二单元  550002 ', ' 刘洋溱 ', '18575619797', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2091', '0', '123618779958384767', '1', '2', '2018-02-06', 'mayluo225', '3397', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '广州市番禺区石碁镇石碁村昌平大街63号', '梁立成', '18028808084', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2092', '0', '128763347624466507  128645942468466507', '1', '2', '2018-02-06', 'majiacai', '3398', '2', '', '248.00', '1', '1', '', '52.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2093', '0', '116446568050013131', '1', '2', '2018-02-06', 'zhangjing582088', '3399', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-08', '2018-02-11', '1', '广东省  深圳市  福田区  福中三路民生金融大厦19楼  518031', '张晶', '15989340303', '2018-02-11', '', null, '14号飞', '', '', '', '', '5', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2094', '0', '128509132806337929', '1', '2', '2018-02-06', 'terminator93 ', '3400', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-08', '2018-02-09', '2018-02-11', '', '1', '', '-', '', '', '', null, '与黄凌翔.胡尧', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2095', '0', '123705857017719260  123703477692719260', '1', '2', '2018-02-06', 'michelleou2', '3401', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '20.00', '0.00', '', '0.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '', '-', '', '', '', null, '与', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2096', '0', '128691610834555428', '1', '1', '2018-02-06', 'ruochen521521', '3402', '2', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-11', '2018-02-12', '', '1', '云南省  昆明市  五华区  五华区龙泉路沙坝营火电公司38-1-602  650032', '唐宾檐', '15111081679', '', '', null, '', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2097', '0', '116485824647512731', '1', '1', '2018-02-06', 'joko1981', '3403', '2', '', '268.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-11', '2018-02-12', '', '1', '辽宁省  大连市  沙河口区  黑石礁街道软件园数码路1号 8号楼  116021', '王夏利', '18641194925', '', '', null, '', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2098', '0', '123707315931193366 123781512028193366 ', '1', '1', '2018-02-06', 'jason081111 ', '3404', '2', '', '268.00', '2', '2', '', '0.00', '0.00', '', '20.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '重庆  重庆市  江北区  观音桥街道同创国际9栋12楼  400021', '张东旭 ', '13772158580', '', '', null, '资料信息在聊天记录', '', '', '', '', '1', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2099', '0', '116511556678188657', '1', '2', '2018-02-06', 'venusyjw ', '3405', '1', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-08', '2018-02-11', '1', '广东省  佛山市  顺德区  乐从镇乐从居委会兴乐路A31号喜联大厦A座伊丽莎白  528300   ', '杨小姐 ', '18823105866', '2018-02-11', '', null, '7日上午已先寄珠海', '', '', '', '', '5', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2100', '0', '116581194963753537', '1', '1', '2018-02-06', '抗氧化苹果', '3406', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-10', '2018-02-11', '2018-02-12', '', '1', '辽宁省  抚顺市  顺城区  将军堡街道辉南路3-2号楼4单元501  113006', '  石秋华  ', '13504233052', '', '', null, '', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2101', '0', '128863615556597923 128718993957597923', '1', '2', '2018-02-06', '羊鱼鹿小呆', '3407', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '湖南省  衡阳市  耒阳市  蔡子池街道蔡池路电线大楼2单元601室  421800   ', '郑爱平 ', '18973437498', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2102', '0', '128590949719998728', '1', '1', '2018-02-06', 'lvxiuling80848 ', '3408', '1', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-07', '2018-02-11', '2018-02-12', '', '1', '广东省  深圳市  南山区  海德一道中洲控股金额中心B座8M招商证券  518052 ', ' 陈雪桦', '18218080925', '', '', null, '', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2103', '0', '128598341926558001', '1', '1', '2018-02-06', 'rachelhan0813', '3409', '1', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-07', '2018-02-11', '2018-02-12', '', '1', '广东省  深圳市  龙华新区  新区大道潜龙曼海宁南区6栋10C（放门口）  518131  ', '佳佳 ', '13510566206', '', '', null, '', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2104', '0', '128756542755811804', '1', '1', '2018-02-06', 'qst9989', '3410', '1', '', '940.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-11', '2018-02-12', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2105', '0', '123859942840881092 124201372815881092  ', '1', '2', '2018-02-06', '周宇qqq ', '3411', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '10.00', '0.00', '', '13.00', '0.00', '2018-02-07', '2018-02-09', '2018-02-11', '', '1', '广东省  深圳市  宝安区  民治街道万众城生活村14栋2单元  518101 ', ' 周宇  ', '13786632532', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2106', '0', '123910062396570287', '1', '1', '2018-02-06', 'smileecho0801', '3412', '1', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-08', '2018-02-11', '2018-02-12', '', '1', '广东省  深圳市  罗湖区  东门街道东门南路2007号广发大厦4楼招商证券  518002  ', '陈娟  ', '15889660736', '', '', null, '', '', '', '', '', '4', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2107', '0', '123904124548557690', '1', '2', '2018-02-06', 'troubtimehero', '3413', '1', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374313', '1519374313');
INSERT INTO `yii2_order` VALUES ('2108', '0', '123770145879403168', '1', '1', '2018-02-06', 'zh81721482', '3414', '1', '', '175.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2109', '0', '128706785815705127', '1', '2', '2018-02-07', 'alexnrita2015', '3415', '1', '', '520.00', '3', '3', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '', '-', '', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2110', '0', '128736156681088123', '1', '2', '2018-02-07', 'jackhong728', '3416', '1', '', '520.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-06', '1', '广东省  深圳市  龙岗区  坂田街道万科城二区枫湖居A栋架空层丰巢取物柜  518116  ', '彭生  ', '18627070809', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2111', '0', '124031889554434867', '1', '2', '2018-02-07', 'qiaojingmei', '3417', '1', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2112', '0', '128831974630241604', '1', '2', '2018-02-07', '墨筱蔓', '3418', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '四川省  绵阳市  涪城区  南山街道长虹大道南段172号126文化创意园内28栋102  621000 ', '吴依蔓', '13981187516', '', '', null, '可以26号晚上出签', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2113', '0', '116655477383726248 116734075789726248', '1', '2', '2018-02-07', 'charlene19901004', '3419', '1', '', '520.00', '1', '1', '', '10.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '福建省  厦门市  思明区  白鹿路65号之三201室  361003 ', ' 梁莹 ', '13696992692', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2114', '0', '128756456921096403', '1', '2', '2018-02-07', 'naonaoxie', '3420', '1', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 287136955@qq.com', '-', '', '', '', null, '先不办理，13号之前确定是吗时', '', '', '', '', '1', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2115', '0', '129034247915800508', '1', '2', '2018-02-07', 'destiny丶xl', '3421', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-08', '2018-02-09', '2018-02-11', '', '1', '湖北省  黄冈市  黄梅县  濯港镇夏圩村二组  435500  ', '  夏力', '18680383862', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2116', '0', '129041079161142417', '1', '2', '2018-02-07', '希媛1219', '3422', '1', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 287284627@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2117', '0', '116776830573025037  117032553133025037', '1', '1', '2018-02-07', '溪水旁的树777', '3423', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-10', '2018-02-11', '2018-02-12', '', '1', '北京  北京市  通州区  宋庄镇 大兴艺术区 D制空间  101100', '周迪', '18612306121', '', '', null, '', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2118', '0', '116723965426935341', '1', '2', '2018-02-07', 'cquptssea', '3424', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '广西壮族自治区  来宾市  兴宾区  城北街道盘古大道财富168商住小区B区3号楼3单元4-7  000000', '覃级极', '18878277788', '', '', null, '3.2号出行', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2119', '0', '116712680261237756', '1', '2', '2018-02-07', 'minshuc0610 ', '3425', '2', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：348203083@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2120', '0', '124095254747130773', '1', '2', '2018-02-07', 'lasikaer', '3426', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-10', '2018-02-11', '2018-02-12', '', '1', '', '-', '', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2121', '0', '128819568881055028  129097021868055028', '1', '2', '2018-02-07', 't_1510327021955_0690 ', '3427', '2', '', '520.00', '11', '11', '', '0.00', '-201.00', '', '70.00', '0.00', '', '23.00', '0.00', '2018-02-08', '2018-02-09', '2018-02-11', '', '1', '福建省  泉州市  安溪县  北石安星小区  362400', '陈生 ', '18595568845', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2122', '0', '116751769758602630', '1', '1', '2018-02-07', '爱上你2012', '3428', '2', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-11', '2018-02-12', '', '1', '福建省  厦门市  集美区  后溪镇後溪花園26號樓1802  361021  ', '黄嘉俊', '18922741986', '', '', null, '', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2123', '0', '124119865642731790', '1', '2', '2018-02-07', 'liulihe1981', '3429', '2', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '号回国，9号早上提交', '', '', '', '', '1', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2124', '0', '129099487443612120 128832700938612120', '1', '1', '2018-02-07', '13798592023敏敏', '3430', '2', '', '248.00', '4', '4', '', '80.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-08', '2018-02-11', '2018-02-12', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2125', '0', '124110009451852779', '1', '2', '2018-02-07', '苏墨黎 ', '3431', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-08', '2018-02-09', '2018-02-11', '', '1', '广州市海珠区赤岗街道碧映路金领寓大厦1817', '苏墨黎', '18660920004', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2126', '0', '128838496747811804', '1', '1', '2018-02-07', 'qst9989 ', '3432', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-11', '2018-02-12', '', '1', '', '-', '', '', '', null, '菲律宾卡', '', '', '', '', '4', '0', '1519374314', '1519374314');
INSERT INTO `yii2_order` VALUES ('2127', '0', '124134200996652570', '1', '2', '2018-02-07', 'chenqianaou', '3433', '2', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2128', '0', '129244415831356309', '1', '2', '2018-02-08', 'csmmmmm8', '3434', '1', '', '520.00', '2', '2', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-08', '2018-02-09', '2018-02-11', '', '1', '', '-', '', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2129', '0', '124169564430754877', '1', '2', '2018-02-08', '八宝阿姨', '3435', '2', '', '520.00', '2', '2', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '广东省  深圳市  福田区  莲花街道景田 万托家园 10G  518031  ', '张小姐', '18566621791', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2130', '0', '128890268071748428', '1', '1', '2018-02-08', 'tb7240921_2012', '3436', '2', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-10', '2018-02-11', '2018-02-12', '', '1', '浙江省  湖州市  南浔区  南浔镇嘉业路逸龙湾2幢2单元302  313009  ', '杨琪  ', '13216721062', '', '', null, '', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2131', '0', '124225592117036564', '1', '2', '2018-02-08', 'yanhao4269931', '3437', '2', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2132', '0', '124238556906693191', '1', '2', '2018-02-08', 'tb853395764 ', '3438', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '', '-', '', '', '', null, '与杨文颖', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2133', '0', '129187827041668429', '1', '2', '2018-02-08', '小兔的店999 ', '3439', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '广东省  广州市  花都区  新华街道迎宾大道168号宝铼雅居北门门卫收(放速递易就是王八蛋！)  510800 ', ' 罗小姐', '13728026138', '', '', null, '与姚', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2134', '0', '129074342744753220', '1', '1', '2018-02-08', '陆敏慧13861609166 ', '3440', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-11', '2018-02-12', '', '1', '江苏省  无锡市  江阴市  澄江街道朝阳路172号瑞明大厦一楼大厅  214400', '陆敏慧', '13861609166', '', '', null, '', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2135', '0', '128928488925091226', '1', '2', '2018-02-08', 'anjaylia914', '3441', '2', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', ' 回邮：610875031@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2136', '0', '124185807128555466', '1', '2', '2018-02-08', 'mew16334023', '3442', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '广东省  汕头市  龙湖区  中山东路柏嘉半岛3栋301  515000 ', '谢弋 ', '18666224024', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2137', '0', '128947500017213323', '1', '1', '2018-02-08', '54swsi', '3443', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-10', '2018-02-11', '2018-02-12', '', '1', '浙江省  宁波市  余姚市  阳明街道富巷新村南三166-402  315400 ', ' 施翁双捷', '18868802163', '', '', null, '', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2138', '0', '129244863500473027 128976592506473027', '1', '2', '2018-02-08', 'tangjinyexin', '3444', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '江西省  萍乡市  安源区  城郊管委会萍乡中学附近嬷嬷排挡  337000', '汤谨', '18711177206', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2139', '0', '124180879792860674', '1', '2', '2018-02-08', 'tyy19980715', '3445', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-10', '2018-02-11', '2018-02-12', '', '1', '广西壮族自治区  贵港市  港北区  贵城街道贵港市港北区江北大道丰宝小区24栋  537100    ', '谭茵茵', '13878572102', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2140', '0', '117043475802539456', '1', '1', '2018-02-09', 'yyxyzmars', '3446', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '广东省  广州市  黄埔区  红山街道红荔路2号动力大厦B座210室 广东火电环保公司  510700  ', '龙婷', '15011868283', '', '', null, '', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2141', '0', '129344123402903713', '1', '1', '2018-02-09', 'ciggeat', '3447', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '湖南省  娄底市  新化县  上梅镇火车站建新路鑫湘园5栋602室  417600  ', '曾杰洪', '13973885097', '', '', null, '', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2142', '0', '129228818290795927', '1', '1', '2018-02-09', 'zsyyfj007', '3448', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '北京  北京市  朝阳区  常营镇常营 五里桥一街中弘像素北区5号楼0112室  100011  ', ' 杨镇旭', '18501908857', '', '', null, '', '', '', '', '', '1', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2143', '0', '117068758949995736', '1', '2', '2018-02-09', 'broken_', '3449', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '湖南省  娄底市  娄星区  长青街道月塘竹林公寓上  417000  ', '陈肇中  ', '17773862039', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2144', '0', '117077942058080459', '1', '1', '2018-02-09', 'tb3439366_2012', '3450', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '山东省  淄博市  张店区  公园街道商场西路北八巷2号楼5单元401  255022  ', '苏一林', '15095168824', '', '', null, '', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2145', '0', '129123032194432922', '1', '1', '2018-02-09', 'jyrhy', '3451', '1', '', '268.00', '2', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '贵州省  贵阳市  云岩区  黔灵镇市北路142号贵州省食品药品检验所  550001 ', ' 任慧逸  ', '13518508814', '', '', null, '', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2146', '0', '129416587851948307', '1', '2', '2018-02-09', 'eason121068', '3452', '2', '', '520.00', '2', '2', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '辽宁省  沈阳市  浑南新区  浑南东路210-20号恒大江湾一期13号楼1-8-2  110000 ', '刘鑫', '13332498112', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2147', '0', '124530766740494697  124773246475494697 ', '1', '2', '2018-02-09', 'ytz0075', '3453', '2', '', '520.00', '2', '2', '', '0.00', '-201.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '黑龙江省  大庆市  让胡路区  西宾街道奥林国际公寓c10-2-602  163000', '魏安琪', '18145970800', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2148', '0', '124525528481786290', '1', '2', '2018-02-09', '瑜218 ', '3454', '2', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：48359707@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374315', '1519374315');
INSERT INTO `yii2_order` VALUES ('2149', '0', '117109272449692732', '1', '2', '2018-02-10', 'amazingyoou', '3455', '2', '', '520.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '出签后确认寄回地址', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374316', '1519374316');
INSERT INTO `yii2_order` VALUES ('2150', '0', '129219296982473600', '1', '1', '2018-02-10', '袖舞倾城', '3456', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '出签后确认寄回地址', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519374316', '1519374316');
INSERT INTO `yii2_order` VALUES ('2151', '0', '117114060675241442', '1', '1', '2018-02-10', '朱颜记0214', '3457', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '日本東京都豊島区巣鴨5-34-7-410 \n邮编1700002 \n', '朱仁君', '080-4809-2305', '', '', null, '要求寄EMS', '', '', '', '', '1', '0', '1519374316', '1519374316');
INSERT INTO `yii2_order` VALUES ('2152', '0', '129502239725473600', '1', '1', '2018-02-10', '袖舞倾城', '3458', '2', '', '268.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '辽宁省  本溪市  本溪满族自治县  小市镇本溪满族自治县小市镇黄金佳园8号楼1单元701  000000', '刘女士', '13387880988', '', '', null, '', '', '', '', '', '1', '0', '1519374316', '1519374316');
INSERT INTO `yii2_order` VALUES ('2153', '0', '129378058749753008', '1', '1', '2018-02-10', 'he15836963086', '3459', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '河南省  平顶山市  新华区  中兴路街道河南省平顶山市新华区联盟鑫城小区4号楼305室  467000', ' 何冠伟', '15836963086', '', '', null, '', '', '', '', '', '4', '0', '1519374316', '1519374316');
INSERT INTO `yii2_order` VALUES ('2154', '0', '129231841264106226', '1', '1', '2018-02-10', '温先生_63', '3460', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '广东省  广州市  番禺区  市桥街道禺山大道147号康硕方建材中心2楼大发投资有限公司  000000', '温先生', '13679778679', '', '', null, '', '', '', '', '', '4', '0', '1519374316', '1519374316');
INSERT INTO `yii2_order` VALUES ('2155', '0', '129510919932069413', '1', '1', '2018-02-10', '戴雅瑜 ', '3461', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '', '', '', '', '1', '广东省  深圳市  龙岗区  坪地街道坪西香元排10号兴怡康厂  000000 ', '戴雅瑜', '13825284095', '', '', null, '年后确定入境口岸后再寄资料办理', '', '', '', '', '1', '0', '1519374316', '1519374316');
INSERT INTO `yii2_order` VALUES ('2156', '0', '129430642912811804', '1', '1', '2018-02-10', 'qst9989', '3462', '2', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519374316', '1519374316');

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
INSERT INTO `yii2_order_to_transactor` VALUES ('2001', '3136');
INSERT INTO `yii2_order_to_transactor` VALUES ('2002', '3137');
INSERT INTO `yii2_order_to_transactor` VALUES ('2003', '3138');
INSERT INTO `yii2_order_to_transactor` VALUES ('2004', '3139');
INSERT INTO `yii2_order_to_transactor` VALUES ('2004', '3140');
INSERT INTO `yii2_order_to_transactor` VALUES ('2004', '3141');
INSERT INTO `yii2_order_to_transactor` VALUES ('2005', '3142');
INSERT INTO `yii2_order_to_transactor` VALUES ('2006', '3143');
INSERT INTO `yii2_order_to_transactor` VALUES ('2006', '3144');
INSERT INTO `yii2_order_to_transactor` VALUES ('2006', '3145');
INSERT INTO `yii2_order_to_transactor` VALUES ('2006', '3146');
INSERT INTO `yii2_order_to_transactor` VALUES ('2007', '3147');
INSERT INTO `yii2_order_to_transactor` VALUES ('2007', '3148');
INSERT INTO `yii2_order_to_transactor` VALUES ('2007', '3149');
INSERT INTO `yii2_order_to_transactor` VALUES ('2007', '3150');
INSERT INTO `yii2_order_to_transactor` VALUES ('2007', '3151');
INSERT INTO `yii2_order_to_transactor` VALUES ('2007', '3152');
INSERT INTO `yii2_order_to_transactor` VALUES ('2007', '3153');
INSERT INTO `yii2_order_to_transactor` VALUES ('2008', '3154');
INSERT INTO `yii2_order_to_transactor` VALUES ('2008', '3155');
INSERT INTO `yii2_order_to_transactor` VALUES ('2009', '3156');
INSERT INTO `yii2_order_to_transactor` VALUES ('2010', '3157');
INSERT INTO `yii2_order_to_transactor` VALUES ('2010', '3158');
INSERT INTO `yii2_order_to_transactor` VALUES ('2011', '3159');
INSERT INTO `yii2_order_to_transactor` VALUES ('2012', '3160');
INSERT INTO `yii2_order_to_transactor` VALUES ('2012', '3161');
INSERT INTO `yii2_order_to_transactor` VALUES ('2013', '3162');
INSERT INTO `yii2_order_to_transactor` VALUES ('2014', '3163');
INSERT INTO `yii2_order_to_transactor` VALUES ('2015', '3164');
INSERT INTO `yii2_order_to_transactor` VALUES ('2016', '3165');
INSERT INTO `yii2_order_to_transactor` VALUES ('2017', '3166');
INSERT INTO `yii2_order_to_transactor` VALUES ('2018', '3167');
INSERT INTO `yii2_order_to_transactor` VALUES ('2018', '3168');
INSERT INTO `yii2_order_to_transactor` VALUES ('2019', '3169');
INSERT INTO `yii2_order_to_transactor` VALUES ('2020', '3170');
INSERT INTO `yii2_order_to_transactor` VALUES ('2021', '3171');
INSERT INTO `yii2_order_to_transactor` VALUES ('2021', '3172');
INSERT INTO `yii2_order_to_transactor` VALUES ('2022', '3173');
INSERT INTO `yii2_order_to_transactor` VALUES ('2022', '3174');
INSERT INTO `yii2_order_to_transactor` VALUES ('2023', '3175');
INSERT INTO `yii2_order_to_transactor` VALUES ('2024', '3176');
INSERT INTO `yii2_order_to_transactor` VALUES ('2025', '3177');
INSERT INTO `yii2_order_to_transactor` VALUES ('2025', '3178');
INSERT INTO `yii2_order_to_transactor` VALUES ('2025', '3179');
INSERT INTO `yii2_order_to_transactor` VALUES ('2025', '3180');
INSERT INTO `yii2_order_to_transactor` VALUES ('2026', '3181');
INSERT INTO `yii2_order_to_transactor` VALUES ('2026', '3182');
INSERT INTO `yii2_order_to_transactor` VALUES ('2027', '3183');
INSERT INTO `yii2_order_to_transactor` VALUES ('2028', '3182');
INSERT INTO `yii2_order_to_transactor` VALUES ('2028', '3184');
INSERT INTO `yii2_order_to_transactor` VALUES ('2029', '3185');
INSERT INTO `yii2_order_to_transactor` VALUES ('2029', '3186');
INSERT INTO `yii2_order_to_transactor` VALUES ('2029', '3187');
INSERT INTO `yii2_order_to_transactor` VALUES ('2029', '3188');
INSERT INTO `yii2_order_to_transactor` VALUES ('2030', '3189');
INSERT INTO `yii2_order_to_transactor` VALUES ('2031', '3190');
INSERT INTO `yii2_order_to_transactor` VALUES ('2032', '3191');
INSERT INTO `yii2_order_to_transactor` VALUES ('2033', '3192');
INSERT INTO `yii2_order_to_transactor` VALUES ('2034', '3193');
INSERT INTO `yii2_order_to_transactor` VALUES ('2034', '3194');
INSERT INTO `yii2_order_to_transactor` VALUES ('2034', '3195');
INSERT INTO `yii2_order_to_transactor` VALUES ('2035', '3196');
INSERT INTO `yii2_order_to_transactor` VALUES ('2035', '3197');
INSERT INTO `yii2_order_to_transactor` VALUES ('2036', '3182');
INSERT INTO `yii2_order_to_transactor` VALUES ('2036', '3198');
INSERT INTO `yii2_order_to_transactor` VALUES ('2037', '3199');
INSERT INTO `yii2_order_to_transactor` VALUES ('2038', '3200');
INSERT INTO `yii2_order_to_transactor` VALUES ('2039', '3201');
INSERT INTO `yii2_order_to_transactor` VALUES ('2040', '3202');
INSERT INTO `yii2_order_to_transactor` VALUES ('2041', '3203');
INSERT INTO `yii2_order_to_transactor` VALUES ('2042', '3204');
INSERT INTO `yii2_order_to_transactor` VALUES ('2043', '3205');
INSERT INTO `yii2_order_to_transactor` VALUES ('2043', '3206');
INSERT INTO `yii2_order_to_transactor` VALUES ('2044', '3207');
INSERT INTO `yii2_order_to_transactor` VALUES ('2044', '3208');
INSERT INTO `yii2_order_to_transactor` VALUES ('2044', '3209');
INSERT INTO `yii2_order_to_transactor` VALUES ('2045', '3210');
INSERT INTO `yii2_order_to_transactor` VALUES ('2046', '3211');
INSERT INTO `yii2_order_to_transactor` VALUES ('2047', '3212');
INSERT INTO `yii2_order_to_transactor` VALUES ('2047', '3213');
INSERT INTO `yii2_order_to_transactor` VALUES ('2047', '3214');
INSERT INTO `yii2_order_to_transactor` VALUES ('2047', '3215');
INSERT INTO `yii2_order_to_transactor` VALUES ('2048', '3216');
INSERT INTO `yii2_order_to_transactor` VALUES ('2049', '3182');
INSERT INTO `yii2_order_to_transactor` VALUES ('2049', '3217');
INSERT INTO `yii2_order_to_transactor` VALUES ('2050', '3218');
INSERT INTO `yii2_order_to_transactor` VALUES ('2051', '3219');
INSERT INTO `yii2_order_to_transactor` VALUES ('2052', '3220');
INSERT INTO `yii2_order_to_transactor` VALUES ('2053', '3221');
INSERT INTO `yii2_order_to_transactor` VALUES ('2054', '3222');
INSERT INTO `yii2_order_to_transactor` VALUES ('2054', '3223');
INSERT INTO `yii2_order_to_transactor` VALUES ('2055', '3224');
INSERT INTO `yii2_order_to_transactor` VALUES ('2055', '3225');
INSERT INTO `yii2_order_to_transactor` VALUES ('2056', '3226');
INSERT INTO `yii2_order_to_transactor` VALUES ('2056', '3227');
INSERT INTO `yii2_order_to_transactor` VALUES ('2057', '3228');
INSERT INTO `yii2_order_to_transactor` VALUES ('2058', '3229');
INSERT INTO `yii2_order_to_transactor` VALUES ('2059', '3230');
INSERT INTO `yii2_order_to_transactor` VALUES ('2060', '3231');
INSERT INTO `yii2_order_to_transactor` VALUES ('2061', '3232');
INSERT INTO `yii2_order_to_transactor` VALUES ('2061', '3233');
INSERT INTO `yii2_order_to_transactor` VALUES ('2062', '3234');
INSERT INTO `yii2_order_to_transactor` VALUES ('2062', '3235');
INSERT INTO `yii2_order_to_transactor` VALUES ('2063', '3236');
INSERT INTO `yii2_order_to_transactor` VALUES ('2064', '3237');
INSERT INTO `yii2_order_to_transactor` VALUES ('2065', '3238');
INSERT INTO `yii2_order_to_transactor` VALUES ('2066', '3239');
INSERT INTO `yii2_order_to_transactor` VALUES ('2066', '3240');
INSERT INTO `yii2_order_to_transactor` VALUES ('2066', '3241');
INSERT INTO `yii2_order_to_transactor` VALUES ('2067', '3242');
INSERT INTO `yii2_order_to_transactor` VALUES ('2067', '3243');
INSERT INTO `yii2_order_to_transactor` VALUES ('2068', '3244');
INSERT INTO `yii2_order_to_transactor` VALUES ('2068', '3245');
INSERT INTO `yii2_order_to_transactor` VALUES ('2068', '3246');
INSERT INTO `yii2_order_to_transactor` VALUES ('2069', '3247');
INSERT INTO `yii2_order_to_transactor` VALUES ('2070', '3248');
INSERT INTO `yii2_order_to_transactor` VALUES ('2071', '3249');
INSERT INTO `yii2_order_to_transactor` VALUES ('2072', '3142');
INSERT INTO `yii2_order_to_transactor` VALUES ('2073', '3250');
INSERT INTO `yii2_order_to_transactor` VALUES ('2073', '3251');
INSERT INTO `yii2_order_to_transactor` VALUES ('2073', '3252');
INSERT INTO `yii2_order_to_transactor` VALUES ('2073', '3253');
INSERT INTO `yii2_order_to_transactor` VALUES ('2073', '3254');
INSERT INTO `yii2_order_to_transactor` VALUES ('2074', '3142');
INSERT INTO `yii2_order_to_transactor` VALUES ('2075', '3255');
INSERT INTO `yii2_order_to_transactor` VALUES ('2076', '3256');
INSERT INTO `yii2_order_to_transactor` VALUES ('2077', '3257');
INSERT INTO `yii2_order_to_transactor` VALUES ('2078', '3258');
INSERT INTO `yii2_order_to_transactor` VALUES ('2079', '3259');
INSERT INTO `yii2_order_to_transactor` VALUES ('2080', '3260');
INSERT INTO `yii2_order_to_transactor` VALUES ('2081', '3261');
INSERT INTO `yii2_order_to_transactor` VALUES ('2082', '3262');
INSERT INTO `yii2_order_to_transactor` VALUES ('2083', '3263');
INSERT INTO `yii2_order_to_transactor` VALUES ('2083', '3264');
INSERT INTO `yii2_order_to_transactor` VALUES ('2083', '3265');
INSERT INTO `yii2_order_to_transactor` VALUES ('2084', '3266');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3267');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3268');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3269');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3270');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3271');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3272');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3273');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3274');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3275');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3276');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3277');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3278');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3279');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3280');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3281');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3282');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3283');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3284');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3285');
INSERT INTO `yii2_order_to_transactor` VALUES ('2085', '3286');
INSERT INTO `yii2_order_to_transactor` VALUES ('2086', '3287');
INSERT INTO `yii2_order_to_transactor` VALUES ('2086', '3288');
INSERT INTO `yii2_order_to_transactor` VALUES ('2086', '3289');
INSERT INTO `yii2_order_to_transactor` VALUES ('2086', '3290');
INSERT INTO `yii2_order_to_transactor` VALUES ('2086', '3291');
INSERT INTO `yii2_order_to_transactor` VALUES ('2086', '3292');
INSERT INTO `yii2_order_to_transactor` VALUES ('2087', '3182');
INSERT INTO `yii2_order_to_transactor` VALUES ('2087', '3293');
INSERT INTO `yii2_order_to_transactor` VALUES ('2088', '3294');
INSERT INTO `yii2_order_to_transactor` VALUES ('2088', '3295');
INSERT INTO `yii2_order_to_transactor` VALUES ('2089', '3296');
INSERT INTO `yii2_order_to_transactor` VALUES ('2090', '3297');
INSERT INTO `yii2_order_to_transactor` VALUES ('2091', '3298');
INSERT INTO `yii2_order_to_transactor` VALUES ('2092', '3299');
INSERT INTO `yii2_order_to_transactor` VALUES ('2093', '3300');
INSERT INTO `yii2_order_to_transactor` VALUES ('2094', '3301');
INSERT INTO `yii2_order_to_transactor` VALUES ('2095', '3302');
INSERT INTO `yii2_order_to_transactor` VALUES ('2096', '3303');
INSERT INTO `yii2_order_to_transactor` VALUES ('2097', '3182');
INSERT INTO `yii2_order_to_transactor` VALUES ('2097', '3304');
INSERT INTO `yii2_order_to_transactor` VALUES ('2097', '3305');
INSERT INTO `yii2_order_to_transactor` VALUES ('2097', '3306');
INSERT INTO `yii2_order_to_transactor` VALUES ('2097', '3307');
INSERT INTO `yii2_order_to_transactor` VALUES ('2098', '3308');
INSERT INTO `yii2_order_to_transactor` VALUES ('2098', '3309');
INSERT INTO `yii2_order_to_transactor` VALUES ('2099', '3310');
INSERT INTO `yii2_order_to_transactor` VALUES ('2099', '3311');
INSERT INTO `yii2_order_to_transactor` VALUES ('2099', '3312');
INSERT INTO `yii2_order_to_transactor` VALUES ('2100', '3313');
INSERT INTO `yii2_order_to_transactor` VALUES ('2101', '3314');
INSERT INTO `yii2_order_to_transactor` VALUES ('2102', '3315');
INSERT INTO `yii2_order_to_transactor` VALUES ('2102', '3316');
INSERT INTO `yii2_order_to_transactor` VALUES ('2103', '3317');
INSERT INTO `yii2_order_to_transactor` VALUES ('2103', '3318');
INSERT INTO `yii2_order_to_transactor` VALUES ('2104', '3319');
INSERT INTO `yii2_order_to_transactor` VALUES ('2105', '3320');
INSERT INTO `yii2_order_to_transactor` VALUES ('2106', '3321');
INSERT INTO `yii2_order_to_transactor` VALUES ('2106', '3322');
INSERT INTO `yii2_order_to_transactor` VALUES ('2107', '3323');
INSERT INTO `yii2_order_to_transactor` VALUES ('2107', '3324');
INSERT INTO `yii2_order_to_transactor` VALUES ('2108', '3142');
INSERT INTO `yii2_order_to_transactor` VALUES ('2109', '3325');
INSERT INTO `yii2_order_to_transactor` VALUES ('2109', '3326');
INSERT INTO `yii2_order_to_transactor` VALUES ('2109', '3327');
INSERT INTO `yii2_order_to_transactor` VALUES ('2110', '3328');
INSERT INTO `yii2_order_to_transactor` VALUES ('2110', '3329');
INSERT INTO `yii2_order_to_transactor` VALUES ('2110', '3330');
INSERT INTO `yii2_order_to_transactor` VALUES ('2111', '3331');
INSERT INTO `yii2_order_to_transactor` VALUES ('2112', '3332');
INSERT INTO `yii2_order_to_transactor` VALUES ('2113', '3333');
INSERT INTO `yii2_order_to_transactor` VALUES ('2114', '3334');
INSERT INTO `yii2_order_to_transactor` VALUES ('2114', '3335');
INSERT INTO `yii2_order_to_transactor` VALUES ('2115', '3243');
INSERT INTO `yii2_order_to_transactor` VALUES ('2115', '3336');
INSERT INTO `yii2_order_to_transactor` VALUES ('2116', '3337');
INSERT INTO `yii2_order_to_transactor` VALUES ('2117', '3243');
INSERT INTO `yii2_order_to_transactor` VALUES ('2117', '3338');
INSERT INTO `yii2_order_to_transactor` VALUES ('2117', '3339');
INSERT INTO `yii2_order_to_transactor` VALUES ('2118', '3340');
INSERT INTO `yii2_order_to_transactor` VALUES ('2119', '3341');
INSERT INTO `yii2_order_to_transactor` VALUES ('2120', '3342');
INSERT INTO `yii2_order_to_transactor` VALUES ('2121', '3343');
INSERT INTO `yii2_order_to_transactor` VALUES ('2121', '3344');
INSERT INTO `yii2_order_to_transactor` VALUES ('2121', '3345');
INSERT INTO `yii2_order_to_transactor` VALUES ('2121', '3346');
INSERT INTO `yii2_order_to_transactor` VALUES ('2121', '3347');
INSERT INTO `yii2_order_to_transactor` VALUES ('2121', '3348');
INSERT INTO `yii2_order_to_transactor` VALUES ('2121', '3349');
INSERT INTO `yii2_order_to_transactor` VALUES ('2121', '3350');
INSERT INTO `yii2_order_to_transactor` VALUES ('2121', '3351');
INSERT INTO `yii2_order_to_transactor` VALUES ('2121', '3352');
INSERT INTO `yii2_order_to_transactor` VALUES ('2121', '3353');
INSERT INTO `yii2_order_to_transactor` VALUES ('2122', '3354');
INSERT INTO `yii2_order_to_transactor` VALUES ('2123', '3355');
INSERT INTO `yii2_order_to_transactor` VALUES ('2124', '3356');
INSERT INTO `yii2_order_to_transactor` VALUES ('2124', '3357');
INSERT INTO `yii2_order_to_transactor` VALUES ('2124', '3358');
INSERT INTO `yii2_order_to_transactor` VALUES ('2124', '3359');
INSERT INTO `yii2_order_to_transactor` VALUES ('2125', '3360');
INSERT INTO `yii2_order_to_transactor` VALUES ('2126', '3361');
INSERT INTO `yii2_order_to_transactor` VALUES ('2127', '3362');
INSERT INTO `yii2_order_to_transactor` VALUES ('2127', '3363');
INSERT INTO `yii2_order_to_transactor` VALUES ('2128', '3364');
INSERT INTO `yii2_order_to_transactor` VALUES ('2128', '3365');
INSERT INTO `yii2_order_to_transactor` VALUES ('2129', '3366');
INSERT INTO `yii2_order_to_transactor` VALUES ('2129', '3367');
INSERT INTO `yii2_order_to_transactor` VALUES ('2129', '3368');
INSERT INTO `yii2_order_to_transactor` VALUES ('2130', '3369');
INSERT INTO `yii2_order_to_transactor` VALUES ('2130', '3370');
INSERT INTO `yii2_order_to_transactor` VALUES ('2131', '3371');
INSERT INTO `yii2_order_to_transactor` VALUES ('2132', '3372');
INSERT INTO `yii2_order_to_transactor` VALUES ('2133', '3373');
INSERT INTO `yii2_order_to_transactor` VALUES ('2134', '3374');
INSERT INTO `yii2_order_to_transactor` VALUES ('2135', '3375');
INSERT INTO `yii2_order_to_transactor` VALUES ('2135', '3376');
INSERT INTO `yii2_order_to_transactor` VALUES ('2136', '3377');
INSERT INTO `yii2_order_to_transactor` VALUES ('2137', '3378');
INSERT INTO `yii2_order_to_transactor` VALUES ('2138', '3379');
INSERT INTO `yii2_order_to_transactor` VALUES ('2139', '3380');
INSERT INTO `yii2_order_to_transactor` VALUES ('2139', '3381');
INSERT INTO `yii2_order_to_transactor` VALUES ('2140', '3382');
INSERT INTO `yii2_order_to_transactor` VALUES ('2141', '3383');
INSERT INTO `yii2_order_to_transactor` VALUES ('2142', '3384');
INSERT INTO `yii2_order_to_transactor` VALUES ('2143', '3385');
INSERT INTO `yii2_order_to_transactor` VALUES ('2144', '3386');
INSERT INTO `yii2_order_to_transactor` VALUES ('2145', '3182');
INSERT INTO `yii2_order_to_transactor` VALUES ('2145', '3387');
INSERT INTO `yii2_order_to_transactor` VALUES ('2146', '3182');
INSERT INTO `yii2_order_to_transactor` VALUES ('2146', '3388');
INSERT INTO `yii2_order_to_transactor` VALUES ('2146', '3389');
INSERT INTO `yii2_order_to_transactor` VALUES ('2147', '3390');
INSERT INTO `yii2_order_to_transactor` VALUES ('2147', '3391');
INSERT INTO `yii2_order_to_transactor` VALUES ('2148', '3392');
INSERT INTO `yii2_order_to_transactor` VALUES ('2149', '3393');
INSERT INTO `yii2_order_to_transactor` VALUES ('2149', '3394');
INSERT INTO `yii2_order_to_transactor` VALUES ('2150', '3395');
INSERT INTO `yii2_order_to_transactor` VALUES ('2151', '3396');
INSERT INTO `yii2_order_to_transactor` VALUES ('2152', '3397');
INSERT INTO `yii2_order_to_transactor` VALUES ('2155', '3403');
INSERT INTO `yii2_order_to_transactor` VALUES ('2154', '3402');
INSERT INTO `yii2_order_to_transactor` VALUES ('2152', '3398');
INSERT INTO `yii2_order_to_transactor` VALUES ('2152', '3399');
INSERT INTO `yii2_order_to_transactor` VALUES ('2152', '3400');
INSERT INTO `yii2_order_to_transactor` VALUES ('2153', '3401');
INSERT INTO `yii2_order_to_transactor` VALUES ('2156', '3404');
INSERT INTO `yii2_order_to_transactor` VALUES ('2156', '3405');

-- ----------------------------
-- Table structure for yii2_product
-- ----------------------------
DROP TABLE IF EXISTS `yii2_product`;
CREATE TABLE `yii2_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `name` varchar(255) NOT NULL,
  `cost` decimal(10,2) NOT NULL COMMENT '支出成本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67647 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_product
-- ----------------------------
INSERT INTO `yii2_product` VALUES ('67639', '菲律宾59天单次签证', '0.00');
INSERT INTO `yii2_product` VALUES ('67640', '菲律宾三个月多次签证', '0.00');
INSERT INTO `yii2_product` VALUES ('67641', '菲律宾半年多次签证', '0.00');
INSERT INTO `yii2_product` VALUES ('67642', '马来西亚-15天ENTRI', '0.00');
INSERT INTO `yii2_product` VALUES ('67643', '马来西亚-30天EVISA', '0.00');
INSERT INTO `yii2_product` VALUES ('67644', '马来西亚-30天贴纸签', '0.00');
INSERT INTO `yii2_product` VALUES ('67645', '柬埔寨电子签', '0.00');
INSERT INTO `yii2_product` VALUES ('67646', '柬埔寨贴纸签', '0.00');

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
INSERT INTO `yii2_session` VALUES ('6p8k95s1tarcg2f7hbm4l82hm7', '1518088502', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('7u09dhs35m0r9f5da6l094o3j4', '1519440286', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C733A313A2234223B);
INSERT INTO `yii2_session` VALUES ('906ihehl3vsha2a1u11n08k3b0', '1517902614', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('bbrvi08q3hcbejm44o1b071lj3', '1518001454', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2234223B);
INSERT INTO `yii2_session` VALUES ('bcdmkee8g009l8npk72nq5tvn2', '1519381320', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C733A313A2234223B);
INSERT INTO `yii2_session` VALUES ('c4lphg1kljjsqqr7s1du07i9t4', '1519440821', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C733A313A2234223B);
INSERT INTO `yii2_session` VALUES ('fqtpq7ga7afpomce3pbn1mu4b1', '1519437917', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C733A313A2234223B);
INSERT INTO `yii2_session` VALUES ('pmvcgqemjqn7r5k5p37sp7fjg6', '1517828420', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('sba385msntgjq32nun3qj5eb06', '1519381325', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C733A313A2231223B);

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
  `combo_charge` float(5,3) NOT NULL DEFAULT '0.000',
  `quote` int(10) NOT NULL DEFAULT '0' COMMENT '引用数',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3463 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_snapshot
-- ----------------------------
INSERT INTO `yii2_snapshot` VALUES ('3307', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3308', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3309', '390/4天', '290.000', '1', '2', '0', '1', '马来西亚-30天贴纸签', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3310', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3311', '175/3天', '160.000', '1', '1', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3312', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3313', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3314', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3315', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3316', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3317', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3318', '248/8天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3319', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3320', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3321', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3322', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3323', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3324', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3325', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3326', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3327', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3328', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3329', '358/3小时', '242.000', '1', '2', '0', '1', '柬埔寨电子签', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3330', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3331', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3332', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3333', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3334', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3335', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3336', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3337', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3338', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3339', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3340', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3341', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3342', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3343', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3344', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3345', '520/3天', '200.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3346', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3347', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3348', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3349', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3350', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3351', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3352', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3353', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3354', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3355', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3356', '248/8天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3357', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3358', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3359', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3360', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3361', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3362', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3363', '175/3天', '160.000', '1', '1', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3364', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3365', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3366', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3367', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3368', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3369', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3370', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3371', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3372', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3373', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3374', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3375', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3376', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3377', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3378', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3379', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3380', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3381', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3382', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3383', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3384', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3385', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3386', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3387', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3388', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3389', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3390', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3391', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3392', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3393', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3394', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3395', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3396', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3397', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3398', '300/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3399', '520/3天', '200.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3400', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3401', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3402', '248/8天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3403', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3404', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3405', '520/3天', '200.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3406', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3407', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3408', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3409', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3410', '940/7天', '550.000', '1', '1', '0', '1', '菲律宾三个月多次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3411', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3412', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3413', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3414', '175/3天', '160.000', '1', '1', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3415', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3416', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3417', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3418', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3419', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3420', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3421', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3422', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3423', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3424', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3425', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3426', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3427', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3428', '248/8天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3429', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3430', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3431', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3432', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3433', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3434', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3435', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3436', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3437', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3438', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3439', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3440', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3441', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3442', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3443', '268/5天', '268.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3444', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3445', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3446', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3447', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3448', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3449', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3450', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3451', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3452', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3453', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3454', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3455', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3456', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3457', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3458', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3459', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3460', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3461', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3462', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3406 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_transator
-- ----------------------------
INSERT INTO `yii2_transator` VALUES ('3136', '俞嘉祎', '1', '', '', '', '0', '1519460708', '0', '');
INSERT INTO `yii2_transator` VALUES ('3137', '闸志欣', '1', '', '', '', '0', '1519460708', '0', '');
INSERT INTO `yii2_transator` VALUES ('3138', '汤委静', '1', '', '', '', '0', '1519460708', '0', '');
INSERT INTO `yii2_transator` VALUES ('3139', '潘凤英', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3140', '林松平', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3141', '林滨蔚', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3142', '未知名', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3143', '王洁琼', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3144', '陈凯', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3145', '陈韵如', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3146', '陈美如', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3147', '赵春旭', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3148', '赵宁', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3149', '邢阳涛', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3150', '宋伟', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3151', '马学鹏', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3152', '肖震', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3153', '谢春奇', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3154', '冯靖怡', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3155', '李德贤', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3156', '李丽君', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3157', '张晨蕾', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3158', '刘姿辰', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3159', '帅莎', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3160', '文杨', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3161', '卡利博', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3162', '苏嘉莉', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3163', '张琳烨', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3164', '王晓燕', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3165', '张雪霞', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3166', '郭依婷', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3167', '刘阳婕', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3168', '宿务入境', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3169', '胡尧', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3170', '周尤加', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3171', '陈杰平', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3172', '余晓琪', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3173', '王烨微', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3174', '邱园园', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3175', '黄永恒', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3176', '蔡朝海', '1', '', '', '', '0', '1519460709', '0', '');
INSERT INTO `yii2_transator` VALUES ('3177', '李强', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3178', '刘平', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3179', '李杰骏', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3180', '郭思含', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3181', '李秀丽', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3182', '马尼拉入境', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3183', '李冠五', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3184', '王晓蕾', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3185', '潘小丽', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3186', '潘彬彬', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3187', '潘自华', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3188', '黄学英', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3189', '王婧骅', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3190', '周子现', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3191', '曹铭', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3192', '胡玲', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3193', '李明', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3194', '赵虎', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3195', '沈天岩', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3196', '杨楠', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3197', '刘沐一', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3198', '诸葛敏', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3199', '薛志敏', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3200', '张晓玲', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3201', '谢瑶地', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3202', '李军', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3203', '黄勇宣', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3204', '庞基健', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3205', '刘敏', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3206', '张英', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3207', '银波', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3208', '段沣妹', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3209', '张莉', '1', '', '', '', '0', '1519460710', '0', '');
INSERT INTO `yii2_transator` VALUES ('3210', '唐乃武', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3211', '谢龙江', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3212', '米静波', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3213', '张浩森', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3214', '王首相', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3215', '蔡宇生', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3216', '陈冲', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3217', '朱强', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3218', '万成', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3219', '胡寒芳', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3220', '刘春兰', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3221', '刘一洋', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3222', '余婧', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3223', '杨科鹏', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3224', '郑微微', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3225', '林珩', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3226', '普云雪', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3227', '董禹希', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3228', '丛麒', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3229', '康美迪', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3230', '李富生', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3231', '余顺平', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3232', '熊火妹', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3233', '陶家保', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3234', '闫焕焕', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3235', '王公翠', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3236', '蔡恒开', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3237', '谭锦光', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3238', '郑美远', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3239', '胡飞江', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3240', '杨栋', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3241', '陈睿', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3242', '曾志林', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3243', '马尼拉', '1', '', '', '', '0', '1519460711', '0', '');
INSERT INTO `yii2_transator` VALUES ('3244', '刘祎', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3245', '张屳哲', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3246', '刘君山', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3247', '袁伟辉', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3248', '方芳', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3249', '陈升栋', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3250', '高峰', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3251', '张志宇', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3252', '高芃颜', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3253', '高源', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3254', '高心语', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3255', '赵云', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3256', '陈庆谏', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3257', '黄凌翔', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3258', '孔雪莲', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3259', '郑美桂', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3260', '杨静文', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3261', '林文斌', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3262', '林圣晔', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3263', '管宇欣', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3264', '张艳华', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3265', '出签到付', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3266', '刘洋', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3267', '陈芸', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3268', '李响', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3269', '李晨', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3270', '洪溯', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3271', '黄锦洲', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3272', '林宣祯', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3273', '林智强', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3274', '张慧琼', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3275', '林以昕', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3276', '陈玉琴', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3277', '杨玉洁', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3278', '陈美娇', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3279', '潘灿强', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3280', '陈伟锋', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3281', '韩倩', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3282', '颜晓玲', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3283', '李蔚然', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3284', '林若晴', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3285', '林宗英', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3286', '黄文宽', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3287', '安良惠', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3288', '刘萍', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3289', '陈培恩', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3290', '毛乾华', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3291', '凌永军', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3292', '朱艳萍', '1', '', '', '', '0', '1519460712', '0', '');
INSERT INTO `yii2_transator` VALUES ('3293', '刘东海', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3294', '周武佳', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3295', '晏旭', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3296', '丁家仁', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3297', '刘洋溱', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3298', '梁立成', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3299', '马来15天改错', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3300', '张晶', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3301', '华梦', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3302', '张厚磊', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3303', '唐宾檐', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3304', '马清', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3305', '杨春艳', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3306', '杨悦', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3307', '张童', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3308', '张东旭', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3309', '牛芳', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3310', '何就妹', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3311', '（和杨静文）', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3312', '11号未出签珠海自取', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3313', '訾爽', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3314', '杨芸潞', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3315', '陈雪桦', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3316', '王梓宇', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3317', '韩瑞佳', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3318', '郭思聪', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3319', '黄辛福', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3320', '周宇', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3321', '陈娟', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3322', '何晓佳', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3323', '李谦', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3324', '梁世豪', '1', '', '', '', '0', '1519460713', '0', '');
INSERT INTO `yii2_transator` VALUES ('3325', '葛航宇', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3326', '平娜娜', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3327', '葛锦瑜', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3328', '彭跃华', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3329', '彭娅鸿', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3330', '彭子钰', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3331', '乔金辉', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3332', '程诗晓', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3333', '吴厦妹', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3334', '谢常圣', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3335', '刘宏峰', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3336', '夏力', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3337', '周媛', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3338', '周迪', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3339', '个人信息在聊天记录', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3340', '覃级极', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3341', '陈淑敏', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3342', '黄涛', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3343', '王财宝', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3344', '王海滨', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3345', '黄道忠', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3346', '黄道席', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3347', '何学清', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3348', '刘坤广', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3349', '严根洪', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3350', '黄长林', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3351', '刘贤广', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3352', '黄圣辉', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3353', '黄书平', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3354', '黄嘉俊、周蓉', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3355', '毕可玲', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3356', '王博', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3357', '耿君伟', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3358', '李涵江', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3359', '吴程辉', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3360', '周萍', '1', '', '', '', '0', '1519460714', '0', '');
INSERT INTO `yii2_transator` VALUES ('3361', '李志荣', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3362', '张其林', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3363', '唐锦涛', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3364', '骆美芸', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3365', '林心韵', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3366', '那莹莹', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3367', '张明', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3368', '克拉克入境', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3369', '杨琪', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3370', '朱洪亮', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3371', '闫昊', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3372', '姚思宇', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3373', '杨文颖', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3374', '黄磊', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3375', '苏培根', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3376', '区嘉怡', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3377', '谢弋', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3378', '施翁双捷', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3379', '汤谨', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3380', '谭茵茵', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3381', '26号出签', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3382', '龙祺', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3383', '曾杰洪', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3384', '杨镇旭', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3385', '刘宇辰', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3386', '苏一林', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3387', '金贻、任慧逸', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3388', '刘鑫', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3389', '褚晓君', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3390', '魏安琪', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3391', '杨天卓', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3392', '夏瑜', '1', '', '', '', '0', '1519460715', '0', '');
INSERT INTO `yii2_transator` VALUES ('3393', '尤程', '1', '', '', '', '0', '1519460716', '0', '');
INSERT INTO `yii2_transator` VALUES ('3394', '朱秀清', '1', '', '', '', '0', '1519460716', '0', '');
INSERT INTO `yii2_transator` VALUES ('3395', '张玉辉', '1', '', '', '', '0', '1519460716', '0', '');
INSERT INTO `yii2_transator` VALUES ('3396', '朱仁君', '1', '', '', '', '0', '1519460716', '0', '');
INSERT INTO `yii2_transator` VALUES ('3397', '姚福军', '1', '', '', '', '0', '1519460716', '0', '');
INSERT INTO `yii2_transator` VALUES ('3398', '谢智国', '1', '', '', '', '0', '1519460716', '0', '');
INSERT INTO `yii2_transator` VALUES ('3399', '赵丰', '1', '', '', '', '0', '1519460716', '0', '');
INSERT INTO `yii2_transator` VALUES ('3400', '刘伟斌', '1', '', '', '', '0', '1519460716', '0', '');
INSERT INTO `yii2_transator` VALUES ('3401', '何冠伟', '1', '', '', '', '0', '1519460716', '0', '');
INSERT INTO `yii2_transator` VALUES ('3402', '温炳发', '1', '', '', '', '0', '1519460716', '0', '');
INSERT INTO `yii2_transator` VALUES ('3403', '戴雅瑜', '1', '', '', '', '0', '1519460716', '0', '');
INSERT INTO `yii2_transator` VALUES ('3404', '廖玉卿', '1', '', '', '', '0', '1519460716', '0', '');
INSERT INTO `yii2_transator` VALUES ('3405', '谢志火', '1', '', '', '', '0', '1519460716', '0', '');

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
