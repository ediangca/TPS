-- MySQL Administrator dump 1.4
--
-- ------------------------------------------------------
-- Server version	5.5.5-10.4.32-MariaDB


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;


--
-- Create schema tps
--

CREATE DATABASE IF NOT EXISTS tps;
USE tps;

--
-- Definition of table `accounts`
--

DROP TABLE IF EXISTS `accounts`;
CREATE TABLE `accounts` (
  `AccNo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RoleNo` int(10) unsigned NOT NULL,
  `BranchNo` int(10) unsigned NOT NULL,
  `lastname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mi` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contactNo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'n/a',
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `CreatedBy` int(10) unsigned NOT NULL,
  PRIMARY KEY (`AccNo`),
  UNIQUE KEY `unique_username` (`username`) USING BTREE,
  KEY `accounts_role` (`RoleNo`),
  CONSTRAINT `accounts_role` FOREIGN KEY (`RoleNo`) REFERENCES `role` (`RoleNo`) ON DELETE NO ACTION ON UPDATE NO ACTION
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `accounts`
--

/*!40000 ALTER TABLE `accounts` DISABLE KEYS */;
INSERT INTO `accounts` (`AccNo`,`username`,`password`,`RoleNo`,`BranchNo`,`lastname`,`firstname`,`mi`,`address`,`contactNo`,`email`,`DateCreated`,`DateUpdated`,`CreatedBy`) VALUES 
 (1,'admin','tpsadmin',1,1,'admin','admin','a','Mankilam, Tagum City, Davao del Norte','9978251816','ediangca22@gmail.com','2024-05-14 00:00:00','2024-05-14 00:00:00',1);
/*!40000 ALTER TABLE `accounts` ENABLE KEYS */;


--
-- Definition of table `branch`
--

DROP TABLE IF EXISTS `branch`;
CREATE TABLE `branch` (
  `BranchNo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Branch` varchar(45) NOT NULL,
  `Address` longtext NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `AccNo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`BranchNo`) USING BTREE,
  UNIQUE KEY `unique` (`Branch`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

/*!40000 ALTER TABLE `branch` DISABLE KEYS */;
INSERT INTO `branch` (`BranchNo`,`Branch`,`Address`,`DateCreated`,`DateUpdated`,`AccNo`) VALUES 
 (1,'Mankilam-Tagum','Mankilam, Tagum City, Davao del Norte','2024-05-14 00:00:00','2024-05-14 00:00:00',1);
/*!40000 ALTER TABLE `branch` ENABLE KEYS */;


--
-- Definition of table `host`
--

DROP TABLE IF EXISTS `host`;
CREATE TABLE `host` (
  `Host` varchar(45) NOT NULL,
  `Port` int(10) unsigned NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` longtext NOT NULL,
  `Database` varchar(45) NOT NULL,
  `Datetime_Created` datetime NOT NULL,
  `Datetime_Updated` datetime NOT NULL,
  `User_ID` varchar(45) NOT NULL,
  `isActive` tinyint(1) NOT NULL,
  PRIMARY KEY (`Host`) USING BTREE
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `host`
--

/*!40000 ALTER TABLE `host` DISABLE KEYS */;
INSERT INTO `host` (`Host`,`Port`,`Username`,`Password`,`Database`,`Datetime_Created`,`Datetime_Updated`,`User_ID`,`isActive`) VALUES 
 ('localhost',3306,'tps','Ò…Z…GÑ\\Ãkr»I’','tps','2024-05-13 00:00:00','2024-05-13 00:00:00','1',1);
/*!40000 ALTER TABLE `host` ENABLE KEYS */;


--
-- Definition of table `liquidation`
--

DROP TABLE IF EXISTS `liquidation`;
CREATE TABLE `liquidation` (
  `LiqNo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ORNo` int(10) unsigned NOT NULL,
  `ORType` varchar(45) NOT NULL COMMENT 'IF no reference value is combination of AccNoDateTime',
  `establishment` varchar(45) NOT NULL,
  `total` double(10,2) NOT NULL,
  `change` double(10,2) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `AccNo` int(10) unsigned NOT NULL,
  `voidflag` tinyint(1) NOT NULL,
  `postflag` tinyint(1) NOT NULL,
  `remarks` longtext NOT NULL,
  PRIMARY KEY (`LiqNo`),
  KEY `UNIQUE` (`ORNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `liquidation`
--

/*!40000 ALTER TABLE `liquidation` DISABLE KEYS */;
/*!40000 ALTER TABLE `liquidation` ENABLE KEYS */;


--
-- Definition of table `particulars`
--

DROP TABLE IF EXISTS `particulars`;
CREATE TABLE `particulars` (
  `PNo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `item` varchar(45) NOT NULL,
  `unit` varchar(45) NOT NULL,
  `qty` double(10,2) NOT NULL,
  `cost` double(10,2) NOT NULL,
  `total` double(10,2) NOT NULL,
  `ORNo` int(10) unsigned NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `AccNo` int(10) unsigned NOT NULL,
  `voidflag` tinyint(1) NOT NULL,
  `postflag` tinyint(1) NOT NULL,
  PRIMARY KEY (`PNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `particulars`
--

/*!40000 ALTER TABLE `particulars` DISABLE KEYS */;
/*!40000 ALTER TABLE `particulars` ENABLE KEYS */;


--
-- Definition of table `request`
--

DROP TABLE IF EXISTS `request`;
CREATE TABLE `request` (
  `ReqNo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `usage` varchar(45) NOT NULL,
  `project` varchar(45) NOT NULL,
  `purpose` longtext NOT NULL,
  `mop` varchar(45) NOT NULL,
  `amount` double(10,2) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `AccNo` int(10) unsigned NOT NULL,
  `status` varchar(45) NOT NULL,
  `voidflag` tinyint(1) NOT NULL,
  `postflag` tinyint(1) NOT NULL,
  PRIMARY KEY (`ReqNo`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

/*!40000 ALTER TABLE `request` DISABLE KEYS */;
INSERT INTO `request` (`ReqNo`,`usage`,`project`,`purpose`,`mop`,`amount`,`DateCreated`,`DateUpdated`,`AccNo`,`status`,`voidflag`,`postflag`) VALUES 
 (2,'isda','dsd','dsd','dsds',444.00,'2024-05-14 00:00:00','2024-05-14 00:00:00',1,'For Approval',0,0),
 (3,'hjj','dsd','wahahahah','dsd',5535.00,'2024-05-14 00:00:00','2024-05-14 00:00:00',1,'For Approval',0,0),
 (4,'4454646','ldr','whoami','fdf',434.00,'2024-05-14 00:00:00','2024-05-14 00:00:00',1,'For Approval',0,0);
/*!40000 ALTER TABLE `request` ENABLE KEYS */;


--
-- Definition of table `role`
--

DROP TABLE IF EXISTS `role`;
CREATE TABLE `role` (
  `RoleNo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `Role` varchar(45) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `AccNo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`RoleNo`),
  UNIQUE KEY `unique` (`Role`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

/*!40000 ALTER TABLE `role` DISABLE KEYS */;
INSERT INTO `role` (`RoleNo`,`Role`,`DateCreated`,`DateUpdated`,`AccNo`) VALUES 
 (1,'Administrator','2024-05-14 00:00:00','2024-05-14 00:00:00',1);
/*!40000 ALTER TABLE `role` ENABLE KEYS */;


--
-- Definition of table `voucher`
--

DROP TABLE IF EXISTS `voucher`;
CREATE TABLE `voucher` (
  `VoucherNo` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `voucherType` varchar(45) NOT NULL COMMENT 'cash, online payment, cheque or etc.',
  `amount` double(10,2) NOT NULL,
  `REFNo` varchar(45) NOT NULL,
  `ReqNo` int(10) unsigned NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `AccNo` int(10) unsigned NOT NULL,
  `status` varchar(45) NOT NULL,
  `voidflag` tinyint(1) NOT NULL,
  `postflag` tinyint(1) NOT NULL,
  PRIMARY KEY (`VoucherNo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucher`
--

/*!40000 ALTER TABLE `voucher` DISABLE KEYS */;
/*!40000 ALTER TABLE `voucher` ENABLE KEYS */;


--
-- Definition of procedure `insert.Accounts`
--

DROP PROCEDURE IF EXISTS `insert.Accounts`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert.Accounts`(
  `username` varchar(45) ,
  `password` varchar(45) ,
  `RoleNo` int(10) ,
  `BranchNo` int(10) ,
  `lastname` varchar(45) ,
  `firstname` varchar(45) ,
  `mi` varchar(45) ,
  `address` varchar(45) ,
  `contactNo` varchar(10) ,
  `email` varchar(45),
  `DateCreated` datetime,
  `DateUpdated` datetime,
  `CreatedBy` int(10))
BEGIN

insert into accounts(username, `password`, RoleNo, BranchNo, lastname, firstname, mi, address, contactNo, email, DateCreated, DateUpdated, CreatedBy)
values
(username, password, RoleNo, BranchNo, lastname, firstname, mi, address, contactNo, email, DateCreated, DateUpdated, CreatedBy);


   END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `insert.Requests`
--

DROP PROCEDURE IF EXISTS `insert.Requests`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert.Requests`(

  `usage` varchar(45),
  `project` varchar(45),
  `purpose` longtext,
  `mop` varchar(45),
  `amount` double(10,2),
  `DateCreated` datetime,
  `DateUpdated` datetime,
  `AccNo` int(10),
  `status` varchar(45))
BEGIN

INSERT INTO request(`usage`, project, purpose, mop, amount, DateCreated, DateUpdated, AccNo, `status`) VALUES (`usage`, project, purpose, mop, amount, DateCreated, DateUpdated, AccNo, `status`);

   END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `searchRequests`
--

DROP PROCEDURE IF EXISTS `searchRequests`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `searchRequests`(
  IN `usage` VARCHAR(45),
  IN `project` VARCHAR(45),
  IN `purpose` LONGTEXT
)
BEGIN
  SELECT * FROM `request` WHERE `usage` = `usage` OR `project` = `project` OR `purpose` = `purpose`;
END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;

--
-- Definition of procedure `userAuth`
--

DROP PROCEDURE IF EXISTS `userAuth`;

DELIMITER $$

/*!50003 SET @TEMP_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_ZERO_IN_DATE,NO_ZERO_DATE,NO_ENGINE_SUBSTITUTION' */ $$
CREATE DEFINER=`root`@`localhost` PROCEDURE `userAuth`(u varchar(45), p varchar(45))
BEGIN

  DECLARE C int(10);
  DECLARE F boolean;


  SET C = (select count(*) from accounts where username = u and `password` = p);

IF (C <= 0) THEN

  select 0;

ELSE

  select 1;

END IF;


   END $$
/*!50003 SET SESSION SQL_MODE=@TEMP_SQL_MODE */  $$

DELIMITER ;



/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
