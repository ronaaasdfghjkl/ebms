-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 07, 2025 at 03:17 PM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.0.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `ebms`
--

-- --------------------------------------------------------

--
-- Table structure for table `announcements`
--

CREATE TABLE `announcements` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `type` enum('payment','general','maintenance','urgent') DEFAULT 'general',
  `payment_qr_code` varchar(255) DEFAULT NULL,
  `bank_account` varchar(100) DEFAULT NULL,
  `gcash_number` varchar(20) DEFAULT NULL,
  `created_by` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `maintenance`
--

CREATE TABLE `maintenance` (
  `id` int(11) NOT NULL,
  `boarder_id` varchar(20) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `issue_type` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `status` enum('not started','ongoing','completed') DEFAULT 'not started',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `completed_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` int(11) NOT NULL,
  `boarder_id` varchar(20) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `month_covered` varchar(20) NOT NULL,
  `mode_of_payment` varchar(50) NOT NULL,
  `reference_number` varchar(100) DEFAULT NULL,
  `receipt_image` varchar(255) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `payment_date` timestamp NOT NULL DEFAULT current_timestamp(),
  `admin_notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `payments`
--

INSERT INTO `payments` (`id`, `boarder_id`, `amount`, `month_covered`, `mode_of_payment`, `reference_number`, `receipt_image`, `status`, `payment_date`, `admin_notes`) VALUES
(1, 'B20254087', 5000.00, 'November 2025', 'Cash', '564565', 'receipt_B20254087_1762523061.jpg', 'pending', '2025-11-07 13:44:21', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `rooms`
--

CREATE TABLE `rooms` (
  `id` int(11) NOT NULL,
  `room_number` varchar(10) NOT NULL,
  `bed_type` varchar(50) NOT NULL,
  `bathroom_type` varchar(50) NOT NULL,
  `status` varchar(20) DEFAULT 'Available',
  `monthly_rent` decimal(10,2) NOT NULL,
  `cooling_type` varchar(50) DEFAULT NULL,
  `wifi_access` varchar(50) DEFAULT NULL,
  `kitchen_access` varchar(50) DEFAULT NULL,
  `laundry_access` varchar(50) DEFAULT NULL,
  `main_img` varchar(255) DEFAULT NULL,
  `images` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `image_path` varchar(255) DEFAULT ''
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `rooms`
--

INSERT INTO `rooms` (`id`, `room_number`, `bed_type`, `bathroom_type`, `status`, `monthly_rent`, `cooling_type`, `wifi_access`, `kitchen_access`, `laundry_access`, `main_img`, `images`, `created_at`, `image_path`) VALUES
(1, '101', 'Bunk Bed', 'Private', 'Reserved', 5000.00, 'A/C', 'Available', 'Private', 'Shared', 'images/room1.jpg', 'images/room1-1.jpg,images/room1-2.jpg', '2025-11-06 21:08:49', 'uploads/rooms/room_101_1762463435.jpg'),
(2, '102', 'Single Bed', 'Shared', 'Available', 4000.00, 'Fan', 'Available', 'Shared', 'Shared', 'images/room2.jpg', 'images/room2-1.jpg,images/room2-2.jpg', '2025-11-06 21:08:49', 'uploads/rooms/room_102_1762463442.jpg'),
(3, '103', 'Double Bed', 'Private', 'Available', 6000.00, 'A/C', 'Available', 'Private', 'Private', 'images/room3.jpg', 'images/room3-1.jpg,images/room3-2.jpg', '2025-11-06 21:08:49', 'uploads/rooms/room_103_1762463448.jpg'),
(4, '104', 'Single Bed', 'Private', 'Available', 4500.00, 'A/C', 'Available', 'Shared', 'Shared', 'images/room4.jpg', 'images/room4-1.jpg,images/room4-2.jpg', '2025-11-06 21:08:49', 'uploads/rooms/room_104_1762463454.jpg'),
(5, '105', 'Bunk Bed', 'Shared', 'Available', 3500.00, 'Fan', 'Available', 'Shared', 'Shared', 'images/room5.jpg', 'images/room5-1.jpg,images/room5-2.jpg', '2025-11-06 21:08:49', 'uploads/rooms/room_105_1762463458.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `boarder_id` varchar(20) DEFAULT NULL,
  `fname` varchar(50) NOT NULL,
  `mname` varchar(50) DEFAULT NULL,
  `lname` varchar(50) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `age` int(11) NOT NULL,
  `address` text NOT NULL,
  `guardian_fullname` varchar(100) NOT NULL,
  `guardian_relationship` varchar(50) NOT NULL,
  `guardian_contact` varchar(20) NOT NULL,
  `guardian_email` varchar(100) DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `role` enum('boarder','admin') DEFAULT 'boarder',
  `profile_picture` varchar(255) DEFAULT NULL,
  `room_number` varchar(10) DEFAULT NULL,
  `status` enum('pending','approved','rejected') DEFAULT 'pending',
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `boarder_id`, `fname`, `mname`, `lname`, `email`, `contact`, `age`, `address`, `guardian_fullname`, `guardian_relationship`, `guardian_contact`, `guardian_email`, `password`, `role`, `profile_picture`, `room_number`, `status`, `created_at`) VALUES
(1, 'ADMIN001', 'System', NULL, 'Administrator', 'admin@ebms.com', '0000000000', 30, 'System Address', 'N/A', 'N/A', '0000000000', NULL, '$2y$10$J3KZAXuJoGf4UmhaQunA8Og560lsjDyPQqQk9O8hijaZ7TRaw1fKe', 'admin', NULL, NULL, 'approved', '2025-11-06 21:08:49'),
(2, 'B20254087', 'rona', 'apil', 'tuccalay', 'tuccalayrona@gmail.com', '09887654532', 20, 'gonzaga, cagayan', 'ja', 'Friend', '098283273723', '', '$2y$10$rhbaARhC8j3.og3xSw8DOuAum0ZPXsC.QBQUYEw2NS9EWK0k8he9O', 'boarder', NULL, '101', 'approved', '2025-11-06 21:18:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `announcements`
--
ALTER TABLE `announcements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boarder_id` (`boarder_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `boarder_id` (`boarder_id`);

--
-- Indexes for table `rooms`
--
ALTER TABLE `rooms`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room_number` (`room_number`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `boarder_id` (`boarder_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `announcements`
--
ALTER TABLE `announcements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `maintenance`
--
ALTER TABLE `maintenance`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `rooms`
--
ALTER TABLE `rooms`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `announcements`
--
ALTER TABLE `announcements`
  ADD CONSTRAINT `announcements_ibfk_1` FOREIGN KEY (`created_by`) REFERENCES `users` (`boarder_id`);

--
-- Constraints for table `maintenance`
--
ALTER TABLE `maintenance`
  ADD CONSTRAINT `maintenance_ibfk_1` FOREIGN KEY (`boarder_id`) REFERENCES `users` (`boarder_id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_ibfk_1` FOREIGN KEY (`boarder_id`) REFERENCES `users` (`boarder_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
