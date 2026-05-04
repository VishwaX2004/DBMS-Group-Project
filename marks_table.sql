-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: university_db
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marks` (
  `Mark_ID` varchar(10) NOT NULL DEFAULT '',
  `Reg_No` varchar(10) DEFAULT NULL,
  `Course_Code` varchar(10) DEFAULT NULL,
  `Quiz1_Marks` decimal(5,2) DEFAULT '0.00',
  `Quiz2_Marks` decimal(5,2) DEFAULT '0.00',
  `Quiz3_Marks` decimal(5,2) DEFAULT '0.00',
  `Quiz` decimal(5,2) DEFAULT '0.00',
  `Assignment_1` decimal(5,2) DEFAULT '0.00',
  `Assignment_2` decimal(5,2) DEFAULT '0.00',
  `Assignment` decimal(5,2) DEFAULT '0.00',
  `Total_CA_Marks` decimal(5,2) DEFAULT '0.00',
  `Mid_Exam_Marks` decimal(5,2) DEFAULT '0.00',
  `End_Exam_Marks` decimal(5,2) DEFAULT '0.00',
  `Final_Marks` decimal(5,2) DEFAULT '0.00',
  `Result_Status` varchar(10) DEFAULT 'Normal',
  PRIMARY KEY (`Mark_ID`),
  KEY `FK_Marks_Students` (`Reg_No`),
  CONSTRAINT `FK_Marks_Students` FOREIGN KEY (`Reg_No`) REFERENCES `student` (`Reg_No`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
UNLOCK TABLES;