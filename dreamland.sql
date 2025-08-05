-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 05, 2025 at 11:36 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `dreamland`
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`id`, `user_id`, `name`, `email`, `bd_mobile`, `last_education`, `prefferred_country`, `pdf`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 'superadmin', 'superadmin@gmail.com', '1234567890', 'M.A', 'Bangladesh', NULL, 'Pending', '2025-08-05 02:34:26', '2025-08-05 02:34:26');

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
('laravel-cache-spatie.permission.cache', 'a:3:{s:5:\"alias\";a:4:{s:1:\"a\";s:2:\"id\";s:1:\"b\";s:4:\"name\";s:1:\"c\";s:10:\"guard_name\";s:1:\"r\";s:5:\"roles\";}s:11:\"permissions\";a:70:{i:0;a:4:{s:1:\"a\";i:1;s:1:\"b\";s:12:\"booking-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:1;a:4:{s:1:\"a\";i:2;s:1:\"b\";s:17:\"booking-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:2;a:4:{s:1:\"a\";i:3;s:1:\"b\";s:12:\"booking-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:3;a:4:{s:1:\"a\";i:4;s:1:\"b\";s:14:\"booking-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:4;a:4:{s:1:\"a\";i:5;s:1:\"b\";s:14:\"booking-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:5;a:4:{s:1:\"a\";i:6;s:1:\"b\";s:12:\"country-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:6;a:4:{s:1:\"a\";i:7;s:1:\"b\";s:17:\"country-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:7;a:4:{s:1:\"a\";i:8;s:1:\"b\";s:12:\"country-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:8;a:4:{s:1:\"a\";i:9;s:1:\"b\";s:14:\"country-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:9;a:4:{s:1:\"a\";i:10;s:1:\"b\";s:14:\"country-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:10;a:4:{s:1:\"a\";i:11;s:1:\"b\";s:11:\"review-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:11;a:4:{s:1:\"a\";i:12;s:1:\"b\";s:16:\"review-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:12;a:4:{s:1:\"a\";i:13;s:1:\"b\";s:11:\"review-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:13;a:4:{s:1:\"a\";i:14;s:1:\"b\";s:13:\"review-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:14;a:4:{s:1:\"a\";i:15;s:1:\"b\";s:13:\"review-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:15;a:4:{s:1:\"a\";i:16;s:1:\"b\";s:21:\"service-category-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:16;a:4:{s:1:\"a\";i:17;s:1:\"b\";s:26:\"service-category-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:17;a:4:{s:1:\"a\";i:18;s:1:\"b\";s:21:\"save-service-category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:18;a:4:{s:1:\"a\";i:19;s:1:\"b\";s:23:\"update-service-category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:19;a:4:{s:1:\"a\";i:20;s:1:\"b\";s:23:\"delete-service-category\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:20;a:4:{s:1:\"a\";i:21;s:1:\"b\";s:12:\"service-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:21;a:4:{s:1:\"a\";i:22;s:1:\"b\";s:17:\"service-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:22;a:4:{s:1:\"a\";i:23;s:1:\"b\";s:12:\"save-service\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:23;a:4:{s:1:\"a\";i:24;s:1:\"b\";s:14:\"update-service\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:24;a:4:{s:1:\"a\";i:25;s:1:\"b\";s:14:\"delete-service\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:25;a:4:{s:1:\"a\";i:26;s:1:\"b\";s:12:\"student-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:26;a:4:{s:1:\"a\";i:27;s:1:\"b\";s:17:\"student-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:27;a:4:{s:1:\"a\";i:28;s:1:\"b\";s:12:\"student-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:28;a:4:{s:1:\"a\";i:29;s:1:\"b\";s:14:\"student-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:29;a:4:{s:1:\"a\";i:30;s:1:\"b\";s:14:\"student-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:30;a:4:{s:1:\"a\";i:31;s:1:\"b\";s:20:\"success-stories-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:31;a:4:{s:1:\"a\";i:32;s:1:\"b\";s:25:\"success-stories-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:32;a:4:{s:1:\"a\";i:33;s:1:\"b\";s:20:\"success-stories-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:33;a:4:{s:1:\"a\";i:34;s:1:\"b\";s:22:\"success-stories-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:34;a:4:{s:1:\"a\";i:35;s:1:\"b\";s:22:\"success-stories-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:35;a:4:{s:1:\"a\";i:36;s:1:\"b\";s:9:\"list-role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:36;a:4:{s:1:\"a\";i:37;s:1:\"b\";s:14:\"role-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:37;a:4:{s:1:\"a\";i:38;s:1:\"b\";s:11:\"create-role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:38;a:4:{s:1:\"a\";i:39;s:1:\"b\";s:11:\"update-role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:39;a:4:{s:1:\"a\";i:40;s:1:\"b\";s:11:\"delete-role\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:40;a:4:{s:1:\"a\";i:41;s:1:\"b\";s:9:\"list-user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:41;a:4:{s:1:\"a\";i:42;s:1:\"b\";s:14:\"user-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:42;a:4:{s:1:\"a\";i:43;s:1:\"b\";s:11:\"create-user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:43;a:4:{s:1:\"a\";i:44;s:1:\"b\";s:11:\"update-user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:44;a:4:{s:1:\"a\";i:45;s:1:\"b\";s:11:\"delete-user\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:45;a:4:{s:1:\"a\";i:46;s:1:\"b\";s:17:\"page-content-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:46;a:4:{s:1:\"a\";i:47;s:1:\"b\";s:22:\"page-content-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:47;a:4:{s:1:\"a\";i:48;s:1:\"b\";s:17:\"page-content-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:48;a:4:{s:1:\"a\";i:49;s:1:\"b\";s:19:\"page-content-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:49;a:4:{s:1:\"a\";i:50;s:1:\"b\";s:19:\"page-content-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:50;a:4:{s:1:\"a\";i:51;s:1:\"b\";s:9:\"logo-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:51;a:4:{s:1:\"a\";i:52;s:1:\"b\";s:14:\"logo-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:52;a:4:{s:1:\"a\";i:53;s:1:\"b\";s:9:\"logo-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:53;a:4:{s:1:\"a\";i:54;s:1:\"b\";s:11:\"logo-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:54;a:4:{s:1:\"a\";i:55;s:1:\"b\";s:11:\"logo-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:55;a:4:{s:1:\"a\";i:56;s:1:\"b\";s:15:\"university-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:56;a:4:{s:1:\"a\";i:57;s:1:\"b\";s:20:\"university-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:57;a:4:{s:1:\"a\";i:58;s:1:\"b\";s:15:\"university-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:58;a:4:{s:1:\"a\";i:59;s:1:\"b\";s:17:\"university-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:59;a:4:{s:1:\"a\";i:60;s:1:\"b\";s:17:\"university-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:60;a:4:{s:1:\"a\";i:61;s:1:\"b\";s:19:\"country-detail-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:61;a:4:{s:1:\"a\";i:62;s:1:\"b\";s:24:\"country-detail-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:62;a:4:{s:1:\"a\";i:63;s:1:\"b\";s:19:\"country-detail-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:63;a:4:{s:1:\"a\";i:64;s:1:\"b\";s:21:\"country-detail-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:64;a:4:{s:1:\"a\";i:65;s:1:\"b\";s:21:\"country-detail-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:65;a:4:{s:1:\"a\";i:66;s:1:\"b\";s:9:\"page-list\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:66;a:4:{s:1:\"a\";i:67;s:1:\"b\";s:14:\"page-save-page\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:67;a:4:{s:1:\"a\";i:68;s:1:\"b\";s:9:\"page-save\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:68;a:4:{s:1:\"a\";i:69;s:1:\"b\";s:11:\"page-update\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}i:69;a:4:{s:1:\"a\";i:70;s:1:\"b\";s:11:\"page-delete\";s:1:\"c\";s:3:\"web\";s:1:\"r\";a:1:{i:0;i:1;}}}s:5:\"roles\";a:1:{i:0;a:3:{s:1:\"a\";i:1;s:1:\"b\";s:10:\"superadmin\";s:1:\"c\";s:3:\"web\";}}}', 1754419702);

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
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `country_name` varchar(255) NOT NULL,
  `country_flag` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_name`, `country_flag`, `created_at`, `updated_at`) VALUES
(1, 'Australia', '1754336011.Flag_of_Australia_(converted).svg.png', '2025-08-05 01:33:31', '2025-08-05 01:33:31'),
(2, 'Belgium', '1754336101.Flag_of_Belgium.svg.png', '2025-08-05 01:35:01', '2025-08-05 01:35:01'),
(3, 'Italy', '1754336184.Flag_of_Italy.svg.png', '2025-08-05 01:36:24', '2025-08-05 01:36:24'),
(4, 'Cyprus', '1754336252.Flag_of_Cyprus.svg.png', '2025-08-05 01:37:32', '2025-08-05 01:37:32'),
(5, 'New Zealand', '1754336299.Flag_of_New_Zealand.svg.png', '2025-08-05 01:38:19', '2025-08-05 01:38:19');

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
(1, 1, '1754336806_australia.jpg', 'Study in Australia?', '<p><strong>Why/About Australia?</strong></p><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\"> Australia is one of the top destinations for international students, offering a world-class education system, globally recognized degrees, and a wide range of programs across various disciplines. With top-ranked universities, flexible course structures, and a strong focus on research and innovation, students gain both academic excellence and practical skills. International students benefit from generous post-study work rights (2–5 years), pathways to Permanent Residency, part-time work opportunities, and various scholarships and financial aid options. Beyond academics, Australia provides a vibrant and welcoming cultural experience. Known for its friendly and inclusive society, students from over 190 countries feel at home in its multicultural communities. The country blends Aboriginal heritage with modern values, offering a unique mix of tradition and innovation. From cultural festivals and diverse cuisine to natural wonders like the Great Barrier Reef, life in Australia is rich with opportunity and adventure.</p>', '<p><br></p><p class=\"ql-align-justify\">Combining academic quality, career prospects, and cultural richness, <strong>studying in Australia offers a life-changing journey and a smart investment in your future</strong>.</p><p><br></p><p> <strong>Top reasons Why You should consider Australia:</strong></p><p>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;7 of the world’s most student-friendly cities are in Australia</p><p>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Australia has 1100+ institutions offerings 2200+ courses</p><p>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;8 out of the top 100 World Universities are in Australia</p><p>4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Australia has lower living costs than the UK &amp; USA</p><p>5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Welcoming people &amp; culture</p><p>6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Australian degrees &amp; qualifications are recognized and respected internationally</p><p>7.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Up to 24 hours working opportunity while studying and no limits on vacations</p><p><strong>Programs:</strong></p><p>l&nbsp;Foundation</p><p>l&nbsp;Bachelor</p><p>l&nbsp;Post Graduate Diploma</p><p>l&nbsp;Master’s</p><p><strong>Intakes:</strong></p><p class=\"ql-align-justify\">  <span style=\"color: black;\">Intakes</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">Application Timeline</span></p><p class=\"ql-align-justify\">   February (Term-1)</p><p class=\"ql-align-justify\"> October - November</p><p class=\"ql-align-justify\">   July (Term-2)</p><p class=\"ql-align-justify\"> May - June</p><p class=\"ql-align-justify\">   November (Term-3)</p><p class=\"ql-align-justify\"> September (Selected Universities &amp; Courses)</p><p>  <span style=\"color: black;\">&nbsp;</span></p><p><strong style=\"color: black;\">Eligibility Criteria:</strong></p><p class=\"ql-align-justify\">To apply for a <strong>Bachelor’s program</strong> in Australia, international students must complete <strong>12 years</strong> of education (such as HSC or A-Levels) with a minimum&nbsp;<strong>50%–70% marks</strong>. Some courses may require specific subjects or higher grade like Engineering, IT, Health, Social Work etc. If direct entry requirements aren’t met, students can opt for <strong>foundation or pathway programs</strong>.</p><p class=\"ql-align-justify\">For <strong>Master’s programs</strong>, applicants need a recognized <strong>Bachelor’s degree</strong> in a related field with at least <strong>55–70% marks</strong> or a <strong>GPA of 2.5–3.0</strong>. Competitive programs such as MBA or Data Science may demand higher academic performance or relevant working experience. Students with lower GPA can consider <strong>graduate certificate or diploma pathways</strong>.</p><p class=\"ql-align-justify\"> </p><p class=\"ql-align-justify\"> </p><p class=\"ql-align-justify\"> </p><p><strong style=\"color: black;\">Language Requirement:</strong></p><p class=\"ql-align-justify\">  <span style=\"color: black;\">English Language Test</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">Required Score</span></p><p class=\"ql-align-justify\">   <span style=\"color: black;\">IELTS</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">Minimum overall band of 6.0 (with no band less than 5.5)</span></p><p class=\"ql-align-justify\">   <span style=\"color: black;\">TOEFL</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">Minimum overall score of 79 (with minimum of 13 in Reading, 12 in Listening, 18 in Speaking and 21 in Writing)</span></p><p class=\"ql-align-justify\">   <span style=\"color: black;\">PTE</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">overall score of 50 (with no communication band less than 50)</span></p><p class=\"ql-align-justify\">   <span style=\"color: black;\">CAE </span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">You will require a minimum score of 169-176 while scoring a minimum of 169 in every section</span></p><p>  <span style=\"color: black;\">&nbsp;</span></p><p><strong style=\"color: black;\">Visa Requirement:</strong></p><p class=\"ql-align-justify\">The <strong>visa approval rate for Bangladeshi students</strong> applying to study in Australia is relatively high. Meeting following requirements carefully increases your chances of a successful visa outcome:</p><p>&nbsp;</p><p><strong>1. </strong>Valid Passport</p><p><strong>2. </strong>Confirmation of Enrollment (COE) from your chosen university</p><p><strong>3. </strong>GS Statement (Genuine Student Statement)</p><p><strong>4. </strong>Proof of sufficient funds</p><p><strong>5. </strong>Overseas student health cover</p><p><strong>6. </strong>English proficiency proof</p><p><strong>7. </strong>Recent passport sized photographs</p><p><strong style=\"color: black;\">8. </strong>Statement of Purposes (SOP)</p><p><strong style=\"color: black;\">9. </strong>Academic and work experience documents</p><p> </p><p> </p><p> </p><p class=\"ql-align-justify\"><strong style=\"color: black;\">Visa Processing time &amp; preparations:</strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"> </strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"> </strong>To apply for an Australian student visa, Bangladeshi students should start the process <strong>at least three months</strong> prior their planned travel, as processing times often exceed <strong>4 to 6 weeks</strong>. Proper preparation and timely submission of these documents greatly improve the chances of <strong>visa approval</strong>.</p><p class=\"ql-align-justify\"> </p><p class=\"ql-align-justify\"> </p><p class=\"ql-align-justify\"> </p><p class=\"ql-align-justify\"> </p><p>&nbsp;</p><p><strong>Post Study Work Opportunities in Australia:</strong></p><p><strong> </strong></p><p><strong> </strong></p><p class=\"ql-align-justify\">Australia offers generous <strong>Post-Study Work (PSW) opportunities</strong> for international students through the <strong>Temporary Graduate Visa (subclass 485)</strong>. After completing at least <strong>two years of eligible study</strong> in Australia, graduates can stay and work for <strong>2 to 5 years</strong>, depending on their qualification and location. For example, Bachelor\'s and Master’s by Coursework graduates typically receive a <strong>2–3 year work permit</strong>, while Master’s by Research and PhD holders can stay for up to <strong>4–5 years</strong>. Students who graduate from institutions in <strong>regional areas</strong> may also qualify for an <strong>additional 1–2 years</strong> of stay. This visa allows full-time work rights and provides a valuable pathway to <strong>Permanent Residency (PR)</strong> under Australia’s skilled migration programs.</p><p><strong>&nbsp;</strong></p><p><strong>Scholarship Opportunities:</strong></p><p class=\"ql-align-justify\">Australia offers various scholarships for international students, including those from Bangladesh, to help with tuition costs. Government scholarships often cover full tuition and living expenses, while university scholarships usually cover part of the tuition. Typically up to <strong>30%</strong>, with some universities offering up to <strong>50%</strong>. <strong>Early bird scholarships</strong> are also provided by some of the university. Staying aware of scholarship amounts and deadlines is essential for applicants.</p><p class=\"ql-align-justify\"> </p><p class=\"ql-align-justify\"> </p><p><strong>Partner Universities: </strong></p><p><strong>1. La Trobe University - </strong><a href=\"https://www.latrobe.edu.au/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.latrobe.edu.au/</strong></a></p><p><strong>2. Griffith University - </strong><a href=\"https://www.griffith.edu.au/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.griffith.edu.au/</strong></a></p><p><strong>3. Charles Strut University - </strong><a href=\"https://www.csu.edu.au/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.csu.edu.au/</strong></a></p><p><strong>4. University of Tasmania - </strong><a href=\"https://www.utas.edu.au/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.utas.edu.au/</strong></a></p><p><strong>5. CQ University - </strong><a href=\"https://www.cqu.edu.au/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.cqu.edu.au/</strong></a></p><p><strong>6. Flinders University - </strong><a href=\"https://www.flinders.edu.au/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.flinders.edu.au/</strong></a></p><p><strong>7. Federation University - </strong><a href=\"https://www.federation.edu.au/studyinaus2025?gad_source=1&amp;gad_campaignid=22822345590&amp;gbraid=0AAAAA-KKR_aVySqQrPq3pz40cdMDqxr3_&amp;gclid=Cj0KCQjwhafEBhCcARIsAEGZEKL8G7uZhUGTQ-KdameCqrEWYu1C1SWlI7Z3_OmSpEIwB-FPc9l3zqsaAsOSEALw_wcB\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.federation.edu.au/studyinaus2025?gad_source=1&amp;gad_campaignid=22822345590&amp;gbraid=0AAAAA-KKR_aVySqQrPq3pz40cdMDqxr3_&amp;gclid=Cj0KCQjwhafEBhCcARIsAEGZEKL8G7uZhUGTQ-KdameCqrEWYu1C1SWlI7Z3_OmSpEIwB-FPc9l3zqsaAsOSEALw_wcB</strong></a></p><p><strong>8. University of Canberra - </strong><a href=\"https://www.canberra.edu.au/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.canberra.edu.au/</strong></a></p><p><strong>9. Victoria University - </strong><a href=\"https://www.vu.edu.au/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.vu.edu.au/</strong></a></p><p><strong>10. Torrens University Australia - </strong><a href=\"https://www.torrens.edu.au/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.torrens.edu.au/</strong></a></p><p><strong>11. Charles Darwin University - </strong><a href=\"https://www.cdu.edu.au/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.cdu.edu.au/</strong></a></p><p><strong>12. The University of Notre Dame Australia - </strong><a href=\"https://www.notredame.edu.au/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.notredame.edu.au/</strong></a></p>', '2025-08-05 01:46:46', '2025-08-05 02:15:55'),
(2, 2, '1754337200_Belgium.jpg', 'Study in Belgium', '<p>If you’re looking for a world-class education, affordable tuition, and the chance to explore Europe — <strong>Belgium</strong> might be your perfect destination. This small but powerful country is home to top-ranked universities, cutting-edge research, and a warm, multicultural vibe that welcomes students from all over the world.</p><p>In Belgium, you’ll find programs taught in English— giving you the flexibility to study in a way that suits your background. Plus, its central location in Europe makes weekend getaways to Paris, Amsterdam, or Berlin just a train ride away.</p><p>But it’s not just about academics — Belgium offers a great balance of tradition and modern life. From historical cities and famous chocolates to vibrant student towns and international job prospects, your experience here will go far beyond the classroom.</p>', '<h1><strong>Top Reasons to Choose Belgium</strong></h1><p><br></p><ol><li><strong>Globally respected universities with strong research programs</strong></li><li><strong>Lower tuition compared to many other European countries&nbsp;</strong></li><li><strong>Multilingual education — study in English, French, or Dutch&nbsp;</strong></li><li><strong>Great location in the heart of Europe&nbsp;</strong></li><li><strong>Friendly, inclusive communities&nbsp;</strong></li><li><strong>Scholarships available for international students&nbsp;</strong></li><li><strong>Work up to 20 hours/week during studies&nbsp;</strong></li><li><strong>12-month post-study work permit to find a job</strong></li></ol><p><strong>&nbsp;</strong></p><h1><strong>🎓 Programs:</strong></h1><p><br></p><p>Belgium offers a wide variety of programs across multiple fields — whether you’re into science, business, engineering, art, or international law.</p><p><strong>&nbsp;</strong></p><p><strong>&nbsp;</strong></p><ul><li><strong>Bachelor’s Degrees&nbsp;</strong></li><li><strong>Master’s Degrees&nbsp;</strong></li><li><strong>Postgraduate Diplomas&nbsp;</strong></li><li><strong>PhD &amp; Research Programs</strong></li></ul><p><br></p><h1><strong>📅 Intakes &amp; Application Timelines</strong></h1><p><br></p><h3><strong>Most universities in Belgium have two intakes:</strong></h3><p><strong>&nbsp;</strong></p><p><strong><em> </em></strong><strong style=\"color: black;\"><em><u>Intake Season</u> </em></strong><span style=\"color: black;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;                </span><strong style=\"color: black;\"><em><u>When to Apply</u></em></strong></p><p>  September (Main/Fall)&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;January – April</p><p>  February&nbsp;&nbsp;&nbsp;&nbsp;(Spring) &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;September – November</p><p>  </p><p>We recommend applying early — especially if you need a student visa.</p><p><br></p><p><br></p><h1><strong>✅ Who Can Apply?</strong></h1><h3><strong>For Bachelor’s: </strong></h3><ul><li>Completed 12 years of education (like HSC or A-Levels)&nbsp;</li><li>Minimum 60% average (some programs may ask for more)&nbsp;</li><li>English proficiency (depending on the course)</li></ul><p><strong>&nbsp;</strong></p><p><strong>&nbsp;</strong></p><h3><strong>For Master’s:</strong></h3><p><strong>&nbsp;</strong></p><ul><li>Recognized Bachelor\'s degree in a related subject&nbsp;</li><li>65%–70% average or GPA 2.75–3.0&nbsp;</li><li>Some programs may need work experience or higher grades (especially MBAs or STEM fields)</li></ul><p><br></p><p><br></p><p><br></p><h1><strong>🌐 Language Requirements</strong></h1><p><br></p><h2>Depending on the language of instruction, here’s what you’ll need:</h2><p><strong>&nbsp;</strong></p><h3><strong>Language Test Minimum Score :</strong></h3><p><strong>&nbsp;</strong></p><ul><li><strong>IELTS: </strong>6.0–6.5 overall</li><li><strong>TOEFL iBT: </strong>79–90</li><li><strong>PTE Academic: </strong>55–65</li><li><strong>CAE: &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Grade B</li></ul><p><strong>  &nbsp;</strong></p><p><br></p><h1><strong>🛂 Visa Requirements</strong></h1><p><strong>&nbsp;</strong></p><p><strong>To study in Belgium, you’ll need a student visa (long-stay Type D</strong>). Here’s what you’ll need to prepare:</p><p>&nbsp;</p><p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Valid passport</p><p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Offer letter from your university</p><p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Proof of financial support </p><p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Health insurance</p><p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Academic transcripts and certificates</p><p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Proof of language skills</p><p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Motivation letter and visa application forms</p><p>·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Medical &amp; police clearance certificates</p><p>&nbsp;</p><p>&nbsp;</p><h2><strong>Processing time: </strong></h2><p><strong>Application review:</strong> Usually takes <strong>4 to 8 weeks</strong> after submission of all required documents---</p><p>Once you receive the <strong>admission letter</strong>, apply for the visa at the Belgian embassy. <strong>Visa processing time </strong>Usually takes <strong>4 to 8 weeks</strong>,</p><p><strong>Total Estimated Time </strong>from Application to Visa Approval<strong>: 3 to 6 months</strong>, assuming</p><p>&nbsp;</p><p>&nbsp;</p><h2><strong>💼 Post-Study Work Options(PSW)</strong></h2><p><strong>After graduation, you can apply for a “search year” residence permit, giving you 12 month</strong>s to find a job in Belgium. If hired, you can switch to a work permit or an EU Blue Card, which could lead to longer-term residency.</p><p>&nbsp;</p><p>It’s a great stepping stone to build your career in Belgium — or anywhere else in the EU!</p><p><br></p><h2><strong>🎓 Scholarships Available</strong></h2><p><strong>&nbsp;</strong></p><ul><li><strong>Belgium offers generous funding to help make your studies more affordable:&nbsp;</strong></li><li><strong>VLIR-UOS Scholarships — for students from developing countries&nbsp;</strong></li><li><strong>ARES Scholarships — full scholarships for Master’s and short courses&nbsp;</strong></li><li><strong>Master Mind Scholarships — merit-based for top-performing students&nbsp;</strong></li><li><strong>Erasmus Mundus — joint Master’s programs with full funding&nbsp;</strong></li><li><strong>University-specific aid — partial tuition waivers and early-bird discounts&nbsp;</strong></li><li><strong>Be sure to check deadlines and requirements — some close early in the year.</strong></li></ul><p><strong>&nbsp;</strong></p><p><strong>&nbsp;</strong></p><h1><strong>Partner Universities in Belgium</strong></h1><p><strong>1. KU Leuven</strong> –&nbsp;https://www.kuleuven.be/</p><p>2. <strong>Ghent University</strong> – https://www.ugent.be/</p><p>3. <strong>Université Catholique de Louvain (UCLouvain)</strong> – https://uclouvain.be/</p><p>4. <strong>Université Libre de Bruxelles (ULB) </strong>– https://www.ulb.be/</p><p>5. <strong>University of Antwerp</strong> – https://www.uantwerpen.be/</p><p>6. <strong>Hasselt University</strong> – https://www.uhasselt.b</p><p>7. <strong>Vrije Universiteit Brussel (VUB)</strong> – https://www.vub.be/</p>', '2025-08-05 01:53:20', '2025-08-05 02:16:16'),
(3, 3, '1754338242_Italy.jpg', 'Why Study in Italy?', '<p>Dreaming of studying in a country that blends rich history, amazing food, and top-quality education? Italy could be your perfect match. With world-famous universities, affordable tuition, and a culture that celebrates creativity and connection, it’s no surprise more and more international students are choosing Italy.</p><p>Whether you’re into fashion, design, art, business, or science — Italy offers programs in English across almost every field. Plus, it’s right in the heart of Europe, so you can explore cities like Paris, Vienna, or Barcelona on a weekend break.</p><p>Studying in Italy is about more than just classes — it’s a life-changing experience. You’ll meet people from around the world, live in cities filled with beauty and history, and get the chance to build your future in Europe.</p>', '<p><strong>💡 Top Reasons Students Love Studying in Italy</strong></p><p>1.&nbsp;&nbsp;&nbsp;Renowned universities with a strong academic reputation</p><p>2.&nbsp;&nbsp;&nbsp;Lower tuition and living costs compared to many Western countries</p><p>3.&nbsp;&nbsp;&nbsp;Plenty of programs taught in English</p><p>4.&nbsp;&nbsp;&nbsp;A central location in Europe with easy travel access</p><p>5.&nbsp;&nbsp;&nbsp;Warm, welcoming, and multicultural communities</p><p>6.&nbsp;&nbsp;&nbsp;Scholarships available to help with costs</p><p>7.&nbsp;&nbsp;&nbsp;Part-time job options (up to 20 hours/week) while you study</p><p>8.&nbsp;&nbsp;&nbsp;A full year after graduation to find a job and stay in Italy</p><p><br></p><p class=\"ql-align-center\">  </p><p class=\"ql-align-center\"><br></p><p><strong>🎓 What Can You Study?</strong></p><p>Italy offers a huge range of programs, so whatever you’re passionate about — there’s something here for you:</p><ul><li><strong>Bachelor’s Degrees</strong></li><li><strong>Master’s Degrees</strong></li><li><strong>Postgraduate Diplomas</strong></li><li><strong>PhDs and Research Programs</strong></li></ul><p>You’ll find courses in areas like design, architecture, business, politics, arts, science, tech, and even culinary arts.</p><p><br></p><p class=\"ql-align-center\">  </p><p class=\"ql-align-center\"><br></p><p><strong>📅 When to Apply</strong></p><p>Here’s a quick look at the usual intake times and when you should start applying:</p><p class=\"ql-align-center\">   <strong style=\"color: black;\">Start Month</strong></p><p class=\"ql-align-center\"> <strong style=\"color: black;\">Application date</strong></p><p class=\"ql-align-center\">    September(Fall)</p><p class=\"ql-align-center\"> January – May</p><p class=\"ql-align-center\">   February (optional)</p><p class=\"ql-align-center\"> September – November</p><p>  It’s smart to apply early — especially if you’ll need a visa or want to apply for scholarships.</p><p><br></p><p class=\"ql-align-center\">  </p><p class=\"ql-align-center\"><br></p><p><strong>✅ Can You Apply? Eligibility </strong></p><p><strong>For Bachelor’s Programs:</strong></p><ul><li>You’ve completed 12 years of school)</li><li>At least 60% overall marks</li><li>Proof of English </li></ul><p><strong>For Master’s Programs:</strong></p><ul><li>You hold a Bachelor’s degree in a related subject</li><li>A GPA of around 2.75–3.0 or 65%–70%</li><li>Some programs (like MBAs or STEM fields) might ask for extra requirements like work experience or a higher GPA</li></ul><p class=\"ql-align-center\">  </p><p class=\"ql-align-center\"><br></p><p><strong>🌐 Language Skills</strong></p><p>If you’re applying for an English-taught course, you’ll usually need one of the following-</p><p><br></p><p><strong style=\"color: black;\">Test</strong>	 					<strong style=\"color: black;\">Minimum Score</strong></p><p>IELTS 					6.0–6.5 overall</p><p>TOEFL iBT 					79–100</p><p>Cambridge (CAE)					Grade C1</p><p>  &nbsp;</p><h1><strong>🛂 What About the Visa?</strong></h1><p>To study in Italy, you’ll need a <strong>Type D student visa</strong>. Here’s what you’ll typically need to apply:</p><ul><li>A valid passport</li><li>Your university offer letter</li><li>CIMEA Certificate</li><li>Proof of fund (around €6,000–€7,000 per year)</li><li>Health insurance</li><li>Academic transcripts</li><li>English test scores (if required)</li><li>Visa application forms and motivation letter</li><li>Police and medical clearances</li></ul><p><br></p><h1><strong>Visa processing time:</strong></h1><p><strong>Application review:</strong> Usually takes <strong>4 to 8 weeks</strong> after submission of all required documents---</p><p>Once you receive the <strong>admission letter</strong>, apply for the visa at the Belgian embassy. <strong>Visa processing time </strong>Usually takes <strong>4 to 8 weeks</strong>,</p><p><strong>Total Estimated Time </strong>from Application to Visa Approval<strong>: 3 to 6 months</strong>, assuming</p><p>.</p><p><br></p><p class=\"ql-align-center\">  </p><p class=\"ql-align-center\"><br></p><h1><strong>💼 What Happens After Graduation (PSW)?</strong></h1><p>Once you finish your degree, you can apply for a <strong>12-month job-seeking permit</strong> to stay in Italy and look for work.</p><p>If you get hired, you can switch to a work visa — and even apply for an EU Blue Card later. It’s a great opportunity to launch your career in Italy or anywhere in Europe.</p><p><br></p><p class=\"ql-align-center\">  </p><p class=\"ql-align-center\"><br></p><h1><strong>🎓 Scholarships &amp; Financial Help</strong></h1><p>Italy offers affordable higher education, and many public universities charge little to no tuition for international students. To further support students, the Italian government provides <strong>regional scholarships</strong> (also known as DSU scholarships), which are need-based and help cover tuition fees, accommodation, meals, and living expenses. These scholarships are managed by regional authorities like LazioDisco, EDISU, and DSU Toscana, and are available to both EU and non-EU students. To apply, students must submit financial documents such as income certificates, often translated and verified for Italian use. Applications usually open between July and September and can be submitted after enrollment. These scholarships make studying in Italy both accessible and affordable for students from all backgrounds.</p><p><strong>&nbsp;</strong></p><h1><strong>🏫 Top Universities in Italy</strong></h1><ol><li><strong>University of Bologna https://www.unibo.it/en</strong></li><li><strong>Politecnico di Milano – https://www.polimi.it/en</strong></li><li><strong>Sapienza University of Rome – https://www.uniroma1.it/en</strong></li><li><strong>University of Padua – &nbsp;https://www.unipd.it/en</strong></li><li><strong>Bocconi University – &nbsp;https://www.unibocconi.it/en</strong></li><li><strong>University of Milan – &nbsp;https://www.unimi.it/en</strong></li><li><strong>Politecnico di Torino –&nbsp;</strong><a href=\"https://www.polito.it/en\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.polito.it/en</strong></a></li><li><strong>University of Turin (UniTo) :&nbsp;</strong><a href=\"https://www.unito.it/en\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.unito.it/en</strong></a></li><li><strong>University of Messina: </strong><a href=\"https://www.unime.it/\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.unime.it/</strong></a><strong> </strong></li><li><strong>University of Pisa :&nbsp;https://www.unipi.it/en</strong></li></ol>', '2025-08-05 02:10:42', '2025-08-05 02:10:42'),
(4, 4, '1754338487_Cyprus.jpg', 'Study in Cyprus', '<p>Looking for an affordable, safe, and exciting place to study in Europe? Cyprus might just be the perfect match for you! Cyprus is gaining popularity among international students for its quality education, English-taught programs, affordable tuition, and beautiful Mediterranean lifestyle. Whether you\'re interested in Business, IT, Hospitality, or Medicine—universities in Cyprus offer modern, globally recognized degrees that open doors worldwide. Plus, with sunny weather, a relaxed vibe, and welcoming locals, Cyprus offers the perfect balance between studying and enjoying life.</p>', '<p class=\"ql-align-justify\"><strong>Worried about expenses?</strong> Good news—international students can work up to 20 hours per week during classes. In the summer students can work for full time. It’s a great way to gain experience, improve your CV, and support your living costs.After graduation, you can explore work opportunities in Cyprus or even use it as a stepping stone for future plans across Europe.</p><p class=\"ql-align-justify\">Combining academic quality, career prospects, and cultural richness, <strong>studying in Cyprus offers a life-changing journey and a smart investment in your future.</strong></p><p><br></p><p><strong> Top reasons Why You should consider Cyprus:</strong></p><ul><li>Affordable tuition fees and living costs</li><li>English-taught programs available</li><li>Low IELTS or English language requirements</li><li>Smooth and student-friendly visa process</li><li>Part-time work opportunities for international students</li><li>Multicultural and inclusive environment</li><li>Member of the European Union (EU) – gateway to Europe</li><li>Safe and peaceful country with low crime rate</li><li>Beautiful Mediterranean lifestyle and climate</li><li>Opportunities to transfer or continue studies in other EU countries</li></ul><p><strong>Programs:</strong></p><p><strong>l&nbsp;Foundation</strong></p><p><strong>l&nbsp;Bachelor</strong></p><p><strong>l&nbsp;Master’s</strong></p><p><strong>Intakes:</strong></p><p class=\"ql-align-justify\"><strong>  </strong><span style=\"color: black;\">Intakes</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">Application Timeline</span></p><p class=\"ql-align-justify\">   January (Spring)</p><p class=\"ql-align-justify\"> Late<strong> October to early December</strong></p><p class=\"ql-align-justify\">   September (Fall)</p><p class=\"ql-align-justify\"> Late <strong>June to early August</strong></p><p>  <span style=\"color: black;\">&nbsp;</span></p><p><strong style=\"color: black;\">&nbsp;</strong></p><p><strong style=\"color: black;\">&nbsp;</strong></p><p><strong style=\"color: black;\">Eligibility Criteria:</strong></p><p><strong style=\"color: black;\">Bachelor : </strong>International students must complete <strong>12 years</strong> of education (such as HSC or A-Levels). </p><p><strong>Masters : &nbsp;</strong>Students need a <strong>Bachelor </strong>degree .</p><p><strong style=\"color: black;\">Language Requirement:</strong></p><p class=\"ql-align-justify\"><strong>  </strong><span style=\"color: black;\">English Language Test</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Required Score</span></p><p class=\"ql-align-justify\">   <span style=\"color: black;\">IELTS</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">Minimum overall band of 4.5-5.0</span></p><p class=\"ql-align-justify\">   <span style=\"color: black;\">PTE</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">overall score of 58+</span></p><p>  <span style=\"color: black;\">&nbsp;</span></p><p><strong style=\"color: black;\">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Visa Requirement:</strong></p><p class=\"ql-align-justify\">The <strong>visa approval rate for Bangladeshi students</strong> applying to study in Cyprus is relatively high. Meeting following requirements carefully increases your chances of a successful visa outcome:</p><p>&nbsp;</p><p><strong>1. </strong>Valid Passport</p><p><strong>2. </strong>Confirmation of Enrollment (COE) from your chosen university</p><p><strong>3. </strong>English proficiency proof</p><p><strong>4. </strong>Proof of sufficient funds</p><p><strong>5. </strong>Police clearance </p><p><strong>6. </strong>Medical test </p><p><strong>7. </strong>Recent passport sized photographs</p><p><strong style=\"color: black;\">8. </strong>Statement of Purposes (SOP)</p><p><strong style=\"color: black;\">9. </strong>Academic and work experience documents</p><p> </p><p> </p><p> </p><p><strong style=\"color: black;\">Visa Processing time &amp; preparations:</strong></p><p><strong style=\"color: black;\"> </strong></p><p><strong style=\"color: black;\"> </strong>To apply for a Cyprus student visa, Bangladeshi students should start the process <strong>at least three months</strong> before their planned travel, as processing times often exceed <strong>4 to 6 weeks</strong>. Proper preparation and timely submission of these documents greatly improve the chances of <strong>visa approval</strong>.</p><p> </p><p> </p><p> </p><p> </p><p>&nbsp;</p><p><strong>Scholarship Opportunities: </strong></p><p><strong>Most of the universities in Cyprus offer 10 to 50% scholarship for international students.</strong></p><p><strong>Partner Universities: </strong></p><p><strong>  University of Nicosia &nbsp;</strong><a href=\"https://unic.ac.cy/\" rel=\"noopener noreferrer\" target=\"_blank\">https://unic.ac.cy</a></p><p><strong>   Philips University </strong><a href=\"https://philipsuni.ac.cy/\" rel=\"noopener noreferrer\" target=\"_blank\">https://philipsuni.ac.cy</a></p><p><strong>   Neapolis University Pafos </strong><a href=\"https://www.nup.ac.cy/\" rel=\"noopener noreferrer\" target=\"_blank\">https://www.nup.ac.cy</a></p><p><strong>   UCLan Cyprus </strong><a href=\"https://www.uclancyprus.ac.cy/\" rel=\"noopener noreferrer\" target=\"_blank\">https://www.uclancyprus.ac.cy/</a></p><p><strong>   American College Nicosia </strong><a href=\"https://ac.ac.cy/\" rel=\"noopener noreferrer\" target=\"_blank\">https://ac.ac.cy</a></p><p><strong>  &nbsp;</strong></p>', '2025-08-05 02:14:47', '2025-08-05 02:16:37'),
(5, 5, '1754338698_newzeland.jpg', 'Study in New Zealand', '<p><strong>Why/About New Zealand?</strong></p><p class=\"ql-align-justify\">New Zealand is a top choice for international students due to its world-class education system, with all eight universities ranked globally and known for academic excellence in fields like IT, engineering, business, agriculture, and health sciences. The education system is based on the British model and focuses on practical, research-based learning that equips students for real-world challenges. As an English-speaking country, New Zealand offers a smooth transition for students from non-native backgrounds. It is also one of the safest and most peaceful countries in the world, with a welcoming and multicultural society. International students can work up to 24 hours per week during studies and full-time during holidays, and graduates are eligible for a post-study work visa of up to three years, creating a pathway to permanent residency. The cost of living and tuition is relatively affordable compared to countries like the USA, UK, or New Zealand, and many institutions offer scholarships, including early bird discounts. On top of academic and career opportunities, New Zealand’s breathtaking natural beauty like mountains, beaches, and forests; offers an exceptional quality of life and outdoor adventure, making it a perfect place to balance study and lifestyle.</p>', '<p><strong>Top 6 reasons Why You should consider New Zealand:</strong></p><p><strong>1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Globally recognized degrees.</p><p><strong>2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>PSW up-to 3 years.</p><p><strong>3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Clear pathway to PR</p><p><strong>4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Safe &amp; peaceful environment</p><p><strong>5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>Welcoming people &amp; multi-culture</p><p><strong>6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong>English speaking country</p><p><strong>Programs:</strong></p><p>l&nbsp;Foundation</p><p>l&nbsp;Bachelor</p><p>l&nbsp;Post Graduate Diploma/Pre Master’s</p><p>l&nbsp;Master’s (Taught/Research)</p><p><strong>Intakes:</strong></p><p class=\"ql-align-justify\">  <span style=\"color: black;\">Intakes</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">Application Timeline</span></p><p class=\"ql-align-justify\">   February</p><p class=\"ql-align-justify\"> October - November</p><p class=\"ql-align-justify\">   July</p><p class=\"ql-align-justify\"> April - May</p><p class=\"ql-align-justify\">   November (Selected Universities &amp; Courses)</p><p class=\"ql-align-justify\"> July - August</p><p>  <strong style=\"color: black;\">&nbsp;</strong></p><p><strong style=\"color: black;\">Eligibility Criteria:</strong></p><p class=\"ql-align-justify\">To apply for a <strong>Bachelor’s program</strong> in New Zealand, international students must complete <strong>12 years</strong> of education (such as HSC or A-Levels) with a minimum&nbsp;<strong>60%–70% marks</strong>. Some courses may require specific subjects or higher grade like Engineering, IT, Health, Social Work etc. If direct entry requirements aren’t met, students can opt for <strong>foundation leading to Bachelor programs</strong>.</p><p class=\"ql-align-justify\">For <strong>Master’s programs</strong>, applicants need a recognized <strong>Bachelor’s degree</strong> in a related field with at least <strong>60–70% marks</strong> or a <strong>GPA of 2.8–3.0</strong>. Competitive programs such as MBA or Data Science may demand higher academic performance or relevant working experience. Students with lower GPA can consider <strong>graduate diploma leading to Master’s programs.</strong></p><p class=\"ql-align-justify\"> </p><p class=\"ql-align-justify\"> </p><p class=\"ql-align-justify\"> </p><p><strong style=\"color: black;\">Language Requirement:</strong></p><p class=\"ql-align-justify\">  <span style=\"color: black;\">English Language Test</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">Required Score</span></p><p class=\"ql-align-justify\">   <span style=\"color: black;\">IELTS</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">Bachelor - Minimum overall band of 6.0 (with no band less than 5.5)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\"> Master’s - Minimum overall band of 6.5 (with no band less than 6.0)</span></p><p class=\"ql-align-justify\">   <span style=\"color: black;\">TOEFL</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">Minimum overall score of 79 (with minimum of 13 in Reading, 12 in Listening, 18 in Speaking and 21 in Writing)</span></p><p class=\"ql-align-justify\">   <span style=\"color: black;\">PTE</span></p><p class=\"ql-align-justify\"> <span style=\"color: black;\">Bachelor - overall score of 50 (with no communication band less than 42)</span></p><p class=\"ql-align-justify\"><span style=\"color: black;\">Master’s - overall score of 58 (with no communication band less than 50)</span></p><p>  <span style=\"color: black;\">&nbsp;</span></p><p><strong style=\"color: black;\">Visa Requirement:</strong></p><p class=\"ql-align-justify\">The <strong>visa approval rate for Bangladeshi students</strong> applying to study in New Zealand is relatively high. Meeting following requirements carefully increases your chances of a successful visa outcome:</p><p>&nbsp;</p><p><strong>1. </strong>Valid Passport</p><p><strong>2. </strong>Confirmation of Enrollment (COE) from your chosen university</p><p><strong>3. </strong>GS Statement (Genuine Student Statement)</p><p><strong>4. </strong>Proof of sufficient funds</p><p><strong>5. </strong>Overseas student health cover</p><p><strong>6. </strong>English proficiency proof</p><p><strong>7. </strong>Recent passport sized photographs</p><p><strong style=\"color: black;\">8. </strong>Statement of Purposes (SOP)</p><p><strong style=\"color: black;\">9. </strong>Academic and work experience documents (if need)</p><p> </p><p> </p><p> </p><p class=\"ql-align-justify\"><strong style=\"color: black;\">Visa Processing time &amp; preparations:</strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"> </strong></p><p class=\"ql-align-justify\"><strong style=\"color: black;\"> </strong>To apply for an New Zealand student visa, Bangladeshi students should start the process <strong>at least three months</strong> prior their planned travel, as processing times often exceed <strong>4 to 6 weeks</strong>. Proper preparation and timely submission of these documents greatly improve the chances of <strong>visa approval</strong>.</p><p class=\"ql-align-justify\"> </p><p class=\"ql-align-justify\"> </p><p class=\"ql-align-justify\"> <strong>Post Study Work Opportunities in New Zealand:</strong></p><p class=\"ql-align-justify\"><strong> </strong></p><p class=\"ql-align-justify\"><strong> </strong></p><p class=\"ql-align-justify\">New Zealand offers generous <strong>Post-Study Work (PSW) opportunities</strong> for international students . After completing at least <strong>two years of eligible study</strong> in New Zealand, graduates can stay and work for <strong>2 to 5 years</strong>, depending on their qualification. This visa allows full-time work rights and provides a valuable pathway to <strong>Permanent Residency (PR)</strong> under New Zealand’s skilled migration programs.</p><p><strong>&nbsp;</strong></p><p><strong>Scholarship Opportunities:</strong></p><p class=\"ql-align-justify\">New Zealand offers various scholarships for international students, including those from Bangladesh, to help with tuition costs. Government scholarships often cover full tuition and living expenses, while university scholarships usually cover part of the tuition. Typically up to <strong>25%</strong>, with some universities offering up to <strong>15,000$</strong>. Staying aware of scholarship amounts and deadlines is essential for applicants.</p><p class=\"ql-align-justify\"> </p><p class=\"ql-align-justify\"> </p><p><span style=\"color: rgb(59, 59, 59);\">·&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</span><strong>Partner Universities: </strong></p><p><strong> </strong></p><p><strong> </strong></p><p><strong style=\"color: rgb(59, 59, 59);\">1.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong><strong>University of Auckland - </strong><a href=\"https://www.auckland.ac.nz/en.html\" rel=\"noopener noreferrer\" target=\"_blank\"><strong>https://www.auckland.ac.nz/en.html</strong></a></p><p><strong style=\"color: rgb(59, 59, 59);\">2.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Auckland University of Technology - </strong><a href=\"https://www.aut.ac.nz/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(59, 59, 59);\"><strong>https://www.aut.ac.nz/</strong></a></p><p><strong style=\"color: rgb(59, 59, 59);\">3.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;University of Waikato - </strong><a href=\"https://www.waikato.ac.nz/int/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(59, 59, 59);\"><strong>https://www.waikato.ac.nz/int/</strong></a></p><p><strong style=\"color: rgb(59, 59, 59);\">4.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Victoria University of Wellington -</strong><a href=\"https://www.wgtn.ac.nz/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(59, 59, 59);\"><strong> https://www.wgtn.ac.nz/</strong></a></p><p><strong style=\"color: rgb(59, 59, 59);\">5.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;University of Canterbury - </strong><a href=\"https://www.canterbury.ac.nz/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(59, 59, 59);\"><strong>https://www.canterbury.ac.nz/</strong></a></p><p><strong style=\"color: rgb(59, 59, 59);\">6.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;University of Otago - </strong><a href=\"https://www.otago.ac.nz/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(59, 59, 59);\"><strong>https://www.otago.ac.nz/</strong></a></p><p><strong style=\"color: rgb(59, 59, 59);\">7.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;Lincoln University - </strong><a href=\"https://www.lincoln.ac.uk/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(59, 59, 59);\"><strong>https://www.lincoln.ac.uk/</strong></a></p><p><strong>8.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong><strong style=\"color: rgb(59, 59, 59);\">Unitec Institute of Technology - </strong><a href=\"https://www.unitec.ac.nz/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(59, 59, 59);\"><strong>https://www.unitec.ac.nz/</strong></a></p><p><strong>9.&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</strong><strong style=\"color: rgb(59, 59, 59);\">Massey University - </strong><a href=\"https://www.massey.ac.nz/\" rel=\"noopener noreferrer\" target=\"_blank\" style=\"color: rgb(59, 59, 59);\"><strong>https://www.massey.ac.nz/</strong></a></p>', '2025-08-05 02:18:18', '2025-08-05 02:18:18');

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
  `site_name` varchar(255) DEFAULT NULL,
  `site_favicon` varchar(255) DEFAULT NULL,
  `site_logo` varchar(255) DEFAULT NULL,
  `fb_logo` varchar(255) DEFAULT NULL,
  `fb_link` longtext DEFAULT NULL,
  `twitter_logo` varchar(255) DEFAULT NULL,
  `twitter_link` longtext DEFAULT NULL,
  `instagram_logo` varchar(255) DEFAULT NULL,
  `instagram_link` longtext DEFAULT NULL,
  `linkedin_logo` varchar(255) DEFAULT NULL,
  `linkedin_link` longtext DEFAULT NULL,
  `youtube_logo` varchar(255) DEFAULT NULL,
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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `logos`
--

INSERT INTO `logos` (`id`, `site_name`, `site_favicon`, `site_logo`, `fb_logo`, `fb_link`, `twitter_logo`, `twitter_link`, `instagram_logo`, `instagram_link`, `linkedin_logo`, `linkedin_link`, `youtube_logo`, `youtube_link`, `about_banner_image`, `about_hero_image`, `about_content`, `booking_content`, `login_banner_image`, `register_banner_image`, `site_address`, `site_email`, `site_phone`, `site_fax`, `service_banner_image`, `contact_banner_image`, `booking_banner_image`, `verify_otp_banner_image`, `verify_email_banner_image`, `reset_password_banner_image`, `created_at`, `updated_at`) VALUES
(1, 'Dreamland Tour and Study', '1754380347_dremlandLogo.png', '1754333646_dremlandLogoWhite.png', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL, '1754379874_canada.avif', '1754379678_WhatsApp Image 2025-08-05 at 13.35.07_009fd8e2.jpg', '<p>Italy offers affordable higher education, and many public universities charge little to no tuition for international students. To further support students, the Italian government provides <strong>regional scholarships</strong> (also known as DSU scholarships), which are need-based and help cover tuition fees, accommodation, meals, and living expenses. These scholarships are managed by regional authorities like Lazio Disco, EDISU, and DSU Toscana, and are available to both EU and non-EU students. To apply, students must submit financial documents such as income certificates, often translated and verified for Italian use. Applications usually open between July and September and can be submitted after enrollment. These scholarships make studying in Italy both accessible and affordable for students from all backgrounds.</p>', '<p>Italy offers affordable higher education, and many public universities charge little to no tuition for international students. To further support students, the Italian government provides <strong>regional scholarships</strong> (also known as DSU scholarships), which are need-based and help cover tuition fees, accommodation, meals, and living expenses. These scholarships are managed by regional authorities like Lazio Disco, EDISU, and DSU Toscana, and are available to both EU and non-EU students. To apply, students must submit financial documents such as income certificates, often translated and verified for Italian use. Applications usually open between July and September and can be submitted after enrollment. These scholarships make studying in Italy both accessible and affordable for students from all backgrounds.</p>', '1754380347_newzeland.jpg', '1754380347_nederlands.jpg', 'Havely Center, KA-11/2A (8Th Floor), Bashundhara Main Road,Vatra (Near Jamuna Future Park), Dhaka-1229, Bangladesh.', 'email@email.com', '+880123456789', '+880123456789', '1754380347_Belgium.jpg', '1754380347_Sweden.jpg', '1754380347_denmark.jpg', '1754380347_Italy.jpg', NULL, '1754380347_Cyprus.jpg', '2025-08-05 00:49:58', '2025-08-05 13:52:27');

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
(15, '2025_08_02_143726_create_universities_table', 1);

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
(1, 1, 'About Us', '<p class=\"ql-align-justify\">Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.</p><p class=\"ql-align-justify\">The standard chunk of Lorem Ipsum used since the 1500s is reproduced below for those interested. Sections 1.10.32 and 1.10.33 from \"de Finibus Bonorum et Malorum\" by Cicero are also reproduced in their exact original form, accompanied by English versions from the 1914 translation by H. Rackham.</p><p><br></p>', '1754339856_breadcrumb-bg_prev.jpg', 'about', 'about', '2025-08-05 02:37:36', '2025-08-05 02:37:36'),
(2, 2, 'Contact Us', '<p><span style=\"color: rgb(0, 0, 0);\">There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.</span></p>', '1754339932_blog-3.jpg', 'Contact Us', 'n the Internet tend to repeat predefined chunks as necessary, making this the first true ge', '2025-08-05 02:38:52', '2025-08-05 02:38:52');

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
(1, 'Terms and condition', 2, 'terms-and-condition', '2025-08-05 02:35:11', '2025-08-05 15:36:13'),
(2, 'Policy', 1, 'policy', '2025-08-05 02:35:34', '2025-08-05 15:36:00');

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
(1, 'booking-list', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(2, 'booking-save-page', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(3, 'booking-save', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(4, 'booking-update', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(5, 'booking-delete', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(6, 'country-list', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(7, 'country-save-page', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(8, 'country-save', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(9, 'country-update', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(10, 'country-delete', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(11, 'review-list', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(12, 'review-save-page', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(13, 'review-save', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(14, 'review-update', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(15, 'review-delete', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(16, 'service-category-list', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(17, 'service-category-save-page', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(18, 'save-service-category', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(19, 'update-service-category', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(20, 'delete-service-category', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(21, 'service-list', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(22, 'service-save-page', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(23, 'save-service', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(24, 'update-service', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(25, 'delete-service', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(26, 'student-list', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(27, 'student-save-page', 'web', '2025-08-05 00:47:08', '2025-08-05 00:47:08'),
(28, 'student-save', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(29, 'student-update', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(30, 'student-delete', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(31, 'success-stories-list', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(32, 'success-stories-save-page', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(33, 'success-stories-save', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(34, 'success-stories-update', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(35, 'success-stories-delete', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(36, 'list-role', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(37, 'role-save-page', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(38, 'create-role', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(39, 'update-role', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(40, 'delete-role', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(41, 'list-user', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(42, 'user-save-page', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(43, 'create-user', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(44, 'update-user', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(45, 'delete-user', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(46, 'page-content-list', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(47, 'page-content-save-page', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(48, 'page-content-save', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(49, 'page-content-update', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(50, 'page-content-delete', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(51, 'logo-list', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(52, 'logo-save-page', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(53, 'logo-save', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(54, 'logo-update', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(55, 'logo-delete', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(56, 'university-list', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(57, 'university-save-page', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(58, 'university-save', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(59, 'university-update', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(60, 'university-delete', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(61, 'country-detail-list', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(62, 'country-detail-save-page', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(63, 'country-detail-save', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(64, 'country-detail-update', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(65, 'country-detail-delete', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(66, 'page-list', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(67, 'page-save-page', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(68, 'page-save', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(69, 'page-update', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09'),
(70, 'page-delete', 'web', '2025-08-05 00:47:09', '2025-08-05 00:47:09');

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
(1, 'superadmin', 'web', '2025-08-05 00:47:10', '2025-08-05 00:47:10');

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
(70, 1);

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
(1, 1, '<h1><strong>One on One Counselling</strong></h1><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">Our experienced counselors evaluate student’s academic records, English proficiency, work experience, and financial capacity. This ensures them to meet the admission and visa requirements of their chosen study destinations, providing a clear and realistic pathway for overseas education.</p>', '1754334418_services_student_visa.png', 5, '2025-08-05 01:06:58', '2025-08-05 01:06:58'),
(2, 1, '<h1><strong>University and Program Placement</strong></h1><p><br></p><p class=\"ql-align-justify\">We shortlisted best fitted universities and courses considering of applicant’s academic profile, career goals, and personal interests. Our team provides up-to-date information on admission criteria, program details, and application deadlines to maximize the chances of acceptance.</p><p><br></p>', '1754334464_services_student_visa.png', 4, '2025-08-05 01:07:44', '2025-08-05 01:08:03'),
(3, 1, '<h1>Scholarship Assistance</h1><p><br></p><p>We guide students in finding scholarships that match with their profile, including fully funded and partial scholarships. Our support covers eligibility assessment, document preparation, application timelines, and submission processes to increase the possibilities of receiving financial aid.</p>', '1754334525_services_student_visa.png', 6, '2025-08-05 01:08:45', '2025-08-05 01:08:45'),
(4, 1, '<h1>Documentation Support</h1><p><br></p><p>Our experts assists in preparing accurate and complete sponsorship documents, such as financial statements, asset valuation, and bank solvency. We ensure these meet embassy requirements, helping to validate applicants financial support during the visa process.</p>', '1754334586_services_student_visa.png', 7, '2025-08-05 01:09:46', '2025-08-05 01:09:46'),
(5, 1, '<h1 class=\"ql-align-justify\">Statement of Purpose (SOP) Writing</h1><p class=\"ql-align-justify\"><br></p><p class=\"ql-align-justify\">We provide personalized guidance to craft a strong SOP that clearly presents applicant’s academic background, motivation, and career plans. Each statement is tailored to specific university expectations, enhancing your application’s impact.</p><p><br></p>', '1754334627_services_student_visa.png', 8, '2025-08-05 01:10:27', '2025-08-05 01:10:37'),
(6, 1, '<h1>Visa Application Guidance</h1><p><br></p><p class=\"ql-align-justify\">From compiling documents to interview preparation, we offer thorough guidance throughout your visa application. Our team ensures your submission is accurate, timely, and aligns with embassy standards to improve the visa approval chances.</p>', '1754334681_services_student_visa.png', 9, '2025-08-05 01:11:21', '2025-08-05 01:11:21'),
(7, 1, '<h1>Pre-Departure Briefing</h1><p><br></p><p class=\"ql-align-justify\">We prepare our students with practical advice on travel, accommodation, cultural adjustment, academic expectations, and safety protocols. This briefing helps to start overseas education confidently and smoothly.</p>', '1754334720_services_student_visa.png', 10, '2025-08-05 01:12:00', '2025-08-05 01:12:00'),
(8, 2, '<h1><strong>AIR TICKET: OUR SERVICE</strong></h1><p>&nbsp;</p><p>We-Dreamland Education &amp; Tourism- are your trusted partner for fast, reliable, and affordable travel ticketing. Whether you\'re flying for business, leisure, or emergency, we make booking simple and stress-free. From <strong>local</strong> to <strong>internationa</strong>l flights all over the world, we help you reach your destination with ease and confidence.</p><p><strong>Your journey starts here—let us take care of your ticket!</strong></p>', '1754335318_services_air_ticket.jpg', 11, '2025-08-05 01:21:58', '2025-08-05 01:21:58'),
(9, 3, '<h1><strong>Tourist Visa: Our Comprehensive Services</strong></h1><p><br></p><p>Traveling abroad opens the door to new experiences, cultures, and opportunities — but the visa application process can often feel overwhelming. At Dreamland Education &amp; Tourism, we take the stress out of visa applications by providing expert guidance and personalized support from start to finish.</p><p>Whether you’re planning a leisure trip, vacation, attending a business conference, enrolling in an educational program, or requiring transit visas, our experienced team is dedicated to making your journey seamless and worry-free. We stay updated with the latest embassy policies, country-specific requirements, and document standards to ensure your application is thorough and meets all necessary criteria.</p><p><strong>Our services</strong> cover popular destinations such as The United States, United Kingdom, Canada, Australia, Schengen countries (like Germany, France, Italy), Thailand, Malaysia and the UAE(Dubai)-From appointment booking to interview preparations, Hotel reservation- we ensure nothing is left to chance.</p>', '1754335563_services_tourist_visa.jpg', 12, '2025-08-05 01:26:03', '2025-08-05 01:26:03');

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
(1, 'Study Abroad', 'We shortlisted best fitted universities and courses considering of applicant’s academic profile, career goals, and personal interests.', '1754334297_services_student_visa.png', 5, '2025-08-05 01:04:57', '2025-08-05 01:14:57'),
(2, 'Air Ticket Service', 'We provide all kind of air ticket', '1754335205_services_air_ticket.jpg', 6, '2025-08-05 01:20:05', '2025-08-05 01:20:05'),
(3, 'Tourist Visa', 'Traveling abroad opens the door', '1754335455_services_tourist_visa.jpg', 1, '2025-08-05 01:24:15', '2025-08-05 01:24:15');

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
('4chafEqhvsYr88FjTudRYHF8ktJbggoODPHqnBBL', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YTo0OntzOjY6Il90b2tlbiI7czo0MDoiTEFqQjVzSlcwUWd2SU5oYk9aMDR6OFEwU0RnaWloTjhoeFFPMTZrTSI7czo5OiJfcHJldmlvdXMiO2E6MTp7czozOiJ1cmwiO3M6Mjc6Imh0dHA6Ly8xMjcuMC4wLjE6ODAwMC9hYm91dCI7fXM6NjoiX2ZsYXNoIjthOjI6e3M6Mzoib2xkIjthOjA6e31zOjM6Im5ldyI7YTowOnt9fXM6NTA6ImxvZ2luX3dlYl81OWJhMzZhZGRjMmIyZjk0MDE1ODBmMDE0YzdmNThlYTRlMzA5ODlkIjtpOjE7fQ==', 1754380371),
('HH99WpoBBhxB0THyR3v2KvQ7DRpXOJMLNLJNDQF5', 2, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoidE83ZEU0VEFkd2o0cjdhV3Vwem9tdDdvQ1V5SkZERkZpNGxKNm9oTyI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6Mjt9', 1754385758),
('IjZGaATd0OeeMtKnSzcY6ai4aQbcXYbvbCbQQcCg', 1, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:141.0) Gecko/20100101 Firefox/141.0', 'YTozOntzOjY6Il90b2tlbiI7czo0MDoiVllUc29Oc1VWbExLcmQxTWwwcDBNbk1VWUpVbDlPZzNWN1dLQzI5WSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319czo1MDoibG9naW5fd2ViXzU5YmEzNmFkZGMyYjJmOTQwMTU4MGYwMTRjN2Y1OGVhNGUzMDk4OWQiO2k6MTt9', 1754386574),
('VFthWvcq7ugLu9OXOHWydK3Bwk1yueOn91Ejbeod', NULL, '127.0.0.1', 'Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/138.0.0.0 Safari/537.36', 'YToyOntzOjY6Il90b2tlbiI7czo0MDoiS2l1OGNWWUdaRDhHSlhNMm95aDMxeXlCM242ZktoSE9ocXViV0R3WSI7czo2OiJfZmxhc2giO2E6Mjp7czozOiJvbGQiO2E6MDp7fXM6MzoibmV3IjthOjA6e319fQ==', 1754386000);

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
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `student_reviews`
--

INSERT INTO `student_reviews` (`id`, `name`, `title`, `image`, `description`, `rating`, `created_at`, `updated_at`) VALUES
(1, 'Lorem Ipsum', 'Where can I get some?', '1754339949_guide-3.jpg', 'There are many variations of passages of Lorem Ipsum available, but the majority have suffered alteration in some form, by injected humour, or randomised words which don\'t look even slightly believable. If you are going to use a passage of Lorem Ipsum, you need to be sure there isn\'t anything embarrassing hidden in the middle of text. All the Lorem Ipsum generators on the Internet tend to repeat predefined chunks as necessary, making this the first true generator on the Internet. It uses a dictionary of over 200 Latin words, combined with a handful of model sentence structures, to generate Lorem Ipsum which looks reasonable. The generated Lorem Ipsum is therefore always free from repetition, injected humour, or non-characteristic words etc.', 4.00, '2025-08-05 02:31:09', '2025-08-05 02:39:09'),
(2, 'Where does it come from', 'Where does it come from', '1754339962_guide-2.jpg', 'Contrary to popular belief, Lorem Ipsum is not simply random text. It has roots in a piece of classical Latin literature from 45 BC, making it over 2000 years old. Richard McClintock, a Latin professor at Hampden-Sydney College in Virginia, looked up one of the more obscure Latin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature, discovered the undoubtable source. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of \"de Finibus Bonorum et Malorum\" (The Extremes of Good and Evil) by Cicero, written in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, \"Lorem ipsum dolor sit amet..\", comes from a line in section 1.10.32.', 5.00, '2025-08-05 02:31:56', '2025-08-05 02:39:22'),
(3, 'Lorem Ipsum', 'What is Lorem Ipsum?', '1754339977_testimonial-2.jpg', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.', 5.00, '2025-08-05 02:32:46', '2025-08-05 02:39:37');

-- --------------------------------------------------------

--
-- Table structure for table `success_stories`
--

CREATE TABLE `success_stories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `video` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `success_stories`
--

INSERT INTO `success_stories` (`id`, `image`, `video`, `created_at`, `updated_at`) VALUES
(1, '1754378439.explore-tour-3.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/0NXnRmoILSs?si=agkXGkHEhwf--Hse\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', '2025-08-05 13:20:39', '2025-08-05 13:20:39'),
(2, '1754378488.gallery-1.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fuY2BGi2hAM?si=c6iYYnBSdi2i8qn9\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', '2025-08-05 13:21:28', '2025-08-05 13:21:28'),
(3, '1754378501.breadcrumb-bg.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/fuY2BGi2hAM?si=c6iYYnBSdi2i8qn9\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', '2025-08-05 13:21:41', '2025-08-05 13:21:41'),
(4, '1754378580.carousel-3.jpg', '<iframe width=\"560\" height=\"315\" src=\"https://www.youtube.com/embed/iu7N078PuWc?si=97S2_WoqjTE7weQS\" title=\"YouTube video player\" frameborder=\"0\" allow=\"accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share\" referrerpolicy=\"strict-origin-when-cross-origin\" allowfullscreen></iframe>', '2025-08-05 13:23:00', '2025-08-05 13:23:00');

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
(1, 2, 'University of Bologna', '1754379033_countries-1.jpg', 'University in Belgium', 1, '2025-08-05 13:30:33', '2025-08-05 13:30:33'),
(2, 1, 'Politecnico di Milano', '1754379114_countries-5.jpg', 'Politecnico di Milano', 2, '2025-08-05 13:31:54', '2025-08-05 13:31:54'),
(3, 3, 'Politecnico di Milano', '1754379139_countries-2.jpg', 'Politecnico di Milano', 3, '2025-08-05 13:32:19', '2025-08-05 13:32:19'),
(4, 4, 'Politecnico di Milano', '1754379162_countries-3.jpg', 'Politecnico di Milano', 4, '2025-08-05 13:32:42', '2025-08-05 13:32:42'),
(5, 5, 'Politecnico di Milano', '1754379180_explore-tour-3.jpg', 'Politecnico di Milano', 5, '2025-08-05 13:33:00', '2025-08-05 13:33:00');

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
(1, 'superadmin', 'superadmin@gmail.com', '$2y$12$ks0p7KSMHRb32yLUEB3IzurVAbmtOd9nJMWrQow7y60Qh1207os.G', '1234567890', '12345678', 'admin', '1754385194.jpg', 'Enable', '0', '2025-08-05 00:47:10', '2025-08-05 15:17:51'),
(2, 'affan', 'affan@gamil.com', '$2y$12$tOsxrknpBB.RGLPa3y.YqeDOLwWB0C1f0bEpH70GF3q5XVbWbpqgW', '12345678', NULL, 'student', '1754385754.jpg', 'Enable', '0', '2025-08-05 14:33:06', '2025-08-05 15:22:34');

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
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `student_reviews`
--
ALTER TABLE `student_reviews`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `success_stories`
--
ALTER TABLE `success_stories`
  ADD PRIMARY KEY (`id`);

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
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `country_details`
--
ALTER TABLE `country_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

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
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=71;

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
-- AUTO_INCREMENT for table `student_reviews`
--
ALTER TABLE `student_reviews`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `success_stories`
--
ALTER TABLE `success_stories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

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
