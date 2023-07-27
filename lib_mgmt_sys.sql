-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 27, 2023 at 01:11 PM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.2.0

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `lib_mgmt_sys`
--

-- --------------------------------------------------------

--
-- Table structure for table `book_list_master`
--

CREATE TABLE `book_list_master` (
  `book_id` int(10) NOT NULL,
  `book_name` varchar(100) NOT NULL,
  `book_author` varchar(100) NOT NULL,
  `book_pub` varchar(100) NOT NULL,
  `book_isbn` bigint(13) NOT NULL,
  `book_rent_price` int(4) NOT NULL,
  `book_total_qty` int(3) NOT NULL,
  `book_avlb_qty` int(3) NOT NULL,
  `book_status` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `book_rent_master`
--

CREATE TABLE `book_rent_master` (
  `transac_num` int(10) NOT NULL,
  `renter_name` varchar(100) NOT NULL,
  `renter_age` int(2) NOT NULL,
  `renting_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `prm_return_date` datetime NOT NULL,
  `return_date` datetime NOT NULL,
  `rent_status` tinyint(1) NOT NULL,
  `address_line1` text NOT NULL,
  `address_line2` text NOT NULL,
  `pincode` int(6) NOT NULL,
  `renter_cont` bigint(12) NOT NULL,
  `renter_email` varchar(50) NOT NULL,
  `book_id` int(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `book_list_master`
--
ALTER TABLE `book_list_master`
  ADD PRIMARY KEY (`book_id`),
  ADD UNIQUE KEY `book_id` (`book_id`),
  ADD UNIQUE KEY `book_isbn` (`book_isbn`);

--
-- Indexes for table `book_rent_master`
--
ALTER TABLE `book_rent_master`
  ADD PRIMARY KEY (`transac_num`),
  ADD KEY `FK_BookID` (`book_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `book_list_master`
--
ALTER TABLE `book_list_master`
  MODIFY `book_id` int(10) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `book_rent_master`
--
ALTER TABLE `book_rent_master`
  MODIFY `transac_num` int(10) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `book_rent_master`
--
ALTER TABLE `book_rent_master`
  ADD CONSTRAINT `FK_BookID` FOREIGN KEY (`book_id`) REFERENCES `book_list_master` (`book_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
