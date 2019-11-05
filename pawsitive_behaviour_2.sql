-- phpMyAdmin SQL Dump
-- version 4.7.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 05, 2019 at 10:44 PM
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
-- Database: `pawsitive behaviour 2`
--
CREATE DATABASE IF NOT EXISTS `pawsitive behaviour 2` DEFAULT CHARACTER SET latin1 COLLATE latin1_swedish_ci;
USE `pawsitive behaviour 2`;

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
  `CatDesc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`CatID`, `CatDesc`) VALUES
(11, 'Angry'),
(8, 'Extremely Nervous'),
(4, 'Happy and Relaxed'),
(6, 'Mildly Nervous'),
(7, 'Moderately Nervous '),
(5, 'Start off nervous, but became more comfortable ');

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
  `DOB` date NOT NULL,
  `HowLongOwned` varchar(100) NOT NULL,
  `VaccinationStatus` varchar(15) NOT NULL,
  `DogOrigin` varchar(20) NOT NULL,
  `DogPic` varchar(150) DEFAULT NULL,
  `OwnerID` int(5) NOT NULL,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `dog`
--

INSERT INTO `dog` (`DogID`, `DogName`, `Breed`, `Sex`, `Desexed`, `DOB`, `HowLongOwned`, `VaccinationStatus`, `DogOrigin`, `DogPic`, `OwnerID`, `comment`) VALUES
(2, 'Pupy', 'Bush Dog', 'Fem', '1', '0000-00-00', '2019-07-09', '0', 'Bush', NULL, 2, NULL),
(3, 'waki', '', '', '', '0000-00-00', '0000-00-00', '', '', NULL, 1, NULL),
(4, 'dog1', 'little', 'M', 'No', '0000-00-00', '0000-00-00', 'bad', 'family', NULL, 7, NULL),
(5, 'dog2', 'little', 'F', 'no', '0000-00-00', '0000-00-00', 'good', 'family', NULL, 8, NULL),
(7, 'dog4', 'little', 'female', '', '0000-00-00', '0000-00-00', 'good', 'fam', NULL, 10, NULL),
(8, 'dog5', 'LITTLE', 'M', 'NO', '0000-00-00', '0000-00-00', 'GOOD', 'FAM', NULL, 11, NULL),
(9, 'dog6', 'huskey', 'male', 'No', '0000-00-00', 'been a few months', 'good', 'family', NULL, 12, NULL);

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
  `LikeOrDislike` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `doglikedislike`
--

INSERT INTO `doglikedislike` (`LikeDislikeID`, `DogID`, `Subject`, `LikeOrDislike`) VALUES
(1, 5, '', 'food and toys');

-- --------------------------------------------------------

--
-- Table structure for table `experience`
--

CREATE TABLE `experience` (
  `ExperienceID` int(5) NOT NULL,
  `ExperienceName` varchar(200) NOT NULL,
  `ExperienceNotes` varchar(200) NOT NULL,
  `DogID` int(5) NOT NULL,
  `CatDesc` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `generalinfo`
--

CREATE TABLE `generalinfo` (
  `InfoID` int(5) NOT NULL,
  `KnowledgeOfBreed` varchar(4) NOT NULL,
  `ParentSiblingSighted` varchar(15) NOT NULL,
  `PersonalityConcerns` varchar(200) NOT NULL,
  `FirstMet` varchar(200) NOT NULL,
  `WhyThatName` varchar(200) NOT NULL,
  `DogID` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

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
(64, '2019-10-14 16:27:36', 'Searched User', 'Term user was searched.'),
(65, '2019-10-15 12:14:55', 'Searched Dog', 'Term dog was searched.'),
(66, '2019-10-15 12:14:59', 'Viewed Profile', 'Dog profile with DogID: 4 was viewed.'),
(67, '2019-10-16 03:52:04', 'Successful login', 'user logged in'),
(68, '2019-10-16 03:52:53', 'Searched Dog', 'Term dog was searched.'),
(69, '2019-10-16 03:53:01', 'Viewed Profile', 'Dog profile with DogID: 4 was viewed.'),
(70, '2019-10-16 03:53:15', 'Edited Profile', 'Dog profile with DogID: 4 was updated.'),
(71, '2019-10-16 12:52:51', 'Successful login', 'user logged in'),
(72, '2019-10-16 12:56:55', 'Successful login', 'user logged in'),
(73, '2019-10-16 12:57:35', 'Searched User', 'Term user was searched.'),
(74, '2019-10-16 12:59:43', 'Successful login', 'user logged in'),
(75, '2019-10-16 13:00:03', 'Searched User', 'Term user was searched.'),
(76, '2019-10-16 13:00:10', 'Viewed Profile', 'User profile with OwnerID: 14 was viewed.'),
(77, '2019-10-16 13:02:20', 'Viewed Profile', 'User profile with OwnerID: 7 was viewed.'),
(78, '2019-10-16 13:04:08', 'Viewed Profile', 'User profile with OwnerID: 9 was viewed.'),
(79, '2019-10-16 13:04:45', 'Edited Profile', 'User profile with Email: user3@id.com was updated.'),
(80, '2019-10-16 13:04:45', 'Viewed Profile', 'User profile with OwnerID: 9 was viewed.'),
(81, '2019-10-16 13:05:33', 'Searched Dog', 'Term dog was searched.'),
(82, '2019-10-16 13:05:38', 'Viewed Profile', 'Dog profile with DogID: 7 was viewed.'),
(83, '2019-10-16 13:07:50', 'Viewed Profile', 'Dog profile with DogID: 7 was viewed.'),
(84, '2019-10-16 13:07:59', 'Edited Profile', 'Dog profile with DogID: 7 was updated.'),
(85, '2019-10-16 13:07:59', 'Viewed Profile', 'Dog profile with DogID: 7 was viewed.'),
(86, '2019-10-16 13:09:50', 'Successful login', 'user logged in'),
(87, '2019-10-16 13:10:14', 'Searched User', 'Term user was searched.'),
(88, '2019-10-16 13:10:44', 'Viewed Profile', 'User profile with OwnerID: 12 was viewed.'),
(89, '2019-10-16 13:10:58', 'Edited Profile', 'User profile with Email: user6@id.com was updated.'),
(90, '2019-10-16 13:10:59', 'Viewed Profile', 'User profile with OwnerID: 12 was viewed.'),
(91, '2019-10-16 13:11:08', 'Searched Dog', 'Term dog was searched.'),
(92, '2019-10-16 13:11:14', 'Viewed Profile', 'Dog profile with DogID: 9 was viewed.'),
(93, '2019-10-16 13:11:25', 'Edited Profile', 'Dog profile with DogID: 9 was updated.'),
(94, '2019-10-16 13:11:25', 'Viewed Profile', 'Dog profile with DogID: 9 was viewed.'),
(95, '2019-10-16 13:11:33', 'Searched Dog', 'Term dog was searched.'),
(96, '2019-10-16 13:13:22', 'Successful login', 'user logged in'),
(97, '2019-10-16 13:13:47', 'Searched User', 'Term user was searched.'),
(98, '2019-10-16 13:14:20', 'Successful login', 'user logged in'),
(99, '2019-10-16 13:14:43', 'Searched User', 'Term user was searched.'),
(100, '2019-10-16 13:15:03', 'Viewed Profile', 'User profile with OwnerID: 12 was viewed.'),
(101, '2019-10-16 13:15:15', 'Edited Profile', 'User profile with Email: user6@id.com was updated.'),
(102, '2019-10-16 13:15:15', 'Viewed Profile', 'User profile with OwnerID: 12 was viewed.'),
(103, '2019-10-16 13:15:25', 'Searched Dog', 'Term dog was searched.'),
(104, '2019-10-16 13:16:39', 'Added User', 'User profile with Email: Lucy@gmail.com was Added.'),
(105, '2019-10-16 13:16:49', 'Viewed Profile', 'User profile with OwnerID: 15 was viewed.'),
(106, '2019-10-16 13:20:26', 'Successful login', 'user logged in'),
(107, '2019-10-16 13:20:47', 'Searched User', 'Term user was searched.'),
(108, '2019-10-16 13:22:05', 'Successful login', 'user logged in'),
(109, '2019-10-16 13:22:27', 'Successful login', 'user logged in'),
(110, '2019-10-16 13:22:53', 'Searched User', 'Term user was searched.'),
(111, '2019-10-16 13:23:17', 'Viewed Profile', 'User profile with OwnerID: 12 was viewed.'),
(112, '2019-10-16 13:23:34', 'Edited Profile', 'User profile with Email: user6@id.com was updated.'),
(113, '2019-10-16 13:23:34', 'Viewed Profile', 'User profile with OwnerID: 12 was viewed.'),
(114, '2019-10-16 13:23:44', 'Searched Dog', 'Term dog was searched.'),
(115, '2019-10-16 13:23:49', 'Viewed Profile', 'Dog profile with DogID: 9 was viewed.'),
(116, '2019-10-16 13:24:00', 'Edited Profile', 'Dog profile with DogID: 9 was updated.'),
(117, '2019-10-16 13:24:00', 'Viewed Profile', 'Dog profile with DogID: 9 was viewed.'),
(118, '2019-10-16 13:24:53', 'Added User', 'User profile with Email: Newuser@gmail.com was Added.'),
(119, '2019-10-16 13:25:02', 'Viewed Profile', 'User profile with OwnerID: 16 was viewed.'),
(120, '2019-10-31 13:49:34', 'Successful login', 'user logged in');

-- --------------------------------------------------------

--
-- Table structure for table `message`
--

CREATE TABLE `message` (
  `messageID` int(5) NOT NULL,
  `messageTime` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `sender` varchar(50) NOT NULL,
  `receiver` varchar(50) NOT NULL,
  `message` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `message`
--

INSERT INTO `message` (`messageID`, `messageTime`, `sender`, `receiver`, `message`) VALUES
(1, '2019-10-31 14:00:02', 'Lucy@gmail.com', 'admin', 'hi admin, any idea how to cut my dogs hair?');

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
  `ObedientDog` varchar(50) NOT NULL,
  `ExpectedOutcomes` varchar(100) NOT NULL,
  `password` varchar(256) NOT NULL,
  `joining_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `comment` text
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `owner`
--

INSERT INTO `owner` (`OwnerID`, `Email`, `FirstName`, `Gender`, `Couple`, `AgeRange`, `PostCode`, `PrePets`, `PrePetsList`, `ObedientDog`, `ExpectedOutcomes`, `password`, `joining_date`, `comment`) VALUES
(1, 'mail@mail.com', 'nnewuser', 'female', '1', '35', 3422, '1', 'dog, cat, hasmster', 'ObidientDog', 'trained dog', 'password', '2019-09-24 15:47:36', NULL),
(2, 'email@mail.com', 'Name', 'Fem', '0', '24', 3423, '0', 'None', 'ObidientDog', 'a disiplined dog', 'password', '2019-09-24 15:47:36', NULL),
(3, 'emailme@mail.com', '', '', '', '', 0, '', '', '', '', '$2y$10$xUDWlsWHTSpfp1MDP7TSeeh4k.wwnmA7PPryq2jqDaYM3ecSCJE7u', '2019-09-24 15:47:36', NULL),
(4, 'sdfsdf@mail.com', '', '', '', '', 0, '', '', '', '', '$2y$10$CG/lX4oUoIKq.zTlEUyC5eUgL6mYMwTv5w/6YISmJzWS6N2//OVCy', '2019-09-24 15:47:36', NULL),
(5, 'newuser@mail.com', '', '', '', '', 42423, '', '', '', '', '$2y$10$6F2FVrIHXskcuZGuQi8NIefBJyB3V/h18vjZ4yB/Gh1BwjeGG9Z.W', '2019-09-24 15:47:36', NULL),
(7, 'user@id.com', 'user1', 'gender1', 'yes', '18-30', 24234, 'yes', 'cats, dogs', 'yes', 'listen commands', '$2y$10$wNSEUPwpT1hkTIZegQFr7uVZSfptyJsrz06dcmcMb2w8VBO8vsEIy', '2019-09-25 04:25:54', NULL),
(8, 'user2@id.com', 'user2', 'male', 'no', '30+', 242, 'no', '', 'yes', 'listen', '$2y$10$vktM5O6JqR1KaKVuuOTptuLuP2qoSf0OstOdxc.pbrDspkxtcxIlm', '2019-09-25 04:26:59', NULL),
(9, 'user3@id.com', 'user3', 'female', 'yes', '18 - 30', 2342, '', 'dog', '', 'user3', '$2y$10$B7OZa18fUv02.xIu.okNT.36fHPs/RSscGd3H.d4fvrexNclf.s/K', '2019-09-25 04:27:40', NULL),
(10, 'user4@id.com', 'user4', 'male', 'yes', '20+', 24234, 'yes', 'bird', 'yes', 'listen', '$2y$10$qn/bTPvR1as9TpQ4.CpIsuIDkAIUEU9sJs2k6eDkbkG7VCeDCjg3G', '2019-09-25 04:28:23', NULL),
(11, 'user5@id.com', 'user5', 'MALE', 'yes', '20+', 4243, 'yes', 'cats', 'yes', 'listen', '$2y$10$ZH2aHQCBuMnwdv9P7bZH4uxyptajV2GJObE1VRO1bgObLevw1vbOi', '2019-09-25 04:29:12', NULL),
(12, 'user6@id.com', 'user6', 'yes', 'Yes', '50+', 2234, 'Yes', '', '', 'user6', '$2y$10$622NZRSwUzA.D86xkqEtbuZOnAcczWforL.VEi0be2hBPuxZFftui', '2019-09-25 07:49:19', NULL),
(13, 'user7@id.com', 'user 7', 'male', 'yes', '18 - 30', 2423, 'Yes', 'all kinds', 'Does not Jump up on people', 'user 7', '$2y$10$GHI5CSQnB4JB54xk7yu.AOMTopAOXh5tQGCSTIz7MssP6TYEx0S7q', '2019-09-30 11:35:48', NULL),
(14, 'user@id8.com', 'user8', 'yes', '', '18 - 30', 2432, 'Yes', 'lots of pets', 'Walks on the lead well', 'user8', '$2y$10$gSczvVskxO.Lf9JSfX6Vw.Bo82A5N.42BVxRriSEFa0q290jq94pa', '2019-10-02 06:09:14', NULL),
(15, 'Lucy@gmail.com', 'Lucy', 'Yes', '', '18 - 30', 1234, 'Yes', 'cat', 'Submissive', '', '$2y$10$q0HO2.xTS7U5eOq/AhNznOm23nwoawmXjwnCyDFsF9As2rsHNrnHK', '2019-10-16 13:16:39', NULL),
(16, 'Newuser@gmail.com', 'NewUser', 'Yes', '', '18 - 30', 1234, 'Yes', 'cat', 'Submissive', '', '$2y$10$2pjgHPi8HS1vjEvQA.XcHO7g/XSr3VxWPeWzaNNrFcE3Gxi13mT0y', '2019-10-16 13:24:53', NULL);

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
-- Dumping data for table `training`
--

INSERT INTO `training` (`trainingID`, `title`, `content`) VALUES
(1, 'YouTube Channel', 'https://www.youtube.com/channel/UCY_FKzvY-gmO-wOMmI9xAZg/featured?disable_polymer=1'),
(3, 'Facebook', 'www.facebook.com/myprofile');

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
  ADD PRIMARY KEY (`CatID`),
  ADD UNIQUE KEY `CatDesc` (`CatDesc`);

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
  ADD KEY `DogID` (`DogID`),
  ADD KEY `CatDesc` (`CatDesc`);

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
-- Indexes for table `message`
--
ALTER TABLE `message`
  ADD PRIMARY KEY (`messageID`);

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
  MODIFY `CatID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
--
-- AUTO_INCREMENT for table `dog`
--
ALTER TABLE `dog`
  MODIFY `DogID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;
--
-- AUTO_INCREMENT for table `dogfamily`
--
ALTER TABLE `dogfamily`
  MODIFY `DogFamilyID` int(5) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `doglikedislike`
--
ALTER TABLE `doglikedislike`
  MODIFY `LikeDislikeID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
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
-- AUTO_INCREMENT for table `logs`
--
ALTER TABLE `logs`
  MODIFY `log_id` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=121;
--
-- AUTO_INCREMENT for table `message`
--
ALTER TABLE `message`
  MODIFY `messageID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
--
-- AUTO_INCREMENT for table `owner`
--
ALTER TABLE `owner`
  MODIFY `OwnerID` int(5) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=17;
--
-- AUTO_INCREMENT for table `training`
--
ALTER TABLE `training`
  MODIFY `trainingID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- Constraints for dumped tables
--

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
  ADD CONSTRAINT `experience_ibfk_1` FOREIGN KEY (`DogID`) REFERENCES `dog` (`DogID`),
  ADD CONSTRAINT `experience_ibfk_2` FOREIGN KEY (`CatDesc`) REFERENCES `category` (`CatDesc`);

--
-- Constraints for table `generalinfo`
--
ALTER TABLE `generalinfo`
  ADD CONSTRAINT `generalinfo_ibfk_1` FOREIGN KEY (`DogID`) REFERENCES `dog` (`DogID`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
