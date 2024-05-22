-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: May 23, 2024 at 01:20 AM
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
CREATE DEFINER=`wb2c0`@`localhost` PROCEDURE `edit.Account` (IN `AccNo` INT, IN `password` VARCHAR(45), IN `RoleNo` INT, IN `BranchNo` INT, IN `lastname` VARCHAR(45), IN `firstname` VARCHAR(45), IN `mi` VARCHAR(45), IN `address` VARCHAR(45), IN `contactNo` VARCHAR(10), IN `email` VARCHAR(45), IN `DateUpdated` DATETIME)  BEGIN
  UPDATE `accounts`
  SET 
    `password` = `password`,
    `RoleNo` = RoleNo,
    `BranchNo` = BranchNo,
    `lastname` = lastname,
    `firstname` = firstname,
    `mi` = mi,
    `address` = address,
    `contactNo` = contactNo,
    `email` = email,
    `DateUpdated` = DateUpdated
  WHERE `AccNo` = AccNo;
END$$

CREATE DEFINER=`wb2c0`@`localhost` PROCEDURE `insert.Liquidation` (IN `ORNo` INT, IN `ORType` VARCHAR(45), IN `establishment` VARCHAR(45), IN `total` DOUBLE(10,2), IN `change` DOUBLE(10,2), IN `DateCreated` DATETIME, IN `DateUpdated` DATETIME, IN `AccNo` INT, IN `remarks` LONGTEXT, IN `Voucher` INT)  BEGIN
    INSERT INTO liquidation(
        ORNo, 
        ORType, 
        establishment, 
        total, 
        `change`, 
        DateCreated, 
        DateUpdated, 
        AccNo, 
        remarks, 
        voidflag, 
        postflag
    ) VALUES (
        ORNo, 
        ORType, 
        establishment, 
        total, 
        `change`, 
        DateCreated, 
        DateUpdated, 
        AccNo, 
        remarks, 
        0, 
        0
    );
UPDATE voucher SET `status` = "Liquidated" WHERE VoucherNo = `Voucher`;
END$$

CREATE DEFINER=`wb2c0`@`localhost` PROCEDURE `insert.Particular` (IN `item` VARCHAR(45), IN `unit` VARCHAR(45), IN `qty` DOUBLE(10,2), IN `cost` DOUBLE(10,2), IN `total` DOUBLE(10,2), IN `ORNo` INT, IN `DateCreated` DATETIME, IN `DateUpdated` DATETIME, IN `AccNo` INT)  BEGIN
    -- Insert logic here
    INSERT INTO particulars (
        item, 
        unit, 
        qty, 
        cost, 
        total, 
        ORNo, 
        DateCreated, 
        DateUpdated, 
        AccNo,
        voidflag,
        postflag
    ) VALUES (
        item, 
        unit, 
        qty, 
        cost, 
        total, 
        ORNo, 
        DateCreated, 
        DateUpdated, 
        AccNo,
        0,
        0
    );
END$$

CREATE DEFINER=`root`@`localhost` PROCEDURE `insert.Requests` (`usage` VARCHAR(45), `project` VARCHAR(45), `purpose` LONGTEXT, `mop` VARCHAR(45), `amount` DOUBLE(10,2), `DateCreated` DATETIME, `DateUpdated` DATETIME, `AccNo` INT(10), `status` VARCHAR(45))  BEGIN

INSERT INTO request(`usage`, project, purpose, mop, amount, DateCreated, DateUpdated, AccNo, `status`) VALUES (`usage`, project, purpose, mop, amount, DateCreated, DateUpdated, AccNo, `status`);

   END$$

CREATE DEFINER=`wb2c0`@`localhost` PROCEDURE `insert.Voucher` (IN `in_voucherType` VARCHAR(45), IN `in_amount` DOUBLE(10,2), IN `in_REFNo` VARCHAR(45), IN `in_ReqNo` INT, IN `in_DateCreated` DATETIME, IN `in_DateUpdated` DATETIME, IN `in_AccNo` INT UNSIGNED, IN `in_status` VARCHAR(45))  BEGIN
  UPDATE request 
  SET `status` = 'Approved' 
  WHERE `ReqNo` = in_ReqNo;

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
    in_voucherType,
    in_amount,
    in_REFNo,
    in_ReqNo,
    in_DateCreated,
    in_DateUpdated,
    in_AccNo,
    in_status,
    0, 0
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
(1, 'admin', 'tpsadmin', 1, 1, 'Diangca', 'Ebrahim', 'S', 'Tagum, Davao del norte, Philippines', '9978251816', 'ediangca22@gmail.com', '2024-05-14 00:00:00', '2024-05-18 00:00:00', 1),
(6, 'wb2c0', 'admin', 1, 1, 'Bitoco', 'Whilmar', 'M', 'Mankilam, Tagum City, Davao Del Norte', '1234567', 'hello@whilmarbitoco.me', '2024-05-17 00:00:00', '2024-05-18 00:00:00', 1),
(7, 'Hello', 'q23457iukbfe', 1, 1, 'qwertgh', '2aaa', 'F', 'retryjhfvdww', '1234567', 'q345578ikjmhgf', '2024-05-18 00:00:00', '2024-05-18 00:00:00', 1);

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
(1, 'Mankilam-Tagum', 'Mankilam, Tagum City, Davao del Norte', '2024-05-14 00:00:00', '2024-05-14 00:00:00', 1),
(2, 'test', 'hello', '2024-05-18 00:00:00', '2024-05-18 00:00:00', 1),
(3, '2345678', 'w4e5rtujhgfd', '2024-05-18 00:00:00', '2024-05-18 00:00:00', 1),
(4, 'testwewe', 'test', '2024-05-20 00:00:00', '2024-05-20 00:00:00', 1);

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

--
-- Dumping data for table `liquidation`
--

INSERT INTO `liquidation` (`LiqNo`, `ORNo`, `ORType`, `establishment`, `total`, `change`, `DateCreated`, `DateUpdated`, `AccNo`, `voidflag`, `postflag`, `remarks`) VALUES
(1, 654, 'gfhfh', '5y', 0.00, 3.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, 'gbfdgv'),
(2, 234567, 'test', '7/11', 0.00, 33.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, 'wala'),
(3, 234567, 'testttttt', 'hello', 0.00, 33.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, 'ddfdf'),
(4, 22, '333', '22', 0.00, 22.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, 'wha'),
(5, 3456, 'fdf', 'dsds', 0.00, 22.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, 'dfgh'),
(6, 34567, 'okay', 'fdfdf', 0.00, 222.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, 'fdfdfd'),
(7, 3456, '6543', 'ggg', 0.00, 33.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, 'awesrfg'),
(8, 154, 'rere', 'efg', 0.00, 22.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, 'fdfdf'),
(9, 234567, 'ewew', 'fdf', 0.00, 22.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, 'eerrgg'),
(10, 234567, 'e343', 'wer', 0.00, 22.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, 'awesrd'),
(11, 23456, 'fdf', 'fdf', 0.00, 22.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, 'sdf'),
(12, 2345, 'dsdsd', 'dfd', 0.00, 22.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, 'fd'),
(13, 23456, 'eewew', 'fdfdd', 0.00, 22.00, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0, '22ds');

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

--
-- Dumping data for table `particulars`
--

INSERT INTO `particulars` (`PNo`, `item`, `unit`, `qty`, `cost`, `total`, `ORNo`, `DateCreated`, `DateUpdated`, `AccNo`, `voidflag`, `postflag`) VALUES
(1, '234ty', 'Select', 22.00, 66.00, 1452.00, 23456, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0),
(2, '3456', 'gallon/s', 3.00, 99.00, 297.00, 23456, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0),
(3, 'rew', 'gallon/s', 22.00, 2.00, 44.00, 23456, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0),
(4, 'ee', 'gallon/s', 3.00, 2.00, 6.00, 23456, '2024-05-22 00:00:00', '2024-05-22 00:00:00', 1, 0, 0);

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
(3, 'test', 'dsd', 'wahahahah', 'dsd', 5535.00, '2024-05-14 00:00:00', '2024-05-20 00:00:00', 1, 'For Approval', 0, 0),
(4, '4454646', 'ldr', 'whoami', 'fdf', 434.00, '2024-05-14 00:00:00', '2024-05-14 00:00:00', 1, 'Approved', 0, 0),
(5, 'Test', 'teset', 'for testing', 'gcash', 2134567.00, '2024-05-16 00:00:00', '2024-05-20 00:00:00', 1, 'For Approval', 0, 0);

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
(1, 'Administrator', '2024-05-14 00:00:00', '2024-05-14 00:00:00', 1),
(2, 'hello', '2024-05-18 00:00:00', '2024-05-18 00:00:00', 1),
(3, 'test Role', '2024-05-18 00:00:00', '2024-05-18 00:00:00', 1),
(4, 'barry', '2024-05-18 00:00:00', '2024-05-18 00:00:00', 1);

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
(1, 'qwerty', 1234.00, '123456', 5, '2024-05-16 00:00:00', '2024-05-16 00:00:00', 1, 'For Liquidation', 0, 0),
(2, 'ASDFGHJ', 8765432.00, 'W34567', 0, '2024-05-18 00:00:00', '2024-05-18 00:00:00', 1, 'For Liquidation', 0, 0),
(3, 'awesdtguki', 4567.00, '23456789', 0, '2024-05-18 00:00:00', '2024-05-18 00:00:00', 1, 'Liquidated', 0, 0),
(4, 'qwertyghjk', 8765.00, '3w456y890', 0, '2024-05-18 00:00:00', '2024-05-18 00:00:00', 1, 'For Liquidation', 0, 0),
(5, '345678', 1234.00, '765432', 0, '2024-05-18 00:00:00', '2024-05-18 00:00:00', 1, 'For Liquidation', 0, 0),
(6, 'qwertyy', 234567.00, '1234567', 0, '2024-05-18 00:00:00', '2024-05-18 00:00:00', 1, 'For Liquidation', 0, 0),
(7, 'evhbjnk', 23456.00, '3456789', 0, '2024-05-19 00:00:00', '2024-05-19 00:00:00', 1, 'For Liquidation', 0, 0),
(8, 'ertvybn', 777.00, '987', 4, '2024-05-19 00:00:00', '2024-05-19 00:00:00', 1, 'For Liquidation', 0, 0);

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
  MODIFY `AccNo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `branch`
--
ALTER TABLE `branch`
  MODIFY `BranchNo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `liquidation`
--
ALTER TABLE `liquidation`
  MODIFY `LiqNo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `particulars`
--
ALTER TABLE `particulars`
  MODIFY `PNo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `request`
--
ALTER TABLE `request`
  MODIFY `ReqNo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `role`
--
ALTER TABLE `role`
  MODIFY `RoleNo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `voucher`
--
ALTER TABLE `voucher`
  MODIFY `VoucherNo` int UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

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
