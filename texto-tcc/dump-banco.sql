CREATE DATABASE  IF NOT EXISTS `dwing3` /*!40100 DEFAULT CHARACTER SET utf8 */;
USE `dwing3`;
-- MySQL dump 10.13  Distrib 5.6.13, for Win32 (x86)
--
-- Host: 127.0.0.1    Database: dwing3
-- ------------------------------------------------------
-- Server version	5.6.11

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
-- Table structure for table `language`
--

DROP TABLE IF EXISTS `language`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `language` (
  `idLanguage` int(11) NOT NULL AUTO_INCREMENT,
  `language name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idLanguage`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `language`
--

LOCK TABLES `language` WRITE;
/*!40000 ALTER TABLE `language` DISABLE KEYS */;
INSERT INTO `language` VALUES (1,'java'),(2,'c++');
/*!40000 ALTER TABLE `language` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metric`
--

DROP TABLE IF EXISTS `metric`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metric` (
  `idMetric` int(11) NOT NULL AUTO_INCREMENT,
  `metric name` varchar(45) DEFAULT NULL,
  `description` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idMetric`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metric`
--

LOCK TABLES `metric` WRITE;
/*!40000 ALTER TABLE `metric` DISABLE KEYS */;
INSERT INTO `metric` VALUES (1,'LOC','Lines of Code'),(2,'ACCM','Average Ciclomatic Complexity Method'),(3,'ACC','Afferent Conections per Class'),(4,'RFC','Reponse for Class'),(5,'LCOM4','Lack of Cohesion of Method'),(6,'NOM','Number of Methods'),(7,'DIT','Depth on Tree'),(8,'NOC','Number of Childs');
/*!40000 ALTER TABLE `metric` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `metric_fact`
--

DROP TABLE IF EXISTS `metric_fact`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `metric_fact` (
  `idMetricFact` int(11) NOT NULL AUTO_INCREMENT,
  `value_day` float DEFAULT NULL,
  `value_month` float DEFAULT NULL,
  `value_year` float DEFAULT NULL,
  `Time_idTime` int(11) NOT NULL,
  `Project_idproject` int(11) NOT NULL,
  `Range_idInterval` int(11) NOT NULL,
  `Range_Metric_idMetric` int(11) NOT NULL,
  `Range_Language_idLanguage` int(11) NOT NULL,
  PRIMARY KEY (`idMetricFact`),
  KEY `fk_Metric_Fact_Project1_idx` (`Project_idproject`),
  KEY `fk_Metric_Fact_Range1_idx` (`Range_idInterval`,`Range_Metric_idMetric`,`Range_Language_idLanguage`),
  KEY `fk_Metric_Fact_Time1` (`Time_idTime`),
  CONSTRAINT `fk_Metric_Fact_Time1` FOREIGN KEY (`Time_idTime`) REFERENCES `time` (`idTime`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Metric_Fact_Project1` FOREIGN KEY (`Project_idproject`) REFERENCES `project` (`idproject`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Metric_Fact_Range1` FOREIGN KEY (`Range_idInterval`, `Range_Metric_idMetric`, `Range_Language_idLanguage`) REFERENCES `range` (`idInterval`, `Metric_idMetric`, `Language_idLanguage`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=41 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `metric_fact`
--

LOCK TABLES `metric_fact` WRITE;
/*!40000 ALTER TABLE `metric_fact` DISABLE KEYS */;
INSERT INTO `metric_fact` VALUES (1,40,NULL,NULL,1,99176,2,1,1),(2,2.7,NULL,NULL,1,99176,9,2,1),(3,3,NULL,NULL,1,99176,18,3,1),(4,23,NULL,NULL,1,99176,26,4,1),(5,1,NULL,NULL,1,99176,33,5,1),(6,8,NULL,NULL,1,99176,41,6,1),(7,2,NULL,NULL,1,99176,49,7,1),(8,1,NULL,NULL,1,99176,57,8,1),(9,40,NULL,NULL,2,99176,2,1,1),(10,2,NULL,NULL,2,99176,9,2,1),(11,3,NULL,NULL,2,99176,18,3,1),(12,23,NULL,NULL,2,99176,26,4,1),(13,1,NULL,NULL,2,99176,33,5,1),(14,8,NULL,NULL,2,99176,41,6,1),(15,2,NULL,NULL,2,99176,49,7,1),(16,1,NULL,NULL,2,99176,57,8,1),(17,40,NULL,NULL,3,99176,2,1,1),(18,2,NULL,NULL,3,99176,9,2,1),(19,3,NULL,NULL,3,99176,18,3,1),(20,23,NULL,NULL,3,99176,26,4,1),(21,1,NULL,NULL,3,99176,33,5,1),(22,8,NULL,NULL,3,99176,41,6,1),(23,2,NULL,NULL,3,99176,49,7,1),(24,1,NULL,NULL,3,99176,57,8,1),(25,40,NULL,NULL,4,99176,2,1,1),(26,2,NULL,NULL,4,99176,9,2,1),(27,3,NULL,NULL,4,99176,18,3,1),(28,23,NULL,NULL,4,99176,26,4,1),(29,1,NULL,NULL,4,99176,33,5,1),(30,8,NULL,NULL,4,99176,41,6,1),(31,2,NULL,NULL,4,99176,49,7,1),(32,1,NULL,NULL,4,99176,57,8,1),(33,40,NULL,NULL,5,99176,2,1,1),(34,2,NULL,NULL,5,99176,9,2,1),(35,3,NULL,NULL,5,99176,18,3,1),(36,23,NULL,NULL,5,99176,26,4,1),(37,1,NULL,NULL,5,99176,33,5,1),(38,8,NULL,NULL,5,99176,41,6,1),(39,2,NULL,NULL,5,99176,49,7,1),(40,1,NULL,NULL,5,99176,57,8,1);
/*!40000 ALTER TABLE `metric_fact` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `idproject` int(11) NOT NULL,
  `project name` varchar(45) DEFAULT NULL,
  PRIMARY KEY (`idproject`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES (99176,'Apache Maven');
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `range`
--

DROP TABLE IF EXISTS `range`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `range` (
  `idInterval` int(11) NOT NULL AUTO_INCREMENT,
  `min` float DEFAULT NULL,
  `max` float DEFAULT NULL,
  `quality_index` varchar(45) DEFAULT NULL,
  `Metric_idMetric` int(11) NOT NULL,
  `Language_idLanguage` int(11) NOT NULL,
  PRIMARY KEY (`idInterval`,`Metric_idMetric`,`Language_idLanguage`),
  KEY `fk_Range_Metric1_idx` (`Metric_idMetric`),
  KEY `fk_Range_Language1_idx` (`Language_idLanguage`),
  CONSTRAINT `fk_Range_Metric1` FOREIGN KEY (`Metric_idMetric`) REFERENCES `metric` (`idMetric`) ON DELETE NO ACTION ON UPDATE NO ACTION,
  CONSTRAINT `fk_Range_Language1` FOREIGN KEY (`Language_idLanguage`) REFERENCES `language` (`idLanguage`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=65 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `range`
--

LOCK TABLES `range` WRITE;
/*!40000 ALTER TABLE `range` DISABLE KEYS */;
INSERT INTO `range` VALUES (1,0,33,'Excelente',1,1),(2,34,87,'Bom',1,1),(3,88,200,'Regular',1,1),(4,201,9999,'Ruim',1,1),(5,0,31,'Excelente',1,2),(6,32,84,'Bom',1,2),(7,85,207,'Regular',1,2),(8,208,9999,'Ruim',1,2),(9,0,2.8,'Excelente',2,1),(10,2.9,4.4,'Bom',2,1),(11,4.5,6,'Regular',2,1),(12,6.1,9999,'Ruim',2,1),(13,0,2,'Excelente',2,2),(14,2.1,4,'Bom',2,2),(15,4.1,6,'Regular',2,2),(16,6.1,9999,'Ruim',2,2),(17,0,1,'Excelente',3,1),(18,1.1,5,'Bom',3,1),(19,5.1,12,'Regular',3,1),(20,12.1,9999,'Ruim',3,1),(21,0,2,'Excelente',3,2),(22,2.1,7,'Bom',3,2),(23,7.1,15,'Regular',3,2),(24,15.1,9999,'Ruim',3,2),(25,0,9,'Excelente',4,1),(26,10,26,'Bom',4,1),(27,27,59,'Regular',4,1),(28,60,9999,'Ruim',4,1),(29,0,29,'Excelente',4,2),(30,30,64,'Bom',4,2),(31,65,102,'Regular',4,2),(32,103,9999,'Ruim',4,2),(33,0,3,'Excelente',5,1),(34,4,7,'Bom',5,1),(35,8,12,'Regular',5,1),(36,13,9999,'Ruim',5,1),(37,0,5,'Excelente',5,2),(38,6,10,'Bom',5,2),(39,11,14,'Regular',5,2),(40,15,99999,'Ruim',5,2),(41,0,8,'Excelente',6,1),(42,9,17,'Bom',6,1),(43,18,27,'Regular',6,1),(44,28,9999,'Ruim',6,1),(45,0,10,'Excelente',6,2),(46,11,17,'Bom',6,2),(47,18,26,'Regular',6,2),(48,27,9999,'Ruim',6,2),(49,0,2,'Excelente',7,1),(50,3,4,'Bom',7,1),(51,5,6,'Regular',7,1),(52,7,9999,'Ruim',7,1),(53,0,1,'Excelente',7,2),(54,2,3,'Bom',7,2),(55,3,4,'Regular',7,2),(56,5,9999,'Ruim',7,2),(57,0,1,'Excelente',8,1),(58,1.1,2,'Bom',8,1),(59,3,3,'Regular',8,1),(60,4,9999,'Ruim',8,1),(61,0,0,'Excelente',8,2),(62,1,1,'Bom',8,2),(63,1,2,'Regular',8,2),(64,3,9999,'Ruim',8,2);
/*!40000 ALTER TABLE `range` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `time`
--

DROP TABLE IF EXISTS `time`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `time` (
  `idTime` int(11) NOT NULL AUTO_INCREMENT,
  `Day` int(11) DEFAULT NULL,
  `Month` int(11) DEFAULT NULL,
  `Year` int(11) DEFAULT NULL,
  PRIMARY KEY (`idTime`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `time`
--

LOCK TABLES `time` WRITE;
/*!40000 ALTER TABLE `time` DISABLE KEYS */;
INSERT INTO `time` VALUES (1,7,9,2013),(2,13,10,2013),(3,20,10,2013),(4,27,10,2013),(5,3,11,2013);
/*!40000 ALTER TABLE `time` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-11-04  1:04:19
