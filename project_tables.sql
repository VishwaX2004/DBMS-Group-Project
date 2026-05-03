-- MariaDB dump 10.19  Distrib 10.4.32-MariaDB, for Win64 (AMD64)
--
-- Host: localhost    Database: university_db
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
-- Table structure for table `academic_summary`
--

DROP TABLE IF EXISTS `academic_summary`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_summary` (
  `Summary_ID` int(11) NOT NULL AUTO_INCREMENT,
  `CGPA_Value` decimal(4,2) DEFAULT NULL,
  `Academic_Level` int(11) DEFAULT NULL,
  `Last_Update_Date` date DEFAULT NULL,
  `Class_Standings` varchar(50) DEFAULT NULL,
  `Total_Credit_Earned` int(11) DEFAULT NULL,
  PRIMARY KEY (`Summary_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_summary`
--

LOCK TABLES `academic_summary` WRITE;
/*!40000 ALTER TABLE `academic_summary` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_summary` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `course_unit`
--

DROP TABLE IF EXISTS `course_unit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `course_unit` (
  `Course_Code` varchar(10) NOT NULL,
  `Course_Name` varchar(100) DEFAULT NULL,
  `Semester_No` int(11) DEFAULT NULL,
  `Course_Type` varchar(20) DEFAULT NULL,
  `Level` int(11) DEFAULT NULL,
  `Lecture_ID` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Course_Code`),
  KEY `Lecture_ID` (`Lecture_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `course_unit`
--

LOCK TABLES `course_unit` WRITE;
/*!40000 ALTER TABLE `course_unit` DISABLE KEYS */;
/*!40000 ALTER TABLE `course_unit` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `lecturer`
--

DROP TABLE IF EXISTS `lecturer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lecturer` (
  `Lecture_ID` varchar(50) NOT NULL,
  `Full_Name` varchar(100) DEFAULT NULL,
  `Specialization_Area` varchar(100) DEFAULT NULL,
  `Contact_No` varchar(15) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  `Designation` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Lecture_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `lecturer`
--

LOCK TABLES `lecturer` WRITE;
/*!40000 ALTER TABLE `lecturer` DISABLE KEYS */;
/*!40000 ALTER TABLE `lecturer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `medical`
--

DROP TABLE IF EXISTS `medical`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `medical` (
  `Medical_ID` varchar(10) NOT NULL,
  `Reg_NO` varchar(20) NOT NULL,
  `Duration` varchar(20) DEFAULT NULL,
  `Issue_Date` date DEFAULT NULL,
  `Medical_Type` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Medical_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `medical`
--

LOCK TABLES `medical` WRITE;
/*!40000 ALTER TABLE `medical` DISABLE KEYS */;
/*!40000 ALTER TABLE `medical` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `semester_gpa`
--

DROP TABLE IF EXISTS `semester_gpa`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `semester_gpa` (
  `SGPA_ID` varchar(10) NOT NULL,
  `Reg_No` varchar(20) NOT NULL,
  `Summery_ID` varchar(10) NOT NULL,
  `Semester_No` tinyint(4) DEFAULT NULL,
  `Academic_Year` varchar(10) DEFAULT NULL,
  `Semester_Status` varchar(20) DEFAULT NULL,
  `Semester_GPA_Value` decimal(3,2) DEFAULT NULL,
  `Total_Semester_Credit` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`SGPA_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `semester_gpa`
--

LOCK TABLES `semester_gpa` WRITE;
/*!40000 ALTER TABLE `semester_gpa` DISABLE KEYS */;
/*!40000 ALTER TABLE `semester_gpa` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `session`
--

DROP TABLE IF EXISTS `session`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `session` (
  `Session_ID` varchar(10) NOT NULL,
  `Course_Code` varchar(10) DEFAULT NULL,
  `Lecture_ID` varchar(50) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Date_of_Session` date DEFAULT NULL,
  `Time_Slot` varchar(50) DEFAULT NULL,
  `Session_Time` varchar(50) DEFAULT NULL,
  PRIMARY KEY (`Session_ID`),
  KEY `Course_Code` (`Course_Code`),
  KEY `Lecture_ID` (`Lecture_ID`),
  CONSTRAINT `session_ibfk_1` FOREIGN KEY (`Course_Code`) REFERENCES `course_unit` (`Course_Code`),
  CONSTRAINT `session_ibfk_2` FOREIGN KEY (`Lecture_ID`) REFERENCES `lecturer` (`Lecture_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `session`
--

LOCK TABLES `session` WRITE;
/*!40000 ALTER TABLE `session` DISABLE KEYS */;
/*!40000 ALTER TABLE `session` ENABLE KEYS */;
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
  `Contact_no` varchar(10) DEFAULT NULL,
  `Email` varchar(100) DEFAULT NULL,
  PRIMARY KEY (`TO_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
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

-- Dump completed on 2026-05-03 23:47:35
