-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 24, 2025 at 08:42 PM
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
-- Database: `dream_study`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `bd_mobile` varchar(255) NOT NULL,
  `last_education` varchar(255) NOT NULL,
  `prefferred_country` varchar(255) NOT NULL,
  `pdf` varchar(255) DEFAULT NULL,
  `status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_status` varchar(255) NOT NULL DEFAULT 'pending',
  `payment_description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `name`, `email`, `bd_mobile`, `last_education`, `prefferred_country`, `pdf`, `status`, `payment_status`, `payment_description`, `created_at`, `updated_at`) VALUES
(1, 2, 'student', 'student@gmail.com', '123654778', 'bechelor', 'Australia', NULL, 'pending', 'success', 'ff', '2025-08-13 12:45:50', '2025-08-13 13:01:14');

-- --------------------------------------------------------

--
-- Table structure for table `cache`
--

CREATE TABLE `cache` (
  `key` varchar(255) NOT NULL,
  `value` mediumtext NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `cache`
--

INSERT INTO `cache` (`key`, `value`, `expiration`) VALUES
('laravel-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:75:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:12:\"booking-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:17:\"booking-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:12:\"booking-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:14:\"booking-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:14:\"booking-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:12:\"country-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:17:\"country-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:12:\"country-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:14:\"country-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:14:\"country-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:11:\"review-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:16:\"review-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:11:\"review-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:13:\"review-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:13:\"review-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:21:\"service-category-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:26:\"service-category-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:21:\"save-service-category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:23:\"update-service-category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:23:\"delete-service-category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:12:\"service-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:17:\"service-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:12:\"save-service\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:14:\"update-service\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:14:\"delete-service\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:12:\"student-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:17:\"student-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:12:\"student-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:14:\"student-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:14:\"student-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:20:\"success-stories-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:25:\"success-stories-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:20:\"success-stories-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:22:\"success-stories-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:22:\"success-stories-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:9:\"list-role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:14:\"role-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:11:\"create-role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:11:\"update-role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:11:\"delete-role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:9:\"list-user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:14:\"user-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:11:\"create-user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:11:\"update-user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:11:\"delete-user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:17:\"page-content-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:22:\"page-content-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:17:\"page-content-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:19:\"page-content-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:19:\"page-content-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:9:\"logo-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:14:\"logo-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:9:\"logo-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:11:\"logo-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:11:\"logo-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:15:\"university-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:20:\"university-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:15:\"university-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:17:\"university-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:17:\"university-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:19:\"country-detail-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:24:\"country-detail-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:19:\"country-detail-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:21:\"country-detail-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:21:\"country-detail-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:9:\"page-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:14:\"page-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:9:\"page-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:11:\"page-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:11:\"page-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:70;a:4:{s:1:\"a\";i:71;s:1:\"b\";s:13:\"carousel-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:71;a:4:{s:1:\"a\";i:72;s:1:\"b\";s:18:\"carousel-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:72;a:4:{s:1:\"a\";i:73;s:1:\"b\";s:13:\"carousel-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:73;a:4:{s:1:\"a\";i:74;s:1:\"b\";s:15:\"carousel-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:74;a:4:{s:1:\"a\";i:75;s:1:\"b\";s:15:\"carousel-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:1:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:10:\"superadmin\";s:1:\"c\";s:3:\"web\";}}}', 1756138719);

-- --------------------------------------------------------

--
-- Table structure for table `cache_locks`
--

CREATE TABLE `cache_locks` (
  `key` varchar(255) NOT NULL,
  `owner` varchar(255) NOT NULL,
  `expiration` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `carousels`
--

CREATE TABLE `carousels` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `rank` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `carousels`
--

INSERT INTO `carousels` (`id`, `rank`, `image`, `title`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, '1755088814.1754493615_success_3.jpg', 'DreamStudy', 'Book Your Dream', '2025-08-13 12:40:14', '2025-08-13 12:40:14'),
(2, 2, '1755088840.1755088276_1754379874_canada.avif', 'DreamStudy', 'Book Your Dream', '2025-08-13 12:40:40', '2025-08-13 12:40:40'),
(3, 3, '1755088868.1754380347_nederlands.jpg', 'DreamStudy', 'Book Your Dream', '2025-08-13 12:41:08', '2025-08-13 12:41:08');

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `country_flag` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `country_flag`, `rank`, `created_at`, `updated_at`) VALUES
(1, 'Australia', '1755085498.1754336011.Flag_of_Australia_(converted).svg.png', 1, '2025-08-13 11:44:59', '2025-08-13 11:44:59'),
(2, 'Belgium', '1755085537.1754336101.Flag_of_Belgium.svg.png', 2, '2025-08-13 11:45:37', '2025-08-13 11:45:37'),
(3, 'Italy', '1755085555.1754336184.Flag_of_Italy.svg.png', 3, '2025-08-13 11:45:55', '2025-08-13 11:45:55'),
(4, 'Cyprus', '1755085568.1754336252.Flag_of_Cyprus.svg.png', 4, '2025-08-13 11:46:08', '2025-08-13 11:46:08'),
(5, 'New Zealand', '1755085587.1754336299.Flag_of_New_Zealand.svg.png', 5, '2025-08-13 11:46:27', '2025-08-13 11:46:27');

-- --------------------------------------------------------

--
-- Table structure for table `country_details`
--

CREATE TABLE `country_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `key_points` longtext NOT NULL,
  `description` longtext NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `country_details`
--

INSERT INTO `country_details` (`id`, `country_id`, `image`, `title`, `key_points`, `description`, `created_at`, `updated_at`) VALUES
(1, 1, '1755085768_1754336806_australia.jpg', 'Study in Australia', '<p><span style=\"color: rgb(101, 101, 103);\">IELTS: 6.0-6.5</span></p><p><span style=\"color: rgb(101, 101, 103);\">Intakes: Jan, Sept</span></p><p><span style=\"color: rgb(101, 101, 103);\">Tuition Fees: 5-6 Lakhs</span></p><p><span style=\"color: rgb(101, 101, 103);\">MOi: Not Accepted</span></p><p><span style=\"color: rgb(101, 101, 103);\">Language: English</span></p><p><span style=\"color: rgb(101, 101, 103);\">Apply for Next Intake</span></p>', '<p>There are over 1,200 institutions and over 22,000 courses on offer for International students considering Australia as a destination.&nbsp;Importantly, Australian education institutions have an international reputation for excellence in many disciplines.</p><p>Some of the reasons for this are as follows:</p><ol><li>Institutions deliver practical and career-orientated training so graduates can be confident they have the skills demanded by employers.</li><li>Australia has a reputation as an innovative and research-intensive culture.</li><li>Academic staff are recruited from around the world and often are leading industry experts in their field.</li><li>Australian teachers are experienced in supervising students from many countries.</li><li>Each year student and staff exchange programs are forged from Australia’s international links with education institutions in the USA, UK, Canada, Europe and Asia.</li><li>Australia has a reputation for adopting new technologies at a faster rate than in most other countries and has one of the highest rates of Internet access in the world.</li><li>Facilities for teaching, training and research are world-class in terms of state-of-the-art laboratories and classrooms, outstanding libraries and modern technology.</li></ol><p><br></p>', '2025-08-13 11:49:28', '2025-08-13 11:49:28');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) NOT NULL,
  `connection` text NOT NULL,
  `queue` text NOT NULL,
  `payload` longtext NOT NULL,
  `exception` longtext NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `jobs`
--

CREATE TABLE `jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `queue` varchar(255) NOT NULL,
  `payload` longtext NOT NULL,
  `attempts` tinyint(3) UNSIGNED NOT NULL,
  `reserved_at` int(10) UNSIGNED DEFAULT NULL,
  `available_at` int(10) UNSIGNED NOT NULL,
  `created_at` int(10) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `job_batches`
--

CREATE TABLE `job_batches` (
  `id` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `total_jobs` int(11) NOT NULL,
  `pending_jobs` int(11) NOT NULL,
  `failed_jobs` int(11) NOT NULL,
  `failed_job_ids` longtext NOT NULL,
  `options` mediumtext DEFAULT NULL,
  `cancelled_at` int(11) DEFAULT NULL,
  `created_at` int(11) NOT NULL,
  `finished_at` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `logos`
--

CREATE TABLE `logos` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `site_favicon` varchar(255) DEFAULT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `fb_link` longtext DEFAULT NULL,
  `twitter_link` longtext DEFAULT NULL,
  `instagram_link` longtext DEFAULT NULL,
  `linkedin_link` longtext DEFAULT NULL,
  `youtube_link` longtext DEFAULT NULL,
  `about_banner_image` varchar(255) DEFAULT NULL,
  `about_hero_image` varchar(255) DEFAULT NULL,
  `about_content` longtext DEFAULT NULL,
  `booking_content` longtext DEFAULT NULL,
  `login_banner_image` varchar(255) DEFAULT NULL,
  `register_banner_image` varchar(255) DEFAULT NULL,
  `site_address` longtext DEFAULT NULL,
  `site_email` varchar(255) DEFAULT NULL,
  `site_phone` varchar(255) DEFAULT NULL,
  `site_fax` varchar(255) DEFAULT NULL,
  `service_banner_image` varchar(255) DEFAULT NULL,
  `contact_banner_image` varchar(255) DEFAULT NULL,
  `booking_banner_image` varchar(255) DEFAULT NULL,
  `verify_otp_banner_image` varchar(255) DEFAULT NULL,
  `verify_email_banner_image` varchar(255) DEFAULT NULL,
  `reset_password_banner_image` varchar(255) DEFAULT NULL,
  `google_map_link` varchar(255) DEFAULT NULL,
  `payment_image` varchar(255) DEFAULT NULL,
  `whatsapp_number` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logos`
--

INSERT INTO `logos` (`id`, `site_favicon`, `site_logo`, `fb_link`, `twitter_link`, `instagram_link`, `linkedin_link`, `youtube_link`, `about_banner_image`, `about_hero_image`, `about_content`, `booking_content`, `login_banner_image`, `register_banner_image`, `site_address`, `site_email`, `site_phone`, `site_fax`, `service_banner_image`, `contact_banner_image`, `booking_banner_image`, `verify_otp_banner_image`, `verify_email_banner_image`, `reset_password_banner_image`, `google_map_link`, `payment_image`, `whatsapp_number`, `created_at`, `updated_at`) VALUES
(1, '1755088276_1754380347_nederlands.jpg', '1756058949_1754333646_dremlandLogoWhite.png', NULL, NULL, NULL, NULL, NULL, '1756059760_1754380347_Belgium.jpg', '1755088276_1754493615_success_3.jpg', '<h2><strong><em>About US<span class=\"ql-cursor\">﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿﻿</span></em></strong></h2><p><br></p><p>Travel can be <strong>domestic</strong>, exploring different regions within one’s own country, or <strong>international</strong>, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.</p>', '<p>Travel can be <strong>domestic</strong>, exploring different regions within one’s own country, or <strong>international</strong>, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.</p>', '1756059760_1755088276_1754380347_denmark.jpg', '1755088276_1754380347_denmark.jpg', 'demo Address', 'demo@gmail.com', '123654789', NULL, '1755088276_1754380347_Sweden.jpg', '1756059760_1755088276_1754380347_nederlands.jpg', '1755088276_1754380347_Italy.jpg', '1755091477_1755086123.1755086114.1754378580.carousel-3.jpg', '1755088276_1754380347_Italy.jpg', '1755106998_1755085568.1754336252.Flag_of_Cyprus.svg.png', NULL, '1756059609_1754380347_dremlandLogo.png', '+8801732904423', '2025-08-13 12:31:16', '2025-08-24 18:41:17');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(1, '0001_01_01_000000_create_users_table', 1),
(2, '0001_01_01_000001_create_cache_table', 1),
(3, '0001_01_01_000002_create_jobs_table', 1),
(4, '2025_07_30_180843_create_bookings_table', 1),
(5, '2025_07_30_210533_create_countries_table', 1),
(6, '2025_07_30_210534_create_country_details_table', 1),
(7, '2025_07_31_151341_create_service_categories_table', 1),
(8, '2025_07_31_151431_create_services_table', 1),
(9, '2025_07_31_152036_create_success_stories_table', 1),
(10, '2025_07_31_185824_create_student_reviews_table', 1),
(11, '2025_08_01_010811_create_permission_tables', 1),
(12, '2025_08_02_012114_create_page_names_table', 1),
(13, '2025_08_02_012115_create_pages_table', 1),
(14, '2025_08_02_020820_create_logos_table', 1),
(15, '2025_08_02_143726_create_universities_table', 1),
(16, '2025_08_08_022521_create_carousels_table', 1),
(17, '2025_08_08_225607_create_sscommerz_accounts', 1),
(18, '2025_08_09_014200_create_personal_access_tokens_table', 1),
(19, '2025_08_25_003434_add_whats_app_number_to_logos', 2);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\User', 1);

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `page_name_id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `meta_title` varchar(255) NOT NULL,
  `meta_description` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `page_name_id`, `title`, `description`, `image`, `meta_title`, `meta_description`, `created_at`, `updated_at`) VALUES
(1, 1, 'Our Service', '<p>Travel can be <strong>domestic</strong>, exploring different regions within one’s own country, or <strong>international</strong>, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.</p>', '1755087984_1754339856_breadcrumb-bg_prev.jpg', 'Our Service', 'Our Service', '2025-08-13 12:26:24', '2025-08-13 12:26:24'),
(2, 2, 'Terms and codition', '<p>Travel can be <strong>domestic</strong>, exploring different regions within one’s own country, or <strong>international</strong>, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.</p>', '1755088080_1754339932_blog-3.jpg', 'Terms And Condtion', 'Terms And Condtion', '2025-08-13 12:28:00', '2025-08-13 12:28:00');

-- --------------------------------------------------------

--
-- Table structure for table `page_names`
--

CREATE TABLE `page_names` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `page_names`
--

INSERT INTO `page_names` (`id`, `name`, `rank`, `slug`, `created_at`, `updated_at`) VALUES
(1, 'Our Service', 1, 'our-service', '2025-08-13 12:24:57', '2025-08-13 12:24:57'),
(2, 'Terms And Condition', 2, 'terms-and-condition', '2025-08-13 12:25:11', '2025-08-13 12:25:11');

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'booking-list', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(2, 'booking-save-page', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(3, 'booking-save', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(4, 'booking-update', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(5, 'booking-delete', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(6, 'country-list', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(7, 'country-save-page', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(8, 'country-save', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(9, 'country-update', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(10, 'country-delete', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(11, 'review-list', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(12, 'review-save-page', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(13, 'review-save', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(14, 'review-update', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(15, 'review-delete', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(16, 'service-category-list', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(17, 'service-category-save-page', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(18, 'save-service-category', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(19, 'update-service-category', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(20, 'delete-service-category', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(21, 'service-list', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(22, 'service-save-page', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(23, 'save-service', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(24, 'update-service', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(25, 'delete-service', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(26, 'student-list', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(27, 'student-save-page', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(28, 'student-save', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(29, 'student-update', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(30, 'student-delete', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(31, 'success-stories-list', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(32, 'success-stories-save-page', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(33, 'success-stories-save', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(34, 'success-stories-update', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(35, 'success-stories-delete', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(36, 'list-role', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(37, 'role-save-page', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(38, 'create-role', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(39, 'update-role', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(40, 'delete-role', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(41, 'list-user', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(42, 'user-save-page', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(43, 'create-user', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(44, 'update-user', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(45, 'delete-user', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(46, 'page-content-list', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(47, 'page-content-save-page', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(48, 'page-content-save', 'web', '2025-08-13 11:43:22', '2025-08-13 11:43:22'),
(49, 'page-content-update', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(50, 'page-content-delete', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(51, 'logo-list', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(52, 'logo-save-page', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(53, 'logo-save', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(54, 'logo-update', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(55, 'logo-delete', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(56, 'university-list', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(57, 'university-save-page', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(58, 'university-save', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(59, 'university-update', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(60, 'university-delete', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(61, 'country-detail-list', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(62, 'country-detail-save-page', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(63, 'country-detail-save', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(64, 'country-detail-update', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(65, 'country-detail-delete', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(66, 'page-list', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(67, 'page-save-page', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(68, 'page-save', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(69, 'page-update', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(70, 'page-delete', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(71, 'carousel-list', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(72, 'carousel-save-page', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(73, 'carousel-save', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(74, 'carousel-update', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(75, 'carousel-delete', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` text NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `guard_name` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'web', '2025-08-13 11:43:23', '2025-08-13 11:43:23');

-- --------------------------------------------------------

--
-- Table structure for table `role_has_permissions`
--

CREATE TABLE `role_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_has_permissions`
--

INSERT INTO `role_has_permissions` (`permission_id`, `role_id`) VALUES
(1, 1),
(2, 1),
(3, 1),
(4, 1),
(5, 1),
(6, 1),
(7, 1),
(8, 1),
(9, 1),
(10, 1),
(11, 1),
(12, 1),
(13, 1),
(14, 1),
(15, 1),
(16, 1),
(17, 1),
(18, 1),
(19, 1),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(24, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(29, 1),
(30, 1),
(31, 1),
(32, 1),
(33, 1),
(34, 1),
(35, 1),
(36, 1),
(37, 1),
(38, 1),
(39, 1),
(40, 1),
(41, 1),
(42, 1),
(43, 1),
(44, 1),
(45, 1),
(46, 1),
(47, 1),
(48, 1),
(49, 1),
(50, 1),
(51, 1),
(52, 1),
(53, 1),
(54, 1),
(55, 1),
(56, 1),
(57, 1),
(58, 1),
(59, 1),
(60, 1),
(61, 1),
(62, 1),
(63, 1),
(64, 1),
(65, 1),
(66, 1),
(67, 1),
(68, 1),
(69, 1),
(70, 1),
(71, 1),
(72, 1),
(73, 1),
(74, 1),
(75, 1);

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_category_id` bigint(20) UNSIGNED NOT NULL,
  `service_description` longtext NOT NULL,
  `service_image` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id`, `service_category_id`, `service_description`, `service_image`, `rank`, `created_at`, `updated_at`) VALUES
(1, 1, '<p>Travel can be <strong>domestic</strong>, exploring different regions within one’s own country, or <strong>international</strong>, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.</p>', '1755087794_1754334464_services_student_visa.png', 1, '2025-08-13 12:23:14', '2025-08-13 12:23:14'),
(2, 1, '<p>Travel can be <strong>domestic</strong>, exploring different regions within one’s own country, or <strong>international</strong>, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.</p>', '1755087806_1754334464_services_student_visa.png', 2, '2025-08-13 12:23:26', '2025-08-13 12:23:26'),
(3, 1, '<p>Travel can be <strong>domestic</strong>, exploring different regions within one’s own country, or <strong>international</strong>, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.</p>', '1755087817_1755087806_1754334464_services_student_visa.png', 3, '2025-08-13 12:23:37', '2025-08-13 12:23:37'),
(4, 2, '<p>Travel can be <strong>domestic</strong>, exploring different regions within one’s own country, or <strong>international</strong>, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.</p>', '1755087828_1755087806_1754334464_services_student_visa.png', 4, '2025-08-13 12:23:48', '2025-08-13 12:23:48'),
(5, 2, '<p>Travel can be <strong>domestic</strong>, exploring different regions within one’s own country, or <strong>international</strong>, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.</p>', '1755087838_1755087828_1755087806_1754334464_services_student_visa.png', 5, '2025-08-13 12:23:58', '2025-08-13 12:23:58'),
(6, 2, '<p>Travel can be <strong>domestic</strong>, exploring different regions within one’s own country, or <strong>international</strong>, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.</p>', '1755087851_1755087828_1755087806_1754334464_services_student_visa.png', 6, '2025-08-13 12:24:11', '2025-08-13 12:24:11'),
(7, 3, '<p>Travel can be <strong>domestic</strong>, exploring different regions within one’s own country, or <strong>international</strong>, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.</p>', '1755087872_1755087817_1755087806_1754334464_services_student_visa.png', 7, '2025-08-13 12:24:32', '2025-08-13 12:24:32'),
(8, 3, '<p><br></p><p>Travel can be domestic, exploring different regions within one’s own country, or international, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be educational, helping people learn languages, history, geography, and social norms firsthand. It also contributes to mental health and relaxation, offering a break from daily routines and work stress.</p>', '1755107228_1755087794_1754334464_services_student_visa.png', 8, '2025-08-13 17:47:08', '2025-08-13 17:47:08'),
(9, 1, '<p>landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.landmarks. Beyond enjoyment, travel can be <strong>educational</strong>, helping people learn languages, history, geography, and social norms firsthand. It also contributes to <strong>mental health and relaxation</strong>, offering a break from daily routines and work stress.</p>', '1755112958_1754334464_services_student_visa.png', 9, '2025-08-13 19:22:38', '2025-08-13 19:22:38');

-- --------------------------------------------------------

--
-- Table structure for table `service_categories`
--

CREATE TABLE `service_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `service_name` varchar(255) NOT NULL,
  `service_title` longtext NOT NULL,
  `image` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `service_categories`
--

INSERT INTO `service_categories` (`id`, `service_name`, `service_title`, `image`, `rank`, `created_at`, `updated_at`) VALUES
(1, 'Visa Service', 'Travel can be domestic, exploring different regions within one’s own country, or international, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be educational, helping people learn languages, history, geography, and social norms firsthand. It also contributes to mental health and relaxation, offering a break from daily routines and work stress.', '1755087778_1754334418_services_student_visa.png', 1, '2025-08-13 12:21:36', '2025-08-13 12:22:58'),
(2, 'Air Ticket', 'Travel can be domestic, exploring different regions within one’s own country, or international, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be educational, helping people learn languages, history, geography, and social norms firsthand. It also contributes to mental health and relaxation, offering a break from daily routines and work stress.', '1755087722_1754335318_services_air_ticket.jpg', 2, '2025-08-13 12:22:02', '2025-08-13 12:22:02'),
(3, 'Tourist Visa', 'Travel can be domestic, exploring different regions within one’s own country, or international, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be educational, helping people learn languages, history, geography, and social norms firsthand. It also contributes to mental health and relaxation, offering a break from daily routines and work stress.', '1755087767_1754335563_services_tourist_visa.jpg', 3, '2025-08-13 12:22:47', '2025-08-13 12:22:47');

-- --------------------------------------------------------

--
-- Table structure for table `sessions`
--

CREATE TABLE `sessions` (
  `id` varchar(255) NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `ip_address` varchar(45) DEFAULT NULL,
  `user_agent` text DEFAULT NULL,
  `payload` longtext NOT NULL,
  `last_activity` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sessions`
--

INSERT INTO `sessions` (`id`, `user_id`, `ip_address`, `user_agent`, `payload`, `last_activity`) VALUES
('blCvUVt9IokkZtMzyPuL7igZ3b0dUphL6tmDWaWe', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiazJwUnM0N0lvVDRhR3NPaWkzQmNxNXBTUWlIemtMMldGam1WMWhseCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6NTI6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hZG1pbi9sb2dvLXNhdmUtcGFnZT9sb2dvX2lkPTEiO31zOjY6Il9mbGFzaCI7YToyOntzOjM6Im9sZCI7YTowOnt9czozOiJuZXciO2E6MDp7fX1zOjUwOiJsb2dpbl93ZWJfNTliYTM2YWRkYzJiMmY5NDAxNTgwZjAxNGM3ZjU4ZWE0ZTMwOTg5ZCI7aToxO30=', 1756060878),
('Gu6R6ft44WdnHEuLADgQFPzZJ4ZSXFrsIl5lRtoT', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:142.0) Gecko/20100101 Firefox/142.0', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiQzU4Rk00ajc2cnUxc1JQMVpuMlBMd1ZkSHVkSXVIM2hQNmx0VXB2RCI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6MjE6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1756060892);

-- --------------------------------------------------------

--
-- Table structure for table `sscommerz_accounts`
--

CREATE TABLE `sscommerz_accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `store_id` varchar(255) NOT NULL,
  `store_password` varchar(255) NOT NULL,
  `currency` varchar(255) NOT NULL,
  `success_url` varchar(255) NOT NULL,
  `cancel_url` varchar(255) NOT NULL,
  `fail_url` varchar(255) NOT NULL,
  `ipn_url` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `sscommerz_accounts`
--

INSERT INTO `sscommerz_accounts` (`id`, `store_id`, `store_password`, `currency`, `success_url`, `cancel_url`, `fail_url`, `ipn_url`, `created_at`, `updated_at`) VALUES
(1, 'abcco67ab2ea1e51d7', 'abcco67ab2ea1e51d7@ssl', 'BDT', 'http://127.0.0.1:8000/api/payment-success', 'http://127.0.0.1:8000/api/payment-cancel', 'http://127.0.0.1:8000/api/payment-fail', '', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `student_reviews`
--

CREATE TABLE `student_reviews` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `image` varchar(255) DEFAULT NULL,
  `description` longtext NOT NULL,
  `rating` decimal(8,2) DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_reviews`
--

INSERT INTO `student_reviews` (`id`, `name`, `title`, `image`, `description`, `rating`, `rank`, `created_at`, `updated_at`) VALUES
(1, 'Ayman', 'Thats Awesome !!', '1755087522_1754339949_guide-3.jpg', 'Travel can be domestic, exploring different regions within one’s own country, or international, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be educational, helping people learn languages, history, geography, and social norms firsthand. It also contributes to mental health and relaxation, offering a break from daily routines and work stress.', 4.00, 1, '2025-08-13 12:18:42', '2025-08-13 12:18:42'),
(2, 'Ariyan', 'Thats Awesome !!', '1755087555_1754339962_guide-2.jpg', 'Travel can be domestic, exploring different regions within one’s own country, or international, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be educational, helping people learn languages, history, geography, and social norms firsthand. It also contributes to mental health and relaxation, offering a break from daily routines and work stress.', 5.00, 2, '2025-08-13 12:19:15', '2025-08-13 12:19:15'),
(3, 'Saira', 'Thats Awesome', '1755087592_1754339977_testimonial-2.jpg', 'Travel can be domestic, exploring different regions within one’s own country, or international, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be educational, helping people learn languages, history, geography, and social norms firsthand. It also contributes to mental health and relaxation, offering a break from daily routines and work stress.', 5.00, 3, '2025-08-13 12:19:52', '2025-08-13 12:19:52'),
(4, 'Tanvir', 'Thats Awesome', '1755087622_1754593848_success_3.jpg', 'Travel can be domestic, exploring different regions within one’s own country, or international, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be educational, helping people learn languages, history, geography, and social norms firsthand. It also contributes to mental health and relaxation, offering a break from daily routines and work stress.', 5.00, 4, '2025-08-13 12:20:22', '2025-08-13 12:20:22'),
(5, 'Sayem', 'Thats Awesome', '1755107519_1754593836_canada.jpg', 'Travel can be domestic, exploring different regions within one’s own country, or international, visiting foreign countries and experiencing their unique customs and landmarks. Beyond enjoyment, travel can be educational, helping people learn languages, history, geography, and social norms firsthand. It also contributes to mental health and relaxation, offering a break from daily routines and work stress.', 5.00, 5, '2025-08-13 17:51:59', '2025-08-13 17:51:59');

-- --------------------------------------------------------

--
-- Table structure for table `success_stories`
--

CREATE TABLE `success_stories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `video` longtext DEFAULT NULL,
  `rank` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `success_stories`
--

INSERT INTO `success_stories` (`id`, `image`, `video`, `rank`, `created_at`, `updated_at`) VALUES
(1, '1755086103.1754378501.breadcrumb-bg.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CKefyMEhpYo?si=t8EJffJr_pq4qguh\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 1, '2025-08-13 11:55:03', '2025-08-13 11:55:03'),
(2, '1755086114.1754378580.carousel-3.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CKefyMEhpYo?si=t8EJffJr_pq4qguh\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 2, '2025-08-13 11:55:14', '2025-08-13 11:55:14'),
(3, '1755086123.1755086114.1754378580.carousel-3.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CKefyMEhpYo?si=t8EJffJr_pq4qguh\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 3, '2025-08-13 11:55:23', '2025-08-13 11:55:23'),
(4, '1755088953.1754502036.canada.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CKefyMEhpYo?si=t8EJffJr_pq4qguh\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 4, '2025-08-13 12:42:33', '2025-08-13 12:42:33'),
(5, '1755088986.1754378237.explore-tour-3.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/CKefyMEhpYo?si=t8EJffJr_pq4qguh\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', 5, '2025-08-13 12:43:06', '2025-08-13 12:43:06');

-- --------------------------------------------------------

--
-- Table structure for table `universities`
--

CREATE TABLE `universities` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `rank` int(11) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `universities`
--

INSERT INTO `universities` (`id`, `country_id`, `name`, `image`, `title`, `rank`, `created_at`, `updated_at`) VALUES
(1, 1, 'Australia', '1755085946_1754379033_countries-1.jpg', 'Study in Australia', 1, '2025-08-13 11:52:26', '2025-08-13 11:52:26'),
(2, 2, 'Belgium', '1755085976_1754379114_countries-5.jpg', 'Study in Belgium', 2, '2025-08-13 11:52:56', '2025-08-13 11:52:56'),
(3, 3, 'Italy', '1755086000_1754379162_countries-3.jpg', 'Study in Italy', 3, '2025-08-13 11:53:20', '2025-08-13 11:53:20'),
(4, 4, 'Cyprus', '1755086024_1754379180_explore-tour-3.jpg', 'Study in Cyprus', 4, '2025-08-13 11:53:44', '2025-08-13 11:53:44'),
(5, 2, 'Belgium', '1755113062_1754379033_countries-1.jpg', 'University Of Belgium', 5, '2025-08-13 19:24:22', '2025-08-13 19:24:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `phone` varchar(255) NOT NULL,
  `abroad_mobile` varchar(255) DEFAULT NULL,
  `user_type` varchar(255) NOT NULL DEFAULT 'student',
  `profile_image` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) NOT NULL DEFAULT 'Enable',
  `otp` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `email`, `password`, `phone`, `abroad_mobile`, `user_type`, `profile_image`, `is_active`, `otp`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'superadmin@gmail.com', '$2y$12$ONjlD8Q9JC7oNSHcKODvj.c8HTz3HTKyNtOZW12N1Rlm5zgwHQnJS', '1234567890', NULL, 'admin', NULL, 'Enable', '0', '2025-08-13 11:43:23', '2025-08-13 11:43:23'),
(2, 'student', 'student@gmail.com', '$2y$12$kLambuD..WNuSTE9Zjg/NOMhXXXFHYBadZot64t7hhkomPGUqcgnG', '123654778', NULL, 'student', NULL, 'Enable', '0', '2025-08-13 12:44:48', '2025-08-13 12:44:48');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bookings_user_id_foreign` (`user_id`);

--
-- Indexes for table `cache`
--
ALTER TABLE `cache`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `cache_locks`
--
ALTER TABLE `cache_locks`
  ADD PRIMARY KEY (`key`);

--
-- Indexes for table `carousels`
--
ALTER TABLE `carousels`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `carousels_rank_unique` (`rank`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `countries_rank_unique` (`rank`);

--
-- Indexes for table `country_details`
--
ALTER TABLE `country_details`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `country_details_country_id_unique` (`country_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `jobs`
--
ALTER TABLE `jobs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `jobs_queue_index` (`queue`);

--
-- Indexes for table `job_batches`
--
ALTER TABLE `job_batches`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `logos`
--
ALTER TABLE `logos`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`model_id`,`model_type`),
  ADD KEY `model_has_permissions_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD PRIMARY KEY (`role_id`,`model_id`,`model_type`),
  ADD KEY `model_has_roles_model_id_model_type_index` (`model_id`,`model_type`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pages_page_name_id_foreign` (`page_name_id`);

--
-- Indexes for table `page_names`
--
ALTER TABLE `page_names`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `page_names_name_unique` (`name`),
  ADD UNIQUE KEY `page_names_rank_unique` (`rank`),
  ADD UNIQUE KEY `page_names_slug_unique` (`slug`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `permissions_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`),
  ADD KEY `personal_access_tokens_expires_at_index` (`expires_at`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `roles_name_guard_name_unique` (`name`,`guard_name`);

--
-- Indexes for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD PRIMARY KEY (`permission_id`,`role_id`),
  ADD KEY `role_has_permissions_role_id_foreign` (`role_id`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `services_rank_unique` (`rank`),
  ADD KEY `services_service_category_id_foreign` (`service_category_id`);

--
-- Indexes for table `service_categories`
--
ALTER TABLE `service_categories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `service_categories_rank_unique` (`rank`);

--
-- Indexes for table `sessions`
--
ALTER TABLE `sessions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sessions_user_id_index` (`user_id`),
  ADD KEY `sessions_last_activity_index` (`last_activity`);

--
-- Indexes for table `sscommerz_accounts`
--
ALTER TABLE `sscommerz_accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `student_reviews`
--
ALTER TABLE `student_reviews`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `student_reviews_rank_unique` (`rank`);

--
-- Indexes for table `success_stories`
--
ALTER TABLE `success_stories`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `success_stories_rank_unique` (`rank`);

--
-- Indexes for table `universities`
--
ALTER TABLE `universities`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `universities_rank_unique` (`rank`),
  ADD KEY `universities_country_id_foreign` (`country_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `carousels`
--
ALTER TABLE `carousels`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `country_details`
--
ALTER TABLE `country_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `jobs`
--
ALTER TABLE `jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `logos`
--
ALTER TABLE `logos`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `page_names`
--
ALTER TABLE `page_names`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=76;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `service_categories`
--
ALTER TABLE `service_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `sscommerz_accounts`
--
ALTER TABLE `sscommerz_accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `student_reviews`
--
ALTER TABLE `student_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `success_stories`
--
ALTER TABLE `success_stories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `universities`
--
ALTER TABLE `universities`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `country_details`
--
ALTER TABLE `country_details`
  ADD CONSTRAINT `country_details_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `model_has_permissions`
--
ALTER TABLE `model_has_permissions`
  ADD CONSTRAINT `model_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `model_has_roles`
--
ALTER TABLE `model_has_roles`
  ADD CONSTRAINT `model_has_roles_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `pages`
--
ALTER TABLE `pages`
  ADD CONSTRAINT `pages_page_name_id_foreign` FOREIGN KEY (`page_name_id`) REFERENCES `page_names` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `role_has_permissions`
--
ALTER TABLE `role_has_permissions`
  ADD CONSTRAINT `role_has_permissions_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_has_permissions_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `services`
--
ALTER TABLE `services`
  ADD CONSTRAINT `services_service_category_id_foreign` FOREIGN KEY (`service_category_id`) REFERENCES `service_categories` (`id`) ON UPDATE CASCADE;

--
-- Constraints for table `universities`
--
ALTER TABLE `universities`
  ADD CONSTRAINT `universities_country_id_foreign` FOREIGN KEY (`country_id`) REFERENCES `countries` (`id`) ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
