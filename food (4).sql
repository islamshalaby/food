-- phpMyAdmin SQL Dump
-- version 4.6.6deb5
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Aug 06, 2020 at 12:33 PM
-- Server version: 5.7.30-0ubuntu0.18.04.1
-- PHP Version: 7.2.31-1+ubuntu18.04.1+deb.sury.org+1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `food`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `updated_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) NOT NULL,
  `add_data` tinyint(1) NOT NULL DEFAULT '0',
  `update_data` tinyint(1) NOT NULL DEFAULT '0',
  `delete_data` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `name`, `email`, `created_at`, `updated_at`, `password`, `add_data`, `update_data`, `delete_data`) VALUES
(1, 'Super Admin', 'admin@admin.com', '2020-02-19 08:44:50', '2020-02-24 14:06:28', '$2y$10$IQ8M6C.879gvIw54Y08.N.D5ATolN9AktgFXBvAlTBxXE5PzRmd5G', 1, 1, 1),
(3, 'manager33', 'admin@admin3.com', '2020-02-19 10:50:31', '2020-02-19 11:06:12', '$2y$10$Ui0gZLEUy6YarW7okzvNgeBsoLfu4h2CndJkPLnZbu2Tcn9AfkQle', 0, 0, 0),
(4, 'test name', 'admin22@admin.com', '2020-02-19 12:43:40', '2020-02-19 12:43:40', '$2y$10$/7h98VQ0XrGgZ14TXiZn4OHMTmrWKoUykt1x5Q6o7h2Kdylo6k/CG', 0, 0, 0),
(5, 'manager4', 'manager@manager.co', '2020-02-19 13:00:00', '2020-02-19 13:00:00', '$2y$10$MHvXZVU8iSMTUhXtO4t8h.JuA80GcGADmmtMyp02DvI7hG5w7wtgi', 0, 0, 0),
(6, 'sadsa', 'asda@hgh.com', '2020-02-19 13:01:11', '2020-02-19 13:01:11', '$2y$10$861HYnfj/D68ZmEFBbaXqOpC7VegdABOBswCG1S00bc9I4HTtY5X.', 0, 0, 0),
(7, 'manager Name', 'manager@man.com', '2020-02-19 13:05:12', '2020-02-19 13:05:12', '$2y$10$dJiHXbxdeQeZk1PGVHEV7.pRrUT.sL7KOXrD4nfXItaOqh8qA1dXa', 0, 0, 0),
(8, 'Admin With Permition', 'admin@admin18.com', '2020-02-19 13:25:11', '2020-02-19 13:25:11', '$2y$10$2rELqWaPoWf/qFmOFiKYn.cCuOVQauWRe.MfKBZUk2jnT2aTtTK2m', 0, 0, 0),
(9, 'test', 'test@test.com', '2020-02-20 05:30:10', '2020-02-20 05:30:10', '$2y$10$7fHeRr886MOh.5E/2AoSTOI3nD9UpmHoIFG1tRbASiLfEk5XZT48O', 0, 0, 0),
(10, 'Admin Tested', 'tested@gmail.com', '2020-02-20 07:17:27', '2020-02-20 07:17:27', '$2y$10$B3TkLlv/T42Z//vMUuSYauAGEk44ae9JDNirmUZwyQ8xbkkzSzPpm', 0, 0, 0),
(11, 'Admin', 'admin28@admin.com', '2020-02-24 08:54:51', '2020-02-24 08:54:51', '$2y$10$tIjEcMcLtdoe5mjscdQrKOvm0rnhwVYpubw/MyBEliDPJQC1HfG2W', 0, 0, 0),
(12, 'gfgf', 'fdf@gh.vom', '2020-02-24 09:01:18', '2020-02-24 09:12:40', '$2y$10$eY.gEsu.8ule1zgs1Pfw1u7gnMKDC5wo.W7MfEj3zQmoD9zPeqGUS', 0, 1, 1),
(13, 'test', 'tets@tetst.com', '2020-04-12 13:26:02', '2020-04-12 13:26:02', '$2y$10$sKuir65TxpW.RrRhzCqRKe/nUKDUnWtv9cujab7ZqDVnFCNSl5UkC', 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_permissions`
--

CREATE TABLE `admin_permissions` (
  `id` int(11) NOT NULL,
  `admin_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `admin_permissions`
--

INSERT INTO `admin_permissions` (`id`, `admin_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(27, 8, 1, '2020-02-20 07:16:53', '2020-02-20 07:16:53'),
(28, 8, 4, '2020-02-20 07:16:53', '2020-02-20 07:16:53'),
(29, 8, 5, '2020-02-20 07:16:53', '2020-02-20 07:16:53'),
(30, 8, 8, '2020-02-20 07:16:53', '2020-02-20 07:16:53'),
(31, 8, 9, '2020-02-20 07:16:53', '2020-02-20 07:16:53'),
(61, 10, 4, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(62, 10, 5, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(63, 10, 6, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(64, 10, 7, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(65, 10, 8, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(66, 10, 9, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(67, 10, 10, '2020-02-20 10:39:07', '2020-02-20 10:39:07'),
(116, 1, 1, '2020-02-20 11:18:23', '2020-02-20 11:18:23'),
(117, 1, 2, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(118, 1, 3, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(119, 1, 4, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(120, 1, 5, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(121, 1, 6, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(122, 1, 7, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(123, 1, 8, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(124, 1, 9, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(125, 1, 10, '2020-02-20 11:18:24', '2020-02-20 11:18:24'),
(126, 3, 1, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(127, 3, 2, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(128, 3, 3, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(129, 3, 4, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(130, 3, 5, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(131, 3, 6, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(132, 3, 7, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(133, 3, 8, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(134, 3, 9, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(135, 3, 10, '2020-02-20 11:21:03', '2020-02-20 11:21:03'),
(136, 9, 1, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(137, 9, 2, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(138, 9, 3, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(139, 9, 4, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(140, 9, 5, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(141, 9, 6, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(142, 9, 7, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(143, 9, 8, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(144, 9, 9, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(145, 9, 10, '2020-02-20 11:21:09', '2020-02-20 11:21:09'),
(146, 7, 1, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(147, 7, 2, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(148, 7, 3, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(149, 7, 4, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(150, 7, 5, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(151, 7, 6, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(152, 7, 7, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(153, 7, 8, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(154, 7, 9, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(155, 7, 10, '2020-02-20 11:21:18', '2020-02-20 11:21:18'),
(156, 6, 5, '2020-02-20 11:21:26', '2020-02-20 11:21:26'),
(157, 6, 9, '2020-02-20 11:21:26', '2020-02-20 11:21:26'),
(158, 5, 6, '2020-02-20 11:21:31', '2020-02-20 11:21:31'),
(159, 5, 10, '2020-02-20 11:21:31', '2020-02-20 11:21:31'),
(160, 4, 6, '2020-02-20 11:21:36', '2020-02-20 11:21:36'),
(161, 4, 10, '2020-02-20 11:21:36', '2020-02-20 11:21:36'),
(162, 11, 1, '2020-02-24 08:54:51', '2020-02-24 08:54:51'),
(163, 11, 2, '2020-02-24 08:54:51', '2020-02-24 08:54:51'),
(164, 11, 3, '2020-02-24 08:54:51', '2020-02-24 08:54:51'),
(165, 11, 4, '2020-02-24 08:54:51', '2020-02-24 08:54:51'),
(166, 11, 5, '2020-02-24 08:54:51', '2020-02-24 08:54:51'),
(167, 11, 6, '2020-02-24 08:54:52', '2020-02-24 08:54:52'),
(168, 11, 7, '2020-02-24 08:54:52', '2020-02-24 08:54:52'),
(169, 11, 8, '2020-02-24 08:54:52', '2020-02-24 08:54:52'),
(170, 11, 9, '2020-02-24 08:54:52', '2020-02-24 08:54:52'),
(171, 11, 10, '2020-02-24 08:54:52', '2020-02-24 08:54:52'),
(212, 12, 1, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(213, 12, 2, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(214, 12, 3, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(215, 12, 4, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(216, 12, 5, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(217, 12, 6, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(218, 12, 7, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(219, 12, 8, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(220, 12, 9, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(221, 12, 10, '2020-02-24 09:12:40', '2020-02-24 09:12:40'),
(222, 13, 2, '2020-04-12 13:26:02', '2020-04-12 13:26:02'),
(223, 13, 4, '2020-04-12 13:26:02', '2020-04-12 13:26:02'),
(224, 13, 6, '2020-04-12 13:26:02', '2020-04-12 13:26:02'),
(225, 13, 7, '2020-04-12 13:26:02', '2020-04-12 13:26:02'),
(226, 13, 10, '2020-04-12 13:26:02', '2020-04-12 13:26:02'),
(227, 13, 11, '2020-04-12 13:26:02', '2020-04-12 13:26:02'),
(228, 1, 11, '2020-04-11 21:00:00', '2020-04-11 21:00:00'),
(229, 1, 12, '2020-07-13 22:00:00', '2020-07-13 22:00:00'),
(230, 1, 13, '2020-07-13 22:00:00', '2020-07-13 22:00:00'),
(231, 1, 14, '2020-07-13 22:00:00', '2020-07-13 22:00:00'),
(232, 1, 15, '2020-07-13 22:00:00', '2020-07-13 22:00:00'),
(233, 1, 16, '2020-07-14 22:00:00', '2020-07-14 22:00:00'),
(234, 1, 17, '2020-07-15 22:00:00', '2020-07-15 22:00:00'),
(235, 1, 18, '2020-07-18 22:00:00', '2020-07-18 22:00:00'),
(236, 1, 19, '2020-07-20 22:00:00', '2020-07-20 22:00:00'),
(237, 1, 20, '2020-07-28 22:00:00', '2020-07-28 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `ads`
--

CREATE TABLE `ads` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type` int(11) DEFAULT NULL,
  `content` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `place` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `ads`
--

INSERT INTO `ads` (`id`, `image`, `type`, `content`, `place`, `created_at`, `updated_at`) VALUES
(1, 'vhjr9mmwhdgoo5nwzjq2.jpg', 2, 'https://www.u-smart.co/', NULL, '2020-07-20 06:53:15', '2020-07-27 03:37:07'),
(2, 'dqncsw0nhjtdoqr3hdvf.jpg', 2, 'https://www.u-smart.co/', NULL, '2020-07-20 07:17:38', '2020-07-27 03:35:26'),
(3, 'cuyi1syeg4ommqfsx7lu.jpg', 2, 'https://www.u-smart.co/', NULL, '2020-07-27 03:39:46', '2020-07-27 03:39:46');

-- --------------------------------------------------------

--
-- Table structure for table `areas`
--

CREATE TABLE `areas` (
  `id` int(11) NOT NULL,
  `title_en` varchar(100) NOT NULL,
  `title_ar` varchar(100) NOT NULL,
  `delivery_cost` varchar(50) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `areas`
--

INSERT INTO `areas` (`id`, `title_en`, `title_ar`, `delivery_cost`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'الجهراء', 'الجهراء', '5', 0, '2020-06-09 20:09:52', '2020-07-27 09:27:26'),
(2, 'الفروانية', 'الفروانية', '5', 0, '2020-06-09 20:10:17', '2020-07-27 09:18:46'),
(3, 'test', 'تست', '25.5', 1, '2020-07-14 06:19:57', '2020-07-14 06:45:40'),
(4, 'الكويت', 'الكويت', '5', 0, '2020-07-27 09:48:54', '2020-07-27 09:48:54');

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` int(11) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `brands`
--

INSERT INTO `brands` (`id`, `title_en`, `title_ar`, `image`, `category_id`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'جهينة', 'جهينة', 'myzsxlxu3hvkkaplhmyx.png', 4, 0, '2020-05-11 22:07:54', '2020-07-27 04:20:22'),
(2, 'ساديا', 'ساديا', 'mkygisafenbbdd7urtsf.jpg', 4, 0, '2020-05-11 22:08:45', '2020-07-27 04:19:20'),
(3, 'المراعي', 'المراعي', 'ybiovzedxgzlllqlry4j.png', 4, 0, '2020-07-14 08:31:01', '2020-07-27 04:13:08'),
(4, 'شاي ليبتون', 'شاي ليبتون', 'hljbr3e9ust4fqrmsddr.png', 8, 0, '2020-07-27 04:25:59', '2020-07-27 09:53:19'),
(5, 'بيبسي', 'بيبسي', 'wncak2fpldq8iq4hkqst.png', 8, 0, '2020-07-27 04:27:05', '2020-07-27 04:27:05'),
(6, 'نستلة', 'نستلة', 'uhzrvnphmpkuynemdzxt.jpg', 5, 0, '2020-07-27 04:28:11', '2020-07-27 04:31:23'),
(7, 'dhjgdhdglllllll', 'kldfhkdfjgkdgjkd', 'mj13kox8eegpzpveumlg.png', NULL, 0, '2020-07-27 13:19:52', '2020-07-27 13:22:26');

-- --------------------------------------------------------

--
-- Table structure for table `carts`
--

CREATE TABLE `carts` (
  `id` int(11) NOT NULL,
  `visitor_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `carts`
--

INSERT INTO `carts` (`id`, `visitor_id`, `product_id`, `count`, `created_at`, `updated_at`) VALUES
(1, 1, 1, 5, '2020-06-21 05:59:44', '2020-06-21 05:59:44'),
(6, 10, 4, 2, '2020-07-28 06:13:52', '2020-07-28 06:15:22'),
(17, 6, 3, 1, '2020-07-29 11:23:11', '2020-07-29 11:23:11');

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(300) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_en` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `title_ar` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `image`, `title_en`, `title_ar`, `deleted`, `created_at`, `updated_at`) VALUES
(1, 'wgij1tok4dqy0qb47gya.png', 'المشروبات', 'المشروبات', 1, NULL, '2020-07-27 04:01:23'),
(2, 'qy7qogtuko4gxl5bnamk.png', 'المواد الغذائية', 'المواد العذائية', 1, '2020-02-17 10:22:19', '2020-07-27 04:01:20'),
(3, 'f9o8glxaipqpcgoyfmnn.jpg', 'nnnn', 'nnnn', 1, '2020-02-18 12:34:41', '2020-02-26 16:00:11'),
(4, 'co8oudulxoqqrkpdeuwl.png', 'الأطعمة الطازجة', 'الأطعمة الطازجة', 0, '2020-07-17 16:02:00', '2020-07-28 05:48:38'),
(5, 'hsqt9imyzqufgzeobn3c.png', 'العناية بالطفل', 'العناية بالطفل', 0, '2020-07-27 03:55:18', '2020-07-28 05:48:12'),
(6, 'vbbpdixdqeu7hbanufxj.png', 'لوازم المنزل', 'لوازم المنزل', 0, '2020-07-27 03:56:29', '2020-07-28 05:47:14'),
(7, 'pnkdvbdh78ry4uwisrho.png', 'المواد العذائية', 'المواد العذائية', 0, '2020-07-27 04:07:00', '2020-07-28 05:44:48'),
(8, 'jchrhs4yxygk4rjt8tqs.png', 'المشروبات', 'المشروبات', 0, '2020-07-27 04:07:19', '2020-07-28 05:44:28');

-- --------------------------------------------------------

--
-- Table structure for table `contact_us`
--

CREATE TABLE `contact_us` (
  `id` int(10) UNSIGNED NOT NULL,
  `phone` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `message` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `seen` tinyint(1) NOT NULL DEFAULT '0',
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `contact_us`
--

INSERT INTO `contact_us` (`id`, `phone`, `message`, `seen`, `created_at`, `updated_at`) VALUES
(1, '+201090751347', 'test body message', 0, '2020-02-17 12:59:08', '2020-02-26 13:11:50'),
(2, '+201090751347', 'test', 0, '2020-03-22 05:50:40', '2020-03-22 05:50:40'),
(3, '555555555555', 'البحث عن المشاركات التي كتبها ام دبليو ام دبليو ام دبليو ام دبليو ام دبليو ام دبليو ام دبليو أم لا وهل هناك تعليقات روابط هذه الرساله حذفت بواسطه ام', 1, '2020-04-01 09:59:07', '2020-04-01 09:59:22'),
(4, '555555555555', 'البحث عن المشاركات التي كتبها ام دبليو ام دبليو ام دبليو ام دبليو ام دبليو ام دبليو ام دبليو أم لا وهل هناك تعليقات روابط هذه الرساله حذفت بواسطه ام', 0, '2020-04-01 10:26:02', '2020-04-01 10:26:02'),
(5, '2334242423423423423', 'البحث عن المشاركات التي كتبها ام دبليو ام دبليو ام دبليو ام دبليو ام دبليو ام دبليو ام دبليو ام دبليو ام دبليو', 0, '2020-04-01 10:28:23', '2020-04-01 10:28:23'),
(6, '324234324242342342', 'الصورة الأصلية التي كتبت بواسطة يارب يارب العالمين يارب يارب العالمين اللهم صل وسلم على نبينا', 0, '2020-04-01 10:29:51', '2020-04-01 10:29:51'),
(7, '324234324242342342', 'الصورة الأصلية التي كتبت بواسطة يارب يارب العالمين يارب يارب العالمين اللهم صل وسلم على نبينا', 0, '2020-04-01 10:30:37', '2020-04-01 10:30:37'),
(8, '2423423423423423', 'ارسال الي الان عن مواضيع نور على نبينا الكريم من المملكة على هذا', 0, '2020-04-01 10:32:14', '2020-04-01 10:32:14'),
(9, '123123121212312312312', 'الصورة الأصلية التي كتبت بواسطة ام لا و الف شكر على نبينا الكريم على هذا الرابط التالي على نبينا الكريم من المملكة على هذا الرابط فقط ام دبليو أم أن الأمر لا وهل هو الذي على هذا الموضوع الى قسم منتدى الصور العام على نبينا الكريم على هذا الموضوع المفيد أن يكون قد سبق له العمل على هذا الرابط التالي لمشاهده', 1, '2020-04-01 10:36:10', '2020-04-01 10:36:29'),
(10, '6265552235522552', 'good morning I am not sure if you have any questions or concerns please visit the plug-in settings to determine how attachments are not the intended recipient you are', 1, '2020-04-01 10:37:25', '2020-04-01 10:37:32'),
(11, '8555855555555555', 'السلام عليكم ورحمه الله وبركاته ازيك يا حبيبي عامل ايه يا عم الشيخ الحويني في مجال المبيعات اونلاين اونلاين مشاهده مباشره مشاهده مسلسل وادي الذئاب الجزء الثامن الحلقه الاولى من نوعها في العالم العربي والإسلامي الله وبركاته ازيك يا حبيبي عامل ايه يا عم الشيخ الحويني في مجال المبيعات اونلاين اونلاين', 1, '2020-04-01 10:39:39', '2020-04-01 10:39:52'),
(12, '522222555555555', 'افتح الايميل وهتلاقيها في مجال المبيعات اونلاين اونلاين مشاهده مباشره مشاهده مسلسل وادي الذئاب الجزء الثامن الحلقه الاولى من نوعها في العالم العربي', 1, '2020-04-01 10:41:43', '2020-04-01 10:41:59'),
(13, '6767668664386353', 'برامج كمبيوتر برامج مجانيه برامج كامله برامج كمبيوتر برامج مجانيه برامج كامله برامج كمبيوتر برامج مجانيه برامج كامله العاب تلبيس العاب فلاش بنات ستايل من شوية من غير زعل مع نوح من شوية من على النت من على التليفون او لا اكون في طلبات التصميم بس مش هينفع ينزل على ال ابراهيم وبارك الله فيك اخي الكريم على هذا', 0, '2020-04-01 19:36:55', '2020-04-01 19:36:55'),
(14, '+20111837797', 'hi there I am interested in the position and would like to know if you have any questions please feel free to contact me at any time and I will be there at any time and I will be there at any time and I will be there at any time and I will make sure to get the position of a few things to do in the morning and I will be there at any time and I will be there', 0, '2020-04-02 17:12:52', '2020-04-02 17:12:52'),
(15, '01271665716', 'Test me', 0, '2020-04-07 18:29:19', '2020-04-07 18:29:19'),
(16, '٠٥٤٥٥٥', 'زلللللب', 0, '2020-04-09 14:33:44', '2020-04-09 14:33:44'),
(17, '١١١١١١١١', 'تجربة', 1, '2020-04-09 16:00:25', '2020-04-09 16:00:33'),
(18, '674664646', 'Hshshs', 0, '2020-04-11 12:43:35', '2020-04-11 12:43:35'),
(19, '949', 'Ejjej', 0, '2020-04-11 18:57:04', '2020-04-11 18:57:04'),
(20, '9', 'تت', 0, '2020-04-13 10:57:37', '2020-04-13 10:57:37'),
(21, '55411928', 'Nooh', 0, '2020-04-13 18:53:32', '2020-04-13 18:53:32'),
(22, '98758835585888888', 'وعليكم السلام ورحمه الله وبركاته مساء', 1, '2020-04-16 09:59:13', '2020-04-16 09:59:25'),
(23, '5555', 'يثثق٣', 0, '2020-04-16 10:13:52', '2020-04-16 10:13:52'),
(24, '35555555555', 'sdsdfsdfsd sdfsd SD fsd sdfsd sdfsfsf sdfsd for sdfsdsdsd sdsdfsdfsd fade away from the office and I will be there at the', 1, '2020-04-21 13:36:25', '2020-04-21 13:36:40'),
(25, '9875833099', 'ىربووتثتثتثت', 0, '2020-04-22 22:08:25', '2020-04-22 22:08:25'),
(26, '6665555', 'Gfffr', 0, '2020-04-22 22:24:19', '2020-04-22 22:24:19'),
(27, '858', 'Ddd', 1, '2020-04-22 22:25:00', '2020-04-23 03:31:29'),
(28, '+201090751347', 'test', 0, '2020-07-28 01:52:12', '2020-07-28 01:52:12');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `favorites`
--

CREATE TABLE `favorites` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `favorites`
--

INSERT INTO `favorites` (`id`, `user_id`, `product_id`, `created_at`, `updated_at`) VALUES
(2, 32, 1, '2020-06-07 01:41:08', '2020-06-07 01:41:08'),
(4, 31, 5, '2020-07-28 07:01:11', '2020-07-28 07:01:11'),
(5, 31, 4, '2020-07-28 07:01:27', '2020-07-28 07:01:27'),
(6, 31, 11, '2020-07-28 08:32:33', '2020-07-28 08:32:33'),
(7, 31, 7, '2020-07-28 08:38:30', '2020-07-28 08:38:30');

-- --------------------------------------------------------

--
-- Table structure for table `home_elements`
--

CREATE TABLE `home_elements` (
  `id` int(11) NOT NULL,
  `home_id` int(11) NOT NULL,
  `element_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_elements`
--

INSERT INTO `home_elements` (`id`, `home_id`, `element_id`, `created_at`, `updated_at`) VALUES
(57, 2, 8, '2020-07-27 04:07:45', '2020-07-27 04:07:45'),
(58, 2, 7, '2020-07-27 04:07:45', '2020-07-27 04:07:45'),
(59, 2, 6, '2020-07-27 04:07:45', '2020-07-27 04:07:45'),
(60, 2, 5, '2020-07-27 04:07:45', '2020-07-27 04:07:45'),
(61, 2, 4, '2020-07-27 04:07:45', '2020-07-27 04:07:45'),
(68, 3, 6, '2020-07-27 04:28:27', '2020-07-27 04:28:27'),
(69, 3, 5, '2020-07-27 04:28:27', '2020-07-27 04:28:27'),
(70, 3, 4, '2020-07-27 04:28:27', '2020-07-27 04:28:27'),
(71, 3, 3, '2020-07-27 04:28:27', '2020-07-27 04:28:27'),
(72, 3, 2, '2020-07-27 04:28:27', '2020-07-27 04:28:27'),
(73, 3, 1, '2020-07-27 04:28:27', '2020-07-27 04:28:27'),
(81, 5, 2, '2020-07-27 07:15:19', '2020-07-27 07:15:19'),
(85, 1, 3, '2020-07-28 05:39:34', '2020-07-28 05:39:34'),
(86, 1, 2, '2020-07-28 05:39:34', '2020-07-28 05:39:34'),
(87, 1, 1, '2020-07-28 05:39:34', '2020-07-28 05:39:34'),
(88, 4, 16, '2020-07-28 09:14:40', '2020-07-28 09:14:40'),
(89, 4, 15, '2020-07-28 09:14:40', '2020-07-28 09:14:40'),
(90, 4, 14, '2020-07-28 09:14:40', '2020-07-28 09:14:40'),
(91, 4, 13, '2020-07-28 09:14:40', '2020-07-28 09:14:40'),
(92, 4, 12, '2020-07-28 09:14:40', '2020-07-28 09:14:40'),
(93, 4, 11, '2020-07-28 09:14:40', '2020-07-28 09:14:40'),
(94, 4, 10, '2020-07-28 09:14:40', '2020-07-28 09:14:40'),
(95, 4, 8, '2020-07-28 09:14:40', '2020-07-28 09:14:40'),
(96, 4, 7, '2020-07-28 09:14:40', '2020-07-28 09:14:40'),
(97, 4, 4, '2020-07-28 09:14:40', '2020-07-28 09:14:40'),
(98, 8, 16, '2020-07-28 09:15:53', '2020-07-28 09:15:53'),
(99, 8, 15, '2020-07-28 09:15:53', '2020-07-28 09:15:53'),
(100, 8, 14, '2020-07-28 09:15:53', '2020-07-28 09:15:53'),
(101, 8, 13, '2020-07-28 09:15:53', '2020-07-28 09:15:53'),
(102, 8, 12, '2020-07-28 09:15:53', '2020-07-28 09:15:53'),
(103, 8, 11, '2020-07-28 09:15:53', '2020-07-28 09:15:53'),
(104, 8, 10, '2020-07-28 09:15:53', '2020-07-28 09:15:53'),
(105, 8, 8, '2020-07-28 09:15:53', '2020-07-28 09:15:53'),
(106, 8, 7, '2020-07-28 09:15:53', '2020-07-28 09:15:53'),
(107, 8, 4, '2020-07-28 09:15:53', '2020-07-28 09:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `home_sections`
--

CREATE TABLE `home_sections` (
  `id` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `title_ar` varchar(255) DEFAULT NULL,
  `title_en` varchar(255) DEFAULT NULL,
  `sort` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `home_sections`
--

INSERT INTO `home_sections` (`id`, `type`, `title_ar`, `title_en`, `sort`, `created_at`, `updated_at`) VALUES
(1, 1, 'اعلانات', 'Ads', 1, '2020-05-11 21:55:47', '2020-07-28 05:39:34'),
(2, 2, 'الأقسام', 'الأقسام', 1, '2020-05-11 21:57:18', '2020-07-27 12:52:03'),
(3, 3, 'أشهر الماركات', 'أشهر الماركات', 4, '2020-05-11 21:58:31', '2020-07-27 04:25:00'),
(4, 4, 'عروضنا المفضلة', 'عروضنا المفضلة', 2, '2020-05-12 21:59:37', '2020-07-27 12:52:03'),
(5, 5, 'اعلان', 'Ad', 5, '2020-06-01 12:15:59', '2020-07-27 12:52:03'),
(8, 4, 'أفضل عروض العناية بالطفل', 'أفضل عروض العناية بالطفل', 6, '2020-07-27 08:09:45', '2020-07-28 09:15:53');

-- --------------------------------------------------------

--
-- Table structure for table `meta_tags`
--

CREATE TABLE `meta_tags` (
  `id` int(11) NOT NULL,
  `home_meta_en` text,
  `home_meta_ar` text,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `meta_tags`
--

INSERT INTO `meta_tags` (`id`, `home_meta_en`, `home_meta_ar`, `created_at`, `updated_at`) VALUES
(1, 'test meta tag english22', 'ميتا تاج عربي1', '2020-02-18 12:45:58', '2020-02-18 10:46:21');

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `id` int(10) UNSIGNED NOT NULL,
  `migration` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `migrations`
--

INSERT INTO `migrations` (`id`, `migration`, `batch`) VALUES
(216, '2014_10_12_000000_create_users_table', 1),
(217, '2014_10_12_100000_create_password_resets_table', 1),
(218, '2019_08_19_000000_create_failed_jobs_table', 1),
(219, '2020_01_22_160948_create_ads_table', 1),
(220, '2020_01_23_102549_create_categories_table', 1),
(221, '2020_01_23_114523_create_settings_table', 1),
(222, '2020_01_23_122840_create_contact_us_table', 1),
(223, '2020_01_27_153233_create_doctors_lawyers_table', 1),
(224, '2020_01_28_090727_create_favorites_table', 1),
(225, '2020_01_28_120020_create_rates_table', 1),
(226, '2020_01_28_121824_create_reservations_table', 1),
(227, '2020_01_29_121840_create_services_table', 1),
(228, '2020_01_29_122258_create_doctor_lawyer_services_table', 1),
(229, '2020_01_29_122545_create_place_images_table', 1),
(230, '2020_01_29_123248_create_holidays_table', 1),
(231, '2020_01_29_124130_create_times_of_works_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `body` text NOT NULL,
  `image` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `title`, `body`, `image`, `created_at`, `updated_at`) VALUES
(1, 'Notification Title', 'Notification Boooody', 'plhpqidf3yokaoejyuri.jpg', '2020-02-17 14:38:50', '2020-02-17 14:38:50'),
(5, 'fdssdf', 'dsffds', NULL, '2020-02-18 07:53:57', '2020-02-18 07:53:57'),
(6, 'fdssdf', 'dsffds', NULL, '2020-02-18 07:54:29', '2020-02-18 07:54:29'),
(7, 'fdssdf', 'dsffds', NULL, '2020-02-18 07:55:28', '2020-02-18 07:55:28'),
(8, 'dg', 'dg', NULL, '2020-02-18 07:56:19', '2020-02-18 07:56:19'),
(9, 'fdsafds', 'fdsfds', NULL, '2020-02-18 07:59:14', '2020-02-18 07:59:14'),
(10, 'testy', 'test body', NULL, '2020-02-18 08:04:13', '2020-02-18 08:04:13'),
(11, 'test', 'test', NULL, '2020-02-18 08:06:42', '2020-02-18 08:06:42'),
(12, 'test title', 'test body', NULL, '2020-02-18 08:20:55', '2020-02-18 08:20:55'),
(13, 'test title', 'test body', NULL, '2020-02-18 08:34:20', '2020-02-18 08:34:20'),
(14, 'test title', 'test body', NULL, '2020-02-18 08:35:09', '2020-02-18 08:35:09'),
(15, 'test title', 'test body', NULL, '2020-02-18 08:36:22', '2020-02-18 08:36:22'),
(16, 'test title', 'test body', NULL, '2020-02-18 08:36:54', '2020-02-18 08:36:54'),
(17, 'dsfds', 'dsfdsf', NULL, '2020-02-18 08:37:54', '2020-02-18 08:37:54'),
(18, 'dsfds', 'dsfdsf', NULL, '2020-02-18 08:38:16', '2020-02-18 08:38:16'),
(19, 'fdsfdsfds', 'fdsfdsfds', NULL, '2020-02-18 08:38:30', '2020-02-18 08:38:30'),
(20, 'fdsfdsfds', 'fdsfdsfds', NULL, '2020-02-18 08:54:51', '2020-02-18 08:54:51'),
(21, 'fdsfdsfds', 'fdsfdsfds', NULL, '2020-02-18 08:55:30', '2020-02-18 08:55:30'),
(22, 'fdsfdsfds', 'fdsfdsfds', NULL, '2020-02-18 08:56:04', '2020-02-18 08:56:04'),
(23, 'test', 'test', 'fq6jmy7et4peztea3l8b.jpg', '2020-02-18 09:00:34', '2020-02-18 09:00:34'),
(24, 'test15', 'test', 'ai3t1cmrm9u1rgvhaz0u.jpg', '2020-02-18 09:01:07', '2020-02-18 09:01:07'),
(25, 'test notification', 'body of notification', NULL, '2020-04-05 15:46:01', '2020-04-05 15:46:01'),
(26, 'عنوان التنبيه', 'محتوي التنبيه', 'dx0dtkuqxpurdk0zisv0.jpg', '2020-04-05 15:52:55', '2020-04-05 15:52:55'),
(27, 'تجربة تنبيهات المشروع الاساسي', 'تجربة تنبيهات المشروع الاساسي', 'h6ouw1vxkznnwstb9alw.png', '2020-04-09 15:56:16', '2020-04-09 15:56:16'),
(28, 'تجربة تنبيهات المشروع الاساسي', 'تجربة تنبيهات المشروع الاساسي', 'mvdhb0hopuwicnkkvvuy.png', '2020-04-09 16:00:58', '2020-04-09 16:00:58'),
(29, 'تجربة تنبيهات المشروع الاساسي', 'تجربة تنبيهات المشروع الاساسي', 'qsiyls7q1zi7iekmpidr.jpg', '2020-04-09 16:01:23', '2020-04-09 16:01:23'),
(30, 'Station title', 'body of notification', 'nghr5rp3fodgtolhujuk.png', '2020-04-12 08:11:45', '2020-04-12 08:11:45'),
(31, 'Station title', 'محتوي التنبيه', 'jfllgeese8rcvzwmwcxd.jpg', '2020-04-12 09:33:44', '2020-04-12 09:33:44'),
(32, 'test', 'test', 'qtanf7wvpu3twivexxlk.jpg', '2020-04-12 09:41:37', '2020-04-12 09:41:37'),
(33, 'test', 'test', 'rulwoahqi97pevyn5qb5.jpg', '2020-04-12 09:42:00', '2020-04-12 09:42:00'),
(34, 'test', 'test', 'fzpxjvzfhhjiwzafoaiu.jpg', '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(35, 'new test', 'test', 'rwanlczldh5nhf4bdynt.jpg', '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(36, 'test notification', 'body of notification', 'ew9aeb3f7gqeutpi0f7r.jpg', '2020-04-12 12:58:35', '2020-04-12 12:58:35'),
(37, 'عنوان التنبيه', 'المحتوي', 'tmfj7vkyj7ukje6ltxx8.jpg', '2020-04-12 13:32:38', '2020-04-12 13:32:38'),
(38, 'عنوان التنبيه', 'محتوي التنبيه', 'oos4vgryeuxyb7cuhlpw.jpg', '2020-04-12 13:34:26', '2020-04-12 13:34:26'),
(39, 'تجربة تنبيه الخميس', 'تجربة إرسال تنبيه لكل التليفونات لتطبيق جمعية الدرة النسائية', NULL, '2020-04-15 09:20:42', '2020-04-15 09:20:42'),
(40, 'Directions Service (Complex)', 'تجربة إرسال تنبيه لكل التليفونات لتطبيق جمعية الدرة النسائية', 'j7thnwktslalm1etras3.png', '2020-04-15 10:20:21', '2020-04-15 10:20:21'),
(41, 'Basic Project Notifications', 'Basic Project Notifications details to see text aligned at left side', 'yd87gqafq2sii8hjxcia.png', '2020-04-15 10:23:02', '2020-04-15 10:23:02'),
(42, 'Mahmoud Alam', 'Mahmoud Alam Notifications', 'objdnasw1n3unwb39bsb.jpg', '2020-04-15 10:27:35', '2020-04-15 10:27:35'),
(43, 'التطبيق الأساسي', 'تجربة إرسال تنبيهات للتطبيق الأساسي', 'wjgx6vyyhktvstoez780.jpg', '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(44, 'Directions Service (Complex)', 'تنبيه تجربة من لوحة التحكم الخاصة بالتطبيق', NULL, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(45, 'نظام لتقييم الموظفين أون لاين', 'Basic Project Notifications details to see text aligned at left side', NULL, '2020-04-15 10:29:54', '2020-04-15 10:29:54'),
(46, 'Directions Service (Complex)', 'Basic Project Notifications details to see text aligned at left side', 'udkqbtzkq3dvwemgyn84.jpg', '2020-04-15 10:30:15', '2020-04-15 10:30:15'),
(47, 'Directions Service (Complex)', 'Basic Project Notifications details to see text aligned at left side', NULL, '2020-04-15 10:32:31', '2020-04-15 10:32:31'),
(48, 'Directions Service (Complex)', 'Basic Project Notifications details to see text aligned at left side', 'dx4zp9na4qf4bkbtch25.jpg', '2020-04-15 10:33:07', '2020-04-15 10:33:07'),
(49, 'موقع للتوظيف', 'test send notification with image from dashboard', 'amr5cp2zs2fthvlvxq6d.png', '2020-04-20 18:24:03', '2020-04-20 18:24:03'),
(50, 'موقع للتوظيف', 'test send notification with image from dashboard', 'oaizrxn2aokeudlwmnmy.png', '2020-04-20 18:25:24', '2020-04-20 18:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `offers`
--

CREATE TABLE `offers` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `size` int(11) NOT NULL,
  `type` int(11) NOT NULL,
  `target_id` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `offers`
--

INSERT INTO `offers` (`id`, `image`, `size`, `type`, `target_id`, `sort`, `created_at`, `updated_at`) VALUES
(3, 'gltetqaja9ak0p38md7w.jpg', 2, 2, 8, 2, '2020-07-16 09:00:20', '2020-07-28 09:07:50'),
(5, 'bnsmqacevccc49k48hte.jpg', 1, 1, 16, 1, '2020-07-16 15:14:39', '2020-07-28 09:07:22'),
(6, 'bdirejrzujq0roi56aqy.jpg', 3, 2, 5, 3, '2020-07-28 09:08:22', '2020-07-28 09:08:22'),
(7, 'hji09bsp8mgbtz8gz3gy.jpg', 3, 2, 5, 4, '2020-07-28 09:09:24', '2020-07-28 09:09:24'),
(8, 'd5kovupjacj3ipgwcp4w.jpg', 3, 2, 5, 5, '2020-07-28 09:10:07', '2020-07-28 09:10:07'),
(9, 'qpgs4hwxp07j8p5cetqm.jpg', 3, 2, 5, 6, '2020-07-28 09:10:35', '2020-07-28 09:10:35'),
(10, 'mcflblsm4ccy1yippdba.jpg', 2, 2, 5, 7, '2020-07-28 09:10:58', '2020-07-28 09:10:58'),
(11, 'lhvu0m3ajsbcsuldqzpq.jpg', 3, 2, 5, 8, '2020-07-28 09:11:27', '2020-07-28 09:11:27'),
(12, 'wmoeeaee1k95mtdo0wf1.jpg', 3, 2, 5, 9, '2020-07-28 09:12:59', '2020-07-28 09:12:59');

-- --------------------------------------------------------

--
-- Table structure for table `options`
--

CREATE TABLE `options` (
  `id` int(11) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `options`
--

INSERT INTO `options` (`id`, `title_en`, `title_ar`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'size', 'الحجم', 1, '2020-05-31 20:57:02', '2020-05-31 20:57:32'),
(4, 'test', 'تست', 1, '2020-07-16 03:16:51', '2020-07-16 03:16:51'),
(5, 'الوزن', 'الوزن', 4, '2020-07-26 13:38:02', '2020-07-26 13:38:02'),
(6, 'الوزن', 'الوزن', 2, '2020-07-26 13:38:14', '2020-07-26 13:38:14'),
(7, 'الوزن', 'الوزن', 1, '2020-07-26 13:38:22', '2020-07-26 13:38:22');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address_id` int(11) NOT NULL,
  `payment_method` int(11) NOT NULL,
  `subtotal_price` varchar(50) NOT NULL,
  `delivery_cost` varchar(50) NOT NULL,
  `total_price` varchar(50) NOT NULL,
  `status` int(11) NOT NULL DEFAULT '1',
  `order_number` varchar(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `user_id`, `address_id`, `payment_method`, `subtotal_price`, `delivery_cost`, `total_price`, `status`, `order_number`, `created_at`, `updated_at`) VALUES
(1, 34, 3, 1, '0', '30', '30', 1, '0', '2020-07-01 10:12:32', '2020-07-27 17:00:46'),
(2, 34, 3, 1, '0', '30', '30', 2, '0', '2020-07-01 10:13:07', '2020-07-26 13:43:44'),
(3, 34, 3, 1, '0', '30', '30', 3, '0', '2020-07-01 10:17:10', '2020-07-21 14:27:03'),
(4, 34, 3, 1, '0', '30', '30', 3, '3613196', '2020-07-01 12:19:56', '2020-07-21 14:23:15'),
(5, 37, 4, 3, '-163.28', '5', '-158.28', 1, '5903224', '2020-07-27 23:27:04', '2020-07-27 23:27:04'),
(6, 31, 6, 3, '495', '5', '500', 1, '5921518', '2020-07-28 04:31:58', '2020-07-28 04:31:58'),
(7, 31, 6, 3, '97.14', '5', '102.14', 1, '5936653', '2020-07-28 08:44:13', '2020-07-28 08:44:13'),
(8, 31, 5, 3, '6.65', '5', '11.65', 1, '5936749', '2020-07-28 08:45:49', '2020-07-28 08:45:49'),
(9, 39, 8, 3, '8', '5', '13', 1, '6020467', '2020-07-29 08:01:07', '2020-07-29 08:01:07'),
(10, 31, 6, 3, '15.2', '5', '20.2', 1, '6022873', '2020-07-29 08:41:13', '2020-07-29 08:41:13'),
(11, 31, 5, 3, '9.5', '5', '14.5', 1, '6022909', '2020-07-29 08:41:49', '2020-07-29 08:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `count` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `order_items`
--

INSERT INTO `order_items` (`id`, `order_id`, `product_id`, `count`, `created_at`, `updated_at`) VALUES
(1, 2, 1, 13, '2020-07-01 10:13:08', '2020-07-01 10:13:08'),
(2, 3, 1, 1, '2020-07-01 10:17:10', '2020-07-01 10:17:10'),
(3, 4, 1, 1, '2020-07-01 12:19:56', '2020-07-01 12:19:56'),
(4, 5, 4, 2, '2020-07-27 23:27:04', '2020-07-27 23:27:04'),
(5, 6, 4, 1, '2020-07-28 04:31:58', '2020-07-28 04:31:58'),
(6, 7, 11, 5, '2020-07-28 08:44:13', '2020-07-28 08:44:13'),
(7, 7, 7, 1, '2020-07-28 08:44:13', '2020-07-28 08:44:13'),
(8, 8, 4, 1, '2020-07-28 08:45:49', '2020-07-28 08:45:49'),
(9, 9, 7, 1, '2020-07-29 08:01:07', '2020-07-29 08:01:07'),
(10, 10, 4, 2, '2020-07-29 08:41:13', '2020-07-29 08:41:13'),
(11, 11, 4, 1, '2020-07-29 08:41:49', '2020-07-29 08:41:49');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` int(11) NOT NULL,
  `permission_ar` varchar(255) NOT NULL,
  `permission_en` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=ucs2;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `permission_ar`, `permission_en`, `created_at`, `updated_at`) VALUES
(1, 'المستخدمين', 'Users', '2020-02-19 14:04:33', '2020-02-19 14:04:33'),
(2, 'صفحات التطبيق', 'App Pages', '2020-02-19 14:05:13', '2020-02-19 14:05:13'),
(3, 'الإعلانات', 'Ads', '2020-02-19 14:06:10', '2020-02-19 14:06:10'),
(4, 'الأقسام', 'Categories', '2020-02-19 14:06:44', '2020-02-19 14:06:44'),
(5, 'إتصل بنا', 'Contact Us', '2020-02-19 14:07:10', '2020-02-19 14:07:10'),
(6, 'التبيهات', 'Notifications', '2020-02-19 14:07:55', '2020-02-19 14:07:55'),
(7, 'الإعدادات', 'Settings', '2020-02-19 14:08:34', '2020-02-19 14:08:34'),
(8, 'وسوم البحث', 'Meta Tags', '2020-02-19 14:09:06', '2020-02-19 14:09:06'),
(9, 'المديرين', 'Managers', '2020-02-19 14:09:59', '2020-02-19 14:09:59'),
(10, 'تنزيل النسخة الإحتياطية', 'Database Backup', '2020-02-19 14:10:21', '2020-02-19 14:10:21'),
(11, 'التقييمات', 'Rates', '2020-04-12 15:24:26', '2020-04-12 15:24:26'),
(12, 'أقسام الصفحة الرئيسية', 'Home Page Sections', '2020-07-13 22:00:00', '2020-07-13 22:00:00'),
(13, 'المناطق', 'Areas', '2020-07-13 22:00:00', '2020-07-13 22:00:00'),
(14, 'العلامات التجارية', 'Brands', '2020-07-13 22:00:00', '2020-07-13 22:00:00'),
(15, 'الأقسام الفرعية', 'Sub Categories', '2020-07-13 22:00:00', '2020-07-13 22:00:00'),
(16, 'خيارات', 'Options', '2020-07-14 22:00:00', '2020-07-14 22:00:00'),
(17, 'العروض', 'Offers', '2020-07-15 22:00:00', '2020-07-15 22:00:00'),
(18, 'المنتجات', 'Products', '2020-07-18 22:00:00', '2020-07-18 22:00:00'),
(19, 'الطلبات', 'Orders', '2020-07-20 22:00:00', '2020-07-20 22:00:00'),
(20, 'الإحصائيات', 'Statistics', '2020-07-28 22:00:00', '2020-07-28 22:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `stored_number` varchar(255) DEFAULT NULL,
  `title_ar` varchar(255) NOT NULL,
  `offer` tinyint(1) NOT NULL DEFAULT '0',
  `description_ar` text NOT NULL,
  `description_en` text NOT NULL,
  `final_price` varchar(30) NOT NULL,
  `price_before_offer` varchar(30) DEFAULT '0',
  `offer_percentage` int(11) DEFAULT '0',
  `category_id` int(11) NOT NULL,
  `brand_id` int(11) DEFAULT NULL,
  `sub_category_id` int(11) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `total_quatity` int(11) NOT NULL,
  `remaining_quantity` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `title_en`, `barcode`, `stored_number`, `title_ar`, `offer`, `description_ar`, `description_en`, `final_price`, `price_before_offer`, `offer_percentage`, `category_id`, `brand_id`, `sub_category_id`, `deleted`, `total_quatity`, `remaining_quantity`, `created_at`, `updated_at`) VALUES
(1, 'product english name', NULL, NULL, 'product arabic name', 1, 'kjlkjlkjkljkj', 'jkljlkjkljkjlkj', '160', '200', 20, 1, 1, 1, 1, 50, 12, '2020-05-11 22:11:34', '2020-07-27 04:30:43'),
(2, 'نوح', NULL, NULL, 'asfsafsa', 1, 'سيريسريس', 'dvfdsvvds', '495', '500', 1, 2, 2, 2, 1, 54, 5, '2020-07-26 13:30:32', '2020-07-27 04:30:39'),
(3, 'بيسبسيب', NULL, NULL, 'سيبسيبيس', 1, 'سيبسيب', 'سيبسيب', '-81.64', '52', 257, 2, 2, 2, 1, 5337, 37, '2020-07-26 13:40:26', '2020-07-27 04:30:34'),
(4, 'سيريلاك بالقمح من نستلة، 125جم', NULL, NULL, 'سيريلاك بالقمح من نستلة، 125جم', 1, 'نوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل', 'نوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل', '1.8', '2', 10, 5, 6, 3, 0, 100, 100, '2020-07-27 04:39:03', '2020-07-27 04:39:03'),
(5, 'أفضل عروض منتجات الألبان', '5f21c7a397e4f', NULL, 'أفضل عروض منتجات الألبان', 1, 'أفضل عروض منتجات الألبان', 'أفضل عروض منتجات الألبان', '475', '500', 5, 8, 0, 4, 0, 51, 25, '2020-07-27 08:31:36', '2020-07-29 17:02:00'),
(6, 'kkjhdkfhdfkj', NULL, NULL, 'oioouououou', 1, 'kdhkjh jjsh kjshjsgkjsgkjsg jssg', 'kshsgu diuudsyuidusui duust s', '50.6', '55', 8, 4, 0, 2, 0, 50, 50, '2020-07-27 13:45:50', '2020-07-27 13:45:50'),
(7, 'صندوق حبوب الفطور من نستلة - 400 غم', NULL, NULL, 'صندوق حبوب الفطور من نستلة - 400 غم', 1, 'Lion Cereal contains deliciously tasty fortified caramel and chocolate cereal pieces. Whole grain guaranteed with irresistible chocolate and sumptuous caramel. Lion Cereal, the king of cereals.\r\n\r\nProduct Features:\r\n\r\nMade with: Whole Grain, Vitamins & Minerals, Iron and Calcium\r\nPour 30g of LION cereals in a bowl, add 125ml of milk and enjoy the great taste\r\nIngredients: Cereal Grains (Whole ...\r\nLion Cereal contains deliciously tasty fortified caramel and chocolate cereal pieces. Whole grain guaranteed with irresistible chocolate and sumptuous caramel. Lion Cereal, the king of cereals.\r\n\r\nProduct Features:\r\n\r\nMade with: Whole Grain, Vitamins & Minerals, Iron and Calcium\r\nPour 30g of LION cereals in a bowl, add 125ml of milk and enjoy the great taste\r\nIngredients: Cereal Grains (Whole ...\r\nLion Cereal contains deliciously tasty fortified caramel and chocolate cereal pieces. Whole grain guaranteed with irresistible chocolate and sumptuous caramel. Lion Cereal, the king of cereals.\r\n\r\nProduct Features:\r\n\r\nMade with: Whole Grain, Vitamins & Minerals, Iron and Calcium\r\nPour 30g of LION cereals in a bowl, add 125ml of milk and enjoy the great taste\r\nIngredients: Cereal Grains (Whole ...', 'Lion Cereal contains deliciously tasty fortified caramel and chocolate cereal pieces. Whole grain guaranteed with irresistible chocolate and sumptuous caramel. Lion Cereal, the king of cereals.\r\n\r\nProduct Features:\r\n\r\nMade with: Whole Grain, Vitamins & Minerals, Iron and Calcium\r\nPour 30g of LION cereals in a bowl, add 125ml of milk and enjoy the great taste\r\nIngredients: Cereal Grains (Whole ...\r\nLion Cereal contains deliciously tasty fortified caramel and chocolate cereal pieces. Whole grain guaranteed with irresistible chocolate and sumptuous caramel. Lion Cereal, the king of cereals.\r\n\r\nProduct Features:\r\n\r\nMade with: Whole Grain, Vitamins & Minerals, Iron and Calcium\r\nPour 30g of LION cereals in a bowl, add 125ml of milk and enjoy the great taste\r\nIngredients: Cereal Grains (Whole ...\r\nLion Cereal contains deliciously tasty fortified caramel and chocolate cereal pieces. Whole grain guaranteed with irresistible chocolate and sumptuous caramel. Lion Cereal, the king of cereals.\r\n\r\nProduct Features:\r\n\r\nMade with: Whole Grain, Vitamins & Minerals, Iron and Calcium\r\nPour 30g of LION cereals in a bowl, add 125ml of milk and enjoy the great taste\r\nIngredients: Cereal Grains (Whole ...', '3.6', '4', 10, 5, 6, 3, 0, 100, 100, '2020-07-28 07:15:51', '2020-07-28 07:15:51'),
(8, 'سيريلاك بالفاكهة والقمح مع اللبن من نستلة، 250جم', NULL, NULL, 'سيريلاك بالفاكهة والقمح مع اللبن من نستلة، 250جم', 1, 'العلامة التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل\r\nالعلامة التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل\r\nالعلامة التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل', 'العلامة التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل\r\nالعلامة التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل\r\nالعلامة التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل', '7.68', '8', 4, 5, 6, 3, 0, 100, 100, '2020-07-28 07:18:53', '2020-07-28 07:18:53'),
(9, 'test product', NULL, NULL, 'تست', 1, 'klfhd jg dksg', 'kkhdj sgjksghsg', '58.74', '66', 11, 8, 0, 6, 0, 32, 32, '2020-07-28 07:52:21', '2020-07-28 07:52:21'),
(10, 'سيريلاك بالفاكهة والقمح مع اللبن 500جم', NULL, NULL, 'سيريلاك بالفاكهة والقمح مع اللبن 500جم', 1, 'التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل\r\n التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل\r\n التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوية', 'التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل\r\n التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل\r\n التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي', '6.65', '7', 5, 5, 6, 3, 0, 100, 100, '2020-07-28 08:01:23', '2020-07-28 08:01:23'),
(11, 'حليب بودرة للنمو اوبتي برو 3 للاطفال', NULL, NULL, 'حليب بودرة للنمو اوبتي برو 3 للاطفال', 1, 'العلامة التجاريةنستلة\r\nنوعمشروبات\r\nالعمر1 - 3 سنوات\r\nالحاجة الغذائيةقائم على الحليب\r\nالوصف:\r\nالعلامة التجارية: نستلة\r\nالسن: من 12 شهر فيما فوق\r\nحليب عالي الجودة للاطفال الصغار\r\nالحجم: 400 ...', 'العلامة التجاريةنستلة\r\nنوعمشروبات\r\nالعمر1 - 3 سنوات\r\nالحاجة الغذائيةقائم على الحليب\r\nالوصف:\r\nالعلامة التجارية: نستلة\r\nالسن: من 12 شهر فيما فوق\r\nحليب عالي الجودة للاطفال الصغار\r\nالحجم: 400 .', '4.85', '5', 3, 5, 6, 3, 0, 100, 100, '2020-07-28 08:02:41', '2020-07-28 08:02:41'),
(12, 'سيريلاك بالقمح واللبن من نستلة، 250جم', NULL, NULL, 'سيريلاك بالقمح واللبن من نستلة، 250جم', 1, 'العلامة التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل', 'العلامة التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل', '9', '10', 10, 5, 6, 3, 0, 100, 100, '2020-07-28 08:09:10', '2020-07-28 08:09:10'),
(13, 'سيريلاك تمر وقمح مع اللبن من نستلة، 125 جم', NULL, NULL, 'سيريلاك تمر وقمح مع اللبن من نستلة، 125 جم', 1, 'العلامة التجاريةنستلة\r\nنوعna\r\nالعمر8 اشهر بلس\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nMade With 100% Natural Ingredients\r\nFortified With Key Minerals And Vitamins To Prevent Nutritional Deficiencies Such As Iron, Zinc, Calcium, Vitamins A And C\r\nHelps Support Babies Natural Defenses\r\nHelps Support Normal Growth And Development\r\nEnsures Easy Digestibility', 'العلامة التجاريةنستلة\r\nنوعna\r\nالعمر8 اشهر بلس\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nMade With 100% Natural Ingredients\r\nFortified With Key Minerals And Vitamins To Prevent Nutritional Deficiencies Such As Iron, Zinc, Calcium, Vitamins A And C\r\nHelps Support Babies Natural Defenses\r\nHelps Support Normal Growth And Development\r\nEnsures Easy Digestibility', '6.65', '7', 5, 5, 6, 3, 0, 100, 100, '2020-07-28 08:11:58', '2020-07-28 08:11:58'),
(14, 'سيريلاك بالفاكهة والقمح مع اللبن من نستلة، 125جم', NULL, NULL, 'سيريلاك بالفاكهة والقمح مع اللبن من نستلة، 125جم', 1, '25.00 جنيه \r\n\r\nالأسعار تشمل ضريبة القيمة المضافة  التفاصيل\r\nمشمولة في الشحن المجاني على طلبات أكثر من 350.00 جنيه التفاصيل\r\nمؤهل لخصم 5٪ على الطلبات فوق 750.00 جنيه التفاصيل\r\nالباقات المتوفرة\r\nالعلامة التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل', '25.00 جنيه \r\n\r\nالأسعار تشمل ضريبة القيمة المضافة  التفاصيل\r\nمشمولة في الشحن المجاني على طلبات أكثر من 350.00 جنيه التفاصيل\r\nمؤهل لخصم 5٪ على الطلبات فوق 750.00 جنيه التفاصيل\r\nالباقات المتوفرة\r\nالعلامة التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةعضوي\r\nالوصف:\r\nمصنوع من مكونات طبيعية 100%\r\nمعزز بالمعادن والفيتامينات كالحديد والكالسيوم والزنك وفيتامين (أ) و (ج) لتغذية متكاملة\r\nيساعد على تعزيز مناعة الطفل\r\nيساعد على النمو والتطور الطبيعي للطفل', '8', '10', 20, 5, 6, 3, 0, 100, 100, '2020-07-28 08:22:48', '2020-07-28 08:22:48'),
(15, 'حليب بودرة نان اوبتي برو 1 للرضع من نستلة، 400 جم', NULL, NULL, 'حليب بودرة نان اوبتي برو 1 للرضع من نستلة، 400 جم', 1, 'العلامة التجاريةنستلة\r\nنوعمشروبات\r\nالعمر0 - 12 شهور\r\nالحاجة الغذائيةقائم على الحليب\r\nالوصف:\r\nالعلامة التجارية: نستلة\r\nالسن: مناسب للرضع\r\nتركيبة عالية الجودة للرضع', 'العلامة التجاريةنستلة\r\nنوعمشروبات\r\nالعمر0 - 12 شهور\r\nالحاجة الغذائيةقائم على الحليب\r\nالوصف:\r\nالعلامة التجارية: نستلة\r\nالسن: مناسب للرضع\r\nتركيبة عالية الجودة للرضع', '7.6', '8', 5, 5, 6, 3, 0, 100, 100, '2020-07-28 08:23:28', '2020-07-28 08:23:28'),
(16, 'نستلة طعام اطفال قائم على الحليب لعمر 6 اشهر - 1 سنة - معادل', NULL, NULL, 'نستلة طعام اطفال قائم على الحليب لعمر 6 اشهر - 1 سنة - معادل', 1, 'العلامة التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةقائم على الحليب\r\nالوصف:\r\nتركيبة مغذية للأطفال من سن 6 شهور إلى سنة يمكنك استخدام نان 2 كوجبة الأفطار عند عدم توافر حليب الثدي\r\n\r\nمعدل الطاقة: 67 كالوري/100 مل\r\nبروتين: 1.5 جرام/100 مل\r\nلاكتوز: 5.4 جرام/100 مل\r\nالكالسيوم: 64.3 مللي جرام/100 مل\r\nالحديد: 0.86 مللي جرام/100 مل\r\nالزنك: 0.62 مللي جرام\r\nبروتين:\r\nبيفيدوس بي ال\r\nDHA - ARA', 'العلامة التجاريةنستلة\r\nنوعمعادل\r\nالعمر6 اشهر - 1 سنة\r\nالحاجة الغذائيةقائم على الحليب\r\nالوصف:\r\nتركيبة مغذية للأطفال من سن 6 شهور إلى سنة يمكنك استخدام نان 2 كوجبة الأفطار عند عدم توافر حليب الثدي\r\n\r\nمعدل الطاقة: 67 كالوري/100 مل\r\nبروتين: 1.5 جرام/100 مل\r\nلاكتوز: 5.4 جرام/100 مل\r\nالكالسيوم: 64.3 مللي جرام/100 مل\r\nالحديد: 0.86 مللي جرام/100 مل\r\nالزنك: 0.62 مللي جرام\r\nبروتين:\r\nبيفيدوس بي ال\r\nDHA - ARA', '9.5', '10', 5, 5, 6, 3, 0, 100, 100, '2020-07-28 08:27:03', '2020-07-28 08:27:03'),
(17, 'hshshhs', '5f2aa6ee28558', NULL, 'ssssssss', 0, 'kjgkfjkfkfkh dkjfhjdf kjgjf', 'saaassaassaas', '25', '0', 0, 5, 0, 3, 0, 33, 33, '2020-08-05 10:34:06', '2020-08-05 10:34:06'),
(18, 'test', '5f2adee0c8f4d', NULL, 'تست', 0, 'khf hdhfjd kdh djgdkgd jhgdgd', 'dd d gfgf gfgf fgffgff', '21', '0', 0, 4, 2, 2, 0, 13, 11, '2020-08-05 14:34:27', '2020-08-05 14:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `product_images`
--

CREATE TABLE `product_images` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_images`
--

INSERT INTO `product_images` (`id`, `image`, `product_id`, `created_at`, `updated_at`) VALUES
(9, 'zp8kj1xi1tvalrtmo2m2.jpg', 4, '2020-07-27 04:39:03', '2020-07-27 04:39:03'),
(10, 'beygfilijbbvbefr7px6.jpg', 4, '2020-07-27 04:39:04', '2020-07-27 04:39:04'),
(11, 'kubervz8uignqisclbfn.jpg', 4, '2020-07-27 04:39:05', '2020-07-27 04:39:05'),
(12, 'juvd7sz7ui31vllcwsry.jpg', 4, '2020-07-27 04:39:06', '2020-07-27 04:39:06'),
(13, 'c61lsafhld8yaecjollf.jpg', 5, '2020-07-27 13:40:07', '2020-07-27 13:40:07'),
(14, 'thuauapjjy720k4mhmp0.png', 5, '2020-07-27 13:40:11', '2020-07-27 13:40:11'),
(15, 'koqjlafwczzsynduwz6t.png', 6, '2020-07-27 13:45:55', '2020-07-27 13:45:55'),
(16, 'ignfenvpx27jheckrfwi.jpg', 6, '2020-07-27 13:45:59', '2020-07-27 13:45:59'),
(17, 'xyzksaec7qeyx6wzfsbz.jpg', 7, '2020-07-28 07:15:53', '2020-07-28 07:15:53'),
(18, 'u42w1cqi23tznepgc0d6.jpg', 7, '2020-07-28 07:15:54', '2020-07-28 07:15:54'),
(19, 'vyfcxunvruar3ywvqu4t.jpg', 7, '2020-07-28 07:15:55', '2020-07-28 07:15:55'),
(20, 'uqd1eilp1paby7nhxosw.jpg', 7, '2020-07-28 07:15:56', '2020-07-28 07:15:56'),
(21, 'p82akvfjls6hfkfhooeh.jpg', 7, '2020-07-28 07:15:57', '2020-07-28 07:15:57'),
(22, 'g8q1vxwqwiie34rqkv9z.jpg', 7, '2020-07-28 07:15:59', '2020-07-28 07:15:59'),
(23, 'q38ggboeq3ti4h1scwou.jpg', 7, '2020-07-28 07:16:00', '2020-07-28 07:16:00'),
(24, 'tebdlrkhpixyonzq4hcd.jpg', 8, '2020-07-28 07:18:54', '2020-07-28 07:18:54'),
(25, 'opwof322xevobnzneshy.jpg', 8, '2020-07-28 07:18:55', '2020-07-28 07:18:55'),
(26, 'fw6ypqsndcckvrfawtyf.jpg', 8, '2020-07-28 07:18:56', '2020-07-28 07:18:56'),
(27, 'dmahlpjfux6xofuckznj.jpg', 8, '2020-07-28 07:18:57', '2020-07-28 07:18:57'),
(28, 'kciyymb3meqe4yvquupz.jpg', 8, '2020-07-28 07:18:57', '2020-07-28 07:18:57'),
(29, 'nijkzi6fqt4kgq5ljkzx.png', 9, '2020-07-28 07:52:22', '2020-07-28 07:52:22'),
(30, 'cfkj7wnc38wgikqk1g9y.png', 9, '2020-07-28 07:52:23', '2020-07-28 07:52:23'),
(31, 'sn9v7ihfttsqo8pwjjnd.jpg', 10, '2020-07-28 08:01:24', '2020-07-28 08:01:24'),
(32, 'rovuh0ndzw5eoivrtmjn.jpg', 10, '2020-07-28 08:01:25', '2020-07-28 08:01:25'),
(33, 'mjqzoxazvdsoekbuvktz.jpg', 10, '2020-07-28 08:01:26', '2020-07-28 08:01:26'),
(34, 'ixohfvhcnpznldphhckp.jpg', 10, '2020-07-28 08:01:27', '2020-07-28 08:01:27'),
(35, 'frq2tltb3npwrzynqscz.jpg', 10, '2020-07-28 08:01:28', '2020-07-28 08:01:28'),
(36, 'gfkveixkawge22kooehc.jpg', 11, '2020-07-28 08:02:42', '2020-07-28 08:02:42'),
(37, 'zqyb6hf4pnzbsvjoqqod.jpg', 11, '2020-07-28 08:02:43', '2020-07-28 08:02:43'),
(38, 'vkorqfakcvcippmne1sp.jpg', 11, '2020-07-28 08:02:44', '2020-07-28 08:02:44'),
(39, 'lrznktlocjwdi2e2maqd.jpg', 11, '2020-07-28 08:02:45', '2020-07-28 08:02:45'),
(40, 'ei8ajyzyers257vdnurp.jpg', 11, '2020-07-28 08:02:46', '2020-07-28 08:02:46'),
(41, 'h5os6iaflnbmj6sp6vdm.jpg', 11, '2020-07-28 08:02:47', '2020-07-28 08:02:47'),
(42, 'qwur6ipg21nw4vn90gba.jpg', 12, '2020-07-28 08:09:11', '2020-07-28 08:09:11'),
(43, 'sbqoslguo5fj8pgyjdrr.jpg', 12, '2020-07-28 08:09:12', '2020-07-28 08:09:12'),
(44, 'ondklawknw7vnhvh2yig.jpg', 12, '2020-07-28 08:09:13', '2020-07-28 08:09:13'),
(45, 'kidx4ugzwvsfn1fpp4zk.jpg', 12, '2020-07-28 08:09:14', '2020-07-28 08:09:14'),
(46, 'mdfblqfoallckwkrrvae.jpg', 12, '2020-07-28 08:09:15', '2020-07-28 08:09:15'),
(47, 'vd809quxykngzzkg0ruy.jpg', 13, '2020-07-28 08:11:59', '2020-07-28 08:11:59'),
(48, 'ajybh7djpj8q1z6bw9aw.jpg', 13, '2020-07-28 08:12:00', '2020-07-28 08:12:00'),
(49, 'ocrtlfafukjldlk9ohxc.jpg', 13, '2020-07-28 08:12:02', '2020-07-28 08:12:02'),
(50, 'm1oitppz8nykxouzsyia.jpg', 13, '2020-07-28 08:12:02', '2020-07-28 08:12:02'),
(51, 'tbvx97k5apszuungxht9.jpg', 13, '2020-07-28 08:12:03', '2020-07-28 08:12:03'),
(52, 'jys4vwuewd3jlesl3oga.jpg', 14, '2020-07-28 08:22:50', '2020-07-28 08:22:50'),
(53, 'nuozleamxxa19funnauo.jpg', 14, '2020-07-28 08:22:51', '2020-07-28 08:22:51'),
(54, 'zl5ykhgaac63xmwwdeli.jpg', 14, '2020-07-28 08:22:52', '2020-07-28 08:22:52'),
(55, 'q1lsrljdmf94ee0hfveb.jpg', 14, '2020-07-28 08:22:53', '2020-07-28 08:22:53'),
(56, 'sqxhqtwninuqi2bhryit.jpg', 14, '2020-07-28 08:22:53', '2020-07-28 08:22:53'),
(57, 'tl59iqshu40mmly9mpt0.jpg', 15, '2020-07-28 08:23:29', '2020-07-28 08:23:29'),
(58, 'iyodzxjxu4rjfsndeulf.jpg', 15, '2020-07-28 08:23:30', '2020-07-28 08:23:30'),
(59, 'qykjrckeqdex1uvejicz.jpg', 15, '2020-07-28 08:23:31', '2020-07-28 08:23:31'),
(60, 'z8wj0bl2cjocq9caggbq.jpg', 15, '2020-07-28 08:23:32', '2020-07-28 08:23:32'),
(61, 'yr634lb3foreqtrs8kz5.jpg', 15, '2020-07-28 08:23:33', '2020-07-28 08:23:33'),
(62, 'zl9wpsitccn5wsxsnags.jpg', 16, '2020-07-28 08:27:05', '2020-07-28 08:27:05'),
(63, 'cbqwnpjjipzsgrys8ciq.jpg', 17, '2020-08-05 10:34:10', '2020-08-05 10:34:10'),
(64, 'secgsi8ylbooyrkhbirx.jpg', 17, '2020-08-05 10:34:14', '2020-08-05 10:34:14'),
(65, 'yt1ungbwz8sjghreh23q.jpg', 18, '2020-08-05 14:34:36', '2020-08-05 14:34:36'),
(66, 'tplpzzzdwcqjueu6wiou.png', 18, '2020-08-05 14:34:37', '2020-08-05 14:34:37');

-- --------------------------------------------------------

--
-- Table structure for table `product_options`
--

CREATE TABLE `product_options` (
  `id` int(11) NOT NULL,
  `option_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `value_en` varchar(255) NOT NULL,
  `value_ar` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `product_options`
--

INSERT INTO `product_options` (`id`, `option_id`, `product_id`, `value_en`, `value_ar`, `created_at`, `updated_at`) VALUES
(10, 4, 1, 'فثسف', 'تست2', '2020-07-21 13:01:12', '2020-07-21 13:01:12'),
(11, 6, 3, 'ثبث', 'ثبث', '2020-07-26 13:40:27', '2020-07-26 13:40:27'),
(12, 5, 6, '2 k.g', '2 كيلو جرام', '2020-07-27 13:45:59', '2020-07-27 13:45:59'),
(15, 5, 18, 'فثسف', 'فثسف1', '2020-08-05 14:40:22', '2020-08-05 14:40:22');

-- --------------------------------------------------------

--
-- Table structure for table `rates`
--

CREATE TABLE `rates` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `text` varchar(255) NOT NULL,
  `rate` int(11) NOT NULL,
  `admin_approval` tinyint(1) NOT NULL DEFAULT '0',
  `order_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `rates`
--

INSERT INTO `rates` (`id`, `user_id`, `text`, `rate`, `admin_approval`, `order_id`, `created_at`, `updated_at`) VALUES
(1, 17, 'test', 3, 1, 1, '2020-03-22 06:19:48', '2020-03-22 06:19:48'),
(2, 21, 'test', 4, 1, 1, '2020-04-07 20:37:47', '2020-04-15 17:45:26'),
(3, 25, 'اهلا وسهلا', 5, 1, 1, '2020-04-12 20:03:13', '2020-04-15 17:45:01'),
(4, 26, 'Hhh', 5, 1, 1, '2020-04-13 13:44:29', '2020-04-15 17:45:24'),
(5, 27, 'تجربة إرسال تقييم من البوستمان', 4, 1, 1, '2020-04-15 17:10:00', '2020-04-15 17:12:48'),
(6, 27, 'this product is very sweet and good packing', 5, 1, 2, '2020-04-15 17:44:48', '2020-04-15 17:44:58'),
(7, 27, 'this product is very sweet and good packing', 5, 1, 3, '2020-04-15 17:46:26', '2020-04-15 17:46:35'),
(8, 27, 'this product is very sweet and good packing', 5, 1, 5, '2020-04-15 17:50:07', '2020-04-15 17:50:52'),
(9, 27, 'this product is very sweet and good packing', 5, 1, 4, '2020-04-15 17:50:32', '2020-04-15 17:50:53'),
(10, 27, 'this product is very sweet and good packing', 5, 1, 6, '2020-04-15 17:51:53', '2020-04-15 17:52:16'),
(11, 27, 'test', 3, 0, 10, '2020-04-21 12:31:24', '2020-04-21 12:31:24'),
(12, 27, 'test', 4, 0, 100, '2020-04-21 12:31:38', '2020-04-21 12:31:38'),
(13, 27, 'test', 4, 0, 111, '2020-04-21 12:38:58', '2020-04-21 12:38:58'),
(14, 27, 'على فكره في صوره صباحيه رسائل اسلامية رسائل نكت', 4, 0, 112, '2020-04-21 12:40:55', '2020-04-21 12:40:55'),
(15, 27, 'test', 4, 0, 141, '2020-04-21 12:43:28', '2020-04-21 12:43:28'),
(16, 27, 'تحميل برنامج ايه يا عم الشيخ الحويني في مجال المبيعات اونلاين', 5, 0, 156, '2020-04-21 13:00:52', '2020-04-21 13:00:52'),
(17, 27, 'على فكره في صوره صباحيه رسائل اسلامية رسائل نكت', 4, 0, 166, '2020-04-21 13:07:01', '2020-04-21 13:07:01'),
(18, 22, 'test', 3, 0, 1, '2020-04-29 17:43:38', '2020-04-29 17:43:38');

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `app_phone` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `termsandconditions_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `termsandconditions_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `aboutapp_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `aboutapp_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `app_name_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_name_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `logo` varchar(350) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `phone` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_en` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address_ar` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `facebook` text COLLATE utf8mb4_unicode_ci,
  `youtube` text COLLATE utf8mb4_unicode_ci,
  `twitter` text COLLATE utf8mb4_unicode_ci,
  `instegram` text COLLATE utf8mb4_unicode_ci,
  `map_url` text COLLATE utf8mb4_unicode_ci,
  `latitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `longitude` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `snap_chat` text COLLATE utf8mb4_unicode_ci,
  `delivery_information_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `delivery_information_ar` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_policy_en` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `return_policy_ar` text COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `app_phone`, `termsandconditions_en`, `termsandconditions_ar`, `aboutapp_en`, `aboutapp_ar`, `created_at`, `updated_at`, `app_name_en`, `app_name_ar`, `logo`, `email`, `phone`, `address_en`, `address_ar`, `facebook`, `youtube`, `twitter`, `instegram`, `map_url`, `latitude`, `longitude`, `snap_chat`, `delivery_information_en`, `delivery_information_ar`, `return_policy_en`, `return_policy_ar`) VALUES
(1, '+201101004396', '<p>شروط واحكام الانجليزي</p>', '<p>شروط واحكام العربي</p>', '<p>عن التطبيق انجليزي</p>', '<p>عن التطبيق عربي</p>', '2020-02-05 09:15:45', '2020-07-27 14:25:36', 'المشروع الاساسي', 'المشروع الاساسي', 'etp5i0p7mersm64cq76g.jpg', 'admin@gmail.com', '+201101004396', 'Kuwait', 'كويت', 'facebook.com', 'youtube.com', 'twitter.com', 'instegram.com', 'https://www.google.com/maps/@30.0430715,31.4056989,16z', '30.0430715', '31.4056989', 'snapchat.com', 'delivery information english text1', 'معلومات التوصيل عربي2', 'Return policy english text1', 'سياسه الإرجاع عربي2');

-- --------------------------------------------------------

--
-- Table structure for table `sub_categories`
--

CREATE TABLE `sub_categories` (
  `id` int(11) NOT NULL,
  `title_en` varchar(255) NOT NULL,
  `title_ar` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `deleted` tinyint(1) NOT NULL DEFAULT '0',
  `brand_id` int(11) DEFAULT NULL,
  `category_id` int(11) NOT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `sub_categories`
--

INSERT INTO `sub_categories` (`id`, `title_en`, `title_ar`, `image`, `deleted`, `brand_id`, `category_id`, `created_at`, `updated_at`) VALUES
(1, 'منتجات الالبان', 'منتجات الالبان', 'gbht7wxoq1jgev5j4qbu.png', 0, 3, 4, '2020-07-06 15:19:54', '2020-07-27 07:12:07'),
(2, 'اللحوم والدواجن', 'اللحوم والدواجن', 'zft8fvh9dchziobeel5q.jpg', 0, 2, 4, '2020-07-14 12:36:42', '2020-07-27 07:05:00'),
(3, 'غذاء أطفال', 'غذاء أطفال', 'tkadifkofq1qouz2hcou.png', 0, 6, 5, '2020-07-27 07:37:51', '2020-07-27 07:37:51'),
(4, 'الوزن', 'الوزن', 'ye7bonjhjbmvc832sxel.png', 0, 5, 8, '2020-07-27 11:30:01', '2020-07-27 11:30:01'),
(5, 'مشروبات ساخنة', 'مشروبات ساخنة', 'yyx21ixoxdd5krajjrpu.png', 0, 4, 8, '2020-07-27 12:53:08', '2020-07-27 12:53:44'),
(6, 'hhhdhdhdhdhdhdhd', 'lslslsllsllslsls', 'xxeexlxcxx7sae6biogb.png', 0, NULL, 8, '2020-07-27 15:25:30', '2020-07-27 15:27:22');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `fcm_token` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `verified` tinyint(1) NOT NULL DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `active` tinyint(1) DEFAULT '1',
  `seen` tinyint(1) DEFAULT '0',
  `main_address_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `email`, `phone_verified_at`, `password`, `fcm_token`, `verified`, `remember_token`, `created_at`, `updated_at`, `active`, `seen`, `main_address_id`) VALUES
(1, 'mohamed', '+201090751344', 'mohamedbehie@gmail.com', NULL, '$2y$10$u669r76OihgqNPx5BFVjUO360NUS.elP.x0g3FFGqBiotkXKD62SO', 'test fcm token', 1, NULL, '2020-02-06 06:20:35', '2020-02-06 06:43:06', 1, 0, 0),
(2, 'mohamed', '+20109075134', 'mohamedbehie1@gmail.com', NULL, '$2y$10$0rMMj9DAGBFLAUlE1D4s2e9rK3iOcTibaTui2bkLMlhTJ4i0YAMkC', 'test', 1, NULL, '2020-02-06 06:21:56', '2020-02-06 06:21:56', 1, 0, 0),
(3, 'mohamed', '+20109075114', 'mohamedbehie12@gmail.com', NULL, '$2y$10$1Jd32sOBih10OHxgowMiMeBk94fz9YJSIPQ.KTP/zaqtOWTh450IO', 'test', 1, NULL, '2020-02-06 06:25:17', '2020-02-06 06:25:17', 1, 0, 0),
(4, 'mohamed', '+20109075124', 'mohamedbehie112@gmail.com', NULL, '$2y$10$gT9ttYsKKYW63N6mAqDYAeGpQLzlO1rvoLZtNl2R0BFmd6natiPIm', 'test', 1, NULL, '2020-02-06 06:27:50', '2020-02-24 11:37:25', 1, 0, 0),
(5, 'mohamed', '+20109075127', 'mohamedbehie3@gmail.com', NULL, '$2y$10$bYsDCR3kviyRrNKjmCHEIuYVLqWFNqBp9zweObW5Kl9SOcnqiDAMm', 'test', 1, NULL, '2020-02-06 06:29:00', '2020-02-26 13:25:11', 1, 1, 0),
(6, 'mohamed', '+20109075128', 'mohamedbehie34@gmail.com', NULL, '$2y$10$3DAJpqLnNqRuOMp2MGo/XuO4JTH1piGww3wFa51zdN.U6H77uar7K', 'test', 1, NULL, '2020-02-06 06:33:01', '2020-02-06 06:33:01', 1, 0, 0),
(7, 'mohamed', '+201090751285', 'mohamedbehie314@gmail.com', NULL, '$2y$10$dIfZeLaAmBpF/8lVM2tmMOvcf.AMfCFPolZCngQmeSkgJQPiE5a.a', 'test fcm token', 1, NULL, '2020-02-06 06:48:15', '2020-02-26 13:25:20', 0, 1, 0),
(8, 'mohamed', '+2010907512844', 'mohamedbehie3214@gmail.com', NULL, '$2y$10$XhCUw3BAMdI93Uf9ZkV5POQYBtA76rJV2Is4/CMTi9AQu9thv5buK', 'test', 1, NULL, '2020-02-06 06:52:28', '2020-02-06 06:52:28', 1, 0, 0),
(9, 'mohamed', '+2010907512644', 'mohamedbehie30114@gmail.com', NULL, '$2y$10$GMzin8X9RdygVlqnzdiUW.q5wwLWyeEu/bA5sXdFQxNQF1BFv3l/O', 'test fcm token', 1, NULL, '2020-02-06 06:54:03', '2020-02-26 13:24:50', 1, 1, 0),
(10, 'mohamed', '+2010807512644', 'mohamedbehie30614@gmail.com', NULL, '$2y$10$sjHsH28sTozrH6k9gVwq5eX2EYPMVWaTNaDoRYY1PL2FJFSrFnAKa', 'test fcm token', 1, NULL, '2020-02-06 07:05:08', '2020-02-06 07:07:07', 1, 0, 0),
(11, 'mohamed', '+20108075126414', 'mohamedbehie3064@gmail.com', NULL, '$2y$10$C3Cj9oGvQMzc4tyGgkZa9.4nsoTSVjt7bBvNl21f8d2BkBUwo2O8C', 'test', 1, NULL, '2020-02-06 07:52:06', '2020-02-24 11:37:34', 0, 0, 0),
(12, 'Test User', '+147258', 'email@emial.com', NULL, '$2y$10$nJqB.dNSnnhwBhvI9MiAEebblBAfZVUtfQ8PgNo2GoGoBzXafqs7O', NULL, 1, NULL, '2020-02-13 09:03:17', '2020-02-13 09:03:17', 1, 0, 0),
(13, '23Test User', '+201090751347', 'teest2@gmail.com', NULL, '$2y$10$10XcqYsfhh2oInPXU3fd5uzQ.b2JTe2TnFXJqFh7BWlajN/OUxs5a', 'test', 1, NULL, '2020-02-16 07:36:36', '2020-04-13 14:08:58', 1, 0, 0),
(14, '2test u', '+20123456123', 'test@test.com', NULL, '$2y$10$UrVHgj1xs8E2fNW6JHQjtegEh5uM0UYKwMvRUt.g.BRLH5/.9tDfm', NULL, 1, NULL, '2020-02-16 08:59:53', '2020-02-26 13:11:39', 1, 1, 0),
(15, 'Mohamed Behiery 1', '+56985698', 'mohatest@gmail.com', NULL, '$2y$10$02trl9OZeq82fugy0dgj/uJ6uwRGnfkyw4uckKPOUpdEiKImhEHaW', NULL, 1, NULL, '2020-02-24 11:38:46', '2020-02-26 12:59:03', 1, 1, 0),
(16, 'Mohamed Edit', '+20104567893', 'Mohamed231@mohamed.com', NULL, '$2y$10$oSeWKGhSHR78vrOSJotReOPcz/IukxqZCgwdrH8juJ9Jb2Un3/jr2', 'test', 1, NULL, '2020-03-22 04:59:39', '2020-03-22 05:34:28', 1, 0, 0),
(17, 'Mohamed Behiery 1', '+20101234567211', 'mohamed1244@moa14med.com', NULL, '$2y$10$8S0GZp1PnlpkWTfzAm0e7.eHsEgIOKosiPwKNA3OgHJZMVX56UrjC', 'test', 1, NULL, '2020-03-22 06:07:14', '2020-03-22 06:07:14', 1, 0, 0),
(21, 'Mohamed Behiery', '+201012345672115', 'mohamed1244@moha14med.com', NULL, '$2y$10$IVbxLaWxFbSeWxDG2ozDOulTxwhuUC3R3wMWyEy.cYGPJRbAuSZiC', 'test', 1, NULL, '2020-04-01 10:34:47', '2020-04-13 14:10:39', 1, 1, 0),
(22, 'سيف محمود علم الدينt', '+201027027823', 'mahmoud.bussiness2020@gmail.com', NULL, '$2y$10$iJAYuAKu7bhM28QobNWjLO/yRzUb30tjl/1eGLLmbXEdglgXxRqUW', 'test', 1, NULL, '2020-04-02 07:23:05', '2020-04-28 18:11:41', 1, 0, 0),
(23, 'Elsman', '01271665716', 'asd@aaaaa.com', NULL, '$2y$10$8b0OFf9fZrmlFWuEJX89xOWB9Na/LzbtKcBnc.p1bfDlw4hhdj5Gi', 'eHgKItjbGEanly9jdm8tZq:APA91bFcdNdDlyS20FqV9GvNtHXemAMty1lWtCElp3ty-1dI5VHUhOytoaBp4DXTazE_XTANMZ6t0-ioMd-wAhSN2TplKHwsgauZCSwEDpe04BcGjgjQqeBxVUQUERb4SQHKHjPH3AhV', 1, NULL, '2020-04-04 08:48:22', '2020-04-10 15:48:20', 1, 1, 0),
(24, 'hhhgghgg', '01101004396', 'vvghjj@gggg.com', NULL, '$2y$10$kGYGNxGOpar/U.gvMIaO6u4Rq4gJjw/Gn8E0hk51k48UxNonY.2/C', 'esD3fBLML0iHs-UW1WROlj:APA91bGNWjFjd7gAYmA4-v3wQqq_Vxrr27QDYbPvTx9t5VBErzcRamCdF9LNkDbw8-dgZq21aCdGcXEVQsdKJcxvcZA6xBE4EnR2_rCqaUVaIIGFO101RDl6LdzwfAXtLIG00jpaAieL', 1, NULL, '2020-04-09 14:31:24', '2020-04-11 13:25:01', 1, 1, 0),
(25, 'Elsman', '+96555411928', 'asd@aamm.com', NULL, '$2y$10$cGMcizlP3/k8yGWgME8I7.OoE/vRqRfaVuhFN2Afcu/SsN/F5g/HG', 'feKVQcbYBkLYmM7vhxBeej:APA91bGl6GzdFekyv1L9Ke651l4Du_Mir2OIrb7wFNrErPou_gnOrnxZJ-kF0isJ_FyKVuPuMD7Jxa4h6jalPkymilQHBX4zipMVrAeATAZ6YTe5ffvIaZuyhl20_rpLp9yF4C_OKMZx', 1, NULL, '2020-04-12 18:17:31', '2020-04-13 18:53:00', 1, 0, 0),
(26, 'Elsman', '+96555926608', 'asd@assd.com', NULL, '$2y$10$k7Ly9p/Z7I3Ymdwcw1jAdub2X8VtSqu/IQgRO/wLxmoOTh0GX9S9G', 'cNtPQQB7CErdsCFG1pjCRX:APA91bGZPkeZ7TiGFviX1lZsRYp4AAP_LI-rYoJ4jWFu8ynMZKIYK_UAJls8ZqExhixU3VMahPQVbj8GDyNowbjJLOLLWzYAYU9kSNPdEVG0R5lCkORUAG7KhyRwr1ufYJ9DcfYCtZjv', 1, NULL, '2020-04-13 13:42:42', '2020-04-16 10:30:42', 1, 1, 0),
(27, 'حوده علم الدين', '+201110837797', 'mahmoud.alam19733@gmail.com', NULL, '$2y$10$4LtDBN6RqzvCC9A3M05N7ODR8kLQW.3/Id524trsmyQQgcZDTuekq', 'ezASxCtETwqCjL9ccPj6d1:APA91bGXO2yaW0iBEbd6kPZyzwC4u9o0-xzdrUq--xuR7TzRunZz_js8ie-Tp6CFEp9cQQZFs33eSqI87rttS86gNknfOczW3ixkUhnqhsGw05I9pj5-JlAb6Yb-3Htt1fMT0O1-VAF2', 1, NULL, '2020-04-14 11:11:21', '2020-04-21 10:16:03', 1, 1, 0),
(28, 'sadad', '123456789', 'fasfasfas@dsfasdfsd.com', NULL, '$2y$10$rD2Io8H2qtTEz3J3RQpjKuktfWSAqg2x9JE3mdlc6.WseM4LDZx2O', NULL, 1, NULL, '2020-04-16 03:43:26', '2020-04-16 03:43:52', 1, 1, 0),
(29, '+96598758330', '+96598758330', 'eswfewfwe@sdfgsdgfsd.com', NULL, '$2y$10$UhVvvQudkkcc3XKbpIarruX4em/8rxSBY9hf4GkUXYkd8CyLMuVQW', NULL, 1, NULL, '2020-04-16 03:45:44', '2020-04-16 03:46:17', 1, 1, 0),
(30, '98758330', '98758330', 'marketing@uffff-smart.co', NULL, '$2y$10$T2Z8rdQTTosdNDL6pCGONOXaglKsqiSS/phNu4J9kPew7dQQoT.KK', NULL, 1, NULL, '2020-04-16 03:47:18', '2020-04-16 03:47:18', 1, 0, 0),
(31, 'hshhsh', '01115353169', 'mostafausmart@gmail.com', NULL, '$2y$10$vtBVB/CJtYqZz4bfdbMNJetRBDkQFkylVFCyTrahSf/Gsksg2K04W', 'ehcN7C31O0w:APA91bFBbBVlKPpoYDv6vWlm1cTbJEVSrLIxBbR6xgW-3zgW9SL-Lz8_ynvu7lVpxi0YeFsU3c-IYgUKJNeUfFr83V-SebV2FMJ1g9DFQkZttoBgSxr0rKK80LNa0c4CFbkd48lQ-d09', 1, NULL, '2020-04-23 05:59:13', '2020-07-29 08:41:40', 1, 1, 5),
(32, 'Mohamed', '963852741', 'ki@ki.com', NULL, '$2y$10$3uBSv8Nc2jDIDMHVZCKzeuQkUT988kwhYqBLdirOjQ3sf1eMMDF0m', 'test', 1, NULL, '2020-06-07 01:21:18', '2020-06-07 01:21:18', 1, 0, 0),
(33, 'ahmed', '+201012345678', 'mmm@ttt.com', NULL, '$2y$10$4QQnCAmPa3CN75dSX1PunO7ee3y9nN4MuZtjWMffdZRGBAjJvjycC', 'klkd', 1, NULL, '2020-06-09 15:24:43', '2020-06-09 16:23:20', 1, 0, 1),
(34, 'mkkk', '+2015885546', 'kjdkj@kljjn.com', NULL, '$2y$10$r1U84aOdBTsUUvNinhmxVO9BO4xxG9wGnjOwsaFeMwalgGxT0NsxS', 'test', 1, NULL, '2020-06-21 06:18:06', '2020-07-21 14:02:18', 1, 1, NULL),
(35, 'mkkk', '+20158855469', 'kjdkj@kljjni.com', NULL, '$2y$10$dvf5S6cMztWq5pI5lXpcEeuffqS/DWb6oQm.bIvz6JhkznL/kxjci', 'test', 1, NULL, '2020-06-21 09:36:20', '2020-06-21 09:36:20', 1, 0, NULL),
(36, 'mkkk', '+201271665716', 'asd@asd.com', NULL, '$2y$10$.L63aJxnymY57FJaVL5LaeCEI2VP.X25hX9ggWjARHVkOVeD8BkwC', 'cBP3W9y1jEmSgJx42KEp3v:APA91bHLYpUVfuQRTeCbMtvRqgG9woPvqGUyEEPLEZokCPx00RVm0YNcqCrADuGzrXKe3sbNPreo_jcPj_1OzekTHSiIQN-MXGDmnkcawnfxtzKRyxrGc9H7rmd1kjxc2txGdiu2JU8h', 1, NULL, '2020-07-27 05:39:23', '2020-07-27 05:39:34', 1, 0, NULL),
(37, 'مصطفى خضر', '+9650111535316555', 'testfff@test.com', NULL, '$2y$10$P30ICTi5eBijWeGMBya3wO0KqWsqMVLxCK4B43IEtUUuGnZAwpkeW', NULL, 1, NULL, '2020-07-27 09:31:01', '2020-07-27 23:26:11', 1, 0, 4),
(38, 'mostafakhedr', '+96501115353169', 'dasdasad@fsdfsafl.com', NULL, '$2y$10$Wy/BQe3U664rlyu9eC8HJOVo5XggG8n/6eo7OZ63m41nM.LOI/c.C', NULL, 1, NULL, '2020-07-27 09:39:27', '2020-07-27 09:39:27', 1, 0, NULL),
(39, 'ahmed', '+201116344148', 'juba21@live.com', NULL, '$2y$10$ZSwYN03xqK/pddU86eANZutceaY0P4PRsxQ/ekNXUgPLENPtf09NC', 'dzwf7d2jVaE:APA91bGb6dffpnRfujv7zhBkUBPC028Rq5nYTrD2y1_pdudpHI-74xDFLxIip47OCRIAr4oPt_1SAKb5CgKNssCo0bKywTQePh7XktpjAh54XR3nSQIor9fMDZSVpxcfmaF3UKFizyd4', 1, NULL, '2020-07-29 01:52:37', '2020-07-29 07:59:55', 1, 0, 8);

-- --------------------------------------------------------

--
-- Table structure for table `user_addresses`
--

CREATE TABLE `user_addresses` (
  `id` int(11) NOT NULL,
  `latitude` varchar(100) NOT NULL,
  `longitude` varchar(100) NOT NULL,
  `title` varchar(150) DEFAULT NULL,
  `address_type` int(11) NOT NULL,
  `area_id` int(11) NOT NULL,
  `gaddah` varchar(100) DEFAULT NULL,
  `building` varchar(100) NOT NULL,
  `floor` varchar(100) NOT NULL,
  `apartment_number` varchar(50) NOT NULL,
  `street` varchar(255) NOT NULL,
  `extra_details` text,
  `user_id` int(11) NOT NULL,
  `phone` varchar(40) NOT NULL,
  `piece` varchar(150) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_addresses`
--

INSERT INTO `user_addresses` (`id`, `latitude`, `longitude`, `title`, `address_type`, `area_id`, `gaddah`, `building`, `floor`, `apartment_number`, `street`, `extra_details`, `user_id`, `phone`, `piece`, `created_at`, `updated_at`) VALUES
(1, '31.3', '29.9', 'title', 1, 1, 'gadddah', 'kksk', '454 kk', '44 m', 'sksk', 'extra details', 33, '+2058589656', 'dkdkd', '2020-06-09 15:31:53', '2020-06-09 15:31:53'),
(3, '31.33322', '29.9999', 'title', 1, 2, 'gadddah', 'kksk', '454 kk', '44 m', 'sksk', 'extra details', 33, '+2058589656', 'dkdkd', '2020-06-09 15:34:21', '2020-06-09 15:34:21'),
(4, '30.1499067', '31.3679355', 'عنوان جديد', 1, 1, 'gada', '2', '3', '5', 'street', 'iuuuu', 37, '1116344148', 'block', '2020-07-27 23:23:21', '2020-07-27 23:23:21'),
(5, '0.0', '0.0', 'العنوان', 1, 1, '1', '1', '1', '1', '1', '1', 31, '01115353169', '1', '2020-07-28 04:30:18', '2020-07-28 04:30:18'),
(6, '0.0', '0.0', 'العنوان', 1, 1, '1', '1', '1', '1', '1', '1', 31, '01115353169', '1', '2020-07-28 04:30:25', '2020-07-28 04:30:25'),
(7, '31.33322', '29.9999', 'title', 1, 1, 'gadddah', 'kksk', '454 kk', '44 m', 'sksk', 'extra details', 34, '+2058589656', 'dkdkd', '2020-07-29 07:49:54', '2020-07-29 07:49:54'),
(8, '0.0', '0.0', 'نلننلن', 1, 1, 'مك', '6', '6', '5', 'ةةة', 'غرعرا', 39, '01116344148', 'ارتر', '2020-07-29 07:59:53', '2020-07-29 07:59:53');

-- --------------------------------------------------------

--
-- Table structure for table `user_notifications`
--

CREATE TABLE `user_notifications` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `notification_id` int(11) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `user_notifications`
--

INSERT INTO `user_notifications` (`id`, `user_id`, `notification_id`, `created_at`, `updated_at`) VALUES
(1, 23, 25, '2020-04-05 15:46:01', '2020-04-05 15:46:01'),
(2, 23, 26, '2020-04-05 15:52:55', '2020-04-05 15:52:55'),
(3, 24, 27, '2020-04-09 15:56:16', '2020-04-09 15:56:16'),
(4, 24, 31, '2020-04-12 09:33:44', '2020-04-12 09:33:44'),
(5, 24, 32, '2020-04-12 09:41:37', '2020-04-12 09:41:37'),
(6, 1, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(7, 2, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(8, 3, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(9, 4, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(10, 5, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(11, 6, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(12, 7, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(13, 8, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(14, 9, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(15, 10, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(16, 11, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(17, 16, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(18, 17, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(19, 21, 34, '2020-04-12 09:43:55', '2020-04-12 09:43:55'),
(20, 22, 34, '2020-04-12 09:43:56', '2020-04-12 09:43:56'),
(21, 23, 34, '2020-04-12 09:43:56', '2020-04-12 09:43:56'),
(22, 24, 34, '2020-04-12 09:43:56', '2020-04-12 09:43:56'),
(23, 1, 35, '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(24, 2, 35, '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(25, 3, 35, '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(26, 4, 35, '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(27, 5, 35, '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(28, 6, 35, '2020-04-12 09:44:14', '2020-04-12 09:44:14'),
(29, 7, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(30, 8, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(31, 9, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(32, 10, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(33, 11, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(34, 16, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(35, 17, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(36, 21, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(37, 22, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(38, 23, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(39, 24, 35, '2020-04-12 09:44:15', '2020-04-12 09:44:15'),
(40, 24, 36, '2020-04-12 12:58:35', '2020-04-12 12:58:35'),
(41, 24, 37, '2020-04-12 13:32:38', '2020-04-12 13:32:38'),
(42, 24, 38, '2020-04-12 13:34:26', '2020-04-12 13:34:26'),
(43, 27, 39, '2020-04-15 09:20:42', '2020-04-15 09:20:42'),
(44, 27, 40, '2020-04-15 10:20:21', '2020-04-15 10:20:21'),
(45, 27, 41, '2020-04-15 10:23:02', '2020-04-15 10:23:02'),
(46, 27, 42, '2020-04-15 10:27:35', '2020-04-15 10:27:35'),
(47, 1, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(48, 2, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(49, 3, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(50, 4, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(51, 5, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(52, 6, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(53, 7, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(54, 8, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(55, 9, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(56, 10, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(57, 11, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(58, 13, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(59, 16, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(60, 17, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(61, 21, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(62, 22, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(63, 23, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(64, 24, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(65, 25, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(66, 26, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(67, 27, 43, '2020-04-15 10:28:28', '2020-04-15 10:28:28'),
(68, 1, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(69, 2, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(70, 3, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(71, 4, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(72, 5, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(73, 6, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(74, 7, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(75, 8, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(76, 9, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(77, 10, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(78, 11, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(79, 13, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(80, 16, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(81, 17, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(82, 21, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(83, 22, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(84, 23, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(85, 24, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(86, 25, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(87, 26, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(88, 27, 44, '2020-04-15 10:29:11', '2020-04-15 10:29:11'),
(89, 27, 45, '2020-04-15 10:29:54', '2020-04-15 10:29:54'),
(90, 27, 46, '2020-04-15 10:30:15', '2020-04-15 10:30:15'),
(91, 27, 47, '2020-04-15 10:32:31', '2020-04-15 10:32:31'),
(92, 27, 48, '2020-04-15 10:33:07', '2020-04-15 10:33:07'),
(93, 27, 49, '2020-04-20 18:24:03', '2020-04-20 18:24:03'),
(94, 27, 50, '2020-04-20 18:25:24', '2020-04-20 18:25:24');

-- --------------------------------------------------------

--
-- Table structure for table `visitors`
--

CREATE TABLE `visitors` (
  `id` int(11) NOT NULL,
  `unique_id` varchar(350) NOT NULL,
  `type` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `visitors`
--

INSERT INTO `visitors` (`id`, `unique_id`, `type`, `user_id`, `created_at`, `updated_at`) VALUES
(1, 'hdjhjkdhdllkyeygsfsfsdhdlppopooiuysg', 1, NULL, '2020-06-17 22:21:00', '2020-06-17 22:21:00'),
(2, 'dklkdlkdklldkdlkkldk', 1, 36, '2020-06-21 06:18:06', '2020-07-27 05:39:23'),
(3, 'jkjkjjkjkjkjkjjkgffdddsssdfjjl', 1, NULL, '2020-06-21 10:10:15', '2020-06-21 10:10:15'),
(4, 'jkjkjjkjkjkjkjjkgffdddsssdfjjl', 1, NULL, '2020-06-21 10:10:28', '2020-06-21 10:10:28'),
(5, 'jkjkjjkjkjkjkjjkgffdddsssdfjjl', 1, NULL, '2020-06-21 10:10:39', '2020-06-21 10:10:39'),
(6, 'jkjkjjkjkjkjkjjkgffdddsssdfjjlp', 1, NULL, '2020-06-21 10:13:37', '2020-06-21 10:13:37'),
(7, 'a6b555ac991f43f0', 2, 31, '2020-07-26 16:58:26', '2020-07-27 09:41:29'),
(8, 'a43bfc13ec52cd13', 2, 39, '2020-07-26 17:20:07', '2020-07-29 01:52:37'),
(9, '579e4f3d0c1d0d80', 2, NULL, '2020-07-26 18:32:28', '2020-07-26 18:32:28'),
(10, '7B5D09E6-424E-40F4-BDBE-D9D8AC52133A', 1, 36, '2020-07-27 05:39:34', '2020-07-27 05:39:34'),
(11, 'facf9a38f3be31c1', 2, NULL, '2020-07-27 05:41:09', '2020-07-27 05:41:09'),
(12, '9cca78762cda479d', 2, NULL, '2020-07-27 09:24:04', '2020-07-27 09:24:04'),
(13, 'add37dfbf795d0e4', 2, NULL, '2020-07-28 06:58:06', '2020-07-28 06:58:06');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `ads`
--
ALTER TABLE `ads`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `areas`
--
ALTER TABLE `areas`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `carts`
--
ALTER TABLE `carts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `contact_us`
--
ALTER TABLE `contact_us`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `favorites`
--
ALTER TABLE `favorites`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_elements`
--
ALTER TABLE `home_elements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `home_sections`
--
ALTER TABLE `home_sections`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `meta_tags`
--
ALTER TABLE `meta_tags`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `offers`
--
ALTER TABLE `offers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `options`
--
ALTER TABLE `options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`(191));

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_images`
--
ALTER TABLE `product_images`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_options`
--
ALTER TABLE `product_options`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `rates`
--
ALTER TABLE `rates`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sub_categories`
--
ALTER TABLE `sub_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_addresses`
--
ALTER TABLE `user_addresses`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_notifications`
--
ALTER TABLE `user_notifications`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `visitors`
--
ALTER TABLE `visitors`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
--
-- AUTO_INCREMENT for table `admin_permissions`
--
ALTER TABLE `admin_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=238;
--
-- AUTO_INCREMENT for table `ads`
--
ALTER TABLE `ads`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `areas`
--
ALTER TABLE `areas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `carts`
--
ALTER TABLE `carts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `contact_us`
--
ALTER TABLE `contact_us`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;
--
-- AUTO_INCREMENT for table `favorites`
--
ALTER TABLE `favorites`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `home_elements`
--
ALTER TABLE `home_elements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=108;
--
-- AUTO_INCREMENT for table `home_sections`
--
ALTER TABLE `home_sections`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `meta_tags`
--
ALTER TABLE `meta_tags`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=51;
--
-- AUTO_INCREMENT for table `offers`
--
ALTER TABLE `offers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;
--
-- AUTO_INCREMENT for table `options`
--
ALTER TABLE `options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;
--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `product_images`
--
ALTER TABLE `product_images`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=67;
--
-- AUTO_INCREMENT for table `product_options`
--
ALTER TABLE `product_options`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;
--
-- AUTO_INCREMENT for table `rates`
--
ALTER TABLE `rates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;
--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `sub_categories`
--
ALTER TABLE `sub_categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;
--
-- AUTO_INCREMENT for table `user_addresses`
--
ALTER TABLE `user_addresses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `user_notifications`
--
ALTER TABLE `user_notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `visitors`
--
ALTER TABLE `visitors`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
