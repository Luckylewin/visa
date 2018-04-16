-- -------------------------------------------
SET AUTOCOMMIT=0;
START TRANSACTION;
SET SQL_QUOTE_SHOW_CREATE = 1;
SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0;
SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0;
-- -------------------------------------------
-- -------------------------------------------
-- START BACKUP
-- -------------------------------------------
-- -------------------------------------------
-- TABLE `yii2_admin`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_admin`;
CREATE TABLE IF NOT EXISTS `yii2_admin` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_auth_assignment`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_auth_assignment`;
CREATE TABLE IF NOT EXISTS `yii2_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `yii2_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_auth_item`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_auth_item`;
CREATE TABLE IF NOT EXISTS `yii2_auth_item` (
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

-- -------------------------------------------
-- TABLE `yii2_auth_item_child`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_auth_item_child`;
CREATE TABLE IF NOT EXISTS `yii2_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `yii2_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yii2_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_auth_rule`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_auth_rule`;
CREATE TABLE IF NOT EXISTS `yii2_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_combo`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_combo`;
CREATE TABLE IF NOT EXISTS `yii2_combo` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -------------------------------------------
-- TABLE `yii2_config`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_config`;
CREATE TABLE IF NOT EXISTS `yii2_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyid` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `keyid` (`keyid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_country`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_country`;
CREATE TABLE IF NOT EXISTS `yii2_country` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `abbr` varchar(100) DEFAULT NULL COMMENT '英文缩写',
  `cinfo` varchar(200) DEFAULT NULL COMMENT '中文名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_delivery_company`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_delivery_company`;
CREATE TABLE IF NOT EXISTS `yii2_delivery_company` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(100) NOT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -------------------------------------------
-- TABLE `yii2_export_setting`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_export_setting`;
CREATE TABLE IF NOT EXISTS `yii2_export_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` char(30) NOT NULL COMMENT '角色id',
  `showfinance` char(1) NOT NULL DEFAULT '0' COMMENT '是否展示财务信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_menu`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_menu`;
CREATE TABLE IF NOT EXISTS `yii2_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(10) unsigned NOT NULL DEFAULT '0',
  `name` varchar(50) NOT NULL DEFAULT '',
  `url` varchar(60) NOT NULL DEFAULT '',
  `icon_style` varchar(50) NOT NULL DEFAULT '',
  `display` tinyint(3) unsigned NOT NULL DEFAULT '1',
  `sort` smallint(5) unsigned NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_migration`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_migration`;
CREATE TABLE IF NOT EXISTS `yii2_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_order`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_order`;
CREATE TABLE IF NOT EXISTS `yii2_order` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_order_product`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_order_product`;
CREATE TABLE IF NOT EXISTS `yii2_order_product` (
  `order_id` int(11) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  KEY `fk_order_id` (`order_id`),
  KEY `fk_product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_order_to_transactor`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_order_to_transactor`;
CREATE TABLE IF NOT EXISTS `yii2_order_to_transactor` (
  `o_id` int(11) NOT NULL COMMENT '订单id',
  `t_id` int(11) NOT NULL COMMENT '办理人id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_product`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_product`;
CREATE TABLE IF NOT EXISTS `yii2_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `name` varchar(255) NOT NULL,
  `cost` decimal(10,2) NOT NULL COMMENT '支出成本',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -------------------------------------------
-- TABLE `yii2_product_combo`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_product_combo`;
CREATE TABLE IF NOT EXISTS `yii2_product_combo` (
  `pid` int(11) NOT NULL,
  `combo_name` varchar(255) NOT NULL COMMENT '套餐名称',
  `cid` int(11) NOT NULL,
  KEY `ppid` (`pid`),
  KEY `ccid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_servicer`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_servicer`;
CREATE TABLE IF NOT EXISTS `yii2_servicer` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '客服名字',
  `tb_servicer_id` varchar(30) DEFAULT NULL COMMENT '淘宝客服id',
  `admin_id` int(11) NOT NULL COMMENT '后台帐号id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_session`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_session`;
CREATE TABLE IF NOT EXISTS `yii2_session` (
  `id` char(40) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_snapshot`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_snapshot`;
CREATE TABLE IF NOT EXISTS `yii2_snapshot` (
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
) ENGINE=MyISAM  DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_test`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_test`;
CREATE TABLE IF NOT EXISTS `yii2_test` (
  `id` int(255) NOT NULL,
  `test` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;

-- -------------------------------------------
-- TABLE `yii2_transator`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_transator`;
CREATE TABLE IF NOT EXISTS `yii2_transator` (
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
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- -------------------------------------------
-- TABLE `yii2_user`
-- -------------------------------------------
DROP TABLE IF EXISTS `yii2_user`;
CREATE TABLE IF NOT EXISTS `yii2_user` (
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

-- -------------------------------------------
-- TABLE DATA yii2_admin
-- -------------------------------------------
INSERT INTO `yii2_admin` (`id`,`username`,`auth_key`,`password_hash`,`email`,`reg_ip`,`last_login_time`,`last_login_ip`,`status`,`created_at`,`updated_at`) VALUES
('1','admin','SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ','$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i','771405950@qq.com','2130706433','1523410204','2130706433','1','1482305564','1523410204');;;
INSERT INTO `yii2_admin` (`id`,`username`,`auth_key`,`password_hash`,`email`,`reg_ip`,`last_login_time`,`last_login_ip`,`status`,`created_at`,`updated_at`) VALUES
('4','admin2','SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ','$2y$13$DPm3NP2B4HDth70cflSqCeC0k562iwHf9P1gsBT728WrFA8oYcy2C','876505905@qq.com','2130706433','1519881927','1742115638','1','1482305564','1519881927');;;
INSERT INTO `yii2_admin` (`id`,`username`,`auth_key`,`password_hash`,`email`,`reg_ip`,`last_login_time`,`last_login_ip`,`status`,`created_at`,`updated_at`) VALUES
('5','test_admin','WEjgqej0F5wm2302g_8YBgWdspPNZaZQ','$2y$13$ZgBVcI.l1LTMGjRlULoaiu7TrrGLKQpl0G4uH4Mal424PmBmAmxnu','test@qq.com','2130706433','1517996294','2130706433','1','1517996226','1517996294');;;
INSERT INTO `yii2_admin` (`id`,`username`,`auth_key`,`password_hash`,`email`,`reg_ip`,`last_login_time`,`last_login_ip`,`status`,`created_at`,`updated_at`) VALUES
('6','customersevice','DxlkT2gDSiuSF_Jr5EdVILTjPY7juMaB','$2y$13$rsk/gLdYWjbKWqlE8eaIaeR7o9BmpZyI/8x1xF2tv3VU6TzwK.D6u','newpoyang@163.com','2004602159','1519884600','1742115638','1','1519450624','1519884600');;;
INSERT INTO `yii2_admin` (`id`,`username`,`auth_key`,`password_hash`,`email`,`reg_ip`,`last_login_time`,`last_login_ip`,`status`,`created_at`,`updated_at`) VALUES
('8','admin1','K8BNr0aM6tAt57spK5fL7sKrEY6gDRRW','$2y$13$.TYukIqSTsC6Bb5S3HAKou5M4ptHfyFQUBbpX/0xPUIXS2gDcIlMO','newpoyang@sohu.com','2004602006','1519811780','2004602006','1','1519810203','1519811780');;;
INSERT INTO `yii2_admin` (`id`,`username`,`auth_key`,`password_hash`,`email`,`reg_ip`,`last_login_time`,`last_login_ip`,`status`,`created_at`,`updated_at`) VALUES
('9','LECHUFA-FENG','jonJehgNj5xIfL7X_zVCVJrDOlr6nk3w','$2y$13$iu9EdQ8PhcDlgGm.rgzkSOtTtuL..5hnHGiAmJ1QrozumC8Lf9GLq','3148018245@qq.com','2147483647','1521175995','1862812208','1','1519830823','1521175995');;;
INSERT INTO `yii2_admin` (`id`,`username`,`auth_key`,`password_hash`,`email`,`reg_ip`,`last_login_time`,`last_login_ip`,`status`,`created_at`,`updated_at`) VALUES
('10','LECHUFA-SU','3e9jiq_BX7maO8C_76ooN6eCfOhFpXbl','$2y$13$BhVP50sNlgJMl0MajDBXWO7h4pNvpbnk7TJWvua3j3bzp2oYd/3sq','3352646786@qq.com','2147483647','1521427472','2147483647','1','1519831326','1521427472');;;
INSERT INTO `yii2_admin` (`id`,`username`,`auth_key`,`password_hash`,`email`,`reg_ip`,`last_login_time`,`last_login_ip`,`status`,`created_at`,`updated_at`) VALUES
('11','LECHUFA-ZHONG','_UtDe0BckV0ToFu1_HIjQfarJx1F8uuS','$2y$13$qEnDvwI9H2RlWd53nwrw0e1UAS2lSDIbgfjjq/ghsG/.gmxprmIvm','3389773613@qq.com','2147483647','1522143902','2147483647','1','1519831374','1522143902');;;
INSERT INTO `yii2_admin` (`id`,`username`,`auth_key`,`password_hash`,`email`,`reg_ip`,`last_login_time`,`last_login_ip`,`status`,`created_at`,`updated_at`) VALUES
('13','LECHUFA-YANG','IsnYzUaokcJl2lisTsEA3djCIkk6bJ_I','$2y$13$MEmpcKV4A9xRCr98dFTv2O/5MSV978FVPHJxzjhN6sD/iIuRCgD3u','3127547767@qq.com','2147483647','1521254447','2147483647','1','1519831470','1521254447');;;
-- -------------------------------------------
-- TABLE DATA yii2_auth_assignment
-- -------------------------------------------
INSERT INTO `yii2_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('客服','12','1519831427');;;
INSERT INTO `yii2_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('客服','13','1519831477');;;
INSERT INTO `yii2_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('客服','14','1520061364');;;
INSERT INTO `yii2_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('客服','6','1519450634');;;
INSERT INTO `yii2_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('客服','7','1519806395');;;
INSERT INTO `yii2_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('操作人员','10','1519883010');;;
INSERT INTO `yii2_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('操作人员','11','1519831417');;;
INSERT INTO `yii2_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('编辑','4','1517974399');;;
INSERT INTO `yii2_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('编辑','5','1517996235');;;
INSERT INTO `yii2_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('编辑','8','1519810210');;;
INSERT INTO `yii2_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('超级管理员','1','1520270508');;;
INSERT INTO `yii2_auth_assignment` (`item_name`,`user_id`,`created_at`) VALUES
('超级管理员','9','1519830838');;;
-- -------------------------------------------
-- TABLE DATA yii2_auth_item
-- -------------------------------------------
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('#','2','','#','','1519808376','1519810140');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('admin/auth','2','','admin/auth','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('admin/create','2','','admin/create','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('admin/delete','2','','admin/delete','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('admin/index','2','','admin/index','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('admin/update','2','','admin/update','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('backup/default/index','2','','backup/default/index','','1519808877','1519811523');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('combo/create','2','','combo/create','','1519808877','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('combo/delete','2','','combo/delete','','1519808877','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('combo/index','2','','combo/index','','1517996186','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('combo/update','2','','combo/update','','1519808877','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('combo/view','2','','combo/view','','1519378925','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('config/attachment','2','','config/attachment','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('config/basic','2','','config/basic','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('config/send-mail','2','','config/send-mail','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('database/export','2','','database/export','','1484734305','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('excel-setting/update','2','','excel-setting/update','','1519451875','1519451875');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('excel/import','2','','excel/import','','1519436284','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('excel/index','2','','excel/index','','1519436031','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('index/frame','2','','index/frame','','1518057962','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('index/index','2','','index/index','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('menu/create','2','','menu/create','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('menu/delete','2','','menu/delete','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('menu/index','2','','menu/index','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('menu/update','2','','menu/update','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('order/create','2','','order/create','','1518074401','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('order/delete','2','','order/delete','','1519450583','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('order/index','2','','order/index','','1517996186','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('order/update','2','','order/update','','1519450583','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('order/view','2','','order/view','','1519377930','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('product/delete','2','','product/delete','','1519808877','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('product/index','2','','product/index','','1517996186','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('product/update','2','','product/update','','1519808877','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('product/view','2','','product/view','','1519378499','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('role/auth','2','','role/auth','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('role/create','2','','role/create','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('role/delete','2','','role/delete','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('role/export-setting','2','','role/export-setting','','1519438814','1519451875');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('role/index','2','','role/index','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('role/update','2','','role/update','','1484734191','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('servicer/create','2','','servicer/create','','1519810140','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('servicer/index','2','','servicer/index','','1517996187','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('servicer/view','2','','servicer/view','','1519884478','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('transator/delete','2','','transator/delete','','1519810140','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('transator/index','2','','transator/index','','1517996187','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('transator/update','2','','transator/update','','1519810140','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('transator/view','2','','transator/view','','1519884478','1520059861');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('客服','1','接待客服','','','1519450557','1519806275');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('操作人员','1','办理签证','','','1519830888','1519830888');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('编辑','1','网站编辑','','','1484712712','1519884559');;;
INSERT INTO `yii2_auth_item` (`name`,`type`,`description`,`rule_name`,`data`,`created_at`,`updated_at`) VALUES
('超级管理员','1','授权所有权限','','','1484712662','1519884549');;;
-- -------------------------------------------
-- TABLE DATA yii2_auth_item_child
-- -------------------------------------------
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','admin/auth');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','admin/create');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','admin/delete');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','admin/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','admin/update');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('编辑','backup/default/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','combo/create');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','combo/delete');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','combo/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','combo/update');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','combo/view');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','config/attachment');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','config/basic');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','config/send-mail');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('编辑','database/export');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','database/export');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','excel/import');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','excel/import');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('编辑','excel/import');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','excel/import');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','excel/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','excel/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('编辑','excel/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','excel/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','index/frame');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','index/frame');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','index/frame');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','index/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','index/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','index/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','menu/create');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','menu/delete');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','menu/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','menu/update');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','order/create');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','order/create');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('编辑','order/create');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','order/create');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','order/delete');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','order/delete');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','order/delete');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','order/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','order/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('编辑','order/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','order/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','order/update');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','order/update');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','order/update');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','order/view');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','order/view');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('编辑','order/view');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','order/view');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('编辑','product/delete');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','product/delete');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('编辑','product/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','product/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('编辑','product/update');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','product/update');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('编辑','product/view');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','product/view');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','role/auth');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','role/create');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','role/delete');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','role/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','role/update');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','servicer/create');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','servicer/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','servicer/view');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','servicer/view');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','servicer/view');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','transator/delete');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','transator/delete');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','transator/delete');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','transator/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','transator/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','transator/index');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','transator/update');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','transator/update');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','transator/update');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('客服','transator/view');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('操作人员','transator/view');;;
INSERT INTO `yii2_auth_item_child` (`parent`,`child`) VALUES
('超级管理员','transator/view');;;
-- -------------------------------------------
-- TABLE DATA yii2_auth_rule
-- -------------------------------------------
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:0:\"\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1518057980;}','1484734191','1518057980');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('#','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:1:\"#\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808376;s:9:\"updatedAt\";i:1519810140;}','1519808376','1519810140');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('admin/auth','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"admin/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('admin/create','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('admin/delete','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('admin/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"admin/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('admin/update','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('backup/default/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:20:\"backup/default/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808877;s:9:\"updatedAt\";i:1519811523;}','1519808877','1519811523');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('combo/create','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"combo/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808877;s:9:\"updatedAt\";i:1520059861;}','1519808877','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('combo/delete','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"combo/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808877;s:9:\"updatedAt\";i:1520059861;}','1519808877','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('combo/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"combo/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996186;s:9:\"updatedAt\";i:1520059861;}','1517996186','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('combo/update','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"combo/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808877;s:9:\"updatedAt\";i:1520059861;}','1519808877','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('combo/view','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"combo/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519378925;s:9:\"updatedAt\";i:1520059861;}','1519378925','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('config/attachment','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:17:\"config/attachment\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('config/basic','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"config/basic\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('config/send-mail','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:16:\"config/send-mail\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('database/export','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"database/export\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734305;s:9:\"updatedAt\";i:1520059861;}','1484734305','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('excel-setting/update','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:20:\"excel-setting/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519451875;s:9:\"updatedAt\";i:1519451875;}','1519451875','1519451875');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('excel/import','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"excel/import\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519436284;s:9:\"updatedAt\";i:1520059861;}','1519436284','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('excel/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"excel/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519436031;s:9:\"updatedAt\";i:1520059861;}','1519436031','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('index/frame','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"index/frame\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1518057962;s:9:\"updatedAt\";i:1520059861;}','1518057962','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('index/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"index/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('menu/create','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('menu/delete','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('menu/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"menu/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('menu/update','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('order/create','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"order/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1518074401;s:9:\"updatedAt\";i:1520059861;}','1518074401','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('order/delete','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"order/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519450583;s:9:\"updatedAt\";i:1520059861;}','1519450583','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('order/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"order/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996186;s:9:\"updatedAt\";i:1520059861;}','1517996186','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('order/update','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"order/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519450583;s:9:\"updatedAt\";i:1520059861;}','1519450583','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('order/view','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"order/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519377930;s:9:\"updatedAt\";i:1520059861;}','1519377930','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('product/delete','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:14:\"product/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808877;s:9:\"updatedAt\";i:1520059861;}','1519808877','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('product/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:13:\"product/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996186;s:9:\"updatedAt\";i:1520059861;}','1517996186','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('product/update','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:14:\"product/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519808877;s:9:\"updatedAt\";i:1520059861;}','1519808877','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('product/view','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"product/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519378499;s:9:\"updatedAt\";i:1520059861;}','1519378499','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('role/auth','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:9:\"role/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('role/create','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('role/delete','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('role/export-setting','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:19:\"role/export-setting\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519438814;s:9:\"updatedAt\";i:1519451875;}','1519438814','1519451875');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('role/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"role/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('role/update','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1520059861;}','1484734191','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('servicer/create','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"servicer/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519810140;s:9:\"updatedAt\";i:1520059861;}','1519810140','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('servicer/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:14:\"servicer/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996187;s:9:\"updatedAt\";i:1520059861;}','1517996187','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('servicer/view','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:13:\"servicer/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519884478;s:9:\"updatedAt\";i:1520059861;}','1519884478','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('transator/delete','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:16:\"transator/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519810140;s:9:\"updatedAt\";i:1520059861;}','1519810140','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('transator/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"transator/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1517996187;s:9:\"updatedAt\";i:1520059861;}','1517996187','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('transator/update','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:16:\"transator/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519810140;s:9:\"updatedAt\";i:1520059861;}','1519810140','1520059861');;;
INSERT INTO `yii2_auth_rule` (`name`,`data`,`created_at`,`updated_at`) VALUES
('transator/view','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:14:\"transator/view\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1519884478;s:9:\"updatedAt\";i:1520059861;}','1519884478','1520059861');;;
-- -------------------------------------------
-- TABLE DATA yii2_combo
-- -------------------------------------------
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39342','218/10天','','200.000','1','1','1516961512','1517627390','1','67639','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39343','248/8天','','200.000','1','1','1516961528','1517627399','1','67639','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39344','268/5天','','200.000','1','1','1516961542','1517627407','1','67639','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39345','520/3天','','401.000','2','1','1516961556','1517627415','1','67639','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39346','1200/1天','','950.000','3','1','1516961580','1517627424','1','67639','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39347','248/8天','','200.000','1','2','1516961603','1517627432','1','67639','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39348','260/5天','','200.000','1','2','1516961618','1517627436','1','67639','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39350','510/3天','','401.000','2','2','1516961679','1517627442','1','67639','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39351','1200/1天','','950.000','3','2','1516961704','1517627448','1','67639','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39352','220/4-5工','','200.000','1','3','1516961723','1517627453','1','67639','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39353','425/2-3工','','401.000','2','3','1516961741','1517627459','1','67639','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39354','990/1天','','950.000','3','3','1516961756','1517627464','1','67639','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39355','940/7天','','550.000','1','1','1516961957','1517456694','1','67640','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39356','1240/5天','','550.000','2','1','1516961988','1517456698','1','67640','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39357','920/7天','','550.000','1','2','1516962154','1517627482','1','67640','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39358','1200/4天','','550.000','2','2','1516962178','1517627485','1','67640','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39359','600/5-6工','','550.000','1','3','1516962206','1517627489','1','67640','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39360','900/3-4工','','550.000','2','3','1516962309','1517627494','1','67640','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39361','1440/7天','','1000.000','1','1','1516962387','1517462842','1','67641','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39362','1550/5天','','1000.000','2','1','1516962406','1517462854','1','67641','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39363','1400/7天','','1000.000','1','2','1516962436','1517627526','1','67641','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39364','1500/5天','','1000.000','2','2','1516962452','1517627530','1','67641','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39365','1100/5-6工','','1000.000','1','3','1516962474','1517627535','1','67641','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39366','1200/3-4工','','1000.000','2','3','1516962491','1517627540','1','67641','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39367','175/3天','','160.000','1','1','1517626325','1517626325','1','67642','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39368','198/1天','','160.000','2','1','1517626349','1517626349','1','67642','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39369','248/3小时','','160.000','3','1','1517626681','1517626681','1','67642','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39370','175/3天','','160.000','1','2','1517626705','1517626739','1','67642','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39371','190/1天','','160.000','2','2','1517626760','1517626760','1','67642','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39372','240/3小时','','160.000','3','2','1517626778','1517626778','1','67642','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39373','180/1天','','160.000','1','3','1517626816','1517626816','1','67642','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39374','200/3小时','','160.000','3','3','1517626844','1517626844','1','67642','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39375','320/4天','','280.000','1','1','1517627078','1517627078','1','67643','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39376','343/2天','','280.000','2','1','1517627192','1517627192','1','67643','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39377','395/1天','','280.000','3','1','1517627213','1517627213','1','67643','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39378','310/4天','','280.000','1','2','1517627237','1517627237','1','67643','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39379','343/1天','','280.000','2','2','1517627260','1517627260','1','67643','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39380','395/1天','','280.000','3','2','1517627280','1517627280','1','67643','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39381','300/2天','','280.000','1','3','1517627308','1517627308','1','67643','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39382','320/1天','','280.000','3','3','1517627331','1517627331','1','67643','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39383','320/6天','','290.000','1','1','1517627767','1517627767','1','67644','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39384','390/4天','','290.000','2','1','1517627787','1517627787','1','67644','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39385','310/6天','','290.000','1','2','1517627804','1517627804','1','67644','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39386','380/4天','','290.000','1','2','1517627818','1517627818','1','67644','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39387','300/4天','','290.000','1','3','1517627855','1517627855','1','67644','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39388','268/4天','','242.000','1','1','1517627930','1517627930','1','67645','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39389','299/1天','','242.000','2','1','1517627946','1517627946','1','67645','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39390','358/3小时','','242.000','3','1','1517627965','1517627965','1','67645','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39391','260/4天','','242.000','1','2','1517628015','1517628015','1','67645','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39392','290/1天','','242.000','2','2','1517628030','1517628030','1','67645','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39393','350/3小时','','242.000','3','2','1517628044','1517628044','1','67645','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39394','270/3天','','242.000','1','3','1517628114','1517628114','1','67645','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39395','290/3小时','','242.000','2','3','1517628137','1517628137','1','67645','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39396','255/3天','','240.000','1','1','1517628205','1517628205','1','67646','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39397','270/2天','','240.000','2','1','1517628228','1517628228','1','67646','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39398','298/1天','','260.000','3','1','1517628353','1517628353','1','67646','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39399','250/3天','','240.000','1','2','1517628379','1517628379','1','67646','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39400','260/2天','','240.000','2','2','1517628396','1517628396','1','67646','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39401','288/1天','','260.000','3','2','1517628413','1517628413','1','67646','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39402','250/2天','','240.000','1','3','1517628430','1517628430','1','67646','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39403','280/1天','','260.000','2','3','1517628446','1517628446','1','67646','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39404','1800/1工','','1500.000','3','1','1522160496','1522160496','1','67647','0.965');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39405','1700/1工','','1500.000','1','2','1522160515','1522160515','1','67647','1.000');;;
INSERT INTO `yii2_combo` (`combo_id`,`combo_name`,`combo_content`,`combo_cost`,`combo_type`,`combo_classify`,`created_at`,`updated_at`,`uid`,`product_id`,`combo_charge`) VALUES
('39406','1600/1工','','1500.000','1','3','1522160530','1522160530','1','67647','1.000');;;
-- -------------------------------------------
-- TABLE DATA yii2_config
-- -------------------------------------------
INSERT INTO `yii2_config` (`id`,`keyid`,`title`,`data`) VALUES
('1','basic','','{\"sitename\":\"Yii2 CMS\",\"url\":\"http:\\/\\/www.test-yii2cms.com\",\"logo\":\"\\/statics\\/themes\\/admin\\/images\\/logo.png\",\"seo_keywords\":\"Yii2,CMS\",\"seo_description\":\"Yii2,CMS\",\"copyright\":\"@Yii2 CMS\",\"statcode\":\"\",\"close\":\"0\",\"close_reason\":\"\\u7ad9\\u70b9\\u5347\\u7ea7\\u4e2d, \\u8bf7\\u7a0d\\u540e\\u8bbf\\u95ee!\"}');;;
INSERT INTO `yii2_config` (`id`,`keyid`,`title`,`data`) VALUES
('2','sendmail','','{\"mail_type\":\"0\",\"smtp_server\":\"smtp.qq.com\",\"smtp_port\":\"25\",\"auth\":\"1\",\"openssl\":\"1\",\"smtp_user\":\"771405950\",\"smtp_pwd\":\"qiaoBo1989122\",\"send_email\":\"771405950@qq.com\",\"nickname\":\"\\u8fb9\\u8d70\\u8fb9\\u4e54\",\"sign\":\"<hr \\/>\\r\\n\\u90ae\\u4ef6\\u7b7e\\u540d\\uff1a\\u6b22\\u8fce\\u8bbf\\u95ee <a href=\\\"http:\\/\\/www.test-yii2cms.com\\\" target=\\\"_blank\\\">Yii2 CMS<\\/a>\"}');;;
INSERT INTO `yii2_config` (`id`,`keyid`,`title`,`data`) VALUES
('3','attachment','','{\"attachment_size\":\"2048\",\"attachment_suffix\":\"jpg|jpeg|gif|bmp|png\",\"watermark_enable\":\"1\",\"watermark_pos\":\"0\",\"watermark_text\":\"Yii2 CMS\"}');;;
-- -------------------------------------------
-- TABLE DATA yii2_country
-- -------------------------------------------
INSERT INTO `yii2_country` (`id`,`abbr`,`cinfo`) VALUES
('251','ph','菲律宾');;;
INSERT INTO `yii2_country` (`id`,`abbr`,`cinfo`) VALUES
('252','th','泰国');;;
-- -------------------------------------------
-- TABLE DATA yii2_delivery_company
-- -------------------------------------------
-- -------------------------------------------
-- TABLE DATA yii2_export_setting
-- -------------------------------------------
INSERT INTO `yii2_export_setting` (`id`,`rolename`,`showfinance`) VALUES
('1','editors','0');;;
INSERT INTO `yii2_export_setting` (`id`,`rolename`,`showfinance`) VALUES
('2','administors','1');;;
INSERT INTO `yii2_export_setting` (`id`,`rolename`,`showfinance`) VALUES
('3','customer service','0');;;
INSERT INTO `yii2_export_setting` (`id`,`rolename`,`showfinance`) VALUES
('4','操作人员','0');;;
INSERT INTO `yii2_export_setting` (`id`,`rolename`,`showfinance`) VALUES
('5','超级管理员','1');;;
-- -------------------------------------------
-- TABLE DATA yii2_menu
-- -------------------------------------------
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('1','0','我的面板','#','fa-home','0','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('2','0','系统设置','config/basic','fa-cogs','1','99');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('3','0','管理员设置','admin/index','fa-user','1','98');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('6','0','数据库设置','database/export','fa-hdd-o','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('8','1','系统信息','#','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('9','2','站点配置','config/basic','','0','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('10','2','后台菜单管理','menu/index','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('11','3','管理员管理','admin/index','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('12','3','角色管理','role/index','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('16','5','用户管理','','','0','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('17','6','数据库管理','backup/default/index','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('20','9','基本配置','config/basic','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('21','9','邮箱配置','config/send-mail','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('22','9','附件配置','config/attachment','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('23','10','添加菜单','menu/create','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('24','10','更新','menu/update','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('25','10','删除','menu/delete','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('26','11','添加','admin/create','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('27','11','更新','admin/update','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('28','11','授权','admin/auth','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('29','11','删除','admin/delete','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('30','12','添加','role/create','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('31','12','更新','role/update','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('32','12','授权','role/auth','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('33','12','删除','role/delete','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('34','0','产品管理','product/index','fa-coffee','1','1');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('35','34','产品列表','product/index','fa-coffee','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('36','0','套餐管理','combo/index','fa-coffee','0','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('37','36','套餐列表','combo/index','fa-coffee','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('38','0','订单管理','order/index','fa-dollar','1','2');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('39','38','订单列表','order/index','fa-dollar','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('41','40','国家列表','country/index','fa-flag','1','1');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('45','46','客服列表','servicer/index','fa-users','1','1');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('46','0','人员管理','transator/index','fa-user','1','13');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('47','46','办理人列表','transator/index','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('48','0','系统信息','index/index','fa-home','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('49','48','系统信息','index/index','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('50','38','订单添加','order/create','','1','1');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('51','48','左侧菜单','index/frame','','0','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('52','38','订单删除','order/delete','','0','2');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('53','38','订单更新','order/update','','0','3');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('54','38','订单查看','order/view','','0','4');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('55','34','产品删除','product/delete','','0','1');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('56','34','产品更新','product/update','','0','2');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('57','34','产品查看','product/view','','0','4');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('58','47','删除','transator/delete','','0','25');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('59','47','更新','transator/update','','0','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('60','45','新增','servicer/create','','0','1');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('61','45','删除','transator/delete','','0','25');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('62','36','套餐添加','combo/create','','1','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('63','36','套餐删除','combo/delete','','0','2');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('64','36','套餐更新','combo/update','','0','3');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('65','36','套餐查看','combo/view','','0','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('66','38','订单导出','excel/index','','0','5');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('67','38','订单导入','excel/import','','0','6');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('70','47','查看','transator/view','','0','0');;;
INSERT INTO `yii2_menu` (`id`,`pid`,`name`,`url`,`icon_style`,`display`,`sort`) VALUES
('71','45','查看','servicer/view','','0','0');;;
-- -------------------------------------------
-- TABLE DATA yii2_migration
-- -------------------------------------------
INSERT INTO `yii2_migration` (`version`,`apply_time`) VALUES
('m000000_000000_base','1482231528');;;
INSERT INTO `yii2_migration` (`version`,`apply_time`) VALUES
('m130524_201442_init','1482231534');;;
-- -------------------------------------------
-- TABLE DATA yii2_order
-- -------------------------------------------
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2807','0','ZK2018030101','2','2','2018-03-01','张蕊','4153','6','','510.00','5','5','','0.00','0.00','','30.00','0.00','','0.00','0.00','2018-03-02','2018-03-02','2018-03-05','2018-03-07','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-08','789848775925','顺丰','（盛景正常办理）','2018-03-08','2018-03-08','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2808','0','ZK2018030102','2','2','2018-03-01','张蕊','4154','6','','510.00','1','1','','0.00','0.00','','10.00','0.00','','0.00','0.00','2018-03-03','2018-03-04','2018-03-05','2018-03-06','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-07','789842567880','顺丰','','2018-03-07','2018-03-07','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2809','0','ZK2018030103','2','2','2018-03-01','财神','4155','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-02','2018-03-02','2018-03-04','2018-03-05','1','1','黑龙江哈尔滨，道里区通江街112号','齐伟强','15046302396','2018-03-06','789841715519','顺丰','','2018-03-06','2018-03-06','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2810','0','ZK2018030201','2','1','2018-03-02','水果小妹（微信）','4156','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-02','2018-03-02','2018-03-05','2018-03-07','1','1','盛景代寄','-','','2018-03-08','盛景代寄','顺丰','','2018-03-11','2018-03-11','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2811','0','ZK2018030202','2','2','2018-03-02','Enna','4157','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-04','2018-03-04','2018-03-05','2018-03-06','1','1','福建省厦门市湖里区金湖路东晖广场14栋','淋唯娜','13055246118','2018-03-07','789844075455','顺丰','(旧签)','2018-03-07','2018-03-07','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2812','0','ZK2018030203','2','2','2018-03-02',' 天道酬勤 ','4158','6','','510.00','6','6','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-04','2018-03-04','2018-03-06','2018-03-07','1','1','盛景代寄','-','','2018-03-08','盛景代寄','顺丰','（盛景办理）','2018-03-04','2018-03-04','客服微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2813','0','ZK2018030204','2','2','2018-03-02','宋记','4159','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-04','2018-03-04','2018-03-06','2018-03-07','1','1','广东省肇庆市四会市沙田园三路三街','宋金福','13580788768','2018-03-08','789848775970','顺丰','（盛景办理）','2018-03-07','2018-03-07','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2814','0','ZK2018030205','2','2','2018-03-02','张蕊','4160','6','','510.00','3','3','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-04','2018-03-04','2018-03-05','2018-03-06','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-07','789850386217','顺丰','','2018-03-08','2018-03-08','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2815','0','ZK2018030206','2','2','2018-03-02','张蕊','4161','6','','510.00','4','4','','0.00','0.00','','30.00','0.00','','0.00','0.00','2018-03-04','2018-03-04','2018-03-06','2018-03-07','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-08','789848775925','顺丰','（盛景办理）','2018-03-08','2018-03-08','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2816','0','ZK2018030301','2','2','2018-03-03','张蕊','4162','6','','510.00','5','5','','0.00','0.00','','30.00','100.00','','0.00','0.00','2018-03-03','2018-03-04','2018-03-05','2018-03-06','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-07','789843437290','顺丰','（盛景办理）','2018-03-07','2018-03-07','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2817','0','ZK2018030302','2','2','2018-03-03','张蕊','4163','6','','510.00','2','2','','0.00','0.00','','20.00','0.00','','0.00','0.00','2018-03-03','2018-03-04','2018-03-05','2018-03-06','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-07','789842567880','顺丰','','2018-03-07','2018-03-07','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2818','0','ZK2018030303','2','1','2018-03-03','尤芳明','4164','6','','260.00','3','3','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-04','2018-03-04','2018-03-05','2018-03-08','1','1','湖北省武汉市江汉区长港路E出口常青麦香园','陈章明','15271350110','2018-03-09','789858429381','顺丰','','2018-03-09','2018-03-09','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2819','0','ZK2018030304','2','1','2018-03-03','尤芳明','4165','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-04','2018-03-05','2018-03-06','2018-03-11','1','1','福建省晋江市安海镇清机路宝龙小区宝龙豪苑','尤芳明','15985927307','2018-03-12','789867508389','顺丰','','2018-03-13','2018-03-13','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2820','0','ZK2018030305','2','1','2018-03-03','客服微信
放开那个女孩 ','4166','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-06','2018-03-06','2018-03-07','2018-03-12','1','1','广州番禺区市桥汽车站对面','胡军','13647943063','2018-03-13','789874317819','顺丰','','2018-03-03','2018-03-03','客服微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2821','0','ZK2018030306','2','2','2018-03-03','客服微信
纵横天下','4167','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','23.00','0.00','2018-03-05','2018-03-05','2018-03-06','2018-03-07','1','1','福建省南平市政和县中元路12号 2单元402室','熊炳忠','15059958136','2018-03-08','789848775943','顺丰','办理人名字：熊鹰
电话：15659996957
地址：福建省政和县财政局
父亲名字：熊炳忠
母亲名字：许荣秀
配偶名字：（未婚无需提供）
准备在菲律宾哪个城市入境：马尼拉机场
','2018-03-03','2018-03-03','客服微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2822','0','ZK2018030307','2','1','2018-03-03',' Nicholas - 新','4168','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-04','2018-03-05','2018-03-06','2018-03-11','1','1',' 安徽省芜湖市三山区碧桂园640-2-1402','董超','17621202965','2018-03-12','789868414812','顺丰','','2018-03-12','2018-03-12','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2823','0','ZK2018030401','2','1','2018-03-04','a汇率','4169','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-05','2018-03-05','2018-03-06','2018-03-11','1','1','湖北省石首市孙家拐社区孙家拐超市','曾伟','13677207814','2018-03-12','789867508421','顺丰','','2018-03-12','2018-03-12','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2824','0','ZK2018030402','2','1','2018-03-04','奋斗','4170','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-05','2018-03-05','2018-03-06','2018-03-11','1','1','湖北省石首市建宁大道181号（华安保险公司）','张孝文','15571608333','2018-03-12','789867508458','顺丰','','2018-03-03','2018-03-03','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2825','0','ZK2018030501','2','1','2018-03-05','wang辉','4171','6','','260.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-06','2018-03-06','2018-03-07','2018-03-12','1','1','广州市海珠区金诚三街139号2610房','汪辉','13318808296','2018-03-13','789875240451','顺丰','','2018-03-12','2018-03-12','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2826','0','ZK2018030502','2','1','2018-03-05','wang辉','4172','6','','260.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-06','2018-03-06','2018-03-07','2018-03-12','1','1','广州市海珠区昌岗东路257号广州美术学院17栋501房','曾长鸣','13808895912','2018-03-13','789875240497','顺丰','','2018-03-12','2018-03-12','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2827','0','ZK2018030503','2','2','2018-03-05','Enna','4173','6','','520.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-05','2018-03-05','2018-03-06','2018-03-07','1','1','江西省赣州市兴国县高兴镇高兴卫生院对面长运香辣馆','周艳','15817376765','2018-03-09','789857649209','顺丰','(马尼拉)','2018-03-09','2018-03-09','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2828','0','ZK2018030504','2','1','2018-03-05','明少','4174','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-05','2018-03-05','2018-03-06','2018-03-11','1','1','湖北省荆州市石首市绣林街道中山路女人缘日化（华彩电影院旁、工商银行正对面）','杨柳青','13986696737
','2018-03-12','789867508494','顺丰','','2018-03-12','2018-03-12','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2829','0','ZK2018030506','2','1','2018-03-05','wang辉','4175','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-06','2018-03-06','2018-03-07','2018-03-12','1','1','广州市海珠区新港西路158号32—201','简炼','15002034876','2018-03-13','789875240549','顺丰','','2018-03-12','2018-03-12','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2830','0','ZK2018030507','2','2','2018-03-05','张蕊','4176','6','','510.00','6','6','','0.00','0.00','','10.00','0.00','','0.00','0.00','2018-03-06','2018-03-06','2018-03-07','2018-03-08','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-09','789858488422','顺丰','','2018-03-10','2018-03-10','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2831','0','ZK2018030508','2','2','2018-03-05','张蕊','4177','6','','510.00','1','1','','0.00','0.00','','10.00','0.00','','0.00','0.00','2018-03-06','2018-03-06','2018-03-07','2018-03-08','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-09','789858488422','顺丰','','2018-03-10','2018-03-10','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2832','0','ZK2018030509','2','2','2018-03-05','张蕊','4178','6','','510.00','1','1','','0.00','0.00','','10.00','0.00','','0.00','0.00','2018-03-06','2018-03-06','2018-03-07','2018-03-08','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-09','789858488422','顺丰','','2018-03-10','2018-03-10','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2833','0','ZK2018030510','2','1','2018-03-05','尤芳明','4179','6','','260.00','2','2','','0.00','0.00','','10.00','0.00','','0.00','0.00','2018-03-06','2018-03-06','2018-03-07','2018-03-12','1','1','福建省晋江市安海镇清机路宝龙小区宝龙豪苑','尤芳明','15985927307','2018-03-13','789874813681','顺丰','','2018-03-13','2018-03-13','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2834','0','ZK2018030511','2','2','2018-03-05','天道酬勤','4180','6','','510.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-06','2018-03-06','2018-03-08','2018-03-11','1','1','广州市番禺区钟村镇祈福缤纷汇11栋3201','饶英平','13533614236','2018-03-12','789868149742','顺丰','','2018-03-12','2018-03-12','客服微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2835','0','ZK2018030601','2','2','2018-03-06','Enna','4181','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-06','2018-03-07','2018-03-08','2018-03-12','1','1','广东省 广州市 海珠区 大塘村 桥南幼儿园','程龙','18688466441','2018-03-13','789874317607','顺丰','(编码错误 延迟出签)','2018-03-13','2018-03-13','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2836','0','ZK2018030602','2','1','2018-03-06','尤芳明','4182','6','','260.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-06','2018-03-06','2018-03-07','2018-03-12','1','1','福建省泉州市晋江市永和镇玉溪村顶东区178号','王仲秋','18559534573','2018-03-13','789874813732','顺丰','','2018-03-13','2018-03-13','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2837','0','ZK2018030603','2','1','2018-03-06','G J （潜水','4183','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-06','2018-03-06','2018-03-07','2018-03-12','1','1','河南省郑州市高新区盛世新天地48号楼1单元69号','郭矩   ','15538281909','2018-03-13','789875240585','顺丰','','2018-03-13','2018-03-13','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2838','0','ZK2018030604','2','1','2018-03-06','NikoChang','4184','6','','320.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','','','','','1','1','','-','','','','','','2018-03-06','2018-03-06','公司微信','','1','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2839','0','ZK2018030605','2','1','2018-03-06','尤芳明','4185','6','','260.00','5','5','','0.00','0.00','','10.00','0.00','','0.00','0.00','2018-03-07','2018-03-07','2018-03-08','2018-03-13','1','1','福建省晋江市安海镇清机路宝龙小区宝龙豪苑','尤芳明','15985927307','2018-03-14','789879502674','顺丰','','2018-03-14','2018-03-14','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2840','0','ZK2018030606','2','2','2018-03-06','张蕊','4186','6','','510.00','2','2','','0.00','0.00','','10.00','0.00','','0.00','0.00','2018-03-07','2018-03-07','2018-03-08','2018-03-12','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-13','789874317730','顺丰',' (编码错误 延迟出签)','2018-03-14','2018-03-14','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2841','0','ZK2018030607','2','1','2018-03-06',' 與倫比','4187','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-07','2018-03-07','2018-03-08','2018-03-13','1','1','广东省中山市古镇曹三同益工业园万豪工业大厦A2栋四楼','区銳斌','18688187577','2018-03-14','789879502716','顺丰','','2018-03-07','2018-03-07','客服微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2842','0','ZK2018030608','2','2','2018-03-06','张蕊','4188','6','','510.00','7','7','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-07','2018-03-07','2018-03-08','2018-03-12','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-13','789874317730','顺丰','夏盈盈(编码错误 延迟出签)','2018-03-14','2018-03-14','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2843','0','ZK2018030609','2','2','2018-03-06','张蕊','4189','6','','510.00','2','2','','0.00','0.00','','10.00','0.00','','0.00','0.00','2018-03-08','2018-03-09','2018-03-11','2018-03-12','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-13','789874317730','顺丰','(盛景)','2018-03-14','2018-03-14','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2844','0','ZK2018030610','2','2','2018-03-06','张蕊','4190','6','','510.00','3','3','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-08','2018-03-09','2018-03-11','2018-03-12','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-13','789874317730','顺丰','(盛景)','2018-03-14','2018-03-14','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2845','0','ZK2018030701','2','1','2018-03-07','yan','4191','6','','260.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-08','2018-03-09','2018-03-11','2018-03-14','1','1','福建省晋江市梅岭街道瑞璟小区5幢602','王\'S ','15859759888','2018-03-15','789885552015','顺丰','','2018-03-07','2018-03-07','客服微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2846','0','ZK2018030702','2','2','2018-03-07','张欢18907583498 ','4192','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-08','2018-03-11','2018-03-12','2018-03-13','1','1','江西省宜春市万载县康乐镇城北农贸市场第四中学(旁)','阳思圹','13026266886','2018-03-14','789879502761','顺丰','','2018-03-07','2018-03-07','客服微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2847','0','ZK2018030703','2','1','2018-03-07','尤芳明','4193','6','','260.00','4','4','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-09','2018-03-09','2018-03-11','2018-03-14','1','1','福建省晋江市安海镇清机路宝龙小区宝龙豪苑 ','尤芳明','15985927307','2018-03-15','789885552024','顺丰','陈伟（湖南）','2018-03-15','2018-03-15','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2848','0','ZK2018030704','2','1','2018-03-07','客服微信 竪子李','4194','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-10','2018-03-11','2018-03-12','2018-03-15','1','1','云南省昆明市官渡区春城路177号','李海韵','13560492969','2018-03-16','789891336995','顺丰','','2018-03-07','2018-03-07','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2849','0','ZK2018030801','2','1','2018-03-08','白纸黑字','4195','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-09','2018-03-11','2018-03-12','2018-03-15','1','1','湖北省荆州市石首市楚天大道孙家拐超市','陈志兴','18682137534','2018-03-16','789891912010','顺丰','','2018-03-16','2018-03-16','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2850','0','ZK2018030901','2','1','2018-03-09','Nicholas - 新','4196','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-11','2018-03-11','2018-03-12','2018-03-15','1','1','广州越秀区解放南路万菱广场1D020','欧小姐','13922728865','2018-03-16','789891336959','顺丰','','2018-03-16','2018-03-16','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2851','0','ZK2018031001','2','1','2018-03-10','比顿留学','4197','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-10','2018-03-11','2018-03-12','2018-03-15','1','1','广东省广州市黄埔区萝岗万达广场C1栋1013（游学部）','林小姐','13826101511','2018-03-16','789891336968','顺丰','','2018-03-16','2018-03-16','对私招行','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2852','0','ZK2018031002','2','1','2018-03-10','客服微信：红尘梦','4198','6','','260.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-13','2018-03-13','2018-03-14','2018-03-19','1','1','黑龙江省哈尔滨市方正县德善乡政府家属楼1号楼5单元302室','李明帅','15146034517','2018-03-21','789915741217','顺丰','王健(旧签)','2018-03-21','2018-03-21','客服微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2853','0','ZK2018031003','2','1','2018-03-10','尤芳明','4199','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-10','2018-03-11','2018-03-12','2018-03-15','1','1','福建省晋江市安海镇清机路宝龙小区宝龙豪苑 ','尤芳明','15985927307','2018-03-16','789891362172','顺丰','','2018-03-16','2018-03-16','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2854','0','ZK2018031004','2','2','2018-03-10','张蕊','4200','6','','510.00','1','1','','0.00','0.00','','10.00','0.00','','0.00','0.00','2018-03-11','2018-03-12','2018-03-13','2018-03-14','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-15','789885552042','顺丰','','2018-03-16','2018-03-16','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2855','0','ZK2018031005','2','1','2018-03-10','尤芳明','4201','6','','260.00','3','3','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-11','2018-03-11','2018-03-12','2018-03-15','1','1','福建省晋江市安海镇清机路宝龙小区宝龙豪苑 ','尤芳明','15985927307','2018-03-16','789891362172','顺丰','','2018-03-16','2018-03-16','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2856','0','ZK2018031006','2','2','2018-03-10','张蕊','4202','6','','510.00','5','5','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-11','2018-03-12','2018-03-13','2018-03-14','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-15','789885552042','顺丰','','2018-03-16','2018-03-16','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2857','0','ZK2018031007','2','2','2018-03-10','邓迎超','4203','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-11','2018-03-12','2018-03-13','2018-03-14','1','1','广东省深圳市龙华区大浪南路城市阳光花园上庭阁','邓迎超','13751032040','2018-03-15','789885552060','顺丰','','2018-03-15','2018-03-15','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2858','0','ZK2018031201','2','2','2018-03-10','张蕊','4204','6','','510.00','3','3','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-12','2018-03-13','2018-03-14','2018-03-15','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-16','789891336986','顺丰','','2018-03-16','2018-03-16','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2859','0','ZK2018031202','2','1','2018-03-12','客服微信：A厦门朋宏劳务','4205','6','','260.00','2','2','','0.00','0.00','','0.00','0.00','','23.00','0.00','2018-03-13','2018-03-13','2018-03-14','2018-03-19','1','1','湖北省孝感市孝昌县周巷镇大屋村五组  ','陈凡收  ','15072623402','2018-03-20','789909394978','顺丰','(收据金额加上快递费）拍照和签证正反面拍照','2018-03-20','2018-03-20','客服微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2860','0','ZK2018031203','2','1','2018-03-12','客服微信：卍凌☆卿卍','4206','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-13','2018-03-13','2018-03-14','2018-03-19','1','1','江西省，宜春市，万载县 (电话联系自取)  ','郭青   ','15180599811','2018-03-20','789909394996','顺丰','','2018-03-12','2018-03-12','客服微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2861','0','ZK2018031008','2','1','2018-03-12','Nicholas - 新','4207','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-12','2018-03-12','2018-03-13','2018-03-18','1','1','广东省广州市白云区南村中路5号','厉建飞','13078899399','2018-03-19','789904031961','顺丰','','2018-03-19','2018-03-19','客服微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2862','0','ZK2018031204','2','1','2018-03-12','李建峰','4208','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-12','2018-03-12','2018-03-13','2018-03-18','1','1','江西省抚州市南丰县莱溪乡杨梅坑村许家堡组23号','李建峰  ','15946971225','2018-03-19','789903220709','顺丰','','2018-03-10','2018-03-10','客服微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2863','0','ZK2018031205','2','1','2018-03-12','a汇率','4209','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-12','2018-03-12','2018-03-13','2018-03-18','1','1','湖北省荆州市石首市东方大道孙家拐社区超市','陈世勇','18627240008','2018-03-19','789905289959','顺丰','','2018-03-19','2018-03-19','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2864','0','ZK2018031206','2','1','2018-03-12','张蕊','4210','6','','260.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-12','2018-03-12','2018-03-13','2018-03-18','1','1','福建省厦门市湖里区兴隆路源昌豪庭23号401室','颜婷君','13030891419','2018-03-19','789903220736','顺丰','','2018-03-19','2018-03-19','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2865','0','ZK2018031207','2','2','2018-03-12','张蕊','4211','6','','510.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-13','2018-03-13','2018-03-14','2018-03-15','1','1','广东省云浮市新兴县州学街101号南楼103室','小敏','18218320663','2018-03-16','789891336977','顺丰','','2018-03-16','2018-03-16','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2866','0','ZK2018031208','2','1','2018-03-12','心甘情愿','4212','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-13','2018-03-13','2018-03-14','2018-03-19','1','1','广东省东莞市长安镇S358省道沙头路段946—948号','宋金水','13538650909','2018-03-20','789909395142','顺丰','','2018-03-20','2018-03-20','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2867','0','ZK2018031209','2','1','2018-03-12','尤芳明','4213','6','','260.00','5','5','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-13','2018-03-13','2018-03-14','2018-03-19','1','1','福建省晋江市安海镇清机路宝龙小区宝龙豪苑','尤芳明','15985927307','2018-03-20','789909395151','顺丰','','2018-03-20','2018-03-20','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2868','0','ZK2018031210','2','1','2018-03-12','Cyr微信','4214','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-13','2018-03-13','2018-03-14','2018-03-19','1','1','广东省广州市海珠区中大长江辅料市场楼C255','蔡S','15902002568','2018-03-22','789922174916','顺丰','（到付运费13元）','2018-03-22','2018-03-22','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2869','0','ZK20180312111','2','2','2018-03-12','张蕊','4215','6','','510.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-13','2018-03-13','2018-03-14','2018-03-15','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-16','789891336986','顺丰','','2018-03-16','2018-03-16','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2870','0','ZK2018031301','2','1','2018-03-13','张蕊','4216','6','','260.00','3','3','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-14','2018-03-14','2018-03-15','2018-03-20','1','1','浙江省温州市瑞安市莘塍南镇振南路72号','叶凯','13587489777','2018-03-21','789915295552','顺丰','','2018-03-21','2018-03-21','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2871','0','ZK2018031401','2','1','2018-03-14','比顿游学','4217','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-18','2018-03-18','2018-03-19','2018-03-22','1','1','广东省广州市黄埔区萝岗万达广场C1栋1013（游学部）','林小姐','13826101511','2018-03-23','789927026093','顺丰','','2018-03-26','2018-03-26','对私招行','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2872','0','ZK2018031402','2','2','2018-03-14','一个有故事的男人','4218','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-16','2018-03-16','2018-03-18','2018-03-21','1','1','广东省东莞市虎门镇连升路新都装饰城北门对面2楼，明悦服饰','杨R','15916868219','2018-03-22','619133827068','顺丰','(正常办理)','2018-03-14','2018-03-14','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2873','0','ZK2018031403','2','2','2018-03-14','张蕊','4219','6','','510.00','2','2','','0.00','0.00','','20.00','0.00','','0.00','0.00','2018-03-15','2018-03-16','2018-03-18','2018-03-19','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-20','789909395160','顺丰','','2018-03-20','2018-03-20','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2874','0','ZK2018031404','2','1','2018-03-14','隔壁的，Mr王','4220','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-15','2018-03-16','2018-03-18','2018-03-21','1','1','湖北省荆州市石首市笔架山街道孙家拐超市收','廖宜鑫','18672992552','2018-03-23','789926290305','顺丰','','2018-03-14','2018-03-14','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2875','0','ZK2018031601','2','1','2018-03-16','东莞','4221','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-16','2018-03-16','2018-03-18','2018-03-21','1','1','东莞市常平镇土塘市场猪肉当口336.','汪保仔','13922869339','2018-03-23','789926290314','顺丰','','2018-03-16','2018-03-16','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2876','0','ZK2018031701','2','1','2018-03-17','尤芳明','4222','6','','260.00','5','5','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-18','2018-03-18','2018-03-19','2018-03-22','1','1','福建省晋江市安海镇清机路宝龙小区宝龙豪苑','尤芳明','15985927307','2018-03-23','789926290323','顺丰','','2018-03-22','2018-03-22','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2877','0','ZK2018031702','2','2','2018-03-17','涛子','4223','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-19','2018-03-19','2018-03-20','2018-03-21','1','1','湖北省石首市东升镇桥北街15号','王小娟','18272206267','2018-03-23','789926290332','顺丰','','2018-03-22','2018-03-22','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2878','0','ZK2018031703','2','1','2018-03-17','Nicholas - 新','4224','6','','260.00','3','3','','0.00','0.00','','30.00','0.00','','0.00','0.00','2018-03-18','2018-03-18','2018-03-19','2018-03-22','1','1','广东省广州市白云区南村中路5号','周翠媚','13059199899','2018-03-23','789926290341','顺丰','','2018-03-22','2018-03-22','公司微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2879','0','ZK2018031901','2','2','2018-03-19','A财神','4225','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-19','2018-03-19','2018-03-20','2018-03-21','1','1','湖北省石首市笔架山办孙家拐超市','李大庆 ','18607216612','2018-03-23','789926290350','顺丰','','2018-03-22','2018-03-22','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2880','0','ZK2018031902','2','2','2018-03-19','张蕊','4226','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-19','2018-03-19','2018-03-20','2018-03-21','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-23','789926290369','顺丰','','2018-03-23','2018-03-23','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2881','0','ZK2018031903','2','2','2018-03-19','张蕊','4227','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-20','2018-03-20','2018-03-21','2018-03-22','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-23','789926290369','顺丰','','2018-03-23','2018-03-23','支付宝','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2882','0','ZK2018031904','2','1','2018-03-19','尤芳明','4228','6','','260.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-20','2018-03-20','2018-03-21','2018-03-26','1','1','福建省晋江市安海镇清机路宝龙小区宝龙豪苑','尤芳明','15985927307','2018-03-27','789945497203','顺丰','','2018-03-26','2018-03-26','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2883','0','ZK2018031905','2','2','2018-03-19','小CC','4229','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-20','2018-03-20','2018-03-21','2018-03-22','1','1','山东省济南市天桥区制锦市焦家隅首街2号','陈美彤','18560020707','2018-03-23','789926290378','顺丰','','2018-03-20','2018-03-20','微信','','5','0','1522162999','1522162999');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2884','0','ZK2018031906','2','2','2018-03-19',' 客服微信：Mandy小晴','4249','6','','260.00','1','1','','252.00','0.00','','0.00','0.00','','23.00','0.00','2018-03-22','2018-03-23','2018-03-25','2018-03-26','1','1','四川省  成都市 青羊区  同心路171号瓦舍','陈金凤','18200565856','2018-03-27','789945497197','顺丰','','2018-03-19','2018-03-19','支付宝','','5','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2885','0','ZK2018031907','2','1','2018-03-19',' 尤芳明','4250','6','','260.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-21','2018-03-21','2018-03-22','2018-03-27','1','1','','-','','','','','','','','','','5','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2886','0','ZK2018032001','2','2','2018-03-20','张蕊','4251','6','','510.00','1','1','','0.00','0.00','','10.00','0.00','','0.00','0.00','2018-03-21','2018-03-21','2018-03-22','2018-03-25','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-26','789939306028','顺丰','','2018-03-26','2018-03-26','微信','','5','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2887','0','ZK2018032002','2','2','2018-03-20','张蕊','4252','6','','510.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-21','2018-03-21','2018-03-22','2018-03-25','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-26','789939306028','顺丰','','2018-03-26','2018-03-26','微信','','5','0','1522163266','1522216656');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2888','0','ZK2018032101','2','1','2018-03-21',' Nicholas - 新','4253','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-21','2018-03-21','2018-03-22','2018-03-27','1','1','','-','','','','','','','','','','5','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2889','0','ZK2018032102','2','2','2018-03-21','张蕊','4254','6','','510.00','5','5','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-22','2018-03-23','2018-03-25','2018-03-26','1','1','福建省厦门市东渡路都市港湾5#2103','张蕊','18506955721','2018-03-27','789945497337','顺丰',' 范鑫(旧签)  ','2018-03-27','2018-03-27','支付宝','','5','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2890','0','ZK2018032201','2','2','2018-03-22','客服微信：Mandy小晴','4255','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','23.00','0.00','2018-03-23','2018-03-23','2018-03-25','2018-03-26','1','1','湖南省 怀化市  沅陵县 官庄镇','舒均欢','17674771253','','','','(同舒云展一起寄回)','','','','','5','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2891','0','ZK2018032202','2','2','2018-03-22','客服微信：Mandy小晴','4256','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-25','2018-03-26','2018-03-27','','1','1','湖南省 怀化市  沅陵县 官庄镇','舒均欢','17674771253','','','','(同舒均欢一起寄回）','2018-03-26','2018-03-26','客服收款','','4','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2892','0','ZK2018032203','2','2','2018-03-22','张蕊','4257','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-25','2018-03-25','2018-03-26','2018-03-27','1','1','贵州省凯里市麻江县杏山镇军民路锐城批发部 ','李茂芳','18286553821','','','','','','','','','5','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2893','0','ZK2018032401','2','1','2018-03-24','sam','4258','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-24','2018-03-25','2018-03-26','','1','1','','-','','','','','','','','','','4','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2894','0','ZK2018032501','2','1','2018-03-25','Sixsix Eight','4259','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-25','2018-03-25','2018-03-26','','1','1','','-','','','','','','','','','','4','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2895','0','ZK2018032502','2','1','2018-03-25','客服微信：Mandy小晴','4260','6','','260.00','2','2','','0.00','0.00','','0.00','0.00','','23.00','0.00','2018-03-25','2018-03-25','2018-03-26','','1','1','湖南省株洲市攸县大同桥镇医院斜对面绿保超市','吴富强','15273336221','','','','','','','','','4','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2896','0','ZK2018032503','2','1','2018-03-25','尤芳明','4261','6','','260.00','3','3','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-25','2018-03-25','2018-03-26','','1','1','','-','','','','','','','','','','4','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2897','0','ZK2018032504','2','2','2018-03-25','尤芳明','4262','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-25','2018-03-26','2018-03-27','','1','1','','-','','','','','','','','','','4','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2898','0','ZK2018032206','2','2','2018-03-22','张蕊','4263','6','','510.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-23','2018-03-26','2018-03-27','','1','1','','-','','','','','','','','','','4','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2899','0','ZK2018032207','2','1','2018-03-22','顾岑光','4264','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','23.00','0.00','2018-03-23','2018-03-26','2018-03-27','','1','1','','-','','','','','','2018-03-26','2018-03-26','微信','','4','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2900','0','ZK2018032601','2','2','2018-03-26','张蕊','4265','6','','510.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-27','2018-03-27','2018-03-28','','1','1','','-','','','','','(正常办理)','','','','','4','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2901','0','ZK2018032602','2','1','2018-03-26','奈何桥上唱（领唔','4266','6','','260.00','1','1','','0.00','0.00','','0.00','0.00','','0.00','0.00','2018-03-27','2018-03-27','2018-03-28','','1','1','河南省南阳市宛城区兴隆路鸭灌小区3号楼一单元201','景小磊','15138421011','','','','','2018-03-27','2018-03-27','客服微信','','4','0','1522163266','1522163266');;;
INSERT INTO `yii2_order` (`id`,`pid`,`order_num`,`order_classify`,`order_type`,`order_date`,`customer_id`,`combo_id`,`custom_servicer_id`,`transactor_name`,`single_sum`,`total_person`,`output_total_person`,`balance_order`,`balance_sum`,`output_balance_sum`,`flushphoto_order`,`flushphoto_sum`,`output_flushphoto_sum`,`carrier_order`,`carrier_sum`,`output_carrier_sum`,`collect_date`,`deliver_date`,`entry_date`,`putsign_date`,`operator_id`,`mod_operator_id`,`back_address`,`back_addressee`,`back_telphone`,`delivergood_date`,`deliver_order`,`delivercompany`,`remark`,`receipt_date`,`company_receipt_date`,`pay_account`,`pay_date`,`audit_status`,`cid`,`created_at`,`updated_at`) VALUES
('2902','0','ZK2018032701','2','2','2018-03-27','Lee','4267','6','','510.00','2','2','','0.00','0.00','','0.00','0.00','','0.00','0.00','','','','','1','1','','-','','','','','','','','','','1','0','1522163266','1522163266');;;
-- -------------------------------------------
-- TABLE DATA yii2_order_product
-- -------------------------------------------
-- -------------------------------------------
-- TABLE DATA yii2_order_to_transactor
-- -------------------------------------------
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2843','4137');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2839','4072');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2824','3644');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2829','3651');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2865','4289');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2866','3617');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2862','4284');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2814','3637');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2876','4307');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2852','4265');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2833','3616');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2859','4281');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2785','4107');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2890','4364');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2852','4264');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2812','3629');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2812','3628');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2797','4116');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2865','4288');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2811','3627');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2878','4314');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2889','4363');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2874','4305');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2804','4138');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2845','4107');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2870','4300');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2895','4369');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2840','4075');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2810','3428');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2856','4275');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2896','4371');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2822','3634');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2844','4140');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2894','4368');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2869','4296');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2855','4268');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2830','3610');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2814','3636');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2889','4362');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2839','4071');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2805','4139');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2804','4137');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2801','4127');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2802','4130');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2867','4292');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2837','4038');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2803','4136');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2855','4269');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2826','3648');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2778','4098');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2830','3612');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2828','3650');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2842','4256');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2818','3416');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2816','3620');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2792','4110');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2839','4070');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2809','3427');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2807','3604');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2808','3426');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2807','3603');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2770','4088');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2886','4355');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2825','3645');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2817','3623');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2851','4263');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3755');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2838','4068');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2898','4375');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2897','4374');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2877','4312');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2813','3635');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2812','3633');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2888','4358');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2830','3613');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2785','4106');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2747','4099');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2780','4101');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2777','4096');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2799','4119');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2803','4135');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2800','4120');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2805','4141');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2861','4283');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2844','4141');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2784','4105');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2876','4311');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2869','4297');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2774','4092');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2807','3606');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2847','3823');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2807','3605');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2889','4360');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2801','4131');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2875','4306');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2867','4293');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2876','4310');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2900','4377');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2773','4091');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2842','4261');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2816','3621');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2867','4290');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2863','4285');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2856','4271');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2843','4138');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2902','4380');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2202','3467');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2840','4074');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2814','3638');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2839','4069');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2816','3622');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2849','4262');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2856','4273');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2856','4274');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2856','4272');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2807','3602');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2867','4294');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2826','3647');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2900','4378');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2842','4260');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2818','3417');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2850','4153');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2836','4044');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2832','3614');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2864','4287');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2775','4093');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2870','4298');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2870','4299');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2834','4025');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2806','4146');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2887','4357');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2802','4129');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2815','3642');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2787','4109');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2815','3640');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2847','4148');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2858','4278');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2893','4367');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2887','4356');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2801','4128');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2776','4095');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2831','3609');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2864','4286');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2873','4304');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2845','4106');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2830','3607');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2860','4282');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2880','4317');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2878','4315');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2772','4090');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2895','4370');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2847','4150');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2834','4019');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2815','3641');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2786','4108');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2815','3639');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2847','4149');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2858','4277');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2892','4366');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2801','4121');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2889','4361');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2883','4321');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2818','3418');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2901','4379');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2844','4139');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2842','4258');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2885','4354');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2876','4308');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2805','4140');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2854','4267');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2795','4113');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2836','4045');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2884','4352');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2881','4318');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2781','4102');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2842','4259');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2902','4381');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2833','3615');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2835','4047');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2842','4257');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2796','4114');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2783','4104');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2882','4319');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2882','4320');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2848','4102');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2855','4270');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2872','4302');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2871','4301');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2896','4373');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2839','4073');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2816','3618');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2867','4291');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2830','3608');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2801','4124');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2771','4089');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2841','4100');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2821','3626');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2846','4089');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2801','4120');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2873','4303');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2889','4359');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2776','4094');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2825','3646');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2777','4097');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2830','3611');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2827','3649');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2842','4255');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2817','3624');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2816','3619');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2793','4111');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2820','3625');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2853','4266');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2876','4309');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2879','4316');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2823','3643');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2899','4376');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2812','3632');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2796','4115');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2859','4280');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2794','4112');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2857','4276');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2812','3631');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2868','4295');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2878','4313');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2885','4353');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2812','3630');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2891','4365');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2858','4279');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2819','3415');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2896','4372');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2451','3736');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2451','3737');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2451','3738');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2451','3739');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2452','3740');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2452','3741');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2453','3742');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2454','3743');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2455','3744');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2455','3745');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2456','3746');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2457','3747');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2457','3748');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2458','3749');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2459','3750');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2460','3751');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2461','3752');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2461','3753');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2461','3754');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2782','4103');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2463','3756');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2464','3757');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2465','3758');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2466','3759');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2467','3760');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2468','3761');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2469','3762');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2470','3763');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2471','3764');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2472','3765');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2473','3766');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2474','3767');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2475','3768');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2476','3769');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2477','3770');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2477','3771');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2478','3772');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2478','3773');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2478','3774');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2478','3775');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2479','3776');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2480','3777');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2481','3778');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2481','3779');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2481','3780');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2481','3781');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2481','3782');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2482','3783');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2483','3784');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2484','3785');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2485','3786');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2486','3787');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2487','3788');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2487','3789');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2488','3790');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2488','3791');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2489','3792');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2489','3793');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2489','3794');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2490','3795');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2490','3796');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2491','3797');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2492','3798');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2492','3799');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2779','4100');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3800');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3801');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3802');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3803');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3804');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3805');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3806');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3807');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3808');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3809');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3810');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2493','3811');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2494','3812');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2495','3813');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2496','3814');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2496','3815');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2798','4117');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2498','3817');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2499','3818');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2500','3819');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2500','3820');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2500','3821');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2500','3822');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2500','3823');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2501','3824');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2501','3825');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2501','3826');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2501','3827');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2502','3828');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2503','3829');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2503','3830');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2504','3831');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2504','3832');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2505','3833');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2506','3834');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2507','3835');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2508','3836');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2509','3837');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2510','3838');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2511','3839');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2512','3840');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2513','3841');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2514','3842');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2515','3843');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2516','3844');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2516','3845');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2517','3846');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2518','3847');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2519','3440');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2520','3443');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2521','3445');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2521','3446');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2521','3447');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2521','3448');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2521','3449');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2521','3976');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2522','3452');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2522','3451');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2522','3453');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2523','3977');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2524','3978');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2525','3861');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2525','3862');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2526','3863');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2526','3864');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2527','3457');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2528','3458');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2529','3460');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2530','3461');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2531','3462');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2532','3463');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2533','3865');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2533','3465');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2533','3468');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2534','3866');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2534','3867');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2534','3868');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2535','3470');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2535','3979');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2749','3472');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2537','3473');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2538','3474');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2539','3475');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2540','3459');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2541','3476');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2541','3477');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2541','3478');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2541','3479');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2541','3480');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2541','3481');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2542','3482');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2542','3483');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2542','3484');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2543','3182');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2543','3981');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2544','3486');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2544','3487');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2545','3488');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2546','3489');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2547','3490');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2548','3491');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2549','3982');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2550','3496');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2550','3497');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2551','3869');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2552','3870');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2553','3498');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2554','3499');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2555','3500');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2556','3501');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2557','3502');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2558','3437');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2559','3506');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2559','3983');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2560','3503');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2560','3984');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2561','3507');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2562','3508');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2563','3454');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2564','3871');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2565','3872');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2566','3873');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2567','3874');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2567','3875');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2568','3876');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2569','3877');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2569','3878');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2570','3879');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2570','3880');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2571','3881');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2571','3882');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2572','3883');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2572','3884');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2573','3885');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2574','3886');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2575','3887');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2575','3888');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2576','3889');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2577','3890');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2578','3891');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2578','3892');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2579','3433');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2580','3893');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2581','3894');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2582','3895');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2583','3896');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2584','3897');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2585','3898');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2586','3899');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2587','3900');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2588','3901');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2589','3902');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2589','3903');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2590','3904');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2591','3905');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2592','3434');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2593','3435');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2594','3436');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2595','3438');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2596','3442');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2597','3441');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2598','3444');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2599','3544');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2599','3545');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2599','3546');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2600','3547');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2601','3906');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2602','3907');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2603','3908');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2604','3909');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2605','3910');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2606','3911');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2607','3912');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2607','3913');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2607','3914');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2608','3776');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2699','3513');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2610','3218');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3267');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3268');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3915');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3270');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3271');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3272');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3273');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3274');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3275');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3276');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3277');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3278');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3279');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3280');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3281');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3282');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3283');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3284');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3285');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2611','3286');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2612','3308');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2612','3309');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2613','3403');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2614','3916');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2614','3917');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2616','3918');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2617','3919');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2618','3920');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2619','3921');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2619','3922');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2619','3923');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2620','3924');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2621','3925');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2622','3926');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2623','3927');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2624','3928');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2625','3929');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2625','3930');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2626','3931');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2627','3932');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2628','3933');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2629','3409');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2630','3410');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2630','3243');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2631','3934');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2631','3935');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2632','3411');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2633','3936');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2634','3937');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2634','3938');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2634','3939');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2634','3940');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2634','3941');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2634','3942');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2635','3943');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2635','3944');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2636','3945');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2636','3946');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2637','3947');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2637','3948');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2637','3949');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2638','3950');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2639','3951');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2639','3243');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2640','3952');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2641','3953');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2642','3954');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2642','3955');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2642','3956');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2643','3957');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2643','3958');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2644','3959');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2644','3243');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2645','3960');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2646','3961');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2646','3962');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2647','3963');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2648','3964');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2648','3965');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2649','3966');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2650','3967');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2651','3968');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2652','3969');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2653','3970');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2654','3971');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2655','3972');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2656','3973');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2657','3974');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2658','3975');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2659','3602');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2659','3603');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2659','3604');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2659','3605');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2659','3606');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2660','3426');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2661','3427');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2662','3428');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2663','3618');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2663','3619');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2663','3620');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2663','3621');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2663','3622');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2664','3623');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2664','3624');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2665','3416');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2665','3417');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2665','3418');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2666','3415');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2667','3625');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2668','3626');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2669','3627');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2670','3628');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2670','3629');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2670','3630');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2670','3631');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2670','3632');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2670','3633');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2671','3634');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2672','3635');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2673','3636');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2673','3637');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2673','3638');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2674','3639');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2674','3640');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2674','3641');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2674','3642');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2675','3643');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2676','3644');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2677','3645');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2677','3646');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2677','3647');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2677','3648');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2678','3649');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2679','3650');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2680','3651');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2681','3607');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2681','3608');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2681','3609');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2681','3610');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2681','3611');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2681','3612');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2681','3613');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2682','3614');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2683','3615');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2683','3616');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2684','3617');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2685','3848');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2685','3849');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2686','3850');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2686','3851');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2686','3852');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2686','3853');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2687','3854');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2688','3855');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2689','3856');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2690','3412');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2691','3857');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2691','3858');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2691','3859');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2691','3860');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2692','3142');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2693','3985');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2694','3986');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2694','3987');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2695','3988');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2697','3990');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2698','3989');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2700','3512');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2701','3509');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2702','3514');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2702','3516');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2702','3517');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2702','3518');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2702','3519');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2702','4006');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2703','4007');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2704','4008');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2704','4009');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2705','3526');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2705','3527');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2706','3528');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2707','3529');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2707','3530');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2708','3531');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2708','3532');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2708','3168');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2709','3533');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2710','3534');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2711','3535');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2711','3540');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2712','3541');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2713','3536');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2713','3537');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2714','3538');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2715','3539');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2716','3542');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2717','3543');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2718','3548');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2719','4011');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2727','4019');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2720','4015');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2721','4016');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2721','4017');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2722','4018');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2723','3510');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2723','4020');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2724','3549');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2725','3550');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2725','4021');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2726','4022');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2726','4023');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2726','4024');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2727','4025');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2728','4026');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2730','4027');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2731','4028');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2732','4029');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2733','4030');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2733','4031');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2733','4032');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2733','4033');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2734','4034');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2734','4035');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2734','4036');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2735','4037');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2736','4038');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2740','4042');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2739','4041');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2741','4043');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2742','4044');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2742','4045');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2743','4047');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2744','4048');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2745','4049');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2746','4050');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2747','4051');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2748','4052');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2750','4053');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2751','4054');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2751','4055');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2751','4056');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2751','4057');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2752','4058');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2753','4060');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2753','4061');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2533','4062');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2533','3466');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2533','3469');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2754','4063');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2755','4064');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2756','4065');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2757','4066');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2758','4067');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2759','4068');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2760','4069');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2760','4070');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2760','4071');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2760','4072');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2760','4073');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2761','4074');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2761','4075');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2762','4076');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2762','4077');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2763','4078');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2763','4079');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2764','4080');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2765','4081');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2765','4082');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2765','4083');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2766','4084');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2766','4085');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2767','3816');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2768','4086');;;
INSERT INTO `yii2_order_to_transactor` (`o_id`,`t_id`) VALUES
('2769','4087');;;
-- -------------------------------------------
-- TABLE DATA yii2_product
-- -------------------------------------------
INSERT INTO `yii2_product` (`id`,`name`,`cost`) VALUES
('67639','菲律宾59天单次签证','0.00');;;
INSERT INTO `yii2_product` (`id`,`name`,`cost`) VALUES
('67640','菲律宾三个月多次签证','0.00');;;
INSERT INTO `yii2_product` (`id`,`name`,`cost`) VALUES
('67641','菲律宾半年多次签证','0.00');;;
INSERT INTO `yii2_product` (`id`,`name`,`cost`) VALUES
('67642','马来西亚-15天ENTRI','0.00');;;
INSERT INTO `yii2_product` (`id`,`name`,`cost`) VALUES
('67643','马来西亚-30天EVISA','0.00');;;
INSERT INTO `yii2_product` (`id`,`name`,`cost`) VALUES
('67644','马来西亚-30天贴纸签','0.00');;;
INSERT INTO `yii2_product` (`id`,`name`,`cost`) VALUES
('67645','柬埔寨电子签','0.00');;;
INSERT INTO `yii2_product` (`id`,`name`,`cost`) VALUES
('67646','柬埔寨贴纸签','0.00');;;
INSERT INTO `yii2_product` (`id`,`name`,`cost`) VALUES
('67647','菲律宾落地签','0.00');;;
-- -------------------------------------------
-- TABLE DATA yii2_product_combo
-- -------------------------------------------
-- -------------------------------------------
-- TABLE DATA yii2_servicer
-- -------------------------------------------
INSERT INTO `yii2_servicer` (`id`,`name`,`tb_servicer_id`,`admin_id`) VALUES
('6','kevin','kevin','1');;;
INSERT INTO `yii2_servicer` (`id`,`name`,`tb_servicer_id`,`admin_id`) VALUES
('2','小阳','xiaoyang','13');;;
INSERT INTO `yii2_servicer` (`id`,`name`,`tb_servicer_id`,`admin_id`) VALUES
('5','枫','FENG','9');;;
-- -------------------------------------------
-- TABLE DATA yii2_session
-- -------------------------------------------
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('0don9ho73evr551ajgi95pugq1','1520563585','__flash|a:0:{}__id|i:9;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('1k5gfjgn8tput3a65o1918ilc5','1520909418','__flash|a:0:{}__id|i:10;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('1s9ph14evdog6tc77kpu0vv6l5','1520755572','__flash|a:0:{}__id|i:10;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('267tg4f2bb955mpitsjichouc2','1520474086','__flash|a:0:{}__id|i:11;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('28qb897vu7rjmu4puelsrp65n1','1520578045','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('39n09lkguf6nq4aeba3brdd301','1522218136','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('3iq9q3et9jng04q4v055o28fu6','1520585225','__flash|a:0:{}__id|i:13;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('4sdg8iv0e5cfg22ki6em4060v6','1520487298','__flash|a:0:{}__id|i:9;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('5dg3o7hcpemrbbsfs46h3t3s60','1520589274','__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('5ek6pkb6oif8ah2l6fafbc5in5','1521440321','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('7e7cau5b99nh0i97l7p55uvon5','1522165122','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('7qqcs3omi2v1bemgh6hajeuk80','1520419602','__flash|a:0:{}__id|i:11;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('8fhheehhqt91cus2bh0sc2f0q2','1521428931','__flash|a:0:{}__id|i:10;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('98d3ap1hfffgk4cr631k6ruqt4','1520865066','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('99m4jc9oigbcm0c182pj2pf944','1520652974','__flash|a:0:{}__id|i:11;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('b6t466b1ljtc4epkqi3qg2fvt1','1520522923','__flash|a:0:{}__id|i:9;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('b7vja8l8e9b0ucfa7g4knum6p6','1520502818','__flash|a:0:{}__id|i:11;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('bcbvftmhn0pb2e763lt6ejput5','1520501170','__flash|a:0:{}__id|i:9;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('bi053v45kl6hccghl9bnd0bkd3','1520494013','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('bprhe8kqcjrh4niv7o4fl1ous6','1520947868','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('c5gk2vg87jjjkb3r6md51kd5j3','1520504009','__flash|a:0:{}__id|i:10;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('d8v2ch9j943sqouqe69nn8iq43','1521603389','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('f1ptv83se2iksemliga3buj0q0','1521775249','__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('fnbc63pbav14h88rd4jingsch2','1522215943','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('g2cl4hjiujvuapn9dqaur6dsf5','1520584618','__flash|a:0:{}__id|i:10;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('g8pvk7kvgvg540rmg0pau0rtv4','1520422571','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('g9njblv8s9l7dk5draphs60kv7','1520749322','__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:13;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('ge949p20rppg8p6vdteqgfimd5','1521603020','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('gttr3sqomaf4cjiod610cp0oa5','1522215907','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('guulf6n3ju58i4a6054kigm0q4','1520503947','__flash|a:0:{}__id|i:10;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('hehqh56139qvt8emg01q8r0me1','1520581250','__flash|a:0:{}__id|i:11;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('hpmukro8gm60kf8p3sri54ghr0','1521255958','__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:13;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('jj6mp4soudhhh434av3qlhcq67','1522203875','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('jjlce16n1r1ga3c9el2mkoocd0','1520757797','__flash|a:0:{}');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('jlu4m3lmh6bjr8edg7tr6seo61','1520416200','__flash|a:0:{}__id|i:9;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('jn3kmmdgd7povcl31r3ksubtt3','1522218502','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('jsth9nsorlpocgbolmm5ps1u44','1521726464','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('k3v0099d0ic7714vh3c3mod3t7','1520918077','__flash|a:0:{}__id|i:13;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('leehiq303bbsqitb6aqpuqb6p3','1520418263','__flash|a:0:{}__id|i:10;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('m5rjapsc15u7phfsb2frns8s54','1521516963','__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('mtranhqb2lonbfom4bkhj1vip3','1522307521','__flash|a:0:{}');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('n5ehqafqipmhhaqivsue6ip8i7','1520839644','__flash|a:0:{}__id|i:10;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('n5u19jts5a0u8abd4d51svvsa5','1520818048','__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('nkdodtf6ou6dia9ap9iflepqv0','1520416193','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('osg41gppupddgageij2a87mru7','1520923876','__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('p4bavs9u60lfsd0dumept18947','1520923157','__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:11;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('p5ddau7v3fav5he11nikeiutk6','1522145389','__flash|a:0:{}__id|i:11;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('p8n048kad3slns90g30pls5jl0','1522216071','__flash|a:0:{}');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('q1noua4o5j21vsri5pohnkgkq0','1520670741','__flash|a:0:{}__id|i:11;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('qsrnp07fk0ts4gj2utlnlic5c7','1520498879','__flash|a:0:{}__id|i:9;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('rb76l240nlrjmllgsokhp3i760','1521602995','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('rmhie8b71rv9mmanl8u1cdch74','1522216070','__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('rnppuivieefu5p47p4lmc6bon3','1520522861','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('s4ht5e48n1lpc2u7lr430tgju7','1521203475','__flash|a:0:{}__id|i:9;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('s8ngnmchrbagn4gglhdtcvsve1','1521711743','__flash|a:0:{}');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('sfksevegqlp4tc2fsm6ifdk1v0','1520478528','__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:13;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('st3tnorrlp95soc18b3q9cunk7','1520592812','__flash|a:0:{}__id|i:9;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('t2pisi67kv8nuu1vug9a5s5v83','1520562265','__flash|a:0:{}__id|i:1;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('tntv206svkkbcpvp3hipo2im91','1521019843','__flash|a:0:{}__id|i:11;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('trq4efhi8842c9hllt1gnjlkf2','1520425273','__flash|a:0:{}__id|i:9;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('u2vihe15ipop0i8kpsj3j8ljs6','1523411665','__flash|a:0:{}__id|s:1:\"1\";');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('vb7tmrdpl8rc6e2aeun114h4u7','1520825319','__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:11;');;;
INSERT INTO `yii2_session` (`id`,`expire`,`data`) VALUES
('vpbnkmr126ms0vgr8ae52osrn3','1521177473','__flash|a:0:{}__id|i:9;');;;
-- -------------------------------------------
-- TABLE DATA yii2_snapshot
-- -------------------------------------------
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3307','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3308','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3309','390/4天','290.000','1','2','0','1','马来西亚-30天贴纸签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3310','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3311','175/3天','160.000','1','1','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3312','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3313','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3314','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3315','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3316','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3317','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3318','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3319','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3320','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3321','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3322','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3323','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3324','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3325','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3326','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3327','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3328','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3329','358/3小时','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3330','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3331','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3332','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3333','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3334','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3335','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3336','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3337','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3338','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3339','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3340','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3341','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3342','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3343','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3344','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3345','520/3天','200.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3346','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3347','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3348','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3349','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3350','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3351','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3352','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3353','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3354','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3355','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3356','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3357','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3358','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3359','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3360','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3361','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3362','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3363','175/3天','160.000','1','1','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3364','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3365','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3366','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3367','248/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3368','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3369','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3370','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3371','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3372','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3373','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3374','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3375','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3376','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3377','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3378','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3379','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3380','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3381','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3382','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3383','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3384','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3385','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3386','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3387','248/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3388','248/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3389','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3390','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3391','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3392','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3393','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3394','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3395','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3396','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3397','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3398','300/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3399','520/3天','200.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3400','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3401','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3402','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3403','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3404','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3405','520/3天','200.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3406','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3407','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3408','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3409','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3410','940/7天','550.000','1','1','0','1','菲律宾三个月多次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3411','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3412','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3413','248/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3414','175/3天','160.000','1','1','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3415','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3416','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3417','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3418','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3419','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3420','248/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3421','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3422','248/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3423','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3424','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3425','248/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3426','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3427','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3428','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3429','248/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3430','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3431','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3432','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3433','248/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3434','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3435','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3436','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3437','248/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3438','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3439','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3440','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3441','248/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3442','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3443','268/5天','268.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3444','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3445','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3446','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3447','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3448','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3449','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3450','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3451','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3452','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3453','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3454','248/3小时','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3455','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3456','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3457','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3458','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3459','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3460','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3461','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3462','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3463','1500/5天','1000.000','2','2','39364','1','菲律宾半年多次签证','1.000','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4015','220/4-5工','200.000','3','1','39352','1','菲律宾59天单次签证','1.000','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3469','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3470','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3497','248/3小时','160.000','1','3','39369','1','马来西亚-15天ENTRI','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3496','218/10天','200.000','1','1','39342','1','菲律宾59天单次签证','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3495','1440/7天','1000.000','1','1','39361','1','菲律宾半年多次签证','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3475','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3476','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3477','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3478','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3479','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3480','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3494','198/1天','160.000','1','2','39368','1','马来西亚-15天ENTRI','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4016','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4017','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3491','299/1天','242.000','1','2','39389','1','柬埔寨电子签','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4049','248/8天','200.000','1','1','39343','1','菲律宾59天单次签证','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3492','390/4天','290.000','1','2','39384','1','马来西亚-30天贴纸签','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3488','358/3小时','242.000','1','3','39390','1','柬埔寨电子签','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3498','175/3天','160.000','1','1','39367','1','马来西亚-15天ENTRI','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3499','320/6天','290.000','1','1','39383','1','马来西亚-30天贴纸签','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3500','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3501','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3502','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3503','510/3天','200.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3504','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3505','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3506','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3507','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3508','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3509','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3510','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3511','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3512','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3513','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3514','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3515','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3516','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3517','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3518','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3519','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3520','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3521','260/5天','200.000','2','1','0','1','0','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3522','510/3天','401.000','2','2','0','1','0','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3523','260/5天','200.000','2','1','0','1','0','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3524','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3525','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3526','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3527','510/3天','401.000','2','2','0','1','0','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3528','260/5天','200.000','2','1','0','1','0','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3529','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3530','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3531','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3532','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3533','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3534','510/3天','200.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3535','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3536','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3537','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3538','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3539','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3540','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3541','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3542','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3543','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3544','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3545','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3546','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3547','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3548','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3549','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3550','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3551','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3552','260/5天','200.000','2','1','0','1','0','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3553','510/3天','401.000','2','2','0','1','0','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3554','260/5天','200.000','2','1','0','1','0','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3555','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3556','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3557','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3558','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3559','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3560','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3561','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3562','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3563','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3564','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3565','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3566','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3567','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3568','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3569','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证 ','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3570','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3571','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3572','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3573','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3574','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3575','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3576','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3577','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3578','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3579','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3580','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3581','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3582','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3583','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3584','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3585','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3586','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3587','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3588','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3589','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3590','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3591','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3592','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3593','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3594','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3595','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3596','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3597','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3598','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3599','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3600','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3601','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3602','180/1天','160.000','3','1','0','1','马来西亚-15天ENTRI','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3603','180/1天','160.000','3','1','0','1','马来西亚-15天ENTRI','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3604','180/1天','160.000','3','1','0','1','马来西亚-15天ENTRI','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3605','180/1天','160.000','3','1','0','1','马来西亚-15天ENTRI','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3606','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3607','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3608','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3609','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3610','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3611','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3612','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3613','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3614','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3615','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3616','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3617','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3618','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证 ','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3619','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3620','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3621','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3622','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3623','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3624','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3625','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3626','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3627','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3628','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3629','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3630','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3631','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3632','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3633','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3634','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3635','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3636','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3637','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3638','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3639','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3640','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3641','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3642','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3643','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3644','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3645','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3646','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3647','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3648','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3649','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3650','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3651','180/1天','160.000','3','1','0','1','马来西亚-15天ENTRI','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3652','180/1天','160.000','3','1','0','1','马来西亚-15天ENTRI','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3653','180/1天','160.000','3','1','0','1','马来西亚-15天ENTRI','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3654','180/1天','160.000','3','1','0','1','马来西亚-15天ENTRI','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3655','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3656','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3657','1100/5-6工','1000.000','3','1','0','1','菲律宾半年多次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3658','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3659','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3660','425/2-3工','200.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3661','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3662','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3663','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3664','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3665','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3666','425/2-3工','200.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3667','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3668','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3669','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3670','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3671','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3672','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3673','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3674','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3675','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3676','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3677','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3678','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3679','248/8天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3680','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3681','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3682','175/3天','160.000','1','1','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3683','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3684','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3685','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3686','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3687','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3688','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3689','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3690','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3691','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3692','175/3天','160.000','1','1','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3693','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3694','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3695','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3696','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3697','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3698','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3699','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3700','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3701','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3702','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3703','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3704','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3705','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3706','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3707','358/3小时','242.000','1','3','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3708','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3709','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3710','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3711','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3712','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3713','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3714','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3715','175/3天','160.000','1','1','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3716','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3717','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3718','175/3天','160.000','1','1','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3719','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3720','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3721','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3722','268/4天','242.000','1','1','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3723','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3724','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3725','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3726','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3727','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3728','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3729','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3730','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3731','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3732','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3733','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3734','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3735','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3736','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3737','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3738','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3739','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3740','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3741','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3742','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3743','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3744','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3745','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3746','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3747','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3748','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3749','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3750','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3751','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3752','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3753','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3754','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3755','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3756','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3757','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3758','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3759','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3760','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3761','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3762','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3763','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3764','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3765','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3766','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3767','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3768','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3769','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3770','218/10天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3771','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3772','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3773','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3774','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3775','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3776','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3777','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3778','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3779','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3780','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3781','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3782','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4055','1700/1工','1500.000','2','1','39405','1','菲律宾落地签','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3784','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证 ','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3785','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3786','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3787','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3788','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3789','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3790','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3791','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3792','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3793','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3794','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3795','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3796','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3797','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3798','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3799','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3800','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3801','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3802','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3803','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3804','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3805','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3806','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3807','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3808','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3809','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3810','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3811','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3812','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3813','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3814','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3815','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3816','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3817','180/1天','160.000','3','1','0','1','马来西亚-15天ENTRI','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4054','1800/1工','1500.000','1','3','39404','1','菲律宾落地签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3819','180/1天','160.000','3','1','0','1','马来西亚-15天ENTRI','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3820','180/1天','160.000','3','1','0','1','马来西亚-15天ENTRI','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3821','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3822','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3823','1100/5-6工','1000.000','3','1','0','1','菲律宾半年多次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3824','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3825','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3826','425/2-3工','200.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3827','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3828','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3829','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3830','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3831','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3832','425/2-3工','200.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3833','425/2-3工','401.000','3','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3834','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3835','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3836','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3837','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3838','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3839','220/4-5工','200.000','3','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3840','390/4天','290.000','1','2','0','1','马来西亚-30天贴纸签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3841','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3842','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3843','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3844','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3845','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3846','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3847','175/3天','160.000','1','1','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3848','390/4天','290.000','1','2','0','1','马来西亚-30天贴纸签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3849','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3850','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3851','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3852','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3853','1440/7天','1000.000','1','1','0','1','菲律宾半年多次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3854','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3855','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3856','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4051','310/6天','290.000','2','1','39385','1','马来西亚-30天贴纸签','1.000','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3858','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3859','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3860','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3861','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3862','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3863','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3864','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3865','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3866','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3867','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3868','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3869','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3870','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3871','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3872','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3873','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3874','218/10天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3875','248/3小时','160.000','1','3','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3876','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3877','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3878','175/3天','160.000','1','1','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3879','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3880','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3881','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3882','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3883','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3884','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3885','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3886','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3887','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3888','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3889','175/3天','160.000','1','1','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3890','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3891','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3892','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3893','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3894','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3895','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3896','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3897','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3898','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3899','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3900','358/3小时','242.000','1','3','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3901','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3902','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3903','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3904','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3905','358/3小时','242.000','1','3','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3906','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3907','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3908','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3909','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3910','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3911','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3912','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3913','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3914','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3915','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3916','299/1天','242.000','1','2','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3917','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3918','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3919','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3920','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3921','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3922','175/3天','160.000','1','1','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3923','198/1天','160.000','1','2','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3924','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3925','175/3天','160.000','1','1','0','1','马来西亚-15天ENTRI','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3926','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3927','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3928','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3929','268/4天','242.000','1','1','0','1','柬埔寨电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3930','520/3天','401.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3931','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3932','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3933','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3934','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3935','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3936','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3937','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3938','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3939','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3940','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3941','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3942','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3943','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3944','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3945','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3946','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3947','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3948','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3949','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3950','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3951','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3952','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3953','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3954','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3955','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3956','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3957','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3958','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3959','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3960','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3961','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3962','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3963','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3964','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3965','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3966','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3967','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3968','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3969','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3970','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3971','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3972','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3973','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3974','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3975','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3976','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3977','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3978','218/10天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3979','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3980','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3981','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3982','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3983','510/3天','200.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3984','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3985','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3986','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3987','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3988','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3989','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3990','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3991','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3992','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3993','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3994','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3995','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3996','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3997','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3998','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('3999','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4000','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4001','260/5天','200.000','2','1','0','1','0','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4002','510/3天','401.000','2','2','0','1','0','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4003','260/5天','200.000','2','1','0','1','0','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4004','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4005','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4006','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4007','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4008','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4009','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4010','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4011','248/8天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4012','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4013','268/4天','242.000','1','1','39388','1','柬埔寨电子签','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4014','180/1天','160.000','3','1','39373','1','马来西亚-15天ENTRI','1.000','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4018','218/10天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4019','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4020','320/6天','290.000','1','1','0','1','马来贴纸30天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4021','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4022','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4023','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4024','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4025','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4026','358/3小时','242.000','1','2','0','1','柬埔寨30天单次电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4027','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4028','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4029','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4030','248/8天','160.000','1','2','0','1','马来15天单次电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4031','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4032','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4033','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4034','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4035','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4036','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4037','520/3天','401.000','1','2','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4038','268/5天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4039','248/8天','200.000','1','1','0','1','菲律宾59天单次签证','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4040','198/1天','160.000','1','2','0','1','马来15天单次电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4041','198/1天','160.000','1','2','0','1','马来15天单次电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4042','299/1天','242.000','1','2','0','1','柬埔寨30天单次电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4043','299/1天','242.000','1','2','0','1','柬埔寨30天单次电子签','0.965','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4044','510/3天','401.000','2','2','39350','1','菲律宾59天单次签证','1.000','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4045','425/2-3工','401.000','3','2','39353','1','菲律宾59天单次签证','1.000','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4053','268/5天','200.000','1','1','39344','1','菲律宾59天单次签证','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4048','260/5天','200.000','2','1','39348','1','菲律宾59天单次签证','1.000','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4052','520/3天','401.000','1','2','39345','1','菲律宾59天单次签证','0.965','0');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4056','1600/1工','1500.000','3','1','39406','1','菲律宾落地签','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4057','510/3天','220.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4058','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4059','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4060','260/5天','220.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4061','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4062','510/3天','420.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4063','510/3天','420.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4064','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4065','510/3天','420.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4066','510/3天','420.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4067','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4068','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4069','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4070','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4071','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4072','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4073','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4074','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4075','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4076','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4077','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4078','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4079','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4080','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4081','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4082','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4083','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4084','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4085','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4086','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4087','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4088','310/6天','290.000','2','1','0','1','马来西亚-30天贴纸签','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4089','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4090','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4091','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4092','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4093','510/3天','420.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4094','510/3天','420.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4095','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4096','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4097','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4098','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4099','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4100','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4101','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4102','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4103','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4104','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4105','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4106','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4107','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4108','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4109','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4110','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4111','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4112','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4113','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4114','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4115','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4116','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4117','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4118','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4119','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4120','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4121','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4122','510/3天','200.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4123','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4124','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4125','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4126','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4127','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4128','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4129','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4130','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4131','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4132','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4133','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4134','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4135','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4136','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4137','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4138','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4139','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4140','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4141','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4142','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4143','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4144','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4145','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4146','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4147','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4148','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4149','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4150','510/3天','200.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4151','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4152','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4153','510/3天','220.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4154','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4155','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4156','260/5天','220.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4157','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4158','510/3天','420.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4159','510/3天','420.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4160','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4161','510/3天','420.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4162','510/3天','420.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4163','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4164','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4165','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4166','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4167','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4168','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4169','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4170','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4171','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4172','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4173','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4174','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4175','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4176','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4177','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4178','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4179','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4180','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4181','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4182','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4183','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4184','310/6天','290.000','2','1','0','1','马来西亚-30天贴纸签','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4185','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4186','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4187','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4188','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4189','510/3天','420.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4190','510/3天','420.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4191','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4192','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4193','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4194','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4195','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4196','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4197','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4198','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4199','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4200','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4201','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4202','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4203','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4204','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4205','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4206','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4207','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4208','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4209','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4210','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4211','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4212','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4213','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4214','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4215','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4216','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4217','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4218','510/3天','200.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4219','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4220','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4221','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4222','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4223','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4224','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4225','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4226','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4227','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4228','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4229','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4230','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4231','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4232','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4233','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4234','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4235','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4236','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4237','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4238','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4239','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4240','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4241','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4242','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4243','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4244','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4245','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4246','510/3天','200.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4247','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4248','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4249','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4250','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4251','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4252','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4253','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4254','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4255','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4256','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4257','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4258','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4259','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4260','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4261','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4262','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4263','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4264','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4265','510/3天','200.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4266','260/5天','200.000','2','1','0','1','菲律宾59天单次签证','1.000','1');;;
INSERT INTO `yii2_snapshot` (`id`,`combo_name`,`combo_cost`,`combo_classify`,`combo_type`,`snap_combo_id`,`is_valid`,`combo_product`,`combo_charge`,`quote`) VALUES
('4267','510/3天','401.000','2','2','0','1','菲律宾59天单次签证','1.000','1');;;
-- -------------------------------------------
-- TABLE DATA yii2_test
-- -------------------------------------------
INSERT INTO `yii2_test` (`id`,`test`) VALUES
('1','aa');;;
-- -------------------------------------------
-- TABLE DATA yii2_transator
-- -------------------------------------------
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3142','未知名','1','','','','0','1519460709','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3168','宿务入境','1','','','','0','1519460709','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3182','马尼拉入境','1','','','','0','1519460710','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3218','万成','1','','','','0','1519460711','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3243','马尼拉','1','','','','0','1519460711','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3267','陈芸','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3268','李响','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3270','洪溯','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3271','黄锦洲','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3272','林宣祯','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3273','林智强','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3274','张慧琼','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3275','林以昕','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3276','陈玉琴','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3277','杨玉洁','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3278','陈美娇','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3279','潘灿强','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3280','陈伟锋','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3281','韩倩','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3282','颜晓玲','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3283','李蔚然','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3284','林若晴','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3285','林宗英','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3286','黄文宽','1','','','','0','1519460712','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3308','张东旭','1','','','','0','1519460713','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3309','牛芳','1','','','','0','1519460713','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3403','戴雅瑜','1','','','','0','1519460716','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3409','范茂杰','1','','','','0','1519891071','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3410','程妍','1','','','','0','1519891071','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3411','李娟','1','','','','0','1519918410','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3412','胡金亮','1','','','','0','1519968877','0','父亲名字：胡金根，
母亲：成水凤，
老婆：李燕  
女儿：胡至芯 10岁 
儿子：胡至远 10岁
电话18170085682
入境城市：马尼拉
');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3415','刘志明','1','','','','0','1520132444','0','父亲： XXX
母亲：XXXX
入境口岸XXX');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3416','陈章明','1','','','','0','1520132462','0','父亲：母亲');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3417','邬琴琴','1','','','','0','1520132481','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3418','余丽香','1','','','','0','1520132488','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3426','叶晓媚','1','','','','0','1520134837','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3427','齐伟强','1','','','','0','1520134837','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3428','陈泉英','1','','','','0','1520134837','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3433','王志彬','1','','','','0','1520154170','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3434','粟虎','1','','','','0','1520219410','0','办理人名字：粟虎
电话：15082874847
地址：
父亲名字：粟华兴
母亲名字： 李雪花
配偶名字：无
子女名字及年龄：无
准备在菲律宾哪个城市入境：马尼拉');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3435','朱倍斯 ','1','','','','0','1520220419','0','马尼拉入境');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3436','吴字洲','1','','','','0','1520221162','0','马尼拉');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3437','任高超','1','','','','0','1520224110','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3438','何滨','1','','','','0','1520224127','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3440','郑敏君','1','','','','0','1520227014','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3441','王城','1','','','','0','1520227636','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3442','杨孝峰','1','','','','0','1520227736','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3443','周云卯','1','','','','0','1520227826','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3444','吴永良','1','','','','0','1520228447','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3445','邢正球 ','1','','','','0','1520230200','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3446','刘景东 ','1','','','','0','1520230209','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3447','赵大友 ','1','','','','0','1520230217','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3448','顾小冬 ','1','','','','0','1520230225','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3449','陆建兵','1','','','','0','1520230232','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3451','龚定勋','1','','','','0','1520230724','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3452','阮芸菲','1','','','','0','1520230736','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3453','潘昱全 ','1','','','','0','1520230745','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3454','卞睿','1','','','','0','1520231700','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3457','苏阳','1','','','','0','1520232532','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3458','朱英顺','1','','','','0','1520232646','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3459','汪劲松','1','','','','0','1520232763','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3460','李少闯','1','','','','0','1520232910','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3461','华烨','1','','','','0','1520233353','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3462','曲丹','1','','','','0','1520233508','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3463','曹晓阳','1','','','','0','1520234110','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3465','唐棠','1','','','','0','1520234341','0','办理人名字：唐棠
电话：18628035350
地址：四川省成都市武侯区火车南站东路10号三度空间一栋一单元
母亲：周述香
父亲：去世
配偶名字：郭川
子女名字及年龄：暂无子女
准备在哪个城市入境：宿务（马克坦机场）   代冲洗');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3466','曾珍','1','','','','0','1520234351','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3468','陈凇','1','','','','0','1520234383','0','办理人名字：陈凇
电话：13056677889
地址：成都市锦江区大田坎街162号蜀都花园4栋1703
母亲：严小兵
父亲：陈金强
配偶名字：
李斌
子女名字及年龄：暂无子女
准备在哪个城市入境：宿务（马克坦机场）    代冲洗   ');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3469','胡燕','1','','','','0','1520234388','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3470','马培封','1','','','','0','1520234891','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3472','刘逸','1','','','','0','1520235056','0','办理人名字：刘逸
电话：18621892221
地址：上海浦东南路4250-21-202
父亲名字：刘占奎
母亲名字： 王丽华
配偶名字：（未婚无需提供）戴雪梅
子女名字及年龄：刘卿云
准备在菲律宾哪个城市入境：马尼拉');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3473','陈娇雅','1','','','','0','1520235201','0','宿务入境');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3474','顾婷婷','1','','','','0','1520235291','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3475','金梦','1','','','','0','1520235366','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3476','郑恩红 ','1','','','','0','1520235457','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3477','易敏 ','1','','','','0','1520235466','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3478','郑恩利 ','1','','','','0','1520235472','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3479','丁花宝 ','1','','','','0','1520235480','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3480','郑恩胜  ','1','','','','0','1520235486','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3481','马素洁','1','','','','0','1520235490','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3482','林家志 ','1','','','','0','1520235802','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3483','彭受海 ','1','','','','0','1520235807','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3484','何家裕','1','','','','0','1520235811','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3486','冯晨','1','','','','0','1520236063','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3487','姬圆圆','1','','','','0','1520236075','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3488','赖嘉鸿','1','','','','0','1520236209','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3489','肖累','1','','','','0','1520237337','0','马尼拉入境');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3490','刘军','1','','','','0','1520237475','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3491','刘冬鹏 ','1','','','','0','1520237611','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3496','吴荣强','1','','','','0','1520237866','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3497','朱敏','1','','','','0','1520237872','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3498','庞燕','1','','','','0','1520237937','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3499','王秀梅','1','','','','0','1520238627','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3500','叶书鸿','1','','','','0','1520238705','0','马尼拉入境');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3501','李伟佳','1','','','','0','1520239099','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3502','陈芷健 ','1','','','','0','1520239259','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3503','刘庆玲 ','1','','','','0','1520239480','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3506','张恒嘉','1','','','','0','1520239620','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3507','吴婷','1','','','','0','1520240395','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3508','易聪','1','','','','0','1520240821','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3509','刘波','1','','','','0','1520308391','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3510','张坤','1','','','','0','1520308561','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3512','范玲 ','1','','','','0','1520312523','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3513','张屹','1','','','','0','1520312528','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3514','武晓权','1','','','','0','1520313156','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3516','冯宇霆 ','1','','','','0','1520313170','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3517','武占友 ','1','','','','0','1520313179','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3518','李瑞英 ','1','','','','0','1520313185','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3519','冯振声 ','1','','','','0','1520313189','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3526','王雅丽','1','','','','0','1520315000','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3527','韦杰','1','','','','0','1520315005','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3528','郭楠','1','','','','0','1520315168','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3529','杨舒宇','1','','','','0','1520315532','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3530','杨泽昇 ','1','','','','0','1520315537','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3531','林乃坤 ','1','','','','0','1520320788','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3532','陈彩云','1','','','','0','1520320794','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3533','林镭','1','','','','0','1520321144','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3534','陈楷','1','','','','0','1520321240','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3535','章义海','1','','','','0','1520321345','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3536','程丽莉','1','','','','0','1520321541','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3537','孙建文','1','','','','0','1520321547','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3538','邓嘉旖','1','','','','0','1520321983','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3539','李棉','1','','','','0','1520322121','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3540','张鑫山 ','1','','','','0','1520322442','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3541','龙泳','1','','','','0','1520322849','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3542','王文静','1','','','','0','1520323395','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3543','罗林','1','','','','0','1520323652','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3544','谭晓蓝 ','1','','','','0','1520324097','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3545','谭晓莹 ','1','','','','0','1520324103','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3546','周嘉欣','1','','','','0','1520324106','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3547','陈振煌','1','','','','0','1520324192','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3548','马莹','1','','','','0','1520325253','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3549','张妍薇','1','','','','0','1520325330','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3550','李彬 ','1','','','','0','1520327917','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3602','刘洪涛','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3603','覃贵亮','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3604','高明龙','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3605','朱乃露','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3606','李国祝','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3607','马东海','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3608','黄林杰','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3609','刘继伟','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3610','马伟占','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3611','吴靖','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3612','杨磊飞','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3613','钟才英','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3614','施肖肖','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3615','邵秀玲','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3616','蔡文哲','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3617','宋金水','1','','','','0','1520352829','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3618','邓承猛','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3619','李鸿鹏','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3620','谢秋文','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3621','银显儒','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3622','张玲','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3623','姜丽娟','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3624','史进康','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3625','胡军','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3626','熊鹰','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3627','欧巧英','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3628','李菲','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3629','许敏','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3630','许泽安','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3631','龚小芳','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3632','封先和','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3633','吴长寿','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3634','董超','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3635','钟华健','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3636','廖仰庆','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3637','李小君','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3638','苏伟怡','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3639','纪孟伟','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3640','刘儒强','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3641','曾宪彬','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3642','吴仕林','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3643','曾伟','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3644','张孝文','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3645','汪辉','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3646','徐刚','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3647','吴艳艳','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3648','曾长鸣','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3649','周艳','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3650','陈敏','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3651','简炼','1','','','','0','1520352961','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3736','余腾江','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3737','李珍','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3738','胡亮','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3739','黄亚弟','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3740','涂海华','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3741','袁刚','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3742','许世衍','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3743','刘凯雄','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3744','芦学成','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3745','丁臣民','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3746','张剑伟','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3747','王伟强','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3748','杨敏','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3749','李政毅','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3750','张海勇','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3751','沙青清','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3752','杨慎敏','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3753','左志玥','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3754','左慧洲','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3755','王文君','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3756','乐毅','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3757','韦成','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3758','苏鸿婷','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3759','闫佩楠','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3760','陈亚强','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3761','王伟海','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3762','张伟榕','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3763','张金望','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3764','文岩','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3765','张倩','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3766','刘锦江','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3767','王培福','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3768','廖惟良','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3769','冯巧芳','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3770','张波蓉','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3771','詹敏辉','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3772','林强','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3773','谢明洪','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3774','吴强','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3775','刘洲','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3776','张丽','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3777','高小虎','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3778','徐骏杰','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3779','郑艺伟','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3780','林清火','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3781','林艺蕊','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3782','余艺福','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3783','李幼芬','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3784','黄昌治','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3785','陈建兴','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3786','吴先侯','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3787','詹有成','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3788','洪福峰','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3789','李伟巍','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3790','许小静','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3791','卢英君','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3792','游西龄','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3793','刘富强','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3794','黄超','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3795','干玲云','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3796','陈云波','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3797','吴艳玲','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3798','艾晶晶','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3799','任秀玲','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3800','姚雪丽','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3801','肖琴','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3802','李艳梅','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3803','苏钰龙','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3804','周海燕','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3805','何莉','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3806','冯丽','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3807','何燕','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3808','敬爱','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3809','汪小菊','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3810','杨素','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3811','祝小英','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3812','杨剑金','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3813','徐毅','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3814','潘安','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3815','潘冰清','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3816','洪国富','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3817','王耀坤','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3818','孟彦婷','1','','','','0','1520353972','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3819','陈柏然','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3820','陈德宽','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3821','周翠英','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3822','王兰','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3823','陈伟','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3824','周御杰','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3825','周圣','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3826','唐炜','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3827','尹俊然','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3828','潘毅鹏','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3829','章常勋','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3830','张国泉','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3831','汤小贺','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3832','吴敏','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3833','黄延加','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3834','王建鹏','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3835','柴学军','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3836','朱京坤','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3837','杨昊楠','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3838','黄育进','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3839','李明忠','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3840','张亚萍','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3841','罗富生','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3842','林清源','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3843','林江辉','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3844','康国辉','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3845','程建鹏','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3846','徐江辉','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3847','张林峰','1','','','','0','1520355176','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3848','徐晓彪','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3849','徐梅','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3850','许小华','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3851','熊辉','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3852','何燕清','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3853','许剑华','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3854','金科宇','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3855','李雪娟','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3856','林紫东、麦显宗','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3857','刘丽水','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3858','刘聪杰','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3859','郑楷阳','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3860','粘坤坤','1','','','','0','1520355855','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3861','耿楚晨','1','','','','0','1520356748','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3862','谢雅君','1','','','','0','1520356755','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3863','董文秀','1','','','','0','1520358163','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3864','王丽贤','1','','','','0','1520358163','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3865','冼丽彦','1','','','','0','1520358163','0','办理人名字：冼丽彦
电话：17360135859
地址：成都市成华区湖秀二路8号北湖国际城1栋
母亲：历昌容
父亲：冼玮
配偶名字：
无
子女名字及年龄：无
准备在哪个城市入境：宿务（马克坦机场）');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3866','石正友','1','','','','0','1520358163','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3867','姚文芳','1','','','','0','1520358163','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3868','孙晏聆','1','','','','0','1520358163','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3869','饶英平','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3870','林家声','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3871','苏燕玲','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3872','叶颖怡','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3873','戴春雷','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3874','方典','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3875','方林','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3876','王琴','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3877','李宁','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3878','赵云亮','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3879','陈碧云','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3880','华志刚','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3881','鲁洵','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3882','龚章东','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3883','张进','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3884','吕桂冰','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3885','陈俊斌','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3886','叶杰','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3887','段武军','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3888','张宁','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3889','孙佳斯','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3890','李瑶','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3891','汤赟','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3892','傅幼飞','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3893','王释轩','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3894','冯博宇','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3895','张睿','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3896','熊林全','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3897','廖保城','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3898','王迪','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3899','文志祥','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3900','胡纤','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3901','苏柏','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3902','陶武','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3903','商晓','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3904','张静宇','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3905','徐菀聆','1','','','','0','1520358164','0','办理人名字：徐菀聆
电话：18684993301
地址：湖南省长沙市开福区四方坪四方小区A4栋1506 室
父亲名字：徐运文。             母亲名字： 李美英
未婚
准备在菲律宾哪个城市入境：宿务');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3906','钟浩坤、陈伟艺、陈洁文','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3907','鲁菲','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3908','谢菊花','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3909','罗小霞','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3910','张玉蓉','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3911','王蕊','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3912','覃争柳','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3913','曾献渊','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3914','龙水彬','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3915','杨晨','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3916','霍志康','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3917','郭佩湘','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3918','廖婷婷','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3919','张钦斌','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3920','胡楠','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3921','舒红','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3922','谢承明','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3923','舒潇','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3924','余叮咛','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3925','许春霞、陈瀚曦、陈馨逸、陈跃齐','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3926','陶亭','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3927','李晶','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3928','柴紫燕','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3929','乔羽','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3930','朱永强','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3931','熊伟','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3932','李媛','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3933','戴国华','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3934','杨贵岚','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3935','黄安会','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3936','游米育','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3937','张国威','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3938','吴迪','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3939','王缨萍','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3940','张健、','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3941','康小壮、王首益、李磊','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3942','邱接敏','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3943','黄明杨','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3944','段皓然','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3945','兰斌','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3946','沈莹','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3947','曹洁','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3948','邹婉盈','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3949','周亚军','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3950','苏柳斌','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3951','吴鸿鸣','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3952','洪烨华','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3953','贾贝贝','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3954','吴福毅','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3955','谢元元','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3956','吴梓汐','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3957','詹新权','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3958','克拉克','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3959','曲文超','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3960','冯倩','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3961','王敏琪','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3962','蔡晓佳','1','','','','0','1520358164','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3963','代欣鹭','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3964','邱朝旭','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3965','卿婷','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3966','史美鑫','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3967','李泽川','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3968','靳永鑫','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3969','曾尉兰','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3970','王征','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3971','董月华','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3972','李容','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3973','付博','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3974','徐一然','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3975','冉帅','1','','','','0','1520358165','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3976','黄安骏','1','','','','0','1520358556','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3977','杨永华','1','','','','0','1520358556','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3978','余文强','1','','','','0','1520358556','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3979','吕雪梅','1','','','','0','1520358556','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3981','王波','1','','','','0','1520358556','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3982','周美文、刘丽、周瑞麒、周瑞欣','1','','','','0','1520358556','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3983','王哲','1','','','','0','1520358556','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3984','苏思淼','1','','','','0','1520358556','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3985','周谷阳','1','','','','0','1520358884','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3986','仇卫民','1','','','','0','1520358959','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3987','茆海丰','1','','','','0','1520358966','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3988','刘文翠','1','','','','0','1520387035','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3989','林财祥','1','','','','0','1520389564','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('3990','何涛','1','','','','0','1520389766','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4006','冯军','1','','','','0','1520390378','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4007','陆薇、吴桐','1','','','','0','1520390378','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4008','肖文君','1','','','','0','1520390378','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4009','刘英','1','','','','0','1520390378','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4011','汤小飞','1','','','','0','1520390378','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4015','何雨宸','1','','','','0','1520390378','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4016','戴小燕','1','','','','0','1520390378','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4017','孔令涛','1','','','','0','1520390378','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4018','傅洁','1','','','','0','1520390378','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4019','许小勇','1','','','','0','1520390447','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4020','董洪山','1','','','','0','1520390471','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4021','文艳婷','1','','','','0','1520390471','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4022','何幽','1','','','','0','1520390471','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4023','陈晓杏','1','','','','0','1520390471','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4024','赵小燕','1','','','','0','1520390471','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4025','封涛','1','','','','0','1520390499','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4026','倪志鸿','1','','','','0','1520391344','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4027','刘威余','1','','','','0','1520393023','0','办理人名字：刘威余
电话：13619688989
地址：云南省昆明市盘龙区北京路延长线华润中央公园小区1幢2单元1701室
父亲名字：刘和当
母亲名字：颜坤萍 
配偶名字：未婚
子女名字及年龄：无
准备在菲律宾哪个城市入境：宿务');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4028','王靖熙','1','','','','0','1520393200','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4029','孔令新','1','','','','0','1520393266','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4030','赵碧贞','1','','','','0','1520393644','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4031',' 蔡彩英 ','1','','','','0','1520393652','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4032','陈丽琼  ','1','','','','0','1520393661','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4033','郭振佳','1','','','','0','1520393665','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4034','万辉瑶 ','1','','','','0','1520394107','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4035','高滢','1','','','','0','1520394114','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4036','万元栋','1','','','','0','1520394120','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4037','姚灵丽','1','','','','0','1520394216','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4038','郭矩','1','','','','0','1520394604','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4041','韦紫薇','1','','','','0','1520397161','0','办理人名字：韦紫薇
电话：18978016515
地址：广西柳州市柳南区西环路15号7-2-501
父亲名字：韦海洲
母亲名字： 韦碧桂
配偶名字：（未婚无需提供）
子女名字及年龄：
准备在菲律宾哪个城市入境：马尼拉
');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4042','王凯奇','1','','','','0','1520399162','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4043','赵刚、罗广芬','1','','','','0','1520402058','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4044','王仲秋','1','','','','0','1520402411','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4045','李根木','1','','','','0','1520402418','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4047','程龙','1','','','','0','1520404736','0','入境马尼拉资料呆编');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4048','郑江雄','1','','','','0','1520405147','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4049','王鑫','1','','','','0','1520405265','0','办理人名字：王鑫
电话：17688504149
地址：广西宜州市北牙瑶族乡平里村牛怀屯1-1号
父亲名字：王任贵
母亲名字：梁凤秋
准备在菲律宾哪个城市入境：马尼拉');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4050','许晓东','1','','','','0','1520405456','0','马尼拉入境');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4051','傅茂军','1','','','','0','1520405565','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4052','姚华安 ','1','','','','0','1520405819','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4053','陈锡琴','1','','','','0','1520407338','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4054',' 田伟','1','','','','0','1520409003','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4055','张燕芯','1','','','','0','1520409015','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4056','张信琪','1','','','','0','1520409022','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4057','殷利祯','1','','','','0','1520409028','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4058','刘思敏','1','','','','0','1520409414','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4060','李亚','1','','','','0','1520410276','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4061','薛雷','1','','','','0','1520410288','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4062','叶茂','1','','','','0','1520410526','0','办理人名字：叶茂
电话：18109089009
地址：成都市青羊区成飞大道199号
母亲：张毅
父亲：叶存杰
配偶名字：叶贻恒
子女名字及年龄：无
准备在哪个城市入境：宿务（马克坦机场）');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4063','黄凯文','1','','','','0','1520412856','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4064','吴文龙','1','','','','0','1520414568','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4065','周露颖','1','','','','0','1520414942','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4066','彭云','1','','','','0','1520415233','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4067','何伟鹏','1','','','','0','1520415543','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4068','昌盛','1','','','','0','1520437567','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4069','刘丽妹','1','','','','0','1520437721','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4070','刘良星','1','','','','0','1520437727','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4071','黄巧芳','1','','','','0','1520437735','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4072','李灵坤','1','','','','0','1520437741','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4073','李泉木','1','','','','0','1520437748','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4074','胡祖棚','1','','','','0','1520438039','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4075','张宝','1','','','','0','1520438047','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4076','赖世聪','1','','','','0','1520438209','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4077','杨清泉','1','','','','0','1520438215','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4078','许青','1','','','','0','1520438400','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4079','罗宇薇','1','','','','0','1520438405','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4080','钟云华','1','','','','0','1520471422','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4081','潘春雨','1','','','','0','1520471500','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4082',' 潘立 ','1','','','','0','1520471506','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4083','温秋莹','1','','','','0','1520471511','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4084','于燕萍','1','','','','0','1520471643','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4085','郭子墨','1','','','','0','1520471647','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4086','钟翼 ','1','','','','0','1520478475','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4087','袁林','1','','','','0','1520479472','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4088','韩笑','1','','','','0','1520481437','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4089','阳思圹','1','','江西省宜春市万载县康乐镇城北农贸市场第四中学(旁)阳思圹13026266886','','0','1520481642','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4090',' 付颂 ','1','','','','0','1520481932','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4091','胡聃 ','1','','','','0','1520482110','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4092','李茜','1','','','','0','1520482420','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4093','徐鼎黄 ','1','','','','0','1520482903','0','马尼拉入境');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4094','卢莲敏    ','1','','','','0','1520483226','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4095','柯乙','1','','','','0','1520483230','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4096','张妍婕  ','1','','','','0','1520483937','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4097','纪晓','1','','','','0','1520483941','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4098','曾祥','1','','','','0','1520484170','0','办理人名字：曾祥
电话：17666159491
地址：湖南益阳南县三仙湖镇中奇村第五组
父亲名字：曾国旗
母亲名字： 祝智辉
配偶名字：（未婚无需提供）
子女名字及年龄：
准备在菲律宾哪个城市入境：菲律宾马尼拉');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4099','郑荣兰','1','','','','0','1520484935','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4100','区锐斌','1','','','','0','1520485463','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4101','罗振辉','1','','','','0','1520486239','0','办理人名字：罗振辉
电话：13825206678
地址：深圳市龙华民治大道碧水龙庭4栋3单元8A
父亲名字：罗祝根
母亲名字： 
配偶名字：钟朝霖
子女名字及年龄：罗元泽（13岁）罗晟庭（7岁）
准备在菲律宾哪个城市入境：马尼拉');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4102','李海韵','1','','','','0','1520489402','0','马尼拉入境');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4103','王俊','1','','','','0','1520490318','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4104','严仁宏','1','','','','0','1520492224','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4105','韩坤','1','','','','0','1520492894','0','办理人名字：韩坤。电话13776615670。地址：江苏省南京市江宁区淳化街道新亭路9号市政天元城小区碧水座5憧204室  父亲名字：韩文庆。母亲名字：李小梅  马尼拉入境');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4106','杨振辉','1','','','','0','1520494107','0','办理人名字：杨振辉
电话：15880742222
地址：福建省晋江市陈埭镇南下美村霞光街71号
父亲名字：杨思斌
母亲名字： 彭月累
配偶名字：（未婚无需提供）
子女名字及年龄：
准备在菲律宾哪个城市入境：马尼拉');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4107','柯紫阳','1','','','','0','1520494125','0','马尼拉入境');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4108',' 简思渝  ','1','','','','0','1520494903','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4109','李坤','1','','','','0','1520494980','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4110','宋健','1','','','','0','1520496477','0','马尼拉入境');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4111','施洪发','1','','','','0','1520497284','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4112','刘阳  ','1','','','','0','1520498836','0','办理人名字：刘阳

电话：13500880341

地址：吉林省长春市汽开区东风大街与和谐大路交汇3111号多恩居住岛一期7栋

父亲名字：刘东风

母亲名字： 方晶
入境城市：马尼拉');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4113','李娥','1','','','','0','1520499068','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4114','陈喆人','1','','','','0','1520501174','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4115','沈瑜','1','','','','0','1520501183','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4116','谢候强','1','','','','0','1520502602','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4117','陶映雪','1','','','','0','1520509646','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4118','吴鑫，方烺，袁林，李亚，薛雷，吴裕堤， 刘永涛，王晓伟，宋斌，张莉英，赵刚，刘伍超','1','','','','0','1520509793','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4119','吴鑫','1','','','','0','1520509838','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4120','方烺','1','','','','0','1520509912','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4121','吴裕堤','1','','','','0','1520509995','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4122','刘永涛','1','','','','0','1520510003','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4123','王晓伟','1','','','','0','1520510012','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4124','宋斌','1','','','','0','1520510020','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4125','宋斌','1','','','','0','1520510020','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4126','张莉英','1','','','','0','1520510029','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4127','张莉英','1','','','','0','1520510029','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4128','刘伍超','1','','','','0','1520510052','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4129','张伦伟','1','','','','0','1520561287','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4130','王缘','1','','','','0','1520561295','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4131','吴志军','1','','','','0','1520569207','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4132','祁泽亮','1','','','','0','1520571084','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4133','吴丹丹','1','','','','0','1520574065','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4134','钱斌','1','','','','0','1520574919','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4135','李悦','1','','','','0','1520575288','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4136','常义佳','1','','','','0','1520575302','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4137','谢贵昌','1','','','','0','1520575582','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4138','邓金生','1','','','','0','1520575587','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4139','余昊','1','','','','0','1520576187','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4140','谢烽艺','1','','','','0','1520576194','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4141','缪秋玉','1','','','','0','1520576200','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4142','岳学豪','1','','','','0','1520580457','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4143','陈程','1','','','','0','1520585103','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4144','秦永烽','1','','','','0','1520585116','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4145','杨京蜜','1','','','','0','1520585126','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4146','余跃恒','1','','','','0','1520589287','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4147','王雪玲','1','','','','0','1520604507','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4148','柳钦阳','1','','','','0','1520648154','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4149','张木桂','1','','','','0','1520648163','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4150','柳新民','1','','','','0','1520648173','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4151','吴丽容','1','','','','0','1520658947','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4152','郭训莲','1','','','','0','1520660472','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4153','欧玲芳','1','','','','0','1520677654','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4154','巫曉彤','1','','','','0','1520834218','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4155','吴佛秀  ','1','','','','0','1521003034','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4156','赵洛右 ','1','','','','0','1521340873','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4157','陈珊珊','1','','','','0','1521340878','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4255','金善斌','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4256','李学威','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4257','陈焕强','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4258','蔡孟曦','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4259','张流力','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4260','马小荣','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4261','夏盈盈','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4262','陈志兴','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4263','夏依莼','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4264','王健','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4265','李明帅','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4266','谢开源','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4267','陈丽君','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4268','戴政伟','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4269','戴伟勇','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4270','蔡建','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4271','吴城文','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4272','黄子剑','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4273','江睿','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4274','周元武','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4275','郑伟彬','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4276','邓迎超','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4277','林建明','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4278','林良万','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4279','肖港','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4280','陈凡','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4281','夏晶晶','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4282','郭青','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4283','厉建飞','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4284','李建峰','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4285','陈世勇','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4286','颜婷君','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4287','陈毅强','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4288','兰晓清','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4289','梁晓燕','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4290','郑少军','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4291','罗庆周','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4292','陈远红','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4293','王恭思','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4294','陈江林','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4295','蔡艺蓉','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4296','钟珑曦','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4297','陈铭','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4298','缪海波','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4299','缪梓璇','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4300','叶妹妹','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4301','邓依烁','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4302','王明','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4303','陈超','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4304','杨谢强','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4305','廖宜鑫','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4306','杨国强','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4307','陈礼惠','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4308','庄高强','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4309','邱于正','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4310','邱宗闪','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4311','柳境平','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4312','童涛','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4313','周翠媚','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4314','厉芷菡','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4315','厉振轩','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4316','李大庆','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4317','周建池','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4318','李镓塨','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4319','陈体铃','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4320','陈亚平','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4321','刘大梦','1','','','','0','1522249399','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4352','陈金凤','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4353','傅桂芳','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4354','曾凉凉','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4355','钟金福','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4356','何炎斌','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4357','吴后保','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4358','郭星缘','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4359','王文彬','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4360','吴同泽','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4361','黄永锠','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4362','范鑫','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4363','曾飞云','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4364','舒均欢','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4365','舒云展','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4366','胡万里','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4367','黄晓东','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4368','黄胜钦','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4369','余浩','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4370','徐富强','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4371','刘素华','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4372','匡增喜','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4373','李杰','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4374','林仲山','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4375','江锦辉','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4376','赵一铭','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4377','何汉斌','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4378','林金凤','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4379','景小磊','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4380','李云','1','','','','0','1522249666','0','');;;
INSERT INTO `yii2_transator` (`tid`,`name`,`sex`,`phone`,`address`,`identify`,`is_valid`,`expire_time`,`order_id`,`remark`) VALUES
('4381','王翔','1','','','','0','1522249666','0','');;;
-- -------------------------------------------
-- TABLE DATA yii2_user
-- -------------------------------------------
-- -------------------------------------------
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
COMMIT;
-- -------------------------------------------
-- -------------------------------------------
-- END BACKUP
-- -------------------------------------------
