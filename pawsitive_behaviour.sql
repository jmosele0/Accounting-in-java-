-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Sep 19, 2019 at 04:02 PM
-- Server version: 10.1.24-MariaDB
-- PHP Version: 7.1.6

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

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CatID` int(5) NOT NULL,
  `CatDesc` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `categoryexperience`
--

CREATE TABLE `categoryexperience` (
  `CatID` int(5) NOT NULL,
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
  `Sex` varchar(15) NOT NULL,
  `Desexed` varchar(15) NOT NULL,
  `HowLongOwned` date NOT NULL,
  `VacinationStatus` varchar(15) NOT NULL,
  `DogOrigin` varchar(20) NOT NULL,
  `OwnerID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dog`
--

INSERT INTO `dog` (`DogID`, `DogName`, `Breed`, `Sex`, `Desexed`, `HowLongOwned`, `VacinationStatus`, `DogOrigin`, `OwnerID`) VALUES
(0, 'jjay', 'Huskey', 'Male', '', '2019-09-01', '1', 'family', 1),
(2, 'Pupy', 'Bush Dog', 'Fem', '1', '2019-07-09', '0', 'Bush', 2),
(3, 'waki', '', '', '', '0000-00-00', '', '', 1);

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
  `ParentSiblingSighted` varchar(15) NOT NULL,
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
  `OwnerID` int(5) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `Gender` varchar(15) NOT NULL,
  `Couple` varchar(15) NOT NULL,
  `AgeRange` varchar(8) NOT NULL,
  `PostCode` int(2) NOT NULL,
  `PrePets` varchar(15) NOT NULL,
  `PrePetsList` varchar(100) NOT NULL,
  `ObiedientDog` varchar(15) NOT NULL,
  `ExpectedOutcomes` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`OwnerID`, `Email`, `FirstName`, `Gender`, `Couple`, `AgeRange`, `PostCode`, `PrePets`, `PrePetsList`, `ObiedientDog`, `ExpectedOutcomes`, `password`) VALUES
(1, 'mail@mail.com', 'nnewuser', 'female', '1', '35', 3422, '1', 'dog, cat, hasmster', 'ObidientDog', 'trained dog', 'password'),
(2, 'email@mail.com', 'Name', 'Fem', '0', '24', 3423, '0', 'None', 'ObidientDog', 'a disiplined dog', 'password'),
(3, 'emailme@mail.com', '', '', '', '', 0, '', '', '', '', '$2y$10$xUDWlsWHTSpfp1MDP7TSeeh4k.wwnmA7PPryq2jqDaYM3ecSCJE7u'),
(4, 'sdfsdf@mail.com', '', '', '', '', 0, '', '', '', '', '$2y$10$CG/lX4oUoIKq.zTlEUyC5eUgL6mYMwTv5w/6YISmJzWS6N2//OVCy'),
(5, 'newuser@mail.com', '', '', '', '', 42423, '', '', '', '', '$2y$10$6F2FVrIHXskcuZGuQi8NIefBJyB3V/h18vjZ4yB/Gh1BwjeGG9Z.W'),
(6, 'jmail@mail.com', 'Newuser', 'Male', '1', '35', 3422, '1', 'dog, cat, hasmster', 'ObidientDog', 'trained dog', '');

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
  ADD PRIMARY KEY (`OwnerID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CatID` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `dog`
--
ALTER TABLE `dog`
  MODIFY `DogID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
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
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `OwnerID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
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
  ADD CONSTRAINT `dog_ibfk_1` FOREIGN KEY (`OwnerID`) REFERENCES `owner` (`OwnerID`);

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
