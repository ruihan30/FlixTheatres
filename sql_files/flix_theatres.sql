-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 06, 2024 at 05:14 AM
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
-- Database: `flix_theatres`
--

-- --------------------------------------------------------

--
-- Table structure for table `bookings`
--

CREATE TABLE `bookings` (
  `booking_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `showtime_id` int(11) NOT NULL,
  `booking_time` datetime DEFAULT current_timestamp(),
  `total_price` decimal(10,2) NOT NULL,
  `customer_name` varchar(100) NOT NULL,
  `email` varchar(100) NOT NULL,
  `contact_number` varchar(15) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bookings`
--

INSERT INTO `bookings` (`booking_id`, `movie_id`, `hall_id`, `showtime_id`, `booking_time`, `total_price`, `customer_name`, `email`, `contact_number`) VALUES
(1, 1, 1, 1, '2024-11-06 12:13:36', 66.50, 'Chua Rui Han', 'chuaruihan8@gmail.com', '12345678');

-- --------------------------------------------------------

--
-- Table structure for table `cinema_halls`
--

CREATE TABLE `cinema_halls` (
  `hall_id` int(11) NOT NULL,
  `location_name` varchar(100) DEFAULT NULL,
  `cinema_type` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `cinema_halls`
--

INSERT INTO `cinema_halls` (`hall_id`, `location_name`, `cinema_type`) VALUES
(1, 'FT Bishan', 'IMAX'),
(2, 'FT Sembawang', 'Premiere'),
(3, 'FT Bedok', 'Lumiere'),
(4, 'FT Katong', 'IMAX');

-- --------------------------------------------------------

--
-- Table structure for table `food_combos`
--

CREATE TABLE `food_combos` (
  `combo_id` int(11) NOT NULL,
  `combo_name` varchar(100) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `img_url` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_combos`
--

INSERT INTO `food_combos` (`combo_id`, `combo_name`, `price`, `img_url`) VALUES
(1, 'Regular Popcorn Combo', 8.50, 'assets/regular-combo.png'),
(2, 'Large Popcorn Combo', 8.50, 'assets/large-combo.png');

-- --------------------------------------------------------

--
-- Table structure for table `food_combos_ordered`
--

CREATE TABLE `food_combos_ordered` (
  `order_id` int(11) NOT NULL,
  `combo_id` int(11) NOT NULL,
  `sub_price` decimal(10,2) NOT NULL,
  `quantity` int(11) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `food_combos_ordered`
--

INSERT INTO `food_combos_ordered` (`order_id`, `combo_id`, `sub_price`, `quantity`, `booking_id`) VALUES
(1, 1, 8.50, 1, 1),
(2, 2, 17.00, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `movies`
--

CREATE TABLE `movies` (
  `movie_id` int(11) NOT NULL,
  `title` varchar(255) NOT NULL,
  `poster_url` varchar(255) DEFAULT NULL,
  `banner_url` varchar(255) DEFAULT NULL,
  `content_rating` varchar(50) NOT NULL,
  `content_rating_description` varchar(50) DEFAULT NULL,
  `rating` decimal(2,1) DEFAULT NULL,
  `trailer_link` varchar(255) DEFAULT NULL,
  `synopsis` text DEFAULT NULL,
  `language` varchar(50) NOT NULL,
  `duration` int(11) NOT NULL,
  `genre1` varchar(50) NOT NULL,
  `genre2` varchar(50) DEFAULT NULL,
  `director` varchar(100) NOT NULL,
  `casts` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `movies`
--

INSERT INTO `movies` (`movie_id`, `title`, `poster_url`, `banner_url`, `content_rating`, `content_rating_description`, `rating`, `trailer_link`, `synopsis`, `language`, `duration`, `genre1`, `genre2`, `director`, `casts`) VALUES
(1, 'Alien Romulus', 'https://m.media-amazon.com/images/I/614lcZY032L.jpg', 'https://www.irishtimes.com/resizer/v2/2ORNOHCEOFED7AK5B6NEWJ4RZI.jpg?smart=true&auth=b0e0ea278f80e6f24480beec81308c546a03fe5a03242d1487fb49ee7031b18a&width=1200&height=630', 'NC16', 'Gore & violence', 4.5, 'https://www.youtube.com/watch?v=x0XDEhP4MQs', 'Space colonizers come face to face with the most terrifying life-form in the universe while scavenging the deep ends of a derelict space station.', 'English (Chinese Subbed)', 119, 'Horror', 'Thriller', 'Fede Álvarez', 'Cailee Spaeny, David Jonsson, Archie Renaux, Isabela Merced, Spike Fearn, Aileen Wu'),
(2, 'Beetlejuice Beetlejuice', 'https://m.media-amazon.com/images/I/71YA6AM-V8L.jpg', 'https://www.beetlejuicemovie.com/toolkit/img/bannerImg_m.jpg', 'PG13', 'Some frightening scenes & coarse language', 4.0, 'https://www.youtube.com/watch?v=CoZqL9N6Rx4', 'Three generations of the Deetz family return home to Winter River after an unexpected family tragedy. Still haunted by Beetlejuice, Lydia\'s life soon gets turned upside down when her rebellious teenage daughter discovers a mysterious portal to the afterlife. When someone says Beetlejuice\'s name three times, the mischievous demon gleefully returns to unleash his very own brand of mayhem.', 'English (Chinese Subbed)', 105, 'Fantasy', 'Sci-Fi', 'Tim Burton', 'Michael Keaton, Catherine O\'Hara, Winona Ryder, Jenna Ortega, Willem Dafoe'),
(3, 'Marvel Studio\'s Deadpool & Wolverine', 'https://m.media-amazon.com/images/I/810zZ6ger0L._AC_UF894,1000_QL80_.jpg', 'https://miro.medium.com/v2/resize:fit:1400/1*B6zJAX5gnzxj7AYOtR8reQ.png', 'M18', 'Violence & coarse language', 4.3, 'https://www.youtube.com/watch?v=73_1biulkYk', 'Deadpool\'s peaceful existence comes crashing down when the Time Variance Authority recruits him to help safeguard the multiverse. He soon unites with his would-be pal, Wolverine, to complete the mission and save his world from an existential threat.', 'English (Chinese Subbed)', 127, 'Action', 'Comedy', 'Shawn Levy', 'Ryan Reynolds, Hugh Jackman, Emma Corrin, Morena Baccarin, Rob Delaney, Leslie Uggams, Aaron Stanford, Matthew Macfadyen'),
(4, 'Jung Kook: I Am Still', 'https://m.media-amazon.com/images/M/MV5BNzJmNDBkOTMtYmI0OS00NGM1LWE3MjEtYzliYjNiY2FmZjUzXkEyXkFqcGc@._V1_FMjpg_UX1000_.jpg', 'https://philstarlife.s3.ap-east-1.amazonaws.com/pslife_photos/Yoniel_temp/August%202024/banner%20jung%20kook.jpg', 'PG', NULL, 5.0, 'https://www.youtube.com/watch?v=LWkh_hXeEeg', 'Through exclusive, unseen interviews and behind-the-scenes footage, alongside electrifying concert performances, this brand new film showcases Jung Kook\'s eight-month journey, capturing his unwavering dedication and growth.', 'English (Chinese Subbed)', 93, 'Documentary', NULL, 'Park Jun Soo', 'Jimin, Jung Kook');

-- --------------------------------------------------------

--
-- Table structure for table `seats`
--

CREATE TABLE `seats` (
  `seat_id` int(11) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `showtime_id` int(11) NOT NULL,
  `seat_number` varchar(10) NOT NULL,
  `seat_type` varchar(50) DEFAULT NULL,
  `is_available` tinyint(1) DEFAULT 1,
  `booking_id` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `seats`
--

INSERT INTO `seats` (`seat_id`, `hall_id`, `showtime_id`, `seat_number`, `seat_type`, `is_available`, `booking_id`) VALUES
(1, 1, 1, 'A1', 'Standard', 1, NULL),
(2, 1, 1, 'A2', 'Standard', 1, NULL),
(3, 1, 1, 'A3', 'Standard', 0, NULL),
(4, 1, 1, 'A4', 'Standard', 1, NULL),
(5, 1, 1, 'A5', 'Standard', 1, NULL),
(6, 1, 1, 'A6', 'Standard', 1, NULL),
(7, 1, 1, 'A7', 'Standard', 1, NULL),
(8, 1, 1, 'A8', 'Wheelchair', 1, NULL),
(9, 1, 1, 'A9', 'Wheelchair', 0, NULL),
(10, 1, 1, 'B1', 'Standard', 1, NULL),
(11, 1, 1, 'B2', 'Standard', 1, NULL),
(12, 1, 1, 'B3', 'Standard', 1, NULL),
(13, 1, 1, 'B4', 'Standard', 0, NULL),
(14, 1, 1, 'B5', 'Standard', 1, NULL),
(15, 1, 1, 'B6', 'Standard', 1, NULL),
(16, 1, 1, 'B7', 'Standard', 1, NULL),
(17, 1, 1, 'B8', 'Standard', 1, NULL),
(18, 1, 1, 'B9', 'Wheelchair', 1, NULL),
(19, 1, 1, 'C1', 'Standard', 1, NULL),
(20, 1, 1, 'C2', 'Standard', 1, NULL),
(21, 1, 1, 'C3', 'Standard', 1, NULL),
(22, 1, 1, 'C4', 'Standard', 1, NULL),
(23, 1, 1, 'C5', 'Standard', 1, NULL),
(24, 1, 1, 'C6', 'Standard', 0, NULL),
(25, 1, 1, 'C7', 'Standard', 1, NULL),
(26, 1, 1, 'C8', 'Standard', 1, NULL),
(27, 1, 1, 'C9', 'Standard', 1, NULL),
(28, 1, 1, 'D1', 'Standard', 1, NULL),
(29, 1, 1, 'D2', 'Standard', 0, NULL),
(30, 1, 1, 'D3', 'Standard', 1, NULL),
(31, 1, 1, 'D4', 'Standard', 1, NULL),
(32, 1, 1, 'D5', 'Standard', 1, NULL),
(33, 1, 1, 'D6', 'Standard', 0, 1),
(34, 1, 1, 'D7', 'Standard', 0, 1),
(35, 1, 1, 'D8', 'Standard', 1, NULL),
(36, 1, 1, 'D9', 'Standard', 1, NULL),
(37, 1, 1, 'E1', 'Standard', 1, NULL),
(38, 1, 1, 'E2', 'Standard', 1, NULL),
(39, 1, 1, 'E3', 'Standard', 1, NULL),
(40, 1, 1, 'E4', 'Standard', 0, NULL),
(41, 1, 1, 'E5', 'Standard', 1, NULL),
(42, 1, 1, 'E6', 'Standard', 1, NULL),
(43, 1, 1, 'E7', 'Standard', 1, NULL),
(44, 1, 1, 'E8', 'Standard', 1, NULL),
(45, 1, 1, 'E9', 'Standard', 1, NULL),
(46, 1, 1, 'F1', 'Standard', 1, NULL),
(47, 1, 1, 'F2', 'Standard', 1, NULL),
(48, 1, 1, 'F3', 'Standard', 1, NULL),
(49, 1, 1, 'F4', 'Standard', 1, NULL),
(50, 1, 1, 'F5', 'Standard', 1, NULL),
(51, 1, 1, 'F6', 'Standard', 1, NULL),
(52, 1, 1, 'F7', 'Standard', 0, NULL),
(53, 1, 1, 'F8', 'Standard', 1, NULL),
(54, 1, 1, 'F9', 'Standard', 1, NULL),
(55, 1, 1, 'G1', 'Standard', 1, NULL),
(56, 1, 1, 'G2', 'Standard', 1, NULL),
(57, 1, 1, 'G3', 'Standard', 1, NULL),
(58, 1, 1, 'G4', 'Standard', 1, NULL),
(59, 1, 1, 'G5', 'Standard', 1, NULL),
(60, 1, 1, 'G6', 'Standard', 1, NULL),
(61, 1, 1, 'G7', 'Standard', 1, NULL),
(62, 1, 1, 'G8', 'Standard', 0, NULL),
(63, 1, 1, 'G9', 'Standard', 1, NULL),
(64, 1, 2, 'A1', 'Standard', 1, NULL),
(65, 1, 2, 'A2', 'Standard', 0, NULL),
(66, 1, 2, 'A3', 'Standard', 1, NULL),
(67, 1, 2, 'A4', 'Standard', 0, NULL),
(68, 1, 2, 'A5', 'Standard', 1, NULL),
(69, 1, 2, 'A6', 'Standard', 0, NULL),
(70, 1, 2, 'A7', 'Standard', 1, NULL),
(71, 1, 2, 'A8', 'Wheelchair', 0, NULL),
(72, 1, 2, 'A9', 'Wheelchair', 1, NULL),
(73, 1, 2, 'B1', 'Standard', 0, NULL),
(74, 1, 2, 'B2', 'Standard', 1, NULL),
(75, 1, 2, 'B3', 'Standard', 1, NULL),
(76, 1, 2, 'B4', 'Standard', 1, NULL),
(77, 1, 2, 'B5', 'Standard', 0, NULL),
(78, 1, 2, 'B6', 'Standard', 1, NULL),
(79, 1, 2, 'B7', 'Standard', 0, NULL),
(80, 1, 2, 'B8', 'Standard', 1, NULL),
(81, 1, 2, 'B9', 'Wheelchair', 1, NULL),
(82, 1, 2, 'C1', 'Standard', 1, NULL),
(83, 1, 2, 'C2', 'Standard', 0, NULL),
(84, 1, 2, 'C3', 'Standard', 1, NULL),
(85, 1, 2, 'C4', 'Standard', 1, NULL),
(86, 1, 2, 'C5', 'Standard', 1, NULL),
(87, 1, 2, 'C6', 'Standard', 1, NULL),
(88, 1, 2, 'C7', 'Standard', 0, NULL),
(89, 1, 2, 'C8', 'Standard', 1, NULL),
(90, 1, 2, 'C9', 'Standard', 0, NULL),
(91, 1, 2, 'D1', 'Standard', 0, NULL),
(92, 1, 2, 'D2', 'Standard', 1, NULL),
(93, 1, 2, 'D3', 'Standard', 0, NULL),
(94, 1, 2, 'D4', 'Standard', 1, NULL),
(95, 1, 2, 'D5', 'Standard', 1, NULL),
(96, 1, 2, 'D6', 'Standard', 0, NULL),
(97, 1, 2, 'D7', 'Standard', 1, NULL),
(98, 1, 2, 'D8', 'Standard', 1, NULL),
(99, 1, 2, 'D9', 'Standard', 0, NULL),
(100, 1, 2, 'E1', 'Standard', 1, NULL),
(101, 1, 2, 'E2', 'Standard', 1, NULL),
(102, 1, 2, 'E3', 'Standard', 1, NULL),
(103, 1, 2, 'E4', 'Standard', 0, NULL),
(104, 1, 2, 'E5', 'Standard', 1, NULL),
(105, 1, 2, 'E6', 'Standard', 1, NULL),
(106, 1, 2, 'E7', 'Standard', 1, NULL),
(107, 1, 2, 'E8', 'Standard', 1, NULL),
(108, 1, 2, 'E9', 'Standard', 1, NULL),
(109, 1, 2, 'F1', 'Standard', 1, NULL),
(110, 1, 2, 'F2', 'Standard', 1, NULL),
(111, 1, 2, 'F3', 'Standard', 1, NULL),
(112, 1, 2, 'F4', 'Standard', 1, NULL),
(113, 1, 2, 'F5', 'Standard', 1, NULL),
(114, 1, 2, 'F6', 'Standard', 1, NULL),
(115, 1, 2, 'F7', 'Standard', 0, NULL),
(116, 1, 2, 'F8', 'Standard', 1, NULL),
(117, 1, 2, 'F9', 'Standard', 1, NULL),
(118, 1, 2, 'G1', 'Standard', 1, NULL),
(119, 1, 2, 'G2', 'Standard', 1, NULL),
(120, 1, 2, 'G3', 'Standard', 1, NULL),
(121, 1, 2, 'G4', 'Standard', 1, NULL),
(122, 1, 2, 'G5', 'Standard', 1, NULL),
(123, 1, 2, 'G6', 'Standard', 1, NULL),
(124, 1, 2, 'G7', 'Standard', 1, NULL),
(125, 1, 2, 'G8', 'Standard', 0, NULL),
(126, 1, 2, 'G9', 'Standard', 1, NULL),
(127, 1, 3, 'A1', 'Standard', 1, NULL),
(128, 1, 3, 'A2', 'Standard', 1, NULL),
(129, 1, 3, 'A3', 'Standard', 0, NULL),
(130, 1, 3, 'A4', 'Standard', 1, NULL),
(131, 1, 3, 'A5', 'Standard', 0, NULL),
(132, 1, 3, 'A6', 'Standard', 1, NULL),
(133, 1, 3, 'A7', 'Standard', 0, NULL),
(134, 1, 3, 'A8', 'Wheelchair', 1, NULL),
(135, 1, 3, 'A9', 'Wheelchair', 0, NULL),
(136, 1, 3, 'B1', 'Standard', 0, NULL),
(137, 1, 3, 'B2', 'Standard', 1, NULL),
(138, 1, 3, 'B3', 'Standard', 1, NULL),
(139, 1, 3, 'B4', 'Standard', 1, NULL),
(140, 1, 3, 'B5', 'Standard', 0, NULL),
(141, 1, 3, 'B6', 'Standard', 1, NULL),
(142, 1, 3, 'B7', 'Standard', 1, NULL),
(143, 1, 3, 'B8', 'Standard', 0, NULL),
(144, 1, 3, 'B9', 'Wheelchair', 1, NULL),
(145, 1, 3, 'C1', 'Standard', 1, NULL),
(146, 1, 3, 'C2', 'Standard', 0, NULL),
(147, 1, 3, 'C3', 'Standard', 1, NULL),
(148, 1, 3, 'C4', 'Standard', 0, NULL),
(149, 1, 3, 'C5', 'Standard', 1, NULL),
(150, 1, 3, 'C6', 'Standard', 1, NULL),
(151, 1, 3, 'C7', 'Standard', 0, NULL),
(152, 1, 3, 'C8', 'Standard', 1, NULL),
(153, 1, 3, 'C9', 'Standard', 1, NULL),
(154, 1, 3, 'D1', 'Standard', 1, NULL),
(155, 1, 3, 'D2', 'Standard', 1, NULL),
(156, 1, 3, 'D3', 'Standard', 0, NULL),
(157, 1, 3, 'D4', 'Standard', 1, NULL),
(158, 1, 3, 'D5', 'Standard', 1, NULL),
(159, 1, 3, 'D6', 'Standard', 0, NULL),
(160, 1, 3, 'D7', 'Standard', 1, NULL),
(161, 1, 3, 'D8', 'Standard', 0, NULL),
(162, 1, 3, 'D9', 'Standard', 1, NULL),
(163, 1, 3, 'E1', 'Standard', 0, NULL),
(164, 1, 3, 'E2', 'Standard', 1, NULL),
(165, 1, 3, 'E3', 'Standard', 0, NULL),
(166, 1, 3, 'E4', 'Standard', 1, NULL),
(167, 1, 3, 'E5', 'Standard', 0, NULL),
(168, 1, 3, 'E6', 'Standard', 1, NULL),
(169, 1, 3, 'E7', 'Standard', 1, NULL),
(170, 1, 3, 'E8', 'Standard', 0, NULL),
(171, 1, 3, 'E9', 'Standard', 1, NULL),
(172, 1, 3, 'F1', 'Standard', 1, NULL),
(173, 1, 3, 'F2', 'Standard', 0, NULL),
(174, 1, 3, 'F3', 'Standard', 1, NULL),
(175, 1, 3, 'F4', 'Standard', 0, NULL),
(176, 1, 3, 'F5', 'Standard', 1, NULL),
(177, 1, 3, 'F6', 'Standard', 1, NULL),
(178, 1, 3, 'F7', 'Standard', 0, NULL),
(179, 1, 3, 'F8', 'Standard', 1, NULL),
(180, 1, 3, 'F9', 'Standard', 1, NULL),
(181, 1, 3, 'G1', 'Standard', 1, NULL),
(182, 1, 3, 'G2', 'Standard', 1, NULL),
(183, 1, 3, 'G3', 'Standard', 0, NULL),
(184, 1, 3, 'G4', 'Standard', 1, NULL),
(185, 1, 3, 'G5', 'Standard', 0, NULL),
(186, 1, 3, 'G6', 'Standard', 1, NULL),
(187, 1, 3, 'G7', 'Standard', 1, NULL),
(188, 1, 3, 'G8', 'Standard', 0, NULL),
(189, 1, 3, 'G9', 'Standard', 1, NULL),
(190, 2, 4, 'A1', 'Standard', 1, NULL),
(191, 2, 4, 'A2', 'Standard', 0, NULL),
(192, 2, 4, 'A3', 'Standard', 1, NULL),
(193, 2, 4, 'A4', 'Standard', 1, NULL),
(194, 2, 4, 'A5', 'Standard', 0, NULL),
(195, 2, 4, 'A6', 'Standard', 1, NULL),
(196, 2, 4, 'A7', 'Standard', 1, NULL),
(197, 2, 4, 'A8', 'Wheelchair', 0, NULL),
(198, 2, 4, 'A9', 'Wheelchair', 1, NULL),
(199, 2, 4, 'B1', 'Standard', 1, NULL),
(200, 2, 4, 'B2', 'Standard', 0, NULL),
(201, 2, 4, 'B3', 'Standard', 1, NULL),
(202, 2, 4, 'B4', 'Standard', 1, NULL),
(203, 2, 4, 'B5', 'Standard', 0, NULL),
(204, 2, 4, 'B6', 'Standard', 0, NULL),
(205, 2, 4, 'B7', 'Standard', 1, NULL),
(206, 2, 4, 'B8', 'Standard', 0, NULL),
(207, 2, 4, 'B9', 'Wheelchair', 1, NULL),
(208, 2, 4, 'C1', 'Standard', 1, NULL),
(209, 2, 4, 'C2', 'Standard', 0, NULL),
(210, 2, 4, 'C3', 'Standard', 1, NULL),
(211, 2, 4, 'C4', 'Standard', 1, NULL),
(212, 2, 4, 'C5', 'Standard', 0, NULL),
(213, 2, 4, 'C6', 'Standard', 1, NULL),
(214, 2, 4, 'C7', 'Standard', 0, NULL),
(215, 2, 4, 'C8', 'Standard', 1, NULL),
(216, 2, 4, 'C9', 'Standard', 0, NULL),
(217, 2, 4, 'D1', 'Standard', 0, NULL),
(218, 2, 4, 'D2', 'Standard', 1, NULL),
(219, 2, 4, 'D3', 'Standard', 1, NULL),
(220, 2, 4, 'D4', 'Standard', 0, NULL),
(221, 2, 4, 'D5', 'Standard', 1, NULL),
(222, 2, 4, 'D6', 'Standard', 1, NULL),
(223, 2, 4, 'D7', 'Standard', 0, NULL),
(224, 2, 4, 'D8', 'Standard', 1, NULL),
(225, 2, 4, 'D9', 'Standard', 1, NULL),
(226, 2, 4, 'E1', 'Standard', 1, NULL),
(227, 2, 4, 'E2', 'Standard', 1, NULL),
(228, 2, 4, 'E3', 'Standard', 0, NULL),
(229, 2, 4, 'E4', 'Standard', 0, NULL),
(230, 2, 4, 'E5', 'Standard', 1, NULL),
(231, 2, 4, 'E6', 'Standard', 1, NULL),
(232, 2, 4, 'E7', 'Standard', 1, NULL),
(233, 2, 4, 'E8', 'Standard', 0, NULL),
(234, 2, 4, 'E9', 'Standard', 1, NULL),
(235, 2, 4, 'F1', 'Standard', 1, NULL),
(236, 2, 4, 'F2', 'Standard', 1, NULL),
(237, 2, 4, 'F3', 'Standard', 0, NULL),
(238, 2, 4, 'F4', 'Standard', 1, NULL),
(239, 2, 4, 'F5', 'Standard', 0, NULL),
(240, 2, 4, 'F6', 'Standard', 1, NULL),
(241, 2, 4, 'F7', 'Standard', 0, NULL),
(242, 2, 4, 'F8', 'Standard', 1, NULL),
(243, 2, 4, 'F9', 'Standard', 1, NULL),
(244, 2, 4, 'G1', 'Standard', 0, NULL),
(245, 2, 4, 'G2', 'Standard', 1, NULL),
(246, 2, 4, 'G3', 'Standard', 1, NULL),
(247, 2, 4, 'G4', 'Standard', 0, NULL),
(248, 2, 4, 'G5', 'Standard', 1, NULL),
(249, 2, 4, 'G6', 'Standard', 0, NULL),
(250, 2, 4, 'G7', 'Standard', 1, NULL),
(251, 2, 4, 'G8', 'Standard', 1, NULL),
(252, 2, 4, 'G9', 'Standard', 0, NULL),
(253, 2, 5, 'A1', 'Standard', 0, NULL),
(254, 2, 5, 'A2', 'Standard', 1, NULL),
(255, 2, 5, 'A3', 'Standard', 0, NULL),
(256, 2, 5, 'A4', 'Standard', 1, NULL),
(257, 2, 5, 'A5', 'Standard', 1, NULL),
(258, 2, 5, 'A6', 'Standard', 1, NULL),
(259, 2, 5, 'A7', 'Standard', 0, NULL),
(260, 2, 5, 'A8', 'Wheelchair', 1, NULL),
(261, 2, 5, 'A9', 'Wheelchair', 0, NULL),
(262, 2, 5, 'B1', 'Standard', 0, NULL),
(263, 2, 5, 'B2', 'Standard', 1, NULL),
(264, 2, 5, 'B3', 'Standard', 0, NULL),
(265, 2, 5, 'B4', 'Standard', 1, NULL),
(266, 2, 5, 'B5', 'Standard', 1, NULL),
(267, 2, 5, 'B6', 'Standard', 1, NULL),
(268, 2, 5, 'B7', 'Standard', 0, NULL),
(269, 2, 5, 'B8', 'Standard', 1, NULL),
(270, 2, 5, 'B9', 'Wheelchair', 0, NULL),
(271, 2, 5, 'C1', 'Standard', 1, NULL),
(272, 2, 5, 'C2', 'Standard', 0, NULL),
(273, 2, 5, 'C3', 'Standard', 1, NULL),
(274, 2, 5, 'C4', 'Standard', 0, NULL),
(275, 2, 5, 'C5', 'Standard', 1, NULL),
(276, 2, 5, 'C6', 'Standard', 1, NULL),
(277, 2, 5, 'C7', 'Standard', 1, NULL),
(278, 2, 5, 'C8', 'Standard', 0, NULL),
(279, 2, 5, 'C9', 'Standard', 1, NULL),
(280, 2, 5, 'D1', 'Standard', 0, NULL),
(281, 2, 5, 'D2', 'Standard', 1, NULL),
(282, 2, 5, 'D3', 'Standard', 0, NULL),
(283, 2, 5, 'D4', 'Standard', 1, NULL),
(284, 2, 5, 'D5', 'Standard', 0, NULL),
(285, 2, 5, 'D6', 'Standard', 1, NULL),
(286, 2, 5, 'D7', 'Standard', 1, NULL),
(287, 2, 5, 'D8', 'Standard', 1, NULL),
(288, 2, 5, 'D9', 'Standard', 0, NULL),
(289, 2, 5, 'E1', 'Standard', 1, NULL),
(290, 2, 5, 'E2', 'Standard', 0, NULL),
(291, 2, 5, 'E3', 'Standard', 1, NULL),
(292, 2, 5, 'E4', 'Standard', 1, NULL),
(293, 2, 5, 'E5', 'Standard', 0, NULL),
(294, 2, 5, 'E6', 'Standard', 1, NULL),
(295, 2, 5, 'E7', 'Standard', 0, NULL),
(296, 2, 5, 'E8', 'Standard', 1, NULL),
(297, 2, 5, 'E9', 'Standard', 0, NULL),
(298, 2, 5, 'F1', 'Standard', 1, NULL),
(299, 2, 5, 'F2', 'Standard', 1, NULL),
(300, 2, 5, 'F3', 'Standard', 0, NULL),
(301, 2, 5, 'F4', 'Standard', 1, NULL),
(302, 2, 5, 'F5', 'Standard', 0, NULL),
(303, 2, 5, 'F6', 'Standard', 1, NULL),
(304, 2, 5, 'F7', 'Standard', 0, NULL),
(305, 2, 5, 'F8', 'Standard', 1, NULL),
(306, 2, 5, 'F9', 'Standard', 1, NULL),
(307, 2, 5, 'G1', 'Standard', 0, NULL),
(308, 2, 5, 'G2', 'Standard', 1, NULL),
(309, 2, 5, 'G3', 'Standard', 0, NULL),
(310, 2, 5, 'G4', 'Standard', 1, NULL),
(311, 2, 5, 'G5', 'Standard', 0, NULL),
(312, 2, 5, 'G6', 'Standard', 1, NULL),
(313, 2, 5, 'G7', 'Standard', 1, NULL),
(314, 2, 5, 'G8', 'Standard', 0, NULL),
(315, 2, 5, 'G9', 'Standard', 1, NULL),
(316, 2, 6, 'A1', 'Standard', 1, NULL),
(317, 2, 6, 'A2', 'Standard', 1, NULL),
(318, 2, 6, 'A3', 'Standard', 1, NULL),
(319, 2, 6, 'A4', 'Standard', 0, NULL),
(320, 2, 6, 'A5', 'Standard', 1, NULL),
(321, 2, 6, 'A6', 'Standard', 1, NULL),
(322, 2, 6, 'A7', 'Standard', 0, NULL),
(323, 2, 6, 'A8', 'Wheelchair', 1, NULL),
(324, 2, 6, 'A9', 'Wheelchair', 0, NULL),
(325, 2, 6, 'B1', 'Standard', 1, NULL),
(326, 2, 6, 'B2', 'Standard', 0, NULL),
(327, 2, 6, 'B3', 'Standard', 0, NULL),
(328, 2, 6, 'B4', 'Standard', 1, NULL),
(329, 2, 6, 'B5', 'Standard', 0, NULL),
(330, 2, 6, 'B6', 'Standard', 1, NULL),
(331, 2, 6, 'B7', 'Standard', 0, NULL),
(332, 2, 6, 'B8', 'Standard', 1, NULL),
(333, 2, 6, 'B9', 'Wheelchair', 1, NULL),
(334, 2, 6, 'C1', 'Standard', 0, NULL),
(335, 2, 6, 'C2', 'Standard', 1, NULL),
(336, 2, 6, 'C3', 'Standard', 0, NULL),
(337, 2, 6, 'C4', 'Standard', 1, NULL),
(338, 2, 6, 'C5', 'Standard', 1, NULL),
(339, 2, 6, 'C6', 'Standard', 0, NULL),
(340, 2, 6, 'C7', 'Standard', 1, NULL),
(341, 2, 6, 'C8', 'Standard', 1, NULL),
(342, 2, 6, 'C9', 'Standard', 0, NULL),
(343, 2, 6, 'D1', 'Standard', 1, NULL),
(344, 2, 6, 'D2', 'Standard', 0, NULL),
(345, 2, 6, 'D3', 'Standard', 1, NULL),
(346, 2, 6, 'D4', 'Standard', 0, NULL),
(347, 2, 6, 'D5', 'Standard', 1, NULL),
(348, 2, 6, 'D6', 'Standard', 1, NULL),
(349, 2, 6, 'D7', 'Standard', 0, NULL),
(350, 2, 6, 'D8', 'Standard', 1, NULL),
(351, 2, 6, 'D9', 'Standard', 0, NULL),
(352, 2, 6, 'E1', 'Standard', 1, NULL),
(353, 2, 6, 'E2', 'Standard', 1, NULL),
(354, 2, 6, 'E3', 'Standard', 1, NULL),
(355, 2, 6, 'E4', 'Standard', 0, NULL),
(356, 2, 6, 'E5', 'Standard', 1, NULL),
(357, 2, 6, 'E6', 'Standard', 0, NULL),
(358, 2, 6, 'E7', 'Standard', 1, NULL),
(359, 2, 6, 'E8', 'Standard', 1, NULL),
(360, 2, 6, 'E9', 'Standard', 1, NULL),
(361, 2, 6, 'F1', 'Standard', 1, NULL),
(362, 2, 6, 'F2', 'Standard', 0, NULL),
(363, 2, 6, 'F3', 'Standard', 1, NULL),
(364, 2, 6, 'F4', 'Standard', 1, NULL),
(365, 2, 6, 'F5', 'Standard', 0, NULL),
(366, 2, 6, 'F6', 'Standard', 1, NULL),
(367, 2, 6, 'F7', 'Standard', 0, NULL),
(368, 2, 6, 'F8', 'Standard', 1, NULL),
(369, 2, 6, 'F9', 'Standard', 1, NULL),
(370, 2, 6, 'G1', 'Standard', 1, NULL),
(371, 2, 6, 'G2', 'Standard', 0, NULL),
(372, 2, 6, 'G3', 'Standard', 1, NULL),
(373, 2, 6, 'G4', 'Standard', 1, NULL),
(374, 2, 6, 'G5', 'Standard', 1, NULL),
(375, 2, 6, 'G6', 'Standard', 0, NULL),
(376, 2, 6, 'G7', 'Standard', 1, NULL),
(377, 2, 6, 'G8', 'Standard', 1, NULL),
(378, 2, 6, 'G9', 'Standard', 1, NULL),
(379, 3, 7, 'A1', 'Standard', 1, NULL),
(380, 3, 7, 'A2', 'Standard', 0, NULL),
(381, 3, 7, 'A3', 'Standard', 1, NULL),
(382, 3, 7, 'A4', 'Standard', 1, NULL),
(383, 3, 7, 'A5', 'Standard', 1, NULL),
(384, 3, 7, 'A6', 'Standard', 0, NULL),
(385, 3, 7, 'A7', 'Standard', 1, NULL),
(386, 3, 7, 'A8', 'Wheelchair', 1, NULL),
(387, 3, 7, 'A9', 'Wheelchair', 0, NULL),
(388, 3, 7, 'B1', 'Standard', 1, NULL),
(389, 3, 7, 'B2', 'Standard', 1, NULL),
(390, 3, 7, 'B3', 'Standard', 0, NULL),
(391, 3, 7, 'B4', 'Standard', 1, NULL),
(392, 3, 7, 'B5', 'Standard', 1, NULL),
(393, 3, 7, 'B6', 'Standard', 0, NULL),
(394, 3, 7, 'B7', 'Standard', 1, NULL),
(395, 3, 7, 'B8', 'Standard', 1, NULL),
(396, 3, 7, 'B9', 'Wheelchair', 1, NULL),
(397, 3, 7, 'C1', 'Standard', 1, NULL),
(398, 3, 7, 'C2', 'Standard', 0, NULL),
(399, 3, 7, 'C3', 'Standard', 1, NULL),
(400, 3, 7, 'C4', 'Standard', 1, NULL),
(401, 3, 7, 'C5', 'Standard', 1, NULL),
(402, 3, 7, 'C6', 'Standard', 1, NULL),
(403, 3, 7, 'C7', 'Standard', 1, NULL),
(404, 3, 7, 'C8', 'Standard', 1, NULL),
(405, 3, 7, 'C9', 'Standard', 0, NULL),
(406, 3, 7, 'D1', 'Standard', 0, NULL),
(407, 3, 7, 'D2', 'Standard', 1, NULL),
(408, 3, 7, 'D3', 'Standard', 1, NULL),
(409, 3, 7, 'D4', 'Standard', 1, NULL),
(410, 3, 7, 'D5', 'Standard', 0, NULL),
(411, 3, 7, 'D6', 'Standard', 1, NULL),
(412, 3, 7, 'D7', 'Standard', 1, NULL),
(413, 3, 7, 'D8', 'Standard', 1, NULL),
(414, 3, 7, 'D9', 'Standard', 1, NULL),
(415, 3, 7, 'E1', 'Standard', 1, NULL),
(416, 3, 7, 'E2', 'Standard', 1, NULL),
(417, 3, 7, 'E3', 'Standard', 0, NULL),
(418, 3, 7, 'E4', 'Standard', 1, NULL),
(419, 3, 7, 'E5', 'Standard', 1, NULL),
(420, 3, 7, 'E6', 'Standard', 0, NULL),
(421, 3, 7, 'E7', 'Standard', 1, NULL),
(422, 3, 7, 'E8', 'Standard', 1, NULL),
(423, 3, 7, 'E9', 'Standard', 1, NULL),
(424, 3, 7, 'F1', 'Standard', 1, NULL),
(425, 3, 7, 'F2', 'Standard', 1, NULL),
(426, 3, 7, 'F3', 'Standard', 1, NULL),
(427, 3, 7, 'F4', 'Standard', 0, NULL),
(428, 3, 7, 'F5', 'Standard', 1, NULL),
(429, 3, 7, 'F6', 'Standard', 1, NULL),
(430, 3, 7, 'F7', 'Standard', 1, NULL),
(431, 3, 7, 'F8', 'Standard', 1, NULL),
(432, 3, 7, 'F9', 'Standard', 0, NULL),
(433, 3, 7, 'G1', 'Standard', 1, NULL),
(434, 3, 7, 'G2', 'Standard', 1, NULL),
(435, 3, 7, 'G3', 'Standard', 1, NULL),
(436, 3, 7, 'G4', 'Standard', 0, NULL),
(437, 3, 7, 'G5', 'Standard', 1, NULL),
(438, 3, 7, 'G6', 'Standard', 1, NULL),
(439, 3, 7, 'G7', 'Standard', 1, NULL),
(440, 3, 7, 'G8', 'Standard', 1, NULL),
(441, 3, 7, 'G9', 'Standard', 0, NULL),
(442, 3, 8, 'A1', 'Standard', 0, NULL),
(443, 3, 8, 'A2', 'Standard', 1, NULL),
(444, 3, 8, 'A3', 'Standard', 0, NULL),
(445, 3, 8, 'A4', 'Standard', 1, NULL),
(446, 3, 8, 'A5', 'Standard', 0, NULL),
(447, 3, 8, 'A6', 'Standard', 1, NULL),
(448, 3, 8, 'A7', 'Standard', 0, NULL),
(449, 3, 8, 'A8', 'Wheelchair', 1, NULL),
(450, 3, 8, 'A9', 'Wheelchair', 0, NULL),
(451, 3, 8, 'B1', 'Standard', 1, NULL),
(452, 3, 8, 'B2', 'Standard', 0, NULL),
(453, 3, 8, 'B3', 'Standard', 1, NULL),
(454, 3, 8, 'B4', 'Standard', 1, NULL),
(455, 3, 8, 'B5', 'Standard', 0, NULL),
(456, 3, 8, 'B6', 'Standard', 1, NULL),
(457, 3, 8, 'B7', 'Standard', 0, NULL),
(458, 3, 8, 'B8', 'Standard', 1, NULL),
(459, 3, 8, 'B9', 'Wheelchair', 1, NULL),
(460, 3, 8, 'C1', 'Standard', 1, NULL),
(461, 3, 8, 'C2', 'Standard', 0, NULL),
(462, 3, 8, 'C3', 'Standard', 1, NULL),
(463, 3, 8, 'C4', 'Standard', 1, NULL),
(464, 3, 8, 'C5', 'Standard', 0, NULL),
(465, 3, 8, 'C6', 'Standard', 0, NULL),
(466, 3, 8, 'C7', 'Standard', 1, NULL),
(467, 3, 8, 'C8', 'Standard', 0, NULL),
(468, 3, 8, 'C9', 'Standard', 1, NULL),
(469, 3, 8, 'D1', 'Standard', 0, NULL),
(470, 3, 8, 'D2', 'Standard', 1, NULL),
(471, 3, 8, 'D3', 'Standard', 0, NULL),
(472, 3, 8, 'D4', 'Standard', 1, NULL),
(473, 3, 8, 'D5', 'Standard', 0, NULL),
(474, 3, 8, 'D6', 'Standard', 1, NULL),
(475, 3, 8, 'D7', 'Standard', 1, NULL),
(476, 3, 8, 'D8', 'Standard', 0, NULL),
(477, 3, 8, 'D9', 'Standard', 1, NULL),
(478, 3, 8, 'E1', 'Standard', 1, NULL),
(479, 3, 8, 'E2', 'Standard', 0, NULL),
(480, 3, 8, 'E3', 'Standard', 1, NULL),
(481, 3, 8, 'E4', 'Standard', 1, NULL),
(482, 3, 8, 'E5', 'Standard', 1, NULL),
(483, 3, 8, 'E6', 'Standard', 0, NULL),
(484, 3, 8, 'E7', 'Standard', 1, NULL),
(485, 3, 8, 'E8', 'Standard', 1, NULL),
(486, 3, 8, 'E9', 'Standard', 0, NULL),
(487, 3, 8, 'F1', 'Standard', 0, NULL),
(488, 3, 8, 'F2', 'Standard', 1, NULL),
(489, 3, 8, 'F3', 'Standard', 1, NULL),
(490, 3, 8, 'F4', 'Standard', 0, NULL),
(491, 3, 8, 'F5', 'Standard', 1, NULL),
(492, 3, 8, 'F6', 'Standard', 1, NULL),
(493, 3, 8, 'F7', 'Standard', 0, NULL),
(494, 3, 8, 'F8', 'Standard', 1, NULL),
(495, 3, 8, 'F9', 'Standard', 1, NULL),
(496, 3, 8, 'G1', 'Standard', 1, NULL),
(497, 3, 8, 'G2', 'Standard', 0, NULL),
(498, 3, 8, 'G3', 'Standard', 0, NULL),
(499, 3, 8, 'G4', 'Standard', 1, NULL),
(500, 3, 8, 'G5', 'Standard', 0, NULL),
(501, 3, 8, 'G6', 'Standard', 1, NULL),
(502, 3, 8, 'G7', 'Standard', 1, NULL),
(503, 3, 8, 'G8', 'Standard', 0, NULL),
(504, 3, 8, 'G9', 'Standard', 1, NULL),
(505, 3, 9, 'A1', 'Standard', 1, NULL),
(506, 3, 9, 'A2', 'Standard', 1, NULL),
(507, 3, 9, 'A3', 'Standard', 0, NULL),
(508, 3, 9, 'A4', 'Standard', 0, NULL),
(509, 3, 9, 'A5', 'Standard', 1, NULL),
(510, 3, 9, 'A6', 'Standard', 0, NULL),
(511, 3, 9, 'A7', 'Standard', 1, NULL),
(512, 3, 9, 'A8', 'Wheelchair', 0, NULL),
(513, 3, 9, 'A9', 'Wheelchair', 1, NULL),
(514, 3, 9, 'B1', 'Standard', 1, NULL),
(515, 3, 9, 'B2', 'Standard', 0, NULL),
(516, 3, 9, 'B3', 'Standard', 1, NULL),
(517, 3, 9, 'B4', 'Standard', 0, NULL),
(518, 3, 9, 'B5', 'Standard', 1, NULL),
(519, 3, 9, 'B6', 'Standard', 1, NULL),
(520, 3, 9, 'B7', 'Standard', 1, NULL),
(521, 3, 9, 'B8', 'Standard', 0, NULL),
(522, 3, 9, 'B9', 'Wheelchair', 0, NULL),
(523, 3, 9, 'C1', 'Standard', 1, NULL),
(524, 3, 9, 'C2', 'Standard', 0, NULL),
(525, 3, 9, 'C3', 'Standard', 1, NULL),
(526, 3, 9, 'C4', 'Standard', 0, NULL),
(527, 3, 9, 'C5', 'Standard', 1, NULL),
(528, 3, 9, 'C6', 'Standard', 0, NULL),
(529, 3, 9, 'C7', 'Standard', 1, NULL),
(530, 3, 9, 'C8', 'Standard', 1, NULL),
(531, 3, 9, 'C9', 'Standard', 1, NULL),
(532, 3, 9, 'D1', 'Standard', 0, NULL),
(533, 3, 9, 'D2', 'Standard', 1, NULL),
(534, 3, 9, 'D3', 'Standard', 0, NULL),
(535, 3, 9, 'D4', 'Standard', 1, NULL),
(536, 3, 9, 'D5', 'Standard', 0, NULL),
(537, 3, 9, 'D6', 'Standard', 1, NULL),
(538, 3, 9, 'D7', 'Standard', 1, NULL),
(539, 3, 9, 'D8', 'Standard', 0, NULL),
(540, 3, 9, 'D9', 'Standard', 0, NULL),
(541, 3, 9, 'E1', 'Standard', 1, NULL),
(542, 3, 9, 'E2', 'Standard', 0, NULL),
(543, 3, 9, 'E3', 'Standard', 1, NULL),
(544, 3, 9, 'E4', 'Standard', 0, NULL),
(545, 3, 9, 'E5', 'Standard', 1, NULL),
(546, 3, 9, 'E6', 'Standard', 1, NULL),
(547, 3, 9, 'E7', 'Standard', 1, NULL),
(548, 3, 9, 'E8', 'Standard', 0, NULL),
(549, 3, 9, 'E9', 'Standard', 1, NULL),
(550, 3, 9, 'F1', 'Standard', 0, NULL),
(551, 3, 9, 'F2', 'Standard', 1, NULL),
(552, 3, 9, 'F3', 'Standard', 1, NULL),
(553, 3, 9, 'F4', 'Standard', 0, NULL),
(554, 3, 9, 'F5', 'Standard', 1, NULL),
(555, 3, 9, 'F6', 'Standard', 0, NULL),
(556, 3, 9, 'F7', 'Standard', 1, NULL),
(557, 3, 9, 'F8', 'Standard', 1, NULL),
(558, 3, 9, 'F9', 'Standard', 1, NULL),
(559, 3, 9, 'G1', 'Standard', 1, NULL),
(560, 3, 9, 'G2', 'Standard', 0, NULL),
(561, 3, 9, 'G3', 'Standard', 1, NULL),
(562, 3, 9, 'G4', 'Standard', 0, NULL),
(563, 3, 9, 'G5', 'Standard', 1, NULL),
(564, 3, 9, 'G6', 'Standard', 1, NULL),
(565, 3, 9, 'G7', 'Standard', 0, NULL),
(566, 3, 9, 'G8', 'Standard', 1, NULL),
(567, 3, 9, 'G9', 'Standard', 0, NULL),
(568, 4, 10, 'A1', 'Standard', 0, NULL),
(569, 4, 10, 'A2', 'Standard', 1, NULL),
(570, 4, 10, 'A3', 'Standard', 1, NULL),
(571, 4, 10, 'A4', 'Standard', 0, NULL),
(572, 4, 10, 'A5', 'Standard', 1, NULL),
(573, 4, 10, 'A6', 'Standard', 0, NULL),
(574, 4, 10, 'A7', 'Standard', 1, NULL),
(575, 4, 10, 'A8', 'Wheelchair', 1, NULL),
(576, 4, 10, 'A9', 'Wheelchair', 0, NULL),
(577, 4, 10, 'B1', 'Standard', 1, NULL),
(578, 4, 10, 'B2', 'Standard', 0, NULL),
(579, 4, 10, 'B3', 'Standard', 0, NULL),
(580, 4, 10, 'B4', 'Standard', 1, NULL),
(581, 4, 10, 'B5', 'Standard', 1, NULL),
(582, 4, 10, 'B6', 'Standard', 1, NULL),
(583, 4, 10, 'B7', 'Standard', 0, NULL),
(584, 4, 10, 'B8', 'Standard', 1, NULL),
(585, 4, 10, 'B9', 'Wheelchair', 1, NULL),
(586, 4, 10, 'C1', 'Standard', 1, NULL),
(587, 4, 10, 'C2', 'Standard', 0, NULL),
(588, 4, 10, 'C3', 'Standard', 1, NULL),
(589, 4, 10, 'C4', 'Standard', 0, NULL),
(590, 4, 10, 'C5', 'Standard', 1, NULL),
(591, 4, 10, 'C6', 'Standard', 1, NULL),
(592, 4, 10, 'C7', 'Standard', 0, NULL),
(593, 4, 10, 'C8', 'Standard', 1, NULL),
(594, 4, 10, 'C9', 'Standard', 0, NULL),
(595, 4, 10, 'D1', 'Standard', 1, NULL),
(596, 4, 10, 'D2', 'Standard', 0, NULL),
(597, 4, 10, 'D3', 'Standard', 1, NULL),
(598, 4, 10, 'D4', 'Standard', 0, NULL),
(599, 4, 10, 'D5', 'Standard', 1, NULL),
(600, 4, 10, 'D6', 'Standard', 1, NULL),
(601, 4, 10, 'D7', 'Standard', 1, NULL),
(602, 4, 10, 'D8', 'Standard', 0, NULL),
(603, 4, 10, 'D9', 'Standard', 1, NULL),
(604, 4, 10, 'E1', 'Standard', 0, NULL),
(605, 4, 10, 'E2', 'Standard', 1, NULL),
(606, 4, 10, 'E3', 'Standard', 0, NULL),
(607, 4, 10, 'E4', 'Standard', 1, NULL),
(608, 4, 10, 'E5', 'Standard', 0, NULL),
(609, 4, 10, 'E6', 'Standard', 1, NULL),
(610, 4, 10, 'E7', 'Standard', 1, NULL),
(611, 4, 10, 'E8', 'Standard', 1, NULL),
(612, 4, 10, 'E9', 'Standard', 0, NULL),
(613, 4, 10, 'F1', 'Standard', 0, NULL),
(614, 4, 10, 'F2', 'Standard', 1, NULL),
(615, 4, 10, 'F3', 'Standard', 1, NULL),
(616, 4, 10, 'F4', 'Standard', 1, NULL),
(617, 4, 10, 'F5', 'Standard', 0, NULL),
(618, 4, 10, 'F6', 'Standard', 1, NULL),
(619, 4, 10, 'F7', 'Standard', 1, NULL),
(620, 4, 10, 'F8', 'Standard', 0, NULL),
(621, 4, 10, 'F9', 'Standard', 1, NULL),
(622, 4, 10, 'G1', 'Standard', 1, NULL),
(623, 4, 10, 'G2', 'Standard', 0, NULL),
(624, 4, 10, 'G3', 'Standard', 1, NULL),
(625, 4, 10, 'G4', 'Standard', 1, NULL),
(626, 4, 10, 'G5', 'Standard', 0, NULL),
(627, 4, 10, 'G6', 'Standard', 1, NULL),
(628, 4, 10, 'G7', 'Standard', 1, NULL),
(629, 4, 10, 'G8', 'Standard', 0, NULL),
(630, 4, 10, 'G9', 'Standard', 1, NULL),
(631, 4, 11, 'A1', 'Standard', 1, NULL),
(632, 4, 11, 'A2', 'Standard', 0, NULL),
(633, 4, 11, 'A3', 'Standard', 1, NULL),
(634, 4, 11, 'A4', 'Standard', 0, NULL),
(635, 4, 11, 'A5', 'Standard', 1, NULL),
(636, 4, 11, 'A6', 'Standard', 1, NULL),
(637, 4, 11, 'A7', 'Standard', 0, NULL),
(638, 4, 11, 'A8', 'Wheelchair', 1, NULL),
(639, 4, 11, 'A9', 'Wheelchair', 0, NULL),
(640, 4, 11, 'B1', 'Standard', 1, NULL),
(641, 4, 11, 'B2', 'Standard', 1, NULL),
(642, 4, 11, 'B3', 'Standard', 0, NULL),
(643, 4, 11, 'B4', 'Standard', 1, NULL),
(644, 4, 11, 'B5', 'Standard', 1, NULL),
(645, 4, 11, 'B6', 'Standard', 0, NULL),
(646, 4, 11, 'B7', 'Standard', 1, NULL),
(647, 4, 11, 'B8', 'Standard', 0, NULL),
(648, 4, 11, 'B9', 'Wheelchair', 1, NULL),
(649, 4, 11, 'C1', 'Standard', 0, NULL),
(650, 4, 11, 'C2', 'Standard', 1, NULL),
(651, 4, 11, 'C3', 'Standard', 1, NULL),
(652, 4, 11, 'C4', 'Standard', 0, NULL),
(653, 4, 11, 'C5', 'Standard', 1, NULL),
(654, 4, 11, 'C6', 'Standard', 0, NULL),
(655, 4, 11, 'C7', 'Standard', 1, NULL),
(656, 4, 11, 'C8', 'Standard', 1, NULL),
(657, 4, 11, 'C9', 'Standard', 1, NULL),
(658, 4, 11, 'D1', 'Standard', 1, NULL),
(659, 4, 11, 'D2', 'Standard', 1, NULL),
(660, 4, 11, 'D3', 'Standard', 0, NULL),
(661, 4, 11, 'D4', 'Standard', 1, NULL),
(662, 4, 11, 'D5', 'Standard', 0, NULL),
(663, 4, 11, 'D6', 'Standard', 1, NULL),
(664, 4, 11, 'D7', 'Standard', 1, NULL),
(665, 4, 11, 'D8', 'Standard', 0, NULL),
(666, 4, 11, 'D9', 'Standard', 1, NULL),
(667, 4, 11, 'E1', 'Standard', 0, NULL),
(668, 4, 11, 'E2', 'Standard', 1, NULL),
(669, 4, 11, 'E3', 'Standard', 1, NULL),
(670, 4, 11, 'E4', 'Standard', 0, NULL),
(671, 4, 11, 'E5', 'Standard', 1, NULL),
(672, 4, 11, 'E6', 'Standard', 1, NULL),
(673, 4, 11, 'E7', 'Standard', 1, NULL),
(674, 4, 11, 'E8', 'Standard', 0, NULL),
(675, 4, 11, 'E9', 'Standard', 1, NULL),
(676, 4, 11, 'F1', 'Standard', 1, NULL),
(677, 4, 11, 'F2', 'Standard', 1, NULL),
(678, 4, 11, 'F3', 'Standard', 0, NULL),
(679, 4, 11, 'F4', 'Standard', 1, NULL),
(680, 4, 11, 'F5', 'Standard', 0, NULL),
(681, 4, 11, 'F6', 'Standard', 1, NULL),
(682, 4, 11, 'F7', 'Standard', 1, NULL),
(683, 4, 11, 'F8', 'Standard', 1, NULL),
(684, 4, 11, 'F9', 'Standard', 0, NULL),
(685, 4, 11, 'G1', 'Standard', 1, NULL),
(686, 4, 11, 'G2', 'Standard', 1, NULL),
(687, 4, 11, 'G3', 'Standard', 1, NULL),
(688, 4, 11, 'G4', 'Standard', 0, NULL),
(689, 4, 11, 'G5', 'Standard', 1, NULL),
(690, 4, 11, 'G6', 'Standard', 0, NULL),
(691, 4, 11, 'G7', 'Standard', 1, NULL),
(692, 4, 11, 'G8', 'Standard', 0, NULL),
(693, 4, 11, 'G9', 'Standard', 1, NULL),
(694, 4, 16, 'A1', 'Standard', 0, NULL),
(695, 4, 16, 'A2', 'Standard', 1, NULL),
(696, 4, 16, 'A3', 'Standard', 1, NULL),
(697, 4, 16, 'A4', 'Standard', 0, NULL),
(698, 4, 16, 'A5', 'Standard', 1, NULL),
(699, 4, 16, 'A6', 'Standard', 0, NULL),
(700, 4, 16, 'A7', 'Standard', 1, NULL),
(701, 4, 16, 'A8', 'Wheelchair', 0, NULL),
(702, 4, 16, 'A9', 'Wheelchair', 1, NULL),
(703, 4, 16, 'B1', 'Standard', 1, NULL),
(704, 4, 16, 'B2', 'Standard', 1, NULL),
(705, 4, 16, 'B3', 'Standard', 0, NULL),
(706, 4, 16, 'B4', 'Standard', 1, NULL),
(707, 4, 16, 'B5', 'Standard', 1, NULL),
(708, 4, 16, 'B6', 'Standard', 0, NULL),
(709, 4, 16, 'B7', 'Standard', 1, NULL),
(710, 4, 16, 'B8', 'Standard', 0, NULL),
(711, 4, 16, 'B9', 'Wheelchair', 1, NULL),
(712, 4, 16, 'C1', 'Standard', 1, NULL),
(713, 4, 16, 'C2', 'Standard', 0, NULL),
(714, 4, 16, 'C3', 'Standard', 1, NULL),
(715, 4, 16, 'C4', 'Standard', 1, NULL),
(716, 4, 16, 'C5', 'Standard', 0, NULL),
(717, 4, 16, 'C6', 'Standard', 1, NULL),
(718, 4, 16, 'C7', 'Standard', 0, NULL),
(719, 4, 16, 'C8', 'Standard', 1, NULL),
(720, 4, 16, 'C9', 'Standard', 0, NULL),
(721, 4, 16, 'D1', 'Standard', 1, NULL),
(722, 4, 16, 'D2', 'Standard', 0, NULL),
(723, 4, 16, 'D3', 'Standard', 1, NULL),
(724, 4, 16, 'D4', 'Standard', 0, NULL),
(725, 4, 16, 'D5', 'Standard', 1, NULL),
(726, 4, 16, 'D6', 'Standard', 1, NULL),
(727, 4, 16, 'D7', 'Standard', 1, NULL),
(728, 4, 16, 'D8', 'Standard', 0, NULL),
(729, 4, 16, 'D9', 'Standard', 1, NULL),
(730, 4, 16, 'E1', 'Standard', 1, NULL),
(731, 4, 16, 'E2', 'Standard', 0, NULL),
(732, 4, 16, 'E3', 'Standard', 1, NULL),
(733, 4, 16, 'E4', 'Standard', 1, NULL),
(734, 4, 16, 'E5', 'Standard', 1, NULL),
(735, 4, 16, 'E6', 'Standard', 0, NULL),
(736, 4, 16, 'E7', 'Standard', 1, NULL),
(737, 4, 16, 'E8', 'Standard', 1, NULL),
(738, 4, 16, 'E9', 'Standard', 0, NULL),
(739, 4, 16, 'F1', 'Standard', 0, NULL),
(740, 4, 16, 'F2', 'Standard', 1, NULL),
(741, 4, 16, 'F3', 'Standard', 1, NULL),
(742, 4, 16, 'F4', 'Standard', 0, NULL),
(743, 4, 16, 'F5', 'Standard', 1, NULL),
(744, 4, 16, 'F6', 'Standard', 1, NULL),
(745, 4, 16, 'F7', 'Standard', 0, NULL),
(746, 4, 16, 'F8', 'Standard', 1, NULL),
(747, 4, 16, 'F9', 'Standard', 1, NULL),
(748, 4, 16, 'G1', 'Standard', 1, NULL),
(749, 4, 16, 'G2', 'Standard', 0, NULL),
(750, 4, 16, 'G3', 'Standard', 1, NULL),
(751, 4, 16, 'G4', 'Standard', 0, NULL),
(752, 4, 16, 'G5', 'Standard', 1, NULL),
(753, 4, 16, 'G6', 'Standard', 1, NULL),
(754, 4, 16, 'G7', 'Standard', 1, NULL),
(755, 4, 16, 'G8', 'Standard', 0, NULL),
(756, 4, 16, 'G9', 'Standard', 1, NULL),
(757, 4, 17, 'A1', 'Standard', 1, NULL),
(758, 4, 17, 'A2', 'Standard', 0, NULL),
(759, 4, 17, 'A3', 'Standard', 1, NULL),
(760, 4, 17, 'A4', 'Standard', 1, NULL),
(761, 4, 17, 'A5', 'Standard', 0, NULL),
(762, 4, 17, 'A6', 'Standard', 1, NULL),
(763, 4, 17, 'A7', 'Standard', 0, NULL),
(764, 4, 17, 'A8', 'Wheelchair', 1, NULL),
(765, 4, 17, 'A9', 'Wheelchair', 0, NULL),
(766, 4, 17, 'B1', 'Standard', 1, NULL),
(767, 4, 17, 'B2', 'Standard', 1, NULL),
(768, 4, 17, 'B3', 'Standard', 1, NULL),
(769, 4, 17, 'B4', 'Standard', 0, NULL),
(770, 4, 17, 'B5', 'Standard', 1, NULL),
(771, 4, 17, 'B6', 'Standard', 0, NULL),
(772, 4, 17, 'B7', 'Standard', 1, NULL),
(773, 4, 17, 'B8', 'Standard', 0, NULL),
(774, 4, 17, 'B9', 'Wheelchair', 1, NULL),
(775, 4, 17, 'C1', 'Standard', 1, NULL),
(776, 4, 17, 'C2', 'Standard', 1, NULL),
(777, 4, 17, 'C3', 'Standard', 0, NULL),
(778, 4, 17, 'C4', 'Standard', 1, NULL),
(779, 4, 17, 'C5', 'Standard', 0, NULL),
(780, 4, 17, 'C6', 'Standard', 1, NULL),
(781, 4, 17, 'C7', 'Standard', 1, NULL),
(782, 4, 17, 'C8', 'Standard', 1, NULL),
(783, 4, 17, 'C9', 'Standard', 0, NULL),
(784, 4, 17, 'D1', 'Standard', 1, NULL),
(785, 4, 17, 'D2', 'Standard', 0, NULL),
(786, 4, 17, 'D3', 'Standard', 1, NULL),
(787, 4, 17, 'D4', 'Standard', 1, NULL),
(788, 4, 17, 'D5', 'Standard', 1, NULL),
(789, 4, 17, 'D6', 'Standard', 0, NULL),
(790, 4, 17, 'D7', 'Standard', 1, NULL),
(791, 4, 17, 'D8', 'Standard', 1, NULL),
(792, 4, 17, 'D9', 'Standard', 0, NULL),
(793, 4, 17, 'E1', 'Standard', 0, NULL),
(794, 4, 17, 'E2', 'Standard', 1, NULL),
(795, 4, 17, 'E3', 'Standard', 1, NULL),
(796, 4, 17, 'E4', 'Standard', 1, NULL),
(797, 4, 17, 'E5', 'Standard', 1, NULL),
(798, 4, 17, 'E6', 'Standard', 0, NULL),
(799, 4, 17, 'E7', 'Standard', 1, NULL),
(800, 4, 17, 'E8', 'Standard', 0, NULL),
(801, 4, 17, 'E9', 'Standard', 1, NULL),
(802, 4, 17, 'F1', 'Standard', 1, NULL),
(803, 4, 17, 'F2', 'Standard', 1, NULL),
(804, 4, 17, 'F3', 'Standard', 0, NULL),
(805, 4, 17, 'F4', 'Standard', 1, NULL),
(806, 4, 17, 'F5', 'Standard', 1, NULL),
(807, 4, 17, 'F6', 'Standard', 0, NULL),
(808, 4, 17, 'F7', 'Standard', 1, NULL),
(809, 4, 17, 'F8', 'Standard', 1, NULL),
(810, 4, 17, 'F9', 'Standard', 0, NULL),
(811, 4, 17, 'G1', 'Standard', 1, NULL),
(812, 4, 17, 'G2', 'Standard', 0, NULL),
(813, 4, 17, 'G3', 'Standard', 1, NULL),
(814, 4, 17, 'G4', 'Standard', 1, NULL),
(815, 4, 17, 'G5', 'Standard', 1, NULL),
(816, 4, 17, 'G6', 'Standard', 1, NULL),
(817, 4, 17, 'G7', 'Standard', 0, NULL),
(818, 4, 17, 'G8', 'Standard', 1, NULL),
(819, 4, 17, 'G9', 'Standard', 1, NULL),
(820, 3, 13, 'A1', 'Standard', 1, NULL),
(821, 3, 13, 'A2', 'Standard', 0, NULL),
(822, 3, 13, 'A3', 'Standard', 1, NULL),
(823, 3, 13, 'A4', 'Standard', 0, NULL),
(824, 3, 13, 'A5', 'Standard', 1, NULL),
(825, 3, 13, 'A6', 'Standard', 1, NULL),
(826, 3, 13, 'A7', 'Standard', 0, NULL),
(827, 3, 13, 'A8', 'Wheelchair', 1, NULL),
(828, 3, 13, 'A9', 'Wheelchair', 1, NULL),
(829, 3, 13, 'B1', 'Standard', 0, NULL),
(830, 3, 13, 'B2', 'Standard', 1, NULL),
(831, 3, 13, 'B3', 'Standard', 0, NULL),
(832, 3, 13, 'B4', 'Standard', 1, NULL),
(833, 3, 13, 'B5', 'Standard', 0, NULL),
(834, 3, 13, 'B6', 'Standard', 1, NULL),
(835, 3, 13, 'B7', 'Standard', 1, NULL),
(836, 3, 13, 'B8', 'Standard', 1, NULL),
(837, 3, 13, 'B9', 'Wheelchair', 0, NULL),
(838, 3, 13, 'C1', 'Standard', 1, NULL),
(839, 3, 13, 'C2', 'Standard', 1, NULL),
(840, 3, 13, 'C3', 'Standard', 1, NULL),
(841, 3, 13, 'C4', 'Standard', 0, NULL),
(842, 3, 13, 'C5', 'Standard', 1, NULL),
(843, 3, 13, 'C6', 'Standard', 1, NULL),
(844, 3, 13, 'C7', 'Standard', 0, NULL),
(845, 3, 13, 'C8', 'Standard', 1, NULL),
(846, 3, 13, 'C9', 'Standard', 0, NULL),
(847, 3, 13, 'D1', 'Standard', 1, NULL),
(848, 3, 13, 'D2', 'Standard', 0, NULL),
(849, 3, 13, 'D3', 'Standard', 1, NULL),
(850, 3, 13, 'D4', 'Standard', 1, NULL),
(851, 3, 13, 'D5', 'Standard', 1, NULL),
(852, 3, 13, 'D6', 'Standard', 0, NULL),
(853, 3, 13, 'D7', 'Standard', 1, NULL),
(854, 3, 13, 'D8', 'Standard', 0, NULL),
(855, 3, 13, 'D9', 'Standard', 1, NULL),
(856, 3, 13, 'E1', 'Standard', 0, NULL),
(857, 3, 13, 'E2', 'Standard', 1, NULL),
(858, 3, 13, 'E3', 'Standard', 1, NULL),
(859, 3, 13, 'E4', 'Standard', 1, NULL),
(860, 3, 13, 'E5', 'Standard', 0, NULL),
(861, 3, 13, 'E6', 'Standard', 1, NULL),
(862, 3, 13, 'E7', 'Standard', 1, NULL),
(863, 3, 13, 'E8', 'Standard', 0, NULL),
(864, 3, 13, 'E9', 'Standard', 1, NULL),
(865, 3, 13, 'F1', 'Standard', 1, NULL),
(866, 3, 13, 'F2', 'Standard', 1, NULL),
(867, 3, 13, 'F3', 'Standard', 1, NULL),
(868, 3, 13, 'F4', 'Standard', 0, NULL),
(869, 3, 13, 'F5', 'Standard', 1, NULL),
(870, 3, 13, 'F6', 'Standard', 0, NULL),
(871, 3, 13, 'F7', 'Standard', 1, NULL),
(872, 3, 13, 'F8', 'Standard', 1, NULL),
(873, 3, 13, 'F9', 'Standard', 0, NULL),
(874, 3, 13, 'G1', 'Standard', 1, NULL),
(875, 3, 13, 'G2', 'Standard', 1, NULL),
(876, 3, 13, 'G3', 'Standard', 1, NULL),
(877, 3, 13, 'G4', 'Standard', 0, NULL),
(878, 3, 13, 'G5', 'Standard', 1, NULL),
(879, 3, 13, 'G6', 'Standard', 0, NULL),
(880, 3, 13, 'G7', 'Standard', 1, NULL),
(881, 3, 13, 'G8', 'Standard', 1, NULL),
(882, 3, 13, 'G9', 'Standard', 0, NULL),
(883, 3, 14, 'A1', 'Standard', 0, NULL),
(884, 3, 14, 'A2', 'Standard', 1, NULL),
(885, 3, 14, 'A3', 'Standard', 1, NULL),
(886, 3, 14, 'A4', 'Standard', 1, NULL),
(887, 3, 14, 'A5', 'Standard', 0, NULL),
(888, 3, 14, 'A6', 'Standard', 1, NULL),
(889, 3, 14, 'A7', 'Standard', 0, NULL),
(890, 3, 14, 'A8', 'Wheelchair', 1, NULL),
(891, 3, 14, 'A9', 'Wheelchair', 1, NULL),
(892, 3, 14, 'B1', 'Standard', 0, NULL),
(893, 3, 14, 'B2', 'Standard', 1, NULL),
(894, 3, 14, 'B3', 'Standard', 1, NULL),
(895, 3, 14, 'B4', 'Standard', 1, NULL),
(896, 3, 14, 'B5', 'Standard', 1, NULL),
(897, 3, 14, 'B6', 'Standard', 0, NULL),
(898, 3, 14, 'B7', 'Standard', 1, NULL),
(899, 3, 14, 'B8', 'Standard', 0, NULL),
(900, 3, 14, 'B9', 'Wheelchair', 0, NULL),
(901, 3, 14, 'C1', 'Standard', 1, NULL),
(902, 3, 14, 'C2', 'Standard', 1, NULL),
(903, 3, 14, 'C3', 'Standard', 0, NULL),
(904, 3, 14, 'C4', 'Standard', 1, NULL),
(905, 3, 14, 'C5', 'Standard', 1, NULL),
(906, 3, 14, 'C6', 'Standard', 0, NULL),
(907, 3, 14, 'C7', 'Standard', 1, NULL),
(908, 3, 14, 'C8', 'Standard', 0, NULL),
(909, 3, 14, 'C9', 'Standard', 1, NULL),
(910, 3, 14, 'D1', 'Standard', 1, NULL),
(911, 3, 14, 'D2', 'Standard', 0, NULL),
(912, 3, 14, 'D3', 'Standard', 1, NULL),
(913, 3, 14, 'D4', 'Standard', 0, NULL),
(914, 3, 14, 'D5', 'Standard', 1, NULL),
(915, 3, 14, 'D6', 'Standard', 1, NULL),
(916, 3, 14, 'D7', 'Standard', 1, NULL),
(917, 3, 14, 'D8', 'Standard', 1, NULL),
(918, 3, 14, 'D9', 'Standard', 0, NULL),
(919, 3, 14, 'E1', 'Standard', 1, NULL),
(920, 3, 14, 'E2', 'Standard', 1, NULL),
(921, 3, 14, 'E3', 'Standard', 1, NULL),
(922, 3, 14, 'E4', 'Standard', 1, NULL),
(923, 3, 14, 'E5', 'Standard', 0, NULL),
(924, 3, 14, 'E6', 'Standard', 1, NULL),
(925, 3, 14, 'E7', 'Standard', 0, NULL),
(926, 3, 14, 'E8', 'Standard', 1, NULL),
(927, 3, 14, 'E9', 'Standard', 1, NULL),
(928, 3, 14, 'F1', 'Standard', 1, NULL),
(929, 3, 14, 'F2', 'Standard', 0, NULL),
(930, 3, 14, 'F3', 'Standard', 1, NULL),
(931, 3, 14, 'F4', 'Standard', 1, NULL),
(932, 3, 14, 'F5', 'Standard', 0, NULL),
(933, 3, 14, 'F6', 'Standard', 1, NULL),
(934, 3, 14, 'F7', 'Standard', 1, NULL),
(935, 3, 14, 'F8', 'Standard', 0, NULL),
(936, 3, 14, 'F9', 'Standard', 1, NULL),
(937, 3, 14, 'G1', 'Standard', 1, NULL),
(938, 3, 14, 'G2', 'Standard', 1, NULL),
(939, 3, 14, 'G3', 'Standard', 1, NULL),
(940, 3, 14, 'G4', 'Standard', 0, NULL),
(941, 3, 14, 'G5', 'Standard', 1, NULL),
(942, 3, 14, 'G6', 'Standard', 1, NULL),
(943, 3, 14, 'G7', 'Standard', 1, NULL),
(944, 3, 14, 'G8', 'Standard', 0, NULL),
(945, 3, 14, 'G9', 'Standard', 1, NULL),
(946, 3, 15, 'A1', 'Standard', 1, NULL),
(947, 3, 15, 'A2', 'Standard', 1, NULL),
(948, 3, 15, 'A3', 'Standard', 0, NULL),
(949, 3, 15, 'A4', 'Standard', 1, NULL),
(950, 3, 15, 'A5', 'Standard', 1, NULL),
(951, 3, 15, 'A6', 'Standard', 0, NULL),
(952, 3, 15, 'A7', 'Standard', 1, NULL),
(953, 3, 15, 'A8', 'Wheelchair', 0, NULL),
(954, 3, 15, 'A9', 'Wheelchair', 1, NULL),
(955, 3, 15, 'B1', 'Standard', 1, NULL),
(956, 3, 15, 'B2', 'Standard', 1, NULL),
(957, 3, 15, 'B3', 'Standard', 1, NULL),
(958, 3, 15, 'B4', 'Standard', 1, NULL),
(959, 3, 15, 'B5', 'Standard', 0, NULL),
(960, 3, 15, 'B6', 'Standard', 1, NULL),
(961, 3, 15, 'B7', 'Standard', 1, NULL),
(962, 3, 15, 'B8', 'Standard', 0, NULL),
(963, 3, 15, 'B9', 'Wheelchair', 1, NULL),
(964, 3, 15, 'C1', 'Standard', 1, NULL),
(965, 3, 15, 'C2', 'Standard', 1, NULL),
(966, 3, 15, 'C3', 'Standard', 1, NULL),
(967, 3, 15, 'C4', 'Standard', 1, NULL),
(968, 3, 15, 'C5', 'Standard', 0, NULL),
(969, 3, 15, 'C6', 'Standard', 1, NULL),
(970, 3, 15, 'C7', 'Standard', 1, NULL),
(971, 3, 15, 'C8', 'Standard', 1, NULL),
(972, 3, 15, 'C9', 'Standard', 1, NULL),
(973, 3, 15, 'D1', 'Standard', 1, NULL),
(974, 3, 15, 'D2', 'Standard', 1, NULL),
(975, 3, 15, 'D3', 'Standard', 0, NULL),
(976, 3, 15, 'D4', 'Standard', 1, NULL),
(977, 3, 15, 'D5', 'Standard', 1, NULL),
(978, 3, 15, 'D6', 'Standard', 0, NULL),
(979, 3, 15, 'D7', 'Standard', 1, NULL),
(980, 3, 15, 'D8', 'Standard', 1, NULL),
(981, 3, 15, 'D9', 'Standard', 1, NULL),
(982, 3, 15, 'E1', 'Standard', 1, NULL),
(983, 3, 15, 'E2', 'Standard', 1, NULL),
(984, 3, 15, 'E3', 'Standard', 1, NULL),
(985, 3, 15, 'E4', 'Standard', 0, NULL),
(986, 3, 15, 'E5', 'Standard', 1, NULL),
(987, 3, 15, 'E6', 'Standard', 0, NULL),
(988, 3, 15, 'E7', 'Standard', 1, NULL),
(989, 3, 15, 'E8', 'Standard', 1, NULL),
(990, 3, 15, 'E9', 'Standard', 1, NULL),
(991, 3, 15, 'F1', 'Standard', 0, NULL),
(992, 3, 15, 'F2', 'Standard', 1, NULL),
(993, 3, 15, 'F3', 'Standard', 1, NULL),
(994, 3, 15, 'F4', 'Standard', 0, NULL),
(995, 3, 15, 'F5', 'Standard', 1, NULL),
(996, 3, 15, 'F6', 'Standard', 1, NULL),
(997, 3, 15, 'F7', 'Standard', 1, NULL),
(998, 3, 15, 'F8', 'Standard', 1, NULL),
(999, 3, 15, 'F9', 'Standard', 1, NULL),
(1000, 3, 15, 'G1', 'Standard', 1, NULL),
(1001, 3, 15, 'G2', 'Standard', 1, NULL),
(1002, 3, 15, 'G3', 'Standard', 1, NULL),
(1003, 3, 15, 'G4', 'Standard', 1, NULL),
(1004, 3, 15, 'G5', 'Standard', 1, NULL),
(1005, 3, 15, 'G6', 'Standard', 1, NULL),
(1006, 3, 15, 'G7', 'Standard', 0, NULL),
(1007, 3, 15, 'G8', 'Standard', 1, NULL),
(1008, 3, 15, 'G9', 'Standard', 1, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `showtimes`
--

CREATE TABLE `showtimes` (
  `showtime_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `hall_id` int(11) NOT NULL,
  `showtime` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `showtimes`
--

INSERT INTO `showtimes` (`showtime_id`, `movie_id`, `hall_id`, `showtime`) VALUES
(1, 1, 1, '2024-11-06 19:30:00'),
(2, 1, 1, '2024-11-06 21:30:00'),
(3, 1, 1, '2024-11-07 14:00:00'),
(4, 1, 2, '2024-11-06 13:00:00'),
(5, 1, 2, '2024-11-06 18:30:00'),
(6, 1, 2, '2024-11-07 20:00:00'),
(7, 2, 3, '2024-11-06 09:30:00'),
(8, 2, 3, '2024-11-06 13:30:00'),
(9, 2, 3, '2024-11-07 18:00:00'),
(10, 2, 4, '2024-11-06 12:00:00'),
(11, 2, 4, '2024-11-06 14:30:00'),
(13, 4, 3, '2024-11-07 09:00:00'),
(14, 4, 3, '2024-11-07 10:30:00'),
(15, 4, 3, '2024-11-08 14:00:00'),
(16, 4, 4, '2024-11-07 12:00:00'),
(17, 4, 4, '2024-11-08 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `tickets_ordered`
--

CREATE TABLE `tickets_ordered` (
  `tickets_id` int(11) NOT NULL,
  `movie_id` int(11) NOT NULL,
  `quantity` int(11) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `booking_id` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `tickets_ordered`
--

INSERT INTO `tickets_ordered` (`tickets_id`, `movie_id`, `quantity`, `price`, `booking_id`) VALUES
(1, 1, 2, 19.50, 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bookings`
--
ALTER TABLE `bookings`
  ADD PRIMARY KEY (`booking_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `hall_id` (`hall_id`),
  ADD KEY `showtime_id` (`showtime_id`);

--
-- Indexes for table `cinema_halls`
--
ALTER TABLE `cinema_halls`
  ADD PRIMARY KEY (`hall_id`);

--
-- Indexes for table `food_combos`
--
ALTER TABLE `food_combos`
  ADD PRIMARY KEY (`combo_id`);

--
-- Indexes for table `food_combos_ordered`
--
ALTER TABLE `food_combos_ordered`
  ADD PRIMARY KEY (`order_id`),
  ADD KEY `combo_id` (`combo_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `movies`
--
ALTER TABLE `movies`
  ADD PRIMARY KEY (`movie_id`);

--
-- Indexes for table `seats`
--
ALTER TABLE `seats`
  ADD PRIMARY KEY (`seat_id`),
  ADD KEY `hall_id` (`hall_id`),
  ADD KEY `showtime_id` (`showtime_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- Indexes for table `showtimes`
--
ALTER TABLE `showtimes`
  ADD PRIMARY KEY (`showtime_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `hall_id` (`hall_id`);

--
-- Indexes for table `tickets_ordered`
--
ALTER TABLE `tickets_ordered`
  ADD PRIMARY KEY (`tickets_id`),
  ADD KEY `movie_id` (`movie_id`),
  ADD KEY `booking_id` (`booking_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bookings`
--
ALTER TABLE `bookings`
  MODIFY `booking_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `cinema_halls`
--
ALTER TABLE `cinema_halls`
  MODIFY `hall_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `food_combos`
--
ALTER TABLE `food_combos`
  MODIFY `combo_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `food_combos_ordered`
--
ALTER TABLE `food_combos_ordered`
  MODIFY `order_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `movies`
--
ALTER TABLE `movies`
  MODIFY `movie_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `seats`
--
ALTER TABLE `seats`
  MODIFY `seat_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=1009;

--
-- AUTO_INCREMENT for table `showtimes`
--
ALTER TABLE `showtimes`
  MODIFY `showtime_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=19;

--
-- AUTO_INCREMENT for table `tickets_ordered`
--
ALTER TABLE `tickets_ordered`
  MODIFY `tickets_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bookings`
--
ALTER TABLE `bookings`
  ADD CONSTRAINT `bookings_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `bookings_ibfk_2` FOREIGN KEY (`hall_id`) REFERENCES `cinema_halls` (`hall_id`),
  ADD CONSTRAINT `bookings_ibfk_3` FOREIGN KEY (`showtime_id`) REFERENCES `showtimes` (`showtime_id`);

--
-- Constraints for table `food_combos_ordered`
--
ALTER TABLE `food_combos_ordered`
  ADD CONSTRAINT `food_combos_ordered_ibfk_1` FOREIGN KEY (`combo_id`) REFERENCES `food_combos` (`combo_id`),
  ADD CONSTRAINT `food_combos_ordered_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

--
-- Constraints for table `seats`
--
ALTER TABLE `seats`
  ADD CONSTRAINT `seats_ibfk_1` FOREIGN KEY (`hall_id`) REFERENCES `cinema_halls` (`hall_id`),
  ADD CONSTRAINT `seats_ibfk_2` FOREIGN KEY (`showtime_id`) REFERENCES `showtimes` (`showtime_id`),
  ADD CONSTRAINT `seats_ibfk_3` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);

--
-- Constraints for table `showtimes`
--
ALTER TABLE `showtimes`
  ADD CONSTRAINT `showtimes_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `showtimes_ibfk_2` FOREIGN KEY (`hall_id`) REFERENCES `cinema_halls` (`hall_id`);

--
-- Constraints for table `tickets_ordered`
--
ALTER TABLE `tickets_ordered`
  ADD CONSTRAINT `tickets_ordered_ibfk_1` FOREIGN KEY (`movie_id`) REFERENCES `movies` (`movie_id`),
  ADD CONSTRAINT `tickets_ordered_ibfk_2` FOREIGN KEY (`booking_id`) REFERENCES `bookings` (`booking_id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
