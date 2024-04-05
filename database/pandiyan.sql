-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 05, 2024 at 04:18 AM
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
-- Database: `pandiyan`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_num` varchar(192) NOT NULL,
  `account_name` varchar(192) NOT NULL,
  `initial_balance` decimal(10,2) NOT NULL,
  `note` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_logs`
--

CREATE TABLE `audit_logs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED DEFAULT NULL,
  `event` varchar(255) NOT NULL,
  `auditable_type` varchar(255) NOT NULL,
  `auditable_id` bigint(20) UNSIGNED NOT NULL,
  `old_values` text DEFAULT NULL,
  `new_values` text DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `ip_address` varchar(255) DEFAULT NULL,
  `user_agent` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `brands`
--

CREATE TABLE `brands` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `parent_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `currencies`
--

CREATE TABLE `currencies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(192) NOT NULL,
  `name` varchar(192) NOT NULL,
  `symbol` varchar(192) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `currencies`
--

INSERT INTO `currencies` (`id`, `code`, `name`, `symbol`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'USD', 'US Dollar', '$', NULL, NULL, NULL),
(2, 'EUR', 'Euro', '€', NULL, NULL, NULL),
(3, 'JPY', 'Japanese Yen', '¥', NULL, NULL, NULL),
(4, 'GBP', 'British Pound', '£', NULL, NULL, NULL),
(5, 'AUD', 'Australian Dollar', 'A$', NULL, NULL, NULL),
(6, 'CAD', 'Canadian Dollar', 'C$', NULL, NULL, NULL),
(7, 'CHF', 'Swiss Franc', 'CHF', NULL, NULL, NULL),
(8, 'CNY', 'Chinese Yuan', '¥', NULL, NULL, NULL),
(9, 'SEK', 'Swedish Krona', 'kr', NULL, NULL, NULL),
(10, 'NZD', 'New Zealand Dollar', 'NZ$', NULL, NULL, NULL),
(11, 'INR', 'Indian Rupee', '₹', NULL, NULL, NULL),
(12, 'BRL', 'Brazilian Real', 'R$', NULL, NULL, NULL),
(13, 'ZAR', 'South African Rand', 'R', NULL, NULL, NULL),
(14, 'RUB', 'Russian Ruble', '₽', NULL, NULL, NULL),
(15, 'MXN', 'Mexican Peso', '$', NULL, NULL, NULL),
(16, 'SGD', 'Singapore Dollar', 'S$', NULL, NULL, NULL),
(17, 'HKD', 'Hong Kong Dollar', 'HK$', NULL, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(192) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`id`, `name`, `phone`, `email`, `address`, `created_by`, `deleted_by`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Walk-in Customer', NULL, NULL, NULL, NULL, NULL, NULL, '2024-03-10 22:01:33', '2024-03-10 22:01:33');

-- --------------------------------------------------------

--
-- Table structure for table `deposits`
--

CREATE TABLE `deposits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `deposit_category_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `deposit_ref` varchar(192) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(192) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `deposit_categories`
--

CREATE TABLE `deposit_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(192) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expenses`
--

CREATE TABLE `expenses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(11) NOT NULL,
  `expense_category_id` int(11) NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `payment_method_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `expense_ref` varchar(192) NOT NULL,
  `description` text DEFAULT NULL,
  `attachment` varchar(192) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `expense_categories`
--

CREATE TABLE `expense_categories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(192) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
-- Table structure for table `media`
--

CREATE TABLE `media` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL,
  `uuid` char(36) DEFAULT NULL,
  `collection_name` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `file_name` varchar(255) NOT NULL,
  `mime_type` varchar(255) DEFAULT NULL,
  `disk` varchar(255) NOT NULL,
  `conversions_disk` varchar(255) DEFAULT NULL,
  `size` bigint(20) UNSIGNED NOT NULL,
  `manipulations` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`manipulations`)),
  `custom_properties` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`custom_properties`)),
  `generated_conversions` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`generated_conversions`)),
  `responsive_images` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`responsive_images`)),
  `order_column` int(10) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

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
(1, '2014_10_12_000000_create_users_table', 1),
(2, '2014_10_12_100000_create_password_reset_tokens_table', 1),
(3, '2014_10_12_100000_create_password_resets_table', 1),
(4, '2019_08_19_000000_create_failed_jobs_table', 1),
(5, '2019_12_14_000001_create_personal_access_tokens_table', 1),
(6, '2023_11_09_001057_create_product_variants_table', 1),
(7, '2023_11_09_131309_create_products_table', 1),
(8, '2023_11_10_131210_create_customers_table', 1),
(9, '2023_11_10_131211_create_categories_table', 1),
(10, '2023_11_10_131306_create_suppliers_table', 1),
(11, '2023_11_10_131335_create_stocks_table', 1),
(12, '2023_11_10_131553_create_audit_logs_table', 1),
(13, '2023_11_22_053423_create_settings_table', 1),
(14, '2023_12_02_103023_create_brands_table', 1),
(15, '2023_12_02_124859_create_media_table', 1),
(16, '2023_12_03_143706_create_units_table', 1),
(17, '2023_12_04_051427_create_warehouses_table', 1),
(18, '2023_12_09_122455_create_sales_table', 1),
(19, '2023_12_09_124125_create_purchases_table', 1),
(20, '2024_01_03_022925_create_transactions_table', 1),
(21, '2024_01_05_050918_create_sales_items_table', 1),
(22, '2024_01_05_092950_create_purchases_items', 1),
(23, '2024_01_28_052240_create_payment_methods_table', 1),
(24, '2024_01_28_060218_create_accounts_table', 1),
(25, '2024_01_28_060541_create_deposits_table', 1),
(26, '2024_01_28_060601_create_deposit_categories_table', 1),
(27, '2024_01_28_060627_create_expenses_table', 1),
(28, '2024_01_28_060634_create_expense_categories_table', 1),
(29, '2024_01_29_052226_create_currencies_table', 1),
(30, '2024_01_30_131120_create_payment_sales_table', 1),
(31, '2024_01_30_132258_create_payment_purchases_table', 1),
(32, '2024_02_19_123600_create_sales_returns_table', 1),
(33, '2024_02_19_123601_create_purchase_returns_table', 1),
(34, '2024_02_19_123601_create_sales_return_items_table', 1),
(35, '2024_02_19_123602_create_purchase_return_items_table', 1),
(36, '2024_02_21_084127_create_sales_return_payments_table', 1),
(37, '2024_02_21_084135_create_purchase_return_payments_table', 1),
(38, '2024_02_28_191355_create_roles_table', 1),
(39, '2024_02_28_191510_create_permissions_table', 1),
(40, '2024_02_28_191539_create_role_permission_table', 1),
(41, '2024_02_28_202815_add_role_id_to_users_table', 1),
(42, '2024_02_29_191854_create_permission_groups_table', 1),
(43, '2024_03_03_180428_create_transfers_table', 1),
(44, '2024_03_03_180449_create_transfers_items_table', 1);

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `email` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `password_reset_tokens`
--

CREATE TABLE `password_reset_tokens` (
  `username` varchar(255) NOT NULL,
  `token` varchar(255) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_methods`
--

CREATE TABLE `payment_methods` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `title` varchar(192) NOT NULL,
  `is_default` tinyint(1) NOT NULL DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_methods`
--

INSERT INTO `payment_methods` (`id`, `title`, `is_default`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'Cash', 1, NULL, '2024-03-10 22:01:33', '2024-03-10 22:01:33'),
(2, 'Credit Card', 0, NULL, '2024-03-10 22:01:33', '2024-03-10 22:01:33'),
(3, 'Check', 0, NULL, '2024-03-10 22:01:33', '2024-03-10 22:01:33'),
(4, 'Bank Transfer', 0, NULL, '2024-03-10 22:01:33', '2024-03-10 22:01:33');

-- --------------------------------------------------------

--
-- Table structure for table `payment_purchases`
--

CREATE TABLE `payment_purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `change` double NOT NULL DEFAULT 0,
  `payment_notes` varchar(192) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_sales`
--

CREATE TABLE `payment_sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `change` double NOT NULL DEFAULT 0,
  `payment_notes` varchar(192) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `group_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `description`, `group_id`, `created_at`, `updated_at`) VALUES
(1, 'view_dashboard', 'Access the main dashboard.', 1, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(2, 'create_users', 'Add new users to the system.', 2, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(3, 'view_users', 'View user profiles and lists.', 2, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(4, 'edit_users', 'Edit user information.', 2, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(5, 'delete_users', 'Remove users from the system.', 2, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(6, 'manage_roles', 'Manage User roles.', 3, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(7, 'create_products', 'Add new products.', 4, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(8, 'view_products', 'View product listings.', 4, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(9, 'edit_products', 'Update product details.', 4, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(10, 'delete_products', 'Remove products from the catalog.', 4, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(11, 'print_labels', 'Manage Print Labels', 4, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(12, 'manage_categories', 'Manage product categories.', 5, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(13, 'manage_brands', 'Manage brands.', 6, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(14, 'manage_units', 'Manage units.', 7, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(15, 'manage_warehouses', 'Manage warehouses.', 8, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(16, 'view_all_stocks', 'View All Users Stocks.', 9, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(17, 'view_own_stocks', 'View Only Current User Stock.', 9, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(18, 'create_stocks', 'Add new Stocks.', 9, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(19, 'manage_stocks', 'View Stocks listings.', 9, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(20, 'view_all_sales', 'Access All Sale Records.', 10, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(21, 'view_own_sales', 'View Only Current User Sale Record.', 10, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(22, 'create_sales', 'Process new sales transactions.', 10, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(23, 'view_sales', 'View sales order records.', 10, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(24, 'edit_sales', 'Modify sales transactions.', 10, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(25, 'delete_sales', 'Cancel or remove sales transactions.', 10, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(26, 'show_pos', 'Access POS Page.', 10, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(27, 'view_all_purchase', 'Access All Purchase Records.', 11, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(28, 'view_own_purchase', 'View Only Current User Purchase Record.', 11, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(29, 'create_purchases', 'Create purchase orders.', 11, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(30, 'view_purchases', 'View purchase order records.', 11, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(31, 'edit_purchases', 'Edit purchase orders.', 11, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(32, 'delete_purchases', 'Cancel or delete purchase orders.', 11, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(33, 'create_account', 'Add new Account.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(34, 'view_account', 'View Account information.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(35, 'edit_account', 'Update Account details.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(36, 'delete_account', 'Remove Account from the system.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(37, 'create_deposit', 'Add new Deposit.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(38, 'view_deposit', 'View Deposit information.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(39, 'edit_deposit', 'Update Deposit details.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(40, 'delete_deposit', 'Remove Deposit from the system.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(41, 'manage_deposit_categories', 'Manage Deposit Category.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(42, 'create_expense', 'Add new Expense.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(43, 'view_expense', 'View Expense information.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(44, 'edit_expense', 'Update Expense details.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(45, 'delete_expense', 'Remove Expense from the system.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(46, 'manage_expense_categories', 'Manage Expense Category.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(47, 'manage_payment_methods', 'Manage Payment Methods.', 12, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(48, 'generate_reports', 'Generate sales, purchases, and other reports.', 13, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(49, 'system_settings', 'Modify system settings.', 14, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(50, 'module_settings', 'Modify Module settings.', 14, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(51, 'manage_currencies', 'Add or edit currencies.', 14, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(52, 'view_all_suppliers', 'Access All suppliers Records.', 15, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(53, 'view_own_suppliers', 'View Only Current Users suppliers Records.', 15, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(54, 'manage_suppliers', 'Manage supplier information.', 15, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(55, 'view_all_customers', 'Access All customers Records.', 16, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(56, 'view_own_Customers', 'View Only Current Users Customers Records.', 16, '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(57, 'manage_customers', 'View customer information.', 16, '2024-03-10 22:01:34', '2024-03-10 22:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `permission_groups`
--

CREATE TABLE `permission_groups` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permission_groups`
--

INSERT INTO `permission_groups` (`id`, `name`, `description`, `created_at`, `updated_at`) VALUES
(1, 'Dashboard', 'Permissions related to dashboard access and overview.', '2024-03-10 22:01:33', '2024-03-10 22:01:33'),
(2, 'User Management', 'Permissions for managing users including creating, viewing, editing, and deleting users.', '2024-03-10 22:01:33', '2024-03-10 22:01:33'),
(3, 'Roles and Permissions', 'Permissions to manage roles and permissions.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(4, 'Product Management', 'Permissions for managing products including adding, viewing, editing, and deleting products.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(5, 'Category Management', 'Permissions for managing product categories.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(6, 'Brands Management', 'Permissions for managing brands.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(7, 'Units Management', 'Permissions for managing units of measurement.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(8, 'Warehouse Management', 'Permissions for managing warehouses.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(9, 'Stock Management', 'Permissions related to stock management including viewing, adding, editing, and deleting stocks.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(10, 'Sales Management', 'Permissions related to sales management.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(11, 'Purchase Orders Management', 'Permissions related to managing purchase orders.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(12, 'Financial Transactions', 'Permissions related to managing financial transactions.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(13, 'Reports', 'Permissions for generating various reports.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(14, 'Settings and Configuration', 'Permissions for modifying system and module settings.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(15, 'Supplier Management', 'Permissions for managing suppliers.', '2024-03-10 22:01:34', '2024-03-10 22:01:34'),
(16, 'Customer Management', 'Permissions for managing customers.', '2024-03-10 22:01:34', '2024-03-10 22:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `token` varchar(64) NOT NULL,
  `abilities` text DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `expires_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `name_ta` varchar(255) DEFAULT NULL,
  `sku` varchar(255) NOT NULL,
  `description` text DEFAULT NULL,
  `price` decimal(8,2) DEFAULT NULL,
  `cost` decimal(8,2) DEFAULT NULL,
  `product_type` varchar(50) NOT NULL,
  `tax_method` varchar(10) DEFAULT 'exclusive',
  `unit_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_sale_id` bigint(20) UNSIGNED DEFAULT NULL,
  `unit_purchase_id` bigint(20) UNSIGNED DEFAULT NULL,
  `tax` decimal(5,2) DEFAULT 0.00,
  `category_id` bigint(20) UNSIGNED DEFAULT NULL,
  `supplier_id` bigint(20) UNSIGNED DEFAULT NULL,
  `brand_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `minimum_sale_quantity` int(11) NOT NULL DEFAULT 1,
  `stock_alert` int(11) DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`id`, `name`, `name_ta`, `sku`, `description`, `price`, `cost`, `product_type`, `tax_method`, `unit_id`, `unit_sale_id`, `unit_purchase_id`, `tax`, `category_id`, `supplier_id`, `brand_id`, `created_by`, `minimum_sale_quantity`, `stock_alert`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'thuvaram paruppu 1', 'துவரம் பருப்பு ', '001', NULL, 175.00, 175.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(2, 'pasi paruppu', 'பாசி பருப்பு ', '002', NULL, 125.00, 125.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(3, 'pachai kadali paruppu', 'பச்சை கடலை பருப்பு ', '003', NULL, 96.00, 96.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(4, 'uruttu uluntha paruppu', 'உருட்டு உளுந்து பருப்பு ', '004', NULL, 145.00, 145.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(5, 'pottu uluntha paruppu', 'பொட்டு உளுந்து பருப்பு  ', '005', NULL, 130.00, 130.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(6, 'pattri paruppu', 'பட்ரி பருப்பு ', '006', NULL, 80.00, 80.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(7, 'udaiththa uluntha paruppu', 'உடைத்த உளுந்து பருப்பு ', '007', NULL, 120.00, 120.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(8, 'varugakadalai', 'வறுத்த கடலை ', '008', NULL, 120.00, 120.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(9, 'neelakadali', 'நில கடலை ', '009', NULL, 160.00, 160.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(10, 'pashi pairu', 'பாசி பயிறு ', '010', NULL, 135.00, 135.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(11, 'karuppu sundal', 'கருப்பு சுண்டல் ', '011', NULL, 96.00, 96.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(12, 'vellai sundal', 'வெள்ளை சுண்டல்', '012', NULL, 180.00, 180.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(13, 'Pachchai pattani', 'பச்சை பட்டாணி ', '013', NULL, 110.00, 110.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(14, 'thattai pairu', 'தட்டை பயிறு ', '014', NULL, 130.00, 130.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(15, 'por mochchai', 'போர் மொச்சை ', '015', NULL, 180.00, 180.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(16, 'KAANAM', 'காணம்', '016', NULL, 100.00, 100.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(17, 'SUNDA VATHTHAL', 'சுண்ட வத்தல் ', '017', NULL, 380.00, 380.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(18, 'KUNDU VATHTHAL', 'குண்டு வத்தல் ', '018', NULL, 240.00, 240.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(19, 'ANDHARA VANTHAL', 'ஆந்திரா வத்தல் ', '019', NULL, 250.00, 250.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(20, 'KASMIR VATHTHAL', 'காஷ்மீர் வத்தல் ', '020', NULL, 280.00, 280.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(21, 'NATTU MALLI', 'நாட்டு மல்லி ', '021', NULL, 130.00, 130.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(22, 'GOTHUMAI', 'கோதுமை ', '022', NULL, 46.00, 46.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(23, 'MEEAL MAKER', 'மீள் மேக்கர் ', '023', NULL, 120.00, 120.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(24, 'SAKTHI MANAJL THUL', 'சக்தி மஞ்சள் தூள் ', '024', NULL, 105.00, 105.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(25, 'sakthi melaigai thul', 'சக்தி மிளகாய் தூள் ', '025', NULL, 190.00, 190.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(26, 'sakthi malli thul', 'சக்தி மல்லி தூள் ', '026', NULL, 190.00, 190.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(27, 'aachi badam mix 1set', 'ஆச்சி பாதம் mix (1 set )', '027', NULL, 150.00, 150.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(28, 'aachi badam payasam mix', 'ஆச்சி பாயசம் mix (1 set )', '028', NULL, 110.00, 110.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(29, 'sakthi samber thul', 'சக்தி சாம்பார் தூள் ', '029', NULL, 175.00, 175.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(30, 'sakthi kari  mashala', 'சக்தி கறிமசால்', '030', NULL, 200.00, 200.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(31, 'SAKTHI MUTTON MASHALA', 'சக்தி மட்டன் மசாலா ', '031', NULL, 210.00, 210.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(32, 'sakthi chikkan mashala', 'சக்தி சிக்கன் மசாலா ', '032', NULL, 170.00, 170.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(33, 'sakthi chikkan 65', 'சக்தி சில்லி 65', '033', NULL, 22.00, 22.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(34, 'SAKTHI MEEN MASALA', 'சக்தி மீன் வறுவல் ', '034', NULL, 22.00, 22.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(35, 'SAKTHI MEEAN KULAMPU MASHALA', 'சக்தி மீன் குழம்பு ', '035', NULL, 18.00, 18.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(36, 'SAKTHI BRIYANI MASHALA', 'சக்தி பிரியாணி மசாலா ', '036', NULL, 110.00, 110.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(37, 'SAKTHI GARAM MASHALA', 'சக்தி கரம் மசாலா ', '037', NULL, 50.00, 50.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(38, 'SAKTHI MELAGU THULL', 'சக்தி மிளகு தூள் ', '038', NULL, 43.00, 43.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(39, 'SAKTHI SEERAGA THULL', 'சக்தி சீரகத்தூள் ', '039', NULL, 40.00, 40.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(40, 'SATHI RASHAM PODI', 'சக்தி ரசப்பொடி ', '040', NULL, 56.00, 56.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(41, 'SAKTHI IDLY PODI', 'சக்தி இட்லி பொடி ', '041', NULL, 28.00, 28.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(42, 'aachi chikkan mashala', 'ஆச்சி chikkan மசாலா ', '042', NULL, 18.00, 18.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(43, 'aachi chikkan 65', 'ஆச்சி சிக்கன் 65', '043', NULL, 22.00, 22.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(44, 'aachi kulampu masala', 'ஆச்சி குழம்பு மிளகாய் தூள் ', '044', NULL, 35.00, 35.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(45, 'sakthi ragi mavu', 'சக்தி ராகி மாவு ', '045', NULL, 70.00, 70.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(46, 'sakthi bajji mavu', 'சக்தி பஜ்ஜி மாவு ', '046', NULL, 136.00, 136.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(47, 'chekku kadalai ennai jar', 'செக்கு jar கடலை எண்ணெய் ', '047', NULL, 1150.00, 1150.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(48, 'packet kadailai ennai', 'pouch கடலை எண்ணெய் ', '048', NULL, 210.00, 210.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(49, 'chekku thengaii ennai', 'செக்கு தேங்காய் எண்ணெய் ', '049', NULL, 220.00, 220.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(50, 'chekku nalla ennai', 'செக்கு நல்லெண்ணெய் ', '050', NULL, 380.00, 380.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(51, 'chekku velakku ennai', 'செக்கு விளக்கெண்ணெய் ', '051', NULL, 200.00, 200.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(52, 'deepa ennai', 'தீபம் எண்ணெய் ', '052', NULL, 120.00, 120.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(53, 'poorana pooja oil', 'Poorna Pooja Oil  ', '053', NULL, 180.00, 180.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(54, 'Palm Oil ', 'Palm Oil ', '054', NULL, 85.00, 85.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(55, 'Gold Winner Oil  ', 'Gold Winner Oil  ', '055', NULL, 560.00, 560.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(56, 'Sun Flower Oil ', 'Sun Flower Oil ', '056', NULL, 560.00, 560.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(57, 'VVD தேங்காய் எண்ணெய் jar ', 'VVD தேங்காய் எண்ணெய் jar ', '057', NULL, 190.00, 190.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(58, 'VVD தேங்காய் எண்ணெய் Pouch ', 'VVD தேங்காய் எண்ணெய் Pouch ', '058', NULL, 105.00, 105.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(59, 'idhayam nalla ennai', 'இதயம் நல்லெண்ணெய் jar ', '059', NULL, 480.00, 480.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(60, 'Parachute தேங்காய் எண்ணெய் ', 'Parachute தேங்காய் எண்ணெய் ', '060', NULL, 158.00, 158.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(61, 'Ayurvedic Hair Oil ', 'Ayurvedic Hair Oil ', '061', NULL, 120.00, 120.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(62, 'Vatika Hair Oil ', 'Vatika Hair Oil ', '062', NULL, 175.00, 175.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(63, 'Dabur Amla Hair Oil ', 'Dabur Amla Hair Oil ', '063', NULL, 88.00, 88.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(64, 'Dabur Badam Hair Oil (1 set)', 'Dabur Badam Hair Oil (1 set)', '064', NULL, 68.00, 68.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(65, 'Hit Spray Black ', 'Hit Spray Black ', '065', NULL, 110.00, 110.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(66, 'Hit Spray Red ', 'Hit Spray Red ', '066', NULL, 90.00, 90.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(67, 'Hit Chalk ', 'Hit Chalk ', '067', NULL, 10.00, 10.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(68, 'gajapathi renfind kadali ennai', 'கஜபதி refined கடலை எண்ணெய் ', '068', NULL, 225.00, 225.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(69, 'ghee', 'நெய் ', '069', NULL, 670.00, 670.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(70, 'Tata அவுள் ', 'Tata அவுள் ', '070', NULL, 40.00, 40.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(71, 'gothumai mavu', 'கோதுமை மாவு ', '071', NULL, 300.00, 300.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(72, 'kili madai mavu', 'கிளி மைதா மாவு ', '072', NULL, 55.00, 55.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(73, 'SMT arisi maavu', 'SMT அரிசி மாவு ', '073', NULL, 70.00, 70.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(74, 'prtiyam idiyappa mavu', 'ப்ரியம் இடியாப்ப மாவு ', '074', NULL, 96.00, 96.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(75, 'corn mavu', 'காண் மாவு ', '075', NULL, 65.00, 65.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(76, 'kadali mavu', 'நயம் கடலை மாவு ', '076', NULL, 96.00, 96.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(77, 'mayil sampa ravai', 'மயில் சம்பா ரவை ', '077', NULL, 100.00, 100.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(78, 'vellai ravi pocket', 'வெள்ளை ரவை pocket ', '078', NULL, 70.00, 70.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(79, 'vellam', 'வெல்லம் ', '079', NULL, 65.00, 65.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(80, 'nattu sarkkarai', 'நாட்டு சர்க்கரை ', '080', NULL, 70.00, 70.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(81, 'kadugu', 'கடுகு ', '081', NULL, 120.00, 120.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(82, 'jeeragam', 'சீரகம் ', '082', NULL, 650.00, 650.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(83, 'melagu', 'மிளகு ', '083', NULL, 840.00, 840.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(84, 'vendhayamn', 'வெந்தயம் ', '084', NULL, 150.00, 150.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(85, 'sombu', 'சோம்பு ', '085', NULL, 400.00, 400.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(86, 'pattai', 'பட்டை ', '086', NULL, 330.00, 330.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(87, 'nayam puli', 'டும்கூர் நயம் புளி ', '087', NULL, 195.00, 195.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(88, 'chakkara gold', 'சக்ரா gold tea ', '088', NULL, 280.00, 280.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(89, 'chakkara gold hotel tea', 'சக்ரா Gold Hotel Tea ', '089', NULL, 140.00, 140.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(90, 'AVT TEA', 'ஏவிடி டீ', '090', NULL, 280.00, 280.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(91, 'AVT COFFE', 'ஏவிடி காபி ', '091', NULL, 100.00, 100.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(92, '3 ROSE TEA', 'திரி ரோஸஸ் டீ தூள்', '092', NULL, 320.00, 340.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-23 12:15:20', NULL),
(93, '3ROSE TEA NATURE CARE', 'திரி ரோஸஸ் டீ NaturalCare ', '093', NULL, 235.00, 235.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(94, 'TAJ MAHAL TEA', 'தாஜ்மஹால் டீ', '094', NULL, 440.00, 440.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(95, 'BRU Coffee ', 'BRU Coffee ', '095', NULL, 215.00, 215.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(96, 'Sunrise coffee Pouch ', 'Sunrise coffee Pouch ', '096', NULL, 120.00, 120.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(97, 'Sunrise Coffee Jar ', 'Sunrise Coffee Jar ', '097', NULL, 225.00, 225.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(98, 'SS  BRU ', 'SS  BRU ', '098', NULL, 210.00, 210.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(99, 'SS Sunrise ', 'SS Sunrise ', '099', NULL, 195.00, 195.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(100, 'Grren Label Coffee ', 'Grren Label Coffee ', '100', NULL, 108.00, 108.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(101, 'Narasus Coffee ', 'Narasus Coffee ', '101', NULL, 80.00, 80.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(102, 'UDhayan narasus coffe', 'உதயம் Narasus Coffee ', '102', NULL, 60.00, 60.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(103, 'sukku coffe thul', 'சுக்கு காபி தூள் ', '103', NULL, 95.00, 95.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(104, 'Mugi Liquid (1 set)', 'Mugi Liquid (1 set)', '104', NULL, 400.00, 400.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(105, 'Mugi liquid (pouch)', 'Mugi liquid (pouch)', '105', NULL, 200.00, 200.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(106, 'Mugi Liquid (5 Rs) 1 சரம் ', 'Mugi Liquid (5 Rs) 1 சரம் ', '106', NULL, 45.00, 45.00, 'standard', 'exclusive', 3, 3, 3, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(107, 'Dettol Liquid ', 'Dettol Liquid ', '107', NULL, 210.00, 210.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(108, 'wahing soda', 'வாஷிங் சோடா  ', '108', NULL, 45.00, 45.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(109, 'belicing poweder', 'பிளீச்சிங் பவுடர் ', '109', NULL, 45.00, 45.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(110, 'Comfort Fabric Liquid ', 'Comfort Fabric Liquid ', '110', NULL, 230.00, 230.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(111, 'Lifeboy Soap ', 'Lifeboy Soap ', '111', NULL, 35.00, 35.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(112, 'Hamam Soap ', 'Hamam Soap ', '112', NULL, 66.00, 66.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(113, 'Hamam Soap Lemon ', 'Hamam Soap Lemon ', '113', NULL, 41.00, 41.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(114, 'Lux Soap International ', 'Lux Soap International ', '114', NULL, 39.00, 39.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(115, 'Lux Soap Rose ', 'Lux Soap Rose ', '115', NULL, 35.00, 35.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(116, 'Liril Soap ', 'Liril Soap ', '116', NULL, 37.00, 37.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(117, 'Rexona Soap ', 'Rexona Soap ', '117', NULL, 37.00, 37.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(118, 'Pears Soap Blue ', 'Pears Soap Blue ', '118', NULL, 49.00, 49.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(119, 'Pears Soap Green ', 'Pears Soap Green ', '119', NULL, 62.00, 62.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(120, 'Pears Soap Yellow ', 'Pears Soap Yellow ', '120', NULL, 53.00, 53.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(121, 'Mysore Sandal Soap ', 'Mysore Sandal Soap ', '121', NULL, 225.00, 225.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(122, 'Cinthol Soap Original ', 'Cinthol Soap Original ', '122', NULL, 265.00, 265.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(123, 'Santoor Soap Sandal', 'Santoor Soap Sandal', '123', NULL, 58.00, 58.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(124, 'Santoor Soap Whte ', 'Santoor Soap Whte ', '124', NULL, 33.00, 33.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:33', '2024-03-11 04:15:33', NULL),
(125, 'Meera சீவக்காய் தூள் ', 'Meera சீவக்காய் தூள் ', '125', NULL, 56.00, 56.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(126, 'Karthiga Shampoo ', 'Karthiga Shampoo ', '126', NULL, 18.00, 18.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(127, 'Panteen Shampoo ', 'Panteen Shampoo ', '127', NULL, 30.00, 30.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(128, 'Head&Shoulder Shampoo ', 'Head&Shoulder Shampoo ', '128', NULL, 38.00, 38.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(129, 'Rise Shampoo ', 'Rise Shampoo ', '129', NULL, 95.00, 95.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(130, 'ali vera sampooo', 'அலோ வேரா ஷாம்பு', '130', NULL, 185.00, 185.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(131, 'Himalaya Baby Shampoo ', 'Himalaya Baby Shampoo ', '131', NULL, 100.00, 100.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(132, 'Himalaya Baby Powder  ', 'Himalaya Baby Powder  ', '132', NULL, 100.00, 100.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(133, 'Himalaya Baby Soap ', 'Himalaya Baby Soap ', '133', NULL, 58.00, 58.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(134, 'Himalaya Soap (Almond , Neem)', 'Himalaya Soap (Almond , Neem)', '134', NULL, 60.00, 60.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(135, 'Himalaya Paste Complete Care ', 'Himalaya Paste Complete Care ', '135', NULL, 54.00, 54.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(136, 'Karthika சீவக்காய் தூள் ', 'Karthika சீவக்காய் தூள் ', '136', NULL, 47.00, 47.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(137, 'Chik /shampoo ', 'Chik /shampoo ', '137', NULL, 18.00, 18.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(138, 'Meera Shampoo Badam ', 'Meera Shampoo Badam ', '138', NULL, 165.00, 165.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(139, 'Meera Shampoo Onion ', 'Meera Shampoo Onion ', '139', NULL, 175.00, 175.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(140, 'himalaya soap neem', 'அலோ வேரா சோப்பு Yellow ', '140', NULL, 15.00, 15.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(141, 'himalaya soap blue', 'அலோ வேரா சோப்பு Blue ', '141', NULL, 24.00, 24.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(142, 'Chandrika Soap ', 'Chandrika Soap ', '142', NULL, 30.00, 30.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(143, 'Gokul Sandal Soap ', 'Gokul Sandal Soap ', '143', NULL, 41.00, 41.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(144, 'radhachandam soap', 'ரக்த சந்தன்  ', '144', NULL, 36.00, 36.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(145, 'Medimix Soap ', 'Medimix Soap ', '145', NULL, 48.00, 48.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(146, 'Medimix Soap Sandal ', 'Medimix Soap Sandal ', '146', NULL, 58.00, 58.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(147, 'Dettol Soap Cool  (1 set)', 'Dettol Soap Cool  (1 set)', '147', NULL, 145.00, 145.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(148, 'Dettol Soap Cool ', 'Dettol Soap Cool ', '148', NULL, 58.00, 58.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(149, 'Dettol Soap Original (1 set )', 'Dettol Soap Original (1 set )', '149', NULL, 160.00, 160.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(150, 'Dettol Soap Original ', 'Dettol Soap Original ', '150', NULL, 37.00, 37.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(151, 'Dove Soap White ', 'Dove Soap White ', '151', NULL, 64.00, 64.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(152, 'Dove Soap Pink ', 'Dove Soap Pink ', '152', NULL, 80.00, 80.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(153, 'Dove shampoo ', 'Dove shampoo ', '153', NULL, 175.00, 175.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(154, 'c+ Shampoo ', 'c+ Shampoo ', '154', NULL, 14.00, 14.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(155, 'C+ Shampoo Jar ', 'C+ Shampoo Jar ', '155', NULL, 180.00, 180.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(156, 'All Clear Shampoo ', 'All Clear Shampoo ', '156', NULL, 28.00, 28.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(157, 'Sunsilk Shampoo ', 'Sunsilk Shampoo ', '157', NULL, 130.00, 130.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(158, 'Himalaya Shampoo Antidandruff ', 'Himalaya Shampoo Antidandruff ', '158', NULL, 170.00, 170.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(159, 'Himalaya Shampoo Anti hairfall ', 'Himalaya Shampoo Anti hairfall ', '159', NULL, 155.00, 155.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(160, 'Vim Gel ', 'Vim Gel ', '160', NULL, 120.00, 120.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(161, 'Vim Shudhham Gel', 'Vim Shudhham Gel', '161', NULL, 58.00, 58.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(162, 'Vim Soap ', 'Vim Soap ', '162', NULL, 58.00, 58.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(163, 'Exo Soap Round ', 'Exo Soap Round ', '163', NULL, 58.00, 58.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(164, 'jathikkai', 'சாதிக்காய் ', '164', NULL, 38.00, 38.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(165, 'jathipaththiri', 'சாதிபத்ரி ', '165', NULL, 260.00, 260.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(166, 'elakkai', 'ஏலக்காய் ', '166', NULL, 2600.00, 2600.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(167, 'annachi poo', 'அண்ணாச்சி பூ ', '167', NULL, 75.00, 75.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(168, 'maraddi', 'மராட்டி ', '168', NULL, 150.00, 150.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(169, 'passham', 'பாசம் ', '169', NULL, 70.00, 70.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(170, 'brinji ilai', 'பிரிஞ்சி இலை', '170', NULL, 20.00, 20.00, 'standard', 'exclusive', 3, 3, 3, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(171, 'mundhiri', 'முந்திரி ', '171', NULL, 730.00, 730.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(172, 'badam', 'பாதாம் ', '172', NULL, 200.00, 200.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(173, 'kismishu', 'கிஸ்மிஸ் ', '173', NULL, 280.00, 280.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(174, 'Black கிஸ்மிஸ் ', 'Black கிஸ்மிஸ் ', '174', NULL, 85.00, 85.00, 'standard', 'exclusive', 3, 3, 3, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(175, 'KASHGASHA', 'கசகசா ', '175', NULL, 1600.00, 1600.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(176, 'GIRAMPOO', 'கிராம்பு ', '176', NULL, 1400.00, 1400.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(177, 'PISHA', 'பிஸ்தா ', '177', NULL, 2200.00, 2200.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(178, 'KARUJEERAM', 'கருங்சீரகம் ', '178', NULL, 400.00, 400.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(179, 'SARA POARAVU', 'சாரா பருப்பு', '179', NULL, 1200.00, 1200.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(180, 'PANAM KARGANDU', 'பனங்கற்கண்டு ', '180', NULL, 600.00, 600.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(181, 'KARGANDU', 'கற்கண்டு (Diamond)', '181', NULL, 580.00, 580.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(182, 'AJINA MOTTA', 'அஜினோமோட்டோ', '182', NULL, 180.00, 180.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(183, 'LEMON SALT', 'லெமன் சால்ட் ', '183', NULL, 240.00, 240.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(184, 'Red Colour ', 'Red Colour ', '184', NULL, 28.00, 28.00, 'standard', 'exclusive', 7, 7, 7, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(185, 'Yellow Colour ', 'Yellow Colour ', '185', NULL, 28.00, 28.00, 'standard', 'exclusive', 7, 7, 7, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(186, 'Horlicks (Pouch) ', 'Horlicks (Pouch) ', '186', NULL, 225.00, 225.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(187, 'Horlicks (Jar) ', 'Horlicks (Jar) ', '187', NULL, 288.00, 288.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(188, 'Boost (Pouch) ', 'Boost (Pouch) ', '188', NULL, 245.00, 245.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(189, 'Boost (Jar) ', 'Boost (Jar) ', '189', NULL, 290.00, 290.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(190, 'Bournvita ', 'Bournvita ', '190', NULL, 220.00, 220.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(191, 'meenachi arichi', 'மீனாட்சி ', '191', NULL, 1650.00, 1650.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(192, 'thiruvalluvar', 'திருவள்ளுவர் ', '192', NULL, 1750.00, 1750.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(193, 'valluvar dharapuram', 'வள்ளுவர் தாராபுரம் ', '193', NULL, 1820.00, 1820.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(194, '77 Gold ', '77 Gold ', '194', NULL, 1620.00, 1620.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(195, 'Java அரிசி ', 'Java அரிசி ', '195', NULL, 1620.00, 1620.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(196, 'goburam arishi', 'கோபுரம் அரிசி ', '196', NULL, 1450.00, 1450.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(197, 'ayyappan arishgi', 'ஐயப்பா அரிசி ', '197', NULL, 1480.00, 1480.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(198, 'IR 20 அரிசி ', 'IR 20 அரிசி ', '198', NULL, 1150.00, 1150.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(199, 'Lion Dates (Set) ', 'Lion Dates (Set) ', '199', NULL, 185.00, 185.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(200, 'Lion Dates ', 'Lion Dates ', '200', NULL, 58.00, 58.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(201, 'Black Dates ', 'Black Dates ', '201', NULL, 300.00, 300.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(202, 'Lion Dates Syrup ', 'Lion Dates Syrup ', '202', NULL, 195.00, 195.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(203, 'Lion Oats ', 'Lion Oats ', '203', NULL, 122.00, 122.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(204, 'Lion Honey (1+1)', 'Lion Honey (1+1)', '204', NULL, 150.00, 150.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(205, 'Lion Honey ', 'Lion Honey ', '205', NULL, 56.00, 56.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(206, 'MTR Gulab Jamun (1+1)', 'MTR Gulab Jamun (1+1)', '206', NULL, 135.00, 135.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(207, 'Nalan Dates', 'Nalan Dates', '207', NULL, 120.00, 120.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(208, 'briyani arishi', 'பிரியாணி அரிசி ', '208', NULL, 97.00, 97.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(209, 'pasumathi arishi', 'பாஸ்மதி அரிசி ', '209', NULL, 120.00, 120.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(210, 'idly arishi', 'இட்லி அரிசி ', '210', NULL, 1300.00, 1300.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(211, 'பொன்னி பச்சரிசி ', 'பொன்னி பச்சரிசி ', '211', NULL, 1430.00, 1430.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(212, 'IR பச்சரிசி ', 'IR பச்சரிசி ', '212', NULL, 1020.00, 1020.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(213, 'briyani arishi', 'பிரியாணி அரிசி (Kishan Gold)', '213', NULL, 2820.00, 2820.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(214, 'Rin Powder ', 'Rin Powder ', '214', NULL, 115.00, 115.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(215, 'Rin Soap ', 'Rin Soap ', '215', NULL, 24.00, 24.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(216, 'Rin Liquid Pouch ', 'Rin Liquid Pouch ', '216', NULL, 320.00, 320.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(217, 'Rin Liquid Jar ', 'Rin Liquid Jar ', '217', NULL, 125.00, 125.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(218, 'Rin Ala ', 'Rin Ala ', '218', NULL, 86.00, 86.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(219, 'Surf XL Easywash Powder ', 'Surf XL Easywash Powder ', '219', NULL, 172.00, 172.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(220, 'Surf XL Powder ', 'Surf XL Powder ', '220', NULL, 215.00, 215.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(221, 'Surf XL Soap ', 'Surf XL Soap ', '221', NULL, 34.00, 34.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(222, 'Surf XL Liquid (Jar) Topload ', 'Surf XL Liquid (Jar) Topload ', '222', NULL, 185.00, 185.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(223, 'Surf XL Liquid (Pouch)', 'Surf XL Liquid (Pouch)', '223', NULL, 145.00, 145.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(224, 'Surf XL Liquid (Jar) Frontload ', 'Surf XL Liquid (Jar) Frontload ', '224', NULL, 210.00, 210.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(225, 'Surf XL Liquid (Pouch) Frontload ', 'Surf XL Liquid (Pouch) Frontload ', '225', NULL, 160.00, 160.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(226, 'Ariel Powder Complete Care ', 'Ariel Powder Complete Care ', '226', NULL, 105.00, 105.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(227, 'Ariel Powder Perfect Wash ', 'Ariel Powder Perfect Wash ', '227', NULL, 90.00, 90.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(228, 'Ariel Liquid Topload ', 'Ariel Liquid Topload ', '228', NULL, 150.00, 150.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(229, 'Ariel Liquid Frontload ', 'Ariel Liquid Frontload ', '229', NULL, 210.00, 210.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(230, 'Ariel Rs.10 Liquid', 'Ariel Rs.10 Liquid', '230', NULL, 10.00, 10.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(231, 'Power Powder ', 'Power Powder ', '231', NULL, 100.00, 100.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(232, 'Power Liquid ', 'Power Liquid ', '232', NULL, 110.00, 110.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(233, 'Power Liquid Rs.10', 'Power Liquid Rs.10', '233', NULL, 10.00, 10.00, 'standard', 'exclusive', 3, 3, 3, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(234, 'Power Soap ', 'Power Soap ', '234', NULL, 23.00, 23.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(235, 'Nature Power Soap ', 'Nature Power Soap ', '235', NULL, 39.00, 39.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(236, 'Nature Power Soap (Lemon, Rose, Lavender, Sandal, Papaya)', 'Nature Power Soap (Lemon, Rose, Lavender, Sandal, Papaya)', '236', NULL, 43.00, 43.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(237, 'Tide Powder ', 'Tide Powder ', '237', NULL, 155.00, 155.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(238, 'Colgate Tooth Paste ', 'Colgate Tooth Paste ', '238', NULL, 125.00, 125.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(239, 'Colgate Tooth Paste Salt  ', 'Colgate Tooth Paste Salt  ', '239', NULL, 135.00, 135.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(240, 'Colgate Tooth Paste Ved Shakthi ', 'Colgate Tooth Paste Ved Shakthi ', '240', NULL, 65.00, 65.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(241, 'Pepsodent Tooth Paste ', 'Pepsodent Tooth Paste ', '241', NULL, 112.00, 112.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(242, 'Close Up Tooth Paste ', 'Close Up Tooth Paste ', '242', NULL, 55.00, 55.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL);
INSERT INTO `products` (`id`, `name`, `name_ta`, `sku`, `description`, `price`, `cost`, `product_type`, `tax_method`, `unit_id`, `unit_sale_id`, `unit_purchase_id`, `tax`, `category_id`, `supplier_id`, `brand_id`, `created_by`, `minimum_sale_quantity`, `stock_alert`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(243, 'Dabur Red Tooth Paste ', 'Dabur Red Tooth Paste ', '243', NULL, 128.00, 128.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(244, 'Dabur Meshwak Tooth Paste ', 'Dabur Meshwak Tooth Paste ', '244', NULL, 68.00, 68.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(245, 'Sensodyne Tooth Paste Fresh Mint ', 'Sensodyne Tooth Paste Fresh Mint ', '245', NULL, 125.00, 125.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(246, 'Sensodyne Tooth Paste Fresh Set', 'Sensodyne Tooth Paste Fresh Set', '246', NULL, 120.00, 120.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(247, 'Sensodyne Fresh ', 'Sensodyne Fresh ', '247', NULL, 30.00, 30.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(248, 'Sensodyne Fresh Set ', 'Sensodyne Fresh Set ', '248', NULL, 120.00, 120.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(249, 'Colgate Fresh Set ', 'Colgate Fresh Set ', '249', NULL, 65.00, 65.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(250, 'Cplgate Fresh ', 'Cplgate Fresh ', '250', NULL, 28.00, 28.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(251, 'Exo Fresh ', 'Exo Fresh ', '251', NULL, 9.00, 9.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(252, 'Exo Fresh Scrubber ', 'Exo Fresh Scrubber ', '252', NULL, 9.00, 9.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(253, 'Vicco Tooth Paste ', 'Vicco Tooth Paste ', '253', NULL, 80.00, 80.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(254, 'Vicco பல்பொடி ', 'Vicco பல்பொடி ', '254', NULL, 110.00, 110.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(255, 'Zandu Balm ', 'Zandu Balm ', '255', NULL, 42.00, 42.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(256, 'Amrutanjan', 'Amrutanjan', '256', NULL, 42.00, 42.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(257, 'Iodex ', 'Iodex ', '257', NULL, 42.00, 42.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(258, 'Vicks ', 'Vicks ', '258', NULL, 98.00, 98.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(259, 'Good Night Goldflash Liquid Set ', 'Good Night Goldflash Liquid Set ', '259', NULL, 100.00, 100.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(260, 'Good Night Goldflash Liquid ', 'Good Night Goldflash Liquid ', '260', NULL, 77.00, 77.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(261, 'Good Night Coil ', 'Good Night Coil ', '261', NULL, 38.00, 38.00, 'standard', 'exclusive', 7, 7, 7, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(262, 'All Out Liquid ', 'All Out Liquid ', '262', NULL, 77.00, 77.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(263, 'All Out Liquid Set ', 'All Out Liquid Set ', '263', NULL, 100.00, 100.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(264, 'All Out Liquid ', 'All Out Liquid ', '264', NULL, 77.00, 77.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(265, 'Cycle பத்தி ', 'Cycle பத்தி ', '265', NULL, 50.00, 50.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(266, 'Z Black பத்தி ', 'Z Black பத்தி ', '266', NULL, 50.00, 50.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(267, 'paththi', 'பத்தி ', '267', NULL, 10.00, 10.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(268, 'sudam samll', 'சூடம் (சிறியது)', '268', NULL, 30.00, 30.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:34', '2024-03-11 04:15:34', NULL),
(269, 'sudam periyathiu', 'சூடம் (பெரியது)', '269', NULL, 45.00, 45.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(270, 'sudam', 'சூடம் ', '270', NULL, 10.00, 10.00, 'standard', 'exclusive', 3, 3, 3, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(271, 'aswini hair oil', 'அஸ்வினி Hairoil ', '271', NULL, 145.00, 145.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(272, 'Super Vasmol Hairoil ', 'Super Vasmol Hairoil ', '272', NULL, 65.00, 65.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(273, 'Vicco Turmeric ', 'Vicco Turmeric ', '273', NULL, 75.00, 75.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(274, 'Moov ', 'Moov ', '274', NULL, 53.00, 53.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(275, 'Gokul Sandal Powder ', 'Gokul Sandal Powder ', '275', NULL, 240.00, 240.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(276, 'Nycil Powder (1+1)', 'Nycil Powder (1+1)', '276', NULL, 140.00, 140.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(277, 'Ponds Powder Sandal ', 'Ponds Powder Sandal ', '277', NULL, 130.00, 130.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(278, 'Ponds Powder Dreamflower ', 'Ponds Powder Dreamflower ', '278', NULL, 105.00, 105.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(279, 'Ponds Powder Magic ', 'Ponds Powder Magic ', '279', NULL, 130.00, 130.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(280, 'Z Powder ', 'Z Powder ', '280', NULL, 135.00, 135.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(281, 'Rusk ', 'Rusk ', '281', NULL, 35.00, 35.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(282, 'seemiya', 'சேமியா', '282', NULL, 330.00, 330.00, 'standard', 'exclusive', 8, 8, 8, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(283, 'ragi seemiyya', 'ராகி சேமியா', '283', NULL, 370.00, 370.00, 'standard', 'exclusive', 8, 8, 8, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(284, 'payasha seemiya', 's பாயசசேமியா ', '284', NULL, 50.00, 50.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(285, 'javuarushi', 'ஜவ்வரிசி ', '285', NULL, 50.00, 50.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(286, 'sukku', 'சுக்கு ', '286', NULL, 500.00, 500.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(287, 'Milk  ', 'Milk  ', '287', NULL, 35.00, 35.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(288, 'Milk Classic ', 'Milk Classic ', '288', NULL, 20.00, 20.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(289, 'Marie Gold ', 'Marie Gold ', '289', NULL, 30.00, 30.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(290, 'Good Day ', 'Good Day ', '290', NULL, 55.00, 55.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(291, '50 50 biscut', '50 - 50 பிஸ்கட் ', '291', NULL, 10.00, 10.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(292, '30 biscut', '30 பிஸ்கட் ', '292', NULL, 30.00, 30.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(293, '40 பிஸ்கட் ', '40 பிஸ்கட் ', '293', NULL, 40.00, 40.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(294, 'Harpic ', 'Harpic ', '294', NULL, 98.00, 98.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(295, 'Red Harpic', 'Red Harpic', '295', NULL, 102.00, 102.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(296, 'Lizol ', 'Lizol ', '296', NULL, 112.00, 112.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(297, 'pinail', 'பினாயில் ', '297', NULL, 50.00, 50.00, 'standard', 'exclusive', 5, 5, 5, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(298, 'Acid ', 'Acid ', '298', NULL, 40.00, 40.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(299, 'Colin ', 'Colin ', '299', NULL, 100.00, 100.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(300, 'Ujala Crisp and Shine', 'Ujala Crisp and Shine', '300', NULL, 145.00, 145.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(301, 'Ujala neelam ', 'Ujala நீலம் ', '301', NULL, 78.00, 78.00, 'standard', 'exclusive', 6, 6, 6, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(302, 'Fogg Perfume Blue ', 'Fogg Perfume Blue ', '302', NULL, 220.00, 220.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(303, 'Fogg Perfume Napoleon', 'Fogg Perfume Napoleon', '303', NULL, 180.00, 180.00, 'standard', 'exclusive', 4, 4, 4, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(304, 'urugaii', 'ஊறுகாய் (1+1)', '304', NULL, 70.00, 70.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(305, 'pundu urugai', 'பூண்டு ஊறுகாய் ', '305', NULL, 60.00, 60.00, 'standard', 'exclusive', 2, 2, 2, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(306, 'neerma poweder', 'நீர்மா பவுடர் ', '306', NULL, 62.00, 62.00, 'standard', 'exclusive', 1, 1, 1, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(307, 'Maggi நூடுல்ஸ் ', 'Maggi நூடுல்ஸ் ', '307', NULL, 14.00, 14.00, 'standard', 'exclusive', 3, 3, 3, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(308, 'Maggi நூடுல்ஸ் (8 x 1)', 'Maggi நூடுல்ஸ் (8 x 1)', '308', NULL, 110.00, 110.00, 'standard', 'exclusive', 3, 3, 3, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(309, 'Maggi நூடுல்ஸ் (4 x 1)', 'Maggi நூடுல்ஸ் (4 x 1)', '309', NULL, 55.00, 55.00, 'standard', 'exclusive', 3, 3, 3, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(310, 'Yippee நூடுல்ஸ்  ', 'Yippee நூடுல்ஸ்  ', '310', NULL, 14.00, 14.00, 'standard', 'exclusive', 3, 3, 3, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(311, 'Yippee நூடுல்ஸ் (4 x 1)', 'Yippee நூடுல்ஸ் (4 x 1)', '311', NULL, 55.00, 55.00, 'standard', 'exclusive', 3, 3, 3, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(312, 'vv thegaiennai', 'விவி தேங்காய் எண்ணெய் ', '312', NULL, 0.00, 0.00, 'standard', 'exclusive', NULL, NULL, NULL, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL),
(313, 'test', 'test ta', '313', NULL, 1.00, 1.00, 'standard', 'exclusive', 8, 8, 8, 0.00, NULL, NULL, NULL, NULL, 1, NULL, NULL, '2024-03-11 04:15:35', '2024-03-11 04:15:35', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `product_variants`
--

CREATE TABLE `product_variants` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` int(11) DEFAULT NULL,
  `sku` varchar(191) NOT NULL,
  `name` varchar(192) DEFAULT NULL,
  `cost` double DEFAULT 0,
  `price` double DEFAULT 0,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases`
--

CREATE TABLE `purchases` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` int(11) NOT NULL,
  `date` datetime NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` int(11) DEFAULT 0,
  `tax_rate` double DEFAULT 0,
  `tax_net` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `shipping_amount` double DEFAULT 0,
  `discount_type` varchar(192) NOT NULL,
  `grand_total` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `payment_status` varchar(192) NOT NULL,
  `status` varchar(191) NOT NULL,
  `notes` text DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchases_items`
--

CREATE TABLE `purchases_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_returns`
--

CREATE TABLE `purchase_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `supplier_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` int(11) DEFAULT 0,
  `date` datetime NOT NULL,
  `return_invoice_number` varchar(255) NOT NULL,
  `tax_rate` double DEFAULT 0,
  `tax_amount` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `discount_type` varchar(192) NOT NULL,
  `grand_total` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `payment_status` varchar(192) NOT NULL,
  `status` varchar(191) NOT NULL,
  `notes` text DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_items`
--

CREATE TABLE `purchase_return_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `purchase_return_payments`
--

CREATE TABLE `purchase_return_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `purchase_return_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `change` double NOT NULL DEFAULT 0,
  `payment_notes` varchar(192) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
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
  `description` varchar(255) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `description`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 'admin', NULL, NULL, '2024-03-10 22:01:34', '2024-03-10 22:01:34');

-- --------------------------------------------------------

--
-- Table structure for table `role_permission`
--

CREATE TABLE `role_permission` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `role_permission`
--

INSERT INTO `role_permission` (`id`, `role_id`, `permission_id`, `created_at`, `updated_at`) VALUES
(1, 1, 1, NULL, NULL),
(2, 1, 2, NULL, NULL),
(3, 1, 3, NULL, NULL),
(4, 1, 4, NULL, NULL),
(5, 1, 5, NULL, NULL),
(6, 1, 6, NULL, NULL),
(7, 1, 7, NULL, NULL),
(8, 1, 8, NULL, NULL),
(9, 1, 9, NULL, NULL),
(10, 1, 10, NULL, NULL),
(11, 1, 11, NULL, NULL),
(12, 1, 12, NULL, NULL),
(13, 1, 13, NULL, NULL),
(14, 1, 14, NULL, NULL),
(15, 1, 15, NULL, NULL),
(16, 1, 16, NULL, NULL),
(17, 1, 17, NULL, NULL),
(18, 1, 18, NULL, NULL),
(19, 1, 19, NULL, NULL),
(20, 1, 20, NULL, NULL),
(21, 1, 21, NULL, NULL),
(22, 1, 22, NULL, NULL),
(23, 1, 23, NULL, NULL),
(24, 1, 24, NULL, NULL),
(25, 1, 25, NULL, NULL),
(26, 1, 26, NULL, NULL),
(27, 1, 27, NULL, NULL),
(28, 1, 28, NULL, NULL),
(29, 1, 29, NULL, NULL),
(30, 1, 30, NULL, NULL),
(31, 1, 31, NULL, NULL),
(32, 1, 32, NULL, NULL),
(33, 1, 33, NULL, NULL),
(34, 1, 34, NULL, NULL),
(35, 1, 35, NULL, NULL),
(36, 1, 36, NULL, NULL),
(37, 1, 37, NULL, NULL),
(38, 1, 38, NULL, NULL),
(39, 1, 39, NULL, NULL),
(40, 1, 40, NULL, NULL),
(41, 1, 41, NULL, NULL),
(42, 1, 42, NULL, NULL),
(43, 1, 43, NULL, NULL),
(44, 1, 44, NULL, NULL),
(45, 1, 45, NULL, NULL),
(46, 1, 46, NULL, NULL),
(47, 1, 47, NULL, NULL),
(48, 1, 48, NULL, NULL),
(49, 1, 49, NULL, NULL),
(50, 1, 50, NULL, NULL),
(51, 1, 51, NULL, NULL),
(52, 1, 52, NULL, NULL),
(53, 1, 53, NULL, NULL),
(54, 1, 54, NULL, NULL),
(55, 1, 55, NULL, NULL),
(56, 1, 56, NULL, NULL),
(57, 1, 57, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `sales`
--

CREATE TABLE `sales` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `invoice_number` varchar(255) NOT NULL,
  `warehouse_id` int(11) DEFAULT 0,
  `tax_rate` double DEFAULT 0,
  `tax_amount` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `discount_type` varchar(192) NOT NULL,
  `grand_total` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `shipping_amount` double DEFAULT 0,
  `payment_status` varchar(192) NOT NULL,
  `status` varchar(191) NOT NULL,
  `notes` text DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_items`
--

CREATE TABLE `sales_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_returns`
--

CREATE TABLE `sales_returns` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sale_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `customer_id` bigint(20) UNSIGNED NOT NULL,
  `warehouse_id` int(11) DEFAULT 0,
  `date` datetime NOT NULL,
  `return_invoice_number` varchar(255) NOT NULL,
  `tax_rate` double DEFAULT 0,
  `tax_amount` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `discount_type` varchar(192) NOT NULL,
  `grand_total` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `payment_status` varchar(192) NOT NULL,
  `status` varchar(191) NOT NULL,
  `notes` text DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_items`
--

CREATE TABLE `sales_return_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sales_return_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `sales_return_payments`
--

CREATE TABLE `sales_return_payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `sales_return_id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `amount` double NOT NULL,
  `payment_method_id` bigint(20) UNSIGNED NOT NULL,
  `account_id` int(11) DEFAULT NULL,
  `date` datetime DEFAULT NULL,
  `change` double NOT NULL DEFAULT 0,
  `payment_notes` varchar(192) DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `settings`
--

CREATE TABLE `settings` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `key` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `settings`
--

INSERT INTO `settings` (`id`, `key`, `value`, `created_at`, `updated_at`) VALUES
(1, 'company_name', 'Your Company Name', NULL, NULL),
(2, 'company_email', 'contact@yourcompany.com', NULL, NULL),
(3, 'company_phone', '12345678890', NULL, NULL),
(4, 'company_vat', 'PL6541215450', NULL, NULL),
(5, 'company_address', '123, Street Name, Area', NULL, NULL),
(6, 'company_pincode', '123456', NULL, NULL),
(7, 'company_gst_no', '22AAAAA0000A1Z5', NULL, NULL),
(8, 'company_state', 'Your State', NULL, NULL),
(9, 'company_country', 'India', NULL, NULL),
(10, 'app_name', 'Elite POS', NULL, NULL),
(11, 'developed_by', 'Dream Coderz', NULL, NULL),
(12, 'app_footer', '', NULL, NULL),
(13, 'default_customer', '1', NULL, NULL),
(14, 'default_warehouse', '1', NULL, NULL),
(15, 'default_currency', 'INR', NULL, NULL),
(16, 'currency_symbol', '₹', NULL, NULL),
(17, 'categories_enabled', 'true', NULL, '2024-03-11 04:17:33'),
(18, 'warehouses_enabled', 'false', NULL, '2024-03-11 04:17:28'),
(19, 'brands_enabled', 'true', NULL, NULL),
(20, 'stocks_enabled', 'flase', NULL, NULL),
(21, 'units_enabled', 'true', NULL, NULL),
(22, 'purchases_enabled', 'true', NULL, NULL),
(23, 'pos_enabled', 'true', NULL, NULL),
(24, 'accounting_enabled', 'true', NULL, NULL),
(25, 'invoice_prefix', '', NULL, NULL),
(26, 'invoice_suffix', '', NULL, NULL),
(27, 'last_invoice_number', '1000', NULL, NULL),
(28, 'time_zone', 'Asia/Kolkata', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `stocks`
--

CREATE TABLE `stocks` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT 1,
  `batch_number` varchar(255) DEFAULT NULL,
  `expiry_date` date DEFAULT NULL,
  `date` datetime NOT NULL,
  `quantity` int(11) NOT NULL,
  `type` enum('Addition','Subtraction') NOT NULL,
  `movement_reason` enum('Sale','Purchase','Sales Return','Purchase Return','Stock Adjustment_Addition','Stock Adjustment_Subtraction','Transfer Out','Transfer In','Write-Off','Reconciliation') NOT NULL,
  `related_order_id` bigint(20) UNSIGNED DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `suppliers`
--

CREATE TABLE `suppliers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `phone` varchar(191) DEFAULT NULL,
  `email` varchar(192) DEFAULT NULL,
  `address` text DEFAULT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transactions`
--

CREATE TABLE `transactions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `warehouse_id` bigint(20) UNSIGNED DEFAULT NULL,
  `type` enum('sale','purchase','sales_return','purchase_return') NOT NULL,
  `quantity` int(11) NOT NULL,
  `transaction_date` datetime NOT NULL,
  `created_by` bigint(20) UNSIGNED NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers`
--

CREATE TABLE `transfers` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `user_id` bigint(20) UNSIGNED NOT NULL,
  `date` datetime NOT NULL,
  `from_warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `to_warehouse_id` bigint(20) UNSIGNED NOT NULL,
  `tax_rate` double DEFAULT 0,
  `tax_amount` double DEFAULT 0,
  `discount` double DEFAULT 0,
  `discount_type` varchar(192) NOT NULL,
  `grand_total` double NOT NULL DEFAULT 0,
  `paid_amount` double NOT NULL DEFAULT 0,
  `shipping_amount` double DEFAULT 0,
  `payment_status` varchar(192) NOT NULL,
  `status` varchar(191) NOT NULL,
  `notes` text DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `transfers_items`
--

CREATE TABLE `transfers_items` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `transfer_id` bigint(20) UNSIGNED NOT NULL,
  `product_id` bigint(20) UNSIGNED NOT NULL,
  `variant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(8,2) NOT NULL,
  `subtotal` decimal(8,2) NOT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `units`
--

CREATE TABLE `units` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(192) NOT NULL,
  `short_name` varchar(192) NOT NULL,
  `base_unit` int(11) DEFAULT NULL,
  `operator` char(192) DEFAULT '*',
  `operator_value` double DEFAULT 1,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `units`
--

INSERT INTO `units` (`id`, `name`, `short_name`, `base_unit`, `operator`, `operator_value`, `created_by`, `deleted_by`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Kilogram', 'kg', NULL, '*', 1, NULL, NULL, '2024-01-10 01:58:05', '2024-01-10 01:58:05', NULL),
(2, 'Grams', 'gms', NULL, '*', 1000, NULL, NULL, '2024-01-10 01:58:56', '2024-01-10 01:58:56', NULL),
(3, 'Pocket', 'pkt', NULL, '*', 1, NULL, NULL, '2024-01-10 01:59:15', '2024-01-10 02:00:14', NULL),
(4, 'Pieces', 'pcs', NULL, '*', 1, NULL, NULL, '2024-01-10 02:00:43', '2024-01-10 02:00:43', NULL),
(5, 'Litre ', 'ltr ', NULL, '*', 1, NULL, NULL, '2024-01-10 08:47:25', '2024-01-10 08:47:25', NULL),
(6, 'Milli Litre ', 'ml ', 5, '*', 1000, NULL, NULL, '2024-01-10 08:48:46', '2024-01-10 08:48:46', NULL),
(7, 'Box ', 'box ', NULL, '*', 1, NULL, NULL, '2024-01-12 01:07:43', '2024-01-12 01:07:43', NULL),
(8, 'Bag ', 'bag ', NULL, '*', 1, NULL, NULL, '2024-01-15 12:09:11', '2024-01-15 12:09:11', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `role_id` bigint(20) UNSIGNED DEFAULT NULL,
  `name` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `created_by` bigint(20) UNSIGNED DEFAULT NULL,
  `deleted_by` bigint(20) UNSIGNED DEFAULT NULL,
  `remember_token` varchar(100) DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `role_id`, `name`, `username`, `password`, `created_by`, `deleted_by`, `remember_token`, `deleted_at`, `created_at`, `updated_at`) VALUES
(1, 1, 'admin', 'admin', '$2y$12$zgdnqQEUY8W2vFsDrrX4sePbeQCO3BkSjalzwGhJ6nUOc1gOSjoou', NULL, NULL, NULL, NULL, '2024-03-10 22:01:46', '2024-03-10 22:01:46');

-- --------------------------------------------------------

--
-- Table structure for table `warehouses`
--

CREATE TABLE `warehouses` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) DEFAULT NULL,
  `pincode` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `city` varchar(255) DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `deleted_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `warehouses`
--

INSERT INTO `warehouses` (`id`, `name`, `address`, `pincode`, `phone`, `city`, `created_at`, `updated_at`, `deleted_at`) VALUES
(1, 'Main', NULL, NULL, NULL, NULL, '2024-03-10 22:01:33', '2024-03-10 22:01:33', NULL);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `audit_logs_user_id_foreign` (`user_id`);

--
-- Indexes for table `brands`
--
ALTER TABLE `brands`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `categories_parent_id_foreign` (`parent_id`);

--
-- Indexes for table `currencies`
--
ALTER TABLE `currencies`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `deposits`
--
ALTER TABLE `deposits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `deposit_account_id` (`account_id`),
  ADD KEY `deposit_category_id` (`deposit_category_id`),
  ADD KEY `deposit_payment_method_id` (`payment_method_id`);

--
-- Indexes for table `deposit_categories`
--
ALTER TABLE `deposit_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `expenses`
--
ALTER TABLE `expenses`
  ADD PRIMARY KEY (`id`),
  ADD KEY `expenses_account_id` (`account_id`),
  ADD KEY `expenses_category_id` (`expense_category_id`),
  ADD KEY `expenses_payment_method_id` (`payment_method_id`);

--
-- Indexes for table `expense_categories`
--
ALTER TABLE `expense_categories`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `media`
--
ALTER TABLE `media`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `media_uuid_unique` (`uuid`),
  ADD KEY `media_model_type_model_id_index` (`model_type`,`model_id`),
  ADD KEY `media_order_column_index` (`order_column`);

--
-- Indexes for table `migrations`
--
ALTER TABLE `migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `password_reset_tokens`
--
ALTER TABLE `password_reset_tokens`
  ADD PRIMARY KEY (`username`);

--
-- Indexes for table `payment_methods`
--
ALTER TABLE `payment_methods`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `payment_purchases`
--
ALTER TABLE `payment_purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_purchases_purchase_id_index` (`purchase_id`),
  ADD KEY `payment_purchases_user_id_index` (`user_id`),
  ADD KEY `account_id_payment_purchases` (`account_id`);

--
-- Indexes for table `payment_sales`
--
ALTER TABLE `payment_sales`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payment_sales_sale_id_index` (`sale_id`),
  ADD KEY `payment_sales_user_id_index` (`user_id`),
  ADD KEY `account_id_payment_sales` (`account_id`);

--
-- Indexes for table `permissions`
--
ALTER TABLE `permissions`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `permission_groups`
--
ALTER TABLE `permission_groups`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `personal_access_tokens_token_unique` (`token`),
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `products_sku_unique` (`sku`);

--
-- Indexes for table `product_variants`
--
ALTER TABLE `product_variants`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `purchases`
--
ALTER TABLE `purchases`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id_purchase` (`user_id`),
  ADD KEY `sale_supplier` (`supplier_id`);

--
-- Indexes for table `purchases_items`
--
ALTER TABLE `purchases_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchases_items_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchases_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `purchase_returns_return_invoice_number_unique` (`return_invoice_number`),
  ADD KEY `purchase_returns_purchase_id_foreign` (`purchase_id`),
  ADD KEY `purchase_returns_user_id_index` (`user_id`),
  ADD KEY `purchases_return_supplier` (`supplier_id`);

--
-- Indexes for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_items_purchase_return_id_foreign` (`purchase_return_id`),
  ADD KEY `purchase_return_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `purchase_return_payments_purchase_return_id_index` (`purchase_return_id`),
  ADD KEY `purchase_return_payments_user_id_index` (`user_id`),
  ADD KEY `account_id_payment_purchases` (`account_id`);

--
-- Indexes for table `roles`
--
ALTER TABLE `roles`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_permission_role_id_foreign` (`role_id`),
  ADD KEY `role_permission_permission_id_foreign` (`permission_id`);

--
-- Indexes for table `sales`
--
ALTER TABLE `sales`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_invoice_number_unique` (`invoice_number`),
  ADD KEY `user_id_sales` (`user_id`),
  ADD KEY `sale_customer` (`customer_id`);

--
-- Indexes for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_items_sale_id_foreign` (`sale_id`),
  ADD KEY `sales_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `sales_returns`
--
ALTER TABLE `sales_returns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `sales_returns_return_invoice_number_unique` (`return_invoice_number`),
  ADD KEY `sales_returns_sale_id_foreign` (`sale_id`),
  ADD KEY `sales_returns_user_id_index` (`user_id`),
  ADD KEY `sales_retrn_customer` (`customer_id`);

--
-- Indexes for table `sales_return_items`
--
ALTER TABLE `sales_return_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_return_items_sales_return_id_foreign` (`sales_return_id`),
  ADD KEY `sales_return_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `sales_return_payments`
--
ALTER TABLE `sales_return_payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `sales_return_payments_sales_return_id_index` (`sales_return_id`),
  ADD KEY `sales_return_payments_user_id_index` (`user_id`),
  ADD KEY `account_id_payment_sales` (`account_id`);

--
-- Indexes for table `settings`
--
ALTER TABLE `settings`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `settings_key_unique` (`key`);

--
-- Indexes for table `stocks`
--
ALTER TABLE `stocks`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `suppliers_created_by_foreign` (`created_by`);

--
-- Indexes for table `transactions`
--
ALTER TABLE `transactions`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transactions_product_id_foreign` (`product_id`),
  ADD KEY `transactions_warehouse_id_foreign` (`warehouse_id`),
  ADD KEY `transactions_created_by_foreign` (`created_by`);

--
-- Indexes for table `transfers`
--
ALTER TABLE `transfers`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_from_warehouse_id_foreign` (`from_warehouse_id`),
  ADD KEY `transfers_to_warehouse_id_foreign` (`to_warehouse_id`),
  ADD KEY `user_id_transfers` (`user_id`);

--
-- Indexes for table `transfers_items`
--
ALTER TABLE `transfers_items`
  ADD PRIMARY KEY (`id`),
  ADD KEY `transfers_items_transfer_id_foreign` (`transfer_id`),
  ADD KEY `transfers_items_product_id_foreign` (`product_id`);

--
-- Indexes for table `units`
--
ALTER TABLE `units`
  ADD PRIMARY KEY (`id`),
  ADD KEY `units_created_by_foreign` (`created_by`),
  ADD KEY `base_unit` (`base_unit`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_username_unique` (`username`),
  ADD KEY `users_role_id_foreign` (`role_id`);

--
-- Indexes for table `warehouses`
--
ALTER TABLE `warehouses`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `accounts`
--
ALTER TABLE `accounts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_logs`
--
ALTER TABLE `audit_logs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `brands`
--
ALTER TABLE `brands`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `currencies`
--
ALTER TABLE `currencies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `customers`
--
ALTER TABLE `customers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `deposits`
--
ALTER TABLE `deposits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `deposit_categories`
--
ALTER TABLE `deposit_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expenses`
--
ALTER TABLE `expenses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `expense_categories`
--
ALTER TABLE `expense_categories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `media`
--
ALTER TABLE `media`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `payment_methods`
--
ALTER TABLE `payment_methods`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `payment_purchases`
--
ALTER TABLE `payment_purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_sales`
--
ALTER TABLE `payment_sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `permission_groups`
--
ALTER TABLE `permission_groups`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `products`
--
ALTER TABLE `products`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=314;

--
-- AUTO_INCREMENT for table `product_variants`
--
ALTER TABLE `product_variants`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases`
--
ALTER TABLE `purchases`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchases_items`
--
ALTER TABLE `purchases_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `role_permission`
--
ALTER TABLE `role_permission`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=58;

--
-- AUTO_INCREMENT for table `sales`
--
ALTER TABLE `sales`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_items`
--
ALTER TABLE `sales_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_returns`
--
ALTER TABLE `sales_returns`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_return_items`
--
ALTER TABLE `sales_return_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `sales_return_payments`
--
ALTER TABLE `sales_return_payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `settings`
--
ALTER TABLE `settings`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- AUTO_INCREMENT for table `stocks`
--
ALTER TABLE `stocks`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `suppliers`
--
ALTER TABLE `suppliers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transactions`
--
ALTER TABLE `transactions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers`
--
ALTER TABLE `transfers`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `transfers_items`
--
ALTER TABLE `transfers_items`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `units`
--
ALTER TABLE `units`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `warehouses`
--
ALTER TABLE `warehouses`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `audit_logs`
--
ALTER TABLE `audit_logs`
  ADD CONSTRAINT `audit_logs_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `categories`
--
ALTER TABLE `categories`
  ADD CONSTRAINT `categories_parent_id_foreign` FOREIGN KEY (`parent_id`) REFERENCES `categories` (`id`);

--
-- Constraints for table `payment_purchases`
--
ALTER TABLE `payment_purchases`
  ADD CONSTRAINT `payment_purchases_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_purchases_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `payment_sales`
--
ALTER TABLE `payment_sales`
  ADD CONSTRAINT `payment_sales_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `payment_sales_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Constraints for table `purchases_items`
--
ALTER TABLE `purchases_items`
  ADD CONSTRAINT `purchases_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchases_items_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_returns`
--
ALTER TABLE `purchase_returns`
  ADD CONSTRAINT `purchase_returns_purchase_id_foreign` FOREIGN KEY (`purchase_id`) REFERENCES `purchases` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_returns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_return_items`
--
ALTER TABLE `purchase_return_items`
  ADD CONSTRAINT `purchase_return_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `purchase_return_items_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `purchase_return_payments`
--
ALTER TABLE `purchase_return_payments`
  ADD CONSTRAINT `purchase_return_payments_purchase_return_id_foreign` FOREIGN KEY (`purchase_return_id`) REFERENCES `purchase_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `role_permission`
--
ALTER TABLE `role_permission`
  ADD CONSTRAINT `role_permission_permission_id_foreign` FOREIGN KEY (`permission_id`) REFERENCES `permissions` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `role_permission_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales`
--
ALTER TABLE `sales`
  ADD CONSTRAINT `sales_customer_id_foreign` FOREIGN KEY (`customer_id`) REFERENCES `customers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_items`
--
ALTER TABLE `sales_items`
  ADD CONSTRAINT `sales_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_items_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_returns`
--
ALTER TABLE `sales_returns`
  ADD CONSTRAINT `sales_returns_sale_id_foreign` FOREIGN KEY (`sale_id`) REFERENCES `sales` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_returns_user_id_foreign` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_return_items`
--
ALTER TABLE `sales_return_items`
  ADD CONSTRAINT `sales_return_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `sales_return_items_sales_return_id_foreign` FOREIGN KEY (`sales_return_id`) REFERENCES `sales_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `sales_return_payments`
--
ALTER TABLE `sales_return_payments`
  ADD CONSTRAINT `sales_return_payments_sales_return_id_foreign` FOREIGN KEY (`sales_return_id`) REFERENCES `sales_returns` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `suppliers`
--
ALTER TABLE `suppliers`
  ADD CONSTRAINT `suppliers_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `transactions`
--
ALTER TABLE `transactions`
  ADD CONSTRAINT `transactions_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`),
  ADD CONSTRAINT `transactions_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`),
  ADD CONSTRAINT `transactions_warehouse_id_foreign` FOREIGN KEY (`warehouse_id`) REFERENCES `warehouses` (`id`);

--
-- Constraints for table `transfers`
--
ALTER TABLE `transfers`
  ADD CONSTRAINT `transfers_from_warehouse_id_foreign` FOREIGN KEY (`from_warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `transfers_to_warehouse_id_foreign` FOREIGN KEY (`to_warehouse_id`) REFERENCES `warehouses` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `transfers_items`
--
ALTER TABLE `transfers_items`
  ADD CONSTRAINT `transfers_items_product_id_foreign` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `transfers_items_transfer_id_foreign` FOREIGN KEY (`transfer_id`) REFERENCES `transfers` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `units`
--
ALTER TABLE `units`
  ADD CONSTRAINT `units_created_by_foreign` FOREIGN KEY (`created_by`) REFERENCES `users` (`id`);

--
-- Constraints for table `users`
--
ALTER TABLE `users`
  ADD CONSTRAINT `users_role_id_foreign` FOREIGN KEY (`role_id`) REFERENCES `roles` (`id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
