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
  CONSTRAINT `FK_Attendance_Student` FOREIGN KEY (`Reg_No`) REFERENCES `student` (`Reg_No`)
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
INSERT INTO `marks` VALUES ('M001','TG2077','ICT1222',85.00,90.00,70.00,87.50,80.00,95.00,95.00,24.13,75.00,82.00,81.53,'Normal');
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
INSERT INTO `student` VALUES ('TG2077','U001','D01','Vishwa Pramuditha',0.00,0.00,'vishwa@example.com','0771234567','Proper');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Dumping routines for database 'university_db'
--
/*!50003 DROP PROCEDURE IF EXISTS `AddAndCalculateMarks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `AddAndCalculateMarks`(
    IN in_id VARCHAR(10),
    IN in_reg VARCHAR(10),
    IN in_course VARCHAR(10),
    IN q1 DECIMAL(5,2),
    IN q2 DECIMAL(5,2),
    IN q3 DECIMAL(5,2),
    IN a1 DECIMAL(5,2),
    IN a2 DECIMAL(5,2),
    IN mid DECIMAL(5,2),
    IN end_exam DECIMAL(5,2)
)
BEGIN
    INSERT INTO Marks (Mark_ID, Reg_No, Course_Code, Quiz1_Marks, Quiz2_Marks, Quiz3_Marks, Assignment_1, Assignment_2, Mid_Exam_Marks, End_Exam_Marks)
    VALUES (in_id, in_reg, in_course, q1, q2, q3, a1, a2, mid, end_exam);

    CALL UpdateFinalMarks(in_reg, in_course);
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `UpdateFinalMarks` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `UpdateFinalMarks`(
    IN input_student_reg VARCHAR(10),
    IN input_course_code VARCHAR(10)
)
BEGIN
    DECLARE raw_quiz_avg DECIMAL(5,2);
    DECLARE raw_best_assignment DECIMAL(5,2);
    DECLARE weighted_quiz DECIMAL(5,2);
    DECLARE weighted_assignment DECIMAL(5,2);
    DECLARE weighted_mid DECIMAL(5,2);
    DECLARE weighted_end DECIMAL(5,2);
    DECLARE total_ca DECIMAL(5,2);
    DECLARE final_mark DECIMAL(5,2);
    DECLARE student_status VARCHAR(20);

    SELECT Status INTO student_status FROM Student WHERE Reg_No = input_student_reg;

    SELECT 
        ((Quiz1_Marks + Quiz2_Marks + Quiz3_Marks - LEAST(Quiz1_Marks, Quiz2_Marks, Quiz3_Marks)) / 2),
        GREATEST(Assignment_1, Assignment_2),
        (Mid_Exam_Marks * 0.20),
        (End_Exam_Marks * 0.70)
    INTO raw_quiz_avg, raw_best_assignment, weighted_mid, weighted_end
    FROM Marks
    WHERE Reg_No = input_student_reg AND Course_Code = input_course_code;

    SET weighted_quiz = (raw_quiz_avg * 0.05);
    SET weighted_assignment = (raw_best_assignment * 0.05);

    SET total_ca = weighted_quiz + weighted_assignment + weighted_mid;

    SET final_mark = total_ca + weighted_end;

    IF student_status = 'Repeat' AND final_mark > 55 THEN
        SET final_mark = 55;
    END IF;

    UPDATE Marks 
    SET 
        Quiz = raw_quiz_avg,
        Assignment = raw_best_assignment,
        Total_CA_Marks = total_ca,
        Final_Marks = final_mark,
        Result_Status = CASE 
                            WHEN student_status = 'Suspended' THEN 'WH'
                            WHEN Result_Status = 'MC' THEN 'MC'
                            ELSE 'Normal'
                        END
    WHERE Reg_No = input_student_reg AND Course_Code = input_course_code;

END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2026-05-04 18:32:49
