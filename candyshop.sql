-- phpMyAdmin SQL Dump
-- version 5.0.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1:3399
-- Generation Time: Oct 10, 2020 at 12:55 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.3.22

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `candyshop`
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
  `id` int(11) NOT NULL,
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
(1, 'Can add log entry', 1, 'add_logentry'),
(2, 'Can change log entry', 1, 'change_logentry'),
(3, 'Can delete log entry', 1, 'delete_logentry'),
(4, 'Can view log entry', 1, 'view_logentry'),
(5, 'Can add permission', 2, 'add_permission'),
(6, 'Can change permission', 2, 'change_permission'),
(7, 'Can delete permission', 2, 'delete_permission'),
(8, 'Can view permission', 2, 'view_permission'),
(9, 'Can add group', 3, 'add_group'),
(10, 'Can change group', 3, 'change_group'),
(11, 'Can delete group', 3, 'delete_group'),
(12, 'Can view group', 3, 'view_group'),
(13, 'Can add user', 4, 'add_user'),
(14, 'Can change user', 4, 'change_user'),
(15, 'Can delete user', 4, 'delete_user'),
(16, 'Can view user', 4, 'view_user'),
(17, 'Can add content type', 5, 'add_contenttype'),
(18, 'Can change content type', 5, 'change_contenttype'),
(19, 'Can delete content type', 5, 'delete_contenttype'),
(20, 'Can view content type', 5, 'view_contenttype'),
(21, 'Can add session', 6, 'add_session'),
(22, 'Can change session', 6, 'change_session'),
(23, 'Can delete session', 6, 'delete_session'),
(24, 'Can view session', 6, 'view_session');

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

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_groups`
--

CREATE TABLE `auth_user_groups` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `group_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `auth_user_user_permissions`
--

CREATE TABLE `auth_user_user_permissions` (
  `id` int(11) NOT NULL,
  `user_id` int(11) NOT NULL,
  `permission_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

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
(1, 'admin', 'logentry'),
(3, 'auth', 'group'),
(2, 'auth', 'permission'),
(4, 'auth', 'user'),
(5, 'contenttypes', 'contenttype'),
(6, 'sessions', 'session');

-- --------------------------------------------------------

--
-- Table structure for table `django_migrations`
--

CREATE TABLE `django_migrations` (
  `id` int(11) NOT NULL,
  `app` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `applied` datetime(6) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `django_migrations`
--

INSERT INTO `django_migrations` (`id`, `app`, `name`, `applied`) VALUES
(1, 'contenttypes', '0001_initial', '2020-10-09 13:23:23.254750'),
(2, 'auth', '0001_initial', '2020-10-09 13:23:23.465159'),
(3, 'admin', '0001_initial', '2020-10-09 13:23:24.132779'),
(4, 'admin', '0002_logentry_remove_auto_add', '2020-10-09 13:23:24.312850'),
(5, 'admin', '0003_logentry_add_action_flag_choices', '2020-10-09 13:23:24.342786'),
(6, 'contenttypes', '0002_remove_content_type_name', '2020-10-09 13:23:24.537358'),
(7, 'auth', '0002_alter_permission_name_max_length', '2020-10-09 13:23:24.694546'),
(8, 'auth', '0003_alter_user_email_max_length', '2020-10-09 13:23:24.730973'),
(9, 'auth', '0004_alter_user_username_opts', '2020-10-09 13:23:24.759896'),
(10, 'auth', '0005_alter_user_last_login_null', '2020-10-09 13:23:24.890004'),
(11, 'auth', '0006_require_contenttypes_0002', '2020-10-09 13:23:24.895037'),
(12, 'auth', '0007_alter_validators_add_error_messages', '2020-10-09 13:23:24.922965'),
(13, 'auth', '0008_alter_user_username_max_length', '2020-10-09 13:23:24.967599'),
(14, 'auth', '0009_alter_user_last_name_max_length', '2020-10-09 13:23:25.034523'),
(15, 'auth', '0010_alter_group_name_max_length', '2020-10-09 13:23:25.058569'),
(16, 'auth', '0011_update_proxy_permissions', '2020-10-09 13:23:25.070567'),
(17, 'auth', '0012_alter_user_first_name_max_length', '2020-10-09 13:23:25.122490'),
(18, 'sessions', '0001_initial', '2020-10-09 13:23:25.186711');

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
('odutfmkbexriurpk5tp0dw79dgiple21', 'eyJjYXJkX3Byb2R1Y3QiOlsiNiIsIjExIiwiMTQiLCIxMyIsIjYiXX0:1kR15j:llICtzvuFmEhhwfKq3qkUXoJbYEAC_MMGuMqj-V6Zas', '2020-10-23 22:42:23.081043');

-- --------------------------------------------------------

--
-- Table structure for table `orderdetail`
--

CREATE TABLE `orderdetail` (
  `id` int(11) NOT NULL,
  `productID` int(11) NOT NULL,
  `userID` int(11) NOT NULL,
  `sheapingDetail` varchar(200) NOT NULL,
  `orderDate` date DEFAULT NULL,
  `deliveryDate` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `orderdetail`
--

INSERT INTO `orderdetail` (`id`, `productID`, `userID`, `sheapingDetail`, `orderDate`, `deliveryDate`) VALUES
(1, 8, 1, '1 product \r\ntotal cost 200+52', '2020-09-23', '2020-09-26'),
(2, 9, 1, 'unfortunately shipment was lost', '2018-11-01', '2020-02-04');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id` int(11) NOT NULL,
  `ProductTitle` varchar(50) NOT NULL,
  `price` double DEFAULT 0,
  `catagory` varchar(50) NOT NULL,
  `brand` varchar(50) NOT NULL,
  `quentity` double DEFAULT 0,
  `imgpath` varchar(900) NOT NULL,
  `product_desc` varchar(900) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id`, `ProductTitle`, `price`, `catagory`, `brand`, `quentity`, `imgpath`, `product_desc`) VALUES
(3, 'Limited Edition Holiday Chocolate Collection', 4830, 'Gift Box', 'GODIVA', 10, '/media/14163-1_UuSTkor.jpg', 'Bring a little magic to your holidays this year with our 32-piece Limited Edition Holiday Chocolate  1242445345345'),
(4, 'Greetings Chocolate Gift Tower', 8500, 'Gift Box', 'GODIVA', 10, '/media/14198-4.jpg', 'Delight your favorite chocolate lovers with a holiday gift that will have them smiling for the entir'),
(6, 'Make It Merry Chocolate Gift Basket', 5000, 'Gift Box', 'GODIVA', 20, '/media/14195-1_LDPQ3PZ.jpg', 'Spread holiday cheer this season with a gourmet chocolate gift basket filled with the most delectabl'),
(7, 'Limited Edition 2020 Holiday Plush bear', 2000, 'Gift Box', 'GODIVA', 20, '/media/14142-1.jpg', 'Surprise loved ones with the sweetest of holiday chocolate gifts: our plush teddy bear holding a red'),
(8, 'Dark Chocolate Peppermint Hot Cocoa Canister 10 Se', 990, 'Gift Box', 'GODIVA', 50, '/media/13288-1.jpg', 'Grab it while you can!\r\n\r\nOur Limited Edition Dark Chocolate Peppermint Hot Cocoa Canister is the pe'),
(9, 'Gold Gift Box', 1500, 'Gift Box', 'GODIVA', 99, '/media/13959-1.jpg', 'Good things come in small packages, and that\'s especially true when you\'re sharing our iconic gold g'),
(10, 'Star Ornament with Wrapped Truffles, Set of 4, 10 ', 300, 'Gift Box', 'GODIVA', 999, '/media/14514-2.jpg', 'Start a new tradition with all of your closest friends and family: Give them each a GODIVA Star Orna'),
(11, 'Sweet Surprise Gift Tower', 5500, 'Gift Box', 'GODIVA', 200, '/media/14552-1.jpg', 'Good things come in sweet packages, like our Sweet Surprise Gift Tower. Topped with an ivory ribbon '),
(12, 'Ultimate Truffle Collection, 80 pc.', 8000, 'Gift Box', 'GODIVA', 5, '/media/78337-1.jpg', 'Wait until you experience the excitement of someone opening the GODIVA Ultimate Truffle Collection.\r'),
(13, 'Patisserie Dessert Truffles', 690, 'Gift Box', 'GODIVA', 95, '/media/11853-1.jpg', 'Your dessert lover will savor every bite of this delicious gift: Godiva chocolate truffles inspired '),
(14, 'Foiled Chocolate Bottles with Liquor Filling: 24-P', 2000, 'chocolat', 'catbary', 100, '/media/130536-01_foiled-chocolate-liquor-bottles-24-piece-display.jpg', 'Oh my, would you just look at the time. It’s candy happy hour and you’ve got a buzz to catch! There’s no happier time than candy hour. Haven’t heard of it before? It’s that sweet spot between sugar and liqueur, where the best of both worlds join to create a tantalizing treat that will rock your world. At CandyWarehouse.com, it’s candy hour all the time and we’re happy to share the cheer by supplying bundles of foiled chocolates with liquor filling.\r\n\r\nShare a 24-count mini chocolate liquor bottle bundle at your next holiday gathering or give it as a gift for the office’s holiday party. Each bottle contains one of four brands of top-shelf booze. Enjoy all the classic name brands that keep you coming back again and again, including Sauza, Rémy Martin®, Jim Beam®, and more. Pick your poison and pass it along. Each rich and delightful mini chocolate liquor bottle features a smooth and creamy'),
(15, 'MILK CHOCOLATE FOIL WRAPPED FALL LEAVES', 350, 'chocolat', 'catbary', 123, '/media/fall_leaves__33115.jpg', 'Milk Chocolate Foil Wrapped Fall Leaves.  Premium milk chocolate shaped leaves and covered in crisp foil wrappers in the colors Fall:  gold, red, purple, and green. \r\n\r\nThey look beautiful and will blend in with your seasonal Thanksgiving, Halloween. or other Fall candy display! \r\n\r\nApproximately 50 pieces per pound.\r\n\r\nLooking for a festive Thanksgiving hostess gift? Take a look at our Fall Leaves Treat Cube!'),
(16, 'Sour Pina Colada Gummy Bears Candy: 3KG Bag', 100, 'tofe', 'catbary', 1000, '/media/134460-01_sour-pina-colada-gummy-bears-candy-3kg-bag.jpg', 'Details\r\nFestive and fun, these Sour Pina Colada Gummy Bears are a unique liquor flavored candy with a tender chew and fabulous flavor profile sure to surprise and delight with every bite! Perfect for the dessert table at your next party or event, Sour Pina Colada Gummy Bears offer a tangy taste sensation similar to the popular cocktail. A tasty treat with the flavor of alcohol, these non alcoholic gummy bears will add a feisty flair to any celebration.\r\n\r\n\r\nThere are approximately 115 pieces per pound.\r\nBear Height: 1 Inch\r\n\r\nBag contains 3 kilograms (about 6.6 pounds) of Sour Pina Colada Gummy Bears Candy.\r\n\r\nMade in Belgium.\r\n\r\nShipping Weight ~ 7 lbs.');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `FastName` varchar(50) NOT NULL,
  `LastName` varchar(50) NOT NULL,
  `email` varchar(200) NOT NULL,
  `Phone` varchar(13) NOT NULL,
  `Cuntry` varchar(50) NOT NULL,
  `City` varchar(50) NOT NULL,
  `Zipcode` varchar(50) NOT NULL,
  `Password` varchar(500) NOT NULL,
  `Gender` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id`, `FastName`, `LastName`, `email`, `Phone`, `Cuntry`, `City`, `Zipcode`, `Password`, `Gender`) VALUES
(1, 'rashed', 'afridi', 'rashedafridi@gmail.com', '01963278613', 'bangladesh', 'dhaka', '1209', '123456', 'male'),
(2, 'rashed', 'afridi', 'rashedafridi@gmail.com', '44654645644', 'bangladesh', 'fcd', 'dvd', 'pbkdf2_sha256$216000$dFBxW6Hj6yul$ODn9SDYM8sY3j1rhCHTo43fKDV5RDb7UA1JWwIQsd4M=', 'male'),
(3, 'af', 'ra', 'rashedafridi@gmail.come', '1632874542', 'bangladesh', 'sd', 'das', 'pbkdf2_sha256$216000$e2ZtdRkPiXPx$9Rao2guu/Qvhr0sphQLI/2zoVRU05yz+xI0/AhXNzJc=', 'female'),
(4, 'sg', 'fs', 'web@g.csd', '12345678910', 'bangladesh', 'xc', 'xc', 'pbkdf2_sha256$216000$ahv1gi8l9deJ$s65gMoSEQvSgAYy24+U9n6AYXvHvCs0JMjYdldaTVZ4=', 'other'),
(5, 'afridi', 'rashed', 'rashed@gmail.com', '10324562154', 'bangladesh', 'dhaka', '1028', 'pbkdf2_sha256$216000$XZ1jPijfqB4P$0zFSl13c2G9SfD6apZ6YlX+uUMsbKsrWivVhGnA93Ns=', 'male');

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
-- Indexes for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `id` (`id`),
  ADD KEY `id_2` (`id`),
  ADD KEY `productID` (`productID`),
  ADD KEY `userID` (`userID`),
  ADD KEY `id_3` (`id`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

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
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_permission`
--
ALTER TABLE `auth_permission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=25;

--
-- AUTO_INCREMENT for table `auth_user`
--
ALTER TABLE `auth_user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_groups`
--
ALTER TABLE `auth_user_groups`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `auth_user_user_permissions`
--
ALTER TABLE `auth_user_user_permissions`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_admin_log`
--
ALTER TABLE `django_admin_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `django_content_type`
--
ALTER TABLE `django_content_type`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `django_migrations`
--
ALTER TABLE `django_migrations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `orderdetail`
--
ALTER TABLE `orderdetail`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

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
-- Constraints for table `orderdetail`
--
ALTER TABLE `orderdetail`
  ADD CONSTRAINT `orderdetail_ibfk_1` FOREIGN KEY (`productID`) REFERENCES `product` (`id`),
  ADD CONSTRAINT `orderdetail_ibfk_2` FOREIGN KEY (`userID`) REFERENCES `user` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
