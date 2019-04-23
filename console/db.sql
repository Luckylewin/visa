/*
Navicat MySQL Data Transfer

Source Server         : local
Source Server Version : 50553
Source Host           : localhost:3306
Source Database       : visa

Target Server Type    : MYSQL
Target Server Version : 50553
File Encoding         : 65001

Date: 2018-01-08 01:54:12
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
INSERT INTO `yii2_admin` VALUES ('1', 'admin', 'SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ', '$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i', '771405950@qq.com', '2130706433', '1484733705', '2130706433', '1', '1482305564', '1484733705');

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
  `combo_cost` decimal(10,2) DEFAULT '0.00' COMMENT '支出成本',
  `created_at` date NOT NULL,
  `updated_at` date NOT NULL,
  `uid` smallint(6) NOT NULL COMMENT '用户id',
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`combo_id`),
  KEY `ppid` (`product_id`) USING BTREE,
  CONSTRAINT `combo_product_id` FOREIGN KEY (`product_id`) REFERENCES `yii2_product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39284 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of yii2_country
-- ----------------------------
INSERT INTO `yii2_country` VALUES ('1', 'AL', '阿尔巴尼亚');
INSERT INTO `yii2_country` VALUES ('2', 'DZ', '阿尔及利亚');
INSERT INTO `yii2_country` VALUES ('3', 'AF', '阿富汗');
INSERT INTO `yii2_country` VALUES ('4', 'AR', '阿根廷');
INSERT INTO `yii2_country` VALUES ('5', 'AE', '阿拉伯联合酋长国');
INSERT INTO `yii2_country` VALUES ('6', 'AW', '阿鲁巴');
INSERT INTO `yii2_country` VALUES ('7', 'OM', '阿曼');
INSERT INTO `yii2_country` VALUES ('8', 'AZ', '阿塞拜疆');
INSERT INTO `yii2_country` VALUES ('9', 'EG', '埃及');
INSERT INTO `yii2_country` VALUES ('10', 'ET', '埃塞俄比亚');
INSERT INTO `yii2_country` VALUES ('11', 'IE', '爱尔兰');
INSERT INTO `yii2_country` VALUES ('12', 'EE', '爱沙尼亚');
INSERT INTO `yii2_country` VALUES ('13', 'AD', '安道尔');
INSERT INTO `yii2_country` VALUES ('14', 'AO', '安哥拉');
INSERT INTO `yii2_country` VALUES ('15', 'AI', '安圭拉岛');
INSERT INTO `yii2_country` VALUES ('16', 'AG', '安提瓜和巴布达');
INSERT INTO `yii2_country` VALUES ('17', 'AT', '奥地利');
INSERT INTO `yii2_country` VALUES ('18', 'AX', '奥兰岛');
INSERT INTO `yii2_country` VALUES ('19', 'AU', '澳大利亚');
INSERT INTO `yii2_country` VALUES ('20', 'MO', '澳门特别行政区');
INSERT INTO `yii2_country` VALUES ('21', 'BB', '巴巴多斯');
INSERT INTO `yii2_country` VALUES ('22', 'PG', '巴布亚新几内亚');
INSERT INTO `yii2_country` VALUES ('23', 'BS', '巴哈马');
INSERT INTO `yii2_country` VALUES ('24', 'PK', '巴基斯坦');
INSERT INTO `yii2_country` VALUES ('25', 'PY', '巴拉圭');
INSERT INTO `yii2_country` VALUES ('26', 'PS', '巴勒斯坦民族权力机构');
INSERT INTO `yii2_country` VALUES ('27', 'BH', '巴林');
INSERT INTO `yii2_country` VALUES ('28', 'PA', '巴拿马');
INSERT INTO `yii2_country` VALUES ('29', 'BR', '巴西');
INSERT INTO `yii2_country` VALUES ('30', 'BY', '白俄罗斯');
INSERT INTO `yii2_country` VALUES ('31', 'BM', '百慕大群岛');
INSERT INTO `yii2_country` VALUES ('32', 'BG', '保加利亚');
INSERT INTO `yii2_country` VALUES ('33', 'MP', '北马里亚纳群岛');
INSERT INTO `yii2_country` VALUES ('34', 'BJ', '贝宁');
INSERT INTO `yii2_country` VALUES ('35', 'BE', '比利时');
INSERT INTO `yii2_country` VALUES ('36', 'IS', '冰岛');
INSERT INTO `yii2_country` VALUES ('37', 'PR', '波多黎各');
INSERT INTO `yii2_country` VALUES ('38', 'PL', '波兰');
INSERT INTO `yii2_country` VALUES ('39', 'BA', '波斯尼亚和黑塞哥维那');
INSERT INTO `yii2_country` VALUES ('40', 'BO', '玻利维亚');
INSERT INTO `yii2_country` VALUES ('41', 'BZ', '伯利兹');
INSERT INTO `yii2_country` VALUES ('42', 'BW', '博茨瓦纳');
INSERT INTO `yii2_country` VALUES ('43', 'BQ', '博内尔');
INSERT INTO `yii2_country` VALUES ('44', 'BT', '不丹');
INSERT INTO `yii2_country` VALUES ('45', 'BF', '布基纳法索');
INSERT INTO `yii2_country` VALUES ('46', 'BI', '布隆迪');
INSERT INTO `yii2_country` VALUES ('47', 'BV', '布韦岛');
INSERT INTO `yii2_country` VALUES ('48', 'KP', '朝鲜');
INSERT INTO `yii2_country` VALUES ('49', 'GQ', '赤道几内亚');
INSERT INTO `yii2_country` VALUES ('50', 'DK', '丹麦');
INSERT INTO `yii2_country` VALUES ('51', 'DE', '德国');
INSERT INTO `yii2_country` VALUES ('52', 'TL', '东帝汶');
INSERT INTO `yii2_country` VALUES ('53', 'TG', '多哥');
INSERT INTO `yii2_country` VALUES ('54', 'DO', '多米尼加共和国');
INSERT INTO `yii2_country` VALUES ('55', 'DM', '多米尼克');
INSERT INTO `yii2_country` VALUES ('56', 'RU', '俄罗斯');
INSERT INTO `yii2_country` VALUES ('57', 'EC', '厄瓜多尔');
INSERT INTO `yii2_country` VALUES ('58', 'ER', '厄立特里亚');
INSERT INTO `yii2_country` VALUES ('59', 'FR', '法国');
INSERT INTO `yii2_country` VALUES ('60', 'FO', '法罗群岛');
INSERT INTO `yii2_country` VALUES ('61', 'PF', '法属波利尼西亚');
INSERT INTO `yii2_country` VALUES ('62', 'GF', '法属圭亚那');
INSERT INTO `yii2_country` VALUES ('63', 'TF', '法属南极地区');
INSERT INTO `yii2_country` VALUES ('64', 'VA', '梵蒂冈城');
INSERT INTO `yii2_country` VALUES ('65', 'PH', '菲律宾');
INSERT INTO `yii2_country` VALUES ('66', 'FJ', '斐济群岛');
INSERT INTO `yii2_country` VALUES ('67', 'FI', '芬兰');
INSERT INTO `yii2_country` VALUES ('68', 'CV', '佛得角');
INSERT INTO `yii2_country` VALUES ('69', 'FK', '福克兰群岛(马尔维纳斯群岛)');
INSERT INTO `yii2_country` VALUES ('70', 'GM', '冈比亚');
INSERT INTO `yii2_country` VALUES ('71', 'CD', '刚果(DRC)');
INSERT INTO `yii2_country` VALUES ('72', 'CG', '刚果共和国');
INSERT INTO `yii2_country` VALUES ('73', 'CO', '哥伦比亚');
INSERT INTO `yii2_country` VALUES ('74', 'CR', '哥斯达黎加');
INSERT INTO `yii2_country` VALUES ('75', 'GG', '格恩西岛');
INSERT INTO `yii2_country` VALUES ('76', 'GD', '格林纳达');
INSERT INTO `yii2_country` VALUES ('77', 'GL', '格陵兰');
INSERT INTO `yii2_country` VALUES ('78', 'GE', '格鲁吉亚');
INSERT INTO `yii2_country` VALUES ('79', 'CU', '古巴');
INSERT INTO `yii2_country` VALUES ('80', 'GP', '瓜德罗普岛');
INSERT INTO `yii2_country` VALUES ('81', 'GU', '关岛');
INSERT INTO `yii2_country` VALUES ('82', 'GY', '圭亚那');
INSERT INTO `yii2_country` VALUES ('83', 'KZ', '哈萨克斯坦');
INSERT INTO `yii2_country` VALUES ('84', 'HT', '海地');
INSERT INTO `yii2_country` VALUES ('85', 'KR', '韩国');
INSERT INTO `yii2_country` VALUES ('86', 'NL', '荷兰');
INSERT INTO `yii2_country` VALUES ('87', 'HM', '赫德和麦克唐纳群岛');
INSERT INTO `yii2_country` VALUES ('88', 'ME', '黑山共和国');
INSERT INTO `yii2_country` VALUES ('89', 'HN', '洪都拉斯');
INSERT INTO `yii2_country` VALUES ('90', 'KI', '基里巴斯');
INSERT INTO `yii2_country` VALUES ('91', 'DJ', '吉布提');
INSERT INTO `yii2_country` VALUES ('92', 'KG', '吉尔吉斯斯坦');
INSERT INTO `yii2_country` VALUES ('93', 'GN', '几内亚');
INSERT INTO `yii2_country` VALUES ('94', 'GW', '几内亚比绍');
INSERT INTO `yii2_country` VALUES ('95', 'CA', '加拿大');
INSERT INTO `yii2_country` VALUES ('96', 'GH', '加纳');
INSERT INTO `yii2_country` VALUES ('97', 'GA', '加蓬');
INSERT INTO `yii2_country` VALUES ('98', 'KH', '柬埔寨');
INSERT INTO `yii2_country` VALUES ('99', 'CZ', '捷克共和国');
INSERT INTO `yii2_country` VALUES ('100', 'ZW', '津巴布韦');
INSERT INTO `yii2_country` VALUES ('101', 'CM', '喀麦隆');
INSERT INTO `yii2_country` VALUES ('102', 'QA', '卡塔尔');
INSERT INTO `yii2_country` VALUES ('103', 'KY', '开曼群岛');
INSERT INTO `yii2_country` VALUES ('104', 'CC', '科科斯群岛(基灵群岛)');
INSERT INTO `yii2_country` VALUES ('105', 'KM', '科摩罗联盟');
INSERT INTO `yii2_country` VALUES ('106', 'CI', '科特迪瓦共和国');
INSERT INTO `yii2_country` VALUES ('107', 'KW', '科威特');
INSERT INTO `yii2_country` VALUES ('108', 'HR', '克罗地亚');
INSERT INTO `yii2_country` VALUES ('109', 'KE', '肯尼亚');
INSERT INTO `yii2_country` VALUES ('110', 'CK', '库可群岛');
INSERT INTO `yii2_country` VALUES ('111', 'CW', '库拉索');
INSERT INTO `yii2_country` VALUES ('112', 'LV', '拉脱维亚');
INSERT INTO `yii2_country` VALUES ('113', 'LS', '莱索托');
INSERT INTO `yii2_country` VALUES ('114', 'LA', '老挝');
INSERT INTO `yii2_country` VALUES ('115', 'LB', '黎巴嫩');
INSERT INTO `yii2_country` VALUES ('116', 'LT', '立陶宛');
INSERT INTO `yii2_country` VALUES ('117', 'LR', '利比里亚');
INSERT INTO `yii2_country` VALUES ('118', 'LY', '利比亚');
INSERT INTO `yii2_country` VALUES ('119', 'LI', '列支敦士登');
INSERT INTO `yii2_country` VALUES ('120', 'RE', '留尼汪岛');
INSERT INTO `yii2_country` VALUES ('121', 'LU', '卢森堡');
INSERT INTO `yii2_country` VALUES ('122', 'RW', '卢旺达');
INSERT INTO `yii2_country` VALUES ('123', 'RO', '罗马尼亚');
INSERT INTO `yii2_country` VALUES ('124', 'MG', '马达加斯加');
INSERT INTO `yii2_country` VALUES ('125', 'IM', '马恩岛');
INSERT INTO `yii2_country` VALUES ('126', 'MV', '马尔代夫');
INSERT INTO `yii2_country` VALUES ('127', 'MT', '马耳他');
INSERT INTO `yii2_country` VALUES ('128', 'MW', '马拉维');
INSERT INTO `yii2_country` VALUES ('129', 'MY', '马来西亚');
INSERT INTO `yii2_country` VALUES ('130', 'ML', '马里');
INSERT INTO `yii2_country` VALUES ('131', 'MK', '马其顿, 前南斯拉夫共和国');
INSERT INTO `yii2_country` VALUES ('132', 'MH', '马绍尔群岛');
INSERT INTO `yii2_country` VALUES ('133', 'MQ', '马提尼克岛');
INSERT INTO `yii2_country` VALUES ('134', 'YT', '马约特岛');
INSERT INTO `yii2_country` VALUES ('135', 'MU', '毛里求斯');
INSERT INTO `yii2_country` VALUES ('136', 'MR', '毛利塔尼亚');
INSERT INTO `yii2_country` VALUES ('137', 'US', '美国');
INSERT INTO `yii2_country` VALUES ('138', 'AS', '美属萨摩亚');
INSERT INTO `yii2_country` VALUES ('139', 'UM', '美属外岛');
INSERT INTO `yii2_country` VALUES ('140', 'VI', '美属维尔京群岛');
INSERT INTO `yii2_country` VALUES ('141', 'MN', '蒙古');
INSERT INTO `yii2_country` VALUES ('142', 'MS', '蒙特塞拉特');
INSERT INTO `yii2_country` VALUES ('143', 'BD', '孟加拉国');
INSERT INTO `yii2_country` VALUES ('144', 'PE', '秘鲁');
INSERT INTO `yii2_country` VALUES ('145', 'FM', '密克罗尼西亚');
INSERT INTO `yii2_country` VALUES ('146', 'MM', '缅甸');
INSERT INTO `yii2_country` VALUES ('147', 'MD', '摩尔多瓦');
INSERT INTO `yii2_country` VALUES ('148', 'MA', '摩洛哥');
INSERT INTO `yii2_country` VALUES ('149', 'MC', '摩纳哥');
INSERT INTO `yii2_country` VALUES ('150', 'MZ', '莫桑比克');
INSERT INTO `yii2_country` VALUES ('151', 'MX', '墨西哥');
INSERT INTO `yii2_country` VALUES ('152', 'NA', '纳米比亚');
INSERT INTO `yii2_country` VALUES ('153', 'ZA', '南非');
INSERT INTO `yii2_country` VALUES ('154', 'AQ', '南极洲');
INSERT INTO `yii2_country` VALUES ('155', 'GS', '南乔治亚和南德桑威奇群岛');
INSERT INTO `yii2_country` VALUES ('156', 'NR', '瑙鲁');
INSERT INTO `yii2_country` VALUES ('157', 'NP', '尼泊尔');
INSERT INTO `yii2_country` VALUES ('158', 'NI', '尼加拉瓜');
INSERT INTO `yii2_country` VALUES ('159', 'NE', '尼日尔');
INSERT INTO `yii2_country` VALUES ('160', 'NG', '尼日利亚');
INSERT INTO `yii2_country` VALUES ('161', 'NU', '纽埃');
INSERT INTO `yii2_country` VALUES ('162', 'NO', '挪威');
INSERT INTO `yii2_country` VALUES ('163', 'NF', '诺福克岛');
INSERT INTO `yii2_country` VALUES ('164', 'PW', '帕劳群岛');
INSERT INTO `yii2_country` VALUES ('165', 'PN', '皮特凯恩群岛');
INSERT INTO `yii2_country` VALUES ('166', 'PT', '葡萄牙');
INSERT INTO `yii2_country` VALUES ('167', 'JP', '日本');
INSERT INTO `yii2_country` VALUES ('168', 'SE', '瑞典');
INSERT INTO `yii2_country` VALUES ('169', 'CH', '瑞士');
INSERT INTO `yii2_country` VALUES ('170', 'SV', '萨尔瓦多');
INSERT INTO `yii2_country` VALUES ('171', 'WS', '萨摩亚');
INSERT INTO `yii2_country` VALUES ('172', 'RS', '塞尔维亚共和国');
INSERT INTO `yii2_country` VALUES ('173', 'SL', '塞拉利昂');
INSERT INTO `yii2_country` VALUES ('174', 'SN', '塞内加尔');
INSERT INTO `yii2_country` VALUES ('175', 'CY', '塞浦路斯');
INSERT INTO `yii2_country` VALUES ('176', 'SC', '塞舌尔');
INSERT INTO `yii2_country` VALUES ('177', 'XS', '沙巴岛');
INSERT INTO `yii2_country` VALUES ('178', 'SA', '沙特阿拉伯');
INSERT INTO `yii2_country` VALUES ('179', 'BL', '圣巴泰勒米岛');
INSERT INTO `yii2_country` VALUES ('180', 'CX', '圣诞岛');
INSERT INTO `yii2_country` VALUES ('181', 'ST', '圣多美和普林西比');
INSERT INTO `yii2_country` VALUES ('182', 'SH', '圣赫勒拿岛');
INSERT INTO `yii2_country` VALUES ('183', 'KN', '圣基茨和尼维斯');
INSERT INTO `yii2_country` VALUES ('184', 'LC', '圣卢西亚');
INSERT INTO `yii2_country` VALUES ('185', 'MF', '圣马丁岛');
INSERT INTO `yii2_country` VALUES ('186', 'SX', '圣马丁岛');
INSERT INTO `yii2_country` VALUES ('187', 'SM', '圣马力诺');
INSERT INTO `yii2_country` VALUES ('188', 'PM', '圣皮埃尔岛和密克隆岛');
INSERT INTO `yii2_country` VALUES ('189', 'VC', '圣文森特和格林纳丁斯');
INSERT INTO `yii2_country` VALUES ('190', 'XE', '圣尤斯特歇斯岛');
INSERT INTO `yii2_country` VALUES ('191', 'LK', '斯里兰卡');
INSERT INTO `yii2_country` VALUES ('192', 'SK', '斯洛伐克');
INSERT INTO `yii2_country` VALUES ('193', 'SI', '斯洛文尼亚');
INSERT INTO `yii2_country` VALUES ('194', 'SZ', '斯威士兰');
INSERT INTO `yii2_country` VALUES ('195', 'SD', '苏丹');
INSERT INTO `yii2_country` VALUES ('196', 'SR', '苏里南');
INSERT INTO `yii2_country` VALUES ('197', 'SB', '所罗门群岛');
INSERT INTO `yii2_country` VALUES ('198', 'SO', '索马里');
INSERT INTO `yii2_country` VALUES ('199', 'TJ', '塔吉克斯坦');
INSERT INTO `yii2_country` VALUES ('200', 'TW', '台湾');
INSERT INTO `yii2_country` VALUES ('201', 'TH', '泰国');
INSERT INTO `yii2_country` VALUES ('202', 'TZ', '坦桑尼亚');
INSERT INTO `yii2_country` VALUES ('203', 'TO', '汤加');
INSERT INTO `yii2_country` VALUES ('204', 'TC', '特克斯和凯科斯群岛');
INSERT INTO `yii2_country` VALUES ('205', 'TT', '特立尼达和多巴哥');
INSERT INTO `yii2_country` VALUES ('206', 'TN', '突尼斯');
INSERT INTO `yii2_country` VALUES ('207', 'TV', '图瓦卢');
INSERT INTO `yii2_country` VALUES ('208', 'TR', '土耳其');
INSERT INTO `yii2_country` VALUES ('209', 'TM', '土库曼斯坦');
INSERT INTO `yii2_country` VALUES ('210', 'TK', '托克劳');
INSERT INTO `yii2_country` VALUES ('211', 'WF', '瓦利斯和富图纳');
INSERT INTO `yii2_country` VALUES ('212', 'VU', '瓦努阿图');
INSERT INTO `yii2_country` VALUES ('213', 'GT', '危地马拉');
INSERT INTO `yii2_country` VALUES ('214', 'VG', '维尔京群岛(英属)');
INSERT INTO `yii2_country` VALUES ('215', 'VE', '委内瑞拉');
INSERT INTO `yii2_country` VALUES ('216', 'BN', '文莱');
INSERT INTO `yii2_country` VALUES ('217', 'UG', '乌干达');
INSERT INTO `yii2_country` VALUES ('218', 'UA', '乌克兰');
INSERT INTO `yii2_country` VALUES ('219', 'UY', '乌拉圭');
INSERT INTO `yii2_country` VALUES ('220', 'UZ', '乌兹别克斯坦');
INSERT INTO `yii2_country` VALUES ('221', 'ES', '西班牙');
INSERT INTO `yii2_country` VALUES ('222', 'GR', '希腊');
INSERT INTO `yii2_country` VALUES ('223', 'HK', '香港特别行政区');
INSERT INTO `yii2_country` VALUES ('224', 'SG', '新加坡');
INSERT INTO `yii2_country` VALUES ('225', 'NC', '新喀里多尼亚');
INSERT INTO `yii2_country` VALUES ('226', 'NZ', '新西兰');
INSERT INTO `yii2_country` VALUES ('227', 'HU', '匈牙利');
INSERT INTO `yii2_country` VALUES ('228', 'SY', '叙利亚');
INSERT INTO `yii2_country` VALUES ('229', 'JM', '牙买加');
INSERT INTO `yii2_country` VALUES ('230', 'AM', '亚美尼亚');
INSERT INTO `yii2_country` VALUES ('231', 'SJ', '扬马延岛');
INSERT INTO `yii2_country` VALUES ('232', 'YE', '也门');
INSERT INTO `yii2_country` VALUES ('233', 'IQ', '伊拉克');
INSERT INTO `yii2_country` VALUES ('234', 'IR', '伊朗');
INSERT INTO `yii2_country` VALUES ('235', 'IL', '以色列');
INSERT INTO `yii2_country` VALUES ('236', 'IT', '意大利');
INSERT INTO `yii2_country` VALUES ('237', 'IN', '印度');
INSERT INTO `yii2_country` VALUES ('238', 'ID', '印度尼西亚');
INSERT INTO `yii2_country` VALUES ('239', 'UK', '英国');
INSERT INTO `yii2_country` VALUES ('240', 'IO', '英属印度洋领地');
INSERT INTO `yii2_country` VALUES ('241', 'JO', '约旦');
INSERT INTO `yii2_country` VALUES ('242', 'VN', '越南');
INSERT INTO `yii2_country` VALUES ('243', 'ZM', '赞比亚');
INSERT INTO `yii2_country` VALUES ('244', 'JE', '泽西');
INSERT INTO `yii2_country` VALUES ('245', 'TD', '乍得');
INSERT INTO `yii2_country` VALUES ('246', 'GI', '直布罗陀');
INSERT INTO `yii2_country` VALUES ('247', 'CL', '智利');
INSERT INTO `yii2_country` VALUES ('248', 'CF', '中非共和国');
INSERT INTO `yii2_country` VALUES ('249', 'CN', '中国');

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;


-- ----------------------------
-- Records of yii2_menu
-- ----------------------------
INSERT INTO `yii2_menu` VALUES ('1', '0', '我的面板', 'index/index', 'fa-home', '1', '0');
INSERT INTO `yii2_menu` VALUES ('2', '0', '站点设置', 'config/basic', 'fa-cogs', '1', '0');
INSERT INTO `yii2_menu` VALUES ('3', '0', '管理员设置', 'admin/index', 'fa-user', '1', '0');
INSERT INTO `yii2_menu` VALUES ('4', '0', '内容设置', '', 'fa-edit', '1', '0');
INSERT INTO `yii2_menu` VALUES ('5', '0', '用户设置', '', 'fa-users', '1', '0');
INSERT INTO `yii2_menu` VALUES ('6', '0', '数据库设置', 'database/export', 'fa-hdd-o', '0', '0');
INSERT INTO `yii2_menu` VALUES ('7', '0', '界面设置', '', 'fa-picture-o', '1', '0');
INSERT INTO `yii2_menu` VALUES ('8', '1', '系统信息', 'index/index', '', '1', '0');
INSERT INTO `yii2_menu` VALUES ('9', '2', '站点配置', 'config/basic', '', '1', '0');
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
  `customer_id` int(11) NOT NULL COMMENT '客户id',
  `combo_id` int(11) NOT NULL COMMENT '套餐id',
  `custom_servicer_id` smallint(6) NOT NULL COMMENT '客服id',
  `transactor_id` int(11) NOT NULL COMMENT '办理人ID',
  `transactor_name` varchar(50) NOT NULL COMMENT '办理人名称',
  `single_sum` decimal(10,2) NOT NULL DEFAULT '0.00' COMMENT '单项实收金额',
  `total_person` smallint(5) NOT NULL DEFAULT '0' COMMENT '人数',
  `balance_order` varchar(64) NOT NULL DEFAULT '0.00' COMMENT '补差订单号',
  `balance_sum` decimal(10,2) NOT NULL COMMENT '补差订单金额',
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
  PRIMARY KEY (`id`),
  KEY `order_transator_id` (`transactor_id`) USING BTREE,
  KEY `order_deliverycompany_id` (`delivercompany_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

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
-- Table structure for yii2_product
-- ----------------------------
DROP TABLE IF EXISTS `yii2_product`;
CREATE TABLE `yii2_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `name` varchar(255) NOT NULL,
  `picture` varchar(255) NOT NULL,
  `cost` decimal(10,2) NOT NULL COMMENT '支出成本',
  `country_id` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_country_id` (`country_id`),
  CONSTRAINT `product_country_id` FOREIGN KEY (`country_id`) REFERENCES `yii2_country` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=67630 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
-- Table structure for yii2_test
-- ----------------------------
DROP TABLE IF EXISTS `yii2_test`;
CREATE TABLE `yii2_test` (
  `id` int(255) NOT NULL,
  `test` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for yii2_transator
-- ----------------------------
DROP TABLE IF EXISTS `yii2_transator`;
CREATE TABLE `yii2_transator` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL,
  `phone` varchar(32) NOT NULL,
  `address` varchar(50) NOT NULL,
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
