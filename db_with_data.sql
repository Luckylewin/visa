-- MySQL dump 10.14  Distrib 5.5.52-MariaDB, for Linux (x86_64)
--
-- Host: localhost    Database: visa
-- ------------------------------------------------------
-- Server version	5.5.52-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `yii2_admin`
--

DROP TABLE IF EXISTS `yii2_admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_admin`
--

LOCK TABLES `yii2_admin` WRITE;
/*!40000 ALTER TABLE `yii2_admin` DISABLE KEYS */;
INSERT INTO `yii2_admin` VALUES (0,'admin2','SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ','$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i','876505905@qq.com',2130706433,1484733705,2130706433,1,1482305564,1484733705),(1,'admin','SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ','$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i','771405950@qq.com',2130706433,1516184651,2004602331,1,1482305564,1516184651);
/*!40000 ALTER TABLE `yii2_admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_auth_assignment`
--

DROP TABLE IF EXISTS `yii2_auth_assignment`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_auth_assignment` (
  `item_name` varchar(64) NOT NULL,
  `user_id` varchar(64) NOT NULL,
  `created_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`item_name`,`user_id`),
  CONSTRAINT `yii2_auth_assignment_ibfk_1` FOREIGN KEY (`item_name`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_auth_assignment`
--

LOCK TABLES `yii2_auth_assignment` WRITE;
/*!40000 ALTER TABLE `yii2_auth_assignment` DISABLE KEYS */;
INSERT INTO `yii2_auth_assignment` VALUES ('administors','1',1484712737);
/*!40000 ALTER TABLE `yii2_auth_assignment` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_auth_item`
--

DROP TABLE IF EXISTS `yii2_auth_item`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_auth_item`
--

LOCK TABLES `yii2_auth_item` WRITE;
/*!40000 ALTER TABLE `yii2_auth_item` DISABLE KEYS */;
INSERT INTO `yii2_auth_item` VALUES ('admin/auth',2,'','admin/auth',NULL,1484734191,1484734305),('admin/create',2,'','admin/create',NULL,1484734191,1484734305),('admin/delete',2,'','admin/delete',NULL,1484734191,1484734305),('admin/index',2,'','admin/index',NULL,1484734191,1484734305),('admin/update',2,'','admin/update',NULL,1484734191,1484734305),('administors',1,'授权所有权限',NULL,NULL,1484712662,1484712662),('config/attachment',2,'','config/attachment',NULL,1484734191,1484734305),('config/basic',2,'','config/basic',NULL,1484734191,1484734305),('config/send-mail',2,'','config/send-mail',NULL,1484734191,1484734305),('database/export',2,'','database/export',NULL,1484734305,1484734305),('editors',1,'网站编辑',NULL,NULL,1484712712,1484712712),('index/index',2,'','index/index',NULL,1484734191,1484734305),('menu/create',2,'','menu/create',NULL,1484734191,1484734305),('menu/delete',2,'','menu/delete',NULL,1484734191,1484734305),('menu/index',2,'','menu/index',NULL,1484734191,1484734305),('menu/update',2,'','menu/update',NULL,1484734191,1484734305),('role/auth',2,'','role/auth',NULL,1484734191,1484734305),('role/create',2,'','role/create',NULL,1484734191,1484734305),('role/delete',2,'','role/delete',NULL,1484734191,1484734305),('role/index',2,'','role/index',NULL,1484734191,1484734305),('role/update',2,'','role/update',NULL,1484734191,1484734305);
/*!40000 ALTER TABLE `yii2_auth_item` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_auth_item_child`
--

DROP TABLE IF EXISTS `yii2_auth_item_child`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_auth_item_child` (
  `parent` varchar(64) NOT NULL,
  `child` varchar(64) NOT NULL,
  PRIMARY KEY (`parent`,`child`),
  KEY `child` (`child`),
  CONSTRAINT `yii2_auth_item_child_ibfk_1` FOREIGN KEY (`parent`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yii2_auth_item_child_ibfk_2` FOREIGN KEY (`child`) REFERENCES `yii2_auth_item` (`name`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_auth_item_child`
--

LOCK TABLES `yii2_auth_item_child` WRITE;
/*!40000 ALTER TABLE `yii2_auth_item_child` DISABLE KEYS */;
INSERT INTO `yii2_auth_item_child` VALUES ('administors','admin/auth'),('administors','admin/create'),('administors','admin/delete'),('administors','admin/index'),('administors','admin/update'),('administors','config/attachment'),('administors','config/basic'),('administors','config/send-mail'),('administors','database/export'),('administors','index/index'),('administors','menu/create'),('administors','menu/delete'),('administors','menu/index'),('administors','menu/update'),('administors','role/auth'),('administors','role/create'),('administors','role/delete'),('administors','role/index'),('administors','role/update');
/*!40000 ALTER TABLE `yii2_auth_item_child` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_auth_rule`
--

DROP TABLE IF EXISTS `yii2_auth_rule`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_auth_rule` (
  `name` varchar(64) NOT NULL,
  `data` text,
  `created_at` int(11) DEFAULT NULL,
  `updated_at` int(11) DEFAULT NULL,
  PRIMARY KEY (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_auth_rule`
--

LOCK TABLES `yii2_auth_rule` WRITE;
/*!40000 ALTER TABLE `yii2_auth_rule` DISABLE KEYS */;
INSERT INTO `yii2_auth_rule` VALUES ('','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:0:\"\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734275;}',1484734191,1484734275),('admin/auth','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"admin/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('admin/create','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('admin/delete','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('admin/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"admin/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('admin/update','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"admin/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('config/attachment','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:17:\"config/attachment\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('config/basic','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:12:\"config/basic\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('config/send-mail','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:16:\"config/send-mail\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('database/export','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:15:\"database/export\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734305;s:9:\"updatedAt\";i:1484734305;}',1484734305,1484734305),('index/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"index/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('menu/create','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('menu/delete','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('menu/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"menu/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('menu/update','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"menu/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('role/auth','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:9:\"role/auth\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('role/create','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/create\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('role/delete','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/delete\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('role/index','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:10:\"role/index\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305),('role/update','O:23:\"backend\\models\\AuthRule\":4:{s:4:\"name\";s:11:\"role/update\";s:30:\"\0backend\\models\\AuthRule\0_rule\";r:1;s:9:\"createdAt\";i:1484734191;s:9:\"updatedAt\";i:1484734305;}',1484734191,1484734305);
/*!40000 ALTER TABLE `yii2_auth_rule` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_combo`
--

DROP TABLE IF EXISTS `yii2_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
  `product_id` int(11) NOT NULL,
  PRIMARY KEY (`combo_id`),
  KEY `ppid` (`product_id`) USING BTREE,
  CONSTRAINT `combo_product_id` FOREIGN KEY (`product_id`) REFERENCES `yii2_product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39303 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_combo`
--

LOCK TABLES `yii2_combo` WRITE;
/*!40000 ALTER TABLE `yii2_combo` DISABLE KEYS */;
INSERT INTO `yii2_combo` VALUES (39288,'198/7','',171.000,'1','1',1516170958,1516170958,0,67632),(39289,'520/3','',398.000,'2','1',1516170958,1516174089,0,67632),(39290,'720/1','',500.000,'3','1',1516170958,1516173886,0,67632),(39292,'268/3','',210.000,'1','1',1516170958,1516170958,0,67633),(39293,'278/3','',220.000,'2','1',1516170958,1516170958,0,67633),(39294,'520/2','',450.000,'3','2',1516170958,1516170958,0,67633),(39295,'259/5','',210.000,'1','2',1516170958,1516170958,0,67632),(39296,'445/3','',310.000,'3','2',1516170958,1516170958,0,67632),(39297,'666/3','',550.000,'2','2',1516170958,1516170958,0,67632),(39298,'223/3','',210.000,'1','3',1516170958,1516170958,0,67632),(39299,'450/2','',360.000,'2','3',1516170958,1516170958,0,67632),(39300,'666/1','',500.000,'3','3',1516170958,1516170958,0,67632),(39302,'268/5天','',200.000,'1','1',1516184977,1516184977,0,67634);
/*!40000 ALTER TABLE `yii2_combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_config`
--

DROP TABLE IF EXISTS `yii2_config`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `keyid` varchar(20) NOT NULL DEFAULT '',
  `title` varchar(100) NOT NULL DEFAULT '',
  `data` text NOT NULL,
  PRIMARY KEY (`id`),
  KEY `keyid` (`keyid`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_config`
--

LOCK TABLES `yii2_config` WRITE;
/*!40000 ALTER TABLE `yii2_config` DISABLE KEYS */;
INSERT INTO `yii2_config` VALUES (1,'basic','','{\"sitename\":\"Yii2 CMS\",\"url\":\"http:\\/\\/www.test-yii2cms.com\",\"logo\":\"\\/statics\\/themes\\/admin\\/images\\/logo.png\",\"seo_keywords\":\"Yii2,CMS\",\"seo_description\":\"Yii2,CMS\",\"copyright\":\"@Yii2 CMS\",\"statcode\":\"\",\"close\":\"0\",\"close_reason\":\"\\u7ad9\\u70b9\\u5347\\u7ea7\\u4e2d, \\u8bf7\\u7a0d\\u540e\\u8bbf\\u95ee!\"}'),(2,'sendmail','','{\"mail_type\":\"0\",\"smtp_server\":\"smtp.qq.com\",\"smtp_port\":\"25\",\"auth\":\"1\",\"openssl\":\"1\",\"smtp_user\":\"771405950\",\"smtp_pwd\":\"qiaoBo1989122\",\"send_email\":\"771405950@qq.com\",\"nickname\":\"\\u8fb9\\u8d70\\u8fb9\\u4e54\",\"sign\":\"<hr \\/>\\r\\n\\u90ae\\u4ef6\\u7b7e\\u540d\\uff1a\\u6b22\\u8fce\\u8bbf\\u95ee <a href=\\\"http:\\/\\/www.test-yii2cms.com\\\" target=\\\"_blank\\\">Yii2 CMS<\\/a>\"}'),(3,'attachment','','{\"attachment_size\":\"2048\",\"attachment_suffix\":\"jpg|jpeg|gif|bmp|png\",\"watermark_enable\":\"1\",\"watermark_pos\":\"0\",\"watermark_text\":\"Yii2 CMS\"}');
/*!40000 ALTER TABLE `yii2_config` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_country`
--

DROP TABLE IF EXISTS `yii2_country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_country` (
  `id` smallint(4) NOT NULL AUTO_INCREMENT,
  `abbr` varchar(100) DEFAULT NULL COMMENT '英文缩写',
  `cinfo` varchar(200) DEFAULT NULL COMMENT '中文名',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_country`
--

LOCK TABLES `yii2_country` WRITE;
/*!40000 ALTER TABLE `yii2_country` DISABLE KEYS */;
INSERT INTO `yii2_country` VALUES (251,'ph','菲律宾'),(252,'th','泰国');
/*!40000 ALTER TABLE `yii2_country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_delivery_company`
--

DROP TABLE IF EXISTS `yii2_delivery_company`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_delivery_company` (
  `id` smallint(11) NOT NULL AUTO_INCREMENT,
  `companyname` varchar(100) NOT NULL COMMENT '公司名称',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_delivery_company`
--

LOCK TABLES `yii2_delivery_company` WRITE;
/*!40000 ALTER TABLE `yii2_delivery_company` DISABLE KEYS */;
/*!40000 ALTER TABLE `yii2_delivery_company` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_menu`
--

DROP TABLE IF EXISTS `yii2_menu`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_menu`
--

LOCK TABLES `yii2_menu` WRITE;
/*!40000 ALTER TABLE `yii2_menu` DISABLE KEYS */;
INSERT INTO `yii2_menu` VALUES (1,0,'我的面板','index/index','fa-home',0,0),(2,0,'系统设置','config/basic','fa-cogs',1,99),(3,0,'管理员设置','admin/index','fa-user',1,98),(4,0,'内容设置','','fa-edit',0,0),(5,0,'用户设置','','fa-users',0,0),(6,0,'数据库设置','database/export','fa-hdd-o',0,0),(7,0,'界面设置','','fa-picture-o',0,0),(8,1,'系统信息','index/index','',1,0),(9,2,'站点配置','config/basic','',0,0),(10,2,'后台菜单管理','menu/index','',1,0),(11,3,'管理员管理','admin/index','',1,0),(12,3,'角色管理','role/index','',1,0),(13,4,'内容管理','','',1,0),(14,4,'栏目管理','','',1,0),(15,4,'模型管理','','',1,0),(16,5,'用户管理','','',0,0),(17,6,'数据库管理','database/export','',1,0),(18,7,'主题管理','','',0,0),(19,7,'模板管理','','',0,0),(20,9,'基本配置','config/basic','',1,0),(21,9,'邮箱配置','config/send-mail','',1,0),(22,9,'附件配置','config/attachment','',1,0),(23,10,'添加菜单','menu/create','',1,0),(24,10,'更新','menu/update','',1,0),(25,10,'删除','menu/delete','',1,0),(26,11,'添加','admin/create','',1,0),(27,11,'更新','admin/update','',1,0),(28,11,'授权','admin/auth','',1,0),(29,11,'删除','admin/delete','',1,0),(30,12,'添加','role/create','',1,0),(31,12,'更新','role/update','',1,0),(32,12,'授权','role/auth','',1,0),(33,12,'删除','role/delete','',1,0),(34,0,'产品管理','product/index','fa-coffee',1,1),(35,34,'产品管理','product/index','fa-coffee',1,0),(36,0,'套餐管理','combo/index','fa-coffee',0,0),(37,36,'套餐管理','combo/index','fa-coffee',1,0),(38,0,'订单管理','order/index','fa-dollar',1,2),(39,38,'订单列表','order/index','fa-dollar',1,0),(40,0,'国家管理','country/index','fa-flag',1,12),(41,40,'国家列表','country/index','fa-flag',1,1),(42,0,'客服管理','servicer/index','fa-users',0,14),(43,42,'客服列表','servicer/index','fa-users',1,1),(45,46,'客服列表','servicer/index','fa-users',1,1),(46,0,'人员管理','transator/index','fa-user',1,13),(47,46,'办理人列表','transator/index','',1,0),(48,0,'系统信息','index/index','fa-home',1,0),(49,48,'系统信息','index/index','',1,0);
/*!40000 ALTER TABLE `yii2_menu` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_migration`
--

DROP TABLE IF EXISTS `yii2_migration`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_migration` (
  `version` varchar(180) NOT NULL,
  `apply_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`version`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_migration`
--

LOCK TABLES `yii2_migration` WRITE;
/*!40000 ALTER TABLE `yii2_migration` DISABLE KEYS */;
INSERT INTO `yii2_migration` VALUES ('m000000_000000_base',1482231528),('m130524_201442_init',1482231534);
/*!40000 ALTER TABLE `yii2_migration` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_order`
--

DROP TABLE IF EXISTS `yii2_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_order`
--

LOCK TABLES `yii2_order` WRITE;
/*!40000 ALTER TABLE `yii2_order` DISABLE KEYS */;
INSERT INTO `yii2_order` VALUES (17,0,'453454365435645645','2','1','2018-01-17','zs345345',39295,1,'祥顺',259.00,1,'',0.000,'',0.00,'',0.00,'2018-01-17','2018-01-17','2018-01-17','2018-01-17',1,'北京市海淀区西北旺东路10号院西区8号楼新浪总部大厦 \r\nNo.8 Sina Plaza Courtyard 10, the West XiBeiWang E.Rd HaiDian District Beijing ','广告销售部','4006900000','2018-01-17','547645634564567','顺风快递','无','2018-01-17','2018-01-17','2',251,1516168987,1516171606),(18,0,'72774443785866441   7969','1','2','2017-10-13','禾小小宸',39289,1,'龚韵佳|徐鼎黄',520.00,2,'422405235032456461120180117',80.000,'',0.00,'',23.00,'2017-10-14','2017-10-13','2017-10-19','2017-10-17',1,'云南省  昆明市  盘龙区  金辰街道穿金路省生物制药有限公司生活区（农贸市场旁）  650051  徐鼎黄','徐鼎黄','13807590000','2017-10-20','34234235235','天天快递','龚韵佳拒签重办','2017-11-03','2017-11-08','3',251,1516174472,1516174497),(19,0,'123','1','1','2018-01-17','123456',39288,1,'杨xx|柳yy',1111.00,2,'',0.000,'',0.00,'',0.00,'2018-01-17','2018-01-17','2018-01-17','2018-01-17',1,'信息','杨xx','130','2018-01-17','1111','111','','2018-01-17','2018-01-17','1',251,1516182881,1516182881);
/*!40000 ALTER TABLE `yii2_order` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_order_product`
--

DROP TABLE IF EXISTS `yii2_order_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_order_product` (
  `order_id` int(11) unsigned NOT NULL,
  `product_id` int(11) NOT NULL,
  KEY `fk_order_id` (`order_id`),
  KEY `fk_product_id` (`product_id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_order_product`
--

LOCK TABLES `yii2_order_product` WRITE;
/*!40000 ALTER TABLE `yii2_order_product` DISABLE KEYS */;
/*!40000 ALTER TABLE `yii2_order_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_product`
--

DROP TABLE IF EXISTS `yii2_product`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_product` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '产品id',
  `name` varchar(255) NOT NULL,
  `cost` decimal(10,2) NOT NULL COMMENT '支出成本',
  `country_id` smallint(4) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `product_country_id` (`country_id`),
  CONSTRAINT `product_country_id` FOREIGN KEY (`country_id`) REFERENCES `yii2_country` (`id`) ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=67635 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_product`
--

LOCK TABLES `yii2_product` WRITE;
/*!40000 ALTER TABLE `yii2_product` DISABLE KEYS */;
INSERT INTO `yii2_product` VALUES (67632,'菲律宾签证',0.00,251),(67633,'泰国签证',0.00,252),(67634,'菲律宾59天268/5天',0.00,251);
/*!40000 ALTER TABLE `yii2_product` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_product_combo`
--

DROP TABLE IF EXISTS `yii2_product_combo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_product_combo` (
  `pid` int(11) NOT NULL,
  `combo_name` varchar(255) NOT NULL COMMENT '套餐名称',
  `cid` int(11) NOT NULL,
  KEY `ppid` (`pid`),
  KEY `ccid` (`cid`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_product_combo`
--

LOCK TABLES `yii2_product_combo` WRITE;
/*!40000 ALTER TABLE `yii2_product_combo` DISABLE KEYS */;
/*!40000 ALTER TABLE `yii2_product_combo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_servicer`
--

DROP TABLE IF EXISTS `yii2_servicer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_servicer` (
  `id` smallint(6) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '客服名字',
  `tb_servicer_id` varchar(30) DEFAULT NULL COMMENT '淘宝客服id',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_servicer`
--

LOCK TABLES `yii2_servicer` WRITE;
/*!40000 ALTER TABLE `yii2_servicer` DISABLE KEYS */;
INSERT INTO `yii2_servicer` VALUES (1,'小肖','23'),(2,'小阳','xiaoyang');
/*!40000 ALTER TABLE `yii2_servicer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_session`
--

DROP TABLE IF EXISTS `yii2_session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_session` (
  `id` char(40) NOT NULL,
  `expire` int(11) DEFAULT NULL,
  `data` blob,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_session`
--

LOCK TABLES `yii2_session` WRITE;
/*!40000 ALTER TABLE `yii2_session` DISABLE KEYS */;
INSERT INTO `yii2_session` VALUES ('53pac5u5kn9u6mp5kkaqagl977',1516185566,'__flash|a:0:{}__returnUrl|s:250:\"/admin.php?nsukey=7Ryoze4TJmGNCD4yuX%2B7Pw2Ne6UNCsZe6K%2Bvc0HedKGVMh0wd0W7arsnXi0wQ8K14MJXeFDgXt8lzXOjvtkeobFA28yTudzIXHBe5UD%2FHKTbXue9Nl8KWI4aemaXPxt8%2BA15wb%2BqupJ79aYWHW%2FpD7G5QVwDK5sWKPDuIjH4eiKSfjmzhb2he5P8J3mqBXSeC5JViSvVetL03FcmeWxjyQ%3D%3D\";'),('7io8gv784mehmv0dqtfifbr3g2',1516184089,'__flash|a:0:{}__id|i:1;'),('7ruekmm0d00rjumdr9v98d22d7',1516034922,'__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";'),('b2jslmj7a8s18rm8q0r6lh11o2',1516185924,'__flash|a:0:{}__id|i:0;'),('ejpj9ct17u9b1df626qnbp88m7',1516186497,'__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:1;'),('fphem2hpu3n1ueove7mq7retk5',1516185735,'__flash|a:0:{}__id|i:1;'),('gqfnu7v9eafs9lluu1j3dp1rm6',1516185831,'__flash|a:0:{}'),('hl1ivbk291ef208m1er5ec8q03',1516124901,'__flash|a:0:{}__id|s:1:\"1\";'),('j388lm6clfn73l1gpv96gmtfk6',1516185506,'__flash|a:0:{}__returnUrl|s:250:\"/admin.php?nsukey=7Ryoze4TJmGNCD4yuX%2B7Pw2Ne6UNCsZe6K%2Bvc0HedKGVMh0wd0W7arsnXi0wQ8K14MJXeFDgXt8lzXOjvtkeobFA28yTudzIXHBe5UD%2FHKTbXue9Nl8KWI4aemaXPxt8%2BA15wb%2BqupJ79aYWHW%2FpD7G5QVwDK5sWKPDuIjH4eiKSfjmzhb2he5P8J3mqBXSeC5JViSvVetL03FcmeWxjyQ%3D%3D\";'),('m7opu5pt4q7gm80771mvocj3j5',1516185766,'__flash|a:0:{}__id|i:1;'),('n04f4ukpiij9lcg7n9dsgmpdg6',1516186425,'__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:1;'),('nlvsl8ec5q2jlnf2bcfronf1q3',1516186324,'__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:1;'),('nn1ss1f3jt0n39fgfo1gbbfv01',1516180548,'__flash|a:0:{}__id|s:1:\"1\";'),('p0c9qlmt7kfd2msihciu0t4d34',1516185613,'__flash|a:0:{}__id|i:1;'),('sqomo878c59cjuaelf9ce9j8v7',1516185506,'__flash|a:0:{}__returnUrl|s:250:\"/admin.php?nsukey=7Ryoze4TJmGNCD4yuX%2B7Pw2Ne6UNCsZe6K%2Bvc0HedKGVMh0wd0W7arsnXi0wQ8K14MJXeFDgXt8lzXOjvtkeobFA28yTudzIXHBe5UD%2FHKTbXue9Nl8KWI4aemaXPxt8%2BA15wb%2BqupJ79aYWHW%2FpD7G5QVwDK5sWKPDuIjH4eiKSfjmzhb2he5P8J3mqBXSeC5JViSvVetL03FcmeWxjyQ%3D%3D\";'),('u0tjt9j8ckeltp4pua2ns02rs6',1516185668,'__flash|a:0:{}');
/*!40000 ALTER TABLE `yii2_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_test`
--

DROP TABLE IF EXISTS `yii2_test`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_test` (
  `id` int(255) NOT NULL,
  `test` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_test`
--

LOCK TABLES `yii2_test` WRITE;
/*!40000 ALTER TABLE `yii2_test` DISABLE KEYS */;
INSERT INTO `yii2_test` VALUES (1,'aa');
/*!40000 ALTER TABLE `yii2_test` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_transator`
--

DROP TABLE IF EXISTS `yii2_transator`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_transator` (
  `tid` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) NOT NULL COMMENT '姓名',
  `sex` char(1) NOT NULL DEFAULT '' COMMENT '性别',
  `phone` varchar(32) NOT NULL DEFAULT '' COMMENT '手机号',
  `address` varchar(255) NOT NULL DEFAULT '' COMMENT '地址',
  `identify` varchar(30) NOT NULL DEFAULT '' COMMENT '身份证',
  `is_valid` char(1) NOT NULL DEFAULT '0' COMMENT '是否有效',
  `expire_time` int(10) NOT NULL COMMENT '操作过期时间',
  `order_id` int(11) NOT NULL DEFAULT '0',
  `remark` varchar(255) NOT NULL DEFAULT '' COMMENT '备注信息',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_transator`
--

LOCK TABLES `yii2_transator` WRITE;
/*!40000 ALTER TABLE `yii2_transator` DISABLE KEYS */;
INSERT INTO `yii2_transator` VALUES (12,'黎明','1','18938904293','2222','','1',1516209713,16,''),(13,'张学友','1','18938904293','656456','546456456','1',1516209729,16,''),(15,'祥顺','1','13453456452','宝安','','1',1516239036,17,'4444'),(16,'龚韵佳','1','13356542345','云南省  昆明市  盘龙区  金辰街道穿金路省生物制药有限公司生活区（农贸市场旁）','','1',1516260064,18,''),(17,'徐鼎黄','2','13436354625','云南省  昆明市  盘龙区  金辰街道穿金路省生物制药有限公司生活区（农贸市场旁）  650051  徐鼎黄','','1',1516260183,18,''),(20,'yang','','','','','0',1516268843,0,''),(21,'liu','','','','','0',1516269101,0,''),(22,'杨xx','','','','','1',1516269209,19,''),(23,'柳yy','','','','','1',1516269271,19,''),(24,'刘海斌','','','','','0',1516270574,0,'0啊u去完'),(25,'苏金伟','','','','','0',1516270583,0,'12121');
/*!40000 ALTER TABLE `yii2_transator` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_user`
--

DROP TABLE IF EXISTS `yii2_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_user`
--

LOCK TABLES `yii2_user` WRITE;
/*!40000 ALTER TABLE `yii2_user` DISABLE KEYS */;
/*!40000 ALTER TABLE `yii2_user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-01-17 18:31:59
