-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 30, 2023 at 11:17 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.0.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `doctor_web`
--

-- --------------------------------------------------------

--
-- Table structure for table `admins`
--

CREATE TABLE `admins` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `staff_id` int(20) DEFAULT NULL,
  `therapist_id` int(20) DEFAULT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `position` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `username` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(11) COLLATE utf8mb4_unicode_ci DEFAULT '1',
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `admins`
--

INSERT INTO `admins` (`id`, `staff_id`, `therapist_id`, `name`, `position`, `email`, `phone`, `username`, `email_verified_at`, `password`, `image`, `status`, `remember_token`, `created_at`, `updated_at`) VALUES
(1, NULL, NULL, 'superadmin', NULL, 'superadmin@gmail.com', NULL, 'superadmin', NULL, '$2y$10$grm3z53L5a25UmMn2IN3k.rCggUR1xCXYKE6eO6yg6M6fN4RAQC8C', 'user-photo/1665758734.png', '1', NULL, '2021-03-24 05:29:53', '2023-03-05 00:11:11'),
(7, NULL, NULL, 'doctor', 'doctor', 'doctor@gmail.com', '01646735100', 'doctor', NULL, '$2y$10$N/0gxFIDsXihOrr3rjmy.OySYLgwxzyPlnSOONXxKBlbYBuhZK6jy', NULL, '1', NULL, '2023-03-28 00:12:40', '2023-03-28 00:12:40');

-- --------------------------------------------------------

--
-- Table structure for table `bills`
--

CREATE TABLE `bills` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `invoice_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_status` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `total_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `diet_charts`
--

CREATE TABLE `diet_charts` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `diet_charts`
--

INSERT INTO `diet_charts` (`id`, `name`, `file`, `created_at`, `updated_at`) VALUES
(2, 'hhr', 'public/uploads/banner2.png', '2023-03-21 01:50:28', '2023-03-21 02:01:24');

-- --------------------------------------------------------

--
-- Table structure for table `doctors`
--

CREATE TABLE `doctors` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_or_mobile_number` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid_number` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `years_of_experience` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_certificate` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctors`
--

INSERT INTO `doctors` (`id`, `admin_id`, `name`, `address`, `gender`, `email_address`, `phone_or_mobile_number`, `nid_number`, `nationality`, `years_of_experience`, `doctor_certificate`, `created_at`, `updated_at`) VALUES
(4, 1, 'Kamruzzaman kajol', 'Rajshahi', 'Male', 'kkajol428@gmail.com', '01646735100', '5555555555', 'bd', '5', 'public/uploads/banner1.png', '2023-03-20 05:17:23', '2023-03-20 05:17:23'),
(5, 1, 'Kamruzzaman kajol', 'Rajshahi', 'Male', 'kkajol428@gmail.com', '01646735100', '5555555555', 'bd', '5', 'public/uploads/banner1.png', '2023-03-21 00:20:47', '2023-03-21 00:20:47');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_appointments`
--

CREATE TABLE `doctor_appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `appointment_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_type` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `serial_number` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(110) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctor_appointments`
--

INSERT INTO `doctor_appointments` (`id`, `admin_id`, `patient_id`, `doctor_id`, `appointment_date`, `patient_type`, `serial_number`, `status`, `created_at`, `updated_at`) VALUES
(3, 1, '2603231679808261', 5, '2023-03-29', 'Patient', '1', NULL, '2023-03-28 00:09:29', '2023-03-28 00:09:29'),
(4, 1, '220323104649', 5, '2023-03-29', 'Patient', '2', '1', '2023-03-28 00:09:54', '2023-03-29 02:19:30'),
(5, 1, '2603231679808261', 5, '2023-03-30', 'Patient', '1', '1', '2023-03-30 00:04:08', '2023-03-30 00:06:01'),
(6, 1, '220323100307', 4, '2023-03-30', 'Patient', '1', '1', '2023-03-30 01:33:46', '2023-03-30 01:36:19');

-- --------------------------------------------------------

--
-- Table structure for table `doctor_consult_dates`
--

CREATE TABLE `doctor_consult_dates` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `doctor_consult_dates`
--

INSERT INTO `doctor_consult_dates` (`id`, `doctor_id`, `day`, `start_time`, `end_time`, `created_at`, `updated_at`) VALUES
(3, 5, 'Saturday', '18:15', '17:18', '2023-03-21 00:20:47', '2023-03-21 00:20:47'),
(4, 5, 'Sunday', '19:19', '09:21', '2023-03-21 00:20:47', '2023-03-21 00:20:47'),
(5, 4, 'Saturday', '18:15', '17:18', '2023-03-21 00:21:36', '2023-03-21 00:21:36'),
(6, 4, 'Sunday', '19:19', '09:21', '2023-03-21 00:21:36', '2023-03-21 00:21:36');

-- --------------------------------------------------------

--
-- Table structure for table `failed_jobs`
--

CREATE TABLE `failed_jobs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uuid` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `connection` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `queue` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `payload` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `exception` longtext COLLATE utf8mb4_unicode_ci NOT NULL,
  `failed_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `health_supplements`
--

CREATE TABLE `health_supplements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `health_supplements`
--

INSERT INTO `health_supplements` (`id`, `name`, `amount`, `created_at`, `updated_at`) VALUES
(2, 'Bosun', '1080', '2023-03-21 03:00:24', '2023-03-21 03:00:24');

-- --------------------------------------------------------

--
-- Table structure for table `medicines`
--

CREATE TABLE `medicines` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `medicines`
--

INSERT INTO `medicines` (`id`, `name`, `amount`, `created_at`, `updated_at`) VALUES
(2, 'ADMINISTRATION', '400', '2023-03-21 02:47:27', '2023-03-21 02:47:27');

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
(9, '2014_10_12_000000_create_users_table', 1),
(10, '2014_10_12_100000_create_password_resets_table', 1),
(11, '2019_08_19_000000_create_failed_jobs_table', 1),
(12, '2021_03_18_095906_create_permission_tables', 1),
(13, '2021_03_24_112406_create_admins_table', 2),
(14, '2022_02_07_091424_create_system_information_table', 2),
(15, '2019_12_14_000001_create_personal_access_tokens_table', 3),
(16, '2022_02_19_095110_create_permission_tables', 4),
(17, '2022_02_19_102354_create_admins_table', 5),
(18, '2022_10_15_105118_create_taxes_table', 5),
(19, '2022_10_15_105149_create_currencies_table', 5),
(20, '2022_10_15_105224_create_generals_table', 5),
(21, '2022_10_15_105308_create_invoicesettings_table', 5),
(22, '2022_10_15_105347_create_creditnotes_table', 5),
(23, '2022_10_15_105413_create_estimates_table', 5),
(24, '2022_10_17_141537_create_vendors_table', 6),
(25, '2022_10_17_141604_create_clients_table', 6),
(26, '2022_10_23_175519_create_brands_table', 7),
(27, '2022_10_23_175538_create_categories_table', 7),
(28, '2022_10_23_175612_create_subcategories_table', 7),
(29, '2022_10_23_175634_create_units_table', 7),
(30, '2022_10_23_175835_create_warehouses_table', 7),
(31, '2022_10_23_175948_create_products_table', 7),
(32, '2022_10_26_183747_create_sells_table', 8),
(33, '2022_10_26_184642_create_selldetails_table', 8),
(34, '2022_10_27_180531_create_purchases_table', 9),
(35, '2022_10_27_180549_create_purchasedetails_table', 9),
(36, '2022_10_27_223251_create_requisitions_table', 9),
(37, '2022_10_27_231141_create_rproducts_table', 10),
(38, '2023_01_05_105440_create_items_table', 11),
(39, '2023_01_05_105632_create_ingredients_table', 11),
(40, '2023_01_05_105723_create_tablelists_table', 11),
(41, '2023_01_05_105838_create_orders_table', 11),
(42, '2023_01_05_110254_create_menulists_table', 11),
(43, '2023_01_05_110315_create_menudetails_table', 11),
(44, '2023_01_10_045836_create_qrcodelists_table', 12),
(45, '2023_01_10_075200_create_orderdetails_table', 13),
(46, '2023_01_17_045638_create_pbanners_table', 14),
(47, '2023_01_25_052115_create_companybanners_table', 15),
(48, '2023_03_19_090028_create_walk_by_patients_table', 16),
(49, '2023_03_19_090121_create_patients_table', 17),
(50, '2023_03_19_090224_create_patient_admits_table', 17),
(51, '2023_03_19_090405_create_walk_by_patient_services_table', 17),
(52, '2023_03_19_090503_create_patient_files_table', 17),
(53, '2023_03_19_090620_create_doctors_table', 18),
(54, '2023_03_19_090833_create_doctor_appointments_table', 18),
(55, '2023_03_19_091020_create_therapy_appointments_table', 19),
(56, '2023_03_19_091344_create_therapy_appointment_details_table', 19),
(57, '2023_03_19_091427_create_therapy_appointment_date_and_times_table', 19),
(58, '2023_03_19_091648_create_doctor_consult_dates_table', 19),
(59, '2023_03_19_091805_create_diet_charts_table', 19),
(60, '2023_03_19_091946_create_medicines_table', 19),
(61, '2023_03_19_092045_create_health_supplements_table', 19),
(62, '2023_03_19_092651_create_therapy_ingredients_table', 19),
(63, '2023_03_19_093241_create_therapy_lists_table', 19),
(64, '2023_03_19_093345_create_staff_table', 19),
(65, '2023_03_19_093434_create_rewards_table', 19),
(66, '2023_03_19_093542_create_therapists_table', 19),
(67, '2023_03_19_112836_create_therapy_details_table', 19),
(76, '2023_03_28_073851_create_patient_histories_table', 20),
(77, '2023_03_28_074103_create_patient_therapies_table', 20),
(78, '2023_03_28_074256_create_patient_herbs_table', 20),
(79, '2023_03_28_074335_create_patient_medical_supplements_table', 20),
(80, '2023_03_30_075821_create_bills_table', 21),
(81, '2023_03_30_080008_create_payments_table', 21);

-- --------------------------------------------------------

--
-- Table structure for table `model_has_permissions`
--

CREATE TABLE `model_has_permissions` (
  `permission_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `model_has_roles`
--

CREATE TABLE `model_has_roles` (
  `role_id` bigint(20) UNSIGNED NOT NULL,
  `model_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `model_id` bigint(20) UNSIGNED NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `model_has_roles`
--

INSERT INTO `model_has_roles` (`role_id`, `model_type`, `model_id`) VALUES
(1, 'App\\Models\\Admin', 1),
(1, 'App\\User', 1),
(3, 'App\\Models\\Admin', 7);

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
-- Table structure for table `patients`
--

CREATE TABLE `patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refer_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_or_mobile_number` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid_number` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `how_did_you_come_to_know_about_this_center` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `do_you_have_earlier_experience_of_ayurveda_please_give_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `do_you_have_symptoms_in_past_one_weak` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `covid_test_result` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patients`
--

INSERT INTO `patients` (`id`, `admin_id`, `image`, `patient_id`, `name`, `refer_from`, `age`, `gender`, `address`, `email_address`, `phone_or_mobile_number`, `nid_number`, `nationality`, `how_did_you_come_to_know_about_this_center`, `do_you_have_earlier_experience_of_ayurveda_please_give_details`, `do_you_have_symptoms_in_past_one_weak`, `covid_test_result`, `created_at`, `updated_at`) VALUES
(1, 1, 'public/uploads/banner1.png', '220323100307', '7HnmZIEHpo', 'bBMVeyDePV', 'ovrKDHy3mE', 'Male', 'XcahIZ6UA6', 'akny2@0yzp.com', 'e9dsRhiX2A', 'w3ZKCLW7jh', '5YfzgZP3bJ', 'YgiJg0snyL', 'iPek6e823y', 'W2Rx6MPyAA', 'Yes', '2023-03-22 04:03:07', '2023-03-22 04:03:07'),
(2, 1, 'public/uploads/banner1.png', '220323104649', 'F6idQ3M1Bs', 'RIBDewaNUD', 'tep3rwuHoh', 'Female', '1SQeTB1pli', 'qqgjt@ilvz.com', 'tMLYSCeR3E', 'ugomc@hur7.com', 'zytyuZDZ9N', 'siUgh7729c', 'gXoiTcYWmX', 'S6TVupGu2y', 'Yes', '2023-03-22 04:46:49', '2023-03-22 04:46:49'),
(3, 1, 'N/A', '2603231679808261', 'ahEhAI9Fmi', 'N/A', 'UnP4RZ3DmO', 'Male', 'y3fDkCtWii', 'shdtv@mbkf.com', '8955443456', '9813538967', 'wwXiA71MIj', 'N/A', 'N/A', 'N/A', 'Yes', '2023-03-25 23:24:55', '2023-03-26 00:08:27');

-- --------------------------------------------------------

--
-- Table structure for table `patient_admits`
--

CREATE TABLE `patient_admits` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `patient_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_or_mobile_number` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid_number` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `type_of_accommodation` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `recommended_doctor_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `treatment_package_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `routine` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_admits`
--

INSERT INTO `patient_admits` (`id`, `admin_id`, `patient_type`, `patient_id`, `doctor_id`, `name`, `age`, `gender`, `address`, `email_address`, `phone_or_mobile_number`, `nid_number`, `nationality`, `type_of_accommodation`, `recommended_doctor_name`, `start_date`, `end_date`, `treatment_package_name`, `routine`, `created_at`, `updated_at`) VALUES
(3, 1, 'Already Registered', '220323100307', 4, '7HnmZIEHpo', 'ovrKDHy3mE', 'Male', 'XcahIZ6UA6', 'akny2@0yzp.com', 'e9dsRhiX2A', 'w3ZKCLW7jh', '5YfzgZP3bJ', 'gfrgdf', '4', '2023-03-23', '2023-03-25', '1', 'public/uploads/3599534a-719c-4104-9793-d9c35c8500a0.jpg', '2023-03-26 00:12:27', '2023-03-26 00:12:27');

-- --------------------------------------------------------

--
-- Table structure for table `patient_files`
--

CREATE TABLE `patient_files` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `file` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_files`
--

INSERT INTO `patient_files` (`id`, `patient_id`, `name`, `file`, `created_at`, `updated_at`) VALUES
(1, 1, 'pfFDr9Qgnq', 'public/uploads/4ee85515-2f0a-485a-9b18-2a2b15d43896.jpg', '2023-03-22 04:03:07', '2023-03-22 04:33:11'),
(2, 1, 'erewr', 'public/uploads/banner1.png', '2023-03-22 04:03:07', '2023-03-22 04:03:07');

-- --------------------------------------------------------

--
-- Table structure for table `patient_herbs`
--

CREATE TABLE `patient_herbs` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_appointment_id` bigint(20) UNSIGNED NOT NULL,
  `patient_history_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `part_of_the_day` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `how_many_dose` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `main_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_herbs`
--

INSERT INTO `patient_herbs` (`id`, `doctor_id`, `doctor_appointment_id`, `patient_history_id`, `patient_id`, `name`, `part_of_the_day`, `how_many_dose`, `main_time`, `created_at`, `updated_at`) VALUES
(1, 5, 4, 1, '5', 'ADMINISTRATION', 'Morning', '66', 'After Food', '2023-03-29 02:19:31', '2023-03-29 02:19:31'),
(2, 5, 4, 1, '5', 'ADMINISTRATION', 'Morning', '66', 'Before Food', '2023-03-29 02:19:31', '2023-03-29 02:19:31'),
(3, 5, 5, 2, '2603231679808261', 'ADMINISTRATION', 'Morning', '66', 'After Food', '2023-03-30 00:06:01', '2023-03-30 00:06:01'),
(4, 5, 5, 2, '2603231679808261', 'ADMINISTRATION', 'Noon', '66', 'Before Food', '2023-03-30 00:06:01', '2023-03-30 00:06:01'),
(5, 4, 6, 3, '220323100307', 'ADMINISTRATION', 'Morning', '66', 'After Food', '2023-03-30 01:36:19', '2023-03-30 01:36:19');

-- --------------------------------------------------------

--
-- Table structure for table `patient_histories`
--

CREATE TABLE `patient_histories` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_appointment_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `pradhan_vedana` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vedana_vrutanta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `chikitsa_vrutanta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `stri_evam_prasooti_vrutant` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `poorva_vedana_vrutant` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `anuvanshika_vritanta` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pratyaksh_pramanam` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roga_preeksha_srotas_pareeksha` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rasavaha_srotas` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `raktavaha_srotas` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mamsavaha_srotas` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `medovaha_srotas` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `asthivaha_srotas` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `majjavaha_srotas` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shukravaha_srotas` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rogi_pareeksha` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nadi` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dosha` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `dushya` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `shwas` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `tap_temp` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kala` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `bhara_wt` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `agni` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `raktchap_bp` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `prakruti` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mala` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vaya` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `mootra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satmya` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `kshudha` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `satva` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `nidra` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `ahara` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `vyasan` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `roga_mrag` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `rago_sthana` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sadhyasadhyata` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `pathya` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `yoga_chikitsa` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `paramarsh` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `history_file` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_histories`
--

INSERT INTO `patient_histories` (`id`, `admin_id`, `doctor_id`, `doctor_appointment_id`, `patient_id`, `pradhan_vedana`, `vedana_vrutanta`, `chikitsa_vrutanta`, `stri_evam_prasooti_vrutant`, `poorva_vedana_vrutant`, `anuvanshika_vritanta`, `pratyaksh_pramanam`, `roga_preeksha_srotas_pareeksha`, `rasavaha_srotas`, `raktavaha_srotas`, `mamsavaha_srotas`, `medovaha_srotas`, `asthivaha_srotas`, `majjavaha_srotas`, `shukravaha_srotas`, `rogi_pareeksha`, `nadi`, `dosha`, `dushya`, `shwas`, `tap_temp`, `kala`, `bhara_wt`, `agni`, `raktchap_bp`, `prakruti`, `mala`, `vaya`, `mootra`, `satmya`, `kshudha`, `satva`, `nidra`, `ahara`, `vyasan`, `roga_mrag`, `rago_sthana`, `sadhyasadhyata`, `pathya`, `yoga_chikitsa`, `paramarsh`, `history_file`, `status`, `created_at`, `updated_at`) VALUES
(1, 1, 5, 4, '220323104649', 'sIf7T5hQIi', 'voJwtNR6GJ', 'QuB7m16pMf', 'IOrdKewpj1', '2tMdHai3UR', 'EFR3J0WGHN', 'uDaemVs2au', 'WcXydCPY4M', 'tSn5X6HoNl', 'WSKg2zoW4k', 'l3Kg6cEvRe', 'F05tq7HYzf', 'GBAk7AAlJS', 'ECCR8myOhX', '0DvWpjQ8WE', 'YS3lzTDTbc', 'kh7SmNwkCd', '4SMZ5SZNPo', 'mwOxBfLEGg', 'qqa0UVCpxx', '3macvj4OLl', 'ydOMrQFfZl', 'GQtQHMXh48', 'rxPLFkI0z6', 'w9jmmue1tb', 'GQduM2SHoT', '8Z1MuXOsHv', '1b098dIM9Y', 'IdrIzIsAEz', 'TTpnRHmi2q', 'sp2OdA6jQo', 'kyzIruXEDf', 'UQrA5QugmC', '2H60cMIahC', 'R3Xmg0Pezh', 'P8ECO5KeaZ', 'hgLH8hdIVH', 'aMPKVcCAFw', 'oX3xFFrXWB', 'HOuVfD1Lsv', 'PbSEcg9zq6', 'public/uploads/banner-bg2.png', '1', '2023-03-29 00:40:28', '2023-03-29 02:19:30'),
(2, 1, 5, 5, '2603231679808261', 'Yf0VVHtZAe', '7XZ89PNpYQ', 'Tyctddlxlu', 'EsBeTgrJ4C', 'eHg95bJRw7', 'CLG1ja5LWR', 'BLMSWrUdrO', 'oF65wM2F7A', 'oXs32c2JW2', '5vEsRzIqWp', 'exLuDCZBr9', '9RPgnEbla1', 'kbhzXnnh9G', '8laVRRvYCW', 'NmtBGsV7WU', 'l44JiQrKNp', 'GdylPDug9b', 'V4ZzfQGfYu', '8tCXb6XlHO', '194V4pB4Gy', 'U9N7CjWfeZ', 'bbYZna8jSm', 'YlXR43z57f', 'krXGgEmNk3', 'yMfHqXFOqN', 'W3Ixv9kFKC', '44KUF50j7M', '4U3DE1Wjpg', 'QPhCRFxegb', 'zNLKopL1Zh', 'FCf2Vc0Q4B', '6a4Td4BaMv', 'TW3gcD9Gx0', 'pMXEBWU3iw', 'toGNRQz7En', 'T4JOFwD3nw', 'qkrHFC2C6G', 'oRSYRNf089', 'SYYaOXdwak', '28jQumcJQo', '8yPf3OYs5f', 'public/uploads/blog2.png', '1', '2023-03-30 00:04:49', '2023-03-30 01:00:12'),
(3, 1, 4, 6, '220323100307', 'gmlNHla7jg', 'NljxhXqWd7', '7xx3lNq99N', 'sbEuf7TJmw', 'luOlXV7Rys', 'PK13J2V2vJ', 'gBfmsmo3Qt', 'nrrDs7OUS7', '2r4mbEJecC', 'i3MYcAOkzo', '1bLWfzcopL', 'G8IY23Jwvs', 'EMZPC37BfX', 'y1LGbfqjCh', 'Qj4qMEz71m', 'E88XOJGrcU', 'GfClKkzQZy', '9RWkifIwiD', 'VwVA3YHLUm', 'vyjWrxYwH9', 'SPXADi4Kgl', 'qVGscDY7mQ', 'zGYgLOBqrV', 'IpimKI86Js', 'I7ThQSYgTY', 'FC1LCJaOwM', 'TTwodfUC7k', 'JxGEL2BOOi', 'DodU4wI5b5', 'tesYAbQ8uI', 'bpjaX3Ag0S', 'NXAgrzGHKU', '6EVuudTH2u', 'boZdguk7HG', 'Zf5UzCtg7M', 'q1sSczsS2B', 'm4P9tnRW6w', 'sDznxANnUe', '9IpxIivoO0', 'fwGjEYVyuA', 'VLfkYhLxId', 'public/uploads/555.PNG', '0', '2023-03-30 01:35:49', '2023-03-30 01:36:19');

-- --------------------------------------------------------

--
-- Table structure for table `patient_medical_supplements`
--

CREATE TABLE `patient_medical_supplements` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_appointment_id` bigint(20) UNSIGNED NOT NULL,
  `patient_history_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_medical_supplements`
--

INSERT INTO `patient_medical_supplements` (`id`, `doctor_id`, `doctor_appointment_id`, `patient_history_id`, `patient_id`, `name`, `quantity`, `created_at`, `updated_at`) VALUES
(1, 5, 4, 1, '5', 'Bosun', '3', '2023-03-29 02:19:31', '2023-03-29 02:19:31'),
(2, 5, 5, 2, '2603231679808261', 'Bosun', '3', '2023-03-30 00:06:01', '2023-03-30 00:06:01'),
(3, 4, 6, 3, '220323100307', 'Bosun', '2', '2023-03-30 01:36:19', '2023-03-30 01:36:19');

-- --------------------------------------------------------

--
-- Table structure for table `patient_therapies`
--

CREATE TABLE `patient_therapies` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `doctor_id` bigint(20) UNSIGNED NOT NULL,
  `doctor_appointment_id` bigint(20) UNSIGNED NOT NULL,
  `patient_history_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `patient_therapies`
--

INSERT INTO `patient_therapies` (`id`, `doctor_id`, `doctor_appointment_id`, `patient_history_id`, `patient_id`, `name`, `amount`, `created_at`, `updated_at`) VALUES
(1, 5, 4, 1, '5', 'kajol', '500', '2023-03-29 02:19:31', '2023-03-29 02:19:31'),
(2, 5, 4, 1, '5', 'kajol', '150', '2023-03-29 02:19:31', '2023-03-29 02:19:31'),
(3, 5, 5, 2, '2603231679808261', 'kajol', '3', '2023-03-30 00:06:01', '2023-03-30 00:06:01'),
(4, 5, 5, 2, '2603231679808261', 'kajol', '3', '2023-03-30 00:06:01', '2023-03-30 00:06:01'),
(5, 4, 6, 3, '220323100307', 'kajol', '2', '2023-03-30 01:36:19', '2023-03-30 01:36:19');

-- --------------------------------------------------------

--
-- Table structure for table `payments`
--

CREATE TABLE `payments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `bill_id` bigint(20) UNSIGNED NOT NULL,
  `payment_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `payment_amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `permissions`
--

CREATE TABLE `permissions` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `group_name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `app_url` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `permissions`
--

INSERT INTO `permissions` (`id`, `name`, `guard_name`, `group_name`, `app_url`, `created_at`, `updated_at`) VALUES
(1, 'dashboard.view', 'admin', 'dashboard', NULL, '2021-03-24 02:04:15', '2021-03-24 02:04:15'),
(2, 'dashboard.edit', 'admin', 'dashboard', NULL, '2021-03-24 02:04:15', '2021-03-24 02:04:15'),
(8, 'admin.create', 'admin', 'admin', NULL, '2021-03-24 02:04:16', '2021-03-24 02:04:16'),
(9, 'admin.view', 'admin', 'admin', NULL, '2021-03-24 02:04:16', '2021-03-24 02:04:16'),
(10, 'admin.edit', 'admin', 'admin', NULL, '2021-03-24 02:04:16', '2021-03-24 02:04:16'),
(11, 'admin.delete', 'admin', 'admin', NULL, '2021-03-24 02:04:16', '2021-03-24 02:04:16'),
(12, 'admin.approve', 'admin', 'admin', NULL, '2021-03-24 02:04:16', '2021-03-24 02:04:16'),
(13, 'role.create', 'admin', 'role', NULL, '2021-03-24 02:04:16', '2021-03-24 02:04:16'),
(14, 'role.view', 'admin', 'role', NULL, '2021-03-24 02:04:16', '2021-03-24 02:04:16'),
(15, 'role.edit', 'admin', 'role', NULL, '2021-03-24 02:04:17', '2021-03-24 02:04:17'),
(16, 'role.delete', 'admin', 'role', NULL, '2021-03-24 02:04:17', '2021-03-24 02:04:17'),
(17, 'role.approve', 'admin', 'role', NULL, '2021-03-24 02:04:17', '2021-03-24 02:04:17'),
(18, 'profile.view', 'admin', 'profile', NULL, '2021-03-24 02:04:17', '2021-03-24 02:04:17'),
(19, 'profile.edit', 'admin', 'profile', NULL, '2021-03-24 02:04:17', '2021-03-24 02:04:17'),
(20, 'permission.create', 'admin', 'permission', NULL, NULL, NULL),
(21, 'permission.view', 'admin', 'permission', NULL, NULL, NULL),
(22, 'permission.edit', 'admin', 'permission', NULL, NULL, NULL),
(23, 'permission.delete', 'admin', 'permission', NULL, NULL, NULL),
(25, 'system_information_add', 'admin', 'system_information', 'admin/system_information_add', NULL, NULL),
(26, 'system_information_view', 'admin', 'system_information', 'admin/system_information_view', NULL, NULL),
(27, 'system_information_delete', 'admin', 'system_information', 'admin/system_information_delete', NULL, NULL),
(28, 'system_information_update', 'admin', 'system_information', 'admin/system_information_update', NULL, NULL),
(164, 'WalkByPatientAdd', 'admin', 'WalkByPatient', 'admin/WalkByPatientAdd', NULL, NULL),
(165, 'WalkByPatientView', 'admin', 'WalkByPatient', 'admin/WalkByPatientView', NULL, NULL),
(166, 'WalkByPatientDelete', 'admin', 'WalkByPatient', 'admin/WalkByPatientDelete', NULL, NULL),
(167, 'WalkByPatientUpdate', 'admin', 'WalkByPatient', 'admin/WalkByPatientUpdate', NULL, NULL),
(168, 'PatientAdd', 'admin', 'Patient', 'admin/PatientAdd', NULL, NULL),
(169, 'PatientView', 'admin', 'Patient', 'admin/PatientView', NULL, NULL),
(170, 'PatientDelete', 'admin', 'Patient', 'admin/PatientDelete', NULL, NULL),
(171, 'PatientUpdate', 'admin', 'Patient', 'admin/PatientUpdate', NULL, NULL),
(172, 'PatientAdmitAdd', 'admin', 'PatientAdmit', 'admin/PatientAdmitAdd', NULL, NULL),
(173, 'PatientAdmitView', 'admin', 'PatientAdmit', 'admin/PatientAdmitView', NULL, NULL),
(174, 'PatientAdmitDelete', 'admin', 'PatientAdmit', 'admin/PatientAdmitDelete', NULL, NULL),
(175, 'PatientAdmitUpdate', 'admin', 'PatientAdmit', 'admin/PatientAdmitUpdate', NULL, NULL),
(176, 'doctorAdd', 'admin', 'doctor', 'admin/doctorAdd', NULL, NULL),
(177, 'doctorView', 'admin', 'doctor', 'admin/doctorView', NULL, NULL),
(178, 'doctorDelete', 'admin', 'doctor', 'admin/doctorDelete', NULL, NULL),
(179, 'doctorUpdate', 'admin', 'doctor', 'admin/doctorUpdate', NULL, NULL),
(180, 'dietChartsAdd', 'admin', 'dietCharts', 'admin/dietChartsAdd', NULL, NULL),
(181, 'dietChartsView', 'admin', 'dietCharts', 'admin/dietChartsView', NULL, NULL),
(182, 'dietChartsUpdate', 'admin', 'dietCharts', 'admin/dietChartsUpdate', NULL, NULL),
(183, 'dietChartsDelete', 'admin', 'dietCharts', 'admin/dietChartsDelete', NULL, NULL),
(184, 'medicineListsAdd', 'admin', 'medicineLists', 'admin/medicineListsAdd', NULL, NULL),
(185, 'medicineListsView', 'admin', 'medicineLists', 'admin/medicineListsView', NULL, NULL),
(186, 'medicineListsDelete', 'admin', 'medicineLists', 'admin/medicineListsDelete', NULL, NULL),
(187, 'medicineListsUpdate', 'admin', 'medicineLists', 'admin/medicineListsUpdate', NULL, NULL),
(188, 'healthSupplementsAdd', 'admin', 'healthSupplements', 'admin/healthSupplementsAdd', NULL, NULL),
(189, 'healthSupplementsView', 'admin', 'healthSupplements', 'admin/healthSupplementsView', NULL, NULL),
(190, 'healthSupplementsDelete', 'admin', 'healthSupplements', 'admin/healthSupplementsDelete', NULL, NULL),
(191, 'healthSupplementsUpdate', 'admin', 'healthSupplements', 'admin/healthSupplementsUpdate', NULL, NULL),
(192, 'therapyListsAdd', 'admin', 'therapyLists', 'admin/therapyListsAdd', NULL, NULL),
(193, 'therapyListsView', 'admin', 'therapyLists', 'admin/therapyListsView', NULL, NULL),
(194, 'therapyListsDelete', 'admin', 'therapyLists', 'admin/therapyListsDelete', NULL, NULL),
(195, 'therapyListsUpdate', 'admin', 'therapyLists', 'admin/therapyListsUpdate', NULL, NULL),
(196, 'therapyIngredientsAdd', 'admin', 'therapyIngredients', 'admin/therapyIngredientsAdd', NULL, NULL),
(197, 'therapyIngredientsView', 'admin', 'therapyIngredients', 'admin/therapyIngredientsView', NULL, NULL),
(198, 'therapyIngredientsDelete', 'admin', 'therapyIngredients', 'admin/therapyIngredientsDelete', NULL, NULL),
(199, 'therapyIngredientsUpdate', 'admin', 'therapyIngredients', 'admin/therapyIngredientsUpdate', NULL, NULL),
(200, 'staffAdd', 'admin', 'staff', 'admin/staffAdd', NULL, NULL),
(201, 'staffView', 'admin', 'staff', 'admin/staffView', NULL, NULL),
(202, 'staffUpdate', 'admin', 'staff', 'admin/staffUpdate', NULL, NULL),
(203, 'staffDelete', 'admin', 'staff', 'admin/staffDelete', NULL, NULL),
(204, 'rewardAdd', 'admin', 'reward', 'admin/rewardAdd', NULL, NULL),
(205, 'rewardView', 'admin', 'reward', 'admin/rewardView', NULL, NULL),
(206, 'rewardUpdate', 'admin', 'reward', 'admin/rewardUpdate', NULL, NULL),
(207, 'rewardDelete', 'admin', 'reward', 'admin/rewardDelete', NULL, NULL),
(208, 'therapistAdd', 'admin', 'therapist', 'admin/therapistAdd', NULL, NULL),
(209, 'therapistView', 'admin', 'therapist', 'admin/therapistView', NULL, NULL),
(210, 'therapistUpdate', 'admin', 'therapist', 'admin/therapistUpdate', NULL, NULL),
(211, 'therapistDelete', 'admin', 'therapist', 'admin/therapistDelete', NULL, NULL),
(212, 'doctorAppointmentAdd', 'admin', 'doctorAppointment', 'admin/doctorAppointmentAdd', NULL, NULL),
(213, 'doctorAppointmentView', 'admin', 'doctorAppointment', 'admin/doctorAppointmentView', NULL, NULL),
(214, 'doctorAppointmentDelete', 'admin', 'doctorAppointment', 'admin/doctorAppointmentDelete', NULL, NULL),
(215, 'doctorAppointmentUpdate', 'admin', 'doctorAppointment', 'admin/doctorAppointmentUpdate', NULL, NULL),
(216, 'therapyAppointmentAdd', 'admin', 'therapyAppointment', 'admin/therapyAppointmentAdd', NULL, NULL),
(217, 'therapyAppointmentView', 'admin', 'therapyAppointment', 'admin/therapyAppointmentView', NULL, NULL),
(218, 'therapyAppointmentDelete', 'admin', 'therapyAppointment', 'admin/therapyAppointmentDelete', NULL, NULL),
(219, 'therapyAppointmentUpdate', 'admin', 'therapyAppointment', 'admin/therapyAppointmentUpdate', NULL, NULL),
(220, 'doctorWaitingListAdd', 'admin', 'doctorWaitingList', 'admin/doctorWaitingListAdd', NULL, NULL),
(221, 'doctorWaitingListView', 'admin', 'doctorWaitingList', 'admin/doctorWaitingListView', NULL, NULL),
(222, 'doctorWaitingListDelete', 'admin', 'doctorWaitingList', 'admin/doctorWaitingListDelete', NULL, NULL),
(223, 'doctorWaitingListUpdate', 'admin', 'doctorWaitingList', 'admin/doctorWaitingListUpdate', NULL, NULL),
(224, 'patientPrescriptionListAdd', 'admin', 'patientPrescriptionList', 'admin/patientPrescriptionListAdd', NULL, NULL),
(225, 'patientPrescriptionListView', 'admin', 'patientPrescriptionList', 'admin/patientPrescriptionListView', NULL, NULL),
(226, 'patientPrescriptionListDelete', 'admin', 'patientPrescriptionList', 'admin/patientPrescriptionListDelete', NULL, NULL),
(227, 'patientPrescriptionListUpdate', 'admin', 'patientPrescriptionList', 'admin/patientPrescriptionListUpdate', NULL, NULL),
(228, 'BillingAdd', 'admin', 'Billing', 'admin/BillingAdd', NULL, NULL),
(229, 'BillingView', 'admin', 'Billing', 'admin/BillingView', NULL, NULL),
(230, 'BillingDelete', 'admin', 'Billing', 'admin/BillingDelete', NULL, NULL),
(231, 'BillingUpdate', 'admin', 'Billing', 'admin/BillingUpdate', NULL, NULL),
(232, 'revisedBillingAdd', 'admin', 'RevisedBilling', 'admin/revisedBillingAdd', NULL, NULL),
(233, 'revisedBillingView', 'admin', 'RevisedBilling', 'admin/revisedBillingView', NULL, NULL),
(234, 'revisedBillingDelete', 'admin', 'RevisedBilling', 'admin/revisedBillingDelete', NULL, NULL),
(235, 'revisedBillingUpdate', 'admin', 'RevisedBilling', 'admin/revisedBillingUpdate', NULL, NULL),
(236, 'walkByPatientTherapyAdd', 'admin', 'walkByPatientTherapy', 'admin/walkByPatientTherapyAdd', NULL, NULL),
(237, 'walkByPatientTherapyView', 'admin', 'walkByPatientTherapy', 'admin/walkByPatientTherapyView', NULL, NULL),
(238, 'walkByPatientTherapyDelete', 'admin', 'walkByPatientTherapy', 'admin/walkByPatientTherapyDelete', NULL, NULL),
(239, 'walkByPatientTherapyUpdate', 'admin', 'walkByPatientTherapy', 'admin/walkByPatientTherapyUpdate', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `personal_access_tokens`
--

CREATE TABLE `personal_access_tokens` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `tokenable_type` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tokenable_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `token` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  `abilities` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `last_used_at` timestamp NULL DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `reward_for` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `point` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `in_exchange` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `rewards`
--

INSERT INTO `rewards` (`id`, `name`, `reward_for`, `point`, `in_exchange`, `amount`, `created_at`, `updated_at`) VALUES
(1, 'Bosun', 'For Product', '77', '77', '77', '2023-03-22 00:29:57', '2023-03-22 00:29:57');

-- --------------------------------------------------------

--
-- Table structure for table `roles`
--

CREATE TABLE `roles` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `guard_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `roles`
--

INSERT INTO `roles` (`id`, `name`, `guard_name`, `created_at`, `updated_at`) VALUES
(1, 'superadmin', 'admin', '2021-03-24 02:04:14', '2021-03-24 02:04:14'),
(2, 'therapist', 'admin', '2021-03-24 02:04:14', '2023-03-21 05:11:13'),
(3, 'doctor', 'admin', '2021-03-24 02:04:14', '2023-03-28 00:11:21');

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
(1, 2),
(1, 3),
(2, 1),
(2, 2),
(2, 3),
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
(18, 2),
(18, 3),
(19, 1),
(19, 2),
(19, 3),
(20, 1),
(21, 1),
(22, 1),
(23, 1),
(25, 1),
(26, 1),
(27, 1),
(28, 1),
(164, 1),
(165, 1),
(166, 1),
(167, 1),
(168, 1),
(169, 1),
(170, 1),
(171, 1),
(172, 1),
(173, 1),
(174, 1),
(175, 1),
(176, 1),
(177, 1),
(178, 1),
(179, 1),
(180, 1),
(181, 1),
(182, 1),
(183, 1),
(184, 1),
(185, 1),
(186, 1),
(187, 1),
(188, 1),
(189, 1),
(190, 1),
(191, 1),
(192, 1),
(193, 1),
(194, 1),
(195, 1),
(196, 1),
(197, 1),
(198, 1),
(199, 1),
(200, 1),
(201, 1),
(202, 1),
(203, 1),
(204, 1),
(205, 1),
(206, 1),
(207, 1),
(208, 1),
(209, 1),
(210, 1),
(211, 1),
(212, 1),
(213, 1),
(214, 1),
(215, 1),
(216, 1),
(217, 1),
(218, 1),
(219, 1),
(220, 1),
(221, 1),
(222, 1),
(223, 1),
(224, 1),
(225, 1),
(226, 1),
(227, 1),
(228, 1),
(229, 1),
(230, 1),
(231, 1),
(232, 1),
(233, 1),
(234, 1),
(235, 1),
(236, 1),
(237, 1),
(238, 1),
(239, 1);

-- --------------------------------------------------------

--
-- Table structure for table `staff`
--

CREATE TABLE `staff` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_or_mobile_number` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid_number` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `years_of_experience` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `system_information`
--

CREATE TABLE `system_information` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `logo` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `icon` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `System_Name` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Phone` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Email` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `Address` varchar(255) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `system_information`
--

INSERT INTO `system_information` (`id`, `logo`, `icon`, `System_Name`, `Phone`, `Email`, `Address`, `created_at`, `updated_at`) VALUES
(1, 'public/uploads/1679294912.png', 'public/uploads/1679294912.ico', 'Ayurveda', '777', 'a@gmail.com', 'Dhaka', '2022-02-07 04:03:26', '2023-03-20 00:48:32');

-- --------------------------------------------------------

--
-- Table structure for table `therapists`
--

CREATE TABLE `therapists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_or_mobile_number` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid_number` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `dob` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `years_of_experience` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `therapists`
--

INSERT INTO `therapists` (`id`, `admin_id`, `name`, `email`, `phone_or_mobile_number`, `address`, `nid_number`, `nationality`, `dob`, `years_of_experience`, `created_at`, `updated_at`) VALUES
(1, 1, 'rI7LvUz0mV', 'V3JdPzss3H', '6N7YChjWAh', '24gHZPWNai', 'nXf5QcZkyg', 'kWCyv3tFJW', '2023-03-23', 'duHor6QyRK', '2023-03-22 00:16:19', '2023-03-22 00:16:19');

-- --------------------------------------------------------

--
-- Table structure for table `therapy_appointments`
--

CREATE TABLE `therapy_appointments` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `patient_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `therapy_appointments`
--

INSERT INTO `therapy_appointments` (`id`, `admin_id`, `patient_id`, `created_at`, `updated_at`) VALUES
(3, 1, '220323104649', '2023-03-29 08:49:35', '2023-03-29 08:49:35'),
(4, 1, '2603231679808261', '2023-03-30 01:00:12', '2023-03-30 01:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `therapy_appointment_date_and_times`
--

CREATE TABLE `therapy_appointment_date_and_times` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `therapy_appointment_id` bigint(20) UNSIGNED NOT NULL,
  `therapist` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `therapy` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `date` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `start_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `end_time` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `serial` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `status` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `patient_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `admin_id` varchar(50) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `therapy_appointment_date_and_times`
--

INSERT INTO `therapy_appointment_date_and_times` (`id`, `therapy_appointment_id`, `therapist`, `therapy`, `date`, `start_time`, `end_time`, `serial`, `status`, `patient_id`, `admin_id`, `created_at`, `updated_at`) VALUES
(1, 3, '1', 'kajol', '2023-03-29', '20:49', '20:49', '1', NULL, '220323104649', '1', '2023-03-29 08:49:35', '2023-03-29 08:49:35'),
(2, 3, '1', 'kajol', '2023-03-30', '20:49', '20:49', '1', NULL, '220323104649', '1', '2023-03-29 08:49:35', '2023-03-29 08:49:35'),
(3, 4, '1', 'kajol', '2023-03-30', '13:59', '15:59', '2', NULL, '2603231679808261', '1', '2023-03-30 01:00:12', '2023-03-30 01:00:12'),
(4, 4, '1', 'kajol', '2023-03-30', '14:59', '02:59', '2', NULL, '2603231679808261', '1', '2023-03-30 01:00:12', '2023-03-30 01:00:12'),
(5, 4, '1', 'kajol', '2023-03-30', '14:59', '13:59', '2', NULL, '2603231679808261', '1', '2023-03-30 01:00:12', '2023-03-30 01:00:12'),
(6, 4, '1', 'kajol', '2023-03-30', '17:03', '14:59', '2', NULL, '2603231679808261', '1', '2023-03-30 01:00:12', '2023-03-30 01:00:12'),
(7, 4, '1', 'kajol', '2023-03-30', '13:59', '13:59', '2', NULL, '2603231679808261', '1', '2023-03-30 01:00:12', '2023-03-30 01:00:12'),
(8, 4, '1', 'kajol', '2023-03-30', '16:59', '15:00', '2', NULL, '2603231679808261', '1', '2023-03-30 01:00:12', '2023-03-30 01:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `therapy_appointment_details`
--

CREATE TABLE `therapy_appointment_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `therapy_appointment_id` bigint(20) UNSIGNED NOT NULL,
  `therapy_name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `therapy_appointment_details`
--

INSERT INTO `therapy_appointment_details` (`id`, `therapy_appointment_id`, `therapy_name`, `name`, `amount`, `created_at`, `updated_at`) VALUES
(1, 3, '1', 'Bosun', '3gram', '2023-03-29 08:49:35', '2023-03-29 08:49:35'),
(2, 3, '1', 'trtt', '65liter', '2023-03-29 08:49:35', '2023-03-29 08:49:35'),
(3, 3, '1', 'Bosun', '3gram', '2023-03-29 08:49:35', '2023-03-29 08:49:35'),
(4, 3, '1', 'trtt', '65liter', '2023-03-29 08:49:35', '2023-03-29 08:49:35'),
(5, 4, '1', 'Bosun', '3gram', '2023-03-30 01:00:12', '2023-03-30 01:00:12'),
(6, 4, '1', 'trtt', '65liter', '2023-03-30 01:00:12', '2023-03-30 01:00:12'),
(7, 4, '1', 'Bosun', '3gram', '2023-03-30 01:00:12', '2023-03-30 01:00:12'),
(8, 4, '1', 'trtt', '65liter', '2023-03-30 01:00:12', '2023-03-30 01:00:12');

-- --------------------------------------------------------

--
-- Table structure for table `therapy_details`
--

CREATE TABLE `therapy_details` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `therapy_list_id` bigint(20) UNSIGNED NOT NULL,
  `therapy_ingredient_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `unit` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `therapy_details`
--

INSERT INTO `therapy_details` (`id`, `therapy_list_id`, `therapy_ingredient_id`, `quantity`, `unit`, `created_at`, `updated_at`) VALUES
(3, 1, 2, '3', 'gram', '2023-03-21 04:26:33', '2023-03-21 04:26:33'),
(4, 1, 1, '65', 'liter', '2023-03-21 04:26:33', '2023-03-21 04:26:33');

-- --------------------------------------------------------

--
-- Table structure for table `therapy_ingredients`
--

CREATE TABLE `therapy_ingredients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `therapy_ingredients`
--

INSERT INTO `therapy_ingredients` (`id`, `name`, `created_at`, `updated_at`) VALUES
(1, 'trtt', '2023-03-21 03:26:44', '2023-03-21 03:26:44'),
(2, 'Bosun', '2023-03-21 03:26:52', '2023-03-21 03:26:52');

-- --------------------------------------------------------

--
-- Table structure for table `therapy_lists`
--

CREATE TABLE `therapy_lists` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `amount` varchar(150) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `therapy_lists`
--

INSERT INTO `therapy_lists` (`id`, `name`, `amount`, `created_at`, `updated_at`) VALUES
(1, 'kajol', NULL, '2023-03-21 03:58:27', '2023-03-21 03:58:27');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `image` text COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `email` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_verified_at` timestamp NULL DEFAULT NULL,
  `password` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `remember_token` varchar(100) COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL,
  `is_email_verified` tinyint(1) DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `phone`, `address`, `image`, `email`, `email_verified_at`, `password`, `remember_token`, `created_at`, `updated_at`, `is_email_verified`) VALUES
(13, 'k_new', '01646735100', NULL, NULL, 'kajolkamruzzaman.cse@gmail.com', NULL, '$2y$10$EoUB6e9kq92ktYkkE2eTLu5qv4mkNhHcj42a97zQdoWB/pJuidspm', NULL, '2023-03-04 02:15:40', '2023-03-04 02:16:11', 1),
(23, 'Nir Rony Hossain', '017383990888', NULL, NULL, 'ronyhossain1920@gmail.com', NULL, '$2y$10$HS4JUlz3hFCUtkmzdwxPFOtyoJgwDBu9VMZOvablGYXRQ2qE2LM36', NULL, '2023-03-12 05:16:52', '2023-03-12 05:56:37', 1),
(24, 'Kamruzzaman kajol', '01646735100', NULL, NULL, 'kkajol428@gmail.com', NULL, '$2y$10$PnnoE9frIbaFD6TR4a.zGeR/d8OOSpSsQZFi2NsyM8npyP3x6xC7C', NULL, '2023-03-12 10:36:04', '2023-03-12 10:36:37', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users_verify`
--

CREATE TABLE `users_verify` (
  `user_id` int(11) NOT NULL,
  `token` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `users_verify`
--

INSERT INTO `users_verify` (`user_id`, `token`, `created_at`, `updated_at`) VALUES
(1, 'EfqG6pUFQU', '2023-02-19 09:52:33', '2023-02-19 09:52:33'),
(2, 'hqfSIEDXjF', '2023-02-19 09:55:39', '2023-02-19 09:55:39'),
(3, 'glGVZiQPG0', '2023-02-19 10:00:03', '2023-02-19 10:00:03'),
(4, '16wutrzjPW', '2023-02-19 10:05:42', '2023-02-19 10:05:42'),
(5, 'BuSvDx6R0G', '2023-02-19 10:30:11', '2023-02-19 10:30:11'),
(6, 'TEg9L2WqxS', '2023-02-19 10:37:25', '2023-02-19 10:37:25'),
(7, 'uxCSsk54mA', '2023-02-19 23:04:28', '2023-02-19 23:04:28'),
(8, 'VOI21l1rfl', '2023-02-19 23:09:19', '2023-02-19 23:09:19'),
(9, 'jXy9A1kBPB', '2023-02-19 23:13:50', '2023-02-19 23:13:50'),
(10, 'B9rzkd5T1t', '2023-02-19 23:17:38', '2023-02-19 23:17:38'),
(11, 'YEtBDtIIWZ', '2023-02-19 23:26:27', '2023-02-19 23:26:27'),
(12, '89aOc5xOY2', '2023-02-26 02:56:58', '2023-02-26 02:56:58'),
(13, 'w2uc4Wx2ZL', '2023-03-04 02:15:40', '2023-03-04 02:15:40'),
(16, 'uWAA5VGzfI', '2023-03-11 00:25:08', '2023-03-11 00:25:08'),
(17, 'oDBVOqBw5K', '2023-03-11 03:01:37', '2023-03-11 03:01:37'),
(18, 'iImHP5nul6', '2023-03-11 03:36:10', '2023-03-11 03:36:10'),
(19, 'e1RHKHD0z2', '2023-03-11 03:39:16', '2023-03-11 03:39:16'),
(20, 'bi8vThyQ32', '2023-03-11 04:30:26', '2023-03-11 04:30:26'),
(21, 'qW0nl4m8N8', '2023-03-11 10:09:09', '2023-03-11 10:09:09'),
(22, 'dqunRpfn7c', '2023-03-11 10:11:00', '2023-03-11 10:11:00'),
(23, '5LmkhAJM9D', '2023-03-12 05:16:52', '2023-03-12 05:16:52'),
(24, 'UoR7ukUxqn', '2023-03-12 10:36:04', '2023-03-12 10:36:04');

-- --------------------------------------------------------

--
-- Table structure for table `walk_by_patients`
--

CREATE TABLE `walk_by_patients` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `image` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `admin_id` bigint(20) UNSIGNED NOT NULL,
  `patient_reg_id` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `refer_from` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `age` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `gender` varchar(20) COLLATE utf8mb4_unicode_ci NOT NULL,
  `address` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `email_address` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone_or_mobile_number` varchar(11) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nid_number` varchar(25) COLLATE utf8mb4_unicode_ci NOT NULL,
  `nationality` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `how_did_you_come_to_know_about_this_center` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `do_you_have_earlier_experience_of_ayurveda_please_give_details` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `do_you_have_symptoms_in_past_one_weak` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `covid_test_result` varchar(10) COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `walk_by_patients`
--

INSERT INTO `walk_by_patients` (`id`, `image`, `admin_id`, `patient_reg_id`, `name`, `refer_from`, `age`, `gender`, `address`, `email_address`, `phone_or_mobile_number`, `nid_number`, `nationality`, `how_did_you_come_to_know_about_this_center`, `do_you_have_earlier_experience_of_ayurveda_please_give_details`, `do_you_have_symptoms_in_past_one_weak`, `covid_test_result`, `created_at`, `updated_at`) VALUES
(2, 'public/uploads/banner1.png', 1, '220323092352', 'F6idQ3M1Bs', 'RIBDewaNUD', 'tep3rwuHoh', 'Male', '1SQeTB1pli', 'qqgjt@ilvz.com', 'tMLYSCeR3E', 'ugomc@hur7.com', 'zytyuZDZ9N', 'siUgh7729c', 'gXoiTcYWmX', 'S6TVupGu2y', 'Yes', '2023-03-22 02:58:46', '2023-03-22 03:23:52');

-- --------------------------------------------------------

--
-- Table structure for table `walk_by_patient_services`
--

CREATE TABLE `walk_by_patient_services` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `walk_by_patient_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(255) COLLATE utf8mb4_unicode_ci NOT NULL,
  `detail` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NULL DEFAULT NULL,
  `updated_at` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `walk_by_patient_services`
--

INSERT INTO `walk_by_patient_services` (`id`, `walk_by_patient_id`, `name`, `detail`, `created_at`, `updated_at`) VALUES
(5, 2, 'Hepatitis B positive', 'l6mWu4K0tU', '2023-03-26 00:08:50', '2023-03-26 00:08:50'),
(6, 2, 'Chronic illness', 'rDavTsO3zv', '2023-03-26 00:08:51', '2023-03-26 00:08:51');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admins`
--
ALTER TABLE `admins`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `admins_email_unique` (`email`),
  ADD UNIQUE KEY `admins_username_unique` (`username`);

--
-- Indexes for table `bills`
--
ALTER TABLE `bills`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bills_admin_id_foreign` (`admin_id`),
  ADD KEY `bills_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `diet_charts`
--
ALTER TABLE `diet_charts`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `doctors`
--
ALTER TABLE `doctors`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctors_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `doctor_appointments`
--
ALTER TABLE `doctor_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_appointments_admin_id_foreign` (`admin_id`),
  ADD KEY `doctor_appointments_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `doctor_consult_dates`
--
ALTER TABLE `doctor_consult_dates`
  ADD PRIMARY KEY (`id`),
  ADD KEY `doctor_consult_dates_doctor_id_foreign` (`doctor_id`);

--
-- Indexes for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `failed_jobs_uuid_unique` (`uuid`);

--
-- Indexes for table `health_supplements`
--
ALTER TABLE `health_supplements`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `medicines`
--
ALTER TABLE `medicines`
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
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD KEY `password_resets_email_index` (`email`);

--
-- Indexes for table `patients`
--
ALTER TABLE `patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patients_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `patient_admits`
--
ALTER TABLE `patient_admits`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_admits_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `patient_files`
--
ALTER TABLE `patient_files`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_files_patient_id_foreign` (`patient_id`);

--
-- Indexes for table `patient_herbs`
--
ALTER TABLE `patient_herbs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_herbs_doctor_id_foreign` (`doctor_id`),
  ADD KEY `patient_herbs_doctor_appointment_id_foreign` (`doctor_appointment_id`),
  ADD KEY `patient_herbs_patient_history_id_foreign` (`patient_history_id`);

--
-- Indexes for table `patient_histories`
--
ALTER TABLE `patient_histories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_histories_admin_id_foreign` (`admin_id`),
  ADD KEY `patient_histories_doctor_id_foreign` (`doctor_id`),
  ADD KEY `patient_histories_doctor_appointment_id_foreign` (`doctor_appointment_id`);

--
-- Indexes for table `patient_medical_supplements`
--
ALTER TABLE `patient_medical_supplements`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_medical_supplements_doctor_id_foreign` (`doctor_id`),
  ADD KEY `patient_medical_supplements_doctor_appointment_id_foreign` (`doctor_appointment_id`),
  ADD KEY `patient_medical_supplements_patient_history_id_foreign` (`patient_history_id`);

--
-- Indexes for table `patient_therapies`
--
ALTER TABLE `patient_therapies`
  ADD PRIMARY KEY (`id`),
  ADD KEY `patient_therapies_doctor_id_foreign` (`doctor_id`),
  ADD KEY `patient_therapies_doctor_appointment_id_foreign` (`doctor_appointment_id`),
  ADD KEY `patient_therapies_patient_history_id_foreign` (`patient_history_id`);

--
-- Indexes for table `payments`
--
ALTER TABLE `payments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `payments_bill_id_foreign` (`bill_id`);

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
  ADD KEY `personal_access_tokens_tokenable_type_tokenable_id_index` (`tokenable_type`,`tokenable_id`);

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

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
-- Indexes for table `staff`
--
ALTER TABLE `staff`
  ADD PRIMARY KEY (`id`),
  ADD KEY `staff_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `system_information`
--
ALTER TABLE `system_information`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `therapists`
--
ALTER TABLE `therapists`
  ADD PRIMARY KEY (`id`),
  ADD KEY `therapists_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `therapy_appointments`
--
ALTER TABLE `therapy_appointments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `therapy_appointments_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `therapy_appointment_date_and_times`
--
ALTER TABLE `therapy_appointment_date_and_times`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `therapy_appointment_details`
--
ALTER TABLE `therapy_appointment_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `therapy_appointment_details_therapy_appointment_id_foreign` (`therapy_appointment_id`);

--
-- Indexes for table `therapy_details`
--
ALTER TABLE `therapy_details`
  ADD PRIMARY KEY (`id`),
  ADD KEY `therapy_details_therapy_list_id_foreign` (`therapy_list_id`),
  ADD KEY `therapy_details_therapy_ingredient_id_foreign` (`therapy_ingredient_id`);

--
-- Indexes for table `therapy_ingredients`
--
ALTER TABLE `therapy_ingredients`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `therapy_lists`
--
ALTER TABLE `therapy_lists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `users_email_unique` (`email`);

--
-- Indexes for table `walk_by_patients`
--
ALTER TABLE `walk_by_patients`
  ADD PRIMARY KEY (`id`),
  ADD KEY `walk_by_patients_admin_id_foreign` (`admin_id`);

--
-- Indexes for table `walk_by_patient_services`
--
ALTER TABLE `walk_by_patient_services`
  ADD PRIMARY KEY (`id`),
  ADD KEY `walk_by_patient_services_walk_by_patient_id_foreign` (`walk_by_patient_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admins`
--
ALTER TABLE `admins`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `bills`
--
ALTER TABLE `bills`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `diet_charts`
--
ALTER TABLE `diet_charts`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `doctors`
--
ALTER TABLE `doctors`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `doctor_appointments`
--
ALTER TABLE `doctor_appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `doctor_consult_dates`
--
ALTER TABLE `doctor_consult_dates`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `failed_jobs`
--
ALTER TABLE `failed_jobs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `health_supplements`
--
ALTER TABLE `health_supplements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `medicines`
--
ALTER TABLE `medicines`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `migrations`
--
ALTER TABLE `migrations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=82;

--
-- AUTO_INCREMENT for table `patients`
--
ALTER TABLE `patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient_admits`
--
ALTER TABLE `patient_admits`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient_files`
--
ALTER TABLE `patient_files`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `patient_herbs`
--
ALTER TABLE `patient_herbs`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `patient_histories`
--
ALTER TABLE `patient_histories`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient_medical_supplements`
--
ALTER TABLE `patient_medical_supplements`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `patient_therapies`
--
ALTER TABLE `patient_therapies`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `payments`
--
ALTER TABLE `payments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `permissions`
--
ALTER TABLE `permissions`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=240;

--
-- AUTO_INCREMENT for table `personal_access_tokens`
--
ALTER TABLE `personal_access_tokens`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `roles`
--
ALTER TABLE `roles`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `staff`
--
ALTER TABLE `staff`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `therapists`
--
ALTER TABLE `therapists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `therapy_appointments`
--
ALTER TABLE `therapy_appointments`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `therapy_appointment_date_and_times`
--
ALTER TABLE `therapy_appointment_date_and_times`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `therapy_appointment_details`
--
ALTER TABLE `therapy_appointment_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `therapy_details`
--
ALTER TABLE `therapy_details`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `therapy_ingredients`
--
ALTER TABLE `therapy_ingredients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `therapy_lists`
--
ALTER TABLE `therapy_lists`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `walk_by_patients`
--
ALTER TABLE `walk_by_patients`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `walk_by_patient_services`
--
ALTER TABLE `walk_by_patient_services`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bills`
--
ALTER TABLE `bills`
  ADD CONSTRAINT `bills_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `bills_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

--
-- Constraints for table `doctors`
--
ALTER TABLE `doctors`
  ADD CONSTRAINT `doctors_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `doctor_appointments`
--
ALTER TABLE `doctor_appointments`
  ADD CONSTRAINT `doctor_appointments_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `doctor_appointments_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

--
-- Constraints for table `doctor_consult_dates`
--
ALTER TABLE `doctor_consult_dates`
  ADD CONSTRAINT `doctor_consult_dates_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

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
-- Constraints for table `patients`
--
ALTER TABLE `patients`
  ADD CONSTRAINT `patients_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `patient_admits`
--
ALTER TABLE `patient_admits`
  ADD CONSTRAINT `patient_admits_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `patient_files`
--
ALTER TABLE `patient_files`
  ADD CONSTRAINT `patient_files_patient_id_foreign` FOREIGN KEY (`patient_id`) REFERENCES `patients` (`id`);

--
-- Constraints for table `patient_herbs`
--
ALTER TABLE `patient_herbs`
  ADD CONSTRAINT `patient_herbs_doctor_appointment_id_foreign` FOREIGN KEY (`doctor_appointment_id`) REFERENCES `doctor_appointments` (`id`),
  ADD CONSTRAINT `patient_herbs_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `patient_herbs_patient_history_id_foreign` FOREIGN KEY (`patient_history_id`) REFERENCES `patient_histories` (`id`);

--
-- Constraints for table `patient_histories`
--
ALTER TABLE `patient_histories`
  ADD CONSTRAINT `patient_histories_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`),
  ADD CONSTRAINT `patient_histories_doctor_appointment_id_foreign` FOREIGN KEY (`doctor_appointment_id`) REFERENCES `doctor_appointments` (`id`),
  ADD CONSTRAINT `patient_histories_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`);

--
-- Constraints for table `patient_medical_supplements`
--
ALTER TABLE `patient_medical_supplements`
  ADD CONSTRAINT `patient_medical_supplements_doctor_appointment_id_foreign` FOREIGN KEY (`doctor_appointment_id`) REFERENCES `doctor_appointments` (`id`),
  ADD CONSTRAINT `patient_medical_supplements_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `patient_medical_supplements_patient_history_id_foreign` FOREIGN KEY (`patient_history_id`) REFERENCES `patient_histories` (`id`);

--
-- Constraints for table `patient_therapies`
--
ALTER TABLE `patient_therapies`
  ADD CONSTRAINT `patient_therapies_doctor_appointment_id_foreign` FOREIGN KEY (`doctor_appointment_id`) REFERENCES `doctor_appointments` (`id`),
  ADD CONSTRAINT `patient_therapies_doctor_id_foreign` FOREIGN KEY (`doctor_id`) REFERENCES `doctors` (`id`),
  ADD CONSTRAINT `patient_therapies_patient_history_id_foreign` FOREIGN KEY (`patient_history_id`) REFERENCES `patient_histories` (`id`);

--
-- Constraints for table `payments`
--
ALTER TABLE `payments`
  ADD CONSTRAINT `payments_bill_id_foreign` FOREIGN KEY (`bill_id`) REFERENCES `bills` (`id`);

--
-- Constraints for table `staff`
--
ALTER TABLE `staff`
  ADD CONSTRAINT `staff_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `therapists`
--
ALTER TABLE `therapists`
  ADD CONSTRAINT `therapists_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `therapy_appointments`
--
ALTER TABLE `therapy_appointments`
  ADD CONSTRAINT `therapy_appointments_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `therapy_appointment_details`
--
ALTER TABLE `therapy_appointment_details`
  ADD CONSTRAINT `therapy_appointment_details_therapy_appointment_id_foreign` FOREIGN KEY (`therapy_appointment_id`) REFERENCES `therapy_appointments` (`id`);

--
-- Constraints for table `therapy_details`
--
ALTER TABLE `therapy_details`
  ADD CONSTRAINT `therapy_details_therapy_ingredient_id_foreign` FOREIGN KEY (`therapy_ingredient_id`) REFERENCES `therapy_ingredients` (`id`),
  ADD CONSTRAINT `therapy_details_therapy_list_id_foreign` FOREIGN KEY (`therapy_list_id`) REFERENCES `therapy_lists` (`id`);

--
-- Constraints for table `walk_by_patients`
--
ALTER TABLE `walk_by_patients`
  ADD CONSTRAINT `walk_by_patients_admin_id_foreign` FOREIGN KEY (`admin_id`) REFERENCES `admins` (`id`);

--
-- Constraints for table `walk_by_patient_services`
--
ALTER TABLE `walk_by_patient_services`
  ADD CONSTRAINT `walk_by_patient_services_walk_by_patient_id_foreign` FOREIGN KEY (`walk_by_patient_id`) REFERENCES `walk_by_patients` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
