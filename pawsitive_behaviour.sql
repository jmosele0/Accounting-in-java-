-- phpMyAdmin SQL Dump
-- version 4.9.0.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 05, 2019 at 02:46 AM
-- Server version: 10.4.6-MariaDB
-- PHP Version: 7.3.8

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `pawsitive behaviour`
--
CREATE DATABASE IF NOT EXISTS `pawsitive behaviour` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pawsitive behaviour`;

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CatID` int(50) NOT NULL,
  `CatDesc` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categoryexperience`
--

CREATE TABLE `categoryexperience` (
  `CatID` int(50) NOT NULL,
  `ExperienceID` int(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dog`
--

CREATE TABLE `dog` (
  `DogID` int(5) NOT NULL,
  `DogName` varchar(15) NOT NULL,
  `Breed` varchar(20) NOT NULL,
  `Sex` varchar(5) NOT NULL,
  `Desexed` tinyint(1) NOT NULL,
  `HowLongOwned` date NOT NULL,
  `VacinationStatus` tinyint(1) NOT NULL,
  `DogOrigin` varchar(20) NOT NULL,
  `OwnerID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `dogfamily`
--

CREATE TABLE `dogfamily` (
  `DogFamilyID` int(5) NOT NULL,
  `Adults` varchar(200) NOT NULL,
  `Children` varchar(200) NOT NULL,
  `OtherDogs` varchar(200) NOT NULL,
  `OtherAnimals` varchar(200) NOT NULL,
  `DogID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `doglikedislike`
--

CREATE TABLE `doglikedislike` (
  `LikeDislikeID` int(5) NOT NULL,
  `DogID` int(5) NOT NULL,
  `Subject` varchar(200) NOT NULL,
  `LikeOrDislike` varchar(7) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `ExperienceID` int(5) NOT NULL,
  `ExperienceName` varchar(50) NOT NULL,
  `ExperienceNotes` varchar(200) NOT NULL,
  `DogID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `generalinfo`
--

CREATE TABLE `generalinfo` (
  `InfoID` int(5) NOT NULL,
  `ParentSiblingSighted` tinyint(1) NOT NULL,
  `PersonalityConcerns` varchar(200) NOT NULL,
  `FirstMet` varchar(200) NOT NULL,
  `WhyThatName` varchar(200) NOT NULL,
  `DogID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `OnwerID` int(5) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `Gender` varchar(5) NOT NULL,
  `Couple` tinyint(1) NOT NULL,
  `AgeRange` varchar(8) NOT NULL,
  `PostCode` varchar(5) NOT NULL,
  `PrePets` tinyint(1) NOT NULL,
  `PrePetsList` varchar(100) NOT NULL,
  `ObiedientDog` tinyint(1) NOT NULL,
  `ExpectedOutcomes` varchar(100) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`CatID`);

--
-- Indexes for table `categoryexperience`
--
ALTER TABLE `categoryexperience`
  ADD PRIMARY KEY (`CatID`,`ExperienceID`),
  ADD KEY `ExperienceID` (`ExperienceID`);

--
-- Indexes for table `dog`
--
ALTER TABLE `dog`
  ADD PRIMARY KEY (`DogID`),
  ADD KEY `OwnerID` (`OwnerID`);

--
-- Indexes for table `dogfamily`
--
ALTER TABLE `dogfamily`
  ADD PRIMARY KEY (`DogFamilyID`),
  ADD KEY `DogID` (`DogID`);

--
-- Indexes for table `doglikedislike`
--
ALTER TABLE `doglikedislike`
  ADD PRIMARY KEY (`LikeDislikeID`),
  ADD KEY `DogID` (`DogID`);

--
-- Indexes for table `experience`
--
ALTER TABLE `experience`
  ADD PRIMARY KEY (`ExperienceID`),
  ADD KEY `DogID` (`DogID`);

--
-- Indexes for table `generalinfo`
--
ALTER TABLE `generalinfo`
  ADD PRIMARY KEY (`InfoID`),
  ADD KEY `DogID` (`DogID`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`OnwerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CatID` int(50) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dog`
--
ALTER TABLE `dog`
  MODIFY `DogID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dogfamily`
--
ALTER TABLE `dogfamily`
  MODIFY `DogFamilyID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `doglikedislike`
--
ALTER TABLE `doglikedislike`
  MODIFY `LikeDislikeID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `ExperienceID` int(5) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `generalinfo`
--
ALTER TABLE `generalinfo`
  MODIFY `InfoID` int(5) NOT NULL AUTO_INCREMENT;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `category`
--
ALTER TABLE `category`
  ADD CONSTRAINT `category_ibfk_1` FOREIGN KEY (`CatID`) REFERENCES `categoryexperience` (`CatID`);

--
-- Constraints for table `categoryexperience`
--
ALTER TABLE `categoryexperience`
  ADD CONSTRAINT `categoryexperience_ibfk_1` FOREIGN KEY (`ExperienceID`) REFERENCES `experience` (`ExperienceID`);

--
-- Constraints for table `dog`
--
ALTER TABLE `dog`
  ADD CONSTRAINT `dog_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `owner` (`OnwerID`);

--
-- Constraints for table `dogfamily`
--
ALTER TABLE `dogfamily`
  ADD CONSTRAINT `dogfamily_ibfk_1` FOREIGN KEY (`DogID`) REFERENCES `dog` (`DogID`);

--
-- Constraints for table `doglikedislike`
--
ALTER TABLE `doglikedislike`
  ADD CONSTRAINT `doglikedislike_ibfk_1` FOREIGN KEY (`DogID`) REFERENCES `dog` (`DogID`);

--
-- Constraints for table `experience`
--
ALTER TABLE `experience`
  ADD CONSTRAINT `experience_ibfk_1` FOREIGN KEY (`DogID`) REFERENCES `dog` (`DogID`);

--
-- Constraints for table `generalinfo`
--
ALTER TABLE `generalinfo`
  ADD CONSTRAINT `generalinfo_ibfk_1` FOREIGN KEY (`DogID`) REFERENCES `dog` (`DogID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
