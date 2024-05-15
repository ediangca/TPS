-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 16, 2024 at 01:11 AM
-- Server version: 8.0.36-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.17

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `tps`
--

DELIMITER $$
--
-- Procedures
--
CREATE DEFINER=`root`@`localhost` PROCEDURE `insert.Accounts` (`username` VARCHAR(45), `password` VARCHAR(45), `RoleNo` INT(10), `BranchNo` INT(10), `lastname` VARCHAR(45), `firstname` VARCHAR(45), `mi` VARCHAR(45), `address` VARCHAR(45), `contactNo` VARCHAR(10), `email` VARCHAR(45), `DateCreated` DATETIME, `DateUpdated` DATETIME, `CreatedBy` INT(10))  BEGIN

insert into accounts(username, `password`, RoleNo, BranchNo, lastname, firstname, mi, address, contactNo, email, DateCreated, DateUpdated, CreatedBy)
values
(username, password, RoleNo, BranchNo, lastname, firstname, mi, address, contactNo, email, DateCreated, DateUpdated, CreatedBy);


   END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert.Requests` (`usage` VARCHAR(45), `project` VARCHAR(45), `purpose` LONGTEXT, `mop` VARCHAR(45), `amount` DOUBLE(10,2), `DateCreated` DATETIME, `DateUpdated` DATETIME, `AccNo` INT(10), `status` VARCHAR(45))  BEGIN

INSERT INTO request(`usage`, project, purpose, mop, amount, DateCreated, DateUpdated, AccNo, `status`) VALUES (`usage`, project, purpose, mop, amount, DateCreated, DateUpdated, AccNo, `status`);

   END$$

CREATE DEFINER=`wb2c0`@`localhost` PROCEDURE `insert.Voucher` (IN `voucherType` VARCHAR(45), IN `amount` DOUBLE(10,2), IN `REFNo` VARCHAR(45), IN `ReqNo` INT, IN `DateCreated` DATETIME, IN `DateUpdated` DATETIME, IN `AccNo` INT UNSIGNED, IN `status` VARCHAR(45))  BEGIN
  INSERT INTO `tps`.`voucher` (
    `voucherType`,
    `amount`,
    `REFNo`,
    `ReqNo`,
    `DateCreated`,
    `DateUpdated`,
    `AccNo`,
    `status`,
    `voidflag`,
    `postflag`
  ) VALUES (
    voucherType,
    amount,
    REFNo,
    ReqNo,
    DateCreated,
    DateUpdated,
    AccNo,
    `status`,
    0,0
  );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `searchRequests` (IN `usage` VARCHAR(45), IN `project` VARCHAR(45), IN `purpose` LONGTEXT)  BEGIN
  SELECT * FROM `request` WHERE `usage` = `usage` OR `project` = `project` OR `purpose` = `purpose`;
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `userAuth` (`u` VARCHAR(45), `p` VARCHAR(45))  BEGIN

  DECLARE C int(10);
  DECLARE F boolean;


  SET C = (select count(*) from accounts where username = u and `password` = p);

IF (C <= 0) THEN

  select 0;

ELSE

  select 1;

END IF;


   END$$

DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `AccNo` int UNSIGNED NOT NULL,
  `username` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `RoleNo` int UNSIGNED NOT NULL,
  `BranchNo` int UNSIGNED NOT NULL,
  `lastname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `firstname` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `mi` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `address` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `contactNo` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `email` varchar(45) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT 'n/a',
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `CreatedBy` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`AccNo`, `username`, `password`, `RoleNo`, `BranchNo`, `lastname`, `firstname`, `mi`, `address`, `contactNo`, `email`, `DateCreated`, `DateUpdated`, `CreatedBy`) VALUES
(1, 'admin', 'tpsadmin', 1, 1, 'admin', 'admin', 'a', 'Mankilam, Tagum City, Davao del Norte', '9978251816', 'ediangca22@gmail.com', '2024-05-14 00:00:00', '2024-05-14 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `branch`
--

CREATE TABLE `branch` (
  `BranchNo` int UNSIGNED NOT NULL,
  `Branch` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `Address` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `AccNo` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `branch`
--

INSERT INTO `branch` (`BranchNo`, `Branch`, `Address`, `DateCreated`, `DateUpdated`, `AccNo`) VALUES
(1, 'Mankilam-Tagum', 'Mankilam, Tagum City, Davao del Norte', '2024-05-14 00:00:00', '2024-05-14 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `host`
--

CREATE TABLE `host` (
  `Host` varchar(45) NOT NULL,
  `Port` int UNSIGNED NOT NULL,
  `Username` varchar(45) NOT NULL,
  `Password` longtext NOT NULL,
  `Database` varchar(45) NOT NULL,
  `Datetime_Created` datetime NOT NULL,
  `Datetime_Updated` datetime NOT NULL,
  `User_ID` varchar(45) NOT NULL,
  `isActive` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `host`
--

INSERT INTO `host` (`Host`, `Port`, `Username`, `Password`, `Database`, `Datetime_Created`, `Datetime_Updated`, `User_ID`, `isActive`) VALUES
('localhost', 3306, 'tps', 'Ò…Z…GÑ\\Ãkr»I’', 'tps', '2024-05-13 00:00:00', '2024-05-13 00:00:00', '1', 1);

-- --------------------------------------------------------

--
-- Table structure for table `liquidation`
--

CREATE TABLE `liquidation` (
  `LiqNo` int UNSIGNED NOT NULL,
  `ORNo` int UNSIGNED NOT NULL,
  `ORType` varchar(45) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'IF no reference value is combination of AccNoDateTime',
  `establishment` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `total` double(10,2) NOT NULL,
  `change` double(10,2) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `AccNo` int UNSIGNED NOT NULL,
  `voidflag` tinyint(1) NOT NULL,
  `postflag` tinyint(1) NOT NULL,
  `remarks` longtext COLLATE utf8mb4_general_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `particulars`
--

CREATE TABLE `particulars` (
  `PNo` int UNSIGNED NOT NULL,
  `item` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `unit` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `qty` double(10,2) NOT NULL,
  `cost` double(10,2) NOT NULL,
  `total` double(10,2) NOT NULL,
  `ORNo` int UNSIGNED NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `AccNo` int UNSIGNED NOT NULL,
  `voidflag` tinyint(1) NOT NULL,
  `postflag` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `request`
--

CREATE TABLE `request` (
  `ReqNo` int UNSIGNED NOT NULL,
  `usage` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `project` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `purpose` longtext COLLATE utf8mb4_general_ci NOT NULL,
  `mop` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `amount` double(10,2) NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `AccNo` int UNSIGNED NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `voidflag` tinyint(1) NOT NULL,
  `postflag` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `request`
--

INSERT INTO `request` (`ReqNo`, `usage`, `project`, `purpose`, `mop`, `amount`, `DateCreated`, `DateUpdated`, `AccNo`, `status`, `voidflag`, `postflag`) VALUES
(2, 'isda', 'dsd', 'dsd', 'dsds', 444.00, '2024-05-14 00:00:00', '2024-05-14 00:00:00', 1, 'For Approval', 0, 0),
(3, 'hjj', 'dsd', 'wahahahah', 'dsd', 5535.00, '2024-05-14 00:00:00', '2024-05-14 00:00:00', 1, 'For Approval', 0, 0),
(4, '4454646', 'ldr', 'whoami', 'fdf', 434.00, '2024-05-14 00:00:00', '2024-05-14 00:00:00', 1, 'For Approval', 0, 0),
(5, 'Test', 'dev', 'for testing', 'gcasg', 2134567.00, '2024-05-16 00:00:00', '2024-05-16 00:00:00', 1, 'For Approval', 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `role`
--

CREATE TABLE `role` (
  `RoleNo` int UNSIGNED NOT NULL,
  `Role` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `AccNo` int UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `role`
--

INSERT INTO `role` (`RoleNo`, `Role`, `DateCreated`, `DateUpdated`, `AccNo`) VALUES
(1, 'Administrator', '2024-05-14 00:00:00', '2024-05-14 00:00:00', 1);

-- --------------------------------------------------------

--
-- Table structure for table `voucher`
--

CREATE TABLE `voucher` (
  `VoucherNo` int UNSIGNED NOT NULL,
  `voucherType` varchar(45) COLLATE utf8mb4_general_ci NOT NULL COMMENT 'cash, online payment, cheque or etc.',
  `amount` double(10,2) NOT NULL,
  `REFNo` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `ReqNo` int UNSIGNED NOT NULL,
  `DateCreated` datetime NOT NULL,
  `DateUpdated` datetime NOT NULL,
  `AccNo` int UNSIGNED NOT NULL,
  `status` varchar(45) COLLATE utf8mb4_general_ci NOT NULL,
  `voidflag` tinyint(1) NOT NULL,
  `postflag` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `voucher`
--

INSERT INTO `voucher` (`VoucherNo`, `voucherType`, `amount`, `REFNo`, `ReqNo`, `DateCreated`, `DateUpdated`, `AccNo`, `status`, `voidflag`, `postflag`) VALUES
(1, 'qwerty', 1234.00, '123456', 5, '2024-05-16 00:00:00', '2024-05-16 00:00:00', 1, 'For Liquidation', 0, 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`AccNo`),
  ADD UNIQUE KEY `unique_username` (`username`) USING BTREE,
  ADD KEY `accounts_role` (`RoleNo`);

--
-- Indexes for table `branch`
--
ALTER TABLE `branch`
  ADD PRIMARY KEY (`BranchNo`) USING BTREE,
  ADD UNIQUE KEY `unique` (`Branch`);

--
-- Indexes for table `host`
--
ALTER TABLE `host`
  ADD PRIMARY KEY (`Host`) USING BTREE;

--
-- Indexes for table `liquidation`
--
ALTER TABLE `liquidation`
  ADD PRIMARY KEY (`LiqNo`),
  ADD KEY `UNIQUE` (`ORNo`);

--
-- Indexes for table `particulars`
--
ALTER TABLE `particulars`
  ADD PRIMARY KEY (`PNo`);

--
-- Indexes for table `request`
--
ALTER TABLE `request`
  ADD PRIMARY KEY (`ReqNo`);

--
-- Indexes for table `role`
--
ALTER TABLE `role`
  ADD PRIMARY KEY (`RoleNo`),
  ADD UNIQUE KEY `unique` (`Role`) USING BTREE;

--
-- Indexes for table `voucher`
--
ALTER TABLE `voucher`
  ADD PRIMARY KEY (`VoucherNo`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `AccNo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `BranchNo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `liquidation`
--
ALTER TABLE `liquidation`
  MODIFY `LiqNo` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `particulars`
--
ALTER TABLE `particulars`
  MODIFY `PNo` int UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `ReqNo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleNo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `VoucherNo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `accounts`
--
ALTER TABLE `accounts`
  ADD CONSTRAINT `accounts_role` FOREIGN KEY (`RoleNo`) REFERENCES `role` (`RoleNo`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
