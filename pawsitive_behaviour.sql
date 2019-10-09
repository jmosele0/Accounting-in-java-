-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 09, 2019 at 03:16 PM
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
CREATE DATABASE IF NOT EXISTS `pawsitive behaviour` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pawsitive behaviour`;

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
  `Age` int(2) NOT NULL,
  `Breed` varchar(20) NOT NULL,
  `Sex` varchar(15) NOT NULL,
  `Desexed` varchar(15) NOT NULL,
  `DOB` date NOT NULL,
  `HowLongOwned` varchar(10) NOT NULL,
  `VaccinationStatus` varchar(15) DEFAULT NULL,
  `DogOrigin` varchar(20) DEFAULT NULL,
  `OwnerID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dog`
--

INSERT INTO `dog` (`DogID`, `DogName`, `Age`, `Breed`, `Sex`, `Desexed`, `DOB`, `HowLongOwned`, `VaccinationStatus`, `DogOrigin`, `OwnerID`) VALUES
(0, 'jjay', 0, 'Huskey', 'Male', '', '0000-00-00', '2019-09-01', '1', 'family', 1),
(2, 'Pupy', 0, 'Bush Dog', 'Fem', '1', '0000-00-00', '2019-07-09', '0', 'Bush', 2),
(3, 'waki', 0, '', '', '', '0000-00-00', '0000-00-00', '', '', 1),
(4, 'jet', 9, 'chi', 'male', 'no', '2010-04-04', '4', 'over', 'pound', 19),
(5, 'terry', 2, 'daschund', 'male', 'no', '2017-06-05', '2 years', 'over', 'pound', 19),
(6, 'jeff', 8, 'german shepard', 'male', 'yes', '2011-06-06', '8 years', 'Unvaccinated', 'pound', 18),
(7, 'max', 4, 'German Shepherd', 'male', 'yes', '2015-04-04', '4 years', 'Unvaccinated', 'pound', 18),
(38, 'jack', 3, 'Bull mastiff', 'male', 'no', '2016-03-02', '3 years', 'Unvaccinated', 'lots', 7),
(39, 'jack', 9, 'jack russell', 'male', 'no', '2010-04-04', '9 years', 'Unvaccinated', 'lots', 7),
(40, 'jex', 9, 'jack russell', 'male', 'no', '2010-04-04', '9 years', 'Unvaccinated', 'lots', 7),
(41, 'jack', 8, 'jack russell', 'male ', 'yes', '2011-01-01', '8 years', 'Unvaccinated', 'lots', 7),
(42, 'jex', 2, 'golden retriever', 'male', 'yes', '2017-04-04', '2 years', 'Unvaccinated', 'lots', 7),
(43, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'lots', 7),
(44, 'jeff', 4, 'golden retriever', 'male', 'yes', '2015-06-06', '4 years', 'Unvaccinated', 'lots', 7),
(45, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'lots', 7),
(46, '', 0, '', '', 'no', '0000-00-00', '', 'Unvaccinated', 'lots', 7),
(47, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 24),
(48, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'lots', 7),
(49, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'lots', 7),
(50, '', 0, '', '', 'lots', '0000-00-00', '', 'Unvaccinated', 'lots', 7),
(51, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'lots', 7),
(52, '', 0, '', '', 'lots', '0000-00-00', '', 'Unvaccinated', 'lots', 7),
(53, '', 0, '', '', 'lots', '0000-00-00', '', 'Unvaccinated', 'lots', 7),
(54, '', 0, '', '', 'lots', '0000-00-00', '', 'Unvaccinated', 'lots', 7),
(55, '', 0, '', '', 'lots', '0000-00-00', '', 'Unvaccinated', 'lots', 7),
(56, 'jack', 1, 'jack russell', 'male', 'yes', '2018-03-03', '1 year', 'over', 'pound', 7),
(57, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 7),
(58, 'max', 6, 'German Shepherd', 'male', 'yes', '2013-04-04', '6 years', 'upto', 'breeder', 36),
(59, 'max', 9, 'golden retriever', 'male', 'yes', '2010-05-05', '9 years', 'Unvaccinated', 'breeder', 37),
(60, 'jake', 2, 'shitzu', 'male', 'no', '2017-04-04', '2 years', 'Unvaccinated', 'breeder', 37),
(61, 'jake', 2, 'shitzu', 'male', 'no', '2017-04-04', '2 years', 'Unvaccinated', 'yes', 37);

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

--
-- Dumping data for table `dogfamily`
--

INSERT INTO `dogfamily` (`DogFamilyID`, `Adults`, `Children`, `OtherDogs`, `OtherAnimals`, `DogID`) VALUES
(23, 'adults', 'children', '', '', 39),
(24, 'adults', '', '', '', 40),
(25, 'adults', '', '', '', 41),
(26, 'adults', '', '', '', 42),
(27, 'adults', '', '', '', 43),
(28, 'adults', 'children', '', '', 44),
(29, 'adults', 'children', '', '', 57),
(30, 'adults', 'children', '', '', 57),
(31, 'adults', 'children', '', '', 58),
(32, 'adults', '', '', '', 59),
(33, 'adults', '', '', '', 60),
(34, 'adults', '', '', '', 60);

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
  `KnowledgeOfBreed` varchar(4) NOT NULL,
  `ParentSiblingSighted` varchar(15) DEFAULT NULL,
  `PersonalityConcerns` varchar(200) DEFAULT NULL,
  `FirstMet` varchar(200) DEFAULT NULL,
  `WhyThatName` varchar(200) DEFAULT NULL,
  `DogID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `generalinfo`
--

INSERT INTO `generalinfo` (`InfoID`, `KnowledgeOfBreed`, `ParentSiblingSighted`, `PersonalityConcerns`, `FirstMet`, `WhyThatName`, `DogID`) VALUES
(30, 'lots', NULL, NULL, NULL, NULL, 39),
(31, 'lots', NULL, NULL, NULL, NULL, 40),
(32, 'lots', NULL, NULL, NULL, NULL, 41),
(33, 'lots', 'yes', 'Friendly', 'friendly', 'came', 42),
(34, 'lots', NULL, NULL, NULL, NULL, 43),
(35, 'lots', 'yes', 'Friendly', 'friendly', 'came', 44),
(36, 'lots', NULL, NULL, NULL, NULL, 45),
(37, 'lots', NULL, NULL, NULL, NULL, 46),
(38, 'lots', NULL, NULL, NULL, NULL, 47),
(39, 'lots', NULL, NULL, NULL, NULL, 48),
(40, 'lots', NULL, NULL, NULL, NULL, 49),
(41, 'lots', NULL, NULL, NULL, NULL, 51),
(42, 'lots', NULL, NULL, NULL, NULL, 51),
(43, 'lots', NULL, NULL, NULL, NULL, 51),
(44, 'lots', NULL, NULL, NULL, NULL, 51),
(45, 'lots', NULL, NULL, NULL, NULL, 0),
(46, 'lots', 'yes', 'Friendly', 'friendly', 'came', 57),
(47, 'yes', 'yes', 'Friendly', 'friendly', 'came', 57),
(48, 'lots', 'yes', 'Friendly', 'friendly', 'came', 58),
(49, 'lots', 'yes', 'Friendly', 'friendly', 'came', 59),
(50, 'lots', 'yes', 'Friendly', 'friendly', 'came', 60),
(51, 'yes', 'yes', 'Friendly', 'friendly', 'came', 60);

-- --------------------------------------------------------

--
-- Table structure for table `owner`
--

CREATE TABLE `owner` (
  `OwnerID` int(5) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `FirstName` varchar(20) NOT NULL,
  `Gender` varchar(15) NOT NULL,
  `Couple` varchar(15) DEFAULT NULL,
  `AgeRange` varchar(8) NOT NULL,
  `PostCode` int(2) NOT NULL,
  `PrePets` varchar(15) DEFAULT NULL,
  `PrePetsList` varchar(100) DEFAULT NULL,
  `ObedientDog` varchar(15) DEFAULT NULL,
  `ExpectedOutcomes` varchar(100) DEFAULT NULL,
  `password` varchar(256) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`OwnerID`, `Email`, `FirstName`, `Gender`, `Couple`, `AgeRange`, `PostCode`, `PrePets`, `PrePetsList`, `ObedientDog`, `ExpectedOutcomes`, `password`) VALUES
(1, 'mail@mail.com', 'nnewuser', 'female', '1', '35', 3422, '1', 'dog, cat, hasmster', 'ObidientDog', 'trained dog', 'password'),
(2, 'email@mail.com', 'Name', 'Fem', '0', '24', 3423, '0', 'None', 'ObidientDog', 'a disiplined dog', 'password'),
(3, 'emailme@mail.com', '', '', '', '', 0, '', '', '', '', '$2y$10$xUDWlsWHTSpfp1MDP7TSeeh4k.wwnmA7PPryq2jqDaYM3ecSCJE7u'),
(4, 'sdfsdf@mail.com', '', '', '', '', 0, '', '', '', '', '$2y$10$CG/lX4oUoIKq.zTlEUyC5eUgL6mYMwTv5w/6YISmJzWS6N2//OVCy'),
(5, 'newuser@mail.com', '', '', '', '', 42423, '', '', '', '', '$2y$10$6F2FVrIHXskcuZGuQi8NIefBJyB3V/h18vjZ4yB/Gh1BwjeGG9Z.W'),
(6, 'jmail@mail.com', 'Newuser', 'Male', '1', '35', 3422, '1', 'dog, cat, hasmster', 'ObidientDog', 'trained dog', ''),
(7, 'Jack@mail.com', 'Jack', 'Male', NULL, '18-30', 2234, 'no', 'nein', 'walks without a', 'Doesn\'t jump up on people', 'jack1012'),
(8, 'Jack@gmail.com', 'Jack', 'Male', NULL, '18-30', 2234, 'no', 'nein', 'walks without a', 'Doesn\'t jump up on people', 'jack1012'),
(9, 'Jack@ggmail.com', 'Jack', 'Male', NULL, '18-30', 0, 'no', 'nein', 'walks without a', 'Doesn\'t jump up on people', 'jack1012'),
(14, 'jeff@mail.com', 'jeffrey', 'male', NULL, 'bet18to3', 9988, NULL, NULL, NULL, NULL, 'jeff1012'),
(15, 'Jack@dmail.com', 'Jack', 'Male', NULL, '18-30', 0, 'no', 'nein', 'walks without a', 'Doesn\'t jump up on people', 'jack1012'),
(16, 'Jack@amail.com', 'Jack', 'Male', NULL, '18-30', 0, 'no', 'nein', 'walks without a', 'Doesn\'t jump up on people', 'jack1012'),
(17, 'jack@geomail.com', 'jack', 'male', NULL, 'bet18to3', 9878, NULL, NULL, NULL, NULL, 'jack1012'),
(18, 'jeff@male.com', 'jeff', 'male', NULL, 'over50', 5004, 'no', 'dogs', 'basic', 'dogout', 'jeff1012'),
(19, 'jack@lemony.com', 'jack', 'male', NULL, 'bet18to3', 9999, 'no', 'dogs', 'basic', 'dogout', 'jack1012'),
(20, 'jack@bail.com', 'jack', 'male', NULL, 'bet18to3', 5544, 'no', 'dogs', 'basic', 'dogout', 'jack1012'),
(22, 'jeck@mail.com', 'jeck', 'male', NULL, 'bet18to3', 4444, 'no', 'dogs', 'basic', 'dogout', 'jeck1012'),
(23, 'j', 'j', 'female', NULL, 'bet18to3', 8, NULL, NULL, NULL, NULL, 'j'),
(24, 'jas@mail.com', 'jasmine', 'female', NULL, 'bet18to3', 3333, 'no', 'cats', 'basic', 'dogout', 'jas1012'),
(25, 'u', 'u', 'female', NULL, 'under 18', 9, 'no', 'dogs', 'basic', 'dogout', 'u'),
(26, 'i', 'i', 'female', NULL, 'under 18', 8, 'no', 'dogs', 'basic', 'dogout', 'i'),
(27, 'jj', 'i', 'female', NULL, 'under 18', 8, 'no', 'dogs', 'basic', 'dogout', 'o'),
(28, 'o', 'o', 'female', NULL, 'under 18', 9, 'no', 'dogs', 'basic', 'dogout', 'o'),
(29, 'r', 'i', 'female', NULL, 'under 18', 6, 'no', 'dogs', 'basic', 'dogout', 'y'),
(30, 'jack@gail.com', 'jack', 'male', NULL, 'bet18to3', 7878, 'no', 'dogs', 'basic', 'dogout', 'jack1012'),
(31, 'jerry@springer.com', 'jerry', 'male', NULL, 'over50', 9999, 'no', 'dogs', 'basic', 'dogout', 'jerry1012'),
(32, 'oo', 'oo', 'female', NULL, 'under 18', 99, 'no', 'dogs', 'basic', 'dogout', 'oo'),
(33, 't', 'i', 'female', NULL, 'under 18', 0, 'no', 'dogs', 'basic', 'dogout', 'u'),
(34, 'tr', 'ii', 'female', NULL, 'under 18', 0, 'yes', 'dogs', 'listens', 'dogout', 'ii'),
(35, 'yy', 'yy', 'female', NULL, 'under 18', 88, 'yes', 'cats', 'jump', 'willlistens', 'yy'),
(36, 'jackie@mail.com', 'jackie', 'female', NULL, 'under 18', 8888, 'no', 'dogs', 'basic', 'dogout', 'jack1012'),
(37, 'jack@jackk.com', 'jack', 'female', NULL, 'under 18', 5555, 'no', 'dogs', 'basic', 'dogout', 'jack1012');

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
  ADD PRIMARY KEY (`OwnerID`),
  ADD UNIQUE KEY `Email` (`Email`);

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
  MODIFY `DogID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=62;
--
-- AUTO_INCREMENT for table `dogfamily`
--
ALTER TABLE `dogfamily`
  MODIFY `DogFamilyID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=35;
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
  MODIFY `InfoID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `OwnerID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=38;
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
