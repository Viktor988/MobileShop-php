-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 26, 2019 at 06:25 PM
-- Server version: 10.1.37-MariaDB
-- PHP Version: 7.3.1

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `sajtphp11`
--

-- --------------------------------------------------------

--
-- Table structure for table `anketaodgovori`
--

CREATE TABLE `anketaodgovori` (
  `idOdgovora` int(10) NOT NULL,
  `idPitanja` int(11) NOT NULL,
  `odgovori` varchar(90) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anketaodgovori`
--

INSERT INTO `anketaodgovori` (`idOdgovora`, `idPitanja`, `odgovori`) VALUES
(1, 1, 'Samsung'),
(2, 1, 'Huawei'),
(3, 1, 'Xiaomi');

-- --------------------------------------------------------

--
-- Table structure for table `anketapitanja`
--

CREATE TABLE `anketapitanja` (
  `idPitanja` int(10) NOT NULL,
  `tekstPitanja` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `aktivna` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anketapitanja`
--

INSERT INTO `anketapitanja` (`idPitanja`, `tekstPitanja`, `aktivna`) VALUES
(1, 'Koja vam je imoljena marka telefona?', 1);

-- --------------------------------------------------------

--
-- Table structure for table `anketarezultati`
--

CREATE TABLE `anketarezultati` (
  `idRezultat` int(10) NOT NULL,
  `idPitanja` int(10) NOT NULL,
  `idOdgovora` int(10) NOT NULL,
  `rezultat` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `anketarezultati`
--

INSERT INTO `anketarezultati` (`idRezultat`, `idPitanja`, `idOdgovora`, `rezultat`) VALUES
(4, 1, 1, 10),
(5, 1, 2, 10),
(6, 1, 3, 8);

-- --------------------------------------------------------

--
-- Table structure for table `faikonice`
--

CREATE TABLE `faikonice` (
  `idIkonice` int(11) NOT NULL,
  `link` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `text` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `faikonice`
--

INSERT INTO `faikonice` (`idIkonice`, `link`, `text`) VALUES
(5, 'www.facebook.com/', 'fab fa-facebook'),
(6, 'https://www.instagram.com/?hl=sr', 'fab fa-instagram'),
(7, 'https://twitter.com/?lang=sr', 'fab fa-twitter-square'),
(8, 'https://plus.google.com/up/?continue=https://plus.google.com/people', 'fab fa-google-plus-g');

-- --------------------------------------------------------

--
-- Table structure for table `korisnik`
--

CREATE TABLE `korisnik` (
  `idkorisnik` int(11) NOT NULL,
  `ime_i_prezime` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `email` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `lozinka` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `lozinkaponovo` varchar(100) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `pol` varchar(20) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `iduloga` int(11) NOT NULL,
  `glasao` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korisnik`
--

INSERT INTO `korisnik` (`idkorisnik`, `ime_i_prezime`, `email`, `lozinka`, `lozinkaponovo`, `pol`, `iduloga`, `glasao`) VALUES
(221, 'Viktor Ciric', 'viktor@gmail.com', 'viktor98', 'viktor98', 'Muski', 1, 1),
(222, 'Viktor Ciric', 'viktorciric31@gmail.com', 'viktor98', 'viktor98', 'Muski', 2, 1),
(223, 'Viktror Ciric', 'viktorr@gmail.com', 'adsdasd4', 'adsdasd4', 'Muski', 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `korpa`
--

CREATE TABLE `korpa` (
  `idkorpa` int(200) NOT NULL,
  `idProizvod` int(50) NOT NULL,
  `idkorisnik` int(11) NOT NULL,
  `kolicina` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `korpa`
--

INSERT INTO `korpa` (`idkorpa`, `idProizvod`, `idkorisnik`, `kolicina`) VALUES
(1, 46, 222, 1),
(2, 8, 222, 1);

-- --------------------------------------------------------

--
-- Table structure for table `marka`
--

CREATE TABLE `marka` (
  `idMarka` int(50) NOT NULL,
  `Naziv` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `marka`
--

INSERT INTO `marka` (`idMarka`, `Naziv`) VALUES
(1, 'Samsung'),
(4, 'Xiaomi'),
(5, 'Huawei');

-- --------------------------------------------------------

--
-- Table structure for table `meni`
--

CREATE TABLE `meni` (
  `idMeni` int(25) NOT NULL,
  `link` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `text` varchar(255) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `status` int(2) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `meni`
--

INSERT INTO `meni` (`idMeni`, `link`, `text`, `status`) VALUES
(1, 'index.php', 'Početna', 0),
(2, 'kontakt.php', 'Kontakt', 0),
(3, 'autor.php', 'O autoru', 0),
(4, 'registracija.php', 'Registracija', 2),
(5, 'login.php', 'Prijava', 2),
(6, 'odjava.php', 'Odjavite se', 3),
(7, 'admin.php', 'Admin', 1),
(8, 'korpaprikaz.php', '<i class=\"fas fa-shopping-cart\" id=\"linkkorpa\"></i>', 3);

-- --------------------------------------------------------

--
-- Table structure for table `proizvodi`
--

CREATE TABLE `proizvodi` (
  `idProizvod` int(50) NOT NULL,
  `Model` varchar(50) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `Opis` text CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `cena` decimal(10,0) NOT NULL,
  `idMarka` int(50) NOT NULL,
  `idslika` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `proizvodi`
--

INSERT INTO `proizvodi` (`idProizvod`, `Model`, `Opis`, `cena`, `idMarka`, `idslika`) VALUES
(8, 'P20', 'Crna ,6.0\", Quad Core, 3 GB, 13.0 Mpix + 5.0 Mpix', '32000', 5, 61),
(46, 'J3', '	Crna ,6.0\", Quad Core, 3 GB, 13.0 Mpix + 5.0 Mpix', '25000', 1, 55),
(47, 'S5', 'Crna ,6.0\", Quad Core, 3 GB, 13.0 Mpix + 5.0 Mpix	', '36000', 1, 56),
(49, 'Mi mix', 'Crna ,6.0\", Quad Core, 3 GB, 13.0 Mpix + 5.0 Mpix', '28000', 4, 58),
(50, 'Y3', 'Crna ,6.0\", Quad Core, 3 GB, 13.0 Mpix + 5.0 Mpix	', '32000', 5, 59),
(51, 'Note 6', 'Crna ,6.0\", Quad Core, 3 GB, 13.0 Mpix + 5.0 Mpix', '43000', 1, 60),
(53, 'adsasdasd', 'vikccc', '3333', 1, 58);

-- --------------------------------------------------------

--
-- Table structure for table `slike`
--

CREATE TABLE `slike` (
  `idslika` int(10) NOT NULL,
  `name` varchar(30) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `size` varchar(30) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL,
  `type` int(11) NOT NULL,
  `path` varchar(30) CHARACTER SET utf32 COLLATE utf32_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `slike`
--

INSERT INTO `slike` (`idslika`, `name`, `size`, `type`, `path`) VALUES
(1, 'huawei5.png', '43207', 0, 'slike/huawei5.png'),
(55, 'sam1.png', '84446', 0, 'slike/sam1.png'),
(56, 'C:xampp	mpphp1C8F.tmp', '159141', 0, 'slike/xiaomi2.png'),
(58, 'C:xampp	mpphpFAF5.tmp', '31256', 0, 'slike/xiaomi3.png'),
(59, 'huawei4.png', '37541', 0, 'slike/huawei4.png'),
(60, 'C:xampp	mpphp7F97.tmp', '47797', 0, 'slike/sam8.png'),
(61, 'C:xampp	mpphpF5EA.tmp', '44404', 0, 'slike/sam2.png'),
(62, 'huawei5.png', '43207', 0, 'slike/huawei5.png');

-- --------------------------------------------------------

--
-- Table structure for table `uloge`
--

CREATE TABLE `uloge` (
  `iduloga` int(11) NOT NULL,
  `naziv` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `uloge`
--

INSERT INTO `uloge` (`iduloga`, `naziv`) VALUES
(1, 'korisnik'),
(2, 'admin');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `anketaodgovori`
--
ALTER TABLE `anketaodgovori`
  ADD PRIMARY KEY (`idOdgovora`),
  ADD KEY `idPitanja` (`idPitanja`);

--
-- Indexes for table `anketapitanja`
--
ALTER TABLE `anketapitanja`
  ADD PRIMARY KEY (`idPitanja`);

--
-- Indexes for table `anketarezultati`
--
ALTER TABLE `anketarezultati`
  ADD PRIMARY KEY (`idRezultat`),
  ADD KEY `idPitanja` (`idPitanja`),
  ADD KEY `idOdgovora` (`idOdgovora`);

--
-- Indexes for table `faikonice`
--
ALTER TABLE `faikonice`
  ADD PRIMARY KEY (`idIkonice`);

--
-- Indexes for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD PRIMARY KEY (`idkorisnik`),
  ADD UNIQUE KEY `email` (`email`),
  ADD KEY `iduloga` (`iduloga`);

--
-- Indexes for table `korpa`
--
ALTER TABLE `korpa`
  ADD PRIMARY KEY (`idkorpa`),
  ADD KEY `idProizvod` (`idProizvod`),
  ADD KEY `idkorisnik` (`idkorisnik`);

--
-- Indexes for table `marka`
--
ALTER TABLE `marka`
  ADD PRIMARY KEY (`idMarka`);

--
-- Indexes for table `meni`
--
ALTER TABLE `meni`
  ADD PRIMARY KEY (`idMeni`);

--
-- Indexes for table `proizvodi`
--
ALTER TABLE `proizvodi`
  ADD PRIMARY KEY (`idProizvod`),
  ADD KEY `idMarka` (`idMarka`),
  ADD KEY `idslika` (`idslika`);

--
-- Indexes for table `slike`
--
ALTER TABLE `slike`
  ADD PRIMARY KEY (`idslika`);

--
-- Indexes for table `uloge`
--
ALTER TABLE `uloge`
  ADD PRIMARY KEY (`iduloga`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `anketaodgovori`
--
ALTER TABLE `anketaodgovori`
  MODIFY `idOdgovora` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `anketapitanja`
--
ALTER TABLE `anketapitanja`
  MODIFY `idPitanja` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `anketarezultati`
--
ALTER TABLE `anketarezultati`
  MODIFY `idRezultat` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `faikonice`
--
ALTER TABLE `faikonice`
  MODIFY `idIkonice` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `korisnik`
--
ALTER TABLE `korisnik`
  MODIFY `idkorisnik` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=224;

--
-- AUTO_INCREMENT for table `korpa`
--
ALTER TABLE `korpa`
  MODIFY `idkorpa` int(200) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `marka`
--
ALTER TABLE `marka`
  MODIFY `idMarka` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `meni`
--
ALTER TABLE `meni`
  MODIFY `idMeni` int(25) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `proizvodi`
--
ALTER TABLE `proizvodi`
  MODIFY `idProizvod` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=54;

--
-- AUTO_INCREMENT for table `slike`
--
ALTER TABLE `slike`
  MODIFY `idslika` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=63;

--
-- AUTO_INCREMENT for table `uloge`
--
ALTER TABLE `uloge`
  MODIFY `iduloga` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `anketaodgovori`
--
ALTER TABLE `anketaodgovori`
  ADD CONSTRAINT `anketaodgovori_ibfk_1` FOREIGN KEY (`idPitanja`) REFERENCES `anketapitanja` (`idPitanja`);

--
-- Constraints for table `anketarezultati`
--
ALTER TABLE `anketarezultati`
  ADD CONSTRAINT `anketarezultati_ibfk_1` FOREIGN KEY (`idOdgovora`) REFERENCES `anketaodgovori` (`idOdgovora`);

--
-- Constraints for table `korisnik`
--
ALTER TABLE `korisnik`
  ADD CONSTRAINT `korisnik_ibfk_1` FOREIGN KEY (`iduloga`) REFERENCES `uloge` (`iduloga`);

--
-- Constraints for table `korpa`
--
ALTER TABLE `korpa`
  ADD CONSTRAINT `korpa_ibfk_1` FOREIGN KEY (`idkorisnik`) REFERENCES `korisnik` (`idkorisnik`),
  ADD CONSTRAINT `korpa_ibfk_2` FOREIGN KEY (`idProizvod`) REFERENCES `proizvodi` (`idProizvod`);

--
-- Constraints for table `proizvodi`
--
ALTER TABLE `proizvodi`
  ADD CONSTRAINT `proizvodi_ibfk_1` FOREIGN KEY (`idslika`) REFERENCES `slike` (`idslika`),
  ADD CONSTRAINT `proizvodi_ibfk_2` FOREIGN KEY (`idMarka`) REFERENCES `marka` (`idMarka`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
