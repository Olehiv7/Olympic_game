-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: olympic_game
-- ------------------------------------------------------
-- Server version	10.4.32-MariaDB

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `athletes`
--

DROP TABLE IF EXISTS `athletes`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `athletes` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(100) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_athlete_country` (`country_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athletes`
--

LOCK TABLES `athletes` WRITE;
/*!40000 ALTER TABLE `athletes` DISABLE KEYS */;
INSERT INTO `athletes` VALUES (1,'Usain Bolt','Male',30,1),(2,'Katie Ledecky','Female',23,1),(3,'Oleksandr Usyk','Male',29,5),(4,'Simone Biles','Female',22,1),(5,'Yuto Horigome','Male',20,2);
/*!40000 ALTER TABLE `athletes` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competitions`
--

DROP TABLE IF EXISTS `competitions`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competitions` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `competition_name` varchar(100) NOT NULL,
  `competition_date` date NOT NULL,
  `discipline_id` int(11) NOT NULL,
  `olympic_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_competition_discipline` (`discipline_id`),
  KEY `idx_competition_olympic` (`olympic_id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competitions`
--

LOCK TABLES `competitions` WRITE;
/*!40000 ALTER TABLE `competitions` DISABLE KEYS */;
INSERT INTO `competitions` VALUES (1,'Men 100m Final','2016-08-14',1,1),(2,'Women Long Jump Final','2020-07-30',2,2),(3,'Men Freestyle 100m Final','2024-07-28',3,3);
/*!40000 ALTER TABLE `competitions` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `countries`
--

DROP TABLE IF EXISTS `countries`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `countries` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(100) NOT NULL,
  `continent` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `countries`
--

LOCK TABLES `countries` WRITE;
/*!40000 ALTER TABLE `countries` DISABLE KEYS */;
INSERT INTO `countries` VALUES (1,'Jamaica','North America\r\n'),(3,'China','Asia'),(4,'USA','North America'),(5,'Spain','Europe'),(6,'Ukraine','Europe');
/*!40000 ALTER TABLE `countries` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `disciplines`
--

DROP TABLE IF EXISTS `disciplines`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `disciplines` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discipline_name` varchar(100) NOT NULL,
  `venue` varchar(100) NOT NULL,
  `rules` varchar(255) DEFAULT NULL,
  `sport_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `discipline_name` (`discipline_name`),
  KEY `idx_discipline_sport` (`sport_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `disciplines`
--

LOCK TABLES `disciplines` WRITE;
/*!40000 ALTER TABLE `disciplines` DISABLE KEYS */;
INSERT INTO `disciplines` VALUES (1,'100m Sprint','Olympic Stadium','Standard running rules',1),(2,'Long Jump','Olympic Stadium','Distance rules',1),(3,'Freestyle 100m','Aquatics Centre','Swimming rules',2),(4,'Vault','Gymnastics Hall','Judging rules',3),(5,'Boxing Lightweight','Boxing Arena','Boxing rules',4);
/*!40000 ALTER TABLE `disciplines` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medals`
--

DROP TABLE IF EXISTS `medals`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medals` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medal_type` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medals`
--

LOCK TABLES `medals` WRITE;
/*!40000 ALTER TABLE `medals` DISABLE KEYS */;
INSERT INTO `medals` VALUES (1,'Gold',500),(2,'Silver',400),(3,'Bronze',300);
/*!40000 ALTER TABLE `medals` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `olympic_games`
--

DROP TABLE IF EXISTS `olympic_games`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `olympic_games` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `host_city` varchar(100) NOT NULL,
  `host_country` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `year` (`year`),
  KEY `idx_olympic_year` (`year`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `olympic_games`
--

LOCK TABLES `olympic_games` WRITE;
/*!40000 ALTER TABLE `olympic_games` DISABLE KEYS */;
INSERT INTO `olympic_games` VALUES (1,2016,'Rio de Janeiro','Brazil'),(2,2020,'Tokyo','Japan'),(3,2024,'Paris','France');
/*!40000 ALTER TABLE `olympic_games` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `results`
--

DROP TABLE IF EXISTS `results`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `results` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `score` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `time` time NOT NULL,
  `competition_id` int(11) NOT NULL,
  `athlete_id` int(11) NOT NULL,
  `medal_id` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_result_competition` (`competition_id`),
  KEY `idx_result_athlete` (`athlete_id`),
  KEY `idx_result_medal` (`medal_id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `results`
--

LOCK TABLES `results` WRITE;
/*!40000 ALTER TABLE `results` DISABLE KEYS */;
INSERT INTO `results` VALUES (1,985,1,'00:00:00',1,1,1),(2,890,2,'00:10:02',1,5,2),(3,925,1,'00:52:00',3,2,1),(4,875,3,'00:53:20',3,4,3);
/*!40000 ALTER TABLE `results` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sports`
--

DROP TABLE IF EXISTS `sports`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sports` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sport_name` varchar(100) NOT NULL,
  `category` varchar(100) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sport_name` (`sport_name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sports`
--

LOCK TABLES `sports` WRITE;
/*!40000 ALTER TABLE `sports` DISABLE KEYS */;
INSERT INTO `sports` VALUES (1,'Athletics','Outdoor'),(2,'Swimming','Water'),(3,'Gymnastics','Indoor'),(4,'Boxing','Indoor'),(5,'Cycling','Outdoor');
/*!40000 ALTER TABLE `sports` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-11-03 10:59:41
