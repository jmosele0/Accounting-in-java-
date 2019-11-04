-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 20, 2019 at 04:50 PM
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
-- Table structure for table `canineenrichment`
--

CREATE TABLE `canineenrichment` (
  `CanineID` int(2) NOT NULL,
  `CanineTitle` varchar(50) NOT NULL,
  `CanineContent` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `canineenrichment`
--

INSERT INTO `canineenrichment` (`CanineID`, `CanineTitle`, `CanineContent`) VALUES
(1, 'Intro', 'We all know we need to walk, run or play with our dogs, to help keep them physically fit and active. \r\nBut what about their brains? \r\nLike us, dogs like to use their brains on a daily basis, usually to find food or toys! Enriching your dog’s environment may also stop them from performing unwanted, destructive behaviours. \r\nUse the following tips and tricks to keep your dog’s brain active and focused. \r\n'),
(2, 'Get rid of that food bowl!! ', 'Dogs are scavengers by nature, therefore they are built to work for their food\r\nUsing a food bowl does not enrich your dog. It does not have to think about how to get the food\r\nThere are very simple ways of providing mental stimulation to your dog during meal times\r\nThe action of licking and chewing are also  a calming behaviour\r\nKong products are amazing commercial products to feed your dog from\r\nIf your dog is new to working for their food, start simple, as you do not want them to get frustrated\r\nBeginners\r\nSmear some peanut butter or cream cheese inside your dog’s Kong\r\nIntermediates\r\nFill your dog’s Kong with biscuits and pack the end with wet food\r\nAdvanced\r\nFill the whole toy with wet food\r\nTightly pack a combination of wet and dry food\r\nFreeze your packed Kong\r\n'),
(3, 'Make your dogs dinner interesting! ', 'Give them new foods to try in their Kong, like peanut butter, cream cheese, different types of meats, berries or different vegetables\r\n\r\nDry food Tumblers\r\nTumblers are a great way to give your dog their biscuits\r\nKong and Rogz have variations of tumblers\r\n\r\nDIY options\r\nPlace your dog’s food in a size appropriate cardboard box that they can shred up to get their food\r\nYou can also smear peanut butter or cream cheese inside the box to keep them interested\r\nPlace biscuits in muffin tins\r\nSmear peanut butter, cream cheese or Kong filler onto their plastic toys\r\n'),
(4, 'Use that nose! ', 'Sniffing burns more calories than walking for dogs\r\nIt also provides excellent mental stimulation\r\nFor dogs that love to follow a scent, make a scent trail for then in the backyard\r\nUse juice from a tuna, salmon or wet food can\r\nKeep your dog inside, trace a scent trail around the yard \r\nPlace small pieces of food along the trail to keep your dog invested\r\nLet your dog outside and watch them work! \r\n');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `CatID` int(5) NOT NULL,
  `CatDesc` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CatID`, `CatDesc`) VALUES
(2, 'Happy and relaxed'),
(3, 'Started off nervous'),
(4, 'Mildly nervous'),
(5, 'Moderately nervous'),
(6, 'Extremely nervous');

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
(61, 'jake', 2, 'shitzu', 'male', 'no', '2017-04-04', '2 years', 'Unvaccinated', 'yes', 37),
(62, 'jack', 4, 'chi', 'male', 'no', '2015-08-08', '4 years', 'Unvaccinated', 'breeder', 37),
(63, 'jack', 4, 'chi', 'male', 'no', '2015-08-08', '4 years', 'Unvaccinated', 'yes', 37),
(64, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(65, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(66, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(67, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(68, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(69, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(70, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(71, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(72, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(73, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(74, '', 0, '', '', 'yes', '0000-00-00', '', 'over', 'breeder', 8),
(75, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(76, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(77, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(78, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(79, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(80, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(81, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(82, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(83, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(84, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(85, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(86, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(87, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(88, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 8),
(89, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 9),
(90, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 9),
(91, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 9),
(92, '', 0, '', '', 'yes', '0000-00-00', '', 'over', 'breeder', 9),
(93, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 9),
(94, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 9),
(95, 'max', 2, 'golden retriever', 'male', 'yes', '2017-04-04', '2 years', 'over', 'pound', 9),
(96, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 9),
(97, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 9),
(98, '', 0, '', '', 'yes', '0000-00-00', '', 'Unvaccinated', 'breeder', 9),
(99, 'jas', 0, 'shitzu', 'male', 'plan', '0000-00-00', '6 months', 'going', 'breeder', 24),
(100, 'jas', 0, 'shitzu', 'male', 'plan', '0000-00-00', '10 months', 'going', 'pound', 24),
(101, 'jas', 0, 'shitzu', 'male', 'plan', '0000-00-00', '10 months', 'going', 'no', 24),
(102, 'jeff', 3, 'bull mastif', 'male', 'no', '2016-03-03', '3 years', 'over', 'pound', 38),
(103, 'max', 9, 'german shepherd', 'male', 'yes', '2010-03-03', '9 years', 'over', 'pound', 39),
(104, 'tommy', 1, 'husky', 'male', 'no', '2019-01-02', '4 months', 'unsure', 'friend', 41),
(105, 'tommy1', 1, 'huskyy', 'male', 'no', '2019-02-02', '5 months', 'over', 'litter', 41);

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
(34, 'adults', '', '', '', 60),
(35, 'adults', 'children', '', '', 62),
(36, 'adults', 'children', '', '', 62),
(37, 'adults', '', '', '', 64),
(38, 'adults', '', '', '', 65),
(39, 'adults', '', '', '', 66),
(40, 'adults', '', '', '', 67),
(41, 'adults', '', '', '', 68),
(42, 'adults', '', '', '', 69),
(43, 'adults', '', '', '', 70),
(44, 'adults', '', '', '', 71),
(45, 'adults', '', '', '', 72),
(46, 'adults', '', '', '', 73),
(47, 'adults', '', '', '', 75),
(48, 'adults', '', '', '', 76),
(49, 'adults', '', '', '', 77),
(50, 'adults', 'children', '', '', 78),
(51, 'adults', 'children', '', '', 79),
(52, 'adults', 'children', '', '', 80),
(53, 'adults', '', '', '', 81),
(54, 'adults', '', '', '', 82),
(55, 'adults', '', '', '', 83),
(56, 'adults', '', '', '', 84),
(57, 'adults', '', '', '', 85),
(58, 'adults', '', '', '', 86),
(59, 'adults', '', '', '', 87),
(60, 'adults', '', '', '', 88),
(61, 'adults', '', '', '', 89),
(62, 'adults', '', '', '', 90),
(63, 'adults', '', '', '', 91),
(64, 'adults', 'children', '', '', 92),
(65, 'adults', '', '', '', 93),
(66, 'adults', '', '', '', 94),
(67, 'adults', 'children', '', '', 95),
(68, 'adults', '', '', '', 96),
(69, 'adults', '', '', '', 97),
(70, 'adults', '', '', '', 98),
(71, 'adults', 'children', '', '', 99),
(72, 'adults', 'children', '', '', 100),
(73, 'adults', 'children', '', '', 100),
(74, 'adults', 'children', '', '', 102),
(75, 'adults', '', '', '', 103),
(76, 'adults', '', 'od', '', 104),
(77, 'adults', 'children', '', '', 105);

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

--
-- Dumping data for table `doglikedislike`
--

INSERT INTO `doglikedislike` (`LikeDislikeID`, `DogID`, `Subject`, `LikeOrDislike`) VALUES
(1, 95, 'Familiar adults', 'like'),
(2, 95, 'Familiar children', 'like'),
(3, 95, 'Unfamiliar adults', 'like'),
(4, 95, 'Unfamiliar children', 'like'),
(5, 95, 'Familiar adults', 'like'),
(6, 95, 'Familiar children', 'like'),
(7, 95, 'Unfamiliar adults', 'like'),
(8, 95, 'Unfamiliar children', 'like'),
(9, 95, 'Familiar dogs', 'dislike'),
(10, 95, 'Unfamiliar dogs', 'dislike'),
(11, 98, 'Familiar adults', 'like'),
(12, 98, 'Familiar children', 'like'),
(13, 98, 'Unfamiliar adults', 'like'),
(14, 98, 'Unfamiliar children', 'dislike'),
(15, 99, 'Familiar adults', 'like'),
(16, 99, 'Familiar children', 'like'),
(17, 99, 'Unfamiliar adults', 'like'),
(18, 99, 'Unfamiliar children', 'dislike'),
(19, 99, 'Familiar dogs', 'dislike'),
(20, 99, 'Unfamiliar dogs', 'dislike'),
(21, 100, 'Familiar adults', 'like'),
(22, 100, 'Familiar children', 'like'),
(23, 100, 'Unfamiliar adults', 'like'),
(24, 100, 'Unfamiliar children', 'dislike'),
(25, 100, 'Familiar dogs', 'dislike'),
(26, 100, 'Unfamiliar dogs', 'dislike'),
(27, 100, 'Familiar adults', 'like'),
(28, 100, 'Familiar children', 'like'),
(29, 100, 'Unfamiliar adults', 'like'),
(30, 100, 'Unfamiliar children', 'dislike'),
(31, 100, 'Familiar dogs', 'dislike'),
(32, 100, 'Unfamiliar dogs', 'dislike'),
(33, 102, 'Familiar adults', 'like'),
(34, 102, 'Familiar children', 'like'),
(35, 102, 'Unfamiliar adults', 'like'),
(36, 102, 'Unfamiliar children', 'like'),
(37, 102, 'Familiar dogs', 'like'),
(38, 102, 'Swimming', 'dislike'),
(39, 103, 'Familiar adults', 'like'),
(40, 103, 'Familiar children', 'like'),
(41, 103, 'Unfamiliar adults', 'dislike'),
(42, 103, 'Unfamiliar children', 'dislike'),
(43, 103, 'Familiar dogs', 'dislike'),
(44, 104, 'Familiar adults', 'like'),
(45, 104, 'Familiar dogs', 'like'),
(46, 104, 'Unfamiliar children', 'dislike'),
(47, 104, 'Unfamiliar dogs', 'dislike'),
(48, 105, 'Familiar adults', 'like'),
(49, 105, 'Familiar dogs', 'like'),
(50, 105, 'Unfamiliar adults', 'dislike'),
(51, 105, 'Swimming', 'dislike');

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

--
-- Dumping data for table `experience`
--

INSERT INTO `experience` (`ExperienceID`, `ExperienceName`, `ExperienceNotes`, `DogID`) VALUES
(1, 'Large dog', 'Jas played with a golden retriever and had a good time', 99);

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
(51, 'yes', 'yes', 'Friendly', 'friendly', 'came', 60),
(52, 'lots', 'yes', 'Friendly', 'friendly', 'came', 62),
(53, 'yes', 'yes', 'Friendly', 'friendly', 'came', 62),
(54, 'lots', NULL, NULL, NULL, NULL, 64),
(55, 'lots', NULL, NULL, NULL, NULL, 65),
(56, 'lots', NULL, NULL, NULL, NULL, 66),
(57, 'lots', NULL, NULL, NULL, NULL, 67),
(58, 'lots', NULL, NULL, NULL, NULL, 68),
(59, 'lots', NULL, NULL, NULL, NULL, 69),
(60, 'lots', NULL, NULL, NULL, NULL, 70),
(61, 'lots', NULL, NULL, NULL, NULL, 71),
(62, 'lots', NULL, NULL, NULL, NULL, 72),
(63, 'lots', NULL, NULL, NULL, NULL, 73),
(64, 'lots', NULL, NULL, NULL, NULL, 75),
(65, 'lots', NULL, NULL, NULL, NULL, 76),
(66, 'lots', NULL, NULL, NULL, NULL, 77),
(67, 'lots', NULL, NULL, NULL, NULL, 78),
(68, 'lots', NULL, NULL, NULL, NULL, 79),
(69, 'lots', NULL, NULL, NULL, NULL, 80),
(70, 'lots', NULL, NULL, NULL, NULL, 81),
(71, 'lots', NULL, NULL, NULL, NULL, 82),
(72, 'lots', NULL, NULL, NULL, NULL, 83),
(73, 'lots', NULL, NULL, NULL, NULL, 84),
(74, 'lots', NULL, NULL, NULL, NULL, 85),
(75, 'lots', NULL, NULL, NULL, NULL, 86),
(76, 'lots', NULL, NULL, NULL, NULL, 87),
(77, 'lots', NULL, NULL, NULL, NULL, 88),
(78, 'lots', NULL, NULL, NULL, NULL, 89),
(79, 'lots', NULL, NULL, NULL, NULL, 90),
(80, 'lots', NULL, NULL, NULL, NULL, 91),
(81, 'lots', NULL, NULL, NULL, NULL, 92),
(82, 'lots', NULL, NULL, NULL, NULL, 93),
(83, 'lots', NULL, NULL, NULL, NULL, 94),
(84, 'some', NULL, NULL, NULL, NULL, 95),
(85, 'lots', NULL, NULL, NULL, NULL, 96),
(86, 'lots', NULL, NULL, NULL, NULL, 97),
(87, 'lots', NULL, NULL, NULL, NULL, 98),
(88, 'lots', NULL, NULL, NULL, NULL, 99),
(89, 'some', 'no', 'Friendly', 'friendly', 'came', 100),
(90, 'no', 'no', 'Friendly', 'friendly', 'came', 100),
(91, 'some', 'no', 'Friendly', 'standoffish', 'outgoing', 102),
(92, 'some', 'no', 'Friendly', 'friendly', 'came', 103),
(93, 'some', 'yes', 'Standoffish', 'standoffish', 'onlyone', 104),
(94, 'some', 'yes', 'Standoffish', 'friendly', 'activity', 105);

-- --------------------------------------------------------

--
-- Table structure for table `logs`
--

CREATE TABLE `logs` (
  `log_id` int(5) NOT NULL,
  `log_time` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `log_action` varchar(30) NOT NULL,
  `log_details` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `logs`
--

INSERT INTO `logs` (`log_id`, `log_time`, `log_action`, `log_details`) VALUES
(1, '2019-10-02 05:55:44', 'Searched User', 'Term user was searched.'),
(2, '2019-10-02 06:08:05', 'Searched User', 'Term user was searched.'),
(3, '2019-10-02 06:09:14', 'Added User', 'User profile with Email: user@id8.com was Added.'),
(4, '2019-10-02 07:01:45', 'Searched Dog', 'Term dog was searched.'),
(5, '2019-10-02 07:39:23', 'Searched Dog', 'Term dog was searched.'),
(6, '2019-10-02 07:39:34', 'Searched User', 'Term user was searched.'),
(7, '2019-10-02 07:41:08', 'Viewed Profile', 'User profile with OwnerID: 12 was viewed.'),
(8, '2019-10-03 07:10:49', 'Successful login', 'user logged in'),
(9, '2019-10-03 07:12:15', 'Searched User', 'Term user was searched.'),
(10, '2019-10-03 07:12:24', 'Viewed Profile', 'User profile with OwnerID: 13 was viewed.'),
(11, '2019-10-03 07:13:04', 'Viewed Profile', 'User profile with OwnerID: 13 was viewed.'),
(12, '2019-10-03 07:13:11', 'Searched User', 'Term user was searched.'),
(13, '2019-10-04 13:52:43', 'Successful login', 'user logged in'),
(14, '2019-10-04 13:53:09', 'Searched User', 'Term user7@id.com was searched.'),
(15, '2019-10-04 13:57:25', 'Searched User', 'Term user7@id.com was searched.'),
(16, '2019-10-04 13:58:41', 'Searched User', 'Term user7@id.com was searched.'),
(17, '2019-10-04 13:59:28', 'Searched User', 'Term user7@id.com was searched.'),
(18, '2019-10-04 14:02:09', 'Searched User', 'Term user7@id.com was searched.'),
(19, '2019-10-04 14:03:13', 'Searched User', 'Term user7@id.com was searched.'),
(20, '2019-10-04 14:03:45', 'Searched User', 'Term user7@id.com was searched.'),
(21, '2019-10-04 14:03:47', 'Searched User', 'Term user7@id.com was searched.'),
(22, '2019-10-04 14:04:52', 'Searched User', 'Term user7@id.com was searched.'),
(23, '2019-10-04 14:05:23', 'Searched User', 'Term user7@id.com was searched.'),
(24, '2019-10-04 14:07:31', 'Searched User', 'Term user7@id.com was searched.'),
(25, '2019-10-04 14:14:59', 'Searched User', 'Term user7@id.com was searched.'),
(26, '2019-10-04 14:15:24', 'Searched User', 'Term user7@id.com was searched.'),
(27, '2019-10-04 14:16:33', 'Searched User', 'Term user7@id.com was searched.'),
(28, '2019-10-04 14:16:51', 'Searched User', 'Term user7@id.com was searched.'),
(29, '2019-10-04 14:17:09', 'Searched User', 'Term user7@id.com was searched.'),
(30, '2019-10-04 14:19:20', 'Searched User', 'Term usr was searched.'),
(31, '2019-10-04 14:19:46', 'Searched User', 'Term user was searched.'),
(32, '2019-10-06 14:30:59', 'Successful login', 'user logged in'),
(33, '2019-10-06 14:31:09', 'Searched User', 'Term user7@id.com was searched.'),
(34, '2019-10-06 14:31:55', 'Searched User', 'Term user7@id.com was searched.'),
(35, '2019-10-06 14:42:56', 'Searched User', 'Term user7@id.com was searched.'),
(36, '2019-10-06 14:51:10', 'Searched User', 'Term user7@id.com was searched.'),
(37, '2019-10-06 14:51:33', 'Searched User', 'Term user was searched.'),
(38, '2019-10-06 15:13:27', 'Searched Dog', 'Term dog was searched.'),
(39, '2019-10-06 15:15:18', 'Searched Dog', 'Term dog was searched.'),
(40, '2019-10-06 15:18:41', 'Searched Dog', 'Term dog was searched.'),
(41, '2019-10-06 15:30:00', 'Searched Dog', 'Term food was searched.'),
(42, '2019-10-06 15:32:59', 'Searched Dog', 'Term f was searched.'),
(43, '2019-10-06 15:36:08', 'Searched Dog', 'Term good was searched.'),
(44, '2019-10-08 13:20:15', 'Successful login', 'user logged in'),
(45, '2019-10-08 14:19:38', 'Searched Dog', 'Term happy was searched.'),
(46, '2019-10-08 14:28:26', 'Searched Dog', 'Term happy was searched.'),
(47, '2019-10-08 14:29:48', 'Searched Dog', 'Term happy was searched.'),
(48, '2019-10-09 04:47:56', 'Successful login', 'user logged in'),
(49, '2019-10-09 06:12:19', 'Successful login', 'user logged in'),
(50, '2019-10-10 06:34:20', 'Successful login', 'user logged in'),
(51, '2019-10-10 06:35:04', 'Searched User', 'Term user was searched.'),
(52, '2019-10-10 06:48:10', 'Searched User', 'Term user was searched.'),
(53, '2019-10-10 07:14:33', 'Viewed Profile', 'User profile with OwnerID: 14 was viewed.'),
(54, '2019-10-12 05:26:20', 'Successful login', 'user logged in'),
(55, '2019-10-12 05:27:14', 'Searched User', 'Term user was searched.'),
(56, '2019-10-12 05:27:18', 'Viewed Profile', 'User profile with OwnerID: 9 was viewed.'),
(57, '2019-10-12 05:28:27', 'Searched User', 'Term user was searched.'),
(58, '2019-10-12 05:28:31', 'Viewed Profile', 'User profile with OwnerID: 14 was viewed.'),
(59, '2019-10-12 05:28:52', 'Edited Profile', 'User profile with Email: user@id8.com was updated.'),
(60, '2019-10-12 05:28:59', 'Searched User', 'Term user was searched.'),
(61, '2019-10-12 05:29:03', 'Viewed Profile', 'User profile with OwnerID: 14 was viewed.'),
(62, '2019-10-14 14:57:57', 'Successful login', 'user logged in'),
(63, '2019-10-14 16:26:09', 'Searched User', 'Term user was searched.'),
(64, '2019-10-14 16:27:36', 'Searched User', 'Term user was searched.');

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
(7, 'Jack@mail.com', 'Jackeoi', 'Male', NULL, 'bet18to3', 22349, 'no', 'nein', 'walks without a', 'Doesn\'t jump up on people', 'jack1012'),
(8, 'Jack@gmail.com', 'Jackeo', 'Male', NULL, 'bet18to3', 223467, 'no', 'nein', 'walks without a', 'Doesn\'t jump up on people', 'jack1012'),
(9, 'Jack@hhmail.com', 'Jack', 'Male', NULL, 'bet18to3', 5454, 'no', 'nein', 'walks without a', 'Doesn\'t jump up on people', 'jack1012'),
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
(37, '', '', 'female', NULL, 'under 18', 0, 'no', 'dogs', 'basic', 'dogout', 'jack1012'),
(38, 'zack@gmail.com', 'zack', 'female', NULL, 'bet18to3', 6077, 'yes', 'dogs', 'basic', 'dogout', 'zack1012'),
(39, 'mail@email1.com', 'usernamee', 'female', NULL, 'bet18to3', 5545, 'no', 'dogs', 'basic', 'dogout', 'passeord'),
(40, 'jack@bmail.com', 'jack', 'female', NULL, 'under 18', 9999, 'yes', 'dogs', 'basic', 'dogout', 'jack1012'),
(41, 'r@j.com', 'rajwinder', 'female', NULL, 'under 18', 5656, 'no', 'dogs', 'jump', 'dogout', 'raj');

-- --------------------------------------------------------

--
-- Table structure for table `training`
--

CREATE TABLE `training` (
  `trainingID` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` tinytext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `canineenrichment`
--
ALTER TABLE `canineenrichment`
  ADD PRIMARY KEY (`CanineID`),
  ADD UNIQUE KEY `CanineTitle` (`CanineTitle`);

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
-- Indexes for table `logs`
--
ALTER TABLE `logs`
  ADD PRIMARY KEY (`log_id`);

--
-- Indexes for table `owner`
--
ALTER TABLE `owner`
  ADD PRIMARY KEY (`OwnerID`),
  ADD UNIQUE KEY `Email` (`Email`);

--
-- Indexes for table `training`
--
ALTER TABLE `training`
  ADD PRIMARY KEY (`trainingID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `canineenrichment`
--
ALTER TABLE `canineenrichment`
  MODIFY `CanineID` int(2) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `CatID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `dog`
--
ALTER TABLE `dog`
  MODIFY `DogID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;
--
-- AUTO_INCREMENT for table `dogfamily`
--
ALTER TABLE `dogfamily`
  MODIFY `DogFamilyID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=78;
--
-- AUTO_INCREMENT for table `doglikedislike`
--
ALTER TABLE `doglikedislike`
  MODIFY `LikeDislikeID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=52;
--
-- AUTO_INCREMENT for table `experience`
--
ALTER TABLE `experience`
  MODIFY `ExperienceID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `generalinfo`
--
ALTER TABLE `generalinfo`
  MODIFY `InfoID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=95;
--
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=65;
--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `OwnerID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `trainingID` int(11) NOT NULL AUTO_INCREMENT;
--
-- Constraints for dumped tables
--

--
-- Constraints for table `categoryexperience`
--
ALTER TABLE `categoryexperience`
  ADD CONSTRAINT `categoryexperience_ibfk_1` FOREIGN KEY (`ExperienceID`) REFERENCES `experience` (`ExperienceID`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `categoryexperience_ibfk_2` FOREIGN KEY (`CatID`) REFERENCES `category` (`CatID`) ON DELETE CASCADE ON UPDATE CASCADE;

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
