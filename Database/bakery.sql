-- phpMyAdmin SQL Dump
-- version 5.0.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 01, 2021 at 08:51 AM
-- Server version: 10.4.17-MariaDB
-- PHP Version: 7.2.34

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bakery`
--

-- --------------------------------------------------------

--
-- Table structure for table `auth_group`
--

CREATE TABLE `auth_group` (
  `id` int(11) NOT NULL,
  `name` varchar(150) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_group_permissions`
--

CREATE TABLE `auth_group_permissions` (
  `id` bigint(20) NOT NULL,
  `group_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_permission`
--

CREATE TABLE `auth_permission` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `content_type_id` int(11) NOT NULL,
  `codename` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_permission`
--

INSERT INTO `auth_permission` (`id`, `name`, `content_type_id`, `codename`) VALUES
(1, 'Can add question', 1, 'add_question'),
(2, 'Can change question', 1, 'change_question'),
(3, 'Can delete question', 1, 'delete_question'),
(4, 'Can view question', 1, 'view_question'),
(5, 'Can add choice', 2, 'add_choice'),
(6, 'Can change choice', 2, 'change_choice'),
(7, 'Can delete choice', 2, 'delete_choice'),
(8, 'Can view choice', 2, 'view_choice'),
(9, 'Can add customers', 3, 'add_customers'),
(10, 'Can change customers', 3, 'change_customers'),
(11, 'Can delete customers', 3, 'delete_customers'),
(12, 'Can view customers', 3, 'view_customers'),
(13, 'Can add products', 4, 'add_products'),
(14, 'Can change products', 4, 'change_products'),
(15, 'Can delete products', 4, 'delete_products'),
(16, 'Can view products', 4, 'view_products'),
(17, 'Can add purchase', 5, 'add_purchase'),
(18, 'Can change purchase', 5, 'change_purchase'),
(19, 'Can delete purchase', 5, 'delete_purchase'),
(20, 'Can view purchase', 5, 'view_purchase'),
(21, 'Can add orders', 6, 'add_orders'),
(22, 'Can change orders', 6, 'change_orders'),
(23, 'Can delete orders', 6, 'delete_orders'),
(24, 'Can view orders', 6, 'view_orders'),
(25, 'Can add log entry', 7, 'add_logentry'),
(26, 'Can change log entry', 7, 'change_logentry'),
(27, 'Can delete log entry', 7, 'delete_logentry'),
(28, 'Can view log entry', 7, 'view_logentry'),
(29, 'Can add permission', 8, 'add_permission'),
(30, 'Can change permission', 8, 'change_permission'),
(31, 'Can delete permission', 8, 'delete_permission'),
(32, 'Can view permission', 8, 'view_permission'),
(33, 'Can add group', 9, 'add_group'),
(34, 'Can change group', 9, 'change_group'),
(35, 'Can delete group', 9, 'delete_group'),
(36, 'Can view group', 9, 'view_group'),
(37, 'Can add user', 10, 'add_user'),
(38, 'Can change user', 10, 'change_user'),
(39, 'Can delete user', 10, 'delete_user'),
(40, 'Can view user', 10, 'view_user'),
(41, 'Can add content type', 11, 'add_contenttype'),
(42, 'Can change content type', 11, 'change_contenttype'),
(43, 'Can delete content type', 11, 'delete_contenttype'),
(44, 'Can view content type', 11, 'view_contenttype'),
(45, 'Can add session', 12, 'add_session'),
(46, 'Can change session', 12, 'change_session'),
(47, 'Can delete session', 12, 'delete_session'),
(48, 'Can view session', 12, 'view_session');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user`
--

CREATE TABLE `auth_user` (
  `id` int(11) NOT NULL,
  `password` varchar(128) NOT NULL,
  `last_login` datetime(6) DEFAULT NULL,
  `is_superuser` tinyint(1) NOT NULL,
  `username` varchar(150) NOT NULL,
  `first_name` varchar(150) NOT NULL,
  `last_name` varchar(150) NOT NULL,
  `email` varchar(254) NOT NULL,
  `is_staff` tinyint(1) NOT NULL,
  `is_active` tinyint(1) NOT NULL,
  `date_joined` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `auth_user`
--

INSERT INTO `auth_user` (`id`, `password`, `last_login`, `is_superuser`, `username`, `first_name`, `last_name`, `email`, `is_staff`, `is_active`, `date_joined`) VALUES
(1, 'pbkdf2_sha256$260000$otO20ozGMjZ3BZp1dSR90d$kwEARaVHihNbe2gWgkoVZ0AmlbWeOqPrp4MmyxwkEkI=', '2021-06-01 10:26:25.723823', 1, 'admin', '', '', 'oscarnerf@gmail.com', 1, 1, '2021-06-01 10:26:10.900684');

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `customers`
--

CREATE TABLE `customers` (
  `CName` varchar(50) NOT NULL,
  `CAddress` varchar(100) DEFAULT NULL,
  `CPhoneNumber` varchar(20) DEFAULT NULL,
  `CAllergies` varchar(50) DEFAULT NULL,
  `CEmail` varchar(50) DEFAULT NULL,
  `CID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `customers`
--

INSERT INTO `customers` (`CName`, `CAddress`, `CPhoneNumber`, `CAllergies`, `CEmail`, `CID`) VALUES
('Austin', 'Place', '911', 'Fake Freckles', 'Austin@here.com', 0),
('testt', '', '', '', '', 1),
('test2', '', '', '', '', 2),
('fff', '', '', '', '', 3);

-- --------------------------------------------------------

--
-- Table structure for table `django_admin_log`
--

CREATE TABLE `django_admin_log` (
  `id` int(11) NOT NULL,
  `action_time` datetime(6) NOT NULL,
  `object_id` longtext DEFAULT NULL,
  `object_repr` varchar(200) NOT NULL,
  `action_flag` smallint(5) UNSIGNED NOT NULL CHECK (`action_flag` >= 0),
  `change_message` longtext NOT NULL,
  `content_type_id` int(11) DEFAULT NULL,
  `user_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_admin_log`
--

INSERT INTO `django_admin_log` (`id`, `action_time`, `object_id`, `object_repr`, `action_flag`, `change_message`, `content_type_id`, `user_id`) VALUES
(1, '2021-06-02 08:36:54.946765', '1', 'Why?', 1, '[{\"added\": {}}, {\"added\": {\"name\": \"choice\", \"object\": \"who?\"}}, {\"added\": {\"name\": \"choice\", \"object\": \"What?\"}}]', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `django_content_type`
--

CREATE TABLE `django_content_type` (
  `id` int(11) NOT NULL,
  `app_label` varchar(100) NOT NULL,
  `model` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_content_type`
--

INSERT INTO `django_content_type` (`id`, `app_label`, `model`) VALUES
(7, 'admin', 'logentry'),
(9, 'auth', 'group'),
(8, 'auth', 'permission'),
(10, 'auth', 'user'),
(11, 'contenttypes', 'contenttype'),
(2, 'polls', 'choice'),
(3, 'polls', 'customers'),
(6, 'polls', 'orders'),
(4, 'polls', 'products'),
(5, 'polls', 'purchase'),
(1, 'polls', 'question'),
(12, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` bigint(20) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2021-06-01 09:50:29.956852'),
(2, 'auth', '0001_initial', '2021-06-01 09:50:38.651912'),
(3, 'admin', '0001_initial', '2021-06-01 09:50:41.325676'),
(4, 'admin', '0002_logentry_remove_auto_add', '2021-06-01 09:50:41.357676'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2021-06-01 09:50:41.398661'),
(6, 'contenttypes', '0002_remove_content_type_name', '2021-06-01 09:50:42.206793'),
(7, 'auth', '0002_alter_permission_name_max_length', '2021-06-01 09:50:42.867254'),
(8, 'auth', '0003_alter_user_email_max_length', '2021-06-01 09:50:43.256485'),
(9, 'auth', '0004_alter_user_username_opts', '2021-06-01 09:50:43.306274'),
(10, 'auth', '0005_alter_user_last_login_null', '2021-06-01 09:50:43.923179'),
(11, 'auth', '0006_require_contenttypes_0002', '2021-06-01 09:50:43.985188'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2021-06-01 09:50:44.023523'),
(13, 'auth', '0008_alter_user_username_max_length', '2021-06-01 09:50:44.123277'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2021-06-01 09:50:44.981687'),
(15, 'auth', '0010_alter_group_name_max_length', '2021-06-01 09:50:45.122606'),
(16, 'auth', '0011_update_proxy_permissions', '2021-06-01 09:50:45.156762'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2021-06-01 09:50:45.248027'),
(18, 'polls', '0001_initial', '2021-06-01 09:50:46.410327'),
(19, 'polls', '0002_customer', '2021-06-01 09:50:46.646842'),
(20, 'polls', '0003_auto_20210522_0309', '2021-06-01 09:50:46.776487'),
(21, 'polls', '0004_orders', '2021-06-01 09:50:46.802489'),
(22, 'sessions', '0001_initial', '2021-06-01 09:50:47.314426');

-- --------------------------------------------------------

--
-- Table structure for table `django_session`
--

CREATE TABLE `django_session` (
  `session_key` varchar(40) NOT NULL,
  `session_data` longtext NOT NULL,
  `expire_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_session`
--

INSERT INTO `django_session` (`session_key`, `session_data`, `expire_date`) VALUES
('hebtikt9ae4v0ydq4zqdycgzt19qttoo', '.eJxVjMEOwiAQBf-FsyFAgRaP3vsNhF0WqRpISnsy_rsl6UGvb-bNm_mwb9nvjVa_RHZlkl1-Nwj4pNJBfIRyrxxr2dYFeFf4SRufa6TX7XT_Ajm03LOYnBBj0lKnEQc3qUiJwAgzONQkLFiQg4oqSINGHWEZDAJYcTztpNjnC-TYOBU:1lo1bN:2eAtodP1ciYqtPRc9SDYTH17k1leOyaoi_qNnV34efI', '2021-06-15 10:26:25.749822');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `TransactionID` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `OQuantity` int(11) DEFAULT NULL,
  `OID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`TransactionID`, `PID`, `OQuantity`, `OID`) VALUES
(0, 0, 0, 0),
(0, 0, 20, 1);

-- --------------------------------------------------------

--
-- Table structure for table `polls_choice`
--

CREATE TABLE `polls_choice` (
  `id` bigint(20) NOT NULL,
  `choice_text` varchar(200) NOT NULL,
  `votes` int(11) NOT NULL,
  `question_id` bigint(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `polls_choice`
--

INSERT INTO `polls_choice` (`id`, `choice_text`, `votes`, `question_id`) VALUES
(1, 'who?', 0, 1),
(2, 'What?', 0, 1);

-- --------------------------------------------------------

--
-- Table structure for table `polls_question`
--

CREATE TABLE `polls_question` (
  `id` bigint(20) NOT NULL,
  `question_text` varchar(200) NOT NULL,
  `pub_date` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `polls_question`
--

INSERT INTO `polls_question` (`id`, `question_text`, `pub_date`) VALUES
(1, 'Why?', '2021-06-02 08:36:54.000000');

-- --------------------------------------------------------

--
-- Table structure for table `products`
--

CREATE TABLE `products` (
  `Pname` varchar(50) NOT NULL,
  `PPrice` decimal(5,2) DEFAULT NULL,
  `PAllergens` varchar(100) DEFAULT NULL,
  `PStock` int(11) DEFAULT NULL,
  `PID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `products`
--

INSERT INTO `products` (`Pname`, `PPrice`, `PAllergens`, `PStock`, `PID`) VALUES
('Sugar', '10.88', 'Sugar', 10, 0),
('Expensive', '999.99', '12', 3, 1);

-- --------------------------------------------------------

--
-- Table structure for table `purchase`
--

CREATE TABLE `purchase` (
  `TransactionID` int(11) NOT NULL,
  `CID` int(11) DEFAULT NULL,
  `PID` int(11) DEFAULT NULL,
  `PuQuantity` int(11) DEFAULT NULL,
  `PuOrderDate` date DEFAULT NULL,
  `PuFulfillDate` date DEFAULT NULL,
  `PuPaid` tinyint(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `purchase`
--

INSERT INTO `purchase` (`TransactionID`, `CID`, `PID`, `PuQuantity`, `PuOrderDate`, `PuFulfillDate`, `PuPaid`) VALUES
(0, 0, 0, 10, '2021-06-01', '2021-06-01', 1),
(1, 0, 1, 12, '2021-06-01', '2021-06-01', 0);

-- --------------------------------------------------------

--
-- Stand-in structure for view `tofulfill`
-- (See below for the actual view)
--
CREATE TABLE `tofulfill` (
`TransactionID` int(11)
,`PuOrderDate` date
,`PuFulfillDate` date
,`PuPaid` tinyint(4)
,`Pname` varchar(50)
,`Cname` varchar(50)
,`Caddress` varchar(100)
,`CPhoneNumber` varchar(20)
,`CID` int(11)
);

-- --------------------------------------------------------

--
-- Stand-in structure for view `unpaid`
-- (See below for the actual view)
--
CREATE TABLE `unpaid` (
`TransactionID` int(11)
,`PuQuantity` int(11)
,`PuOrderDate` date
,`PuFulfillDate` date
,`PuPaid` tinyint(4)
,`Pname` varchar(50)
,`Cname` varchar(50)
,`CID` int(11)
);

-- --------------------------------------------------------

--
-- Structure for view `tofulfill`
--
DROP TABLE IF EXISTS `tofulfill`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `tofulfill`  AS SELECT `purchase`.`TransactionID` AS `TransactionID`, `purchase`.`PuOrderDate` AS `PuOrderDate`, `purchase`.`PuFulfillDate` AS `PuFulfillDate`, `purchase`.`PuPaid` AS `PuPaid`, `products`.`Pname` AS `Pname`, `customers`.`CName` AS `Cname`, `customers`.`CAddress` AS `Caddress`, `customers`.`CPhoneNumber` AS `CPhoneNumber`, `customers`.`CID` AS `CID` FROM ((`purchase` join `products` on(`purchase`.`PID` = `products`.`PID`)) join `customers` on(`purchase`.`CID` = `customers`.`CID`)) WHERE `purchase`.`PuFulfillDate` > curdate() ;

-- --------------------------------------------------------

--
-- Structure for view `unpaid`
--
DROP TABLE IF EXISTS `unpaid`;

CREATE ALGORITHM=UNDEFINED DEFINER=`root`@`localhost` SQL SECURITY DEFINER VIEW `unpaid`  AS SELECT `purchase`.`TransactionID` AS `TransactionID`, `purchase`.`PuQuantity` AS `PuQuantity`, `purchase`.`PuOrderDate` AS `PuOrderDate`, `purchase`.`PuFulfillDate` AS `PuFulfillDate`, `purchase`.`PuPaid` AS `PuPaid`, `products`.`Pname` AS `Pname`, `customers`.`CName` AS `Cname`, `purchase`.`CID` AS `CID` FROM ((`purchase` join `products` on(`purchase`.`PID` = `products`.`PID`)) join `customers` on(`purchase`.`CID` = `customers`.`CID`)) ;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `auth_group`
--
ALTER TABLE `auth_group`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_group_permissions_group_id_permission_id_0cd325b0_uniq` (`group_id`,`permission_id`),
  ADD KEY `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_permission_content_type_id_codename_01ab375a_uniq` (`content_type_id`,`codename`);

--
-- Indexes for table `auth_user`
--
ALTER TABLE `auth_user`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indexes for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_groups_user_id_group_id_94350c0c_uniq` (`user_id`,`group_id`),
  ADD KEY `auth_user_groups_group_id_97559544_fk_auth_group_id` (`group_id`);

--
-- Indexes for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `auth_user_user_permissions_user_id_permission_id_14a6b632_uniq` (`user_id`,`permission_id`),
  ADD KEY `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` (`permission_id`);

--
-- Indexes for table `customers`
--
ALTER TABLE `customers`
  ADD PRIMARY KEY (`CID`);

--
-- Indexes for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `django_admin_log_content_type_id_c4bce8eb_fk_django_co` (`content_type_id`),
  ADD KEY `django_admin_log_user_id_c564eba6_fk_auth_user_id` (`user_id`);

--
-- Indexes for table `django_content_type`
--
ALTER TABLE `django_content_type`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `django_content_type_app_label_model_76bd3d3b_uniq` (`app_label`,`model`);

--
-- Indexes for table `django_migrations`
--
ALTER TABLE `django_migrations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `django_session`
--
ALTER TABLE `django_session`
  ADD PRIMARY KEY (`session_key`),
  ADD KEY `django_session_expire_date_a5c62663` (`expire_date`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`OID`),
  ADD KEY `PID` (`PID`),
  ADD KEY `TransactionID` (`TransactionID`);

--
-- Indexes for table `polls_choice`
--
ALTER TABLE `polls_choice`
  ADD PRIMARY KEY (`id`),
  ADD KEY `polls_choice_question_id_c5b4b260_fk_polls_question_id` (`question_id`);

--
-- Indexes for table `polls_question`
--
ALTER TABLE `polls_question`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`PID`);

--
-- Indexes for table `purchase`
--
ALTER TABLE `purchase`
  ADD PRIMARY KEY (`TransactionID`),
  ADD KEY `CID` (`CID`),
  ADD KEY `PID` (`PID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `auth_group`
--
ALTER TABLE `auth_group`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=49;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=23;

--
-- AUTO_INCREMENT for table `polls_choice`
--
ALTER TABLE `polls_choice`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `polls_question`
--
ALTER TABLE `polls_question`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `auth_group_permissions`
--
ALTER TABLE `auth_group_permissions`
  ADD CONSTRAINT `auth_group_permissio_permission_id_84c5c92e_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_group_permissions_group_id_b120cbf9_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`);

--
-- Constraints for table `auth_permission`
--
ALTER TABLE `auth_permission`
  ADD CONSTRAINT `auth_permission_content_type_id_2f476e4b_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`);

--
-- Constraints for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  ADD CONSTRAINT `auth_user_groups_group_id_97559544_fk_auth_group_id` FOREIGN KEY (`group_id`) REFERENCES `auth_group` (`id`),
  ADD CONSTRAINT `auth_user_groups_user_id_6a12ed8b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  ADD CONSTRAINT `auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm` FOREIGN KEY (`permission_id`) REFERENCES `auth_permission` (`id`),
  ADD CONSTRAINT `auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  ADD CONSTRAINT `django_admin_log_content_type_id_c4bce8eb_fk_django_co` FOREIGN KEY (`content_type_id`) REFERENCES `django_content_type` (`id`),
  ADD CONSTRAINT `django_admin_log_user_id_c564eba6_fk_auth_user_id` FOREIGN KEY (`user_id`) REFERENCES `auth_user` (`id`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`PID`) REFERENCES `products` (`PID`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`TransactionID`) REFERENCES `purchase` (`TransactionID`);

--
-- Constraints for table `polls_choice`
--
ALTER TABLE `polls_choice`
  ADD CONSTRAINT `polls_choice_question_id_c5b4b260_fk_polls_question_id` FOREIGN KEY (`question_id`) REFERENCES `polls_question` (`id`);

--
-- Constraints for table `purchase`
--
ALTER TABLE `purchase`
  ADD CONSTRAINT `purchase_ibfk_1` FOREIGN KEY (`CID`) REFERENCES `customers` (`CID`),
  ADD CONSTRAINT `purchase_ibfk_2` FOREIGN KEY (`PID`) REFERENCES `products` (`PID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
