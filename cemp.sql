-- phpMyAdmin SQL Dump
-- version 5.0.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Oct 19, 2020 at 09:50 AM
-- Server version: 10.4.14-MariaDB
-- PHP Version: 7.4.11

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cemp`
--

-- --------------------------------------------------------

--
-- Table structure for table `admit_card_details`
--

CREATE TABLE `admit_card_details` (
  `Applied_id` int(20) NOT NULL,
  `Admit_card_doc` varchar(30) NOT NULL,
  `Date` timestamp NOT NULL DEFAULT current_timestamp(),
  `Time` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `admit_card_details`
--

INSERT INTO `admit_card_details` (`Applied_id`, `Admit_card_doc`, `Date`, `Time`) VALUES
(1, 'GB-123456789', '2020-10-10 10:45:50', '2020-10-10 10:45:50'),
(3, 'TS-456789321', '2020-10-10 10:45:50', '2020-10-10 10:45:50');

-- --------------------------------------------------------

--
-- Table structure for table `applied_form`
--

CREATE TABLE `applied_form` (
  `Applied_id` int(20) NOT NULL,
  `Form_id` int(20) DEFAULT NULL,
  `Exam_id` int(20) DEFAULT NULL,
  `User_id` int(20) DEFAULT NULL,
  `Registration_no` varchar(30) NOT NULL,
  `Date_of_exam` timestamp NOT NULL DEFAULT current_timestamp(),
  `Date_of_filling` timestamp NULL DEFAULT current_timestamp(),
  `Time_of_filling` timestamp NOT NULL DEFAULT current_timestamp(),
  `Admit_card_link` varchar(50) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `applied_form`
--

INSERT INTO `applied_form` (`Applied_id`, `Form_id`, `Exam_id`, `User_id`, `Registration_no`, `Date_of_exam`, `Date_of_filling`, `Time_of_filling`, `Admit_card_link`) VALUES
(1, 1, 1, 2, 'GJ-10001', '2020-10-10 10:43:47', '2020-10-10 10:43:47', '2020-10-10 10:43:47', 'gauravbhojwani.admitcardlink'),
(3, 3, 3, 4, 'GJ-10003', '2020-10-10 10:44:53', '2020-10-10 10:44:53', '2020-10-10 10:44:53', 'triloksharma.admitcardlink');

-- --------------------------------------------------------

--
-- Table structure for table `centre_details`
--

CREATE TABLE `centre_details` (
  `Centre_id` int(20) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `centre_details`
--

INSERT INTO `centre_details` (`Centre_id`, `City`, `State`) VALUES
(1, 'Ahmedabad', 'Gujarat'),
(2, 'Gandhinagar', 'Gujarat'),
(3, 'Mumbai', 'Maharashtra'),
(4, 'Pune', 'Maharashtra'),
(5, 'Jaipur', 'Rajasthan');

-- --------------------------------------------------------

--
-- Table structure for table `complaint_details`
--

CREATE TABLE `complaint_details` (
  `Complaint_id` int(20) NOT NULL,
  `User_id` int(20) DEFAULT NULL,
  `Type` varchar(20) NOT NULL,
  `Applied_id` int(20) DEFAULT NULL,
  `Description` varchar(200) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `complaint_details`
--

INSERT INTO `complaint_details` (`Complaint_id`, `User_id`, `Type`, `Applied_id`, `Description`) VALUES
(100001, 4, 'Link unavailable', 3, 'The link is not available yet..');

-- --------------------------------------------------------

--
-- Table structure for table `documents`
--

CREATE TABLE `documents` (
  `Document_id` int(20) NOT NULL,
  `User_id` int(20) NOT NULL,
  `Photo` varchar(30) NOT NULL,
  `Signature` varchar(30) NOT NULL,
  `Pan_card` varchar(30) NOT NULL,
  `Ssc_doc` varchar(30) NOT NULL,
  `Hsc_doc` varchar(30) NOT NULL,
  `Ug_doc` varchar(30) NOT NULL,
  `Pg_doc` varchar(30) NOT NULL,
  `Iti_doc` varchar(30) NOT NULL,
  `Diploma_doc` varchar(30) NOT NULL,
  `Thumbprint` varchar(30) NOT NULL,
  `Adhaar_doc` varchar(30) NOT NULL,
  `Caste_certificate` varchar(30) NOT NULL,
  `Res_certificate` varchar(30) NOT NULL,
  `Income_certificate` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `documents`
--

INSERT INTO `documents` (`Document_id`, `User_id`, `Photo`, `Signature`, `Pan_card`, `Ssc_doc`, `Hsc_doc`, `Ug_doc`, `Pg_doc`, `Iti_doc`, `Diploma_doc`, `Thumbprint`, `Adhaar_doc`, `Caste_certificate`, `Res_certificate`, `Income_certificate`) VALUES
(1, 2, 'photo.gauravbhojwani', 'signature.gauravbhojwani', 'pancard.gauravbhojwani', 'ss.gauravbhojwani', 'hsc.gauravbhojwani', 'ug.gauravbhojwani', 'pg.gauravbhojwani', '', '', 'thumbprint.gauravbhojwani', '', '', '', '');

-- --------------------------------------------------------

--
-- Table structure for table `exam_form_details`
--

CREATE TABLE `exam_form_details` (
  `Form_id` int(20) NOT NULL,
  `Exam_id` int(20) NOT NULL,
  `Centre_id` int(20) NOT NULL,
  `Date_of_opening` timestamp NOT NULL DEFAULT current_timestamp(),
  `Date_of_closing` timestamp NOT NULL DEFAULT current_timestamp(),
  `Fees` int(20) NOT NULL,
  `Eligibility` varchar(50) NOT NULL,
  `Link` varchar(50) NOT NULL,
  `Date_of_exam` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam_form_details`
--

INSERT INTO `exam_form_details` (`Form_id`, `Exam_id`, `Centre_id`, `Date_of_opening`, `Date_of_closing`, `Fees`, `Eligibility`, `Link`, `Date_of_exam`) VALUES
(1, 1, 1, '2020-10-10 10:40:53', '2020-10-10 10:40:53', 1500, 'Bachelor\'s Degree from any university', 'form1.link', '2020-10-30 18:30:00'),
(2, 2, 2, '2020-10-10 10:42:35', '2020-10-10 10:42:35', 4000, 'Senior Secondary Exam [High School] in any stream ', 'form2.link', '2020-10-30 18:30:00'),
(3, 3, 4, '2020-10-10 10:42:35', '2020-10-10 10:42:35', 1200, 'Candidates who have appeared for Class 12 exam', 'form3.link', '2020-10-29 18:30:00');

-- --------------------------------------------------------

--
-- Table structure for table `exam_master`
--

CREATE TABLE `exam_master` (
  `Exam_id` int(20) NOT NULL,
  `Exam_name` varchar(20) NOT NULL,
  `Exam_type` varchar(20) NOT NULL,
  `Exam_niche` varchar(20) NOT NULL,
  `Name_of_organisation` varchar(80) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `exam_master`
--

INSERT INTO `exam_master` (`Exam_id`, `Exam_name`, `Exam_type`, `Exam_niche`, `Name_of_organisation`, `City`, `State`) VALUES
(1, 'CAT', 'Management', 'National', 'IIM', 'Ahmedabad', 'Gujarat'),
(2, 'CLAT', 'Law', 'National', 'National Law Universities', 'Gandhinagar', 'Gujarat'),
(3, 'NEET', 'Medical', 'National ', 'NTA', 'Mumbai', 'Maharashtra');

-- --------------------------------------------------------

--
-- Table structure for table `feedback_details`
--

CREATE TABLE `feedback_details` (
  `User_id` int(20) NOT NULL,
  `Feedback_id` int(20) NOT NULL,
  `Feedback_msg` varchar(700) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `feedback_details`
--

INSERT INTO `feedback_details` (`User_id`, `Feedback_id`, `Feedback_msg`) VALUES
(2, 1, 'Very simple registration process, swiftly created exams enrollment panel, easy-to-use interface, proctored examination link, proctored invigilation reports, we find this platform to be a one-stop-destination for all exam requirement for any educational institution and Students.'),
(4, 2, 'The entire examination experience for we at this platform has changed since we have registered with common entrance management platform. The once very complicated system of browsing each different websites has now not been necessary.'),
(5, 3, 'Thank you for great service. We are able to apply for an online assessment for any examination across the region with your platform. Thanks for the good platform and great support. Our exams are going smoothly on the computer and mobile devices as well. Looking for continued support in the future.');

-- --------------------------------------------------------

--
-- Table structure for table `manager_details`
--

CREATE TABLE `manager_details` (
  `Manager_id` int(20) NOT NULL,
  `User_type_id` int(20) DEFAULT NULL,
  `Name` varchar(20) DEFAULT NULL,
  `Email` varchar(50) NOT NULL,
  `Age` int(2) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Phone` int(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Adhaar_number` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `manager_details`
--

INSERT INTO `manager_details` (`Manager_id`, `User_type_id`, `Name`, `Email`, `Age`, `Gender`, `Phone`, `Address`, `City`, `State`, `Adhaar_number`) VALUES
(1, 2, 'Nishant Jain', 'nishant.nj2000@gmail.com', 21, 'M', 1234567890, '101, Pratapnagar', 'Dungarpur', 'Rajasthan', 100120023003),
(2, 6, 'Bhupi Kumar', 'bhupi.kumar@gmail.com', 21, 'M', 1008100800, '10, Ram Niwas Avenue', 'Jhansi', 'Uttar Pradesh', 100810081008),
(3, 4, 'Ajay thakur', 'ajay.thakur@gmail.com', 22, 'M', 1008100822, '201, Pragati Nagar', 'Ahmedabad', 'Gujarat', 645869452136);

-- --------------------------------------------------------

--
-- Table structure for table `user_details`
--

CREATE TABLE `user_details` (
  `User_id` int(20) NOT NULL,
  `User_type_id` int(20) DEFAULT NULL,
  `Name` varchar(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `Age` int(2) NOT NULL,
  `Gender` varchar(1) NOT NULL,
  `Phone` bigint(10) NOT NULL,
  `Address` varchar(100) NOT NULL,
  `City` varchar(20) NOT NULL,
  `State` varchar(20) NOT NULL,
  `Adhaar_number` bigint(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_details`
--

INSERT INTO `user_details` (`User_id`, `User_type_id`, `Name`, `Email`, `Age`, `Gender`, `Phone`, `Address`, `City`, `State`, `Adhaar_number`) VALUES
(2, 3, 'Gaurav Bhojwani', 'gaurav.bhojwani@gmail.com', 21, 'M', 9870420069, '301, ISCON-2', 'Ahmedabad', 'Gujarat', 111122223333),
(4, 5, 'Trilok Sharma', 'trilok.sharma@gmail.com', 21, 'M', 8877665544, '12/A, Laxminagar', 'Baroda', 'Gujarat', 202303404505),
(5, 7, 'Rohan Gupta', 'Rohan.gupta@gmail.com', 23, 'M', 10081002442, '401, Fatehgunj', 'Vadodara', 'Gujarat', 651324879536);

-- --------------------------------------------------------

--
-- Table structure for table `user_type_master`
--

CREATE TABLE `user_type_master` (
  `User_type_id` int(20) NOT NULL,
  `Email` varchar(50) NOT NULL,
  `User_type` varchar(30) NOT NULL,
  `Password` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_type_master`
--

INSERT INTO `user_type_master` (`User_type_id`, `Email`, `User_type`, `Password`) VALUES
(1, 'Admin@admin.com', 'Admin', 'Admin@123'),
(2, 'nishant.nj2000@gmail.com', 'Manager', 'Abcde@123'),
(3, 'gaurav.bhojwani@gmail.com', 'Candidate', 'Abcde@123'),
(4, 'ajay.thakur@gmail.com', 'Manager', 'Abcde@123'),
(5, 'trilok.sharma@gmail.com', 'Candidate', 'Abcde@123'),
(6, 'bhupi.kumar@gmail.com', 'Manager', 'Abcde@123'),
(7, 'Rohan.gupta@gmail.com', 'Candidate', 'Abcde@123');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admit_card_details`
--
ALTER TABLE `admit_card_details`
  ADD KEY `Applied_id` (`Applied_id`);

--
-- Indexes for table `applied_form`
--
ALTER TABLE `applied_form`
  ADD PRIMARY KEY (`Applied_id`),
  ADD UNIQUE KEY `Registration_no` (`Registration_no`),
  ADD KEY `Form_id` (`Form_id`,`Exam_id`,`User_id`),
  ADD KEY `User_id` (`User_id`),
  ADD KEY `Exam_id` (`Exam_id`),
  ADD KEY `Applied_id` (`Applied_id`);

--
-- Indexes for table `centre_details`
--
ALTER TABLE `centre_details`
  ADD PRIMARY KEY (`Centre_id`);

--
-- Indexes for table `complaint_details`
--
ALTER TABLE `complaint_details`
  ADD PRIMARY KEY (`Complaint_id`),
  ADD KEY `User_id` (`User_id`,`Applied_id`),
  ADD KEY `Applied_id` (`Applied_id`);

--
-- Indexes for table `documents`
--
ALTER TABLE `documents`
  ADD PRIMARY KEY (`Document_id`),
  ADD UNIQUE KEY `Adhaar_doc` (`Adhaar_doc`),
  ADD KEY `User_id` (`User_id`);

--
-- Indexes for table `exam_form_details`
--
ALTER TABLE `exam_form_details`
  ADD PRIMARY KEY (`Form_id`),
  ADD KEY `Exam_id` (`Exam_id`,`Centre_id`),
  ADD KEY `Centre_id` (`Centre_id`);

--
-- Indexes for table `exam_master`
--
ALTER TABLE `exam_master`
  ADD PRIMARY KEY (`Exam_id`);

--
-- Indexes for table `feedback_details`
--
ALTER TABLE `feedback_details`
  ADD PRIMARY KEY (`Feedback_id`),
  ADD KEY `user_id` (`User_id`);

--
-- Indexes for table `manager_details`
--
ALTER TABLE `manager_details`
  ADD PRIMARY KEY (`Manager_id`),
  ADD UNIQUE KEY `Phone` (`Phone`),
  ADD UNIQUE KEY `Adhaar_number` (`Adhaar_number`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `User_type_id` (`User_type_id`);

--
-- Indexes for table `user_details`
--
ALTER TABLE `user_details`
  ADD PRIMARY KEY (`User_id`),
  ADD UNIQUE KEY `Phone` (`Phone`),
  ADD UNIQUE KEY `Adhaar_number` (`Adhaar_number`),
  ADD UNIQUE KEY `Email` (`Email`),
  ADD KEY `User_type_id` (`User_type_id`),
  ADD KEY `User_type_id_2` (`User_type_id`);

--
-- Indexes for table `user_type_master`
--
ALTER TABLE `user_type_master`
  ADD PRIMARY KEY (`User_type_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `applied_form`
--
ALTER TABLE `applied_form`
  MODIFY `Applied_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `centre_details`
--
ALTER TABLE `centre_details`
  MODIFY `Centre_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `complaint_details`
--
ALTER TABLE `complaint_details`
  MODIFY `Complaint_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100002;

--
-- AUTO_INCREMENT for table `documents`
--
ALTER TABLE `documents`
  MODIFY `Document_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `exam_form_details`
--
ALTER TABLE `exam_form_details`
  MODIFY `Form_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `exam_master`
--
ALTER TABLE `exam_master`
  MODIFY `Exam_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `manager_details`
--
ALTER TABLE `manager_details`
  MODIFY `Manager_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `user_details`
--
ALTER TABLE `user_details`
  MODIFY `User_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `user_type_master`
--
ALTER TABLE `user_type_master`
  MODIFY `User_type_id` int(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `admit_card_details`
--
ALTER TABLE `admit_card_details`
  ADD CONSTRAINT `admit_card_details_ibfk_1` FOREIGN KEY (`Applied_id`) REFERENCES `applied_form` (`Applied_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `applied_form`
--
ALTER TABLE `applied_form`
  ADD CONSTRAINT `applied_form_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user_details` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `applied_form_ibfk_2` FOREIGN KEY (`Exam_id`) REFERENCES `exam_master` (`Exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `applied_form_ibfk_3` FOREIGN KEY (`Form_id`) REFERENCES `exam_form_details` (`Form_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `complaint_details`
--
ALTER TABLE `complaint_details`
  ADD CONSTRAINT `Applied_id` FOREIGN KEY (`Applied_id`) REFERENCES `applied_form` (`Applied_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `User_id` FOREIGN KEY (`User_id`) REFERENCES `user_details` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `documents`
--
ALTER TABLE `documents`
  ADD CONSTRAINT `documents_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user_details` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `exam_form_details`
--
ALTER TABLE `exam_form_details`
  ADD CONSTRAINT `exam_form_details_ibfk_1` FOREIGN KEY (`Exam_id`) REFERENCES `exam_master` (`Exam_id`) ON DELETE CASCADE ON UPDATE CASCADE,
  ADD CONSTRAINT `exam_form_details_ibfk_2` FOREIGN KEY (`Centre_id`) REFERENCES `centre_details` (`Centre_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `feedback_details`
--
ALTER TABLE `feedback_details`
  ADD CONSTRAINT `feedback_details_ibfk_1` FOREIGN KEY (`User_id`) REFERENCES `user_details` (`User_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `manager_details`
--
ALTER TABLE `manager_details`
  ADD CONSTRAINT `manager_details_ibfk_2` FOREIGN KEY (`User_type_id`) REFERENCES `user_type_master` (`User_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;

--
-- Constraints for table `user_details`
--
ALTER TABLE `user_details`
  ADD CONSTRAINT `User_type_id` FOREIGN KEY (`User_type_id`) REFERENCES `user_type_master` (`User_type_id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
