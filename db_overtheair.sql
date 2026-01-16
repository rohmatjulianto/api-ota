-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Jan 16, 2026 at 08:40 AM
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
-- Database: `db_overtheair`
--

-- --------------------------------------------------------

--
-- Table structure for table `devices`
--

CREATE TABLE `devices` (
  `sn_devices` varchar(50) NOT NULL,
  `current_package` varchar(255) NOT NULL,
  `newest_package` varchar(255) NOT NULL,
  `registered_device_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `check_device_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `devices`
--

INSERT INTO `devices` (`sn_devices`, `current_package`, `newest_package`, `registered_device_at`, `check_device_at`) VALUES
('88181818', '', '', '2026-01-02 09:15:35', '2026-01-09 09:01:41'),
('9988800', '', '', '2026-01-09 08:32:49', '2026-01-09 09:01:41'),
('99999', '', '', '2026-01-02 13:32:32', '2026-01-09 09:01:41');

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `id_package` int(11) NOT NULL,
  `name_package` varchar(255) NOT NULL,
  `version_package` varchar(11) NOT NULL,
  `url_package` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `start_rollout_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`id_package`, `name_package`, `version_package`, `url_package`, `created_at`, `start_rollout_at`) VALUES
(1, 'ACASIA-PAYG-1.4.0(19)', '0', 'http://localhost:8081/files/ACASIA-PAYG-1.4.0(19).apk', '2025-12-27 11:08:42', '0000-00-00 00:00:00'),
(2, 'ACASIA-PAYG-1.4.0(19)', '0', 'http://localhost:8081/files/ACASIA-PAYG-1.4.0(19).apk', '2025-12-27 11:12:34', '0000-00-00 00:00:00'),
(3, 'ACASIA-PAYG-1.4.0(19)', '0', 'http://localhost:8081/files/ACASIA-PAYG-1.4.0(19).apk', '2025-12-27 11:13:48', '0000-00-00 00:00:00'),
(4, 'ACASIA-PAYG-1.4.0(19)', '0', '/assets/ACASIA-PAYG-1.4.0(19).apk', '2025-12-27 11:31:11', '0000-00-00 00:00:00'),
(5, 'Ciontek Safedroid OS APIs-20240808', '0', '/assets/Ciontek Safedroid OS APIs-20240808.zip', '2026-01-02 04:21:41', '0000-00-00 00:00:00'),
(6, 'CM30-Development-SDK-1.0.5-20240523', '0', '/assets/CM30-Development-SDK-1.0.5-20240523.zip', '2026-01-02 04:30:48', '0000-00-00 00:00:00'),
(7, 'CM30-Development-SDK-1.0.5-20240523', '0', '/assets/CM30-Development-SDK-1.0.5-20240523.zip', '2026-01-02 04:30:50', '0000-00-00 00:00:00'),
(8, 'LOGO AINO INDONESIA Color', '0', '/assets/LOGO AINO INDONESIA Color.png', '2026-01-02 07:33:35', '0000-00-00 00:00:00'),
(9, 'LOGO AINO INDONESIA Color', '0', '/assets/LOGO AINO INDONESIA Color.png', '2026-01-02 07:36:01', '0000-00-00 00:00:00'),
(10, 'LOGO AINO INDONESIA Color', '0', '/assets/LOGO AINO INDONESIA Color.png', '2026-01-02 07:37:02', '0000-00-00 00:00:00'),
(11, 'C5-2', '0', '/assets/C5-2.mp3', '2026-01-02 07:53:43', '0000-00-00 00:00:00'),
(12, 'AINO-TJ-v1.0.4(17)', '0', '/assets/AINO-TJ-v1.0.4(17).apk', '2026-01-02 07:53:57', '0000-00-00 00:00:00'),
(13, 'ACASIA-PAYG-1.4.0(19)', '19', '/assets/ACASIA-PAYG-1.4.0(19).apk', '2026-01-09 10:24:18', '2026-01-09 10:24:18'),
(14, 'ACASIA-PAYG-1.4.0(19)', '19', '/assets/ACASIA-PAYG-1.4.0(19).apk', '2026-01-09 10:25:23', '2026-01-09 10:25:23'),
(15, 'ACASIA-PAYG-1.4.0(19)', '19', '/assets/ACASIA-PAYG-1.4.0(19).apk', '2026-01-09 10:39:31', NULL),
(16, 'AINO-TJ-v1.0.3(16)', '16', '/assets/AINO-TJ-v1.0.3(16).apk', '2026-01-09 15:35:39', NULL),
(17, 'AINO-TJ-v1.0.2(15)', '15', '/assets/AINO-TJ-v1.0.2(15).apk', '2026-01-09 15:36:24', NULL),
(18, 'AINO-TJ-v1.0.3(16)', '16', '/assets/AINO-TJ-v1.0.3(16).zip', '2026-01-13 13:20:45', NULL),
(19, 'TRANS-JKT-1.2(3)-release', '3', '/assets/TRANS-JKT-1.2(3)-release.apk', '2026-01-13 13:23:35', NULL),
(20, 'AINO-TJ-v1.1.2(32)_FEKDI', '32', '/assets/AINO-TJ-v1.1.2(32)_FEKDI.zip', '2026-01-13 13:28:48', NULL),
(21, 'TRANS-JKT-1.0(1)-release', '1', '/assets/TRANS-JKT-1.0(1)-release.apk', '2026-01-13 13:31:01', NULL),
(22, 'AINO-TJ-v1.0.2(15)', '15', '/assets/AINO-TJ-v1.0.2(15).zip', '2026-01-13 13:40:01', NULL),
(23, 'AINO-TJ-v1.0.3(16)', '16', '/assets/AINO-TJ-v1.0.3(16).apk', '2026-01-14 01:37:06', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id_users` int(11) NOT NULL,
  `email` longtext DEFAULT NULL,
  `username` longtext DEFAULT NULL,
  `password` longtext DEFAULT NULL,
  `timestamp` longtext DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id_users`, `email`, `username`, `password`, `timestamp`) VALUES
(5, 'ju@mail.com', 'jo', 'ji', '2025-12-27 16:32:00'),
(6, 'ju@mail.com', '1jo', 'ji', '2025-12-27 16:32:17');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `devices`
--
ALTER TABLE `devices`
  ADD PRIMARY KEY (`sn_devices`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`id_package`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id_users`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `id_package` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id_users` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
