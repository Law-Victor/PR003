-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 19, 2025 at 11:50 AM
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
-- Database: `voetbalshirts`
--

-- --------------------------------------------------------

--
-- Table structure for table `bestellingen`
--

CREATE TABLE `bestellingen` (
  `id_order` int(10) NOT NULL,
  `id_klant` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `quantity` int(3) NOT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `bestellingen`
--

INSERT INTO `bestellingen` (`id_order`, `id_klant`, `id_product`, `quantity`, `datum`) VALUES
(1, 1, 3, 1, '2025-02-15'),
(2, 2, 5, 2, '2025-02-18'),
(3, 3, 1, 1, '2025-02-20'),
(4, 4, 7, 1, '2025-02-22'),
(5, 5, 10, 1, '2025-02-25'),
(6, 6, 2, 1, '2025-03-01'),
(7, 7, 6, 1, '2025-03-05'),
(8, 8, 4, 1, '2025-03-08'),
(9, 3, 9, 1, '2025-03-10'),
(10, 5, 8, 1, '2025-03-12'),
(11, 1, 6, 1, '2025-03-15'),
(12, 2, 3, 1, '2025-03-16'),
(13, 9, 1, 2, '2025-03-16'),
(14, 10, 5, 1, '2025-03-17'),
(15, 4, 10, 1, '2025-03-17');

-- --------------------------------------------------------

--
-- Table structure for table `klant`
--

CREATE TABLE `klant` (
  `id_klant` int(10) NOT NULL,
  `naam` varchar(25) NOT NULL,
  `adres` varchar(50) NOT NULL,
  `email` varchar(50) NOT NULL,
  `telefoonnummer` varchar(15) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `klant`
--

INSERT INTO `klant` (`id_klant`, `naam`, `adres`, `email`, `telefoonnummer`) VALUES
(1, 'Jan de Vries', 'Hoofdstraat 123, Amsterdam', 'jan.devries@email.nl', '0612345678'),
(2, 'Maria Jansen', 'Kerkweg 45, Rotterdam', 'maria.jansen@email.nl', '0698765432'),
(3, 'Pieter Bakker', 'Dorpsplein 7, Utrecht', 'pieter.bakker@email.nl', '0623456789'),
(4, 'Sophie de Groot', 'Schoolstraat 22, Den Haag', 'sophie.degroot@email.nl', '0687654321'),
(5, 'Thomas van Dijk', 'Molenweg 3, Eindhoven', 'thomas.vandijk@email.nl', '0634567890'),
(6, 'Emma Visser', 'Parkweg 15, Groningen', 'emma.visser@email.nl', '0676543210'),
(7, 'Lucas Smit', 'Stationsplein 9, Tilburg', 'lucas.smit@email.nl', '0645678901'),
(8, 'Laura Mulder', 'Zuiderstraat 33, Breda', 'laura.mulder@email.nl', '0665432109'),
(9, 'Sem Meijer', 'Oostweg 18, Nijmegen', 'sem.meijer@email.nl', '0656789012'),
(10, 'Julia de Boer', 'Noordlaan 27, Arnhem', 'julia.deboer@email.nl', '0654321098');

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `id_product` int(10) NOT NULL,
  `naam` varchar(50) NOT NULL,
  `prijs` decimal(10,2) NOT NULL,
  `beschrijving` text DEFAULT NULL,
  `voorraad` int(5) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`id_product`, `naam`, `prijs`, `beschrijving`, `voorraad`) VALUES
(1, 'Ajax Thuisshirt 2024/2025', 89.99, 'Officieel Ajax thuisshirt voor het seizoen 2024/2025 met het iconische rood-witte design.', 50),
(2, 'FC Barcelona Thuisshirt 2024/2025', 94.99, 'Officieel FC Barcelona thuisshirt in de traditionele blaugrana kleuren met de nieuwste technologie voor optimaal comfort.', 45),
(3, 'Manchester United Uitshirt 2024/2025', 84.99, 'Officieel Manchester United uitshirt in stijlvol zwart met rode accenten.', 38),
(4, 'Bayern München Thuisshirt 2024/2025', 89.99, 'Officieel Bayern München thuisshirt in het kenmerkende rood met subtiele patronen.', 42),
(5, 'PSV Thuisshirt 2024/2025', 79.99, 'Officieel PSV thuisshirt met de klassieke rood-witte strepen.', 55),
(6, 'Real Madrid Thuisshirt 2024/2025', 99.99, 'Officieel Real Madrid thuisshirt in elegant wit met gouden details.', 30),
(7, 'Feyenoord Thuisshirt 2024/2025', 79.99, 'Officieel Feyenoord thuisshirt in het traditionele rood-wit met zwarte accenten.', 48),
(8, 'Juventus Thuisshirt 2024/2025', 89.99, 'Officieel Juventus thuisshirt met de iconische zwart-witte strepen.', 35),
(9, 'Liverpool Thuisshirt 2024/2025', 84.99, 'Officieel Liverpool thuisshirt in het kenmerkende rood met nieuwe details voor het seizoen 2024/2025.', 40),
(10, 'Paris Saint-Germain Thuisshirt 2024/2025', 94.99, 'Officieel Paris Saint-Germain thuisshirt met het unieke design in blauw, rood en wit.', 32);

-- --------------------------------------------------------

--
-- Table structure for table `retour`
--

CREATE TABLE `retour` (
  `id_retour` int(10) NOT NULL,
  `id_klant` int(10) NOT NULL,
  `id_order` int(10) NOT NULL,
  `datum` date NOT NULL,
  `reden` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `retour`
--

INSERT INTO `retour` (`id_retour`, `id_klant`, `id_order`, `datum`, `reden`) VALUES
(1, 2, 2, '2025-02-25', 'Verkeerde maat ontvangen'),
(2, 5, 5, '2025-03-04', 'Product beschadigd bij levering'),
(3, 8, 8, '2025-03-15', 'Kwaliteit voldoet niet aan verwachtingen');

-- --------------------------------------------------------

--
-- Table structure for table `review`
--

CREATE TABLE `review` (
  `id_review` int(10) NOT NULL,
  `id_klant` int(10) NOT NULL,
  `id_product` int(10) NOT NULL,
  `review_tekst` varchar(255) NOT NULL,
  `rating` int(1) DEFAULT NULL,
  `datum` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `review`
--

INSERT INTO `review` (`id_review`, `id_klant`, `id_product`, `review_tekst`, `rating`, `datum`) VALUES
(1, 1, 3, 'Geweldig shirt, mooie kwaliteit en past perfect!', 5, '2025-02-20'),
(2, 3, 1, 'Het Ajax shirt ziet er fantastisch uit, precies zoals op de afbeelding.', 5, '2025-02-28'),
(3, 4, 7, 'Het Feyenoord shirt is mooi, maar valt iets kleiner dan verwacht.', 4, '2025-03-01'),
(4, 6, 2, 'Prachtig Barcelona shirt, zeer tevreden met de aankoop.', 5, '2025-03-10'),
(5, 7, 6, 'Het Real Madrid shirt is elegant en comfortabel om te dragen.', 4, '2025-03-15'),
(6, 9, 1, 'Perfecte pasvorm en zeer goede kwaliteit van het Ajax shirt.', 5, '2025-03-18'),
(7, 10, 5, 'Het PSV shirt is mooi, maar de stof is iets dunner dan verwacht.', 3, '2025-03-18');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD PRIMARY KEY (`id_order`),
  ADD KEY `id_klant` (`id_klant`),
  ADD KEY `id_product` (`id_product`);

--
-- Indexes for table `klant`
--
ALTER TABLE `klant`
  ADD PRIMARY KEY (`id_klant`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`id_product`);

--
-- Indexes for table `retour`
--
ALTER TABLE `retour`
  ADD PRIMARY KEY (`id_retour`),
  ADD KEY `id_klant` (`id_klant`),
  ADD KEY `id_order` (`id_order`);

--
-- Indexes for table `review`
--
ALTER TABLE `review`
  ADD PRIMARY KEY (`id_review`),
  ADD KEY `id_klant` (`id_klant`),
  ADD KEY `id_product` (`id_product`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `bestellingen`
--
ALTER TABLE `bestellingen`
  MODIFY `id_order` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `klant`
--
ALTER TABLE `klant`
  MODIFY `id_klant` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `product`
--
ALTER TABLE `product`
  MODIFY `id_product` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=11;

--
-- AUTO_INCREMENT for table `retour`
--
ALTER TABLE `retour`
  MODIFY `id_retour` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `review`
--
ALTER TABLE `review`
  MODIFY `id_review` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `bestellingen`
--
ALTER TABLE `bestellingen`
  ADD CONSTRAINT `bestellingen_ibfk_1` FOREIGN KEY (`id_klant`) REFERENCES `klant` (`id_klant`),
  ADD CONSTRAINT `bestellingen_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);

--
-- Constraints for table `retour`
--
ALTER TABLE `retour`
  ADD CONSTRAINT `retour_ibfk_1` FOREIGN KEY (`id_klant`) REFERENCES `klant` (`id_klant`),
  ADD CONSTRAINT `retour_ibfk_2` FOREIGN KEY (`id_order`) REFERENCES `bestellingen` (`id_order`);

--
-- Constraints for table `review`
--
ALTER TABLE `review`
  ADD CONSTRAINT `review_ibfk_1` FOREIGN KEY (`id_klant`) REFERENCES `klant` (`id_klant`),
  ADD CONSTRAINT `review_ibfk_2` FOREIGN KEY (`id_product`) REFERENCES `product` (`id_product`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
