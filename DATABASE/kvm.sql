-- MySQL dump 10.13  Distrib 8.0.39, for Linux (x86_64)
--
-- Host: localhost    Database: kvm
-- ------------------------------------------------------
-- Server version	8.0.39-0ubuntu0.20.04.1

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `board`
--

DROP TABLE IF EXISTS `board`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `board` (
  `id` int NOT NULL AUTO_INCREMENT,
  `device` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `encoder_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `ip_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `netmask` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `broadcast` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `board`
--

LOCK TABLES `board` WRITE;
/*!40000 ALTER TABLE `board` DISABLE KEYS */;
/*!40000 ALTER TABLE `board` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connect`
--

DROP TABLE IF EXISTS `connect`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connect` (
  `id` int NOT NULL AUTO_INCREMENT,
  `port_id` int DEFAULT NULL,
  `portname` varchar(255) DEFAULT NULL,
  `username` varchar(255) DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `decoder_name` varchar(255) DEFAULT NULL,
  `decoder_id` int DEFAULT NULL,
  `count` int DEFAULT NULL,
  `user_authority` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connect`
--

LOCK TABLES `connect` WRITE;
/*!40000 ALTER TABLE `connect` DISABLE KEYS */;
/*!40000 ALTER TABLE `connect` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `connections`
--

DROP TABLE IF EXISTS `connections`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `connections` (
  `connection_id` int NOT NULL AUTO_INCREMENT,
  `session_id` int NOT NULL,
  `user_id` int NOT NULL,
  PRIMARY KEY (`connection_id`),
  KEY `user_id` (`user_id`),
  KEY `connections_ibfk_1` (`session_id`),
  CONSTRAINT `connections_ibfk_1` FOREIGN KEY (`session_id`) REFERENCES `sessions` (`session_id`),
  CONSTRAINT `connections_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `username` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `connections`
--

LOCK TABLES `connections` WRITE;
/*!40000 ALTER TABLE `connections` DISABLE KEYS */;
/*!40000 ALTER TABLE `connections` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decoder`
--

DROP TABLE IF EXISTS `decoder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decoder` (
  `decoder_count` int NOT NULL,
  `ip_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `encoder_id` int NOT NULL,
  `decoder_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `decoder_type` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user_id` int NOT NULL,
  `mac_address` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `banner` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `thumbnailview` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastupdatedby` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `user_authority` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`decoder_count`),
  KEY `encoder_id` (`encoder_id`),
  CONSTRAINT `decoder_ibfk_2` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decoder`
--

LOCK TABLES `decoder` WRITE;
/*!40000 ALTER TABLE `decoder` DISABLE KEYS */;
INSERT INTO `decoder` VALUES (1,'192.168.1.121',1,'admin','remote',0,'','','','2024-08-16 06:46:09','View'),(2,'192.168.1.131',1,'user2','remote',3,'','','','2024-08-16 06:46:09','Share'),(3,'192.168.1.141',1,'','',1,'','','','2024-08-16 06:55:11',''),(4,'192.168.1.151',1,'','',1,'','','','2024-08-16 07:51:16','');
/*!40000 ALTER TABLE `decoder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `decoder_trigger` AFTER UPDATE ON `decoder` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(50);
    DECLARE new_value TEXT;
    DECLARE trigger_name VARCHAR(50);
    DECLARE decoder_encoder_id INT;

    SET trigger_name = 'decoder_trigger';

    IF NEW.decoder_count <> OLD.decoder_count THEN
        SET column_name = 'decoder_count';
        SET new_value = NEW.decoder_count;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.ip_address <> OLD.ip_address THEN
        SET column_name = 'ip_address';
        SET new_value = NEW.ip_address;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;



    IF NEW.encoder_id <> OLD.encoder_id THEN
        SET column_name = 'encoder_id';
        SET new_value = NEW.encoder_id;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;


    IF NEW.decoder_name <> OLD.decoder_name THEN
        SET column_name = 'decoder_name';
        SET new_value = NEW.decoder_name;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.decoder_type <> OLD.decoder_type THEN
        SET column_name = 'decoder_type';
        SET new_value = NEW.decoder_type;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.mac_address <> OLD.mac_address THEN
        SET column_name = 'mac_address';
        SET new_value = NEW.mac_address;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.banner <> OLD.banner THEN
        SET column_name = 'banner';
        SET new_value = NEW.banner;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                IF NEW.thumbnailview <> OLD.thumbnailview THEN
        SET column_name = 'thumbnailview';
        SET new_value = NEW.thumbnailview;
        SET decoder_encoder_id = NEW.encoder_id; 

        INSERT INTO decoder_log (decoder_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.decoder_count, 'decoder', column_name, new_value, decoder_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

 
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `decoder_log`
--

DROP TABLE IF EXISTS `decoder_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decoder_log` (
  `decoder_id` int NOT NULL,
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `encoder_id` int DEFAULT NULL,
  `id` int NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`id`),
  KEY `fk_encoder` (`encoder_id`),
  CONSTRAINT `fk_encoder` FOREIGN KEY (`encoder_id`) REFERENCES `switch` (`encoder_id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decoder_log`
--

LOCK TABLES `decoder_log` WRITE;
/*!40000 ALTER TABLE `decoder_log` DISABLE KEYS */;
INSERT INTO `decoder_log` VALUES (1,'decoder','ip_address','192.168.1.121','2024-08-16 06:43:00',1,1),(2,'decoder','ip_address','192.168.1.131','2024-08-16 06:43:31',1,2),(3,'decoder','ip_address','192.168.1.141','2024-08-16 06:43:41',1,3),(4,'decoder','ip_address','192.168.1.151','2024-08-16 06:43:49',1,4),(1,'decoder','decoder_type','remote','2024-08-16 06:46:09',1,5),(2,'decoder','decoder_type','remote','2024-08-16 06:46:09',1,6),(3,'decoder','decoder_type','remote','2024-08-16 06:46:09',1,7),(4,'decoder','decoder_type','remote','2024-08-16 06:46:09',1,8);
/*!40000 ALTER TABLE `decoder_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `decoder_status`
--

DROP TABLE IF EXISTS `decoder_status`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `decoder_status` (
  `id` int NOT NULL AUTO_INCREMENT,
  `decoder_id` int DEFAULT NULL,
  `user_id` int DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT NULL,
  `logout_time` timestamp NULL DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `decoder_status`
--

LOCK TABLES `decoder_status` WRITE;
/*!40000 ALTER TABLE `decoder_status` DISABLE KEYS */;
INSERT INTO `decoder_status` VALUES (1,1,1,'2024-08-16 06:55:11',NULL),(2,2,1,'2024-08-16 07:51:16',NULL);
/*!40000 ALTER TABLE `decoder_status` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kvm_log`
--

DROP TABLE IF EXISTS `kvm_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvm_log` (
  `kvm_id` int NOT NULL,
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kvm_log`
--

LOCK TABLES `kvm_log` WRITE;
/*!40000 ALTER TABLE `kvm_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `kvm_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `kvmname`
--

DROP TABLE IF EXISTS `kvmname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `kvmname` (
  `id` int NOT NULL AUTO_INCREMENT,
  `kvmname` varchar(30) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NOT NULL,
  `language` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `banner` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `encryption` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hotkey` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `time` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastUpdatedBy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `bannertime` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `kvmname`
--

LOCK TABLES `kvmname` WRITE;
/*!40000 ALTER TABLE `kvmname` DISABLE KEYS */;
INSERT INTO `kvmname` VALUES (1,'RACK1_KVM2024','English','ON','Disable','< Scroll Lock>','2024 / 08 / 06 12 : 35','C:/xampp1/htdocs/user1 (2).sql','2024-07-29 11:32:35',8);
/*!40000 ALTER TABLE `kvmname` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `kvm_trigger` AFTER UPDATE ON `kvmname` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(255);
    DECLARE new_value VARCHAR(255);
    DECLARE trigger_name VARCHAR(255);

 SET trigger_name='kvm_trigger';
    IF NEW.kvmname <> OLD.kvmname THEN
        SET column_name = 'kvmname';
        SET new_value = NEW.kvmname;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.language <> OLD.language THEN
        SET column_name = 'language';
        SET new_value = NEW.language;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.banner <> OLD.banner THEN
        SET column_name = 'banner';
        SET new_value = NEW.banner;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.encryption <> OLD.encryption THEN
        SET column_name = 'encryption';
        SET new_value = NEW.encryption;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.hotkey <> OLD.hotkey THEN
        SET column_name = 'hotkey';
        SET new_value = NEW.hotkey;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.time <> OLD.time THEN
        SET column_name = 'time';
        SET new_value = NEW.time;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.path <> OLD.path THEN
        SET column_name = 'path';
        SET new_value = NEW.path;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.bannertime <> OLD.bannertime THEN
        SET column_name = 'bannertime';
        SET new_value = NEW.bannertime;
        INSERT INTO kvm_log (kvm_id, table_name, column_name, new_value) VALUES (OLD.id, 'kvmname', column_name, new_value);
        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `local_decoder`
--

DROP TABLE IF EXISTS `local_decoder`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local_decoder` (
  `id` int NOT NULL AUTO_INCREMENT,
  `encoder_id` int NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `connect` int DEFAULT NULL,
  `last_updated` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_decoder`
--

LOCK TABLES `local_decoder` WRITE;
/*!40000 ALTER TABLE `local_decoder` DISABLE KEYS */;
/*!40000 ALTER TABLE `local_decoder` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `local_trigger` AFTER UPDATE ON `local_decoder` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(50);
    DECLARE new_value TEXT;
    DECLARE trigger_name VARCHAR(50);
    DECLARE local_encoder_id INT;

    SET trigger_name = 'local_trigger';

    IF NEW.encoder_id <> OLD.encoder_id THEN
        SET column_name = 'encoder_id';
        SET new_value = NEW.encoder_id;
        SET local_encoder_id = NEW.encoder_id; 

        INSERT INTO local_log (local_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.id, 'local_decoder', column_name, new_value, local_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.ip_address <> OLD.ip_address THEN
        SET column_name = 'ip_address';
        SET new_value = NEW.ip_address;
        SET local_encoder_id = NEW.encoder_id; 

        INSERT INTO local_log (local_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.id, 'local_decoder', column_name, new_value, local_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.connect <> OLD.connect THEN
        SET column_name = 'connect';
        SET new_value = NEW.connect;
        SET local_encoder_id = NEW.encoder_id; 

        INSERT INTO local_log (local_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.id, 'local_decoder', column_name, new_value, local_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.last_updated <> OLD.last_updated THEN
        SET column_name = 'last_updated';
        SET new_value = NEW.last_updated;
        SET local_encoder_id = NEW.encoder_id; 

        INSERT INTO local_log (local_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.id, 'local_decoder', column_name, new_value, local_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.username <> OLD.username THEN
        SET column_name = 'username';
        SET new_value = NEW.username;
        SET local_encoder_id = NEW.encoder_id; 

        INSERT INTO local_log (local_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.id, 'local_decoder', column_name, new_value, local_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.password <> OLD.password THEN
        SET column_name = 'password';
        SET new_value = NEW.password;
        SET local_encoder_id = NEW.encoder_id; 

        INSERT INTO local_log (local_id, table_name, column_name, new_value, encoder_id)
        VALUES (NEW.id, 'local_decoder', column_name, new_value, local_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `local_log`
--

DROP TABLE IF EXISTS `local_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `local_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `encoder_id` int NOT NULL,
  `ip_address` varchar(255) NOT NULL,
  `changed_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `connect` int DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `local_log`
--

LOCK TABLES `local_log` WRITE;
/*!40000 ALTER TABLE `local_log` DISABLE KEYS */;
INSERT INTO `local_log` VALUES (1,3,'160.1.1.1','2024-04-25 07:52:40',NULL),(2,8,'10.5.5.2','2024-04-25 07:56:16',NULL),(3,8,'10.5.5.2','2024-04-25 08:00:13',1),(4,15,'12.2.2.2','2024-04-25 08:00:35',1),(5,2,'170.1.1.2','2024-04-29 09:17:19',1),(6,3,'160.1.1.1','2024-04-29 10:34:07',1),(7,5,'140.1.1.1','2024-04-29 12:07:07',1),(8,2,'170.1.1.2','2024-04-29 12:07:27',1),(9,4,'4.168.1.1','2024-05-27 11:19:35',1),(10,6,'6.168.1.1','2024-05-27 11:20:06',1),(11,7,'7.168.1.1','2024-05-27 11:20:36',1),(12,2,'2.168.1.1','2024-05-28 04:58:47',1),(13,5,'5.168.1.1','2024-05-28 05:00:50',1),(14,4,'4.168.1.1','2024-05-28 05:01:21',1),(15,2,'2.168.1.1','2024-05-28 05:04:46',1);
/*!40000 ALTER TABLE `local_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `logs`
--

DROP TABLE IF EXISTS `logs`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `logs` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `action_made` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `date_created` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `event` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=851 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `logs`
--

LOCK TABLES `logs` WRITE;
/*!40000 ALTER TABLE `logs` DISABLE KEYS */;
INSERT INTO `logs` VALUES (1,11,'Logged out.','2023-02-26 21:31:29','Access Logout'),(2,11,'Logged in','2023-02-26 21:32:19','Access Login'),(3,3,'Logged in','2023-02-28 01:57:59','Access Login'),(4,3,'Logged out.','2023-02-28 01:58:07','Access Logout'),(5,5,'Logged in','2023-02-28 01:58:31','Access Login'),(6,16,'Logged in','2023-02-28 02:09:16','Access Login'),(7,16,'Logged out.','2023-02-28 02:09:20','Access Logout'),(8,5,'Logged in','2023-02-28 02:09:38','Access Login'),(9,8,'Logged in','2023-02-28 02:13:53','Access Login'),(10,8,'Logged out.','2023-02-28 03:50:38','Access Logout'),(11,5,'Logged in','2023-02-28 05:14:40','Access Login'),(12,5,'Logged out.','2023-02-28 05:55:55','Access Logout'),(13,11,'Logged in','2023-02-28 05:56:15','Access Login'),(14,11,'Logged out.','2023-02-28 05:59:21','Access Logout'),(15,4,'Logged in','2023-02-28 06:00:08','Access Login'),(16,4,'Logged out.','2023-02-28 06:00:16','Access Logout'),(17,15,'Logged in','2023-02-28 06:00:23','Access Login'),(18,15,'Logged out.','2023-02-28 06:00:25','Access Logout'),(19,5,'Logged in','2023-02-28 06:00:31','Access Login'),(20,5,'Logged out.','2023-02-28 19:24:25','Access Logout'),(21,12,'Logged in','2023-02-28 19:24:40','Access Login'),(22,12,'Logged out.','2023-02-28 19:24:46','Access Logout'),(23,6,'Logged in','2023-02-28 19:24:55','Access Login'),(24,6,'Logged out.','2023-02-28 19:24:58','Access Logout'),(25,11,'Logged in','2023-02-28 19:25:22','Access Login'),(26,1,'Logged in','2024-02-23 00:11:27','Access Login'),(27,1,'Logged in','2024-02-25 04:01:35','Access Login'),(28,1,'Logged in','2024-02-27 04:45:19','Access Login'),(29,1,'Logged in','2024-02-28 01:48:43','Access Login'),(30,1,'Logged in','2024-02-28 01:49:00','Access Login'),(31,1,'Logged in','2024-02-28 02:01:49','Access Login'),(32,1,'Logged in','2024-02-28 02:50:40','Access Login'),(33,1,'Logged in','2024-02-28 03:20:18','Access Login'),(34,1,'Logged in','2024-02-28 03:40:08','Access Login'),(35,1,'Logged in','2024-02-28 03:59:08','Access Login'),(36,1,'Logged in','2024-02-28 04:26:52','Access Login'),(37,1,'Logged in','2024-02-28 04:31:06','Access Login'),(38,1,'Logged in','2024-02-28 04:41:39','Access Login'),(39,1,'Logged in','2024-02-28 20:52:18','Access Login'),(40,1,'Logged in','2024-02-28 21:51:02','Access Login'),(41,2,'Logged out.','2024-02-28 21:51:09','Access Logout'),(42,1,'Logged in','2024-02-28 21:51:14','Access Login'),(43,1,'Logged in','2024-03-03 21:14:28','Access Login'),(44,9,'Logged out.','2024-03-03 23:36:05','Access Logout'),(45,14,'Logged out.','2024-03-03 23:42:44','Access Logout'),(46,14,'Logged out.','2024-03-03 23:43:15','Access Logout'),(47,14,'Logged out.','2024-03-03 23:51:25','Access Logout'),(48,2,'Logged out.','2024-03-03 23:55:00','Access Logout'),(49,14,'Logged out.','2024-03-03 23:55:23','Access Logout'),(50,9,'Logged out.','2024-03-03 23:58:03','Access Logout'),(51,9,'Logged out.','2024-03-04 00:04:35','Access Logout'),(52,2,'Logged out.','2024-03-04 00:05:46','Access Logout'),(53,9,'Logged out.','2024-03-04 00:08:52','Access Logout'),(54,15,'Logged out.','2024-03-04 00:10:07','Access Logout'),(55,14,'Logged out.','2024-03-04 00:14:29','Access Logout'),(56,14,'Logged out.','2024-03-04 00:20:12','Access Logout'),(57,9,'Logged out.','2024-03-04 00:27:03','Access Logout'),(58,1,'Logged out.','2024-03-04 00:30:29','Access Logout'),(59,1,'Logged out.','2024-03-04 00:32:44','Access Logout'),(60,1,'Logged out.','2024-03-04 00:35:15','Access Logout'),(61,2,'Logged out.','2024-03-04 00:38:04','Access Logout'),(62,1,'Logged out.','2024-03-04 00:38:26','Access Logout'),(63,1,'Logged out.','2024-03-04 00:38:26','Access Logout'),(64,14,'Logged out.','2024-03-04 00:41:53','Access Logout'),(65,9,'Logged out.','2024-03-04 00:45:52','Access Logout'),(66,2,'Logged out.','2024-03-04 00:54:47','Access Logout'),(67,1,'Logged out.','2024-03-04 00:55:18','Access Logout'),(68,1,'Logged in.','2024-03-07 00:55:16','Access Login'),(69,2,'Logged in.','2024-03-07 00:59:31','Access Login'),(70,1,'Logged in.','2024-03-07 01:23:21','Access Login'),(71,2,'Logged in.','2024-03-07 02:29:03','Access Login'),(72,1,'Logged in.','2024-03-07 03:15:48','Access Login'),(73,1,'Logged in.','2024-03-07 04:11:12','Access Login'),(74,1,'Logged in.','2024-03-07 20:31:52','Access Login'),(75,1,'Logged in.','2024-03-08 01:00:22','Access Login'),(76,1,'Logged in.','2024-03-08 01:29:05','Access Login'),(77,1,'Logged out.','2024-03-08 01:30:49','Access Logout'),(78,1,'Logged in.','2024-03-10 21:54:45','Access Login'),(79,1,'Logged in.','2024-03-10 22:51:10','Access Login'),(80,2,'Logged in.','2024-03-10 23:51:09','Access Login'),(81,16,'Logged in.','2024-03-10 23:51:45','Access Login'),(82,2,'Logged out.','2024-03-10 23:59:16','Access Logout'),(83,1,'Logged in.','2024-03-10 23:59:26','Access Login'),(84,1,'Logged out.','2024-03-11 01:50:41','Access Logout'),(85,16,'Logged in.','2024-03-11 01:51:19','Access Login'),(86,16,'Logged out.','2024-03-11 01:52:37','Access Logout'),(87,2,'Logged in.','2024-03-11 01:52:54','Access Login'),(88,2,'Logged out.','2024-03-11 01:54:19','Access Logout'),(89,1,'Logged in.','2024-03-11 01:54:29','Access Login'),(90,1,'Logged out.','2024-03-11 01:56:28','Access Logout'),(91,14,'Logged in.','2024-03-11 01:56:39','Access Login'),(92,14,'Logged out.','2024-03-11 01:59:57','Access Logout'),(93,16,'Logged in.','2024-03-11 02:00:13','Access Login'),(94,16,'Logged out.','2024-03-11 02:01:07','Access Logout'),(95,1,'Logged in.','2024-03-11 02:01:18','Access Login'),(96,1,'Logged out.','2024-03-11 02:10:28','Access Logout'),(97,1,'Logged in.','2024-03-11 02:10:51','Access Login'),(98,16,'Logged in.','2024-03-11 02:16:20','Access Login'),(99,16,'Logged out.','2024-03-11 02:18:38','Access Logout'),(100,14,'Logged in.','2024-03-11 02:19:40','Access Login'),(101,14,'Logged out.','2024-03-11 02:33:04','Access Logout'),(102,2,'Logged in.','2024-03-11 02:34:46','Access Login'),(103,2,'Logged out.','2024-03-11 02:39:22','Access Logout'),(104,1,'Logged in.','2024-03-11 02:39:35','Access Login'),(105,1,'Logged out.','2024-03-11 02:41:33','Access Logout'),(106,2,'Logged in.','2024-03-11 02:44:57','Access Login'),(107,2,'Logged out.','2024-03-11 02:54:59','Access Logout'),(108,1,'Logged in.','2024-03-11 02:55:15','Access Login'),(109,1,'Logged out.','2024-03-11 03:00:39','Access Logout'),(110,2,'Logged in.','2024-03-11 03:00:48','Access Login'),(111,2,'Logged out.','2024-03-11 03:03:17','Access Logout'),(112,2,'Logged in.','2024-03-11 03:03:32','Access Login'),(113,2,'Logged out.','2024-03-11 03:11:06','Access Logout'),(114,16,'Logged in.','2024-03-11 03:11:17','Access Login'),(115,16,'Logged in.','2024-03-11 03:14:15','Access Login'),(116,2,'Logged in.','2024-03-11 03:53:53','Access Login'),(117,2,'Logged out.','2024-03-11 04:07:23','Access Logout'),(118,1,'Logged in.','2024-03-11 04:07:31','Access Login'),(119,1,'Logged out.','2024-03-11 04:15:32','Access Logout'),(120,1,'Logged in.','2024-03-11 04:15:55','Access Login'),(121,1,'Logged in.','2024-03-11 22:12:17','Access Login'),(122,1,'Logged out.','2024-03-11 23:04:51','Access Logout'),(123,2,'Logged in.','2024-03-11 23:04:59','Access Login'),(124,2,'Logged out.','2024-03-12 00:39:57','Access Logout'),(125,16,'Logged in.','2024-03-12 00:40:14','Access Login'),(126,16,'Logged out.','2024-03-12 00:44:20','Access Logout'),(127,1,'Logged in.','2024-03-12 00:44:26','Access Login'),(128,2,'Logged in.','2024-03-12 00:46:36','Access Login'),(129,3,'Logged in.','2024-03-12 00:58:39','Access Login'),(130,3,'Logged out.','2024-03-12 01:03:15','Access Logout'),(131,16,'Logged in.','2024-03-12 01:03:24','Access Login'),(132,2,'Logged in.','2024-03-12 01:28:22','Access Login'),(133,2,'Logged out.','2024-03-12 01:30:31','Access Logout'),(134,2,'Logged in.','2024-03-12 01:30:58','Access Login'),(135,3,'Logged in.','2024-03-12 01:31:07','Access Login'),(136,3,'Logged out.','2024-03-12 02:39:50','Access Logout'),(137,4,'Logged in.','2024-03-12 02:40:09','Access Login'),(138,16,'Logged in.','2024-03-12 03:33:32','Access Login'),(139,1,'Logged in.','2024-03-12 21:58:25','Access Login'),(140,2,'Logged in.','2024-03-12 23:30:31','Access Login'),(141,3,'Logged in.','2024-03-12 23:30:49','Access Login'),(142,2,'Logged in.','2024-03-13 02:11:49','Access Login'),(143,1,'Logged in.','2024-03-13 02:16:29','Access Login'),(144,16,'Logged in.','2024-03-13 02:29:35','Access Login'),(145,3,'Logged in.','2024-03-13 02:30:49','Access Login'),(146,1,'Logged in.','2024-03-13 04:06:14','Access Login'),(147,14,'Logged in.','2024-03-13 05:07:52','Access Login'),(148,1,'Logged in.','2024-03-13 05:47:54','Access Login'),(149,1,'Logged in.','2024-03-13 08:15:05','Access Login'),(150,2,'Logged in.','2024-03-13 08:15:49','Access Login'),(151,3,'Logged in.','2024-03-13 09:13:42','Access Login'),(152,1,'Logged in.','2024-03-13 21:52:27','Access Login'),(153,1,'Logged in.','2024-03-13 23:09:32','Access Login'),(154,16,'Logged in.','2024-03-14 03:08:59','Access Login'),(155,2,'Logged in.','2024-03-14 03:16:39','Access Login'),(156,2,'Logged in.','2024-03-14 03:30:34','Access Login'),(157,2,'Logged in.','2024-03-14 03:59:58','Access Login'),(158,16,'Logged in.','2024-03-14 05:15:08','Access Login'),(159,3,'Logged in.','2024-03-14 05:27:21','Access Login'),(160,2,'Logged in.','2024-03-14 05:29:05','Access Login'),(161,1,'Logged in.','2024-03-14 06:42:16','Access Login'),(162,3,'Logged in.','2024-03-14 06:42:26','Access Login'),(163,2,'Logged in.','2024-03-14 06:42:44','Access Login'),(164,16,'Logged in.','2024-03-14 06:44:47','Access Login'),(165,16,'Logged out.','2024-03-14 06:45:29','Access Logout'),(166,16,'Logged in.','2024-03-14 06:45:46','Access Login'),(167,16,'Logged in.','2024-03-14 06:51:47','Access Login'),(168,2,'Logged in.','2024-03-14 06:58:47','Access Login'),(169,3,'Logged in.','2024-03-14 07:03:18','Access Login'),(170,2,'Logged in.','2024-03-14 07:09:45','Access Login'),(171,1,'Logged in.','2024-03-14 21:34:34','Access Login'),(172,1,'Logged out.','2024-03-14 21:40:40','Access Logout'),(173,1,'Logged in.','2024-03-14 21:40:47','Access Login'),(174,1,'Logged out.','2024-03-14 21:41:38','Access Logout'),(175,1,'Logged in.','2024-03-14 21:41:45','Access Login'),(176,2,'Logged in.','2024-03-14 22:12:03','Access Login'),(177,3,'Logged in.','2024-03-14 23:36:21','Access Login'),(178,1,'Logged in.','2024-03-15 00:24:33','Access Login'),(179,2,'Logged in.','2024-03-15 00:25:00','Access Login'),(180,2,'Logged in.','2024-03-15 00:26:19','Access Login'),(181,16,'Logged in.','2024-03-15 01:49:07','Access Login'),(182,2,'Logged in.','2024-03-15 01:50:16','Access Login'),(183,3,'Logged in.','2024-03-15 01:52:09','Access Login'),(184,1,'Logged in.','2024-03-15 05:07:44','Access Login'),(185,16,'Logged in.','2024-03-15 05:09:54','Access Login'),(186,3,'Logged in.','2024-03-15 05:10:57','Access Login'),(187,3,'Logged out.','2024-03-15 05:18:09','Access Logout'),(188,4,'Logged in.','2024-03-15 05:18:21','Access Login'),(189,3,'Logged in.','2024-03-15 05:18:50','Access Login'),(190,1,'Logged in.','2024-03-15 05:22:43','Access Login'),(191,3,'Logged in.','2024-03-15 05:23:01','Access Login'),(192,2,'Logged in.','2024-03-15 05:23:29','Access Login'),(193,1,'Logged out.','2024-03-15 05:26:35','Access Logout'),(194,2,'Logged out.','2024-03-15 05:26:38','Access Logout'),(195,1,'Logged in.','2024-03-15 05:27:16','Access Login'),(196,3,'Logged in.','2024-03-15 05:27:34','Access Login'),(197,2,'Logged in.','2024-03-15 05:27:56','Access Login'),(198,2,'Logged out.','2024-03-15 05:30:32','Access Logout'),(199,3,'Logged out.','2024-03-15 05:30:36','Access Logout'),(200,2,'Logged in.','2024-03-15 05:30:58','Access Login'),(201,16,'Logged in.','2024-03-15 05:31:15','Access Login'),(202,3,'Logged in.','2024-03-15 05:34:54','Access Login'),(203,3,'Logged out.','2024-03-15 05:38:43','Access Logout'),(204,16,'Logged out.','2024-03-15 05:38:51','Access Logout'),(205,4,'Logged in.','2024-03-15 05:39:17','Access Login'),(206,2,'Logged in.','2024-03-15 05:39:36','Access Login'),(207,1,'Logged in.','2024-03-15 05:42:55','Access Login'),(208,16,'Logged in.','2024-03-15 05:44:57','Access Login'),(209,1,'Logged out.','2024-03-15 05:52:48','Access Logout'),(210,16,'Logged out.','2024-03-15 05:52:56','Access Logout'),(211,4,'Logged out.','2024-03-15 05:53:09','Access Logout'),(212,2,'Logged out.','2024-03-15 05:53:26','Access Logout'),(213,16,'Logged in.','2024-03-15 05:53:55','Access Login'),(214,2,'Logged in.','2024-03-15 05:54:13','Access Login'),(215,2,'Logged in.','2024-03-15 05:54:35','Access Login'),(216,2,'Logged out.','2024-03-15 05:54:44','Access Logout'),(217,3,'Logged in.','2024-03-15 05:54:59','Access Login'),(218,14,'Logged in.','2024-03-15 05:55:19','Access Login'),(219,2,'Logged in.','2024-03-15 05:55:35','Access Login'),(220,1,'Logged in.','2024-03-18 21:36:25','Access Login'),(221,2,'Logged in.','2024-03-18 21:36:41','Access Login'),(222,16,'Logged in.','2024-03-18 21:37:09','Access Login'),(223,4,'Logged in.','2024-03-18 23:30:00','Access Login'),(224,2,'Logged in.','2024-03-18 23:32:41','Access Login'),(225,2,'Logged out.','2024-03-18 23:38:45','Access Logout'),(226,4,'Logged out.','2024-03-18 23:39:19','Access Logout'),(227,16,'Logged out.','2024-03-18 23:40:38','Access Logout'),(228,1,'Logged out.','2024-03-18 23:42:03','Access Logout'),(229,4,'Logged in.','2024-03-18 23:43:41','Access Login'),(230,5,'Logged in.','2024-03-18 23:46:29','Access Login'),(231,6,'Logged in.','2024-03-18 23:46:46','Access Login'),(232,4,'Logged in.','2024-03-19 00:18:33','Access Login'),(233,5,'Logged in.','2024-03-19 00:18:41','Access Login'),(234,6,'Logged in.','2024-03-19 00:18:51','Access Login'),(235,1,'Logged in.','2024-03-19 00:22:22','Access Login'),(236,1,'Logged out.','2024-03-19 00:23:21','Access Logout'),(237,6,'Logged out.','2024-03-19 00:46:23','Access Logout'),(238,6,'Logged in.','2024-03-19 00:46:53','Access Login'),(239,2,'Logged in.','2024-03-19 00:50:02','Access Login'),(240,6,'Logged out.','2024-03-19 01:23:18','Access Logout'),(241,1,'Logged in.','2024-03-19 01:25:51','Access Login'),(242,1,'Logged out.','2024-03-19 01:28:33','Access Logout'),(243,4,'Logged in.','2024-03-19 01:35:20','Access Login'),(244,4,'Logged out.','2024-03-19 01:41:55','Access Logout'),(245,5,'Logged in.','2024-03-19 01:42:05','Access Login'),(246,6,'Logged in.','2024-03-19 01:43:05','Access Login'),(247,5,'Logged in.','2024-03-19 01:43:58','Access Login'),(248,5,'Logged in.','2024-03-19 01:44:38','Access Login'),(249,4,'Logged in.','2024-03-19 01:45:38','Access Login'),(250,6,'Logged in.','2024-03-19 01:46:46','Access Login'),(251,1,'Logged in.','2024-03-19 01:52:41','Access Login'),(252,1,'Logged out.','2024-03-19 01:53:28','Access Logout'),(253,1,'Logged in.','2024-03-19 01:54:00','Access Login'),(254,2,'Logged out.','2024-03-19 01:54:22','Access Logout'),(255,6,'Logged out.','2024-03-19 01:54:34','Access Logout'),(256,6,'Logged in.','2024-03-19 01:54:52','Access Login'),(257,6,'Logged in.','2024-03-19 01:58:49','Access Login'),(258,6,'Logged in.','2024-03-19 01:59:50','Access Login'),(259,4,'Logged in.','2024-03-19 02:00:35','Access Login'),(260,4,'Logged out.','2024-03-19 02:01:50','Access Logout'),(261,1,'Logged in.','2024-03-19 02:02:19','Access Login'),(262,5,'Logged in.','2024-03-19 02:02:39','Access Login'),(263,6,'Logged in.','2024-03-19 02:02:56','Access Login'),(264,4,'Logged in.','2024-03-19 02:03:28','Access Login'),(265,4,'Logged out.','2024-03-19 02:04:01','Access Logout'),(266,4,'Logged in.','2024-03-19 02:04:21','Access Login'),(267,4,'Logged out.','2024-03-19 02:47:10','Access Logout'),(268,4,'Logged in.','2024-03-19 02:47:29','Access Login'),(269,6,'Logged in.','2024-03-19 03:00:57','Access Login'),(270,4,'Logged out.','2024-03-19 03:03:01','Access Logout'),(271,5,'Logged in.','2024-03-19 03:03:24','Access Login'),(272,5,'Logged out.','2024-03-19 03:39:24','Access Logout'),(273,6,'Logged in.','2024-03-19 03:39:33','Access Login'),(274,6,'Logged out.','2024-03-19 03:41:20','Access Logout'),(275,5,'Logged in.','2024-03-19 03:41:35','Access Login'),(276,5,'Logged out.','2024-03-19 04:12:58','Access Logout'),(277,4,'Logged in.','2024-03-19 04:13:11','Access Login'),(278,1,'Logged in.','2024-03-19 07:35:11','Access Login'),(279,5,'Logged in.','2024-03-19 22:16:08','Access Login'),(280,5,'Logged out.','2024-03-19 22:19:47','Access Logout'),(281,4,'Logged in.','2024-03-19 22:19:53','Access Login'),(282,5,'Logged in.','2024-03-20 00:09:12','Access Login'),(283,4,'Logged in.','2024-03-20 00:11:48','Access Login'),(284,5,'Logged out.','2024-03-20 00:17:12','Access Logout'),(285,4,'Logged out.','2024-03-20 00:17:27','Access Logout'),(286,1,'Logged in.','2024-03-20 00:18:55','Access Login'),(287,1,'Logged out.','2024-03-20 00:22:06','Access Logout'),(288,1,'Logged in.','2024-03-20 00:23:40','Access Login'),(289,3,'Logged in.','2024-03-20 00:24:08','Access Login'),(290,5,'Logged in.','2024-03-20 00:24:54','Access Login'),(291,6,'Logged in.','2024-03-20 00:25:24','Access Login'),(292,6,'Logged in.','2024-03-20 02:12:17','Access Login'),(293,3,'Logged in.','2024-03-20 02:12:33','Access Login'),(294,5,'Logged in.','2024-03-20 02:12:58','Access Login'),(295,1,'Logged in.','2024-03-20 03:05:41','Access Login'),(296,5,'Logged in.','2024-03-20 03:34:29','Access Login'),(297,5,'Logged out.','2024-03-20 03:36:39','Access Logout'),(298,1,'Logged out.','2024-03-20 03:37:09','Access Logout'),(299,3,'Logged in.','2024-03-20 03:37:57','Access Login'),(300,1,'Logged in.','2024-03-20 03:38:18','Access Login'),(301,5,'Logged in.','2024-03-20 03:38:48','Access Login'),(302,6,'Logged in.','2024-03-20 03:41:57','Access Login'),(303,6,'Logged in.','2024-03-20 05:12:25','Access Login'),(304,3,'Logged in.','2024-03-20 05:13:39','Access Login'),(305,1,'Logged in.','2024-03-20 05:14:54','Access Login'),(306,5,'Logged in.','2024-03-20 05:15:34','Access Login'),(307,1,'Logged in.','2024-03-21 22:10:57','Access Login'),(308,2,'Logged in.','2024-03-21 22:47:56','Access Login'),(309,2,'Logged out.','2024-03-21 22:48:38','Access Logout'),(310,1,'Logged in.','2024-03-21 22:48:58','Access Login'),(311,1,'Logged out.','2024-03-21 22:49:53','Access Logout'),(312,2,'Logged in.','2024-03-21 22:50:00','Access Login'),(313,2,'Logged out.','2024-03-21 22:52:36','Access Logout'),(314,2,'Logged in.','2024-03-21 22:52:42','Access Login'),(315,2,'Logged out.','2024-03-21 22:53:44','Access Logout'),(316,1,'Logged in.','2024-03-21 22:53:52','Access Login'),(317,2,'Logged in.','2024-03-21 23:04:29','Access Login'),(318,2,'Logged out.','2024-03-21 23:16:30','Access Logout'),(319,1,'Logged in.','2024-03-21 23:16:36','Access Login'),(320,5,'Logged in.','2024-03-21 23:17:13','Access Login'),(321,5,'Logged out.','2024-03-21 23:22:08','Access Logout'),(322,2,'Logged in.','2024-03-21 23:22:18','Access Login'),(323,2,'Logged out.','2024-03-21 23:23:01','Access Logout'),(324,6,'Logged in.','2024-03-21 23:23:22','Access Login'),(325,1,'Logged in.','2024-03-22 00:01:42','Access Login'),(326,2,'Logged in.','2024-03-22 00:01:51','Access Login'),(327,6,'Logged in.','2024-03-22 00:15:02','Access Login'),(328,6,'Logged in.','2024-03-22 00:26:01','Access Login'),(329,1,'Logged in.','2024-03-22 00:26:28','Access Login'),(330,6,'Logged in.','2024-03-22 01:10:39','Access Login'),(331,6,'Logged out.','2024-03-22 01:11:25','Access Logout'),(332,5,'Logged in.','2024-03-22 01:11:34','Access Login'),(333,5,'Logged out.','2024-03-22 01:24:12','Access Logout'),(334,2,'Logged in.','2024-03-22 01:28:45','Access Login'),(335,2,'Logged out.','2024-03-22 01:40:35','Access Logout'),(336,1,'Logged in.','2024-03-22 01:40:42','Access Login'),(337,1,'Logged out.','2024-03-22 01:48:49','Access Logout'),(338,1,'Logged in.','2024-03-22 01:48:55','Access Login'),(339,1,'Logged out.','2024-03-22 01:50:45','Access Logout'),(340,5,'Logged in.','2024-03-22 01:50:52','Access Login'),(341,5,'Logged out.','2024-03-22 01:51:02','Access Logout'),(342,6,'Logged in.','2024-03-22 01:51:08','Access Login'),(343,6,'Logged out.','2024-03-22 01:51:52','Access Logout'),(344,1,'Logged in.','2024-03-25 22:00:13','Access Login'),(345,2,'Logged in.','2024-03-25 22:01:28','Access Login'),(346,2,'Logged out.','2024-03-25 22:03:49','Access Logout'),(347,1,'Logged in.','2024-03-25 22:03:55','Access Login'),(348,1,'Logged out.','2024-03-25 22:55:08','Access Logout'),(349,16,'Logged in.','2024-03-25 22:55:19','Access Login'),(350,16,'Logged out.','2024-03-25 22:59:05','Access Logout'),(351,2,'Logged in.','2024-03-25 22:59:13','Access Login'),(352,2,'Logged out.','2024-03-25 22:59:42','Access Logout'),(353,1,'Logged in.','2024-03-25 22:59:52','Access Login'),(354,1,'Logged in.','2024-03-25 23:20:37','Access Login'),(355,5,'Logged in.','2024-03-25 23:26:11','Access Login'),(356,16,'Logged in.','2024-03-25 23:26:39','Access Login'),(357,1,'Logged out.','2024-03-26 00:09:02','Access Logout'),(358,5,'Logged in.','2024-03-26 00:09:12','Access Login'),(359,16,'Logged in.','2024-03-26 00:17:25','Access Login'),(360,16,'Logged in.','2024-03-26 00:17:55','Access Login'),(361,16,'Logged out.','2024-03-26 00:26:09','Access Logout'),(362,5,'Logged in.','2024-03-26 00:31:32','Access Login'),(363,16,'Logged in.','2024-03-26 00:32:41','Access Login'),(364,16,'Logged out.','2024-03-26 00:33:37','Access Logout'),(365,5,'Logged out.','2024-03-26 00:34:12','Access Logout'),(366,16,'Logged in.','2024-03-26 00:38:15','Access Login'),(367,16,'Logged out.','2024-03-26 00:38:49','Access Logout'),(368,16,'Logged in.','2024-03-26 00:39:05','Access Login'),(369,16,'Logged out.','2024-03-26 00:41:27','Access Logout'),(370,2,'Logged in.','2024-03-26 00:42:39','Access Login'),(371,2,'Logged out.','2024-03-26 01:27:09','Access Logout'),(372,1,'Logged in.','2024-03-26 01:27:57','Access Login'),(373,1,'Logged in.','2024-03-26 01:46:53','Access Login'),(374,1,'Logged in.','2024-03-26 03:49:18','Access Login'),(375,16,'Logged in.','2024-03-26 04:13:20','Access Login'),(376,5,'Logged in.','2024-03-26 21:45:29','Access Login'),(377,5,'Logged out.','2024-03-26 22:55:08','Access Logout'),(378,2,'Logged in.','2024-03-26 22:55:13','Access Login'),(379,1,'Logged in.','2024-03-27 01:13:44','Access Login'),(380,16,'Logged in.','2024-03-27 01:15:56','Access Login'),(381,1,'Logged out.','2024-03-27 02:54:41','Access Logout'),(382,2,'Logged out.','2024-03-27 02:54:51','Access Logout'),(383,1,'Logged in.','2024-03-27 02:55:00','Access Login'),(384,1,'Logged in.','2024-03-27 04:53:29','Access Login'),(385,1,'Logged in.','2024-03-27 04:53:55','Access Login'),(386,16,'Logged in.','2024-03-27 23:17:27','Access Login'),(387,16,'Logged out.','2024-03-27 23:54:29','Access Logout'),(388,2,'Logged in.','2024-03-27 23:54:36','Access Login'),(389,1,'Logged in.','2024-03-28 00:40:54','Access Login'),(390,1,'Logged out.','2024-03-28 03:18:44','Access Logout'),(391,16,'Logged in.','2024-03-28 03:18:52','Access Login'),(392,1,'Logged in.','2024-03-28 22:14:25','Access Login'),(393,2,'Logged in.','2024-03-28 23:21:01','Access Login'),(394,2,'Logged out.','2024-03-28 23:56:48','Access Logout'),(395,1,'Logged in.','2024-03-28 23:56:57','Access Login'),(396,1,'Logged in.','2024-03-31 22:25:47','Access Login'),(397,1,'Logged in.','2024-04-01 03:43:28','Access Login'),(398,1,'Logged out.','2024-04-01 03:43:30','Access Logout'),(399,1,'Logged in.','2024-04-01 03:43:37','Access Login'),(400,1,'Logged in.','2024-04-01 21:57:29','Access Login'),(401,1,'Logged out.','2024-04-01 21:57:46','Access Logout'),(402,16,'Logged in.','2024-04-01 21:58:15','Access Login'),(403,1,'Logged in.','2024-04-01 23:34:27','Access Login'),(404,1,'Logged in.','2024-04-02 00:15:45','Access Login'),(405,1,'Logged out.','2024-04-02 00:15:48','Access Logout'),(406,5,'Logged in.','2024-04-02 00:15:56','Access Login'),(407,16,'Logged in.','2024-04-02 01:28:44','Access Login'),(408,1,'Logged in.','2024-04-02 23:28:58','Access Login'),(409,1,'Logged in.','2024-04-03 02:52:15','Access Login'),(410,1,'Logged out.','2024-04-03 03:34:09','Access Logout'),(411,16,'Logged in.','2024-04-03 03:34:18','Access Login'),(412,1,'Logged in.','2024-04-03 21:39:49','Access Login'),(413,1,'Logged out.','2024-04-04 00:39:02','Access Logout'),(414,2,'Logged in.','2024-04-04 00:39:09','Access Login'),(415,2,'Logged in.','2024-04-04 23:52:43','Access Login'),(416,2,'Logged out.','2024-04-04 23:52:48','Access Logout'),(417,1,'Logged in.','2024-04-04 23:52:54','Access Login'),(418,1,'Logged out.','2024-04-05 00:29:41','Access Logout'),(419,1,'Logged in','2024-04-05 00:29:46','Access Login'),(420,2,'Logged in.','2024-04-05 03:09:35','Access Login'),(421,2,'Logged out.','2024-04-05 03:10:14','Access Logout'),(422,1,'Logged in.','2024-04-05 03:10:22','Access Login'),(423,1,'Logged in.','2024-04-05 04:54:00','Access Login'),(424,1,'Logged in.','2024-04-07 21:48:41','Access Login'),(425,1,'Logged in.','2024-04-08 00:19:48','Access Login'),(426,1,'Logged in.','2024-04-09 22:19:53','Access Login'),(427,1,'Logged out.','2024-04-09 22:48:33','Access Logout'),(428,1,'Logged in.','2024-04-09 22:53:04','Access Login'),(429,1,'Logged in.','2024-04-09 22:54:07','Access Login'),(430,1,'Logged out.','2024-04-09 22:54:54','Access Logout'),(431,1,'Logged in.','2024-04-09 22:55:18','Access Login'),(432,2,'Logged in.','2024-04-09 22:56:00','Access Login'),(433,1,'Logged in.','2024-04-10 02:27:37','Access Login'),(434,2,'Logged in.','2024-04-10 03:24:18','Access Login'),(435,16,'Logged in.','2024-04-10 03:30:53','Access Login'),(436,5,'Logged in.','2024-04-10 03:31:34','Access Login'),(437,16,'Logged out.','2024-04-10 03:31:55','Access Logout'),(438,16,'Logged in.','2024-04-10 03:58:08','Access Login'),(439,16,'Logged in.','2024-04-10 03:58:58','Access Login'),(440,1,'Logged in.','2024-04-10 22:13:47','Access Login'),(441,1,'Logged in.','2024-04-10 22:40:26','Access Login'),(442,3,'Logged in.','2024-04-10 22:43:07','Access Login'),(443,3,'Logged out.','2024-04-10 22:51:33','Access Logout'),(444,1,'Logged out.','2024-04-10 22:54:40','Access Logout'),(445,1,'Logged in.','2024-04-10 22:55:11','Access Login'),(446,5,'Logged in.','2024-04-10 22:56:40','Access Login'),(447,16,'Logged in.','2024-04-10 23:58:36','Access Login'),(448,16,'Logged in.','2024-04-11 00:03:22','Access Login'),(449,2,'Logged in.','2024-04-11 00:35:57','Access Login'),(450,1,'Logged in.','2024-04-11 22:26:49','Access Login'),(451,5,'Logged in.','2024-04-11 22:27:05','Access Login'),(452,5,'Logged out.','2024-04-11 22:55:52','Access Logout'),(453,3,'Logged in.','2024-04-11 22:56:36','Access Login'),(454,2,'Logged in.','2024-04-12 02:16:39','Access Login'),(455,16,'Logged in.','2024-04-12 03:27:24','Access Login'),(456,16,'Logged out.','2024-04-12 03:31:29','Access Logout'),(457,5,'Logged in.','2024-04-12 03:31:37','Access Login'),(458,1,'Logged in.','2024-04-14 22:35:51','Access Login'),(459,2,'Logged in.','2024-04-14 22:36:15','Access Login'),(460,1,'Logged in.','2024-04-15 02:36:38','Access Login'),(461,1,'Logged out.','2024-04-15 02:37:43','Access Logout'),(462,5,'Logged in.','2024-04-15 02:38:02','Access Login'),(463,5,'Logged in.','2024-04-15 02:38:31','Access Login'),(464,16,'Logged in.','2024-04-15 02:39:21','Access Login'),(465,2,'Logged in.','2024-04-15 02:40:35','Access Login'),(466,1,'Logged in.','2024-04-15 02:42:42','Access Login'),(467,1,'Logged in.','2024-04-15 22:12:14','Access Login'),(468,2,'Logged in.','2024-04-15 23:12:44','Access Login'),(469,1,'Logged in.','2024-04-16 01:05:38','Access Login'),(470,1,'Logged in.','2024-04-16 06:33:29','Access Login'),(471,1,'Logged out.','2024-04-16 06:38:42','Access Logout'),(472,2,'Logged in.','2024-04-16 06:38:50','Access Login'),(473,2,'Logged out.','2024-04-16 06:39:37','Access Logout'),(474,1,'Logged in.','2024-04-16 06:42:23','Access Login'),(475,1,'Logged in.','2024-04-16 06:42:37','Access Login'),(476,1,'Logged in','2024-04-16 06:47:31','Access Login'),(477,1,'Logged out.','2024-04-16 07:02:01','Access Logout'),(478,1,'Logged in.','2024-04-16 07:03:03','Access Login'),(479,1,'Logged in.','2024-04-16 07:03:16','Access Login'),(480,2,'Logged in.','2024-04-16 07:03:39','Access Login'),(481,1,'Logged in.','2024-04-16 07:04:02','Access Login'),(482,1,'Logged in','2024-04-16 07:05:36','Access Login'),(483,1,'Logged in','2024-04-16 21:37:28','Access Login'),(484,1,'Logged out.','2024-04-16 22:50:00','Access Logout'),(485,1,'Logged in','2024-04-16 22:50:17','Access Login'),(486,2,'Logged in','2024-04-16 22:51:58','Access Login'),(487,2,'Logged out.','2024-04-16 23:53:34','Access Logout'),(488,1,'Logged in','2024-04-16 23:53:44','Access Login'),(489,1,'Logged in.','2024-04-16 23:59:52','Access Login'),(490,1,'Logged out.','2024-04-17 00:17:35','Access Logout'),(491,16,'Logged in.','2024-04-17 00:17:51','Access Login'),(492,16,'Logged out.','2024-04-17 00:20:20','Access Logout'),(493,16,'Logged in.','2024-04-17 00:20:28','Access Login'),(494,16,'Logged out.','2024-04-17 00:20:52','Access Logout'),(495,2,'Logged in.','2024-04-17 00:20:59','Access Login'),(496,2,'Logged out.','2024-04-17 00:28:12','Access Logout'),(497,5,'Logged in.','2024-04-17 00:28:20','Access Login'),(498,5,'Logged out.','2024-04-17 00:29:47','Access Logout'),(499,1,'Logged in.','2024-04-17 00:29:54','Access Login'),(500,1,'Logged out.','2024-04-17 00:31:18','Access Logout'),(501,2,'Logged in.','2024-04-17 00:31:24','Access Login'),(502,2,'Logged out.','2024-04-17 00:32:26','Access Logout'),(503,2,'Logged in.','2024-04-17 00:32:36','Access Login'),(504,2,'Logged out.','2024-04-17 00:35:23','Access Logout'),(505,1,'Logged in.','2024-04-17 00:35:29','Access Login'),(506,1,'Logged out.','2024-04-17 00:41:40','Access Logout'),(507,1,'Logged in.','2024-04-17 00:41:48','Access Login'),(508,3,'Logged in.','2024-04-17 03:15:02','Access Login'),(509,3,'Logged out.','2024-04-17 03:28:45','Access Logout'),(510,1,'Logged in.','2024-04-17 03:28:51','Access Login'),(511,1,'Logged out.','2024-04-17 03:29:47','Access Logout'),(512,2,'Logged in.','2024-04-17 03:29:53','Access Login'),(513,2,'Logged out.','2024-04-17 03:35:19','Access Logout'),(514,16,'Logged in.','2024-04-17 03:35:32','Access Login'),(515,16,'Logged out.','2024-04-17 03:37:10','Access Logout'),(516,2,'Logged in.','2024-04-17 03:37:42','Access Login'),(517,16,'Logged in.','2024-04-17 03:42:05','Access Login'),(518,4,'Logged in.','2024-04-17 03:43:24','Access Login'),(519,3,'Logged in.','2024-04-17 03:46:21','Access Login'),(520,1,'Logged out.','2024-04-17 03:48:38','Access Logout'),(521,1,'Logged out.','2024-04-17 03:49:06','Access Logout'),(522,4,'Logged out.','2024-04-17 03:49:20','Access Logout'),(523,1,'Logged in.','2024-04-17 03:49:34','Access Login'),(524,16,'Logged out.','2024-04-17 03:50:04','Access Logout'),(525,5,'Logged in.','2024-04-17 03:50:16','Access Login'),(526,2,'Logged in.','2024-04-17 03:51:17','Access Login'),(527,1,'Logged in.','2024-04-17 03:51:45','Access Login'),(528,16,'Logged in.','2024-04-17 03:52:35','Access Login'),(529,1,'Logged in.','2024-04-17 23:32:00','Access Login'),(530,2,'Logged in.','2024-04-17 23:38:11','Access Login'),(531,1,'Logged in.','2024-04-18 03:27:32','Access Login'),(532,16,'Logged in.','2024-04-18 05:49:44','Access Login'),(533,1,'Logged in.','2024-04-18 22:17:59','Access Login'),(534,1,'Logged in.','2024-04-18 23:02:55','Access Login'),(535,1,'Logged in.','2024-04-19 02:42:00','Access Login'),(536,1,'Logged in.','2024-04-20 00:06:33','Access Login'),(537,1,'Logged in.','2024-04-20 23:17:01','Access Login'),(538,1,'Logged in.','2024-04-22 00:23:29','Access Login'),(539,1,'Logged in.','2024-04-22 04:43:44','Access Login'),(540,16,'Logged in.','2024-04-22 07:25:29','Access Login'),(541,5,'Logged in.','2024-04-22 08:12:23','Access Login'),(542,5,'Logged in.','2024-04-22 23:11:25','Access Login'),(543,3,'Logged in.','2024-04-22 23:28:27','Access Login'),(544,3,'Logged out.','2024-04-22 23:28:44','Access Logout'),(545,1,'Logged in.','2024-04-22 23:36:52','Access Login'),(546,1,'Logged out.','2024-04-22 23:42:00','Access Logout'),(547,16,'Logged in.','2024-04-22 23:42:26','Access Login'),(548,3,'Logged in.','2024-04-22 23:43:51','Access Login'),(549,4,'Logged in.','2024-04-22 23:44:21','Access Login'),(550,3,'Logged out.','2024-04-22 23:45:35','Access Logout'),(551,6,'Logged in.','2024-04-22 23:46:01','Access Login'),(552,16,'Logged out.','2024-04-22 23:55:23','Access Logout'),(553,4,'Logged out.','2024-04-22 23:56:27','Access Logout'),(554,5,'Logged in.','2024-04-22 23:57:35','Access Login'),(555,5,'Logged out.','2024-04-22 23:57:45','Access Logout'),(556,16,'Logged in.','2024-04-22 23:58:02','Access Login'),(557,16,'Logged out.','2024-04-23 00:00:06','Access Logout'),(558,16,'Logged in.','2024-04-23 00:00:18','Access Login'),(559,16,'Logged out.','2024-04-23 00:01:03','Access Logout'),(560,5,'Logged in.','2024-04-23 00:01:16','Access Login'),(561,5,'Logged out.','2024-04-23 00:02:02','Access Logout'),(562,5,'Logged in.','2024-04-23 00:02:54','Access Login'),(563,5,'Logged out.','2024-04-23 00:10:06','Access Logout'),(564,16,'Logged in.','2024-04-23 00:10:26','Access Login'),(565,16,'Logged out.','2024-04-23 00:11:32','Access Logout'),(566,16,'Logged in.','2024-04-23 00:11:44','Access Login'),(567,16,'Logged out.','2024-04-23 00:12:46','Access Logout'),(568,16,'Logged in.','2024-04-23 00:13:03','Access Login'),(569,16,'Logged out.','2024-04-23 00:15:23','Access Logout'),(570,3,'Logged in.','2024-04-23 00:16:04','Access Login'),(571,6,'Logged out.','2024-04-23 00:16:09','Access Logout'),(572,5,'Logged in.','2024-04-23 00:16:21','Access Login'),(573,5,'Logged out.','2024-04-23 00:21:01','Access Logout'),(574,3,'Logged out.','2024-04-23 00:21:16','Access Logout'),(575,16,'Logged in.','2024-04-23 00:21:27','Access Login'),(576,16,'Logged in.','2024-04-23 00:22:27','Access Login'),(577,16,'Logged out.','2024-04-23 00:22:37','Access Logout'),(578,5,'Logged in.','2024-04-23 00:22:58','Access Login'),(579,5,'Logged out.','2024-04-23 00:24:03','Access Logout'),(580,3,'Logged in.','2024-04-23 00:24:40','Access Login'),(581,3,'Logged out.','2024-04-23 00:25:43','Access Logout'),(582,5,'Logged in.','2024-04-23 00:25:56','Access Login'),(583,16,'Logged in.','2024-04-23 00:26:50','Access Login'),(584,16,'Logged out.','2024-04-23 00:29:55','Access Logout'),(585,1,'Logged in.','2024-04-23 00:30:33','Access Login'),(586,16,'Logged in.','2024-04-23 00:30:58','Access Login'),(587,16,'Logged out.','2024-04-23 00:31:55','Access Logout'),(588,1,'Logged out.','2024-04-23 00:32:05','Access Logout'),(589,5,'Logged out.','2024-04-23 00:32:11','Access Logout'),(590,5,'Logged in.','2024-04-23 00:32:36','Access Login'),(591,16,'Logged in.','2024-04-23 00:33:01','Access Login'),(592,3,'Logged in.','2024-04-23 00:33:19','Access Login'),(593,1,'Logged in.','2024-04-23 00:33:41','Access Login'),(594,16,'Logged out.','2024-04-23 00:34:36','Access Logout'),(595,6,'Logged in.','2024-04-23 00:35:11','Access Login'),(596,6,'Logged out.','2024-04-23 00:39:17','Access Logout'),(597,1,'Logged out.','2024-04-23 00:39:25','Access Logout'),(598,16,'Logged in.','2024-04-23 00:40:50','Access Login'),(599,5,'Logged in.','2024-04-23 00:41:36','Access Login'),(600,3,'Logged in.','2024-04-23 00:42:01','Access Login'),(601,4,'Logged in.','2024-04-23 00:42:27','Access Login'),(602,3,'Logged out.','2024-04-23 00:43:45','Access Logout'),(603,7,'Logged in.','2024-04-23 00:44:14','Access Login'),(604,4,'Logged out.','2024-04-23 00:51:34','Access Logout'),(605,3,'Logged out.','2024-04-23 00:53:30','Access Logout'),(606,7,'Logged out.','2024-04-23 00:53:47','Access Logout'),(607,16,'Logged in.','2024-04-23 00:57:18','Access Login'),(608,16,'Logged out.','2024-04-23 00:57:28','Access Logout'),(609,5,'Logged in.','2024-04-23 00:57:46','Access Login'),(610,16,'Logged in.','2024-04-23 00:58:18','Access Login'),(611,4,'Logged in.','2024-04-23 00:58:41','Access Login'),(612,3,'Logged in.','2024-04-23 00:59:22','Access Login'),(613,4,'Logged out.','2024-04-23 00:59:42','Access Logout'),(614,3,'Logged out.','2024-04-23 01:00:25','Access Logout'),(615,3,'Logged in.','2024-04-23 01:01:35','Access Login'),(616,16,'Logged out.','2024-04-23 01:01:51','Access Logout'),(617,4,'Logged in.','2024-04-23 01:02:37','Access Login'),(618,1,'Logged in.','2024-04-23 01:03:15','Access Login'),(619,1,'Logged out.','2024-04-23 01:03:30','Access Logout'),(620,3,'Logged out.','2024-04-23 01:05:23','Access Logout'),(621,4,'Logged out.','2024-04-23 01:05:27','Access Logout'),(622,3,'Logged in.','2024-04-23 01:08:29','Access Login'),(623,5,'Logged in.','2024-04-23 01:08:51','Access Login'),(624,16,'Logged in.','2024-04-23 01:09:18','Access Login'),(625,7,'Logged in.','2024-04-23 01:09:55','Access Login'),(626,5,'Logged out.','2024-04-23 01:10:05','Access Logout'),(627,5,'Logged in.','2024-04-23 01:10:58','Access Login'),(628,16,'Logged out.','2024-04-23 01:12:07','Access Logout'),(629,5,'Logged out.','2024-04-23 01:12:29','Access Logout'),(630,7,'Logged out.','2024-04-23 01:12:48','Access Logout'),(631,16,'Logged in.','2024-04-23 01:13:16','Access Login'),(632,3,'Logged out.','2024-04-23 01:13:36','Access Logout'),(633,5,'Logged in.','2024-04-23 01:13:54','Access Login'),(634,5,'Logged out.','2024-04-23 01:18:55','Access Logout'),(635,16,'Logged out.','2024-04-23 01:19:05','Access Logout'),(636,3,'Logged in.','2024-04-23 02:04:36','Access Login'),(637,3,'Logged out.','2024-04-23 02:04:45','Access Logout'),(638,3,'Logged in.','2024-04-23 02:04:51','Access Login'),(639,1,'Logged in.','2024-04-23 02:39:23','Access Login'),(640,1,'Logged in.','2024-04-23 07:29:09','Access Login'),(641,16,'Logged in.','2024-04-23 22:39:53','Access Login'),(642,16,'Logged out.','2024-04-23 23:31:30','Access Logout'),(643,16,'Logged in.','2024-04-23 23:32:16','Access Login'),(644,16,'Logged out.','2024-04-23 23:45:05','Access Logout'),(645,1,'Logged in.','2024-04-23 23:45:12','Access Login'),(646,5,'Logged in.','2024-04-23 23:47:22','Access Login'),(647,5,'Logged out.','2024-04-24 00:02:27','Access Logout'),(648,5,'Logged in.','2024-04-24 00:12:25','Access Login'),(649,3,'Logged in.','2024-04-24 00:27:49','Access Login'),(650,16,'Logged in.','2024-04-24 03:35:01','Access Login'),(651,5,'Logged in.','2024-04-24 03:55:55','Access Login'),(652,5,'Logged out.','2024-04-24 03:59:37','Access Logout'),(653,16,'Logged in.','2024-04-24 04:00:01','Access Login'),(654,3,'Logged in.','2024-04-24 05:07:05','Access Login'),(655,16,'Logged in.','2024-04-24 22:44:41','Access Login'),(656,3,'Logged in.','2024-04-25 03:37:28','Access Login'),(657,16,'Logged in.','2024-04-26 01:05:50','Access Login'),(658,1,'Logged in.','2024-04-26 01:56:37','Access Login'),(659,3,'Logged in.','2024-04-26 04:35:03','Access Login'),(660,16,'Logged in.','2024-04-28 23:27:14','Access Login'),(661,1,'Logged in.','2024-04-29 00:16:26','Access Login'),(662,1,'Logged in.','2024-04-29 02:17:12','Access Login'),(663,1,'Logged out.','2024-04-29 03:15:45','Access Logout'),(664,16,'Logged in.','2024-04-29 03:15:55','Access Login'),(665,16,'Logged in.','2024-04-29 22:48:01','Access Login'),(666,3,'Logged in.','2024-04-30 00:34:11','Access Login'),(667,5,'Logged in.','2024-04-30 01:52:11','Access Login'),(668,5,'Logged out.','2024-04-30 03:07:19','Access Logout'),(669,3,'Logged in.','2024-04-30 03:07:26','Access Login'),(670,16,'Logged in.','2024-04-30 04:27:23','Access Login'),(671,16,'Logged in.','2024-04-30 05:26:54','Access Login'),(672,3,'Logged in.','2024-05-01 23:39:06','Access Login'),(673,5,'Logged in.','2024-05-02 01:15:05','Access Login'),(674,16,'Logged in.','2024-05-02 02:14:46','Access Login'),(675,16,'Logged in.','2024-05-02 02:49:53','Access Login'),(676,16,'Logged in.','2024-05-02 04:17:34','Access Login'),(677,5,'Logged in.','2024-05-02 04:50:17','Access Login'),(678,3,'Logged in.','2024-05-02 04:52:18','Access Login'),(679,1,'Logged in.','2024-05-02 04:59:47','Access Login'),(680,3,'Logged out.','2024-05-02 05:01:29','Access Logout'),(681,1,'Logged out.','2024-05-02 05:01:51','Access Logout'),(682,5,'Logged out.','2024-05-02 05:01:58','Access Logout'),(683,1,'Logged in.','2024-05-02 05:12:11','Access Login'),(684,1,'Logged out.','2024-05-02 05:23:43','Access Logout'),(685,16,'Logged in.','2024-05-02 05:24:02','Access Login'),(686,5,'Logged in.','2024-05-02 23:16:28','Access Login'),(687,3,'Logged in.','2024-05-03 00:50:05','Access Login'),(688,5,'Logged in.','2024-05-03 01:07:19','Access Login'),(689,5,'Logged out.','2024-05-03 01:22:42','Access Logout'),(690,5,'Logged in.','2024-05-03 01:23:00','Access Login'),(691,4,'Logged in.','2024-05-03 05:10:00','Access Login'),(692,1,'Logged in.','2024-05-03 22:25:23','Access Login'),(693,5,'Logged in.','2024-05-04 22:55:58','Access Login'),(694,16,'Logged in.','2024-05-05 23:15:44','Access Login'),(695,1,'Logged in.','2024-05-14 22:59:58','Access Login'),(696,5,'Logged in.','2024-05-22 09:02:56','Access Login'),(697,1,'Logged in.','2024-05-22 23:34:27','Access Login'),(698,1,'Logged in.','2024-05-23 00:52:33','Access Login'),(699,1,'Logged in.','2024-05-23 02:33:30','Access Login'),(700,1,'Logged in.','2024-05-24 02:42:02','Access Login'),(701,3,'Logged in.','2024-05-24 03:34:50','Access Login'),(702,5,'Logged in.','2024-05-24 03:39:42','Access Login'),(703,5,'Logged in.','2024-05-24 03:41:13','Access Login'),(704,1,'Logged in.','2024-05-26 23:08:48','Access Login'),(705,5,'Logged in.','2024-05-27 04:18:25','Access Login'),(706,1,'Logged in.','2024-05-27 21:57:55','Access Login'),(707,1,'Logged out.','2024-05-27 22:11:01','Access Logout'),(708,5,'Logged in.','2024-05-27 22:11:10','Access Login'),(709,4,'Logged in.','2024-05-28 02:03:47','Access Login'),(710,6,'Logged in.','2024-05-28 05:32:02','Access Login'),(711,1,'Logged in.','2024-05-28 22:10:45','Access Login'),(712,1,'Logged out.','2024-05-28 22:22:51','Access Logout'),(713,5,'Logged in.','2024-05-28 22:22:59','Access Login'),(714,1,'Logged in.','2024-06-06 22:15:24','Access Login'),(715,1,'Logged in.','2024-06-06 22:19:22','Access Login'),(716,1,'Logged out.','2024-06-06 22:40:18','Access Logout'),(717,2,'Logged in.','2024-06-06 22:40:54','Access Login'),(718,1,'Logged in.','2024-06-06 22:48:23','Access Login'),(719,1,'Logged out.','2024-06-06 22:48:53','Access Logout'),(720,1,'Logged in.','2024-06-06 22:57:32','Access Login'),(721,1,'Logged out.','2024-06-06 22:57:42','Access Logout'),(722,1,'Logged out.','2024-06-07 01:04:33','Access Logout'),(723,2,'Logged in.','2024-06-07 01:04:39','Access Login'),(724,2,'Logged in.','2024-06-07 03:15:26','Access Login'),(725,1,'Logged in.','2024-06-09 23:15:26','Access Login'),(726,2,'Logged in.','2024-06-10 00:25:40','Access Login'),(727,2,'Logged in.','2024-06-10 01:51:56','Access Login'),(728,1,'Logged in.','2024-06-10 05:35:54','Access Login'),(729,1,'Logged in.','2024-06-10 06:13:01','Access Login'),(730,1,'Logged in.','2024-06-13 03:31:56','Access Login'),(731,1,'Logged in.','2024-06-18 00:03:34','Access Login'),(732,1,'Logged in.','2024-06-19 01:59:03','Access Login'),(733,1,'Logged in.','2024-06-21 03:03:36','Access Login'),(734,1,'Logged in.','2024-07-21 21:53:38','Access Login'),(735,1,'Logged in.','2024-07-21 23:16:34','Access Login'),(736,1,'Logged in.','2024-07-24 00:24:41','Access Login'),(737,1,'Logged out.','2024-07-24 00:27:09','Access Logout'),(738,2,'Logged in.','2024-07-24 00:29:27','Access Login'),(739,1,'Logged in.','2024-07-29 02:18:29','Access Login'),(740,1,'Logged out.','2024-07-29 23:18:32','Access Logout'),(741,1,'Logged in.','2024-07-29 23:23:57','Access Login'),(742,1,'Logged in.','2024-07-29 23:24:11','Access Login'),(743,1,'Logged in.','2024-07-29 23:25:22','Access Login'),(744,1,'Logged in.','2024-07-29 23:26:21','Access Login'),(745,1,'Logged in.','2024-07-29 23:26:47','Access Login'),(746,1,'Logged in.','2024-07-29 23:29:17','Access Login'),(747,1,'Logged in.','2024-07-29 23:31:48','Access Login'),(748,1,'Logged in.','2024-07-29 23:32:17','Access Login'),(749,1,'Logged in.','2024-07-29 23:34:42','Access Login'),(750,1,'Logged in.','2024-07-29 23:35:05','Access Login'),(751,1,'Logged in.','2024-07-29 23:35:29','Access Login'),(752,1,'Logged in.','2024-07-29 23:35:44','Access Login'),(753,1,'Logged in.','2024-07-29 23:37:26','Access Login'),(754,1,'Logged in.','2024-07-29 23:37:39','Access Login'),(755,1,'Logged in.','2024-07-30 00:36:33','Access Login'),(756,1,'Logged out.','2024-07-30 00:54:53','Access Logout'),(757,2,'Logged in.','2024-07-30 00:55:14','Access Login'),(758,2,'Logged in.','2024-07-30 00:56:15','Access Login'),(759,1,'Logged in.','2024-07-30 01:01:11','Access Login'),(760,1,'Logged out.','2024-07-30 01:03:35','Access Logout'),(761,2,'Logged out.','2024-07-30 01:03:45','Access Logout'),(762,1,'Logged in.','2024-07-30 01:07:57','Access Login'),(763,2,'Logged in.','2024-07-30 01:10:30','Access Login'),(764,2,'Logged out.','2024-07-30 01:24:04','Access Logout'),(765,2,'Logged in.','2024-07-30 01:25:01','Access Login'),(766,1,'Logged in.','2024-07-30 01:27:14','Access Login'),(767,2,'Logged in.','2024-07-30 01:28:12','Access Login'),(768,1,'Logged out.','2024-07-30 01:32:38','Access Logout'),(769,1,'Logged in.','2024-07-30 01:33:00','Access Login'),(770,1,'Logged out.','2024-07-30 01:37:05','Access Logout'),(771,2,'Logged in.','2024-07-30 01:37:25','Access Login'),(772,2,'Logged out.','2024-07-30 01:37:55','Access Logout'),(773,2,'Logged in.','2024-07-30 01:38:17','Access Login'),(774,1,'Logged in.','2024-07-30 01:38:53','Access Login'),(775,2,'Logged in.','2024-07-30 01:40:38','Access Login'),(776,2,'Logged out.','2024-07-30 01:40:58','Access Logout'),(777,2,'Logged in.','2024-07-30 01:41:31','Access Login'),(778,1,'Logged in.','2024-07-30 01:43:01','Access Login'),(779,1,'Logged in.','2024-07-30 01:43:46','Access Login'),(780,1,'Logged out.','2024-07-30 01:44:15','Access Logout'),(781,2,'Logged in.','2024-07-30 02:06:46','Access Login'),(782,2,'Logged out.','2024-07-30 02:33:19','Access Logout'),(783,1,'Logged in.','2024-07-30 02:33:59','Access Login'),(784,2,'Logged in.','2024-07-30 03:19:09','Access Login'),(785,3,'Logged in.','2024-07-30 03:23:33','Access Login'),(786,4,'Logged in.','2024-07-30 03:24:03','Access Login'),(787,3,'Logged out.','2024-07-30 03:29:09','Access Logout'),(788,3,'Logged in.','2024-07-30 03:29:28','Access Login'),(789,1,'Logged in.','2024-07-30 04:20:13','Access Login'),(790,1,'Logged in.','2024-07-30 04:25:49','Access Login'),(791,2,'Logged in.','2024-07-30 04:34:43','Access Login'),(792,1,'Logged in.','2024-07-30 04:46:22','Access Login'),(793,1,'Logged in.','2024-07-30 05:31:27','Access Login'),(794,1,'Logged in.','2024-07-30 22:00:08','Access Login'),(795,1,'Logged out.','2024-07-30 23:44:14','Access Logout'),(796,3,'Logged in.','2024-07-30 23:44:56','Access Login'),(797,4,'Logged in.','2024-07-31 01:24:39','Access Login'),(798,2,'Logged in.','2024-07-31 02:07:48','Access Login'),(799,1,'Logged in.','2024-07-31 02:37:36','Access Login'),(800,1,'Logged out.','2024-07-31 02:46:25','Access Logout'),(801,3,'Logged in.','2024-07-31 02:47:29','Access Login'),(802,4,'Logged in.','2024-07-31 02:50:08','Access Login'),(803,2,'Logged in.','2024-07-31 02:50:49','Access Login'),(804,3,'Logged in.','2024-07-31 04:50:24','Access Login'),(805,4,'Logged in.','2024-07-31 04:50:40','Access Login'),(806,3,'Logged in.','2024-07-31 22:24:21','Access Login'),(807,4,'Logged in.','2024-07-31 22:27:19','Access Login'),(808,3,'Logged in.','2024-07-31 23:11:48','Access Login'),(809,3,'Logged out.','2024-08-01 00:17:54','Access Logout'),(810,4,'Logged in.','2024-08-01 00:18:05','Access Login'),(811,2,'Logged in.','2024-08-01 00:20:54','Access Login'),(812,2,'Logged in.','2024-08-01 00:56:02','Access Login'),(813,2,'Logged out.','2024-08-01 01:41:45','Access Logout'),(814,4,'Logged in.','2024-08-01 01:42:04','Access Login'),(815,4,'Logged out.','2024-08-01 03:07:16','Access Logout'),(816,2,'Logged in.','2024-08-01 03:09:41','Access Login'),(817,4,'Logged in.','2024-08-01 04:06:41','Access Login'),(818,3,'Logged in.','2024-08-01 04:08:22','Access Login'),(819,3,'Logged out.','2024-08-01 04:32:03','Access Logout'),(820,1,'Logged in.','2024-08-01 04:32:41','Access Login'),(821,1,'Logged in.','2024-08-01 05:24:57','Access Login'),(822,2,'Logged in.','2024-08-01 23:10:13','Access Login'),(823,4,'Logged in.','2024-08-01 23:13:01','Access Login'),(824,2,'Logged out.','2024-08-01 23:27:13','Access Logout'),(825,1,'Logged in.','2024-08-01 23:27:58','Access Login'),(826,1,'Logged out.','2024-08-02 02:52:33','Access Logout'),(827,2,'Logged in.','2024-08-02 02:52:42','Access Login'),(828,2,'Logged out.','2024-08-02 03:39:02','Access Logout'),(829,3,'Logged in.','2024-08-02 03:39:46','Access Login'),(830,1,'Logged in.','2024-08-02 05:11:09','Access Login'),(831,3,'Logged in.','2024-08-05 01:47:18','Access Login'),(832,3,'Logged out.','2024-08-05 02:01:26','Access Logout'),(833,4,'Logged in.','2024-08-05 02:01:44','Access Login'),(834,4,'Logged in.','2024-08-05 23:39:25','Access Login'),(835,1,'Logged in.','2024-08-06 02:10:30','Access Login'),(836,3,'Logged in.','2024-08-06 03:28:40','Access Login'),(837,4,'Logged in.','2024-08-06 04:13:36','Access Login'),(838,1,'Logged in.','2024-08-15 22:17:08','Access Login'),(839,1,'Logged out.','2024-08-15 22:22:14','Access Logout'),(840,4,'Logged in.','2024-08-15 22:22:31','Access Login'),(841,1,'Logged in.','2024-08-15 23:30:24','Access Login'),(842,1,'Logged out.','2024-08-15 23:30:39','Access Logout'),(843,2,'Logged in.','2024-08-15 23:30:47','Access Login'),(844,2,'Logged out.','2024-08-15 23:31:00','Access Logout'),(845,3,'Logged in.','2024-08-15 23:36:09','Access Login'),(846,4,'Logged out.','2024-08-15 23:48:05','Access Logout'),(847,2,'Logged in.','2024-08-15 23:48:16','Access Login'),(848,2,'Logged out.','2024-08-15 23:55:02','Access Logout'),(849,1,'Logged in.','2024-08-15 23:55:11','Access Login'),(850,1,'Logged in.','2024-08-16 00:51:16','Access Login');
/*!40000 ALTER TABLE `logs` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port_log`
--

DROP TABLE IF EXISTS `port_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port_log` (
  `port_id` int NOT NULL,
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `switch_id` int DEFAULT NULL,
  KEY `fk_swi` (`switch_id`),
  CONSTRAINT `fk_swi` FOREIGN KEY (`switch_id`) REFERENCES `switch` (`switch_id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port_log`
--

LOCK TABLES `port_log` WRITE;
/*!40000 ALTER TABLE `port_log` DISABLE KEYS */;
INSERT INTO `port_log` VALUES (1,'portname','connect','-11','2024-08-16 06:49:52',32);
/*!40000 ALTER TABLE `port_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `port_queue`
--

DROP TABLE IF EXISTS `port_queue`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `port_queue` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int NOT NULL,
  `portname` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `decoder_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `request_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'waiting',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `port_queue`
--

LOCK TABLES `port_queue` WRITE;
/*!40000 ALTER TABLE `port_queue` DISABLE KEYS */;
INSERT INTO `port_queue` VALUES (1,1,'port1','','2024-04-16 13:48:59','waiting');
/*!40000 ALTER TABLE `port_queue` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `portname`
--

DROP TABLE IF EXISTS `portname`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `portname` (
  `id` int NOT NULL AUTO_INCREMENT,
  `portname` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `username` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `userauthority` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `ip_address` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `macaddr` text COLLATE utf8mb4_general_ci,
  `type` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `pc_online` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `linktype` varchar(20) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `audio` varchar(50) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `version` varchar(100) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `media` text COLLATE utf8mb4_general_ci,
  `format` text COLLATE utf8mb4_general_ci,
  `resolution` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `framerate` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `connect` int DEFAULT NULL,
  `decoder_name` text COLLATE utf8mb4_general_ci,
  `status` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `lastupdatedby` timestamp NULL DEFAULT NULL,
  `upgrade` int DEFAULT NULL,
  `path` text COLLATE utf8mb4_general_ci,
  `enable1` int DEFAULT NULL,
  `enable2` int DEFAULT NULL,
  `enable3` int DEFAULT NULL,
  `enable4` int DEFAULT NULL,
  `enable5` int DEFAULT NULL,
  `enable6` int DEFAULT NULL,
  `enable7` int DEFAULT NULL,
  `enable8` int DEFAULT NULL,
  `enable9` int DEFAULT NULL,
  `enable10` int DEFAULT NULL,
  `enable11` int DEFAULT NULL,
  `enable12` int DEFAULT NULL,
  `enable13` int DEFAULT NULL,
  `enable14` int DEFAULT NULL,
  `enable15` int DEFAULT NULL,
  `enable16` int DEFAULT NULL,
  `scan1` int DEFAULT NULL,
  `scan2` int DEFAULT NULL,
  `scan3` int DEFAULT NULL,
  `scan4` int DEFAULT NULL,
  `scan5` int DEFAULT NULL,
  `scan6` int DEFAULT NULL,
  `scan7` int DEFAULT NULL,
  `scan8` int DEFAULT NULL,
  `scan9` int DEFAULT NULL,
  `scan10` int DEFAULT NULL,
  `scan11` int DEFAULT NULL,
  `scan12` int DEFAULT NULL,
  `scan13` int DEFAULT NULL,
  `scan14` int DEFAULT NULL,
  `scan15` int DEFAULT NULL,
  `scan16` int DEFAULT NULL,
  `a1` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a2` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a3` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a4` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a5` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a6` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a7` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a8` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a9` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a10` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a11` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a12` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a13` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a14` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a15` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `a16` varchar(30) COLLATE utf8mb4_general_ci DEFAULT NULL,
  `switch_id` int DEFAULT NULL,
  `decoder_count` int DEFAULT NULL,
  `image_data` blob,
  `image_name` text COLLATE utf8mb4_general_ci,
  `view_only` tinyint(1) DEFAULT NULL,
  `aesportname` text COLLATE utf8mb4_general_ci,
  `desportname` text COLLATE utf8mb4_general_ci,
  `3desportname` text COLLATE utf8mb4_general_ci,
  `active_local` int DEFAULT NULL,
  `scan_time` int DEFAULT NULL,
  `hostname` varchar(255) COLLATE utf8mb4_general_ci DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `switch_id` (`switch_id`),
  KEY `decoder_count` (`decoder_count`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `portname`
--

LOCK TABLES `portname` WRITE;
/*!40000 ALTER TABLE `portname` DISABLE KEYS */;
INSERT INTO `portname` VALUES (1,'encoder1',NULL,NULL,'192.168.1.192','06:42:4e:d1:03:22','HDMI-CIM','Yes','KvmSwitch','Analog','2.0.0.2010','','Stereo, 48KHz','1920 * 1080','60 fps',0,'admin','busy','2024-06-13 11:26:28',1,'C:/xampp1/htdocs/kvm.sql',1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,0,0,1,1,1,1,1,1,1,1,0,1,1,1,'Share','Share','Share','View','View','View','View','View','Share','Share','Share','View','View','Share','Share','View',32,3,NULL,'port1.jpg',0,'RvQl6oeZL1WMwHdEsO7iOA==','JSCpri4QqvTsBktu2itePA==','MixEs5I2v3Ok2zPhbIUw/Q==\n',1,3,'encoder1-host'),(2,'encoder2',NULL,NULL,'192.168.1.193','16:42:4e:d1:03:22','DP-CIM','Yes','KvmSwitch','Digital','2.0.0.2010','','Mono, 48KHz','640 * 480','15 fps',0,'user2','busy','2024-06-10 13:19:10',1,'C:/xampp1/htdocs/check_authority.php',1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,1,0,1,1,1,1,0,1,1,1,1,'View','Share','View','Share','Share','Share','Share','Share','View','View','Share','Share','View','View','View','Share',31,2,NULL,'port2.jpg',0,'',NULL,'',1,0,NULL),(3,'encoder3',NULL,NULL,'192.168.0.2','03:42:4e:d1:03:22','HDMI-CIM','Yes','KvmSwitch','Analog','2.0.0.2010','C:/xampp1/htdocs/','Stereo, 48KHz','1920 * 1080','60 fps',0,'decoder2','busy','2024-06-13 11:34:36',1,'C:/xampp1/htdocs/kvm.sql',1,1,1,1,1,1,1,0,1,1,1,1,1,0,1,1,0,1,0,0,1,1,1,1,1,1,1,1,0,1,1,1,'Share','Share','Share','View','View','View','View','View','Share','Share','Share','View','View','Share','Share','View',32,2,NULL,'port1.jpg',0,'RvQl6oeZL1WMwHdEsO7iOA==','JSCpri4QqvTsBktu2itePA==','MixEs5I2v3Ok2zPhbIUw/Q==',1,3,'kvm3-host'),(34,NULL,NULL,NULL,'192.0.0.1',NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,0,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,NULL,'encoder1',NULL,NULL,NULL,NULL,NULL,NULL,NULL);
/*!40000 ALTER TABLE `portname` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `port_trigger` AFTER UPDATE ON `portname` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(50);
    DECLARE new_value TEXT;
    DECLARE trigger_name VARCHAR(50);
    DECLARE portname_switch_id INT;

    SET trigger_name = 'portname_trigger';

    IF NEW.portname <> OLD.portname THEN
        SET column_name = 'portname';
        SET new_value = NEW.portname;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.ip_address <> OLD.ip_address THEN
        SET column_name = 'ip_address';
        SET new_value = NEW.ip_address;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.macaddr <> OLD.macaddr THEN
        SET column_name = 'macaddr';
        SET new_value = NEW.macaddr;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.type <> OLD.type THEN
        SET column_name = 'type';
        SET new_value = NEW.type;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.pc_online <> OLD.pc_online THEN
        SET column_name = 'pc_online';
        SET new_value = NEW.pc_online;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.linktype <> OLD.linktype THEN
        SET column_name = 'linktype';
        SET new_value = NEW.linktype;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.audio <> OLD.audio THEN
        SET column_name = 'audio';
        SET new_value = NEW.audio;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.format <> OLD.format THEN
        SET column_name = 'format';
        SET new_value = NEW.format;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.resolution <> OLD.resolution THEN
        SET column_name = 'resolution';
        SET new_value = NEW.resolution;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.framerate <> OLD.framerate THEN
        SET column_name = 'framerate';
        SET new_value = NEW.framerate;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.connect <> OLD.connect THEN
        SET column_name = 'connect';
        SET new_value = NEW.connect;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.decoder_name <> OLD.decoder_name THEN
        SET column_name = 'decoder_name';
        SET new_value = NEW.decoder_name;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                IF NEW.path <> OLD.path THEN
        SET column_name = 'path';
        SET new_value = NEW.path;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    
                IF NEW.upgrade <> OLD.upgrade THEN
        SET column_name = 'upgrade';
        SET new_value = NEW.upgrade;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

               IF NEW.view_only <> OLD.view_only THEN
        SET column_name = 'view_only';
        SET new_value = NEW.view_only;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.switch_id <> OLD.switch_id THEN
        SET column_name = 'switch_id';
        SET new_value = NEW.switch_id;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.decoder_count <> OLD.decoder_count THEN
        SET column_name = 'decoder_count';
        SET new_value = NEW.decoder_count;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.media <> OLD.media THEN
        SET column_name = 'media';
        SET new_value = NEW.media;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                IF NEW.a1 <> OLD.a1 THEN
        SET column_name = 'a1';
        SET new_value = NEW.a1;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                IF NEW.a2 <> OLD.a2 THEN
        SET column_name = 'a2';
        SET new_value = NEW.a2;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a3 <> OLD.a3 THEN
        SET column_name = 'a3';
        SET new_value = NEW.a3;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a4 <> OLD.a4 THEN
        SET column_name = 'a4';
        SET new_value = NEW.a4;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a5 <> OLD.a5 THEN
        SET column_name = 'a5';
        SET new_value = NEW.a5;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a6 <> OLD.a6 THEN
        SET column_name = 'a6';
        SET new_value = NEW.a6;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a7 <> OLD.a7 THEN
        SET column_name = 'a7';
        SET new_value = NEW.a7;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a8 <> OLD.a8 THEN
        SET column_name = 'a8';
        SET new_value = NEW.a8;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a9 <> OLD.a9 THEN
        SET column_name = 'a9';
        SET new_value = NEW.a9;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a10 <> OLD.a10 THEN
        SET column_name = 'a10';
        SET new_value = NEW.a10;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a11 <> OLD.a11 THEN
        SET column_name = 'a11';
        SET new_value = NEW.a11;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a12 <> OLD.a12 THEN
        SET column_name = 'a12';
        SET new_value = NEW.a12;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a13 <> OLD.a13 THEN
        SET column_name = 'a13';
        SET new_value = NEW.a13;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a14 <> OLD.a14 THEN
        SET column_name = 'a14';
        SET new_value = NEW.a14;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a15 <> OLD.a15 THEN
        SET column_name = 'a15';
        SET new_value = NEW.a15;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.a16 <> OLD.a16 THEN
        SET column_name = 'a16';
        SET new_value = NEW.a16;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                    IF NEW.enable1 <> OLD.enable1 THEN
        SET column_name = 'enable1';
        SET new_value = NEW.enable1;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable2 <> OLD.enable2 THEN
        SET column_name = 'enable2';
        SET new_value = NEW.enable2;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable3 <> OLD.enable3 THEN
        SET column_name = 'enable3';
        SET new_value = NEW.enable3;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable4 <> OLD.enable4 THEN
        SET column_name = 'enable4';
        SET new_value = NEW.enable4;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable5 <> OLD.enable5 THEN
        SET column_name = 'enable5';
        SET new_value = NEW.enable5;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable6 <> OLD.enable6 THEN
        SET column_name = 'enable6';
        SET new_value = NEW.enable6;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable7 <> OLD.enable7 THEN
        SET column_name = 'enable7';
        SET new_value = NEW.enable7;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable8 <> OLD.enable8 THEN
        SET column_name = 'enable8';
        SET new_value = NEW.enable8;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable9 <> OLD.enable9 THEN
        SET column_name = 'enable9';
        SET new_value = NEW.enable9;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable10 <> OLD.enable10 THEN
        SET column_name = 'enable10';
        SET new_value = NEW.enable10;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable11 <> OLD.enable11 THEN
        SET column_name = 'enable11';
        SET new_value = NEW.enable11;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable12 <> OLD.enable12 THEN
        SET column_name = 'enable12';
        SET new_value = NEW.enable12;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable13 <> OLD.enable13 THEN
        SET column_name = 'enable13';
        SET new_value = NEW.enable13;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable14 <> OLD.enable14 THEN
        SET column_name = 'enable14';
        SET new_value = NEW.enable14;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable15 <> OLD.enable15 THEN
        SET column_name = 'enable15';
        SET new_value = NEW.enable15;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

                        IF NEW.enable16 <> OLD.enable16 THEN
        SET column_name = 'enable16';
        SET new_value = NEW.enable16;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

        IF NEW.scan1 <> OLD.scan1 THEN
        SET column_name = 'scan1';
        SET new_value = NEW.scan1;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan2 <> OLD.scan2 THEN
        SET column_name = 'scan2';
        SET new_value = NEW.scan2;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan3 <> OLD.scan3 THEN
        SET column_name = 'scan3';
        SET new_value = NEW.scan3;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan4 <> OLD.scan4 THEN
        SET column_name = 'scan4';
        SET new_value = NEW.scan4;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan5 <> OLD.scan5 THEN
        SET column_name = 'scan5';
        SET new_value = NEW.scan5;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan6 <> OLD.scan6 THEN
        SET column_name = 'scan6';
        SET new_value = NEW.scan6;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan7 <> OLD.scan7 THEN
        SET column_name = 'scan7';
        SET new_value = NEW.scan7;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan8 <> OLD.scan8 THEN
        SET column_name = 'scan8';
        SET new_value = NEW.scan8;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan9 <> OLD.scan9 THEN
        SET column_name = 'scan9';
        SET new_value = NEW.scan9;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan10 <> OLD.scan10 THEN
        SET column_name = 'scan10';
        SET new_value = NEW.scan10;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan11 <> OLD.scan11 THEN
        SET column_name = 'scan11';
        SET new_value = NEW.scan11;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan12 <> OLD.scan12 THEN
        SET column_name = 'scan12';
        SET new_value = NEW.scan12;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan13 <> OLD.scan13 THEN
        SET column_name = 'scan13';
        SET new_value = NEW.scan13;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan14 <> OLD.scan14 THEN
        SET column_name = 'scan14';
        SET new_value = NEW.scan14;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan15 <> OLD.scan15 THEN
        SET column_name = 'scan15';
        SET new_value = NEW.scan15;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

            IF NEW.scan16 <> OLD.scan16 THEN
        SET column_name = 'scan16';
        SET new_value = NEW.scan16;
        SET portname_switch_id = NEW.switch_id;

        INSERT INTO port_log (port_id, table_name, column_name, new_value, switch_id)
        VALUES (NEW.id, 'portname', column_name, new_value, portname_switch_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `sessions`
--

DROP TABLE IF EXISTS `sessions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `sessions` (
  `session_id` int NOT NULL AUTO_INCREMENT,
  `encoder_id` int NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`session_id`),
  UNIQUE KEY `encoder_id` (`encoder_id`),
  CONSTRAINT `sessions_ibfk_1` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sessions`
--

LOCK TABLES `sessions` WRITE;
/*!40000 ALTER TABLE `sessions` DISABLE KEYS */;
INSERT INTO `sessions` VALUES (16,1,'2024-08-06 10:29:29'),(20,2,'2024-08-16 06:03:33');
/*!40000 ALTER TABLE `sessions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `switch`
--

DROP TABLE IF EXISTS `switch`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch` (
  `switch_id` int NOT NULL AUTO_INCREMENT,
  `encoder_id` int NOT NULL,
  `kvm_type` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kvm_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastupdatedby` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`switch_id`),
  KEY `fk_switch` (`encoder_id`),
  CONSTRAINT `fk_switch` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch`
--

LOCK TABLES `switch` WRITE;
/*!40000 ALTER TABLE `switch` DISABLE KEYS */;
INSERT INTO `switch` VALUES (1,32,'Standard Port','Rack2023','2023-11-24 05:02:51'),(2,31,'Standard Port','Rack2023','2023-11-24 05:02:51'),(3,30,'Standard Port','oct','2023-11-24 10:49:16'),(4,29,'Kvm Switch','Rack2023','2023-11-24 09:58:09'),(5,28,'Standard Port','Rack2023','2023-11-24 05:02:51'),(6,27,'Standard Port','Rack2023','2023-11-24 05:02:51'),(7,26,'Standard Port','Rack2023','2023-11-24 05:02:51'),(8,25,'kvm','Rack2023','2023-11-24 11:55:50'),(9,24,'Standard Port','oct','2023-11-24 10:08:41'),(10,23,'Kvm Switch','Rack2023','2023-11-24 06:06:00'),(11,22,'Standard Port','Rack2023','2023-11-24 05:02:51'),(12,21,'Standard Port','Rack2023','2023-11-24 05:02:51'),(13,20,'kvm','Rack2023','2023-11-24 11:59:08'),(14,19,'Standard Port','oct','2023-11-24 10:53:59'),(15,18,'Standard Port','Rack2023','2023-11-24 05:02:51'),(16,17,'Kvm Switch','Rack_oct','2023-11-24 06:06:54'),(17,16,'Standard Port','kkkkk','2023-11-24 11:05:45'),(18,15,'oct','Rack2023','2023-11-24 12:01:33'),(19,14,'Standard Port','Rack2023','2023-11-24 05:02:51'),(20,13,'Standard Port','kvm2024','2024-04-22 12:32:42'),(21,12,'Standard Port','Rack2023','2023-11-24 05:02:51'),(22,11,'Standard Port','oct','2023-11-24 06:48:04'),(23,10,'Kvm switch','kvm_13','2024-01-09 10:01:00'),(24,9,'Standard Port','Rack2023','2023-11-24 05:02:51'),(25,8,'Standard Port','oct','2023-11-24 12:06:18'),(26,7,'Standard Port','Rack2023','2023-11-24 05:02:51'),(27,6,'Standard Port','Rack2023','2023-11-24 05:02:51'),(28,5,'Standard Port','Rack2023','2023-11-24 05:02:51'),(29,4,'Kvm Switch','Rack2023','2023-11-24 06:08:57'),(30,3,'Standard Port','Rack2023','2023-11-24 05:02:51'),(31,2,'Kvm Switch','oct','2023-11-24 07:04:13'),(32,1,'Kvm Switch','Rack2023','2023-11-24 06:09:36');
/*!40000 ALTER TABLE `switch` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `switch_trigger` AFTER UPDATE ON `switch` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(50);
    DECLARE new_value TEXT;
    DECLARE trigger_name VARCHAR(50);
    DECLARE switch_encoder_id INT;

    SET trigger_name = 'switch_trigger';

    IF NEW.encoder_id <> OLD.encoder_id THEN
        SET column_name = 'encoder_id';
        SET new_value = NEW.encoder_id;
        SET switch_encoder_id = NEW.encoder_id; 

        INSERT INTO switch_log (switch_id, table_name, column_name, new_value, encoder_id)
        VALUES (OLD.switch_id, 'switch', column_name, new_value, switch_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.kvm_type <> OLD.kvm_type THEN
        SET column_name = 'kvm_type';
        SET new_value = NEW.kvm_type;
        SET switch_encoder_id = NEW.encoder_id; 

        INSERT INTO switch_log (switch_id, table_name, column_name, new_value, encoder_id)
        VALUES (OLD.switch_id, 'switch', column_name, new_value, switch_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;

    IF NEW.kvm_name <> OLD.kvm_name THEN
        SET column_name = 'kvm_name';
        SET new_value = NEW.kvm_name;
        SET switch_encoder_id = NEW.encoder_id; 

        INSERT INTO switch_log (switch_id, table_name, column_name, new_value, encoder_id)
        VALUES (OLD.switch_id, 'switch', column_name, new_value, switch_encoder_id);

        INSERT INTO trigger_log (trigger_name) VALUES (trigger_name);
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `switch_log`
--

DROP TABLE IF EXISTS `switch_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `switch_log` (
  `switch_id` int NOT NULL,
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `encoder_id` int DEFAULT NULL,
  KEY `fk_enco` (`encoder_id`),
  CONSTRAINT `fk_enco` FOREIGN KEY (`encoder_id`) REFERENCES `portname` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `switch_log`
--

LOCK TABLES `switch_log` WRITE;
/*!40000 ALTER TABLE `switch_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `switch_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `trigger_log`
--

DROP TABLE IF EXISTS `trigger_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `trigger_log` (
  `id` int NOT NULL AUTO_INCREMENT,
  `trigger_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT NULL,
  `event_time` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=715 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `trigger_log`
--

LOCK TABLES `trigger_log` WRITE;
/*!40000 ALTER TABLE `trigger_log` DISABLE KEYS */;
INSERT INTO `trigger_log` VALUES (1,'portname_trigger','2024-06-05 09:11:40'),(2,'portname_trigger','2024-06-07 05:09:42'),(3,'kvm_trigger','2024-06-07 05:14:41'),(4,'kvm_trigger','2024-06-07 05:14:55'),(5,'kvm_trigger','2024-06-07 05:16:00'),(6,'decoder_trigger','2024-06-07 05:17:29'),(7,'decoder_trigger','2024-06-07 05:18:08'),(8,'decoder_trigger','2024-06-07 05:18:17'),(9,'decoder_trigger','2024-06-07 05:18:41'),(10,'portname_trigger','2024-06-07 05:19:37'),(11,'portname_trigger','2024-06-07 05:20:17'),(12,'portname_trigger','2024-06-07 05:20:17'),(13,'portname_trigger','2024-06-07 05:20:17'),(14,'decoder_trigger','2024-06-07 05:20:17'),(15,'portname_trigger','2024-06-07 05:20:36'),(16,'portname_trigger','2024-06-07 05:20:36'),(17,'portname_trigger','2024-06-07 05:30:00'),(18,'decoder_trigger','2024-06-07 05:41:21'),(19,'portname_trigger','2024-06-07 05:43:38'),(20,'portname_trigger','2024-06-07 05:47:11'),(21,'portname_trigger','2024-06-07 05:47:20'),(22,'portname_trigger','2024-06-07 05:47:20'),(23,'portname_trigger','2024-06-07 05:47:30'),(24,'portname_trigger','2024-06-07 05:47:30'),(25,'portname_trigger','2024-06-07 05:47:34'),(26,'portname_trigger','2024-06-07 05:47:34'),(27,'portname_trigger','2024-06-07 05:47:42'),(28,'portname_trigger','2024-06-07 05:47:42'),(29,'portname_trigger','2024-06-07 05:47:42'),(30,'decoder_trigger','2024-06-07 05:47:42'),(31,'portname_trigger','2024-06-07 05:49:43'),(32,'portname_trigger','2024-06-07 05:49:46'),(33,'portname_trigger','2024-06-07 05:49:52'),(34,'portname_trigger','2024-06-07 05:50:20'),(35,'decoder_trigger','2024-06-07 05:56:27'),(36,'decoder_trigger','2024-06-07 05:58:16'),(37,'decoder_trigger','2024-06-07 05:59:02'),(38,'decoder_trigger','2024-06-07 05:59:30'),(39,'decoder_trigger','2024-06-07 05:59:39'),(40,'portname_trigger','2024-06-07 08:04:14'),(41,'portname_trigger','2024-06-07 08:04:24'),(42,'portname_trigger','2024-06-07 10:15:29'),(43,'decoder_trigger','2024-06-07 10:15:29'),(44,'portname_trigger','2024-06-07 10:16:40'),(45,'portname_trigger','2024-06-07 10:16:44'),(46,'portname_trigger','2024-06-07 10:18:31'),(47,'portname_trigger','2024-06-07 10:18:36'),(48,'portname_trigger','2024-06-07 10:18:43'),(49,'portname_trigger','2024-06-10 07:25:43'),(50,'portname_trigger','2024-06-10 07:25:46'),(51,'portname_trigger','2024-06-10 07:25:52'),(52,'portname_trigger','2024-06-10 07:26:43'),(53,'portname_trigger','2024-06-10 07:26:43'),(54,'portname_trigger','2024-06-10 07:27:02'),(55,'portname_trigger','2024-06-10 07:27:02'),(56,'portname_trigger','2024-06-10 07:29:42'),(57,'portname_trigger','2024-06-10 07:29:42'),(58,'portname_trigger','2024-06-10 07:29:45'),(59,'portname_trigger','2024-06-10 07:29:45'),(60,'portname_trigger','2024-06-10 07:29:52'),(61,'portname_trigger','2024-06-10 07:29:52'),(62,'portname_trigger','2024-06-10 07:30:00'),(63,'portname_trigger','2024-06-10 07:30:00'),(64,'portname_trigger','2024-06-10 08:52:00'),(65,'portname_trigger','2024-06-10 08:52:00'),(66,'portname_trigger','2024-06-10 08:52:02'),(67,'portname_trigger','2024-06-10 08:52:02'),(68,'portname_trigger','2024-06-10 13:12:42'),(69,'portname_trigger','2024-06-10 13:13:23'),(70,'portname_trigger','2024-06-10 13:13:55'),(71,'portname_trigger','2024-06-10 13:14:27'),(72,'portname_trigger','2024-06-10 13:14:31'),(73,'portname_trigger','2024-06-10 13:15:44'),(74,'portname_trigger','2024-06-10 13:15:54'),(75,'portname_trigger','2024-06-10 13:19:10'),(76,'portname_trigger','2024-06-10 13:19:44'),(77,'portname_trigger','2024-06-10 13:20:00'),(78,'portname_trigger','2024-06-13 10:32:41'),(79,'decoder_trigger','2024-06-13 10:57:43'),(80,'portname_trigger','2024-06-13 11:34:36'),(81,'portname_trigger','2024-06-13 11:34:36'),(82,'portname_trigger','2024-06-18 07:11:45'),(83,'portname_trigger','2024-06-19 08:59:11'),(84,'portname_trigger','2024-06-21 10:03:56'),(85,'portname_trigger','2024-07-22 13:06:07'),(86,'portname_trigger','2024-07-22 13:06:07'),(87,'portname_trigger','2024-07-24 07:25:35'),(88,'portname_trigger','2024-07-24 07:26:15'),(89,'portname_trigger','2024-07-24 07:26:57'),(90,'portname_trigger','2024-07-29 09:38:58'),(91,'portname_trigger','2024-07-29 09:40:02'),(92,'portname_trigger','2024-07-29 09:59:30'),(93,'portname_trigger','2024-07-29 10:02:40'),(94,'portname_trigger','2024-07-29 10:04:08'),(95,'portname_trigger','2024-07-29 10:04:10'),(96,'portname_trigger','2024-07-29 10:04:20'),(97,'portname_trigger','2024-07-29 10:04:31'),(98,'portname_trigger','2024-07-29 10:07:58'),(99,'portname_trigger','2024-07-29 10:08:10'),(100,'portname_trigger','2024-07-29 10:08:40'),(101,'portname_trigger','2024-07-29 10:08:49'),(102,'portname_trigger','2024-07-29 10:08:51'),(103,'portname_trigger','2024-07-29 10:13:22'),(104,'portname_trigger','2024-07-29 10:31:31'),(105,'portname_trigger','2024-07-29 10:34:49'),(106,'portname_trigger','2024-07-29 10:34:56'),(107,'portname_trigger','2024-07-29 10:34:58'),(108,'portname_trigger','2024-07-29 10:43:32'),(109,'portname_trigger','2024-07-29 10:44:38'),(110,'portname_trigger','2024-07-29 10:47:23'),(111,'portname_trigger','2024-07-29 11:02:39'),(112,'portname_trigger','2024-07-29 11:02:47'),(113,'portname_trigger','2024-07-29 11:02:59'),(114,'portname_trigger','2024-07-29 11:04:36'),(115,'portname_trigger','2024-07-29 11:04:55'),(116,'portname_trigger','2024-07-29 11:15:24'),(117,'portname_trigger','2024-07-29 11:15:24'),(118,'portname_trigger','2024-07-29 11:15:24'),(119,'decoder_trigger','2024-07-29 11:15:24'),(120,'decoder_trigger','2024-07-29 11:15:24'),(121,'portname_trigger','2024-07-29 11:16:14'),(122,'portname_trigger','2024-07-29 11:16:14'),(123,'decoder_trigger','2024-07-29 11:16:14'),(124,'decoder_trigger','2024-07-29 11:16:14'),(125,'portname_trigger','2024-07-29 11:28:35'),(126,'portname_trigger','2024-07-29 11:28:35'),(127,'decoder_trigger','2024-07-29 11:28:35'),(128,'decoder_trigger','2024-07-29 11:28:35'),(129,'portname_trigger','2024-07-29 11:30:29'),(130,'portname_trigger','2024-07-29 11:30:29'),(131,'decoder_trigger','2024-07-29 11:30:29'),(132,'decoder_trigger','2024-07-29 11:30:29'),(133,'portname_trigger','2024-07-29 11:31:32'),(134,'portname_trigger','2024-07-29 11:31:32'),(135,'decoder_trigger','2024-07-29 11:31:32'),(136,'decoder_trigger','2024-07-29 11:31:32'),(137,'kvm_trigger','2024-07-29 11:32:35'),(138,'portname_trigger','2024-07-29 11:35:08'),(139,'portname_trigger','2024-07-29 11:35:08'),(140,'decoder_trigger','2024-07-29 11:35:08'),(141,'decoder_trigger','2024-07-29 11:35:08'),(142,'portname_trigger','2024-07-29 11:41:06'),(143,'portname_trigger','2024-07-29 11:41:10'),(144,'portname_trigger','2024-07-29 11:41:32'),(145,'portname_trigger','2024-07-29 11:41:32'),(146,'decoder_trigger','2024-07-29 11:41:32'),(147,'decoder_trigger','2024-07-29 11:41:32'),(148,'portname_trigger','2024-07-29 12:15:39'),(149,'portname_trigger','2024-07-29 12:21:35'),(150,'portname_trigger','2024-07-29 12:21:48'),(151,'portname_trigger','2024-07-29 12:22:29'),(152,'portname_trigger','2024-07-29 12:23:36'),(153,'portname_trigger','2024-07-29 12:23:58'),(154,'portname_trigger','2024-07-29 12:28:41'),(155,'portname_trigger','2024-07-29 12:38:18'),(156,'portname_trigger','2024-07-29 12:38:53'),(157,'portname_trigger','2024-07-29 12:43:55'),(158,'portname_trigger','2024-07-29 12:43:55'),(159,'portname_trigger','2024-07-29 12:43:55'),(160,'portname_trigger','2024-07-29 12:43:59'),(161,'portname_trigger','2024-07-30 06:09:42'),(162,'portname_trigger','2024-07-30 06:10:09'),(163,'portname_trigger','2024-07-30 06:10:20'),(164,'portname_trigger','2024-07-30 06:46:45'),(165,'decoder_trigger','2024-07-30 06:46:45'),(166,'decoder_trigger','2024-07-30 06:46:45'),(167,'portname_trigger','2024-07-30 06:49:01'),(168,'portname_trigger','2024-07-30 06:49:01'),(169,'decoder_trigger','2024-07-30 06:49:02'),(170,'decoder_trigger','2024-07-30 06:49:02'),(171,'portname_trigger','2024-07-30 06:53:10'),(172,'portname_trigger','2024-07-30 06:53:10'),(173,'decoder_trigger','2024-07-30 06:53:10'),(174,'decoder_trigger','2024-07-30 06:53:10'),(175,'portname_trigger','2024-07-30 06:54:23'),(176,'portname_trigger','2024-07-30 06:54:23'),(177,'decoder_trigger','2024-07-30 06:54:24'),(178,'decoder_trigger','2024-07-30 06:54:24'),(179,'portname_trigger','2024-07-30 06:56:48'),(180,'portname_trigger','2024-07-30 06:56:48'),(181,'decoder_trigger','2024-07-30 06:56:48'),(182,'decoder_trigger','2024-07-30 06:56:48'),(183,'portname_trigger','2024-07-30 07:08:12'),(184,'portname_trigger','2024-07-30 07:08:12'),(185,'portname_trigger','2024-07-30 07:08:22'),(186,'portname_trigger','2024-07-30 07:08:22'),(187,'portname_trigger','2024-07-30 07:08:22'),(188,'portname_trigger','2024-07-30 07:10:02'),(189,'portname_trigger','2024-07-30 07:14:07'),(190,'portname_trigger','2024-07-30 07:37:19'),(191,'portname_trigger','2024-07-30 07:37:46'),(192,'portname_trigger','2024-07-30 07:39:23'),(193,'portname_trigger','2024-07-30 07:39:23'),(194,'portname_trigger','2024-07-30 07:40:52'),(195,'portname_trigger','2024-07-30 07:41:39'),(196,'portname_trigger','2024-07-30 07:41:39'),(197,'portname_trigger','2024-07-30 07:42:42'),(198,'portname_trigger','2024-07-30 07:42:47'),(199,'portname_trigger','2024-07-30 07:42:51'),(200,'portname_trigger','2024-07-30 07:49:29'),(201,'portname_trigger','2024-07-30 07:49:38'),(202,'portname_trigger','2024-07-30 07:50:30'),(203,'portname_trigger','2024-07-30 07:50:48'),(204,'portname_trigger','2024-07-30 07:50:55'),(205,'portname_trigger','2024-07-30 07:53:32'),(206,'portname_trigger','2024-07-30 07:53:35'),(207,'portname_trigger','2024-07-30 07:53:35'),(208,'decoder_trigger','2024-07-30 07:53:36'),(209,'decoder_trigger','2024-07-30 07:53:36'),(210,'portname_trigger','2024-07-30 07:53:58'),(211,'portname_trigger','2024-07-30 07:54:30'),(212,'decoder_trigger','2024-07-30 07:54:30'),(213,'decoder_trigger','2024-07-30 07:54:30'),(214,'portname_trigger','2024-07-30 07:54:46'),(215,'portname_trigger','2024-07-30 07:56:30'),(216,'portname_trigger','2024-07-30 07:56:30'),(217,'portname_trigger','2024-07-30 07:56:30'),(218,'portname_trigger','2024-07-30 07:56:30'),(219,'decoder_trigger','2024-07-30 07:56:30'),(220,'portname_trigger','2024-07-30 07:58:07'),(221,'portname_trigger','2024-07-30 07:58:07'),(222,'portname_trigger','2024-07-30 07:58:22'),(223,'portname_trigger','2024-07-30 07:58:22'),(224,'portname_trigger','2024-07-30 07:58:22'),(225,'portname_trigger','2024-07-30 07:58:22'),(226,'decoder_trigger','2024-07-30 07:58:22'),(227,'decoder_trigger','2024-07-30 07:58:22'),(228,'portname_trigger','2024-07-30 07:58:35'),(229,'portname_trigger','2024-07-30 07:58:35'),(230,'portname_trigger','2024-07-30 07:59:49'),(231,'portname_trigger','2024-07-30 07:59:51'),(232,'portname_trigger','2024-07-30 08:00:19'),(233,'portname_trigger','2024-07-30 08:00:19'),(234,'decoder_trigger','2024-07-30 08:00:19'),(235,'decoder_trigger','2024-07-30 08:00:19'),(236,'portname_trigger','2024-07-30 08:01:33'),(237,'portname_trigger','2024-07-30 08:01:33'),(238,'portname_trigger','2024-07-30 08:01:33'),(239,'portname_trigger','2024-07-30 08:01:33'),(240,'decoder_trigger','2024-07-30 08:01:33'),(241,'portname_trigger','2024-07-30 08:02:03'),(242,'portname_trigger','2024-07-30 08:02:03'),(243,'portname_trigger','2024-07-30 08:02:03'),(244,'portname_trigger','2024-07-30 08:02:03'),(245,'decoder_trigger','2024-07-30 08:02:03'),(246,'decoder_trigger','2024-07-30 08:02:03'),(247,'portname_trigger','2024-07-30 08:02:27'),(248,'portname_trigger','2024-07-30 08:02:27'),(249,'portname_trigger','2024-07-30 08:02:27'),(250,'portname_trigger','2024-07-30 08:02:27'),(251,'decoder_trigger','2024-07-30 08:02:27'),(252,'decoder_trigger','2024-07-30 08:02:27'),(253,'portname_trigger','2024-07-30 08:02:38'),(254,'portname_trigger','2024-07-30 08:02:38'),(255,'portname_trigger','2024-07-30 08:02:38'),(256,'portname_trigger','2024-07-30 08:02:38'),(257,'decoder_trigger','2024-07-30 08:02:38'),(258,'decoder_trigger','2024-07-30 08:02:38'),(259,'portname_trigger','2024-07-30 08:02:55'),(260,'portname_trigger','2024-07-30 08:02:55'),(261,'portname_trigger','2024-07-30 08:02:55'),(262,'portname_trigger','2024-07-30 08:02:55'),(263,'decoder_trigger','2024-07-30 08:02:55'),(264,'decoder_trigger','2024-07-30 08:02:55'),(265,'portname_trigger','2024-07-30 08:11:19'),(266,'portname_trigger','2024-07-30 08:11:21'),(267,'portname_trigger','2024-07-30 08:11:32'),(268,'portname_trigger','2024-07-30 08:11:32'),(269,'portname_trigger','2024-07-30 08:11:32'),(270,'decoder_trigger','2024-07-30 08:11:32'),(271,'portname_trigger','2024-07-30 08:12:22'),(272,'portname_trigger','2024-07-30 08:12:22'),(273,'portname_trigger','2024-07-30 08:12:22'),(274,'decoder_trigger','2024-07-30 08:12:22'),(275,'decoder_trigger','2024-07-30 08:12:22'),(276,'portname_trigger','2024-07-30 08:12:51'),(277,'portname_trigger','2024-07-30 08:12:51'),(278,'portname_trigger','2024-07-30 08:12:51'),(279,'decoder_trigger','2024-07-30 08:12:51'),(280,'decoder_trigger','2024-07-30 08:12:51'),(281,'portname_trigger','2024-07-30 08:13:50'),(282,'portname_trigger','2024-07-30 08:13:50'),(283,'portname_trigger','2024-07-30 08:13:50'),(284,'decoder_trigger','2024-07-30 08:13:50'),(285,'decoder_trigger','2024-07-30 08:13:50'),(286,'decoder_trigger','2024-07-30 08:24:04'),(287,'decoder_trigger','2024-07-30 08:24:04'),(288,'portname_trigger','2024-07-30 08:28:28'),(289,'portname_trigger','2024-07-30 08:28:28'),(290,'portname_trigger','2024-07-30 08:28:28'),(291,'portname_trigger','2024-07-30 08:28:28'),(292,'decoder_trigger','2024-07-30 08:28:28'),(293,'portname_trigger','2024-07-30 08:29:09'),(294,'portname_trigger','2024-07-30 08:29:09'),(295,'portname_trigger','2024-07-30 08:29:09'),(296,'decoder_trigger','2024-07-30 08:29:09'),(297,'decoder_trigger','2024-07-30 08:29:09'),(298,'portname_trigger','2024-07-30 08:30:13'),(299,'portname_trigger','2024-07-30 08:30:15'),(300,'portname_trigger','2024-07-30 08:31:03'),(301,'portname_trigger','2024-07-30 08:31:03'),(302,'portname_trigger','2024-07-30 08:31:03'),(303,'portname_trigger','2024-07-30 08:31:03'),(304,'decoder_trigger','2024-07-30 08:31:03'),(305,'decoder_trigger','2024-07-30 08:31:03'),(306,'portname_trigger','2024-07-30 08:31:17'),(307,'portname_trigger','2024-07-30 08:31:17'),(308,'portname_trigger','2024-07-30 08:31:17'),(309,'portname_trigger','2024-07-30 08:31:17'),(310,'decoder_trigger','2024-07-30 08:31:18'),(311,'decoder_trigger','2024-07-30 08:31:18'),(312,'decoder_trigger','2024-07-30 08:32:38'),(313,'decoder_trigger','2024-07-30 08:37:55'),(314,'decoder_trigger','2024-07-30 08:37:55'),(315,'portname_trigger','2024-07-30 08:46:43'),(316,'portname_trigger','2024-07-30 08:46:43'),(317,'portname_trigger','2024-07-30 08:46:43'),(318,'decoder_trigger','2024-07-30 08:46:43'),(319,'portname_trigger','2024-07-30 08:51:44'),(320,'portname_trigger','2024-07-30 08:51:58'),(321,'portname_trigger','2024-07-30 08:51:58'),(322,'decoder_trigger','2024-07-30 08:51:58'),(323,'portname_trigger','2024-07-30 08:52:49'),(324,'portname_trigger','2024-07-30 08:52:49'),(325,'portname_trigger','2024-07-30 08:53:53'),(326,'portname_trigger','2024-07-30 08:54:19'),(327,'portname_trigger','2024-07-30 08:54:19'),(328,'portname_trigger','2024-07-30 08:55:14'),(329,'portname_trigger','2024-07-30 09:08:49'),(330,'portname_trigger','2024-07-30 09:08:49'),(331,'portname_trigger','2024-07-30 09:08:49'),(332,'decoder_trigger','2024-07-30 09:08:49'),(333,'portname_trigger','2024-07-30 09:10:00'),(334,'portname_trigger','2024-07-30 09:10:00'),(335,'portname_trigger','2024-07-30 09:10:28'),(336,'portname_trigger','2024-07-30 09:10:28'),(337,'decoder_trigger','2024-07-30 09:10:28'),(338,'decoder_trigger','2024-07-30 09:10:28'),(339,'decoder_trigger','2024-07-30 09:10:28'),(340,'decoder_trigger','2024-07-30 09:10:28'),(341,'portname_trigger','2024-07-30 09:11:09'),(342,'portname_trigger','2024-07-30 09:11:09'),(343,'portname_trigger','2024-07-30 09:11:50'),(344,'portname_trigger','2024-07-30 09:11:52'),(345,'portname_trigger','2024-07-30 09:12:37'),(346,'portname_trigger','2024-07-30 09:12:57'),(347,'portname_trigger','2024-07-30 09:24:58'),(348,'portname_trigger','2024-07-30 09:24:59'),(349,'portname_trigger','2024-07-30 09:35:48'),(350,'portname_trigger','2024-07-30 09:35:51'),(351,'portname_trigger','2024-07-30 09:37:41'),(352,'decoder_trigger','2024-07-30 09:37:42'),(353,'decoder_trigger','2024-07-30 09:37:42'),(354,'portname_trigger','2024-07-30 10:25:19'),(355,'portname_trigger','2024-07-30 10:25:19'),(356,'portname_trigger','2024-07-30 10:25:19'),(357,'portname_trigger','2024-07-30 10:25:19'),(358,'decoder_trigger','2024-07-30 10:25:19'),(359,'decoder_trigger','2024-07-30 10:25:19'),(360,'portname_trigger','2024-07-30 10:25:35'),(361,'portname_trigger','2024-07-30 10:25:35'),(362,'decoder_trigger','2024-07-30 10:25:35'),(363,'portname_trigger','2024-07-30 10:25:53'),(364,'portname_trigger','2024-07-30 10:25:53'),(365,'portname_trigger','2024-07-30 10:25:53'),(366,'decoder_trigger','2024-07-30 10:25:53'),(367,'decoder_trigger','2024-07-30 10:25:53'),(368,'portname_trigger','2024-07-30 10:28:17'),(369,'portname_trigger','2024-07-30 10:28:37'),(370,'decoder_trigger','2024-07-30 10:29:09'),(371,'portname_trigger','2024-07-30 10:30:36'),(372,'portname_trigger','2024-07-30 11:12:39'),(373,'portname_trigger','2024-07-30 11:18:02'),(374,'portname_trigger','2024-07-30 11:20:29'),(375,'portname_trigger','2024-07-30 11:20:30'),(376,'portname_trigger','2024-07-30 11:24:54'),(377,'portname_trigger','2024-07-30 11:25:18'),(378,'portname_trigger','2024-07-30 11:38:53'),(379,'portname_trigger','2024-07-30 11:40:31'),(380,'portname_trigger','2024-07-30 11:40:32'),(381,'portname_trigger','2024-07-30 11:46:00'),(382,'portname_trigger','2024-07-30 11:48:18'),(383,'portname_trigger','2024-07-30 11:48:18'),(384,'portname_trigger','2024-07-30 11:50:13'),(385,'portname_trigger','2024-07-30 11:55:37'),(386,'portname_trigger','2024-07-30 12:02:22'),(387,'portname_trigger','2024-07-30 12:29:56'),(388,'portname_trigger','2024-07-30 12:31:49'),(389,'portname_trigger','2024-07-30 12:31:50'),(390,'portname_trigger','2024-07-30 12:33:03'),(391,'portname_trigger','2024-07-30 12:35:55'),(392,'portname_trigger','2024-07-30 12:36:57'),(393,'portname_trigger','2024-07-30 12:37:29'),(394,'portname_trigger','2024-07-30 12:38:33'),(395,'portname_trigger','2024-07-31 04:56:39'),(396,'portname_trigger','2024-07-31 06:27:04'),(397,'portname_trigger','2024-07-31 06:27:54'),(398,'portname_trigger','2024-07-31 06:34:35'),(399,'portname_trigger','2024-07-31 06:43:52'),(400,'decoder_trigger','2024-07-31 06:44:13'),(401,'decoder_trigger','2024-07-31 06:44:13'),(402,'decoder_trigger','2024-07-31 06:44:13'),(403,'decoder_trigger','2024-07-31 06:44:13'),(404,'decoder_trigger','2024-07-31 06:44:13'),(405,'decoder_trigger','2024-07-31 06:44:13'),(406,'portname_trigger','2024-07-31 06:48:00'),(407,'portname_trigger','2024-07-31 06:48:28'),(408,'portname_trigger','2024-07-31 07:14:55'),(409,'portname_trigger','2024-07-31 08:19:11'),(410,'portname_trigger','2024-07-31 08:19:49'),(411,'portname_trigger','2024-07-31 08:19:50'),(412,'portname_trigger','2024-07-31 08:30:06'),(413,'portname_trigger','2024-07-31 08:36:47'),(414,'portname_trigger','2024-07-31 08:38:12'),(415,'portname_trigger','2024-07-31 08:43:34'),(416,'portname_trigger','2024-07-31 08:49:48'),(417,'portname_trigger','2024-07-31 08:49:59'),(418,'portname_trigger','2024-07-31 08:56:30'),(419,'portname_trigger','2024-07-31 09:06:46'),(420,'portname_trigger','2024-07-31 09:06:47'),(421,'portname_trigger','2024-07-31 09:08:17'),(422,'portname_trigger','2024-07-31 09:09:18'),(423,'portname_trigger','2024-07-31 09:09:24'),(424,'portname_trigger','2024-07-31 09:10:16'),(425,'portname_trigger','2024-07-31 09:24:22'),(426,'portname_trigger','2024-07-31 09:24:33'),(427,'portname_trigger','2024-07-31 09:25:23'),(428,'portname_trigger','2024-07-31 09:25:28'),(429,'portname_trigger','2024-07-31 09:29:41'),(430,'portname_trigger','2024-07-31 09:29:49'),(431,'portname_trigger','2024-07-31 09:33:53'),(432,'decoder_trigger','2024-07-31 09:44:42'),(433,'decoder_trigger','2024-07-31 09:44:46'),(434,'decoder_trigger','2024-07-31 09:44:49'),(435,'decoder_trigger','2024-07-31 09:44:54'),(436,'decoder_trigger','2024-07-31 09:44:58'),(437,'decoder_trigger','2024-07-31 09:45:04'),(438,'portname_trigger','2024-07-31 09:45:41'),(439,'portname_trigger','2024-07-31 09:45:45'),(440,'decoder_trigger','2024-07-31 09:46:25'),(441,'portname_trigger','2024-07-31 09:54:21'),(442,'portname_trigger','2024-07-31 09:54:30'),(443,'portname_trigger','2024-07-31 10:04:55'),(444,'portname_trigger','2024-07-31 10:05:23'),(445,'portname_trigger','2024-07-31 10:08:22'),(446,'portname_trigger','2024-07-31 10:10:20'),(447,'portname_trigger','2024-07-31 10:11:15'),(448,'portname_trigger','2024-07-31 10:11:21'),(449,'portname_trigger','2024-07-31 10:11:38'),(450,'portname_trigger','2024-07-31 10:16:03'),(451,'portname_trigger','2024-07-31 10:22:15'),(452,'portname_trigger','2024-07-31 10:22:19'),(453,'portname_trigger','2024-07-31 10:25:28'),(454,'portname_trigger','2024-07-31 10:26:33'),(455,'portname_trigger','2024-07-31 10:31:17'),(456,'portname_trigger','2024-07-31 10:32:13'),(457,'portname_trigger','2024-07-31 10:35:51'),(458,'portname_trigger','2024-07-31 10:38:02'),(459,'portname_trigger','2024-07-31 10:39:27'),(460,'portname_trigger','2024-07-31 11:33:50'),(461,'portname_trigger','2024-07-31 11:33:52'),(462,'portname_trigger','2024-07-31 11:33:57'),(463,'portname_trigger','2024-07-31 11:55:03'),(464,'portname_trigger','2024-07-31 11:55:14'),(465,'portname_trigger','2024-07-31 11:56:17'),(466,'portname_trigger','2024-07-31 11:57:54'),(467,'portname_trigger','2024-07-31 11:59:17'),(468,'portname_trigger','2024-08-01 05:23:57'),(469,'portname_trigger','2024-08-01 05:23:59'),(470,'portname_trigger','2024-08-01 05:27:02'),(471,'portname_trigger','2024-08-01 05:32:08'),(472,'portname_trigger','2024-08-01 06:11:00'),(473,'portname_trigger','2024-08-01 06:12:47'),(474,'portname_trigger','2024-08-01 06:23:01'),(475,'portname_trigger','2024-08-01 06:31:02'),(476,'portname_trigger','2024-08-01 06:35:06'),(477,'portname_trigger','2024-08-01 06:41:48'),(478,'portname_trigger','2024-08-01 06:56:35'),(479,'portname_trigger','2024-08-01 06:57:52'),(480,'portname_trigger','2024-08-01 06:59:44'),(481,'decoder_trigger','2024-08-01 07:17:54'),(482,'decoder_trigger','2024-08-01 07:17:54'),(483,'portname_trigger','2024-08-01 07:19:22'),(484,'portname_trigger','2024-08-01 07:27:00'),(485,'portname_trigger','2024-08-01 07:30:33'),(486,'portname_trigger','2024-08-01 07:31:50'),(487,'portname_trigger','2024-08-01 07:34:35'),(488,'portname_trigger','2024-08-01 07:40:00'),(489,'portname_trigger','2024-08-01 07:40:22'),(490,'portname_trigger','2024-08-01 07:53:22'),(491,'portname_trigger','2024-08-01 08:19:26'),(492,'portname_trigger','2024-08-01 08:23:47'),(493,'portname_trigger','2024-08-01 08:29:15'),(494,'portname_trigger','2024-08-01 08:31:21'),(495,'portname_trigger','2024-08-01 08:36:43'),(496,'portname_trigger','2024-08-01 08:40:53'),(497,'decoder_trigger','2024-08-01 08:41:44'),(498,'portname_trigger','2024-08-01 09:06:23'),(499,'portname_trigger','2024-08-01 09:12:14'),(500,'portname_trigger','2024-08-01 09:21:03'),(501,'portname_trigger','2024-08-01 09:24:01'),(502,'portname_trigger','2024-08-01 10:02:00'),(503,'portname_trigger','2024-08-01 10:06:57'),(504,'portname_trigger','2024-08-01 10:14:20'),(505,'portname_trigger','2024-08-01 11:14:55'),(506,'portname_trigger','2024-08-01 11:14:58'),(507,'portname_trigger','2024-08-01 11:22:17'),(508,'portname_trigger','2024-08-01 11:22:20'),(509,'portname_trigger','2024-08-01 11:27:20'),(510,'portname_trigger','2024-08-01 11:34:40'),(511,'portname_trigger','2024-08-01 11:35:19'),(512,'portname_trigger','2024-08-01 11:42:33'),(513,'portname_trigger','2024-08-01 12:06:06'),(514,'portname_trigger','2024-08-01 12:27:19'),(515,'portname_trigger','2024-08-01 12:28:34'),(516,'portname_trigger','2024-08-01 12:29:39'),(517,'portname_trigger','2024-08-01 12:38:05'),(518,'portname_trigger','2024-08-01 12:40:08'),(519,'portname_trigger','2024-08-01 12:44:16'),(520,'portname_trigger','2024-08-01 12:46:28'),(521,'portname_trigger','2024-08-02 06:10:40'),(522,'portname_trigger','2024-08-02 06:11:34'),(523,'portname_trigger','2024-08-02 06:20:08'),(524,'portname_trigger','2024-08-02 06:22:46'),(525,'portname_trigger','2024-08-02 06:22:52'),(526,'portname_trigger','2024-08-02 06:26:43'),(527,'portname_trigger','2024-08-02 06:26:45'),(528,'portname_trigger','2024-08-02 06:28:28'),(529,'portname_trigger','2024-08-02 06:28:35'),(530,'portname_trigger','2024-08-02 06:29:39'),(531,'portname_trigger','2024-08-02 06:29:51'),(532,'portname_trigger','2024-08-02 06:32:57'),(533,'portname_trigger','2024-08-02 06:33:48'),(534,'portname_trigger','2024-08-02 06:40:54'),(535,'portname_trigger','2024-08-02 06:41:37'),(536,'portname_trigger','2024-08-02 06:44:05'),(537,'portname_trigger','2024-08-02 06:44:11'),(538,'portname_trigger','2024-08-02 06:51:37'),(539,'portname_trigger','2024-08-02 06:51:40'),(540,'portname_trigger','2024-08-02 06:55:54'),(541,'portname_trigger','2024-08-02 06:57:08'),(542,'portname_trigger','2024-08-02 06:58:09'),(543,'portname_trigger','2024-08-02 06:58:20'),(544,'portname_trigger','2024-08-02 06:59:07'),(545,'portname_trigger','2024-08-02 07:00:59'),(546,'portname_trigger','2024-08-02 07:02:48'),(547,'portname_trigger','2024-08-02 07:03:21'),(548,'portname_trigger','2024-08-02 07:15:42'),(549,'portname_trigger','2024-08-02 07:15:50'),(550,'portname_trigger','2024-08-02 07:21:58'),(551,'portname_trigger','2024-08-02 07:23:09'),(552,'portname_trigger','2024-08-02 07:23:45'),(553,'portname_trigger','2024-08-02 07:24:52'),(554,'portname_trigger','2024-08-02 07:26:56'),(555,'portname_trigger','2024-08-02 07:28:19'),(556,'portname_trigger','2024-08-02 07:29:36'),(557,'portname_trigger','2024-08-02 07:30:23'),(558,'portname_trigger','2024-08-02 07:31:22'),(559,'portname_trigger','2024-08-02 07:38:22'),(560,'portname_trigger','2024-08-02 07:39:17'),(561,'portname_trigger','2024-08-02 07:39:59'),(562,'portname_trigger','2024-08-02 07:40:53'),(563,'portname_trigger','2024-08-02 07:52:33'),(564,'portname_trigger','2024-08-02 07:52:52'),(565,'portname_trigger','2024-08-02 07:58:06'),(566,'portname_trigger','2024-08-02 08:02:22'),(567,'portname_trigger','2024-08-02 08:02:23'),(568,'portname_trigger','2024-08-02 08:03:39'),(569,'portname_trigger','2024-08-02 08:04:56'),(570,'portname_trigger','2024-08-02 08:05:25'),(571,'portname_trigger','2024-08-02 08:06:25'),(572,'portname_trigger','2024-08-02 08:08:31'),(573,'portname_trigger','2024-08-02 08:35:48'),(574,'portname_trigger','2024-08-02 08:45:42'),(575,'portname_trigger','2024-08-02 08:45:42'),(576,'portname_trigger','2024-08-02 08:47:03'),(577,'portname_trigger','2024-08-02 08:47:26'),(578,'portname_trigger','2024-08-02 08:48:37'),(579,'portname_trigger','2024-08-02 08:48:44'),(580,'portname_trigger','2024-08-02 08:50:39'),(581,'portname_trigger','2024-08-02 08:51:32'),(582,'portname_trigger','2024-08-02 08:53:40'),(583,'portname_trigger','2024-08-02 08:55:17'),(584,'portname_trigger','2024-08-02 08:55:21'),(585,'portname_trigger','2024-08-02 08:57:23'),(586,'portname_trigger','2024-08-02 08:57:44'),(587,'portname_trigger','2024-08-02 08:58:15'),(588,'portname_trigger','2024-08-02 08:59:22'),(589,'portname_trigger','2024-08-02 08:59:49'),(590,'portname_trigger','2024-08-02 09:00:10'),(591,'portname_trigger','2024-08-02 09:00:13'),(592,'portname_trigger','2024-08-02 09:03:38'),(593,'portname_trigger','2024-08-02 09:03:55'),(594,'portname_trigger','2024-08-02 09:05:22'),(595,'portname_trigger','2024-08-02 09:06:08'),(596,'portname_trigger','2024-08-02 09:18:57'),(597,'portname_trigger','2024-08-02 09:19:00'),(598,'portname_trigger','2024-08-02 09:23:25'),(599,'portname_trigger','2024-08-02 09:23:45'),(600,'portname_trigger','2024-08-02 09:26:06'),(601,'portname_trigger','2024-08-02 09:26:50'),(602,'portname_trigger','2024-08-02 09:37:29'),(603,'portname_trigger','2024-08-02 09:37:55'),(604,'portname_trigger','2024-08-02 09:38:01'),(605,'portname_trigger','2024-08-02 09:38:45'),(606,'portname_trigger','2024-08-02 09:49:39'),(607,'portname_trigger','2024-08-02 09:50:49'),(608,'portname_trigger','2024-08-02 09:52:23'),(609,'portname_trigger','2024-08-02 10:22:15'),(610,'portname_trigger','2024-08-02 10:22:17'),(611,'portname_trigger','2024-08-02 10:23:02'),(612,'portname_trigger','2024-08-02 10:24:14'),(613,'portname_trigger','2024-08-02 10:24:25'),(614,'portname_trigger','2024-08-02 10:34:52'),(615,'portname_trigger','2024-08-02 10:34:54'),(616,'portname_trigger','2024-08-02 10:37:25'),(617,'portname_trigger','2024-08-02 10:37:27'),(618,'portname_trigger','2024-08-02 10:38:00'),(619,'portname_trigger','2024-08-02 10:40:00'),(620,'portname_trigger','2024-08-02 10:41:14'),(621,'portname_trigger','2024-08-02 10:41:55'),(622,'portname_trigger','2024-08-02 10:42:41'),(623,'portname_trigger','2024-08-02 10:43:30'),(624,'portname_trigger','2024-08-02 10:55:12'),(625,'portname_trigger','2024-08-02 10:56:16'),(626,'portname_trigger','2024-08-02 11:09:20'),(627,'portname_trigger','2024-08-02 11:13:06'),(628,'portname_trigger','2024-08-02 11:13:59'),(629,'portname_trigger','2024-08-02 11:14:50'),(630,'portname_trigger','2024-08-02 11:15:48'),(631,'portname_trigger','2024-08-02 11:16:45'),(632,'portname_trigger','2024-08-02 11:21:02'),(633,'portname_trigger','2024-08-02 11:21:34'),(634,'portname_trigger','2024-08-02 11:22:51'),(635,'portname_trigger','2024-08-02 11:23:45'),(636,'portname_trigger','2024-08-02 11:24:44'),(637,'portname_trigger','2024-08-02 11:26:41'),(638,'portname_trigger','2024-08-02 12:10:55'),(639,'portname_trigger','2024-08-02 12:14:07'),(640,'portname_trigger','2024-08-02 12:14:47'),(641,'portname_trigger','2024-08-02 12:14:50'),(642,'portname_trigger','2024-08-02 12:19:18'),(643,'portname_trigger','2024-08-02 12:19:21'),(644,'portname_trigger','2024-08-02 12:20:34'),(645,'portname_trigger','2024-08-02 12:27:06'),(646,'portname_trigger','2024-08-02 12:27:09'),(647,'portname_trigger','2024-08-02 12:30:02'),(648,'portname_trigger','2024-08-02 12:33:57'),(649,'portname_trigger','2024-08-02 12:35:59'),(650,'portname_trigger','2024-08-02 12:37:05'),(651,'portname_trigger','2024-08-02 12:41:53'),(652,'portname_trigger','2024-08-02 12:45:30'),(653,'portname_trigger','2024-08-02 12:53:11'),(654,'portname_trigger','2024-08-02 12:56:55'),(655,'portname_trigger','2024-08-02 12:57:24'),(656,'portname_trigger','2024-08-02 12:59:34'),(657,'portname_trigger','2024-08-05 06:45:42'),(658,'portname_trigger','2024-08-05 08:47:37'),(659,'portname_trigger','2024-08-05 08:57:20'),(660,'portname_trigger','2024-08-05 08:58:30'),(661,'portname_trigger','2024-08-05 08:59:47'),(662,'portname_trigger','2024-08-05 09:00:51'),(663,'portname_trigger','2024-08-05 09:02:20'),(664,'portname_trigger','2024-08-05 09:04:35'),(665,'portname_trigger','2024-08-05 09:06:07'),(666,'portname_trigger','2024-08-05 09:07:38'),(667,'portname_trigger','2024-08-05 09:08:45'),(668,'portname_trigger','2024-08-05 09:09:56'),(669,'portname_trigger','2024-08-06 06:43:21'),(670,'portname_trigger','2024-08-06 06:43:29'),(671,'portname_trigger','2024-08-06 06:43:41'),(672,'portname_trigger','2024-08-06 06:43:42'),(673,'portname_trigger','2024-08-06 06:46:18'),(674,'decoder_trigger','2024-08-06 06:47:04'),(675,'decoder_trigger','2024-08-06 06:47:08'),(676,'portname_trigger','2024-08-06 06:48:13'),(677,'portname_trigger','2024-08-06 06:49:34'),(678,'portname_trigger','2024-08-06 06:49:53'),(679,'portname_trigger','2024-08-06 06:50:29'),(680,'portname_trigger','2024-08-06 09:23:19'),(681,'portname_trigger','2024-08-06 10:26:26'),(682,'portname_trigger','2024-08-06 11:13:42'),(683,'portname_trigger','2024-08-06 11:18:00'),(684,'portname_trigger','2024-08-16 05:19:13'),(685,'portname_trigger','2024-08-16 05:19:13'),(686,'portname_trigger','2024-08-16 05:20:51'),(687,'portname_trigger','2024-08-16 05:21:28'),(688,'portname_trigger','2024-08-16 05:22:07'),(689,'decoder_trigger','2024-08-16 05:22:13'),(690,'portname_trigger','2024-08-16 05:23:05'),(691,'portname_trigger','2024-08-16 05:23:28'),(692,'portname_trigger','2024-08-16 05:56:39'),(693,'portname_trigger','2024-08-16 06:02:45'),(694,'portname_trigger','2024-08-16 06:03:08'),(695,'portname_trigger','2024-08-16 06:03:30'),(696,'portname_trigger','2024-08-16 06:04:17'),(697,'portname_trigger','2024-08-16 06:04:32'),(698,'portname_trigger','2024-08-16 06:04:52'),(699,'portname_trigger','2024-08-16 06:05:48'),(700,'portname_trigger','2024-08-16 06:11:48'),(701,'portname_trigger','2024-08-16 06:20:55'),(702,'portname_trigger','2024-08-16 06:21:34'),(703,'user_trigger','2024-08-16 06:26:24'),(704,'user_trigger','2024-08-16 06:27:29'),(705,'user_trigger','2024-08-16 06:35:57'),(706,'decoder_trigger','2024-08-16 06:43:00'),(707,'decoder_trigger','2024-08-16 06:43:31'),(708,'decoder_trigger','2024-08-16 06:43:41'),(709,'decoder_trigger','2024-08-16 06:43:49'),(710,'decoder_trigger','2024-08-16 06:46:09'),(711,'decoder_trigger','2024-08-16 06:46:09'),(712,'decoder_trigger','2024-08-16 06:46:09'),(713,'decoder_trigger','2024-08-16 06:46:09'),(714,'portname_trigger','2024-08-16 06:49:52');
/*!40000 ALTER TABLE `trigger_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `upgradehistory`
--

DROP TABLE IF EXISTS `upgradehistory`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `upgradehistory` (
  `no` int NOT NULL AUTO_INCREMENT,
  `type` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `user` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `starttime` datetime NOT NULL,
  `endtime` datetime NOT NULL,
  `perversion` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `upgradeversion` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `result` varchar(80) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `path` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `upgradehistory`
--

LOCK TABLES `upgradehistory` WRITE;
/*!40000 ALTER TABLE `upgradehistory` DISABLE KEYS */;
/*!40000 ALTER TABLE `upgradehistory` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user_log`
--

DROP TABLE IF EXISTS `user_log`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `user_log` (
  `user_id` int NOT NULL,
  `table_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `column_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `new_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user_log`
--

LOCK TABLES `user_log` WRITE;
/*!40000 ALTER TABLE `user_log` DISABLE KEYS */;
/*!40000 ALTER TABLE `user_log` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `username`
--

DROP TABLE IF EXISTS `username`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `username` (
  `id` int NOT NULL AUTO_INCREMENT,
  `aesname` text CHARACTER SET latin1 COLLATE latin1_bin NOT NULL,
  `desname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci,
  `3desname` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `aespass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `despass` text CHARACTER SET latin1 COLLATE latin1_swedish_ci NOT NULL,
  `3despass` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `active` int NOT NULL,
  `authority` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `username` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` text CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `view` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `hid` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mass` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `card` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `virtual` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `lastUpdatedBy` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `username`
--

LOCK TABLES `username` WRITE;
/*!40000 ALTER TABLE `username` DISABLE KEYS */;
INSERT INTO `username` VALUES (1,'39ECqzRcvCL6lkFsRRLwMA==','DZFChS19WJ8=','ZOzCZDBJmoE=','5FtMB7azcO5eWnBzjW16Kg==','pwjqEguZCkY+n36dJGmnXA==','c8HNkEynNj+4qewzjNi3qw==',1,'Admin','Admin','Admin@123','OFF','on','','on','on','2024-05-29 05:24:40'),(2,'VOZhiwPGRBQPqH9C4mqurg==','NM0ufMi7JW8=','C9DNFNcY9ME=','9R6qXV199LHiLvc=','€š¾bãï÷a2Æò?)Ž´','6M0pao9hrFEf1t5aoMouuQ==',1,'User','USER2','User2@12345','OFF','on','on','','','2024-08-16 06:26:24'),(3,'rnXISJN6sIxR4zR7uMUOlA==','KD2pjm85xY0=','MoeZznMF+8g=','T8uFqecbePP74G1nq1+/1g==','RC8Uz2ijCfzhmEtUWlv6Hg==','H+Mrj6NXGS8bHz7GGsn70A==',1,'Admin','USER3','User3@12345','OFF','on','on','on','on','2024-08-16 06:35:57'),(4,'hv6bRIo6dg2REa7ZovbA0Q==','','XHJs2Ory9QM=','9R6qXVt99LHiLvc=','€<‘}_7r\0^9—Å˜Õ','VC0b/yisuRIvoMiMFOULGg==',1,'Admin','USER4','User4@12345','OFF','','on','on','','2024-04-23 16:04:44');
/*!40000 ALTER TABLE `username` ENABLE KEYS */;
UNLOCK TABLES;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `notify` AFTER UPDATE ON `username` FOR EACH ROW BEGIN
    IF NEW.hid != OLD.hid THEN
        INSERT INTO rabbitmq_queue (id, table_name, column_name, new_value, timestamp)
        VALUES (NEW.id, 'username', 'hid', NEW.hid, NOW());
    END IF;

    IF NEW.mass != OLD.mass THEN
        INSERT INTO rabbitmq_queue (id, table_name, column_name, new_value, timestamp)
        VALUES (NEW.id, 'username', 'mass', NEW.mass, NOW());
    END IF;

    IF NEW.card != OLD.card THEN
        INSERT INTO rabbitmq_queue (id, table_name, column_name, new_value, timestamp)
        VALUES (NEW.id, 'username', 'card', NEW.card, NOW());
    END IF;

    IF NEW.virtual != OLD.virtual THEN
        INSERT INTO rabbitmq_queue (id, table_name, column_name, new_value, timestamp)
        VALUES (NEW.id, 'username', 'virtual', NEW.virtual, NOW());
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = utf8mb4 */ ;
/*!50003 SET character_set_results = utf8mb4 */ ;
/*!50003 SET collation_connection  = utf8mb4_0900_ai_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'ONLY_FULL_GROUP_BY,STRICT_TRANS_TABLES,NO_ZERO_IN_DATE,NO_ZERO_DATE,ERROR_FOR_DIVISION_BY_ZERO,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50017 DEFINER=`kvm`@`localhost`*/ /*!50003 TRIGGER `user_trigger` AFTER UPDATE ON `username` FOR EACH ROW BEGIN
    DECLARE column_name VARCHAR(255);
    DECLARE new_value VARCHAR(255);
         DECLARE trigger_name VARCHAR(255);

     SET trigger_name='user_trigger';
    
    IF NEW.view <> OLD.view THEN
        SET column_name = 'view';
        SET new_value = NEW.view;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

    IF NEW.hid <> OLD.hid THEN
        
        SET column_name = 'hid';
        SET new_value = NEW.hid;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;
    
    IF NEW.`mass` <> OLD.`mass` THEN
        
        SET column_name = 'mass';
        SET new_value = NEW.`mass`;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;
    
    IF NEW.virtual <> OLD.virtual THEN
        
        SET column_name = 'virtual';
        SET new_value = NEW.virtual;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;
    
    IF NEW.active <> OLD.active THEN
        
        SET column_name = 'active';
        SET new_value = NEW.active;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

    IF NEW.authority <> OLD.authority THEN
        
        SET column_name = 'authority';
        SET new_value = NEW.authority;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

    IF NEW.username <> OLD.username THEN
        
        SET column_name = 'username';
        SET new_value = NEW.username;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

    IF NEW.password <> OLD.password THEN
        
        SET column_name = 'password';
        SET new_value = NEW.password;
        INSERT INTO user_log (user_id, table_name, column_name, new_value) VALUES ( OLD.id, 'username', column_name, new_value);
    INSERT INTO trigger_log (trigger_name) VALUES (trigger_name); END IF;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;

--
-- Table structure for table `waiting_list`
--

DROP TABLE IF EXISTS `waiting_list`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `waiting_list` (
  `id` int NOT NULL AUTO_INCREMENT,
  `user_id` int DEFAULT NULL,
  `login_time` timestamp NULL DEFAULT NULL,
  `served` tinyint(1) DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `waiting_list`
--

LOCK TABLES `waiting_list` WRITE;
/*!40000 ALTER TABLE `waiting_list` DISABLE KEYS */;
INSERT INTO `waiting_list` VALUES (1,1,'2024-06-10 12:34:55',0),(2,1,'2024-06-19 08:53:50',0),(3,1,'2024-07-24 07:24:21',0),(4,2,'2024-07-30 08:26:12',0),(5,1,'2024-07-30 12:30:48',0),(6,2,'2024-08-02 06:09:49',0),(7,1,'2024-08-06 09:09:59',0),(8,4,'2024-08-16 06:36:31',0);
/*!40000 ALTER TABLE `waiting_list` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2024-08-16  3:17:31
