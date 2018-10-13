-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.60


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema potracker
--

CREATE DATABASE IF NOT EXISTS potracker;
USE potracker;

--
-- Definition of table `city`
--

DROP TABLE IF EXISTS `city`;
CREATE TABLE `city` (
  `CityId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `StateId` int(10) unsigned NOT NULL,
  `CityName` varchar(45) NOT NULL,
  PRIMARY KEY (`CityId`),
  KEY `FK_city_1` (`StateId`),
  CONSTRAINT `FK_city_1` FOREIGN KEY (`StateId`) REFERENCES `state` (`StateId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `city`
--

/*!40000 ALTER TABLE `city` DISABLE KEYS */;
INSERT INTO `city` (`CityId`,`StateId`,`CityName`) VALUES 
 (1,1,'Faridabad'),
 (2,1,'Gurgaon'),
 (3,1,'Rohtak');
/*!40000 ALTER TABLE `city` ENABLE KEYS */;


--
-- Definition of table `client`
--

DROP TABLE IF EXISTS `client`;
CREATE TABLE `client` (
  `ClientId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrgId` int(10) unsigned DEFAULT NULL,
  `Project` varchar(60) NOT NULL,
  `ClientSpoc` varchar(45) NOT NULL,
  `ContactNo` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `CurrentTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`ClientId`),
  KEY `FK_client_1` (`OrgId`),
  CONSTRAINT `FK_client_1` FOREIGN KEY (`OrgId`) REFERENCES `org` (`OrgId`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `client`
--

/*!40000 ALTER TABLE `client` DISABLE KEYS */;
INSERT INTO `client` (`ClientId`,`OrgId`,`Project`,`ClientSpoc`,`ContactNo`,`Email`,`Password`,`CurrentTimeStamp`,`Status`) VALUES 
 (8,101,'invoice tracker','John','9812345678','john@gmail.com','john@123','2018-08-02 10:43:23',1),
 (9,101,'quiz portal','john2','9865366544','john2@gmail.com','john2@123','2018-08-02 10:44:38',1),
 (10,105,'Oracle','Nidhi','9876543525','nidhi@gmail.com','7323267','2018-08-03 12:00:22',1),
 (11,106,'laptop','abhishek','7564567556','abhishek@gmail.com','abhi21233','2018-08-03 14:12:16',1);
/*!40000 ALTER TABLE `client` ENABLE KEYS */;


--
-- Definition of table `country`
--

DROP TABLE IF EXISTS `country`;
CREATE TABLE `country` (
  `CountryId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Country` varchar(45) NOT NULL,
  PRIMARY KEY (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `country`
--

/*!40000 ALTER TABLE `country` DISABLE KEYS */;
INSERT INTO `country` (`CountryId`,`Country`) VALUES 
 (1,'India'),
 (2,'USA'),
 (3,'Paris'),
 (4,'Afghanistan'),
 (5,'Bangladesh'),
 (6,'Denmark'),
 (7,'Germany'),
 (8,'Japan'),
 (9,'Sweden');
/*!40000 ALTER TABLE `country` ENABLE KEYS */;


--
-- Definition of table `invoice`
--

DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `InvoiceId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PoId` int(10) unsigned NOT NULL,
  `Description` varchar(100) NOT NULL,
  `GstCond` int(10) unsigned DEFAULT NULL,
  `GstCondValue` int(10) unsigned DEFAULT NULL,
  `Amount` int(10) unsigned NOT NULL,
  `InvStartDate` date NOT NULL,
  `InvDispatchDate` date NOT NULL,
  `InvClosedDate` date NOT NULL,
  `CurrentTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Status` int(10) unsigned NOT NULL,
  `Remark` varchar(100) NOT NULL,
  `InvoiceState` tinyint(1) unsigned zerofill DEFAULT '0',
  `Milestone` varchar(100) NOT NULL,
  PRIMARY KEY (`InvoiceId`),
  KEY `FK_invoice_1` (`PoId`),
  CONSTRAINT `FK_invoice_1` FOREIGN KEY (`PoId`) REFERENCES `po` (`PoID`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `invoice`
--

/*!40000 ALTER TABLE `invoice` DISABLE KEYS */;
INSERT INTO `invoice` (`InvoiceId`,`PoId`,`Description`,`GstCond`,`GstCondValue`,`Amount`,`InvStartDate`,`InvDispatchDate`,`InvClosedDate`,`CurrentTimeStamp`,`Status`,`Remark`,`InvoiceState`,`Milestone`) VALUES 
 (4,11,'invoice tracker',NULL,NULL,988765,'2018-08-02','2018-08-16','2018-08-30','2018-08-02 10:51:53',1,'milestone 1',0,'No Remark'),
 (5,12,'quiz portal',NULL,NULL,987676,'2018-08-02','2018-08-16','2018-08-30','2018-08-03 15:39:31',1,'milestone 2',0,'No Remark'),
 (6,13,'Oracle',NULL,NULL,7326236,'2018-08-04','2018-08-15','2018-08-23','2018-08-03 12:10:20',1,'milestone1',0,'remark'),
 (7,14,'laptop',NULL,NULL,875764,'2018-08-08','2018-08-15','2018-08-22','2018-08-03 15:40:31',1,'milestone1',0,'remark');
/*!40000 ALTER TABLE `invoice` ENABLE KEYS */;


--
-- Definition of table `org`
--

DROP TABLE IF EXISTS `org`;
CREATE TABLE `org` (
  `OrgId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `OrgName` varchar(100) NOT NULL,
  `Country` varchar(45) NOT NULL,
  `State` varchar(45) NOT NULL,
  `City` varchar(45) NOT NULL,
  `Pincode` int(10) unsigned DEFAULT NULL,
  `Website` varchar(60) NOT NULL,
  `CreationTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Status` int(10) unsigned NOT NULL,
  `Address` varchar(200) NOT NULL,
  PRIMARY KEY (`OrgId`)
) ENGINE=InnoDB AUTO_INCREMENT=107 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `org`
--

/*!40000 ALTER TABLE `org` DISABLE KEYS */;
INSERT INTO `org` (`OrgId`,`OrgName`,`Country`,`State`,`City`,`Pincode`,`Website`,`CreationTimeStamp`,`Status`,`Address`) VALUES 
 (101,'Paragon','India','Haryana','Gurgaon',NULL,'http:// www.jdd.com','2018-07-26 23:06:22',1,'ksdjhcdius'),
 (105,'Infodart Technologies','India','Haryana','Gurgaon',122103,'http://www.infodartglobal.com/','2018-08-03 11:58:10',1,'Udyog Vihar sector 18'),
 (106,'Videcon','India','Haryana','Gurgaon',122202,'http://localhost:8081/InvoiceTracker/organization/','2018-08-03 14:11:09',1,'udyog vihar');
/*!40000 ALTER TABLE `org` ENABLE KEYS */;


--
-- Definition of table `po`
--

DROP TABLE IF EXISTS `po`;
CREATE TABLE `po` (
  `PoID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ClientId` int(10) unsigned NOT NULL,
  `OrgId` int(10) unsigned NOT NULL,
  `Email` varchar(45) CHARACTER SET latin1 COLLATE latin1_bin DEFAULT NULL,
  `ContactNo` varchar(45) DEFAULT NULL,
  `PoNumber` int(10) unsigned NOT NULL,
  `Description` varchar(100) NOT NULL,
  `SacHsn` int(10) unsigned NOT NULL,
  `Amount` int(10) unsigned NOT NULL,
  `PoStartDate` date NOT NULL,
  `PoEndDate` date NOT NULL,
  `CurrentTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`PoID`),
  KEY `FK_po_2` (`ClientId`),
  KEY `FK_po_1` (`OrgId`),
  CONSTRAINT `FK_po_1` FOREIGN KEY (`OrgId`) REFERENCES `org` (`OrgId`),
  CONSTRAINT `FK_po_2` FOREIGN KEY (`ClientId`) REFERENCES `client` (`ClientId`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `po`
--

/*!40000 ALTER TABLE `po` DISABLE KEYS */;
INSERT INTO `po` (`PoID`,`ClientId`,`OrgId`,`Email`,`ContactNo`,`PoNumber`,`Description`,`SacHsn`,`Amount`,`PoStartDate`,`PoEndDate`,`CurrentTimeStamp`,`Status`) VALUES 
 (11,8,101,NULL,NULL,198,'invoice tracker',1232,988765,'2018-08-01','2018-09-30','2018-08-02 10:49:25',1),
 (12,9,101,NULL,NULL,199,'quiz portal',12342,987676,'2018-08-01','2018-10-17','2018-08-02 10:50:06',1),
 (13,10,105,NULL,NULL,4567,'Oracle',8767,878678,'2018-08-02','2018-09-30','2018-08-03 12:08:13',1),
 (14,11,106,NULL,NULL,65765,'laptop',87675,8866556,'2018-08-01','2018-08-31','2018-08-03 14:15:09',1);
/*!40000 ALTER TABLE `po` ENABLE KEYS */;


--
-- Definition of table `state`
--

DROP TABLE IF EXISTS `state`;
CREATE TABLE `state` (
  `StateId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CountryId` int(10) unsigned NOT NULL,
  `State` varchar(45) NOT NULL,
  PRIMARY KEY (`StateId`),
  KEY `FK_state_1` (`CountryId`),
  CONSTRAINT `FK_state_1` FOREIGN KEY (`CountryId`) REFERENCES `country` (`CountryId`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

/*!40000 ALTER TABLE `state` DISABLE KEYS */;
INSERT INTO `state` (`StateId`,`CountryId`,`State`) VALUES 
 (1,1,'Haryana'),
 (2,1,'Assam'),
 (3,1,'Punjab'),
 (4,1,'Maharashtra');
/*!40000 ALTER TABLE `state` ENABLE KEYS */;


--
-- Definition of table `user`
--

DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `UserId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Name` varchar(45) NOT NULL,
  `Email` varchar(45) NOT NULL,
  `Password` varchar(45) NOT NULL,
  `ContactNo` varchar(45) NOT NULL,
  `CurrentTimeStamp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `Status` int(10) unsigned NOT NULL,
  PRIMARY KEY (`UserId`)
) ENGINE=InnoDB AUTO_INCREMENT=133 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `user`
--

/*!40000 ALTER TABLE `user` DISABLE KEYS */;
INSERT INTO `user` (`UserId`,`Name`,`Email`,`Password`,`ContactNo`,`CurrentTimeStamp`,`Status`) VALUES 
 (101,'Admin','admin@gmail.com','123','9812345678','2018-07-30 22:23:48',1),
 (102,'user','user@gmail.com','123','9812345678','2018-07-30 22:24:12',1),
 (128,'Jyoti','jyoti@gmail.com','hello','9854443324','2018-08-02 10:45:18',1),
 (129,'Rahul','rahul@gmail.com','rahul@123','7236253536','2018-08-03 12:02:13',1),
 (132,'Deepak','deepak@gmail.com','deepak@123','735645465','2018-08-03 14:14:10',1);
/*!40000 ALTER TABLE `user` ENABLE KEYS */;


--
-- Definition of table `userclient`
--

DROP TABLE IF EXISTS `userclient`;
CREATE TABLE `userclient` (
  `UserclientId` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `UserId` int(10) unsigned NOT NULL,
  `ClientId` int(10) unsigned NOT NULL,
  PRIMARY KEY (`UserclientId`) USING BTREE,
  KEY `FK_userclient_1` (`UserId`),
  KEY `FK_userclient_2` (`ClientId`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userclient`
--

/*!40000 ALTER TABLE `userclient` DISABLE KEYS */;
INSERT INTO `userclient` (`UserclientId`,`UserId`,`ClientId`) VALUES 
 (16,127,2),
 (17,127,3),
 (18,128,8),
 (19,128,9),
 (20,129,9),
 (21,129,10),
 (26,132,10),
 (27,132,11);
/*!40000 ALTER TABLE `userclient` ENABLE KEYS */;




/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
