-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 13, 2026 at 10:18 AM
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
-- Database: `warehouse_wms`
--

-- --------------------------------------------------------

--
-- Table structure for table `batches`
--

CREATE TABLE `batches` (
  `id` int(11) NOT NULL,
  `batch_number` varchar(255) NOT NULL,
  `company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `quantity` decimal(12,3) DEFAULT 0.000,
  `reserved` decimal(12,3) DEFAULT 0.000,
  `unit_cost` decimal(12,2) DEFAULT NULL,
  `received_date` date DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `manufacturing_date` date DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bundles`
--

CREATE TABLE `bundles` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `cost_price` decimal(12,2) DEFAULT 0.00,
  `selling_price` decimal(12,2) DEFAULT 0.00,
  `status` varchar(255) DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` text DEFAULT NULL,
  `currency` varchar(255) DEFAULT 'USD'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `bundle_items`
--

CREATE TABLE `bundle_items` (
  `id` int(11) NOT NULL,
  `bundle_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(12,3) DEFAULT 0.000,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `company_id`, `name`, `code`, `created_at`, `updated_at`) VALUES
(9, 1, 'demo ', '3434343', '2026-03-06 13:15:42', '2026-03-06 13:15:42');

-- --------------------------------------------------------

--
-- Table structure for table `companies`
--

CREATE TABLE `companies` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `companies`
--

INSERT INTO `companies` (`id`, `name`, `code`, `email`, `phone`, `address`, `status`, `created_at`, `updated_at`) VALUES
(1, 'water supply', '25005', NULL, '04545454555', 'demo\ndemo', 'ACTIVE', '2026-01-28 11:43:12', '2026-01-31 13:16:38');

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `type` varchar(255) DEFAULT NULL,
  `contact_person` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `tier` varchar(255) DEFAULT NULL,
  `segment` varchar(255) DEFAULT NULL,
  `credit_limit` decimal(15,2) DEFAULT 0.00,
  `payment_terms` varchar(255) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ACTIVE',
  `postcode` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cycle_counts`
--

CREATE TABLE `cycle_counts` (
  `id` int(11) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `count_name` varchar(255) NOT NULL,
  `count_type` varchar(255) DEFAULT NULL,
  `location_id` int(11) DEFAULT NULL,
  `scheduled_date` date DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` varchar(255) DEFAULT 'PENDING',
  `items_count` int(11) DEFAULT 0,
  `discrepancies` int(11) DEFAULT 0,
  `counted_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goods_receipts`
--

CREATE TABLE `goods_receipts` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `gr_number` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `notes` text DEFAULT NULL,
  `total_expected` int(11) DEFAULT 0,
  `total_received` int(11) DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `goods_receipt_items`
--

CREATE TABLE `goods_receipt_items` (
  `id` int(11) NOT NULL,
  `goods_receipt_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_sku` varchar(255) DEFAULT NULL,
  `expected_qty` int(11) DEFAULT 0,
  `received_qty` int(11) DEFAULT 0,
  `quality_status` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `inventory_adjustments`
--

CREATE TABLE `inventory_adjustments` (
  `id` int(11) NOT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `type` varchar(255) NOT NULL,
  `quantity` decimal(12,3) DEFAULT 0.000,
  `reason` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `status` varchar(255) DEFAULT 'PENDING',
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `inventory_adjustments`
--

INSERT INTO `inventory_adjustments` (`id`, `reference_number`, `company_id`, `product_id`, `warehouse_id`, `type`, `quantity`, `reason`, `notes`, `status`, `created_by`, `created_at`, `updated_at`) VALUES
(86, 'ADJ-BW1NOGW2', 1, 90, 7, 'INCREASE', 5.500, 'SCAN_IN', 'Stock In — 4:55:05 PM', 'COMPLETED', 2, '2026-03-07 11:25:05', '2026-03-07 11:25:05'),
(87, 'ADJ-BW1NOGXM', 1, 90, 7, 'DECREASE', 2.000, 'SCAN_OUT', 'Stock Out — 4:55:17 PM', 'COMPLETED', 2, '2026-03-07 11:25:17', '2026-03-07 11:25:17'),
(88, 'ADJ-BW1NOGX1', 1, 90, 7, 'INCREASE', 1.000, 'SCAN_IN', 'Stock In — 4:55:36 PM', 'COMPLETED', 2, '2026-03-07 11:25:36', '2026-03-07 11:25:36'),
(89, 'ADJ-BW1NOG02', 1, 90, 7, 'INCREASE', 1.000, 'Auto Fast Scan IN', NULL, 'COMPLETED', 2, '2026-03-07 11:25:51', '2026-03-07 11:25:51'),
(90, 'ADJ-BW1NOG1S', 1, 90, 7, 'DECREASE', 1.000, 'Auto Fast Scan OUT', NULL, 'COMPLETED', 2, '2026-03-07 11:26:11', '2026-03-07 11:26:11'),
(91, 'ADJ-BW1NOG45', 1, 90, 8, 'INCREASE', 4.500, 'SCAN_IN', 'Stock In — 4:56:42 PM', 'COMPLETED', 2, '2026-03-07 11:26:42', '2026-03-07 11:26:42'),
(92, 'ADJ-BW1NOG51', 1, 90, 7, 'INCREASE', 1.000, 'Auto Fast Scan IN', NULL, 'COMPLETED', 2, '2026-03-07 11:27:09', '2026-03-07 11:27:09'),
(93, 'ADJ-BW1NOHC3', 1, 90, 8, 'INCREASE', 1.500, 'SCAN_IN', 'Stock In — 5:03:39 PM', 'COMPLETED', 2, '2026-03-07 11:33:39', '2026-03-07 11:33:39'),
(94, 'ADJ-BW1NOWP6', 1, 90, 7, 'INCREASE', 94.500, 'SCAN_IN', 'Stock In — 5:22:09 PM', 'COMPLETED', 2, '2026-03-07 11:52:09', '2026-03-07 11:52:09'),
(95, 'PROD-16', 1, 90, 7, 'DECREASE', 50.000, 'Consumed for Production Order #16', NULL, 'COMPLETED', 2, '2026-03-07 11:52:37', '2026-03-07 11:52:37'),
(96, 'PROD-16', 1, 90, 8, 'INCREASE', 50.000, 'Produced from Production Order #16', NULL, 'COMPLETED', 2, '2026-03-07 11:52:53', '2026-03-07 11:52:53'),
(97, 'ADJ-BW1NYJDK', 1, 98, 7, 'INCREASE', 12.000, 'Opening Stock', 'Initial stock added during product creation', 'COMPLETED', 2, '2026-03-07 12:38:20', '2026-03-07 12:38:20'),
(98, 'ADJ-BW1NYNFO', 1, 98, 7, 'INCREASE', 1.120, 'SCAN_IN', 'Stock In — 6:23:12 PM', 'COMPLETED', 2, '2026-03-07 12:53:12', '2026-03-07 12:53:12'),
(99, 'ADJ-BW1NYZB1', 1, 98, 7, 'INCREASE', 1.120, 'SCAN_IN', 'Stock In — 6:31:14 PM', 'COMPLETED', 2, '2026-03-07 13:01:14', '2026-03-07 13:01:14'),
(100, 'ADJ-BW1NYZFT', 1, 98, 7, 'INCREASE', 1.440, 'SCAN_IN', 'Stock In — 6:31:52 PM', 'COMPLETED', 2, '2026-03-07 13:01:52', '2026-03-07 13:01:52'),
(101, 'ADJ-BW1NY2FX', 1, 98, 7, 'INCREASE', 1.123, 'SCAN_IN', 'Stock In — 6:38:56 PM', 'COMPLETED', 2, '2026-03-07 13:08:56', '2026-03-07 13:08:56'),
(102, 'ADJ-BW1NY2DR', 1, 98, 7, 'INCREASE', 1.123, 'SCAN_IN', 'Stock In — 6:43:28 PM', 'COMPLETED', 2, '2026-03-07 13:13:28', '2026-03-07 13:13:28'),
(103, 'ADJ-BW1NZGE5', 1, 98, 7, 'INCREASE', 1.122, 'SCAN_IN', 'Stock In — 7:06:34 PM', 'COMPLETED', 2, '2026-03-07 13:36:34', '2026-03-07 13:36:34'),
(104, 'PROD-18', 1, 90, 8, 'DECREASE', 1.000, 'Consumed for Production Order #18', NULL, 'COMPLETED', 2, '2026-03-11 11:35:07', '2026-03-11 11:35:07'),
(105, 'PROD-18', 1, 90, 8, 'INCREASE', 1.000, 'Produced from Production Order #18', NULL, 'COMPLETED', 2, '2026-03-11 11:35:51', '2026-03-11 11:35:51'),
(106, 'PROD-19', 1, 90, 7, 'DECREASE', 0.002, 'Consumed for Production Order #19', NULL, 'COMPLETED', 2, '2026-03-11 11:57:03', '2026-03-11 11:57:03'),
(107, 'PROD-19', 1, 90, 8, 'INCREASE', 1.000, 'Produced from Production Order #19', NULL, 'COMPLETED', 2, '2026-03-11 11:57:21', '2026-03-11 11:57:21'),
(108, 'PROD-20', 1, 90, 7, 'DECREASE', 0.002, 'Consumed for Production Order #20', NULL, 'COMPLETED', 2, '2026-03-11 12:07:06', '2026-03-11 12:07:06'),
(109, 'PROD-21', 1, 90, 7, 'DECREASE', 0.002, 'Consumed for Production Order #21', NULL, 'COMPLETED', 2, '2026-03-11 12:10:58', '2026-03-11 12:10:58'),
(110, 'PROD-21', 1, 90, 8, 'INCREASE', 1.000, 'Produced from Production Order #21', NULL, 'COMPLETED', 2, '2026-03-11 12:11:06', '2026-03-11 12:11:06'),
(113, 'ADJ-BW1TMGHV', 1, 101, 8, 'INCREASE', 1.000, 'SCAN_IN', 'Stock In — 5:55:02 PM', 'COMPLETED', 2, '2026-03-11 12:25:02', '2026-03-11 12:25:02');

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `zone_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `aisle` varchar(255) DEFAULT NULL,
  `rack` varchar(255) DEFAULT NULL,
  `shelf` varchar(255) DEFAULT NULL,
  `bin` varchar(255) DEFAULT NULL,
  `location_type` varchar(255) DEFAULT NULL,
  `pick_sequence` int(11) DEFAULT NULL,
  `max_weight` decimal(10,2) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `heat_sensitive` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `movements`
--

CREATE TABLE `movements` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `product_id` int(11) NOT NULL,
  `batch_id` int(11) DEFAULT NULL,
  `from_location_id` int(11) DEFAULT NULL,
  `to_location_id` int(11) DEFAULT NULL,
  `quantity` decimal(12,3) DEFAULT 0.000,
  `reason` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movements`
--

INSERT INTO `movements` (`id`, `company_id`, `type`, `product_id`, `batch_id`, `from_location_id`, `to_location_id`, `quantity`, `reason`, `notes`, `created_by`, `created_at`, `updated_at`, `warehouse_id`) VALUES
(47, 1, 'INCREASE', 90, NULL, NULL, NULL, 100.000, 'Opening Stock', NULL, 2, '2026-03-06 13:16:05', '2026-03-06 13:16:05', 7),
(48, 1, 'DECREASE', 90, NULL, NULL, NULL, 1.000, 'SCAN_OUT', 'Stock Out — 6:53:59 PM', 2, '2026-03-06 13:24:00', '2026-03-06 13:24:00', 7),
(49, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.000, 'Auto Fast Scan IN', 'Reference: ADJ-BW1LEHNQ', 2, '2026-03-06 13:35:07', '2026-03-06 13:35:07', 7),
(50, 1, 'DECREASE', 90, NULL, NULL, NULL, 2.000, 'SCAN_OUT', 'Stock Out — 7:13:03 PM', 2, '2026-03-06 13:43:04', '2026-03-06 13:43:04', 7),
(51, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.000, 'SCAN_IN', 'Stock In — 3:40:07 PM', 2, '2026-03-07 10:10:07', '2026-03-07 10:10:07', 8),
(52, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.000, 'SCAN_IN', 'Stock In — 3:49:07 PM', 2, '2026-03-07 10:19:07', '2026-03-07 10:19:07', 8),
(53, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.000, 'SCAN_IN', 'Stock In — 3:56:35 PM', 2, '2026-03-07 10:26:35', '2026-03-07 10:26:35', 8),
(63, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.500, 'SCAN_IN', 'Stock In — 4:11:55 PM', 2, '2026-03-07 10:41:55', '2026-03-07 10:41:55', 7),
(64, 1, 'INCREASE', 90, NULL, NULL, NULL, 4.500, 'SCAN_IN', 'Stock In — 4:25:21 PM', 2, '2026-03-07 10:55:22', '2026-03-07 10:55:22', 7),
(65, 1, 'INCREASE', 90, NULL, NULL, NULL, 2.500, 'SCAN_IN', 'Stock In — 4:32:36 PM', 2, '2026-03-07 11:02:36', '2026-03-07 11:02:36', 8),
(66, 1, 'INCREASE', 90, NULL, NULL, NULL, 4.500, 'SCAN_IN', 'Stock In — 4:44:13 PM', 2, '2026-03-07 11:14:13', '2026-03-07 11:14:13', 7),
(67, 1, 'INCREASE', 90, NULL, NULL, NULL, 4.500, 'SCAN_IN', 'Stock In — 4:45:36 PM', 2, '2026-03-07 11:15:36', '2026-03-07 11:15:36', 8),
(68, 1, 'DECREASE', 90, NULL, NULL, NULL, 2.000, 'SCAN_OUT', 'Stock Out — 4:46:05 PM', 2, '2026-03-07 11:16:05', '2026-03-07 11:16:05', 8),
(69, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.000, 'Auto Fast Scan IN', 'Reference: ADJ-BW1NOGFJ', 2, '2026-03-07 11:16:40', '2026-03-07 11:16:40', 8),
(70, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.000, 'Auto Fast Scan IN', 'Reference: ADJ-BW1NOGJJ', 2, '2026-03-07 11:17:27', '2026-03-07 11:17:27', 8),
(71, 1, 'INCREASE', 90, NULL, NULL, NULL, 5.500, 'SCAN_IN', 'Stock In — 4:55:05 PM', 2, '2026-03-07 11:25:05', '2026-03-07 11:25:05', 7),
(72, 1, 'DECREASE', 90, NULL, NULL, NULL, 2.000, 'SCAN_OUT', 'Stock Out — 4:55:17 PM', 2, '2026-03-07 11:25:17', '2026-03-07 11:25:17', 7),
(73, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.000, 'SCAN_IN', 'Stock In — 4:55:36 PM', 2, '2026-03-07 11:25:36', '2026-03-07 11:25:36', 7),
(74, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.000, 'Auto Fast Scan IN', 'Reference: ADJ-BW1NOG02', 2, '2026-03-07 11:25:51', '2026-03-07 11:25:51', 7),
(75, 1, 'DECREASE', 90, NULL, NULL, NULL, 1.000, 'Auto Fast Scan OUT', 'Reference: ADJ-BW1NOG1S', 2, '2026-03-07 11:26:11', '2026-03-07 11:26:11', 7),
(76, 1, 'INCREASE', 90, NULL, NULL, NULL, 4.500, 'SCAN_IN', 'Stock In — 4:56:42 PM', 2, '2026-03-07 11:26:42', '2026-03-07 11:26:42', 8),
(77, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.000, 'Auto Fast Scan IN', 'Reference: ADJ-BW1NOG51', 2, '2026-03-07 11:27:09', '2026-03-07 11:27:09', 7),
(78, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.500, 'SCAN_IN', 'Stock In — 5:03:39 PM', 2, '2026-03-07 11:33:39', '2026-03-07 11:33:39', 8),
(79, 1, 'INCREASE', 90, NULL, NULL, NULL, 94.500, 'SCAN_IN', 'Stock In — 5:22:09 PM', 2, '2026-03-07 11:52:09', '2026-03-07 11:52:09', 7),
(80, 1, 'DECREASE', 90, NULL, NULL, NULL, 50.000, 'Consumed for Production Order #16', NULL, 2, '2026-03-07 11:52:37', '2026-03-07 11:52:37', 7),
(81, 1, 'INCREASE', 90, NULL, NULL, NULL, 50.000, 'Produced from Production Order #16', NULL, 2, '2026-03-07 11:52:53', '2026-03-07 11:52:53', 8),
(82, 1, 'INCREASE', 98, NULL, NULL, NULL, 12.000, 'Opening Stock', NULL, 2, '2026-03-07 12:38:20', '2026-03-07 12:38:20', 7),
(83, 1, 'INCREASE', 98, NULL, NULL, NULL, 1.120, 'SCAN_IN', 'Stock In — 6:23:12 PM', 2, '2026-03-07 12:53:12', '2026-03-07 12:53:12', 7),
(84, 1, 'INCREASE', 98, NULL, NULL, NULL, 1.120, 'SCAN_IN', 'Stock In — 6:31:14 PM', 2, '2026-03-07 13:01:14', '2026-03-07 13:01:14', 7),
(85, 1, 'INCREASE', 98, NULL, NULL, NULL, 1.440, 'SCAN_IN', 'Stock In — 6:31:52 PM', 2, '2026-03-07 13:01:52', '2026-03-07 13:01:52', 7),
(86, 1, 'INCREASE', 98, NULL, NULL, NULL, 1.123, 'SCAN_IN', 'Stock In — 6:38:56 PM', 2, '2026-03-07 13:08:57', '2026-03-07 13:08:57', 7),
(87, 1, 'INCREASE', 98, NULL, NULL, NULL, 1.123, 'SCAN_IN', 'Stock In — 6:43:28 PM', 2, '2026-03-07 13:13:28', '2026-03-07 13:13:28', 7),
(88, 1, 'INCREASE', 98, NULL, NULL, NULL, 1.122, 'SCAN_IN', 'Stock In — 7:06:34 PM', 2, '2026-03-07 13:36:34', '2026-03-07 13:36:34', 7),
(89, 1, 'DECREASE', 90, NULL, NULL, NULL, 1.000, 'Consumed for Production Order #18', NULL, 2, '2026-03-11 11:35:07', '2026-03-11 11:35:07', 8),
(90, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.000, 'Produced from Production Order #18', NULL, 2, '2026-03-11 11:35:51', '2026-03-11 11:35:51', 8),
(91, 1, 'DECREASE', 90, NULL, NULL, NULL, 0.002, 'Consumed for Production Order #19', NULL, 2, '2026-03-11 11:57:03', '2026-03-11 11:57:03', 7),
(92, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.000, 'Produced from Production Order #19', NULL, 2, '2026-03-11 11:57:22', '2026-03-11 11:57:22', 8),
(93, 1, 'DECREASE', 90, NULL, NULL, NULL, 0.002, 'Consumed for Production Order #20', NULL, 2, '2026-03-11 12:07:06', '2026-03-11 12:07:06', 7),
(94, 1, 'DECREASE', 90, NULL, NULL, NULL, 0.002, 'Consumed for Production Order #21', NULL, 2, '2026-03-11 12:10:58', '2026-03-11 12:10:58', 7),
(95, 1, 'INCREASE', 90, NULL, NULL, NULL, 1.000, 'Produced from Production Order #21', NULL, 2, '2026-03-11 12:11:06', '2026-03-11 12:11:06', 8),
(98, 1, 'INCREASE', 101, NULL, NULL, NULL, 1.000, 'SCAN_IN', 'Stock In — 5:55:02 PM', 2, '2026-03-11 12:25:02', '2026-03-11 12:25:02', 8);

-- --------------------------------------------------------

--
-- Table structure for table `notifications`
--

CREATE TABLE `notifications` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `title` varchar(255) NOT NULL,
  `message` text NOT NULL,
  `type` enum('info','warning','success','error') DEFAULT 'info',
  `priority` enum('low','medium','high') DEFAULT 'medium',
  `is_read` tinyint(1) DEFAULT 0,
  `link` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `notifications`
--

INSERT INTO `notifications` (`id`, `company_id`, `user_id`, `title`, `message`, `type`, `priority`, `is_read`, `link`, `created_at`, `updated_at`) VALUES
(3, 1, NULL, 'Low Stock Alert', 'Product Palm Heights Luxury Villa (6767) is below reorder level. Current: 2.5, Min: 12', 'warning', 'high', 0, '/products?highlight=90', '2026-03-07 11:22:23', '2026-03-07 11:22:23');

-- --------------------------------------------------------

--
-- Table structure for table `order_items`
--

CREATE TABLE `order_items` (
  `id` int(11) NOT NULL,
  `sales_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity` decimal(12,3) DEFAULT 0.000,
  `unit_price` decimal(12,2) DEFAULT 0.00,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `packing_tasks`
--

CREATE TABLE `packing_tasks` (
  `id` int(11) NOT NULL,
  `sales_order_id` int(11) NOT NULL,
  `pick_list_id` int(11) DEFAULT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'NOT_STARTED',
  `packed_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pick_lists`
--

CREATE TABLE `pick_lists` (
  `id` int(11) NOT NULL,
  `sales_order_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `assigned_to` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'NOT_STARTED',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `pick_list_items`
--

CREATE TABLE `pick_list_items` (
  `id` int(11) NOT NULL,
  `pick_list_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_required` decimal(12,3) DEFAULT 0.000,
  `quantity_picked` decimal(12,3) DEFAULT 0.000,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `production_formulas`
--

CREATE TABLE `production_formulas` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `is_default` tinyint(1) DEFAULT 1,
  `status` varchar(255) DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production_formulas`
--

INSERT INTO `production_formulas` (`id`, `company_id`, `product_id`, `name`, `description`, `is_default`, `status`, `created_at`, `updated_at`) VALUES
(31, 1, 90, 'demo dem,o', NULL, 0, 'ACTIVE', '2026-03-11 11:56:00', '2026-03-11 11:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `production_formula_items`
--

CREATE TABLE `production_formula_items` (
  `id` int(11) NOT NULL,
  `formula_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_per_unit` decimal(12,4) NOT NULL DEFAULT 1.0000,
  `unit` varchar(255) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `wastage_percentage` decimal(5,2) DEFAULT 0.00,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production_formula_items`
--

INSERT INTO `production_formula_items` (`id`, `formula_id`, `product_id`, `quantity_per_unit`, `unit`, `warehouse_id`, `wastage_percentage`, `created_at`, `updated_at`) VALUES
(77, 31, 90, 2.0000, 'g', 7, 0.00, '2026-03-11 11:56:00', '2026-03-11 11:56:00');

-- --------------------------------------------------------

--
-- Table structure for table `production_orders`
--

CREATE TABLE `production_orders` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `quantity_goal` int(11) DEFAULT 0,
  `quantity_produced` int(11) DEFAULT 0,
  `status` varchar(255) DEFAULT 'DRAFT',
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `formula_id` int(11) DEFAULT NULL,
  `production_area_id` int(11) DEFAULT NULL,
  `target_warehouse_id` int(11) DEFAULT NULL,
  `start_date` datetime DEFAULT NULL,
  `completion_date` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production_orders`
--

INSERT INTO `production_orders` (`id`, `company_id`, `product_id`, `warehouse_id`, `quantity_goal`, `quantity_produced`, `status`, `notes`, `created_at`, `updated_at`, `formula_id`, `production_area_id`, `target_warehouse_id`, `start_date`, `completion_date`) VALUES
(16, 1, 90, 8, 50, 50, 'COMPLETED', 'opt', '2026-03-07 11:50:56', '2026-03-07 11:52:53', 26, 1, 8, '2026-03-07 11:52:37', '2026-03-07 11:52:53'),
(18, 1, 90, 8, 1, 1, 'COMPLETED', 'opt', '2026-03-11 11:34:25', '2026-03-11 11:35:51', 29, 1, 8, '2026-03-11 11:35:07', '2026-03-11 11:35:51'),
(19, 1, 90, 8, 1, 1, 'COMPLETED', 'opt', '2026-03-11 11:56:19', '2026-03-11 11:57:22', 31, 1, 8, '2026-03-11 11:57:03', '2026-03-11 11:57:22'),
(21, 1, 90, 8, 1, 1, 'COMPLETED', 'opt', '2026-03-11 12:07:33', '2026-03-11 12:11:06', 31, 1, 8, '2026-03-11 12:10:58', '2026-03-11 12:11:06'),
(22, 1, 90, 8, 1, 0, 'VALIDATED', 'opt', '2026-03-11 12:16:17', '2026-03-11 12:16:18', 31, 1, 8, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `production_order_items`
--

CREATE TABLE `production_order_items` (
  `id` int(11) NOT NULL,
  `production_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_required` int(11) DEFAULT 0,
  `quantity_picked` int(11) DEFAULT 0,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `unit` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `production_order_items`
--

INSERT INTO `production_order_items` (`id`, `production_order_id`, `product_id`, `quantity_required`, `quantity_picked`, `created_at`, `updated_at`, `warehouse_id`, `unit`) VALUES
(31, 16, 90, 50, 0, '2026-03-07 11:50:56', '2026-03-07 11:50:56', 7, 'kg'),
(33, 18, 90, 1, 0, '2026-03-11 11:34:25', '2026-03-11 11:34:25', 8, 'g'),
(34, 19, 90, 2, 0, '2026-03-11 11:56:19', '2026-03-11 11:56:19', 7, 'g'),
(36, 21, 90, 2, 0, '2026-03-11 12:07:33', '2026-03-11 12:07:33', 7, 'g'),
(37, 22, 90, 2, 0, '2026-03-11 12:16:17', '2026-03-11 12:16:17', 7, 'g');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `sku` varchar(255) NOT NULL,
  `barcode` varchar(255) DEFAULT NULL,
  `price` decimal(12,2) DEFAULT 0.00,
  `reorder_level` int(11) DEFAULT 0,
  `status` varchar(255) DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `description` text DEFAULT NULL,
  `color` varchar(255) DEFAULT NULL,
  `product_type` varchar(255) DEFAULT NULL,
  `unit_of_measure` varchar(255) DEFAULT NULL,
  `cost_price` decimal(12,2) DEFAULT NULL,
  `vat_rate` decimal(5,2) DEFAULT NULL,
  `vat_code` varchar(255) DEFAULT NULL,
  `customs_tariff` varchar(255) DEFAULT NULL,
  `marketplace_skus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`marketplace_skus`)),
  `heat_sensitive` varchar(255) DEFAULT NULL,
  `perishable` varchar(255) DEFAULT NULL,
  `require_batch_tracking` varchar(255) DEFAULT NULL,
  `shelf_life_days` int(11) DEFAULT NULL,
  `length` decimal(10,2) DEFAULT NULL,
  `width` decimal(10,2) DEFAULT NULL,
  `height` decimal(10,2) DEFAULT NULL,
  `dimension_unit` varchar(255) DEFAULT NULL,
  `weight` decimal(10,3) DEFAULT NULL,
  `weight_unit` varchar(255) DEFAULT NULL,
  `reorder_qty` int(11) DEFAULT NULL,
  `max_stock` int(11) DEFAULT NULL,
  `images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`images`)),
  `supplier_id` int(11) DEFAULT NULL,
  `cartons` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`cartons`)),
  `price_lists` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`price_lists`)),
  `supplier_products` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`supplier_products`)),
  `alternative_skus` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin DEFAULT NULL CHECK (json_valid(`alternative_skus`)),
  `currency` varchar(255) DEFAULT 'EUR'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `company_id`, `category_id`, `name`, `sku`, `barcode`, `price`, `reorder_level`, `status`, `created_at`, `updated_at`, `description`, `color`, `product_type`, `unit_of_measure`, `cost_price`, `vat_rate`, `vat_code`, `customs_tariff`, `marketplace_skus`, `heat_sensitive`, `perishable`, `require_batch_tracking`, `shelf_life_days`, `length`, `width`, `height`, `dimension_unit`, `weight`, `weight_unit`, `reorder_qty`, `max_stock`, `images`, `supplier_id`, `cartons`, `price_lists`, `supplier_products`, `alternative_skus`, `currency`) VALUES
(90, 1, 9, 'Palm Heights Luxury Villa', '6767', '6564546567766', 0.00, 12, 'ACTIVE', '2026-03-06 13:16:05', '2026-03-07 11:13:34', 'opt', 'blue', 'SIMPLE', 'KG', 0.00, 20.00, NULL, NULL, '{\"hdSku\":null,\"hdSaleSku\":null,\"warehouseId\":7,\"ebayId\":null,\"amazonSku\":null,\"amazonSkuSplitBefore\":null,\"amazonMpnSku\":null,\"amazonIdSku\":null}', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 'cm', 0.000, 'kg', 12, 120, '[]', NULL, '[]', '{\"AMAZON\":null,\"EBAY\":null,\"SHOPIFY\":null,\"DIRECT\":0}', '[]', NULL, 'USD'),
(98, 1, 9, 'demo dem,o', '676712', '6564546567766', 0.00, 12, 'ACTIVE', '2026-03-07 12:38:20', '2026-03-07 12:38:20', 'opt', 'blue', 'RAW_MATERIAL', 'EACH', 0.00, 20.00, NULL, NULL, '{\"hdSku\":null,\"hdSaleSku\":null,\"warehouseId\":7,\"ebayId\":null,\"amazonSku\":null,\"amazonSkuSplitBefore\":null,\"amazonMpnSku\":null,\"amazonIdSku\":null}', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 'cm', 0.000, 'kg', NULL, 14, '[]', NULL, '[]', NULL, '[]', NULL, 'USD'),
(101, 1, NULL, 'demo dem,o233332', '23232323323232', '23233233', 0.00, 0, 'ACTIVE', '2026-03-11 12:24:46', '2026-03-11 12:24:46', NULL, 'blue', 'SIMPLE', 'EACH', 0.00, 20.00, NULL, NULL, '{\"hdSku\":null,\"hdSaleSku\":null,\"warehouseId\":8,\"ebayId\":null,\"amazonSku\":null,\"amazonSkuSplitBefore\":null,\"amazonMpnSku\":null,\"amazonIdSku\":null}', NULL, NULL, NULL, NULL, 0.00, 0.00, 0.00, 'cm', 0.000, 'kg', NULL, NULL, '[]', NULL, '[]', NULL, '[]', NULL, 'USD');

-- --------------------------------------------------------

--
-- Table structure for table `product_stocks`
--

CREATE TABLE `product_stocks` (
  `id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `location_id` int(11) DEFAULT NULL,
  `quantity` decimal(12,3) DEFAULT 0.000,
  `reserved` decimal(12,3) DEFAULT 0.000,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `status` varchar(255) DEFAULT 'ACTIVE',
  `lot_number` varchar(255) DEFAULT NULL,
  `batch_number` varchar(255) DEFAULT NULL,
  `serial_number` varchar(255) DEFAULT NULL,
  `best_before_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_stocks`
--

INSERT INTO `product_stocks` (`id`, `product_id`, `warehouse_id`, `location_id`, `quantity`, `reserved`, `created_at`, `updated_at`, `status`, `lot_number`, `batch_number`, `serial_number`, `best_before_date`) VALUES
(69, 90, 7, NULL, 49.994, 0.000, '2026-03-07 11:25:05', '2026-03-11 12:10:58', 'ACTIVE', NULL, NULL, NULL, NULL),
(70, 90, 8, NULL, 58.000, 0.000, '2026-03-07 11:26:42', '2026-03-11 12:11:06', 'ACTIVE', NULL, NULL, NULL, NULL),
(71, 98, 7, NULL, 19.048, 0.000, '2026-03-07 12:38:20', '2026-03-07 13:36:34', 'ACTIVE', NULL, NULL, NULL, NULL),
(73, 101, 8, NULL, 1.000, 0.000, '2026-03-11 12:24:46', '2026-03-11 12:25:02', 'ACTIVE', NULL, NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `purchase_orders`
--

CREATE TABLE `purchase_orders` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `supplier_id` int(11) NOT NULL,
  `po_number` varchar(255) NOT NULL,
  `status` varchar(255) DEFAULT 'pending',
  `total_amount` decimal(12,2) DEFAULT 0.00,
  `expected_delivery` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_order_items`
--

CREATE TABLE `purchase_order_items` (
  `id` int(11) NOT NULL,
  `purchase_order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `product_name` varchar(255) DEFAULT NULL,
  `product_sku` varchar(255) DEFAULT NULL,
  `quantity` decimal(12,3) DEFAULT 0.000,
  `unit_price` decimal(12,2) DEFAULT 0.00,
  `total_price` decimal(12,2) DEFAULT 0.00,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replenishment_configs`
--

CREATE TABLE `replenishment_configs` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `min_stock_level` int(11) NOT NULL DEFAULT 0,
  `max_stock_level` int(11) NOT NULL DEFAULT 0,
  `reorder_point` int(11) NOT NULL DEFAULT 0,
  `reorder_quantity` int(11) NOT NULL DEFAULT 0,
  `auto_create_tasks` tinyint(1) NOT NULL DEFAULT 1,
  `status` varchar(255) DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `replenishment_tasks`
--

CREATE TABLE `replenishment_tasks` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `from_location_id` int(11) NOT NULL,
  `to_location_id` int(11) NOT NULL,
  `task_number` varchar(255) NOT NULL,
  `quantity_needed` int(11) NOT NULL DEFAULT 0,
  `quantity_completed` int(11) NOT NULL DEFAULT 0,
  `priority` varchar(255) DEFAULT 'MEDIUM',
  `notes` text DEFAULT NULL,
  `status` varchar(255) DEFAULT 'PENDING',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reports`
--

CREATE TABLE `reports` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `report_name` varchar(255) NOT NULL,
  `report_type` varchar(255) NOT NULL,
  `category` varchar(255) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `format` varchar(255) DEFAULT 'PDF',
  `schedule` varchar(255) DEFAULT 'ONCE',
  `status` varchar(255) DEFAULT 'COMPLETED',
  `last_run_at` datetime DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `returns`
--

CREATE TABLE `returns` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `rma_number` varchar(255) NOT NULL,
  `sales_order_id` int(11) NOT NULL,
  `shipment_id` int(11) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'RMA_CREATED',
  `return_type` varchar(255) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `recovery_value` decimal(10,2) DEFAULT 0.00,
  `refund_amount` decimal(10,2) DEFAULT 0.00,
  `notes` text DEFAULT NULL,
  `received_at` datetime DEFAULT NULL,
  `inspected_at` datetime DEFAULT NULL,
  `completed_at` datetime DEFAULT NULL,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_orders`
--

CREATE TABLE `sales_orders` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `order_number` varchar(255) NOT NULL,
  `customer_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'DRAFT',
  `total_amount` decimal(12,2) DEFAULT 0.00,
  `created_by` int(11) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `order_date` date DEFAULT NULL,
  `required_date` date DEFAULT NULL,
  `priority` varchar(255) DEFAULT 'MEDIUM',
  `sales_channel` varchar(255) DEFAULT 'DIRECT',
  `order_type` varchar(255) DEFAULT NULL,
  `reference_number` varchar(255) DEFAULT NULL,
  `notes` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `shipments`
--

CREATE TABLE `shipments` (
  `id` int(11) NOT NULL,
  `sales_order_id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `packed_by` int(11) DEFAULT NULL,
  `courier_name` varchar(255) DEFAULT NULL,
  `tracking_number` varchar(255) DEFAULT NULL,
  `weight` decimal(10,2) DEFAULT NULL,
  `dispatch_date` date DEFAULT NULL,
  `delivery_status` varchar(255) DEFAULT 'READY_TO_SHIP',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `stock_deducted` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `code` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `email` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `password_hash` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `role` varchar(255) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `warehouse_id` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `email`, `password_hash`, `name`, `role`, `company_id`, `warehouse_id`, `status`, `created_at`, `updated_at`) VALUES
(1, 'admin@kiaan-wms.com', '$2a$10$zp9P4AQJkoZYTNgaKUisrO7BtUYHOq0HKkY7qqFJVsI/TwB.vUQvC', 'Super Administrator', 'super_admin', NULL, NULL, 'ACTIVE', '2026-01-28 17:03:36', '2026-01-28 17:03:36'),
(2, 'companyadmin@kiaan-wms.com', '$2a$10$yr4OsrOJNog3T1pquW9bbemISOFMVe05APIoYhzNlHbZorVndG8iG', 'company', 'company_admin', 1, NULL, 'ACTIVE', '2026-01-28 11:43:48', '2026-01-29 05:56:26'),
(5, 'inventorymanager@kiaan-wms.com', '$2a$10$Apx7xoWN5j6GnyXD7C/NSOFy/CdXCAHfZ8gpBRPJdvALpdXBqP/5W', 'inventory manager', 'inventory_manager', 1, NULL, 'ACTIVE', '2026-01-29 05:48:45', '2026-01-29 05:56:39'),
(6, 'warehousemanager@kiaan-wms.com', '$2a$10$SWJ1eXW31/55yE0D0Y7E1uwrMSq4R5Qy0EcdIArePi5SbbRfaw5SW', 'warehouse manager 1', 'warehouse_manager', 1, NULL, 'ACTIVE', '2026-01-29 05:49:21', '2026-01-30 07:28:58');

-- --------------------------------------------------------

--
-- Table structure for table `vat_codes`
--

CREATE TABLE `vat_codes` (
  `id` int(11) NOT NULL,
  `company_id` int(11) DEFAULT NULL,
  `code` varchar(255) NOT NULL,
  `label` varchar(255) DEFAULT NULL,
  `rate_percent` decimal(5,2) NOT NULL DEFAULT 0.00,
  `country_code` varchar(10) DEFAULT 'UK',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` int(11) NOT NULL,
  `company_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `warehouse_type` varchar(255) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `status` varchar(255) DEFAULT 'ACTIVE',
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL,
  `is_production` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `company_id`, `name`, `code`, `warehouse_type`, `address`, `phone`, `capacity`, `status`, `created_at`, `updated_at`, `is_production`) VALUES
(7, 1, 'a', '3434343', 'MAIN', 'demo', '04545454555', 999999, 'ACTIVE', '2026-03-06 13:15:20', '2026-03-07 10:31:58', 1),
(8, 1, 'b', '343434312', 'MAIN', 'demo\ndemo', '123456789', NULL, 'ACTIVE', '2026-03-07 10:00:46', '2026-03-07 10:00:46', 1);

-- --------------------------------------------------------

--
-- Table structure for table `zones`
--

CREATE TABLE `zones` (
  `id` int(11) NOT NULL,
  `warehouse_id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `code` varchar(255) DEFAULT NULL,
  `zone_type` varchar(255) DEFAULT NULL,
  `created_at` datetime NOT NULL,
  `updated_at` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `batches`
--
ALTER TABLE `batches`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `bundles`
--
ALTER TABLE `bundles`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bundles_company_id` (`company_id`);

--
-- Indexes for table `bundle_items`
--
ALTER TABLE `bundle_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bundle_items_bundle_id` (`bundle_id`),
  ADD KEY `bundle_items_product_id` (`product_id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_company_id` (`company_id`);

--
-- Indexes for table `companies`
--
ALTER TABLE `companies`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `companies_code` (`code`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `customers_company_id` (`company_id`);

--
-- Indexes for table `cycle_counts`
--
ALTER TABLE `cycle_counts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `location_id` (`location_id`),
  ADD KEY `counted_by` (`counted_by`);

--
-- Indexes for table `goods_receipts`
--
ALTER TABLE `goods_receipts`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `purchase_order_id` (`purchase_order_id`);

--
-- Indexes for table `goods_receipt_items`
--
ALTER TABLE `goods_receipt_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `goods_receipt_id` (`goods_receipt_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `inventory_adjustments`
--
ALTER TABLE `inventory_adjustments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `locations_zone_id` (`zone_id`);

--
-- Indexes for table `movements`
--
ALTER TABLE `movements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `batch_id` (`batch_id`),
  ADD KEY `from_location_id` (`from_location_id`),
  ADD KEY `to_location_id` (`to_location_id`),
  ADD KEY `created_by` (`created_by`);

--
-- Indexes for table `notifications`
--
ALTER TABLE `notifications`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `user_id` (`user_id`);

--
-- Indexes for table `order_items`
--
ALTER TABLE `order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `order_items_sales_order_id` (`sales_order_id`),
  ADD KEY `order_items_product_id` (`product_id`);

--
-- Indexes for table `packing_tasks`
--
ALTER TABLE `packing_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `packing_tasks_sales_order_id` (`sales_order_id`),
  ADD KEY `packing_tasks_pick_list_id` (`pick_list_id`),
  ADD KEY `packing_tasks_assigned_to` (`assigned_to`);

--
-- Indexes for table `pick_lists`
--
ALTER TABLE `pick_lists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pick_lists_sales_order_id` (`sales_order_id`),
  ADD KEY `pick_lists_warehouse_id` (`warehouse_id`),
  ADD KEY `pick_lists_assigned_to` (`assigned_to`);

--
-- Indexes for table `pick_list_items`
--
ALTER TABLE `pick_list_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `pick_list_items_pick_list_id` (`pick_list_id`),
  ADD KEY `pick_list_items_product_id` (`product_id`);

--
-- Indexes for table `production_formulas`
--
ALTER TABLE `production_formulas`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `production_formula_items`
--
ALTER TABLE `production_formula_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `formula_id` (`formula_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `production_orders`
--
ALTER TABLE `production_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `warehouse_id` (`warehouse_id`);

--
-- Indexes for table `production_order_items`
--
ALTER TABLE `production_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `production_order_id` (`production_order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `products_company_id` (`company_id`),
  ADD KEY `products_category_id` (`category_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `product_stocks_product_id` (`product_id`),
  ADD KEY `product_stocks_warehouse_id` (`warehouse_id`),
  ADD KEY `product_stocks_location_id` (`location_id`);

--
-- Indexes for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `supplier_id` (`supplier_id`);

--
-- Indexes for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_order_id` (`purchase_order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `replenishment_configs`
--
ALTER TABLE `replenishment_configs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Indexes for table `replenishment_tasks`
--
ALTER TABLE `replenishment_tasks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `product_id` (`product_id`),
  ADD KEY `from_location_id` (`from_location_id`),
  ADD KEY `to_location_id` (`to_location_id`);

--
-- Indexes for table `reports`
--
ALTER TABLE `reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `returns`
--
ALTER TABLE `returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `rma_number` (`rma_number`),
  ADD UNIQUE KEY `rma_number_2` (`rma_number`),
  ADD UNIQUE KEY `rma_number_3` (`rma_number`),
  ADD UNIQUE KEY `rma_number_4` (`rma_number`),
  ADD UNIQUE KEY `rma_number_5` (`rma_number`),
  ADD UNIQUE KEY `rma_number_6` (`rma_number`),
  ADD UNIQUE KEY `rma_number_7` (`rma_number`),
  ADD UNIQUE KEY `rma_number_8` (`rma_number`),
  ADD UNIQUE KEY `rma_number_9` (`rma_number`),
  ADD UNIQUE KEY `rma_number_10` (`rma_number`),
  ADD UNIQUE KEY `rma_number_11` (`rma_number`),
  ADD UNIQUE KEY `rma_number_12` (`rma_number`),
  ADD UNIQUE KEY `rma_number_13` (`rma_number`),
  ADD UNIQUE KEY `rma_number_14` (`rma_number`),
  ADD UNIQUE KEY `rma_number_15` (`rma_number`),
  ADD UNIQUE KEY `rma_number_16` (`rma_number`),
  ADD UNIQUE KEY `rma_number_17` (`rma_number`),
  ADD UNIQUE KEY `rma_number_18` (`rma_number`),
  ADD UNIQUE KEY `rma_number_19` (`rma_number`),
  ADD UNIQUE KEY `rma_number_20` (`rma_number`),
  ADD UNIQUE KEY `rma_number_21` (`rma_number`),
  ADD UNIQUE KEY `rma_number_22` (`rma_number`),
  ADD UNIQUE KEY `rma_number_23` (`rma_number`),
  ADD UNIQUE KEY `rma_number_24` (`rma_number`),
  ADD UNIQUE KEY `rma_number_25` (`rma_number`),
  ADD UNIQUE KEY `rma_number_26` (`rma_number`),
  ADD UNIQUE KEY `rma_number_27` (`rma_number`),
  ADD UNIQUE KEY `rma_number_28` (`rma_number`),
  ADD UNIQUE KEY `rma_number_29` (`rma_number`),
  ADD KEY `company_id` (`company_id`),
  ADD KEY `sales_order_id` (`sales_order_id`),
  ADD KEY `shipment_id` (`shipment_id`),
  ADD KEY `customer_id` (`customer_id`);

--
-- Indexes for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_orders_company_id` (`company_id`),
  ADD KEY `sales_orders_customer_id` (`customer_id`),
  ADD KEY `sales_orders_created_by` (`created_by`);

--
-- Indexes for table `shipments`
--
ALTER TABLE `shipments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `shipments_sales_order_id` (`sales_order_id`),
  ADD KEY `shipments_company_id` (`company_id`),
  ADD KEY `shipments_packed_by` (`packed_by`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suppliers_company_id` (`company_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email` (`email`),
  ADD UNIQUE KEY `email` (`email`),
  ADD UNIQUE KEY `email_2` (`email`),
  ADD UNIQUE KEY `email_3` (`email`),
  ADD UNIQUE KEY `email_4` (`email`),
  ADD UNIQUE KEY `email_5` (`email`),
  ADD UNIQUE KEY `email_6` (`email`),
  ADD UNIQUE KEY `email_7` (`email`),
  ADD UNIQUE KEY `email_8` (`email`),
  ADD UNIQUE KEY `email_9` (`email`),
  ADD UNIQUE KEY `email_10` (`email`),
  ADD UNIQUE KEY `email_11` (`email`),
  ADD UNIQUE KEY `email_12` (`email`),
  ADD UNIQUE KEY `email_13` (`email`),
  ADD UNIQUE KEY `email_14` (`email`),
  ADD UNIQUE KEY `email_15` (`email`),
  ADD UNIQUE KEY `email_16` (`email`),
  ADD UNIQUE KEY `email_17` (`email`),
  ADD UNIQUE KEY `email_18` (`email`),
  ADD UNIQUE KEY `email_19` (`email`),
  ADD UNIQUE KEY `email_20` (`email`),
  ADD UNIQUE KEY `email_21` (`email`),
  ADD UNIQUE KEY `email_22` (`email`),
  ADD UNIQUE KEY `email_23` (`email`),
  ADD UNIQUE KEY `email_24` (`email`),
  ADD UNIQUE KEY `email_25` (`email`),
  ADD UNIQUE KEY `email_26` (`email`),
  ADD UNIQUE KEY `email_27` (`email`),
  ADD UNIQUE KEY `email_28` (`email`),
  ADD UNIQUE KEY `email_29` (`email`),
  ADD UNIQUE KEY `email_30` (`email`),
  ADD UNIQUE KEY `email_31` (`email`),
  ADD UNIQUE KEY `email_32` (`email`),
  ADD UNIQUE KEY `email_33` (`email`),
  ADD UNIQUE KEY `email_34` (`email`),
  ADD UNIQUE KEY `email_35` (`email`),
  ADD UNIQUE KEY `email_36` (`email`),
  ADD UNIQUE KEY `email_37` (`email`),
  ADD UNIQUE KEY `email_38` (`email`),
  ADD UNIQUE KEY `email_39` (`email`),
  ADD UNIQUE KEY `email_40` (`email`),
  ADD UNIQUE KEY `email_41` (`email`),
  ADD UNIQUE KEY `email_42` (`email`),
  ADD UNIQUE KEY `email_43` (`email`),
  ADD UNIQUE KEY `email_44` (`email`),
  ADD UNIQUE KEY `email_45` (`email`),
  ADD UNIQUE KEY `email_46` (`email`),
  ADD UNIQUE KEY `email_47` (`email`),
  ADD UNIQUE KEY `email_48` (`email`),
  ADD UNIQUE KEY `email_49` (`email`),
  ADD UNIQUE KEY `email_50` (`email`),
  ADD UNIQUE KEY `email_51` (`email`),
  ADD UNIQUE KEY `email_52` (`email`),
  ADD UNIQUE KEY `email_53` (`email`),
  ADD UNIQUE KEY `email_54` (`email`),
  ADD UNIQUE KEY `email_55` (`email`),
  ADD UNIQUE KEY `email_56` (`email`),
  ADD UNIQUE KEY `email_57` (`email`),
  ADD UNIQUE KEY `email_58` (`email`),
  ADD UNIQUE KEY `email_59` (`email`),
  ADD UNIQUE KEY `email_60` (`email`),
  ADD KEY `users_company_id` (`company_id`),
  ADD KEY `users_warehouse_id` (`warehouse_id`);

--
-- Indexes for table `vat_codes`
--
ALTER TABLE `vat_codes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `company_id` (`company_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `warehouses_company_id` (`company_id`);

--
-- Indexes for table `zones`
--
ALTER TABLE `zones`
  ADD PRIMARY KEY (`id`),
  ADD KEY `zones_warehouse_id` (`warehouse_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `batches`
--
ALTER TABLE `batches`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bundles`
--
ALTER TABLE `bundles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `bundle_items`
--
ALTER TABLE `bundle_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `companies`
--
ALTER TABLE `companies`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `cycle_counts`
--
ALTER TABLE `cycle_counts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `goods_receipts`
--
ALTER TABLE `goods_receipts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `goods_receipt_items`
--
ALTER TABLE `goods_receipt_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `inventory_adjustments`
--
ALTER TABLE `inventory_adjustments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=114;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `movements`
--
ALTER TABLE `movements`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=99;

--
-- AUTO_INCREMENT for table `notifications`
--
ALTER TABLE `notifications`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `order_items`
--
ALTER TABLE `order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `packing_tasks`
--
ALTER TABLE `packing_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pick_lists`
--
ALTER TABLE `pick_lists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `pick_list_items`
--
ALTER TABLE `pick_list_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `production_formulas`
--
ALTER TABLE `production_formulas`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=32;

--
-- AUTO_INCREMENT for table `production_formula_items`
--
ALTER TABLE `production_formula_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;

--
-- AUTO_INCREMENT for table `production_orders`
--
ALTER TABLE `production_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `production_order_items`
--
ALTER TABLE `production_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT for table `product_stocks`
--
ALTER TABLE `product_stocks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=74;

--
-- AUTO_INCREMENT for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `replenishment_configs`
--
ALTER TABLE `replenishment_configs`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `replenishment_tasks`
--
ALTER TABLE `replenishment_tasks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `reports`
--
ALTER TABLE `reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `returns`
--
ALTER TABLE `returns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `sales_orders`
--
ALTER TABLE `sales_orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `shipments`
--
ALTER TABLE `shipments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `vat_codes`
--
ALTER TABLE `vat_codes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `zones`
--
ALTER TABLE `zones`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `batches`
--
ALTER TABLE `batches`
  ADD CONSTRAINT `batches_ibfk_166` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `batches_ibfk_167` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `batches_ibfk_168` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `batches_ibfk_169` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `batches_ibfk_61` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bundles`
--
ALTER TABLE `bundles`
  ADD CONSTRAINT `bundles_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `bundle_items`
--
ALTER TABLE `bundle_items`
  ADD CONSTRAINT `bundle_items_ibfk_113` FOREIGN KEY (`bundle_id`) REFERENCES `bundles` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `bundle_items_ibfk_114` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `customers`
--
ALTER TABLE `customers`
  ADD CONSTRAINT `customers_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `cycle_counts`
--
ALTER TABLE `cycle_counts`
  ADD CONSTRAINT `cycle_counts_ibfk_40` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `cycle_counts_ibfk_93` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `cycle_counts_ibfk_94` FOREIGN KEY (`counted_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `goods_receipts`
--
ALTER TABLE `goods_receipts`
  ADD CONSTRAINT `goods_receipts_ibfk_109` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `goods_receipts_ibfk_110` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `goods_receipt_items`
--
ALTER TABLE `goods_receipt_items`
  ADD CONSTRAINT `goods_receipt_items_ibfk_109` FOREIGN KEY (`goods_receipt_id`) REFERENCES `goods_receipts` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `goods_receipt_items_ibfk_110` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `inventory_adjustments`
--
ALTER TABLE `inventory_adjustments`
  ADD CONSTRAINT `inventory_adjustments_ibfk_140` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_adjustments_ibfk_141` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_adjustments_ibfk_142` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `inventory_adjustments_ibfk_61` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `locations`
--
ALTER TABLE `locations`
  ADD CONSTRAINT `locations_ibfk_1` FOREIGN KEY (`zone_id`) REFERENCES `zones` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `movements`
--
ALTER TABLE `movements`
  ADD CONSTRAINT `movements_ibfk_192` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `movements_ibfk_193` FOREIGN KEY (`batch_id`) REFERENCES `batches` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `movements_ibfk_194` FOREIGN KEY (`from_location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `movements_ibfk_195` FOREIGN KEY (`to_location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `movements_ibfk_196` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `movements_ibfk_61` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `notifications`
--
ALTER TABLE `notifications`
  ADD CONSTRAINT `notifications_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `notifications_ibfk_2` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `order_items`
--
ALTER TABLE `order_items`
  ADD CONSTRAINT `order_items_ibfk_113` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `order_items_ibfk_114` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `packing_tasks`
--
ALTER TABLE `packing_tasks`
  ADD CONSTRAINT `packing_tasks_ibfk_169` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `packing_tasks_ibfk_170` FOREIGN KEY (`pick_list_id`) REFERENCES `pick_lists` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `packing_tasks_ibfk_171` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pick_lists`
--
ALTER TABLE `pick_lists`
  ADD CONSTRAINT `pick_lists_ibfk_169` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pick_lists_ibfk_170` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `pick_lists_ibfk_171` FOREIGN KEY (`assigned_to`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `pick_list_items`
--
ALTER TABLE `pick_list_items`
  ADD CONSTRAINT `pick_list_items_ibfk_113` FOREIGN KEY (`pick_list_id`) REFERENCES `pick_lists` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `pick_list_items_ibfk_114` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `production_formulas`
--
ALTER TABLE `production_formulas`
  ADD CONSTRAINT `production_formulas_ibfk_1` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `production_formula_items`
--
ALTER TABLE `production_formula_items`
  ADD CONSTRAINT `production_formula_items_ibfk_1` FOREIGN KEY (`formula_id`) REFERENCES `production_formulas` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `production_formula_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `production_orders`
--
ALTER TABLE `production_orders`
  ADD CONSTRAINT `production_orders_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `production_orders_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `production_orders_ibfk_3` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `production_order_items`
--
ALTER TABLE `production_order_items`
  ADD CONSTRAINT `production_order_items_ibfk_1` FOREIGN KEY (`production_order_id`) REFERENCES `production_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `production_order_items_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `products_ibfk_163` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_164` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `products_ibfk_165` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `product_stocks`
--
ALTER TABLE `product_stocks`
  ADD CONSTRAINT `product_stocks_ibfk_169` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_stocks_ibfk_170` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `product_stocks_ibfk_171` FOREIGN KEY (`location_id`) REFERENCES `locations` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `purchase_orders`
--
ALTER TABLE `purchase_orders`
  ADD CONSTRAINT `purchase_orders_ibfk_111` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_orders_ibfk_112` FOREIGN KEY (`supplier_id`) REFERENCES `suppliers` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `purchase_order_items`
--
ALTER TABLE `purchase_order_items`
  ADD CONSTRAINT `purchase_order_items_ibfk_111` FOREIGN KEY (`purchase_order_id`) REFERENCES `purchase_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `purchase_order_items_ibfk_112` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;

--
-- Constraints for table `replenishment_configs`
--
ALTER TABLE `replenishment_configs`
  ADD CONSTRAINT `replenishment_configs_ibfk_11` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `replenishment_configs_ibfk_12` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `replenishment_tasks`
--
ALTER TABLE `replenishment_tasks`
  ADD CONSTRAINT `replenishment_tasks_ibfk_100` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `replenishment_tasks_ibfk_101` FOREIGN KEY (`from_location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `replenishment_tasks_ibfk_102` FOREIGN KEY (`to_location_id`) REFERENCES `locations` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `replenishment_tasks_ibfk_21` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `reports`
--
ALTER TABLE `reports`
  ADD CONSTRAINT `reports_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `returns`
--
ALTER TABLE `returns`
  ADD CONSTRAINT `returns_ibfk_113` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `returns_ibfk_114` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `returns_ibfk_115` FOREIGN KEY (`shipment_id`) REFERENCES `shipments` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `returns_ibfk_116` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `sales_orders`
--
ALTER TABLE `sales_orders`
  ADD CONSTRAINT `sales_orders_ibfk_144` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_orders_ibfk_145` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `sales_orders_ibfk_93` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `shipments`
--
ALTER TABLE `shipments`
  ADD CONSTRAINT `shipments_ibfk_169` FOREIGN KEY (`sales_order_id`) REFERENCES `sales_orders` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `shipments_ibfk_170` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE,
  ADD CONSTRAINT `shipments_ibfk_171` FOREIGN KEY (`packed_by`) REFERENCES `users` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_ibfk_117` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE,
  ADD CONSTRAINT `users_ibfk_118` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `vat_codes`
--
ALTER TABLE `vat_codes`
  ADD CONSTRAINT `vat_codes_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE SET NULL ON UPDATE CASCADE;

--
-- Constraints for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD CONSTRAINT `warehouses_ibfk_1` FOREIGN KEY (`company_id`) REFERENCES `companies` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `zones`
--
ALTER TABLE `zones`
  ADD CONSTRAINT `zones_ibfk_1` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE NO ACTION ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
