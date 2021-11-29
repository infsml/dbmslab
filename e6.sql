-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: 1nh19cs170e6
-- ------------------------------------------------------
-- Server version	5.7.33-0ubuntu0.16.04.1

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
-- Table structure for table `department`
--

DROP TABLE IF EXISTS `department`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `department` (
  `dno` int(11) NOT NULL,
  `dname` varchar(20) DEFAULT NULL,
  `location` varchar(20) DEFAULT NULL,
  PRIMARY KEY (`dno`),
  UNIQUE KEY `dname` (`dname`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES (100,'Science','Earth'),(101,'Art','Jupiter'),(102,'NotSci','Mars'),(103,'NotArt','Pluto'),(104,'Mobile','Mars');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependent` (
  `ename` varchar(15) NOT NULL,
  `gender` varchar(8) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `relation` varchar(20) DEFAULT NULL,
  `eno` int(11) DEFAULT NULL,
  PRIMARY KEY (`ename`),
  KEY `eno` (`eno`),
  CONSTRAINT `dependent_ibfk_1` FOREIGN KEY (`eno`) REFERENCES `employee` (`eno`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES ('Dastan','M','1998-08-20','Son',201),('Farah','F','1997-04-06','Wife',204),('Gustaf','M','1996-09-26','Brother',203),('Kailena','F','1999-06-20','Daughter',202);
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `eno` int(11) NOT NULL,
  `ename` varchar(20) NOT NULL,
  `doj` date DEFAULT NULL,
  `salary` decimal(10,2) DEFAULT NULL,
  `address` varchar(20) DEFAULT NULL,
  `gender` varchar(3) DEFAULT NULL,
  `job` varchar(20) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL,
  `sno` int(11) DEFAULT NULL,
  PRIMARY KEY (`eno`),
  KEY `dno` (`dno`),
  KEY `sno` (`sno`),
  CONSTRAINT `employee_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`),
  CONSTRAINT `employee_ibfk_2` FOREIGN KEY (`sno`) REFERENCES `employee` (`eno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES (201,'Ramirez','2001-09-25',50000.00,'India','M','Astronaut',100,201),(202,'Pablo','2001-08-10',25000.00,'Africa','M','',102,201),(203,'Lisa','2002-06-10',24000.00,'Mexico','F','Sports',103,201),(204,'Mona','2001-06-20',26000.00,'Spain','F','Music',100,202),(205,'Kate','2001-07-02',26000.00,'Germany','F','Music',104,203);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `pid` varchar(4) NOT NULL,
  `pname` varchar(20) DEFAULT NULL,
  `plocation` varchar(10) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`pid`),
  UNIQUE KEY `pname` (`pname`),
  KEY `dno` (`dno`),
  CONSTRAINT `project_ibfk_1` FOREIGN KEY (`dno`) REFERENCES `department` (`dno`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('301','Flight','Earth',100),('302','Booster','Jupiter',101),('303','SubZero','Mars',102),('304','Negation','Pluto',103);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workson`
--

DROP TABLE IF EXISTS `workson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workson` (
  `eno` int(11) NOT NULL,
  `pid` varchar(4) NOT NULL,
  `hours` int(11) DEFAULT NULL,
  PRIMARY KEY (`eno`,`pid`),
  KEY `pid` (`pid`),
  CONSTRAINT `workson_ibfk_1` FOREIGN KEY (`eno`) REFERENCES `employee` (`eno`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `workson_ibfk_2` FOREIGN KEY (`pid`) REFERENCES `project` (`pid`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workson`
--

LOCK TABLES `workson` WRITE;
/*!40000 ALTER TABLE `workson` DISABLE KEYS */;
INSERT INTO `workson` VALUES (201,'301',25),(202,'302',21),(202,'303',28),(203,'302',26),(204,'304',19);
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

-- Dump completed on 2021-11-29 15:57:39
