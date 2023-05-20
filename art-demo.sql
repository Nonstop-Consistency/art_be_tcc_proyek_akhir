-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 20, 2023 at 07:34 AM
-- Server version: 10.4.27-MariaDB
-- PHP Version: 8.0.25

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `art-demo`
--

-- --------------------------------------------------------

--
-- Table structure for table `artists`
--

CREATE TABLE `artists` (
  `id` int(11) NOT NULL,
  `firstName` varchar(255) DEFAULT NULL,
  `lastName` varchar(255) DEFAULT NULL,
  `nationality` varchar(255) DEFAULT NULL,
  `born` int(11) DEFAULT NULL,
  `died` int(11) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artists`
--

INSERT INTO `artists` (`id`, `firstName`, `lastName`, `nationality`, `born`, `died`, `createdAt`, `updatedAt`) VALUES
(1, 'Vincent', 'Van Gogh', 'Netherlands', 1853, 1890, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Edward', 'Hopper', 'United States of America', 1882, 1967, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'James Mcneill', 'Whistler', 'United States of America', 1834, 1903, '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Diego', 'Velazquez', 'Spain', 1599, 1660, '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `artworks`
--

CREATE TABLE `artworks` (
  `id` int(11) NOT NULL,
  `title` varchar(255) DEFAULT NULL,
  `year` int(11) DEFAULT NULL,
  `movement` varchar(255) DEFAULT NULL,
  `medium` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL,
  `locationId` int(11) DEFAULT NULL,
  `artistId` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `artworks`
--

INSERT INTO `artworks` (`id`, `title`, `year`, `movement`, `medium`, `createdAt`, `updatedAt`, `locationId`, `artistId`) VALUES
(1, 'Whistler\'s Mother', 1871, 'Realism', 'Oil Paint', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL),
(2, 'The Starry Night', 1889, 'Post Impressionism', 'Oil Paint', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL),
(3, 'Las Meninas', 1656, 'Baroque', 'Oil Paint', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL),
(4, 'Nighthawks', 1942, 'Modernism', 'Oil Paint', '0000-00-00 00:00:00', '0000-00-00 00:00:00', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `locations`
--

CREATE TABLE `locations` (
  `id` int(11) NOT NULL,
  `name` varchar(255) DEFAULT NULL,
  `town` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `createdAt` datetime NOT NULL,
  `updatedAt` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `locations`
--

INSERT INTO `locations` (`id`, `name`, `town`, `country`, `createdAt`, `updatedAt`) VALUES
(1, 'Musee d\'Orsay', 'Paris', 'France', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(2, 'Museo Del Prado', 'Madrid', 'Spain', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(3, 'MoMA', 'New York', 'United States', '0000-00-00 00:00:00', '0000-00-00 00:00:00'),
(4, 'Art Institute of Chicago', 'Chicago', 'United States', '0000-00-00 00:00:00', '0000-00-00 00:00:00');

-- --------------------------------------------------------

--
-- Table structure for table `sequelizemeta`
--

CREATE TABLE `sequelizemeta` (
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `sequelizemeta`
--

INSERT INTO `sequelizemeta` (`name`) VALUES
('20171227203651-create-artwork.js'),
('20171227215615-create-artist.js'),
('20171228220959-create-location.js'),
('20171230210019-add-location-id-to-artwork.js'),
('20171230221706-add-artist-id-column-to-artwork-model.js');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `artists`
--
ALTER TABLE `artists`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `artworks`
--
ALTER TABLE `artworks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `artworks_locationId_foreign_idx` (`locationId`),
  ADD KEY `artworks_artistId_foreign_idx` (`artistId`);

--
-- Indexes for table `locations`
--
ALTER TABLE `locations`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `sequelizemeta`
--
ALTER TABLE `sequelizemeta`
  ADD PRIMARY KEY (`name`),
  ADD UNIQUE KEY `name` (`name`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `artists`
--
ALTER TABLE `artists`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `artworks`
--
ALTER TABLE `artworks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `locations`
--
ALTER TABLE `locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `artworks`
--
ALTER TABLE `artworks`
  ADD CONSTRAINT `artworks_artistId_foreign_idx` FOREIGN KEY (`artistId`) REFERENCES `artists` (`id`),
  ADD CONSTRAINT `artworks_locationId_foreign_idx` FOREIGN KEY (`locationId`) REFERENCES `locations` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
