-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Apr 02, 2024 at 03:20 AM
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
-- Database: `icons`
--

-- --------------------------------------------------------

--
-- Table structure for table `tbl_account`
--

CREATE TABLE `tbl_account` (
  `id` int(11) NOT NULL,
  `email` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `recovery_email` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `role_fkid` int(11) NOT NULL,
  `status` varchar(50) NOT NULL DEFAULT 'allowed'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_account`
--

INSERT INTO `tbl_account` (`id`, `email`, `username`, `recovery_email`, `password`, `timestamp`, `role_fkid`, `status`) VALUES
(39, 'admin.administrator@gmail.com', 'admin', 'admin.recovery@gmail.com', 'admin', '2024-04-02 01:20:08.000000', 1, 'allowed');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_comment`
--

CREATE TABLE `tbl_comment` (
  `id` int(11) NOT NULL,
  `comment` varchar(8000) NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `image` longtext NOT NULL,
  `community_post_fkid` int(11) NOT NULL,
  `account_fkid` int(11) NOT NULL,
  `profile_fkid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_community_post`
--

CREATE TABLE `tbl_community_post` (
  `id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` mediumtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL,
  `image` longtext DEFAULT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `account_fkid` int(11) NOT NULL,
  `profile_fkid` int(11) DEFAULT NULL,
  `views` int(11) NOT NULL,
  `author` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_conversation`
--

CREATE TABLE `tbl_conversation` (
  `id` int(11) NOT NULL,
  `message_content` varchar(8000) NOT NULL,
  `image` longtext NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `message_fkid` int(11) NOT NULL,
  `sender` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_engagement`
--

CREATE TABLE `tbl_engagement` (
  `id` int(11) NOT NULL,
  `is_liked` tinyint(1) NOT NULL,
  `is_disliked` tinyint(1) NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `community_post_fkid` int(11) NOT NULL,
  `account_fkid` int(11) NOT NULL,
  `profile_fkid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_gallery`
--

CREATE TABLE `tbl_gallery` (
  `id` int(11) NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `image` longtext NOT NULL,
  `description` mediumtext NOT NULL,
  `account_fkid` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_home_content`
--

CREATE TABLE `tbl_home_content` (
  `id` int(11) NOT NULL,
  `type` varchar(255) NOT NULL,
  `author` varchar(255) NOT NULL,
  `content` longtext CHARACTER SET utf8mb4 COLLATE utf8mb4_bin NOT NULL CHECK (json_valid(`content`)),
  `image` longtext DEFAULT NULL,
  `account_fkid` int(11) NOT NULL,
  `views` int(11) NOT NULL,
  `status` varchar(100) DEFAULT 'in feed',
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_log`
--

CREATE TABLE `tbl_log` (
  `id` int(11) NOT NULL,
  `page` varchar(255) NOT NULL,
  `times_clicked` varchar(255) NOT NULL,
  `duration` varchar(255) NOT NULL,
  `modification_made` int(11) NOT NULL,
  `keys_pressed` int(11) NOT NULL,
  `created` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_log`
--

INSERT INTO `tbl_log` (`id`, `page`, `times_clicked`, `duration`, `modification_made`, `keys_pressed`, `created`) VALUES
(1, 'community', '300', '5000', 1, 0, '2024-03-22 14:40:53'),
(2, 'community.template.html', '9', '6', 0, 0, '2024-03-22 14:40:53'),
(3, 'community.template.html', '30', '25', 0, 0, '2024-03-22 14:40:53'),
(4, 'community.template.html', '4', '7', 0, 0, '2024-03-22 14:40:53'),
(5, 'community.template.html', '37', '35', 0, 0, '2024-03-22 14:40:53'),
(6, 'community.template.html', '23', '58', 0, 164, '2024-03-22 14:40:53'),
(7, 'community.template.html', '0', '42', 0, 0, '2024-03-22 14:40:53'),
(8, 'community.template.html', '16', '22', 0, 1, '2024-03-22 14:40:53'),
(9, 'messenger.template.html', '13', '17', 0, 0, '2024-03-22 14:40:53'),
(10, 'queries.template.html', '36', '52', 0, 0, '2024-03-22 14:40:53'),
(11, 'programs.template.html', '20', '18', 0, 0, '2024-03-22 14:40:53'),
(12, 'programs.template.html', '1', '1', 0, 2, '2024-03-22 14:40:58'),
(13, 'articles.template.html', '7', '7', 0, 0, '2024-03-22 14:41:05'),
(14, 'articles.template.html', '1', '3', 0, 2, '2024-03-22 14:43:01'),
(15, 'users.template.html', '1', '5', 0, 0, '2024-03-22 14:43:06'),
(16, 'articles.template.html', '1', '83', 0, 0, '2024-03-22 14:44:42'),
(17, 'users.template.html', '0', '15', 0, 0, '2024-03-22 14:44:57');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_login_session`
--

CREATE TABLE `tbl_login_session` (
  `id` int(11) NOT NULL,
  `login_time` datetime DEFAULT current_timestamp(),
  `account_fkid` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_message`
--

CREATE TABLE `tbl_message` (
  `id` int(11) NOT NULL,
  `room` varchar(255) NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `account_fkid_1` int(11) NOT NULL,
  `account_fkid_2` int(11) NOT NULL,
  `profile_fkid_1` int(11) DEFAULT NULL,
  `profile_fkid_2` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_profile`
--

CREATE TABLE `tbl_profile` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL,
  `location` varchar(255) NOT NULL,
  `photo` longtext NOT NULL,
  `timestamp` timestamp(6) NOT NULL DEFAULT current_timestamp(6) ON UPDATE current_timestamp(6),
  `account_fkid` int(11) NOT NULL,
  `bio` varchar(10000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_queries`
--

CREATE TABLE `tbl_queries` (
  `id` int(11) NOT NULL,
  `sender` varchar(255) NOT NULL,
  `subject` varchar(10000) NOT NULL,
  `content` mediumtext NOT NULL,
  `query_status` varchar(100) NOT NULL,
  `created_at` datetime DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_queries`
--

INSERT INTO `tbl_queries` (`id`, `sender`, `subject`, `content`, `query_status`, `created_at`) VALUES
(1, 'malaluanofficial7@gmail.com', 'Request to create new account', 'lorem ipsum dolor', 'unread', '2024-03-22 10:51:28');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_role`
--

CREATE TABLE `tbl_role` (
  `id` int(11) NOT NULL,
  `role` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tbl_role`
--

INSERT INTO `tbl_role` (`id`, `role`) VALUES
(1, 'admin'),
(2, 'startup'),
(3, 'partner');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_service`
--

CREATE TABLE `tbl_service` (
  `id` int(255) NOT NULL,
  `name_of_service` varchar(255) NOT NULL,
  `description` varchar(8000) NOT NULL,
  `profile_fkid` int(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_startup_info`
--

CREATE TABLE `tbl_startup_info` (
  `id` int(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `description` varchar(8000) NOT NULL,
  `link` varchar(255) NOT NULL,
  `profile_fkid` int(255) NOT NULL,
  `title` varchar(5000) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD PRIMARY KEY (`id`),
  ADD KEY `role_fkid` (`role_fkid`);

--
-- Indexes for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_comment_ibfk_1` (`community_post_fkid`),
  ADD KEY `tbl_comment_ibfk_2` (`account_fkid`),
  ADD KEY `tbl_comment_ibfk_3` (`profile_fkid`);

--
-- Indexes for table `tbl_community_post`
--
ALTER TABLE `tbl_community_post`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_community_post_ibfk_1` (`account_fkid`),
  ADD KEY `tbl_community_post_ibfk_2` (`profile_fkid`);

--
-- Indexes for table `tbl_conversation`
--
ALTER TABLE `tbl_conversation`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_conversation_ibfk_1` (`message_fkid`);

--
-- Indexes for table `tbl_engagement`
--
ALTER TABLE `tbl_engagement`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_engagement_ibfk_1` (`community_post_fkid`),
  ADD KEY `tbl_engagement_ibfk_2` (`account_fkid`),
  ADD KEY `tbl_engagement_ibfk_3` (`profile_fkid`);

--
-- Indexes for table `tbl_gallery`
--
ALTER TABLE `tbl_gallery`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_gallery_ibfk_1` (`account_fkid`);

--
-- Indexes for table `tbl_home_content`
--
ALTER TABLE `tbl_home_content`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_home_content_ibfk_1` (`account_fkid`);

--
-- Indexes for table `tbl_log`
--
ALTER TABLE `tbl_log`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_login_session`
--
ALTER TABLE `tbl_login_session`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_login_session_ibfk_1` (`account_fkid`);

--
-- Indexes for table `tbl_message`
--
ALTER TABLE `tbl_message`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `room` (`room`),
  ADD KEY `tbl_message_ibfk_1` (`account_fkid_1`),
  ADD KEY `tbl_message_ibfk_2` (`account_fkid_2`),
  ADD KEY `tbl_message_ibfk_3` (`profile_fkid_1`),
  ADD KEY `tbl_message_ibfk_4` (`profile_fkid_2`);

--
-- Indexes for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_profile_ibfk_1` (`account_fkid`);

--
-- Indexes for table `tbl_queries`
--
ALTER TABLE `tbl_queries`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_role`
--
ALTER TABLE `tbl_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_service_ibfk_1` (`profile_fkid`);

--
-- Indexes for table `tbl_startup_info`
--
ALTER TABLE `tbl_startup_info`
  ADD PRIMARY KEY (`id`),
  ADD KEY `tbl_startup_info_ibfk_1` (`profile_fkid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `tbl_account`
--
ALTER TABLE `tbl_account`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=40;

--
-- AUTO_INCREMENT for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_community_post`
--
ALTER TABLE `tbl_community_post`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=14;

--
-- AUTO_INCREMENT for table `tbl_conversation`
--
ALTER TABLE `tbl_conversation`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `tbl_engagement`
--
ALTER TABLE `tbl_engagement`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `tbl_gallery`
--
ALTER TABLE `tbl_gallery`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_home_content`
--
ALTER TABLE `tbl_home_content`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;

--
-- AUTO_INCREMENT for table `tbl_log`
--
ALTER TABLE `tbl_log`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `tbl_login_session`
--
ALTER TABLE `tbl_login_session`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `tbl_message`
--
ALTER TABLE `tbl_message`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `tbl_queries`
--
ALTER TABLE `tbl_queries`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_role`
--
ALTER TABLE `tbl_role`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `tbl_service`
--
ALTER TABLE `tbl_service`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `tbl_startup_info`
--
ALTER TABLE `tbl_startup_info`
  MODIFY `id` int(255) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `tbl_account`
--
ALTER TABLE `tbl_account`
  ADD CONSTRAINT `tbl_account_ibfk_1` FOREIGN KEY (`role_fkid`) REFERENCES `tbl_role` (`id`);

--
-- Constraints for table `tbl_comment`
--
ALTER TABLE `tbl_comment`
  ADD CONSTRAINT `tbl_comment_ibfk_1` FOREIGN KEY (`community_post_fkid`) REFERENCES `tbl_community_post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_comment_ibfk_2` FOREIGN KEY (`account_fkid`) REFERENCES `tbl_account` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_comment_ibfk_3` FOREIGN KEY (`profile_fkid`) REFERENCES `tbl_profile` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_community_post`
--
ALTER TABLE `tbl_community_post`
  ADD CONSTRAINT `tbl_community_post_ibfk_1` FOREIGN KEY (`account_fkid`) REFERENCES `tbl_account` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_community_post_ibfk_2` FOREIGN KEY (`profile_fkid`) REFERENCES `tbl_profile` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_conversation`
--
ALTER TABLE `tbl_conversation`
  ADD CONSTRAINT `tbl_conversation_ibfk_1` FOREIGN KEY (`message_fkid`) REFERENCES `tbl_message` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_engagement`
--
ALTER TABLE `tbl_engagement`
  ADD CONSTRAINT `tbl_engagement_ibfk_1` FOREIGN KEY (`community_post_fkid`) REFERENCES `tbl_community_post` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_engagement_ibfk_2` FOREIGN KEY (`account_fkid`) REFERENCES `tbl_account` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_engagement_ibfk_3` FOREIGN KEY (`profile_fkid`) REFERENCES `tbl_profile` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_gallery`
--
ALTER TABLE `tbl_gallery`
  ADD CONSTRAINT `tbl_gallery_ibfk_1` FOREIGN KEY (`account_fkid`) REFERENCES `tbl_account` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_home_content`
--
ALTER TABLE `tbl_home_content`
  ADD CONSTRAINT `tbl_home_content_ibfk_1` FOREIGN KEY (`account_fkid`) REFERENCES `tbl_account` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_login_session`
--
ALTER TABLE `tbl_login_session`
  ADD CONSTRAINT `tbl_login_session_ibfk_1` FOREIGN KEY (`account_fkid`) REFERENCES `tbl_account` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_message`
--
ALTER TABLE `tbl_message`
  ADD CONSTRAINT `tbl_message_ibfk_1` FOREIGN KEY (`account_fkid_1`) REFERENCES `tbl_account` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_message_ibfk_2` FOREIGN KEY (`account_fkid_2`) REFERENCES `tbl_account` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_message_ibfk_3` FOREIGN KEY (`profile_fkid_1`) REFERENCES `tbl_profile` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `tbl_message_ibfk_4` FOREIGN KEY (`profile_fkid_2`) REFERENCES `tbl_profile` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_profile`
--
ALTER TABLE `tbl_profile`
  ADD CONSTRAINT `tbl_profile_ibfk_1` FOREIGN KEY (`account_fkid`) REFERENCES `tbl_account` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `tbl_service`
--
ALTER TABLE `tbl_service`
  ADD CONSTRAINT `tbl_service_ibfk_1` FOREIGN KEY (`profile_fkid`) REFERENCES `tbl_profile` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `tbl_startup_info`
--
ALTER TABLE `tbl_startup_info`
  ADD CONSTRAINT `tbl_startup_info_ibfk_1` FOREIGN KEY (`profile_fkid`) REFERENCES `tbl_profile` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
