-- phpMyAdmin SQL Dump
-- version 5.1.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jan 20, 2022 at 06:56 PM
-- Server version: 10.4.19-MariaDB
-- PHP Version: 8.0.6

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `auctiondb1`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `email` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`email`) VALUES
('dhoni@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `alerts`
--

CREATE TABLE `alerts` (
  `alertID` int(11) NOT NULL,
  `itemCategory` varchar(10) DEFAULT NULL,
  `type` varchar(50) DEFAULT NULL,
  `name` varchar(50) DEFAULT NULL,
  `att1` varchar(50) DEFAULT NULL,
  `att2` varchar(50) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `alerts`
--

INSERT INTO `alerts` (`alertID`, `itemCategory`, `type`, `name`, `att1`, `att2`) VALUES
(1, 'laptop', '', 'thinkpad', '', ''),
(2, 'laptop', 'i9core', 'inspiron5', '1000', '32');

-- --------------------------------------------------------

--
-- Table structure for table `assembled_cpu`
--

CREATE TABLE `assembled_cpu` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `storage` int(11) DEFAULT 0,
  `ram` varchar(50) NOT NULL DEFAULT '',
  `assembled_cpu_type` varchar(50) NOT NULL DEFAULT '',
  `itemID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `assembled_cpu`
--

INSERT INTO `assembled_cpu` (`name`, `storage`, `ram`, `assembled_cpu_type`, `itemID`) VALUES
('DellVostro3681', 500, '8', 'i3core4.4', 4),
('ASUSGT501', 1000, '16', 'i5core3.3', 5),
('HP-S01-aF1107', 2000, '32', 'i7core3.6', 6),
('poweredge', 2000, '32', 'i7core3.6', 11),
('optiplex', 1000, '16', 'i5core3.3', 13),
('as', 7, '8', 'i3core4.4', 15),
('Zevron', 2000, '16', 'i7core3.6', 16);

-- --------------------------------------------------------

--
-- Table structure for table `auction`
--

CREATE TABLE `auction` (
  `auctionID` int(11) NOT NULL,
  `endDate` datetime NOT NULL DEFAULT '2009-05-25 00:00:00',
  `valid` tinyint(1) NOT NULL DEFAULT 1,
  `reserve` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `auction`
--

INSERT INTO `auction` (`auctionID`, `endDate`, `valid`, `reserve`) VALUES
(1, '2022-05-26 00:00:00', 1, 40),
(2, '2022-05-27 00:00:00', 1, 40),
(3, '2022-05-28 00:00:00', 1, 40),
(4, '2022-05-15 00:00:00', 1, 40),
(5, '2022-05-16 14:12:12', 1, 40),
(6, '2022-05-17 00:00:00', 1, 40),
(7, '2022-08-25 00:00:00', 1, 40),
(8, '2022-09-25 00:00:00', 1, 40),
(9, '2022-01-25 00:00:00', 1, 40),
(10, '2022-05-21 12:12:00', 1, 100),
(11, '2022-05-21 00:12:00', 1, 5000),
(12, '2022-05-21 00:12:00', 1, 1000),
(13, '2015-03-04 11:11:00', 0, 8000),
(14, '2021-06-06 12:12:00', 0, 1000),
(15, '2022-01-20 00:11:00', 1, 100),
(16, '2022-06-14 14:12:00', 1, 4000);

-- --------------------------------------------------------

--
-- Table structure for table `bid`
--

CREATE TABLE `bid` (
  `amount` int(11) NOT NULL DEFAULT 0,
  `bidID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bid`
--

INSERT INTO `bid` (`amount`, `bidID`) VALUES
(15, 2),
(25, 3),
(35, 4),
(45, 5),
(55, 6),
(65, 7),
(75, 8),
(85, 9),
(100, 10),
(1000, 11),
(5000, 12),
(2000, 13),
(4000, 14),
(7000, 15),
(100, 16),
(4000, 17),
(2500, 18),
(5000, 19),
(1000, 20),
(6000, 21),
(7000, 22),
(9000, 23),
(9000, 24),
(4000, 25),
(5000, 26),
(1000, 27),
(6900, 28),
(50000, 29),
(50000, 30);

-- --------------------------------------------------------

--
-- Table structure for table `bidfor`
--

CREATE TABLE `bidfor` (
  `auctionID` int(11) NOT NULL DEFAULT 0,
  `bidID` int(11) NOT NULL DEFAULT 0,
  `itemID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `bidfor`
--

INSERT INTO `bidfor` (`auctionID`, `bidID`, `itemID`) VALUES
(1, 11, 1),
(1, 15, 1),
(2, 14, 2),
(2, 17, 2),
(3, 20, 3),
(3, 28, 3),
(4, 16, 4),
(4, 27, 4),
(5, 12, 5),
(5, 30, 5),
(6, 19, 6),
(6, 29, 6),
(7, 22, 7),
(7, 24, 7),
(8, 23, 8),
(9, 13, 9),
(9, 21, 9),
(10, 25, 10),
(10, 26, 10),
(13, 18, 13);

-- --------------------------------------------------------

--
-- Table structure for table `buyer`
--

CREATE TABLE `buyer` (
  `auctionID` int(11) NOT NULL DEFAULT 0,
  `email` varchar(50) NOT NULL DEFAULT '',
  `itemID` int(11) NOT NULL DEFAULT 0,
  `automatic` tinyint(1) DEFAULT 0,
  `increment` int(11) DEFAULT 0,
  `limit` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `buyer`
--

INSERT INTO `buyer` (`auctionID`, `email`, `itemID`, `automatic`, `increment`, `limit`) VALUES
(1, 'hems@gmail.com', 1, 0, 0, 0),
(1, 'kohli@gmail.com', 1, 0, 0, 0),
(1, 'mithesh@gmail.com', 1, 0, 0, 0),
(2, 'hems@gmail.com', 2, 0, 0, 0),
(2, 'kohli@gmail.com', 2, 0, 0, 0),
(3, 'hems@gmail.com', 3, 0, 0, 0),
(3, 'rubak@gmail.com', 3, 0, 0, 0),
(4, 'hems@gmail.com', 4, 0, 0, 0),
(4, 'kohli@gmail.com', 4, 0, 0, 0),
(4, 'rubak@gmail.com', 4, 0, 0, 0),
(5, 'hems@gmail.com', 5, 0, 0, 0),
(6, 'hems@gmail.com', 6, 0, 0, 0),
(7, 'hems@gmail.com', 7, 0, 0, 0),
(7, 'rubak@gmail.com', 7, 0, 0, 0),
(8, 'hems@gmail.com', 8, 0, 0, 0),
(9, 'hems@gmail.com', 9, 0, 0, 0),
(10, 'rubak@gmail.com', 10, 0, 0, 0),
(13, 'rubak@gmail.com', 13, 0, 0, 0);

-- --------------------------------------------------------

--
-- Table structure for table `hasalerts`
--

CREATE TABLE `hasalerts` (
  `alertID` int(11) NOT NULL DEFAULT 0,
  `email` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `hasbid`
--

CREATE TABLE `hasbid` (
  `email` varchar(50) NOT NULL DEFAULT '',
  `bidID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `hasbid`
--

INSERT INTO `hasbid` (`email`, `bidID`) VALUES
('hems@gmail.com', 14),
('hems@gmail.com', 19),
('hems@gmail.com', 20),
('hems@gmail.com', 21),
('hems@gmail.com', 23),
('hems@gmail.com', 29),
('kohli@gmail.com', 15),
('kohli@gmail.com', 16),
('kohli@gmail.com', 17),
('rubak@gmail.com', 18),
('rubak@gmail.com', 22),
('rubak@gmail.com', 24),
('rubak@gmail.com', 25),
('rubak@gmail.com', 26),
('rubak@gmail.com', 27),
('rubak@gmail.com', 28);

-- --------------------------------------------------------

--
-- Table structure for table `item`
--

CREATE TABLE `item` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `itemID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `item`
--

INSERT INTO `item` (`name`, `itemID`) VALUES
('RedmiNote6', 1),
('iPhone13', 2),
('Oneplus6T', 3),
('DellVostro3681', 4),
('ASUSGT501', 5),
('HP-S01-aF1107', 6),
('thinkpad', 7),
('inspiron5', 8),
('micromax3t', 9),
('acer', 10),
('poweredge', 11),
('realme3P', 12),
('optiplex', 13),
('alienware', 14),
('as', 15),
('Zevron', 16);

-- --------------------------------------------------------

--
-- Table structure for table `itemssold`
--

CREATE TABLE `itemssold` (
  `auctionID` int(11) NOT NULL DEFAULT 0,
  `itemID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `itemssold`
--

INSERT INTO `itemssold` (`auctionID`, `itemID`) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 4),
(5, 5),
(6, 6),
(7, 7),
(8, 8),
(9, 9),
(10, 10),
(11, 11),
(12, 12),
(13, 13),
(14, 14),
(15, 15),
(16, 16);

-- --------------------------------------------------------

--
-- Table structure for table `laptop`
--

CREATE TABLE `laptop` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `storage` int(11) DEFAULT 0,
  `ram` int(11) DEFAULT 0,
  `laptop_type` varchar(50) NOT NULL DEFAULT '',
  `itemID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `laptop`
--

INSERT INTO `laptop` (`name`, `storage`, `ram`, `laptop_type`, `itemID`) VALUES
('thinkpad', 256, 8, 'i7core', 7),
('inspiron5', 1000, 32, 'i9core', 8),
('micromax3t', 500, 16, 'i3core', 9),
('acer', 1000, 8, 'i7core', 10),
('alienware', 22, 4, 'i9core', 14);

-- --------------------------------------------------------

--
-- Table structure for table `mobile`
--

CREATE TABLE `mobile` (
  `name` varchar(50) NOT NULL DEFAULT '',
  `megapixels` int(11) DEFAULT 0,
  `ram` int(11) DEFAULT 0,
  `mobile_type` varchar(50) NOT NULL DEFAULT '',
  `itemID` int(11) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mobile`
--

INSERT INTO `mobile` (`name`, `megapixels`, `ram`, `mobile_type`, `itemID`) VALUES
('RedmiNote6', 24, 4, 'Android', 1),
('iPhone13', 48, 6, 'apple', 2),
('Oneplus6T', 64, 8, 'oxygen', 3),
('realme3P', 48, 8, 'Android', 12);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `notificationID` int(11) NOT NULL,
  `email` varchar(50) NOT NULL DEFAULT '',
  `itemID` int(11) DEFAULT 0,
  `notification_text` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `questions`
--

CREATE TABLE `questions` (
  `question` varchar(50) NOT NULL DEFAULT '',
  `answer` varchar(50) DEFAULT NULL,
  `qID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `questions`
--

INSERT INTO `questions` (`question`, `answer`, `qID`) VALUES
('Redmi - What type of Display?', 'No answer', 1),
('Redmi - Is warranty claimable?', 'No answer', 2),
('Iphone - Will debit card acceptable for payment?', 'Yes', 3),
('iphone - Camera Quality?', 'No answer', 4),
('Oneplus - does this have warranty for 2 years?', 'Yes', 5),
('oneplus - Does support wireless charging ?', 'No answer', 6),
('DellVostro - Does this have Cd driver?', 'No answer', 7),
('DellVostro - Does this have world wide shipping?', 'No answer', 8),
('Asus - how many CPU core are there?', 'No answer', 9),
('Asus - Do we have refund options?', 'No answer', 10),
('HP S01 - Does this have windows?', 'Yes', 11),
('HP S01 - is CPU available for life time?', 'No answer', 12),
('Thinkpad - Ms office pre installed?', 'Yes', 13),
('Thinkpad - Will touch works properly?', 'No answer', 14),
('Inspiron - Do this have ssd slots?', 'No answer', 15),
('Inspiron - Do This have numberic keypad?', 'No answer', 16),
('Alienware - Does this have shipping cost?', 'No answer', 17),
('Alienware - Does this have 2tb HDD?', 'Yes', 18);

-- --------------------------------------------------------

--
-- Table structure for table `rep`
--

CREATE TABLE `rep` (
  `email` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `rep`
--

INSERT INTO `rep` (`email`) VALUES
('anirudh@gmail.com');

-- --------------------------------------------------------

--
-- Table structure for table `seller`
--

CREATE TABLE `seller` (
  `auctionID` int(11) NOT NULL DEFAULT 0,
  `email` varchar(50) NOT NULL DEFAULT '',
  `itemID` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `seller`
--

INSERT INTO `seller` (`auctionID`, `email`, `itemID`) VALUES
(1, 'rubak@gmail.com', 1),
(2, 'kohli@gmail.com', 2),
(3, 'rubak@gmail.com', 3),
(4, 'kohli@gmail.com', 4),
(5, 'rubak@gmail.com', 5),
(6, 'kohli@gmail.com', 6),
(7, 'rubak@gmail.com', 7),
(8, 'kohli@gmail.com', 8),
(9, 'mithesh@gmail.com', 9),
(10, 'hems@gmail.com', 10),
(11, 'hems@gmail.com', 11),
(12, 'hems@gmail.com', 12),
(13, 'mithesh@gmail.com', 13),
(14, 'rubak@gmail.com', 14),
(15, 'mithesh@gmail.com', 15),
(16, 'mithesh@gmail.com', 16);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `email` varchar(50) NOT NULL DEFAULT '',
  `username` varchar(50) NOT NULL DEFAULT '',
  `password` varchar(50) NOT NULL DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`email`, `username`, `password`) VALUES
('anirudh@gmail.com', 'anirudh', '123'),
('dhoni@gmail.com', 'Dhoni', '123'),
('hems@gmail.com', 'Hemanth', '123'),
('kohli@gmail.com', 'Kohli', '123'),
('mithesh@gmail.com', 'Mithesh', '123'),
('rubak@gmail.com', 'Rubak', '123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `alerts`
--
ALTER TABLE `alerts`
  ADD PRIMARY KEY (`alertID`);

--
-- Indexes for table `assembled_cpu`
--
ALTER TABLE `assembled_cpu`
  ADD KEY `itemID` (`itemID`);

--
-- Indexes for table `auction`
--
ALTER TABLE `auction`
  ADD PRIMARY KEY (`auctionID`);

--
-- Indexes for table `bid`
--
ALTER TABLE `bid`
  ADD PRIMARY KEY (`bidID`);

--
-- Indexes for table `bidfor`
--
ALTER TABLE `bidfor`
  ADD PRIMARY KEY (`auctionID`,`bidID`,`itemID`),
  ADD KEY `bidID` (`bidID`),
  ADD KEY `itemID` (`itemID`);

--
-- Indexes for table `buyer`
--
ALTER TABLE `buyer`
  ADD PRIMARY KEY (`auctionID`,`email`,`itemID`),
  ADD KEY `email` (`email`),
  ADD KEY `itemID` (`itemID`);

--
-- Indexes for table `hasalerts`
--
ALTER TABLE `hasalerts`
  ADD PRIMARY KEY (`alertID`,`email`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `hasbid`
--
ALTER TABLE `hasbid`
  ADD PRIMARY KEY (`email`,`bidID`),
  ADD KEY `bidID` (`bidID`);

--
-- Indexes for table `item`
--
ALTER TABLE `item`
  ADD PRIMARY KEY (`itemID`);

--
-- Indexes for table `itemssold`
--
ALTER TABLE `itemssold`
  ADD PRIMARY KEY (`auctionID`,`itemID`),
  ADD KEY `itemID` (`itemID`);

--
-- Indexes for table `laptop`
--
ALTER TABLE `laptop`
  ADD KEY `itemID` (`itemID`);

--
-- Indexes for table `mobile`
--
ALTER TABLE `mobile`
  ADD KEY `itemID` (`itemID`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`notificationID`),
  ADD KEY `email` (`email`),
  ADD KEY `itemID` (`itemID`);

--
-- Indexes for table `questions`
--
ALTER TABLE `questions`
  ADD PRIMARY KEY (`qID`);

--
-- Indexes for table `rep`
--
ALTER TABLE `rep`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `seller`
--
ALTER TABLE `seller`
  ADD PRIMARY KEY (`auctionID`,`email`,`itemID`),
  ADD KEY `email` (`email`),
  ADD KEY `itemID` (`itemID`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `alerts`
--
ALTER TABLE `alerts`
  MODIFY `alertID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `auction`
--
ALTER TABLE `auction`
  MODIFY `auctionID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `bid`
--
ALTER TABLE `bid`
  MODIFY `bidID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=31;

--
-- AUTO_INCREMENT for table `item`
--
ALTER TABLE `item`
  MODIFY `itemID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `notificationID` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `questions`
--
ALTER TABLE `questions`
  MODIFY `qID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admin`
--
ALTER TABLE `admin`
  ADD CONSTRAINT `admin_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `assembled_cpu`
--
ALTER TABLE `assembled_cpu`
  ADD CONSTRAINT `assembled_cpu_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`);

--
-- Constraints for table `bidfor`
--
ALTER TABLE `bidfor`
  ADD CONSTRAINT `bidfor_ibfk_1` FOREIGN KEY (`auctionID`) REFERENCES `auction` (`auctionID`),
  ADD CONSTRAINT `bidfor_ibfk_2` FOREIGN KEY (`bidID`) REFERENCES `bid` (`bidID`),
  ADD CONSTRAINT `bidfor_ibfk_3` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`);

--
-- Constraints for table `buyer`
--
ALTER TABLE `buyer`
  ADD CONSTRAINT `buyer_ibfk_1` FOREIGN KEY (`auctionID`) REFERENCES `auction` (`auctionID`),
  ADD CONSTRAINT `buyer_ibfk_2` FOREIGN KEY (`email`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `buyer_ibfk_3` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`);

--
-- Constraints for table `hasalerts`
--
ALTER TABLE `hasalerts`
  ADD CONSTRAINT `hasalerts_ibfk_1` FOREIGN KEY (`alertID`) REFERENCES `alerts` (`alertID`),
  ADD CONSTRAINT `hasalerts_ibfk_2` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `hasbid`
--
ALTER TABLE `hasbid`
  ADD CONSTRAINT `hasbid_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `hasbid_ibfk_2` FOREIGN KEY (`bidID`) REFERENCES `bid` (`bidID`);

--
-- Constraints for table `itemssold`
--
ALTER TABLE `itemssold`
  ADD CONSTRAINT `itemssold_ibfk_1` FOREIGN KEY (`auctionID`) REFERENCES `auction` (`auctionID`),
  ADD CONSTRAINT `itemssold_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`);

--
-- Constraints for table `laptop`
--
ALTER TABLE `laptop`
  ADD CONSTRAINT `laptop_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`);

--
-- Constraints for table `mobile`
--
ALTER TABLE `mobile`
  ADD CONSTRAINT `mobile_ibfk_1` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`);

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`);

--
-- Constraints for table `rep`
--
ALTER TABLE `rep`
  ADD CONSTRAINT `rep_ibfk_1` FOREIGN KEY (`email`) REFERENCES `users` (`email`);

--
-- Constraints for table `seller`
--
ALTER TABLE `seller`
  ADD CONSTRAINT `seller_ibfk_1` FOREIGN KEY (`auctionID`) REFERENCES `auction` (`auctionID`),
  ADD CONSTRAINT `seller_ibfk_2` FOREIGN KEY (`email`) REFERENCES `users` (`email`),
  ADD CONSTRAINT `seller_ibfk_3` FOREIGN KEY (`itemID`) REFERENCES `item` (`itemID`);

DELIMITER $$
--
-- Events
--
CREATE DEFINER=`root`@`localhost` EVENT `check_if_auction_is_valid` ON SCHEDULE EVERY 10 SECOND STARTS '2022-01-08 11:36:31' ON COMPLETION NOT PRESERVE ENABLE DO UPDATE `auction` 
        SET `valid` = FALSE
        WHERE `endDate` < SYSDATE()$$

DELIMITER ;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
