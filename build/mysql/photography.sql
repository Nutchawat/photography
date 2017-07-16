-- MySQL dump 10.16  Distrib 10.1.13-MariaDB, for osx10.6 (i386)
--
-- Host: localhost    Database: photography
-- ------------------------------------------------------
-- Server version	10.1.13-MariaDB

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
-- Table structure for table `tphotos`
--
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `photography` /*!40100 DEFAULT CHARACTER SET latin1 */;

USE `photography`;

DROP TABLE IF EXISTS `tphotos`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `tphotos` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `category` varchar(100) NOT NULL,
  `caption` varchar(500) DEFAULT NULL,
  `filename` varchar(500) DEFAULT NULL,
  `update_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `create_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `flg_mark` varchar(10) DEFAULT NULL,
  `subcategory` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=121 DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `tphotos`
--

LOCK TABLES `tphotos` WRITE;
/*!40000 ALTER TABLE `tphotos` DISABLE KEYS */;
INSERT INTO `tphotos` VALUES (20,'still','','_MG_8488.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(21,'still','','IMG_7089.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(22,'portrait','','M1.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(23,'portrait','','M2.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(24,'portrait','','M3.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(25,'portrait','','M4.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(26,'portrait','','M5.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(27,'portrait','','M6.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(28,'portrait','','M7.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(29,'personal','','_MG_0178.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(30,'personal','','_MG_0199.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(31,'personal','','_MG_0262.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(32,'personal','','_MG_0290.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(33,'personal','','_MG_0301.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(34,'personal','','NA1.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(35,'personal','','NA2.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(36,'personal','','NA3.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(37,'personal','','NA4.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(38,'personal','','NA5.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(39,'personal','','NA6.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(40,'personal','','NA7.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(41,'personal','','NA8.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(42,'personal','','NA9.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(43,'personal','','NA10.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(44,'personal','','NA11.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(45,'personal','','NA12.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,''),(50,'men','test','Chris6.jpg','2016-11-13 08:42:36','0000-00-00 00:00:00','cover','1'),(51,'men','','_N4A1421.jpg','2016-11-12 06:38:24','0000-00-00 00:00:00','cover','2'),(52,'men','','_N4A1447.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'2'),(53,'men','','_MG_5694.jpg','2016-11-12 06:38:39','0000-00-00 00:00:00','cover','3'),(54,'men','','_MG_5740.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'3'),(55,'men','','_MG_5887.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'3'),(56,'men','','_MG_7148.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'3'),(57,'men','','_MG_7247.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'3'),(58,'men','','THI1.jpg','2016-11-12 06:38:57','0000-00-00 00:00:00','cover','4'),(59,'men','','THI2.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'4'),(62,'men','','P1.jpg','2016-11-12 06:39:01','0000-00-00 00:00:00','cover','5'),(63,'men','','P2.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'5'),(64,'men','','P3.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'5'),(65,'men','','P4.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'5'),(67,'women','','_MG_5283.jpg','2016-11-12 06:40:44','0000-00-00 00:00:00','cover','1'),(68,'women','','_MG_5321.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'1'),(69,'women','','_MG_5393.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'1'),(71,'women','','_MG_3791.jpg','2016-11-12 06:40:44','0000-00-00 00:00:00','cover','2'),(72,'women','','_MG_3885.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'2'),(73,'women','','_MG_3997.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'2'),(74,'women','','_MG_4165.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'2'),(75,'women','','_MG_4215.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'2'),(76,'women','','_MG_4265.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'2'),(77,'women','','_MG_4361.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'2'),(78,'women','','_MG_2946.jpg','2016-11-12 06:40:44','0000-00-00 00:00:00','cover','3'),(79,'women','','_MG_2540.jpg','2016-11-12 06:40:44','0000-00-00 00:00:00','cover','4'),(80,'women','','_MG_2581.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'4'),(81,'women','','_MG_5017.jpg','2016-11-12 06:40:44','0000-00-00 00:00:00','cover','5'),(82,'women','','_MG_5071.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'5'),(83,'women','','_MG_5206.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'5'),(84,'women','','_MG_2660.jpg','2016-11-12 06:40:44','0000-00-00 00:00:00','cover','6'),(85,'women','','_MG_2782.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'6'),(86,'women','','_MG_2815.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'6'),(87,'women','','Duo1.jpg','2016-11-12 06:40:44','0000-00-00 00:00:00','cover','7'),(88,'women','','Duo3.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'7'),(89,'women','','JN1.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'7'),(90,'women','','MN1.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'7'),(91,'women','','NN1.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'7'),(92,'women','','NNN1.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'7'),(93,'women','','NS1.jpg','2016-11-12 06:40:44','0000-00-00 00:00:00','cover','8'),(94,'women','','NS3.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'8'),(96,'women','','Joy2.jpg','2016-11-12 06:40:44','0000-00-00 00:00:00','cover','9'),(97,'women','','Joy4.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'9'),(98,'women','','Joy5.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'9'),(99,'women','','_MG_2645.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'10'),(100,'women','','_MG_2663.jpg','2016-09-18 14:26:27','0000-00-00 00:00:00',NULL,'10'),(101,'still','','_MG_0060.jpg','2016-09-24 13:14:54','0000-00-00 00:00:00',NULL,''),(102,'still','','COLA.jpg','2016-09-24 13:16:03','0000-00-00 00:00:00',NULL,''),(103,'still','','8497741108_cd0f750f97_o.jpg','2016-11-06 05:07:19','0000-00-00 00:00:00',NULL,''),(104,'home',NULL,'7899651992_b09e5c1244_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(105,'home',NULL,'8496636515_ca9ef2a464_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(106,'home',NULL,'8496637137_f2b9769559_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(109,'home',NULL,'8496638777_6f091cdf76_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(110,'home',NULL,'8496639017_f65557a6a1_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(111,'home',NULL,'8496662681_53b4f10753_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(113,'home',NULL,'8497741108_cd0f750f97_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(114,'home',NULL,'8497741520_ec02001b37_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(115,'home',NULL,'8497766370_b70fe832ff_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(116,'home',NULL,'20434210351_f1254e5fa2_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(117,'home',NULL,'9852271744_3bcdc4bfff_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(118,'home',NULL,'9852293265_b690bfacc3_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(119,'home',NULL,'9852394115_538fb4dab3_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL),(120,'home',NULL,'20419330702_6a1c282b7f_o.jpg','2016-11-12 07:46:46','0000-00-00 00:00:00','slider',NULL);
/*!40000 ALTER TABLE `tphotos` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2016-11-14 21:54:23