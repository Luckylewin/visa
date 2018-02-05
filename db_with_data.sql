/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : visa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-02-05 15:31:12
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
INSERT INTO `yii2_admin` VALUES ('1', 'admin', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i', '771405950@qq.com', '2130706433', '1517625206', '2147483647', '1', '1482305564', '1517625206');
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
  `order_date` char(10) NOT NULL COMMENT '订单日期',
  `customer_id` varchar(100) NOT NULL COMMENT '客户id',
  `combo_id` int(11) NOT NULL COMMENT '套餐id',
  `custom_servicer_id` smallint(6) NOT NULL COMMENT '客服id',
  `transactor_name` varchar(50) NOT NULL COMMENT '办理人名称',
  `single_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单项实收金额',
  `total_person` smallint(5) NOT NULL DEFAULT '0' COMMENT '人数',
  `balance_order` varchar(64) NOT NULL DEFAULT '0.00' COMMENT '补差订单号',
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
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_order
-- ----------------------------
INSERT INTO `yii2_order` VALUES ('41', '67639', '114981751275756550', '1', '1', '2018-02-01', 'zzxsherry4869', '99', '1', '', '268.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '湖北省  武汉市  汉阳区  江汉二桥街道知音西村74号', '张爱芳', '15871798508', '', '', '', '', '', '', '', '', '1', '0', '1517628931', '1517628931');
INSERT INTO `yii2_order` VALUES ('42', '67644', '126836412468982711', '1', '2', '2018-02-01', '兔兔小店铺01', '118', '1', '', '390.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '23.00', '2018-02-02', '2018-02-05', '2018-02-05', '', '1', '云南省  昆明市  呈贡区  锦绣园 5组团 18栋', '汤师', '13987447771', '', '', '', '', '', '', '', '', '4', '0', '1517629145', '1517629145');
INSERT INTO `yii2_order` VALUES ('43', '67639', '121707330254375660', '1', '1', '2018-02-01', 'pfy965790118 ', '99', '1', '', '268.00', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '福建省  泉州市  永春县  桃城镇桃东路121号', '潘凤英', '15294509848', '', '', '', '', '', '', '', '', '1', '0', '1517629249', '1517629249');
INSERT INTO `yii2_order` VALUES ('44', '67642', '121675436556258886', '1', '1', '2018-02-01', '艺术人生artlife', '80', '1', '', '175.00', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '0', '1517629326', '1517629326');
INSERT INTO `yii2_order` VALUES ('45', '67639', '114964446998855258', '1', '2', '2018-02-01', '可爱惬意', '100', '1', '', '520.00', '4', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-02', '', '', '', '1', '浙江省  金华市  东阳市  江北街道甘溪西街5号  322100 ', '蒋惬惬', '13967434574', '', '', '', '', '', '', '', '', '2', '0', '1517629506', '1517629506');
INSERT INTO `yii2_order` VALUES ('46', '67639', '126915988825585506', '1', '1', '2018-02-01', '毛毛247537337', '99', '1', '', '268.00', '7', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '', '1', '河南省  南阳市  卧龙区  卧龙岗街道汉江路和车站路交叉口', '小鑫', '18567265090', '', '', '', '', '', '', '', '', '4', '0', '1517629689', '1517629689');
INSERT INTO `yii2_order` VALUES ('47', '67642', '121640719701240698', '1', '2', '2018-02-01', 'beebeefeng89', '81', '1', '', '198.00', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 370898652@qq.com', '', '', '', '', '', '', '', '', '', '', '1', '0', '1517629811', '1517629811');
INSERT INTO `yii2_order` VALUES ('48', '67639', '121715560805623378 ', '1', '2', '2018-02-01', '健黑黑的李白白', '100', '1', '', '520.00', '2', '122134331166623378', '23.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-02', '2018-02-02', '2018-02-04', '', '1', '贵州省  贵阳市  观山湖区  林城西路通源沃尔沃4s店  ', '孙永健', '15761609087', '', '', '', '补差23元，分别为10元照片， 13元到付快递费', '', '', '', '', '4', '0', '1517630064', '1517630100');
INSERT INTO `yii2_order` VALUES ('49', '67639', '121790602531657884', '1', '2', '2018-02-01', 'caboo6 ', '100', '1', '', '520.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '湖南省  株洲市  天元区  泰山路街道滨江南路88号蓝盾景园2期21栋2604室', '帅莎', '13601869229', '', '', '', '', '', '', '', '', '1', '0', '1517630178', '1517630178');
INSERT INTO `yii2_order` VALUES ('50', '67639', '121795726777370771', '1', '1', '2018-02-01', '我是购物狂85', '98', '1', '', '248.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-02', '2018-02-04', '2018-02-05', '', '1', '四川省  泸州市  合江县  合江镇人和巷荔香苑格力空调 ', '文海鹰', '13158602100', '', '', '', '', '', '', '', '', '4', '0', '1517630400', '1517630400');
INSERT INTO `yii2_order` VALUES ('51', '67639', '127030816136083825', '1', '1', '2018-02-01', '日光倾城_00', '99', '1', '', '268.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-02', '2018-02-02', '2018-02-04', '', '1', '广东省  清远市  英德市  英城街道和平广场保安室', '苏嘉莉', '13431990777', '', '', '', '', '', '', '', '', '4', '0', '1517630475', '1517630475');
INSERT INTO `yii2_order` VALUES ('52', '67639', '121883982532512999', '1', '1', '2018-02-01', '你的路鸟', '99', '1', '', '268.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '2018-02-02', '2018-02-04', '2018-02-05', '', '1', '广东省  汕头市  潮阳区  谷饶镇大坑村大亨桥旁（弘雅新楼内）晨星针织厂的对面厂楼', '张琳', '13288007874', '', '', '', '', '', '', '', '', '4', '0', '1517630562', '1517630562');
INSERT INTO `yii2_order` VALUES ('53', '67642', '115030720877321838', '1', '2', '2018-02-01', '过站不停a', '81', '1', '', '198.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮 1224643589@qq.com', '', '', '', '', '', '', '', '', '', '', '1', '0', '1517630618', '1517630618');
INSERT INTO `yii2_order` VALUES ('54', '67639', '127196578597994222', '1', '1', '2018-02-01', '不该选择沦落 ', '99', '1', '', '268.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '', '', '', '', '1', '广东省  汕头市  潮阳区  谷饶镇华光小学南侧雄盛针织厂 ', '张雪霞', '13417039753', '', '', '', '', '', '', '', '', '1', '0', '1517630700', '1517630700');
INSERT INTO `yii2_order` VALUES ('55', '67639', '115045672603943257', '1', '1', '2018-02-01', 'tb2887427_2011 ', '99', '2', '', '268.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '0', '1517630782', '1517631247');
INSERT INTO `yii2_order` VALUES ('56', '67639', '127101964221794729', '1', '1', '2018-02-01', '懒猫l2008', '99', '2', '', '268.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '重庆  重庆市  江北区  华新街街道金源路55号  ', '刘阳婕', '15683875702', '', '', '', '', '', '', '', '', '1', '0', '1517630904', '1517630904');
INSERT INTO `yii2_order` VALUES ('57', '67639', '127128480199337929', '1', '2', '2018-02-01', 'terminator93 ', '100', '2', '', '520.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '', '', '', '', '1', '四川省  成都市  金牛区  金牛区花牌坊街筒车巷29号2栋3单元13号 ', '华梦', '15281052442', '', '', '', '', '', '', '', '', '1', '0', '1517630970', '1517630970');
INSERT INTO `yii2_order` VALUES ('58', '67642', '127297070913165512 ', '1', '2', '2018-02-01', 'maskjane', '81', '1', '', '175.00', '1', '127153232945165512', '23.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '回邮：1351067868@qq.com', '', '', '', '', '', '', '', '', '', '', '1', '0', '1517631089', '1517631102');
INSERT INTO `yii2_order` VALUES ('59', '67639', '127191900831895018', '1', '1', '2018-02-01', 'chjp2046', '99', '2', '', '268.00', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '13.00', '0.00', '', '', '', '', '1', '广东省  深圳市  南山区  南山街道登良路65号荔雅居A4 3D ', '陈杰平', '13760456157', '', '', '', '', '', '', '', '', '1', '0', '1517631196', '1517631196');
INSERT INTO `yii2_order` VALUES ('60', '67639', '2018020101', '2', '1', '2018-02-01', '尤芳明', '103', '1', '', '260.00', '5', '', '0.00', '0.00', '', '10.00', '0.00', '', '0.00', '0.00', '2018-02-03', '2018-02-04', '2018-02-05', '', '1', '', '', '', '', '', '', '', '', '', '', '', '4', '0', '1517631608', '1517631608');
INSERT INTO `yii2_order` VALUES ('61', '67639', '2018020102', '2', '1', '2018-02-01', 'wxid_nu2fv1eeqg4h22 ', '103', '1', '', '260.00', '2', '', '0.00', '0.00', '', '10.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '0', '1517631676', '1517631676');
INSERT INTO `yii2_order` VALUES ('62', '67639', 'TY2018020101', '3', '1', '2018-02-01', '王雅慧', '106', '1', '', '220.00', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '0', '1517631783', '1517631783');
INSERT INTO `yii2_order` VALUES ('63', '67639', 'TY2018020102', '3', '2', '2018-02-01', '广州签证-小徐', '107', '1', '', '425.00', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '2018-02-02', '2018-02-02', '2018-02-04', '', '1', '福建省泉州市台商投资区洛阳镇山水花苑2号楼201室', '黄志红', '13506923296', '', '', '', '', '', '2018-02-01', '', '', '4', '0', '1517631966', '1517631966');
INSERT INTO `yii2_order` VALUES ('64', '67639', 'TY2018020103', '3', '1', '2018-02-01', '菲律宾潜水-韩璐', '106', '1', '', '225.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '2018-02-02', '2018-02-04', '2018-02-05', '', '1', '', '', '', '', '', '', '', '', '', '', '', '4', '0', '1517632032', '1517632032');
INSERT INTO `yii2_order` VALUES ('65', '67639', 'TY2018020104', '3', '1', '2018-02-01', '高升之旅', '106', '1', '', '220.00', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '0', '1517632081', '1517632081');
INSERT INTO `yii2_order` VALUES ('66', '67639', 'TY2018020105', '3', '1', '2018-02-01', '上海享途', '106', '1', '', '220.00', '3', '', '0.00', '0.00', '', '20.00', '0.00', '', '0.00', '0.00', '2018-02-02', '2018-02-04', '2018-02-05', '', '1', '', '', '', '', '', '', '', '', '', '', '', '4', '0', '1517632155', '1517632155');
INSERT INTO `yii2_order` VALUES ('67', '67639', 'TY2018020106', '3', '1', '2018-02-01', '菲亚旅行社', '106', '1', '', '220.00', '2', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '2018-02-02', '2018-02-02', '2018-02-04', '', '1', '', '', '', '', '', '', '', '', '', '', '', '4', '0', '1517632226', '1517632226');
INSERT INTO `yii2_order` VALUES ('68', '67639', 'TY2018020107', '3', '1', '2018-02-01', '青旅成僵分社-李狄蔓', '106', '1', '', '220.00', '3', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '0', '1517632287', '1517632287');
INSERT INTO `yii2_order` VALUES ('69', '67639', 'TY2018020108', '3', '1', '2018-02-01', '菲亚旅行社', '106', '1', '', '220.00', '7', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '', '', '', '', '1', '', '', '', '', '', '', '', '', '', '', '', '1', '0', '1517632389', '1517632389');

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
INSERT INTO `yii2_order_to_transactor` VALUES ('33', '78');
INSERT INTO `yii2_order_to_transactor` VALUES ('33', '79');
INSERT INTO `yii2_order_to_transactor` VALUES ('34', '80');
INSERT INTO `yii2_order_to_transactor` VALUES ('35', '81');
INSERT INTO `yii2_order_to_transactor` VALUES ('35', '82');
INSERT INTO `yii2_order_to_transactor` VALUES ('35', '83');
INSERT INTO `yii2_order_to_transactor` VALUES ('35', '84');
INSERT INTO `yii2_order_to_transactor` VALUES ('35', '85');
INSERT INTO `yii2_order_to_transactor` VALUES ('35', '86');
INSERT INTO `yii2_order_to_transactor` VALUES ('35', '87');
INSERT INTO `yii2_order_to_transactor` VALUES ('35', '88');
INSERT INTO `yii2_order_to_transactor` VALUES ('36', '89');
INSERT INTO `yii2_order_to_transactor` VALUES ('36', '90');
INSERT INTO `yii2_order_to_transactor` VALUES ('36', '91');
INSERT INTO `yii2_order_to_transactor` VALUES ('37', '92');
INSERT INTO `yii2_order_to_transactor` VALUES ('38', '93');
INSERT INTO `yii2_order_to_transactor` VALUES ('39', '94');
INSERT INTO `yii2_order_to_transactor` VALUES ('40', '95');
INSERT INTO `yii2_order_to_transactor` VALUES ('41', '96');
INSERT INTO `yii2_order_to_transactor` VALUES ('42', '97');
INSERT INTO `yii2_order_to_transactor` VALUES ('43', '98');
INSERT INTO `yii2_order_to_transactor` VALUES ('43', '99');
INSERT INTO `yii2_order_to_transactor` VALUES ('43', '100');
INSERT INTO `yii2_order_to_transactor` VALUES ('44', '101');
INSERT INTO `yii2_order_to_transactor` VALUES ('44', '102');
INSERT INTO `yii2_order_to_transactor` VALUES ('45', '103');
INSERT INTO `yii2_order_to_transactor` VALUES ('45', '104');
INSERT INTO `yii2_order_to_transactor` VALUES ('45', '105');
INSERT INTO `yii2_order_to_transactor` VALUES ('45', '106');
INSERT INTO `yii2_order_to_transactor` VALUES ('46', '107');
INSERT INTO `yii2_order_to_transactor` VALUES ('46', '108');
INSERT INTO `yii2_order_to_transactor` VALUES ('46', '109');
INSERT INTO `yii2_order_to_transactor` VALUES ('46', '110');
INSERT INTO `yii2_order_to_transactor` VALUES ('46', '111');
INSERT INTO `yii2_order_to_transactor` VALUES ('46', '112');
INSERT INTO `yii2_order_to_transactor` VALUES ('46', '113');
INSERT INTO `yii2_order_to_transactor` VALUES ('47', '114');
INSERT INTO `yii2_order_to_transactor` VALUES ('47', '115');
INSERT INTO `yii2_order_to_transactor` VALUES ('48', '116');
INSERT INTO `yii2_order_to_transactor` VALUES ('48', '117');
INSERT INTO `yii2_order_to_transactor` VALUES ('49', '118');
INSERT INTO `yii2_order_to_transactor` VALUES ('50', '119');
INSERT INTO `yii2_order_to_transactor` VALUES ('51', '120');
INSERT INTO `yii2_order_to_transactor` VALUES ('52', '121');
INSERT INTO `yii2_order_to_transactor` VALUES ('53', '122');
INSERT INTO `yii2_order_to_transactor` VALUES ('54', '123');
INSERT INTO `yii2_order_to_transactor` VALUES ('55', '124');
INSERT INTO `yii2_order_to_transactor` VALUES ('56', '125');
INSERT INTO `yii2_order_to_transactor` VALUES ('57', '126');
INSERT INTO `yii2_order_to_transactor` VALUES ('58', '127');
INSERT INTO `yii2_order_to_transactor` VALUES ('59', '128');
INSERT INTO `yii2_order_to_transactor` VALUES ('59', '129');
INSERT INTO `yii2_order_to_transactor` VALUES ('60', '130');
INSERT INTO `yii2_order_to_transactor` VALUES ('60', '131');
INSERT INTO `yii2_order_to_transactor` VALUES ('60', '132');
INSERT INTO `yii2_order_to_transactor` VALUES ('60', '133');
INSERT INTO `yii2_order_to_transactor` VALUES ('60', '134');
INSERT INTO `yii2_order_to_transactor` VALUES ('61', '135');
INSERT INTO `yii2_order_to_transactor` VALUES ('61', '136');
INSERT INTO `yii2_order_to_transactor` VALUES ('62', '137');
INSERT INTO `yii2_order_to_transactor` VALUES ('62', '138');
INSERT INTO `yii2_order_to_transactor` VALUES ('62', '139');
INSERT INTO `yii2_order_to_transactor` VALUES ('63', '140');
INSERT INTO `yii2_order_to_transactor` VALUES ('63', '141');
INSERT INTO `yii2_order_to_transactor` VALUES ('63', '142');
INSERT INTO `yii2_order_to_transactor` VALUES ('64', '143');
INSERT INTO `yii2_order_to_transactor` VALUES ('65', '144');
INSERT INTO `yii2_order_to_transactor` VALUES ('66', '145');
INSERT INTO `yii2_order_to_transactor` VALUES ('66', '146');
INSERT INTO `yii2_order_to_transactor` VALUES ('66', '147');
INSERT INTO `yii2_order_to_transactor` VALUES ('67', '148');
INSERT INTO `yii2_order_to_transactor` VALUES ('67', '149');
INSERT INTO `yii2_order_to_transactor` VALUES ('68', '150');
INSERT INTO `yii2_order_to_transactor` VALUES ('68', '151');
INSERT INTO `yii2_order_to_transactor` VALUES ('68', '152');
INSERT INTO `yii2_order_to_transactor` VALUES ('69', '153');
INSERT INTO `yii2_order_to_transactor` VALUES ('69', '154');
INSERT INTO `yii2_order_to_transactor` VALUES ('69', '155');
INSERT INTO `yii2_order_to_transactor` VALUES ('69', '156');
INSERT INTO `yii2_order_to_transactor` VALUES ('69', '157');
INSERT INTO `yii2_order_to_transactor` VALUES ('69', '158');
INSERT INTO `yii2_order_to_transactor` VALUES ('69', '159');

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
INSERT INTO `yii2_session` VALUES ('16n00iq1r714gcfv811eu9dvc7', '1517204936', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('19eooa0hba3fvndj2pihmm9ls0', '1517396489', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('3j1pkkhlu7ha7ijopth0q5gnv1', '1517626698', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B);
INSERT INTO `yii2_session` VALUES ('76c3kftln1ub95bkl2dikurfa6', '1517137910', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('7akh8ej305r0mcpu37d86f1v93', '1517560599', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('82lltsvpefmba73lcm5vmeo4f7', '1517817191', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('914mlg6vppcf2v8mcl3jgbmim1', '1517395876', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('ae3gfmqbbuvl1kj1gth44q0e36', '1517051107', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('d5ie5nh04ujfnhsn8893jliu31', '1517473778', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('fq49cjlhf5bjddvr3u7698uku4', '1517480812', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('ih181rn302u8v07lu7jgmj1lp4', '1516971419', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('iloa71bn3er25udnf7evtrhrb4', '1517475517', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('jd803jnfo8nta7qb12dk9cc4p0', '1517653017', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('jfmng616aaov570bdb9n5g3de2', '1517125178', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('rgau2vof4oba47mdut35gb5ll6', '1517474185', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('rp0mljeqmq3j4ctciann4mpth7', '1517813307', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('uia57phmm4k4fda06k83rbiu23', '1517560929', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('vi09ec9bmlhqnh1ehieq3vgb75', '1517040015', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);

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
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=138 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_snapshot
-- ----------------------------
INSERT INTO `yii2_snapshot` VALUES ('4', '298/5', '200.000', '1', '1', '39310', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('5', '398/3', '300.000', '1', '2', '39311', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('6', '520/2', '400.000', '1', '3', '39312', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('7', '330/5', '230.000', '2', '1', '39313', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('8', '430/3', '330.000', '2', '2', '39314', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('11', '333/3', '11.000', '1', '1', '39316', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('10', '540/1', '330.000', '2', '3', '39315', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('12', '555/5', '33.000', '1', '2', '39317', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('13', '555/1', '11.000', '1', '3', '39318', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('14', '223/3', '34.000', '2', '1', '39319', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('15', '330/5', '444.000', '2', '2', '39320', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('16', '666/3', '222.000', '2', '3', '39321', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('17', '333/3', '222.000', '3', '1', '39322', '0', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('18', '555/3', '333.000', '3', '2', '39323', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('19', '666/1', '555.000', '3', '3', '39324', '0', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('20', '788/10', '445.000', '3', '1', '39325', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('21', '888/5', '666.000', '3', '2', '39326', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('22', '889/2', '777.000', '3', '3', '39327', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('23', '11', '1.000', '1', '1', '39332', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('24', '1', '1.000', '1', '1', '39333', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('25', '1', '1.000', '1', '1', '39334', '1', '', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('26', '333/2', '222.000', '3', '1', '39322', '1', '泰国签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('27', '233/3', '210.000', '1', '2', '39335', '0', '越南签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('28', '233/2', '210.000', '1', '2', '39335', '0', '越南签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('29', '233/3', '210.000', '1', '2', '39335', '1', '越南签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('30', '666/2', '555.000', '3', '3', '39324', '1', '泰国签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('31', '125/55', '100.000', '1', '1', '39336', '0', '柬埔寨55天游', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('32', '300/5', '200.000', '1', '2', '39337', '0', '柬埔寨55天游', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('33', '365/5', '300.000', '1', '3', '39338', '0', '柬埔寨55天游', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('34', '258/5', '200.000', '1', '1', '39339', '1', '菲律宾59天', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('35', '338/5', '285.000', '1', '2', '39340', '1', '菲律宾59天', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('36', '365/5', '300.000', '1', '3', '39341', '1', '菲律宾59天', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('37', '218/10天', '200.000', '1', '1', '39342', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('38', '248/8天', '200.000', '1', '1', '39343', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('39', '268/5天', '200.000', '1', '1', '39344', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('40', '520', '401.000', '1', '2', '39345', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('41', '1200', '950.000', '1', '3', '39346', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('42', '248/8天', '200.000', '2', '1', '39347', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('43', '260/5天', '200.000', '2', '1', '39348', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('44', '510/3天', '401.000', '1', '2', '39349', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('45', '520/3天', '401.000', '1', '2', '39345', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('46', '1200/1天', '950.000', '1', '3', '39346', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('47', '510/3天', '401.000', '1', '2', '39350', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('48', '510/3天', '401.000', '2', '2', '39350', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('49', '1200/1天', '950.000', '2', '3', '39351', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('50', '220/4-5工', '200.000', '3', '1', '39352', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('51', '425/2-3工', '401.000', '3', '2', '39353', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('52', '990/1天', '950.000', '3', '3', '39354', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('53', '940/7天', '550.000', '1', '1', '39355', '0', '菲律宾三个月多次', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('54', '1240/5天', '550.000', '1', '2', '39356', '0', '菲律宾三个月多次', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('55', '920/7天', '550.000', '2', '1', '39357', '0', '菲律宾三个月多次', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('56', '1220/4天', '550.000', '2', '2', '39358', '0', '菲律宾三个月多次', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('57', '600/5-6工', '550.000', '3', '1', '39359', '0', '菲律宾三个月多次', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('58', '900/3-4工', '550.000', '3', '2', '39360', '0', '菲律宾三个月多次', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('59', '1440/7天', '1000.000', '1', '1', '39361', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('60', '1550/4天', '1000.000', '1', '2', '39362', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('61', '1550/5天', '1000.000', '1', '2', '39362', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('62', '1420/7天', '1000.000', '2', '1', '39363', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('63', '1530/5天', '1000.000', '2', '2', '39364', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('64', '1100/5-6工', '1000.000', '3', '1', '39365', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('65', '1200/3-4工', '1000.000', '3', '2', '39366', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('66', '125/55', '100.000', '1', '1', '39336', '1', '柬埔寨55天游', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('67', '300/5', '200.000', '1', '2', '39337', '1', '柬埔寨55天游', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('68', '365/5', '300.000', '1', '3', '39338', '1', '柬埔寨55天游', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('69', '940/7天', '550.000', '1', '1', '39355', '1', '菲律宾三个月多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('70', '1240/5天', '550.000', '1', '2', '39356', '1', '菲律宾三个月多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('71', '1440/7天', '1000.000', '1', '1', '39361', '1', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('72', '1550/5天', '1000.000', '1', '2', '39362', '1', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('73', '1420/7天', '1000.000', '2', '1', '39363', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('74', '1530/5天', '1000.000', '2', '2', '39364', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('75', '1100/5-6工', '1000.000', '3', '1', '39365', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('76', '1200/3-4工', '1000.000', '3', '2', '39366', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('77', '1200/4天', '550.000', '2', '2', '39358', '0', '菲律宾三个月多次签证', '0.000');
INSERT INTO `yii2_snapshot` VALUES ('78', '1400/7天', '1000.000', '2', '1', '39363', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('79', '1500/5天', '1000.000', '2', '2', '39364', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('80', '175/3天', '160.000', '1', '1', '39367', '1', '马来西亚-15天ENTRI', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('81', '198/1天', '160.000', '1', '2', '39368', '1', '马来西亚-15天ENTRI', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('82', '248/3小时', '160.000', '1', '3', '39369', '1', '马来西亚-15天ENTRI', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('83', '175/3天', '160.000', '2', '1', '39370', '0', '马来西亚-15天ENTRI', '0.000');
INSERT INTO `yii2_snapshot` VALUES ('84', '175/3天', '160.000', '2', '1', '39370', '1', '马来西亚-15天ENTRI', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('85', '190/1天', '160.000', '2', '2', '39371', '1', '马来西亚-15天ENTRI', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('86', '240/3小时', '160.000', '2', '3', '39372', '1', '马来西亚-15天ENTRI', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('87', '180/1天', '160.000', '3', '1', '39373', '1', '马来西亚-15天ENTRI', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('88', '200/3小时', '160.000', '3', '3', '39374', '1', '马来西亚-15天ENTRI', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('89', '320/4天', '280.000', '1', '1', '39375', '1', '马来西亚-30天EVISA', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('90', '343/2天', '280.000', '1', '2', '39376', '1', '马来西亚-30天EVISA', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('91', '395/1天', '280.000', '1', '3', '39377', '1', '马来西亚-30天EVISA', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('92', '310/4天', '280.000', '2', '1', '39378', '1', '马来西亚-30天EVISA', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('93', '343/1天', '280.000', '2', '2', '39379', '1', '马来西亚-30天EVISA', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('94', '395/1天', '280.000', '2', '3', '39380', '1', '马来西亚-30天EVISA', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('95', '300/2天', '280.000', '3', '1', '39381', '1', '马来西亚-30天EVISA', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('96', '320/1天', '280.000', '3', '3', '39382', '1', '马来西亚-30天EVISA', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('97', '218/10天', '200.000', '1', '1', '39342', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('98', '248/8天', '200.000', '1', '1', '39343', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('99', '268/5天', '200.000', '1', '1', '39344', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('100', '520/3天', '401.000', '1', '2', '39345', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('101', '1200/1天', '950.000', '1', '3', '39346', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('102', '248/8天', '200.000', '2', '1', '39347', '1', '菲律宾59天单次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('103', '260/5天', '200.000', '2', '1', '39348', '1', '菲律宾59天单次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('104', '510/3天', '401.000', '2', '2', '39350', '1', '菲律宾59天单次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('105', '1200/1天', '950.000', '2', '3', '39351', '1', '菲律宾59天单次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('106', '220/4-5工', '200.000', '3', '1', '39352', '1', '菲律宾59天单次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('107', '425/2-3工', '401.000', '3', '2', '39353', '1', '菲律宾59天单次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('108', '990/1天', '950.000', '3', '3', '39354', '1', '菲律宾59天单次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('109', '920/7天', '550.000', '2', '1', '39357', '1', '菲律宾三个月多次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('110', '1200/4天', '550.000', '2', '2', '39358', '1', '菲律宾三个月多次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('111', '600/5-6工', '550.000', '3', '1', '39359', '1', '菲律宾三个月多次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('112', '900/3-4工', '550.000', '3', '2', '39360', '1', '菲律宾三个月多次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('113', '1400/7天', '1000.000', '2', '1', '39363', '1', '菲律宾半年多次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('114', '1500/5天', '1000.000', '2', '2', '39364', '1', '菲律宾半年多次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('115', '1100/5-6工', '1000.000', '3', '1', '39365', '1', '菲律宾半年多次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('116', '1200/3-4工', '1000.000', '3', '2', '39366', '1', '菲律宾半年多次签证', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('117', '320/6天', '290.000', '1', '1', '39383', '1', '马来西亚-30天贴纸签', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('118', '390/4天', '290.000', '1', '2', '39384', '1', '马来西亚-30天贴纸签', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('119', '310/6天', '290.000', '2', '1', '39385', '1', '马来西亚-30天贴纸签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('120', '380/4天', '290.000', '2', '1', '39386', '1', '马来西亚-30天贴纸签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('121', '300/4天', '290.000', '3', '1', '39387', '1', '马来西亚-30天贴纸签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('122', '268/4天', '242.000', '1', '1', '39388', '1', '柬埔寨电子签', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('123', '299/1天', '242.000', '1', '2', '39389', '1', '柬埔寨电子签', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('124', '358/3小时', '242.000', '1', '3', '39390', '1', '柬埔寨电子签', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('125', '260/4天', '242.000', '2', '1', '39391', '1', '柬埔寨电子签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('126', '290/1天', '242.000', '2', '2', '39392', '1', '柬埔寨电子签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('127', '350/3小时', '242.000', '2', '3', '39393', '1', '柬埔寨电子签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('128', '270/3天', '242.000', '3', '1', '39394', '1', '柬埔寨电子签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('129', '290/3小时', '242.000', '3', '2', '39395', '1', '柬埔寨电子签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('130', '255/3天', '240.000', '1', '1', '39396', '1', '柬埔寨贴纸签', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('131', '270/2天', '240.000', '1', '2', '39397', '1', '柬埔寨贴纸签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('132', '298/1天', '260.000', '1', '3', '39398', '1', '柬埔寨贴纸签', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('133', '250/3天', '240.000', '2', '1', '39399', '1', '柬埔寨贴纸签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('134', '260/2天', '240.000', '2', '2', '39400', '1', '柬埔寨贴纸签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('135', '288/1天', '260.000', '2', '3', '39401', '1', '柬埔寨贴纸签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('136', '250/2天', '240.000', '3', '1', '39402', '1', '柬埔寨贴纸签', '1.000');
INSERT INTO `yii2_snapshot` VALUES ('137', '280/1天', '260.000', '3', '2', '39403', '1', '柬埔寨贴纸签', '1.000');

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
) ENGINE=InnoDB AUTO_INCREMENT=160 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_transator
-- ----------------------------
INSERT INTO `yii2_transator` VALUES ('74', '张旭', '1', '', '', '', '1', '1516430261', '0', '');
INSERT INTO `yii2_transator` VALUES ('75', '黄晓霞', '', '', '', '', '1', '1516434366', '0', '');
INSERT INTO `yii2_transator` VALUES ('76', '杨杰', '1', '', '', '', '0', '1516435299', '0', '故事');
INSERT INTO `yii2_transator` VALUES ('78', '龚韵佳', '1', '', '', '', '0', '1516859011', '0', '');
INSERT INTO `yii2_transator` VALUES ('79', '徐鼎黄', '1', '', '', '', '0', '1516859021', '0', '');
INSERT INTO `yii2_transator` VALUES ('80', '张慧', '1', '', '', '', '0', '1516859434', '0', '');
INSERT INTO `yii2_transator` VALUES ('81', '王凯', '1', '', '', '', '0', '1516859823', '0', '');
INSERT INTO `yii2_transator` VALUES ('82', '廖晨羽', '1', '', '', '', '0', '1516859833', '0', '');
INSERT INTO `yii2_transator` VALUES ('83', '吴勇霖', '1', '', '', '', '0', '1516859844', '0', '');
INSERT INTO `yii2_transator` VALUES ('84', '于通海', '1', '', '', '', '0', '1516859851', '0', '');
INSERT INTO `yii2_transator` VALUES ('85', '侯东彤', '1', '', '', '', '0', '1516859858', '0', '');
INSERT INTO `yii2_transator` VALUES ('86', '王炜玥', '1', '', '', '', '0', '1516859865', '0', '');
INSERT INTO `yii2_transator` VALUES ('87', '郭宜亮', '1', '', '', '', '0', '1516859874', '0', '');
INSERT INTO `yii2_transator` VALUES ('88', '林智威', '1', '', '', '', '0', '1516859883', '0', '');
INSERT INTO `yii2_transator` VALUES ('89', '郑嘉炜', '1', '', '', '', '0', '1516860019', '0', '');
INSERT INTO `yii2_transator` VALUES ('90', '许晓玲', '1', '', '', '', '0', '1516860026', '0', '');
INSERT INTO `yii2_transator` VALUES ('91', '刘仁', '1', '', '', '', '0', '1516860036', '0', '');
INSERT INTO `yii2_transator` VALUES ('93', '龙骏骅', '1', '', '', '', '0', '1517049039', '0', '父亲：\n母亲：\n入境口岸');
INSERT INTO `yii2_transator` VALUES ('94', '卢麒宇', '1', '', '', '', '0', '1517638878', '0', '');
INSERT INTO `yii2_transator` VALUES ('95', '谈文婷', '1', '', '', '', '0', '1517639193', '0', '');
INSERT INTO `yii2_transator` VALUES ('96', '闸志欣', '1', '', '', '', '0', '1517715260', '0', '');
INSERT INTO `yii2_transator` VALUES ('97', '汤委静', '1', '', '', '', '0', '1517715441', '0', '');
INSERT INTO `yii2_transator` VALUES ('98', '潘凤英', '1', '', '', '', '0', '1517715609', '0', '');
INSERT INTO `yii2_transator` VALUES ('99', '林松平', '1', '', '', '', '0', '1517715616', '0', '');
INSERT INTO `yii2_transator` VALUES ('100', '林滨蔚', '1', '', '', '', '0', '1517715623', '0', '');
INSERT INTO `yii2_transator` VALUES ('101', '未知名', '1', '', '', '', '0', '1517715711', '0', '');
INSERT INTO `yii2_transator` VALUES ('102', '未知名2', '1', '', '', '', '0', '1517715719', '0', '');
INSERT INTO `yii2_transator` VALUES ('103', '王洁琼', '1', '', '', '', '0', '1517715791', '0', '');
INSERT INTO `yii2_transator` VALUES ('104', '陈凯', '1', '', '', '', '0', '1517715798', '0', '');
INSERT INTO `yii2_transator` VALUES ('105', '陈韵如', '1', '', '', '', '0', '1517715805', '0', '');
INSERT INTO `yii2_transator` VALUES ('106', '陈美如', '1', '', '', '', '0', '1517715810', '0', '');
INSERT INTO `yii2_transator` VALUES ('107', '赵春旭', '1', '', '', '', '0', '1517716001', '0', '');
INSERT INTO `yii2_transator` VALUES ('108', '赵宁', '1', '', '', '', '0', '1517716007', '0', '');
INSERT INTO `yii2_transator` VALUES ('109', '邢阳涛', '1', '', '', '', '0', '1517716013', '0', '');
INSERT INTO `yii2_transator` VALUES ('110', '宋伟', '1', '', '', '', '0', '1517716019', '0', '');
INSERT INTO `yii2_transator` VALUES ('111', '马学鹏', '1', '', '', '', '0', '1517716026', '0', '');
INSERT INTO `yii2_transator` VALUES ('112', '肖震', '1', '', '', '', '0', '1517716031', '0', '');
INSERT INTO `yii2_transator` VALUES ('113', '谢春奇', '1', '', '', '', '0', '1517716038', '0', '');
INSERT INTO `yii2_transator` VALUES ('114', '冯靖怡', '1', '', '', '', '0', '1517716187', '0', '');
INSERT INTO `yii2_transator` VALUES ('115', '李德贤', '1', '', '', '', '0', '1517716194', '0', '');
INSERT INTO `yii2_transator` VALUES ('116', '李丽君', '1', '', '', '', '0', '1517716397', '0', '');
INSERT INTO `yii2_transator` VALUES ('117', '孙永健', '1', '', '', '', '0', '1517716407', '0', '');
INSERT INTO `yii2_transator` VALUES ('118', '帅莎', '1', '', '', '', '0', '1517716552', '0', '');
INSERT INTO `yii2_transator` VALUES ('119', '文杨', '1', '', '', '', '0', '1517716757', '0', '入境：卡利博');
INSERT INTO `yii2_transator` VALUES ('120', '苏嘉莉', '1', '', '', '', '0', '1517716845', '0', '');
INSERT INTO `yii2_transator` VALUES ('121', '张琳烨', '1', '', '', '', '0', '1517716923', '0', '');
INSERT INTO `yii2_transator` VALUES ('122', '王晓燕', '1', '', '', '', '0', '1517717008', '0', '');
INSERT INTO `yii2_transator` VALUES ('123', '张雪霞', '1', '', '', '', '0', '1517717077', '0', '');
INSERT INTO `yii2_transator` VALUES ('124', '郭依婷 ', '1', '', '', '', '0', '1517717174', '0', '');
INSERT INTO `yii2_transator` VALUES ('125', '刘阳婕', '1', '', '', '', '0', '1517717271', '0', '入境：宿务');
INSERT INTO `yii2_transator` VALUES ('126', '胡尧', '1', '', '', '', '0', '1517717353', '0', '');
INSERT INTO `yii2_transator` VALUES ('127', '周尤加', '1', '', '', '', '0', '1517717467', '0', '');
INSERT INTO `yii2_transator` VALUES ('128', '陈杰平', '1', '', '', '', '0', '1517717559', '0', '');
INSERT INTO `yii2_transator` VALUES ('129', '余晓琪', '1', '', '', '', '0', '1517717565', '0', '');
INSERT INTO `yii2_transator` VALUES ('130', '陈范', '1', '', '', '', '0', '1517717859', '0', '');
INSERT INTO `yii2_transator` VALUES ('131', '陈波', '1', '', '', '', '0', '1517717864', '0', '');
INSERT INTO `yii2_transator` VALUES ('132', '李欢', '1', '', '', '', '0', '1517717871', '0', '');
INSERT INTO `yii2_transator` VALUES ('133', '黄靖', '1', '', '', '', '0', '1517717876', '0', '');
INSERT INTO `yii2_transator` VALUES ('134', '郑腾', '1', '', '', '', '0', '1517717882', '0', '');
INSERT INTO `yii2_transator` VALUES ('135', '徐晓彪', '1', '', '', '', '0', '1517718049', '0', '');
INSERT INTO `yii2_transator` VALUES ('136', '徐梅', '1', '', '', '', '0', '1517718055', '0', '');
INSERT INTO `yii2_transator` VALUES ('137', '张劲松', '1', '', '', '', '0', '1517718164', '0', '');
INSERT INTO `yii2_transator` VALUES ('138', '李明姝', '1', '', '', '', '0', '1517718169', '0', '');
INSERT INTO `yii2_transator` VALUES ('139', '张李云疆', '1', '', '', '', '0', '1517718174', '0', '');
INSERT INTO `yii2_transator` VALUES ('140', '林水湖', '1', '', '', '', '0', '1517718224', '0', '');
INSERT INTO `yii2_transator` VALUES ('141', '万建平', '1', '', '', '', '0', '1517718230', '0', '');
INSERT INTO `yii2_transator` VALUES ('142', '吴汉平', '1', '', '', '', '0', '1517718235', '0', '');
INSERT INTO `yii2_transator` VALUES ('143', '張嘉元', '1', '', '', '', '0', '1517718417', '0', '');
INSERT INTO `yii2_transator` VALUES ('144', '俞冰欣', '1', '', '', '', '0', '1517718473', '0', '');
INSERT INTO `yii2_transator` VALUES ('145', '王惠', '1', '', '', '', '0', '1517718530', '0', '');
INSERT INTO `yii2_transator` VALUES ('146', '王柯淇', '1', '', '', '', '0', '1517718536', '0', '');
INSERT INTO `yii2_transator` VALUES ('147', '陆艳', '1', '', '', '', '0', '1517718540', '0', '');
INSERT INTO `yii2_transator` VALUES ('148', '史菊梅', '1', '', '', '', '0', '1517718608', '0', '');
INSERT INTO `yii2_transator` VALUES ('149', '刘承俞', '1', '', '', '', '0', '1517718613', '0', '');
INSERT INTO `yii2_transator` VALUES ('150', '郑英', '1', '', '', '', '0', '1517718669', '0', '');
INSERT INTO `yii2_transator` VALUES ('151', '李凌菲', '1', '', '', '', '0', '1517718674', '0', '');
INSERT INTO `yii2_transator` VALUES ('152', '陈传富', '1', '', '', '', '0', '1517718679', '0', '');
INSERT INTO `yii2_transator` VALUES ('153', '徐取萍', '1', '', '', '', '0', '1517718737', '0', '');
INSERT INTO `yii2_transator` VALUES ('154', '徐东碧', '1', '', '', '', '0', '1517718742', '0', '');
INSERT INTO `yii2_transator` VALUES ('155', '徐昆祥', '1', '', '', '', '0', '1517718749', '0', '');
INSERT INTO `yii2_transator` VALUES ('156', '徐进兴', '1', '', '', '', '0', '1517718757', '0', '');
INSERT INTO `yii2_transator` VALUES ('157', '王登民', '1', '', '', '', '0', '1517718763', '0', '');
INSERT INTO `yii2_transator` VALUES ('158', '王四围', '1', '', '', '', '0', '1517718771', '0', '');
INSERT INTO `yii2_transator` VALUES ('159', '王枪连', '1', '', '', '', '0', '1517718781', '0', '王枪连缺身份证');

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
