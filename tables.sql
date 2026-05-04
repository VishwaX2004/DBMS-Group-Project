-- MySQL dump 10.13  Distrib 5.5.16, for Win64 (x86)
--
-- Host: localhost    Database: university_db
-- ------------------------------------------------------
-- Server version	5.5.16

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
-- Table structure for table `admin`
--

DROP TABLE IF EXISTS `admin`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `admin` (
  `Admin_ID` varchar(10) NOT NULL,
  `User_ID` varchar(10) NOT NULL,
  `First_Name` varchar(30) NOT NULL,
  `Last_Name` varchar(30) NOT NULL,
  `Contact_no` varchar(15) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Joined_Date` date DEFAULT NULL,
  PRIMARY KEY (`Admin_ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
INSERT INTO `admin` VALUES ('ADM01','A001','University','Admin','0112222333','admin@ruhuna.ac.lk','2024-01-01');
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dean`
--

DROP TABLE IF EXISTS `dean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dean` (
  `Dean_ID` varchar(10) NOT NULL,
  `User_ID` varchar(10) NOT NULL,
  `Full_Name` varchar(100) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Appointed_Date` date DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Contact_No` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Dean_ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `dean_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dean`
--

LOCK TABLES `dean` WRITE;
/*!40000 ALTER TABLE `dean` DISABLE KEYS */;
INSERT INTO `dean` VALUES ('DEN01','D001','Prof. Sunil Perera','1970-05-15','2020-01-10','dean@ruhuna.ac.lk','0114444555');
/*!40000 ALTER TABLE `dean` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `User_ID` varchar(10) NOT NULL,
  `User_Name` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contact_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` VALUES ('A001','admin','12345','admin@ruhuna.ac.lk','0112222333'),
('D001','dean','12345','dean@ruhuna.ac.lk','0114444555'),
('L001','lecturer','12345','lec1@mail.com','0770000101'),
('L002','lecturer','12345','lec2@mail.com','0770000102'),
('L003','lecturer','12345','lec3@mail.com','0770000103'),
('L004','lecturer','12345','lec4@mail.com','0770000104'),
('L005','lecturer','12345','lec5@mail.com','0770000105'),
('S001','student','12345','stu01@mail.com','0750000201'),
('S002','student','12345','stu02@mail.com','0750000202'),
('S003','student','12345','stu03@mail.com','0750000203'),
('S004','student','12345','stu04@mail.com','0750000204'),
('S005','student','12345','stu05@mail.com','0750000205'),
('S006','student','12345','stu06@mail.com','0750000206'),
('S007','student','12345','stu07@mail.com','0750000207'),
('S008','student','12345','stu08@mail.com','0750000208'),
('S009','student','12345','stu09@mail.com','0750000209'),
('S010','student','12345','stu10@mail.com','0750000210'),
('S011','student','12345','stu11@mail.com','0750000211'),
('S012','student','12345','stu12@mail.com','0750000212'),
('S013','student','12345','stu13@mail.com','0750000213'),
('S014','student','12345','stu14@mail.com','0750000214'),
('S015','student','12345','stu15@mail.com','0750000215'),
('T001','Technical_officer','12345','to1@mail.com','0710000001'),
('T002','Technical_officer','12345','to2@mail.com','0710000002'),
('T003','Technical_officer','12345','to3@mail.com','0710000003');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-04 19:47:57
