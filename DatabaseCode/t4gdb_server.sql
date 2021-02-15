-- phpMyAdmin SQL Dump
-- version 4.7.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 27, 2019 at 06:37 AM
-- Server version: 10.1.28-MariaDB
-- PHP Version: 7.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `t4gdb_server`
--

-- --------------------------------------------------------

--
-- Table structure for table `accounts`
--

CREATE TABLE `accounts` (
  `email` varchar(128) NOT NULL,
  `password` char(32) NOT NULL,
  `creation_date` date NOT NULL,
  `last_login` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `accounts`
--

INSERT INTO `accounts` (`email`, `password`, `creation_date`, `last_login`) VALUES
('admin@admin.com', 'password', '2019-10-23', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `diets`
--

CREATE TABLE `diets` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `tags` varchar(1024) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dishes`
--

CREATE TABLE `dishes` (
  `id` int(11) NOT NULL,
  `name` varchar(128) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `ingredients` varchar(512) DEFAULT NULL,
  `calories` int(11) DEFAULT NULL,
  `protein` int(11) DEFAULT NULL,
  `carbs` int(11) DEFAULT NULL,
  `serving_size` int(11) DEFAULT NULL,
  `serving_measurement` varchar(8) DEFAULT NULL,
  `tags` varchar(1024) DEFAULT NULL,
  `is_user_created` tinyint(1) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dishes`
--

INSERT INTO `dishes` (`id`, `name`, `description`, `ingredients`, `calories`, `protein`, `carbs`, `serving_size`, `serving_measurement`, `tags`, `is_user_created`) VALUES
(1, 'Protein shakes', NULL, NULL, 600, NULL, NULL, 0, '', NULL, 0),
(2, 'Rice', NULL, NULL, 380, NULL, NULL, 2, 'Cups', NULL, 0),
(3, 'Chicken Breasts', NULL, NULL, 280, NULL, NULL, 6, 'Oz', NULL, 0),
(4, 'Peanut Butter and Jelly Sandwich', NULL, NULL, 400, NULL, NULL, 1, 'Unit', NULL, 0),
(5, 'Avocado Toast', NULL, NULL, 300, NULL, NULL, 1, 'Unit', NULL, 0),
(6, 'Mashed Potatoes', NULL, NULL, 430, NULL, NULL, 2, 'Cups', NULL, 0),
(7, 'Rice and Black Beans', NULL, NULL, 695, NULL, NULL, 461, 'Grams', NULL, 0),
(8, 'Cereal', NULL, NULL, 300, NULL, NULL, 2, 'Cups', NULL, 0),
(9, 'Bean and Cheese Burrito', NULL, NULL, 400, NULL, NULL, 1, 'Unit', NULL, 0),
(10, 'Boiled Eggs', NULL, NULL, 320, NULL, NULL, 4, 'Units', NULL, 0),
(11, 'Ice Cream', NULL, NULL, 300, NULL, NULL, 1, 'Cup', NULL, 0),
(12, 'Super Protein shakes', NULL, NULL, 600, NULL, NULL, 0, '', NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dishesindiet`
--

CREATE TABLE `dishesindiet` (
  `dietID` int(11) NOT NULL,
  `dishID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dishesinprofile`
--

CREATE TABLE `dishesinprofile` (
  `profileID` int(11) NOT NULL,
  `dishID` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `profiles`
--

CREATE TABLE `profiles` (
  `id` int(11) NOT NULL,
  `age` int(11) DEFAULT NULL,
  `gender` char(1) DEFAULT NULL,
  `starting_weight` int(11) DEFAULT NULL,
  `target_weight` int(11) DEFAULT NULL,
  `current_weight` int(11) DEFAULT NULL,
  `daily_calorie_intake` int(11) DEFAULT NULL,
  `is_losing_weight` tinyint(1) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL,
  `login_email` varchar(128) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `profiles`
--

INSERT INTO `profiles` (`id`, `age`, `gender`, `starting_weight`, `target_weight`, `current_weight`, `daily_calorie_intake`, `is_losing_weight`, `start_date`, `end_date`, `login_email`) VALUES
(1, 12, 'M', 200, 180, 200, NULL, 1, NULL, NULL, 'admin@admin.com');

-- --------------------------------------------------------

--
-- Table structure for table `usercreateddishes`
--

CREATE TABLE `usercreateddishes` (
  `dishID` int(11) DEFAULT NULL,
  `profileID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `usercreatedworkouts`
--

CREATE TABLE `usercreatedworkouts` (
  `profileID` int(11) DEFAULT NULL,
  `workoutID` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `workouts`
--

CREATE TABLE `workouts` (
  `id` int(11) NOT NULL,
  `name` varchar(64) NOT NULL,
  `description` varchar(1024) DEFAULT NULL,
  `video_link` varchar(64) DEFAULT NULL,
  `default_reps` int(11) NOT NULL,
  `default_sets` int(11) NOT NULL,
  `is_user_created` tinyint(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `workouts`
--

INSERT INTO `workouts` (`id`, `name`, `description`, `video_link`, `default_reps`, `default_sets`, `is_user_created`) VALUES
(1, 'Pushups', '', '', 10, 4, 0),
(2, 'Barbell Bench Press', '', '', 10, 4, 0),
(3, 'Barbell Incline Press', '', '', 10, 4, 0),
(4, 'Triceps pushdown', '', '', 10, 4, 0),
(5, 'Incline Dumbbell BenchPress', '', '', 10, 4, 0),
(6, 'Cardio', '', '', 10, 4, 0),
(7, 'Arnold Dumbbell Press', '', '', 10, 4, 0),
(8, 'Barbell Squat', '', '', 10, 4, 0),
(9, 'Leg press', '', '', 10, 4, 0),
(10, 'Barbell Deadlift', '', '', 10, 4, 0),
(11, 'Incline Bicep curl', '', '', 10, 4, 0),
(12, 'Machine Tricep Pushdowns', '', '', 10, 4, 0),
(13, 'Dumbbell Shrugs', '', '', 10, 4, 0),
(14, 'EZ bar curls', '', '', 10, 4, 0),
(15, 'Decline Bench Press', '', '', 10, 4, 0),
(16, 'Lateral shoulder raises', '', '', 10, 4, 0),
(17, 'Forward shoulder raises', '', '', 10, 4, 0),
(18, 'Sitting calf raises', '', '', 10, 4, 0),
(19, 'Standing calf raises', '', '', 10, 4, 0),
(20, 'Kettlebell deadlift', '', '', 10, 4, 0),
(21, 'Super Pushups', NULL, NULL, 10, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `workoutsinprofile`
--

CREATE TABLE `workoutsinprofile` (
  `workoutID` int(11) NOT NULL,
  `profileID` int(11) NOT NULL,
  `user_reps` int(11) DEFAULT NULL,
  `user_sets` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `accounts`
--
ALTER TABLE `accounts`
  ADD PRIMARY KEY (`email`);

--
-- Indexes for table `diets`
--
ALTER TABLE `diets`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `dishes`
--
ALTER TABLE `dishes`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `dishesindiet`
--
ALTER TABLE `dishesindiet`
  ADD KEY `dietID` (`dietID`),
  ADD KEY `dishID` (`dishID`);

--
-- Indexes for table `dishesinprofile`
--
ALTER TABLE `dishesinprofile`
  ADD KEY `profileID` (`profileID`),
  ADD KEY `dishID` (`dishID`);

--
-- Indexes for table `profiles`
--
ALTER TABLE `profiles`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `login_email` (`login_email`);

--
-- Indexes for table `usercreateddishes`
--
ALTER TABLE `usercreateddishes`
  ADD KEY `profileID` (`profileID`),
  ADD KEY `usercreateddiets_ibfk_1` (`dishID`);

--
-- Indexes for table `usercreatedworkouts`
--
ALTER TABLE `usercreatedworkouts`
  ADD KEY `profileID` (`profileID`),
  ADD KEY `workoutID` (`workoutID`);

--
-- Indexes for table `workouts`
--
ALTER TABLE `workouts`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `name` (`name`);

--
-- Indexes for table `workoutsinprofile`
--
ALTER TABLE `workoutsinprofile`
  ADD KEY `workoutID` (`workoutID`),
  ADD KEY `profileID` (`profileID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `diets`
--
ALTER TABLE `diets`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dishes`
--
ALTER TABLE `dishes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `profiles`
--
ALTER TABLE `profiles`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `workouts`
--
ALTER TABLE `workouts`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=22;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `dishesindiet`
--
ALTER TABLE `dishesindiet`
  ADD CONSTRAINT `dishesindiet_ibfk_1` FOREIGN KEY (`dietID`) REFERENCES `diets` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dishesindiet_ibfk_2` FOREIGN KEY (`dishID`) REFERENCES `dishes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `dishesinprofile`
--
ALTER TABLE `dishesinprofile`
  ADD CONSTRAINT `dishesinprofile_ibfk_1` FOREIGN KEY (`profileID`) REFERENCES `profiles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `dishesinprofile_ibfk_2` FOREIGN KEY (`dishID`) REFERENCES `dishes` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `profiles`
--
ALTER TABLE `profiles`
  ADD CONSTRAINT `profiles_ibfk_1` FOREIGN KEY (`login_email`) REFERENCES `accounts` (`email`) ON DELETE CASCADE;

--
-- Constraints for table `usercreateddishes`
--
ALTER TABLE `usercreateddishes`
  ADD CONSTRAINT `usercreateddishes_ibfk_1` FOREIGN KEY (`dishID`) REFERENCES `dishes` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usercreateddishes_ibfk_2` FOREIGN KEY (`profileID`) REFERENCES `profiles` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `usercreatedworkouts`
--
ALTER TABLE `usercreatedworkouts`
  ADD CONSTRAINT `usercreatedworkouts_ibfk_1` FOREIGN KEY (`profileID`) REFERENCES `profiles` (`id`) ON DELETE CASCADE,
  ADD CONSTRAINT `usercreatedworkouts_ibfk_2` FOREIGN KEY (`workoutID`) REFERENCES `workouts` (`id`) ON DELETE CASCADE;

--
-- Constraints for table `workoutsinprofile`
--
ALTER TABLE `workoutsinprofile`
  ADD CONSTRAINT `workoutsinprofile_ibfk_1` FOREIGN KEY (`workoutID`) REFERENCES `workouts` (`id`),
  ADD CONSTRAINT `workoutsinprofile_ibfk_2` FOREIGN KEY (`profileID`) REFERENCES `profiles` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
