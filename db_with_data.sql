/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : visa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-02-23 16:13:43
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
INSERT INTO `yii2_admin` VALUES ('1', 'admin', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i', '771405950@qq.com', '2130706433', '1519349723', '2130706433', '1', '1482305564', '1519349723');
INSERT INTO `yii2_admin` VALUES ('4', 'admin2', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$DPm3NP2B4HDth70cflSqCeC0k562iwHf9P1gsBT728WrFA8oYcy2C', '876505905@qq.com', '2130706433', '1518075892', '2130706433', '1', '1482305564', '1518075892');
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
INSERT INTO `yii2_auth_item` VALUES ('admin/auth', '2', '', 'admin/auth', null, '1484734191', '1518074399');
INSERT INTO `yii2_auth_item` VALUES ('admin/create', '2', '', 'admin/create', null, '1484734191', '1518074399');
INSERT INTO `yii2_auth_item` VALUES ('admin/delete', '2', '', 'admin/delete', null, '1484734191', '1518074399');
INSERT INTO `yii2_auth_item` VALUES ('admin/index', '2', '', 'admin/index', null, '1484734191', '1518074399');
INSERT INTO `yii2_auth_item` VALUES ('admin/update', '2', '', 'admin/update', null, '1484734191', '1518074399');
INSERT INTO `yii2_auth_item` VALUES ('administors', '1', '授权所有权限', null, null, '1484712662', '1484712662');
INSERT INTO `yii2_auth_item` VALUES ('combo/index', '2', '', 'combo/index', null, '1517996186', '1518074400');
INSERT INTO `yii2_auth_item` VALUES ('config/attachment', '2', '', 'config/attachment', null, '1484734191', '1518074398');
INSERT INTO `yii2_auth_item` VALUES ('config/basic', '2', '', 'config/basic', null, '1484734191', '1518074398');
INSERT INTO `yii2_auth_item` VALUES ('config/send-mail', '2', '', 'config/send-mail', null, '1484734191', '1518074398');
INSERT INTO `yii2_auth_item` VALUES ('database/export', '2', '', 'database/export', null, '1484734305', '1518074400');
INSERT INTO `yii2_auth_item` VALUES ('editors', '1', '网站编辑', null, null, '1484712712', '1484712712');
INSERT INTO `yii2_auth_item` VALUES ('index/frame', '2', '', 'index/frame', null, '1518057962', '1518074401');
INSERT INTO `yii2_auth_item` VALUES ('index/index', '2', '', 'index/index', null, '1484734191', '1518074401');
INSERT INTO `yii2_auth_item` VALUES ('menu/create', '2', '', 'menu/create', null, '1484734191', '1518074399');
INSERT INTO `yii2_auth_item` VALUES ('menu/delete', '2', '', 'menu/delete', null, '1484734191', '1518074399');
INSERT INTO `yii2_auth_item` VALUES ('menu/index', '2', '', 'menu/index', null, '1484734191', '1518074399');
INSERT INTO `yii2_auth_item` VALUES ('menu/update', '2', '', 'menu/update', null, '1484734191', '1518074399');
INSERT INTO `yii2_auth_item` VALUES ('order/create', '2', '', 'order/create', null, '1518074401', '1518074401');
INSERT INTO `yii2_auth_item` VALUES ('order/index', '2', '', 'order/index', null, '1517996186', '1518074401');
INSERT INTO `yii2_auth_item` VALUES ('product/index', '2', '', 'product/index', null, '1517996186', '1518074400');
INSERT INTO `yii2_auth_item` VALUES ('role/auth', '2', '', 'role/auth', null, '1484734191', '1518074400');
INSERT INTO `yii2_auth_item` VALUES ('role/create', '2', '', 'role/create', null, '1484734191', '1518074400');
INSERT INTO `yii2_auth_item` VALUES ('role/delete', '2', '', 'role/delete', null, '1484734191', '1518074400');
INSERT INTO `yii2_auth_item` VALUES ('role/index', '2', '', 'role/index', null, '1484734191', '1518074399');
INSERT INTO `yii2_auth_item` VALUES ('role/update', '2', '', 'role/update', null, '1484734191', '1518074400');
INSERT INTO `yii2_auth_item` VALUES ('servicer/index', '2', '', 'servicer/index', null, '1517996187', '1518074401');
INSERT INTO `yii2_auth_item` VALUES ('transator/index', '2', '', 'transator/index', null, '1517996187', '1518074401');

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
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'admin/auth');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'admin/create');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'admin/create');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'admin/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'admin/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'admin/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'admin/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'admin/update');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'admin/update');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'combo/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'config/attachment');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'config/attachment');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'config/basic');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'config/basic');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'config/send-mail');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'config/send-mail');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'database/export');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'database/export');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'index/frame');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'index/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'index/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'menu/create');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'menu/create');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'menu/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'menu/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'menu/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'menu/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'menu/update');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'menu/update');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'order/create');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'order/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'product/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/auth');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'role/auth');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/create');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'role/create');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'role/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/index');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'role/index');
INSERT INTO `yii2_auth_item_child` VALUES ('administors', 'role/update');
INSERT INTO `yii2_auth_item_child` VALUES ('editors', 'role/update');
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
INSERT INTO `yii2_auth_rule` VALUES ('admin/auth', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"admin/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074399;}', '1484734191', '1518074399');
INSERT INTO `yii2_auth_rule` VALUES ('admin/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074399;}', '1484734191', '1518074399');
INSERT INTO `yii2_auth_rule` VALUES ('admin/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074399;}', '1484734191', '1518074399');
INSERT INTO `yii2_auth_rule` VALUES ('admin/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"admin/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074399;}', '1484734191', '1518074399');
INSERT INTO `yii2_auth_rule` VALUES ('admin/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074399;}', '1484734191', '1518074399');
INSERT INTO `yii2_auth_rule` VALUES ('combo/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"combo/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996186;s:9:\"updatedAt\";i:1518074400;}', '1517996186', '1518074400');
INSERT INTO `yii2_auth_rule` VALUES ('config/attachment', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:17:\"config/attachment\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074398;}', '1484734191', '1518074398');
INSERT INTO `yii2_auth_rule` VALUES ('config/basic', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"config/basic\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074398;}', '1484734191', '1518074398');
INSERT INTO `yii2_auth_rule` VALUES ('config/send-mail', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:16:\"config/send-mail\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074398;}', '1484734191', '1518074398');
INSERT INTO `yii2_auth_rule` VALUES ('database/export', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"database/export\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734305;s:9:\"updatedAt\";i:1518074400;}', '1484734305', '1518074400');
INSERT INTO `yii2_auth_rule` VALUES ('index/frame', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"index/frame\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1518057962;s:9:\"updatedAt\";i:1518074401;}', '1518057962', '1518074401');
INSERT INTO `yii2_auth_rule` VALUES ('index/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"index/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074401;}', '1484734191', '1518074401');
INSERT INTO `yii2_auth_rule` VALUES ('menu/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074399;}', '1484734191', '1518074399');
INSERT INTO `yii2_auth_rule` VALUES ('menu/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074399;}', '1484734191', '1518074399');
INSERT INTO `yii2_auth_rule` VALUES ('menu/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"menu/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074398;}', '1484734191', '1518074398');
INSERT INTO `yii2_auth_rule` VALUES ('menu/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074399;}', '1484734191', '1518074399');
INSERT INTO `yii2_auth_rule` VALUES ('order/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"order/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1518074401;s:9:\"updatedAt\";i:1518074401;}', '1518074401', '1518074401');
INSERT INTO `yii2_auth_rule` VALUES ('order/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"order/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996186;s:9:\"updatedAt\";i:1518074400;}', '1517996186', '1518074400');
INSERT INTO `yii2_auth_rule` VALUES ('product/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:13:\"product/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996186;s:9:\"updatedAt\";i:1518074400;}', '1517996186', '1518074400');
INSERT INTO `yii2_auth_rule` VALUES ('role/auth', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:9:\"role/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074400;}', '1484734191', '1518074400');
INSERT INTO `yii2_auth_rule` VALUES ('role/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074400;}', '1484734191', '1518074400');
INSERT INTO `yii2_auth_rule` VALUES ('role/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074400;}', '1484734191', '1518074400');
INSERT INTO `yii2_auth_rule` VALUES ('role/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"role/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074399;}', '1484734191', '1518074399');
INSERT INTO `yii2_auth_rule` VALUES ('role/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518074400;}', '1484734191', '1518074400');
INSERT INTO `yii2_auth_rule` VALUES ('servicer/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:14:\"servicer/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996187;s:9:\"updatedAt\";i:1518074401;}', '1517996187', '1518074401');
INSERT INTO `yii2_auth_rule` VALUES ('transator/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"transator/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996187;s:9:\"updatedAt\";i:1518074401;}', '1517996187', '1518074401');

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
) ENGINE=InnoDB AUTO_INCREMENT=52 DEFAULT CHARSET=utf8;

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
INSERT INTO `yii2_menu` VALUES ('50', '38', '增加', 'order/create', '', '1', '1');
INSERT INTO `yii2_menu` VALUES ('51', '48', '左侧菜单', 'index/frame', '', '1', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=2001 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_order
-- ----------------------------
INSERT INTO `yii2_order` VALUES ('1845', '0', '121502847275586872', '1', '1', '2018-01-31', '多边贸易部', '3151', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '浙江省  嘉兴市  桐乡市  高桥镇悦容路288号9栋201单元  314500  \n', '胡奇峰  ', '13372541690', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373478', '1519373478');
INSERT INTO `yii2_order` VALUES ('1846', '0', '114981751275756550', '1', '1', '2018-02-01', 'zzxsherry4869', '3152', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '湖北省  武汉市  汉阳区  江汉二桥街道知音西村74号  430050  ', ' 张爱芳', '15871798508', '', '', null, '', '', '', '', '', '4', '0', '1519373478', '1519373478');
INSERT INTO `yii2_order` VALUES ('1847', '0', '126836412468982711', '1', '2', '2018-02-01', '兔兔小店铺01', '3153', '1', '', '390.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-02', '', '2018-02-05', '', '1', '云南省  昆明市  呈贡区  锦绣园 5组团 18栋  650500    ', '汤师  ', '13987447771', '', '', null, '', '', '', '', '', '4', '0', '1519373478', '1519373478');
INSERT INTO `yii2_order` VALUES ('1848', '0', '121707330254375660', '1', '1', '2018-02-01', 'pfy965790118 ', '3154', '1', '', '268.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-08', '1', '福建省  泉州市  永春县  桃城镇桃东路121号  236200', '  潘凤英 ', '15294509848', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373478', '1519373478');
INSERT INTO `yii2_order` VALUES ('1849', '0', '121675436556258886', '1', '1', '2018-02-01', '艺术人生artlife', '3155', '1', '', '175.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373478', '1519373478');
INSERT INTO `yii2_order` VALUES ('1850', '0', '114964446998855258', '1', '2', '2018-02-01', '可爱惬意 ', '3156', '1', '', '520.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-02', '2018-02-04', '2018-02-05', '2018-02-06', '1', '浙江省  金华市  东阳市  江北街道甘溪西街5号  322100 ', ' 蒋惬惬 ', '13967434574', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519373478', '1519373478');
INSERT INTO `yii2_order` VALUES ('1851', '0', '126915988825585506', '1', '1', '2018-02-01', '毛毛247537337 ', '3157', '1', '', '268.00', '7', '7', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-08', '1', '河南省  南阳市  卧龙区  卧龙岗街道汉江路和车站路交叉口  473003 ', ' 小鑫 ', '18567265090', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373478', '1519373478');
INSERT INTO `yii2_order` VALUES ('1852', '0', '121640719701240698', '1', '2', '2018-02-01', 'beebeefeng89 ', '3158', '1', '', '198.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 370898652@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1853', '0', '121715560805623378 122134331166623378 ', '1', '2', '2018-02-01', '健黑黑的李白白', '3159', '1', '', '520.00', '2', '2', '', '0.00', '0.00', '', '10.00', '0.00', '', '36.00', '0.00', '2018-02-02', '2018-02-02', '2018-02-04', '2018-02-05', '1', '贵州省  贵阳市  观山湖区  林城西路通源沃尔沃4s店  550000   ', '孙永健', '15761609087', '2018-02-08', '', null, '出生日期有误 寄回领馆修改', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1854', '0', '121718836910089875', '1', '1', '2018-02-01', '07八佰拜 ', '3160', '1', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '黑龙江省  哈尔滨市  南岗区  先锋路街道先锋路591号中发郦苑小区、1栋6单元501室  150000  ', ' 张晨蕾', '13796655657', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1855', '0', '121790602531657884', '1', '2', '2018-02-01', 'caboo6 ', '3161', '1', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-06', '1', '湖南省  株洲市  天元区  泰山路街道滨江南路88号蓝盾景园2期21栋2604室  412000  ', '帅莎  ', '13601869229', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1856', '0', '121795726777370771', '1', '1', '2018-02-01', '我是购物狂85', '3162', '1', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-02', '2018-02-04', '2018-02-05', '2018-02-08', '1', '四川省  泸州市  合江县  合江镇人和巷荔香苑格力空调  646200 ', ' 文海鹰 ', '13158602100', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1857', '0', '127030816136083825', '1', '1', '2018-02-01', '日光倾城_00', '3163', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-02', '2018-02-02', '2018-02-04', '2018-02-07', '1', '广东省  清远市  英德市  英城街道和平广场保安室  513000  ', '苏嘉莉  ', '13431990777', '2018-02-08', '', null, '', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1858', '0', '121883982532512999', '1', '1', '2018-02-01', '你的路鸟', '3164', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-02', '2018-02-04', '2018-02-05', '2018-02-08', '1', '广东省  汕头市  潮阳区  谷饶镇大坑村大亨桥旁（弘雅新楼内）晨星针织厂的对面厂楼  515100  ', '张琳 ', '13288007874', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1859', '0', '115030720877321838', '1', '2', '2018-02-01', '过站不停a ', '3165', '1', '', '198.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 1224643589@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1860', '0', '127196578597994222', '1', '1', '2018-02-01', '不该选择沦落 ', '3166', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省  汕头市  潮阳区  谷饶镇华光小学南侧雄盛针织厂  515100', '  张雪霞  ', '13417039753', '', '', null, '', '', '', '', '', '4', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1861', '0', '115045672603943257', '1', '1', '2018-02-01', 'tb2887427_2011 ', '3167', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-02', '2018-02-04', '2018-02-05', '2018-02-08', '1', '广东省 汕头市 潮阳区 贵屿镇南阳西美心之韵隔壁', '依婷', '13592887427', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1862', '0', '127101964221794729', '1', '1', '2018-02-01', '懒猫l2008', '3168', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-08', '1', '重庆  重庆市  江北区  华新街街道金源路55号  400021 ', '刘阳婕', '15683875702', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1863', '0', '127128480199337929', '1', '2', '2018-02-01', 'terminator93 ', '3169', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '2018-02-08', '1', '四川省  成都市  金牛区  金牛区花牌坊街筒车巷29号2栋3单元13号  610000', '华梦', '15281052442', '', '', null, '同黄凌翔 华梦一起寄回', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1864', '0', '127297070913165512 127153232945165512', '1', '2', '2018-02-01', 'maskjane', '3170', '2', '', '175.00', '1', '1', '', '23.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '1351067868@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1865', '0', '127191900831895018', '1', '1', '2018-02-01', 'chjp2046', '3171', '2', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '广东省  深圳市  南山区  南山街道登良路65号荔雅居A4 3D  518052', '陈杰平', '13760456157', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1866', '0', '127447655647406113', '1', '1', '2018-02-01', '球球小妞', '3172', '2', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '江苏省,无锡市,新区,花样年花郡（春阳路与太湖大道交汇处）53幢401室  214000', '邱园园', '15190217852', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1867', '0', '127258541025511615', '1', '2', '2018-02-02', 'hyhls91', '3173', '2', '', '358.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '151479698@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1868', '0', '127275172627178416', '1', '2', '2018-02-02', 'gotodoit', '3174', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-02', '2018-02-02', '2018-02-04', '2018-02-05', '1', '自取', '-', '', '', '', null, '自取', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1869', '0', '115283141881811342', '1', '2', '2018-02-02', '李杰骏', '3175', '2', '', '198.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：maxlijiejun1990@163.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1870', '0', '127276013085265427', '1', '1', '2018-02-02', 'yoyottkl ', '3176', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-08', '1', '河北省  保定市  徐水区  安肃镇迁民庄  072550 ', '李秀丽  ', '13590259636', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1871', '0', '115284820206059437', '1', '1', '2018-02-02', 'tb9609969', '3177', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '海南省,海口市,美兰区,海甸街道海甸岛胜景西路3号花语庭苑A6-108', '陈成', '0898-66259555 18789609969', '2018-02-09', '', null, '与陈成 吴忠军 ', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1872', '0', '122130859861055399', '1', '1', '2018-02-02', 'jmyjn2011', '3178', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-08', '1', '四川省  成都市  邛崃市  四川省成都邛崃市夹关镇大桥街37号  611541 ', '王晓蕾', '13980548102', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1873', '0', '115303973069578843', '1', '1', '2018-02-02', '1panxiaoli', '3179', '2', '', '268.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '1970-01-01', '1', '福建省  福州市  仓山区  城门镇潘墩路105号盛景黄山2#206  350019 ', '潘小丽', '13615040907', '2018-02-12', '', null, '照片不合格，延迟出签', '', '', '', '', '5', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1874', '0', '127451882569868506  127306000155868506', '1', '1', '2018-02-02', 'sylviawang019', '3180', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '出签后确认地址', '-', '', '', '', null, '其他资料在聊天记录', '', '', '', '', '4', '0', '1519373479', '1519373479');
INSERT INTO `yii2_order` VALUES ('1875', '0', '127300149742674624', '1', '2', '2018-02-02', '周子现', '3181', '2', '', '198.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '429272655@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1876', '0', '122248738529220881', '1', '1', '2018-02-02', 'cm19860207 ', '3182', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '湖南省  常德市  澧县  大堰垱镇大堰当中学  415500 ', '周亚军', '18216167152', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1877', '0', '115322900643405159', '1', '2', '2018-02-02', 'huling213420', '3183', '2', '', '198.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：624534875@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1878', '0', '127608179630337120', '1', '2', '2018-02-02', 'liming19850105 ', '3184', '2', '', '520.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-06', '1', '辽宁省  辽阳市  宏伟区  丰德园 2号楼 1组7号  111003 ', '李明', '18698270911  0419-5308288', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1879', '0', '122275700250197269 122217687700197269', '1', '1', '2018-02-02', 'nan1307 ', '3185', '2', '', '218.00', '2', '2', '', '100.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '四川省  遂宁市  船山区  慈音街道德水中路奥城花园4栋1203  629000 ', '杨楠 ', '15683759917', '', '', null, '', '', '', '', '', '4', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1880', '0', '127364213705366104', '1', '1', '2018-02-02', '诸葛0007', '3186', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '浙江省  衢州市  龙游县  詹家镇龙游占家镇新安村95号  324400', ' 诸葛婷', '13456625505', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1881', '0', '122228999046481365', '1', '1', '2018-02-02', '2wwwee', '3187', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '广东省东莞市长安镇锦江花园丽景庭4F 0402 ', '薛志敏', '13533096962', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1882', '0', '115362856021057059 116867044374057059', '1', '2', '2018-02-02', '玲玲7m ', '3188', '2', '', '268.00', '1', '1', '', '252.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-09', '2018-02-11', '', '1', '重庆市南岸区弹子石国际社区 观园一期 3-7-1', '张晓玲 ', '18602376285', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1883', '0', '127373985972811804 127729391748811804', '1', '2', '2018-02-02', 'qst9989', '3189', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-06', '1', '福建省南安市金淘镇海伦箱包厂', '谢瑶地', '13590121799', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1884', '0', '127389104137588619', '1', '1', '2018-02-02', 'june891207 ', '3190', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '湖南省  长沙市  雨花区  雨花亭街道树木岭路兴旺双铁城1栋觅途酒店一楼一页咖啡  410007', '李军', '18674851207', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1885', '0', '122310532676607069', '1', '2', '2018-02-02', '梁晔舒 ', '3191', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-06', '1', '四川省  乐山市  市中区  通江街道市中区龙游路242号1栋1单元7楼2号  614000', '史清  ', '18683315544', '2018-02-07', '', null, '与高山', '', '', '', '', '5', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1886', '0', '115390016578512740', '1', '2', '2018-02-02', '水下期', '3192', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-06', '1', '广东省阳江市阳西县御景湾翠湖峰二街二号之二', '庞基健', '18316154631', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1887', '0', '127418281202700519', '1', '1', '2018-02-02', '英子407', '3193', '1', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-04', '2018-02-06', '2018-02-07', '', '1', '广东省  深圳市  宝安区  大浪街道宝安龙华大浪华昌北路春兴工业园3楼  518000  ', '刘敏 ', '13410123030', '', '', null, '', '', '', '', '', '4', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1888', '0', '127628198432700519', '1', '1', '2018-02-02', '英子407', '3194', '1', '', '268.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '四川省自贡市荣县星河湾18-1-4', '银波 ', '18123099966', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373480', '1519373480');
INSERT INTO `yii2_order` VALUES ('1889', '0', '122375828226263782', '1', '1', '2018-02-02', 'ocean8266 ', '3195', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '江苏省  南京市  秦淮区  瑞金路街道瑞金路6-1号学府瑞苑1-210  000000 ', '唐乃武', '13951811316', '2018-02-09', '', null, '照', '', '', '', '', '5', '0', '1519373526', '1519373526');
INSERT INTO `yii2_order` VALUES ('1890', '0', '128006563591811804', '1', '1', '2018-02-03', 'qst9989 ', '3196', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '2018-02-08', '1', '福建省南安市金淘镇海伦箱包厂   ', '谢龙江 ', '13590121799', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373526', '1519373526');
INSERT INTO `yii2_order` VALUES ('1891', '0', '122582666271108881  122596020586108881   122771723667108881', '1', '1', '2018-02-03', '为啥东东5', '3197', '2', '', '248.00', '4', '4', '', '80.00', '0.00', '', '40.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '广东省珠海市斗门区井岸镇里维埃拉4区52栋602\n', ' 张浩森  ', '13203861555', '2018-02-09', '', null, '资料和照', '', '', '', '', '5', '0', '1519373526', '1519373526');
INSERT INTO `yii2_order` VALUES ('1892', '0', '115605169606934944', '1', '1', '2018-02-03', '陈冲199686', '3198', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '湖北省洪湖市黄家口 自取', '陈冲', '17720363872 \n18235435240 ', '', '', null, '', '', '', '', '', '4', '0', '1519373526', '1519373526');
INSERT INTO `yii2_order` VALUES ('1893', '0', '122628475037284195', '1', '2', '2018-02-03', '软件工程师 ', '3199', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-06', '1', '湖南省  常德市  桃源县  漳江镇伯赞路御景园15栋  000000', '朱文娟', '18507366665', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519373526', '1519373526');
INSERT INTO `yii2_order` VALUES ('1894', '0', '115736685069705432', '1', '1', '2018-02-03', '中华群英会菲律宾分会', '3200', '2', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373526', '1519373526');
INSERT INTO `yii2_order` VALUES ('1895', '0', '122838951460309685', '1', '2', '2018-02-03', '胡芳芳1234567', '3201', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '2018-02-08', '1', '江西省,萍乡市,安源区,金三角博昌家具城对面利得楼小区,,337000', '胡寒芳', '15079952096', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373526', '1519373526');
INSERT INTO `yii2_order` VALUES ('1896', '0', '127997042297868506   127837777147868506', '1', '1', '2018-02-03', 'sylviawang019', '3202', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-04', '2018-02-05', '2018-02-07', '', '1', '出签确认和王婧骅 一起 出签后确认地址', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519373526', '1519373526');
INSERT INTO `yii2_order` VALUES ('1897', '0', '122840853360396791', '1', '1', '2018-02-03', '刘依洋1', '3203', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '地址没确认', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519373526', '1519373526');
INSERT INTO `yii2_order` VALUES ('1898', '0', '122776343217660697', '1', '2', '2018-02-03', '很普通的买家', '3204', '2', '', '198.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：258013531@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373526', '1519373526');
INSERT INTO `yii2_order` VALUES ('1899', '0', '115756032748004634', '1', '1', '2018-02-03', 'vv_v2', '3205', '2', '', '268.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省  潮州市  湘桥区  凤新街道粤潮新园18栋2梯  521000   \n', '小v ', '13433758211', '', '', null, 'heng', '', '', '', '', '4', '0', '1519373526', '1519373526');
INSERT INTO `yii2_order` VALUES ('1900', '0', '122798012467800973', '1', '2', '2018-02-03', '吉小希', '3206', '2', '', '198.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：329292309@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1901', '0', '122729331355827278', '1', '1', '2018-02-03', 'wsq515', '3207', '2', '', '175.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1902', '0', '127889186783832725', '1', '1', '2018-02-03', 'ar_迪77777', '3208', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-08', '1', '广东省  深圳市  宝安区  西乡街道西乡安居家园2栋D单元901  518101  ', '康美迪  ', '15622876956', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1903', '0', '122947617962252376  124200700435252376', '1', '2', '2018-02-04', '我是李富生 ', '3209', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-09', '2018-02-11', '', '1', '河南省,商丘市,睢县,后台乡李庄村73号,476900', '李富生', '18551509972', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1904', '0', '115882032094187147', '1', '1', '2018-02-04', '寒冰神射手23', '3210', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '', '1', '福建省,三明市,沙县,高桥镇安田村33号,365500', '余顺平', '18650977358', '', '', null, '旧签', '', '', '', '', '4', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1905', '0', '128181115323651011', '1', '2', '2018-02-04', 'tg88798879 ', '3211', '1', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1906', '0', '128073146799456127', '1', '2', '2018-02-04', '踏途人生', '3212', '1', '', '520.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '2018-02-08', '1', '广东省  深圳市  南山区  南山区登良路汉京国际13A  518000  ', '王公翠  ', '13480672880', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1907', '0', '122992277888665994', '1', '1', '2018-02-04', '顾红卫3476 ', '3213', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '', '1', '上海市奉贤区奉浦工业园区环城北路1299号            马勒发动机工装设备有限公司,,201400', '王燕庭', '15216779186', '', '', null, '缺照片', '', '', '', '', '4', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1908', '0', '122943783874481365', '1', '1', '2018-02-04', '2wwwee', '3214', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省  佛山市  顺德区  龙江镇南坑村河柏街德门巷11号  528300 ', ' 谭先森 ', '15920702554', '', '', null, '', '', '', '', '', '4', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1909', '0', '122970915665077287', '1', '1', '2018-02-04', 'tb90345608', '3215', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '', '1', ' ', '郑美远  ', '18065011860', '', '', null, '出签后再确认地址', '', '', '', '', '4', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1910', '0', '122992419132432070', '1', '2', '2018-02-04', '飞扬充值服务', '3216', '1', '', '198.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 499083401@qq.com ', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1911', '0', '128269931414493524', '1', '1', '2018-02-04', 'loolivez', '3217', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省,广州市,天河区,车陂街道天河广场天德阁1902,,510510', '周琛', '18681446618', '', '', null, '', '', '', '', '', '4', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1912', '0', '115991512599564047', '1', '1', '2018-02-04', '一一无忧', '3218', '1', '', '268.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省  深圳市  南山区  南山街道桂湾三路龙海家园11栋A1915  518000  ', '刘祎', '15914004235', '', '', null, '', '', '', '', '', '4', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1913', '0', '116000500138527957', '1', '1', '2018-02-04', '或事事通通不过一场梦 ', '3219', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省  茂名市  电白县  水东镇人民路193号盐业公司A栋801房  525000  ', '袁伟辉  ', '15119688730', '', '', null, '', '', '', '', '', '4', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1914', '0', '116092454711704649', '1', '2', '2018-02-04', 'fayesmiling', '3220', '1', '', '198.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '3个人', '', '', '', '', '1', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1915', '0', '116096038090601139  116624343935601139', '1', '2', '2018-02-04', '我的东西到了2000', '3221', '1', '', '268.00', '1', '1', '', '252.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-06', '2018-02-07', '2018-02-11', '', '1', '河南省,信阳市,淮滨县,顺河街道城关镇南大街143-81,,464400', '陈升栋', '13382158803', '', '', null, '', '', '', '', '', '4', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1916', '0', '116105250357352657', '1', '2', '2018-02-04', 'zhuzhexuan920', '3222', '1', '', '198.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1917', '0', '128086500358893622', '1', '1', '2018-02-04', '傻乐高', '3223', '1', '', '268.00', '5', '5', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '广东省,深圳市,宝安区,新安街道创业二路与公园路交叉口勤诚达和园4B栋301,518101', '高峰', '18576428377', '', '', null, '', '', '', '', '', '4', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1918', '0', '123231200299087292', '1', '2', '2018-02-04', 'annebestfriend', '3224', '1', '', '198.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1919', '0', '128397387308758820', '1', '2', '2018-02-04', 'holilly', '3225', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', ',安徽省,合肥市,庐阳区,阿奎利亚城果89栋1401室,230001', '赵云', '17730040982', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1920', '0', '123367393090879567', '1', '1', '2018-02-05', '2252131747哦', '3226', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1921', '0', '127342372766337929', '1', '2', '2018-02-05', 'terminator93 ', '3227', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-05', '2018-02-05', '2018-02-07', '2018-02-08', '1', '四川省  成都市  金牛区  金牛区花牌坊街筒车巷29号2栋3单元13号  610000  ', '华梦 ', '15281052442', '', '', null, '同胡尧 华梦一起寄回', '', '', '', '', '5', '0', '1519373527', '1519373527');
INSERT INTO `yii2_order` VALUES ('1922', '0', '123314780481667166', '1', '1', '2018-02-05', '孔林天', '3228', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '', '1', '江苏省  南京市  高淳区  淳溪镇北漪园9栋3单元104室  211300    ', '孔先生', '13776532162', '', '', null, '', '', '', '', '', '4', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1923', '0', '116161249991209142', '1', '2', '2018-02-05', 'xiecanjian1 ', '3229', '1', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '2018-02-08', '1', '福建省  泉州市  德化县  浔中镇环城东路百德畔山1号 百德畔山1号1栋  000000 ', ' 郑美桂 ', '15159571510', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1924', '0', '116251942737188657', '1', '2', '2018-02-05', 'venusyjw', '3230', '1', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '2018-02-08', '1', '广东省  佛山市  顺德区  乐从镇乐从居委会兴乐路A31号喜联大厦A座伊丽莎白  528300   ', '杨小姐 ', '18823105866', '2018-02-11', '', null, ' 同何就妹一起', '', '', '', '', '5', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1925', '0', '123389764890004987', '1', '2', '2018-02-05', 'wusammi8200 ', '3231', '1', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 184124338@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1926', '0', '123426418212004987', '1', '2', '2018-02-05', 'wusammi8200 ', '3232', '1', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 184124338@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1927', '0', '123448704661956788  123690738946956788', '1', '2', '2018-02-05', 'jms37zdy ', '3233', '1', '', '520.00', '2', '2', '', '0.00', '0.00', '', '20.00', '0.00', '', '0.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '2018-02-08', '1', '福建省  厦门市  思明区  筼筜街道湖滨北路101号商业银行大厦  361001    ', '张丹阳', '15105977747', '2018-02-09', '', null, '照', '', '', '', '', '5', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1928', '0', '116311162518207857', '1', '2', '2018-02-05', 'qiyi123ly ', '3234', '1', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '陕西省  宝鸡市  渭滨区  高新10路宝钛家园小区  721000  ', '刘洋', '15279982012', '', '', null, '年初三出行，珠海代寄', '', '', '', '', '4', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1929', '0', '116329194401785640', '1', '1', '2018-02-05', 'mubenwei', '3235', '1', '', '268.00', '20', '20', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '福建省  厦门市  思明区  云顶中路515号C4-02  361000  ', '颜晓玲  ', '13301272872', '', '', null, '', '', '', '', '', '1', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1930', '0', '123417963163899467', '1', '2', '2018-02-05', 'nbzjlyj', '3236', '2', '', '198.00', '7', '7', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1931', '0', '123521952802812690', '1', '2', '2018-02-05', 'cookleliu', '3237', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '2018-02-08', '1', '广东省  深圳市  宝安区  南航明珠花园2栋2单元14B  518100 ', '刘东海', '13960421999', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1932', '0', '123545782301719260 ', '1', '2', '2018-02-05', 'michelleou2', '3238', '2', '', '520.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '2018-02-08', '1', '广东省  中山市  板芙镇白溪幼儿园  528459 ', '吴钦兰', '13528298535', '', '', null, '同张厚磊一起寄回', '', '', '', '', '5', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1933', '0', '116313177459125756', '1', '2', '2018-02-05', 'wobenjiarend ', '3239', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '北京  北京市  东城区  安定门街道安定门外大街上龙西里42号楼3单元1001  100011', ' 丁家红', '13681513810', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1934', '0', '123642971738055677  123734474977055677', '1', '2', '2018-02-06', 'lyz830520', '3240', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-06', '2018-02-06', '2018-02-07', '2018-02-08', '1', '贵州省  贵阳市  南明区  宝山南路179号幸福家园B栋二单元  550002 ', ' 刘洋溱 ', '18575619797', '2018-02-09', '', null, '', '', '', '', '', '5', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1935', '0', '123618779958384767', '1', '2', '2018-02-06', 'mayluo225', '3241', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '广州市番禺区石碁镇石碁村昌平大街63号', '梁立成', '18028808084', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1936', '0', '128763347624466507  128645942468466507', '1', '2', '2018-02-06', 'majiacai', '3242', '2', '', '248.00', '1', '1', '', '52.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1937', '0', '116446568050013131', '1', '2', '2018-02-06', 'zhangjing582088', '3243', '2', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-08', '2018-02-11', '1', '广东省  深圳市  福田区  福中三路民生金融大厦19楼  518031', '张晶', '15989340303', '2018-02-11', '', null, '14号飞', '', '', '', '', '5', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1938', '0', '128509132806337929', '1', '2', '2018-02-06', 'terminator93 ', '3244', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-08', '2018-02-09', '2018-02-11', '', '1', '', '-', '', '', '', null, '与黄凌翔.胡尧', '', '', '', '', '4', '0', '1519373528', '1519373528');
INSERT INTO `yii2_order` VALUES ('1939', '0', '123705857017719260  123703477692719260', '1', '2', '2018-02-06', 'michelleou2', '3245', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '20.00', '0.00', '', '0.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '', '-', '', '', '', null, '与', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1940', '0', '128691610834555428', '1', '1', '2018-02-06', 'ruochen521521', '3246', '2', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-11', '2018-02-12', '', '1', '云南省  昆明市  五华区  五华区龙泉路沙坝营火电公司38-1-602  650032', '唐宾檐', '15111081679', '', '', null, '', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1941', '0', '116485824647512731', '1', '1', '2018-02-06', 'joko1981', '3247', '2', '', '268.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-11', '2018-02-12', '', '1', '辽宁省  大连市  沙河口区  黑石礁街道软件园数码路1号 8号楼  116021', '王夏利', '18641194925', '', '', null, '', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1942', '0', '123707315931193366 123781512028193366 ', '1', '1', '2018-02-06', 'jason081111 ', '3248', '2', '', '268.00', '2', '2', '', '0.00', '0.00', '', '20.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '重庆  重庆市  江北区  观音桥街道同创国际9栋12楼  400021', '张东旭 ', '13772158580', '', '', null, '资料信息在聊天记录', '', '', '', '', '1', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1943', '0', '116511556678188657', '1', '2', '2018-02-06', 'venusyjw ', '3249', '1', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-08', '2018-02-11', '1', '广东省  佛山市  顺德区  乐从镇乐从居委会兴乐路A31号喜联大厦A座伊丽莎白  528300   ', '杨小姐 ', '18823105866', '2018-02-11', '', null, '7日上午已先寄珠海', '', '', '', '', '5', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1944', '0', '116581194963753537', '1', '1', '2018-02-06', '抗氧化苹果', '3250', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-10', '2018-02-11', '2018-02-12', '', '1', '辽宁省  抚顺市  顺城区  将军堡街道辉南路3-2号楼4单元501  113006', '  石秋华  ', '13504233052', '', '', null, '', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1945', '0', '128863615556597923 128718993957597923', '1', '2', '2018-02-06', '羊鱼鹿小呆', '3251', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '湖南省  衡阳市  耒阳市  蔡子池街道蔡池路电线大楼2单元601室  421800   ', '郑爱平 ', '18973437498', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1946', '0', '128590949719998728', '1', '1', '2018-02-06', 'lvxiuling80848 ', '3252', '1', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-07', '2018-02-11', '2018-02-12', '', '1', '广东省  深圳市  南山区  海德一道中洲控股金额中心B座8M招商证券  518052 ', ' 陈雪桦', '18218080925', '', '', null, '', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1947', '0', '128598341926558001', '1', '1', '2018-02-06', 'rachelhan0813', '3253', '1', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-07', '2018-02-11', '2018-02-12', '', '1', '广东省  深圳市  龙华新区  新区大道潜龙曼海宁南区6栋10C（放门口）  518131  ', '佳佳 ', '13510566206', '', '', null, '', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1948', '0', '128756542755811804', '1', '1', '2018-02-06', 'qst9989', '3254', '1', '', '940.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-11', '2018-02-12', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1949', '0', '123859942840881092 124201372815881092  ', '1', '2', '2018-02-06', '周宇qqq ', '3255', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '10.00', '0.00', '', '13.00', '0.00', '2018-02-07', '2018-02-09', '2018-02-11', '', '1', '广东省  深圳市  宝安区  民治街道万众城生活村14栋2单元  518101 ', ' 周宇  ', '13786632532', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1950', '0', '123910062396570287', '1', '1', '2018-02-06', 'smileecho0801', '3256', '1', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-08', '2018-02-11', '2018-02-12', '', '1', '广东省  深圳市  罗湖区  东门街道东门南路2007号广发大厦4楼招商证券  518002  ', '陈娟  ', '15889660736', '', '', null, '', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1951', '0', '123904124548557690', '1', '2', '2018-02-06', 'troubtimehero', '3257', '1', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1952', '0', '123770145879403168', '1', '1', '2018-02-06', 'zh81721482', '3258', '1', '', '175.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1953', '0', '128706785815705127', '1', '2', '2018-02-07', 'alexnrita2015', '3259', '1', '', '520.00', '3', '3', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '', '-', '', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1954', '0', '128736156681088123', '1', '2', '2018-02-07', 'jackhong728', '3260', '1', '', '520.00', '3', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-04', '2018-02-04', '2018-02-05', '2018-02-06', '1', '广东省  深圳市  龙岗区  坂田街道万科城二区枫湖居A栋架空层丰巢取物柜  518116  ', '彭生  ', '18627070809', '2018-02-07', '', null, '', '', '', '', '', '5', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1955', '0', '124031889554434867', '1', '2', '2018-02-07', 'qiaojingmei', '3261', '1', '', '520.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-07', '2018-02-07', '2018-02-11', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1956', '0', '128831974630241604', '1', '2', '2018-02-07', '墨筱蔓', '3262', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '四川省  绵阳市  涪城区  南山街道长虹大道南段172号126文化创意园内28栋102  621000 ', '吴依蔓', '13981187516', '', '', null, '可以26号晚上出签', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1957', '0', '116655477383726248 116734075789726248', '1', '2', '2018-02-07', 'charlene19901004', '3263', '1', '', '520.00', '1', '1', '', '10.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '福建省  厦门市  思明区  白鹿路65号之三201室  361003 ', ' 梁莹 ', '13696992692', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1958', '0', '128756456921096403', '1', '2', '2018-02-07', 'naonaoxie', '3264', '1', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 287136955@qq.com', '-', '', '', '', null, '先不办理，13号之前确定是吗时', '', '', '', '', '1', '0', '1519373529', '1519373529');
INSERT INTO `yii2_order` VALUES ('1959', '0', '129034247915800508', '1', '2', '2018-02-07', 'destiny丶xl', '3265', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-08', '2018-02-09', '2018-02-11', '', '1', '湖北省  黄冈市  黄梅县  濯港镇夏圩村二组  435500  ', '  夏力', '18680383862', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1960', '0', '129041079161142417', '1', '2', '2018-02-07', '希媛1219', '3266', '1', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 287284627@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1961', '0', '116776830573025037  117032553133025037', '1', '1', '2018-02-07', '溪水旁的树777', '3267', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-10', '2018-02-11', '2018-02-12', '', '1', '北京  北京市  通州区  宋庄镇 大兴艺术区 D制空间  101100', '周迪', '18612306121', '', '', null, '', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1962', '0', '116723965426935341', '1', '2', '2018-02-07', 'cquptssea', '3268', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '广西壮族自治区  来宾市  兴宾区  城北街道盘古大道财富168商住小区B区3号楼3单元4-7  000000', '覃级极', '18878277788', '', '', null, '3.2号出行', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1963', '0', '116712680261237756', '1', '2', '2018-02-07', 'minshuc0610 ', '3269', '2', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：348203083@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1964', '0', '124095254747130773', '1', '2', '2018-02-07', 'lasikaer', '3270', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-10', '2018-02-11', '2018-02-12', '', '1', '', '-', '', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1965', '0', '128819568881055028  129097021868055028', '1', '2', '2018-02-07', 't_1510327021955_0690 ', '3271', '2', '', '520.00', '11', '11', '', '0.00', '-201.00', '', '70.00', '0.00', '', '23.00', '0.00', '2018-02-08', '2018-02-09', '2018-02-11', '', '1', '福建省  泉州市  安溪县  北石安星小区  362400', '陈生 ', '18595568845', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1966', '0', '116751769758602630', '1', '1', '2018-02-07', '爱上你2012', '3272', '2', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-11', '2018-02-12', '', '1', '福建省  厦门市  集美区  后溪镇後溪花園26號樓1802  361021  ', '黄嘉俊', '18922741986', '', '', null, '', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1967', '0', '124119865642731790', '1', '2', '2018-02-07', 'liulihe1981', '3273', '2', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '号回国，9号早上提交', '', '', '', '', '1', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1968', '0', '129099487443612120 128832700938612120', '1', '1', '2018-02-07', '13798592023敏敏', '3274', '2', '', '248.00', '4', '4', '', '80.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-08', '2018-02-11', '2018-02-12', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1969', '0', '124110009451852779', '1', '2', '2018-02-07', '苏墨黎 ', '3275', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-08', '2018-02-09', '2018-02-11', '', '1', '广州市海珠区赤岗街道碧映路金领寓大厦1817', '苏墨黎', '18660920004', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1970', '0', '128838496747811804', '1', '1', '2018-02-07', 'qst9989 ', '3276', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-11', '2018-02-12', '', '1', '', '-', '', '', '', null, '菲律宾卡', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1971', '0', '124134200996652570', '1', '2', '2018-02-07', 'chenqianaou', '3277', '2', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1972', '0', '129244415831356309', '1', '2', '2018-02-08', 'csmmmmm8', '3278', '1', '', '520.00', '2', '2', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-08', '2018-02-09', '2018-02-11', '', '1', '', '-', '', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1973', '0', '124169564430754877', '1', '2', '2018-02-08', '八宝阿姨', '3279', '2', '', '520.00', '2', '2', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '广东省  深圳市  福田区  莲花街道景田 万托家园 10G  518031  ', '张小姐', '18566621791', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1974', '0', '128890268071748428', '1', '1', '2018-02-08', 'tb7240921_2012', '3280', '2', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-10', '2018-02-11', '2018-02-12', '', '1', '浙江省  湖州市  南浔区  南浔镇嘉业路逸龙湾2幢2单元302  313009  ', '杨琪  ', '13216721062', '', '', null, '', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1975', '0', '124225592117036564', '1', '2', '2018-02-08', 'yanhao4269931', '3281', '2', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1976', '0', '124238556906693191', '1', '2', '2018-02-08', 'tb853395764 ', '3282', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '', '-', '', '', '', null, '与杨文颖', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1977', '0', '129187827041668429', '1', '2', '2018-02-08', '小兔的店999 ', '3283', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '广东省  广州市  花都区  新华街道迎宾大道168号宝铼雅居北门门卫收(放速递易就是王八蛋！)  510800 ', ' 罗小姐', '13728026138', '', '', null, '与姚', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1978', '0', '129074342744753220', '1', '1', '2018-02-08', '陆敏慧13861609166 ', '3284', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-11', '2018-02-12', '', '1', '江苏省  无锡市  江阴市  澄江街道朝阳路172号瑞明大厦一楼大厅  214400', '陆敏慧', '13861609166', '', '', null, '', '', '', '', '', '4', '0', '1519373530', '1519373530');
INSERT INTO `yii2_order` VALUES ('1979', '0', '128928488925091226', '1', '2', '2018-02-08', 'anjaylia914', '3285', '2', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', ' 回邮：610875031@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1980', '0', '124185807128555466', '1', '2', '2018-02-08', 'mew16334023', '3286', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '广东省  汕头市  龙湖区  中山东路柏嘉半岛3栋301  515000 ', '谢弋 ', '18666224024', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1981', '0', '128947500017213323', '1', '1', '2018-02-08', '54swsi', '3287', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-10', '2018-02-11', '2018-02-12', '', '1', '浙江省  宁波市  余姚市  阳明街道富巷新村南三166-402  315400 ', ' 施翁双捷', '18868802163', '', '', null, '', '', '', '', '', '4', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1982', '0', '129244863500473027 128976592506473027', '1', '2', '2018-02-08', 'tangjinyexin', '3288', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-09', '2018-02-09', '2018-02-11', '', '1', '江西省  萍乡市  安源区  城郊管委会萍乡中学附近嬷嬷排挡  337000', '汤谨', '18711177206', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1983', '0', '124180879792860674', '1', '2', '2018-02-08', 'tyy19980715', '3289', '2', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-10', '2018-02-11', '2018-02-12', '', '1', '广西壮族自治区  贵港市  港北区  贵城街道贵港市港北区江北大道丰宝小区24栋  537100    ', '谭茵茵', '13878572102', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1984', '0', '117043475802539456', '1', '1', '2018-02-09', 'yyxyzmars', '3290', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '广东省  广州市  黄埔区  红山街道红荔路2号动力大厦B座210室 广东火电环保公司  510700  ', '龙婷', '15011868283', '', '', null, '', '', '', '', '', '4', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1985', '0', '129344123402903713', '1', '1', '2018-02-09', 'ciggeat', '3291', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '湖南省  娄底市  新化县  上梅镇火车站建新路鑫湘园5栋602室  417600  ', '曾杰洪', '13973885097', '', '', null, '', '', '', '', '', '4', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1986', '0', '129228818290795927', '1', '1', '2018-02-09', 'zsyyfj007', '3292', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '北京  北京市  朝阳区  常营镇常营 五里桥一街中弘像素北区5号楼0112室  100011  ', ' 杨镇旭', '18501908857', '', '', null, '', '', '', '', '', '1', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1987', '0', '117068758949995736', '1', '2', '2018-02-09', 'broken_', '3293', '1', '', '520.00', '1', '1', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '湖南省  娄底市  娄星区  长青街道月塘竹林公寓上  417000  ', '陈肇中  ', '17773862039', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1988', '0', '117077942058080459', '1', '1', '2018-02-09', 'tb3439366_2012', '3294', '1', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '山东省  淄博市  张店区  公园街道商场西路北八巷2号楼5单元401  255022  ', '苏一林', '15095168824', '', '', null, '', '', '', '', '', '4', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1989', '0', '129123032194432922', '1', '1', '2018-02-09', 'jyrhy', '3295', '1', '', '268.00', '2', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '贵州省  贵阳市  云岩区  黔灵镇市北路142号贵州省食品药品检验所  550001 ', ' 任慧逸  ', '13518508814', '', '', null, '', '', '', '', '', '4', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1990', '0', '129416587851948307', '1', '2', '2018-02-09', 'eason121068', '3296', '2', '', '520.00', '2', '2', '', '0.00', '-201.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '辽宁省  沈阳市  浑南新区  浑南东路210-20号恒大江湾一期13号楼1-8-2  110000 ', '刘鑫', '13332498112', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1991', '0', '124530766740494697  124773246475494697 ', '1', '2', '2018-02-09', 'ytz0075', '3297', '2', '', '520.00', '2', '2', '', '0.00', '-201.00', '', '10.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '黑龙江省  大庆市  让胡路区  西宾街道奥林国际公寓c10-2-602  163000', '魏安琪', '18145970800', '', '', null, '加急(按正常办理_x000D_)', '', '', '', '', '4', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1992', '0', '124525528481786290', '1', '2', '2018-02-09', '瑜218 ', '3298', '2', '', '248.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：48359707@qq.com', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1993', '0', '117109272449692732', '1', '2', '2018-02-10', 'amazingyoou', '3299', '2', '', '520.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '出签后确认寄回地址', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1994', '0', '129219296982473600', '1', '1', '2018-02-10', '袖舞倾城', '3300', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '出签后确认寄回地址', '-', '', '', '', null, '', '', '', '', '', '1', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1995', '0', '117114060675241442', '1', '1', '2018-02-10', '朱颜记0214', '3301', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '日本東京都豊島区巣鴨5-34-7-410 \n邮编1700002 \n', '朱仁君', '080-4809-2305', '', '', null, '要求寄EMS', '', '', '', '', '1', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1996', '0', '129502239725473600', '1', '1', '2018-02-10', '袖舞倾城', '3302', '2', '', '268.00', '4', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '辽宁省  本溪市  本溪满族自治县  小市镇本溪满族自治县小市镇黄金佳园8号楼1单元701  000000', '刘女士', '13387880988', '', '', null, '', '', '', '', '', '1', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1997', '0', '129378058749753008', '1', '1', '2018-02-10', 'he15836963086', '3303', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '河南省  平顶山市  新华区  中兴路街道河南省平顶山市新华区联盟鑫城小区4号楼305室  467000', ' 何冠伟', '15836963086', '', '', null, '', '', '', '', '', '4', '0', '1519373531', '1519373531');
INSERT INTO `yii2_order` VALUES ('1998', '0', '129231841264106226', '1', '1', '2018-02-10', '温先生_63', '3304', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '广东省  广州市  番禺区  市桥街道禺山大道147号康硕方建材中心2楼大发投资有限公司  000000', '温先生', '13679778679', '', '', null, '', '', '', '', '', '4', '0', '1519373532', '1519373532');
INSERT INTO `yii2_order` VALUES ('1999', '0', '129510919932069413', '1', '1', '2018-02-10', '戴雅瑜 ', '3305', '2', '', '268.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '', '', '', '', '1', '广东省  深圳市  龙岗区  坪地街道坪西香元排10号兴怡康厂  000000 ', '戴雅瑜', '13825284095', '', '', null, '年后确定入境口岸后再寄资料办理', '', '', '', '', '1', '0', '1519373532', '1519373532');
INSERT INTO `yii2_order` VALUES ('2000', '0', '129430642912811804', '1', '1', '2018-02-10', 'qst9989', '3306', '2', '', '268.00', '2', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-11', '2018-02-11', '2018-02-12', '', '1', '', '-', '', '', '', null, '', '', '', '', '', '4', '0', '1519373532', '1519373532');

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
INSERT INTO `yii2_order_to_transactor` VALUES ('1845', '2870');
INSERT INTO `yii2_order_to_transactor` VALUES ('1846', '2871');
INSERT INTO `yii2_order_to_transactor` VALUES ('1847', '2872');
INSERT INTO `yii2_order_to_transactor` VALUES ('1848', '2873');
INSERT INTO `yii2_order_to_transactor` VALUES ('1848', '2874');
INSERT INTO `yii2_order_to_transactor` VALUES ('1848', '2875');
INSERT INTO `yii2_order_to_transactor` VALUES ('1849', '2876');
INSERT INTO `yii2_order_to_transactor` VALUES ('1850', '2877');
INSERT INTO `yii2_order_to_transactor` VALUES ('1850', '2878');
INSERT INTO `yii2_order_to_transactor` VALUES ('1850', '2879');
INSERT INTO `yii2_order_to_transactor` VALUES ('1850', '2880');
INSERT INTO `yii2_order_to_transactor` VALUES ('1851', '2881');
INSERT INTO `yii2_order_to_transactor` VALUES ('1851', '2882');
INSERT INTO `yii2_order_to_transactor` VALUES ('1851', '2883');
INSERT INTO `yii2_order_to_transactor` VALUES ('1851', '2884');
INSERT INTO `yii2_order_to_transactor` VALUES ('1851', '2885');
INSERT INTO `yii2_order_to_transactor` VALUES ('1852', '2886');
INSERT INTO `yii2_order_to_transactor` VALUES ('1852', '2887');
INSERT INTO `yii2_order_to_transactor` VALUES ('1853', '2888');
INSERT INTO `yii2_order_to_transactor` VALUES ('1854', '2889');
INSERT INTO `yii2_order_to_transactor` VALUES ('1854', '2890');
INSERT INTO `yii2_order_to_transactor` VALUES ('1855', '2891');
INSERT INTO `yii2_order_to_transactor` VALUES ('1856', '2892');
INSERT INTO `yii2_order_to_transactor` VALUES ('1856', '2893');
INSERT INTO `yii2_order_to_transactor` VALUES ('1857', '2894');
INSERT INTO `yii2_order_to_transactor` VALUES ('1858', '2895');
INSERT INTO `yii2_order_to_transactor` VALUES ('1859', '2896');
INSERT INTO `yii2_order_to_transactor` VALUES ('1860', '2897');
INSERT INTO `yii2_order_to_transactor` VALUES ('1861', '2898');
INSERT INTO `yii2_order_to_transactor` VALUES ('1862', '2899');
INSERT INTO `yii2_order_to_transactor` VALUES ('1862', '2900');
INSERT INTO `yii2_order_to_transactor` VALUES ('1863', '2901');
INSERT INTO `yii2_order_to_transactor` VALUES ('1864', '2902');
INSERT INTO `yii2_order_to_transactor` VALUES ('1865', '2903');
INSERT INTO `yii2_order_to_transactor` VALUES ('1865', '2904');
INSERT INTO `yii2_order_to_transactor` VALUES ('1866', '2905');
INSERT INTO `yii2_order_to_transactor` VALUES ('1866', '2906');
INSERT INTO `yii2_order_to_transactor` VALUES ('1867', '2907');
INSERT INTO `yii2_order_to_transactor` VALUES ('1868', '2908');
INSERT INTO `yii2_order_to_transactor` VALUES ('1869', '2909');
INSERT INTO `yii2_order_to_transactor` VALUES ('1869', '2910');
INSERT INTO `yii2_order_to_transactor` VALUES ('1869', '2911');
INSERT INTO `yii2_order_to_transactor` VALUES ('1869', '2912');
INSERT INTO `yii2_order_to_transactor` VALUES ('1870', '2913');
INSERT INTO `yii2_order_to_transactor` VALUES ('1870', '2914');
INSERT INTO `yii2_order_to_transactor` VALUES ('1871', '2915');
INSERT INTO `yii2_order_to_transactor` VALUES ('1872', '2914');
INSERT INTO `yii2_order_to_transactor` VALUES ('1872', '2916');
INSERT INTO `yii2_order_to_transactor` VALUES ('1873', '2917');
INSERT INTO `yii2_order_to_transactor` VALUES ('1873', '2918');
INSERT INTO `yii2_order_to_transactor` VALUES ('1873', '2919');
INSERT INTO `yii2_order_to_transactor` VALUES ('1874', '2920');
INSERT INTO `yii2_order_to_transactor` VALUES ('1875', '2921');
INSERT INTO `yii2_order_to_transactor` VALUES ('1876', '2922');
INSERT INTO `yii2_order_to_transactor` VALUES ('1877', '2923');
INSERT INTO `yii2_order_to_transactor` VALUES ('1878', '2924');
INSERT INTO `yii2_order_to_transactor` VALUES ('1878', '2925');
INSERT INTO `yii2_order_to_transactor` VALUES ('1878', '2926');
INSERT INTO `yii2_order_to_transactor` VALUES ('1879', '2927');
INSERT INTO `yii2_order_to_transactor` VALUES ('1879', '2928');
INSERT INTO `yii2_order_to_transactor` VALUES ('1880', '2914');
INSERT INTO `yii2_order_to_transactor` VALUES ('1880', '2929');
INSERT INTO `yii2_order_to_transactor` VALUES ('1881', '2930');
INSERT INTO `yii2_order_to_transactor` VALUES ('1882', '2931');
INSERT INTO `yii2_order_to_transactor` VALUES ('1883', '2932');
INSERT INTO `yii2_order_to_transactor` VALUES ('1884', '2933');
INSERT INTO `yii2_order_to_transactor` VALUES ('1885', '2934');
INSERT INTO `yii2_order_to_transactor` VALUES ('1886', '2935');
INSERT INTO `yii2_order_to_transactor` VALUES ('1887', '2936');
INSERT INTO `yii2_order_to_transactor` VALUES ('1887', '2937');
INSERT INTO `yii2_order_to_transactor` VALUES ('1888', '2938');
INSERT INTO `yii2_order_to_transactor` VALUES ('1888', '2939');
INSERT INTO `yii2_order_to_transactor` VALUES ('1888', '2940');
INSERT INTO `yii2_order_to_transactor` VALUES ('1889', '2941');
INSERT INTO `yii2_order_to_transactor` VALUES ('1890', '2942');
INSERT INTO `yii2_order_to_transactor` VALUES ('1891', '2943');
INSERT INTO `yii2_order_to_transactor` VALUES ('1891', '2944');
INSERT INTO `yii2_order_to_transactor` VALUES ('1891', '2945');
INSERT INTO `yii2_order_to_transactor` VALUES ('1891', '2946');
INSERT INTO `yii2_order_to_transactor` VALUES ('1892', '2947');
INSERT INTO `yii2_order_to_transactor` VALUES ('1893', '2914');
INSERT INTO `yii2_order_to_transactor` VALUES ('1893', '2948');
INSERT INTO `yii2_order_to_transactor` VALUES ('1894', '2949');
INSERT INTO `yii2_order_to_transactor` VALUES ('1895', '2950');
INSERT INTO `yii2_order_to_transactor` VALUES ('1896', '2951');
INSERT INTO `yii2_order_to_transactor` VALUES ('1897', '2952');
INSERT INTO `yii2_order_to_transactor` VALUES ('1898', '2953');
INSERT INTO `yii2_order_to_transactor` VALUES ('1898', '2954');
INSERT INTO `yii2_order_to_transactor` VALUES ('1899', '2955');
INSERT INTO `yii2_order_to_transactor` VALUES ('1899', '2956');
INSERT INTO `yii2_order_to_transactor` VALUES ('1900', '2957');
INSERT INTO `yii2_order_to_transactor` VALUES ('1900', '2958');
INSERT INTO `yii2_order_to_transactor` VALUES ('1901', '2959');
INSERT INTO `yii2_order_to_transactor` VALUES ('1902', '2960');
INSERT INTO `yii2_order_to_transactor` VALUES ('1903', '2961');
INSERT INTO `yii2_order_to_transactor` VALUES ('1904', '2962');
INSERT INTO `yii2_order_to_transactor` VALUES ('1905', '2963');
INSERT INTO `yii2_order_to_transactor` VALUES ('1905', '2964');
INSERT INTO `yii2_order_to_transactor` VALUES ('1906', '2965');
INSERT INTO `yii2_order_to_transactor` VALUES ('1906', '2966');
INSERT INTO `yii2_order_to_transactor` VALUES ('1907', '2967');
INSERT INTO `yii2_order_to_transactor` VALUES ('1908', '2968');
INSERT INTO `yii2_order_to_transactor` VALUES ('1909', '2969');
INSERT INTO `yii2_order_to_transactor` VALUES ('1910', '2970');
INSERT INTO `yii2_order_to_transactor` VALUES ('1910', '2971');
INSERT INTO `yii2_order_to_transactor` VALUES ('1910', '2972');
INSERT INTO `yii2_order_to_transactor` VALUES ('1911', '2973');
INSERT INTO `yii2_order_to_transactor` VALUES ('1911', '2974');
INSERT INTO `yii2_order_to_transactor` VALUES ('1912', '2975');
INSERT INTO `yii2_order_to_transactor` VALUES ('1912', '2976');
INSERT INTO `yii2_order_to_transactor` VALUES ('1912', '2977');
INSERT INTO `yii2_order_to_transactor` VALUES ('1913', '2978');
INSERT INTO `yii2_order_to_transactor` VALUES ('1914', '2979');
INSERT INTO `yii2_order_to_transactor` VALUES ('1915', '2980');
INSERT INTO `yii2_order_to_transactor` VALUES ('1916', '2876');
INSERT INTO `yii2_order_to_transactor` VALUES ('1917', '2981');
INSERT INTO `yii2_order_to_transactor` VALUES ('1917', '2982');
INSERT INTO `yii2_order_to_transactor` VALUES ('1917', '2983');
INSERT INTO `yii2_order_to_transactor` VALUES ('1917', '2984');
INSERT INTO `yii2_order_to_transactor` VALUES ('1917', '2985');
INSERT INTO `yii2_order_to_transactor` VALUES ('1918', '2876');
INSERT INTO `yii2_order_to_transactor` VALUES ('1919', '2986');
INSERT INTO `yii2_order_to_transactor` VALUES ('1920', '2987');
INSERT INTO `yii2_order_to_transactor` VALUES ('1921', '2988');
INSERT INTO `yii2_order_to_transactor` VALUES ('1922', '2989');
INSERT INTO `yii2_order_to_transactor` VALUES ('1923', '2990');
INSERT INTO `yii2_order_to_transactor` VALUES ('1924', '2991');
INSERT INTO `yii2_order_to_transactor` VALUES ('1925', '2992');
INSERT INTO `yii2_order_to_transactor` VALUES ('1926', '2993');
INSERT INTO `yii2_order_to_transactor` VALUES ('1927', '2994');
INSERT INTO `yii2_order_to_transactor` VALUES ('1927', '2995');
INSERT INTO `yii2_order_to_transactor` VALUES ('1927', '2996');
INSERT INTO `yii2_order_to_transactor` VALUES ('1928', '2997');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '2998');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '2999');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3000');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3001');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3002');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3003');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3004');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3005');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3006');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3007');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3008');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3009');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3010');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3011');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3012');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3013');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3014');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3015');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3016');
INSERT INTO `yii2_order_to_transactor` VALUES ('1929', '3017');
INSERT INTO `yii2_order_to_transactor` VALUES ('1930', '3018');
INSERT INTO `yii2_order_to_transactor` VALUES ('1930', '3019');
INSERT INTO `yii2_order_to_transactor` VALUES ('1930', '3020');
INSERT INTO `yii2_order_to_transactor` VALUES ('1930', '3021');
INSERT INTO `yii2_order_to_transactor` VALUES ('1930', '3022');
INSERT INTO `yii2_order_to_transactor` VALUES ('1930', '3023');
INSERT INTO `yii2_order_to_transactor` VALUES ('1931', '2914');
INSERT INTO `yii2_order_to_transactor` VALUES ('1931', '3024');
INSERT INTO `yii2_order_to_transactor` VALUES ('1932', '3025');
INSERT INTO `yii2_order_to_transactor` VALUES ('1932', '3026');
INSERT INTO `yii2_order_to_transactor` VALUES ('1933', '3027');
INSERT INTO `yii2_order_to_transactor` VALUES ('1934', '3028');
INSERT INTO `yii2_order_to_transactor` VALUES ('1935', '3029');
INSERT INTO `yii2_order_to_transactor` VALUES ('1936', '3030');
INSERT INTO `yii2_order_to_transactor` VALUES ('1937', '3031');
INSERT INTO `yii2_order_to_transactor` VALUES ('1938', '3032');
INSERT INTO `yii2_order_to_transactor` VALUES ('1939', '3033');
INSERT INTO `yii2_order_to_transactor` VALUES ('1940', '3034');
INSERT INTO `yii2_order_to_transactor` VALUES ('1941', '3035');
INSERT INTO `yii2_order_to_transactor` VALUES ('1941', '3036');
INSERT INTO `yii2_order_to_transactor` VALUES ('1941', '3037');
INSERT INTO `yii2_order_to_transactor` VALUES ('1941', '3038');
INSERT INTO `yii2_order_to_transactor` VALUES ('1942', '3039');
INSERT INTO `yii2_order_to_transactor` VALUES ('1942', '3040');
INSERT INTO `yii2_order_to_transactor` VALUES ('1943', '3041');
INSERT INTO `yii2_order_to_transactor` VALUES ('1943', '3042');
INSERT INTO `yii2_order_to_transactor` VALUES ('1943', '3043');
INSERT INTO `yii2_order_to_transactor` VALUES ('1944', '3044');
INSERT INTO `yii2_order_to_transactor` VALUES ('1945', '3045');
INSERT INTO `yii2_order_to_transactor` VALUES ('1946', '3046');
INSERT INTO `yii2_order_to_transactor` VALUES ('1946', '3047');
INSERT INTO `yii2_order_to_transactor` VALUES ('1947', '3048');
INSERT INTO `yii2_order_to_transactor` VALUES ('1947', '3049');
INSERT INTO `yii2_order_to_transactor` VALUES ('1948', '3050');
INSERT INTO `yii2_order_to_transactor` VALUES ('1949', '3051');
INSERT INTO `yii2_order_to_transactor` VALUES ('1950', '3052');
INSERT INTO `yii2_order_to_transactor` VALUES ('1950', '3053');
INSERT INTO `yii2_order_to_transactor` VALUES ('1951', '3054');
INSERT INTO `yii2_order_to_transactor` VALUES ('1951', '3055');
INSERT INTO `yii2_order_to_transactor` VALUES ('1952', '2876');
INSERT INTO `yii2_order_to_transactor` VALUES ('1953', '3056');
INSERT INTO `yii2_order_to_transactor` VALUES ('1953', '3057');
INSERT INTO `yii2_order_to_transactor` VALUES ('1953', '3058');
INSERT INTO `yii2_order_to_transactor` VALUES ('1954', '3059');
INSERT INTO `yii2_order_to_transactor` VALUES ('1954', '3060');
INSERT INTO `yii2_order_to_transactor` VALUES ('1954', '3061');
INSERT INTO `yii2_order_to_transactor` VALUES ('1955', '3062');
INSERT INTO `yii2_order_to_transactor` VALUES ('1956', '3063');
INSERT INTO `yii2_order_to_transactor` VALUES ('1957', '3064');
INSERT INTO `yii2_order_to_transactor` VALUES ('1958', '3065');
INSERT INTO `yii2_order_to_transactor` VALUES ('1958', '3066');
INSERT INTO `yii2_order_to_transactor` VALUES ('1959', '2974');
INSERT INTO `yii2_order_to_transactor` VALUES ('1959', '3067');
INSERT INTO `yii2_order_to_transactor` VALUES ('1960', '3068');
INSERT INTO `yii2_order_to_transactor` VALUES ('1961', '3069');
INSERT INTO `yii2_order_to_transactor` VALUES ('1961', '3070');
INSERT INTO `yii2_order_to_transactor` VALUES ('1962', '3071');
INSERT INTO `yii2_order_to_transactor` VALUES ('1963', '3072');
INSERT INTO `yii2_order_to_transactor` VALUES ('1964', '3073');
INSERT INTO `yii2_order_to_transactor` VALUES ('1965', '3074');
INSERT INTO `yii2_order_to_transactor` VALUES ('1965', '3075');
INSERT INTO `yii2_order_to_transactor` VALUES ('1965', '3076');
INSERT INTO `yii2_order_to_transactor` VALUES ('1965', '3077');
INSERT INTO `yii2_order_to_transactor` VALUES ('1965', '3078');
INSERT INTO `yii2_order_to_transactor` VALUES ('1965', '3079');
INSERT INTO `yii2_order_to_transactor` VALUES ('1965', '3080');
INSERT INTO `yii2_order_to_transactor` VALUES ('1965', '3081');
INSERT INTO `yii2_order_to_transactor` VALUES ('1965', '3082');
INSERT INTO `yii2_order_to_transactor` VALUES ('1965', '3083');
INSERT INTO `yii2_order_to_transactor` VALUES ('1965', '3084');
INSERT INTO `yii2_order_to_transactor` VALUES ('1966', '3085');
INSERT INTO `yii2_order_to_transactor` VALUES ('1967', '3086');
INSERT INTO `yii2_order_to_transactor` VALUES ('1968', '3087');
INSERT INTO `yii2_order_to_transactor` VALUES ('1968', '3088');
INSERT INTO `yii2_order_to_transactor` VALUES ('1968', '3089');
INSERT INTO `yii2_order_to_transactor` VALUES ('1969', '3090');
INSERT INTO `yii2_order_to_transactor` VALUES ('1970', '3091');
INSERT INTO `yii2_order_to_transactor` VALUES ('1971', '3092');
INSERT INTO `yii2_order_to_transactor` VALUES ('1971', '3093');
INSERT INTO `yii2_order_to_transactor` VALUES ('1972', '3094');
INSERT INTO `yii2_order_to_transactor` VALUES ('1972', '3095');
INSERT INTO `yii2_order_to_transactor` VALUES ('1973', '3096');
INSERT INTO `yii2_order_to_transactor` VALUES ('1973', '3097');
INSERT INTO `yii2_order_to_transactor` VALUES ('1973', '3098');
INSERT INTO `yii2_order_to_transactor` VALUES ('1974', '3099');
INSERT INTO `yii2_order_to_transactor` VALUES ('1974', '3100');
INSERT INTO `yii2_order_to_transactor` VALUES ('1975', '3101');
INSERT INTO `yii2_order_to_transactor` VALUES ('1976', '3102');
INSERT INTO `yii2_order_to_transactor` VALUES ('1977', '3103');
INSERT INTO `yii2_order_to_transactor` VALUES ('1978', '3104');
INSERT INTO `yii2_order_to_transactor` VALUES ('1979', '3105');
INSERT INTO `yii2_order_to_transactor` VALUES ('1979', '3106');
INSERT INTO `yii2_order_to_transactor` VALUES ('1980', '3107');
INSERT INTO `yii2_order_to_transactor` VALUES ('1981', '3108');
INSERT INTO `yii2_order_to_transactor` VALUES ('1982', '3109');
INSERT INTO `yii2_order_to_transactor` VALUES ('1983', '3110');
INSERT INTO `yii2_order_to_transactor` VALUES ('1983', '3111');
INSERT INTO `yii2_order_to_transactor` VALUES ('1984', '3112');
INSERT INTO `yii2_order_to_transactor` VALUES ('1985', '3113');
INSERT INTO `yii2_order_to_transactor` VALUES ('1986', '3114');
INSERT INTO `yii2_order_to_transactor` VALUES ('1987', '3115');
INSERT INTO `yii2_order_to_transactor` VALUES ('1988', '3116');
INSERT INTO `yii2_order_to_transactor` VALUES ('1989', '2914');
INSERT INTO `yii2_order_to_transactor` VALUES ('1989', '3117');
INSERT INTO `yii2_order_to_transactor` VALUES ('1990', '2914');
INSERT INTO `yii2_order_to_transactor` VALUES ('1990', '3118');
INSERT INTO `yii2_order_to_transactor` VALUES ('1990', '3119');
INSERT INTO `yii2_order_to_transactor` VALUES ('1991', '3120');
INSERT INTO `yii2_order_to_transactor` VALUES ('1991', '3121');
INSERT INTO `yii2_order_to_transactor` VALUES ('1992', '3122');
INSERT INTO `yii2_order_to_transactor` VALUES ('1993', '3123');
INSERT INTO `yii2_order_to_transactor` VALUES ('1993', '3124');
INSERT INTO `yii2_order_to_transactor` VALUES ('1994', '3125');
INSERT INTO `yii2_order_to_transactor` VALUES ('1995', '3126');
INSERT INTO `yii2_order_to_transactor` VALUES ('1996', '3127');
INSERT INTO `yii2_order_to_transactor` VALUES ('1996', '3128');
INSERT INTO `yii2_order_to_transactor` VALUES ('1996', '3129');
INSERT INTO `yii2_order_to_transactor` VALUES ('1996', '3130');
INSERT INTO `yii2_order_to_transactor` VALUES ('1997', '3131');
INSERT INTO `yii2_order_to_transactor` VALUES ('1998', '3132');
INSERT INTO `yii2_order_to_transactor` VALUES ('1999', '3133');
INSERT INTO `yii2_order_to_transactor` VALUES ('2000', '3134');
INSERT INTO `yii2_order_to_transactor` VALUES ('2000', '3135');

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
INSERT INTO `yii2_session` VALUES ('906ihehl3vsha2a1u11n08k3b0', '1517902614', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('b8he02s77ngjlsckbf4fsvd057', '1519374993', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('bbrvi08q3hcbejm44o1b071lj3', '1518001454', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2234223B);
INSERT INTO `yii2_session` VALUES ('pmvcgqemjqn7r5k5p37sp7fjg6', '1517828420', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);

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
) ENGINE=MyISAM AUTO_INCREMENT=3307 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_snapshot
-- ----------------------------
INSERT INTO `yii2_snapshot` VALUES ('3151', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3152', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3153', '390/4天', '290.000', '1', '2', '0', '1', '马来西亚-30天贴纸签', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3154', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3155', '175/3天', '160.000', '1', '1', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3156', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3157', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3158', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3159', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3160', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3161', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3162', '248/8天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3163', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3164', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3165', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3166', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3167', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3168', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3169', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3170', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3171', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3172', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3173', '358/3小时', '242.000', '1', '2', '0', '1', '柬埔寨电子签', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3174', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3175', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3176', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3177', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3178', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3179', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3180', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3181', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3182', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3183', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3184', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3185', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3186', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3187', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3188', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3189', '520/3天', '200.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3190', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3191', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3192', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3193', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3194', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3195', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3196', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3197', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3198', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3199', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3200', '248/8天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3201', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3202', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3203', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3204', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3205', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3206', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3207', '175/3天', '160.000', '1', '1', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3208', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3209', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3210', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3211', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3212', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3213', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3214', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3215', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3216', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3217', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3218', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3219', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3220', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3221', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3222', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3223', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3224', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3225', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3226', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3227', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3228', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3229', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3230', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3231', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3232', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3233', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3234', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3235', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3236', '198/1天', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3237', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3238', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3239', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3240', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3241', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3242', '300/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3243', '520/3天', '200.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3244', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3245', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3246', '248/8天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3247', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3248', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3249', '520/3天', '200.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3250', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3251', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3252', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3253', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3254', '940/7天', '550.000', '1', '1', '0', '1', '菲律宾三个月多次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3255', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3256', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3257', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3258', '175/3天', '160.000', '1', '1', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3259', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3260', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3261', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3262', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3263', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3264', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3265', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3266', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3267', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3268', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3269', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3270', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3271', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3272', '248/8天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3273', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3274', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3275', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3276', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3277', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3278', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3279', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3280', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3281', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3282', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3283', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3284', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3285', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3286', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3287', '268/5天', '268.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3288', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3289', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3290', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3291', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3292', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3293', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3294', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3295', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3296', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3297', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3298', '248/3小时', '160.000', '1', '2', '0', '1', '马来西亚-15天ENTRI', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3299', '520/3天', '401.000', '1', '2', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3300', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3301', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3302', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3303', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3304', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3305', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3306', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');

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
) ENGINE=InnoDB AUTO_INCREMENT=3136 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_transator
-- ----------------------------
INSERT INTO `yii2_transator` VALUES ('2870', '俞嘉祎', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2871', '闸志欣', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2872', '汤委静', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2873', '潘凤英', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2874', '林松平', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2875', '林滨蔚', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2876', '未知名', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2877', '王洁琼', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2878', '陈凯', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2879', '陈韵如', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2880', '陈美如', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2881', '赵春旭', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2882', '赵宁', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2883', '邢阳涛', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2884', '宋伟                    马学鹏', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2885', '肖震 谢春奇', '1', '', '', '', '0', '1519459878', '0', '');
INSERT INTO `yii2_transator` VALUES ('2886', '冯靖怡', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2887', '李德贤', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2888', '李丽君', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2889', '张晨蕾', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2890', '刘姿辰', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2891', '帅莎', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2892', '文杨', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2893', '卡利博', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2894', '苏嘉莉', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2895', '张琳烨', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2896', '王晓燕', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2897', '张雪霞', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2898', '郭依婷', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2899', '刘阳婕', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2900', '宿务入境', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2901', '胡尧', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2902', '周尤加', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2903', '陈杰平', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2904', '余晓琪', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2905', '王烨微', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2906', '邱园园', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2907', '黄永恒', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2908', '蔡朝海', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2909', '李强', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2910', '刘平', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2911', '李杰骏', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2912', '郭思含', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2913', '李秀丽', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2914', '马尼拉入境', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2915', '李冠五', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2916', '王晓蕾', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2917', '潘小丽', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2918', '潘彬彬', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2919', '潘自华                               黄学英', '1', '', '', '', '0', '1519459879', '0', '');
INSERT INTO `yii2_transator` VALUES ('2920', '王婧骅', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2921', '周子现', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2922', '曹铭', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2923', '胡玲', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2924', '李明', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2925', '赵虎', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2926', '沈天岩', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2927', '杨楠', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2928', '刘沐一', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2929', '诸葛敏', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2930', '薛志敏', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2931', '张晓玲', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2932', '谢瑶地', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2933', '李军', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2934', '黄勇宣', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2935', '庞基健', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2936', '刘敏', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2937', '张英', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2938', '银波', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2939', '段沣妹', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2940', '张莉', '1', '', '', '', '0', '1519459880', '0', '');
INSERT INTO `yii2_transator` VALUES ('2941', '唐乃武', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2942', '谢龙江', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2943', '米静波', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2944', '张浩森', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2945', '王首相', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2946', '蔡宇生', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2947', '陈冲', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2948', '朱强', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2949', '万成', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2950', '胡寒芳', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2951', '刘春兰', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2952', '刘一洋', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2953', '余婧', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2954', '杨科鹏', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2955', '郑微微', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2956', '林珩', '1', '', '', '', '0', '1519459926', '0', '');
INSERT INTO `yii2_transator` VALUES ('2957', '普云雪', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2958', '董禹希', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2959', '丛麒', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2960', '康美迪', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2961', '李富生', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2962', '余顺平', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2963', '熊火妹', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2964', '陶家保', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2965', '闫焕焕', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2966', '王公翠', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2967', '蔡恒开', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2968', '谭锦光', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2969', '郑美远', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2970', '胡飞江', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2971', '杨栋', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2972', '陈睿', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2973', '曾志林', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2974', '马尼拉', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2975', '刘祎', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2976', '张屳哲', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2977', '刘君山', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2978', '袁伟辉', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2979', '方芳', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2980', '陈升栋', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2981', '高峰', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2982', '张志宇', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2983', '高芃颜', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2984', '高源', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2985', '高心语', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2986', '赵云', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2987', '陈庆谏', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2988', '黄凌翔', '1', '', '', '', '0', '1519459927', '0', '');
INSERT INTO `yii2_transator` VALUES ('2989', '孔雪莲', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('2990', '郑美桂', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('2991', '杨静文', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('2992', '林文斌', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('2993', '林圣晔', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('2994', '管宇欣', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('2995', '张艳华', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('2996', '出签到付', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('2997', '刘洋', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('2998', '陈芸', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('2999', '李响', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3000', '李晨', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3001', '洪溯', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3002', '黄锦洲', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3003', '林宣祯', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3004', '林智强', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3005', '张慧琼', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3006', '林以昕', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3007', '陈玉琴', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3008', '杨玉洁', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3009', '陈美娇', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3010', '潘灿强', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3011', '陈伟锋', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3012', '韩倩', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3013', '颜晓玲', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3014', '李蔚然', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3015', '林若晴', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3016', '林宗英', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3017', '黄文宽', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3018', '安良惠', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3019', '刘萍', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3020', '陈培恩', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3021', '毛乾华', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3022', '凌永军', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3023', '朱艳萍', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3024', '刘东海', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3025', '周武佳', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3026', '晏旭', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3027', '丁家仁', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3028', '刘洋溱', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3029', '梁立成', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3030', '马来15天改错', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3031', '张晶', '1', '', '', '', '0', '1519459928', '0', '');
INSERT INTO `yii2_transator` VALUES ('3032', '华梦', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3033', '张厚磊', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3034', '唐宾檐', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3035', '马清', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3036', '杨春艳', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3037', '杨悦', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3038', '张童     马尼拉入境', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3039', '张东旭', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3040', '牛芳', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3041', '何就妹', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3042', '（和杨静文）', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3043', '11号未出签珠海自取', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3044', '訾爽', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3045', '杨芸潞', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3046', '陈雪桦', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3047', '王梓宇', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3048', '韩瑞佳', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3049', '郭思聪', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3050', '黄辛福', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3051', '周宇', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3052', '陈娟', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3053', '何晓佳', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3054', '李谦', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3055', '梁世豪', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3056', '葛航宇', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3057', '平娜娜', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3058', '葛锦瑜', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3059', '彭跃华', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3060', '彭娅鸿', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3061', '彭子钰', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3062', '乔金辉', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3063', '程诗晓', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3064', '吴厦妹', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3065', '谢常圣', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3066', '刘宏峰', '1', '', '', '', '0', '1519459929', '0', '');
INSERT INTO `yii2_transator` VALUES ('3067', '夏力', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3068', '周媛', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3069', '周迪  马尼拉', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3070', '个人信息在聊天记录', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3071', '覃级极', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3072', '陈淑敏', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3073', '黄涛', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3074', '王财宝', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3075', '王海滨', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3076', '黄道忠', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3077', '黄道席', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3078', '何学清', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3079', '刘坤广', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3080', '严根洪', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3081', '黄长林', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3082', '刘贤广', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3083', '黄圣辉', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3084', '黄书平', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3085', '黄嘉俊、周蓉', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3086', '毕可玲', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3087', '王博', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3088', '耿君伟 李涵江', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3089', '吴程辉', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3090', '周萍', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3091', '李志荣', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3092', '张其林', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3093', '唐锦涛', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3094', '骆美芸', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3095', '林心韵', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3096', '那莹莹', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3097', '张明', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3098', '克拉克入境', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3099', '杨琪', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3100', '朱洪亮', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3101', '闫昊', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3102', '姚思宇', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3103', '杨文颖', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3104', '黄磊', '1', '', '', '', '0', '1519459930', '0', '');
INSERT INTO `yii2_transator` VALUES ('3105', '苏培根', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3106', '区嘉怡', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3107', '谢弋', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3108', '施翁双捷', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3109', '汤谨', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3110', '谭茵茵', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3111', '26号出签', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3112', '龙祺', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3113', '曾杰洪', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3114', '杨镇旭', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3115', '刘宇辰', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3116', '苏一林', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3117', '金贻、任慧逸', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3118', '刘鑫', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3119', '褚晓君', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3120', '魏安琪', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3121', '杨天卓', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3122', '夏瑜', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3123', '尤程', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3124', '朱秀清', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3125', '张玉辉', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3126', '朱仁君', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3127', '姚福军', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3128', '谢智国', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3129', '赵丰', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3130', '刘伟斌', '1', '', '', '', '0', '1519459931', '0', '');
INSERT INTO `yii2_transator` VALUES ('3131', '何冠伟', '1', '', '', '', '0', '1519459932', '0', '');
INSERT INTO `yii2_transator` VALUES ('3132', '温炳发', '1', '', '', '', '0', '1519459932', '0', '');
INSERT INTO `yii2_transator` VALUES ('3133', '戴雅瑜', '1', '', '', '', '0', '1519459932', '0', '');
INSERT INTO `yii2_transator` VALUES ('3134', '廖玉卿', '1', '', '', '', '0', '1519459932', '0', '');
INSERT INTO `yii2_transator` VALUES ('3135', '谢志火', '1', '', '', '', '0', '1519459932', '0', '');

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
