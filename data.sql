-- phpMyAdmin SQL Dump
-- version 5.1.1deb5ubuntu1
-- https://www.phpmyadmin.net/
--
-- Host: localhost
-- Generation Time: Feb 07, 2023 at 05:33 PM
-- Server version: 10.6.11-MariaDB-0ubuntu0.22.04.1
-- PHP Version: 8.1.2-1ubuntu2.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `db`
--

-- --------------------------------------------------------

--
-- Table structure for table `ip_table`
--

CREATE TABLE `ip_table` (
  `id_location` int(11) NOT NULL,
  `ip_plc` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `ip_hmi` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `id_machine` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `port` int(11) NOT NULL,
  `websocket_port` int(11) NOT NULL,
  `active_recipe_id` int(11) NOT NULL,
  `port_udp` int(11) NOT NULL,
  `port_http` int(11) NOT NULL,
  `active_form_id` int(11) NOT NULL,
  `press` tinyint(4) NOT NULL DEFAULT 0,
  `plc_adc_corr` float NOT NULL,
  `robot_connected` tinyint(4) NOT NULL DEFAULT 0,
  `counter_available` int(11) NOT NULL DEFAULT 0,
  `pcc_version` int(11) NOT NULL,
  `anz_sens_1` tinyint(4) NOT NULL,
  `anz_sens_2` tinyint(4) NOT NULL,
  `conv_time_1` int(11) NOT NULL,
  `conv_time_2` int(11) NOT NULL,
  `s1_type` tinyint(4) NOT NULL,
  `s2_type` tinyint(4) NOT NULL,
  `p_difference` tinyint(4) NOT NULL,
  `pze_still` int(11) NOT NULL,
  `auf_list` varchar(200) NOT NULL,
  `bde_nr` varchar(105) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `test_machine` tinyint(4) NOT NULL,
  `order_of_machine` int(11) NOT NULL,
  `app_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `stillstand_signal` tinyint(4) NOT NULL COMMENT '0=no nodejs to connect to; 1= nodejs available',
  `daqtype` varchar(200) NOT NULL DEFAULT '' COMMENT 'blank=any, IO=shotio, PR=press',
  `daqlocation` varchar(255) NOT NULL,
  `daqtime` int(11) NOT NULL,
  `daqconf` text NOT NULL,
  `daq_machine_type` varchar(500) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT '',
  `is_press_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_shotio_active` tinyint(1) NOT NULL DEFAULT 0,
  `is_robot_active` tinyint(1) NOT NULL DEFAULT 0,
  `cavity` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `ip_table`
--

INSERT INTO `ip_table` (`id_location`, `ip_plc`, `ip_hmi`, `id_machine`, `port`, `websocket_port`, `active_recipe_id`, `port_udp`, `port_http`, `active_form_id`, `press`, `plc_adc_corr`, `robot_connected`, `counter_available`, `pcc_version`, `anz_sens_1`, `anz_sens_2`, `conv_time_1`, `conv_time_2`, `s1_type`, `s2_type`, `p_difference`, `pze_still`, `auf_list`, `bde_nr`, `test_machine`, `order_of_machine`, `app_type`, `stillstand_signal`, `daqtype`, `daqlocation`, `daqtime`, `daqconf`, `daq_machine_type`, `is_press_active`, `is_shotio_active`, `is_robot_active`, `cavity`) VALUES
(5, '192.168.1.43', '192.168.1.139_', '19', 0, 0, 1, 0, 9109, 8, 0, 1.011, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '3536,3225', '03142', 0, 5, 'SF', 0, '0', '', 0, '', '', 0, 0, 0, '1,1'),
(6, '192.168.1.60', '192.168.1.33_', '85', 0, 0, 1, 0, 9109, 8, 0, 1.011, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '2490,3171,2494', '03D01', 0, 5, 'SF', 0, '0', '', 0, '', '', 0, 0, 0, '1,1,1'),
(7, '192.168.1.42', '', '18', 0, 0, 1, 0, 0, 8, 0, 1.011, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '79739', '03D02', 0, 5, 'SF', 0, '0', '', 0, '', '', 0, 0, 0, '4'),
(12, '192.168.1.42', '', '123', 0, 0, 1, 0, 0, 8, 0, 1.011, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '79739', '03368', 0, 5, 'SF', 0, '0', '', 0, '', '', 0, 0, 0, '4'),
(16, '192.168.1.4', '', '167', 0, 0, 1, 0, 0, 8, 0, 1.011, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '79826', '03325', 0, 5, 'SF', 0, '0', '', 0, '', '', 0, 0, 0, '6'),
(31, '192.168.1.2', '', '168', 0, 0, 1, 0, 0, 8, 0, 1.011, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '09P01', 0, 5, 'SFR', 0, '0', '', 0, '', '', 0, 0, 0, '1'),
(32, '192.168.11.123', '', '40', 0, 0, 1, 0, 0, 8, 0, 1.011, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', 'SF11-65', 0, 5, 'SFR', 0, '', '', 0, '', '', 0, 0, 0, '1'),
(34, '192.168.11.13', '', '41', 0, 0, 1, 0, 0, 8, 0, 1.011, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, '0', '09023', 0, 5, 'SFR', 0, '', '', 0, '', '', 0, 0, 0, '1');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `ip_table`
--
ALTER TABLE `ip_table`
  ADD PRIMARY KEY (`id_location`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `ip_table`
--
ALTER TABLE `ip_table`
  MODIFY `id_location` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
