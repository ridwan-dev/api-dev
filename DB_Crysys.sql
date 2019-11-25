# ************************************************************
# Sequel Pro SQL dump
# Version 4541
#
# http://www.sequelpro.com/
# https://github.com/sequelpro/sequelpro
#
# Host: 127.0.0.1 (MySQL 5.6.37)
# Database: crisys
# Generation Time: 2018-02-18 01:56:26 +0000
# ************************************************************


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;


# Dump of table app_coral
# ------------------------------------------------------------

DROP TABLE IF EXISTS `app_coral`;

CREATE TABLE `app_coral` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `id_mst_area` int(11) NOT NULL,
  `year` year(4) NOT NULL,
  `excellent` double(5,2) NOT NULL,
  `good` double(5,2) NOT NULL,
  `fair` double(5,2) NOT NULL,
  `poor` double(5,2) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

LOCK TABLES `app_coral` WRITE;
/*!40000 ALTER TABLE `app_coral` DISABLE KEYS */;

INSERT INTO `app_coral` (`id`, `id_mst_area`, `year`, `excellent`, `good`, `fair`, `poor`)
VALUES
	(3,0,'2009',31.45,37.10,25.89,5.56),
	(5,0,'2010',30.82,37.21,26.72,5.44),
	(6,0,'2011',30.76,36.90,26.95,5.58),
	(7,0,'2012',30.75,34.33,29.56,5.36),
	(8,0,'2013',29.93,37.00,27.66,5.41),
	(9,0,'2014',30.07,37.42,27.20,5.32),
	(10,1,'2009',32.66,34.01,27.48,5.86),
	(11,1,'2010',30.80,34.39,29.11,5.70),
	(12,1,'2011',31.52,34.03,28.81,5.64),
	(13,1,'2012',30.75,34.33,29.56,5.36),
	(14,1,'2013',30.45,33.99,30.06,5.50),
	(15,1,'2014',30.22,35.26,29.29,5.22),
	(16,2,'2009',40.69,34.48,19.31,5.52),
	(17,2,'2010',40.07,34.68,19.87,5.39),
	(18,2,'2011',39.34,34.43,20.98,5.25),
	(19,2,'2012',39.25,34.58,21.18,4.98),
	(20,2,'2013',39.25,34.58,21.18,4.98),
	(21,2,'2014',39.25,34.58,21.18,4.98);

/*!40000 ALTER TABLE `app_coral` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_apicustom
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_apicustom`;

CREATE TABLE `cms_apicustom` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `permalink` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tabel` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `aksi` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kolom` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `orderby` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sub_query_1` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sql_where` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nama` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `keterangan` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameter` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `method_type` varchar(25) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parameters` longtext COLLATE utf8mb4_unicode_ci,
  `responses` longtext COLLATE utf8mb4_unicode_ci,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cms_apikey
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_apikey`;

CREATE TABLE `cms_apikey` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `screetkey` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `hit` int(11) DEFAULT NULL,
  `status` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'active',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cms_dashboard
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_dashboard`;

CREATE TABLE `cms_dashboard` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cms_email_queues
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_email_queues`;

CREATE TABLE `cms_email_queues` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `send_at` datetime DEFAULT NULL,
  `email_recipient` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_content` text COLLATE utf8mb4_unicode_ci,
  `email_attachments` text COLLATE utf8mb4_unicode_ci,
  `is_sent` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cms_email_templates
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_email_templates`;

CREATE TABLE `cms_email_templates` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `subject` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` longtext COLLATE utf8mb4_unicode_ci,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `from_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `cc_email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cms_email_templates` WRITE;
/*!40000 ALTER TABLE `cms_email_templates` DISABLE KEYS */;

INSERT INTO `cms_email_templates` (`id`, `name`, `slug`, `subject`, `content`, `description`, `from_name`, `from_email`, `cc_email`, `created_at`, `updated_at`)
VALUES
	(1,'Email Template Forgot Password Backend','forgot_password_backend',NULL,'<p>Hi,</p><p>Someone requested forgot password, here is your new password : </p><p>[password]</p><p><br></p><p>--</p><p>Regards,</p><p>Admin</p>','[password]','System','system@crudbooster.com',NULL,'2017-12-17 22:41:32',NULL);

/*!40000 ALTER TABLE `cms_email_templates` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_logs
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_logs`;

CREATE TABLE `cms_logs` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ipaddress` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `useragent` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `description` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `details` text COLLATE utf8mb4_unicode_ci,
  `id_cms_users` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cms_logs` WRITE;
/*!40000 ALTER TABLE `cms_logs` DISABLE KEYS */;

INSERT INTO `cms_logs` (`id`, `ipaddress`, `useragent`, `url`, `description`, `details`, `id_cms_users`, `created_at`, `updated_at`)
VALUES
	(1,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_2) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.84 Safari/537.36','http://loccrisys.com/admin/login','admin@crudbooster.com login with IP Address 127.0.0.1','',1,'2018-01-03 02:15:26',NULL),
	(2,'127.0.0.1','Mozilla/5.0 (Macintosh; Intel Mac OS X 10_13_3) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/63.0.3239.132 Safari/537.36','http://loccrisys.com/admin/login','admin@crudbooster.com login with IP Address 127.0.0.1','',1,'2018-02-11 08:33:36',NULL);

/*!40000 ALTER TABLE `cms_logs` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_menus
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_menus`;

CREATE TABLE `cms_menus` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'url',
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `parent_id` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT '1',
  `is_dashboard` tinyint(1) NOT NULL DEFAULT '0',
  `id_cms_privileges` int(11) DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cms_menus` WRITE;
/*!40000 ALTER TABLE `cms_menus` DISABLE KEYS */;

INSERT INTO `cms_menus` (`id`, `name`, `type`, `path`, `color`, `icon`, `parent_id`, `is_active`, `is_dashboard`, `id_cms_privileges`, `sorting`, `created_at`, `updated_at`)
VALUES
	(1,'TerumbuKarang','Route','AdminTerumbukarangControllerGetIndex',NULL,'fa fa-barcode',0,1,0,1,1,'2018-02-11 08:34:03',NULL);

/*!40000 ALTER TABLE `cms_menus` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_menus_privileges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_menus_privileges`;

CREATE TABLE `cms_menus_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_menus` int(11) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cms_menus_privileges` WRITE;
/*!40000 ALTER TABLE `cms_menus_privileges` DISABLE KEYS */;

INSERT INTO `cms_menus_privileges` (`id`, `id_cms_menus`, `id_cms_privileges`)
VALUES
	(1,1,1);

/*!40000 ALTER TABLE `cms_menus_privileges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_moduls
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_moduls`;

CREATE TABLE `cms_moduls` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `path` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `table_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `controller` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_protected` tinyint(1) NOT NULL DEFAULT '0',
  `is_active` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cms_moduls` WRITE;
/*!40000 ALTER TABLE `cms_moduls` DISABLE KEYS */;

INSERT INTO `cms_moduls` (`id`, `name`, `icon`, `path`, `table_name`, `controller`, `is_protected`, `is_active`, `created_at`, `updated_at`, `deleted_at`)
VALUES
	(1,'Notifications','fa fa-cog','notifications','cms_notifications','NotificationsController',1,1,'2017-12-17 22:41:32',NULL,NULL),
	(2,'Privileges','fa fa-cog','privileges','cms_privileges','PrivilegesController',1,1,'2017-12-17 22:41:32',NULL,NULL),
	(3,'Privileges Roles','fa fa-cog','privileges_roles','cms_privileges_roles','PrivilegesRolesController',1,1,'2017-12-17 22:41:32',NULL,NULL),
	(4,'Users Management','fa fa-users','users','cms_users','AdminCmsUsersController',0,1,'2017-12-17 22:41:32',NULL,NULL),
	(5,'Settings','fa fa-cog','settings','cms_settings','SettingsController',1,1,'2017-12-17 22:41:32',NULL,NULL),
	(6,'Module Generator','fa fa-database','module_generator','cms_moduls','ModulsController',1,1,'2017-12-17 22:41:32',NULL,NULL),
	(7,'Menu Management','fa fa-bars','menu_management','cms_menus','MenusController',1,1,'2017-12-17 22:41:32',NULL,NULL),
	(8,'Email Templates','fa fa-envelope-o','email_templates','cms_email_templates','EmailTemplatesController',1,1,'2017-12-17 22:41:32',NULL,NULL),
	(9,'Statistic Builder','fa fa-dashboard','statistic_builder','cms_statistics','StatisticBuilderController',1,1,'2017-12-17 22:41:32',NULL,NULL),
	(10,'API Generator','fa fa-cloud-download','api_generator','','ApiCustomController',1,1,'2017-12-17 22:41:32',NULL,NULL),
	(11,'Log User Access','fa fa-flag-o','logs','cms_logs','LogsController',1,1,'2017-12-17 22:41:32',NULL,NULL),
	(12,'TerumbuKarang','fa fa-barcode','terumbukarang','terumbukarang','AdminTerumbukarangController',0,0,'2018-02-11 08:34:03',NULL,NULL);

/*!40000 ALTER TABLE `cms_moduls` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_notifications
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_notifications`;

CREATE TABLE `cms_notifications` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_users` int(11) DEFAULT NULL,
  `content` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `url` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cms_privileges
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_privileges`;

CREATE TABLE `cms_privileges` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `is_superadmin` tinyint(1) DEFAULT NULL,
  `theme_color` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cms_privileges` WRITE;
/*!40000 ALTER TABLE `cms_privileges` DISABLE KEYS */;

INSERT INTO `cms_privileges` (`id`, `name`, `is_superadmin`, `theme_color`, `created_at`, `updated_at`)
VALUES
	(1,'Super Administrator',1,'skin-red','2017-12-17 22:41:32',NULL);

/*!40000 ALTER TABLE `cms_privileges` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_privileges_roles
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_privileges_roles`;

CREATE TABLE `cms_privileges_roles` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `is_visible` tinyint(1) DEFAULT NULL,
  `is_create` tinyint(1) DEFAULT NULL,
  `is_read` tinyint(1) DEFAULT NULL,
  `is_edit` tinyint(1) DEFAULT NULL,
  `is_delete` tinyint(1) DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `id_cms_moduls` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cms_privileges_roles` WRITE;
/*!40000 ALTER TABLE `cms_privileges_roles` DISABLE KEYS */;

INSERT INTO `cms_privileges_roles` (`id`, `is_visible`, `is_create`, `is_read`, `is_edit`, `is_delete`, `id_cms_privileges`, `id_cms_moduls`, `created_at`, `updated_at`)
VALUES
	(1,1,0,0,0,0,1,1,'2017-12-17 22:41:32',NULL),
	(2,1,1,1,1,1,1,2,'2017-12-17 22:41:32',NULL),
	(3,0,1,1,1,1,1,3,'2017-12-17 22:41:32',NULL),
	(4,1,1,1,1,1,1,4,'2017-12-17 22:41:32',NULL),
	(5,1,1,1,1,1,1,5,'2017-12-17 22:41:32',NULL),
	(6,1,1,1,1,1,1,6,'2017-12-17 22:41:32',NULL),
	(7,1,1,1,1,1,1,7,'2017-12-17 22:41:32',NULL),
	(8,1,1,1,1,1,1,8,'2017-12-17 22:41:32',NULL),
	(9,1,1,1,1,1,1,9,'2017-12-17 22:41:32',NULL),
	(10,1,1,1,1,1,1,10,'2017-12-17 22:41:32',NULL),
	(11,1,0,1,0,1,1,11,'2017-12-17 22:41:32',NULL),
	(12,1,1,1,1,1,1,12,NULL,NULL);

/*!40000 ALTER TABLE `cms_privileges_roles` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_settings
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_settings`;

CREATE TABLE `cms_settings` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci,
  `content_input_type` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dataenum` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `helper` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `group_setting` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `label` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cms_settings` WRITE;
/*!40000 ALTER TABLE `cms_settings` DISABLE KEYS */;

INSERT INTO `cms_settings` (`id`, `name`, `content`, `content_input_type`, `dataenum`, `helper`, `created_at`, `updated_at`, `group_setting`, `label`)
VALUES
	(1,'login_background_color',NULL,'text',NULL,'Input hexacode','2017-12-17 22:41:32',NULL,'Login Register Style','Login Background Color'),
	(2,'login_font_color',NULL,'text',NULL,'Input hexacode','2017-12-17 22:41:32',NULL,'Login Register Style','Login Font Color'),
	(3,'login_background_image',NULL,'upload_image',NULL,NULL,'2017-12-17 22:41:32',NULL,'Login Register Style','Login Background Image'),
	(4,'email_sender','support@crudbooster.com','text',NULL,NULL,'2017-12-17 22:41:32',NULL,'Email Setting','Email Sender'),
	(5,'smtp_driver','mail','select','smtp,mail,sendmail',NULL,'2017-12-17 22:41:32',NULL,'Email Setting','Mail Driver'),
	(6,'smtp_host','','text',NULL,NULL,'2017-12-17 22:41:32',NULL,'Email Setting','SMTP Host'),
	(7,'smtp_port','25','text',NULL,'default 25','2017-12-17 22:41:32',NULL,'Email Setting','SMTP Port'),
	(8,'smtp_username','','text',NULL,NULL,'2017-12-17 22:41:32',NULL,'Email Setting','SMTP Username'),
	(9,'smtp_password','','text',NULL,NULL,'2017-12-17 22:41:32',NULL,'Email Setting','SMTP Password'),
	(10,'appname','CRUDBooster','text',NULL,NULL,'2017-12-17 22:41:32',NULL,'Application Setting','Application Name'),
	(11,'default_paper_size','Legal','text',NULL,'Paper size, ex : A4, Legal, etc','2017-12-17 22:41:32',NULL,'Application Setting','Default Paper Print Size'),
	(12,'logo','','upload_image',NULL,NULL,'2017-12-17 22:41:32',NULL,'Application Setting','Logo'),
	(13,'favicon','','upload_image',NULL,NULL,'2017-12-17 22:41:32',NULL,'Application Setting','Favicon'),
	(14,'api_debug_mode','true','select','true,false',NULL,'2017-12-17 22:41:32',NULL,'Application Setting','API Debug Mode'),
	(15,'google_api_key','','text',NULL,NULL,'2017-12-17 22:41:32',NULL,'Application Setting','Google API Key'),
	(16,'google_fcm_key','','text',NULL,NULL,'2017-12-17 22:41:32',NULL,'Application Setting','Google FCM Key');

/*!40000 ALTER TABLE `cms_settings` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table cms_statistic_components
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_statistic_components`;

CREATE TABLE `cms_statistic_components` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `id_cms_statistics` int(11) DEFAULT NULL,
  `componentID` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `component_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `area_name` varchar(55) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sorting` int(11) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `config` longtext COLLATE utf8mb4_unicode_ci,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cms_statistics
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_statistics`;

CREATE TABLE `cms_statistics` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `slug` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;



# Dump of table cms_users
# ------------------------------------------------------------

DROP TABLE IF EXISTS `cms_users`;

CREATE TABLE `cms_users` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `photo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `id_cms_privileges` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `status` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `cms_users` WRITE;
/*!40000 ALTER TABLE `cms_users` DISABLE KEYS */;

INSERT INTO `cms_users` (`id`, `name`, `photo`, `email`, `password`, `id_cms_privileges`, `created_at`, `updated_at`, `status`)
VALUES
	(1,'Super Admin',NULL,'admin@crudbooster.com','$2y$10$pvToTuo89tV7o8IV7eFNZ.TKQU2JIDv/QkkTw0dD0TW4cp4H5Szkm',1,'2017-12-17 22:41:32',NULL,'Active');

/*!40000 ALTER TABLE `cms_users` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table migrations
# ------------------------------------------------------------

DROP TABLE IF EXISTS `migrations`;

CREATE TABLE `migrations` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

LOCK TABLES `migrations` WRITE;
/*!40000 ALTER TABLE `migrations` DISABLE KEYS */;

INSERT INTO `migrations` (`id`, `migration`, `batch`)
VALUES
	(1,'2016_08_07_145904_add_table_cms_apicustom',1),
	(2,'2016_08_07_150834_add_table_cms_dashboard',1),
	(3,'2016_08_07_151210_add_table_cms_logs',1),
	(4,'2016_08_07_151211_add_details_cms_logs',1),
	(5,'2016_08_07_152014_add_table_cms_privileges',1),
	(6,'2016_08_07_152214_add_table_cms_privileges_roles',1),
	(7,'2016_08_07_152320_add_table_cms_settings',1),
	(8,'2016_08_07_152421_add_table_cms_users',1),
	(9,'2016_08_07_154624_add_table_cms_menus_privileges',1),
	(10,'2016_08_07_154624_add_table_cms_moduls',1),
	(11,'2016_08_17_225409_add_status_cms_users',1),
	(12,'2016_08_20_125418_add_table_cms_notifications',1),
	(13,'2016_09_04_033706_add_table_cms_email_queues',1),
	(14,'2016_09_16_035347_add_group_setting',1),
	(15,'2016_09_16_045425_add_label_setting',1),
	(16,'2016_09_17_104728_create_nullable_cms_apicustom',1),
	(17,'2016_10_01_141740_add_method_type_apicustom',1),
	(18,'2016_10_01_141846_add_parameters_apicustom',1),
	(19,'2016_10_01_141934_add_responses_apicustom',1),
	(20,'2016_10_01_144826_add_table_apikey',1),
	(21,'2016_11_14_141657_create_cms_menus',1),
	(22,'2016_11_15_132350_create_cms_email_templates',1),
	(23,'2016_11_15_190410_create_cms_statistics',1),
	(24,'2016_11_17_102740_create_cms_statistic_components',1),
	(25,'2017_06_06_164501_add_deleted_at_cms_moduls',1);

/*!40000 ALTER TABLE `migrations` ENABLE KEYS */;
UNLOCK TABLES;


# Dump of table terumbukarang
# ------------------------------------------------------------

DROP TABLE IF EXISTS `terumbukarang`;

CREATE TABLE `terumbukarang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `location` varchar(250) COLLATE utf8_bin DEFAULT NULL,
  `kabupaten` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `provinsi` varchar(200) COLLATE utf8_bin DEFAULT NULL,
  `station` varchar(100) COLLATE utf8_bin DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `lng` double DEFAULT NULL,
  `lat` double DEFAULT NULL,
  `hc` double DEFAULT NULL,
  `ac` double DEFAULT NULL,
  `nac` double DEFAULT NULL,
  `dc` double DEFAULT NULL,
  `dca` double DEFAULT NULL,
  `sc` double DEFAULT NULL,
  `sp` double DEFAULT NULL,
  `fs` double DEFAULT NULL,
  `ot` double DEFAULT NULL,
  `r` double DEFAULT NULL,
  `s` double DEFAULT NULL,
  `si` double DEFAULT NULL,
  `rk` double DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

LOCK TABLES `terumbukarang` WRITE;
/*!40000 ALTER TABLE `terumbukarang` DISABLE KEYS */;

INSERT INTO `terumbukarang` (`id`, `location`, `kabupaten`, `provinsi`, `station`, `year`, `lng`, `lat`, `hc`, `ac`, `nac`, `dc`, `dca`, `sc`, `sp`, `fs`, `ot`, `r`, `s`, `si`, `rk`)
VALUES
	(1,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433031',2016,98.785277,1.692573,12.07,0,12.07,2.8,55.07,0,0.33,0,0.2,0,29.53,0,0),
	(2,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433032',2016,98.830442,1.653726,6.93,0.2,6.73,4.6,52.27,0,0,0,0.53,0,35.67,0,0),
	(3,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433033',2016,98.806917,1.6043,37.02,0,37.02,5.87,46.03,0,1.13,1,0.8,0,8.14,0,0),
	(4,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433034',2016,98.77037,1.57729,53.6,0,53.6,6.53,34.4,0.93,0.27,0,0.07,0,4.2,0,0),
	(5,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433035',2016,98.74054,1.56023,13.2,0,13.2,2.4,54.8,0.07,10.27,0,0.6,0,18.67,0,0),
	(6,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433036',2016,98.720712,1.578241,21.87,0.8,21.07,1.8,57.87,0.07,1.93,0,0.07,0,16.4,0,0),
	(7,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433037',2016,98.58355,1.57862,7.47,1.07,6.4,0.53,74.67,0,1.07,0,0,0,16.27,0,0),
	(8,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433038',2016,98.585057,1.599388,11.87,0.13,11.73,1,52.2,0,7.6,2.27,1,1.07,23,0,0),
	(9,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433039',2016,98.601795,1.615246,15.53,1.33,14.2,2.4,61.93,2.33,5.73,0.07,0.2,0,11.8,0,0),
	(10,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433130',2016,98.59658,1.6405,17.16,0,17.16,0.6,50.07,0,6.14,0.13,0.13,0,25.77,0,0),
	(11,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433131',2016,98.56925,1.67143,26.08,0.8,25.28,2.94,57.77,0,5.47,3.94,0.93,0,2.87,0,0),
	(12,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433132',2016,98.51383,1.65323,8.53,0,8.53,2.67,72.67,0,10.4,0,1.73,1.93,2.07,0,0),
	(13,X'546170616E756C692054656E676168',X'546170616E756C692054656E676168',X'53756D61747261205574617261',X'545054433133',2016,98.48065,1.70312,13.34,0.13,13.21,5.74,70.65,0,2,0,2.47,0.6,5.2,0,0),
	(14,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E4941433031',2016,97.36205,1.5374,17.6,0.07,17.53,0.07,31.33,0,1.13,0.07,0.07,39.2,10.53,0,0),
	(15,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E4941433032',2016,97.38602,1.5172,5.53,0,5.53,0,18.07,0.27,0.47,0.33,0,71.4,3.93,0,0),
	(16,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E4941433033',2016,97.4255,1.51135,10.47,0.27,10.2,0.07,35.33,0,2.53,46.33,0.33,3.87,1.07,0,0),
	(17,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E4941433034',2016,97.24292,1.45737,21.93,0.33,21.6,0.13,37.93,0,3.53,0,1.07,11.47,23.93,0,0),
	(18,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E4941433035',2016,97.21158,1.42407,23.13,0,23.13,0.27,67.87,0,3.6,0,0,2.87,2.27,0,0),
	(19,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E4941433036',2016,97.17743,1.41063,16.47,0,16.47,0,30.13,0,6.53,0,0.2,1.8,44.87,0,0),
	(20,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E4941433037',2016,97.15015,1.425,11.2,0,16.47,0,64.73,0,0.53,0.07,0,8.6,14.87,0,0),
	(21,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E4941433038',2016,97.11943,1.43158,4.2,0,11.2,0,82.73,0.07,2.13,0.33,0.2,7.73,2.6,0,0),
	(22,X'4B4B504E20545750204B65702E2050696568',X'4B4B504E20545750204B65702E2050696568',X'53756D61747261204261726174',X'504945433031',2014,100.2071,-0.87447,13,2.73,23.77,0.13,36.87,0,0.53,0,25.07,22.93,1.47,0,0),
	(23,X'4B4B504E20545750204B65702E2050696568',X'4B4B504E20545750204B65702E2050696568',X'53756D61747261204261726174',X'504945433032',2014,100.2055,-0.87712,44.93,3.97,56.43,0.8,52.87,0,0,0,0.13,1.2,0.07,0,0),
	(24,X'4B4B504E20545750204B65702E2050696568',X'4B4B504E20545750204B65702E2050696568',X'53756D61747261204261726174',X'504945433035',2014,99.99798,-0.76492,38.2,14.2,38.2,0.07,53.07,0,1.13,0,0,4.67,2.87,0,0),
	(25,X'4B4B504E20545750204B65702E2050696568',X'4B4B504E20545750204B65702E2050696568',X'53756D61747261204261726174',X'504945433037',2014,99.99917,-0.76153,56.73,0,86.3,0,11,0,0,0,0,30.73,1.53,0,0),
	(26,X'4B4B504E20545750204B65702E2050696568',X'4B4B504E20545750204B65702E2050696568',X'53756D61747261204261726174',X'504945433131',2014,100.1026,-0.87448,74.2,4.63,74.57,0,24.87,0,0.33,0,0,0.2,0.4,0,0),
	(27,X'4B4B504E20545750204B65702E2050696568',X'4B4B504E20545750204B65702E2050696568',X'53756D61747261204261726174',X'504945433132',2014,100.1001,-0.87742,38.36,1.93,52.83,0.27,49.1,0.07,0,0,0.07,12.01,0.13,0,0),
	(28,X'4B4B504E20545750204B65702E2050696568',X'4B4B504E20545750204B65702E2050696568',X'53756D61747261204261726174',X'504945433134',2014,100.1428,-0.94883,54.5,2.53,50.6,0.73,35.69,0,1.13,0,0,6.87,1.07,0,0),
	(29,X'4B4B504E20545750204B65702E2050696568',X'4B4B504E20545750204B65702E2050696568',X'53756D61747261204261726174',X'504945433136',2014,100.1411,-0.95263,57.67,2.27,64.27,1.93,29.4,0,0,0,0,10.67,0.33,0,0),
	(30,X'4B4B504E20545750204B65702E2050696568',X'4B4B504E20545750204B65702E2050696568',X'53756D61747261204261726174',X'504945433137',2014,100.1713,-1.03358,25.4,1.83,16.4,0.07,45.53,0.2,0.07,0,0,27.27,1.47,0,0),
	(31,X'4B4B504E20545750204B65702E2050696568',X'4B4B504E20545750204B65702E2050696568',X'53756D61747261204261726174',X'504945433230',2014,100.1771,-1.0376,15.13,9.93,17.2,0.07,19.67,0,0,0,0.07,55,0,10.07,0),
	(32,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433031',2016,99.57481,-2.00214,14.13,NULL,NULL,3.8,28.8,0,31.27,0.27,0.6,8.47,11.33,1.33,0),
	(33,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433032',2016,99.5778,-2.025,3.6,NULL,NULL,4.8,65.4,0.8,11.13,0,0,5.07,8.33,0.87,0),
	(34,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433033',2016,99.59967,-1.98093,13.2,NULL,NULL,6.6,76.27,0.13,1.53,0,0.53,0.53,1.07,0.13,0),
	(35,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433034',2016,99.54128,-2.14322,29.07,NULL,NULL,5.33,42.4,0,0.6,0,0.2,0.93,10.27,11.2,0),
	(36,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433035',2016,99.537,-2.133,43.13,NULL,NULL,16.67,25.73,5.73,2.73,0,5.93,0,0,0.07,0),
	(37,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433036',2016,99.3011,-1.69577,4.27,NULL,NULL,4.2,72.6,0,0,0.27,0,4.2,3.73,10.73,0),
	(38,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433037',2016,99.27022,-1.75085,52.37,NULL,NULL,1.2,38.83,0.13,0.53,0.2,0.33,2.67,0.53,3.2,0),
	(39,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433038',2016,99.2915,-1.81112,1.67,NULL,NULL,0.4,59.8,0,0.67,0,9.93,2.73,7.33,17.47,0),
	(40,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433039',2016,99.28552,-1.87213,2.4,NULL,NULL,2.47,62.47,0.07,1.07,0.13,0.4,8.47,17.13,5.4,0),
	(41,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433031',2016,105.73872,-5.89067,27.2,NULL,NULL,1.2,25.33,0.87,0,27.33,3.87,0,13.73,0.47,0),
	(42,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433032',2016,105.75056,-5.89632,33.2,NULL,NULL,0.27,23.33,7.33,30.8,0,0.6,4.07,0,0.4,0),
	(43,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433033',2016,105.75761,-5.89588,5.93,NULL,NULL,0.53,45.07,42.4,0.53,0.07,0.47,0,0,5,0),
	(44,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433034',2016,105.76042,-5.88226,9.67,NULL,NULL,1.53,7.13,33.27,0,0,0,6.6,0.33,41.47,0),
	(45,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433035',2016,105.77924,-5.88685,10.33,NULL,NULL,0,47.2,18.4,1.53,0.87,0.13,4.07,16.67,0.8,0),
	(46,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433036',2016,105.78759,-5.86455,52.53,NULL,NULL,0.07,29.13,0.47,10.93,0,0.07,1.93,0,4.87,0),
	(47,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433037',2016,105.79197,-5.85277,29.47,NULL,NULL,0.93,65.53,1.07,1.8,0,0.07,0.33,0,0.8,0),
	(48,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433038',2016,105.78262,-5.84845,58.07,NULL,NULL,0.13,10.73,0,27.93,0,0.47,0,0,2.67,0),
	(49,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433039',2016,105.77309,-5.85987,30.6,NULL,NULL,2.67,63.87,1.27,0.07,0.2,0.87,0,0,0.47,0),
	(50,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433130',2016,105.77552,-5.84683,2.6,NULL,NULL,0.33,92,0.2,0.13,0,0.33,0.2,0.07,4.13,0),
	(51,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433031',2016,107.68881,-2.53838,54.07,3.27,50.8,0.87,38.6,0.53,1.33,0,2.73,0.4,0.73,0.73,0),
	(52,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433032',2016,107.61889,-2.53934,71.53,1.53,70,0.2,26.93,0.2,0.4,0.07,0.6,0,0.07,0,0),
	(53,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433033',2016,107.40159,-2.94477,38.73,0.13,38.6,0.07,58.93,0,0.73,0,0,0.07,0,1.47,0),
	(54,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433034',2016,107.35224,-2.89315,45.47,2.8,42.67,1.87,50.27,0,0.87,0,0.27,0,0,1.27,0),
	(55,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433035',2016,107.34876,-2.87579,27.4,1.67,25.73,0.87,63.47,0.27,2.6,1.6,0.4,1.87,0.8,0.73,0),
	(56,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433036',2016,107.37099,-2.82678,31,2.33,28.67,1.07,63.2,0,0.8,0.33,1.2,0.67,0.73,1,0),
	(57,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433037',2016,107.49645,-2.81713,20.67,0,20.67,0.93,70.93,2.2,4,0,1.2,0,0,0.07,0),
	(58,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433038',2016,107.49175,-2.87862,10.41,0,10.41,0.33,53.57,0.27,2.4,0,1.47,8.61,16.48,6.47,0),
	(59,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433039',2016,107.4721,-2.92386,32.33,0.33,32,0.47,58.07,0.13,2.53,0.07,1.4,1.67,1.6,1.73,0),
	(60,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433130',2016,107.48239,-2.94733,24.47,0.13,24.34,0.47,67.2,0.8,0.6,0,2.13,2.07,0.27,2,0),
	(61,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433131',2016,107.49555,-2.96661,34.33,0,34.33,0.2,50.67,0.07,2.33,2.73,0.67,2.4,0.27,6.33,0),
	(62,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3031',2016,104.2212,0.5357,56.33,0,56.33,1.4,31.8,0,0.8,0,2.47,3.93,3.27,0,0),
	(63,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3032',2016,104.2403,0.5413,34.53,2.33,32.2,3.2,47,0,0.07,0.13,8.13,5.87,0,1.07,0),
	(64,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3033',2016,104.1893,0.5542,34.07,0,34.07,2.67,41.93,0,0,0.33,6.13,7,7.2,0.67,0),
	(65,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3034',2016,104.1763,0.585,46.2,0,46.2,0.27,27,0,0,0,9,12.47,5.07,0,0),
	(66,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3035',2016,104.202,0.6045,43.8,0,43.8,2.8,45.27,0,0,0.87,1.07,3.87,0.07,2.27,0),
	(67,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3036',2016,104.2242,0.5818,51.27,0.4,50.87,4.47,35.67,0,0,0.2,3,3.67,0,1.73,0),
	(68,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3037',2016,104.1017,0.6297,69,6.07,62.93,1,22.07,0.07,0.13,0,1.67,0.33,2.67,3.07,0),
	(69,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3038',2016,104.0793,0.6452,19.33,0,19.33,0.33,18,0,0,0,0.47,17.2,44.67,0,0),
	(70,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3039',2016,104.0797,0.6175,49.8,0,49.8,1.67,25,0,0.13,0,0.67,6.33,16.4,0,0),
	(71,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3130',2016,104.2923,0.514,64.27,43,21.27,0.53,26.4,0.73,0,0,6.53,1.27,0.27,0,0),
	(72,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3131',2016,104.2637,0.4938,33.27,0.8,32.47,0.47,32.67,0,0.13,0.27,0.93,11,21.27,0,0),
	(73,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3132',2016,104.2838,0.5082,51.27,0.13,51.14,1.07,33.33,0,0,0.07,1.47,7.33,0.2,5.27,0),
	(74,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3433',2016,104.2778,0.7973,21.93,0,21.93,1.87,44.33,0,0.07,12.53,0.87,11.73,0.93,5.73,0),
	(75,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3437',2016,104.3106,0.7106,12.48,0,12.48,1.09,66.74,0,7.29,10.39,0.39,0.08,1.55,0,0),
	(76,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3538',2016,104.3156,0.6895,23.2,0.27,22.93,0,64.87,0,4.8,1.27,0,3.87,0.87,1.13,0),
	(77,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3633',2016,104.3481,0.7407,30.67,0.2,30.47,3.8,57.2,0.47,4.2,2,0.13,0,0,1.53,0),
	(78,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3637',2016,104.3084,0.7655,22.33,0,22.33,0,64,0,1.73,10.13,1,0,0.4,0.4,0),
	(79,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3638',2016,104.3517,0.7113,40.8,0,40.8,12.07,37.4,0.07,2.47,0.73,3.8,0,2.4,0.27,0),
	(80,X'426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3639',2016,104.3716,0.7392,46.87,1.27,45.6,1.27,46.8,0.13,3.4,0.93,0.6,0,0,0,0),
	(81,X'4C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4D4C3039',2016,104.86126,-0.08339,16.67,0,16.67,8.27,0.2,2.27,0,9.33,3.2,4,30.4,0,25.66),
	(82,X'4C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4D4C3130',2016,104.84556,-0.06357,25.87,0.2,25.67,1.53,64.13,0.47,0,0.4,0.27,7.33,0,0,0),
	(83,X'4C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4D4C3132',2016,104.65934,-0.01857,40.07,0,40.07,2.07,54.66,0,0,1.33,0,0,1.87,0,0),
	(84,X'4C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4D4C3233',2016,104.65934,-0.05216,20.27,0,20.27,1,60.66,0,0,0.07,0,0,18,0,0),
	(85,X'4C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4D4C323931',2016,104.9068,-0.12135,45.07,1.87,43.2,5,46.27,1.2,0,0.33,0,1.33,0.8,0,0),
	(86,X'4C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4D4C373035',2016,104.52332,0.06168,37.2,0.2,37,0.87,56.2,0.73,0,0.53,0.2,0.34,3.93,0,0),
	(87,X'4C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4D4C373037',2016,104.51231,0.04197,29.44,4.33,25.11,0.33,62.63,0.4,0,0,0,0,7.2,0,0),
	(88,X'4C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4D4C41',2016,104.7307,0.09963,24.93,0,24.93,4,63.47,1.87,0,4.4,0,0,1.33,0,0),
	(89,X'4C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4D4C42',2016,104.7355,0.08223,30.06,0.13,29.93,1.87,68,0,0,0,0,0,0.07,0,0),
	(90,X'4C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4D4C43',2016,104.7559,0.04852,34.6,0.93,33.67,0.47,63.53,0.4,0,0.2,0,0,0.8,0,0),
	(91,X'4C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4D4C44',2016,104.7775,0.03061,14.47,1.2,13.27,1.73,77,0.2,0,0.33,0.2,0,6.07,0,0),
	(92,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C3133',2016,104.7823,1.022,50.07,24.47,25.6,0.6,39.87,0.67,0.2,0.53,1.73,5.4,0.13,0.8,0),
	(93,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C3134',2016,104.7943,0.983167,28.6,3,25.6,0.93,46.93,0,0.87,0.07,2.93,5.6,9.47,4.6,0),
	(94,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C3135',2016,104.8223,0.9525,43.27,0.67,42.6,0.2,45.66,0,0.4,0,2,1.47,6.47,0.53,0),
	(95,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C3136',2016,104.851,0.973167,30.13,6.27,23.86,0.2,45,0.27,0.13,5.87,3.53,3.67,11.2,0,0),
	(96,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C3137',2016,104.8312,1.015667,32.73,22.13,10.6,0.07,44.73,0,1.4,3.27,11.47,5,1.33,0,0),
	(97,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C3138',2016,104.9233,0.927667,58.4,46.33,12.07,0,39.2,0.07,1.46,0,0.87,0,0,0,0),
	(98,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C3734',2016,104.6426,1.08767,37.07,1,36.07,0.13,54.53,0.53,2.88,0,0.73,0,4,0.13,0),
	(99,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C3737',2016,104.6537,1.05944,42.2,0.47,41.73,0,48.8,0,6.8,0,0.27,0,1.26,0.67,0),
	(100,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C3831',2016,104.6613,1.01452,36.53,0.4,36.13,0,57.93,0.13,3.93,0.13,0.87,0,0,0.48,0),
	(101,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C3835',2016,104.6755,1.0467,27.07,0.67,26.4,0.53,31.13,0,4.8,0.4,1.6,2.54,31.93,0,0),
	(102,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C3930',2016,104.7164,0.79151,43.74,0.13,43.6,0,49.8,0,1.67,0.33,0.8,0.73,1.53,1.4,0),
	(103,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C3932',2016,104.6844,0.7763,30.2,0.8,29.4,0.07,45.6,0,9.8,2.73,0.33,1.2,4.07,6,0),
	(104,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C41',2016,104.7338,0.9437,32.33,5.07,27.26,0,54.67,0,0.87,1.13,6.2,0.2,4.27,0.33,0),
	(105,X'42696E74616E',X'42696E74616E',X'4B65702E2052696175',X'4B52494C4C42',2016,104.7154,0.9216,39.2,0.8,38.42,0,48.94,0,5,0.33,0.33,1.74,2.73,1.73,0),
	(106,X'4B4B504E20545750204B65702E20416E616D626173',X'4B4B504E20545750204B65702E20416E616D626173',X'4B65702E2052696175',X'414E42433031',2015,106.293122,3.20014,56.1,0.53,56.25,0.07,36.33,0,0.14,0,0,1.57,5.79,0,0),
	(107,X'4B4B504E20545750204B65702E20416E616D626173',X'4B4B504E20545750204B65702E20416E616D626173',X'4B65702E2052696175',X'414E42433032',2015,106.295044,3.208858,52.2,0,52.2,0.07,38.47,0,0.27,2.33,0,2.87,3.8,0,0),
	(108,X'4B4B504E20545750204B65702E20416E616D626173',X'4B4B504E20545750204B65702E20416E616D626173',X'4B65702E2052696175',X'414E42433033',2015,106.320679,3.207662,39.47,0.73,38.73,0.27,52.27,0.73,2.2,3,0.47,0.33,1.27,0,0),
	(109,X'4B4B504E20545750204B65702E20416E616D626173',X'4B4B504E20545750204B65702E20416E616D626173',X'4B65702E2052696175',X'414E42433034',2015,106.317941,3.170181,32.65,1.7,30.93,0,41.77,0.2,1.84,5.17,0.07,13.2,5.1,0,0),
	(110,X'4B4B504E20545750204B65702E20416E616D626173',X'4B4B504E20545750204B65702E20416E616D626173',X'4B65702E2052696175',X'414E42433035',2015,106.403987,3.278601,37,5.4,31.6,1.67,38.6,0.07,0.73,0.07,1.07,11.6,9.2,0,0),
	(111,X'4B4B504E20545750204B65702E20416E616D626173',X'4B4B504E20545750204B65702E20416E616D626173',X'4B65702E2052696175',X'414E42433036',2015,106.443211,3.247991,45.13,5.53,39.6,0.2,50.93,0.2,0.27,0,0.33,2.6,0.33,0,0),
	(112,X'4B4B504E20545750204B65702E20416E616D626173',X'4B4B504E20545750204B65702E20416E616D626173',X'4B65702E2052696175',X'414E42433037',2015,106.436827,3.194569,57.6,0.67,56.93,0,33.07,0.4,0.4,0,0.07,7.73,0.73,0,0),
	(113,X'4B4B504E20545750204B65702E20416E616D626173',X'4B4B504E20545750204B65702E20416E616D626173',X'4B65702E2052696175',X'414E42433038',2015,106.432196,3.173306,26.47,2.47,24,0,47.93,0.33,2.13,0,0.53,10.6,12,0,0),
	(114,X'4B4B504E20545750204B65702E20416E616D626173',X'4B4B504E20545750204B65702E20416E616D626173',X'4B65702E2052696175',X'414E42433039',2015,106.394228,3.154904,46.2,1.53,44.67,0,44.2,0.2,0.8,0.27,0.27,6.2,1.87,0,0),
	(115,X'4B4B504E20545750204B65702E20416E616D626173',X'4B4B504E20545750204B65702E20416E616D626173',X'4B65702E2052696175',X'414E42433130',2015,106.380425,3.142847,40.09,4.8,35.29,0.2,42.63,1.27,3.34,0.07,1.67,6.87,3.87,0,0),
	(116,X'4B4B504E20545750204B65702E20416E616D626173',X'4B4B504E20545750204B65702E20416E616D626173',X'4B65702E2052696175',X'414E42433131',2015,106.345085,3.107773,52.33,1.53,50.8,0,37.67,0.07,0.27,1.4,0.07,4.07,4.13,0,0),
	(117,X'4B4B504E20545750204B65702E20416E616D626173',X'4B4B504E20545750204B65702E20416E616D626173',X'4B65702E2052696175',X'414E42433132',2015,106.336625,3.077704,17.27,0.67,16.6,0,44.07,0,0.8,1.87,0.53,32.2,3.27,0,0),
	(118,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3032',2016,108.00321,3.78984,38.61,0.2,38.41,0.33,46.63,0.07,1.73,3.07,0.67,8.82,0,0.07,0),
	(119,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3033',2016,108.07323,3.6876,24.48,7.27,17.21,0.2,45.96,4.74,1.93,0.07,0.2,17.15,5.2,0.07,0),
	(120,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3035',2016,108.07261,3.63147,8.4,0.53,7.87,2.2,34.53,0.2,2.34,0,0.73,37.87,13.73,0,0),
	(121,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3036',2016,108.07939,3.57879,27.13,4.27,22.87,0,29.6,0.13,0.33,0,0.07,40.67,2.07,0,0),
	(122,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3037',2016,108.1063,3.67291,10.21,1.6,8.61,0,45.17,0.13,2.13,0,0,36.09,6.27,0,0),
	(123,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313434',2016,108.4332,3.87179,8.88,0.47,8.41,0,57.94,0.93,4.01,6.68,1.47,18.62,1.47,0,0),
	(124,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313435',2016,108.3756,3.99171,13.87,2.13,11.73,0,52.86,19,2.73,0.6,10.27,0.6,0.07,0,0),
	(125,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313436',2016,108.35718,4.00281,20.73,4.93,15.8,0.2,64.93,0.6,2.13,0.47,2.33,7.68,0.93,0,0),
	(126,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313438',2016,108.30705,4.0599,22.87,2.8,20.07,0,60.73,0.07,1.07,1.07,0.93,5.86,7.4,0,0),
	(127,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C31353241',2016,108.22983,4.22471,21.87,1.13,20.73,0,34,1,31.4,0.47,1.86,8.53,0.87,0,0),
	(128,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313537',2016,108.15382,4.16541,15.93,1.27,14.67,0,37.47,5.73,4.27,0.6,1.2,34,0.73,0.07,0),
	(129,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313539',2016,108.08387,4.11754,30.66,0.87,29.79,0,47.9,3.07,1.8,0.67,0.6,14.96,0.14,0.2,0),
	(130,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313631',2016,108.0258,4.06018,24.7,2.48,22.21,0,45.77,1.74,0.27,17.32,0,6.85,3.35,0,NULL),
	(131,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C41',2016,108.3367,4.04131,26.73,10.53,16.2,0,51.47,0,0,3.2,15.13,1.13,2.34,0,0),
	(132,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C42',2016,108.4243,3.90435,17.34,0.8,16.54,0,42.36,4.4,1.73,0.08,0.87,31.02,2.2,0,0),
	(133,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C44',2016,108.0441,3.79323,21.27,7.27,14,0.13,28.73,1.13,2.27,0,2.2,13.07,30.33,0.87,0),
	(134,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C45',2016,108.0884,3.73033,35.27,1,34.27,0.4,42.4,0.27,0.73,0.4,0.47,17.73,2.33,0,0),
	(135,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C46',2016,108.1154,4.13889,23.88,4.07,19.81,0.2,36.29,18.48,1.2,0.4,0.27,18.48,0.8,0,0),
	(136,X'53656B6F746F6E67204C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433031',2016,115.962089,-8.724016,6.53,3.2,3.33,0.07,55.2,4,4.2,5.33,17.8,4.73,2.07,0,0.07),
	(137,X'53656B6F746F6E67204C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433032',2016,115.928904,-8.730955,23.67,0,23.67,0.37,59.19,0.74,0.25,1.11,6.78,3.08,4.81,0,0),
	(138,X'53656B6F746F6E67204C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433033',2016,115.925946,-8.759481,3.87,0.27,3.6,1.6,43.96,0,5.6,1.4,6.14,2.54,32.62,2.27,0),
	(139,X'53656B6F746F6E67204C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433034',2016,115.933735,-8.748061,8.33,0.67,7.66,0.4,69.27,0,0.27,0.93,4.33,1.27,14.33,0.87,0),
	(140,X'53656B6F746F6E67204C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433035',2016,115.921041,-8.71683,17.93,0.13,17.8,0.47,62.07,0.13,1.8,0.27,7.6,4,5.2,0.53,0),
	(141,X'53656B6F746F6E67204C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433036',2016,115.913807,-8.721092,5.67,4.47,1.2,0,79.8,8.6,0.27,0.07,0.53,1.6,3.47,0,0),
	(142,X'53656B6F746F6E67204C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433037',2016,115.883492,-8.731382,33.2,8.27,24.93,0.13,49.07,0.13,0.13,0,0.33,3.13,13.87,0,0),
	(143,X'53656B6F746F6E67204C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433038',2016,115.899876,-8.723553,29.73,20.13,9.6,0,64.53,0.4,0.07,0,0.87,1.33,3.07,0,0),
	(144,X'53656B6F746F6E67204C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433039',2016,115.898727,-8.745118,24.07,3.67,20.4,0.2,27.47,0.4,0,0,0.2,32.47,15.07,0.13,0),
	(145,X'53656B6F746F6E67204C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433130',2016,115.911898,-8.748999,9.13,0.2,8.93,0.13,9.93,0.07,1.6,0.27,2,60.07,16.67,0.13,0),
	(146,X'53656B6F746F6E67204C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433131',2016,115.898779,-8.755828,7.73,0.53,7.2,0,42,0.07,0.07,0,0.4,15.87,30.87,2.73,0.27),
	(147,X'53656B6F746F6E67204C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433132',2016,115.910541,-8.767712,48.93,0.13,48.8,0.13,28.47,0.13,0.07,0.33,2.4,2.13,16.87,0.47,0.07),
	(148,X'4B4B504E205457502047696C69204D61747261',X'4B4B504E205457502047696C69204D61747261',X'4E5442',X'544B474D3031',2014,116.08604,-8.34714,15.8,1.67,14.13,0.13,35.4,0,1,0.33,12.8,6.53,28,0,0),
	(149,X'4B4B504E205457502047696C69204D61747261',X'4B4B504E205457502047696C69204D61747261',X'4E5442',X'544B474D3032',2014,116.07779,-8.36965,7.73,1.53,6.2,0,9.33,0,0.2,1.2,5.67,41.2,34.67,0,0),
	(150,X'4B4B504E205457502047696C69204D61747261',X'4B4B504E205457502047696C69204D61747261',X'4E5442',X'544B474D3033',2014,116.07306,-8.36271,22.67,13.27,9.4,0,24.4,4.27,0,0.13,2.07,29.87,16.6,0,0),
	(151,X'4B4B504E205457502047696C69204D61747261',X'4B4B504E205457502047696C69204D61747261',X'4E5442',X'544B474D3034',2014,116.0312,-8.36265,20.6,11.27,9.33,0.2,41.93,0.2,0.13,7.33,8.4,12.27,8.93,0,0),
	(152,X'4B4B504E205457502047696C69204D61747261',X'4B4B504E205457502047696C69204D61747261',X'4E5442',X'544B474D3035',2014,116.02493,-8.35081,40.53,22,18.53,0.07,27.13,0.13,0,0.8,9,16,6.33,0,0),
	(153,X'4B4B504E205457502047696C69204D61747261',X'4B4B504E205457502047696C69204D61747261',X'4E5442',X'544B474D3036',2014,116.0336,-8.33819,26.2,1.73,24.47,0,34.07,0,0.67,0.07,9.27,8,21.73,0,0),
	(154,X'4B4B504E205457502047696C69204D61747261',X'4B4B504E205457502047696C69204D61747261',X'4E5442',X'544B474D3037',2014,116.05624,-8.33959,46.33,6.07,40.26,0,16.53,2.2,0.27,1.2,30.8,1.8,0.87,0,0),
	(155,X'4B4B504E205457502047696C69204D61747261',X'4B4B504E205457502047696C69204D61747261',X'4E5442',X'544B474D3038',2014,116.05082,-8.35159,16,1.73,14.27,0.33,20.2,4.67,0.87,0.53,14,24.8,18.6,0,0),
	(156,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3036',2016,122.18324,-8.54905,5.93,NULL,NULL,0.87,45.33,4.47,1.4,0.07,0.4,9.67,31.8,0,0.07),
	(157,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3133',2016,122.19327,-8.59151,12.47,NULL,NULL,0,44.33,0,1.67,0.47,0,25.8,13,2.27,0),
	(158,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3231',2016,122.2745,-8.63369,10.53,NULL,NULL,0,69.53,0.73,0.6,0,0.13,14.53,3.93,0,0),
	(159,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3337',2016,122.46206,-8.60028,11.13,NULL,NULL,0.47,69.2,3.4,0.73,0.2,0.33,6.73,7.73,0.07,0),
	(160,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C343741',2016,122.48125,-8.50115,3.6,NULL,NULL,0.07,47.27,0.13,2.87,0,0.2,9.6,36.27,0,0),
	(161,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3535',2016,122.55859,-8.44456,35.29,NULL,NULL,0,35.89,1.27,3,0,0.53,14.94,9.07,0,0),
	(162,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3635',2016,122.51655,-8.41284,16.2,NULL,NULL,0,26.27,1.4,1.47,0,0.47,41.4,12.8,0,0),
	(163,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3639',2016,122.39286,-8.43132,43,NULL,NULL,2.27,46,1.53,1.13,0,0.53,0.87,4.67,0,0),
	(164,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3734',2016,122.34768,-8.48901,5.07,NULL,NULL,0.13,76.6,0.2,0.93,0,0.8,6.33,9.87,0.07,0),
	(165,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3735',2016,122.37086,-8.50065,23.6,NULL,NULL,0,47.87,8.8,2.6,0,3.13,5.07,8.93,0,0),
	(166,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3738',2016,122.46565,-8.48446,6.53,NULL,NULL,0.53,54.33,18.4,4.67,0.13,3.2,6.2,6,0,0),
	(167,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3739',2016,122.43824,-8.48399,11.93,NULL,NULL,0.27,68.53,1.6,2.4,0,0.67,8,6.47,0,0.13),
	(168,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3830',2016,122.33339,-8.35576,7.2,NULL,NULL,0,24.8,6.07,2.07,0,6.8,20.93,32.13,0,0),
	(169,X'53696B6B61',X'53696B6B61',X'4E5454',X'4D4D524C3838',2016,122.22084,-8.37564,11.6,NULL,NULL,0,70.47,3,1.93,0,0.27,4.2,8.53,0,0),
	(170,X'4B4B504E20544E50204C6175742053617775',X'4B4B504E20544E50204C6175742053617775',X'4E5454',X'534157433031',2015,122.66319,-10.79362,55.53,0,55.53,0,16.73,20.73,1.07,0.13,3.07,0.47,2.27,0,0),
	(171,X'4B4B504E20544E50204C6175742053617775',X'4B4B504E20544E50204C6175742053617775',X'4E5454',X'534157433032',2015,122.6656,-10.8312,7.6,0,7.6,0.2,40.07,7.4,0.6,0.27,42.2,0.27,1.4,0,0),
	(172,X'4B4B504E20544E50204C6175742053617775',X'4B4B504E20544E50204C6175742053617775',X'4E5454',X'534157433033',2015,122.74098,-10.82332,23.47,14.87,8.6,0.2,13.47,36,1.2,0.13,1.93,1.47,22.13,0,0),
	(173,X'4B4B504E20544E50204C6175742053617775',X'4B4B504E20544E50204C6175742053617775',X'4E5454',X'534157433034',2015,122.74396,-10.8386,62.6,29.53,33.07,0,22.47,3.93,9.2,0.33,1.07,0.4,0,0,0),
	(174,X'4B4B504E20544E50204C6175742053617775',X'4B4B504E20544E50204C6175742053617775',X'4E5454',X'534157433035',2015,122.7673,-10.76708,6.27,1.87,4.4,0,16.4,25.33,0.47,0.73,22.73,3.27,24.8,0,0),
	(175,X'4B4B504E20544E50204C6175742053617775',X'4B4B504E20544E50204C6175742053617775',X'4E5454',X'534157433036',2015,122.76562,-10.79353,15.67,6.53,9.13,0.07,37.2,25.93,3.4,0.27,3.8,2.8,10.87,0,0),
	(176,X'4B4B504E20544E50204C6175742053617775',X'4B4B504E20544E50204C6175742053617775',X'4E5454',X'534157433037',2015,123.45248,-10.33493,3.13,0.47,2.67,0.27,48,20,0.87,1.53,2.67,1.8,21.73,0,0),
	(177,X'4B4B504E20544E50204C6175742053617775',X'4B4B504E20544E50204C6175742053617775',X'4E5454',X'534157433038',2015,123.48045,-10.28734,17.73,5.67,12.07,0,41.6,17.07,0.87,3.87,1.13,15.33,2.4,0,0),
	(178,X'4B4B504E20544E50204C6175742053617775',X'4B4B504E20544E50204C6175742053617775',X'4E5454',X'534157433039',2015,123.36659,-10.33018,3.53,0,3.53,0,17.33,63.27,0.07,0.07,4.87,7.4,3.47,0,0),
	(179,X'4B4B504E20544E50204C6175742053617775',X'4B4B504E20544E50204C6175742053617775',X'4E5454',X'534157433130',2015,123.41647,-10.31966,25.93,6.67,19.27,0,30.13,17,0.53,0.07,3.2,2.13,21,0,0),
	(180,X'4B4B504E20544E50204C6175742053617775',X'4B4B504E20544E50204C6175742053617775',X'4E5454',X'534157433131',2015,123.41844,-10.28095,41.07,32.53,8.53,0.53,26,9.73,1.33,0,5.93,5.4,9.87,0.13,0),
	(181,X'4B4B504E20544E50204C6175742053617775',X'4B4B504E20544E50204C6175742053617775',X'4E5454',X'534157433132',2015,123.44324,-10.24432,4.33,2.07,2.27,0.07,16.67,55.07,0.87,0,6.53,0,16.47,0,0),
	(182,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433031',2016,119.340283,-5.122156,22.12,61.93333333,NULL,2.2,54.46,0,0,0,0.27,20.22,0.73,0,0),
	(183,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433032',2016,119.243694,-4.860986,6.13,6.133333333,NULL,0.07,60.33,0.2,0,0.4,2.8,1.27,20.67,8.13,0),
	(184,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433033',2016,119.217678,-4.791742,32.81,32.81143635,NULL,0.2,44.32,0.68,2.38,0.07,4.49,1.91,11.23,1.91,0),
	(185,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433034',2016,119.246478,-4.734011,39.93,39.93333333,NULL,0.8,49.87,0.27,0.6,0,2.73,0.67,3.13,2,0),
	(186,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433035',2016,119.272003,-4.736689,17.07,17.06666667,NULL,0.53,56.8,0.2,2.13,0.07,2.13,0.13,13.47,7.47,0),
	(187,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433036',2016,119.268961,-4.785428,27.2,27.2,NULL,0.07,55.73,0,3.07,0.2,1.53,0,10.87,1.33,0),
	(188,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433037',2016,119.299592,-4.7864,15.93,15.93333333,NULL,0.13,52.2,0,0.13,0,0.8,0.4,25.13,5.27,0),
	(189,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433038',2016,119.42613,-4.786411,5.73,5.733333333,NULL,0,0.27,0.13,0.73,5.13,0.2,7.13,5.8,74.87,0),
	(190,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433039',2016,119.410933,-4.810625,41.07,41.06666667,NULL,0.07,6.73,0.07,4.67,2.07,2,2.13,0.4,40.73,0.07),
	(191,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433130',2016,119.400836,-4.843714,60.4,60.4,NULL,0.53,29,0,0.53,0,1.13,0,0.4,8,0),
	(192,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433131',2016,119.337744,-4.883489,17.08,17.07805203,NULL,0.13,58.77,0,1.4,0.33,1.07,0.6,6.4,14.21,0),
	(193,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433132',2016,119.317394,-4.918294,20.47,20.46666667,NULL,0.2,44.6,0.13,0.67,0.4,2.2,0.93,8.53,21.87,0),
	(194,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433133',2016,119.281706,-4.969036,1.27,1.266666667,NULL,0.07,80.13,0,0,0,0.6,13.07,4.8,0.07,0),
	(195,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433134',2016,119.337086,-4.947864,54.07,54.06666667,NULL,1.2,41.8,0.27,0.67,0,0.73,0.07,1,0.2,0),
	(196,X'50616E676B657020',X'50616E676B657020',X'53756C61776573692053656C6174616E',X'504B50433135',2016,119.393094,-4.951261,56.47,56.46666667,NULL,0,36.6,1.07,0.8,0,1.93,0,0.27,2.87,0),
	(197,X'4D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433034',2016,119.208897,-4.972161,39.4,NULL,NULL,2.13,49,0,0.93,0,8.21,0,0.33,0,0),
	(198,X'4B65702E2053656C61796172',X'4B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433031',2016,120.45662,-5.80369,32.07,NULL,NULL,5.53,21.4,0,0.67,0.07,9.6,15.93,14.73,0,0),
	(199,X'4B65702E2053656C61796172',X'4B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433032',2016,120.44545,-5.89914,16.01,NULL,NULL,2.07,59.97,0,0.33,0,0.93,0.4,20.28,0,0),
	(200,X'4B65702E2053656C61796172',X'4B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433033',2016,120.4448,-6.0009,14.8,NULL,NULL,0.07,67.93,0,0,0,0.4,0,16.8,0,0),
	(201,X'4B65702E2053656C61796172',X'4B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433034',2016,120.46188,-6.09756,36.29,NULL,NULL,0.47,28.15,0,0.07,0,0.07,0,19.48,15.48,0),
	(202,X'4B65702E2053656C61796172',X'4B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433035',2016,120.44214,-6.26463,33.33,NULL,NULL,1.07,41.07,0.73,0.33,0,0.33,0.27,22.8,0.07,0),
	(203,X'4B65702E2053656C61796172',X'4B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433036',2016,120.446904,-6.343523,30.53,NULL,NULL,3.26,39.59,1.23,1.96,0.07,0.22,4.57,18.49,0.07,0),
	(204,X'4B65702E2053656C61796172',X'4B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433037',2016,120.45904,-6.41775,37.27,NULL,NULL,6.01,34.47,0.07,0.4,0,0.73,0.4,20.64,0,0),
	(205,X'4B65702E2053656C61796172',X'4B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433038',2016,120.418975,-6.599072,17.34,NULL,NULL,0.93,65.78,0.33,0.53,0,2.07,1.8,11.21,0,0),
	(206,X'4B65702E2053656C61796172',X'4B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433039',2016,120.63958,-7.00332,28.95,NULL,NULL,3,18.95,9.14,0.13,0,2.6,7.14,30.09,0,0),
	(207,X'4B65702E2053656C61796172',X'4B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433130',2016,120.60056,-7.01657,36,NULL,NULL,0.53,52.07,1.53,0.2,0.4,0.54,1.4,7.33,0,0),
	(208,X'4B65702E2053656C61796172',X'4B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433131',2016,120.56939,-7.07249,19.73,NULL,NULL,0.6,39.6,0,0.4,0.33,4.07,21.07,14.2,0,0),
	(209,X'4B65702E2053656C61796172',X'4B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433132',2016,120.77344,-7.13052,27.47,NULL,NULL,2.4,38.13,2.73,0.13,0.13,14.33,5.27,9.4,0,0),
	(210,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433031',2015,118.9351573,-4.691453883,48.67,NULL,NULL,0.2,20.8,0,0.6,5.4,15,2.8,0.53,0,6),
	(211,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433032',2015,118.9549468,-4.689826202,36.4,NULL,NULL,0,26.27,1.2,3,3.6,5.27,4.13,6.67,0,13.47),
	(212,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433033',2015,118.9670835,-4.701070525,60.87,NULL,NULL,1.07,6.33,0.07,0.53,0.13,11.27,11.2,0,0,8.53),
	(213,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433034',2015,118.9784877,-4.715476418,52.47,NULL,NULL,0.14,19.95,0.14,2.16,1.56,11.02,0.07,0.41,0,12.1),
	(214,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433035',2015,119.0617579,-4.73394217,62.73,NULL,NULL,1.2,14.67,0.2,0.6,2.2,17.73,0.2,0,0,0.47),
	(215,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433036',2015,119.0646008,4.743745392,34.6,NULL,NULL,0,4.73,3.6,0,0.13,12.33,11.27,10.67,0,22.67),
	(216,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433037',2015,119.0699135,-4.706256911,60.07,NULL,NULL,0.53,7.93,0.13,1,3.6,12.6,0.07,0,0,14.07),
	(217,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433038',2015,119.0602266,-4.709448069,63.07,NULL,NULL,0.6,5.13,0.07,1,0,15.67,0,0,0,14.47),
	(218,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433039',2015,119.0554384,-4.724563155,29.13,NULL,NULL,0.4,11.93,1.93,0.73,0.8,12.53,12.53,4.27,0,25.73),
	(219,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433130',2015,119.1233634,-4.69223164,32.53,NULL,NULL,0.33,25.47,0.07,0.8,1.47,21.67,1.13,0.33,0,16.2),
	(220,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433131',2015,119.1081413,-4.686843418,47,NULL,NULL,0.27,22.93,1.8,3.07,0.53,10.47,0.53,3.07,0,10.33),
	(221,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433132',2015,119.1295449,-4.650647091,67.73,NULL,NULL,0.8,14,1.13,0.2,1.33,7.07,2.8,0.67,0,4.27),
	(222,X'4B4B504E20545750204B61706F706F73616E67',X'50616E676B6570',X'53756C61776573692053656C6174616E',X'4B5053433133',2015,119.1344188,-4.669476617,30.53,NULL,NULL,0.2,37.73,0.8,1.2,3.53,25.33,0.27,0,0,0.4),
	(223,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433031',2015,122.795402,-4.058264,17.2,0.2,17,0.13,34.07,0.73,4.2,0,1.33,17.73,24.47,0.13,0),
	(224,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433032',2015,122.776071,-4.037835,58.6,1.2,57.4,9.33,24.47,0.67,2.8,0,4.13,0,0,0,0),
	(225,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433033',2015,122.788188,-4.09784,52.93,0.6,52.33,1.27,44.53,0.27,0.67,0,0,0.2,0.13,0,0),
	(226,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433034',2015,122.722888,-4.126322,69.67,6.8,62.87,2.6,26.4,0.2,1.07,0,0,0.07,0,0,0),
	(227,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433035',2015,122.667995,-4.099823,61.67,7.33,54.33,0.87,31.07,1.07,2.13,0,0.87,1.53,0.8,0,0),
	(228,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433036',2015,122.681263,-4.037142,23.4,0.07,23.33,0.13,37.8,2.73,1.53,0,0.13,14.4,19.87,0,0),
	(229,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433037',2015,122.647085,-3.888684,27.6,0.27,27.33,0.53,45.67,4.87,4.33,0,5.2,6.47,5.33,0,0),
	(230,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433038',2015,122.668952,-3.955858,60.53,21.27,39.27,0.07,24.47,4.07,3,0,0.07,3.07,4.67,0.07,0),
	(231,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433039',2015,122.658456,-3.982048,42.13,0.27,41.87,0.33,40.4,1.27,3.33,0,0.6,6.67,5.27,0,0),
	(232,X'4275746F6E2053656C6174616E',X'4275746F6E2053656C6174616E',X'53756C61776573692054656E6767617261',X'42544E433130',2016,122.40323,-5.39958,12.27,0.87,11.4,0,58.2,0.27,0.93,0.53,0.4,25.33,2.07,0,0),
	(233,X'4275746F6E2053656C6174616E',X'4275746F6E2053656C6174616E',X'53756C61776573692054656E6767617261',X'42544E433435',2016,122.51534,-5.43619,12.93,0.27,12.67,0.27,32.15,3.87,1.27,0.4,2.6,21.92,24.59,0,0),
	(234,X'4275746F6E2053656C6174616E',X'4275746F6E2053656C6174616E',X'53756C61776573692054656E6767617261',X'42544E433039',2016,122.26234,-5.38395,9.27,6.47,2.8,0,46,0.73,1.13,0.93,1.73,2.07,38.13,0,0),
	(235,X'4275746F6E2053656C6174616E',X'4275746F6E2053656C6174616E',X'53756C61776573692054656E6767617261',X'42544E4341',2016,122.33038,-5.39822,29.33,2.87,26.47,0.2,45,0.33,1.33,0.07,2.47,13.47,7.8,0,0),
	(236,X'4275746F6E2053656C6174616E',X'4275746F6E2053656C6174616E',X'53756C61776573692054656E6767617261',X'42544E4342',2016,122.60406,-5.41193,52.93,34.33,18.6,2.6,13.4,9.6,1.07,0,0.8,11.8,7.8,0,0),
	(237,X'4275746F6E2053656C6174616E',X'4275746F6E2053656C6174616E',X'53756C61776573692054656E6767617261',X'42544E433137',2016,122.51731,-5.62051,21.93,0.33,21.6,0.33,46.13,0.73,4.13,0.07,2.27,22.33,2.07,0,0),
	(238,X'4275746F6E2053656C6174616E',X'4275746F6E2053656C6174616E',X'53756C61776573692054656E6767617261',X'42544E4343',2016,122.49907,-5.60271,46.13,6.2,39.93,1.07,39.73,1.93,3.47,0,0.8,5,1.87,0,0),
	(239,X'4275746F6E2053656C6174616E',X'4275746F6E2053656C6174616E',X'53756C61776573692054656E6767617261',X'42544E4344',2016,122.46689,-5.67623,28.4,3.73,24.67,0.93,56,0.2,2.33,0,2.87,6.8,2.47,0,0),
	(240,X'4275746F6E2053656C6174616E',X'4275746F6E2053656C6174616E',X'53756C61776573692054656E6767617261',X'42544E433133',2016,122.47507,-5.51706,45,0.47,44.53,0.2,37.2,0,0.73,0,4.47,11.73,0.67,0,0),
	(241,X'4275746F6E2053656C6174616E',X'4275746F6E2053656C6174616E',X'53756C61776573692054656E6767617261',X'42544E433134',2016,122.48058,-5.56261,44.27,35.87,8.4,0.2,42.73,0.07,0.73,0,11.93,0.07,0,0,0),
	(242,X'4275746F6E',X'4275746F6E',X'53756C61776573692054656E6767617261',X'42544E433236',2016,123.04491,-5.43466,11.87,1.9,9.97,0.13,72.87,1.73,1.93,0,3.33,2.8,5.33,0,0),
	(243,X'4275746F6E',X'4275746F6E',X'53756C61776573692054656E6767617261',X'42544E4349',2016,123.00836,-5.4403,8.47,0,8.47,0,26.13,10.13,5.07,0.27,16.33,17.47,16.13,0,0),
	(244,X'4275746F6E',X'4275746F6E',X'53756C61776573692054656E6767617261',X'42544E433331',2016,122.8637,-5.51931,37.6,0.13,37.47,0.13,34.53,0,1.4,0.07,18.8,6.87,0.6,0,0),
	(245,X'4275746F6E',X'4275746F6E',X'53756C61776573692054656E6767617261',X'42544E433239',2016,122.90259,-5.54531,38.33,0.87,37.47,0.4,48.4,3,1.67,0,5.33,0.4,2.47,0,0),
	(246,X'4275746F6E',X'4275746F6E',X'53756C61776573692054656E6767617261',X'42544E433337',2016,122.86743,-5.61554,33.67,2.27,31.4,0.07,33.53,0.67,1.07,0,4.67,4,22.33,0,0),
	(247,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433031',2016,123.61592,-5.2588,32.2,0.2,32,0.07,35.4,0.07,7.93,0.67,22.53,0.67,0.47,0,0),
	(248,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433032',2016,123.53102,-5.24558,33.8,1.07,32.73,0,31.87,7.47,7.87,0.2,18.53,0.13,0.13,0,0),
	(249,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433033',2016,123.52916,-5.32671,17.8,1.4,16.4,0,43.73,0,5.67,1.13,4.73,10.93,16,0,0),
	(250,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433034',2016,123.88911,-5.5729,32.07,12.33,19.73,0.07,22.13,19.6,8.6,1.07,15.2,0.4,0.87,0,0),
	(251,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433035',2016,123.77818,-5.58765,27.13,0.6,26.53,0,29.13,10.8,10.27,1.47,19.93,0.4,0.87,0,0),
	(252,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433036',2016,123.69283,-5.49132,19.6,2.67,16.93,0,31.93,9.13,15,0.73,16.93,5.67,1,0,0),
	(253,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433037',2016,123.74009,-5.47769,15.47,0.47,15,0.13,52.67,11.6,6.73,0.47,9.6,2.27,1.07,0,0),
	(254,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433038',2016,123.37215,-5.45952,14.93,0.8,14.13,0.4,35.93,25.07,1.6,0.27,12,3.53,6.27,0,0),
	(255,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433039',2016,123.41154,-5.55739,27.67,12.13,15.53,0.73,24.53,23.6,6.2,3.33,13.07,0.13,0.73,0,0),
	(256,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433130',2016,123.5115,-5.58737,4.27,0,4.27,0.13,39.27,37.13,7.53,0.27,5.93,0.33,5.13,0,0),
	(257,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433131',2016,123.42885,-5.50076,17.73,0.8,16.93,0.27,39.07,9.67,4.13,1.27,8.4,12.53,6.93,0,0),
	(258,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433132',2016,123.91976,-5.716,28.13,0.53,27.6,0.13,36.4,9.93,1.87,0.67,21.47,0.13,1.27,0,0),
	(259,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433133',2016,124.01106,-5.76552,46.27,1,45.27,0.07,33.07,5.73,2.4,0.4,11.13,0.87,0.07,0,0),
	(260,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433134',2016,123.89748,-5.77897,44.6,4.87,39.73,0,20.93,6.47,7.2,0.8,17.33,0.8,1.87,0,0),
	(261,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433135',2016,123.89191,-5.74051,23.93,4,19.93,0.07,28.53,3.13,6.8,2.93,33.13,0.2,1.27,0,0),
	(262,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3031',2016,127.32267,0.88144,15.6,0.8,14.8,0,7.07,0.73,2.6,7.33,0.27,55.67,10.73,0,0),
	(263,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3032',2016,127.33157,0.86494,11.6,2.07,9.93,0,9.27,46.67,0.8,1,0.13,30.4,0.07,0.07,0),
	(264,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3033',2016,127.38635,0.83451,20.53,2.07,18.46,0,13.73,3.07,1.13,6,1.27,24.27,30,0,0),
	(265,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3034',2016,127.39087,0.78717,52.6,0.53,51.87,0,9.87,1.4,2.13,13.53,0.47,18.53,1.47,0,0),
	(266,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3035',2016,127.32404,0.75325,29.6,3.6,26,0,15,1.33,2.13,1.07,0.2,28.73,21.93,0,0),
	(267,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3036',2016,127.36523,0.74245,34.07,13.4,20.67,0,15.6,5.93,0.67,0.13,0.4,33.27,9.93,0,0),
	(268,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3037',2016,127.37496,0.72276,38.73,2.27,36.53,0,9,7.8,0.4,0.53,0,40.07,3.47,0,0),
	(269,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3038',2016,127.43081,0.75204,37.8,29,8.8,0,33,2.07,1.67,0,5.2,8.13,12.13,0,0),
	(270,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3039',2016,127.45589,0.73095,27.87,16.67,11.2,0.53,28.27,10.07,3.8,0.87,14.8,6.33,7.47,0,0),
	(271,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3130',2016,127.47985,0.71444,54.6,13.27,41.33,0.13,26.73,9.67,2.73,0,3.2,2.4,0.53,0,0),
	(272,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3131',2016,127.45757,0.69584,31.33,2.93,28.4,0.6,50.47,0.07,4.27,1.27,10.4,1.53,0.07,0,0),
	(273,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3132',2016,127.49722,0.86831,12.53,4.87,7.66,0.13,66,3.07,3,1.07,5.4,6.6,2.2,0,0),
	(274,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3133',2016,127.61461,0.85239,60.6,0.13,60.47,0.13,23.27,0,6.33,0.2,9.33,0.13,0,0,0),
	(275,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'5454454C3134',2016,127.59373,0.77259,32.2,0.87,31.33,0,38.47,5,2.47,1.13,1.87,12.33,6.53,0,0),
	(276,X'4B4B504E20545750204C6175742042616E6461',X'4B4B504E20545750204C6175742042616E6461',X'4D616C756B75',X'42414E433031',2015,129.87012,-4.52978,7.13,0,7.13,0.2,62.53,0,0,0.07,9.33,0,20.13,0.6,0),
	(277,X'4B4B504E20545750204C6175742042616E6461',X'4B4B504E20545750204C6175742042616E6461',X'4D616C756B75',X'42414E433032',2015,129.8763,-4.53492,38.33,7.4,30.93,2.2,27.47,0.73,0.8,0.2,14.13,0.13,14.8,0,1.2),
	(278,X'4B4B504E20545750204C6175742042616E6461',X'4B4B504E20545750204C6175742042616E6461',X'4D616C756B75',X'42414E433033',2015,129.89105,-4.53525,65.4,0,65.4,0.67,12.93,0.07,0.13,5.6,13.73,0.47,1,0,0),
	(279,X'4B4B504E20545750204C6175742042616E6461',X'4B4B504E20545750204C6175742042616E6461',X'4D616C756B75',X'42414E433034',2015,129.90826,-4.52953,72.13,0.27,71.87,0.4,16,0,0,1.27,9.93,0.13,0.13,0,0),
	(280,X'4B4B504E20545750204C6175742042616E6461',X'4B4B504E20545750204C6175742042616E6461',X'4D616C756B75',X'42414E433035',2015,129.90875,-4.51062,12.67,1.33,11.33,0.13,27.13,7.47,0.13,0,5,3.33,44.13,0,0),
	(281,X'4B4B504E20545750204C6175742042616E6461',X'4B4B504E20545750204C6175742042616E6461',X'4D616C756B75',X'42414E433036',2015,129.89993,-4.5018,36.87,24.27,12.6,0.07,41.6,1.67,1.13,0.07,4.73,0,13.87,0,0),
	(282,X'4B4B504E20545750204C6175742042616E6461',X'4B4B504E20545750204C6175742042616E6461',X'4D616C756B75',X'42414E433037',2015,129.93419,-4.49641,53.87,0.27,53.6,0.13,18,23.4,1.33,0,3.07,0,0.2,0,0),
	(283,X'4B4B504E20545750204C6175742042616E6461',X'4B4B504E20545750204C6175742042616E6461',X'4D616C756B75',X'42414E433038',2015,129.94041,-4.50916,20.53,0,20.53,0,43.53,10.53,0.6,0,11.53,0,13.27,0,0),
	(284,X'4B4B504E20545750204C6175742042616E6461',X'4B4B504E20545750204C6175742042616E6461',X'4D616C756B75',X'42414E433039',2015,129.93289,-4.53239,15.8,0,15.8,0.13,46.53,11.67,0.73,0.2,2.6,10.33,12,0,0),
	(285,X'4B4B504E20545750204C6175742042616E6461',X'4B4B504E20545750204C6175742042616E6461',X'4D616C756B75',X'42414E433130',2015,129.92024,-4.54442,42.27,2.53,39.73,0.33,43.67,6.47,0,0.13,0.4,0.53,6.2,0,0),
	(286,X'4B4B504E20545750204C6175742042616E6461',X'4B4B504E20545750204C6175742042616E6461',X'4D616C756B75',X'42414E433131',2015,129.8938,-4.5411,9.6,7.8,1.8,0,73.67,12.47,0,0,0.53,0,3.73,0,0),
	(287,X'4B4B504E20545750204C6175742042616E6461',X'4B4B504E20545750204C6175742042616E6461',X'4D616C756B75',X'42414E433132',2015,129.87056,-4.54238,70.6,0.93,69.67,0.13,28.93,0.07,0,0,0.27,0,0,0,0),
	(288,X'4B4B504E205341502052616A6120416D706174',X'4B4B504E205341502052616A6120416D706174',X'5061707561204261726174',X'52414A433031',2015,130.49926,-0.25717,18.6,5.8,12.8,0,26.2,1,2.2,25,1.2,0.47,24.53,0.8,0),
	(289,X'4B4B504E205341502052616A6120416D706174',X'4B4B504E205341502052616A6120416D706174',X'5061707561204261726174',X'52414A433032',2015,130.43279,-0.36712,28.93,1.53,27.4,0,34.07,0.67,1,1.67,0.07,7.13,26.46,0,0),
	(290,X'4B4B504E205341502052616A6120416D706174',X'4B4B504E205341502052616A6120416D706174',X'5061707561204261726174',X'52414A433033',2015,130.27675,-0.30244,35.53,4.53,31,0,18.47,6.53,0.81,26.33,1.47,0.33,10.53,0,0),
	(291,X'4B4B504E205341502052616A6120416D706174',X'4B4B504E205341502052616A6120416D706174',X'5061707561204261726174',X'52414A433034',2015,130.2259,-0.39992,33.4,1.2,32.2,0,32.13,10.33,1.87,3.4,3.87,3.27,11.73,0,0),
	(292,X'4B4B504E205341502052616A6120416D706174',X'4B4B504E205341502052616A6120416D706174',X'5061707561204261726174',X'52414A433035',2015,130.22835,-0.33837,38.93,18.6,20.33,0,19.53,0.33,2.6,11.6,5.73,2.01,19.27,0,0),
	(293,X'4B4B504E205341502052616A6120416D706174',X'4B4B504E205341502052616A6120416D706174',X'5061707561204261726174',X'52414A433036',2015,130.19705,-0.35139,25.87,6.33,19.54,0,47.33,3.8,1.47,1.73,5.07,1.6,13.13,0,0),
	(294,X'4B4B504E205341502052616A6120416D706174',X'4B4B504E205341502052616A6120416D706174',X'5061707561204261726174',X'52414A433037',2015,130.37024,-0.37426,25.87,6.07,19.8,0,23.4,26.8,0.67,6.93,1.2,0.33,14.8,0,0),
	(295,X'4B4B504E205341502052616A6120416D706174',X'4B4B504E205341502052616A6120416D706174',X'5061707561204261726174',X'52414A433038',2015,130.28342,-0.41042,49.33,36.4,12.93,0,32.8,1.67,1.73,0.2,1.53,0.61,12.13,0,0),
	(296,X'4B4B504E205341502052616A6120416D706174',X'4B4B504E205341502052616A6120416D706174',X'5061707561204261726174',X'52414A433039',2015,130.29877,-0.33439,33.73,15.6,18.13,0,27.07,1.33,2.6,0.27,0.93,1.07,33,0,0),
	(297,X'4B4B504E205341502057616967656F204261726174',X'4B4B504E205341502057616967656F204261726174',X'5061707561204261726174',X'575947433031',2015,130.08063,0.14583,47.2,20,27.2,1.4,31,5.07,9.33,0,5,0,1,0,0),
	(298,X'4B4B504E205341502057616967656F204261726174',X'4B4B504E205341502057616967656F204261726174',X'5061707561204261726174',X'575947433032',2015,130.06207,0.15359,37,30.27,6.73,0,41.33,0.4,1.73,0,10.6,1.33,7.6,0,0),
	(299,X'4B4B504E205341502057616967656F204261726174',X'4B4B504E205341502057616967656F204261726174',X'5061707561204261726174',X'575947433033',2015,130.01733,0.16785,31.2,20.87,10.33,0.27,35.47,1.27,1.2,0.07,5.6,2.6,22.33,0,0),
	(300,X'4B4B504E205341502057616967656F204261726174',X'4B4B504E205341502057616967656F204261726174',X'5061707561204261726174',X'575947433034',2015,130.02022,0.1723,16.53,6.67,9.87,0.8,33.27,1.2,1.67,0,2.73,7.13,36.67,0,0),
	(301,X'4B4B504E205341502057616967656F204261726174',X'4B4B504E205341502057616967656F204261726174',X'5061707561204261726174',X'575947433035',2015,130.06891,0.14583,23.27,3.53,19.73,0.47,9.67,26.2,0.8,0,10.07,5.47,24.07,0,0),
	(302,X'4B4B504E205341502057616967656F204261726174',X'4B4B504E205341502057616967656F204261726174',X'5061707561204261726174',X'575947433036',2015,130.06541,0.15617,21.33,13.2,8.13,0.8,23.53,24.27,5.53,2.27,12.6,3.4,6.27,0,0),
	(303,X'4B4B504E205341502057616967656F204261726174',X'4B4B504E205341502057616967656F204261726174',X'5061707561204261726174',X'575947433037',2015,130.12711,0.12897,28.2,2.07,26.13,0,28.87,8.47,9.47,1,1.93,13,9.07,0,0),
	(304,X'4B4B504E205341502057616967656F204261726174',X'4B4B504E205341502057616967656F204261726174',X'5061707561204261726174',X'575947433038',2015,130.126,0.13506,5.87,0.8,5.07,1.73,14.87,28.87,3.67,0.2,24.4,2.87,17.53,0,0),
	(305,X'52616A6120416D706174',X'52616A6120416D706174',X'5061707561204261726174',X'535742433031',2016,131.13312,-0.99476,45.03,1.27,43.76,38.09,2.8,5.4,0,1.93,1.4,3.94,1.4,0,0),
	(306,X'52616A6120416D706174',X'52616A6120416D706174',X'5061707561204261726174',X'535742433032',2016,131.12479,-0.92609,9.81,4.14,5.67,6.6,2.47,4.54,0,36.36,8.61,17.55,14.08,0,0),
	(307,X'52616A6120416D706174',X'52616A6120416D706174',X'5061707561204261726174',X'535742433033',2016,131.14466,-0.95859,11.13,2.47,8.67,9.93,0.27,6.27,0.13,0.73,1.67,67.27,2.6,0,0),
	(308,X'52616A6120416D706174',X'52616A6120416D706174',X'5061707561204261726174',X'535742433034',2016,131.05798,-0.92664,27.33,7.87,19.47,35.87,10.33,0,0.07,0.47,20.6,4.67,0.67,0,0),
	(309,X'52616A6120416D706174',X'52616A6120416D706174',X'5061707561204261726174',X'535742433035',2016,131.02689,-0.89485,53.07,14.53,38.53,3,16.87,0.6,0,1.87,2.13,19.6,2.8,0,0.07),
	(310,X'52616A6120416D706174',X'52616A6120416D706174',X'5061707561204261726174',X'535742433036',2016,130.9918,-0.92096,5.53,0.4,5.13,0.47,30.8,1.07,0,1.53,0.33,22.67,37.6,0,0),
	(311,X'52616A6120416D706174',X'52616A6120416D706174',X'5061707561204261726174',X'535742433037',2016,130.88062,-0.84609,52.13,14.47,37.67,12.13,0,5.2,0.27,0.13,6,21.4,2.73,0,0),
	(312,X'52616A6120416D706174',X'52616A6120416D706174',X'5061707561204261726174',X'535742433038',2016,130.91031,-0.7998,17.87,10.4,7.47,9.27,3.47,1.93,0,1.33,26.73,24.27,15.13,0,0),
	(313,X'52616A6120416D706174',X'52616A6120416D706174',X'5061707561204261726174',X'535742433039',2016,130.8523,-0.76173,16.07,3.6,12.47,0.13,19,14.2,0.73,1.13,1.8,30.33,16.4,0.2,0),
	(314,X'52616A6120416D706174',X'52616A6120416D706174',X'5061707561204261726174',X'535742433130',2016,130.77098,-0.75523,18.33,7.27,11.07,17.87,5.4,2.87,3.53,1.33,23.67,18.87,8.13,0,0),
	(315,X'52616A6120416D706174',X'52616A6120416D706174',X'5061707561204261726174',X'535742433131',2016,130.66929,-0.77449,26.13,2.47,23.67,18,2.53,10.93,2.73,1,24.27,8.2,6.2,0,0),
	(316,X'52616A6120416D706174',X'52616A6120416D706174',X'5061707561204261726174',X'535742433132',2016,130.64483,-0.802,28.6,21.67,6.93,3.33,1.13,3.4,0.33,0.93,4.2,57.4,0.67,0,0),
	(317,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433031',2016,136.16812,-1.18444,0.6,0,0.6,0,21,0.27,0.6,0.07,0.6,70.73,6.13,0,0),
	(318,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433032',2016,136.20187,-1.17748,2.13,0,2.13,0,16.4,0.87,0.67,0.13,0.27,66.13,13.4,0,0),
	(319,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433033',2016,136.23296,-1.17233,32.6,0.4,32.2,0,45.73,0.13,2,2.07,2.67,5.87,8.93,0,0),
	(320,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433034',2016,136.27582,-1.1577,7.93,0.13,7.8,0.13,80.27,0,6.13,0.47,2,0.53,2.53,0,0),
	(321,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433035',2016,136.3115,-1.142,5.27,0,5.27,0,83.4,1.73,3.6,0.4,3.13,0.33,2.13,0,0),
	(322,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433036',2016,136.3465,-1.1192,18.8,0.4,18.4,0,46.93,6.13,2.33,1.2,2.07,16.87,5.67,0,0),
	(323,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433037',2016,136.374,-1.0911,6.93,0,6.93,0,33.87,1.13,1.47,1.87,2.6,43.13,9,0,0),
	(324,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433038',2016,136.20037,-1.25965,4.67,0,4.67,0,45,0.07,1.47,1.27,2.07,23.93,21.53,0,0),
	(325,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433039',2016,136.22638,-1.24275,9.93,0,9.93,0,66.4,14.4,2.2,1.6,1.33,2.13,2,0,0),
	(326,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433130',2016,136.2982,-1.2463,26.33,13.13,13.2,0,18.67,43.27,0.93,1.07,0.13,4.93,4.67,0,0),
	(327,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433131',2016,136.3048,-1.2237,3.2,0.07,3.13,0,67.67,11.67,2.2,1,3.6,4.93,5.73,0,0),
	(328,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433132',2016,136.3986,-1.2234,21.2,3.53,17.67,0,45.2,0.87,6.53,2.53,20.4,1.87,1.4,0,0),
	(329,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433133',2016,136.42683,-1.19603,17.8,4.47,13.33,0.13,63.53,4.2,13.67,0.13,0.53,0,0,0,0),
	(330,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313737',2015,136.3418637,-1.21734076,70.13,56.73,13.4,0.33,19.2,1.87,0,0.13,5.33,0.34,2.67,0,0),
	(331,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313738',2015,136.4366904,-1.23862761,35.6,0.33,35.27,0.07,13.26,0,2.47,0.07,16.53,9,23,0,0),
	(332,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313739',2015,136.432458,-1.27089878,51.53,39.47,12.07,0.33,16.34,0.4,0.87,1.33,15,3.4,10.8,0,0),
	(333,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313830',2015,136.3734184,-1.31777591,7.93,3.8,4.13,0.2,16.67,1.27,1.2,0.47,43.73,21.07,7.46,0,0),
	(334,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313831',2015,136.6162248,-1.2135254,33.47,14.6,18.87,0,31.53,1.13,0.4,0.53,17.27,2.8,12.87,0,0),
	(335,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313832',2015,136.6130342,-1.27637995,33.07,16.87,16.2,0.2,25.74,2.33,1,1,22.8,4.33,9.53,0,0),
	(336,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313833',2015,136.5950463,-1.24945519,38,35.2,2.8,0.07,11.92,0,0.27,1.27,35.27,9.27,3.93,0,0),
	(337,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313834',2015,136.5870026,-1.14844328,13.27,3.8,9.47,0,45.87,2.07,0.93,1.13,10.73,2.07,23.93,0,0),
	(338,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313835',2015,136.6238017,-1.1778071,4.47,1,3.47,0,21.33,0,0.6,10.27,23.47,11.33,28.53,0,0),
	(339,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313836',2015,136.6659789,-1.28560558,26.13,0.07,26.07,0.13,20.27,0.4,1.07,1.73,27.73,5.87,16.67,0,0),
	(340,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313837',2015,136.4030599,-1.29209996,10.67,0,10.67,0.2,23.13,1.6,7.67,1.27,42.13,2.93,10.4,0,0),
	(341,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313838',2015,136.577986,-1.20151187,27.67,3.6,24.07,0.13,25.67,1.2,1.33,1.53,25.6,2.33,14.54,0,0),
	(342,X'4B4B504E20545750205061646169646F',X'4B4B504E20545750205061646169646F',X'5061707561',X'544B5044313839',2015,136.6205022,-1.34102748,37,0,37,0.07,23.86,10.27,1.07,0.47,15.13,2.13,10,0,0),
	(343,X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4D616C756B75',X'41525443203032',2016,134.508336,-6.878292,53.2,46.8,6.4,0,9.2,0,1.73,7.07,0,8,16.93,3.87,0),
	(344,X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4D616C756B75',X'41525443203033',2016,134.54984,-6.8949,28.47,2.8,25.47,0,1.87,1.2,0.8,16.8,7.13,37.87,0.27,5.6,0),
	(345,X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4D616C756B75',X'41525443203034',2016,134.56892,-6.864659,54.27,37.67,16.6,0,2.8,8.73,1.07,12.67,9.13,5.93,3.53,1.87,0),
	(346,X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4D616C756B75',X'41525443203035',2016,134.58908,-6.86708,21.6,11.13,10.47,0,0.53,1.73,0.27,4.27,0.4,52.53,0.93,17.73,0),
	(347,X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4D616C756B75',X'41525443203036',2016,134.65482,-6.87099,31.6,1.53,30.07,0,15.2,0,0.2,1.93,1.07,11.53,4.8,33.67,0),
	(348,X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4D616C756B75',X'41525443203037',2016,134.77199,-6.87804,10.6,3.13,7.47,0,18.4,0,0.13,24.6,0,1.13,45.13,0,0),
	(349,X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4D616C756B75',X'41525443203039',2016,134.483345,-6.942702,36.27,33.4,2.87,0,2.47,1.4,0.27,0.2,1.33,35.87,15.87,6.33,0),
	(350,X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4D616C756B75',X'41525443203130',2016,134.50417,-6.92966,26.47,24,2.47,0,1.93,0.07,1.73,0.07,0,16.07,43.53,10.13,0),
	(351,X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4D616C756B75',X'41525443203131',2016,134.66057,-7.01724,40.53,29.73,10.8,0.07,5.13,0.07,4.13,0.2,0,17.93,24.2,7.73,0),
	(352,X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4D616C756B75',X'41525443203132',2016,134.68134,-7.00297,24.6,8.87,15.73,0,3.6,0.53,0.67,0,0,40.13,1.47,29,0),
	(353,X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4D616C756B75',X'41525443203133',2016,134.471454,-7.082866,20.4,2,18.4,0,4.13,20.53,0.13,2.33,0.33,4.27,0.07,47.8,0),
	(354,X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4B4B504E20534150204B65702E204172752054656E6767617261',X'4D616C756B75',X'41525443203134',2016,134.520616,-7.06378,26.47,21.93,4.54,0,1,1.73,0.47,0,0.07,48.67,21.6,0,0),
	(355,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203031',2015,98.785277,1.692573,36.13,0,36.13,0.27,41.6,0.2,0,0.27,0.2,4.6,5.13,11.6,0),
	(356,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203032',2015,98.830442,1.653726,21.07,0,21.07,0,16.47,0.4,0.2,0,0,0,4.4,57.47,0),
	(357,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203033',2015,98.806917,1.6043,56.47,5,51.47,1.4,26.93,0.27,4.33,0.13,0.4,3.07,6.8,0.2,0),
	(358,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203034',2015,98.77037,1.57729,63.2,3.87,59.33,6.4,22.33,0.33,0.87,0,0.47,3.47,2.73,0.2,0),
	(359,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203035',2015,98.74054,1.56023,34.07,4.54,29.53,8.8,27.4,0,13.67,0,0.6,3.53,11.93,0,0),
	(360,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203036',2015,98.720712,1.578241,56.4,4.53,51.87,0.47,36.53,0,0.33,0,1,3.73,1.53,0,0),
	(361,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203037',2015,98.58355,1.57862,32.27,22.6,9.67,0.2,42.47,0,0.67,3.47,0.4,7.67,12.13,0.73,0),
	(362,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203038',2015,98.585057,1.599388,33.93,6,27.93,0.47,26.53,0.13,5.33,7.33,0.2,5.27,20.8,0,0),
	(363,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203039',2015,98.601795,1.615246,53.27,4.67,48.6,4.4,25.07,0.27,3.8,0.33,0.27,3,9.6,0,0),
	(364,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203130',2015,98.59658,1.6405,40.6,3.27,37.33,3,24.87,0.4,4.73,0.07,0.33,2.33,23.67,0,0),
	(365,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203131',2015,98.56925,1.67143,54.53,0.07,54.47,9.6,30.07,0.27,0.8,2.13,0.13,1.33,1.07,0.07,0),
	(366,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203132',2015,98.51383,1.65323,45.07,0,45.07,9.87,27.6,4,5.73,1,6.07,0.47,0.2,0,0),
	(367,X'4B61622E20546170616E756C692054656E676168',X'4B61622E20546170616E756C692054656E676168',X'53756D61747261205574617261',X'54505443203133',2015,98.48065,1.70312,50.93,12.47,38.46,2.27,38.2,0.33,2.33,0.47,0.4,1.33,3.73,0,0),
	(368,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E494143203031',2014,97.36205,1.5374,13,2.27,10.73,0.27,39.13,0,0.07,0.87,0.33,31,14.47,0.87,0),
	(369,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E494143203032',2014,97.38602,1.5172,3.47,0.2,3.27,0.2,19.47,0,0,0.2,0,74.33,2,0.33,0),
	(370,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E494143203033',2014,97.4255,1.51135,12.27,0.13,12.13,0.27,30.67,0,0.47,49.87,0,5.07,1.4,0,0),
	(371,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E494143203034',2014,97.24292,1.45737,20.8,0.73,20.07,0.07,40.47,0,1.2,0.2,0.4,8.6,6.67,21.6,0),
	(372,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E494143203035',2014,97.21158,1.42407,57.47,28.6,28.87,0.27,32.2,0,1.07,0.13,0.47,5.8,2.27,0.33,0),
	(373,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E494143203036',2014,97.17743,1.41063,14.81,0,14.8,0,28.35,0,0.73,0,0.07,0.47,55.57,0,0),
	(374,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E494143203037',2014,97.15015,1.425,50.07,32.73,17.33,0.07,24.07,0,0.07,0.67,0.27,12.47,12.33,0,0),
	(375,X'4E696173205574617261',X'4E696173205574617261',X'53756D61747261205574617261',X'4E494143203038',2014,97.11943,1.43158,10.2,1.27,8.93,0.27,62.93,0,0.13,0.6,1.8,15,9.07,0,0),
	(376,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433031',2014,99.57481,-2.00214,15.13,NULL,NULL,0,15.27,0,30.2,0,0,18.8,20.6,0,0),
	(377,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433032',2014,99.5778,-2.025,11.93,NULL,NULL,0,51.4,1.93,11.33,0,0.13,4.07,19.2,0,0),
	(378,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433033',2014,99.59967,-1.98093,20.6,NULL,NULL,0,71.33,0.13,1.33,0,0.07,6.4,0.13,0,0),
	(379,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433034',2014,99.54128,-2.14322,13.2,NULL,NULL,0,23.8,0,0,0,0,24,38.47,0.53,0),
	(380,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433035',2014,99.537,-2.133,70.37,NULL,NULL,0,25.63,2.15,1.33,0,0.3,0.22,0,0,0),
	(381,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433036',2014,99.3011,-1.69577,44.53,NULL,NULL,0.33,40.07,5.87,0,0,0.13,7.8,1.27,0,0),
	(382,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433037',2014,99.27022,-1.75085,48.67,NULL,NULL,0.07,29.33,0.27,0,0,0,18.67,2.93,0.07,0),
	(383,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433038',2014,99.2915,-1.81112,1.67,NULL,NULL,0.13,48.8,0.6,0.13,0,0.8,29.8,18.07,0,0),
	(384,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433039',2014,99.28552,-1.87213,4.93,NULL,NULL,0.07,24.33,0,1,0,0.07,52.2,17.4,0,0),
	(385,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433032',2015,99.57481,-2.00214,2.07,NULL,NULL,3,26.07,0,23.53,0,0,10.8,3.67,29.47,1.4),
	(386,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433033',2015,99.5778,-2.025,12.73,NULL,NULL,2.79,27.02,0.82,0.13,0,0.13,7.14,11.77,23.96,13.47),
	(387,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433034',2015,99.59967,-1.98093,16.98,NULL,NULL,3.54,37.23,1.13,0,0,0.33,21.05,0.06,8.75,10.89),
	(388,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433035',2015,99.54128,-2.14322,14.27,NULL,NULL,0.13,68.13,0,0,0,1.2,0.4,0.13,15.73,0),
	(389,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433036',2015,99.537,-2.133,61,NULL,NULL,0.2,38,0,0,0,0.46,0,0,0.33,0),
	(390,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433037',2015,99.3011,-1.69577,25.67,NULL,NULL,0,71.66,0.26,0,0,0.6,0,1.66,0.13,0),
	(391,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433038',2015,99.27022,-1.75085,51.01,NULL,NULL,0,0,0.46,0.4,0,0.2,1.06,0.06,46.56,0.13),
	(392,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433039',2015,99.2915,-1.81112,5.73,NULL,NULL,0,0.66,0.06,3.26,0,8.6,8.53,5.26,66.93,0.9),
	(393,X'4D656E7461776169',X'4D656E7461776169',X'53756D61747261204261726174',X'4D5457433130',2015,99.28552,-1.87213,10,NULL,NULL,0,0.06,0,0.13,0,0.86,2.73,12.66,73.53,0),
	(394,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433031',2015,105.73872,-5.89067,41.87,1.67,40.2,0,21.53,2.6,4.67,2.33,9.47,0.07,17.2,0.27,0),
	(395,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433032',2015,105.75056,-5.89632,31.73,17,14.73,0.2,34.87,16.87,0,0,5.27,3.53,7.53,0,0),
	(396,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433033',2015,105.75761,-5.89588,10.07,2.93,7.14,0,12.6,68.27,0.07,0,0.53,0.93,7.53,0,0),
	(397,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433034',2015,105.76042,-5.88226,20.87,4.67,16.2,0,10.27,48.6,0,0,0.13,0,20.13,0,0),
	(398,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433035',2015,105.77924,-5.88685,17.4,10.13,7.27,0,25.07,27.2,1.93,4.47,0.53,2.47,20.93,0,0),
	(399,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433036',2015,105.78759,-5.86455,55.2,2.4,52.8,0,35.67,0.33,1.93,0.47,0.27,0.2,5.93,0,0),
	(400,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433037',2015,105.79197,-5.85277,66.13,4.2,61.93,0,26.8,0.8,0.27,0.2,3.13,0,2.67,0,0),
	(401,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433038',2015,105.78262,-5.84845,63.07,0,63.07,0,20.4,0,3.67,4.52,0.27,0,8.07,0,0),
	(402,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433039',2015,105.77309,-5.85987,37.87,0,37.87,0,22.67,5.4,3.27,0.26,1.8,3.8,24.93,0,0),
	(403,X'4C616D70756E67',X'4C616D70756E67',X'42616E646172204C616D70756E67',X'4C4D50433130',2015,105.77552,-5.84683,20.8,9.13,11.67,0,49.21,0,0.67,11.86,0.73,0.53,16.2,0,0),
	(404,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433031',2015,107.68881,-2.53838,58,5.6,52.4,0.07,30.07,1.27,0.73,0.27,5.67,1.27,2.67,0,0),
	(405,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433032',2015,107.61889,-2.53934,63.73,1.13,62.6,0.2,27.67,0.87,0.6,0.6,6.33,0,0,0,0),
	(406,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433033',2015,107.40159,-2.94477,49.8,0.2,49.6,0,46,0,2,0.27,0.87,0,1.06,0,0),
	(407,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433034',2015,107.35224,-2.89315,61.53,2.2,59.33,0.07,33.13,0,2.67,0.2,1.8,0.07,0.53,0,0),
	(408,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433035',2015,107.34876,-2.87579,35.53,1.93,33.6,0,43.13,2.13,3.07,12.33,1.41,1.07,1.33,0,0),
	(409,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433036',2015,107.37099,-2.82678,45.53,2.4,43.13,0,38.8,0.2,4.2,5.87,3.8,0.33,1.27,0,0),
	(410,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433037',2015,107.49645,-2.81713,42.53,0.47,42.07,0.13,26.07,5.8,5,11.73,8.47,0,0.27,0,0),
	(411,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433038',2015,107.49175,-2.87862,28.53,0.53,28,0,38.33,0,3.67,1.73,4.87,3.07,19.8,0,0),
	(412,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433039',2015,107.4721,-2.92386,41.47,0.2,41.27,0.13,47.2,0,2.67,2.93,3,0.13,2.47,0,0),
	(413,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433130',2015,107.48239,-2.94733,39.93,0.6,39.33,0.13,51.6,0.07,2.33,0.8,3,0.4,1.74,0,0),
	(414,X'42656C6974756E67',X'42656C6974756E67',X'4B65702E2042616E676B612042656C6974756E67',X'424C54433131',2015,107.49555,-2.96661,42.6,0.13,42.47,0,32.6,0.07,5.53,9.6,4.07,0.33,5.2,0,0),
	(415,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3031',2015,104.2212,0.5357,57.73,1.47,56.26,1.07,33.6,0,0,1.4,0.73,2.33,3.13,0,0),
	(416,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3032',2015,104.2403,0.5413,59,0,59,7.33,29.83,0,0,0.17,0.67,1.33,1.67,0,0),
	(417,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3033',2015,104.1893,0.5542,43.28,2.87,40.41,0.83,38.83,1.11,0,0.19,3.89,7.14,4.73,0,0),
	(418,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3034',2015,104.1763,0.585,53.62,0,53.62,3.14,27.81,0,10.76,0.19,2.19,0.76,1.52,0,0),
	(419,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3035',2015,104.202,0.6045,44.8,0.47,44.33,13.93,21.87,1.33,0.2,14.87,0.27,1.6,1.13,0,0),
	(420,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3036',2015,104.2242,0.5818,47.07,2.53,44.54,3.6,37,1.27,0,6.47,1,3.6,0,0,0),
	(421,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3037',2015,104.1017,0.6297,65.13,1.07,64.06,12.87,13.6,0,0,0.67,1.67,2.27,3.8,0,0),
	(422,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3038',2015,104.0793,0.6452,20.6,0.27,20.33,0.13,21.6,0,0,0,2.07,28.2,27.4,0,0),
	(423,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3039',2015,104.0797,0.6175,32.53,1.27,31.26,0.53,44.07,0,0,0.47,1.13,8.27,13,0,0),
	(424,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3130',2015,104.2923,0.514,34.44,30.2,4.24,3.86,50,0.26,0,6.27,4.97,0,0.2,0,0),
	(425,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3131',2015,104.2637,0.4938,28.13,1,27.13,0.73,28.13,0.2,0,0.07,2.33,19.13,21.27,0,0),
	(426,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3132',2015,104.2838,0.5082,45.03,15.24,29.79,1.9,37.07,1.5,0,0.34,1.29,12.52,0.34,0,0),
	(427,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3433',2015,104.2778,0.7973,25.6,0.73,24.87,0,48.8,0,0,10.27,0,14.4,0.93,0,0),
	(428,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3437',2015,104.3106,0.7106,11.8,0,11.8,2,62.07,0,0.4,7.53,0,9.2,1,0,6),
	(429,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3538',2015,104.3156,0.6895,39.47,2,37.47,0,57.13,0.6,0.07,1.13,0.33,0.27,1,0,0),
	(430,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3633',2015,104.3481,0.7407,50.88,0.35,50.53,2.89,40.7,0.26,0.61,2.46,0,0,2.19,0,0),
	(431,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3637',2015,104.3084,0.7655,19.73,0,19.73,2.33,34.4,0,0.27,40.13,0.2,1.4,1.53,0,0),
	(432,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3638',2015,104.3517,0.7113,43.33,4.8,38.53,0,40.4,0.73,0,12.13,0.47,2.53,0.4,0,0),
	(433,X'4B6F746120426174616D',X'426174616D',X'4B65702E2052696175',X'42544D4C3639',2015,104.3716,0.7392,17.4,0.13,17.27,2.13,76.33,0,0,0.27,0.27,3.6,0,0,0),
	(434,X'53656E6179616E67204C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4C3039',2015,104.86126,-0.08339,40.07,0.2,39.87,0.13,50.87,0,0.67,4.4,0,1.47,2.4,0,0),
	(435,X'53656E6179616E67204C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4C3130',2015,104.84556,-0.06357,31.8,0,31.8,0,58.2,0,0,0.87,0,2.73,6.4,0,0),
	(436,X'53656E6179616E67204C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4C3132',2015,104.65934,-0.01857,27.53,2.4,25.13,0.87,62.67,0,3.33,0.93,0.07,0.93,3.67,0,0),
	(437,X'53656E6179616E67204C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4C3233',2015,104.65934,-0.05216,21.13,0.87,20.27,0.2,54.93,0,0.07,5.13,0,3.13,15.4,0,0),
	(438,X'53656E6179616E67204C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4C323931',2015,104.9068,-0.12135,21.13,0.87,20.27,0.2,54.93,0,0.07,5.13,0,3.13,15.4,0,0),
	(439,X'53656E6179616E67204C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4C373035',2015,104.52332,0.06168,64.8,1.8,63,11.67,11.33,0.2,1.07,0,0.73,8.13,2.07,0,0),
	(440,X'53656E6179616E67204C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4C373037',2015,104.51231,0.04197,32.2,1.93,30.27,0.07,46.07,1.07,0,0.2,1.67,7.2,11.53,0,0),
	(441,X'53656E6179616E67204C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4C41',2015,104.7307,0.09963,38.73,1.8,36.93,1.2,37.67,0,0,10.73,4.93,0.4,6.33,0,0),
	(442,X'53656E6179616E67204C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4C42',2015,104.7355,0.08223,66.2,6,60.2,0.07,30.27,0,0.13,0.47,0.4,0.6,1.87,0,0),
	(443,X'53656E6179616E67204C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4C43',2015,104.7559,0.04852,70.93,0.27,70.67,0,25.2,0,0,0.07,0.67,1.93,1.2,0,0),
	(444,X'53656E6179616E67204C696E676761',X'4C696E676761',X'4B65702E2052696175',X'534E4C44',2015,104.7775,0.03061,38.33,1.67,36.67,0,38.6,0.47,0,0.07,0.13,18.87,3.53,0,0),
	(445,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433133',2014,104.7823,1.022,38.4,NULL,NULL,0.07,46.6,8,2.8,0,2.67,0.07,0.53,0.87,0),
	(446,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433134',2014,104.7943,1.9832,18.56,NULL,NULL,0.33,61.18,1.57,4.12,0,2.81,4.05,4.51,2.88,0),
	(447,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433135',2014,104.8223,1.9525,39.4,NULL,NULL,0.07,38.47,0.47,0.6,0,2.6,1.6,11.2,5.6,0),
	(448,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433136',2014,104.851,1.9732,21.6,NULL,NULL,0,47.2,2.87,1.93,9.13,2.87,7.47,2.93,3.47,0.53),
	(449,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433137',2014,104.8312,1.0157,1.2,NULL,NULL,0.4,80.8,0.2,7.73,0,7,1.73,0.2,0.6,0.13),
	(450,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433138',2014,104.9233,1.9277,29.07,NULL,NULL,0.2,59.93,0.93,7.8,0,1.13,0.33,0.13,0.4,0.07),
	(451,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433734',2014,104.6426,1.0877,40.27,NULL,NULL,0.07,30.67,2.07,1.13,0.2,0.87,1.2,22.47,0.93,0.07),
	(452,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433737',2014,104.6537,1.0594,51.67,NULL,NULL,0,44.07,0.27,0.13,0,0.53,0.07,0.6,2.67,0),
	(453,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433831',2014,104.6613,1.0145,52.87,NULL,NULL,0,43.13,1.53,0.07,0,2.2,0,0.2,0,0),
	(454,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433835',2014,104.6755,1.0467,23.8,NULL,NULL,0,30.93,2.47,2.27,2.07,2.93,10.67,25.43,0,0.33),
	(455,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433930',2014,104.7164,1.7915,34.8,NULL,NULL,0.01,53.93,0.33,0,0.67,0,0.07,10.13,0,0),
	(456,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433932',2014,104.6844,1.7763,25.67,NULL,NULL,0,55.07,1.4,3.2,2.67,0.33,1.47,8.87,1.33,0),
	(457,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B52494341',2014,104.7338,1.9437,54.8,NULL,NULL,0,32.6,2.33,0.93,0.4,0.13,0.67,2.6,5.47,0.07),
	(458,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B52494342',2014,104.7154,1.9216,34.73,NULL,NULL,0.07,51.73,1.6,2.93,0.47,0.6,0.13,3.4,4.33,0),
	(459,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433133',2015,104.7823,1.022,37.67,17.33,20.33,1.93,46.6,0,0,1.8,0.53,7.8,3.67,0,0),
	(460,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433134',2015,104.7943,1.9832,25.67,12.8,12.87,0,58.2,0,0,0.2,1.47,5.53,8.93,0,0),
	(461,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433135',2015,104.8223,1.9525,34.47,4.73,29.73,0.4,56.47,0,0,6.4,1.07,0.33,0.87,0,0),
	(462,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433136',2015,104.851,1.9732,27.13,15.53,11.6,0.6,59.93,0,0,7.07,0.53,2.13,2.6,0,0),
	(463,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433137',2015,104.8312,1.0157,11,4.93,6.07,1.2,58.73,0,0,4.33,1.4,20.73,0.93,0,1.67),
	(464,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433138',2015,104.9233,1.9277,46.6,34.07,12.53,0.13,42.47,0.07,0,0,0.2,10.27,0.27,0,0),
	(465,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433734',2015,104.6426,1.0877,38.2,2.6,35.6,14.53,20.73,0.8,0.13,0,2.4,0.13,8,15.07,0),
	(466,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433737',2015,104.6537,1.0594,44.93,1.07,43.87,0.33,38.2,0.4,5.47,0.13,1.53,0.13,0.33,8.53,0),
	(467,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433831',2015,104.6613,1.0145,47.8,5.87,41.93,0.4,47.6,0.33,0,2.13,0.73,1,0,0,0),
	(468,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433835',2015,104.6755,1.0467,36.76,2.86,33.9,19.43,20.76,0.95,1.43,1.9,2.19,3.81,12.76,0,0),
	(469,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433930',2015,104.7164,1.7915,50.27,0.2,50.07,7.27,20,0,2.33,1.2,3.6,4.53,5.8,5,0),
	(470,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B5249433932',2015,104.6844,1.7763,30,2.14,27.86,0.31,52.14,0.25,0.06,0.44,0.75,12.96,3.08,0,0),
	(471,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B52494341',2015,104.7338,1.9437,40.59,1.76,38.82,0,41.11,0.33,0,0.39,0.2,13.86,3.53,0,0),
	(472,X'4B61622E2042696E74616E',X'4B61622E2042696E74616E',X'4B65702E2052696175',X'4B52494342',2015,104.7154,1.9216,31.33,11.67,19.67,0.93,27.33,0.07,0,11.27,1,15.87,9.07,0,3.13),
	(473,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3032',2014,108.00321,3.78984,39.73,0.27,39.47,0,51.67,0.93,0.67,1.13,3.13,2.47,0.27,0,0),
	(474,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3033',2014,108.07323,3.6876,24.8,0.13,24.67,0,46.73,9.2,0.47,0.93,2.2,2,13.67,0,0),
	(475,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3035',2014,108.07621,3.63147,18.67,2.93,15.73,0.27,53.33,0,1.67,0.67,4.6,5.27,15.53,0,0),
	(476,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3036',2014,108.07939,3.57879,28.73,0.07,28.67,0,46.8,0,0.07,0.07,1.6,20.2,2.53,0,0),
	(477,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313434',2014,108.4332,3.87179,12.6,1.87,10.73,0,55.8,13.33,2.27,2.87,9.93,0.87,2.33,0,0),
	(478,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313435',2014,108.4332,3.99171,16,0.2,15.8,0.07,52.2,26,0.33,0.4,3.67,0.8,0.53,0,0),
	(479,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313436',2014,108.35718,4.00281,20.93,1.53,19.4,0.07,59,0.93,0.33,0.6,0.87,5.53,11.73,0,0),
	(480,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313534',2014,108.21209,4.26837,15.53,2.67,12.87,0.6,65.47,0.53,0.67,0.33,8.47,4.73,3.67,0,0),
	(481,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313535',2014,108.1832,4.23807,4.07,0.07,4,0,45.73,0.4,0.13,39.6,5.87,1.47,2.73,0,0),
	(482,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313539',2014,108.08387,4.11754,33.73,0.47,33.27,0.13,46.4,8.07,2.67,1.13,4.67,2.33,0.87,0,0),
	(483,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C2D42',2014,108.4243,3.90435,17.2,0,17.2,0.07,51.73,6.6,1.2,0.73,2.53,17.07,2.87,0,0),
	(484,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C2D46',2014,108.1154,4.13889,29,3.2,25.8,0.27,48,14.07,0.67,0.4,4.07,2.33,1.2,0,0),
	(485,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3032',2015,108.00321,3.78984,34.13,0.27,33.86,0.67,53.53,0.6,0,0.07,0.07,10.73,0,0,0.2),
	(486,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3033',2015,108.07323,3.6876,20.73,4.13,16.6,1.07,47,6.73,0.33,0.2,0,16.07,5.27,0,2.6),
	(487,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3035',2015,108.07621,3.63147,8,0.47,7.53,9.6,28.6,0.07,0,0,0.13,51.07,2.53,0,0),
	(488,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3036',2015,108.07939,3.57879,18,0.4,17.6,2,4.73,0,0,0,0,75.27,0,0,0),
	(489,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C3037',2015,NULL,NULL,7.73,0.33,7.4,1,50.93,0.73,0,0.13,0.47,38.73,0.28,0,0),
	(490,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313434',2015,108.4332,3.87179,15.73,2.53,13.2,11.87,44.67,0,0,0.4,0.2,27.13,0,0,0),
	(491,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313435',2015,108.4332,3.99171,17.34,8.47,8.86,9.53,69.4,3,0,0.33,0.2,0.2,0,0,0),
	(492,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313436',2015,108.35718,4.00281,22.53,10.53,12,3.73,60.53,0.27,0,0.4,0,10.53,0.14,0,1.87),
	(493,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313438',2015,NULL,NULL,33.93,3.47,30.46,0.07,51.26,0,0,0.47,0.6,5.67,8,0,0),
	(494,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C31353241',2015,NULL,NULL,13.2,4.2,9,8.87,53.26,0.8,0,0.47,0.6,20,2.8,0,0),
	(495,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313534',2015,108.21209,4.26837,22.33,9.73,12.6,2.47,72.4,0,0,0.53,0,2.27,0,0,0),
	(496,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313535',2015,108.1832,4.23807,0.72,0,0.72,0.13,33.14,0,0,0.26,0,65.1,0.65,0,0),
	(497,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313537',2015,NULL,NULL,17.8,0.2,17.6,0.07,43.73,13.8,0,0,0.07,23.73,0.8,0,0),
	(498,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313539',2015,108.08387,4.11754,21.6,0.6,21,0.2,51.13,12.93,0,0.33,0.07,13.67,0.07,0,0),
	(499,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C313631',2015,NULL,NULL,15.93,3.53,12.4,6.07,47.67,1.13,0,20.27,0,8.8,0.13,0,0),
	(500,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C41',2015,NULL,NULL,19.67,10.33,9.34,21.33,49.8,1.07,0,0,0.07,4.06,4,0,0),
	(501,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C42',2015,108.4243,3.90435,15.33,1.73,13.6,0.2,37.87,4.06,0,0.07,0,41.67,0.8,0,0),
	(502,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C44',2015,NULL,NULL,24.47,10.8,13.67,0.4,32.73,1.47,0,0.27,0.8,23.6,16.26,0,0),
	(503,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C45',2015,NULL,NULL,26.33,4.67,21.66,0,38.8,2.94,0,0,0,31.93,0,0,0),
	(504,X'4E6174756E61',X'4E6174756E61',X'4B65702E2052696175',X'4E544E4C46',2015,108.1154,4.13889,21.93,6.47,15.46,0.8,60.6,13.4,0,0.07,0,3.2,0,0,0),
	(505,X'53656B6F746F6E672F4C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433031',2015,115.962089,-8.724016,39,16.87,22.13,0,25.87,7.67,4.2,0.53,19.33,1.53,1.87,0,0),
	(506,X'53656B6F746F6E672F4C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433032',2015,115.928904,-8.730955,37.07,5.93,31.14,0,32.53,0,0.47,0.07,5.07,8.2,16.6,0,0),
	(507,X'53656B6F746F6E672F4C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433033',2015,115.925946,-8.759481,20.87,0.6,20.27,0.27,29.73,0,4.6,0,4.8,18,21.73,0,0),
	(508,X'53656B6F746F6E672F4C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433034',2015,115.933735,-8.748061,14.73,0.67,14.06,0,26.87,0.13,0.67,2.07,5.47,20.6,29.47,0,0),
	(509,X'53656B6F746F6E672F4C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433035',2015,115.921041,-8.71683,52.93,3.07,49.86,0,19.93,0.27,9.33,0.33,2.87,9.6,4.73,0,0),
	(510,X'53656B6F746F6E672F4C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433036',2015,115.913807,-8.721092,33.6,31.13,2.47,0.2,26.13,31.67,0.2,0.2,2.67,3.33,2,0,0),
	(511,X'53656B6F746F6E672F4C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433037',2015,115.883492,-8.731382,60.87,29.87,31,0.07,15.6,2,0.73,0.13,1.67,5.27,13.67,0,0),
	(512,X'53656B6F746F6E672F4C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433038',2015,115.899876,-8.723553,62.47,43.87,18.6,0,19.27,8.8,0.6,0.13,0.67,3.8,4.27,0,0),
	(513,X'53656B6F746F6E672F4C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433039',2015,115.898727,-8.745118,35.8,6.53,29.27,0,25,0.27,2.6,0.27,1.4,10,24.67,0,0),
	(514,X'53656B6F746F6E672F4C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433130',2015,115.911898,-8.748999,18.27,0.2,18.07,0.2,21.93,0,3.93,1.6,6.27,16.2,31.6,0,0),
	(515,X'53656B6F746F6E672F4C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433131',2015,115.898779,-8.755828,13.13,0.33,12.8,0.27,29.67,0,1.73,0.2,0.33,27.27,27.4,0,0),
	(516,X'53656B6F746F6E672F4C6F6D626F6B',X'4C6F6D626F6B204261726174',X'4E5442',X'534B54433132',2015,115.910541,-8.767712,44.4,0,44.4,0.07,27.13,0,2.8,0.67,2.47,11.4,11.07,0,0),
	(517,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3036',2015,122.18324,-8.54905,12.2,1.87,10.33,0,43.47,3.67,3.27,0.27,2.6,2.2,32.33,0,0),
	(518,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3133',2015,122.19327,-8.59151,7.8,1.73,6.07,0,10.13,0.27,1.73,0.07,0,34.33,0.07,45.6,0),
	(519,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3231',2015,122.2745,-8.63369,6.93,0.2,6.73,0,43.4,0.2,4.27,5.87,0.2,23.4,13.07,2.67,0),
	(520,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3337',2015,122.46206,-8.60028,10.2,0.47,9.73,0.07,53.87,2.47,1.93,1.2,0.53,11.93,17.8,0,0),
	(521,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C343741',2015,122.48125,-8.50115,32.13,14.07,18.07,0.07,27.8,4.2,3.33,0.13,0.93,18.53,12.87,0,0),
	(522,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3535',2015,122.55859,-8.44456,21.2,0.27,20.93,0,42.93,4.67,5.93,1.8,2.13,5.87,15.47,0,0),
	(523,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3635',2015,122.51655,-8.41284,14.2,1.33,12.87,0.13,13.33,0.4,1.2,0.33,0.53,44.27,25.6,0,0),
	(524,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3639',2015,122.39286,-8.43132,34.47,8.87,25.6,0.07,47.27,2.93,2.93,1.93,2,0,8.4,0,0),
	(525,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3734',2015,122.34768,-8.48901,1.8,0.2,1.6,2.47,14.8,0,0.13,0.6,0.4,73.93,5.87,0,0),
	(526,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3735',2015,122.37086,-8.50065,26.47,1.6,24.87,0.07,44.8,4.33,2.93,3.2,1.2,6,11,0,0),
	(527,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3738',2015,122.46565,-8.48446,14.6,2.6,12,0,36.87,9.6,9.4,2.33,0.4,17.93,8.87,0,0),
	(528,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3739',2015,122.43824,-8.48399,8.73,0.67,8.07,0.07,23.67,0.93,10,3.4,0.67,34.8,17.6,0.13,0),
	(529,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3830',2015,122.33339,-8.35576,8.6,0.33,8.27,0,39.4,6.33,15.6,3.67,2.33,9.13,14.87,0.07,0),
	(530,X'4B61622053696B6B612C204D61756D657265',X'53696B6B61',X'4E5454',X'4D4D524C3838',2015,122.22084,-8.37564,6.8,0,6.8,0,23.27,5.53,44.47,3.2,0.33,6.33,10.07,0,0),
	(531,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433031',2015,119.084981,-4.968356,16.48,NULL,NULL,0.07,27.02,1.8,2,0,0.87,46.36,5.34,0,0.07),
	(532,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433032',2015,119.067825,-3.015119,29,NULL,NULL,0.27,28.6,0.2,0.6,0,1.33,21.07,18.93,0,0),
	(533,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433033',2015,119.21577,-4.89058,7.06,NULL,NULL,0,22.35,0.72,4.05,0,0.92,39.41,25.49,0,0),
	(534,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433034',2015,119.208897,-3.027839,28.6,NULL,NULL,0.07,27.33,0.53,0.6,0,2.6,40.13,0.13,0,0),
	(535,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433035',2015,119.285953,-4.897831,37.07,NULL,NULL,0.13,16.53,1.2,6.2,0.53,2.67,34.47,1.07,0,0.13),
	(536,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433036',2015,119.261958,-4.861194,18.87,NULL,NULL,0,25.8,1.47,2.2,0,0.87,47.07,3.53,0,0.2),
	(537,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433037',2015,119.277681,-4.967667,4.07,NULL,NULL,0,26.4,0.33,6.8,0.4,0.87,46.27,14.87,0,0),
	(538,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433038',2015,119.32525,-4.983161,34.8,NULL,NULL,0.13,9.67,1.4,1.47,0,0.53,48.67,3.33,0,0),
	(539,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433039',2015,119.32715,-4.958258,27.87,NULL,NULL,0,23.13,1.07,0.47,0,1.13,42.13,2.93,0,1.27),
	(540,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433130',2015,119.316272,-4.921428,10,NULL,NULL,0.07,35.24,1.63,4.29,0.07,3.27,37.07,8.3,0,0.07),
	(541,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433131',2015,119.353444,-4.9472,3.26,NULL,NULL,0,5.28,0.14,1.39,0,0.35,86.94,2.64,0,0),
	(542,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433132',2015,119.340261,-4.877844,23.6,NULL,NULL,0.07,22.13,0,2,0,2.13,49.6,0.47,0,0),
	(543,X'4B6F7461204D616B6173736172',X'4D616B6173736172',X'53756C61776573692053656C6174616E',X'4D4B53433133',2015,119.389147,-4.861714,14.67,NULL,NULL,0,20.13,0,2.67,0,5.4,52.8,4.33,0,0),
	(544,X'4B61622E204B65702E2053656C61796172',X'4B61622E204B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433031',2015,120.45662,-5.80369,24.07,NULL,NULL,0,30.07,0.07,0.33,3.53,4.53,15.73,20.33,0,1.33),
	(545,X'4B61622E204B65702E2053656C61796172',X'4B61622E204B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433032',2015,120.44545,-5.89914,31.8,NULL,NULL,0,11.47,0.07,0.27,1.33,20.6,26.27,6.27,0.2,1.73),
	(546,X'4B61622E204B65702E2053656C61796172',X'4B61622E204B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433033',2015,120.4448,-6.0009,5.13,NULL,NULL,0,61.67,0.13,0.13,1.67,0.4,0.07,31.4,0,0),
	(547,X'4B61622E204B65702E2053656C61796172',X'4B61622E204B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433034',2015,120.46188,-6.09756,29.53,NULL,NULL,0,41.8,0.13,0.07,0.4,2.73,1.07,24.13,0,0.13),
	(548,X'4B61622E204B65702E2053656C61796172',X'4B61622E204B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433035',2015,120.44214,-6.26463,34.13,NULL,NULL,0,35.87,4,0,0,5.47,2.73,17.07,0,0.73),
	(549,X'4B61622E204B65702E2053656C61796172',X'4B61622E204B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433036',2015,120.446904,-6.343523,36.67,NULL,NULL,0,36.13,2.13,0,0.4,5,1.53,16.53,0,1.6),
	(550,X'4B61622E204B65702E2053656C61796172',X'4B61622E204B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433037',2015,120.45904,-6.41775,23.93,NULL,NULL,0,49.67,0,0,0.47,6.27,1.27,14.47,0,3.93),
	(551,X'4B61622E204B65702E2053656C61796172',X'4B61622E204B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433038',2015,120.418975,-6.599072,33.53,NULL,NULL,0.07,10.53,13,0,0,2.2,7,28.73,0,4.93),
	(552,X'4B61622E204B65702E2053656C61796172',X'4B61622E204B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433039',2015,120.63958,-7.00332,49.97,NULL,NULL,0.67,11.07,4.54,0,0,15.48,10.27,3.8,0,4.2),
	(553,X'4B61622E204B65702E2053656C61796172',X'4B61622E204B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433130',2015,120.60056,-7.01657,35.27,NULL,NULL,0.8,16.47,0,0.53,1.6,5.93,21.33,18.07,0,0),
	(554,X'4B61622E204B65702E2053656C61796172',X'4B61622E204B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433131',2015,120.56939,-7.07249,30.27,NULL,NULL,0,7.2,31.13,0.13,0.27,8.53,5.27,13.13,0,4.07),
	(555,X'4B61622E204B65702E2053656C61796172',X'4B61622E204B65702E2053656C61796172',X'53756C61776573692053656C6174616E',X'534C59433132',2015,120.77344,-7.13052,21.27,NULL,NULL,0,28.13,1.2,0.2,1.53,13.87,6.6,15,0,12.2),
	(556,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433031',2016,122.795402,-4.058264,13,0,13,0.27,37.4,0.33,7.87,0,0,16.27,24.87,0,0),
	(557,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433032',2016,122.776071,-4.037835,53.73,14.67,39.07,2.4,39.27,0,2.4,0,2.07,0,0.13,0,0),
	(558,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433033',2016,122.788188,-4.09784,44.27,5.87,38.4,0.07,52.07,0.4,3.13,0,0.07,0,0,0,0),
	(559,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433034',2016,122.722888,-4.126322,61.33,10.6,50.73,0.2,36.93,0.73,0.73,0,0.07,0,0,0,0),
	(560,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433035',2016,122.667995,-4.099823,53.13,10.33,42.8,0.4,39.47,0.2,1.93,0,1.27,2.07,1.4,0.13,0),
	(561,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433036',2016,122.681263,-4.037142,20.93,0.2,20.73,0,37,1.33,4.6,0,1.27,14.6,20.27,0,0),
	(562,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433037',2016,122.647085,-3.888684,24.07,2.4,21.67,0,48.4,6.33,5.93,0,4.73,5.4,5.13,0,0),
	(563,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433038',2016,122.668952,-3.955858,52.17,36.16,16.01,0.13,34.89,4.14,3.67,0,0.13,2.6,1.8,0.47,0),
	(564,X'4B656E64617269',X'4B656E64617269',X'53756C61776573692054656E6767617261',X'4B4452433039',2016,122.658456,-3.982048,40,0.8,39.2,0.2,47.13,1.2,2.4,0,0.07,4.67,4.33,0,0),
	(565,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433031',2015,123.61592,-5.2588,28.73,0.4,28.33,0,45.13,0.4,5.33,0.4,19.73,0.07,0.2,0,0),
	(566,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433032',2015,123.53102,-5.24558,41.73,3.2,38.53,0,33.67,11.6,6.2,2.07,3.73,0.07,0.93,0,0),
	(567,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433033',2015,123.52916,-5.32671,28.8,1.73,27.07,0.07,26.33,0,4.27,3.13,0.87,9.33,25.07,0.07,2.07),
	(568,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433034',2015,123.88911,-5.5729,38.07,11.93,26.13,0.4,24.6,26.6,3.8,0.73,2.87,1.4,1.53,0,0),
	(569,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433035',2015,123.77818,-5.58765,50.47,0.53,49.93,0,18.8,12.33,5.87,1.67,9.2,0.53,1.13,0,0),
	(570,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433036',2015,123.69283,-5.49132,31.33,2.33,29,0.13,18.73,19.2,9.6,2.4,8.53,9.13,0.93,0,0),
	(571,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433037',2015,123.74009,-5.47769,32.47,2,30.47,0.2,29.8,19.33,4.07,1.6,2.93,3.67,5.93,0,0),
	(572,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433038',2015,123.37215,-5.45952,48.97,1.4,47.57,0,6.07,20.08,0.87,0.53,8.27,10.74,4.47,0,0),
	(573,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433039',2015,123.41154,-5.55739,38.2,20.93,17.27,0.13,12.53,38.27,2.33,1.2,5.27,0.53,1.53,0,0),
	(574,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433130',2015,123.5115,-5.58737,6.6,0,6.6,0,10.47,59.93,2.13,0.67,7.8,0.47,11.93,0,0),
	(575,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433131',2015,123.42885,-5.50076,23,0.6,22.4,0,24.4,19.27,3.33,0.27,6.93,9.53,12.93,0,0.33),
	(576,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433132',2015,123.91976,-5.716,29.07,0.87,28.2,0,15,38.27,1.33,0.67,13.73,0.33,1.6,0,0),
	(577,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433133',2015,124.01106,-5.76552,65.87,0.2,65.67,0,13.93,6.07,2.8,0.27,8.67,2.07,0.33,0,0),
	(578,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433134',2015,123.89748,-5.77897,39.2,4.2,35,0,29.73,10.33,5,1.2,6.33,0.53,7.67,0,0),
	(579,X'57616B61746F6269',X'57616B61746F6269',X'53756C61776573692054656E6767617261',X'574E49433135',2015,123.89191,-5.74051,31.47,11.4,20.07,0.13,26.47,7.33,5.53,3.73,22.8,0.6,1.93,0,0),
	(580,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433031',2015,127.32267,0.88144,9.33,0.27,9.07,1.4,25.6,0.27,2.53,0,0.07,50.27,10.47,0.07,0),
	(581,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433032',2015,127.33157,0.86494,13.87,0.73,13.13,3.4,38.13,36.87,1.4,0,0.13,6.2,0,0,0),
	(582,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433033',2015,127.38635,0.83451,18.73,1.13,17.6,1.6,57.2,1.27,1.4,0,1.13,1.87,16.8,0,0),
	(583,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433034',2015,127.39087,0.78717,39.6,0,39.6,5.73,40.33,2.4,5.6,0.27,1.93,1.27,2.87,0,0),
	(584,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433035',2015,127.32404,0.75325,20.47,0,20.47,4.53,19.8,0.27,4.4,0,0.13,11.8,38.6,0,0),
	(585,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433036',2015,127.36523,0.74245,21,7.07,13.93,10.27,18.4,2.93,1.07,0,1.33,21.8,23.2,0,0),
	(586,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433037',2015,127.37496,0.72276,28,0.33,27.67,4.07,16.6,2.6,0.6,0,1.2,42.47,4.47,0,0),
	(587,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433038',2015,127.43081,0.75204,26.53,7.8,18.73,0.6,31.67,4.8,1.53,0.6,0,22,12.27,0,0),
	(588,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433039',2015,127.45589,0.73095,22.67,13.87,8.8,0.67,23.8,11.73,7.2,0.4,0.2,21.93,11.4,0,0),
	(589,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433130',2015,127.47985,0.71444,65.93,17.4,48.53,2.2,13.33,9.33,2.27,0,0.2,6.73,0,0,0),
	(590,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433131',2015,127.45757,0.69584,22.67,1.2,21.47,0.4,66.53,0.07,2.93,0.07,0.07,6.87,0.4,0,0),
	(591,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433132',2015,127.49722,0.86831,20.6,10.4,10.2,0.93,51.93,4.33,2.6,0,0.13,14.07,5.4,0,0),
	(592,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433133',2015,127.61461,0.85239,72.8,0.47,72.33,2.8,13,0.47,8.87,0,0,2.07,0,0,0),
	(593,X'5465726E617465',X'5465726E617465',X'4D616C756B75205574617261',X'545445433134',2015,127.59373,0.77259,27.47,3.6,23.87,8.07,24.8,4.87,1.4,0,0.93,23.33,9.13,0,0),
	(594,X'4B61622E2052616A6120416D706174',X'4B61622E2052616A6120416D706174',X'5061707561',X'535742433031',2015,131.13312,-0.99476,53.13,NULL,NULL,0,24.93,1.07,8.27,6.53,5.27,0,0.6,0.2,0),
	(595,X'4B61622E2052616A6120416D706174',X'4B61622E2052616A6120416D706174',X'5061707561',X'535742433032',2015,131.12479,-0.92609,15.8,NULL,NULL,0,25.67,5.53,0.4,25.6,1.53,1.33,24.13,0,0),
	(596,X'4B61622E2052616A6120416D706174',X'4B61622E2052616A6120416D706174',X'5061707561',X'535742433033',2015,131.14466,-0.95859,18.2,NULL,NULL,0,50.67,9.73,0.4,0.07,0.4,10.53,9.93,0.07,0),
	(597,X'4B61622E2052616A6120416D706174',X'4B61622E2052616A6120416D706174',X'5061707561',X'535742433034',2015,131.05798,-0.92664,23.4,NULL,NULL,0.13,65.33,1,0.67,1.73,1.6,1,5.13,0,0),
	(598,X'4B61622E2052616A6120416D706174',X'4B61622E2052616A6120416D706174',X'5061707561',X'535742433035',2015,131.02689,-0.89485,52.93,NULL,NULL,0,30.87,1,1.13,1.53,1.4,1,10.13,0,0),
	(599,X'4B61622E2052616A6120416D706174',X'4B61622E2052616A6120416D706174',X'5061707561',X'535742433036',2015,130.9918,-0.92096,6.8,NULL,NULL,0,20.13,0,0.67,16.67,2.93,4.6,48.2,0,0),
	(600,X'4B61622E2052616A6120416D706174',X'4B61622E2052616A6120416D706174',X'5061707561',X'535742433037',2015,130.88062,-0.84609,60.4,NULL,NULL,0.07,19.27,6.07,1.07,2.27,4.33,1.87,4.67,0,0),
	(601,X'4B61622E2052616A6120416D706174',X'4B61622E2052616A6120416D706174',X'5061707561',X'535742433038',2015,130.91031,-0.7998,32.2,NULL,NULL,0,18.93,3.13,0.6,19.47,2.8,1.2,21.67,0,0),
	(602,X'4B61622E2052616A6120416D706174',X'4B61622E2052616A6120416D706174',X'5061707561',X'535742433039',2015,130.8523,-0.76173,6.8,NULL,NULL,0.07,34.2,17,1.27,1.53,4.27,2.73,32.13,0,0),
	(603,X'4B61622E2052616A6120416D706174',X'4B61622E2052616A6120416D706174',X'5061707561',X'535742433130',2015,130.77098,-0.75523,18.07,NULL,NULL,0.07,44.27,2.8,3.07,5.73,9.07,3.4,13.53,0,0),
	(604,X'4B61622E2052616A6120416D706174',X'4B61622E2052616A6120416D706174',X'5061707561',X'535742433131',2015,130.66929,-0.77449,26.2,NULL,NULL,0.07,38.27,7.67,4.33,2.13,9,2.73,9.6,0,0),
	(605,X'4B61622E2052616A6120416D706174',X'4B61622E2052616A6120416D706174',X'5061707561',X'535742433132',2015,130.64483,-0.802,29.87,NULL,NULL,0.07,50.87,1.87,0.33,11.6,0.93,0.47,4,0,0),
	(606,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433031',2015,136.16812,-1.18444,3.33,0.4,2.93,0.2,32.27,0.07,0.33,0.4,3.4,47.4,12.6,0,0),
	(607,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433032',2015,136.20187,-1.17748,3.27,0,3.27,0.07,14.8,0.87,1.07,0,0.87,42.67,36.4,0,0),
	(608,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433033',2015,136.23296,-1.17233,28.6,0,28.6,0.13,38.2,0,0.33,2.13,13.87,5.2,11.53,0,0),
	(609,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433034',2015,136.27582,-1.1577,4.07,0.07,4,0,68.33,0,3.67,0.27,15.47,2.33,5.87,0,0),
	(610,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433035',2015,136.3115,-1.142,3.8,0.07,3.73,0,40.27,1.07,4.87,0.6,29.73,1.67,18,0,0),
	(611,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433036',2015,136.3465,-1.1192,16.6,0.2,16.4,0,20.8,5.87,0.93,1.93,26.73,15,12.13,0,0),
	(612,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433037',2015,136.374,-1.0911,4.27,0,4.27,0,25.07,3.07,0.87,3.07,9.33,31.2,23.13,0,0),
	(613,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433038',2015,136.20037,-1.25965,7.33,0,7.33,0,40.47,0.33,0.47,1.27,9.53,18,22.6,0,0),
	(614,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433039',2015,136.22638,-1.24275,12.73,0,12.73,0,51.87,9.2,1.73,1.13,13.33,3.8,6.2,0,0),
	(615,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433130',2015,136.2982,-1.2463,29.53,11.53,18,0,17.07,33.33,0.73,1.27,7.8,5.47,4.8,0,0),
	(616,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433131',2015,136.3048,-1.2237,4.2,0.33,3.87,0,33.27,21.4,0.87,0.4,11.53,6.07,22.2,0.07,0),
	(617,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433132',2015,136.3986,-1.2234,20.53,2.93,17.6,0.07,22.27,1.53,1.47,1.2,48.4,0.87,3.67,0,0),
	(618,X'4269616B204E756D666F72',X'4269616B204E756D666F72',X'5061707561',X'424941433133',2015,136.42683,-1.19603,16.8,6.67,10.13,0,47,1.07,1,0.93,25.6,0.33,7.27,0,0);

/*!40000 ALTER TABLE `terumbukarang` ENABLE KEYS */;
UNLOCK TABLES;



/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
