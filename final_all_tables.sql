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
-- Table structure for table `academic_summery`
--

DROP TABLE IF EXISTS `academic_summery`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `academic_summery` (
  `Summery_ID` varchar(10) NOT NULL,
  `CGPA_Value` decimal(4,2) DEFAULT NULL,
  `Academic_Level` int(11) DEFAULT NULL,
  `Last_Update_Date` date DEFAULT NULL,
  `Class_Standings` varchar(50) DEFAULT NULL,
  `Total_Credit_Earned` int(11) DEFAULT NULL,
  `Reg_No` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Summery_ID`),
  KEY `Reg_No` (`Reg_No`),
  CONSTRAINT `academic_summery_ibfk_1` FOREIGN KEY (`Reg_No`) REFERENCES `student` (`Reg_No`),
  CONSTRAINT `academic_summery_ibfk_2` FOREIGN KEY (`Reg_No`) REFERENCES `student` (`Reg_No`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `academic_summery`
--

LOCK TABLES `academic_summery` WRITE;
/*!40000 ALTER TABLE `academic_summery` DISABLE KEYS */;
/*!40000 ALTER TABLE `academic_summery` ENABLE KEYS */;
UNLOCK TABLES;

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
  KEY `User_ID` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `admin`
--

LOCK TABLES `admin` WRITE;
/*!40000 ALTER TABLE `admin` DISABLE KEYS */;
/*!40000 ALTER TABLE `admin` ENABLE KEYS */;
UNLOCK TABLES;

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
  `Hours` int(11) DEFAULT 0,
  `Eligibility` varchar(20) DEFAULT NULL,
  `Session_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Attendance_ID`),
  KEY `FK_Attendance_Student` (`Reg_No`),
  KEY `TO_ID` (`TO_ID`),
  KEY `Session_ID` (`Session_ID`),
  CONSTRAINT `attendance_ibfk_1` FOREIGN KEY (`Reg_No`) REFERENCES `student` (`Reg_No`),
  CONSTRAINT `attendance_ibfk_2` FOREIGN KEY (`TO_ID`) REFERENCES `technical_officer` (`TO_ID`),
  CONSTRAINT `attendance_ibfk_3` FOREIGN KEY (`Session_ID`) REFERENCES `session` (`Session_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `attendance`
--

LOCK TABLES `attendance` WRITE;
/*!40000 ALTER TABLE `attendance` DISABLE KEYS */;
/*!40000 ALTER TABLE `attendance` ENABLE KEYS */;
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
  `Dept_ID` varchar(10) DEFAULT NULL,
  PRIMARY KEY (`Course_Code`),
  KEY `fk_course_unit_lecturer` (`Lecture_ID`),
  KEY `Dept_ID` (`Dept_ID`),
  CONSTRAINT `course_unit_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`),
  CONSTRAINT `fk_course_unit_lecturer` FOREIGN KEY (`Lecture_ID`) REFERENCES `lecturer` (`Lecture_ID`)
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
-- Table structure for table `dean`
--

DROP TABLE IF EXISTS `dean`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dean` (
  `Dean_ID` varchar(10) NOT NULL,
  `User_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `Full_Name` varchar(100) NOT NULL,
  `DOB` date DEFAULT NULL,
  `Appointed_Date` date DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Contact_No` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Dean_ID`),
  UNIQUE KEY `Email` (`Email`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `dean_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dean`
--

LOCK TABLES `dean` WRITE;
/*!40000 ALTER TABLE `dean` DISABLE KEYS */;
/*!40000 ALTER TABLE `dean` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `Dept_ID` varchar(10) NOT NULL,
  `Dept_Name` varchar(100) DEFAULT NULL,
  `HOD` varchar(100) DEFAULT NULL,
  `Location` varchar(100) DEFAULT NULL,
  `Official_Email` varchar(100) DEFAULT NULL,
  `Contact_No` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`Dept_ID`),
  UNIQUE KEY `Official_Email` (`Official_Email`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
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
  `User_ID` varchar(10) NOT NULL,
  `Dept_ID` varchar(10) NOT NULL,
  PRIMARY KEY (`Lecture_ID`),
  UNIQUE KEY `Email` (`Email`),
  UNIQUE KEY `Email_2` (`Email`),
  KEY `fk_lecturer_user` (`User_ID`),
  KEY `Dept_ID` (`Dept_ID`),
  CONSTRAINT `fk_lecturer_user` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `lecturer_ibfk_1` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`)
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
-- Table structure for table `marks`
--

DROP TABLE IF EXISTS `marks`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `marks` (
  `Mark_ID` varchar(10) NOT NULL DEFAULT '',
  `Reg_No` varchar(10) DEFAULT NULL,
  `Course_Code` varchar(10) NOT NULL,
  `Quiz1_Marks` decimal(5,2) DEFAULT 0.00,
  `Quiz2_Marks` decimal(5,2) DEFAULT 0.00,
  `Quiz3_Marks` decimal(5,2) DEFAULT 0.00,
  `Quiz` decimal(5,2) DEFAULT 0.00,
  `Assignment_1` decimal(5,2) DEFAULT 0.00,
  `Assignment_2` decimal(5,2) DEFAULT 0.00,
  `Assignment` decimal(5,2) DEFAULT 0.00,
  `Total_CA_Marks` decimal(5,2) DEFAULT 0.00,
  `Mid_Exam_Marks` decimal(5,2) DEFAULT 0.00,
  `End_Exam_Marks` decimal(5,2) DEFAULT 0.00,
  `Final_Marks` decimal(5,2) DEFAULT 0.00,
  `Result_Status` varchar(10) DEFAULT 'Normal',
  PRIMARY KEY (`Mark_ID`),
  KEY `FK_Marks_Students` (`Reg_No`),
  KEY `Course_Code` (`Course_Code`),
  CONSTRAINT `FK_Marks_Students` FOREIGN KEY (`Reg_No`) REFERENCES `student` (`Reg_No`),
  CONSTRAINT `marks_ibfk_1` FOREIGN KEY (`Reg_No`) REFERENCES `student` (`Reg_No`),
  CONSTRAINT `marks_ibfk_2` FOREIGN KEY (`Course_Code`) REFERENCES `course_unit` (`Course_Code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `marks`
--

LOCK TABLES `marks` WRITE;
/*!40000 ALTER TABLE `marks` DISABLE KEYS */;
/*!40000 ALTER TABLE `marks` ENABLE KEYS */;
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
  PRIMARY KEY (`Medical_ID`),
  KEY `Reg_NO` (`Reg_NO`),
  CONSTRAINT `medical_ibfk_1` FOREIGN KEY (`Reg_NO`) REFERENCES `student` (`Reg_No`)
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
  `Reg_No` varchar(10) NOT NULL,
  `Summery_ID` varchar(10) NOT NULL,
  `Semester_No` tinyint(4) DEFAULT NULL,
  `Academic_Year` varchar(10) DEFAULT NULL,
  `Semester_Status` varchar(20) DEFAULT NULL,
  `Semester_GPA_Value` decimal(3,2) DEFAULT NULL,
  `Total_Semester_Credit` decimal(5,2) DEFAULT NULL,
  PRIMARY KEY (`SGPA_ID`),
  KEY `Reg_No` (`Reg_No`),
  KEY `Summery_ID` (`Summery_ID`),
  CONSTRAINT `semester_gpa_ibfk_1` FOREIGN KEY (`Reg_No`) REFERENCES `student` (`Reg_No`),
  CONSTRAINT `semester_gpa_ibfk_2` FOREIGN KEY (`Summery_ID`) REFERENCES `academic_summery` (`Summery_ID`)
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
  `SGPA` decimal(3,2) DEFAULT 0.00,
  `CGPA` decimal(3,2) DEFAULT 0.00,
  `Email` varchar(100) DEFAULT NULL,
  `Contact_no` varchar(15) DEFAULT NULL,
  `Status` enum('Proper','Repeat','Suspended') DEFAULT 'Proper',
  PRIMARY KEY (`Reg_No`),
  UNIQUE KEY `Email` (`Email`),
  KEY `fk_student_dept` (`Dept_ID`),
  KEY `User_ID` (`User_ID`),
  CONSTRAINT `fk_student_dept` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`),
  CONSTRAINT `student_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student`
--

LOCK TABLES `student` WRITE;
/*!40000 ALTER TABLE `student` DISABLE KEYS */;
INSERT INTO `student` VALUES ('TG2077','U001','D01','Vishwa Pramuditha',0.00,0.00,'vishwa@example.com','0771234567','Proper');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `student_course_grade`
--

DROP TABLE IF EXISTS `student_course_grade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `student_course_grade` (
  `Grade_ID` varchar(10) NOT NULL,
  `Reg_No` varchar(10) NOT NULL,
  `Mark_ID` varchar(10) NOT NULL,
  `Course_code` varchar(10) NOT NULL,
  `SGPA_ID` varchar(10) NOT NULL,
  `Semester_No` int(11) DEFAULT NULL,
  `Academic_Year` int(11) DEFAULT NULL,
  `Attempt` int(11) DEFAULT NULL,
  `Grade_Point` decimal(3,2) DEFAULT NULL,
  `Obtained_Grade` varchar(5) DEFAULT NULL,
  PRIMARY KEY (`Grade_ID`),
  KEY `SGPA_ID` (`SGPA_ID`),
  KEY `Course_code` (`Course_code`),
  KEY `Reg_No` (`Reg_No`),
  KEY `Mark_ID` (`Mark_ID`),
  CONSTRAINT `student_course_grade_ibfk_1` FOREIGN KEY (`SGPA_ID`) REFERENCES `semester_gpa` (`SGPA_ID`),
  CONSTRAINT `student_course_grade_ibfk_2` FOREIGN KEY (`Course_code`) REFERENCES `course_unit` (`Course_Code`),
  CONSTRAINT `student_course_grade_ibfk_3` FOREIGN KEY (`Reg_No`) REFERENCES `student` (`Reg_No`),
  CONSTRAINT `student_course_grade_ibfk_4` FOREIGN KEY (`Mark_ID`) REFERENCES `marks` (`Mark_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `student_course_grade`
--

LOCK TABLES `student_course_grade` WRITE;
/*!40000 ALTER TABLE `student_course_grade` DISABLE KEYS */;
/*!40000 ALTER TABLE `student_course_grade` ENABLE KEYS */;
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
  PRIMARY KEY (`TO_ID`),
  KEY `User_ID` (`User_ID`),
  KEY `Dept_ID` (`Dept_ID`),
  CONSTRAINT `technical_officer_ibfk_1` FOREIGN KEY (`User_ID`) REFERENCES `user` (`User_ID`),
  CONSTRAINT `technical_officer_ibfk_2` FOREIGN KEY (`Dept_ID`) REFERENCES `department` (`Dept_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `technical_officer`
--

LOCK TABLES `technical_officer` WRITE;
/*!40000 ALTER TABLE `technical_officer` DISABLE KEYS */;
/*!40000 ALTER TABLE `technical_officer` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `user`
--

DROP TABLE IF EXISTS `user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user` (
  `User_ID` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `User_Name` varchar(50) NOT NULL,
  `Password` varchar(50) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Contact_no` varchar(15) DEFAULT NULL,
  PRIMARY KEY (`User_ID`),
  UNIQUE KEY `Email` (`Email`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `user`
--

LOCK TABLES `user` WRITE;
/*!40000 ALTER TABLE `user` DISABLE KEYS */;
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

-- Dump completed on 2026-05-04 20:38:48
