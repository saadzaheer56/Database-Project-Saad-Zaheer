-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: localhost:3307
-- Generation Time: Jan 19, 2026 at 08:33 AM
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
-- Database: `sports_tournament`
--
CREATE DATABASE IF NOT EXISTS `sports_tournament` DEFAULT CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci;
USE `sports_tournament`;

-- --------------------------------------------------------

--
-- Table structure for table `match_officials`
--

CREATE TABLE `match_officials` (
  `official_id` int(11) NOT NULL,
  `official_name` varchar(100) DEFAULT NULL,
  `role` varchar(50) DEFAULT NULL,
  `experience_years` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `match_officials`
--

INSERT INTO `match_officials` (`official_id`, `official_name`, `role`, `experience_years`) VALUES
(1, 'Asad Rauf', 'Umpire', 15),
(2, 'Aleem Dar', 'Chief Umpire', 20),
(3, 'Zahid Malik', 'Third Umpire', 10),
(4, 'Nadeem Khan', 'Referee', 12),
(5, 'Rashid Latif', 'Match Official', 8);

-- --------------------------------------------------------

--
-- Table structure for table `player`
--

CREATE TABLE `player` (
  `player_id` int(11) NOT NULL,
  `player_name` varchar(100) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  `position` varchar(50) DEFAULT NULL,
  `team_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `player`
--

INSERT INTO `player` (`player_id`, `player_name`, `age`, `position`, `team_id`) VALUES
(1, 'Noman Ali', 22, 'Batsman', 101),
(2, 'Ahmed Raza', 23, 'Bowler', 101),
(3, 'Hassan Ali', 21, 'All-Rounder', 102),
(4, 'Usman Khan', 24, 'Wicket Keeper', 102),
(5, 'Faisal Ahmed', 25, 'Batsman', 103),
(6, 'Bilal Hussain', 22, 'Bowler', 103),
(7, 'Kamran Shah', 26, 'All-Rounder', 104),
(8, 'Adeel Malik', 23, 'Bowler', 105),
(9, 'Zubair Khan', 21, 'Batsman', 106),
(10, 'Saad Raza', 24, 'Wicket Keeper', 107);

-- --------------------------------------------------------

--
-- Table structure for table `team`
--

CREATE TABLE `team` (
  `team_id` int(11) NOT NULL,
  `team_name` varchar(100) DEFAULT NULL,
  `coach` varchar(100) DEFAULT NULL,
  `captain` varchar(100) DEFAULT NULL,
  `tournament_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `team`
--

INSERT INTO `team` (`team_id`, `team_name`, `coach`, `captain`, `tournament_id`) VALUES
(101, 'Warriors', 'Ali Khan', 'Ahmed Raza', 1),
(102, 'Strikers', 'Usman Shah', 'Noman Ali', 1),
(103, 'Kings', 'Bilal Ahmed', 'Hassan Raza', 2),
(104, 'Gladiators', 'Kamran Iqbal', 'Faisal Khan', 2),
(105, 'United', 'Imran Malik', 'Shahid Afridi', 3),
(106, 'Falcons', 'Zeeshan Ali', 'Adeel Ahmad', 4),
(107, 'Lions', 'Sohail Akram', 'Waqar Ali', 5);

-- --------------------------------------------------------

--
-- Table structure for table `tournament`
--

CREATE TABLE `tournament` (
  `tournament_id` int(11) NOT NULL,
  `location` varchar(100) DEFAULT NULL,
  `start_date` date DEFAULT NULL,
  `end_date` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tournament`
--

INSERT INTO `tournament` (`tournament_id`, `location`, `start_date`, `end_date`) VALUES
(1, 'Lahore', '2025-01-05', '2025-01-15'),
(2, 'Karachi', '2025-02-01', '2025-02-10'),
(3, 'Islamabad', '2025-03-05', '2025-03-14'),
(4, 'Multan', '2025-04-01', '2025-04-10'),
(5, 'Peshawar', '2025-05-01', '2025-05-12'),
(6, 'charsadda', '2026-01-18', '2026-01-23');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `match_officials`
--
ALTER TABLE `match_officials`
  ADD PRIMARY KEY (`official_id`);

--
-- Indexes for table `player`
--
ALTER TABLE `player`
  ADD PRIMARY KEY (`player_id`),
  ADD KEY `team_id` (`team_id`);

--
-- Indexes for table `team`
--
ALTER TABLE `team`
  ADD PRIMARY KEY (`team_id`),
  ADD KEY `tournament_id` (`tournament_id`);

--
-- Indexes for table `tournament`
--
ALTER TABLE `tournament`
  ADD PRIMARY KEY (`tournament_id`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `player`
--
ALTER TABLE `player`
  ADD CONSTRAINT `player_ibfk_1` FOREIGN KEY (`team_id`) REFERENCES `team` (`team_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `team`
--
ALTER TABLE `team`
  ADD CONSTRAINT `team_ibfk_1` FOREIGN KEY (`tournament_id`) REFERENCES `tournament` (`tournament_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
