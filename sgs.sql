SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `cms`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin`
--

CREATE TABLE `admin` (
  `id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `password` varchar(250) NOT NULL,
  `updationDate` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `admin`
--

INSERT INTO `admin` (`id`, `username`, `password`, `updationDate`) VALUES
(1, 'admin', 'f925916e2754e5e03f75dd58a5733251', '18-10-2020 04:18:16');

-- --------------------------------------------------------

--
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `id` int(11) NOT NULL,
  `categoryName` varchar(255) DEFAULT NULL,
  `categoryDescription` longtext DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`id`, `categoryName`, `categoryDescription`, `creationDate`, `updationDate`) VALUES
(1, 'IIIT Kalyani', 'B+', '2020-01-15 09:16:07', NULL),
(2, 'ANITS', 'B+', '2020-01-15 09:18:34', NULL),
(3, 'VIT', 'B+', '2020-01-15 09:18:34', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `college`
--

CREATE TABLE `college` (
  `id` int(11) DEFAULT NULL,
  `category` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `college`
--

INSERT INTO `college` (`id`, `category`) VALUES
(1, 'Paper Revaluation'),
(2, 'Exam'),
(3, 'Admission'),
(4, 'Finance'),
(5, 'Lecture Time Table'),
(6, 'Other');
--
-- Table structure for table `complaintremark`
--

CREATE TABLE `complaintremark` (
  `id` int(11) NOT NULL,
  `complaintNumber` int(11) NOT NULL,
  `status` varchar(255) NOT NULL,
  `remark` mediumtext NOT NULL,
  `remarkDate` timestamp NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `complaintremark`
--

INSERT INTO `complaintremark` (`id`, `complaintNumber`, `status`, `remark`, `remarkDate`) VALUES
(1, 2, 'closed', 'hjk', '2020-01-18 09:30:38'),
(2, 6, 'closed', 'resolved', '2020-01-20 06:48:28'),
(3, 7, 'in process', 'GTGT', '2020-01-20 10:06:27'),
(4, 7, 'closed', 'CASE SOLVED', '2020-01-20 10:07:21');

-- --------------------------------------------------------

--
-- Table structure for table `days`
--

CREATE TABLE `days` (
  `id` int(11) NOT NULL,
  `rem_time` date NOT NULL,
  `complaintNumber` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `level`
--

CREATE TABLE `level` (
  `id` int(11) NOT NULL,
  `lname` varchar(20) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `level`
--

INSERT INTO `level` (`id`, `lname`) VALUES
(1, 'University'),
(2, 'Institute'),
(3, 'Department');

CREATE TABLE `state` (
  `id` int(11) NOT NULL,
  `stateName` varchar(255) DEFAULT NULL,
  `stateDescription` tinytext DEFAULT NULL,
  `postingDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `state`
--

INSERT INTO `state` (`id`, `stateName`, `stateDescription`, `postingDate`, `updationDate`) VALUES
(3, 'Kerala', '', '2016-10-18 11:35:02', '0000-00-00 00:00:00'),
(4, 'West Bengal', 'pbPB', '2016-10-18 11:35:58', '0000-00-00 00:00:00'),
(5, 'Andhra Pradesh', 'Andhra Pradesh', '2022-09-28 07:20:36', '0000-00-00 00:00:00'),
(6, 'Delhi', 'Delhi', '2022-06-11 10:54:12', '2022-06-24 07:24:19');

-- --------------------------------------------------------

--
-- Table structure for table `subcategory`
--

CREATE TABLE `subcategory` (
  `id` int(11) NOT NULL,
  `categoryid` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `creationDate` timestamp NULL DEFAULT current_timestamp(),
  `updationDate` timestamp NULL DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `subcategory`
--

INSERT INTO `subcategory` (`id`, `categoryid`, `subcategory`, `creationDate`, `updationDate`) VALUES
(1, 2, 'CS', '2020-01-15 05:53:34', NULL),
(2, 2, 'IT', '2020-01-15 05:53:34', NULL),
(3, 2, 'ECE', '2022-06-24 07:06:44', '2020-01-15 05:49:34'),
(4, 2, 'EEE', '2020-01-15 05:53:34', NULL),
(5, 1, 'CS', '2020-01-15 09:52:30', NULL),
(6, 1, 'IT', '2020-01-15 09:52:30', NULL),
(7, 1, 'ECE', '2020-01-15 09:52:30', NULL),
(8, 1, 'EEE', '2020-01-15 09:52:30', NULL),
(9, 3, 'CS', '2020-01-15 09:52:30', NULL),
(10, 3, 'IT', '2020-01-15 09:52:30', NULL),
(11, 3, 'ECE', '2020-01-15 09:52:30', NULL),
(12, 3, 'EEE', '2020-01-15 09:52:30', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tblcomplaints`
--

CREATE TABLE `tblcomplaints` (
  `complaintNumber` int(11) NOT NULL,
  `userId` int(11) DEFAULT NULL,
  `category` int(11) DEFAULT NULL,
  `subcategory` varchar(255) DEFAULT NULL,
  `complaintType` varchar(255) DEFAULT NULL,
  `state` varchar(255) DEFAULT NULL,
  `noc` varchar(255) DEFAULT NULL,
  `complaintDetails` mediumtext,
  `complaintFile` varchar(255) DEFAULT NULL,
  `regDate` timestamp NULL DEFAULT CURRENT_TIMESTAMP,
  `status` varchar(50) DEFAULT NULL,
  `lastUpdationDate` timestamp NULL DEFAULT NULL ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tblcomplaints`
--

INSERT INTO `tblcomplaints` (`complaintNumber`, `userId`, `category`, `subcategory`, `complaintType`, `state`, `noc`, `complaintDetails`, `complaintFile`, `regDate`, `status`, `lastUpdationDate`) VALUES
(1, 1, 1, 'E-wllaet', 'General Query', 'West bengal', 'test demo', 'test demo test demo test demotest demotest demotest demotest demotest demotest demotest demotest demo', '', '2022-09-30 16:52:40', 'closed', '2022-06-24 10:29:37'),
(2, 1, 1, 'Online SHopping', 'General Query', 'West bengal', 'testing', 'sample text for demo', '', '2022-09-30 17:05:56', 'in process', '2022-04-01 17:29:19'),
(3, 1, 1, 'Online SHopping', ' Complaint', 'West bengal', 'ferwekt lwentgwewt', 'wetwetwe', '', '2022-09-30 17:07:51', 'in process', '2022-05-02 15:57:43'),
(4, 1, 1, 'E-wllaet', 'General Query', 'Haryana', 'lkdlsfklsdf', 'fdsf,msd,f  f f', '', '2022-09-30 17:13:14', 'closed', '2022-06-24 10:29:37'),
(5, 1, 1, 'E-wllaet', ' Complaint', 'West bengal', 'bgfhfgh', 'hfghfgh', '', '2022-09-30 17:14:55', 'in process', '2022-06-24 10:29:37'),
(6, 1, 1, 'E-wllaet', ' Complaint', 'West bengal', 'bgfhfgh', 'hfghfgh', '', '2022-09-30 17:20:16', NULL, '2022-06-24 10:29:37'),
(7, 1, 1, 'E-wllaet', ' Complaint', 'West bengal', 'bgfhfgh', 'hfghfgh', '', '2022-09-30 17:20:56', NULL, '2022-06-24 10:29:37'),
(8, 1, 1, 'E-wllaet', ' Complaint', 'West bengal', 'bgfhfgh', 'hfghfgh', '', '2022-09-30 17:23:05', NULL, '2022-06-24 10:29:37'),
(9, 1, 1, 'E-wllaet', ' Complaint', 'West bengal', 'bgfhfgh', 'hfghfgh', '', '2022-09-30 17:25:09', 'in process', '2022-06-24 10:29:37'),
(10, 1, 1, 'E-wllaet', ' Complaint', 'West bengal', 'bgfhfgh', 'hfghfgh', '', '2022-09-30 17:27:24', NULL, '2022-06-24 10:29:37'),
(11, 1, 1, 'Online SHopping', 'General Query', 'Haryana', 'dsflsdlflsdf', 'fsdfsdfsdf', '', '2022-09-30 17:36:32', NULL, '2022-06-24 10:29:37'),
(12, 1, 1, 'Online SHopping', 'General Query', 'Haryana', 'dsflsdlflsdf', 'fsdfsdfsdf', '', '2022-09-30 17:37:09', NULL, '2022-06-24 10:29:37'),
(13, 1, 1, 'Online SHopping', 'General Query', 'Haryana', 'dsflsdlflsdf', 'fsdfsdfsdf', '', '2022-09-30 17:39:57', NULL, '2022-06-24 10:29:37'),
(14, 1, 1, 'Online SHopping', ' Complaint', 'Haryana', 'vcxvxcvxcv', 'cvcx', '', '2022-09-30 17:41:19', NULL, '2022-06-24 10:29:37'),
(15, 1, 1, 'E-wllaet', 'General Query', 'West bengal', 'dsfsd', 'fsdfsdf', '', '2022-09-30 17:42:38', NULL, '0000-00-00 00:00:00'),
(16, 1, 1, 'E-wllaet', 'General Query', 'West bengal', 'dsfsd', 'fsdfsdf', '', '2022-09-31 01:54:07', NULL, '0000-00-00 00:00:00'),
(17, 5, 1, 'E-wllaet', ' Complaint', 'fsdfs', 'regarding refund', 'test test', '', '2022-06-11 10:57:49', NULL, '0000-00-00 00:00:00'),
(18, 5, 1, 'Online SHopping', ' Complaint', 'AndhraPradesh', 'yhytr', 'rtytry', '', '2022-06-11 11:08:47', NULL, '2022-06-24 10:29:37'),
(19, 6, 1, 'Online SHopping', ' Complaint', 'AndhraPradesh', 'regarding refund', 'Test@123 dfds fsd fs gs gsd g sg g g sgstwerwe ewtw tw', '', '2022-06-11 11:15:24', 'closed', '2022-06-24 10:29:37'),
(20, 1, 1, 'E-wllaet', 'General Query', 'fsdfs', 'sdgsdg', 'gdgsdgsd', '', '2022-05-24 18:26:23', NULL, '0000-00-00 00:00:00'),
(21, 1, 1, 'Online SHopping', 'General Query', 'AndhraPradesh', 'csdf', 'fsdfs', '', '2022-05-24 18:26:55', NULL, '0000-00-00 00:00:00'),
(22, 1, 1, 'Online SHopping', 'General Query', 'AndhraPradesh', 'csdf', 'fsdfs', '', '2022-05-24 18:27:02', NULL, '0000-00-00 00:00:00'),
(23, 1, 1, 'E-wllaet', ' Complaint', 'Delhi', 'This is sample text for testing.', 'This is sample text for testing.', '2a09969b-c3d5-467b-82b0-2cf5aeb903eb_200x200.png', '2022-06-24 10:31:19', 'closed', '2022-06-24 10:37:09');

-- --------------------------------------------------------

--
-- Table structure for table `userlog`
--

CREATE TABLE `userlog` (
  `id` int(11) NOT NULL,
  `uid` int(11) NOT NULL,
  `username` varchar(255) NOT NULL,
  `userip` binary(16) NOT NULL,
  `loginTime` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `logout` varchar(255) NOT NULL,
  `status` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `userlog`
--

INSERT INTO `userlog` (`id`, `uid`, `username`, `userip`, `loginTime`, `logout`, `status`) VALUES
(1, 1, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-09-28 17:04:36', '', 1),
(2, 1, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-09-29 15:02:26', '', 1),
(3, 1, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-09-30 14:58:00', '', 1),
(4, 0, 'dsad', 0x3a3a3100000000000000000000000000, '2022-09-31 17:39:07', '', 0),
(5, 0, 'dwerwer', 0x3a3a3100000000000000000000000000, '2022-09-31 17:41:22', '', 0),
(6, 0, 'ffert', 0x3a3a3100000000000000000000000000, '2022-09-31 17:41:29', '', 0),
(7, 0, 'ewrwe', 0x3a3a3100000000000000000000000000, '2022-09-31 17:42:12', '', 0),
(8, 0, 'ewrwe', 0x3a3a3100000000000000000000000000, '2022-09-31 17:47:51', '', 0),
(9, 0, 'ewrwe', 0x3a3a3100000000000000000000000000, '2022-09-31 17:47:54', '', 0),
(10, 0, 'fsdfsdff', 0x3a3a3100000000000000000000000000, '2022-09-31 17:48:11', '', 0),
(11, 1, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-09-31 17:49:25', '', 1),
(12, 1, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-01 18:52:35', '02-04-2022 12:24:41 AM', 1),
(13, 1, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-01 18:58:09', '02-04-2022 12:50:42 AM', 1),
(14, 1, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-01 19:38:15', '02-04-2022 01:08:19 AM', 1),
(15, 0, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-02 18:50:20', '', 0),
(16, 1, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-04-02 18:50:28', '03-04-2022 12:26:50 AM', 1),
(17, 1, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-02 18:01:26', '', 1),
(18, 0, 'test@gm.com', 0x3a3a3100000000000000000000000000, '2022-06-11 10:48:50', '', 0),
(19, 5, 'abc@abc.com', 0x3a3a3100000000000000000000000000, '2022-06-11 10:56:30', '11-06-2022 04:39:15 PM', 1),
(20, 6, 'xyz@xyz.com', 0x3a3a3100000000000000000000000000, '2022-06-11 11:13:28', '11-06-2022 04:45:46 PM', 1),
(21, 6, 'xyz@xyz.com', 0x3a3a3100000000000000000000000000, '2022-06-11 11:19:45', '11-06-2022 04:50:02 PM', 1),
(22, 1, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-05-24 18:26:07', '', 1),
(23, 0, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-09-05 17:05:22', '', 0),
(24, 0, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-09-05 17:05:32', '', 0),
(25, 1, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-09-05 17:07:12', '', 1),
(26, 1, 'jeswanthbunnyn@gmail.com', 0x3a3a3100000000000000000000000000, '2022-06-24 10:27:30', '24-06-2022 04:11:08 PM', 1);

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `fullName` varchar(255) DEFAULT NULL,
  `userEmail` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `contactNo` bigint(11) DEFAULT NULL,
  `address` tinytext,
  `State` varchar(255) DEFAULT NULL,
  `country` varchar(255) DEFAULT NULL,
  `pincode` int(6) DEFAULT NULL,
  `userImage` varchar(255) DEFAULT NULL,
  `regDate` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `updationDate` timestamp NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP,
  `status` int(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `fullName`, `userEmail`, `password`, `contactNo`, `address`, `State`, `country`, `pincode`, `userImage`, `regDate`, `updationDate`, `status`) VALUES
(1, 'Jeswanth', 'jeswanthbunnyn@gmail.com', 'f925916e2754e5e03f75dd58a5733251', 9866795026, 'Warangal', 'AndhraPradesh', 'India', 110092, '6e8024ec26c292f258ec30f01e0392dc.png', '2022-09-28 11:44:52', '2022-06-24 10:39:44', 1);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin`
--
ALTER TABLE `admin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `complaintremark`
--
ALTER TABLE `complaintremark`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `days`
--
ALTER TABLE `days`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `level`
--
ALTER TABLE `level`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `state`
--
ALTER TABLE `state`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `subcategory`
--
ALTER TABLE `subcategory`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  ADD PRIMARY KEY (`complaintNumber`);

--
-- Indexes for table `userlog`
--
ALTER TABLE `userlog`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin`
--
ALTER TABLE `admin`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `category`
--
ALTER TABLE `category`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `complaintremark`
--
ALTER TABLE `complaintremark`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `state`
--
ALTER TABLE `state`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `subcategory`
--
ALTER TABLE `subcategory`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=13;

--
-- AUTO_INCREMENT for table `tblcomplaints`
--
ALTER TABLE `tblcomplaints`
  MODIFY `complaintNumber` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `userlog`
--
ALTER TABLE `userlog`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=109;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;
COMMIT;



/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;