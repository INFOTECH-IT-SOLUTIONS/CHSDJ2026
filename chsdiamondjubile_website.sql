-- phpMyAdmin SQL Dump
-- version 5.2.2
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3306
-- Generation Time: Oct 05, 2025 at 10:09 AM
-- Server version: 10.11.14-MariaDB
-- PHP Version: 8.4.10

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `chsdiamondjubile_website`
--

-- --------------------------------------------------------

--
-- Table structure for table `addon`
--

CREATE TABLE `addon` (
  `addon_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `currency` char(3) NOT NULL DEFAULT 'BDT',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `capacity` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `addon`
--

INSERT INTO `addon` (`addon_id`, `name`, `description`, `currency`, `price`, `capacity`, `is_active`, `created_at`) VALUES
(1, 'Gala Dinner', 'Dinner coupon for one person', 'BDT', 800.00, 2500, 1, '2025-09-25 06:03:10'),
(2, 'Extra T-Shirt', 'One extra T-shirt', 'BDT', 350.00, NULL, 1, '2025-09-25 06:03:10'),
(3, 'Accommodation (1 night)', 'Nearby partner hotel (double room share)', 'BDT', 2500.00, 200, 1, '2025-09-25 06:03:10');

-- --------------------------------------------------------

--
-- Table structure for table `admin_settings`
--

CREATE TABLE `admin_settings` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `welcome_text` varchar(200) NOT NULL,
  `welcome_subtitle` text NOT NULL,
  `keywords` varchar(255) NOT NULL,
  `result_request` int(10) UNSIGNED NOT NULL COMMENT 'The max number of shots per request',
  `status_page` enum('0','1') NOT NULL DEFAULT '1' COMMENT '0 Offline, 1 Online',
  `email_verification` enum('0','1') NOT NULL COMMENT '0 Off, 1 On',
  `email_no_reply` varchar(200) NOT NULL,
  `email_admin` varchar(200) NOT NULL,
  `captcha` enum('on','off') NOT NULL DEFAULT 'on',
  `file_size_allowed` int(11) UNSIGNED NOT NULL COMMENT 'Size in Bytes',
  `google_analytics` text NOT NULL,
  `paypal_account` varchar(200) NOT NULL,
  `twitter` varchar(200) NOT NULL,
  `facebook` varchar(200) NOT NULL,
  `googleplus` varchar(200) NOT NULL,
  `instagram` varchar(200) NOT NULL,
  `google_adsense` text NOT NULL,
  `currency_symbol` char(10) NOT NULL,
  `currency_code` varchar(20) NOT NULL,
  `min_donation_amount` int(11) UNSIGNED NOT NULL,
  `min_campaign_amount` int(11) UNSIGNED NOT NULL,
  `max_campaign_amount` int(11) UNSIGNED NOT NULL,
  `payment_gateway` enum('Paypal','Stripe') NOT NULL DEFAULT 'Paypal',
  `paypal_sandbox` enum('true','false') NOT NULL DEFAULT 'true',
  `min_width_height_image` varchar(100) NOT NULL,
  `fee_donation` int(10) UNSIGNED NOT NULL,
  `auto_approve_campaigns` enum('0','1') NOT NULL DEFAULT '1',
  `stripe_secret_key` varchar(255) NOT NULL,
  `stripe_public_key` varchar(255) NOT NULL,
  `max_donation_amount` int(10) UNSIGNED NOT NULL,
  `enable_paypal` enum('0','1') NOT NULL DEFAULT '0',
  `enable_stripe` enum('0','1') NOT NULL DEFAULT '0',
  `enable_bank_transfer` enum('0','1') NOT NULL DEFAULT '0',
  `bank_swift_code` varchar(250) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `branch_name` varchar(250) NOT NULL,
  `branch_address` varchar(250) NOT NULL,
  `account_name` varchar(250) NOT NULL,
  `iban` varchar(250) NOT NULL,
  `date_format` varchar(200) NOT NULL,
  `link_privacy` varchar(200) NOT NULL,
  `link_terms` varchar(200) NOT NULL,
  `currency_position` enum('left','right') NOT NULL DEFAULT 'left',
  `facebook_login` enum('on','off') NOT NULL DEFAULT 'off',
  `google_login` enum('on','off') NOT NULL DEFAULT 'off',
  `decimal_format` enum('comma','dot') NOT NULL DEFAULT 'dot',
  `registration_active` enum('on','off') NOT NULL DEFAULT 'on',
  `color_default` varchar(100) NOT NULL,
  `version` varchar(5) NOT NULL,
  `captcha_on_donations` enum('on','off') NOT NULL DEFAULT 'on',
  `status_pwa` tinyint(1) NOT NULL DEFAULT 0
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `admin_settings`
--

INSERT INTO `admin_settings` (`id`, `title`, `description`, `welcome_text`, `welcome_subtitle`, `keywords`, `result_request`, `status_page`, `email_verification`, `email_no_reply`, `email_admin`, `captcha`, `file_size_allowed`, `google_analytics`, `paypal_account`, `twitter`, `facebook`, `googleplus`, `instagram`, `google_adsense`, `currency_symbol`, `currency_code`, `min_donation_amount`, `min_campaign_amount`, `max_campaign_amount`, `payment_gateway`, `paypal_sandbox`, `min_width_height_image`, `fee_donation`, `auto_approve_campaigns`, `stripe_secret_key`, `stripe_public_key`, `max_donation_amount`, `enable_paypal`, `enable_stripe`, `enable_bank_transfer`, `bank_swift_code`, `account_number`, `branch_name`, `branch_address`, `account_name`, `iban`, `date_format`, `link_privacy`, `link_terms`, `currency_position`, `facebook_login`, `google_login`, `decimal_format`, `registration_active`, `color_default`, `version`, `captcha_on_donations`, `status_pwa`) VALUES
(1, 'Chandnapur High School’s Diamond Jubilee 2026', 'Chandnapur Secondary School’s Diamond Jubilee 2026\r\nWelcome to the grand celebration of 75 glorious years of Chandnapur Secondary School! Since its founding, the school has been a beacon of academic excellence, cultural pride, and community service. As we mark this historic milestone, we invite alumni, students, teachers, and well-wishers to join hands in honoring our rich legacy and shaping a brighter future together.', 'Chandnapur High School’s Diamond Jubilee 2026 ?60 Years of Knowledge, Leadership, and Inspiration. Let’s celebrate the journey of learning and achievements together!', 'Diamond Jubilee 2026 Chandnapur High School –60 Years of Legacy, Pride & Progress!', 'Crowdfunding,crowfund,fundme,campaign', 3, '1', '0', 'chsdiamondjublee2026@gmail.com', 'chsdiamondjublee2026@gmail.com', 'off', 5120, '', 'paypal@yousite.com', 'http://chsdiamondjubilee.info/', 'https://www.facebook.com/groups/chsdiamondjubilee2026', '', 'https://www.youtube.com/@chsdiamondjubilee2026', '', '$', 'USD', 5, 100, 1000000, 'Paypal', 'true', '800x400', 5, '1', '', '', 10000, '0', '0', '0', '', '', '', '', '', '', 'M d, Y', 'https://chsdiamondjubilee.info//p/privacy', 'https://chsdiamondjubilee.info//p/terms-of-service', 'left', 'off', 'off', 'dot', 'on', '#f45302', '5.5', 'off', 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `admin_user_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `email` varchar(190) NOT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `password_hash` varchar(255) NOT NULL,
  `role` enum('superadmin','finance','registrar','volunteer_lead','viewer') NOT NULL DEFAULT 'viewer',
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `alumni_detail`
--

CREATE TABLE `alumni_detail` (
  `participant_id` bigint(20) UNSIGNED NOT NULL,
  `ssc_passing_year` smallint(6) DEFAULT NULL,
  `group_stream` enum('Science','Arts','Commerce','Vocational','Other') DEFAULT NULL,
  `class_section` varchar(10) DEFAULT NULL,
  `roll_no` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `audit_log`
--

CREATE TABLE `audit_log` (
  `audit_id` bigint(20) UNSIGNED NOT NULL,
  `actor_admin_id` bigint(20) UNSIGNED DEFAULT NULL,
  `actor_participant_id` bigint(20) UNSIGNED DEFAULT NULL,
  `action` varchar(60) NOT NULL,
  `entity` varchar(60) NOT NULL,
  `entity_id` bigint(20) UNSIGNED NOT NULL,
  `old_data` longtext DEFAULT NULL,
  `new_data` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `batch_year`
--

CREATE TABLE `batch_year` (
  `batch_id` bigint(20) UNSIGNED NOT NULL,
  `year` smallint(6) NOT NULL,
  `group_stream` enum('Science','Arts','Commerce','Vocational','Other') DEFAULT 'Science',
  `title` varchar(120) DEFAULT NULL,
  `description` text DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `batch_year`
--

INSERT INTO `batch_year` (`batch_id`, `year`, `group_stream`, `title`, `description`) VALUES
(1, 1959, 'Science', 'SSC 1959 Science', NULL),
(2, 1960, 'Science', 'SSC 1960 Science', NULL),
(3, 1961, 'Science', 'SSC 1961 Science', NULL),
(4, 1962, 'Science', 'SSC 1962 Science', NULL),
(5, 1963, 'Science', 'SSC 1963 Science', NULL),
(6, 1964, 'Science', 'SSC 1964 Science', NULL),
(7, 1965, 'Science', 'SSC 1965 Science', NULL),
(8, 1966, 'Science', 'SSC 1966 Science', NULL),
(9, 1967, 'Science', 'SSC 1967 Science', NULL),
(10, 1968, 'Science', 'SSC 1968 Science', NULL),
(11, 1969, 'Science', 'SSC 1969 Science', NULL),
(12, 1970, 'Science', 'SSC 1970 Science', NULL),
(13, 1971, 'Science', 'SSC 1971 Science', NULL),
(14, 1972, 'Science', 'SSC 1972 Science', NULL),
(15, 1973, 'Science', 'SSC 1973 Science', NULL),
(16, 1974, 'Science', 'SSC 1974 Science', NULL),
(17, 1975, 'Science', 'SSC 1975 Science', NULL),
(18, 1976, 'Science', 'SSC 1976 Science', NULL),
(19, 1977, 'Science', 'SSC 1977 Science', NULL),
(20, 1978, 'Science', 'SSC 1978 Science', NULL),
(21, 1979, 'Science', 'SSC 1979 Science', NULL),
(22, 1980, 'Science', 'SSC 1980 Science', NULL),
(23, 1981, 'Science', 'SSC 1981 Science', NULL),
(24, 1982, 'Science', 'SSC 1982 Science', NULL),
(25, 1983, 'Science', 'SSC 1983 Science', NULL),
(26, 1984, 'Science', 'SSC 1984 Science', NULL),
(27, 1985, 'Science', 'SSC 1985 Science', NULL),
(28, 1986, 'Science', 'SSC 1986 Science', NULL),
(29, 1987, 'Science', 'SSC 1987 Science', NULL),
(30, 1988, 'Science', 'SSC 1988 Science', NULL),
(31, 1989, 'Science', 'SSC 1989 Science', NULL),
(32, 1990, 'Science', 'SSC 1990 Science', NULL),
(33, 1991, 'Science', 'SSC 1991 Science', NULL),
(34, 1992, 'Science', 'SSC 1992 Science', NULL),
(35, 1993, 'Science', 'SSC 1993 Science', NULL),
(36, 1994, 'Science', 'SSC 1994 Science', NULL),
(37, 1995, 'Science', 'SSC 1995 Science', NULL),
(38, 1996, 'Science', 'SSC 1996 Science', NULL),
(39, 1997, 'Science', 'SSC 1997 Science', NULL),
(40, 1998, 'Science', 'SSC 1998 Science', NULL),
(41, 1999, 'Science', 'SSC 1999 Science', NULL),
(42, 2000, 'Science', 'SSC 2000 Science', NULL),
(43, 2001, 'Science', 'SSC 2001 Science', NULL),
(44, 2002, 'Science', 'SSC 2002 Science', NULL),
(45, 2003, 'Science', 'SSC 2003 Science', NULL),
(46, 2004, 'Science', 'SSC 2004 Science', NULL),
(47, 2005, 'Science', 'SSC 2005 Science', NULL),
(48, 2006, 'Science', 'SSC 2006 Science', NULL),
(49, 2007, 'Science', 'SSC 2007 Science', NULL),
(50, 2008, 'Science', 'SSC 2008 Science', NULL),
(51, 2009, 'Science', 'SSC 2009 Science', NULL),
(52, 2010, 'Science', 'SSC 2010 Science', NULL),
(53, 2011, 'Science', 'SSC 2011 Science', NULL),
(54, 2012, 'Science', 'SSC 2012 Science', NULL),
(55, 2013, 'Science', 'SSC 2013 Science', NULL),
(56, 2014, 'Science', 'SSC 2014 Science', NULL),
(57, 2015, 'Science', 'SSC 2015 Science', NULL),
(58, 2016, 'Science', 'SSC 2016 Science', NULL),
(59, 2017, 'Science', 'SSC 2017 Science', NULL),
(60, 2018, 'Science', 'SSC 2018 Science', NULL),
(61, 2019, 'Science', 'SSC 2019 Science', NULL),
(62, 2020, 'Science', 'SSC 2020 Science', NULL),
(63, 2021, 'Science', 'SSC 2021 Science', NULL),
(64, 2022, 'Science', 'SSC 2022 Science', NULL),
(65, 2023, 'Science', 'SSC 2023 Science', NULL),
(66, 2024, 'Science', 'SSC 2024 Science', NULL),
(67, 2025, 'Science', 'SSC 2025 Science', NULL),
(68, 2026, 'Science', 'SSC 2026 Science', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `blogs`
--

CREATE TABLE `blogs` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(255) NOT NULL,
  `slug` varchar(255) NOT NULL,
  `image` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `tags` varchar(255) NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns`
--

CREATE TABLE `campaigns` (
  `id` int(11) NOT NULL,
  `small_image` varchar(255) NOT NULL,
  `large_image` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `description` mediumtext DEFAULT NULL,
  `user_id` int(11) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `status` enum('active','pending') NOT NULL DEFAULT 'active',
  `token_id` varchar(255) NOT NULL,
  `goal` int(11) UNSIGNED NOT NULL,
  `location` varchar(200) NOT NULL,
  `finalized` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No 1 Yes',
  `categories_id` int(10) UNSIGNED NOT NULL,
  `featured` enum('0','1') NOT NULL DEFAULT '0',
  `deadline` varchar(200) NOT NULL DEFAULT '',
  `video` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `campaigns_reported`
--

CREATE TABLE `campaigns_reported` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `campaigns_id` int(10) UNSIGNED NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `categories`
--

CREATE TABLE `categories` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL,
  `slug` varchar(200) NOT NULL,
  `mode` enum('on','off') NOT NULL DEFAULT 'on',
  `image` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `categories`
--

INSERT INTO `categories` (`id`, `name`, `slug`, `mode`, `image`) VALUES
(1, 'Business', 'Business', 'on', ''),
(2, 'Charity', 'Charity', 'on', ''),
(3, 'Community', 'Community', 'on', ''),
(4, 'Competitions', 'Competitions', 'on', ''),
(5, 'Creative', 'Creative', 'on', ''),
(14, 'Education', 'Education', 'on', ''),
(17, 'Animals', 'Animals', 'on', '');

-- --------------------------------------------------------

--
-- Table structure for table `checkin`
--

CREATE TABLE `checkin` (
  `checkin_id` bigint(20) UNSIGNED NOT NULL,
  `registration_id` bigint(20) UNSIGNED NOT NULL,
  `gate_id` bigint(20) UNSIGNED DEFAULT NULL,
  `checked_in_by` bigint(20) UNSIGNED DEFAULT NULL,
  `checkin_time` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `companion`
--

CREATE TABLE `companion` (
  `companion_id` bigint(20) UNSIGNED NOT NULL,
  `registration_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(160) NOT NULL,
  `relation` varchar(60) DEFAULT NULL,
  `age` smallint(6) DEFAULT NULL,
  `tshirt_size` varchar(8) DEFAULT NULL,
  `dietary_code` varchar(20) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `countries`
--

CREATE TABLE `countries` (
  `id` int(11) NOT NULL,
  `country_code` varchar(2) NOT NULL DEFAULT '',
  `country_name` varchar(100) NOT NULL DEFAULT ''
) ENGINE=MyISAM DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `countries`
--

INSERT INTO `countries` (`id`, `country_code`, `country_name`) VALUES
(1, 'US', 'United States'),
(2, 'CA', 'Canada'),
(3, 'AF', 'Afghanistan'),
(4, 'AL', 'Albania'),
(5, 'DZ', 'Algeria'),
(6, 'DS', 'American Samoa'),
(7, 'AD', 'Andorra'),
(8, 'AO', 'Angola'),
(9, 'AI', 'Anguilla'),
(10, 'AQ', 'Antarctica'),
(11, 'AG', 'Antigua and/or Barbuda'),
(12, 'AR', 'Argentina'),
(13, 'AM', 'Armenia'),
(14, 'AW', 'Aruba'),
(15, 'AU', 'Australia'),
(16, 'AT', 'Austria'),
(17, 'AZ', 'Azerbaijan'),
(18, 'BS', 'Bahamas'),
(19, 'BH', 'Bahrain'),
(20, 'BD', 'Bangladesh'),
(21, 'BB', 'Barbados'),
(22, 'BY', 'Belarus'),
(23, 'BE', 'Belgium'),
(24, 'BZ', 'Belize'),
(25, 'BJ', 'Benin'),
(26, 'BM', 'Bermuda'),
(27, 'BT', 'Bhutan'),
(28, 'BO', 'Bolivia'),
(29, 'BA', 'Bosnia and Herzegovina'),
(30, 'BW', 'Botswana'),
(31, 'BV', 'Bouvet Island'),
(32, 'BR', 'Brazil'),
(33, 'IO', 'British lndian Ocean Territory'),
(34, 'BN', 'Brunei Darussalam'),
(35, 'BG', 'Bulgaria'),
(36, 'BF', 'Burkina Faso'),
(37, 'BI', 'Burundi'),
(38, 'KH', 'Cambodia'),
(39, 'CM', 'Cameroon'),
(40, 'CV', 'Cape Verde'),
(41, 'KY', 'Cayman Islands'),
(42, 'CF', 'Central African Republic'),
(43, 'TD', 'Chad'),
(44, 'CL', 'Chile'),
(45, 'CN', 'China'),
(46, 'CX', 'Christmas Island'),
(47, 'CC', 'Cocos (Keeling) Islands'),
(48, 'CO', 'Colombia'),
(49, 'KM', 'Comoros'),
(50, 'CG', 'Congo'),
(51, 'CK', 'Cook Islands'),
(52, 'CR', 'Costa Rica'),
(53, 'HR', 'Croatia (Hrvatska)'),
(54, 'CU', 'Cuba'),
(55, 'CY', 'Cyprus'),
(56, 'CZ', 'Czech Republic'),
(57, 'DK', 'Denmark'),
(58, 'DJ', 'Djibouti'),
(59, 'DM', 'Dominica'),
(60, 'DO', 'Dominican Republic'),
(61, 'TP', 'East Timor'),
(62, 'EC', 'Ecuador'),
(63, 'EG', 'Egypt'),
(64, 'SV', 'El Salvador'),
(65, 'GQ', 'Equatorial Guinea'),
(66, 'ER', 'Eritrea'),
(67, 'EE', 'Estonia'),
(68, 'ET', 'Ethiopia'),
(69, 'FK', 'Falkland Islands (Malvinas)'),
(70, 'FO', 'Faroe Islands'),
(71, 'FJ', 'Fiji'),
(72, 'FI', 'Finland'),
(73, 'FR', 'France'),
(74, 'FX', 'France, Metropolitan'),
(75, 'GF', 'French Guiana'),
(76, 'PF', 'French Polynesia'),
(77, 'TF', 'French Southern Territories'),
(78, 'GA', 'Gabon'),
(79, 'GM', 'Gambia'),
(80, 'GE', 'Georgia'),
(81, 'DE', 'Germany'),
(82, 'GH', 'Ghana'),
(83, 'GI', 'Gibraltar'),
(84, 'GR', 'Greece'),
(85, 'GL', 'Greenland'),
(86, 'GD', 'Grenada'),
(87, 'GP', 'Guadeloupe'),
(88, 'GU', 'Guam'),
(89, 'GT', 'Guatemala'),
(90, 'GN', 'Guinea'),
(91, 'GW', 'Guinea-Bissau'),
(92, 'GY', 'Guyana'),
(93, 'HT', 'Haiti'),
(94, 'HM', 'Heard and Mc Donald Islands'),
(95, 'HN', 'Honduras'),
(96, 'HK', 'Hong Kong'),
(97, 'HU', 'Hungary'),
(98, 'IS', 'Iceland'),
(99, 'IN', 'India'),
(100, 'ID', 'Indonesia'),
(101, 'IR', 'Iran (Islamic Republic of)'),
(102, 'IQ', 'Iraq'),
(103, 'IE', 'Ireland'),
(104, 'IL', 'Israel'),
(105, 'IT', 'Italy'),
(106, 'CI', 'Ivory Coast'),
(107, 'JM', 'Jamaica'),
(108, 'JP', 'Japan'),
(109, 'JO', 'Jordan'),
(110, 'KZ', 'Kazakhstan'),
(111, 'KE', 'Kenya'),
(112, 'KI', 'Kiribati'),
(113, 'KP', 'Korea, Democratic People\'s Republic of'),
(114, 'KR', 'Korea, Republic of'),
(115, 'XK', 'Kosovo'),
(116, 'KW', 'Kuwait'),
(117, 'KG', 'Kyrgyzstan'),
(118, 'LA', 'Lao People\'s Democratic Republic'),
(119, 'LV', 'Latvia'),
(120, 'LB', 'Lebanon'),
(121, 'LS', 'Lesotho'),
(122, 'LR', 'Liberia'),
(123, 'LY', 'Libyan Arab Jamahiriya'),
(124, 'LI', 'Liechtenstein'),
(125, 'LT', 'Lithuania'),
(126, 'LU', 'Luxembourg'),
(127, 'MO', 'Macau'),
(128, 'MK', 'Macedonia'),
(129, 'MG', 'Madagascar'),
(130, 'MW', 'Malawi'),
(131, 'MY', 'Malaysia'),
(132, 'MV', 'Maldives'),
(133, 'ML', 'Mali'),
(134, 'MT', 'Malta'),
(135, 'MH', 'Marshall Islands'),
(136, 'MQ', 'Martinique'),
(137, 'MR', 'Mauritania'),
(138, 'MU', 'Mauritius'),
(139, 'TY', 'Mayotte'),
(140, 'MX', 'Mexico'),
(141, 'FM', 'Micronesia, Federated States of'),
(142, 'MD', 'Moldova, Republic of'),
(143, 'MC', 'Monaco'),
(144, 'MN', 'Mongolia'),
(145, 'ME', 'Montenegro'),
(146, 'MS', 'Montserrat'),
(147, 'MA', 'Morocco'),
(148, 'MZ', 'Mozambique'),
(149, 'MM', 'Myanmar'),
(150, 'NA', 'Namibia'),
(151, 'NR', 'Nauru'),
(152, 'NP', 'Nepal'),
(153, 'NL', 'Netherlands'),
(154, 'AN', 'Netherlands Antilles'),
(155, 'NC', 'New Caledonia'),
(156, 'NZ', 'New Zealand'),
(157, 'NI', 'Nicaragua'),
(158, 'NE', 'Niger'),
(159, 'NG', 'Nigeria'),
(160, 'NU', 'Niue'),
(161, 'NF', 'Norfork Island'),
(162, 'MP', 'Northern Mariana Islands'),
(163, 'NO', 'Norway'),
(164, 'OM', 'Oman'),
(165, 'PK', 'Pakistan'),
(166, 'PW', 'Palau'),
(167, 'PA', 'Panama'),
(168, 'PG', 'Papua New Guinea'),
(169, 'PY', 'Paraguay'),
(170, 'PE', 'Peru'),
(171, 'PH', 'Philippines'),
(172, 'PN', 'Pitcairn'),
(173, 'PL', 'Poland'),
(174, 'PT', 'Portugal'),
(175, 'PR', 'Puerto Rico'),
(176, 'QA', 'Qatar'),
(177, 'RE', 'Reunion'),
(178, 'RO', 'Romania'),
(179, 'RU', 'Russian Federation'),
(180, 'RW', 'Rwanda'),
(181, 'KN', 'Saint Kitts and Nevis'),
(182, 'LC', 'Saint Lucia'),
(183, 'VC', 'Saint Vincent and the Grenadines'),
(184, 'WS', 'Samoa'),
(185, 'SM', 'San Marino'),
(186, 'ST', 'Sao Tome and Principe'),
(187, 'SA', 'Saudi Arabia'),
(188, 'SN', 'Senegal'),
(189, 'RS', 'Serbia'),
(190, 'SC', 'Seychelles'),
(191, 'SL', 'Sierra Leone'),
(192, 'SG', 'Singapore'),
(193, 'SK', 'Slovakia'),
(194, 'SI', 'Slovenia'),
(195, 'SB', 'Solomon Islands'),
(196, 'SO', 'Somalia'),
(197, 'ZA', 'South Africa'),
(198, 'GS', 'South Georgia South Sandwich Islands'),
(199, 'ES', 'Spain'),
(200, 'LK', 'Sri Lanka'),
(201, 'SH', 'St. Helena'),
(202, 'PM', 'St. Pierre and Miquelon'),
(203, 'SD', 'Sudan'),
(204, 'SR', 'Suriname'),
(205, 'SJ', 'Svalbarn and Jan Mayen Islands'),
(206, 'SZ', 'Swaziland'),
(207, 'SE', 'Sweden'),
(208, 'CH', 'Switzerland'),
(209, 'SY', 'Syrian Arab Republic'),
(210, 'TW', 'Taiwan'),
(211, 'TJ', 'Tajikistan'),
(212, 'TZ', 'Tanzania, United Republic of'),
(213, 'TH', 'Thailand'),
(214, 'TG', 'Togo'),
(215, 'TK', 'Tokelau'),
(216, 'TO', 'Tonga'),
(217, 'TT', 'Trinidad and Tobago'),
(218, 'TN', 'Tunisia'),
(219, 'TR', 'Turkey'),
(220, 'TM', 'Turkmenistan'),
(221, 'TC', 'Turks and Caicos Islands'),
(222, 'TV', 'Tuvalu'),
(223, 'UG', 'Uganda'),
(224, 'UA', 'Ukraine'),
(225, 'AE', 'United Arab Emirates'),
(226, 'GB', 'United Kingdom'),
(227, 'UM', 'United States minor outlying islands'),
(228, 'UY', 'Uruguay'),
(229, 'UZ', 'Uzbekistan'),
(230, 'VU', 'Vanuatu'),
(231, 'VA', 'Vatican City State'),
(232, 'VE', 'Venezuela'),
(233, 'VN', 'Vietnam'),
(234, 'VG', 'Virgin Islands (British)'),
(235, 'VI', 'Virgin Islands (U.S.)'),
(236, 'WF', 'Wallis and Futuna Islands'),
(237, 'EH', 'Western Sahara'),
(238, 'YE', 'Yemen'),
(239, 'YU', 'Yugoslavia'),
(240, 'ZR', 'Zaire'),
(241, 'ZM', 'Zambia'),
(242, 'ZW', 'Zimbabwe');

-- --------------------------------------------------------

--
-- Table structure for table `discount`
--

CREATE TABLE `discount` (
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `code` varchar(40) NOT NULL,
  `type` enum('percent','fixed') NOT NULL,
  `value` decimal(10,2) NOT NULL,
  `currency` char(3) DEFAULT NULL,
  `start_at` datetime DEFAULT NULL,
  `end_at` datetime DEFAULT NULL,
  `usage_limit` int(11) DEFAULT NULL,
  `per_user_limit` int(11) DEFAULT NULL,
  `applicable_package_id` bigint(20) UNSIGNED DEFAULT NULL,
  `min_quantity` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `donations`
--

CREATE TABLE `donations` (
  `id` int(10) UNSIGNED NOT NULL,
  `campaigns_id` int(11) UNSIGNED NOT NULL,
  `txn_id` varchar(255) NOT NULL,
  `fullname` varchar(200) NOT NULL,
  `email` varchar(200) NOT NULL,
  `country` varchar(100) NOT NULL,
  `postal_code` varchar(100) NOT NULL,
  `donation` int(11) UNSIGNED NOT NULL,
  `payment_gateway` varchar(100) NOT NULL,
  `oauth_uid` varchar(200) NOT NULL,
  `comment` varchar(200) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `anonymous` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No, 1 Yes',
  `rewards_id` int(10) UNSIGNED NOT NULL,
  `bank_swift_code` varchar(250) NOT NULL,
  `account_number` varchar(250) NOT NULL,
  `branch_name` varchar(250) NOT NULL,
  `branch_address` varchar(250) NOT NULL,
  `account_name` varchar(250) NOT NULL,
  `iban` varchar(250) NOT NULL,
  `approved` enum('0','1') NOT NULL DEFAULT '1',
  `bank_transfer` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `event`
--

CREATE TABLE `event` (
  `event_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(180) NOT NULL,
  `description` text DEFAULT NULL,
  `start_at` datetime NOT NULL,
  `end_at` datetime NOT NULL,
  `location_id` bigint(20) UNSIGNED DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `event`
--

INSERT INTO `event` (`event_id`, `name`, `description`, `start_at`, `end_at`, `location_id`, `capacity`, `created_at`) VALUES
(4, 'Diamond Jubilee 2026', 'Chandnapur High School’s 60-year Diamond Jubilee celebration.', '2026-02-12 09:00:00', '2026-02-12 21:00:00', 1, 1, '2025-09-25 06:22:50');

-- --------------------------------------------------------

--
-- Table structure for table `gallery`
--

CREATE TABLE `gallery` (
  `id` int(10) UNSIGNED NOT NULL,
  `image` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `gallery`
--

INSERT INTO `gallery` (`id`, `image`) VALUES
(1, 'image-1757233905.jpg'),
(2, 'image-1757235572.png');

-- --------------------------------------------------------

--
-- Table structure for table `gate`
--

CREATE TABLE `gate` (
  `gate_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(80) NOT NULL,
  `location_note` varchar(160) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `guest_detail`
--

CREATE TABLE `guest_detail` (
  `participant_id` bigint(20) UNSIGNED NOT NULL,
  `no_of_guests` int(11) NOT NULL DEFAULT 1,
  `relation_to_participant` varchar(120) DEFAULT NULL,
  `relation_to_school` varchar(120) DEFAULT NULL,
  `invited_by` varchar(120) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `languages`
--

CREATE TABLE `languages` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(100) NOT NULL,
  `abbreviation` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `languages`
--

INSERT INTO `languages` (`id`, `name`, `abbreviation`) VALUES
(1, 'English', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `likes`
--

CREATE TABLE `likes` (
  `id` int(10) UNSIGNED NOT NULL,
  `user_id` int(10) UNSIGNED NOT NULL,
  `campaigns_id` int(10) UNSIGNED NOT NULL,
  `status` enum('0','1') NOT NULL DEFAULT '1',
  `date` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `location`
--

CREATE TABLE `location` (
  `location_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(160) NOT NULL,
  `address` text DEFAULT NULL,
  `latitude` decimal(10,7) DEFAULT NULL,
  `longitude` decimal(10,7) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `location`
--

INSERT INTO `location` (`location_id`, `name`, `address`, `latitude`, `longitude`) VALUES
(1, 'Chandanpur High School', 'Chandanpur, Kalaroa, Satkhira', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `migrations`
--

CREATE TABLE `migrations` (
  `migration` varchar(255) NOT NULL,
  `batch` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `package`
--

CREATE TABLE `package` (
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `name` varchar(120) NOT NULL,
  `description` text DEFAULT NULL,
  `currency` char(3) NOT NULL DEFAULT 'BDT',
  `price` decimal(10,2) NOT NULL DEFAULT 0.00,
  `early_bird_price` decimal(10,2) DEFAULT NULL,
  `sale_start` datetime DEFAULT NULL,
  `sale_end` datetime DEFAULT NULL,
  `capacity` int(11) DEFAULT NULL,
  `is_active` tinyint(1) NOT NULL DEFAULT 1,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `package`
--

INSERT INTO `package` (`package_id`, `name`, `description`, `currency`, `price`, `early_bird_price`, `sale_start`, `sale_end`, `capacity`, `is_active`, `created_at`) VALUES
(1, 'Alumni Full Pass', 'Access to all ceremonies + gala dinner', 'BDT', 1500.00, 1200.00, '2025-10-01 00:00:00', '2026-01-31 23:59:59', 2000, 1, '2025-09-25 06:03:10'),
(2, 'Student Pass', 'Current students; program access (no gala dinner)', 'BDT', 500.00, NULL, '2025-10-01 00:00:00', '2026-02-28 23:59:59', 3000, 1, '2025-09-25 06:03:10'),
(3, 'Teacher/Staff Pass', 'Complimentary or discounted pass for staff', 'BDT', 0.00, NULL, '2025-10-01 00:00:00', '2026-02-28 23:59:59', 500, 1, '2025-09-25 06:03:10');

-- --------------------------------------------------------

--
-- Table structure for table `pages`
--

CREATE TABLE `pages` (
  `id` int(10) UNSIGNED NOT NULL,
  `title` varchar(1500) NOT NULL,
  `content` text NOT NULL,
  `slug` varchar(100) NOT NULL,
  `show_navbar` enum('0','1') NOT NULL DEFAULT '0' COMMENT '0 No, 1 Yes',
  `lang` char(10) NOT NULL DEFAULT 'en'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `pages`
--

INSERT INTO `pages` (`id`, `title`, `content`, `slug`, `show_navbar`, `lang`) VALUES
(2, 'Terms', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \r\n\r\n<br/><br/>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \r\n\r\n<br/><br/>\r\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets ', 'terms-of-service', '0', 'en'),
(3, 'Privacy', 'Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets \n\n<br/><br/>\nLorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.', 'privacy', '0', 'en'),
(5, 'About us', '<p>Welcome to Chandnapur Secondary School Established in 1959, Chandnapur Secondary School has been a cornerstone of quality education, cultural enrichment, and community development for over seven decades. With a commitment to academic excellence and holistic growth, the school has shaped generations of students into responsible citizens and successful professionals.\r\n\r\n<br />\r\n<br />\r\nAs we celebrate our Diamond Jubilee in 2026, marking 60 glorious years of learning and achievement, we take pride in our legacy while looking forward to a future filled with innovation, inclusivity, and continued excellence. Our dedicated faculty, vibrant alumni network, and supportive community are the pillars that make this journey truly remarkable.\r\n\r\nJoin us in honoring the past, celebrating the present, and envisioning a brighter tomorrow—together!</p>\r\n', 'about', '0', 'en'),
(7, 'Support', '<p>Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets <br /><br /> Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry\'s standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book.</p>', 'support', '0', 'en'),
(8, 'About us', '<p>Welcome to Chandnapur Secondary School Established in 1959, Chandnapur Secondary School has been a cornerstone of quality education, cultural enrichment, and community development for over seven decades. With a commitment to academic excellence and holistic growth, the school has shaped generations of students into responsible citizens and successful professionals.\r\n\r\n<br />\r\n<br />\r\nAs we celebrate our Diamond Jubilee in 2026, marking 60 glorious years of learning and achievement, we take pride in our legacy while looking forward to a future filled with innovation, inclusivity, and continued excellence. Our dedicated faculty, vibrant alumni network, and supportive community are the pillars that make this journey truly remarkable.\r\n\r\nJoin us in honoring the past, celebrating the present, and envisioning a brighter tomorrow—together!</p>\r\n', 'How it works', '1', 'en');

-- --------------------------------------------------------

--
-- Table structure for table `participant`
--

CREATE TABLE `participant` (
  `participant_id` bigint(20) UNSIGNED NOT NULL,
  `type` enum('alumni','current_student','teacher','staff','guest') NOT NULL,
  `first_name` varchar(80) NOT NULL,
  `last_name` varchar(80) DEFAULT NULL,
  `full_name` varchar(200) GENERATED ALWAYS AS (concat_ws(' ',`first_name`,`last_name`)) VIRTUAL,
  `gender` varchar(10) DEFAULT NULL,
  `dob` date DEFAULT NULL,
  `email` varchar(190) DEFAULT NULL,
  `phone` varchar(30) DEFAULT NULL,
  `alt_phone` varchar(30) DEFAULT NULL,
  `nid` varchar(40) DEFAULT NULL,
  `address_line` varchar(200) DEFAULT NULL,
  `upazila` varchar(80) DEFAULT NULL,
  `district` varchar(80) DEFAULT NULL,
  `division` varchar(80) DEFAULT NULL,
  `country` varchar(80) NOT NULL DEFAULT 'Bangladesh',
  `blood_group` varchar(5) DEFAULT NULL,
  `tshirt_size` varchar(8) DEFAULT NULL,
  `dietary_code` varchar(20) DEFAULT NULL,
  `special_needs` text DEFAULT NULL,
  `emergency_contact_name` varchar(120) DEFAULT NULL,
  `emergency_contact_phone` varchar(30) DEFAULT NULL,
  `photo_url` varchar(255) DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `participant`
--

INSERT INTO `participant` (`participant_id`, `type`, `first_name`, `last_name`, `gender`, `dob`, `email`, `phone`, `alt_phone`, `nid`, `address_line`, `upazila`, `district`, `division`, `country`, `blood_group`, `tshirt_size`, `dietary_code`, `special_needs`, `emergency_contact_name`, `emergency_contact_phone`, `photo_url`, `created_at`, `updated_at`) VALUES
(1, 'alumni', 'Test', 'User', 'male', NULL, 'test.user@example.com', '+8801700000000', NULL, NULL, NULL, NULL, NULL, NULL, 'Bangladesh', NULL, 'L', 'none', NULL, NULL, NULL, NULL, '2025-09-25 06:03:10', '2025-09-25 06:03:10');

-- --------------------------------------------------------

--
-- Table structure for table `password_resets`
--

CREATE TABLE `password_resets` (
  `id` int(10) UNSIGNED NOT NULL,
  `token` varchar(150) NOT NULL,
  `email` varchar(255) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment`
--

CREATE TABLE `payment` (
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `registration_id` bigint(20) UNSIGNED NOT NULL,
  `method` enum('bkash','nagad','card','bank_transfer','cash') NOT NULL,
  `txn_id` varchar(100) DEFAULT NULL,
  `amount` decimal(10,2) NOT NULL,
  `currency` char(3) NOT NULL DEFAULT 'BDT',
  `fee_amount` decimal(10,2) DEFAULT NULL,
  `status` enum('pending','paid','failed','refunded') NOT NULL DEFAULT 'pending',
  `paid_at` datetime DEFAULT NULL,
  `gateway_payload` longtext DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `payment_gateways`
--

CREATE TABLE `payment_gateways` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `type` varchar(255) NOT NULL,
  `enabled` enum('1','0') NOT NULL DEFAULT '1',
  `sandbox` enum('true','false') NOT NULL DEFAULT 'true',
  `fee` decimal(3,1) NOT NULL,
  `fee_cents` decimal(2,2) NOT NULL,
  `email` varchar(80) NOT NULL,
  `token` varchar(200) NOT NULL,
  `key` varchar(255) NOT NULL,
  `key_secret` varchar(255) NOT NULL,
  `bank_info` text NOT NULL,
  `paypal_form` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Dumping data for table `payment_gateways`
--

INSERT INTO `payment_gateways` (`id`, `name`, `type`, `enabled`, `sandbox`, `fee`, `fee_cents`, `email`, `token`, `key`, `key_secret`, `bank_info`, `paypal_form`) VALUES
(1, 'PayPal', 'normal', '0', 'true', 5.4, 0.30, 'paypal@yoursite.com', '12bGGfD9bHevK3eJN06CdDvFSTXsTrTG44yGdAONeN1R37jqnLY1PuNF0mJRoFnsEygyf28yePSCA1eR0alQk4BX89kGG9Rlha2D2KX55TpDFNR5o774OshrkHSZLOFo2fAhHzcWKnwsYDFKgwuaRg', '', '', '', 'normal'),
(2, 'Stripe', 'card', '0', 'true', 2.9, 0.30, '', 'asfQSGRvYzS1P0X745krAAyHeU7ZbTpHbYKnxI2abQsBUi48EpeAu5lFAU2iBmsUWO5tpgAn9zzussI4Cce5ZcANIAmfBz0bNR9g3UfR4cserhkJwZwPsETiXiZuCixXVDHhCItuXTPXXSA6KITEoT', '', '', '', ''),
(3, 'Bank Transfer', 'bank', '0', 'true', 0.0, 0.00, '', 'zzzdH5811lZSjioHrg3zLD69DAAMvPLiwdzTouAdc7HbtaqgujPEZjH3i7RGeRtFKrY2baT7rXd6CaBtsRpo4XtgHvqCyCWiW5BlCrg1uSMCOSdi1tzPjCPx8px280YEyLvNtiRzWHJJk8WRegfTms', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `refund`
--

CREATE TABLE `refund` (
  `refund_id` bigint(20) UNSIGNED NOT NULL,
  `payment_id` bigint(20) UNSIGNED NOT NULL,
  `amount` decimal(10,2) NOT NULL,
  `reason` varchar(255) DEFAULT NULL,
  `refunded_at` datetime NOT NULL DEFAULT current_timestamp(),
  `processed_by` bigint(20) UNSIGNED DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `ref_dietary`
--

CREATE TABLE `ref_dietary` (
  `dietary_code` varchar(20) NOT NULL,
  `label` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `ref_dietary`
--

INSERT INTO `ref_dietary` (`dietary_code`, `label`) VALUES
('gluten_free', 'Gluten Free'),
('halal', 'Halal'),
('none', 'No preference'),
('other', 'Other'),
('veg', 'Vegetarian'),
('vegan', 'Vegan');

-- --------------------------------------------------------

--
-- Table structure for table `ref_gender`
--

CREATE TABLE `ref_gender` (
  `gender_code` varchar(10) NOT NULL,
  `label` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `ref_gender`
--

INSERT INTO `ref_gender` (`gender_code`, `label`) VALUES
('female', 'Female'),
('male', 'Male'),
('other', 'Other'),
('prefer_not', 'Prefer not to say');

-- --------------------------------------------------------

--
-- Table structure for table `ref_tshirt_size`
--

CREATE TABLE `ref_tshirt_size` (
  `size_code` varchar(8) NOT NULL,
  `label` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `ref_tshirt_size`
--

INSERT INTO `ref_tshirt_size` (`size_code`, `label`) VALUES
('2XL', 'Double XL'),
('3XL', 'Triple XL'),
('L', 'Large'),
('M', 'Medium'),
('S', 'Small'),
('XL', 'Extra Large'),
('XS', 'Extra Small');

-- --------------------------------------------------------

--
-- Table structure for table `registration`
--

CREATE TABLE `registration` (
  `registration_id` bigint(20) UNSIGNED NOT NULL,
  `participant_id` bigint(20) UNSIGNED NOT NULL,
  `package_id` bigint(20) UNSIGNED NOT NULL,
  `registration_no` varchar(40) DEFAULT NULL,
  `status` enum('draft','submitted','verified','approved','waitlisted','cancelled') NOT NULL DEFAULT 'submitted',
  `source` enum('web','kiosk','admin','import') NOT NULL DEFAULT 'web',
  `qr_token` varchar(64) DEFAULT NULL,
  `qr_payload` varchar(255) GENERATED ALWAYS AS (concat('CHS2026|',ifnull(`registration_no`,''),'|',`participant_id`)) VIRTUAL,
  `qr_last_generated_at` datetime DEFAULT NULL,
  `notes` text DEFAULT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp(),
  `updated_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Triggers `registration`
--
DELIMITER $$
CREATE TRIGGER `trg_registration_after_insert` AFTER INSERT ON `registration` FOR EACH ROW BEGIN
  -- Assign human-readable registration number if not provided
  IF NEW.registration_no IS NULL OR NEW.registration_no = '' THEN
    UPDATE registration
      SET registration_no = CONCAT('CHS-2026-', LPAD(NEW.registration_id, 6, '0'))
    WHERE registration_id = NEW.registration_id;
  END IF;

  -- Generate a URL-safe random QR token if not provided
  IF NEW.qr_token IS NULL OR NEW.qr_token = '' THEN
    UPDATE registration
      SET qr_token = REPLACE(REPLACE(REPLACE(TO_BASE64(RANDOM_BYTES(12)),'=',''),'/','-'),'+','_'),
          qr_last_generated_at = NOW()
    WHERE registration_id = NEW.registration_id;
  END IF;
END
$$
DELIMITER ;
DELIMITER $$
CREATE TRIGGER `trg_registration_before_update` BEFORE UPDATE ON `registration` FOR EACH ROW BEGIN
  IF (NEW.registration_no IS NULL OR NEW.registration_no = '') THEN
    SET NEW.registration_no = CONCAT('CHS-2026-', LPAD(OLD.registration_id, 6, '0'));
  END IF;

  IF (NEW.qr_token IS NULL OR NEW.qr_token = '') THEN
    SET NEW.qr_token = REPLACE(REPLACE(REPLACE(TO_BASE64(RANDOM_BYTES(12)),'=',''),'/','-'),'+','_');
    SET NEW.qr_last_generated_at = NOW();
  END IF;
END
$$
DELIMITER ;

-- --------------------------------------------------------

--
-- Table structure for table `registration_addon`
--

CREATE TABLE `registration_addon` (
  `reg_addon_id` bigint(20) UNSIGNED NOT NULL,
  `registration_id` bigint(20) UNSIGNED NOT NULL,
  `addon_id` bigint(20) UNSIGNED NOT NULL,
  `quantity` int(11) NOT NULL DEFAULT 1,
  `unit_price` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `registration_discount`
--

CREATE TABLE `registration_discount` (
  `reg_disc_id` bigint(20) UNSIGNED NOT NULL,
  `registration_id` bigint(20) UNSIGNED NOT NULL,
  `discount_id` bigint(20) UNSIGNED NOT NULL,
  `applied_value` decimal(10,2) NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `reserved`
--

CREATE TABLE `reserved` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `reserved`
--

INSERT INTO `reserved` (`id`, `name`) VALUES
(14, 'account'),
(31, 'api'),
(2, 'app'),
(46, 'blog'),
(30, 'bootstrap'),
(37, 'campaigns'),
(34, 'categories'),
(36, 'collections'),
(29, 'comment'),
(42, 'config'),
(25, 'contact'),
(41, 'database'),
(35, 'featured'),
(32, 'freebies'),
(45, 'gallery'),
(9, 'goods'),
(1, 'gostock1'),
(11, 'jobs'),
(21, 'join'),
(16, 'latest'),
(20, 'login'),
(33, 'logout'),
(27, 'members'),
(13, 'messages'),
(19, 'notifications'),
(15, 'popular'),
(6, 'porn'),
(26, 'programs'),
(12, 'projects'),
(3, 'public'),
(23, 'register'),
(40, 'resources'),
(39, 'routes'),
(17, 'search'),
(7, 'sex'),
(44, 'storage'),
(8, 'tags'),
(38, 'tests'),
(24, 'upgrade'),
(28, 'upload'),
(4, 'vendor'),
(5, 'xxx');

-- --------------------------------------------------------

--
-- Table structure for table `rewards`
--

CREATE TABLE `rewards` (
  `id` int(10) UNSIGNED NOT NULL,
  `campaigns_id` int(10) UNSIGNED NOT NULL,
  `title` varchar(250) NOT NULL,
  `amount` int(10) UNSIGNED NOT NULL,
  `description` text NOT NULL,
  `quantity` int(10) UNSIGNED NOT NULL,
  `delivery` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `staff_detail`
--

CREATE TABLE `staff_detail` (
  `participant_id` bigint(20) UNSIGNED NOT NULL,
  `designation` varchar(120) DEFAULT NULL,
  `department` varchar(120) DEFAULT NULL,
  `employment_start` date DEFAULT NULL,
  `employment_end` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `student_detail`
--

CREATE TABLE `student_detail` (
  `participant_id` bigint(20) UNSIGNED NOT NULL,
  `class` enum('Six','Seven','Eight','Nine','Ten','Eleven','Twelve','Other') NOT NULL,
  `section` varchar(10) DEFAULT NULL,
  `roll_no` varchar(30) DEFAULT NULL,
  `student_id` varchar(40) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `updates`
--

CREATE TABLE `updates` (
  `id` int(11) NOT NULL,
  `image` varchar(255) NOT NULL,
  `description` text NOT NULL,
  `campaigns_id` int(10) UNSIGNED NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `token_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(10) UNSIGNED NOT NULL,
  `name` varchar(50) NOT NULL,
  `countries_id` char(25) NOT NULL,
  `password` char(60) NOT NULL,
  `email` varchar(255) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `avatar` varchar(70) NOT NULL,
  `status` enum('pending','active','suspended','delete') NOT NULL DEFAULT 'active',
  `role` enum('normal','admin') NOT NULL DEFAULT 'normal',
  `remember_token` varchar(100) NOT NULL,
  `token` varchar(80) NOT NULL,
  `confirmation_code` varchar(125) NOT NULL,
  `updated_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `created_at` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `paypal_account` varchar(200) NOT NULL,
  `payment_gateway` varchar(50) NOT NULL,
  `bank` text NOT NULL,
  `oauth_uid` varchar(200) NOT NULL,
  `oauth_provider` varchar(200) NOT NULL,
  `username` varchar(50) NOT NULL,
  `phone` int(10) UNSIGNED NOT NULL,
  `street` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `countries_id`, `password`, `email`, `date`, `avatar`, `status`, `role`, `remember_token`, `token`, `confirmation_code`, `updated_at`, `created_at`, `paypal_account`, `payment_gateway`, `bank`, `oauth_uid`, `oauth_provider`, `username`, `phone`, `street`) VALUES
(1, 'Admin', '20', '$2y$10$w/laxDgcmRoIfwcCpKOtzOZrfXPGJE1iHjxf08wh2akHYQ9ZLgC7S', 'chsdiamondjublee2026@gmail.com', '2021-03-14 10:19:16', '11757315281lbhbwzgruw1xl9b.png', 'active', 'admin', 'jdyUX4MSI6sdt5ytuN9akMqnlhvnFy2TVWiTDEzDK1Kt4gMAtHiro3wT6AqH', 'Wy4VkAl2dxHb9WHoXjTowSGPXFPnEQHca6RBe2yeqqmRafs0hSbCEobhNkZZAbCDIru60ceLzAAOI3fj', '', '2025-09-08 01:08:01', '2016-09-09 15:34:42', '', '', '', '', '', '', 0, ''),
(2, 'Md Shahzan Kabir', '20', '$2y$10$ZNyDdIY198neoVO.JV1zMuwFjeXzzKz9wpv1/mdfXcPqvHbNIeVoi', 'mdshahzankabir@gmail.com', '2025-09-26 19:02:03', 'default.jpg', 'active', 'normal', '', '5EGQxvVm91FA55htXsI9IuUIgSrp7vV04EGO4SU6WI65EzKGpNOV6KIsapW7teOUiVWOQxrrSvB', '', '2025-09-26 13:02:03', '2025-09-26 13:02:03', '', '', '', '', '', '', 0, ''),
(3, 'Md Shamsuzzamna', '114', '$2y$10$rZhoPOAhljef7rrxYPw4xOER98tJNJ5knUA0HIF9jk3Emzt1tifWy', 'pharm.mission@gmail.com', '2025-09-27 05:27:24', 'default.jpg', 'active', 'normal', '', '4bNNuzvc7TF5d8lIPE9Xi15LqXqzqd2zlD6hgKtdyIH2oj5d0f9dtoYit4Nl2UZbmeEC25X5FlH', '', '2025-09-26 23:27:24', '2025-09-26 23:27:24', '', '', '', '', '', '', 0, ''),
(4, 'Abu Sufian Joy', '20', '$2y$10$4ZrW9KoOSXrAqhJq8rhES.aU2vNGpGgLlLEO.FJrqi..RfUGRcsYq', 'abusufianjoy6067@gmail.com', '2025-09-27 08:08:01', 'default.jpg', 'active', 'normal', '', 'UK1WGpT2ExVpSDig6KkOXN0TKl23saIe1s58E7m27p9uAkODgnGDBtTAjuwyF2kUHmqwRIo6mqk', '', '2025-09-27 02:08:01', '2025-09-27 02:08:01', '', '', '', '', '', '', 0, ''),
(5, 'Md Saiful Islam', '20', '$2y$10$gF28hgp7rNVwr2KiuF8Pre5H1zzXi0f2CKNPzb3xEfO9xa1.bQzt.', 'mdsaifulislam@gmail.com', '2025-09-27 09:18:51', 'default.jpg', 'active', 'normal', '', 'VFg2UsTfLO75SREefaB4ZQNhZLl0AfCnp6oyDsz70u638WFOGJoSaL4H6bsKMNXXZSragzBcsaD', '', '2025-09-27 03:18:51', '2025-09-27 03:18:51', '', '', '', '', '', '', 0, ''),
(6, 'Nazmul Suzan Biswas', '20', '$2y$10$wh.x1r30gc.0z61dupuHdu0F0pgftcW9eGVpjGMKC/PGB6ik05v3K', 'nazmulsuzanbiswas@gmail.com', '2025-09-28 19:42:27', 'default.jpg', 'active', 'normal', '', 'q3fttbn5WFw0lfbEN2E0G3UFXDfjelnCWWw8bZCcatXI1SUghQbJMuCUYi8Mmm847rAsRGaVrew', '', '2025-09-28 13:42:27', '2025-09-28 13:42:27', '', '', '', '', '', '', 0, '');

-- --------------------------------------------------------

--
-- Stand-in structure for view `v_registration_finance`
-- (See below for the actual view)
--
CREATE TABLE `v_registration_finance` (
`registration_id` bigint(20) unsigned
,`registration_no` varchar(40)
,`status` enum('draft','submitted','verified','approved','waitlisted','cancelled')
,`participant_id` bigint(20) unsigned
,`full_name` varchar(200)
,`participant_type` enum('alumni','current_student','teacher','staff','guest')
,`package_name` varchar(120)
,`package_price` decimal(10,2)
,`total_paid` decimal(32,2)
,`gross_due` decimal(43,2)
,`balance_due` decimal(44,2)
);

-- --------------------------------------------------------

--
-- Table structure for table `withdrawals`
--

CREATE TABLE `withdrawals` (
  `id` int(10) UNSIGNED NOT NULL,
  `campaigns_id` int(10) UNSIGNED NOT NULL,
  `status` enum('pending','paid') NOT NULL DEFAULT 'pending',
  `amount` varchar(50) NOT NULL,
  `date` timestamp NOT NULL DEFAULT current_timestamp(),
  `gateway` varchar(100) NOT NULL,
  `account` text NOT NULL,
  `date_paid` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `txn_id` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb3 COLLATE=utf8mb3_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `addon`
--
ALTER TABLE `addon`
  ADD PRIMARY KEY (`addon_id`),
  ADD KEY `idx_addon_active` (`is_active`);

--
-- Indexes for table `admin_settings`
--
ALTER TABLE `admin_settings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `max_campaign_amount` (`max_campaign_amount`),
  ADD KEY `type` (`status_pwa`);

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`admin_user_id`),
  ADD UNIQUE KEY `u_admin_email` (`email`);

--
-- Indexes for table `alumni_detail`
--
ALTER TABLE `alumni_detail`
  ADD PRIMARY KEY (`participant_id`);

--
-- Indexes for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD PRIMARY KEY (`audit_id`),
  ADD KEY `idx_audit_entity` (`entity`,`entity_id`),
  ADD KEY `fk_audit_admin` (`actor_admin_id`),
  ADD KEY `fk_audit_participant` (`actor_participant_id`);

--
-- Indexes for table `batch_year`
--
ALTER TABLE `batch_year`
  ADD PRIMARY KEY (`batch_id`),
  ADD UNIQUE KEY `u_year_stream` (`year`,`group_stream`);

--
-- Indexes for table `blogs`
--
ALTER TABLE `blogs`
  ADD PRIMARY KEY (`id`),
  ADD KEY `blogs_slug_index` (`slug`(191)),
  ADD KEY `blogs_tags_index` (`tags`(191));

--
-- Indexes for table `campaigns`
--
ALTER TABLE `campaigns`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`),
  ADD KEY `author_id` (`user_id`,`status`,`token_id`),
  ADD KEY `image` (`small_image`),
  ADD KEY `goal` (`goal`),
  ADD KEY `categories_id` (`categories_id`);

--
-- Indexes for table `campaigns_reported`
--
ALTER TABLE `campaigns_reported`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`),
  ADD KEY `slug` (`slug`);

--
-- Indexes for table `checkin`
--
ALTER TABLE `checkin`
  ADD PRIMARY KEY (`checkin_id`),
  ADD KEY `fk_checkin_gate` (`gate_id`),
  ADD KEY `idx_checkin_reg` (`registration_id`);

--
-- Indexes for table `companion`
--
ALTER TABLE `companion`
  ADD PRIMARY KEY (`companion_id`),
  ADD KEY `fk_comp_size` (`tshirt_size`),
  ADD KEY `fk_comp_diet` (`dietary_code`),
  ADD KEY `idx_comp_reg` (`registration_id`);

--
-- Indexes for table `countries`
--
ALTER TABLE `countries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `discount`
--
ALTER TABLE `discount`
  ADD PRIMARY KEY (`discount_id`),
  ADD UNIQUE KEY `u_discount_code` (`code`),
  ADD KEY `fk_disc_pkg` (`applicable_package_id`);

--
-- Indexes for table `donations`
--
ALTER TABLE `donations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaigns_id` (`campaigns_id`);

--
-- Indexes for table `event`
--
ALTER TABLE `event`
  ADD PRIMARY KEY (`event_id`),
  ADD KEY `idx_event_time` (`start_at`,`end_at`),
  ADD KEY `fk_event_location` (`location_id`);

--
-- Indexes for table `gallery`
--
ALTER TABLE `gallery`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `gate`
--
ALTER TABLE `gate`
  ADD PRIMARY KEY (`gate_id`);

--
-- Indexes for table `guest_detail`
--
ALTER TABLE `guest_detail`
  ADD PRIMARY KEY (`participant_id`);

--
-- Indexes for table `languages`
--
ALTER TABLE `languages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `likes`
--
ALTER TABLE `likes`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `location`
--
ALTER TABLE `location`
  ADD PRIMARY KEY (`location_id`);

--
-- Indexes for table `package`
--
ALTER TABLE `package`
  ADD PRIMARY KEY (`package_id`),
  ADD KEY `idx_package_active` (`is_active`);

--
-- Indexes for table `pages`
--
ALTER TABLE `pages`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `participant`
--
ALTER TABLE `participant`
  ADD PRIMARY KEY (`participant_id`),
  ADD UNIQUE KEY `u_email` (`email`),
  ADD KEY `fk_participant_size` (`tshirt_size`),
  ADD KEY `fk_participant_diet` (`dietary_code`),
  ADD KEY `fk_participant_gender` (`gender`),
  ADD KEY `idx_phone` (`phone`),
  ADD KEY `idx_type` (`type`);

--
-- Indexes for table `password_resets`
--
ALTER TABLE `password_resets`
  ADD PRIMARY KEY (`id`),
  ADD KEY `id_hash` (`token`),
  ADD KEY `email` (`email`);

--
-- Indexes for table `payment`
--
ALTER TABLE `payment`
  ADD PRIMARY KEY (`payment_id`),
  ADD KEY `idx_payment_reg` (`registration_id`),
  ADD KEY `idx_payment_status` (`status`),
  ADD KEY `idx_payment_txn` (`txn_id`);

--
-- Indexes for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `refund`
--
ALTER TABLE `refund`
  ADD PRIMARY KEY (`refund_id`),
  ADD KEY `fk_refund_payment` (`payment_id`);

--
-- Indexes for table `ref_dietary`
--
ALTER TABLE `ref_dietary`
  ADD PRIMARY KEY (`dietary_code`);

--
-- Indexes for table `ref_gender`
--
ALTER TABLE `ref_gender`
  ADD PRIMARY KEY (`gender_code`);

--
-- Indexes for table `ref_tshirt_size`
--
ALTER TABLE `ref_tshirt_size`
  ADD PRIMARY KEY (`size_code`);

--
-- Indexes for table `registration`
--
ALTER TABLE `registration`
  ADD PRIMARY KEY (`registration_id`),
  ADD UNIQUE KEY `u_reg_no` (`registration_no`),
  ADD UNIQUE KEY `u_qr_token` (`qr_token`),
  ADD KEY `idx_reg_participant` (`participant_id`),
  ADD KEY `idx_reg_status` (`status`),
  ADD KEY `fk_reg_package` (`package_id`);

--
-- Indexes for table `registration_addon`
--
ALTER TABLE `registration_addon`
  ADD PRIMARY KEY (`reg_addon_id`),
  ADD UNIQUE KEY `u_reg_addon` (`registration_id`,`addon_id`),
  ADD KEY `fk_ra_addon` (`addon_id`);

--
-- Indexes for table `registration_discount`
--
ALTER TABLE `registration_discount`
  ADD PRIMARY KEY (`reg_disc_id`),
  ADD UNIQUE KEY `u_reg_disc` (`registration_id`,`discount_id`),
  ADD KEY `fk_rd_disc` (`discount_id`);

--
-- Indexes for table `reserved`
--
ALTER TABLE `reserved`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`) USING BTREE;

--
-- Indexes for table `rewards`
--
ALTER TABLE `rewards`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `staff_detail`
--
ALTER TABLE `staff_detail`
  ADD PRIMARY KEY (`participant_id`);

--
-- Indexes for table `student_detail`
--
ALTER TABLE `student_detail`
  ADD PRIMARY KEY (`participant_id`);

--
-- Indexes for table `updates`
--
ALTER TABLE `updates`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `token_id` (`token_id`),
  ADD KEY `author_id` (`token_id`),
  ADD KEY `image` (`image`),
  ADD KEY `category_id` (`campaigns_id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `username` (`status`),
  ADD KEY `role` (`role`);

--
-- Indexes for table `withdrawals`
--
ALTER TABLE `withdrawals`
  ADD PRIMARY KEY (`id`),
  ADD KEY `campaings_id` (`campaigns_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `addon`
--
ALTER TABLE `addon`
  MODIFY `addon_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `admin_settings`
--
ALTER TABLE `admin_settings`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `admin_user_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `audit_log`
--
ALTER TABLE `audit_log`
  MODIFY `audit_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `batch_year`
--
ALTER TABLE `batch_year`
  MODIFY `batch_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=69;

--
-- AUTO_INCREMENT for table `blogs`
--
ALTER TABLE `blogs`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaigns`
--
ALTER TABLE `campaigns`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `campaigns_reported`
--
ALTER TABLE `campaigns_reported`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `checkin`
--
ALTER TABLE `checkin`
  MODIFY `checkin_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `companion`
--
ALTER TABLE `companion`
  MODIFY `companion_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `countries`
--
ALTER TABLE `countries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=243;

--
-- AUTO_INCREMENT for table `discount`
--
ALTER TABLE `discount`
  MODIFY `discount_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `donations`
--
ALTER TABLE `donations`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `event`
--
ALTER TABLE `event`
  MODIFY `event_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `gallery`
--
ALTER TABLE `gallery`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `gate`
--
ALTER TABLE `gate`
  MODIFY `gate_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `languages`
--
ALTER TABLE `languages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `likes`
--
ALTER TABLE `likes`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `location`
--
ALTER TABLE `location`
  MODIFY `location_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `package`
--
ALTER TABLE `package`
  MODIFY `package_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `pages`
--
ALTER TABLE `pages`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `participant`
--
ALTER TABLE `participant`
  MODIFY `participant_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `password_resets`
--
ALTER TABLE `password_resets`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment`
--
ALTER TABLE `payment`
  MODIFY `payment_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `payment_gateways`
--
ALTER TABLE `payment_gateways`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `refund`
--
ALTER TABLE `refund`
  MODIFY `refund_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registration`
--
ALTER TABLE `registration`
  MODIFY `registration_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `registration_addon`
--
ALTER TABLE `registration_addon`
  MODIFY `reg_addon_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `registration_discount`
--
ALTER TABLE `registration_discount`
  MODIFY `reg_disc_id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `reserved`
--
ALTER TABLE `reserved`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=47;

--
-- AUTO_INCREMENT for table `rewards`
--
ALTER TABLE `rewards`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `updates`
--
ALTER TABLE `updates`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `withdrawals`
--
ALTER TABLE `withdrawals`
  MODIFY `id` int(10) UNSIGNED NOT NULL AUTO_INCREMENT;

-- --------------------------------------------------------

--
-- Structure for view `v_registration_finance`
--
DROP TABLE IF EXISTS `v_registration_finance`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `v_registration_finance`  AS SELECT `r`.`registration_id` AS `registration_id`, `r`.`registration_no` AS `registration_no`, `r`.`status` AS `status`, `p`.`participant_id` AS `participant_id`, `p`.`full_name` AS `full_name`, `p`.`type` AS `participant_type`, `pkg`.`name` AS `package_name`, `pkg`.`price` AS `package_price`, coalesce(sum(`pay`.`amount`),0) AS `total_paid`, `pkg`.`price`- coalesce((select sum(`rd`.`applied_value`) from `registration_discount` `rd` where `rd`.`registration_id` = `r`.`registration_id`),0) + coalesce((select sum(`ra`.`quantity` * `ra`.`unit_price`) from `registration_addon` `ra` where `ra`.`registration_id` = `r`.`registration_id`),0) AS `gross_due`, `pkg`.`price`- coalesce((select sum(`rd`.`applied_value`) from `registration_discount` `rd` where `rd`.`registration_id` = `r`.`registration_id`),0) + coalesce((select sum(`ra`.`quantity` * `ra`.`unit_price`) from `registration_addon` `ra` where `ra`.`registration_id` = `r`.`registration_id`),0) - coalesce(sum(case when `pay`.`status` in ('paid','refunded') then `pay`.`amount` else 0 end),0) AS `balance_due` FROM (((`registration` `r` join `participant` `p` on(`p`.`participant_id` = `r`.`participant_id`)) join `package` `pkg` on(`pkg`.`package_id` = `r`.`package_id`)) left join `payment` `pay` on(`pay`.`registration_id` = `r`.`registration_id` and `pay`.`status` in ('paid','refunded'))) GROUP BY `r`.`registration_id` ;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `alumni_detail`
--
ALTER TABLE `alumni_detail`
  ADD CONSTRAINT `fk_alumni_participant` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`participant_id`) ON DELETE CASCADE;

--
-- Constraints for table `audit_log`
--
ALTER TABLE `audit_log`
  ADD CONSTRAINT `fk_audit_admin` FOREIGN KEY (`actor_admin_id`) REFERENCES `admin_user` (`admin_user_id`),
  ADD CONSTRAINT `fk_audit_participant` FOREIGN KEY (`actor_participant_id`) REFERENCES `participant` (`participant_id`);

--
-- Constraints for table `checkin`
--
ALTER TABLE `checkin`
  ADD CONSTRAINT `fk_checkin_gate` FOREIGN KEY (`gate_id`) REFERENCES `gate` (`gate_id`),
  ADD CONSTRAINT `fk_checkin_registration` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`registration_id`) ON DELETE CASCADE;

--
-- Constraints for table `companion`
--
ALTER TABLE `companion`
  ADD CONSTRAINT `fk_comp_diet` FOREIGN KEY (`dietary_code`) REFERENCES `ref_dietary` (`dietary_code`),
  ADD CONSTRAINT `fk_comp_registration` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`registration_id`) ON DELETE CASCADE,
  ADD CONSTRAINT `fk_comp_size` FOREIGN KEY (`tshirt_size`) REFERENCES `ref_tshirt_size` (`size_code`);

--
-- Constraints for table `discount`
--
ALTER TABLE `discount`
  ADD CONSTRAINT `fk_disc_pkg` FOREIGN KEY (`applicable_package_id`) REFERENCES `package` (`package_id`);

--
-- Constraints for table `event`
--
ALTER TABLE `event`
  ADD CONSTRAINT `fk_event_location` FOREIGN KEY (`location_id`) REFERENCES `location` (`location_id`);

--
-- Constraints for table `guest_detail`
--
ALTER TABLE `guest_detail`
  ADD CONSTRAINT `fk_guest_participant` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`participant_id`) ON DELETE CASCADE;

--
-- Constraints for table `participant`
--
ALTER TABLE `participant`
  ADD CONSTRAINT `fk_participant_diet` FOREIGN KEY (`dietary_code`) REFERENCES `ref_dietary` (`dietary_code`),
  ADD CONSTRAINT `fk_participant_gender` FOREIGN KEY (`gender`) REFERENCES `ref_gender` (`gender_code`),
  ADD CONSTRAINT `fk_participant_size` FOREIGN KEY (`tshirt_size`) REFERENCES `ref_tshirt_size` (`size_code`);

--
-- Constraints for table `payment`
--
ALTER TABLE `payment`
  ADD CONSTRAINT `fk_payment_registration` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`registration_id`) ON DELETE CASCADE;

--
-- Constraints for table `refund`
--
ALTER TABLE `refund`
  ADD CONSTRAINT `fk_refund_payment` FOREIGN KEY (`payment_id`) REFERENCES `payment` (`payment_id`) ON DELETE CASCADE;

--
-- Constraints for table `registration`
--
ALTER TABLE `registration`
  ADD CONSTRAINT `fk_reg_package` FOREIGN KEY (`package_id`) REFERENCES `package` (`package_id`),
  ADD CONSTRAINT `fk_reg_participant` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`participant_id`) ON DELETE CASCADE;

--
-- Constraints for table `registration_addon`
--
ALTER TABLE `registration_addon`
  ADD CONSTRAINT `fk_ra_addon` FOREIGN KEY (`addon_id`) REFERENCES `addon` (`addon_id`),
  ADD CONSTRAINT `fk_ra_registration` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`registration_id`) ON DELETE CASCADE;

--
-- Constraints for table `registration_discount`
--
ALTER TABLE `registration_discount`
  ADD CONSTRAINT `fk_rd_disc` FOREIGN KEY (`discount_id`) REFERENCES `discount` (`discount_id`),
  ADD CONSTRAINT `fk_rd_reg` FOREIGN KEY (`registration_id`) REFERENCES `registration` (`registration_id`) ON DELETE CASCADE;

--
-- Constraints for table `staff_detail`
--
ALTER TABLE `staff_detail`
  ADD CONSTRAINT `fk_staff_participant` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`participant_id`) ON DELETE CASCADE;

--
-- Constraints for table `student_detail`
--
ALTER TABLE `student_detail`
  ADD CONSTRAINT `fk_student_participant` FOREIGN KEY (`participant_id`) REFERENCES `participant` (`participant_id`) ON DELETE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
