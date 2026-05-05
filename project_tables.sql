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
/*!40000 ALTER TABLE `dean` ENABLE KEYS */;
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
INSERT INTO `student` VALUES ('TG2070','S001','D01','Vishwa Pramuditha',0.00,0.00,'stu01@mail.com','0750000201','Proper'),('TG2071','S002','D01','Kasun Kalhara',0.00,0.00,'stu02@mail.com','0750000202','Proper'),('TG2072','S003','D01','Nuwan Thilina',0.00,0.00,'stu03@mail.com','0750000203','Proper'),('TG2073','S004','D01','Tharindu Dilshan',0.00,0.00,'stu04@mail.com','0750000204','Proper'),('TG2074','S005','D01','Sachintha Madushan',0.00,0.00,'stu05@mail.com','0750000205','Proper'),('TG2075','S006','D01','Ishara Sandaruwan',0.00,0.00,'stu06@mail.com','0750000206','Proper'),('TG2076','S007','D01','Kavindi Shehara',0.00,0.00,'stu07@mail.com','0750000207','Proper'),('TG2077','S008','D01','Piumi Hansika',0.00,0.00,'stu08@mail.com','0750000208','Proper'),('TG2078','S009','D01','Lahiru Kumara',0.00,0.00,'stu09@mail.com','0750000209','Proper'),('TG2079','S010','D01','Dinesh Priyantha',0.00,0.00,'stu10@mail.com','0750000210','Proper'),('TG2080','S011','D01','Sahan Perera',0.00,0.00,'stu11@mail.com','0750000211','Repeat'),('TG2081','S012','D01','Amila Sandeepa',0.00,0.00,'stu12@mail.com','0750000212','Repeat'),('TG2082','S013','D01','Ruwan Chamara',0.00,0.00,'stu13@mail.com','0750000213','Repeat'),('TG2083','S014','D01','Nilupul Prasanna',0.00,0.00,'stu14@mail.com','0750000214','Repeat'),('TG2084','S015','D01','Supun Silva',0.00,0.00,'stu15@mail.com','0750000215','Repeat');
/*!40000 ALTER TABLE `student` ENABLE KEYS */;
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
INSERT INTO `user` VALUES ('A001','admin','12345','admin@ruhuna.ac.lk','0112222333'),('D001','dean','12345','dean@ruhuna.ac.lk','0114444555'),('L001','lecturer','12345','lec1@mail.com','0770000101'),('L002','lecturer','12345','lec2@mail.com','0770000102'),('L003','lecturer','12345','lec3@mail.com','0770000103'),('L004','lecturer','12345','lec4@mail.com','0770000104'),('L005','lecturer','12345','lec5@mail.com','0770000105'),('S001','student','12345','stu01@mail.com','0750000201'),('S002','student','12345','stu02@mail.com','0750000202'),('S003','student','12345','stu03@mail.com','0750000203'),('S004','student','12345','stu04@mail.com','0750000204'),('S005','student','12345','stu05@mail.com','0750000205'),('S006','student','12345','stu06@mail.com','0750000206'),('S007','student','12345','stu07@mail.com','0750000207'),('S008','student','12345','stu08@mail.com','0750000208'),('S009','student','12345','stu09@mail.com','0750000209'),('S010','student','12345','stu10@mail.com','0750000210'),('S011','student','12345','stu11@mail.com','0750000211'),('S012','student','12345','stu12@mail.com','0750000212'),('S013','student','12345','stu13@mail.com','0750000213'),('S014','student','12345','stu14@mail.com','0750000214'),('S015','student','12345','stu15@mail.com','0750000215'),('T001','Technical_officer','12345','to1@mail.com','0710000001'),('T002','Technical_officer','12345','to2@mail.com','0710000002'),('T003','Technical_officer','12345','to3@mail.com','0710000003');
/*!40000 ALTER TABLE `user` ENABLE KEYS */;
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
    DECLARE is_eligible VARCHAR(20);

    SELECT Eligibility INTO is_eligible 
    FROM Attendance 
    WHERE Reg_No = in_reg 
    ORDER BY Attendance_ID DESC LIMIT 1;

    IF is_eligible = 'Eligible' THEN
        INSERT INTO Marks (Mark_ID, Reg_No, Course_Code, Quiz1_Marks, Quiz2_Marks, Quiz3_Marks, Assignment_1, Assignment_2, Mid_Exam_Marks, End_Exam_Marks)
        VALUES (in_id, in_reg, in_course, q1, q2, q3, a1, a2, mid, end_exam);

        CALL UpdateFinalMarks(in_reg, in_course);
    ELSE
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Denied: Student is Not Eligible due to low attendance (UGC By-laws).';
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `CheckEligibility` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `CheckEligibility`(
    IN in_reg VARCHAR(10)
)
BEGIN
    DECLARE total_sessions INT DEFAULT 15;
    DECLARE attended_sessions INT;
    DECLARE percentage DECIMAL(5,2);

    SELECT COUNT(*) INTO attended_sessions 
    FROM Attendance 
    WHERE Reg_No = in_reg AND Attendance_Status = 'Present';

    SET percentage = (attended_sessions / total_sessions) * 100;

    IF percentage >= 80 THEN
        UPDATE Attendance SET Eligibility = 'Eligible' WHERE Reg_No = in_reg;
    ELSE
        UPDATE Attendance SET Eligibility = 'Not Eligible' WHERE Reg_No = in_reg;
    END IF;
END */;;
DELIMITER ;
/*!50003 SET sql_mode              = @saved_sql_mode */ ;
/*!50003 SET character_set_client  = @saved_cs_client */ ;
/*!50003 SET character_set_results = @saved_cs_results */ ;
/*!50003 SET collation_connection  = @saved_col_connection */ ;
/*!50003 DROP PROCEDURE IF EXISTS `GenerateAcademicSummary` */;
/*!50003 SET @saved_cs_client      = @@character_set_client */ ;
/*!50003 SET @saved_cs_results     = @@character_set_results */ ;
/*!50003 SET @saved_col_connection = @@collation_connection */ ;
/*!50003 SET character_set_client  = latin1 */ ;
/*!50003 SET character_set_results = latin1 */ ;
/*!50003 SET collation_connection  = latin1_swedish_ci */ ;
/*!50003 SET @saved_sql_mode       = @@sql_mode */ ;
/*!50003 SET sql_mode              = 'STRICT_TRANS_TABLES,NO_AUTO_CREATE_USER,NO_ENGINE_SUBSTITUTION' */ ;
DELIMITER ;;
/*!50003 CREATE*/ /*!50020 DEFINER=`root`@`localhost`*/ /*!50003 PROCEDURE `GenerateAcademicSummary`()
BEGIN
    SET FOREIGN_KEY_CHECKS = 0;
    
    TRUNCATE TABLE Academic_Summery;

    INSERT INTO Academic_Summery (
        Summery_ID, 
        CGPA_Value, 
        Academic_Level, 
        Last_Update_Date, 
        Class_Standings, 
        Total_Credit_Earned, 
        Reg_No
    )
    SELECT 
        CONCAT('SUM_', Reg_No),
        ROUND(SUM(Semester_GPA_Value * Total_Semester_Credit) / SUM(Total_Semester_Credit), 2),
        1,
        CURDATE(),
        
        CASE 
            WHEN (SUM(Semester_GPA_Value * Total_Semester_Credit) / SUM(Total_Semester_Credit)) >= 3.70 THEN 'First Class'
            WHEN (SUM(Semester_GPA_Value * Total_Semester_Credit) / SUM(Total_Semester_Credit)) >= 3.30 THEN 'Second Upper'
            WHEN (SUM(Semester_GPA_Value * Total_Semester_Credit) / SUM(Total_Semester_Credit)) >= 3.00 THEN 'Second Lower'
            WHEN (SUM(Semester_GPA_Value * Total_Semester_Credit) / SUM(Total_Semester_Credit)) >= 2.00 THEN 'Pass'
            ELSE 'Fail'
        END,
        SUM(Total_Semester_Credit),
        Reg_No
    FROM Semester_GPA
    GROUP BY Reg_No;

    SET FOREIGN_KEY_CHECKS = 1;
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

-- Dump completed on 2026-05-05 17:56:18
