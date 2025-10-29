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
-- Table structure for table `athlete`
--

DROP TABLE IF EXISTS `athlete`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `athlete` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `gender` varchar(10) NOT NULL,
  `age` int(11) NOT NULL,
  `country_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_country_id` (`country_id`),
  CONSTRAINT `athlete_ibfk_1` FOREIGN KEY (`country_id`) REFERENCES `country` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `athlete`
--

LOCK TABLES `athlete` WRITE;
/*!40000 ALTER TABLE `athlete` DISABLE KEYS */;
/*!40000 ALTER TABLE `athlete` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `competition`
--

DROP TABLE IF EXISTS `competition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `competition` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `competition_name` varchar(255) NOT NULL,
  `competition_date` date NOT NULL,
  `venue` varchar(255) NOT NULL,
  `discipline_id` int(11) NOT NULL,
  `olimpic_game_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_discipline_id` (`discipline_id`),
  KEY `idx_olimpic_game_id` (`olimpic_game_id`),
  CONSTRAINT `competition_ibfk_1` FOREIGN KEY (`discipline_id`) REFERENCES `discipline` (`id`),
  CONSTRAINT `competition_ibfk_2` FOREIGN KEY (`olimpic_game_id`) REFERENCES `olimpic_game` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `competition`
--

LOCK TABLES `competition` WRITE;
/*!40000 ALTER TABLE `competition` DISABLE KEYS */;
/*!40000 ALTER TABLE `competition` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `country`
--

DROP TABLE IF EXISTS `country`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `country` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `country_name` varchar(255) NOT NULL,
  `continent` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `country_name` (`country_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `country`
--

LOCK TABLES `country` WRITE;
/*!40000 ALTER TABLE `country` DISABLE KEYS */;
/*!40000 ALTER TABLE `country` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `discipline`
--

DROP TABLE IF EXISTS `discipline`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `discipline` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `discipline_name` varchar(255) NOT NULL,
  `rules` varchar(255) DEFAULT NULL,
  `sport_id` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `discipline_name` (`discipline_name`),
  KEY `idx_sport_id` (`sport_id`),
  CONSTRAINT `discipline_ibfk_1` FOREIGN KEY (`sport_id`) REFERENCES `sport` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `discipline`
--

LOCK TABLES `discipline` WRITE;
/*!40000 ALTER TABLE `discipline` DISABLE KEYS */;
/*!40000 ALTER TABLE `discipline` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medal`
--

DROP TABLE IF EXISTS `medal`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medal` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `medal_type` varchar(50) NOT NULL,
  `weight` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medal`
--

LOCK TABLES `medal` WRITE;
/*!40000 ALTER TABLE `medal` DISABLE KEYS */;
/*!40000 ALTER TABLE `medal` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `olimpic_game`
--

DROP TABLE IF EXISTS `olimpic_game`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `olimpic_game` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `year` int(11) NOT NULL,
  `host_city` varchar(255) NOT NULL,
  `host_country` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `year` (`year`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `olimpic_game`
--

LOCK TABLES `olimpic_game` WRITE;
/*!40000 ALTER TABLE `olimpic_game` DISABLE KEYS */;
/*!40000 ALTER TABLE `olimpic_game` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `result`
--

DROP TABLE IF EXISTS `result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `result` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `competition_id` int(11) NOT NULL,
  `athlete_id` int(11) NOT NULL,
  `medal_id` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  `position` int(11) NOT NULL,
  `time` time NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idx_competition_id` (`competition_id`),
  KEY `idx_athlete_id` (`athlete_id`),
  KEY `idx_medal_id` (`medal_id`),
  CONSTRAINT `result_ibfk_1` FOREIGN KEY (`competition_id`) REFERENCES `competition` (`id`),
  CONSTRAINT `result_ibfk_2` FOREIGN KEY (`athlete_id`) REFERENCES `athlete` (`id`),
  CONSTRAINT `result_ibfk_3` FOREIGN KEY (`medal_id`) REFERENCES `medal` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `result`
--

LOCK TABLES `result` WRITE;
/*!40000 ALTER TABLE `result` DISABLE KEYS */;
/*!40000 ALTER TABLE `result` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `sport`
--

DROP TABLE IF EXISTS `sport`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `sport` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `sport_name` varchar(255) NOT NULL,
  `category` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `sport_name` (`sport_name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `sport`
--

LOCK TABLES `sport` WRITE;
/*!40000 ALTER TABLE `sport` DISABLE KEYS */;
/*!40000 ALTER TABLE `sport` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2025-10-29 11:10:58
