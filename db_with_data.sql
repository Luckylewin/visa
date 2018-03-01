/*
Navicat MySQL Data Transfer

Source Server         : localhost
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : visa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-03-01 18:04:32
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
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_admin
-- ----------------------------
INSERT INTO `yii2_admin` VALUES ('1', 'admin', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i', '771405950@qq.com', '2130706433', '1519895953', '2004602770', '1', '1482305564', '1519895953');
INSERT INTO `yii2_admin` VALUES ('4', 'admin2', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$DPm3NP2B4HDth70cflSqCeC0k562iwHf9P1gsBT728WrFA8oYcy2C', '876505905@qq.com', '2130706433', '1519881927', '1742115638', '1', '1482305564', '1519881927');
INSERT INTO `yii2_admin` VALUES ('5', 'test_admin', 'WEjgqej0F5wm2302g_8YBgWdspPNZaZQ', '$2y$13$ZgBVcI.l1LTMGjRlULoaiu7TrrGLKQpl0G4uH4Mal424PmBmAmxnu', 'test@qq.com', '2130706433', '1517996294', '2130706433', '1', '1517996226', '1517996294');
INSERT INTO `yii2_admin` VALUES ('6', 'customersevice', 'DxlkT2gDSiuSF_Jr5EdVILTjPY7juMaB', '$2y$13$rsk/gLdYWjbKWqlE8eaIaeR7o9BmpZyI/8x1xF2tv3VU6TzwK.D6u', 'newpoyang@163.com', '2004602159', '1519884600', '1742115638', '1', '1519450624', '1519884600');
INSERT INTO `yii2_admin` VALUES ('8', 'admin1', 'K8BNr0aM6tAt57spK5fL7sKrEY6gDRRW', '$2y$13$.TYukIqSTsC6Bb5S3HAKou5M4ptHfyFQUBbpX/0xPUIXS2gDcIlMO', 'newpoyang@sohu.com', '2004602006', '1519811780', '2004602006', '1', '1519810203', '1519811780');
INSERT INTO `yii2_admin` VALUES ('9', 'LECHUFA-FENG', 'jonJehgNj5xIfL7X_zVCVJrDOlr6nk3w', '$2y$13$iu9EdQ8PhcDlgGm.rgzkSOtTtuL..5hnHGiAmJ1QrozumC8Lf9GLq', '3148018245@qq.com', '2147483647', '0', '0', '1', '1519830823', '1519830823');
INSERT INTO `yii2_admin` VALUES ('10', 'LECHUFA-SU', '3e9jiq_BX7maO8C_76ooN6eCfOhFpXbl', '$2y$13$BhVP50sNlgJMl0MajDBXWO7h4pNvpbnk7TJWvua3j3bzp2oYd/3sq', '3352646786@qq.com', '2147483647', '1519894485', '2147483647', '1', '1519831326', '1519894485');
INSERT INTO `yii2_admin` VALUES ('11', 'LECHUFA-ZHONG', '_UtDe0BckV0ToFu1_HIjQfarJx1F8uuS', '$2y$13$qEnDvwI9H2RlWd53nwrw0e1UAS2lSDIbgfjjq/ghsG/.gmxprmIvm', '3389773613@qq.com', '2147483647', '1519882010', '2004602006', '1', '1519831374', '1519882010');
INSERT INTO `yii2_admin` VALUES ('12', 'LECHUFA-QIONG', 'dCXJ5xfc4f2YW6C5PcZJKkQcAEM4w1TW', '$2y$13$X7cz7BzV42o2hSqLrA88Eu0IXFg1IszhvCh3y2rrtr2HyyPbkBABS', '2644943551@qq.com', '2147483647', '0', '0', '1', '1519831404', '1519890914');
INSERT INTO `yii2_admin` VALUES ('13', 'LECHUFA-YANG', 'IsnYzUaokcJl2lisTsEA3djCIkk6bJ_I', '$2y$13$MEmpcKV4A9xRCr98dFTv2O/5MSV978FVPHJxzjhN6sD/iIuRCgD3u', '3127547767@qq.com', '2147483647', '1519895759', '2004602770', '1', '1519831470', '1519895759');

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
INSERT INTO `yii2_auth_assignment` VALUES ('客服', '12', '1519831427');
INSERT INTO `yii2_auth_assignment` VALUES ('客服', '13', '1519831477');
INSERT INTO `yii2_auth_assignment` VALUES ('客服', '6', '1519450634');
INSERT INTO `yii2_auth_assignment` VALUES ('客服', '7', '1519806395');
INSERT INTO `yii2_auth_assignment` VALUES ('操作人员', '10', '1519883010');
INSERT INTO `yii2_auth_assignment` VALUES ('操作人员', '11', '1519831417');
INSERT INTO `yii2_auth_assignment` VALUES ('编辑', '4', '1517974399');
INSERT INTO `yii2_auth_assignment` VALUES ('编辑', '5', '1517996235');
INSERT INTO `yii2_auth_assignment` VALUES ('编辑', '8', '1519810210');
INSERT INTO `yii2_auth_assignment` VALUES ('超级管理员', '1', '1484712737');
INSERT INTO `yii2_auth_assignment` VALUES ('超级管理员', '9', '1519830838');

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
INSERT INTO `yii2_auth_item` VALUES ('#', '2', '', '#', null, '1519808376', '1519810140');
INSERT INTO `yii2_auth_item` VALUES ('admin/auth', '2', '', 'admin/auth', null, '1484734191', '1519810164');
INSERT INTO `yii2_auth_item` VALUES ('admin/create', '2', '', 'admin/create', null, '1484734191', '1519810164');
INSERT INTO `yii2_auth_item` VALUES ('admin/delete', '2', '', 'admin/delete', null, '1484734191', '1519810164');
INSERT INTO `yii2_auth_item` VALUES ('admin/index', '2', '', 'admin/index', null, '1484734191', '1519810164');
INSERT INTO `yii2_auth_item` VALUES ('admin/update', '2', '', 'admin/update', null, '1484734191', '1519810164');
INSERT INTO `yii2_auth_item` VALUES ('backup/default/index', '2', '', 'backup/default/index', null, '1519808877', '1519811523');
INSERT INTO `yii2_auth_item` VALUES ('combo/create', '2', '', 'combo/create', null, '1519808877', '1519810147');
INSERT INTO `yii2_auth_item` VALUES ('combo/delete', '2', '', 'combo/delete', null, '1519808877', '1519810147');
INSERT INTO `yii2_auth_item` VALUES ('combo/index', '2', '', 'combo/index', null, '1517996186', '1519810147');
INSERT INTO `yii2_auth_item` VALUES ('combo/update', '2', '', 'combo/update', null, '1519808877', '1519810161');
INSERT INTO `yii2_auth_item` VALUES ('combo/view', '2', '', 'combo/view', null, '1519378925', '1519810147');
INSERT INTO `yii2_auth_item` VALUES ('config/attachment', '2', '', 'config/attachment', null, '1484734191', '1519810140');
INSERT INTO `yii2_auth_item` VALUES ('config/basic', '2', '', 'config/basic', null, '1484734191', '1519810140');
INSERT INTO `yii2_auth_item` VALUES ('config/send-mail', '2', '', 'config/send-mail', null, '1484734191', '1519810140');
INSERT INTO `yii2_auth_item` VALUES ('database/export', '2', '', 'database/export', null, '1484734305', '1519811523');
INSERT INTO `yii2_auth_item` VALUES ('excel-setting/update', '2', '', 'excel-setting/update', null, '1519451875', '1519451875');
INSERT INTO `yii2_auth_item` VALUES ('excel/import', '2', '', 'excel/import', null, '1519436284', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('excel/index', '2', '', 'excel/index', null, '1519436031', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('index/frame', '2', '', 'index/frame', null, '1518057962', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('index/index', '2', '', 'index/index', null, '1484734191', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('menu/create', '2', '', 'menu/create', null, '1484734191', '1519810140');
INSERT INTO `yii2_auth_item` VALUES ('menu/delete', '2', '', 'menu/delete', null, '1484734191', '1519810140');
INSERT INTO `yii2_auth_item` VALUES ('menu/index', '2', '', 'menu/index', null, '1484734191', '1519810140');
INSERT INTO `yii2_auth_item` VALUES ('menu/update', '2', '', 'menu/update', null, '1484734191', '1519810140');
INSERT INTO `yii2_auth_item` VALUES ('order/create', '2', '', 'order/create', null, '1518074401', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('order/delete', '2', '', 'order/delete', null, '1519450583', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('order/index', '2', '', 'order/index', null, '1517996186', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('order/update', '2', '', 'order/update', null, '1519450583', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('order/view', '2', '', 'order/view', null, '1519377930', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('product/delete', '2', '', 'product/delete', null, '1519808877', '1519811523');
INSERT INTO `yii2_auth_item` VALUES ('product/index', '2', '', 'product/index', null, '1517996186', '1519811523');
INSERT INTO `yii2_auth_item` VALUES ('product/update', '2', '', 'product/update', null, '1519808877', '1519811523');
INSERT INTO `yii2_auth_item` VALUES ('product/view', '2', '', 'product/view', null, '1519378499', '1519811523');
INSERT INTO `yii2_auth_item` VALUES ('role/auth', '2', '', 'role/auth', null, '1484734191', '1519810164');
INSERT INTO `yii2_auth_item` VALUES ('role/create', '2', '', 'role/create', null, '1484734191', '1519810164');
INSERT INTO `yii2_auth_item` VALUES ('role/delete', '2', '', 'role/delete', null, '1484734191', '1519810164');
INSERT INTO `yii2_auth_item` VALUES ('role/export-setting', '2', '', 'role/export-setting', null, '1519438814', '1519451875');
INSERT INTO `yii2_auth_item` VALUES ('role/index', '2', '', 'role/index', null, '1484734191', '1519810164');
INSERT INTO `yii2_auth_item` VALUES ('role/update', '2', '', 'role/update', null, '1484734191', '1519810164');
INSERT INTO `yii2_auth_item` VALUES ('servicer/create', '2', '', 'servicer/create', null, '1519810140', '1519810147');
INSERT INTO `yii2_auth_item` VALUES ('servicer/index', '2', '', 'servicer/index', null, '1517996187', '1519810147');
INSERT INTO `yii2_auth_item` VALUES ('servicer/view', '2', '', 'servicer/view', null, '1519884478', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('transator/delete', '2', '', 'transator/delete', null, '1519810140', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('transator/index', '2', '', 'transator/index', null, '1517996187', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('transator/update', '2', '', 'transator/update', null, '1519810140', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('transator/view', '2', '', 'transator/view', null, '1519884478', '1519884505');
INSERT INTO `yii2_auth_item` VALUES ('客服', '1', '接待客服', null, null, '1519450557', '1519806275');
INSERT INTO `yii2_auth_item` VALUES ('操作人员', '1', '办理签证', null, null, '1519830888', '1519830888');
INSERT INTO `yii2_auth_item` VALUES ('编辑', '1', '网站编辑', null, null, '1484712712', '1519884559');
INSERT INTO `yii2_auth_item` VALUES ('超级管理员', '1', '授权所有权限', null, null, '1484712662', '1519884549');

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
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'admin/auth');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'admin/create');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'admin/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'admin/index');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'admin/update');
INSERT INTO `yii2_auth_item_child` VALUES ('编辑', 'backup/default/index');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'config/attachment');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'config/basic');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'config/send-mail');
INSERT INTO `yii2_auth_item_child` VALUES ('编辑', 'database/export');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'database/export');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'excel/import');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'excel/import');
INSERT INTO `yii2_auth_item_child` VALUES ('编辑', 'excel/import');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'excel/index');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'excel/index');
INSERT INTO `yii2_auth_item_child` VALUES ('编辑', 'excel/index');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'index/frame');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'index/frame');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'index/index');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'index/index');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'index/index');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'menu/create');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'menu/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'menu/index');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'menu/update');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'order/create');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'order/create');
INSERT INTO `yii2_auth_item_child` VALUES ('编辑', 'order/create');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'order/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'order/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'order/index');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'order/index');
INSERT INTO `yii2_auth_item_child` VALUES ('编辑', 'order/index');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'order/update');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'order/update');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'order/view');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'order/view');
INSERT INTO `yii2_auth_item_child` VALUES ('编辑', 'order/view');
INSERT INTO `yii2_auth_item_child` VALUES ('编辑', 'product/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('编辑', 'product/index');
INSERT INTO `yii2_auth_item_child` VALUES ('编辑', 'product/update');
INSERT INTO `yii2_auth_item_child` VALUES ('编辑', 'product/view');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'role/auth');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'role/create');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'role/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'role/index');
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员', 'role/update');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'servicer/view');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'servicer/view');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'transator/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'transator/delete');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'transator/index');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'transator/index');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'transator/update');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'transator/update');
INSERT INTO `yii2_auth_item_child` VALUES ('客服', 'transator/view');
INSERT INTO `yii2_auth_item_child` VALUES ('操作人员', 'transator/view');

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
INSERT INTO `yii2_auth_rule` VALUES ('#', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:1:\"#\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808376;s:9:\"updatedAt\";i:1519810140;}', '1519808376', '1519810140');
INSERT INTO `yii2_auth_rule` VALUES ('admin/auth', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"admin/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810164;}', '1484734191', '1519810164');
INSERT INTO `yii2_auth_rule` VALUES ('admin/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810164;}', '1484734191', '1519810164');
INSERT INTO `yii2_auth_rule` VALUES ('admin/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810164;}', '1484734191', '1519810164');
INSERT INTO `yii2_auth_rule` VALUES ('admin/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"admin/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810164;}', '1484734191', '1519810164');
INSERT INTO `yii2_auth_rule` VALUES ('admin/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810164;}', '1484734191', '1519810164');
INSERT INTO `yii2_auth_rule` VALUES ('backup/default/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:20:\"backup/default/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808877;s:9:\"updatedAt\";i:1519811523;}', '1519808877', '1519811523');
INSERT INTO `yii2_auth_rule` VALUES ('combo/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"combo/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808877;s:9:\"updatedAt\";i:1519810147;}', '1519808877', '1519810147');
INSERT INTO `yii2_auth_rule` VALUES ('combo/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"combo/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808877;s:9:\"updatedAt\";i:1519810147;}', '1519808877', '1519810147');
INSERT INTO `yii2_auth_rule` VALUES ('combo/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"combo/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996186;s:9:\"updatedAt\";i:1519810147;}', '1517996186', '1519810147');
INSERT INTO `yii2_auth_rule` VALUES ('combo/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"combo/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808877;s:9:\"updatedAt\";i:1519810161;}', '1519808877', '1519810161');
INSERT INTO `yii2_auth_rule` VALUES ('combo/view', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"combo/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519378925;s:9:\"updatedAt\";i:1519810147;}', '1519378925', '1519810147');
INSERT INTO `yii2_auth_rule` VALUES ('config/attachment', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:17:\"config/attachment\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810140;}', '1484734191', '1519810140');
INSERT INTO `yii2_auth_rule` VALUES ('config/basic', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"config/basic\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810140;}', '1484734191', '1519810140');
INSERT INTO `yii2_auth_rule` VALUES ('config/send-mail', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:16:\"config/send-mail\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810140;}', '1484734191', '1519810140');
INSERT INTO `yii2_auth_rule` VALUES ('database/export', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"database/export\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734305;s:9:\"updatedAt\";i:1519811523;}', '1484734305', '1519811523');
INSERT INTO `yii2_auth_rule` VALUES ('excel-setting/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:20:\"excel-setting/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519451875;s:9:\"updatedAt\";i:1519451875;}', '1519451875', '1519451875');
INSERT INTO `yii2_auth_rule` VALUES ('excel/import', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"excel/import\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519436284;s:9:\"updatedAt\";i:1519884505;}', '1519436284', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('excel/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"excel/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519436031;s:9:\"updatedAt\";i:1519884505;}', '1519436031', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('index/frame', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"index/frame\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1518057962;s:9:\"updatedAt\";i:1519884505;}', '1518057962', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('index/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"index/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519884505;}', '1484734191', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('menu/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810140;}', '1484734191', '1519810140');
INSERT INTO `yii2_auth_rule` VALUES ('menu/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810140;}', '1484734191', '1519810140');
INSERT INTO `yii2_auth_rule` VALUES ('menu/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"menu/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810140;}', '1484734191', '1519810140');
INSERT INTO `yii2_auth_rule` VALUES ('menu/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810140;}', '1484734191', '1519810140');
INSERT INTO `yii2_auth_rule` VALUES ('order/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"order/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1518074401;s:9:\"updatedAt\";i:1519884505;}', '1518074401', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('order/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"order/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519450583;s:9:\"updatedAt\";i:1519884505;}', '1519450583', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('order/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"order/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996186;s:9:\"updatedAt\";i:1519884505;}', '1517996186', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('order/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"order/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519450583;s:9:\"updatedAt\";i:1519884505;}', '1519450583', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('order/view', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"order/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519377930;s:9:\"updatedAt\";i:1519884505;}', '1519377930', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('product/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:14:\"product/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808877;s:9:\"updatedAt\";i:1519811523;}', '1519808877', '1519811523');
INSERT INTO `yii2_auth_rule` VALUES ('product/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:13:\"product/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996186;s:9:\"updatedAt\";i:1519811523;}', '1517996186', '1519811523');
INSERT INTO `yii2_auth_rule` VALUES ('product/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:14:\"product/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808877;s:9:\"updatedAt\";i:1519811523;}', '1519808877', '1519811523');
INSERT INTO `yii2_auth_rule` VALUES ('product/view', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"product/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519378499;s:9:\"updatedAt\";i:1519811523;}', '1519378499', '1519811523');
INSERT INTO `yii2_auth_rule` VALUES ('role/auth', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:9:\"role/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810164;}', '1484734191', '1519810164');
INSERT INTO `yii2_auth_rule` VALUES ('role/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810164;}', '1484734191', '1519810164');
INSERT INTO `yii2_auth_rule` VALUES ('role/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810164;}', '1484734191', '1519810164');
INSERT INTO `yii2_auth_rule` VALUES ('role/export-setting', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:19:\"role/export-setting\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519438814;s:9:\"updatedAt\";i:1519451875;}', '1519438814', '1519451875');
INSERT INTO `yii2_auth_rule` VALUES ('role/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"role/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810164;}', '1484734191', '1519810164');
INSERT INTO `yii2_auth_rule` VALUES ('role/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1519810164;}', '1484734191', '1519810164');
INSERT INTO `yii2_auth_rule` VALUES ('servicer/create', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"servicer/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519810140;s:9:\"updatedAt\";i:1519810147;}', '1519810140', '1519810147');
INSERT INTO `yii2_auth_rule` VALUES ('servicer/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:14:\"servicer/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996187;s:9:\"updatedAt\";i:1519810147;}', '1517996187', '1519810147');
INSERT INTO `yii2_auth_rule` VALUES ('servicer/view', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:13:\"servicer/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519884478;s:9:\"updatedAt\";i:1519884505;}', '1519884478', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('transator/delete', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:16:\"transator/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519810140;s:9:\"updatedAt\";i:1519884505;}', '1519810140', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('transator/index', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"transator/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996187;s:9:\"updatedAt\";i:1519884505;}', '1517996187', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('transator/update', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:16:\"transator/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519810140;s:9:\"updatedAt\";i:1519884505;}', '1519810140', '1519884505');
INSERT INTO `yii2_auth_rule` VALUES ('transator/view', 'O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:14:\"transator/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519884478;s:9:\"updatedAt\";i:1519884505;}', '1519884478', '1519884505');

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
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_export_setting
-- ----------------------------
INSERT INTO `yii2_export_setting` VALUES ('1', 'editors', '0');
INSERT INTO `yii2_export_setting` VALUES ('2', 'administors', '1');
INSERT INTO `yii2_export_setting` VALUES ('3', 'customer service', '0');
INSERT INTO `yii2_export_setting` VALUES ('4', '操作人员', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_menu
-- ----------------------------
INSERT INTO `yii2_menu` VALUES ('1', '0', '我的面板', '#', 'fa-home', '0', '0');
INSERT INTO `yii2_menu` VALUES ('2', '0', '系统设置', 'config/basic', 'fa-cogs', '1', '99');
INSERT INTO `yii2_menu` VALUES ('3', '0', '管理员设置', 'admin/index', 'fa-user', '1', '98');
INSERT INTO `yii2_menu` VALUES ('6', '0', '数据库设置', 'database/export', 'fa-hdd-o', '0', '0');
INSERT INTO `yii2_menu` VALUES ('8', '1', '系统信息', '#', '', '1', '0');
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
INSERT INTO `yii2_menu` VALUES ('64', '36', '套餐更新', 'combo/update', '', '0', '3');
INSERT INTO `yii2_menu` VALUES ('65', '36', '套餐查看', 'combo/view', '', '0', '0');
INSERT INTO `yii2_menu` VALUES ('66', '38', '订单导出', 'excel/index', '', '0', '5');
INSERT INTO `yii2_menu` VALUES ('67', '38', '订单导入', 'excel/import', '', '0', '6');
INSERT INTO `yii2_menu` VALUES ('70', '47', '查看', 'transator/view', '', '0', '0');
INSERT INTO `yii2_menu` VALUES ('71', '45', '查看', 'servicer/view', '', '0', '0');

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
  `mod_operator_id` smallint(6) DEFAULT NULL,
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
) ENGINE=InnoDB AUTO_INCREMENT=2170 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_order
-- ----------------------------
INSERT INTO `yii2_order` VALUES ('2166', '67639', '120098330227611849', '1', '1', '2018-02-27', 'n1ce12n1ce', '3471', '2', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '23.00', '0.00', '2018-02-27', '2018-02-27', '2018-02-28', '', '10', null, '重庆  重庆市  渝北区  回兴街道农业园区宝石路14号枫桥水郡14栋2单元6-2 ', '李娟', '18996222217', '', '', '', '', '', '', '', '', '4', '0', '1519832035', '1519882907');
INSERT INTO `yii2_order` VALUES ('2167', '67639', 'ZK20180227', '2', '1', '2018-02-27', '驿签签证', '3472', '2', '', '248.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '2018-02-27', '2018-02-28', '2018-02-28', '', '10', null, '福建省厦门市东渡路都市港湾5#2103', '张蕊', '18506955721', '', '', '', '', '', '', '', '', '4', '0', '1519882530', '1519884535');
INSERT INTO `yii2_order` VALUES ('2168', '67639', 'TH20180227', '3', '2', '2018-02-27', '菲亚旅行社', '3473', '1', '', '425.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '2018-03-01', '2018-03-02', '2018-03-04', '', '10', null, '山东省潍坊市安丘市景芝镇临浯社区', '宋国杰', '15265672916', '', '', '', '', '', '', '', '', '4', '0', '1519882750', '1519882947');
INSERT INTO `yii2_order` VALUES ('2169', '67639', 'TH20180301', '3', '2', '2018-03-01', '国旅四川-马良', '3473', '2', '', '425.00', '1', '1', '', '0.00', '0.00', '', '0.00', '0.00', '', '0.00', '0.00', '2018-03-01', '2018-03-02', '2018-03-04', '', '10', null, '', '', '', '', '', '', '', '', '', '', '', '4', '0', '1519894472', '1519894555');

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
INSERT INTO `yii2_order_to_transactor` VALUES ('2158', '3165');
INSERT INTO `yii2_order_to_transactor` VALUES ('2163', '3202');
INSERT INTO `yii2_order_to_transactor` VALUES ('2164', '3409');
INSERT INTO `yii2_order_to_transactor` VALUES ('2165', '3410');
INSERT INTO `yii2_order_to_transactor` VALUES ('2166', '3411');
INSERT INTO `yii2_order_to_transactor` VALUES ('2167', '3412');
INSERT INTO `yii2_order_to_transactor` VALUES ('2168', '3413');
INSERT INTO `yii2_order_to_transactor` VALUES ('2169', '3414');

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
  `admin_id` int(11) NOT NULL COMMENT '后台帐号id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_servicer
-- ----------------------------
INSERT INTO `yii2_servicer` VALUES ('1', '多多', '多多', '12');
INSERT INTO `yii2_servicer` VALUES ('2', '小阳', 'xiaoyang', '13');

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
INSERT INTO `yii2_session` VALUES ('3kktioalbs8t4e74luotpk4ee4', '1519897676', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('gng7knrdksomf5v80af6kcrfh6', '1519833566', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C693A31303B);
INSERT INTO `yii2_session` VALUES ('ik47aq376ukl9cq7tto1gpr2b5', '1519896048', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('jmtqqbc4u042jjbvlsu8uhlnr7', '1519813223', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C693A383B);
INSERT INTO `yii2_session` VALUES ('nldof53o7k96755f4fi4kan2r1', '1519889436', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('p3oeh14qklgcvpu58eshgpign5', '1519894862', 0x5F5F666C6173687C613A303A7B7D5F5F69647C693A313B);
INSERT INTO `yii2_session` VALUES ('pjm6lgqvunaeth51ntnfp21nn2', '1519811522', 0x5F5F666C6173687C613A303A7B7D5F5F72657475726E55726C7C733A31303A222F61646D696E2E706870223B5F5F69647C693A363B);

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
) ENGINE=MyISAM AUTO_INCREMENT=3474 DEFAULT CHARSET=utf8;

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
INSERT INTO `yii2_snapshot` VALUES ('3463', '1500/5天', '1000.000', '2', '2', '39364', '1', '菲律宾半年多次签证', '1.000', '0');
INSERT INTO `yii2_snapshot` VALUES ('3468', '268/5天', '200.000', '1', '1', '39344', '1', '菲律宾59天单次签证', '0.965', '0');
INSERT INTO `yii2_snapshot` VALUES ('3469', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3470', '268/5天', '200.000', '1', '1', '0', '1', '菲律宾59天单次签证', '0.965', '1');
INSERT INTO `yii2_snapshot` VALUES ('3471', '248/8天', '200.000', '1', '1', '39343', '1', '菲律宾59天单次签证', '0.965', '0');
INSERT INTO `yii2_snapshot` VALUES ('3472', '248/8天', '200.000', '2', '1', '39347', '1', '菲律宾59天单次签证', '1.000', '0');
INSERT INTO `yii2_snapshot` VALUES ('3473', '425/2-3工', '401.000', '3', '2', '39353', '1', '菲律宾59天单次签证', '1.000', '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=3415 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
INSERT INTO `yii2_transator` VALUES ('3173', '王烨微', '1', '', '', '', '0', '1519460709', '0', '测试');
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
INSERT INTO `yii2_transator` VALUES ('3406', '杨柳波', '1', '', '', '', '0', '1519873957', '0', '');
INSERT INTO `yii2_transator` VALUES ('3409', '范茂杰', '1', '', '', '', '0', '1519891071', '0', '');
INSERT INTO `yii2_transator` VALUES ('3410', '程妍', '1', '', '', '', '0', '1519891071', '0', '');
INSERT INTO `yii2_transator` VALUES ('3411', '李娟', '1', '', '', '', '0', '1519918410', '0', '');
INSERT INTO `yii2_transator` VALUES ('3412', '胡金亮', '1', '', '', '', '0', '1519968877', '0', '父亲名字：胡金根，\n母亲：成水凤，\n老婆：李燕  \n女儿：胡至芯 10岁 \n儿子：胡至远 10岁\n电话18170085682\n入境城市：马尼拉\n');
INSERT INTO `yii2_transator` VALUES ('3413', '宋国杰', '1', '', '', '', '0', '1519969049', '0', '');
INSERT INTO `yii2_transator` VALUES ('3414', '魏巍', '1', '', '', '', '0', '1519980860', '0', '');

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
