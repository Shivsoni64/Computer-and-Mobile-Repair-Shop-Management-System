-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2024 at 05:12 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `rsms_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `client_list`
--

CREATE TABLE `client_list` (
  `id` int(30) NOT NULL,
  `firstname` text NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` text NOT NULL,
  `contact` varchar(100) NOT NULL,
  `email` text NOT NULL,
  `address` text NOT NULL,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `client_list`
--

INSERT INTO `client_list` (`id`, `firstname`, `middlename`, `lastname`, `contact`, `email`, `address`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'rahul', '', 'soni', '09123456789', 'rahul@sample.com', 'Block 6, Lot 23, Here City, Anywhere 2306', 0, '2024-10-27 10:10:55', NULL),
(2, 'ram', '', 'singh', '09123456789', 'ram@sample.com', 'This is a sample address pf the customer.', 0, '2024-10-27 10:33:18', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `message_list`
--

CREATE TABLE `message_list` (
  `id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `contact` text NOT NULL,
  `email` text NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `message_list`
--

INSERT INTO `message_list` (`id`, `fullname`, `contact`, `email`, `message`, `status`, `date_created`) VALUES
(1, 'john', '09123456789', 'john@sample.com', 'This is a sample message only', 1, '2024-10-01 16:01:11'),
(2, 'aman', '+91-6267125222', 'aman.1@gmail.com', 'sample', 0, '2024-10-06 14:25:58');

-- --------------------------------------------------------

--
-- Table structure for table `repair_list`
--

CREATE TABLE `repair_list` (
  `id` int(30) NOT NULL,
  `code` varchar(50) NOT NULL,
  `client_id` int(30) NOT NULL,
  `remarks` text DEFAULT NULL,
  `total_amount` float NOT NULL DEFAULT 0,
  `payment_status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0= Unpaid, 1= paid',
  `status` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = pending, 1= Approved, 2 = In-Progress, 3 = Checking, 4 = Done, 5= Cancelled ',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updadted` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repair_list`
--

INSERT INTO `repair_list` (`id`, `code`, `client_id`, `remarks`, `total_amount`, `payment_status`, `status`, `date_created`, `date_updadted`) VALUES
(1, 'RSMS-2021120001', 1, 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Vestibulum faucibus id tellus in molestie. Integer risus diam, bibendum vitae imperdiet id, feugiat in dolor. Praesent porta bibendum lobortis. Praesent quis venenatis nibh. Nunc mattis, enim non placerat placerat, elit mi semper diam, et convallis leo est non ex. Sed et malesuada sapien. Proin risus orci, vulputate aliquet sapien eu, tempus ultricies nibh. Etiam varius turpis vitae placerat feugiat. Interdum et malesuada fames ac ante ipsum primis in faucibus. Quisque et interdum enim, ac rutrum dui. Fusce faucibus diam nec mauris dictum tempus ut eu turpis.', 3650, 1, 4, '2024-09-03 14:37:53', '2024-10-15 09:18:01'),
(4, 'RSMS-2024100001', 2, '', 500, 0, 1, '2024-10-15 09:20:15', '2024-10-15 09:21:34');

-- --------------------------------------------------------

--
-- Table structure for table `repair_materials`
--

CREATE TABLE `repair_materials` (
  `repair_id` int(30) NOT NULL,
  `material` text NOT NULL,
  `cost` float NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repair_materials`
--

INSERT INTO `repair_materials` (`repair_id`, `material`, `cost`) VALUES
(1, 'Material 101', 1850);

-- --------------------------------------------------------

--
-- Table structure for table `repair_services`
--

CREATE TABLE `repair_services` (
  `repair_id` int(30) NOT NULL,
  `service_id` int(30) NOT NULL,
  `fee` float NOT NULL DEFAULT 0,
  `status` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `repair_services`
--

INSERT INTO `repair_services` (`repair_id`, `service_id`, `fee`, `status`) VALUES
(1, 1, 350, 0),
(1, 4, 1200, 0),
(1, 2, 250, 0),
(4, 3, 250, 0),
(4, 2, 250, 0);

-- --------------------------------------------------------

--
-- Table structure for table `service_list`
--

CREATE TABLE `service_list` (
  `id` int(30) NOT NULL,
  `service` text NOT NULL,
  `description` text NOT NULL,
  `cost` float NOT NULL DEFAULT 0,
  `delete_flag` tinyint(1) NOT NULL DEFAULT 0 COMMENT '0 = Active, 1 = Delete',
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `service_list`
--

INSERT INTO `service_list` (`id`, `service`, `description`, `cost`, `delete_flag`, `date_created`, `date_updated`) VALUES
(1, 'Hardware Cleaning', 'Cleaning hardware such as the CPUs. ', 350, 0, '2024-12-02 09:39:51', NULL),
(2, 'Mobile Reformatting', 'Mobile Reformatting', 250, 0, '2024-12-04 09:40:21', NULL),
(3, 'Mobile Reprogram', 'Mobile Reprogram', 250, 0, '2024-12-04 09:40:41', NULL),
(4, 'W10 OS Installation', 'Installing Licensed Windows 10 Operating System', 1200, 0, '2024-12-19 09:50:26', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Computer and Mobile Repair Shop Management System'),
(6, 'short_name', 'RSMS'),
(11, 'logo', 'uploads/logo-1640568130.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1640568273.png'),
(15, 'content', 'Array'),
(16, 'email', 'shivssoni55@gmail.com'),
(17, 'contact', '+91-6267132693'),
(18, 'from_time', '11:00'),
(19, 'to_time', '21:30'),
(20, 'address', '144411, Punjab');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Shiv', NULL, 'Soni', 'shiv', '2f8dd83a23b9ab0601e134123e9a0d9b', 'uploads/avatar-1.png?v=1639468007', NULL, 1, 1, '2024-01-11 14:02:37', '2024-11-05 09:39:44');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `client_list`
--
ALTER TABLE `client_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `message_list`
--
ALTER TABLE `message_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `repair_list`
--
ALTER TABLE `repair_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `client_id` (`client_id`);

--
-- Indexes for table `repair_materials`
--
ALTER TABLE `repair_materials`
  ADD KEY `repair_id` (`repair_id`);

--
-- Indexes for table `repair_services`
--
ALTER TABLE `repair_services`
  ADD KEY `repair_id` (`repair_id`),
  ADD KEY `service_id` (`service_id`);

--
-- Indexes for table `service_list`
--
ALTER TABLE `service_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `client_list`
--
ALTER TABLE `client_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `message_list`
--
ALTER TABLE `message_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `repair_list`
--
ALTER TABLE `repair_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `service_list`
--
ALTER TABLE `service_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `repair_list`
--
ALTER TABLE `repair_list`
  ADD CONSTRAINT `repair_list_ibfk_1` FOREIGN KEY (`client_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `repair_materials`
--
ALTER TABLE `repair_materials`
  ADD CONSTRAINT `repair_materials_ibfk_1` FOREIGN KEY (`repair_id`) REFERENCES `client_list` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `repair_services`
--
ALTER TABLE `repair_services`
  ADD CONSTRAINT `repair_services_ibfk_1` FOREIGN KEY (`repair_id`) REFERENCES `repair_list` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `repair_services_ibfk_2` FOREIGN KEY (`service_id`) REFERENCES `service_list` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
