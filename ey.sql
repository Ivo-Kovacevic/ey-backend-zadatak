-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 03, 2023 at 11:06 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `ey`
--

-- --------------------------------------------------------

--
-- Table structure for table `tokens`
--

CREATE TABLE `tokens` (
  `id` int(11) NOT NULL,
  `token` varchar(255) NOT NULL,
  `used` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `tokens`
--

INSERT INTO `tokens` (`id`, `token`, `used`) VALUES
(1, 'ctle6QYEMzfA9c5jvGZEKTMHHVdbVMY0', 1),
(2, 'gxb2SrqoLtgyczrOxtkdiQz1p7ffECq1', 0),
(12, '4xrjJmvDMUhakxtNqfS8xvo37JfXZ2bg', 0),
(13, '5hEhNSUmOOxNLTTAYY3C8DehVBGqT3Xi', 0),
(14, 'VLaTFlIMRxmO10g8dJ6KZdST73Z2lFB0', 1),
(15, 'RScOS5RHPdgcCOlvM1535MgTFk8eFuGF', 0),
(16, 'UGNCvep3ukTu7YH0Ig4mX3vJ8CQmpBna', 0);

-- --------------------------------------------------------

--
-- Table structure for table `vouchers`
--

CREATE TABLE `vouchers` (
  `voucher_number` int(5) NOT NULL,
  `voucher_provider` char(3) NOT NULL,
  `voucher_amount` decimal(3,1) NOT NULL,
  `expires_at` datetime NOT NULL,
  `used` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `vouchers`
--

INSERT INTO `vouchers` (`voucher_number`, `voucher_provider`, `voucher_amount`, `expires_at`, `used`) VALUES
(12345, 'foo', '10.0', '2021-09-29 13:00:00', 0),
(12564, 'bar', '10.0', '2024-10-10 13:00:00', 1),
(23642, 'bar', '20.0', '2021-09-29 13:00:00', 0),
(43256, 'bar', '10.0', '2024-10-10 13:00:00', 0),
(52543, 'foo', '10.0', '2024-10-10 13:00:00', 1),
(67567, 'foo', '20.0', '2024-10-10 13:00:00', 0),
(67890, 'bar', '20.0', '2024-09-29 13:00:00', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tokens`
--
ALTER TABLE `tokens`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `vouchers`
--
ALTER TABLE `vouchers`
  ADD PRIMARY KEY (`voucher_number`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tokens`
--
ALTER TABLE `tokens`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
COMMIT;
