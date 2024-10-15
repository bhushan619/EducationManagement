-- phpMyAdmin SQL Dump
-- version 4.5.1
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: Jul 23, 2018 at 02:33 PM
-- Server version: 10.1.10-MariaDB
-- PHP Version: 5.6.19

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `anuvaa_coldemo`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` bigint(20) NOT NULL,
  `personnel_id` bigint(20) DEFAULT NULL,
  `comments` longtext COLLATE utf8_unicode_ci,
  `bookingdate` datetime DEFAULT NULL,
  `status` tinyint(4) DEFAULT NULL,
  `booked_by` int(11) DEFAULT NULL,
  `lastedited_by` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_products`
--

CREATE TABLE `cart_products` (
  `intId` bigint(20) NOT NULL,
  `cartid` bigint(20) NOT NULL,
  `productid` bigint(20) NOT NULL,
  `comments` longtext COLLATE utf8_unicode_ci NOT NULL,
  `quantity` int(11) NOT NULL,
  `varPStatus` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_transaction`
--

CREATE TABLE `cart_transaction` (
  `id` bigint(20) NOT NULL,
  `cart_id` bigint(20) DEFAULT NULL,
  `amount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `recieved` double DEFAULT NULL,
  `outstanding` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `status` varchar(20) COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `cart_transaction_history`
--

CREATE TABLE `cart_transaction_history` (
  `id` bigint(20) NOT NULL,
  `cart_transaction_id` bigint(20) DEFAULT NULL,
  `payment_date` datetime DEFAULT NULL,
  `comment` longtext COLLATE utf8_unicode_ci NOT NULL,
  `amount` double DEFAULT NULL,
  `tax` double DEFAULT NULL,
  `discount` double DEFAULT NULL,
  `recieved` double DEFAULT NULL,
  `returned` double DEFAULT NULL,
  `outstanding` double DEFAULT NULL,
  `total` double DEFAULT NULL,
  `trans` longtext COLLATE utf8_unicode_ci,
  `payment_mode` longtext COLLATE utf8_unicode_ci
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbladmin`
--

CREATE TABLE `tbladmin` (
  `intAdminId` bigint(20) NOT NULL,
  `varName` longtext,
  `varUsername` longtext,
  `varPassword` longtext,
  `varDesig` longtext,
  `varStatus` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbladmin`
--

INSERT INTO `tbladmin` (`intAdminId`, `varName`, `varUsername`, `varPassword`, `varDesig`, `varStatus`) VALUES
(1, 'Bhushan', 'bhushan619', 'bhushan619', 'admin', 'true'),
(2, 'Mayur', 'mayur111', 'mayur111', 'admin', 'true'),
(3, 'Rozy', 'rozy', 'rozy', 'admin', 'true'),
(4, 'Rohit', 'rohit', 'rohit', 'admin', 'true'),
(5, 'Rupali', 'rupali', 'rupali', 'admin', 'true');

-- --------------------------------------------------------

--
-- Table structure for table `tblamcommunication`
--

CREATE TABLE `tblamcommunication` (
  `intId` bigint(20) NOT NULL,
  `varMsgFrom` longtext NOT NULL,
  `varMsgFromDesig` longtext NOT NULL,
  `varMsgFromStatus` longtext NOT NULL,
  `varMsgFromName` longtext NOT NULL,
  `varMsgto` longtext NOT NULL,
  `varMsgToDesig` longtext NOT NULL,
  `varMsgToStatus` longtext NOT NULL,
  `varMsgtoName` longtext NOT NULL,
  `varStatus` longtext NOT NULL,
  `ex1` longtext NOT NULL,
  `ex2` longtext NOT NULL,
  `ex3` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tblamcommunication`
--

INSERT INTO `tblamcommunication` (`intId`, `varMsgFrom`, `varMsgFromDesig`, `varMsgFromStatus`, `varMsgFromName`, `varMsgto`, `varMsgToDesig`, `varMsgToStatus`, `varMsgtoName`, `varStatus`, `ex1`, `ex2`, `ex3`) VALUES
(1, '1', 'User', '', 'Mayur Potdar', '2', 'User', '', 'Swati Chounsaste', '', '', '', ''),
(2, '2', 'User', '', 'Swati Chounsaste', '3', 'User', '', 'Bhushan Savale', '', '', '', ''),
(3, '1', 'User', '', 'Mayur Potdar', '3', 'User', '', 'Bhushan Savale', '', '', '', ''),
(4, '1', 'User', '', 'Mayur Potdar', '15', 'User', '', 'SAYAN KAYAL', '', '', '', ''),
(5, '4', 'User', '', 'Education Guide Lines', '3', 'User', '', 'Bhushan Savale', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblamconversation`
--

CREATE TABLE `tblamconversation` (
  `intId` bigint(20) NOT NULL,
  `varMessageId` bigint(20) NOT NULL,
  `varMsgFrom` longtext NOT NULL,
  `varMsgText` longtext NOT NULL,
  `varDate` longtext NOT NULL,
  `varTime` longtext NOT NULL,
  `ex1` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tblamconversation`
--

INSERT INTO `tblamconversation` (`intId`, `varMessageId`, `varMsgFrom`, `varMsgText`, `varDate`, `varTime`, `ex1`) VALUES
(1, 1, '1', 'Thank you for request', '2017-23-23', '04:23:31', 'Read'),
(2, 1, '1', 'hi', '9/23/2017', '9:27 AM', 'Read'),
(3, 1, '2', 'hello sir', '9/23/2017', '9:29 AM', 'Read'),
(4, 2, '2', 'Thank you for request', '2017-23-37', '06:37:08', 'Read'),
(5, 3, '1', 'Thank you for request', '2017-23-38', '06:38:29', 'Read'),
(6, 3, '3', 'hey bro', '9/23/2017', '12:09 PM', 'Read'),
(7, 3, '1', 'hi', '9/23/2017', '12:09 PM', 'Read'),
(8, 3, '1', 'Hi', '9/25/2017', '11:39 PM', 'Read'),
(9, 3, '1', 'Need many things to be done ', '9/25/2017', '11:39 PM', 'Read'),
(10, 3, '1', 'Bhushan sir ', '9/26/2017', '3:40 PM', 'Read'),
(11, 3, '1', 'Message aala ka tumhala ', '9/26/2017', '3:40 PM', 'Read'),
(12, 3, '1', 'Need notification for message ', '9/26/2017', '3:40 PM', 'Read'),
(13, 1, '1', 'Hi', '9/26/2017', '3:49 PM', 'Read'),
(14, 1, '2', 'Hello sir', '9/26/2017', '3:49 PM', 'Read'),
(15, 1, '1', 'Did u got ', '9/26/2017', '3:50 PM', 'Read'),
(16, 3, '1', 'Hi', '9/26/2017', '3:50 PM', 'Read'),
(17, 1, '2', 'yes', '9/26/2017', '5:19 PM', 'Read'),
(18, 4, '1', 'Thank you for request', '2017-27-55', '04:55:41', 'Read'),
(19, 5, '4', 'Thank you for request', '2017-05-26', '09:26:21', 'Read'),
(20, 5, '4', 'asdasd asd asd ', '06-10-2017', '02:56', 'Read'),
(21, 5, '3', 'asdasd asd as', '07-10-2017', '20:34', 'Read'),
(22, 5, '4', 'sd sad asd asd asd asd', '07-10-2017', '20:59', 'Read'),
(23, 5, '4', 'dasd sdf df asdf', '07-10-2017', '21:03', 'Read'),
(24, 5, '4', 'asd ad adasd aasd', '07-10-2017', '21:23', 'Read'),
(25, 5, '4', 'sad asdasd ada', '07-10-2017', '21:25', 'Read'),
(26, 5, '4', 'asasd asdsd', '10-10-2017', '02:12', 'Read'),
(27, 5, '4', 'sdfsdf sf sfd sdf ', '10-10-2017', '02:28', 'Read');

-- --------------------------------------------------------

--
-- Table structure for table `tblammembertransactions`
--

CREATE TABLE `tblammembertransactions` (
  `intId` bigint(20) NOT NULL,
  `varOrderNo` longtext NOT NULL,
  `varMemberId` longtext NOT NULL,
  `varMemberName` longtext NOT NULL,
  `varMemberCity` longtext NOT NULL,
  `varMemberAddress` longtext NOT NULL,
  `varMemberState` longtext NOT NULL,
  `varPackageId` longtext NOT NULL,
  `varPurchaseDate` longtext NOT NULL,
  `varPurchaseTime` longtext NOT NULL,
  `varPaymentAmount` longtext NOT NULL,
  `varPaymentStatus` longtext NOT NULL,
  `varTransactionId` longtext NOT NULL,
  `varTransactionStatus` longtext NOT NULL,
  `varPaymode` longtext NOT NULL,
  `varOrderStatus` longtext NOT NULL,
  `varFranchiseeId` longtext NOT NULL,
  `ex2` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tblammembertransactions`
--

INSERT INTO `tblammembertransactions` (`intId`, `varOrderNo`, `varMemberId`, `varMemberName`, `varMemberCity`, `varMemberAddress`, `varMemberState`, `varPackageId`, `varPurchaseDate`, `varPurchaseTime`, `varPaymentAmount`, `varPaymentStatus`, `varTransactionId`, `varTransactionStatus`, `varPaymode`, `varOrderStatus`, `varFranchiseeId`, `ex2`) VALUES
(1, '3852933', '3', 'Bhushan Savale', 'NA', '', 'NA', 'PostAd', '27-12-2017', '04:33', '10', 'Unpaid', '', '', 'NA', 'Started', 'User', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tblampackages`
--

CREATE TABLE `tblampackages` (
  `intId` bigint(20) NOT NULL,
  `varPackageId` longtext NOT NULL,
  `varPackageName` longtext NOT NULL,
  `ex2` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tblampackages`
--

INSERT INTO `tblampackages` (`intId`, `varPackageId`, `varPackageName`, `ex2`) VALUES
(1, '323', 'Advertisement', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblampackagesdetails`
--

CREATE TABLE `tblampackagesdetails` (
  `intId` bigint(20) NOT NULL,
  `varPackageId` longtext NOT NULL,
  `varPackageDescription` longtext NOT NULL,
  `varPackageDuration` longtext NOT NULL,
  `varPackageDurationTime` longtext NOT NULL,
  `varPackagePrice` longtext NOT NULL,
  `varBenifits` longtext NOT NULL,
  `ex1` longtext NOT NULL,
  `ex2` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf32;

--
-- Dumping data for table `tblampackagesdetails`
--

INSERT INTO `tblampackagesdetails` (`intId`, `varPackageId`, `varPackageDescription`, `varPackageDuration`, `varPackageDurationTime`, `varPackagePrice`, `varBenifits`, `ex1`, `ex2`) VALUES
(1, '323', 'Ads for 1 Month', '1', 'Month', '10', 'Show ads on various places for 1 month', '9561421489', ''),
(2, '323', 'Ads for 1 Month', '1', 'Month', '10', 'Show ads on various places for 1 month', '9561421489', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcollegecomp`
--

CREATE TABLE `tblcollegecomp` (
  `intid` bigint(20) NOT NULL,
  `intCollegeId` bigint(20) NOT NULL,
  `varCompanyName` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblcollegecoordinates`
--

CREATE TABLE `tblcollegecoordinates` (
  `intId` bigint(20) NOT NULL,
  `intCollegeId` bigint(20) NOT NULL,
  `varLatitude` text NOT NULL,
  `varLongitude` text NOT NULL,
  `ex1` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcollegecoordinates`
--

INSERT INTO `tblcollegecoordinates` (`intId`, `intCollegeId`, `varLatitude`, `varLongitude`, `ex1`) VALUES
(1, 1, '18.507548', '73.930940', ''),
(2, 2, '21.001839', '75.5542953', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcollegecourses`
--

CREATE TABLE `tblcollegecourses` (
  `intid` bigint(20) NOT NULL,
  `intCollegeId` bigint(20) NOT NULL,
  `varCourseType` longtext NOT NULL,
  `varCourseName` longtext NOT NULL,
  `varCourseDescription` longtext NOT NULL,
  `varDuration` longtext,
  `varFees` longtext,
  `varAffliation` longtext,
  `varAccredited` longtext,
  `varAdmissionCriteria` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcollegecourses`
--

INSERT INTO `tblcollegecourses` (`intid`, `intCollegeId`, `varCourseType`, `varCourseName`, `varCourseDescription`, `varDuration`, `varFees`, `varAffliation`, `varAccredited`, `varAdmissionCriteria`) VALUES
(1, 1, 'Online', 'Institution Search', 'Search School, College, University, Tutors, Distance learning centers with online institutions & educational service providers', 'NA', 'NA', 'NA', 'NA', 'NA'),
(2, 1, 'Online', 'Social Network', 'Get networked with Mentors, Teachers, Friends, Families & business associates.', 'NA', 'NA', 'NA', 'NA', 'NA'),
(3, 1, 'Online', 'Data Science', 'Compare, Analyse & predict best market suitable for you. Make your career by your choice & not by chance.', 'NA', 'NA', 'NA', 'NA', 'NA'),
(4, 1, 'Offline', 'Counselling Services', 'Visit us if you need someone to guide you in person. We work on one to one discussions with those who need it.', 'NA', 'NA', 'NA', 'NA', 'NA'),
(5, 1, 'Offline', 'Events & seminars', 'Happiness is when we connect with each other & we are open for all such platforms where we can connect with you. So we conduct events & seminars.', 'NA', 'NA', 'NA', 'NA', 'NA'),
(6, 2, 'Online', 'Website Creation', 'Static or Dynamic websites', 'NA', 'NA', 'NA', 'NA', 'NA'),
(7, 2, 'Online', 'Mobile Application', 'Andriod and IPhone Apps', 'NA', 'NA', 'NA', 'NA', 'NA'),
(8, 2, 'Online', 'Social  Media Marketing', 'Facebook, Twitter, LinkedIn marketing', 'NA', 'NA', 'NA', 'NA', 'NA'),
(9, 2, 'Offline', 'Event Managements', 'Any events to be managed', 'NA', 'NA', 'NA', 'NA', 'NA'),
(10, 4, 'Online', 'Job Post', 'Create you job post with basic price & reach right candidates in your circle', 'NA', 'NA', 'NA', 'NA', 'NA');

-- --------------------------------------------------------

--
-- Table structure for table `tblcollegedetails`
--

CREATE TABLE `tblcollegedetails` (
  `intCollegeId` bigint(20) NOT NULL,
  `varCollegeName` longtext,
  `varCollegeAddress` longtext,
  `varCollegeCity` longtext,
  `varCollegeState` longtext,
  `varContactOne` longtext,
  `varContactTwo` longtext,
  `varContactThree` longtext,
  `varCollegeEmail` longtext,
  `varCollegeWeb` longtext,
  `intuserid` bigint(20) DEFAULT NULL,
  `varVerified` longtext,
  `varPhoto` longtext,
  `varCollegePrincipal` longtext,
  `varCollegeAdmissionIncharge` longtext,
  `isTutor` tinyint(4) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcollegedetails`
--

INSERT INTO `tblcollegedetails` (`intCollegeId`, `varCollegeName`, `varCollegeAddress`, `varCollegeCity`, `varCollegeState`, `varContactOne`, `varContactTwo`, `varContactThree`, `varCollegeEmail`, `varCollegeWeb`, `intuserid`, `varVerified`, `varPhoto`, `varCollegePrincipal`, `varCollegeAdmissionIncharge`, `isTutor`) VALUES
(1, 'coursekatta.com', '#3, Trimurti Building, Shivaji Road, Bhosale Nagar, Hadpsar', 'Pune', 'Maharashtra', '+91 7768800020, 7768900020', '7768900020', '9620961818', 'director@coursekatta.com', 'http://www.coursekatta.com', 1, NULL, 'logom.jpg', 'Mayur Potdar', 'Swati Chounsaste', 1),
(2, 'Anuvaa Softech Private Limited', 'Jalgaon', 'Jalgaon', 'Maharashtra', '02576066999', '9561421489', '', 'savalebd@gmail.com', 'http://anuvaasoft.com', 3, NULL, 'anuvaa-icon.png', 'Bhushan Savale', 'Mayur Potdar', 1),
(3, 'Anuvaa Tutorials', NULL, NULL, 'NA', NULL, NULL, NULL, 'savalebd@gmail.com', NULL, 3, NULL, 'NoProfile.png', NULL, NULL, 0),
(4, 'Recruitkatta', '#3, Trimurti Building, SHivaji Road, Bhosale Nagar, Hadpsar', 'Pune', 'Maharashtra', '', '7768900020', '7768800020', 'director@coursekatta.com', 'www.coursekatta.com', 1, NULL, 'logom.jpg', 'Mayur Potdar', 'Swati ', 1),
(5, 'www.kamwalajpr.com', NULL, NULL, 'NA', NULL, NULL, NULL, 'rbkwgroup@gmail.com', NULL, 28, NULL, 'NoProfile.png', NULL, NULL, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblcollegelikes`
--

CREATE TABLE `tblcollegelikes` (
  `intid` bigint(20) NOT NULL,
  `intCollegeId` bigint(20) NOT NULL,
  `intStudentId` bigint(20) NOT NULL,
  `intLikes` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcollegelikes`
--

INSERT INTO `tblcollegelikes` (`intid`, `intCollegeId`, `intStudentId`, `intLikes`) VALUES
(1, 1, 3, 'yes'),
(4, 2, 2, 'yes'),
(5, 2, 1, 'yes'),
(6, 1, 2, 'yes'),
(7, 4, 1, 'yes'),
(8, 3, 3, 'yes');

-- --------------------------------------------------------

--
-- Table structure for table `tblcollegemedia`
--

CREATE TABLE `tblcollegemedia` (
  `intId` bigint(20) NOT NULL,
  `intCollegeId` bigint(20) DEFAULT NULL,
  `varMediaType` longtext,
  `varMediaName` longtext,
  `varMediaPath` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcollegemedia`
--

INSERT INTO `tblcollegemedia` (`intId`, `intCollegeId`, `varMediaType`, `varMediaName`, `varMediaPath`) VALUES
(1, 1, 'Image', 'Coursekatta.com', '1_Coursekatta.com_1.PNG'),
(2, 1, 'Image', 'Advertkatta', '1_Advertkatta_2.PNG'),
(3, 1, 'Image', 'coursekattacafe', '1_coursekattacafe_3.PNG'),
(4, 1, 'Image', 'Recruitkatta', '1_Recruitkatta_5.PNG'),
(5, 1, 'Image', 'coursekatta', '1_coursekatta_ck.PNG'),
(6, 4, 'Image', 'Coursekatta', '4_Coursekatta_1.PNG'),
(7, 4, 'Image', 'Coursekatta', '4_Coursekatta_2.PNG'),
(8, 4, 'Image', 'Coursekatta', '4_Coursekatta_3.PNG'),
(9, 4, 'Image', 'Coursekatta', '4_Coursekatta_5.PNG'),
(10, 4, 'Image', 'Coursekatta', '4_Coursekatta_6.PNG'),
(11, 4, 'Image', 'Coursekatta', '4_Coursekatta_ck.PNG');

-- --------------------------------------------------------

--
-- Table structure for table `tblcollegeotherdetails`
--

CREATE TABLE `tblcollegeotherdetails` (
  `intCollegeId` bigint(20) NOT NULL,
  `varAboutOne` longtext,
  `varAboutTwo` longtext,
  `varBrochure` longtext,
  `varUniAns` longtext,
  `varNAACAns` longtext,
  `varPlacementRecordPer` longtext,
  `varSpecialAchievements` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcollegeotherdetails`
--

INSERT INTO `tblcollegeotherdetails` (`intCollegeId`, `varAboutOne`, `varAboutTwo`, `varBrochure`, `varUniAns`, `varNAACAns`, `varPlacementRecordPer`, `varSpecialAchievements`) VALUES
(1, 'To bridge the gap between Industry & Academics', 'We are one stop solution for all your recruitment needs. User friendly cost effective services to help & support your recruitment needs.', '', 'Mumbai', '-', 'NA', 'Network based referrals for recruitment '),
(2, 'We are an India based software and web development firm which specializes in creating custom software''s websites and providing services to the clients all over the world.', 'At Anuvaa we make lot of efforts to learn new things & understand market needs which helps us in moving ahead then other competitors. We continuously work on improvement of service quality & costing involving in it. This we share with our client, which shows the business transparency & strong ethical values. Today from the establishment of organization we have travelled a versatile journey which gave us vast experience of understanding what actually you need.', '', 'ROC Mumbai', 'NA', 'NA', 'We are learning from our services & clients serving in the areas of IT, Healthcare, Insurance, Education & academics, Transportation & E-commerce. We are specialized in supporting E-commerce business. We try to provide cost effective latest technology solution but we don’t claim that we are cheapest service provider. We strongly believe in quality service & appropriate costing.'),
(3, NULL, NULL, NULL, NULL, NULL, NULL, ''),
(4, 'To bridge the gap between Industry & Academics', 'We are one stop solution for all your recruitment needs. User friendly cost effective services to help & support your recruitment needs.', '', 'Mumbai', '-', 'NA', 'Network based referrals for recruitment '),
(5, NULL, NULL, NULL, NULL, NULL, NULL, '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcollegeprocess`
--

CREATE TABLE `tblcollegeprocess` (
  `intId` bigint(20) NOT NULL,
  `intCollegeId` bigint(20) DEFAULT NULL,
  `intStudentId` bigint(20) DEFAULT NULL,
  `varStatus` longtext,
  `varCourse` longtext,
  `varReason` longtext,
  `varRemark` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblcollegesocials`
--

CREATE TABLE `tblcollegesocials` (
  `intId` bigint(20) NOT NULL,
  `intCollegeId` bigint(20) NOT NULL,
  `fb` text COLLATE utf8_unicode_ci NOT NULL,
  `gp` text COLLATE utf8_unicode_ci NOT NULL,
  `tw` text COLLATE utf8_unicode_ci NOT NULL,
  `lnkd` text COLLATE utf8_unicode_ci NOT NULL,
  `ex1` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblcollegesocials`
--

INSERT INTO `tblcollegesocials` (`intId`, `intCollegeId`, `fb`, `gp`, `tw`, `lnkd`, `ex1`) VALUES
(1, 1, 'https://www.facebook.com/coursekatta/', 'https://plus.google.com/112047046336198281374', 'https://twitter.com/coursekatta', 'https://www.linkedin.com/company/coursekatta', ''),
(2, 1, 'https://www.facebook.com/coursekatta/', 'https://plus.google.com/112047046336198281374', 'https://twitter.com/coursekatta', 'https://www.linkedin.com/company/coursekatta', ''),
(3, 1, 'https://www.facebook.com/coursekatta/', 'https://plus.google.com/112047046336198281374', 'https://twitter.com/coursekatta', 'https://www.linkedin.com/company/coursekatta', ''),
(4, 1, 'https://www.facebook.com/coursekatta/', 'https://plus.google.com/112047046336198281374', 'https://twitter.com/coursekatta', 'https://www.linkedin.com/company/coursekatta', ''),
(5, 2, 'http://www.fb.com/anuvaasoftech', 'http://plus.google.com/anuvaasoft', 'http://www.twitter.com/anuvaasoft', 'http://www.linkedin.com/anuvaasoft', ''),
(6, 3, 'http://www.fb.com', 'http://plus.google.com', 'http://www.twitter.com', 'http://www.linkedin.com', ''),
(7, 4, 'http://www.fb.com/coursekatta/', 'http://plus.google.com', 'http://www.twitter.com/coursekatta', 'http://www.linkedin.com/company/coursekatta', ''),
(8, 5, 'http://www.fb.com', 'http://plus.google.com', 'http://www.twitter.com', 'http://www.linkedin.com', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblcollegeviews`
--

CREATE TABLE `tblcollegeviews` (
  `intid` bigint(20) NOT NULL,
  `intCollegeId` bigint(20) NOT NULL,
  `intViews` bigint(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblcollegeviews`
--

INSERT INTO `tblcollegeviews` (`intid`, `intCollegeId`, `intViews`) VALUES
(1, 1, 1),
(2, 2, 1),
(3, 3, 1),
(4, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tblconnections`
--

CREATE TABLE `tblconnections` (
  `intId` bigint(20) NOT NULL,
  `intConnectionMe` bigint(20) NOT NULL,
  `intConnected` bigint(20) NOT NULL,
  `intRequested` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblconnections`
--

INSERT INTO `tblconnections` (`intId`, `intConnectionMe`, `intConnected`, `intRequested`) VALUES
(1, 2, 1, 2),
(2, 3, 2, 2),
(3, 3, 1, 2),
(4, 2, 4, 1),
(5, 3, 4, 2),
(6, 3, 5, 1),
(7, 3, 6, 1),
(8, 1, 6, 1),
(9, 1, 5, 1),
(10, 1, 7, 1),
(11, 1, 8, 1),
(12, 1, 9, 1),
(13, 1, 10, 1),
(14, 1, 11, 1),
(15, 1, 4, 1),
(16, 15, 1, 2),
(17, 2, 5, 1),
(18, 2, 9, 1),
(19, 1, 16, 1),
(20, 1, 17, 1),
(21, 1, 18, 1),
(22, 1, 14, 1),
(23, 1, 13, 1),
(24, 1, 12, 1),
(25, 1, 19, 1),
(26, 1, 20, 1),
(27, 1, 24, 1),
(28, 1, 27, 1),
(29, 1, 22, 1),
(30, 1, 26, 1),
(31, 1, 21, 1),
(32, 1, 28, 1),
(33, 1, 25, 1),
(34, 1, 23, 1),
(35, 1, 23, 1),
(36, 1, 34, 1),
(37, 1, 33, 1),
(38, 1, 32, 1),
(39, 1, 30, 1),
(40, 1, 29, 1),
(41, 1, 31, 1);

-- --------------------------------------------------------

--
-- Table structure for table `tbledmitracity`
--

CREATE TABLE `tbledmitracity` (
  `intCity` bigint(20) DEFAULT NULL,
  `varCity` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbledmitracity`
--

INSERT INTO `tbledmitracity` (`intCity`, `varCity`) VALUES
(0, '-- Select City --'),
(1, 'Achabal'),
(2, 'Achalpur'),
(3, 'Achhnera'),
(4, 'Adari'),
(5, 'Adalaj'),
(6, 'Adilabad'),
(7, 'Adityana'),
(8, 'Pereyaapatna'),
(9, 'Adoni'),
(10, 'Adoor'),
(11, 'Adiyara'),
(12, 'Adra'),
(13, 'Afzalpura'),
(14, 'Agartala'),
(15, 'Agra'),
(16, 'Ahiwara'),
(17, 'Ahmedabad'),
(18, 'Ahmedgarh'),
(19, 'Ahmednagar'),
(20, 'Ahmedpur'),
(21, 'Aizawl'),
(22, 'Ajmer'),
(23, 'Ajra'),
(24, 'Akaltara'),
(25, 'Akbarpur'),
(26, 'Akathiyoor'),
(27, 'Akhnoor'),
(28, 'Akkalkot'),
(29, 'Akola'),
(30, 'Akot'),
(31, 'Alandha'),
(32, 'Alandi'),
(33, 'Alang'),
(34, 'Alappuzha'),
(35, 'Aldona'),
(36, 'Alibag'),
(37, 'Aligarh'),
(38, 'Alipurduar'),
(39, 'Allahabad'),
(40, 'Almora'),
(41, 'Aalanavara'),
(42, 'Along'),
(43, 'Alur'),
(44, 'Alwar'),
(45, 'Amadalavalasa'),
(46, 'Amalapuram'),
(47, 'Amalner'),
(48, 'Amarpur'),
(49, 'Ambad'),
(50, 'Ambagarh Chowki'),
(51, 'Ambaji'),
(52, 'Ambaliyasan'),
(53, 'Ambejogai'),
(54, 'Ambikaanagara'),
(55, 'Ambikapur'),
(56, 'Ambivali Tarf Wankhal'),
(57, 'Ameenapuram'),
(58, 'Amguri'),
(59, 'Amini'),
(60, 'Amlabad'),
(61, 'Amli'),
(62, 'Amravati'),
(63, 'Amreli'),
(64, 'Amritsar'),
(65, 'Amroha'),
(66, 'Anakapalle'),
(67, 'Anand'),
(68, 'Anandapur'),
(69, 'Anandnagaar'),
(70, 'Anantapur'),
(71, 'Anantnag'),
(72, 'Ancharakandy'),
(73, 'Andada'),
(74, 'Anekal'),
(75, 'Ankola'),
(76, 'Anjar'),
(77, 'Anjangaon'),
(78, 'Anklav'),
(79, 'Ankleshwar'),
(80, 'Annigeri'),
(81, 'Antaliya'),
(82, 'Anugul'),
(83, 'Ara'),
(84, 'Arambhada'),
(85, 'Arakkonam'),
(86, 'Araria'),
(87, 'Arang'),
(88, 'Arambagh'),
(89, 'Arsikere'),
(90, 'Arcot'),
(91, 'Areraj'),
(92, 'Ariyalur'),
(93, 'Arkalgud'),
(94, 'Arki'),
(95, 'Arnia'),
(96, 'Aroor'),
(97, 'Arrah'),
(98, 'Aruppukkottai'),
(99, 'Arvi'),
(100, 'Arwal'),
(101, 'Asankhurd'),
(102, 'Asansol'),
(103, 'Asarganj'),
(104, 'Ashok Nagar'),
(105, 'Ashta'),
(106, 'Ashtamichira'),
(107, 'Asika'),
(108, 'Asola'),
(109, 'Assandh'),
(110, 'Ateli'),
(111, 'Athni'),
(112, 'Attingal'),
(113, 'Atul'),
(114, 'Aurad'),
(115, 'Aurangabad'),
(116, 'Aurangabad'),
(117, 'Ausa'),
(118, 'Avinissery'),
(119, 'Awantipora'),
(120, 'Azamgarh'),
(121, 'Azmatgarh'),
(122, 'Babaleshwar'),
(123, 'Babiyal'),
(124, 'Baddi'),
(125, 'Bade Bacheli'),
(126, 'Badaun'),
(127, 'Badagaon'),
(128, 'Badepalle'),
(129, 'Badharghat'),
(130, 'Bagaha'),
(131, 'Bageshwar'),
(132, 'Bahadurgarh'),
(133, 'Bahadurganj'),
(134, 'Baharampur'),
(135, 'Bahraich'),
(136, 'Bairgania'),
(137, 'Bakhtiarpur'),
(138, 'Balaghat'),
(139, 'Balangir'),
(140, 'Balasore'),
(141, 'Baleshwar'),
(142, 'Bawana'),
(143, 'Bhiwadi'),
(144, 'Bali'),
(145, 'Bally'),
(146, 'Ballabhgarh'),
(147, 'Ballia'),
(148, 'Balod'),
(149, 'Baloda Bazar'),
(150, 'Balrampur'),
(151, 'Balurghat'),
(152, 'Bamra'),
(153, 'Bandar'),
(154, 'Bandikui'),
(155, 'Bandipore'),
(156, 'Bangalore'),
(157, 'Banganapalle'),
(158, 'Banka'),
(159, 'Banmankhi Bazar'),
(160, 'Banswara'),
(161, 'Bankura'),
(162, 'Bapatla'),
(163, 'Barakar'),
(164, 'Barahiya'),
(165, 'Baramati'),
(166, 'Baramula'),
(167, 'Baran'),
(168, 'Barasat'),
(169, 'Bardhaman'),
(170, 'Barauli'),
(171, 'Barbigha'),
(172, 'Bareilly'),
(173, 'Barughutu'),
(174, 'Basna'),
(175, 'Barbil'),
(176, 'Bargarh'),
(177, 'Barh'),
(178, 'Baripada'),
(179, 'Barmer'),
(180, 'Barnala'),
(181, 'Barpeta'),
(182, 'Barpeta Road'),
(183, 'Barrackpur'),
(184, 'Barwani'),
(185, 'Barwala'),
(186, 'Basavan Bagevadi'),
(187, 'Basudebpur'),
(188, 'Batala'),
(189, 'Bathinda'),
(190, 'Bawal'),
(191, 'Bazpur'),
(192, 'Beawar'),
(193, 'Begusarai'),
(194, 'Behea'),
(195, 'Belgaum'),
(196, 'Bellampalle'),
(197, 'Ballary'),
(198, 'Belpahar'),
(199, 'Bemetra'),
(200, 'Berinag'),
(201, 'Bethamcherla'),
(202, 'Bettiah'),
(203, 'Betul'),
(204, 'Bhabua'),
(205, 'Bhadrachalam'),
(206, 'Bhadrak'),
(207, 'Bhagalpur'),
(208, 'Bhagha Purana'),
(209, 'Bhainsa'),
(210, 'Bhajanpura'),
(211, 'Bhandara'),
(212, 'Bharatpur'),
(214, 'Bharuch'),
(215, 'Bhatapara'),
(216, 'Bhavani'),
(217, 'Bhavnagar'),
(218, 'Bhawanipatna'),
(219, 'Bheemunipatnam'),
(220, 'Bhilai'),
(221, 'Bhilwara'),
(222, 'Bhimavaram'),
(223, 'Bhinmal'),
(224, 'Bhiwandi'),
(225, 'Bhiwani'),
(226, 'Bhongir'),
(227, 'Bhopal'),
(228, 'Bhuban'),
(229, 'Bhubaneswar*'),
(230, 'Bhuj'),
(231, 'Bhusawal'),
(232, 'Bidar'),
(233, 'Bidhan Nagar'),
(234, 'Bihar Sharif'),
(235, 'Bijapur'),
(236, 'Bijbehara'),
(237, 'Bijnor'),
(238, 'Bikaner'),
(239, 'Bikramganj'),
(240, 'Bilara'),
(241, 'Bilasipara'),
(242, 'Bilaspur'),
(243, 'Bilaspur'),
(244, 'Biramitrapur'),
(245, 'Birgaon'),
(246, 'Bobbili'),
(247, 'Bodhan'),
(248, 'Bodh Gaya'),
(249, 'Bokaro Steel City'),
(250, 'Bongaigaon City'),
(251, 'Bomdila'),
(252, 'Brahmapur'),
(253, 'Brajrajnagar'),
(254, 'Budaun'),
(255, 'Budhlada'),
(256, 'Bulandshahr'),
(257, 'Burhanpur'),
(258, 'Burla'),
(259, 'Buxar'),
(260, 'Byasanagar'),
(261, ''),
(262, 'Chadchan'),
(263, 'Chaibasa'),
(264, 'Chakeri'),
(265, 'Chakradharpur'),
(266, 'Chalisgaon'),
(267, 'Chamba'),
(268, 'Chamba'),
(269, 'Champa'),
(270, 'Champawat'),
(271, 'Champhai'),
(272, 'Chamarajanagara'),
(273, 'Chandigarh'),
(274, 'Chandil'),
(275, 'Chandausi'),
(276, 'Chandrapura'),
(277, 'Chanpatia'),
(278, 'Charkhi Dadri'),
(279, 'Chapirevula'),
(280, 'Chatra'),
(281, 'Charkhari'),
(282, 'Chalakudy'),
(283, 'Chandrapur'),
(284, 'Changanassery'),
(285, 'Cheeka'),
(286, 'Chendamangalam'),
(287, 'Chengalpattu'),
(288, 'Chengannur'),
(289, 'Chennai*'),
(290, 'Cherthala'),
(291, 'Cheruthazham'),
(292, 'Chhapra'),
(293, 'Chhatarpur'),
(294, 'Chhindwara'),
(295, 'Chikkodi'),
(296, 'Chikkamagalur'),
(297, 'Chilakaluripet'),
(298, 'Chinchani'),
(299, 'Chinna salem'),
(300, 'Chinthaamani'),
(301, 'Chiplun'),
(302, 'Chirala'),
(303, 'Chirkunda'),
(304, 'Chirmiri'),
(305, 'Chinsura'),
(306, 'Chitradurga'),
(307, 'Chittur-Thathamangalam'),
(308, 'Chitrakoot'),
(309, 'Chittoor'),
(310, 'Chockli'),
(311, 'Churi'),
(312, 'Churu'),
(313, 'Coimbatore'),
(314, 'Colng'),
(315, 'Contai'),
(316, 'Cooch Behar'),
(317, 'Coonoor'),
(318, 'Cuddalore'),
(319, 'Cuddapah'),
(320, 'Curchorem Cacora'),
(321, 'Cuttack'),
(322, 'Chikkaballapura'),
(323, 'Chandan Bara'),
(324, 'Chaukori'),
(325, 'Dabra'),
(326, 'Dadri'),
(327, 'Dahod'),
(328, 'Dalhousie'),
(329, 'Dalkhola'),
(330, 'Dalli-Rajhara'),
(331, 'Dalsinghsarai'),
(332, 'Daltonganj'),
(333, 'Daman and Diu'),
(334, 'Damoh'),
(335, 'Darbhanga'),
(336, 'Darjeeling'),
(337, 'Dasua'),
(338, 'Datia'),
(339, 'Daudnagar'),
(340, 'Daund'),
(341, 'Davanagere'),
(342, 'Debagarh'),
(343, 'Deesa'),
(344, 'Dehegam'),
(345, 'Dehradun'),
(346, 'Dehri-on-Sone'),
(347, 'Delhi'),
(348, 'Deoghar'),
(349, 'Deoria'),
(350, 'Devarakonda'),
(351, 'Devar Hipparagi'),
(352, 'Devgarh'),
(353, 'Devgarh'),
(354, 'Dewas'),
(355, 'Dhampur'),
(356, 'Dhamtari'),
(357, 'Dhanbad'),
(358, 'Dhar'),
(359, 'Dharampur'),
(360, 'Dharamsala'),
(361, 'Dharmanagar'),
(362, 'Dharmapuri'),
(363, 'Dharmavaram'),
(364, 'Dharwad'),
(365, 'Dhekiajuli'),
(366, 'Dhenkanal'),
(367, 'Dholka'),
(368, 'Dhubri'),
(369, 'Dhule'),
(370, 'Dhulian'),
(371, 'Dhuri'),
(372, 'Dibrugarh'),
(373, 'Digboi'),
(374, 'Dighwara'),
(375, 'Dimapur'),
(376, 'Dinanagar'),
(377, 'Dindigul'),
(378, 'Diphu'),
(379, 'Dipka'),
(380, 'Dispur*'),
(381, 'Dombivli'),
(382, 'Dongargarh'),
(383, 'Duliajan Oil Town'),
(384, 'Dumdum'),
(385, 'Dumka'),
(386, 'Dumraon'),
(387, 'Durg-Bhilai Nagar'),
(388, 'Durgapur'),
(389, 'Durgapur'),
(390, 'Dwarka'),
(391, 'Ellenabad'),
(392, 'Eluru'),
(393, 'Erattupetta'),
(394, 'Erode'),
(395, 'Etah'),
(396, 'Etawah'),
(397, 'English Bazar(Malda)'),
(398, 'Faizabad'),
(399, 'Falna'),
(400, 'Faridabad'),
(401, 'Faridkot'),
(402, 'Farooqnagar'),
(403, 'Farrukhabad'),
(404, 'Fatehabad'),
(405, 'Fatehabad'),
(406, 'Fatehabad'),
(407, 'Fatehgarh'),
(408, 'Fatehpur Chaurasi'),
(409, 'Fatehpur Sikri'),
(410, 'Fatehpur'),
(213, 'Bharthana'),
(411, 'Fatehpur'),
(412, 'Fatehpur'),
(413, 'Fatwah'),
(414, 'Fazilka'),
(415, 'Forbesganj'),
(416, 'Firozabad'),
(417, 'Firozpur'),
(418, 'Firozpur Cantt.'),
(419, 'Gadarwara'),
(420, 'Gadhaga/Gadag'),
(421, 'Gadchiroli'),
(422, 'Gadwal'),
(423, 'Ganaur'),
(424, 'Gandhidham'),
(425, 'Gandhinagar*'),
(426, 'Gangtok*'),
(427, 'Ganjam'),
(428, 'Garhwa'),
(429, 'Gauripur'),
(430, 'Gauribidanur'),
(431, 'Gaya'),
(432, 'Gharaunda'),
(433, 'Ghatampur'),
(434, 'Ghatanji'),
(435, 'Ghatshila'),
(436, 'Ghaziabad'),
(437, 'Ghazipur'),
(438, 'Giddarbaha'),
(439, 'Gingee'),
(440, 'Giridih'),
(441, 'a Velha'),
(442, 'alpara'),
(443, 'bichettipalayam'),
(444, 'bindgarh'),
(445, 'branawapara'),
(446, 'dda'),
(447, 'dhra'),
(448, 'gri Jamalpur'),
(449, 'hana'),
(450, 'kak'),
(451, 'laghat'),
(452, 'moh'),
(453, 'ndiya'),
(454, 'oty'),
(455, 'palganj'),
(456, 'rakhpur'),
(457, 'Greater Noida'),
(458, 'Gudalur'),
(459, 'Gudalur'),
(460, 'Gudalur'),
(461, 'Gudivada'),
(462, 'Gudur'),
(463, 'Gulbarga'),
(464, 'Gumia'),
(465, 'Gumla'),
(466, 'Guna'),
(467, 'Gundlupet'),
(468, 'Guntakal'),
(469, 'Guntur'),
(470, 'Gunupur'),
(471, 'Gurdaspur'),
(472, 'Gurgaon'),
(473, 'Guruvayoor'),
(474, 'Guwahati'),
(475, 'Gwalior'),
(476, 'Haflong'),
(477, 'Hailakandi'),
(478, 'Hajipur'),
(479, 'Haldia'),
(480, 'Haldwani'),
(481, 'Hamirpur'),
(482, 'Hamirpur'),
(483, 'Hansi'),
(484, 'Hanuman Junction'),
(485, 'Hanumangarh'),
(486, 'Hapur'),
(487, 'Harda'),
(488, 'Hardoi'),
(489, 'Haridwar'),
(490, 'Haripad'),
(491, 'Harsawa'),
(492, 'Harur'),
(493, 'Haasana'),
(494, 'Hastinapur'),
(495, 'Hathras'),
(496, 'Hazaribag'),
(497, 'Hilsa'),
(498, 'Himatnagar'),
(499, 'Hindupur'),
(500, 'Hinjilicut'),
(501, 'Hisar'),
(502, 'Hisua'),
(503, 'Hodal'),
(504, 'Hojai'),
(505, 'Hoshiarpur'),
(506, 'Hosapet'),
(507, 'Howrah'),
(508, 'Hubbali'),
(509, 'Hukkeri'),
(510, 'Hugli-Chuchura'),
(511, 'Hussainabad'),
(512, 'Hyderabad*'),
(513, 'Ichalkaranji'),
(514, 'Ichchapuram'),
(515, 'Idar'),
(516, 'Imphal*'),
(517, 'Indirapuram'),
(518, 'Indi'),
(519, 'Indore'),
(520, 'Indranagar'),
(521, 'Irinjalakuda'),
(522, 'Islampur'),
(523, 'Islampur'),
(524, 'Itanagar*'),
(525, 'Itarsi'),
(526, 'Idukki'),
(527, 'Jabalpur'),
(528, 'Jagadhri'),
(529, 'Jagatsinghapur'),
(530, 'Jagdalpur'),
(531, 'Jagdispur'),
(532, 'Jaggaiahpet'),
(533, 'Jagraon'),
(534, 'Jagtial'),
(535, 'Jaipur*'),
(536, 'Jais'),
(537, 'Jaisalmer'),
(538, 'Jaitaran'),
(539, 'Jaitu'),
(540, 'Jajapur'),
(541, 'Jajmau'),
(542, 'Jalalabad'),
(543, 'Jalna'),
(544, 'Jalandhar Cantt.'),
(545, 'Jalandhar'),
(546, 'Jaleswar'),
(547, 'Jalgaon'),
(548, 'Jalpaiguri'),
(549, 'Jalore'),
(550, 'Jamalpur'),
(551, 'Jammalamadugu'),
(552, 'Jammu'),
(553, 'Jamnagar'),
(554, 'Jamshedpur'),
(555, 'Jamtara'),
(556, 'Jamui'),
(557, 'Jandiala'),
(558, 'Jangaon'),
(559, 'Janjgir'),
(560, 'Jashpurnagar'),
(561, 'Jaspur'),
(562, 'Jatani'),
(563, 'Jaunpur'),
(564, 'Jayankondam'),
(565, 'Jehanabad'),
(566, 'Jeypur'),
(567, 'Jhabua'),
(568, 'Jhajha'),
(569, 'Jhajjar'),
(570, 'Jhalawar'),
(571, 'Jhanjharpur'),
(572, 'Jhansi'),
(573, 'Jhargram'),
(574, 'Jharsuguda'),
(575, 'Jhumri Tilaiya'),
(576, 'Jhunjhunu'),
(577, 'Jind'),
(578, 'Joda'),
(579, 'Jodhpur'),
(580, 'Jogabani'),
(581, 'Jogendranagar'),
(582, 'Jorhat'),
(583, 'Jowai'),
(584, 'Junagadh'),
(585, 'Junnar'),
(586, 'Jhalda'),
(587, 'Kadapa'),
(588, 'Kadi'),
(589, 'Kadiri'),
(590, 'Kadirur'),
(591, 'Kagaznagar'),
(592, 'Kailaras'),
(593, 'Kailasahar'),
(594, 'Kaithal'),
(595, 'Kakching'),
(596, 'Kakinada'),
(597, 'Kalan Wali'),
(598, 'Kalavad'),
(599, 'Kalburgi'),
(600, 'Kalimpong'),
(601, 'Kalka'),
(602, 'Kalliasseri'),
(603, 'Kalpi'),
(604, 'Kalol'),
(605, 'Kalpetta'),
(606, 'Kalyan'),
(607, 'Kalyandurg'),
(608, 'Kamareddy'),
(609, 'Kamthi'),
(610, 'Kanchipuram'),
(611, 'Kanda'),
(612, 'Kandukur'),
(613, 'Kanhangad'),
(614, 'Kanjikkuzhi'),
(615, 'Kanker'),
(616, 'Kannur'),
(617, 'Kanpur'),
(618, 'Kantabanji'),
(619, 'Kanti'),
(620, 'Kapadvanj'),
(621, 'Kapurthala'),
(622, 'Karad'),
(623, 'Karaikal'),
(624, 'Karaikudi'),
(625, 'Karanjia'),
(626, 'Karimganj'),
(627, 'Karimnagar'),
(628, 'Karjan'),
(629, 'karjat'),
(630, 'Kaarkala'),
(631, 'Karnal'),
(632, 'Karoran'),
(633, 'Kartarpur'),
(634, 'Karur'),
(635, 'Karungal'),
(636, 'Karwar'),
(637, 'Kasarad'),
(638, 'Kashipur'),
(639, 'Kathua'),
(640, 'Katihar'),
(641, 'Katni'),
(642, 'Katra'),
(643, 'Kavali'),
(644, 'Kavaratti*'),
(645, 'Kawardha'),
(646, 'Kayamkulam'),
(647, 'Kendrapara'),
(648, 'Kendujhar'),
(649, 'Keshod'),
(650, 'Keylong'),
(651, 'Khagaria'),
(652, 'Khalilabad'),
(653, 'Khambhalia'),
(654, 'Khambhat'),
(655, 'Khammam'),
(656, 'Khanna'),
(657, 'Kharagpur'),
(658, 'Kharagpur'),
(659, 'Kharar'),
(660, 'Kheda'),
(661, 'Khedbrahma'),
(662, 'Kheralu'),
(663, 'Kheri'),
(664, 'Khordha'),
(665, 'Khowai'),
(666, 'Khunti'),
(667, 'Khurai'),
(668, 'Kichha'),
(669, 'Kishanganj'),
(670, 'Kochi'),
(671, 'Kodad'),
(672, 'Kodinar'),
(673, 'Kodungallur'),
(674, 'Kohima*'),
(675, 'Kokrajhar'),
(676, 'Kolar'),
(677, 'Kolhar'),
(678, 'Kolhapur'),
(679, 'Kolkata'),
(680, 'Kollam'),
(681, 'Kollankodu'),
(682, 'Kondagaon'),
(683, 'Konnagar'),
(684, 'Koothuparamba'),
(685, 'Koraput'),
(686, 'Korba'),
(687, 'Koratla'),
(688, 'Kot Kapura'),
(689, 'Kota'),
(690, 'Kota'),
(691, 'Kota'),
(692, 'Kotdwara'),
(693, 'Kothagudem'),
(694, 'Kothamangalam'),
(695, 'Kothapeta'),
(696, 'Kotma'),
(697, 'Kottayam'),
(698, 'Kovvur'),
(699, 'Kozhikode'),
(700, 'Kozhencherry'),
(701, 'Krishnanagar'),
(702, 'Kuchinda'),
(703, 'Kulpahar'),
(704, 'Kunnamkulam'),
(705, 'Kurali'),
(706, 'Kurnool'),
(707, 'Kurukshetra'),
(708, 'Kyathampalle'),
(709, 'Kamahi Devi'),
(710, 'Kalyani'),
(711, 'Lachhmangarh'),
(712, 'Ladnu'),
(713, 'Ladwa'),
(714, 'Lahar'),
(715, 'Laharpur'),
(716, 'Lakheri'),
(717, 'Lakhimpur'),
(718, 'Lakhisarai'),
(719, 'Lakshmishawara'),
(720, 'Lal palganj Nindaura'),
(721, 'Lalganj'),
(722, 'Lalgudi'),
(723, 'Lalitpur'),
(724, 'Lalganj'),
(725, 'Lalsot'),
(726, 'Lanka'),
(727, 'Lar'),
(728, 'Lathi'),
(729, 'Latur'),
(730, 'Leh'),
(731, 'Lilong'),
(732, 'Limbdi'),
(733, 'Lingsuguru'),
(734, 'Loha'),
(735, 'Lohardaga'),
(736, 'Lonar'),
(737, 'Lonavla'),
(738, 'Lonwal'),
(739, 'Loni'),
(740, 'Losal'),
(741, 'Lucknow*'),
(742, 'Ludhiana'),
(743, 'Lumding'),
(744, 'Lunawada'),
(745, 'Lundi'),
(746, 'Lunglei'),
(747, 'Macherla'),
(748, 'Machilipatnam'),
(749, 'Madanapalle'),
(750, 'Maddhuru'),
(751, 'Margao'),
(752, 'Madhepura'),
(753, 'Madhubani'),
(754, 'Madhugiri'),
(755, 'Madhupur'),
(756, 'Madhyamgram'),
(757, 'Madikeri'),
(758, 'Madurai'),
(759, 'Maagadi'),
(760, 'Mahabaleswar'),
(761, 'Mahad'),
(762, 'Mahbubnagar'),
(763, 'Mahalingapura'),
(764, 'Maharajganj'),
(765, 'Maharajpur'),
(766, 'Mahasamund'),
(767, 'Mahe'),
(768, 'Mahendragarh'),
(769, 'Mahendragarh'),
(770, 'Mahesana'),
(771, 'Mahidpur'),
(772, 'Mahnar Bazar'),
(773, 'Mahoba'),
(774, 'Mahuli'),
(775, 'Mahuva'),
(776, 'Mahwa'),
(777, 'Maihar'),
(778, 'Mainaguri'),
(779, 'Makhdumpur'),
(780, 'Makrana'),
(781, 'Mal'),
(782, 'Malajkhand'),
(783, 'Malappuram'),
(784, 'Malavalli'),
(785, 'Malegaon'),
(786, 'Malerkotla'),
(787, 'Malkangiri'),
(788, 'Malkapur'),
(789, 'Malout'),
(790, 'Malpura'),
(791, 'Maaluru'),
(792, 'Manasa'),
(793, 'Manavadar'),
(794, 'Manawar'),
(795, 'Manchar'),
(796, 'Mancherial'),
(797, 'Mandalgarh'),
(798, 'Mandamarri'),
(799, 'Mandapeta'),
(800, 'Mandawa'),
(801, 'Mandi'),
(802, 'Mandi Dabwali'),
(803, 'Mandideep'),
(804, 'Mandla'),
(805, 'Mandsaur'),
(806, 'Mandvi'),
(807, 'Mandya'),
(808, 'Maner'),
(809, 'Manesar'),
(810, 'Mangalagiri'),
(811, 'Mangaldoi'),
(812, 'Mangalore'),
(813, 'Mangalvedhe'),
(814, 'Manglaur'),
(815, 'Mangrol'),
(816, 'Mangrol'),
(817, 'Mangrulpir'),
(818, 'Manihari'),
(819, 'Manjlegaon'),
(820, 'Mankachar'),
(821, 'Manmad'),
(822, 'Mansa'),
(823, 'Mansa'),
(824, 'Manuguru'),
(825, 'Maanvi'),
(826, 'Manwath'),
(827, 'Mapusa'),
(828, 'Margao'),
(829, 'Margherita'),
(830, 'Marhaura'),
(831, 'Mariani'),
(832, 'Marigaon'),
(833, 'Markapur'),
(834, 'Marmagao'),
(835, 'Masaurhi'),
(836, 'Mathabhanga'),
(837, 'Mathura'),
(838, 'Mattannur'),
(839, 'Mauganj'),
(840, 'Maur'),
(841, 'Mavelikkara'),
(842, 'Mavoor'),
(843, 'Mayang Imphal'),
(844, 'Medak'),
(845, 'Medinipur'),
(846, 'Meerut'),
(847, 'Mehkar'),
(848, 'Mehmedabad'),
(849, 'Memari'),
(850, 'Merta City'),
(851, 'Mhaswad'),
(852, 'Mhow Cantonment'),
(853, 'Mhowgaon'),
(854, 'Mihijam'),
(855, 'Mira-Bhayandar'),
(856, 'Miraj'),
(857, 'Mirganj'),
(858, 'Miryalaguda'),
(859, 'Mirzapur'),
(860, 'Mithapur'),
(861, 'Modasa'),
(862, 'Modinagar'),
(863, 'Moga'),
(864, 'Mogalthur'),
(865, 'Mohali'),
(866, 'Mohania'),
(867, 'Mokama'),
(868, 'Mokameh'),
(869, 'Mokokchung'),
(870, 'Monoharpur'),
(871, 'Moradabad'),
(872, 'Morena'),
(873, 'Morinda'),
(874, 'Morshi'),
(875, 'Morvi'),
(876, 'Motihari'),
(877, 'Motipur'),
(878, 'Mount Abu'),
(879, 'Mudalagi'),
(880, 'Mudabidri'),
(881, 'Muddebihala'),
(882, 'Mudhola'),
(883, 'Mukatsar'),
(884, 'Mukerian'),
(885, 'Mukhed'),
(886, 'Muktsar'),
(887, 'Mul'),
(888, 'Mulabaagilu'),
(889, 'Multai'),
(890, 'Mumbai'),
(891, 'Mundi'),
(892, 'Mundaragi'),
(893, 'Mungeli'),
(894, 'Munger'),
(895, 'Muradnagar'),
(896, 'Murliganj'),
(897, 'Murshidabad'),
(898, 'Murtijapur'),
(899, 'Murwara'),
(900, 'Musabani'),
(901, 'Mussoorie'),
(902, 'Muvattupuzha'),
(903, 'Muzaffarnagar'),
(904, 'Muzaffarpur'),
(905, 'Mysore'),
(906, 'Meethari Marwar'),
(907, 'Nabadwip'),
(908, 'Nabarangapur'),
(909, 'Nabha'),
(910, 'Nadbai'),
(911, 'Nadiad'),
(912, 'Nidagundi'),
(913, 'Nagaon'),
(914, 'Nagapattinam'),
(915, 'Nagar'),
(916, 'Nagari'),
(917, 'Nagarkurnool'),
(918, 'Nagaur'),
(919, 'Nagda'),
(920, 'Nagercoil'),
(921, 'Nagina'),
(922, 'Nagla'),
(923, 'Nagpur'),
(924, 'Nahan'),
(925, 'Naharlagun'),
(926, 'Naihati'),
(927, 'Naila Janjgir'),
(928, 'Nainital'),
(929, 'Nainpur'),
(930, 'Najafgarh'),
(931, 'Najibabad'),
(932, 'Nakodar'),
(933, 'Nakur'),
(934, 'Nalasopara'),
(935, 'Nalanda'),
(936, 'Nalbari'),
(937, 'Namagiripettai'),
(938, 'Namakkal'),
(939, 'Nanded-Waghala'),
(940, 'Nandgaon'),
(941, 'Nandivaram-Guduvancheri'),
(942, 'Nandura'),
(943, 'Nandurbar'),
(944, 'Nandyal'),
(945, 'Nangal'),
(946, 'Nanjanaodu'),
(947, 'Nanjikottai'),
(948, 'Nanpara'),
(949, 'Narasapur'),
(950, 'Narasaraopet'),
(951, 'Naraura'),
(952, 'Narayanpet'),
(953, 'Narela'),
(954, 'Nargund'),
(955, 'Narkatiaganj'),
(956, 'Narkhed'),
(957, 'Narnaul'),
(958, 'Narsinghgarh'),
(959, 'Narsinghgarh'),
(960, 'Narsipatnam'),
(961, 'Narwana'),
(962, 'Nashik'),
(963, 'Nasirabad'),
(964, 'Natham'),
(965, 'Nathdwara'),
(966, 'Naugachhia'),
(967, 'Naugawan Sadat'),
(968, 'Nautanwa'),
(969, 'Navalgund'),
(970, 'Navi Mumbai'),
(971, 'Navsari'),
(972, 'Nawabganj'),
(973, 'Nawada'),
(974, 'Nawagarh'),
(975, 'Nawalgarh'),
(976, 'Nawanshahr'),
(977, 'Nawapur'),
(978, 'Nedumangad'),
(979, 'Neem-Ka-Thana'),
(980, 'Neemuch'),
(981, 'Nehtaur'),
(982, 'Nelamangala'),
(983, 'Nellikuppam'),
(984, 'Nellore'),
(985, 'Nepanagar'),
(986, 'New Delhi*'),
(987, 'Neyveli'),
(988, 'Neyyattinkara'),
(989, 'Nidadavole'),
(990, 'Nilanga'),
(991, 'Nilambur'),
(992, 'Nimbahera'),
(993, 'Nippani'),
(994, 'Nirmal'),
(995, 'Niwai'),
(996, 'Niwari'),
(997, 'Nizamabad'),
(998, 'Nohar'),
(999, 'Noida'),
(1000, 'Nokha'),
(1001, 'Nokha'),
(1002, 'Nongstoin'),
(1003, 'Noorpur'),
(1004, 'North Lakhimpur'),
(1005, 'Nowng'),
(1006, 'Nowrozabad'),
(1007, 'Nuzvid'),
(1008, 'O'' Valley'),
(1009, 'Oddanchatram'),
(1010, 'Obra'),
(1011, 'Onle'),
(1012, 'Orai'),
(1013, 'Osmanabad'),
(1014, 'Ottappalam'),
(1015, 'Ozar'),
(1016, 'P.N.Patti'),
(1017, 'Pachora'),
(1018, 'Pachore'),
(1019, 'Pacode'),
(1020, 'Padmanabhapuram'),
(1021, 'Padra'),
(1022, 'Padrauna'),
(1023, 'Paithan'),
(1024, 'Pakaur'),
(1025, 'Palacole'),
(1026, 'Palai'),
(1027, 'Palakkad'),
(1028, 'Palani'),
(1029, 'Palanpur'),
(1030, 'Palasa Kasibugga'),
(1031, 'Palghar'),
(1032, 'Pali'),
(1033, 'Pali'),
(1034, 'Palia Kalan'),
(1035, 'Palitana'),
(1036, 'Pondur'),
(1037, 'Palladam'),
(1038, 'Pallapatti'),
(1039, 'Pallikonda'),
(1040, 'Palwal'),
(1041, 'Palwancha'),
(1042, 'Panagar'),
(1043, 'Panagudi'),
(1044, 'Panaji'),
(1045, 'Panamattom'),
(1046, 'Panchkula'),
(1047, 'Panchla'),
(1048, 'Pandharkaoda'),
(1049, 'Pandharpur'),
(1050, 'Pandhurna'),
(1051, 'Pandua'),
(1052, 'Panipat'),
(1053, 'Panna'),
(1054, 'Panniyannur'),
(1055, 'Panruti'),
(1056, 'Panvel'),
(1057, 'Pappinisseri'),
(1058, 'Paradip'),
(1059, 'Paramakudi'),
(1060, 'Parangipettai'),
(1061, 'Parasi'),
(1062, 'Paravoor'),
(1063, 'Parbhani'),
(1064, 'Pardi'),
(1065, 'Parlakhemundi'),
(1066, 'Parli'),
(1067, 'Parola'),
(1068, 'Partur'),
(1069, 'Parvathipuram'),
(1070, 'Pasan'),
(1071, 'Paschim Punropara'),
(1072, 'Pasighat'),
(1073, 'Patan'),
(1074, 'Pathanamthitta'),
(1075, 'Pathankot'),
(1076, 'Pathardi'),
(1077, 'Pathri'),
(1078, 'Patiala'),
(1079, 'Patna*'),
(1080, 'Patran'),
(1081, 'Patratu'),
(1082, 'Pattamundai'),
(1083, 'Patti'),
(1084, 'Pattukkottai'),
(1085, 'Patur'),
(1086, 'Pauni'),
(1087, 'Pauri'),
(1088, 'Paavagada'),
(1089, 'Pedana'),
(1090, 'Peddapuram'),
(1091, 'Pehowa'),
(1092, 'Pen'),
(1093, 'Penuganchiprolu'),
(1094, 'Perambalur'),
(1095, 'Peravurani'),
(1096, 'Peringathur'),
(1097, 'Perinthalmanna'),
(1098, 'Periyakulam'),
(1099, 'Periyasemur'),
(1100, 'Pernampattu'),
(1101, 'Perumbavoor'),
(1102, 'Petlad'),
(1103, 'Phagwara'),
(1104, 'Phalodi'),
(1105, 'Phaltan'),
(1106, 'Phillaur'),
(1107, 'Phulabani'),
(1108, 'Phulera'),
(1109, 'Phulpur'),
(1110, 'Phusro'),
(1111, 'Pihani'),
(1112, 'Pilani'),
(1113, 'Pilibanga'),
(1114, 'Pilibhit'),
(1115, 'Pilkhuwa'),
(1116, 'Pindwara'),
(1117, 'Pinjore'),
(1118, 'Pipar City'),
(1119, 'Pipariya'),
(1120, 'Piro'),
(1121, 'Pithampur'),
(1122, 'Pithapuram'),
(1123, 'Pithoragarh'),
(1124, 'Pollachi'),
(1125, 'Polur'),
(1126, 'Pondicherry*'),
(1127, 'Ponkunnam'),
(1128, 'Ponnani'),
(1129, 'Ponneri'),
(1130, 'Ponnur'),
(1131, 'Porbandar'),
(1132, 'Porsa'),
(1133, 'Port Blair*'),
(1134, 'Powayan'),
(1135, 'Prantij'),
(1136, 'Pratapgarh'),
(1137, 'Pratapgarh'),
(1138, 'Prithvipur'),
(1139, 'Proddatur'),
(1140, 'Pudukkottai'),
(1141, 'Pudupattinam'),
(1142, 'Pukhrayan'),
(1143, 'Pulgaon'),
(1144, 'Puliyankudi'),
(1145, 'Punalur'),
(1146, 'Punch'),
(1147, 'Pune'),
(1148, 'Punjaipugalur'),
(1149, 'Punganur'),
(1150, 'Puranpur'),
(1151, 'Purna'),
(1152, 'Puri'),
(1153, 'Purnia'),
(1154, 'Purquazi'),
(1155, 'Purulia'),
(1156, 'Purwa'),
(1157, 'Pusad'),
(1158, 'Puthooru'),
(1159, 'Puthuppally'),
(1160, 'Puttur'),
(1161, 'Qadian'),
(1162, 'Quilandy'),
(1163, 'Rabakavi Banahatti'),
(1164, 'Radhanpur'),
(1165, 'Rae Bareli'),
(1166, 'Rafiganj'),
(1167, 'Raghogarh-Vijaypur'),
(1168, 'Raghunathpur'),
(1169, 'Raghunathganj'),
(1170, 'Rahatgarh'),
(1171, 'Raichuri'),
(1172, 'Raayachuru'),
(1173, 'Raiganj'),
(1174, 'Raigarh'),
(1175, 'Ranipet'),
(1176, 'Raikot'),
(1177, 'Raipur*'),
(1178, 'Rairangpur'),
(1179, 'Raisen'),
(1180, 'Raisinghnagar'),
(1181, 'Rajagangapur'),
(1182, 'Rajahmundry'),
(1183, 'Rajakhera'),
(1184, 'Rajaldesar'),
(1185, 'Rajam'),
(1186, 'Rajampet'),
(1187, 'Rajapalayam'),
(1188, 'Rajauri'),
(1189, 'Rajgarh (Alwar)'),
(1190, 'Rajgarh (Churu)'),
(1191, 'Rajgarh'),
(1192, 'Rajgir'),
(1193, 'Rajkot'),
(1194, 'Rajnandgaon'),
(1195, 'Rajpipla'),
(1196, 'Rajpura'),
(1197, 'Rajsamand'),
(1198, 'Rajula'),
(1199, 'Rajura'),
(1200, 'Ramachandrapuram'),
(1201, 'Ramagundam'),
(1202, 'Raamanagara'),
(1203, 'Ramanathapuram'),
(1204, 'Raamadurga'),
(1205, 'Rameshwaram'),
(1206, 'Ramganj Mandi'),
(1207, 'Ramngarh'),
(1208, 'Ramngarh'),
(1209, 'Ramnagar'),
(1210, 'Ramnagar'),
(1211, 'Rampur'),
(1212, 'Rampur Maniharan'),
(1213, 'Rampur Maniharan'),
(1214, 'Rampura Phul'),
(1215, 'Rampurhat'),
(1216, 'Ramtek'),
(1217, 'Ranaghat'),
(1218, 'Ranavav'),
(1219, 'Ranchi*'),
(1220, 'Rangia'),
(1221, 'Rania'),
(1222, 'Ranibennur'),
(1223, 'Rapar'),
(1224, 'Rasipuram'),
(1225, 'Rasra'),
(1226, 'Ratangarh'),
(1227, 'Rath'),
(1228, 'Ratia'),
(1229, 'Ratlam'),
(1230, 'Ratnagiri'),
(1231, 'Rau'),
(1232, 'Raurkela'),
(1233, 'Raver'),
(1234, 'Rawatbhata'),
(1235, 'Rawatsar'),
(1236, 'Raxaul Bazar'),
(1237, 'Rayachoti'),
(1238, 'Rayadurg'),
(1239, 'Rayagada'),
(1240, 'Reengus'),
(1241, 'Rehli'),
(1242, 'Renigunta'),
(1243, 'Renukoot'),
(1244, 'Reoti'),
(1245, 'Repalle'),
(1246, 'Revelganj'),
(1247, 'Rewa'),
(1248, 'Rewari'),
(1249, 'Rishikesh'),
(1250, 'Risod'),
(1251, 'Robertsganj'),
(1252, 'Robertson Pet'),
(1253, 'Rohtak'),
(1254, 'Ron'),
(1255, 'Roorkee'),
(1256, 'Rosera'),
(1257, 'Rudauli'),
(1258, 'Rudrapur'),
(1259, 'Rudrapur'),
(1260, 'Rupnagar'),
(1261, 'Sabalgarh'),
(1262, 'Sadabad'),
(1263, 'Sadalaga'),
(1264, 'Sadasivpet'),
(1265, 'Sadri'),
(1266, 'Sadulshahar'),
(1267, 'Sadulpur'),
(1268, 'Safidon'),
(1269, 'Safipur'),
(1270, 'Sagar'),
(1271, 'Sagara'),
(1272, 'Sagwara'),
(1273, 'Saharanpur'),
(1274, 'Saharsa'),
(1275, 'Sahaspur'),
(1276, 'Sahaswan'),
(1277, 'Sahawar'),
(1278, 'Sahibganj'),
(1279, 'Sahjanwa'),
(1280, 'Saidpur'),
(1281, 'Saiha'),
(1282, 'Sailu'),
(1283, 'Sainthia'),
(1284, 'Sakaleshapura'),
(1285, 'Sakti'),
(1286, 'Salaya'),
(1287, 'Salem'),
(1288, 'Salur'),
(1289, 'Samalkha'),
(1290, 'Samalkot'),
(1291, 'Samana'),
(1292, 'Samastipur'),
(1293, 'Sambalpur'),
(1294, 'Sambhal'),
(1295, 'Sambhar'),
(1296, 'Samdhan'),
(1297, 'Samthar'),
(1298, 'Sanand'),
(1299, 'Sanawad'),
(1300, 'Sanchore'),
(1301, 'Sindagi'),
(1302, 'Sandi'),
(1303, 'Sandila'),
(1304, 'Sandur'),
(1305, 'Sangamner'),
(1306, 'Sangareddy'),
(1307, 'Sangaria'),
(1308, 'Sangli'),
(1309, 'Sanle'),
(1310, 'Sangrur'),
(1311, 'Sankarankoil'),
(1312, 'Sankari'),
(1313, 'Sankeshwara'),
(1314, 'Santipur'),
(1315, 'Sarangpur'),
(1316, 'Sardarshahar'),
(1317, 'Sardhana'),
(1318, 'Sarni'),
(1319, 'Sasaram'),
(1320, 'Sasvad'),
(1321, 'Satana'),
(1322, 'Satara'),
(1323, 'Satna'),
(1324, 'Sathyamangalam'),
(1325, 'Sattenapalle'),
(1326, 'Sattur'),
(1327, 'Saunda'),
(1328, 'Soudaththi-Yellamma'),
(1329, 'Sausar'),
(1330, 'Savarkundla'),
(1331, 'Savanur'),
(1332, 'Savner'),
(1333, 'Sawai Madhopur'),
(1334, 'Sawantwadi'),
(1335, 'Sedam'),
(1336, 'Sehore'),
(1337, 'Sendhwa'),
(1338, 'Seohara'),
(1339, 'Seoni'),
(1340, 'Seoni-Malwa'),
(1341, 'Shahabad'),
(1342, 'Shahabad, Hardoi'),
(1343, 'Shahabad, Rampur'),
(1344, 'Shahade'),
(1345, 'Shahbad'),
(1346, 'Shahdol'),
(1347, 'Shahganj'),
(1348, 'Shahjahanpur'),
(1349, 'Shahapura'),
(1350, 'Shahpura'),
(1351, 'Shahpura'),
(1352, 'Shajapur'),
(1353, 'Shamgarh'),
(1354, 'Shamli'),
(1355, 'Shamsabad, Agra'),
(1356, 'Shamsabad, Farrukhabad'),
(1357, 'Shegaon'),
(1358, 'Sheikhpura'),
(1359, 'Shendurjana'),
(1360, 'Shenkottai'),
(1361, 'Sheoganj'),
(1362, 'Sheohar'),
(1363, 'Sheopur'),
(1364, 'Sherghati'),
(1365, 'Sherkot'),
(1366, 'Shiggaavi'),
(1367, 'Shikapur'),
(1368, 'Shikarpur, Bulandshahr'),
(1369, 'Shikohabad'),
(1370, 'Shillong*'),
(1371, 'Shimla*'),
(1372, 'Shivamogga'),
(1373, 'Shirdi'),
(1374, 'Shirpur-Warwade'),
(1375, 'Shirur'),
(1376, 'Shishgarh'),
(1377, 'Shivpuri'),
(1378, 'Sholavandan'),
(1379, 'Sholingur'),
(1380, 'Shoranur'),
(1381, 'Surapura'),
(1382, 'Shrinda'),
(1383, 'Shrirampur'),
(1384, 'Shree Rangapattana'),
(1385, 'Shujalpur'),
(1386, 'Siana'),
(1387, 'Sibsagar'),
(1388, 'Siddipet'),
(1389, 'Sidhi'),
(1390, 'Sidhpur'),
(1391, 'Sidhalaghatta'),
(1392, 'Sihor'),
(1393, 'Sihora'),
(1394, 'Sikanderpur'),
(1395, 'Sikandra Rao'),
(1396, 'Sikandrabad'),
(1397, 'Sikar'),
(1398, 'Silao'),
(1399, 'Silapathar'),
(1400, 'Silchar'),
(1401, 'Siliguri'),
(1402, 'Sillod'),
(1403, 'Silvassa*'),
(1404, 'Simdega'),
(1405, 'Sindhagi'),
(1406, 'Sindhanooru'),
(1407, 'Singapur'),
(1408, 'Singrauli'),
(1409, 'Sinnar'),
(1410, 'Sira'),
(1411, 'Sircilla'),
(1412, 'Sirhind Fatehgarh Sahib'),
(1413, 'Sirkali'),
(1414, 'Sirohi'),
(1415, 'Sironj'),
(1416, 'Sirsa'),
(1417, 'Sirsaganj'),
(1418, 'Sirsi'),
(1419, 'Sirsi'),
(1420, 'Sheraguppa'),
(1421, 'Sitamarhi'),
(1422, 'Sitapur'),
(1423, 'Sitarganj'),
(1424, 'Sivaganga'),
(1425, 'Sivagiri'),
(1426, 'Sivakasi'),
(1427, 'Siwan'),
(1428, 'Sohagpur'),
(1429, 'Sohna'),
(1430, 'Sojat'),
(1431, 'Solan'),
(1432, 'Solapur'),
(1433, 'Sonamukhi'),
(1434, 'Sonepur'),
(1435, 'Songadh'),
(1436, 'Sonipat'),
(1437, 'Sopore'),
(1438, 'Soro'),
(1439, 'Soron'),
(1440, 'Soyagaon'),
(1441, 'Sri Madhopur'),
(1442, 'Srikakulam'),
(1443, 'Srikalahasti'),
(1444, 'Srinagar*'),
(1445, 'Shreenivaasapura'),
(1446, 'Srisailam Project (Right Flank Colony) Township'),
(1447, 'Srirampore'),
(1448, 'Srivilliputhur'),
(1449, 'Suar'),
(1450, 'Sugauli'),
(1451, 'Sujangarh'),
(1452, 'Sujanpur'),
(1453, 'Sultanganj'),
(1454, 'Sultanpur'),
(1455, 'Sumerpur'),
(1456, 'Sumerpur'),
(1457, 'Sunabeda'),
(1458, 'Sunam'),
(1459, 'Sundargarh'),
(1460, 'Sundarnagar'),
(1461, 'Supaul'),
(1462, 'Surandai'),
(1463, 'Surat'),
(1464, 'Suratgarh'),
(1465, 'Suri'),
(1466, 'Suriyampalayam'),
(1467, 'Suryapet'),
(1468, 'Tadepalligudem'),
(1469, 'Tadpatri'),
(1470, 'Taki'),
(1471, 'Talaja'),
(1472, 'Talcher'),
(1473, 'Talegaon Dabhade'),
(1474, 'Thaalikote'),
(1475, 'Taliparamba'),
(1476, 'Talode'),
(1477, 'Talwara'),
(1478, 'Tamluk'),
(1479, 'Tanda'),
(1480, 'Tanda'),
(1481, 'Tandur'),
(1482, 'Tanuku'),
(1483, 'Tarakeswar'),
(1484, 'Tarana'),
(1485, 'Taranagar'),
(1486, 'Taraori'),
(1487, 'Tarbha'),
(1488, 'Tarikere'),
(1489, 'Tarn Taran'),
(1490, 'Tasgaon'),
(1491, 'Tehri'),
(1492, 'Tekkalakote'),
(1493, 'Tenali'),
(1494, 'Tenkasi'),
(1495, 'Tenu Dam-cum-Kathhara'),
(1496, 'Thergallu'),
(1497, 'Tetri Bazar'),
(1498, 'Tezpur'),
(1499, 'Thakurdwara'),
(1500, 'Thammampatti'),
(1501, 'Thana Bhawan'),
(1502, 'Thane'),
(1503, 'Thanesar'),
(1504, 'Thangadh'),
(1505, 'Thanjavur'),
(1506, 'Tharad'),
(1507, 'Tharamangalam'),
(1508, 'Tharangambadi'),
(1509, 'Theni Allinagaram'),
(1510, 'Thirumangalam'),
(1511, 'Thirunindravur'),
(1512, 'Thiruparappu'),
(1513, 'Thirupuvanam'),
(1514, 'Thiruthuraipoondi'),
(1515, 'Thiruvalla'),
(1516, 'Thiruvallur'),
(1517, 'Trivandrum'),
(1518, 'Thiruvarur'),
(1519, 'Thodupuzha'),
(1520, 'Thoothukudi'),
(1521, 'Thoubal'),
(1522, 'Thrissur'),
(1523, 'Thuraiyur'),
(1524, 'Tikamgarh'),
(1525, 'Tikota'),
(1526, 'Tilda Newra'),
(1527, 'Tilhar'),
(1528, 'Talikota'),
(1529, 'Tindivanam'),
(1530, 'Tinsukia'),
(1531, 'Thipatooru'),
(1532, 'Tirora'),
(1533, 'Tiruchendur'),
(1534, 'Tiruchende'),
(1535, 'Tiruchirappalli'),
(1536, 'Tirukalukundram'),
(1537, 'Tirukkoyilur'),
(1538, 'Tirunelveli'),
(1539, 'Tirupathur'),
(1540, 'Tirupathur'),
(1541, 'Tirupati'),
(1542, 'Tiruppur'),
(1543, 'Tirur'),
(1544, 'Tiruttani'),
(1545, 'Tiruvannamalai'),
(1546, 'Tiruvethipuram'),
(1547, 'Tiruvuru'),
(1548, 'Tirwaganj'),
(1549, 'Titlagarh'),
(1550, 'Tittakudi'),
(1551, 'Todabhim'),
(1552, 'Todaraisingh'),
(1553, 'Tohana'),
(1554, 'Tonk'),
(1555, 'Tuensang'),
(1556, 'Tuljapur'),
(1557, 'Tulsipur'),
(1558, 'Thumakooru'),
(1559, 'Tumsar'),
(1560, 'Tundla'),
(1561, 'Tuni'),
(1562, 'Tura'),
(1563, 'Uchgaon'),
(1564, 'Udaipur'),
(1565, 'Udaipur'),
(1566, 'Udaipurwati'),
(1567, 'Udgir'),
(1568, 'Udhagamandalam'),
(1569, 'Udhampur'),
(1570, 'Udumalaipettai'),
(1571, 'Udupi'),
(1572, 'Ugar'),
(1573, 'Ujhani'),
(1574, 'Ujjain'),
(1575, 'Umarga'),
(1576, 'Umaria'),
(1577, 'Umarkhed'),
(1578, 'Umarkote'),
(1579, 'Umbergaon'),
(1580, 'Umred'),
(1581, 'Umreth'),
(1582, 'Una'),
(1583, 'Unjha'),
(1584, 'Unnamalaikadai'),
(1585, 'Unnao'),
(1586, 'Upleta'),
(1587, 'Uran'),
(1588, 'Uran Islampur'),
(1589, 'Uravakonda'),
(1590, 'Urmar Tanda'),
(1591, 'Usilampatti'),
(1592, 'Uthamapalayam'),
(1593, 'Uthiramerur'),
(1594, 'Utraula'),
(1595, 'Vadakara'),
(1596, 'Vadakkuvalliyur'),
(1597, 'Vadalur'),
(1598, 'Vadgaon Kasba'),
(1599, 'Vadipatti'),
(1600, 'Vadnagar'),
(1601, 'Vadodara'),
(1602, 'Vaijapur'),
(1603, 'Vaikom'),
(1604, 'Valparai'),
(1605, 'Valsad'),
(1606, 'Vandavasi'),
(1607, 'Vaniyambadi'),
(1608, 'Vapi'),
(1609, 'Vapi'),
(1610, 'Varanasi'),
(1611, 'Varkala'),
(1612, 'Vasai'),
(1613, 'Vedaranyam'),
(1614, 'Vellakoil'),
(1615, 'Vellore'),
(1616, 'Venkatagiri'),
(1617, 'Veraval'),
(1618, 'Vicarabad'),
(1619, 'Vidisha'),
(1620, 'Vijainagar'),
(1621, 'Vijapur'),
(1622, 'Vijaypur'),
(1623, 'Vijayapura'),
(1624, 'Vijayawada'),
(1625, 'Vikramasingapuram'),
(1626, 'Viluppuram'),
(1627, 'Vinukonda'),
(1628, 'Viramgam'),
(1629, 'Virar'),
(1630, 'Virudhachalam'),
(1631, 'Virudhunagar'),
(1632, 'Visakhapatnam'),
(1633, 'Visnagar'),
(1634, 'Viswanatham'),
(1635, 'Vita'),
(1636, 'Vizianagaram'),
(1637, 'Vrindavan'),
(1638, 'Vyara'),
(1639, 'Wadgaon Road'),
(1640, 'Wadhwan'),
(1641, 'Wadi'),
(1642, 'Wai'),
(1643, 'Wanaparthy'),
(1644, 'Wani'),
(1645, 'Wankaner'),
(1646, 'Wara Seoni'),
(1647, 'Warangal'),
(1648, 'Wardha'),
(1649, 'Warhapur'),
(1650, 'Warisaliganj'),
(1651, 'Warora'),
(1652, 'Warud'),
(1653, 'Washim'),
(1654, 'Wokha'),
(1655, 'Yaadhagiri'),
(1656, 'Yamunanagar'),
(1657, 'Yanam'),
(1658, 'Yavatmal'),
(1659, 'Yawal'),
(1660, 'Yellandu'),
(1661, 'Yemmiganur'),
(1662, 'Yerraguntla'),
(1663, 'Yevla'),
(1664, 'Zaid'),
(1665, 'Zamania'),
(1666, 'Zira'),
(1667, 'Zirakpur'),
(1668, 'Zunheboto');

-- --------------------------------------------------------

--
-- Table structure for table `tbledmitracourses`
--

CREATE TABLE `tbledmitracourses` (
  `intId` bigint(20) NOT NULL,
  `varCourses` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbledmitracourses`
--

INSERT INTO `tbledmitracourses` (`intId`, `varCourses`) VALUES
(1, 'B.Sc – Animation'),
(2, 'B.Sc - Game Art'),
(3, 'B.Sc – Multimedia'),
(4, 'B.Sc - Visual Effects'),
(5, 'BA - D Animation'),
(6, 'BA – Animation'),
(7, 'BA - Digital Film Making'),
(8, 'BA - Visual Effects'),
(9, 'Bachelors In D Animation'),
(10, 'Bachelors in Visual Effects'),
(11, 'Diploma In D Animation'),
(12, 'Diploma in Animation'),
(13, 'Diploma in Broadcast'),
(14, 'Diploma in Print'),
(15, 'Diploma in Visual Effects'),
(16, 'M.Sc – Animation'),
(17, 'M.Sc - Film Post Production'),
(18, 'M.Sc – Multimedia'),
(19, 'M.Sc - Visual Effects'),
(20, 'PG Diploma in Animation'),
(21, 'PG Diploma in Graphic Designing'),
(22, 'PG Diploma in Visual Communications'),
(23, '2D Animation'),
(24, '3D Animation'),
(25, '2D Animation (Basic)'),
(26, '3D Animation (Maya)'),
(27, 'Action Scripting'),
(28, 'Audio Editing'),
(29, 'Audio-Video Editing'),
(30, 'Audio-Video Post Production'),
(31, 'Authoring TBT'),
(32, 'CAD'),
(33, 'Character Animation (Motion Builder)'),
(34, 'Character Design'),
(35, 'Digital Architecture'),
(36, 'Digital Design Visualization & Walkthrough'),
(37, 'Digital Film Making'),
(38, 'Digital FX'),
(39, 'Digital Graphics & Animation'),
(40, 'Drawing & Animation (ToonBoom)'),
(41, 'Final Cut Pro (FCP)'),
(42, 'Game Art (Core)'),
(43, 'Game Art (Professional)'),
(44, 'Game Design'),
(45, 'Game Programming (Flash)'),
(46, 'Game Programming (Mobile)'),
(47, 'Games Development'),
(48, 'Graphic Designing'),
(49, 'Graphics & Sketching'),
(50, 'Illustrations'),
(51, 'Image Magic'),
(52, 'Interior Design'),
(53, 'Max Pro'),
(54, 'Media Publishing'),
(55, 'Multimedia Authoring'),
(56, 'Multimedia Programming'),
(57, 'Photoshop'),
(58, 'Print & Publishing'),
(59, 'Video Streaming & Editing'),
(60, 'Visual Effects'),
(61, 'Visual Effects (NUKE)'),
(62, 'Web Animation (Flash)'),
(63, 'Web Designing'),
(64, 'Web Graphics'),
(65, 'Webweaver'),
(66, 'Comic Character design'),
(67, 'Mobile Game Art (Core)'),
(68, 'Mobile Game Art (Professional)'),
(69, 'Mobile Game Design'),
(70, 'Mobile Flash Game Programming'),
(71, 'Mobile Game Programming'),
(72, 'Mobile Games Development'),
(73, 'Comic Sketching'),
(74, 'Comic Illustrations'),
(75, 'Image Magic - Comic Design'),
(76, 'Chinese/Mandarin Language Certificate Course'),
(77, 'German Language Certificate Course'),
(78, 'French Language Certificate Course'),
(79, 'Spanish Language Certicate Course'),
(80, 'Japanese Language Certificate Course'),
(81, 'B.A. (Languages)'),
(82, 'M.A. (Languages)'),
(83, 'Spoken English for Call Centre & BPO'),
(84, 'Public Speaking - Call Centre & BPO Training'),
(85, 'Call Centre Training'),
(86, 'Voice and Accent Training'),
(87, 'Call Centre Certificate Program'),
(88, 'B.A.'),
(89, 'Distance B.A.'),
(90, 'Diploma in Music'),
(91, 'Diploma in Drawing/Painting'),
(92, 'Diploma in Dance'),
(93, 'Diploma in Creative Writing'),
(94, 'Diploma in Calligraphy'),
(95, 'Diploma in Fine Arts'),
(96, 'B.A. in Music'),
(97, 'B.A. in Dance'),
(98, 'B.A. in Drawing/Painting'),
(99, 'B.A. in Fine Arts'),
(100, 'B.Ed.'),
(101, 'Diploma in Teaching'),
(102, 'B.A. in Political Science'),
(103, 'B.A Sociology'),
(104, 'B.A. Social Science'),
(105, 'Bachelors in Social Work'),
(106, 'B.A. History'),
(107, 'B.A. Economics'),
(108, 'B. Lib'),
(109, 'B.A. LL.B. (Hons)'),
(110, 'BBA LL.B. (Hons)'),
(112, 'M.A.'),
(113, '.NET'),
(114, 'A+'),
(115, 'ACCA'),
(116, 'ACHNP'),
(117, 'Acturial Science'),
(118, 'Administrator'),
(119, 'Adobe Flex'),
(120, 'Advance Diploma in Management'),
(121, 'Advanced Certificate in Beauty Culture'),
(122, 'Advanced Certificate in Hair Designing'),
(123, 'Advanced Diploma in Cosmetology'),
(124, 'Advanced Diploma in Hotel Management ( 3Years)'),
(125, 'Advanced Technical Courses'),
(126, 'AIIMS'),
(127, 'AILET'),
(128, 'AIMS'),
(129, 'AIPGDET'),
(130, 'AIPGMEE'),
(131, 'AIPGMET'),
(132, 'AIPMT'),
(133, 'AIPMT'),
(134, 'AIPVT'),
(135, 'Aircraft Maintenance Engineering'),
(136, 'Aircraft Maintenance Engineering'),
(137, 'Airport Handling'),
(138, 'AJAX'),
(139, 'AMU'),
(140, 'AMUPMDC'),
(141, 'Android'),
(142, 'APMG'),
(143, 'Architecture'),
(144, 'ASP.NET'),
(145, 'ATIT'),
(146, 'AU AIMEE'),
(147, 'Autodesk MAYA'),
(148, 'Autodesk Revit'),
(149, 'B.Com'),
(150, 'B.E. Marine Engineering'),
(151, 'B.E./B.Tech'),
(152, 'B.Pharma'),
(153, 'B.Pharma'),
(154, 'B.Sc'),
(155, 'B.Sc - Electronic Media'),
(156, 'B.Sc - Hotel Management'),
(157, 'B.Sc - International Hospitality Administration'),
(158, 'B.Sc - Mass Communication'),
(159, 'B.Sc - Medical Lab Technology'),
(160, 'B.Sc – Multimedia'),
(161, 'B.Sc - Telecom Management'),
(162, 'B.Sc – Toursim'),
(163, 'B.Sc CS'),
(164, 'B.Sc IT'),
(165, 'B.Sc Microbiology'),
(166, 'B.Sc Nursing'),
(167, 'B.Sc/B.Des - Accessory Design'),
(168, 'B.Sc/B.Des - Fashion Design'),
(169, 'B.Sc/B.Des - Jewellery Design'),
(170, 'B.Sc/B.Des - Knitwear Design'),
(171, 'B.Sc/B.Des - Leather Design'),
(172, 'B.Sc/B.Des - Textile Design'),
(173, 'B.Sc/B.Des -Interior Design'),
(174, 'BA - International Culinary Management'),
(175, 'BA – Tourism'),
(176, 'BA - Tourism Studies (BTS)'),
(177, 'Bachelor in Alternate Medicine'),
(178, 'Bachelor in Catering Technology'),
(179, 'Bachelor in Hotel Management (BHM)'),
(180, 'Bachelors in Apparel Production'),
(181, 'Bachelors in Fashion Communication'),
(182, 'Bachelors in Fashion Technology'),
(183, 'Bachelors in Journalism (BJ)'),
(184, 'Bachelors in Merchandising'),
(185, 'Bachelors in Public Health'),
(186, 'BankPO'),
(187, 'BBA – Aviation'),
(188, 'BBA - Hospitality Management'),
(189, 'BBA - Hotel Management'),
(190, 'BBA - Travel & Tourism Management'),
(191, 'BBA/BBM'),
(192, 'BCA'),
(193, 'BCC'),
(194, 'BDS'),
(195, 'BHUMEE'),
(196, 'Biotechnology'),
(197, 'BITSAT'),
(198, 'Blackberry'),
(199, 'BLDEUGET'),
(200, 'BPOE'),
(201, 'BPT (Bachelor in Physiotherapy)'),
(202, 'BSCC'),
(203, 'BVUMEE'),
(204, 'C'),
(205, 'C++'),
(206, 'CA CPT'),
(207, 'CA Final'),
(208, 'CA GMC'),
(209, 'CA IPCC'),
(210, 'CA PCE'),
(211, 'CAD/CAM'),
(212, 'Camera & Lighting'),
(213, 'CCDA'),
(214, 'CCDE'),
(215, 'CCDP'),
(216, 'CCENT'),
(217, 'CCIE'),
(218, 'CCIE Security'),
(219, 'CCIE Service Provider'),
(220, 'CCIE Storage Networking'),
(221, 'CCIE Voice'),
(222, 'CCIE Wireless'),
(223, 'CCIP'),
(224, 'CCNA'),
(225, 'CCNA Security'),
(226, 'CCNA Voice'),
(227, 'CCNA Wireless'),
(228, 'CCNP'),
(229, 'CCSP'),
(230, 'CCVP'),
(231, 'Certificate Course in Beauty Culture'),
(232, 'Certificate Course in Hair Dressing'),
(233, 'Certificate Course in Spa Therapies'),
(234, 'Certificate in Accessory Design    '),
(235, 'Certificate in Apparel Design'),
(236, 'Certificate in Capital Market'),
(237, 'Certificate in Ceramic & Glass Design'),
(238, 'Certificate in Clinical Biochemistry'),
(239, 'Certificate in Clinical Research (Nurses)'),
(240, 'Certificate in Dance'),
(241, 'Certificate in Drawing/Painting'),
(242, 'Certificate in Finance'),
(243, 'Certificate in Financial Planning'),
(244, 'Certificate in Industrial Design'),
(245, 'Certificate in Information & Interface Design'),
(246, 'Certificate in Jewellery Design'),
(247, 'Certificate in Music'),
(248, 'Certificate in Ophthalmic Assistance'),
(249, 'Certificate in Photography'),
(250, 'Certificate in Product Design'),
(251, 'Certificate in Public Health'),
(252, 'Certificate in Textile Design'),
(253, 'Certificate in Transportation  & Automobile Design'),
(254, 'Certifications'),
(255, 'Certifications'),
(256, 'Certified Ethical Hacker'),
(257, 'Certified Financial Planner (CFP)'),
(258, 'Certified Industrial Accounting (CIA)'),
(259, 'CETK'),
(260, 'CETPPMC'),
(261, 'CFA'),
(262, 'CFA, CPA, CIMA'),
(263, 'CGPET'),
(264, 'CHFI'),
(265, 'Chip Level Repair Course'),
(266, 'CIMA'),
(267, 'CLAT'),
(268, 'Clinical Psychology'),
(269, 'Cloud Computing'),
(270, 'CMCLET'),
(271, 'COMEDK'),
(272, 'Commercial Pilot License'),
(273, 'Communication'),
(274, 'CPA'),
(275, 'CS – Final'),
(276, 'CS - Foundation'),
(277, 'CS - Intermediate'),
(278, 'CTET'),
(279, 'Customer Service Skills'),
(280, 'Cyber Security/IT Security – CCIE'),
(281, 'Cyber Security/IT Security - CCIE Security'),
(282, 'Cyber Security/IT Security – CCNA'),
(283, 'Data Warehousing'),
(284, 'Database Management'),
(285, 'DB2'),
(286, 'DBA'),
(287, 'DCEEE'),
(288, 'DDYP'),
(289, 'Delcam'),
(290, 'Design'),
(291, 'Diploma'),
(292, 'Diploma in Accessory Design'),
(293, 'Diploma in Accounting & Taxation'),
(294, 'Diploma in Acting for TV/Movies'),
(295, 'Diploma in Advertising & PR Post Graduation Courses'),
(296, 'Diploma in Apparel Design'),
(297, 'Diploma in Automotive Design'),
(298, 'Diploma in Banking & Finance'),
(299, 'Diploma in Beauty Culture'),
(300, 'Diploma in Broadcast Journalism'),
(301, 'Diploma in Cabin Crew Training'),
(302, 'Diploma in Camera & Lighting'),
(303, 'Diploma in Ceramic & Glass Design'),
(304, 'Diploma in Cosmetology'),
(305, 'Diploma in Dance'),
(306, 'Diploma in Dietics, Health and Nutrition'),
(307, 'Diploma in Event Management'),
(308, 'Diploma in Event Management'),
(309, 'Diploma in Event Management'),
(310, 'Diploma in Fashion Design'),
(311, 'Diploma in Film & TV Direction'),
(312, 'Diploma in Film & TV Production'),
(313, 'Diploma in Finance'),
(314, 'Diploma in Financial Planning'),
(315, 'Diploma in Food & Beverage'),
(316, 'Diploma in Front Office'),
(317, 'Diploma in Front Office Management'),
(318, 'Diploma in Hair Dressing'),
(319, 'Diploma in Hospitality Management'),
(320, 'Diploma in Hotel Management'),
(321, 'Diploma in House Keeping Services'),
(322, 'Diploma in Industrial Design'),
(323, 'Diploma in Information & Interface Design'),
(324, 'Diploma in Insurance & Risk Management'),
(325, 'Diploma in Interior Design'),
(326, 'Diploma in International Banking & Finance'),
(327, 'Diploma in Inventory Management'),
(328, 'Diploma in Jewellery Design'),
(329, 'Diploma in Journalism'),
(330, 'Diploma in Makeup'),
(331, 'Diploma in Management'),
(332, 'Diploma in Media Management'),
(333, 'Diploma in Merchandising'),
(334, 'Diploma in Merchandising'),
(335, 'Diploma in Modelling'),
(336, 'Diploma in News/Programme Anchoring'),
(337, 'Diploma in Ophthalmic Assistance'),
(338, 'Diploma in Optometry/Ophthalmic Technology'),
(339, 'Diploma in Photography'),
(340, 'Diploma in Post Production'),
(341, 'Diploma in Product Design'),
(342, 'Diploma in Quality Management'),
(343, 'Diploma in Radio Jockeying'),
(344, 'Diploma in Radio Programming & Production'),
(345, 'Diploma in Retail Management'),
(346, 'Diploma in Screenplay & Script Writing'),
(347, 'Diploma in Shop Floor Management'),
(348, 'Diploma in Store Management'),
(349, 'Diploma in Supply Chain Management'),
(350, 'Diploma in Textile Design'),
(351, 'Diploma in Tourism Business Management'),
(352, 'Diploma in Transportation  & Automobile Design'),
(353, 'Diploma in Travel & Tourism Management'),
(354, 'Diploma in Treasury Investment'),
(355, 'Diploma in Visual Communication'),
(356, 'Diploma in Vocal Music'),
(357, 'Distance B.Sc'),
(358, 'Distance B.Tech'),
(359, 'Distance BCA'),
(360, 'Distance Certification in Health and Nutrition'),
(361, 'Distance Diploma'),
(362, 'Distance M.A.'),
(363, 'Distance M.Phil.'),
(364, 'Distance M.Sc'),
(365, 'Distance MCA'),
(366, 'Distance/Correspondence MBA'),
(367, 'DOEACC `A` Level Course'),
(368, 'DOEACC `B` Level Course'),
(369, 'DOEACC `C` Level Course'),
(370, 'DOEACC `O` Level Course'),
(371, 'DOEACC Courses'),
(372, 'DUMET'),
(373, 'DUMET'),
(374, 'DUPGMET'),
(375, 'DUSET'),
(376, 'EAMCET'),
(377, 'ECNSA - EC Council Network Security'),
(378, 'ECSA - EC Council Certified Security Analyst'),
(379, 'ECSP - EC Council Certified Secure Programmer'),
(380, 'EJB'),
(381, 'Embedded Systems'),
(382, 'EMT-CET'),
(383, 'Ethical Hacking'),
(384, 'Event Management'),
(385, 'Executive MBA'),
(386, 'Executive MBA - Hospitality Management'),
(387, 'Facility Management'),
(388, 'Full Time MBA/PGDM'),
(389, 'Galileo CRS'),
(390, 'Game design – Maya'),
(391, 'Game design – Revit'),
(392, 'GATE'),
(393, 'General Insurance Agents License Renewal Course'),
(394, 'General Insurance Agents Pre-licensing Course'),
(395, 'Government Exams'),
(396, 'Graduation Courses'),
(397, 'Graduation Courses'),
(398, 'Graduation Courses'),
(399, 'GUJCET'),
(400, 'Hibernate'),
(401, 'Hospitality Operations'),
(402, 'Hotel Management'),
(403, 'House Keeping'),
(404, 'HPMT'),
(405, 'IAICET'),
(406, 'IATA BSP System & BSP Language Other Certifications'),
(407, 'IATA Diploma in Aviation & Travel Industry'),
(408, 'IATA GDS Fares & Ticketing'),
(409, 'IATA/DGCA Dangerous Goods Regulation-Basic'),
(410, 'IATA/DGCA Dangerous Goods Regulation-Refresher'),
(411, 'IATA/FIATA Cargo Introductory Course'),
(412, 'IATA/UFTAA Cargo Rating'),
(413, 'IATA/UFTAA Consultant Course'),
(414, 'IATA/UFTAA Foundation Course'),
(415, 'IBM AS/400'),
(416, 'IBM MainFrame'),
(417, 'ICWAI – Final'),
(418, 'ICWAI – Foundation'),
(419, 'ICWAI – Intermediate'),
(420, 'IEEE Projects'),
(421, 'ILICAT'),
(422, 'ILSAT'),
(423, 'Integrated (B.Tech + MBA)'),
(424, 'Integrated (B.Tech + MBA)</option>'),
(425, 'Integrated (BBA  + MBA)'),
(426, 'International Tourism Specialist Training'),
(427, 'iPhone'),
(428, 'ITIL'),
(429, 'Itinerary Planning'),
(430, 'Java'),
(431, 'Javascript'),
(432, 'JDE'),
(433, 'JEE - Advanced Java'),
(434, 'JEE Advanced'),
(435, 'JEE Mains'),
(436, 'JIPMER'),
(437, 'JSE - Core Java'),
(438, 'JSF'),
(439, 'KCET'),
(440, 'KEAM'),
(441, 'KL'),
(442, 'KLEE'),
(443, 'KLEPGAIET'),
(444, 'KLEUGAIET'),
(445, 'KLSAT'),
(446, 'LAMP Pro'),
(447, 'LAWCET'),
(448, 'Life Insurance Agent''s License Renewal Course'),
(449, 'Life Insurance Agent''s Pre-licensing Course'),
(450, 'Linux'),
(451, 'M.A Sociology'),
(452, 'M.A. - Mass Communication'),
(453, 'M.A. Economics'),
(454, 'M.A. History'),
(455, 'M.A. in Political Science'),
(456, 'M.A. in Public Administration'),
(457, 'M.A. Social Science'),
(458, 'M.Com'),
(459, 'M.E. Marine Engineering'),
(460, 'M.E./M.Tech'),
(461, 'M.Ed.'),
(462, 'M.Lib'),
(463, 'M.Pharma'),
(464, 'M.Pharma - Clinical Research'),
(465, 'M.Phil in Management'),
(466, 'M.Phil.'),
(467, 'M.Sc'),
(468, 'M.Sc - Clinical Research ( 1 Year)'),
(469, 'M.Sc - Clinical Research ( 2 Years)'),
(470, 'M.Sc - Clinical Research Management'),
(471, 'M.Sc - Mass Communication'),
(472, 'M.Sc - Medical Lab Technology'),
(473, 'M.Sc - Telecom Management'),
(474, 'M.Sc CS'),
(475, 'M.Sc IT'),
(476, 'M.Sc Microbiology'),
(477, 'M.Sc Nursing'),
(478, 'MANIPAL – ENAT'),
(479, 'Master CAM'),
(480, 'Master in Alternate Medicine'),
(481, 'Masters in Design'),
(482, 'Masters in Fashion Management'),
(483, 'Masters in Fashion Technology'),
(484, 'Masters in Merchandising'),
(485, 'Masters in Public Health'),
(486, 'Masters in Social Work'),
(487, 'Masters Program in Government'),
(488, 'MBA - Aviation IATA/UFTAA/DGCA/FIATA Approved Certifications'),
(489, 'MBA - Banking & Finance'),
(490, 'MBA - Healthcare Management'),
(491, 'MBA - Hospitality Management'),
(492, 'MBA - Hotel Management'),
(493, 'MBA - Media Management'),
(494, 'MBBS'),
(495, 'MCA'),
(496, 'MCDBA'),
(497, 'MCDST'),
(498, 'MCITP'),
(499, 'MCP'),
(500, 'MCPD'),
(501, 'MCSA'),
(502, 'MCSEMOS'),
(503, 'MCTS'),
(504, 'MDPG Diploma in Medical Transcription'),
(505, 'MDS'),
(506, 'MGDCHJET'),
(507, 'MGIMS'),
(508, 'MGPGIPGDEE'),
(509, 'MHCET'),
(510, 'MHPG'),
(511, 'MHSSET'),
(512, 'Microsoft Certifications'),
(513, 'Middleware Technologies'),
(514, 'Mobile Applications'),
(515, 'MPDMAT'),
(516, 'MPGDCET'),
(517, 'MPMT'),
(518, 'MPMT'),
(519, 'MPPEPT'),
(520, 'MPT (Master in Physiotherapy)'),
(521, 'MS BI SSAS'),
(522, 'MS BI SSIS'),
(523, 'MS BI SSRS'),
(524, 'MS Biz Talk Server'),
(525, 'MS Exchange'),
(526, 'MS Office'),
(527, 'MS Project'),
(528, 'N+'),
(529, 'NEET'),
(530, 'NET'),
(531, 'Networking'),
(532, 'Non Linear Editing (NLE)'),
(533, 'OCA'),
(534, 'OCP'),
(535, 'Oncology Clinical Trials Training'),
(536, 'Online MBA'),
(537, 'Oracle/DB'),
(538, 'Part-time MBA'),
(539, 'PCPMT'),
(540, 'Perl'),
(541, 'Personality Development'),
(542, 'PG Certificate in Automotive Design'),
(543, 'PG Certificate in Clinical Research (Nurses)'),
(544, 'PG Diploma - Regulatory Affairs & Transcription'),
(545, 'PG Diploma in Accessory Design'),
(546, 'PG Diploma in Accounting & Taxation'),
(547, 'PG Diploma in Advanced Clinical Research'),
(548, 'PG Diploma in Advertising & PR'),
(549, 'PG Diploma in Analytical & Molecular Techniques'),
(550, 'PG Diploma in Apparel Design'),
(551, 'PG Diploma in Automotive Design'),
(552, 'PG Diploma in Banking'),
(553, 'PG Diploma in Banking & Finance'),
(554, 'PG Diploma in Banking Operations'),
(555, 'PG Diploma in Broadcast Journalism'),
(556, 'PG Diploma in Ceramic & Glass Design'),
(557, 'PG Diploma in Clinical Data Management'),
(558, 'PG Diploma in Clinical Research'),
(559, 'PG Diploma in Clinical Research in Business Development'),
(560, 'PG Diploma in Clinical Trial Management'),
(561, 'PG Diploma in Event Management'),
(562, 'PG Diploma in Event Management'),
(563, 'PG Diploma in Facility Management'),
(564, 'PG Diploma in Finance'),
(565, 'PG Diploma in Financial Planning'),
(566, 'PG Diploma in Financial Planning & Management'),
(567, 'PG Diploma in Front Office Management'),
(568, 'PG Diploma in Hospitality Management'),
(569, 'PG Diploma in Hospitality Operations Management'),
(570, 'PG Diploma in Industrial Design'),
(571, 'PG Diploma in Information & Interface Design'),
(572, 'PG Diploma in Insurance & Risk Management'),
(573, 'PG Diploma in International Banking & Finance'),
(574, 'PG Diploma in Inventory Management'),
(575, 'PG Diploma in Investment Banking'),
(576, 'PG Diploma in Jewellery Design'),
(577, 'PG Diploma in Journalism'),
(578, 'PG Diploma in Mass Communication'),
(579, 'PG Diploma in Merchandising'),
(580, 'PG Diploma in NGO Management'),
(581, 'PG Diploma in Pharmacovigilance'),
(582, 'PG Diploma in Photography'),
(583, 'PG Diploma in Print Journalism'),
(584, 'PG Diploma in Product Design'),
(585, 'PG Diploma in Public Health'),
(586, 'PG Diploma in Public Relations'),
(587, 'PG Diploma in Quality'),
(588, 'PG Diploma in Regulatory Affairs'),
(589, 'PG Diploma in Retail Management'),
(590, 'PG Diploma in Securities & Trading'),
(591, 'PG Diploma in Shop Floor Management'),
(592, 'PG Diploma in Store Management'),
(593, 'PG Diploma in Supply Chain Management'),
(594, 'PG Diploma in Teaching'),
(595, 'PG Diploma in Textile Design'),
(596, 'PG Diploma in Tourism Management (PGDTM)'),
(597, 'PG Diploma in Transportation  &  Automobile Design'),
(598, 'PG Diploma in Travel & Tourism Management'),
(599, 'PG Diploma in Treasury Investment'),
(600, 'PG Diploma in TV Journalism'),
(601, 'PG Diploma in Wealth Management'),
(602, 'PG Diploma in Wealth Management & Finance'),
(603, 'PGIMER'),
(604, 'PhD'),
(605, 'Phd'),
(606, 'PhD / Fellow Programme in Management'),
(607, 'PHP'),
(608, 'Pilot Training'),
(609, 'PIMS'),
(610, 'PL/SQL'),
(611, 'PLC Designing'),
(612, 'PMET'),
(613, 'PMP Certification'),
(614, 'Post Graduate Diploma in Cosmetology'),
(615, 'Post Graduation Courses'),
(616, 'Post Graduation Courses'),
(617, 'Primavera'),
(618, 'Prince  Certification'),
(619, 'Pro/E'),
(620, 'Professional Diploma in Clinical Research'),
(621, 'Project Management'),
(622, 'Public Relations'),
(623, 'Python'),
(624, 'Real Time Projects'),
(625, 'Red Hat Certifications'),
(626, 'REXX MQ Series'),
(627, 'RHCA'),
(628, 'RHCDS'),
(629, 'RHCE'),
(630, 'RHCSS'),
(631, 'RHCT'),
(632, 'Robotics Training'),
(633, 'ROR - Ruby On Rails'),
(634, 'RPMT'),
(635, 'RULETSET'),
(636, 'SAN Certified Data Warehousing'),
(637, 'SAN Certified Database Management'),
(638, 'SAN Certified DB2'),
(639, 'SAN Certified DBA'),
(640, 'SAP/ERP'),
(641, 'SAS'),
(642, 'SBVUMCET'),
(643, 'SCJA'),
(644, 'SCJD'),
(645, 'SCJP'),
(646, 'SCWCD'),
(647, 'Share Point'),
(648, 'Shell Scripting'),
(649, 'Six Sigma Certification'),
(650, 'Software Testing'),
(651, 'Sound Recording & Editing'),
(652, 'Spring'),
(653, 'SRMEEE'),
(654, 'SRMMEE'),
(655, 'SSC'),
(656, 'SSC - Staff Selection Commissi'),
(657, 'Struts'),
(658, 'Sun Java'),
(659, 'SVULAWCET'),
(660, 'Symbian'),
(661, 'Synon'),
(662, 'Tally'),
(663, 'Technical Writing'),
(664, 'TISSUPSC-(IAS)'),
(665, 'TNEA'),
(666, 'Tour Management'),
(667, 'Tour Operation'),
(668, 'Travel & Tourism'),
(669, 'UG Certificate in Automotive Design'),
(670, 'Unigraphic'),
(671, 'UPCAT'),
(672, 'UPCMET'),
(673, 'UPCPMT'),
(674, 'UPMT'),
(675, 'UPPGMEE'),
(676, 'UPSC'),
(677, 'UPSE'),
(678, 'VB / VB.NET'),
(679, 'VC++'),
(680, 'VITEEE'),
(681, 'VLSI Design'),
(682, 'VMUAICEE'),
(683, 'WBCSE'),
(684, 'WBJEE'),
(685, 'Web Application Cisco Certifications'),
(686, 'Web Game Design');

-- --------------------------------------------------------

--
-- Table structure for table `tbledmitrastate`
--

CREATE TABLE `tbledmitrastate` (
  `intState` bigint(20) DEFAULT NULL,
  `varState` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbledmitrastate`
--

INSERT INTO `tbledmitrastate` (`intState`, `varState`) VALUES
(0, '-- Select State --'),
(1, 'Andhra Pradesh'),
(2, 'Arunachal Pradesh'),
(3, 'Assam'),
(4, 'Bihar'),
(5, 'Chattisgardh'),
(7, 'Gujarat'),
(8, 'Haryana'),
(9, 'Himachal Pradesh'),
(10, 'Jammu and Kashmir'),
(11, 'Jharkhand'),
(12, 'Karnataka'),
(13, 'Kerala'),
(14, 'Madhya Pradesh'),
(15, 'Maharashtra'),
(16, 'Manipur'),
(17, 'Meghalaya'),
(18, 'Mizoram'),
(19, 'Nagaland'),
(20, 'Orissa'),
(21, 'Punjab'),
(22, 'Rajastan'),
(23, 'Sikkim'),
(24, 'TamilNadu'),
(25, 'Tripura'),
(26, 'Uttar Pradesh'),
(27, 'Uttarakhand'),
(28, 'West Bengal');

-- --------------------------------------------------------

--
-- Table structure for table `tbledmitrauniversity`
--

CREATE TABLE `tbledmitrauniversity` (
  `intUniversity` bigint(20) DEFAULT NULL,
  `varUniversity` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbledmitrauniversity`
--

INSERT INTO `tbledmitrauniversity` (`intUniversity`, `varUniversity`) VALUES
(0, '- Select University -'),
(1, 'A.P. University of Law'),
(2, 'Acharya N. G. Ranga Agricultural University'),
(3, 'Acharya Nagarjuna University'),
(4, 'Adikavi Nannaya University'),
(5, 'Alagappa University'),
(6, 'Aliah University'),
(7, 'Aligarh Muslim University'),
(8, 'Allahabad University'),
(9, 'Anand Agricultural University'),
(10, 'Andhra Pradesh Open University'),
(11, 'Andhra University'),
(12, 'Anna University of Technology Tirunelveli'),
(13, 'Anna University of Technology, Chennai'),
(14, 'Anna University of Technology, Coimbatore'),
(15, 'Anna University of Technology, Madurai'),
(16, 'Anna University of Technology, Tiruchirappalli'),
(17, 'Anna University, Chennai'),
(18, 'Annamalai University'),
(19, 'Aryabhatta Knowledge University'),
(20, 'Assam Agricultural University'),
(21, 'Assam University'),
(22, 'Awdhesh Pratap Singh University'),
(23, 'Ayush and Health Sciences University of Chhattisgarh'),
(24, 'B. R. Ambedkar Bihar University'),
(25, 'Baba Farid University of Health Sciences'),
(26, 'Baba Ghulam Shah Badhshah University'),
(27, 'Babasaheb Bhimrao Ambedkar University'),
(28, 'Banaras Hindu University'),
(29, 'Bangalore University'),
(30, 'Barkatullah University'),
(31, 'Bastar University'),
(32, 'Bengal Engineering and Science University, Shibpur'),
(33, 'Berhampur University'),
(34, 'Bhagat Phool Singh Mahila Vishwavidyalaya'),
(35, 'Bharat Ratna Dr. B. R. Ambedkar University'),
(36, 'Bharathiar University'),
(37, 'Bharathidasan University'),
(38, 'Bhupendra Narayan Mandal University'),
(39, 'Bidhan Chandra Krishi Viswavidyalaya'),
(40, 'Biju Patnaik University of Technology'),
(41, 'Birsa Agricultural University'),
(42, 'Bundelkhand University'),
(43, 'Calicut University'),
(44, 'Central Agricultural University'),
(45, 'Central University of Bihar'),
(46, 'Central University of Gujarat'),
(47, 'Central University of Haryana'),
(48, 'Central University of Himachal Pradesh'),
(49, 'Central University of Jammu'),
(50, 'Central University of Jharkhand'),
(51, 'Central University of Karnataka'),
(52, 'Central University of Kashmir'),
(53, 'Central University of Kerala'),
(54, 'Central University of Orissa'),
(55, 'Central University of Punjab'),
(56, 'Central University of Rajasthan'),
(57, 'Central University of Tamil Nadu'),
(58, 'Centre for Environmental and Planning Technology University'),
(59, 'Chanakya National Law University'),
(60, 'Chandra Shekhar Azad University of Agriculture and Technology'),
(61, 'Chaudhary Charan Singh Haryana Agricultural University'),
(62, 'Chaudhary Charan Singh University'),
(63, 'Chaudhary Devi Lal University'),
(64, 'Chaudhary Sarwan Kumar Himachal Pradesh Krishi Vishvavidyalaya'),
(65, 'Chhatrapati Shahu Ji Maharaj University'),
(66, 'Chhatrapati Shahuji Maharaj Medical University'),
(67, 'Chhattisgarh Swami Vivekanand Technical University'),
(68, 'Cochin University of Science and Technology'),
(69, 'Davangere University'),
(70, 'Deen Dayal Upadhyay rakhpur University'),
(71, 'Deenbandhu Chhotu Ram University of Science and Technology'),
(72, 'Delhi Technological University'),
(73, 'Devi Ahilya University'),
(74, 'Dharamsinh Desai University'),
(75, 'Dibrugarh University'),
(76, 'Doon University'),
(77, 'Dr. B. R. Ambedkar University'),
(78, 'Dr. B.R. Ambedkar University, Srikakulam'),
(79, 'Dr. Babasaheb Ambedkar Marathwada University'),
(80, 'Dr. Babasaheb Ambedkar Open University'),
(81, 'Dr. Babasaheb Ambedkar Technological University'),
(82, 'Dr. Balasaheb Sawant Konkan Krishi Vidyapeeth'),
(83, 'Dr. Hari Singh ur University'),
(84, 'Dr. Nandamuri Taraka Rama Rao University of Health Sciences, Andhra Pradesh'),
(85, 'Dr. Panjabrao Deshmukh Krishi Vidyapeeth'),
(86, 'Dr. Ram Manohar Lohia Avadh University'),
(87, 'Dr. Ram Manohar Lohia National Law University'),
(88, 'Dr. Shakuntala Misra Rehabilitation University'),
(89, 'Dr. Yashwant Singh Parmar University of Horticulture and Forestry'),
(90, 'Dravidian University'),
(91, 'English and Foreign Languages University'),
(92, 'Fakir Mohan University'),
(93, 'G. B. Pant University of Agriculture and Technology'),
(94, 'Gauhati University'),
(95, 'Gautam Buddh Technical University'),
(96, 'Gautam Buddha University'),
(97, 'a University'),
(98, 'Gujarat Ayurved University'),
(99, 'Gujarat Forensic Sciences University'),
(100, 'Gujarat National Law University'),
(101, 'Gujarat Technological University'),
(102, 'Gujarat University'),
(103, 'Gulbarga University'),
(104, 'Guru Angad Dev Veterinary and Animal Sciences University'),
(105, 'Guru Ghasidas University'),
(106, 'Guru bind Singh Indraprastha University'),
(107, 'Guru Jambheshwar University of Science and Technology'),
(108, 'Guru Nanak Dev University'),
(109, 'Hemchandracharya North Gujarat University'),
(110, 'Hemwati Nandan Bahuguna Garhwal University'),
(111, 'Hidayatullah National Law University'),
(112, 'Himachal Pradesh Technical University'),
(113, 'Himachal Pradesh University'),
(114, 'Indian Maritime University'),
(115, 'Indira Gandhi Agricultural University'),
(116, 'Indira Gandhi National Open University'),
(117, 'Indira Gandhi National Tribal University'),
(118, 'Indira Kala Sangeet University'),
(119, 'Indraprastha Institute of Information Technology'),
(120, 'Islamic University of Science and Technology'),
(121, 'Jadavpur University'),
(122, 'Jagadguru Ramanadacharya Rajasthan Sanskrit University'),
(123, 'Jai Narain Vyas University'),
(124, 'Jai Prakash University'),
(125, 'Jamia Millia Islamia'),
(126, 'Jawaharlal Nehru Agricultural University'),
(127, 'Jawaharlal Nehru Architecture and Fine Arts University'),
(128, 'Jawaharlal Nehru Technological University, Anantapur'),
(129, 'Jawaharlal Nehru Technological University, Hyderabad'),
(130, 'Jawaharlal Nehru Technological University, Kakinada'),
(131, 'Jawaharlal Nehru University'),
(132, 'Jiwaji University'),
(133, 'Kakatiya University'),
(134, 'Kameshwar Singh Darbhanga Sanskrit University'),
(135, 'Kannada University'),
(136, 'Kannur University'),
(137, 'Karnatak University'),
(138, 'Karnataka Samskrit University'),
(139, 'Karnataka State Law University'),
(140, 'Karnataka State Open University'),
(141, 'Karnataka State Women''s University'),
(142, 'Karnataka Veterinary, Animal and Fisheries Sciences University'),
(143, 'Kavi Kulguru Kalidas Sanskrit Vishwavidyalaya'),
(144, 'Kerala Agricultural University'),
(145, 'Kerala University of Fisheries and Ocean Studies'),
(146, 'Kerala University of Health Sciences'),
(147, 'Kerala Veterinary and Animal Sciences University'),
(148, 'Kolhan University'),
(149, 'Krantiguru Shyamji Krishna Verma Kachchh University'),
(150, 'Krishna Kanta Handique State Open University'),
(151, 'Krishna University'),
(152, 'KSGH Music and Performing Arts University'),
(153, 'Kumaun University'),
(154, 'Kurukshetra University'),
(155, 'Kushabhau Thakre Patrakarita Avam Jansanchar University'),
(156, 'Kuvempu University'),
(157, 'Lala Lajpat Rai University of Veterinary and Animal Sciences'),
(158, 'Lalit Narayan Mithila University'),
(159, 'M. J. P. Rohilkhand University'),
(160, 'Madhya Pradesh Bhoj Open University'),
(161, 'Madhya Pradesh Pashu-Chikitsa Vigyan Vishwavidyalaya'),
(162, 'Madurai Kamaraj University'),
(163, 'Magadh University'),
(164, 'Mahamaya Technical University'),
(165, 'Maharaja Ganga Singh University'),
(166, 'Maharaja Krishnakumarsinhji Bhavnagar University'),
(167, 'Maharaja Sayajirao University of Baroda'),
(168, 'Maharana Pratap University of Agriculture and Technology'),
(169, 'Maharashtra Animal and Fishery Sciences University'),
(170, 'Maharashtra University of Health Sciences'),
(171, 'Maharishi Dayanand University'),
(172, 'Maharishi Mahesh Yogi Vedic Vishwavidyalaya'),
(173, 'Maharshi Dayanand Saraswati University'),
(174, 'Maharshi Panini Sanskrit University'),
(175, 'Mahatma Gandhi Antarrashtriya Hindi Vishwavidyalaya'),
(176, 'Mahatma Gandhi Chitrakoot Gramoday University'),
(177, 'Mahatma Gandhi Kashi Vidyapeeth'),
(178, 'Mahatma Gandhi University'),
(179, 'Mahatma Gandhi University, Nalnda'),
(180, 'Mahatma Phule Krishi Vidyapeeth'),
(181, 'Makhanlal Chaturvedi National University of Journalism'),
(182, 'Mangalore University'),
(183, 'Manipur University'),
(184, 'Manonmaniam Sundaranar University'),
(185, 'Manyavar Sri Kanshi Ram Ji Urdu, Arabi~Farsi University'),
(186, 'Marathwada Agricultural University'),
(187, 'Maulana Azad National Urdu University'),
(188, 'Maulana Mazharul Haque Arabic and Persian University'),
(189, 'Mizoram University'),
(190, 'Mohanlal Sukhadia University'),
(191, 'Mother Teresa Women''s University'),
(192, 'Nagaland University'),
(193, 'Nalanda Open University'),
(194, 'Narendra Dev University of Agriculture and Technology'),
(195, 'National Academy of Legal Studies and Research'),
(196, 'National Law Institute University'),
(197, 'National Law School of India University'),
(198, 'National Law University, Delhi'),
(199, 'National Law University, Jodhpur'),
(200, 'National Law University, Orissa'),
(201, 'National University of Advanced Legal Studies'),
(202, 'National University of Study and Research in Law'),
(203, 'Netaji Subhas Open University'),
(204, 'Nilamber-Pitamber University'),
(205, 'North Eastern Hill University'),
(206, 'North Maharashtra University'),
(207, 'North Orissa University'),
(208, 'Orissa University of Agriculture and Technology'),
(209, 'Osmania University'),
(210, 'Palamuru University'),
(211, 'Pandit Bhagwat Dayal Sharma University of Health Sciences'),
(212, 'Pandit Ravishankar Shukla University'),
(213, 'Pandit Sundarlal Sharma (Open) University'),
(214, 'Panjab University, Chandigarh'),
(215, 'Patna University'),
(216, 'Periyar University'),
(217, 'Pondicherry University'),
(218, 'Potti Sreeramulu Telugu University'),
(219, 'Presidency University, Kolkata'),
(220, 'Punjab Agricultural University'),
(221, 'Punjab Technical University'),
(222, 'Punjabi University'),
(223, 'Rabindra Bharati University'),
(224, 'Rai University, Ahmedabad'),
(225, 'Rajasthan Agricultural University'),
(226, 'Rajasthan Ayurved University'),
(227, 'Rajasthan Technical University'),
(228, 'Rajasthan University of Health Sciences'),
(229, 'Rajendra Agricultural University'),
(230, 'Rajiv Gandhi National University of Law'),
(231, 'Rajiv Gandhi Technical University'),
(232, 'Rajiv Gandhi University'),
(233, 'Rajiv Gandhi University of Health Sciences'),
(234, 'Rajiv Gandhi University of Knowledge Technologies'),
(235, 'Ranchi University'),
(236, 'Rani Channamma University'),
(237, 'Rani Durgavati University'),
(238, 'Rashtrasant Tukadoji Maharaj Nagpur University'),
(239, 'Ravenshaw University'),
(240, 'Rayalaseema University'),
(241, 'Sambalpur University'),
(242, 'Sampurnanand Sanskrit University'),
(243, 'Sant Gadge Baba Amravati University'),
(244, 'Sardar Patel University'),
(245, 'Sardar Vallabhbhai Patel University of Agriculture and Technology'),
(246, 'Sardarkrushinagar Dantiwada Agricultural University'),
(247, 'Sarguja University'),
(248, 'Satavahana University'),
(249, 'Saurashtra University'),
(250, 'Sher-e-Kashmir University of Agricultural Sciences and Technology of Kashmir'),
(251, 'Shivaji University'),
(252, 'Shree Somnath Sanskrit University'),
(253, 'Shreemati Nathibai Damodar Thackersey Women''s University'),
(254, 'Shri Jagannath Sanskrit Vishvavidyalaya'),
(255, 'Shri Mata Vaishno Devi University'),
(256, 'Sidho Kanho Birsha University'),
(257, 'Sido Kanhu University'),
(258, 'Sikkim University'),
(259, 'Solapur University'),
(260, 'Sree Sankaracharya University of Sanskrit'),
(261, 'Sri Krishnadevaraya University'),
(262, 'Sri Padmavati Mahila Visvavidyalayam'),
(263, 'Sri Venkateswara Institute of Medical Sciences'),
(264, 'Sri Venkateswara University'),
(265, 'Sri Venkateswara Vedic University'),
(266, 'Sri Venkateswara Veterinary University'),
(267, 'Swami Ramanand Teerth Marathwada University'),
(268, 'Tamil Nadu Agricultural University'),
(269, 'Tamil Nadu Dr. Ambedkar Law University'),
(270, 'Tamil Nadu Dr. M.G.R. Medical University'),
(271, 'Tamil Nadu Open University'),
(272, 'Tamil Nadu Physical Education and Sports University'),
(273, 'Tamil Nadu Teacher Education University'),
(274, 'Tamil Nadu Veterinary and Animal Sciences University'),
(275, 'Tamil University'),
(276, 'Telangana University'),
(277, 'Tezpur University'),
(278, 'Thiruvalluvar University'),
(279, 'Tilka Manjhi Bhagalpur University'),
(280, 'Tripura University'),
(281, 'Tumkur University'),
(282, 'University of Agricultural Sciences, Bangalore'),
(283, 'University of Agricultural Sciences, Dharwad'),
(284, 'University of Burdwan'),
(285, 'University of Calcutta'),
(286, 'University of Delhi'),
(287, 'University of ur Banga'),
(288, 'University of Hyderabad'),
(289, 'University of Jammu'),
(290, 'University of Kalyani'),
(291, 'University of Kashmir'),
(292, 'University of Kerala'),
(293, 'University of Kota'),
(294, 'University of Lucknow'),
(295, 'University of Madras'),
(296, 'University of Mumbai'),
(297, 'University of Mysore'),
(298, 'University of North Bengal'),
(299, 'University of Pune'),
(300, 'University of Rajasthan'),
(301, 'Utkal University'),
(302, 'Utkal University of Culture'),
(303, 'Uttar Banga Krishi Vishwavidyalaya'),
(304, 'Uttar Pradesh King George''s University of Dental Sciences'),
(305, 'Uttar Pradesh Rajarshi Tandon Open University'),
(306, 'Uttarakhand Open University'),
(307, 'Uttarakhand Technical University'),
(308, 'Uttaranchal Sanskrit University'),
(309, 'Vardhaman Mahaveer Open University'),
(310, 'Veer Bahadur Singh Purvanchal University'),
(311, 'Veer Kunwar Singh University'),
(312, 'Veer Narmad South Gujarat University'),
(313, 'Veer Surendra Sai University of Technology, Burla'),
(314, 'Vidyasagar University'),
(315, 'Vijayanagara Sri Krishnadevaraya University'),
(316, 'Vikram University'),
(317, 'Vikrama Simhapuri University'),
(318, 'Vinoba Bhave University'),
(319, 'Vishva-Bharati University'),
(320, 'Visvesvaraya Technological University'),
(321, 'West Bengal National University of Juridical Sciences'),
(322, 'West Bengal State University'),
(323, 'West Bengal University of Animal and Fishery Sciences'),
(324, 'West Bengal University of Health Sciences'),
(325, 'West Bengal University of Technology'),
(326, 'Yashwantrao Chavan Maharashtra Open University'),
(327, 'YMCA University of Science and Technology'),
(328, 'Yogi Vemana University');

-- --------------------------------------------------------

--
-- Table structure for table `tblfacilities`
--

CREATE TABLE `tblfacilities` (
  `intid` bigint(20) NOT NULL,
  `intCollegeId` bigint(20) NOT NULL,
  `varFacility` longtext,
  `varFacilityDescription` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblfacilities`
--

INSERT INTO `tblfacilities` (`intid`, `intCollegeId`, `varFacility`, `varFacilityDescription`) VALUES
(1, 1, 'Advance Technology', 'To make education easy accessible & more rechable'),
(2, 1, 'Friendly Counselling ', 'To understand each other & work more effectively '),
(3, 1, 'Knowledge Transfer', 'To make sure we get best of market '),
(4, 2, 'On Time Service', 'On Time Service'),
(5, 2, 'Best Cost', 'Best Cost'),
(6, 4, 'Recruitment ', 'We provide online advertisements at reasonable price to help you for recruitment. ');

-- --------------------------------------------------------

--
-- Table structure for table `tblfacultymembers`
--

CREATE TABLE `tblfacultymembers` (
  `intId` bigint(20) NOT NULL,
  `intCollegeId` text NOT NULL,
  `varFacultyName` text NOT NULL,
  `varDegree` text NOT NULL,
  `varIntro` text NOT NULL,
  `fb` text NOT NULL,
  `gp` text NOT NULL,
  `tw` text NOT NULL,
  `lnkd` text NOT NULL,
  `ex1` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblfacultymembers`
--

INSERT INTO `tblfacultymembers` (`intId`, `intCollegeId`, `varFacultyName`, `varDegree`, `varIntro`, `fb`, `gp`, `tw`, `lnkd`, `ex1`) VALUES
(1, '1', 'Mayur Potdar', 'M.Sc Biotechnology', 'Founder, CEO ', 'https://www.facebook.com/mayurspotdar', 'https://plus.google.com/u/0/114592322971889681929', 'https://twitter.com/ms_potdar', 'https://www.linkedin.com/in/mayurpotdar/', '19884473_718336898370658_669517973393488520_n.jpg'),
(2, '2', 'Bhushan Savale', 'MCA', 'Software Developer', 'https://www.facebook.com/bdsavale', 'https://www.google.com/bdsavale', 'https://www.twitter.com/bhushan69', 'https://www.linkedin.com/in/bhushan-savale-b5167b42/', 'Bhushan photo passport (2).jpg'),
(3, '4', 'Mayur Potdar', 'M.Sc Biotechnology', 'Founder, CEO', 'https://www.facebook.com/mayurspotdar', 'https://plus.google.com/114592322971889681929', 'https://twitter.com/ms_potdar', 'https://www.linkedin.com/in/mayurpotdar/', '19884473_718336898370658_669517973393488520_n.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `tblfeedback`
--

CREATE TABLE `tblfeedback` (
  `intId` int(11) NOT NULL,
  `intuserId` bigint(20) NOT NULL,
  `intCollegeId` bigint(20) NOT NULL,
  `intRating` bigint(20) NOT NULL,
  `varComment` text COLLATE utf8_unicode_ci NOT NULL,
  `ex1` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbljobapplications`
--

CREATE TABLE `tbljobapplications` (
  `intId` bigint(20) NOT NULL,
  `intCollegeId` bigint(20) NOT NULL,
  `intuserId` bigint(20) NOT NULL,
  `intJobId` bigint(20) NOT NULL,
  `varDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `varStatus` text COLLATE utf8_unicode_ci NOT NULL,
  `ex1` text COLLATE utf8_unicode_ci NOT NULL,
  `ex2` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbljobs`
--

CREATE TABLE `tbljobs` (
  `intId` bigint(20) NOT NULL,
  `intCollegeID` bigint(20) NOT NULL,
  `varDesignation` text COLLATE utf8_unicode_ci NOT NULL,
  `varopportunity` text COLLATE utf8_unicode_ci NOT NULL,
  `varResponsibilities` text COLLATE utf8_unicode_ci NOT NULL,
  `varQualification` text COLLATE utf8_unicode_ci NOT NULL,
  `varSkills` text COLLATE utf8_unicode_ci NOT NULL,
  `varSalary` text COLLATE utf8_unicode_ci NOT NULL,
  `varDate` text COLLATE utf8_unicode_ci NOT NULL,
  `varListing` text COLLATE utf8_unicode_ci NOT NULL,
  `ex1` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbljobs`
--

INSERT INTO `tbljobs` (`intId`, `intCollegeID`, `varDesignation`, `varopportunity`, `varResponsibilities`, `varQualification`, `varSkills`, `varSalary`, `varDate`, `varListing`, `ex1`) VALUES
(1, 1, 'Chief operating Officer', 'At coursekatta.com we believe in work first. Which makes us to deliver what we commit, maintain time frame & improve our skills. As Chief Operating Officer we are looking for someone who has same thinking & has passion for driving the positive energy in startup organization. If you think you have these qualities, ready to accept challenges & work to achieve nature then we would be grateful to welcome on board with us.   ', '1. To establish proper work process in startup 2. Create action plan for business expansion 3. Drive sale force & marketing awareness activities 4. work closely with Finance, Admin, HR, Branding & Marketing, Sales & Business Development team 5. Assign work timelines & targets 6. Monitor & analyse performance 7. Work closely with CEO to create market analysis & product performance reports 8. Monitor research & development activities of product development 9. Insure delivery by each team on time ', 'Master Degree with minimum experience of 5 years in working with startup or any other organization with proven success. ', '1. Fluent in Hindi, English communication verbal & written 2. Analytic by nature & competitive in skills 3. Leadership quality is must 4. Should take initiatives & make people to work 5. Must be self driven, positive & self motivated 6. Must have go get attitude to reach market 7. Good in public relations & counselling 8. Should have good team spirit & dedication to achieve ', 'On equity share ', '31-10-2017', '500', ''),
(2, 1, 'Manager in sales & Business Development:', 'Dedication, patience & consistency is what we need when we hire someone for this profile. If you this you have all above qualities then we would be happy to welcome on board with us. ', '1.	Create strategies & tactics for sales & business development 2.	Generation of leads by doing cold calling or calling  3.	Working closely with marketing team for promotions & marketing events to generate quality leads 4.	Use proper communication channels to promote sales  5.	Keeping follow ups with lead generated, maintaining records & prepare reports 6.	 Do negotiations & take decisions for closing business deals. 7.	 Set daily, monthly & quarterly targets  8.	Ready to go & get from market  9.	Lead company’s vision, mission & goal through sales & business development  10.	 Lead the team of business development, drive & achieve goal set 11.	Do market survey, competitor analysis & prepare report accordingly  12.	 Should study market requirement, identify potential localities & target for sales.', 'MBA in Sales & Business Development with Minimum 2 years of work experience in Sales.', '1.	Hardcore sales & business development in attitude  2.	Should have good hold on languages  3.	Should be positive minded, self motivational & ready to accept challenges  4.	Must be familiar with locality 5.	Ready to travel & flexible in timing 6.	Must have own bike & laptop 7.	Must be good analyser for market changes & updates accordingly  8.	Must be good in handling team & driving success 9.	Must be self driven towards goals.', '2.4 - 3.6 Lac', '31-10-2017', '500', ''),
(3, 1, 'Manager - Marketing & Branding ', 'Creativity, passion & dedication this unique combination is the key parameter for someone to achieve this position with us. If you think you are the one who can uncover the client insights & deliver unique approach to market for creating unique brand value then we welcome you on board with us.', '1.	Create, design & develop branding & marketing strategies for company promotion 2.	Monitor, analyse & reporting on success, ROI & KPI’s of modes planned. 3.	Negotiating rates of Online, offline promotional event planners & vendors 4.	Lead the team & get best of everyone  5.	Assign target, monitor performance & submit report  6.	Do competitor analysis, trends in market, update requirement for product  7.	Meet clients, generate feedback & survey report, create awareness on new features, identification of target audience & report creation for changes done. 8.	Assist development team & management on market requirements & future prospective update requirements  9.	Creating one point contact for customer support & awareness. 10.	 Take brand ownership towards vision, mission & goal of the company. 11.	 Keep close track of product performance, identify new market opportunities, explore them & bring new localities 12.	 Work closely with Sales & business development team to create product awareness & generate fruitful business for the company. 13.	 Handle challenges positively to introduce company in market.', 'MBA in Marketing with minimum 2 years of experience in Branding & Marketing ', '1.	Creative, passionate & dedicated for work 2.	Good hold on written & spoken English, Marathi, Hindi language  3.	Have ability think out of box 4.	Must be quick learner for market trends, requirements & advance solutions 5.	Go-to get from market attitude  6.	Positive in nature with good team spirit  7.	Ready to work in start-up culture  8.	Should be flexible in timing & ready to travel 9.	Must have own laptop & bike 10.	Must be good in negotiation, analysis & report creation ', '2.4 - 3.6 Lac', '31-10-2017', '500', ''),
(4, 1, 'Chief Admin Officer ', 'Discipline & culture are the two major pillars of any organization to achieve success. At coursekatta we believe in employee friendly work culture with discipline in behavior if you think you can design & develop that with a startup company then we are happy to welcome you as Chief Admin officer.   ', '1. Work Closely with Management to understand organizational requirements 2. Design HR policies, protocols & employee beneficiary policies 3. Work closely with all teams to assign targets, handle issues, help for support & maintain company discipline 4. Arrange training & skill development programs 5. Arrange placement & recruitment drive 6. Recruit best talent for company & track performance 7. Manage internal requirements, quote procurement & purchase 8. Coordinate with CEO for creating best environment for all employees & new expansions ', 'MBA in entrepreneurship or Administration with minimum 5 years of work experience ', '1. Team management 2. Work under pressure 3. Self decision making 4. leadership & passion to help others 5. Calculative & Self disciplined 6. Dedicated & strict for work first culture 7. Ability to dive team & take actions  ', 'On Equity Base', '31-10-2017', '500', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblnotifications`
--

CREATE TABLE `tblnotifications` (
  `intId` bigint(20) NOT NULL,
  `varNotType` longtext NOT NULL,
  `intNotFromId` bigint(20) NOT NULL,
  `varNotFromName` longtext NOT NULL,
  `varNotFromDesig` longtext NOT NULL,
  `intNotToId` bigint(20) NOT NULL,
  `varNotToDesig` longtext NOT NULL,
  `varNotText` longtext NOT NULL,
  `varLink` longtext NOT NULL,
  `varSession` longtext NOT NULL,
  `varStatus` longtext NOT NULL,
  `varRemark` longtext NOT NULL,
  `varExtra` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblnotifications`
--

INSERT INTO `tblnotifications` (`intId`, `varNotType`, `intNotFromId`, `varNotFromName`, `varNotFromDesig`, `intNotToId`, `varNotToDesig`, `varNotText`, `varLink`, `varSession`, `varStatus`, `varRemark`, `varExtra`) VALUES
(1, 'Page', 3, 'Bhushan Savale', 'User', 4, 'User', 'Bhushan Savale Likes your Post', '~/user/default.aspx#21', 'NA', 'Unread', '', ''),
(2, 'Page', 3, 'Bhushan Savale', 'User', 4, 'User', 'Bhushan Savale Likes your Post', '~/user/default.aspx#21', 'NA', 'Unread', '', ''),
(3, 'Page', 3, 'Bhushan Savale', 'User', 4, 'User', 'Bhushan Savale Likes your Post', '~/user/default.aspx#21', 'NA', 'Unread', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblproductgallary`
--

CREATE TABLE `tblproductgallary` (
  `id` int(11) NOT NULL,
  `intProductId` bigint(20) NOT NULL,
  `file` varchar(250) DEFAULT NULL,
  `label` varchar(250) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblproductgallary`
--

INSERT INTO `tblproductgallary` (`id`, `intProductId`, `file`, `label`) VALUES
(4, 2, '32922banner_3.jpg', NULL),
(5, 2, '89824g1.jpg', NULL),
(6, 2, '85992g2.jpg', NULL),
(7, 2, '64564g3.jpg', NULL),
(8, 2, '59736g6.jpg', NULL),
(9, 2, '59958g8.jpg', NULL),
(10, 3, '31419avatar2.png', NULL),
(11, 3, '35454avatar3.png', NULL),
(12, 3, '67874avatar4.png', NULL),
(13, 3, '25676avatar5.png', NULL),
(28, 1, '66611v1.jpg', NULL),
(29, 1, '72547v2.jpg', NULL),
(30, 1, '56946v3.jpg', NULL),
(31, 1, '56268v4.jpg', NULL),
(32, 1, '94292v5.jpg', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblproductsubtype`
--

CREATE TABLE `tblproductsubtype` (
  `intProdSubTypeId` bigint(20) NOT NULL,
  `intProdTypeId` bigint(20) NOT NULL,
  `varSubTypeName` longtext COLLATE utf8_unicode_ci NOT NULL,
  `varDescription` longtext COLLATE utf8_unicode_ci NOT NULL,
  `varCreatedDate` date NOT NULL,
  `varIsActive` tinyint(11) NOT NULL,
  `ex2` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ex3` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ex4` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblproductsubtype`
--

INSERT INTO `tblproductsubtype` (`intProdSubTypeId`, `intProdTypeId`, `varSubTypeName`, `varDescription`, `varCreatedDate`, `varIsActive`, `ex2`, `ex3`, `ex4`) VALUES
(1, 3, 'WONDER ULTIMATE', 'WONDER ULTIMATE', '2017-01-07', 1, '', '', ''),
(3, 1, 'DELITE  PUF', 'DELITE \r\nPUF', '2017-01-07', 1, '', '', ''),
(4, 1, 'DELITE ROCKWOOL', 'DELITE ROCKWOOL', '2017-01-07', 1, '', '', ''),
(5, 3, 'WONDER STANDARD', 'WONDER STANDARD', '2017-01-07', 1, '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblproducttype`
--

CREATE TABLE `tblproducttype` (
  `intProdTypeId` bigint(20) NOT NULL,
  `varTypeName` longtext COLLATE utf8_unicode_ci NOT NULL,
  `varDescription` longtext COLLATE utf8_unicode_ci NOT NULL,
  `varCreatedDate` date NOT NULL,
  `varIsActive` tinyint(11) NOT NULL,
  `varProductImage` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ex2` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ex3` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ex4` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblproducttype`
--

INSERT INTO `tblproducttype` (`intProdTypeId`, `varTypeName`, `varDescription`, `varCreatedDate`, `varIsActive`, `varProductImage`, `ex2`, `ex3`, `ex4`) VALUES
(1, 'FLAT PLATE COLLECTOR (FPC)', 'FLAT PLATE COLLECTOR (FPC)', '2017-01-05', 1, '1 sudarshan-saur-delite-puf-soft-water-250-litre-solar-heater.jpg', '', '', ''),
(3, 'EVACUATED TUBE COLLECTOR (ETC)', 'EVACUATED TUBE COLLECTOR (ETC)', '2017-01-05', 1, '3 ', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblproductvariation`
--

CREATE TABLE `tblproductvariation` (
  `intId` bigint(20) NOT NULL,
  `varVariation` longtext COLLATE utf8_unicode_ci NOT NULL,
  `varDescription` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ex1` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblproductvariation`
--

INSERT INTO `tblproductvariation` (`intId`, `varVariation`, `varDescription`, `ex1`) VALUES
(1, 'Length', 'Length of Product fgfg', ''),
(2, 'Width', 'Width of Product', ''),
(3, 'Liter', 'Liter(500lte/1000ltr)', ''),
(4, 'Color', 'Color of product (blue/yellow)', ''),
(5, 'Size', 'Size (large/Medium/small)', ''),
(6, 'Material', 'Material(still/Plastic/Aluminium)', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblstudenteducationaldetails`
--

CREATE TABLE `tblstudenteducationaldetails` (
  `intId` bigint(20) NOT NULL,
  `intStudentId` bigint(20) NOT NULL,
  `varStudentClass` longtext,
  `varStudentCollege` longtext,
  `varStudentUniversity` longtext,
  `varStudentPassingYear` longtext,
  `varStudentMarks` longtext,
  `varStudentPer` longtext,
  `varStudentGrade` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblstudentschedule`
--

CREATE TABLE `tblstudentschedule` (
  `intId` bigint(20) NOT NULL,
  `intStudentId` bigint(20) NOT NULL,
  `intCollegeId` bigint(20) NOT NULL,
  `varCourse` longtext,
  `varDate` longtext,
  `varTime` longtext,
  `varApplied` longtext,
  `varScheduled` longtext
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblsuorder`
--

CREATE TABLE `tblsuorder` (
  `intOrderId` bigint(20) NOT NULL,
  `intId` bigint(20) NOT NULL,
  `intCustId` bigint(20) NOT NULL,
  `intEmpId` bigint(20) NOT NULL,
  `varStatus` longtext,
  `varApprvedBy` longtext NOT NULL,
  `dtDate` longtext,
  `tmTime` longtext,
  `varProductTotal` longtext,
  `varTotalNag` longtext NOT NULL,
  `varPriceTotal` longtext,
  `VarModePayment` longtext NOT NULL,
  `varDestination` longtext NOT NULL,
  `varCompletion` longtext NOT NULL,
  `varBookingId` longtext NOT NULL,
  `ex1` longtext NOT NULL,
  `ex2` longtext NOT NULL,
  `varTransport` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tblsuorderdetails`
--

CREATE TABLE `tblsuorderdetails` (
  `intId` bigint(20) NOT NULL,
  `intOrderId` bigint(20) NOT NULL,
  `intProductId` bigint(20) NOT NULL,
  `varProductName` longtext,
  `varQuantity` longtext,
  `varNag` longtext NOT NULL,
  `varPrice` longtext,
  `varRemark` longtext
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tblsuproducts`
--

CREATE TABLE `tblsuproducts` (
  `intId` bigint(20) NOT NULL,
  `varProductName` longtext,
  `intProductTypeId` bigint(20) DEFAULT NULL,
  `intProductSubTypeId` bigint(20) DEFAULT NULL,
  `varproductcode` longtext,
  `varShortDesc` longtext NOT NULL,
  `varLongDesc` longtext,
  `imgImage` longtext,
  `varStatus` longtext,
  `varWarning` longtext NOT NULL,
  `intPurchasePrice` bigint(20) NOT NULL,
  `intDealerPrice` bigint(20) NOT NULL,
  `intMRP` bigint(20) NOT NULL,
  `ex1` longtext NOT NULL,
  `ex2` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tblsuproducts`
--

INSERT INTO `tblsuproducts` (`intId`, `varProductName`, `intProductTypeId`, `intProductSubTypeId`, `varproductcode`, `varShortDesc`, `varLongDesc`, `imgImage`, `varStatus`, `varWarning`, `intPurchasePrice`, `intDealerPrice`, `intMRP`, `ex1`, `ex2`) VALUES
(1, 'GLASS LINING MODEL', 3, 1, '123', 'It is non-stck coating created by melting special glass material in an automatic furnance at a very high temperature (around 850C).', 'It is non-stck coating created by melting special glass material in an automatic furnance at a very high temperature (around 850C).', 'gl.jpg', '1', '', 150200, 170002, 200002, '', ''),
(2, 'STAINLESS STEEL', 3, 5, '456', 'Stainless steel tank, Lightweight system!', 'The Wonder Standard - SS series is an ETC solar water heater by Sudarshan Saur. It Has a Stainless\r\n\r\nSteel tank and is suitable for areas which have water with low chloride hardness.', 'Stainless1.png', '1', '', 25000, 28000, 30000, '', ''),
(3, 'GALVANIZED IRON', 3, 5, '789', 'Technology copmpletely affordable, Hot water easily available!', 'The Wonder Standard G.I. series from Sudarshan Saur is an ETC system with a hot water tank made of Galvanized Iron (G I). Galvanized iron provides strength and durability to the tank and enhances the life of the system.', 'GI_Second.jpg', '1', '', 38000, 40000, 42000, '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblsuuploadfiles`
--

CREATE TABLE `tblsuuploadfiles` (
  `intId` bigint(20) NOT NULL,
  `varUploadFilePath` longtext NOT NULL,
  `varDate` longtext NOT NULL,
  `ex1` longtext NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `tbluserdetails`
--

CREATE TABLE `tbluserdetails` (
  `intuserId` bigint(20) NOT NULL,
  `varuserName` longtext,
  `varuserAddress` longtext,
  `varuserCity` longtext,
  `varuserState` longtext,
  `varContactOne` longtext,
  `varContactTwo` longtext,
  `varContactThree` longtext,
  `varuserEmail` longtext,
  `varuserWeb` longtext,
  `varPassword` longtext,
  `varVerified` longtext,
  `varPhoto` longtext,
  `varuserType` text NOT NULL,
  `varAbout` text NOT NULL,
  `varMaritalStatus` text NOT NULL,
  `varGender` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbluserdetails`
--

INSERT INTO `tbluserdetails` (`intuserId`, `varuserName`, `varuserAddress`, `varuserCity`, `varuserState`, `varContactOne`, `varContactTwo`, `varContactThree`, `varuserEmail`, `varuserWeb`, `varPassword`, `varVerified`, `varPhoto`, `varuserType`, `varAbout`, `varMaritalStatus`, `varGender`) VALUES
(1, 'Mayur Potdar', 'Hadpsar', 'Pune', 'Maharashtra', '9620961818', '22/07/1989', '', 'director@coursekatta.com', '', 'dirck@17', 'true', '19884473_718336898370658_669517973393488520_n.jpg', 'User', 'Founder, Coursekatta.com', 'Single', 'Male'),
(2, 'Swati Chounsaste', 'Pune', 'Pune', 'Maharashtra', '7768800020', '19-02-1993', '', 'enquiry@coursekatta.com', '', 'ckck17', 'true', '429307117f71f1452675bcd529ec8c93_ls.jpg', 'User', 'Working', 'Single', 'Female'),
(3, 'Bhushan Savale', 'NA', 'NA', 'NA', '9561421489', '', '', 'savalebd@gmail.com', '', '123', 'true', 'NoProfile.png', 'User', '', '', ''),
(4, 'Education Guide Lines', 'NA', 'Jalgaon', 'Maharashtra', '9175387111', '07-01-1991', '', 'roziya.shaikh@yahoo.com', '', '123', 'true', 'tour-lg1.jpg', 'User', 'Roziya', 'Single', 'Female'),
(5, 'Pooja  Walke', 'NA', 'NA', 'NA', '7020033192', '', '', 'pooja.walke25@gmail.com', '', 'Salmankhan', 'true', 'NoProfile.png', 'User', '', '', ''),
(6, 'Govind Bhume', 'NA', 'NA', 'NA', '9867222498', '', '', 'govindbhume1989@gmail.com', '', 'Katta@111', 'true', 'NoProfile.png', 'User', '', '', ''),
(7, 'moshim munde Dipali Shimpi Dipali Shimpi Dipali Shimpi', 'NA', 'NA', 'NA', '9604921899', '', '', 'mosimmunde786@gmail.com', '', 'Mosim@786', '46939834', 'NoProfile.png', 'User', '', '', ''),
(8, 'Yogiraj chaudhari', 'NA', 'NA', 'NA', '7840936167', '', '', 'chaudhariyo123@gmail.com', '', 'story123', 'true', 'NoProfile.png', 'User', '', '', ''),
(9, 'Dipali ShimpiDipali ShimpiDipali Shimpi', 'NA', 'NA', 'NA', '8983189060', '', '', 'dipalimahajan12@gmail.com', '', '19081989', 'true', 'NoProfile.png', 'User', '', '', ''),
(10, 'Deelip Vedpathak', 'NA', 'NA', 'NA', '9545559929', '', '', 'vdeelip17@gmail.com', '', '34228951', '16822223', 'NoProfile.png', 'User', '', '', ''),
(11, 'Nilesh Bhalerao', 'NA', 'NA', 'NA', '9960825277', '', '', 'nilesh.bhalerao9@gmail.com', '', '123456', 'true', 'NoProfile.png', 'User', '', '', ''),
(12, 'Ragib Alam', 'NA', 'NA', 'NA', '8404910550', '', '', 'ragibkhan36@gmail.com', '', 'chahat36@123', '48461264', 'NoProfile.png', 'User', '', '', ''),
(13, 'Vijay Tejwani', 'NA', 'NA', 'NA', '8149062181', '', '', 'vijaytejwani4u@gmail.com', '', '8149062181', 'true', 'NoProfile.png', 'User', '', '', ''),
(14, 'Pranoti Giram', 'NA', 'NA', 'NA', '8888993166', '', '', 'pranotigiram14696@gmail.com', '', '9156092322', '73424172', 'NoProfile.png', 'User', '', '', ''),
(15, 'SAYAN KAYAL', 'NA', 'NA', 'NA', '8805608960', '', '', 'sayankayal1995@gmail.com', '', 'sayan@6617', 'true', 'NoProfile.png', 'User', '', '', ''),
(16, 'Vitthal  Divate ', 'NA', 'NA', 'NA', '9146407800', '', '', 'divatevitthal7800@gmail.com', '', '19950105', 'true', 'NoProfile.png', 'User', '', '', ''),
(17, 'Sai Pathrikar', 'NA', 'NA', 'NA', '9673178777', '', '', 'pathrikaratul7@gmail.com', '', 'Moni@sai8777', 'true', 'NoProfile.png', 'User', '', '', ''),
(18, 'Maina Gaur', 'NA', 'NA', 'NA', '9549069212', '', '', 'mainagaur1577@gmail.com', '', '112911', 'true', 'NoProfile.png', 'User', '', '', ''),
(19, 'Rahul  Dewada', 'NA', 'NA', 'NA', '7389367813', '', '', 'rahuldewada@gmail.com', '', '8989526085', 'true', 'NoProfile.png', 'User', '', '', ''),
(20, 'Divananda G', 'NA', 'NA', 'NA', '9986866406', '', '', 'divanandaghkbk@gmail.com', '', '9986866406', 'true', 'NoProfile.png', 'User', '', '', ''),
(21, 'sadanand hangargekar', 'NA', 'NA', 'NA', '8550008080', '', '', 'sada01.anand@gmail.com', '', 'basava', 'true', 'NoProfile.png', 'User', '', '', ''),
(22, 'kajal Dighe', 'NA', 'NA', 'NA', '9527523012', '', '', 'kajaldighe0@gmail.com', '', 'Kajal@22', 'true', 'NoProfile.png', 'User', '', '', ''),
(23, 'Anand Birajdar', 'NA', 'NA', 'NA', '8888948102', '', '', 'anand.birajdar148@gmail.com', '', 'anand1234', 'true', 'NoProfile.png', 'User', '', '', ''),
(24, 'Omkar Nath', 'NA', 'NA', 'NA', '9905562833', '', '', 'om99055@gmail.com', '', '123', 'true', 'NoProfile.png', 'User', '', '', ''),
(25, 'Vrushali  Gunjal ', 'NA', 'NA', 'NA', '7770040532', '', '', 'vrushali4582@gmail.com', '', '9823662810', '78375975', 'NoProfile.png', 'User', '', '', ''),
(26, 'Krishna Chaitanya', 'NA', 'NA', 'NA', '8885545455', '', '', 'srisaraswathionline@gmail.com', '', 'chaitanya28', 'true', 'NoProfile.png', 'User', '', '', ''),
(27, 'Abhijit Oothaman', 'NA', 'NA', 'NA', '8758284380', '', '', 'abhi.itm2012@gmail.com', '', 'abhijit@chaturideas', 'true', 'NoProfile.png', 'User', '', '', ''),
(28, 'Chhagan  Bagadi', 'New colony malviya nagar jaipur', 'Jaipur', 'Rajastan', '9782704574', '05-08-1990', '', 'rbkwgroup@gmail.com', '', '11111111', 'true', 'IMG_20170809_161102_112.jpg', 'User', 'CEO AND director', 'Married', 'Male'),
(29, 'purnima Divate', 'NA', 'NA', 'NA', '9028077445', '', '', 'pvddivate@gmail.com', '', 'Pvd@199300', '48962851', 'NoProfile.png', 'User', '', '', ''),
(30, 'Keshav Divate', 'NA', 'NA', 'NA', '9422911546', '', '', 'keshavdivate02@gmail.com', '', 'Kesh@bachelor24', '38594716', 'NoProfile.png', 'User', '', '', ''),
(31, 'Akshay Gujar', 'NA', 'NA', 'NA', '9325392054', '', '', 'aggujar17@gmail.com', '', 'Akki@177', 'true', 'NoProfile.png', 'User', '', '', ''),
(32, 'pallavi Divate', 'NA', 'NA', 'NA', '9881358941', '', '', 'pallavidivate3@gmail.com', '', 'pallavi3', '58868513', 'NoProfile.png', 'User', '', '', ''),
(33, 'kanchan Dornal', 'NA', 'NA', 'NA', '9844685034', '', '', 'dornalkanchan07@gmail.com', '', 'kanchan143', '78478291', 'NoProfile.png', 'User', '', '', ''),
(34, 'vishal Chaudhari', 'NA', 'NA', 'NA', '7066457703', '', '', 'vishal.chaudhari@cliniindia.com', '', 'vishal@cliniindia', 'true', 'NoProfile.png', 'User', '', '', ''),
(35, 'Sayali Sonar', 'NA', 'NA', 'NA', '9552004208', '', '', 'sayalimahamuni1@gmail.com', '', 'Sayali@04', '94383636', 'NoProfile.png', 'User', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbluserprofessionaldetails`
--

CREATE TABLE `tbluserprofessionaldetails` (
  `intId` bigint(20) NOT NULL,
  `intUserId` bigint(20) NOT NULL,
  `varCompany` text COLLATE utf8_unicode_ci NOT NULL,
  `varDesignation` text COLLATE utf8_unicode_ci NOT NULL,
  `varExperience` text COLLATE utf8_unicode_ci NOT NULL,
  `varFromMonth` text COLLATE utf8_unicode_ci NOT NULL,
  `varFromYear` text COLLATE utf8_unicode_ci NOT NULL,
  `varToMonth` text COLLATE utf8_unicode_ci NOT NULL,
  `varToYear` text COLLATE utf8_unicode_ci NOT NULL,
  `varResponsibilities` text COLLATE utf8_unicode_ci NOT NULL,
  `varCTC` text COLLATE utf8_unicode_ci NOT NULL,
  `ex1` text COLLATE utf8_unicode_ci NOT NULL,
  `ex2` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tbluserprofessionaldetails`
--

INSERT INTO `tbluserprofessionaldetails` (`intId`, `intUserId`, `varCompany`, `varDesignation`, `varExperience`, `varFromMonth`, `varFromYear`, `varToMonth`, `varToYear`, `varResponsibilities`, `varCTC`, `ex1`, `ex2`) VALUES
(1, 1, 'Edwize Educational Consultant', 'Business Development Executive', 'Sales, Marketing, Business Development, Students Care, Counselling ', 'January', '2012', 'December', '2013', '1. Potential area identification for admissions\r\n2. colleges tie ups\r\n3. Data base generation & promotion\r\n4. team formation for marketing\r\n5. handling of tale calling section for lead conversion \r\n6. making admission in colleges associated with us\r\n7. answerable directly to founder,MD of organization', '3 lakh', '', ''),
(2, 1, 'Coursekatta.com', 'Manager- Listing & Promotions', '5 month', 'May', '2017', 'September', '2017', 'Corporate tie up', 'Na', '', ''),
(3, 1, 'U72502MH2015PTC263488', 'dsfsf', 'aaa', 'February', '1963', 'March', '1965', 'asdasda', 'asdadasd', '', ''),
(4, 1, 'Anuvaa Softech Pvt Ltd', 'Co-Founder', 'Business Development', 'July', '2015', 'Currently Working', '2017', 'Anuvaa is small IT start up firm dealing with Web Designing, Software Development, Business Consultation, Business Analysis, Social Media Marketing & Search Engine Optimization, Mobile Application development & Mobile Marketing Solutions.\r\n\r\nJob Role & Responsibility:\r\n\r\n1. Supporting for company formation and establishing operational procedure for company.\r\n2. Generating business leads and supporting for marketing strategy establishment and implementation.\r\n3. Understanding product requirements in market & making product more users friendly and reliable for users.\r\n4. Supporting development team for understanding market requirement and developing accordingly.\r\n5. Making marketing able to understand requirements gathered, products developed & marketing strategy for increasing business for company.\r\n6. Generating business leads and getting deals closer.\r\n7. Making survey, analysis on product performance and service reports\r\n8. Forming marketing strategy and improving market responses by using social media.\r\n9. Dealing with monitoring of overall performance of the company and employees in business development.\r\n10. Prepare RFx, RFI, RFP, RFQ, negotiations, deal finalisations, product delivery support, sales support.\r\n11. Deal with online bidding, online projects by using guru, freelancer etc.\r\n12. Taking part in government tendering system for government projects & managing channels.', '-', '', ''),
(5, 1, 'coursekatta.com', 'Founder, CEO', 'Product development, Marketing, Branding, Promotions, Sales, Management', 'March', '2017', 'Currently Working', '2017', 'Connecting world to education for bridging the gap between industry & academics & creating skills manpower.', '-', '', ''),
(6, 2, 'Coursekatta.com', 'Manage- Listing & Promotions', '5 month', 'May', '2017', 'September', '2017', 'Corporate tie up', 'Na', '', ''),
(7, 4, 'Anuvaa Softech Pvt Ltd', 'Head Of Deparment', '2', 'January', '1960', 'February', '1976', 'handeling Intenns and develping web site', 'savalebd@gmail.com', '', ''),
(8, 3, 'U72502MH2015PTC263488', 'dsfsf', 'aaa', 'February', '1963', 'March', '1965', 'asdasda', 'asdadasd', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tblvariation`
--

CREATE TABLE `tblvariation` (
  `intId` bigint(20) NOT NULL,
  `intProductId` bigint(20) NOT NULL,
  `intVariationId` bigint(20) NOT NULL,
  `varVariationValue` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ex1` longtext COLLATE utf8_unicode_ci NOT NULL,
  `ex2` longtext COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

--
-- Dumping data for table `tblvariation`
--

INSERT INTO `tblvariation` (`intId`, `intProductId`, `intVariationId`, `varVariationValue`, `ex1`, `ex2`) VALUES
(1, 1, 6, 'metal surfaces tube', '', ''),
(3, 1, 3, '25ltr', '', ''),
(4, 2, 6, 'STAINLESS STEEL', '', ''),
(5, 2, 1, '2 meter', '', ''),
(6, 3, 4, 'White', '', ''),
(7, 3, 6, 'metal surfaces', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_adsbyusers`
--

CREATE TABLE `tbl_adsbyusers` (
  `intId` bigint(20) NOT NULL,
  `intUserId` bigint(20) NOT NULL,
  `varAdHeader` text COLLATE utf8_unicode_ci NOT NULL,
  `varBtnText` text COLLATE utf8_unicode_ci NOT NULL,
  `varLink` text COLLATE utf8_unicode_ci NOT NULL,
  `varImageUrl` text COLLATE utf8_unicode_ci NOT NULL,
  `varBottomText` text COLLATE utf8_unicode_ci NOT NULL,
  `varPackageId` text COLLATE utf8_unicode_ci NOT NULL,
  `varOrderId` text COLLATE utf8_unicode_ci NOT NULL,
  `varFrom` text COLLATE utf8_unicode_ci NOT NULL,
  `varTo` text COLLATE utf8_unicode_ci NOT NULL,
  `ex1` text COLLATE utf8_unicode_ci NOT NULL,
  `ex2` text COLLATE utf8_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_likecomment`
--

CREATE TABLE `tbl_likecomment` (
  `Id` int(11) NOT NULL,
  `Post_Id` int(11) DEFAULT NULL,
  `intuserid` bigint(20) DEFAULT NULL,
  `Like_Post` text,
  `Comment` text,
  `Vote` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_likecomment`
--

INSERT INTO `tbl_likecomment` (`Id`, `Post_Id`, `intuserid`, `Like_Post`, `Comment`, `Vote`) VALUES
(1, 1, 3, 'Yes', NULL, NULL),
(2, 1, 3, 'Yes', 'Good going sir..!!', NULL),
(3, 6, 1, 'Yes', NULL, NULL),
(5, 1, 1, 'Yes', 'Thanks Bhushan Sir..!!', NULL),
(6, 8, 2, 'Yes', NULL, NULL),
(7, 8, 1, 'Yes', NULL, NULL),
(8, 10, 1, 'Yes', NULL, NULL),
(9, 9, 1, 'Yes', NULL, NULL),
(10, 1, 8, 'Yes', NULL, NULL),
(11, 10, 2, 'Yes', NULL, NULL),
(12, 7, 1, 'Yes', NULL, NULL),
(13, 11, 1, 'Yes', NULL, NULL),
(16, 6, 15, 'Yes', NULL, NULL),
(17, 16, 2, 'Yes', NULL, NULL),
(18, 21, 4, 'Yes', NULL, NULL),
(22, 21, 4, 'Yes', 'asdasd', NULL),
(23, 20, 4, 'Yes', NULL, NULL),
(24, 20, 4, 'Yes', 'fdg g dfgfg', NULL),
(43, 21, 3, 'Yes', NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tbl_likecomment_forads`
--

CREATE TABLE `tbl_likecomment_forads` (
  `Id` int(11) NOT NULL,
  `Post_Id` int(11) DEFAULT NULL,
  `intuserid` bigint(20) DEFAULT NULL,
  `Like_Post` text,
  `Comment` text,
  `Vote` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post`
--

CREATE TABLE `tbl_post` (
  `Post_Id` int(11) NOT NULL,
  `PostImage` text,
  `Post_Description` text,
  `intStudentId` bigint(20) DEFAULT NULL,
  `Skill_Id` text,
  `Dates` text,
  `Times` text,
  `DeletePost` text,
  `Approve` text,
  `Vote` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_post`
--

INSERT INTO `tbl_post` (`Post_Id`, `PostImage`, `Post_Description`, `intStudentId`, `Skill_Id`, `Dates`, `Times`, `DeletePost`, `Approve`, `Vote`) VALUES
(1, 'PostImages/ck.PNG', 'Welcome to coursekatta.com educational social media platform to connect world with education. #coursekatta', 1, 'Everyone', '22-09-2017', '4:08 AM', 'No', 'No', '0'),
(2, 'PostImages/1.PNG', 'coursekatta.com welcomes to all educational institutions, startups, students, mentors to share views here. Let''s start our journey towards connecting people for education. #coursekatta', 1, 'Everyone', '22-09-2017', '5:34 AM', 'No', 'No', '1'),
(3, 'PostImages/3.PNG', '#coursekattacafe unique feature which will help you to use advance #datascience technology. ', 1, 'Everyone', '22-09-2017', '5:52 AM', 'No', 'No', '1'),
(4, 'PostImages/2.PNG', '#advertkatta promote your business & product with #coursekatta to reach your dream.', 1, 'Everyone', '22-09-2017', '5:54 AM', 'No', 'No', '1'),
(5, 'PostImages/5.PNG', '#recruitkatta hire best talent from academics with reference & get rid of time consuming process. ', 1, 'Everyone', '22-09-2017', '5:55 AM', 'No', 'No', '1'),
(6, 'PostImages/18a82d62e78befd5645f8922e92c90be--change-the-worlds-for-change.jpg', '', 4, 'Everyone', '22-09-2017', '6:33 AM', 'No', 'No', '0'),
(7, 'PostImages/6.PNG', 'Dear startups,\r\nEveryone is interested your success but no one cares about your efforts & struggle behind that success. At coursekatta we are with you as its win win situation for all of us. Share your journey, struggle & success with us. Form business associations & get networked with mentors, teachers, friends & family. @coursekatta.com #startupkatta', 1, 'Everyone', '23-09-2017', '7:58 AM', 'No', 'No', '1'),
(8, 'PostImages/t.PNG', 'Believe in what you are & keep moving. Your patience, continuous efforts & dedication will soon bring what you are waiting that''s SUCCESS..!!', 1, 'Everyone', '23-09-2017', '8:03 AM', 'No', 'No', '1'),
(9, 'PostImages/5.PNG', 'Hire the best resources from your network with References. Join #Recruitkatta & post your job requirements for FREE..!!! Call +91 77688 00020 for more details. #coursekatta ', 4, 'Everyone', '25-09-2017', '5:03 AM', 'No', 'No', '1'),
(10, 'PostImages/Capture.PNG', 'Believe in Time today may not be your''s but tomorrow it will be..!! #coursekatta ', 1, 'Everyone', '25-09-2017', '5:06 AM', 'No', 'No', '1'),
(11, 'PostImages/1.PNG', 'One stop destination for all your requirements. Call +91 7768800020 for more details. @coursekatta.com', 1, 'Everyone', '26-09-2017', '8:27 AM', 'No', 'No', '1'),
(12, 'PostImages/FB_IMG_1506414922216.jpg', 'We will deliver what we commit. #coursekatta ', 1, 'Everyone', '26-09-2017', '10:53 AM', 'Yes', 'No', '0'),
(13, 'PostImages/Capture.PNG', 'Good Morning dear all..!!', 1, 'Everyone', '26-09-2017', '4:57 AM', 'Yes', 'No', '0'),
(14, 'PostImages/Capture.PNG', 'Good morning dear all..!!\r\nToday''s thought made me think that every child is unique & has capabilities to do something great in life but the problem is DIRECTION.. at coursekatta.com we are committed to give them that direction. ', 1, 'Everyone', '26-09-2017', '4:59 AM', 'Yes', 'No', '0'),
(15, 'PostImages/Thought.PNG', 'Good morning dear all..!! Today''s thought made me think that every child is unique & has capabilities to do something great in life but the problem is DIRECTION.. at coursekatta.com we are committed to give them that direction.', 1, 'Everyone', '26-09-2017', '5:01 AM', 'No', 'No', '0'),
(16, 'PostImages/ck.PNG', 'Its always been observed that there is a huge cap in between Academics & Industry. We are aiming to reduce this gap you want to know how? Then register with www.coursekatta.com an social media platform to support education. #coursekatta #educial ', 1, 'Everyone', '26-09-2017', '6:39 AM', 'No', 'No', '0'),
(17, 'PostImages/1.PNG', 'Don''t just dream it, live it. #coursekatta', 1, 'Everyone', '28-09-2017', '5:24 AM', 'Yes', 'No', '0'),
(18, 'PostImages/11.PNG', 'Don''t just dream it, Live it..!!', 1, 'Everyone', '28-09-2017', '5:30 AM', 'No', 'No', '0'),
(19, 'PostImages/NoImage.png', 'asdasdasd', 3, 'Everyone', '08-10-2017', '09:19', 'Yes', 'Yes', '0'),
(20, 'PostImages/NoImage.png', 'sdasdasd', 3, 'Everyone', '08-10-2017', '09:19', 'Yes', 'Yes', '0'),
(21, 'PostImages/NoImage.png', 'fds sdfs dfsdf', 4, 'Everyone', '09-10-2017', '09:38', 'No', 'Yes', '0'),
(22, 'PostImages/22payment reciept somnath jadhav.PNG', 'asd asd ada dasd ad ', 3, 'Everyone', '12-12-2017', '11:25', 'No', 'Yes', '0'),
(23, 'PostImages/NoImage.png', 'asdh asdlk ahsdiua apoidaiusd uiahsdk jahdi adsh ads', 3, 'Everyone', '12-12-2017', '11:26', 'Yes', 'Yes', '0'),
(24, 'PostImages/NoImage.png', 'df sdf sdf g', 3, 'Everyone', '26-12-2017', '10:57', 'No', 'Yes', '0'),
(25, 'PostImages/NoImage.png', 'asd asd asd ', 3, 'Everyone', '26-12-2017', '10:58', 'No', 'Yes', '0'),
(26, 'PostImages/NoImage.png', ' dfg fhf gh ghjjhk', 3, 'Everyone', '26-12-2017', '10:59', 'No', 'Yes', '0'),
(27, 'PostImages/NoImage.png', 'sdsssssss ssssss', 3, 'Everyone', '26-12-2017', '11:00', 'No', 'Yes', '0'),
(28, 'PostImages/NoImage.png', 'sdf sdf sdf', 3, 'Everyone', '26-12-2017', '11:00', 'No', 'Yes', '0'),
(29, 'PostImages/NoImage.png', 'sdf sdf', 3, 'Everyone', '26-12-2017', '11:00', 'No', 'Yes', '0'),
(30, 'PostImages/30Bhushan photo passport (2).jpg', 'sdffsdf', 3, 'Everyone', '26-12-2017', '11:01', 'No', 'Yes', '0'),
(31, 'PostImages/31Bhushan photo passport (2).jpg', 'sdf sdf sdf', 3, 'Everyone', '26-12-2017', '11:01', 'No', 'Yes', '0');

-- --------------------------------------------------------

--
-- Table structure for table `tbl_post_forad`
--

CREATE TABLE `tbl_post_forad` (
  `Post_Id` bigint(20) NOT NULL,
  `PostImage` text,
  `Post_Description` text,
  `intStudentId` bigint(20) DEFAULT NULL,
  `Skill_Id` text,
  `Dates` text,
  `Times` text,
  `DeletePost` text,
  `Approve` text,
  `Vote` text,
  `varOrderId` text NOT NULL,
  `varFrom` text NOT NULL,
  `varTo` text NOT NULL,
  `varStatus` text NOT NULL,
  `ex1` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Dumping data for table `tbl_post_forad`
--

INSERT INTO `tbl_post_forad` (`Post_Id`, `PostImage`, `Post_Description`, `intStudentId`, `Skill_Id`, `Dates`, `Times`, `DeletePost`, `Approve`, `Vote`, `varOrderId`, `varFrom`, `varTo`, `varStatus`, `ex1`) VALUES
(1, 'PostImages/1Bhushan photo passport (2).jpg', 'dfsdfsdf', 3, 'Everyone', '26-12-2017', '11:03', 'No', 'No', '0', '', '', '', '', 0);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_products`
--
ALTER TABLE `cart_products`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `cart_transaction`
--
ALTER TABLE `cart_transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `cart_transaction_history`
--
ALTER TABLE `cart_transaction_history`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblamcommunication`
--
ALTER TABLE `tblamcommunication`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblamconversation`
--
ALTER TABLE `tblamconversation`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblammembertransactions`
--
ALTER TABLE `tblammembertransactions`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblampackages`
--
ALTER TABLE `tblampackages`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblampackagesdetails`
--
ALTER TABLE `tblampackagesdetails`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblcollegecomp`
--
ALTER TABLE `tblcollegecomp`
  ADD PRIMARY KEY (`intid`);

--
-- Indexes for table `tblcollegecoordinates`
--
ALTER TABLE `tblcollegecoordinates`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblcollegecourses`
--
ALTER TABLE `tblcollegecourses`
  ADD PRIMARY KEY (`intid`);

--
-- Indexes for table `tblcollegedetails`
--
ALTER TABLE `tblcollegedetails`
  ADD PRIMARY KEY (`intCollegeId`);

--
-- Indexes for table `tblcollegemedia`
--
ALTER TABLE `tblcollegemedia`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblcollegeprocess`
--
ALTER TABLE `tblcollegeprocess`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblcollegesocials`
--
ALTER TABLE `tblcollegesocials`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblconnections`
--
ALTER TABLE `tblconnections`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tbledmitracourses`
--
ALTER TABLE `tbledmitracourses`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblfacilities`
--
ALTER TABLE `tblfacilities`
  ADD PRIMARY KEY (`intid`);

--
-- Indexes for table `tblfacultymembers`
--
ALTER TABLE `tblfacultymembers`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tbljobapplications`
--
ALTER TABLE `tbljobapplications`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tbljobs`
--
ALTER TABLE `tbljobs`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblnotifications`
--
ALTER TABLE `tblnotifications`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblproductgallary`
--
ALTER TABLE `tblproductgallary`
  ADD PRIMARY KEY (`id`),
  ADD KEY `room_file_fkey` (`intProductId`);

--
-- Indexes for table `tblproductsubtype`
--
ALTER TABLE `tblproductsubtype`
  ADD PRIMARY KEY (`intProdSubTypeId`);

--
-- Indexes for table `tblproducttype`
--
ALTER TABLE `tblproducttype`
  ADD PRIMARY KEY (`intProdTypeId`);

--
-- Indexes for table `tblproductvariation`
--
ALTER TABLE `tblproductvariation`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblstudenteducationaldetails`
--
ALTER TABLE `tblstudenteducationaldetails`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblstudentschedule`
--
ALTER TABLE `tblstudentschedule`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblsuorder`
--
ALTER TABLE `tblsuorder`
  ADD PRIMARY KEY (`intOrderId`,`intId`),
  ADD KEY `FK__tblSUOrde__intCu__3C69FB99` (`intCustId`),
  ADD KEY `FK__tblSUOrde__intEm__3D5E1FD2` (`intEmpId`);

--
-- Indexes for table `tblsuorderdetails`
--
ALTER TABLE `tblsuorderdetails`
  ADD PRIMARY KEY (`intOrderId`,`intId`),
  ADD KEY `FK__tblSUOrde__intPr__3E52440B` (`intProductId`);

--
-- Indexes for table `tblsuproducts`
--
ALTER TABLE `tblsuproducts`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tbluserdetails`
--
ALTER TABLE `tbluserdetails`
  ADD PRIMARY KEY (`intuserId`);

--
-- Indexes for table `tbluserprofessionaldetails`
--
ALTER TABLE `tbluserprofessionaldetails`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tblvariation`
--
ALTER TABLE `tblvariation`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tbl_adsbyusers`
--
ALTER TABLE `tbl_adsbyusers`
  ADD PRIMARY KEY (`intId`);

--
-- Indexes for table `tbl_likecomment`
--
ALTER TABLE `tbl_likecomment`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tbl_likecomment_forads`
--
ALTER TABLE `tbl_likecomment_forads`
  ADD PRIMARY KEY (`Id`);

--
-- Indexes for table `tbl_post`
--
ALTER TABLE `tbl_post`
  ADD PRIMARY KEY (`Post_Id`);

--
-- Indexes for table `tbl_post_forad`
--
ALTER TABLE `tbl_post_forad`
  ADD PRIMARY KEY (`Post_Id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cart_products`
--
ALTER TABLE `cart_products`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cart_transaction`
--
ALTER TABLE `cart_transaction`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `cart_transaction_history`
--
ALTER TABLE `cart_transaction_history`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblamcommunication`
--
ALTER TABLE `tblamcommunication`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tblamconversation`
--
ALTER TABLE `tblamconversation`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=28;
--
-- AUTO_INCREMENT for table `tblcollegecoordinates`
--
ALTER TABLE `tblcollegecoordinates`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;
--
-- AUTO_INCREMENT for table `tblcollegedetails`
--
ALTER TABLE `tblcollegedetails`
  MODIFY `intCollegeId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tblcollegeprocess`
--
ALTER TABLE `tblcollegeprocess`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblcollegesocials`
--
ALTER TABLE `tblcollegesocials`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tblconnections`
--
ALTER TABLE `tblconnections`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=42;
--
-- AUTO_INCREMENT for table `tbledmitracourses`
--
ALTER TABLE `tbledmitracourses`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=687;
--
-- AUTO_INCREMENT for table `tblfacultymembers`
--
ALTER TABLE `tblfacultymembers`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tblfeedback`
--
ALTER TABLE `tblfeedback`
  MODIFY `intId` int(11) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbljobapplications`
--
ALTER TABLE `tbljobapplications`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbljobs`
--
ALTER TABLE `tbljobs`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;
--
-- AUTO_INCREMENT for table `tblnotifications`
--
ALTER TABLE `tblnotifications`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tblproductgallary`
--
ALTER TABLE `tblproductgallary`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=33;
--
-- AUTO_INCREMENT for table `tblproductsubtype`
--
ALTER TABLE `tblproductsubtype`
  MODIFY `intProdSubTypeId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `tblproducttype`
--
ALTER TABLE `tblproducttype`
  MODIFY `intProdTypeId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tblproductvariation`
--
ALTER TABLE `tblproductvariation`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;
--
-- AUTO_INCREMENT for table `tblstudenteducationaldetails`
--
ALTER TABLE `tblstudenteducationaldetails`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblstudentschedule`
--
ALTER TABLE `tblstudentschedule`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tblsuproducts`
--
ALTER TABLE `tblsuproducts`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
--
-- AUTO_INCREMENT for table `tbluserprofessionaldetails`
--
ALTER TABLE `tbluserprofessionaldetails`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;
--
-- AUTO_INCREMENT for table `tblvariation`
--
ALTER TABLE `tblvariation`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
--
-- AUTO_INCREMENT for table `tbl_adsbyusers`
--
ALTER TABLE `tbl_adsbyusers`
  MODIFY `intId` bigint(20) NOT NULL AUTO_INCREMENT;
--
-- AUTO_INCREMENT for table `tbl_likecomment`
--
ALTER TABLE `tbl_likecomment`
  MODIFY `Id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=44;
--
-- AUTO_INCREMENT for table `tbl_post_forad`
--
ALTER TABLE `tbl_post_forad`
  MODIFY `Post_Id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
