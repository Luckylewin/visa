/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : visa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-28 17:03:59
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
INSERT INTO `yii2_admin` VALUES ('1', 'admin', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i', '771405950@qq.com', '2130706433', '1517015013', '2004602259', '1', '1482305564', '1517015013');
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
) ENGINE=InnoDB AUTO_INCREMENT=39367 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_combo
-- ----------------------------
INSERT INTO `yii2_combo` VALUES ('39336', '125/55', '', '100.000', '1', '1', '1516774306', '1516774306', '1', '67637', '0.000');
INSERT INTO `yii2_combo` VALUES ('39337', '300/5', '', '200.000', '2', '1', '1516774318', '1516774318', '1', '67637', '0.000');
INSERT INTO `yii2_combo` VALUES ('39338', '365/5', '', '300.000', '3', '1', '1516774336', '1516774336', '1', '67637', '0.000');
INSERT INTO `yii2_combo` VALUES ('39342', '218/10天', '', '200.000', '1', '1', '1516961512', '1516961512', '1', '67639', '0.000');
INSERT INTO `yii2_combo` VALUES ('39343', '248/8天', '', '200.000', '1', '1', '1516961528', '1516961528', '1', '67639', '0.000');
INSERT INTO `yii2_combo` VALUES ('39344', '268/5天', '', '200.000', '1', '1', '1516961542', '1516961542', '1', '67639', '0.000');
INSERT INTO `yii2_combo` VALUES ('39345', '520/3天', '', '401.000', '2', '1', '1516961556', '1516961646', '1', '67639', '0.000');
INSERT INTO `yii2_combo` VALUES ('39346', '1200/1天', '', '950.000', '3', '1', '1516961580', '1516961652', '1', '67639', '0.000');
INSERT INTO `yii2_combo` VALUES ('39347', '248/8天', '', '200.000', '1', '2', '1516961603', '1516961603', '1', '67639', '0.000');
INSERT INTO `yii2_combo` VALUES ('39348', '260/5天', '', '200.000', '1', '2', '1516961618', '1516961618', '1', '67639', '0.000');
INSERT INTO `yii2_combo` VALUES ('39350', '510/3天', '', '401.000', '2', '2', '1516961679', '1516961692', '1', '67639', '0.000');
INSERT INTO `yii2_combo` VALUES ('39351', '1200/1天', '', '950.000', '3', '2', '1516961704', '1516961704', '1', '67639', '0.000');
INSERT INTO `yii2_combo` VALUES ('39352', '220/4-5工', '', '200.000', '1', '3', '1516961723', '1516961723', '1', '67639', '0.000');
INSERT INTO `yii2_combo` VALUES ('39353', '425/2-3工', '', '401.000', '2', '3', '1516961741', '1516961741', '1', '67639', '0.000');
INSERT INTO `yii2_combo` VALUES ('39354', '990/1天', '', '950.000', '3', '3', '1516961756', '1516961756', '1', '67639', '0.000');
INSERT INTO `yii2_combo` VALUES ('39355', '940/7天', '', '550.000', '1', '1', '1516961957', '1516961957', '1', '67640', '0.000');
INSERT INTO `yii2_combo` VALUES ('39356', '1240/5天', '', '550.000', '2', '1', '1516961988', '1516961988', '1', '67640', '0.000');
INSERT INTO `yii2_combo` VALUES ('39357', '920/7天', '', '550.000', '1', '2', '1516962154', '1516962154', '1', '67640', '0.000');
INSERT INTO `yii2_combo` VALUES ('39358', '1220/4天', '', '550.000', '2', '2', '1516962178', '1516962178', '1', '67640', '0.000');
INSERT INTO `yii2_combo` VALUES ('39359', '600/5-6工', '', '550.000', '1', '3', '1516962206', '1516962206', '1', '67640', '0.000');
INSERT INTO `yii2_combo` VALUES ('39360', '900/3-4工', '', '550.000', '2', '3', '1516962309', '1516962309', '1', '67640', '0.000');
INSERT INTO `yii2_combo` VALUES ('39361', '1440/7天', '', '1000.000', '1', '1', '1516962387', '1516962387', '1', '67641', '0.000');
INSERT INTO `yii2_combo` VALUES ('39362', '1550/5天', '', '1000.000', '2', '1', '1516962406', '1516962416', '1', '67641', '0.000');
INSERT INTO `yii2_combo` VALUES ('39363', '1420/7天', '', '1000.000', '1', '2', '1516962436', '1516962436', '1', '67641', '0.000');
INSERT INTO `yii2_combo` VALUES ('39364', '1530/5天', '', '1000.000', '2', '2', '1516962452', '1516962452', '1', '67641', '0.000');
INSERT INTO `yii2_combo` VALUES ('39365', '1100/5-6工', '', '1000.000', '1', '3', '1516962474', '1516962474', '1', '67641', '0.000');
INSERT INTO `yii2_combo` VALUES ('39366', '1200/3-4工', '', '1000.000', '2', '3', '1516962491', '1516962491', '1', '67641', '0.000');

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
  `receipt_date` date NOT NULL COMMENT '店铺收款日期',
  `company_receipt_date` date NOT NULL,
  `pay_date` date NOT NULL COMMENT '支付日期',
  `audit_status` char(1) NOT NULL DEFAULT '1' COMMENT '1审核中2审核未通过3审核通过',
  `cid` smallint(4) NOT NULL COMMENT '国家id',
  `created_at` int(10) NOT NULL COMMENT '创建时间',
  `updated_at` int(10) NOT NULL COMMENT '修改时间',
  PRIMARY KEY (`id`),
  KEY `order_deliverycompany_id` (`delivercompany`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_order
-- ----------------------------
INSERT INTO `yii2_order` VALUES ('33', '67639', '72774443785866441,79696628915866441', '1', '1', '2017-10-13', '禾小小宸', '37', '1', '', '298.00', '2', '', '80.000', '', '0.00', '', '23.00', '2017-10-14', '2017-10-15', '2017-10-19', '2017-10-17', '1', '云南省  昆明市  盘龙区  金辰街道穿金路省生物制药有限公司生活区（农贸市场旁）  650051  徐鼎黄', '徐鼎黄', '13888258830', '2017-10-20', '789073211191     龚拒签', '顺丰', '龚韵佳拒签重办', '2017-11-03', '0000-00-00', '2017-11-08', '3', '0', '1516772799', '1517125031');
INSERT INTO `yii2_order` VALUES ('34', '67638', '67730009495894210,68168547439894210', '1', '1', '2017-10-13', 'irenehuihui1986', '34', '1', '', '330.00', '1', '', '30.000', '', '0.00', '', '23.00', '2017-10-15', '2017-10-17', '2017-10-18', '2017-10-23', '1', '北京市  朝阳区  十八里店镇朝阳区十八里店老君堂甲3号 捷强花园 305号', '张泓', '13581845657', '2017-10-24', '789090909369', '顺丰', '', '2017-11-03', '0000-00-00', '2017-11-08', '3', '0', '1516773188', '1516775723');
INSERT INTO `yii2_order` VALUES ('35', '67639', '74037582482664874', '1', '2', '2017-10-14', 'hr张蕊', '45', '1', '', '398.00', '8', '', '0.000', '', '0.00', '', '0.00', '2017-10-15', '2017-10-15', '2017-10-16', '2017-10-17', '1', '福建省长汀县梅林三路51号', '廖晨羽', '18558906659', '2017-10-18', '789061594313', '顺丰', '王凯拒签', '2017-11-03', '0000-00-00', '2017-11-08', '3', '0', '1516773538', '1517023883');
INSERT INTO `yii2_order` VALUES ('36', '67637', '73464844660638393', '1', '3', '2017-10-13', 'oulsm2', '33', '2', '', '555.00', '1', '', '0.000', '', '0.00', '', '0.00', '1970-01-01', '1970-01-01', '1970-01-01', '1970-01-01', '1', '回邮：819338141@qq.com', '', '', '1970-01-01', '', '', '', '1970-01-01', '0000-00-00', '1970-01-01', '1', '0', '1516773767', '1517130032');
INSERT INTO `yii2_order` VALUES ('38', '67639', '106823370063592878', '1', '1', '2018-01-26', 'sanjiaomao8823', '39', '1', '', '268.00', '1', '', '0.000', '', '0.00', '', '23.00', '1970-01-01', '1970-01-01', '1970-01-01', '1970-01-01', '1', '', '', '', '1970-01-01', '', '', '', '2018-01-28', '2018-01-28', '1970-01-01', '1', '0', '1516962840', '1517130137');

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

-- ----------------------------
-- Table structure for yii2_product
-- ----------------------------
DROP TABLE IF EXISTS `yii2_product`;
CREATE TABLE `yii2_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `name` varchar(255) NOT NULL,
  `cost` decimal(10,2) NOT NULL COMMENT '支出成本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67642 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of yii2_product
-- ----------------------------
INSERT INTO `yii2_product` VALUES ('67637', '柬埔寨55天游', '0.00');
INSERT INTO `yii2_product` VALUES ('67639', '菲律宾59天单次签证', '0.00');
INSERT INTO `yii2_product` VALUES ('67640', '菲律宾三个月多次签证', '0.00');
INSERT INTO `yii2_product` VALUES ('67641', '菲律宾半年多次签证', '0.00');

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
INSERT INTO `yii2_session` VALUES ('76c3kftln1ub95bkl2dikurfa6', '1517131639', 0x5F5F666C6173687C613A303A7B7D5F5F69647C733A313A2231223B);
INSERT INTO `yii2_session` VALUES ('ae3gfmqbbuvl1kj1gth44q0e36', '1517051107', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('ih181rn302u8v07lu7jgmj1lp4', '1516971419', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('jfmng616aaov570bdb9n5g3de2', '1517125178', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
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
) ENGINE=MyISAM AUTO_INCREMENT=66 DEFAULT CHARSET=utf8;

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
INSERT INTO `yii2_snapshot` VALUES ('31', '125/55', '100.000', '1', '1', '39336', '1', '柬埔寨55天游', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('32', '300/5', '200.000', '1', '2', '39337', '1', '柬埔寨55天游', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('33', '365/5', '300.000', '1', '3', '39338', '1', '柬埔寨55天游', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('34', '258/5', '200.000', '1', '1', '39339', '1', '菲律宾59天', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('35', '338/5', '285.000', '1', '2', '39340', '1', '菲律宾59天', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('36', '365/5', '300.000', '1', '3', '39341', '1', '菲律宾59天', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('37', '218/10天', '200.000', '1', '1', '39342', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('38', '248/8天', '200.000', '1', '1', '39343', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('39', '268/5天', '200.000', '1', '1', '39344', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('40', '520', '401.000', '1', '2', '39345', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('41', '1200', '950.000', '1', '3', '39346', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('42', '248/8天', '200.000', '2', '1', '39347', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('43', '260/5天', '200.000', '2', '1', '39348', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('44', '510/3天', '401.000', '1', '2', '39349', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('45', '520/3天', '401.000', '1', '2', '39345', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('46', '1200/1天', '950.000', '1', '3', '39346', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('47', '510/3天', '401.000', '1', '2', '39350', '0', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('48', '510/3天', '401.000', '2', '2', '39350', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('49', '1200/1天', '950.000', '2', '3', '39351', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('50', '220/4-5工', '200.000', '3', '1', '39352', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('51', '425/2-3工', '401.000', '3', '2', '39353', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('52', '990/1天', '950.000', '3', '3', '39354', '1', '菲律宾59天单次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('53', '940/7天', '550.000', '1', '1', '39355', '1', '菲律宾三个月多次', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('54', '1240/5天', '550.000', '1', '2', '39356', '1', '菲律宾三个月多次', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('55', '920/7天', '550.000', '2', '1', '39357', '1', '菲律宾三个月多次', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('56', '1220/4天', '550.000', '2', '2', '39358', '1', '菲律宾三个月多次', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('57', '600/5-6工', '550.000', '3', '1', '39359', '1', '菲律宾三个月多次', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('58', '900/3-4工', '550.000', '3', '2', '39360', '1', '菲律宾三个月多次', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('59', '1440/7天', '1000.000', '1', '1', '39361', '1', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('60', '1550/4天', '1000.000', '1', '2', '39362', '0', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('61', '1550/5天', '1000.000', '1', '2', '39362', '1', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('62', '1420/7天', '1000.000', '2', '1', '39363', '1', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('63', '1530/5天', '1000.000', '2', '2', '39364', '1', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('64', '1100/5-6工', '1000.000', '3', '1', '39365', '1', '菲律宾半年多次签证', '0.965');
INSERT INTO `yii2_snapshot` VALUES ('65', '1200/3-4工', '1000.000', '3', '2', '39366', '1', '菲律宾半年多次签证', '0.965');

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
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
