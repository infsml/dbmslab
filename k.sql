-- MySQL dump 10.13  Distrib 5.7.33, for Linux (x86_64)
--
-- Host: localhost    Database: 1nh19cs170e5
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
  `dname` varchar(20) NOT NULL,
  `dnumber` int(11) NOT NULL,
  `mgrssn` int(11) DEFAULT NULL,
  `mgrstartdate` date DEFAULT NULL,
  PRIMARY KEY (`dnumber`),
  KEY `dfk1` (`mgrssn`),
  CONSTRAINT `dfk1` FOREIGN KEY (`mgrssn`) REFERENCES `employee` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `department`
--

LOCK TABLES `department` WRITE;
/*!40000 ALTER TABLE `department` DISABLE KEYS */;
INSERT INTO `department` VALUES ('Art',201,100,'2001-08-19'),('Science',202,101,'2001-08-20'),('NonSense',203,101,'2001-09-20');
/*!40000 ALTER TABLE `department` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `dependent`
--

DROP TABLE IF EXISTS `dependent`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `dependent` (
  `essn` int(11) DEFAULT NULL,
  `dependentname` varchar(20) DEFAULT NULL,
  `sex` varchar(6) DEFAULT NULL,
  `bdate` date DEFAULT NULL,
  `relationship` varchar(15) NOT NULL,
  KEY `depenfk1` (`essn`),
  CONSTRAINT `depenfk1` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `dependent`
--

LOCK TABLES `dependent` WRITE;
/*!40000 ALTER TABLE `dependent` DISABLE KEYS */;
INSERT INTO `dependent` VALUES (100,'Otosan','Male','1988-07-02','Father'),(101,'Okasan','Female','1988-07-02','Mother'),(102,'Komisan','Female','1988-07-02','Daughter'),(102,'Hachiman','Male','1988-05-01','Husband');
/*!40000 ALTER TABLE `dependent` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `deptlocation`
--

DROP TABLE IF EXISTS `deptlocation`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `deptlocation` (
  `dnumber` int(11) NOT NULL,
  `dlocation` varchar(20) NOT NULL,
  PRIMARY KEY (`dnumber`,`dlocation`),
  CONSTRAINT `defk` FOREIGN KEY (`dnumber`) REFERENCES `department` (`dnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `deptlocation`
--

LOCK TABLES `deptlocation` WRITE;
/*!40000 ALTER TABLE `deptlocation` DISABLE KEYS */;
INSERT INTO `deptlocation` VALUES (201,'kyoto'),(201,'tokyo'),(202,'fuji'),(202,'tokyo'),(203,'daichi'),(203,'fukushima');
/*!40000 ALTER TABLE `deptlocation` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `employee`
--

DROP TABLE IF EXISTS `employee`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `employee` (
  `name` varchar(25) NOT NULL,
  `ssn` int(11) NOT NULL,
  `address` varchar(20) DEFAULT NULL,
  `sex` varchar(6) NOT NULL,
  `salary` int(11) NOT NULL DEFAULT '0',
  `superssn` int(11) DEFAULT NULL,
  `dno` int(11) DEFAULT NULL,
  PRIMARY KEY (`ssn`),
  KEY `efk1` (`superssn`),
  KEY `fk12` (`dno`),
  CONSTRAINT `efk1` FOREIGN KEY (`superssn`) REFERENCES `employee` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk12` FOREIGN KEY (`dno`) REFERENCES `department` (`dnumber`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `employee`
--

LOCK TABLES `employee` WRITE;
/*!40000 ALTER TABLE `employee` DISABLE KEYS */;
INSERT INTO `employee` VALUES ('hikigaya',100,'tokyo','Male',10000,100,201),('Komachi',101,'tokyo','Female',10000,100,202),('Mai',102,'kyoto','Female',20000,100,203);
/*!40000 ALTER TABLE `employee` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `project`
--

DROP TABLE IF EXISTS `project`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `project` (
  `pname` varchar(20) NOT NULL,
  `pnumber` int(11) NOT NULL,
  `plocation` varchar(20) DEFAULT NULL,
  `dnum` int(11) DEFAULT NULL,
  PRIMARY KEY (`pnumber`),
  KEY `pfk1` (`dnum`),
  CONSTRAINT `pfk1` FOREIGN KEY (`dnum`) REFERENCES `department` (`dnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `project`
--

LOCK TABLES `project` WRITE;
/*!40000 ALTER TABLE `project` DISABLE KEYS */;
INSERT INTO `project` VALUES ('schl fest',301,'school',201),('prtcl accl',302,'sci lab',202),('neutrino detct',303,'underground',202),('timepass',304,'nirvana',203);
/*!40000 ALTER TABLE `project` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `workson`
--

DROP TABLE IF EXISTS `workson`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `workson` (
  `essn` int(11) NOT NULL,
  `pno` int(11) NOT NULL,
  `hours` int(11) DEFAULT NULL,
  PRIMARY KEY (`essn`,`pno`),
  KEY `wfk2` (`pno`),
  CONSTRAINT `wfk1` FOREIGN KEY (`essn`) REFERENCES `employee` (`ssn`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `wfk2` FOREIGN KEY (`pno`) REFERENCES `project` (`pnumber`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `workson`
--

LOCK TABLES `workson` WRITE;
/*!40000 ALTER TABLE `workson` DISABLE KEYS */;
INSERT INTO `workson` VALUES (100,301,24),(100,304,0),(101,302,29),(102,303,29);
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

-- Dump completed on 2021-11-15 16:04:46
