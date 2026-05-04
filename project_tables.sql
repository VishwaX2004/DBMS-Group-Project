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
-- Table structure for table `attendance`
--

DROP TABLE IF EXISTS `attendance`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `attendance` (
  `Attendance_ID` varchar(10) NOT NULL,
  `Reg_No` varchar(10) NOT NULL,
  `TO_ID` varchar(10) NOT NULL,
  `Attendance_Status` enum('Present','Absent','Medical') DEFAULT 'Absent',
  `Hours` int(11) DEFAULT '0',
  `Eligibility` varchar(20) DEFAULT NULL,
  `Session_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Attendance_ID`),
  KEY `FK_Attendance_Student` (`Reg_No`),
  KEY `FK_Attendance_TO` (`TO_ID`),
  CONSTRAINT `FK_Attendance_Student` FOREIGN KEY (`Reg_No`) REFERENCES `student` (`Reg_No`),
  CONSTRAINT `FK_Attendance_TO` FOREIGN KEY (`TO_ID`) REFERENCES `technical_officer` (`TO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
UNLOCK TABLES;

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

--
-- Table structure for table `student`
--

DROP TABLE IF EXISTS `student`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student` (
  `Reg_No` varchar(10) NOT NULL,
  `User_ID` varchar(10) NOT NULL,
  `Dept_ID` varchar(10) NOT NULL,
  `Full_Name` varchar(255) NOT NULL,
  `SGPA` decimal(3,2) DEFAULT '0.00',
  `CGPA` decimal(3,2) DEFAULT '0.00',
  `Email` varchar(100) DEFAULT NULL,
  `Contact_no` varchar(15) DEFAULT NULL,
  `Status` enum('Proper','Repeat','Suspended') DEFAULT 'Proper',
  PRIMARY KEY (`Reg_No`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `technical_officer`
--

DROP TABLE IF EXISTS `technical_officer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `technical_officer` (
  `TO_ID` varchar(10) NOT NULL,
  `User_ID` varchar(10) NOT NULL,
  `Dept_ID` varchar(10) NOT NULL,
  `Full_Name` varchar(255) NOT NULL,
  `Joined_Date` date DEFAULT NULL,
  `Contact_no` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TO_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technical_officer`
--

LOCK TABLES `technical_officer` WRITE;
/*!40000 ALTER TABLE `technical_officer` DISABLE KEYS */;
/*!40000 ALTER TABLE `technical_officer` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-04 12:16:55
