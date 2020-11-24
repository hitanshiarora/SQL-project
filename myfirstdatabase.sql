-- MySQL dump 10.13  Distrib 8.0.22, for Linux (x86_64)
--
-- Host: localhost    Database: myfirstdatabase
-- ------------------------------------------------------
-- Server version	8.0.22-0ubuntu0.20.04.2

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!50503 SET NAMES utf8mb4 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `department` (
  `code` char(5) NOT NULL,
  `name` varchar(30) DEFAULT NULL,
  `managerid` int DEFAULT NULL,
  `subdeptof` char(5) DEFAULT NULL,
  PRIMARY KEY (`code`),
  KEY `managerid` (`managerid`),
  CONSTRAINT `department_ibfk_3` FOREIGN KEY (`managerid`) REFERENCES `employee` (`employeeid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('ACCNT','Accounting',2,'ADMIN'),('ADMIN','Administration',1,'CNSLT'),('CNSLT','Consulting',4,'ADMIN'),('HDWRE','Hardware',3,'CNSLT');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `employee` (
  `employeeid` decimal(9,0) NOT NULL,
  `firstname` varchar(10) DEFAULT NULL,
  `lastname` varchar(20) DEFAULT NULL,
  `deptcode` char(5) DEFAULT NULL,
  `salary` decimal(9,2) DEFAULT NULL,
  PRIMARY KEY (`employeeid`),
  KEY `deptcode` (`deptcode`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`deptcode`) REFERENCES `department` (`code`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (1,'Rahul','ARora','23',200.00),(2,'PI','RSquared','ACCNT',40000.00),(3,'Harry','Hardware','HDWRE',50000.00),(4,'Sussie','Software','CNSLT',60000.00),(5,'Abe','Advice','CNSLT',30000.00),(6,'Hardly','Aware','ADMIN',65000.00);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- 
--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `project` (
  `projectid` char(8) NOT NULL,
  `deptcode` char(5) DEFAULT NULL,
  `description` varchar(200) DEFAULT NULL,
  `startdate` date DEFAULT NULL,
  `stopdate` date DEFAULT NULL,
  `revenue` decimal(12,2) DEFAULT NULL,
  PRIMARY KEY (`projectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('ADT4MFIA','ACCNT','Mofia Audit','2002-07-03','2003-11-30',100000.00),('DNLDCNLT','CNSLT','Download Client','2005-02-03','2005-04-14',18150.00),('EMHAPPY','ADMIN','Employee Moral','2002-03-14','2002-04-25',0.00),('ROBOSPSE','CNSLT','Robotic Spouse','2002-03-14','2002-06-25',242000.00);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workson`
--

DROP TABLE IF EXISTS `workson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!50503 SET character_set_client = utf8mb4 */;
CREATE TABLE `workson` (
  `employeeid` decimal(9,0) NOT NULL,
  `projectid` char(8) NOT NULL,
  `assignedtime` decimal(3,2) DEFAULT NULL,
  PRIMARY KEY (`employeeid`,`projectid`),
  KEY `projectid` (`projectid`),
  CONSTRAINT `workson_ibfk_1` FOREIGN KEY (`projectid`) REFERENCES `project` (`projectid`),
  CONSTRAINT `workson_ibfk_2` FOREIGN KEY (`projectid`) REFERENCES `project` (`projectid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workson`
--

LOCK TABLES `workson` WRITE;
/*!40000 ALTER TABLE `workson` DISABLE KEYS */;
INSERT INTO `workson` VALUES (2,'ADT4MFIA',0.50),(3,'DNLDCLNT',0.25),(3,'ROBOSPSE',0.75),(4,'ROBOSPSE',0.75),(5,'ADT4MFIA',0.60),(5,'ROBOSPSE',0.50);
/*!40000 ALTER TABLE `workson` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2020-11-18  1:30:11
