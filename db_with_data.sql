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
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_admin`
--

LOCK TABLES `yii2_admin` WRITE;
/*!40000 ALTER TABLE `yii2_admin` DISABLE KEYS */;
INSERT INTO `yii2_admin` VALUES (1,'admin','SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ','$2y$13$0UVcG.mXF6Og0rnjfwJd2.wixT2gdn.wDO9rN44jGtIGc6JvBqR7i','771405950@qq.com',2130706433,1517998969,2004601970,1,1482305564,1517998969),(4,'admin2','SbSY36BLw3V2lU-GB7ZAzCVJKDFx82IJ','$2y$13$eewz.EbHxz3kmPXUl.FDceUig23Yv3n7x8rZCRm6.r2ppxazBSIAS','876505905@qq.com',2130706433,1518000534,2004601970,1,1482305564,1518000534);
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
INSERT INTO `yii2_auth_assignment` VALUES ('普通管理员','4',1517998234),('超级管理员','1',1484712737);
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
INSERT INTO `yii2_auth_item` VALUES ('admin/auth',2,'','admin/auth',NULL,1484734191,1484734305),('admin/create',2,'','admin/create',NULL,1484734191,1484734305),('admin/delete',2,'','admin/delete',NULL,1484734191,1484734305),('admin/index',2,'','admin/index',NULL,1484734191,1484734305),('admin/update',2,'','admin/update',NULL,1484734191,1484734305),('config/attachment',2,'','config/attachment',NULL,1484734191,1484734305),('config/basic',2,'','config/basic',NULL,1484734191,1484734305),('config/send-mail',2,'','config/send-mail',NULL,1484734191,1484734305),('database/export',2,'','database/export',NULL,1484734305,1484734305),('index/index',2,'','index/index',NULL,1484734191,1484734305),('menu/create',2,'','menu/create',NULL,1484734191,1484734305),('menu/delete',2,'','menu/delete',NULL,1484734191,1484734305),('menu/index',2,'','menu/index',NULL,1484734191,1484734305),('menu/update',2,'','menu/update',NULL,1484734191,1484734305),('role/auth',2,'','role/auth',NULL,1484734191,1484734305),('role/create',2,'','role/create',NULL,1484734191,1484734305),('role/delete',2,'','role/delete',NULL,1484734191,1484734305),('role/index',2,'','role/index',NULL,1484734191,1484734305),('role/update',2,'','role/update',NULL,1484734191,1484734305),('普通管理员',1,'网站编辑',NULL,NULL,1484712712,1517998191),('超级管理员',1,'授权所有权限',NULL,NULL,1484712662,1517998180);
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
INSERT INTO `yii2_auth_item_child` VALUES ('超级管理员','admin/auth'),('超级管理员','admin/create'),('超级管理员','admin/delete'),('超级管理员','admin/index'),('超级管理员','admin/update'),('超级管理员','config/attachment'),('超级管理员','config/basic'),('超级管理员','config/send-mail'),('超级管理员','database/export'),('超级管理员','index/index'),('超级管理员','menu/create'),('超级管理员','menu/delete'),('超级管理员','menu/index'),('超级管理员','menu/update'),('超级管理员','role/auth'),('超级管理员','role/create'),('超级管理员','role/delete'),('超级管理员','role/index'),('超级管理员','role/update');
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
  `product_id` int(11) NOT NULL COMMENT '产品id',
  `combo_charge` float(5,3) NOT NULL DEFAULT '0.000',
  PRIMARY KEY (`combo_id`),
  KEY `ppid` (`product_id`) USING BTREE,
  CONSTRAINT `combo_product_id` FOREIGN KEY (`product_id`) REFERENCES `yii2_product` (`id`) ON DELETE CASCADE ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=39404 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_combo`
--

LOCK TABLES `yii2_combo` WRITE;
/*!40000 ALTER TABLE `yii2_combo` DISABLE KEYS */;
INSERT INTO `yii2_combo` VALUES (39342,'218/10天','',200.000,'1','1',1516961512,1517627390,1,67639,0.965),(39343,'248/8天','',200.000,'1','1',1516961528,1517627399,1,67639,0.965),(39344,'268/5天','',200.000,'1','1',1516961542,1517627407,1,67639,0.965),(39345,'520/3天','',401.000,'2','1',1516961556,1517627415,1,67639,0.965),(39346,'1200/1天','',950.000,'3','1',1516961580,1517627424,1,67639,0.965),(39347,'248/8天','',200.000,'1','2',1516961603,1517627432,1,67639,1.000),(39348,'260/5天','',200.000,'1','2',1516961618,1517627436,1,67639,1.000),(39350,'510/3天','',401.000,'2','2',1516961679,1517627442,1,67639,1.000),(39351,'1200/1天','',950.000,'3','2',1516961704,1517627448,1,67639,1.000),(39352,'220/4-5工','',200.000,'1','3',1516961723,1517627453,1,67639,1.000),(39353,'425/2-3工','',401.000,'2','3',1516961741,1517627459,1,67639,1.000),(39354,'990/1天','',950.000,'3','3',1516961756,1517627464,1,67639,1.000),(39355,'940/7天','',550.000,'1','1',1516961957,1517456694,1,67640,0.965),(39356,'1240/5天','',550.000,'2','1',1516961988,1517456698,1,67640,0.965),(39357,'920/7天','',550.000,'1','2',1516962154,1517627482,1,67640,1.000),(39358,'1200/4天','',550.000,'2','2',1516962178,1517627485,1,67640,1.000),(39359,'600/5-6工','',550.000,'1','3',1516962206,1517627489,1,67640,1.000),(39360,'900/3-4工','',550.000,'2','3',1516962309,1517627494,1,67640,1.000),(39361,'1440/7天','',1000.000,'1','1',1516962387,1517462842,1,67641,0.965),(39362,'1550/5天','',1000.000,'2','1',1516962406,1517462854,1,67641,0.965),(39363,'1400/7天','',1000.000,'1','2',1516962436,1517627526,1,67641,1.000),(39364,'1500/5天','',1000.000,'2','2',1516962452,1517627530,1,67641,1.000),(39365,'1100/5-6工','',1000.000,'1','3',1516962474,1517627535,1,67641,1.000),(39366,'1200/3-4工','',1000.000,'2','3',1516962491,1517627540,1,67641,1.000),(39367,'175/3天','',160.000,'1','1',1517626325,1517626325,1,67642,0.965),(39368,'198/1天','',160.000,'2','1',1517626349,1517626349,1,67642,0.965),(39369,'248/3小时','',160.000,'3','1',1517626681,1517626681,1,67642,0.965),(39370,'175/3天','',160.000,'1','2',1517626705,1517626739,1,67642,1.000),(39371,'190/1天','',160.000,'2','2',1517626760,1517626760,1,67642,1.000),(39372,'240/3小时','',160.000,'3','2',1517626778,1517626778,1,67642,1.000),(39373,'180/1天','',160.000,'1','3',1517626816,1517626816,1,67642,1.000),(39374,'200/3小时','',160.000,'3','3',1517626844,1517626844,1,67642,1.000),(39375,'320/4天','',280.000,'1','1',1517627078,1517627078,1,67643,0.965),(39376,'343/2天','',280.000,'2','1',1517627192,1517627192,1,67643,0.965),(39377,'395/1天','',280.000,'3','1',1517627213,1517627213,1,67643,1.000),(39378,'310/4天','',280.000,'1','2',1517627237,1517627237,1,67643,1.000),(39379,'343/1天','',280.000,'2','2',1517627260,1517627260,1,67643,1.000),(39380,'395/1天','',280.000,'3','2',1517627280,1517627280,1,67643,1.000),(39381,'300/2天','',280.000,'1','3',1517627308,1517627308,1,67643,1.000),(39382,'320/1天','',280.000,'3','3',1517627331,1517627331,1,67643,1.000),(39383,'320/6天','',290.000,'1','1',1517627767,1517627767,1,67644,0.965),(39384,'390/4天','',290.000,'2','1',1517627787,1517627787,1,67644,0.965),(39385,'310/6天','',290.000,'1','2',1517627804,1517627804,1,67644,1.000),(39386,'380/4天','',290.000,'1','2',1517627818,1517627818,1,67644,1.000),(39387,'300/4天','',290.000,'1','3',1517627855,1517627855,1,67644,1.000),(39388,'268/4天','',242.000,'1','1',1517627930,1517627930,1,67645,0.965),(39389,'299/1天','',242.000,'2','1',1517627946,1517627946,1,67645,0.965),(39390,'358/3小时','',242.000,'3','1',1517627965,1517627965,1,67645,0.965),(39391,'260/4天','',242.000,'1','2',1517628015,1517628015,1,67645,1.000),(39392,'290/1天','',242.000,'2','2',1517628030,1517628030,1,67645,1.000),(39393,'350/3小时','',242.000,'3','2',1517628044,1517628044,1,67645,1.000),(39394,'270/3天','',242.000,'1','3',1517628114,1517628114,1,67645,1.000),(39395,'290/3小时','',242.000,'2','3',1517628137,1517628137,1,67645,1.000),(39396,'255/3天','',240.000,'1','1',1517628205,1517628205,1,67646,0.965),(39397,'270/2天','',240.000,'2','1',1517628228,1517628228,1,67646,1.000),(39398,'298/1天','',260.000,'3','1',1517628353,1517628353,1,67646,0.965),(39399,'250/3天','',240.000,'1','2',1517628379,1517628379,1,67646,1.000),(39400,'260/2天','',240.000,'2','2',1517628396,1517628396,1,67646,1.000),(39401,'288/1天','',260.000,'3','2',1517628413,1517628413,1,67646,1.000),(39402,'250/2天','',240.000,'1','3',1517628430,1517628430,1,67646,1.000),(39403,'280/1天','',260.000,'2','3',1517628446,1517628446,1,67646,1.000);
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
-- Table structure for table `yii2_export_setting`
--

DROP TABLE IF EXISTS `yii2_export_setting`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_export_setting` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `rolename` char(30) NOT NULL COMMENT '角色id',
  `showfinance` char(1) NOT NULL DEFAULT '0' COMMENT '是否展示财务信息',
  PRIMARY KEY (`id`)
) ENGINE=MyISAM AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_export_setting`
--

LOCK TABLES `yii2_export_setting` WRITE;
/*!40000 ALTER TABLE `yii2_export_setting` DISABLE KEYS */;
INSERT INTO `yii2_export_setting` VALUES (3,'administors','1'),(4,'普通管理员','0'),(5,'超级管理员','1');
/*!40000 ALTER TABLE `yii2_export_setting` ENABLE KEYS */;
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
INSERT INTO `yii2_menu` VALUES (1,0,'我的面板','index/index','fa-home',0,0),(2,0,'系统设置','config/basic','fa-cogs',1,99),(3,0,'管理员设置','admin/index','fa-user',1,98),(4,0,'内容设置','','fa-edit',0,0),(5,0,'用户设置','','fa-users',0,0),(6,0,'数据库设置','database/export','fa-hdd-o',0,0),(7,0,'界面设置','','fa-picture-o',0,0),(8,1,'系统信息','index/index','',1,0),(9,2,'站点配置','config/basic','',0,0),(10,2,'后台菜单管理','menu/index','',1,0),(11,3,'管理员管理','admin/index','',1,0),(12,3,'角色管理','role/index','',1,0),(13,4,'内容管理','','',1,0),(14,4,'栏目管理','','',1,0),(15,4,'模型管理','','',1,0),(16,5,'用户管理','','',0,0),(17,6,'数据库管理','database/export','',1,0),(18,7,'主题管理','','',0,0),(19,7,'模板管理','','',0,0),(20,9,'基本配置','config/basic','',1,0),(21,9,'邮箱配置','config/send-mail','',1,0),(22,9,'附件配置','config/attachment','',1,0),(23,10,'添加菜单','menu/create','',1,0),(24,10,'更新','menu/update','',1,0),(25,10,'删除','menu/delete','',1,0),(26,11,'添加','admin/create','',1,0),(27,11,'更新','admin/update','',1,0),(28,11,'授权','admin/auth','',1,0),(29,11,'删除','admin/delete','',1,0),(30,12,'添加','role/create','',1,0),(31,12,'更新','role/update','',1,0),(32,12,'授权','role/auth','',1,0),(33,12,'删除','role/delete','',1,0),(34,0,'产品管理','product/index','fa-coffee',1,1),(35,34,'产品管理','product/index','fa-coffee',1,0),(36,0,'套餐管理','combo/index','fa-coffee',0,0),(37,36,'套餐管理','combo/index','fa-coffee',1,0),(38,0,'订单管理','order/index','fa-dollar',1,2),(39,38,'订单列表','order/index','fa-dollar',1,0),(41,40,'国家列表','country/index','fa-flag',1,1),(42,0,'客服管理','servicer/index','fa-users',0,14),(43,42,'客服列表','servicer/index','fa-users',1,1),(45,46,'客服列表','servicer/index','fa-users',1,1),(46,0,'人员管理','transator/index','fa-user',1,13),(47,46,'办理人列表','transator/index','',1,0),(48,0,'系统信息','index/index','fa-home',1,0),(49,48,'系统信息','index/index','',1,0);
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
) ENGINE=InnoDB AUTO_INCREMENT=84 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_order`
--

LOCK TABLES `yii2_order` WRITE;
/*!40000 ALTER TABLE `yii2_order` DISABLE KEYS */;
INSERT INTO `yii2_order` VALUES (81,0,'72582469886030839','1','1','2018-10-13','xqf90000',177,2,'',1440.00,1,'0.00',0.00,0.00,'',0.00,0.00,'',23.00,23.00,'2018-10-14','','2018-10-16','2018-10-19',1,'海南省  海口市  秀英区  长流镇长滨东四街6号海口市中改院专家公寓1-2-1303  570311','许青峰','13807590000','2018-10-20','',NULL,'','2018-11-03','2018-11-13','支付宝','2018-11-08','5',0,1518000018,1518000018),(82,0,'73464844660638393','1','3','2018-10-13','oulsm2',179,2,'',298.00,3,'0.00',0.00,0.00,'',0.00,0.00,'',0.00,0.00,'2018-10-13','','','2018-10-14',1,'回邮：819338141@qq.com','-','','2018-10-14','',NULL,'','2018-11-03','2018-11-13','建行','','5',0,1518000018,1518000018),(83,0,'72774443785866441  79696628915866441','1','3','2018-10-13','禾小小宸',180,1,'',358.00,2,'0.00',80.00,0.00,'',0.00,0.00,'',23.00,23.00,'2018-10-14','','2018-10-19','2018-10-17',1,'云南省  昆明市  盘龙区  金辰街道穿金路省生物制药有限公司生活区（农贸市场旁）  650051  徐鼎黄','徐鼎黄','13888258830','2018-10-20','',NULL,'','2018-11-03','2018-11-13','招行','2018-11-08','5',0,1518000230,1518000230);
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
-- Table structure for table `yii2_order_to_transactor`
--

DROP TABLE IF EXISTS `yii2_order_to_transactor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `yii2_order_to_transactor` (
  `o_id` int(11) NOT NULL COMMENT '订单id',
  `t_id` int(11) NOT NULL COMMENT '办理人id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_order_to_transactor`
--

LOCK TABLES `yii2_order_to_transactor` WRITE;
/*!40000 ALTER TABLE `yii2_order_to_transactor` DISABLE KEYS */;
INSERT INTO `yii2_order_to_transactor` VALUES (27,73),(30,76),(29,74),(28,74),(28,75),(30,75),(30,74),(31,76),(31,74),(32,74),(33,78),(33,79),(34,80),(35,81),(35,82),(35,83),(35,84),(35,85),(35,86),(35,87),(35,88),(36,89),(36,90),(36,91),(37,92),(38,93),(39,94),(40,95),(41,96),(42,97),(43,98),(43,99),(43,100),(44,101),(44,102),(45,103),(45,104),(45,105),(45,106),(46,107),(46,108),(46,109),(46,110),(46,111),(46,112),(46,113),(47,114),(47,115),(48,116),(48,117),(49,118),(50,119),(51,120),(52,121),(53,122),(54,123),(55,124),(56,125),(57,126),(58,127),(59,128),(59,129),(60,130),(60,131),(60,132),(60,133),(60,134),(61,135),(61,136),(62,137),(62,138),(62,139),(63,140),(63,141),(63,142),(64,143),(65,144),(66,145),(66,146),(66,147),(67,148),(67,149),(68,150),(68,151),(68,152),(69,153),(69,154),(69,155),(69,156),(69,157),(69,158),(69,159),(70,96),(71,160),(72,78),(72,79),(73,89),(73,90),(73,91),(74,89),(74,90),(74,91),(75,89),(75,90),(75,91),(76,89),(76,90),(76,91),(77,89),(77,90),(77,91),(78,160),(79,160),(80,89),(80,90),(80,91),(81,160),(82,89),(82,90),(82,91),(83,78),(83,79);
/*!40000 ALTER TABLE `yii2_order_to_transactor` ENABLE KEYS */;
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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=67647 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_product`
--

LOCK TABLES `yii2_product` WRITE;
/*!40000 ALTER TABLE `yii2_product` DISABLE KEYS */;
INSERT INTO `yii2_product` VALUES (67639,'菲律宾59天单次签证',0.00),(67640,'菲律宾三个月多次签证',0.00),(67641,'菲律宾半年多次签证',0.00),(67642,'马来西亚-15天ENTRI',0.00),(67643,'马来西亚-30天EVISA',0.00),(67644,'马来西亚-30天贴纸签',0.00),(67645,'柬埔寨电子签',0.00),(67646,'柬埔寨贴纸签',0.00);
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
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;
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
INSERT INTO `yii2_session` VALUES ('493hvqfdr6clmdh56effbcirr5',1518001471,'__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:1;'),('pc0l4bvug64lgpfa466jj52bu0',1518001982,'__flash|a:0:{}__returnUrl|s:10:\"/admin.php\";__id|i:4;');
/*!40000 ALTER TABLE `yii2_session` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `yii2_snapshot`
--

DROP TABLE IF EXISTS `yii2_snapshot`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
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
) ENGINE=MyISAM AUTO_INCREMENT=181 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_snapshot`
--

LOCK TABLES `yii2_snapshot` WRITE;
/*!40000 ALTER TABLE `yii2_snapshot` DISABLE KEYS */;
INSERT INTO `yii2_snapshot` VALUES (4,'298/5',200.000,'1','1',39310,'1','',0.965),(5,'398/3',300.000,'1','2',39311,'1','',0.965),(6,'520/2',400.000,'1','3',39312,'1','',0.965),(7,'330/5',230.000,'2','1',39313,'1','',0.965),(8,'430/3',330.000,'2','2',39314,'1','',0.965),(11,'333/3',11.000,'1','1',39316,'1','',0.965),(10,'540/1',330.000,'2','3',39315,'1','',0.965),(12,'555/5',33.000,'1','2',39317,'1','',0.965),(13,'555/1',11.000,'1','3',39318,'1','',0.965),(14,'223/3',34.000,'2','1',39319,'1','',0.965),(15,'330/5',444.000,'2','2',39320,'1','',0.965),(16,'666/3',222.000,'2','3',39321,'1','',0.965),(17,'333/3',222.000,'3','1',39322,'0','',0.965),(18,'555/3',333.000,'3','2',39323,'1','',0.965),(19,'666/1',555.000,'3','3',39324,'0','',0.965),(20,'788/10',445.000,'3','1',39325,'1','',0.965),(21,'888/5',666.000,'3','2',39326,'1','',0.965),(22,'889/2',777.000,'3','3',39327,'1','',0.965),(23,'11',1.000,'1','1',39332,'1','',0.965),(24,'1',1.000,'1','1',39333,'1','',0.965),(25,'1',1.000,'1','1',39334,'1','',0.965),(26,'333/2',222.000,'3','1',39322,'1','泰国签证',0.965),(27,'233/3',210.000,'1','2',39335,'0','越南签证',0.965),(28,'233/2',210.000,'1','2',39335,'0','越南签证',0.965),(29,'233/3',210.000,'1','2',39335,'1','越南签证',0.965),(30,'666/2',555.000,'3','3',39324,'1','泰国签证',0.965),(31,'125/55',100.000,'1','1',39336,'0','柬埔寨55天游',0.965),(32,'300/5',200.000,'1','2',39337,'0','柬埔寨55天游',0.965),(33,'365/5',300.000,'1','3',39338,'0','柬埔寨55天游',0.965),(34,'258/5',200.000,'1','1',39339,'1','菲律宾59天',0.965),(35,'338/5',285.000,'1','2',39340,'1','菲律宾59天',0.965),(36,'365/5',300.000,'1','3',39341,'1','菲律宾59天',0.965),(37,'218/10天',200.000,'1','1',39342,'0','菲律宾59天单次签证',0.965),(38,'248/8天',200.000,'1','1',39343,'0','菲律宾59天单次签证',0.965),(39,'268/5天',200.000,'1','1',39344,'0','菲律宾59天单次签证',0.965),(40,'520',401.000,'1','2',39345,'0','菲律宾59天单次签证',0.965),(41,'1200',950.000,'1','3',39346,'0','菲律宾59天单次签证',0.965),(42,'248/8天',200.000,'2','1',39347,'0','菲律宾59天单次签证',0.965),(43,'260/5天',200.000,'2','1',39348,'0','菲律宾59天单次签证',0.965),(44,'510/3天',401.000,'1','2',39349,'1','菲律宾59天单次签证',0.965),(45,'520/3天',401.000,'1','2',39345,'0','菲律宾59天单次签证',0.965),(46,'1200/1天',950.000,'1','3',39346,'0','菲律宾59天单次签证',0.965),(47,'510/3天',401.000,'1','2',39350,'0','菲律宾59天单次签证',0.965),(48,'510/3天',401.000,'2','2',39350,'0','菲律宾59天单次签证',0.965),(49,'1200/1天',950.000,'2','3',39351,'0','菲律宾59天单次签证',0.965),(50,'220/4-5工',200.000,'3','1',39352,'0','菲律宾59天单次签证',0.965),(51,'425/2-3工',401.000,'3','2',39353,'0','菲律宾59天单次签证',0.965),(52,'990/1天',950.000,'3','3',39354,'0','菲律宾59天单次签证',0.965),(53,'940/7天',550.000,'1','1',39355,'0','菲律宾三个月多次',0.965),(54,'1240/5天',550.000,'1','2',39356,'0','菲律宾三个月多次',0.965),(55,'920/7天',550.000,'2','1',39357,'0','菲律宾三个月多次',0.965),(56,'1220/4天',550.000,'2','2',39358,'0','菲律宾三个月多次',0.965),(57,'600/5-6工',550.000,'3','1',39359,'0','菲律宾三个月多次',0.965),(58,'900/3-4工',550.000,'3','2',39360,'0','菲律宾三个月多次',0.965),(59,'1440/7天',1000.000,'1','1',39361,'0','菲律宾半年多次签证',0.965),(60,'1550/4天',1000.000,'1','2',39362,'0','菲律宾半年多次签证',0.965),(61,'1550/5天',1000.000,'1','2',39362,'0','菲律宾半年多次签证',0.965),(62,'1420/7天',1000.000,'2','1',39363,'0','菲律宾半年多次签证',0.965),(63,'1530/5天',1000.000,'2','2',39364,'0','菲律宾半年多次签证',0.965),(64,'1100/5-6工',1000.000,'3','1',39365,'0','菲律宾半年多次签证',0.965),(65,'1200/3-4工',1000.000,'3','2',39366,'0','菲律宾半年多次签证',0.965),(66,'125/55',100.000,'1','1',39336,'1','柬埔寨55天游',0.965),(67,'300/5',200.000,'1','2',39337,'1','柬埔寨55天游',0.965),(68,'365/5',300.000,'1','3',39338,'1','柬埔寨55天游',0.965),(69,'940/7天',550.000,'1','1',39355,'1','菲律宾三个月多次签证',0.965),(70,'1240/5天',550.000,'1','2',39356,'1','菲律宾三个月多次签证',0.965),(71,'1440/7天',1000.000,'1','1',39361,'1','菲律宾半年多次签证',0.965),(72,'1550/5天',1000.000,'1','2',39362,'1','菲律宾半年多次签证',0.965),(73,'1420/7天',1000.000,'2','1',39363,'0','菲律宾半年多次签证',0.965),(74,'1530/5天',1000.000,'2','2',39364,'0','菲律宾半年多次签证',0.965),(75,'1100/5-6工',1000.000,'3','1',39365,'0','菲律宾半年多次签证',0.965),(76,'1200/3-4工',1000.000,'3','2',39366,'0','菲律宾半年多次签证',0.965),(77,'1200/4天',550.000,'2','2',39358,'0','菲律宾三个月多次签证',0.000),(78,'1400/7天',1000.000,'2','1',39363,'0','菲律宾半年多次签证',0.965),(79,'1500/5天',1000.000,'2','2',39364,'0','菲律宾半年多次签证',0.965),(80,'175/3天',160.000,'1','1',39367,'1','马来西亚-15天ENTRI',0.965),(81,'198/1天',160.000,'1','2',39368,'1','马来西亚-15天ENTRI',0.965),(82,'248/3小时',160.000,'1','3',39369,'1','马来西亚-15天ENTRI',0.965),(83,'175/3天',160.000,'2','1',39370,'0','马来西亚-15天ENTRI',0.000),(84,'175/3天',160.000,'2','1',39370,'1','马来西亚-15天ENTRI',1.000),(85,'190/1天',160.000,'2','2',39371,'1','马来西亚-15天ENTRI',1.000),(86,'240/3小时',160.000,'2','3',39372,'1','马来西亚-15天ENTRI',1.000),(87,'180/1天',160.000,'3','1',39373,'1','马来西亚-15天ENTRI',1.000),(88,'200/3小时',160.000,'3','3',39374,'1','马来西亚-15天ENTRI',1.000),(89,'320/4天',280.000,'1','1',39375,'1','马来西亚-30天EVISA',0.965),(90,'343/2天',280.000,'1','2',39376,'1','马来西亚-30天EVISA',0.965),(91,'395/1天',280.000,'1','3',39377,'1','马来西亚-30天EVISA',1.000),(92,'310/4天',280.000,'2','1',39378,'1','马来西亚-30天EVISA',1.000),(93,'343/1天',280.000,'2','2',39379,'1','马来西亚-30天EVISA',1.000),(94,'395/1天',280.000,'2','3',39380,'1','马来西亚-30天EVISA',1.000),(95,'300/2天',280.000,'3','1',39381,'1','马来西亚-30天EVISA',1.000),(96,'320/1天',280.000,'3','3',39382,'1','马来西亚-30天EVISA',1.000),(97,'218/10天',200.000,'1','1',39342,'1','菲律宾59天单次签证',0.965),(98,'248/8天',200.000,'1','1',39343,'1','菲律宾59天单次签证',0.965),(99,'268/5天',200.000,'1','1',39344,'1','菲律宾59天单次签证',0.965),(100,'520/3天',401.000,'1','2',39345,'1','菲律宾59天单次签证',0.965),(101,'1200/1天',950.000,'1','3',39346,'1','菲律宾59天单次签证',0.965),(102,'248/8天',200.000,'2','1',39347,'1','菲律宾59天单次签证',1.000),(103,'260/5天',200.000,'2','1',39348,'1','菲律宾59天单次签证',1.000),(104,'510/3天',401.000,'2','2',39350,'1','菲律宾59天单次签证',1.000),(105,'1200/1天',950.000,'2','3',39351,'1','菲律宾59天单次签证',1.000),(106,'220/4-5工',200.000,'3','1',39352,'1','菲律宾59天单次签证',1.000),(107,'425/2-3工',401.000,'3','2',39353,'1','菲律宾59天单次签证',1.000),(108,'990/1天',950.000,'3','3',39354,'1','菲律宾59天单次签证',1.000),(109,'920/7天',550.000,'2','1',39357,'1','菲律宾三个月多次签证',1.000),(110,'1200/4天',550.000,'2','2',39358,'1','菲律宾三个月多次签证',1.000),(111,'600/5-6工',550.000,'3','1',39359,'1','菲律宾三个月多次签证',1.000),(112,'900/3-4工',550.000,'3','2',39360,'1','菲律宾三个月多次签证',1.000),(113,'1400/7天',1000.000,'2','1',39363,'1','菲律宾半年多次签证',1.000),(114,'1500/5天',1000.000,'2','2',39364,'1','菲律宾半年多次签证',1.000),(115,'1100/5-6工',1000.000,'3','1',39365,'1','菲律宾半年多次签证',1.000),(116,'1200/3-4工',1000.000,'3','2',39366,'1','菲律宾半年多次签证',1.000),(117,'320/6天',290.000,'1','1',39383,'1','马来西亚-30天贴纸签',0.965),(118,'390/4天',290.000,'1','2',39384,'1','马来西亚-30天贴纸签',0.965),(119,'310/6天',290.000,'2','1',39385,'1','马来西亚-30天贴纸签',1.000),(120,'380/4天',290.000,'2','1',39386,'1','马来西亚-30天贴纸签',1.000),(121,'300/4天',290.000,'3','1',39387,'1','马来西亚-30天贴纸签',1.000),(122,'268/4天',242.000,'1','1',39388,'1','柬埔寨电子签',0.965),(123,'299/1天',242.000,'1','2',39389,'1','柬埔寨电子签',0.965),(124,'358/3小时',242.000,'1','3',39390,'1','柬埔寨电子签',0.965),(125,'260/4天',242.000,'2','1',39391,'1','柬埔寨电子签',1.000),(126,'290/1天',242.000,'2','2',39392,'1','柬埔寨电子签',1.000),(127,'350/3小时',242.000,'2','3',39393,'1','柬埔寨电子签',1.000),(128,'270/3天',242.000,'3','1',39394,'1','柬埔寨电子签',1.000),(129,'290/3小时',242.000,'3','2',39395,'1','柬埔寨电子签',1.000),(130,'255/3天',240.000,'1','1',39396,'1','柬埔寨贴纸签',0.965),(131,'270/2天',240.000,'1','2',39397,'1','柬埔寨贴纸签',1.000),(132,'298/1天',260.000,'1','3',39398,'1','柬埔寨贴纸签',0.965),(133,'250/3天',240.000,'2','1',39399,'1','柬埔寨贴纸签',1.000),(134,'260/2天',240.000,'2','2',39400,'1','柬埔寨贴纸签',1.000),(135,'288/1天',260.000,'2','3',39401,'1','柬埔寨贴纸签',1.000),(136,'250/2天',240.000,'3','1',39402,'1','柬埔寨贴纸签',1.000),(137,'280/1天',260.000,'3','2',39403,'1','柬埔寨贴纸签',1.000),(138,'268/5天',200.000,'1','1',0,'1','菲律宾59天单次签证',0.965),(139,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(140,'1440/7天',1000.000,'1','1',0,'1','菲律宾半年多次签证',0.965),(141,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(142,'298/1天',260.000,'1','3',0,'1','柬埔寨贴纸签',0.965),(143,'1440/7天',1000.000,'1','1',0,'1','菲律宾半年多次签证',0.965),(144,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(145,'298/1天',260.000,'1','3',0,'1','柬埔寨贴纸签',0.965),(146,'1440/7天',1000.000,'1','1',0,'1','菲律宾半年多次签证',0.965),(147,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(148,'298/1天',260.000,'1','3',0,'1','柬埔寨贴纸签',0.965),(149,'1440/7天',1000.000,'1','1',0,'1','菲律宾半年多次签证',0.965),(150,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(151,'298/1天',260.000,'1','3',0,'1','柬埔寨贴纸签',0.965),(152,'1440/7天',1000.000,'1','1',0,'1','菲律宾半年多次签证',0.965),(153,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(154,'1440/7天',1000.000,'1','1',0,'1','菲律宾半年多次签证',0.965),(155,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(156,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(157,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(158,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(159,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(160,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(161,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(162,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(163,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(164,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(165,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(166,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(167,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(168,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(169,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(170,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(171,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(172,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(173,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(174,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(175,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(176,'298/1天',260.000,'1','3',0,'1','柬埔寨贴纸签',0.965),(177,'1440/7天',1000.000,'1','1',0,'1','菲律宾半年多次签证',0.965),(178,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965),(179,'298/1天',260.000,'1','3',0,'1','柬埔寨贴纸签',0.965),(180,'358/3小时',242.000,'1','3',0,'1','柬埔寨电子签',0.965);
/*!40000 ALTER TABLE `yii2_snapshot` ENABLE KEYS */;
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
) ENGINE=InnoDB AUTO_INCREMENT=161 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `yii2_transator`
--

LOCK TABLES `yii2_transator` WRITE;
/*!40000 ALTER TABLE `yii2_transator` DISABLE KEYS */;
INSERT INTO `yii2_transator` VALUES (74,'张旭','1','','','','1',1516430261,0,''),(75,'黄晓霞','','','','','1',1516434366,0,''),(76,'杨杰','1','','','','0',1516435299,0,'故事'),(78,'龚韵佳','1','','','','0',1516859011,0,''),(79,'徐鼎黄','1','','','','0',1516859021,0,''),(80,'张慧','1','','','','0',1516859434,0,''),(81,'王凯','1','','','','0',1516859823,0,''),(82,'廖晨羽','1','','','','0',1516859833,0,''),(83,'吴勇霖','1','','','','0',1516859844,0,''),(84,'于通海','1','','','','0',1516859851,0,''),(85,'侯东彤','1','','','','0',1516859858,0,''),(86,'王炜玥','1','','','','0',1516859865,0,''),(87,'郭宜亮','1','','','','0',1516859874,0,''),(88,'林智威','1','','','','0',1516859883,0,''),(89,'郑嘉炜','1','','','','0',1516860019,0,''),(90,'许晓玲','1','','','','0',1516860026,0,''),(91,'刘仁','1','','','','0',1516860036,0,''),(93,'龙骏骅','1','','','','0',1517049039,0,'父亲：\n母亲：\n入境口岸'),(94,'卢麒宇','1','','','','0',1517638878,0,''),(95,'谈文婷','1','','','','0',1517639193,0,''),(96,'闸志欣','1','','','','0',1517715260,0,''),(97,'汤委静','1','','','','0',1517715441,0,''),(98,'潘凤英','1','','','','0',1517715609,0,''),(99,'林松平','1','','','','0',1517715616,0,''),(100,'林滨蔚','1','','','','0',1517715623,0,''),(101,'未知名','1','','','','0',1517715711,0,''),(102,'未知名2','1','','','','0',1517715719,0,''),(103,'王洁琼','1','','','','0',1517715791,0,''),(104,'陈凯','1','','','','0',1517715798,0,''),(105,'陈韵如','1','','','','0',1517715805,0,''),(106,'陈美如','1','','','','0',1517715810,0,''),(107,'赵春旭','1','','','','0',1517716001,0,''),(108,'赵宁','1','','','','0',1517716007,0,''),(109,'邢阳涛','1','','','','0',1517716013,0,''),(110,'宋伟','1','','','','0',1517716019,0,''),(111,'马学鹏','1','','','','0',1517716026,0,''),(112,'肖震','1','','','','0',1517716031,0,''),(113,'谢春奇','1','','','','0',1517716038,0,''),(114,'冯靖怡','1','','','','0',1517716187,0,''),(115,'李德贤','1','','','','0',1517716194,0,''),(116,'李丽君','1','','','','0',1517716397,0,''),(117,'孙永健','1','','','','0',1517716407,0,''),(118,'帅莎','1','','','','0',1517716552,0,''),(119,'文杨','1','','','','0',1517716757,0,'入境：卡利博'),(120,'苏嘉莉','1','','','','0',1517716845,0,''),(121,'张琳烨','1','','','','0',1517716923,0,''),(122,'王晓燕','1','','','','0',1517717008,0,''),(123,'张雪霞','1','','','','0',1517717077,0,''),(124,'郭依婷 ','1','','','','0',1517717174,0,''),(125,'刘阳婕','1','','','','0',1517717271,0,'入境：宿务'),(126,'胡尧','1','','','','0',1517717353,0,''),(127,'周尤加','1','','','','0',1517717467,0,''),(128,'陈杰平','1','','','','0',1517717559,0,''),(129,'余晓琪','1','','','','0',1517717565,0,''),(130,'陈范','1','','','','0',1517717859,0,''),(131,'陈波','1','','','','0',1517717864,0,''),(132,'李欢','1','','','','0',1517717871,0,''),(133,'黄靖','1','','','','0',1517717876,0,''),(134,'郑腾','1','','','','0',1517717882,0,''),(135,'徐晓彪','1','','','','0',1517718049,0,''),(136,'徐梅','1','','','','0',1517718055,0,''),(137,'张劲松','1','','','','0',1517718164,0,''),(138,'李明姝','1','','','','0',1517718169,0,''),(139,'张李云疆','1','','','','0',1517718174,0,''),(140,'林水湖','1','','','','0',1517718224,0,''),(141,'万建平','1','','','','0',1517718230,0,''),(142,'吴汉平','1','','','','0',1517718235,0,''),(143,'張嘉元','1','','','','0',1517718417,0,''),(144,'俞冰欣','1','','','','0',1517718473,0,''),(145,'王惠','1','','','','0',1517718530,0,''),(146,'王柯淇','1','','','','0',1517718536,0,''),(147,'陆艳','1','','','','0',1517718540,0,''),(148,'史菊梅','1','','','','0',1517718608,0,''),(149,'刘承俞','1','','','','0',1517718613,0,''),(150,'郑英','1','','','','0',1517718669,0,''),(151,'李凌菲','1','','','','0',1517718674,0,''),(152,'陈传富','1','','','','0',1517718679,0,''),(153,'徐取萍','1','','','','0',1517718737,0,''),(154,'徐东碧','1','','','','0',1517718742,0,''),(155,'徐昆祥','1','','','','0',1517718749,0,''),(156,'徐进兴','1','','','','0',1517718757,0,''),(157,'王登民','1','','','','0',1517718763,0,''),(158,'王四围','1','','','','0',1517718771,0,''),(159,'王枪连','1','','','','0',1517718781,0,'王枪连缺身份证'),(160,'许青峰','1','','','','0',1517972053,0,'');
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

-- Dump completed on 2018-02-08  9:23:04
