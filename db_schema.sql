-- MySQL dump 10.16  Distrib 10.1.22-MariaDB, for Linux (x86_64)
--
-- Host: 5.51.180.42    Database: veggicity
-- ------------------------------------------------------
-- Server version	10.0.30-MariaDB-0+deb8u1

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
-- Table structure for table `Espece`
--

DROP TABLE IF EXISTS `Espece`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Espece` (
  `IdEspece` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) DEFAULT NULL,
  `TempsPousse` time DEFAULT NULL,
  `BesoinEau` float DEFAULT NULL,
  `BesoinHumidite` float DEFAULT NULL,
  PRIMARY KEY (`IdEspece`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Espece`
--

LOCK TABLES `Espece` WRITE;
/*!40000 ALTER TABLE `Espece` DISABLE KEYS */;
/*!40000 ALTER TABLE `Espece` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Jardin`
--

DROP TABLE IF EXISTS `Jardin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Jardin` (
  `IdJardin` bigint(20) NOT NULL AUTO_INCREMENT,
  `Nom` varchar(100) DEFAULT NULL,
  `Latitude` decimal(10,0) DEFAULT NULL,
  `Longitude` decimal(10,0) DEFAULT NULL,
  PRIMARY KEY (`IdJardin`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Jardin`
--

LOCK TABLES `Jardin` WRITE;
/*!40000 ALTER TABLE `Jardin` DISABLE KEYS */;
/*!40000 ALTER TABLE `Jardin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Mesure`
--

DROP TABLE IF EXISTS `Mesure`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Mesure` (
  `IdMesure` bigint(20) NOT NULL AUTO_INCREMENT,
  `Temperature` float DEFAULT NULL,
  `Humidite` float DEFAULT NULL,
  `IdPlantation` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`IdMesure`),
  KEY `Mesure_Plantation_FK` (`IdPlantation`),
  CONSTRAINT `Mesure_Plantation_FK` FOREIGN KEY (`IdPlantation`) REFERENCES `Plantation` (`IdPlantation`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Mesure`
--

LOCK TABLES `Mesure` WRITE;
/*!40000 ALTER TABLE `Mesure` DISABLE KEYS */;
/*!40000 ALTER TABLE `Mesure` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `Plantation`
--

DROP TABLE IF EXISTS `Plantation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `Plantation` (
  `Nom` varchar(100) DEFAULT NULL,
  `PhotoPlantation` varchar(250) DEFAULT NULL,
  `DatePlantation` date DEFAULT NULL,
  `IdPlantation` bigint(20) NOT NULL AUTO_INCREMENT,
  `IdJardin` bigint(20) DEFAULT NULL,
  `IdEspece` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`IdPlantation`),
  KEY `Plantation_Jardin_FK` (`IdJardin`),
  KEY `Plantation_Espece_FK` (`IdEspece`),
  CONSTRAINT `Plantation_Espece_FK` FOREIGN KEY (`IdEspece`) REFERENCES `Espece` (`IdEspece`),
  CONSTRAINT `Plantation_Jardin_FK` FOREIGN KEY (`IdJardin`) REFERENCES `Jardin` (`IdJardin`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `Plantation`
--

LOCK TABLES `Plantation` WRITE;
/*!40000 ALTER TABLE `Plantation` DISABLE KEYS */;
/*!40000 ALTER TABLE `Plantation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'veggicity'
--
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2017-04-13 20:09:12
