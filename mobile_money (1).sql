-- phpMyAdmin SQL Dump
-- version 4.6.5.2
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Jul 12, 2017 at 09:40 AM
-- Server version: 10.1.21-MariaDB
-- PHP Version: 5.6.30

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `mobile_money`
--

-- --------------------------------------------------------

--
-- Table structure for table `airtel_commission`
--

CREATE TABLE `airtel_commission` (
  `id` int(11) NOT NULL,
  `Kiosk_name` varchar(250) NOT NULL,
  `commission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `airtel_commission`
--

INSERT INTO `airtel_commission` (`id`, `Kiosk_name`, `commission`) VALUES
(1, 'wandegeya', 0),
(2, 'kikoni', 200),
(3, 'kawempe', 500),
(4, 'kiwuunya', 285),
(5, 'muk', 0);

-- --------------------------------------------------------

--
-- Table structure for table `kiosk`
--

CREATE TABLE `kiosk` (
  `kiosk_id` int(11) NOT NULL,
  `Kiosk_name` varchar(20) NOT NULL,
  `kiosk_phone_number` varchar(20) NOT NULL,
  `airtel_float` int(11) NOT NULL,
  `MTN_float` int(11) NOT NULL,
  `airtel_cash` int(11) NOT NULL,
  `MTN_cash` int(11) NOT NULL,
  `attendant_username` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kiosk`
--

INSERT INTO `kiosk` (`kiosk_id`, `Kiosk_name`, `kiosk_phone_number`, `airtel_float`, `MTN_float`, `airtel_cash`, `MTN_cash`, `attendant_username`) VALUES
(1, 'wandegeya', '0700310267', 939000, 946000, 5000, 64000, 'client1'),
(2, 'kikoni', '0774863109', 920450, 880000, 140000, 150000, 'client2'),
(3, 'kawempe', '0754243503', 1018000, 1010000, 32000, 10000, 'client3'),
(4, 'kiwuunya', '0756966966', 580000, 500000, 50000, 40000, 'client4'),
(5, 'muk', '0700021267', 1600000, 1600000, 0, 400000, 'client5');

-- --------------------------------------------------------

--
-- Table structure for table `kiosk_attendant`
--

CREATE TABLE `kiosk_attendant` (
  `attendant_id` int(11) NOT NULL,
  `username` varchar(250) NOT NULL,
  `agent_number` varchar(11) NOT NULL,
  `kiosk_name` varchar(250) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `kiosk_attendant`
--

INSERT INTO `kiosk_attendant` (`attendant_id`, `username`, `agent_number`, `kiosk_name`) VALUES
(1, 'client1', '0700310267', 'wandegeya'),
(2, 'client2', '0774863109', 'kikoni'),
(3, 'client3', '0754243503', 'kawempe'),
(4, 'client4', '0756966966', 'kiwuunya'),
(5, 'client5', '0700021267', 'muk');

-- --------------------------------------------------------

--
-- Table structure for table `mtn_commission`
--

CREATE TABLE `mtn_commission` (
  `id` int(11) NOT NULL,
  `Kiosk_name` varchar(250) NOT NULL,
  `commission` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `mtn_commission`
--

INSERT INTO `mtn_commission` (`id`, `Kiosk_name`, `commission`) VALUES
(2, 'wandegeya', 0),
(3, 'kikoni', 435),
(4, 'kawempe', 450),
(5, 'muk', 850);

-- --------------------------------------------------------

--
-- Table structure for table `transaction`
--

CREATE TABLE `transaction` (
  `transaction_id` int(11) NOT NULL,
  `transaction_type` varchar(11) NOT NULL,
  `date_and_time` varchar(50) NOT NULL,
  `amount` int(11) NOT NULL,
  `kiosk_phone_number` varchar(20) NOT NULL,
  `customer_phone_number` varchar(20) NOT NULL,
  `carrier_network` varchar(11) NOT NULL,
  `comitted_by` varchar(20) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Dumping data for table `transaction`
--

INSERT INTO `transaction` (`transaction_id`, `transaction_type`, `date_and_time`, `amount`, `kiosk_phone_number`, `customer_phone_number`, `carrier_network`, `comitted_by`) VALUES
(1, 'deposit', 'Sun Jul 09 22:12:55 EAT 2017', 5000, '0700310267', '0700023456', 'airtel', 'client1'),
(2, 'deposit', 'Sun Jul 09 22:22:05 EAT 2017', 100000, '0774863109', '0774567823', 'mtn', 'client2'),
(3, 'withdraw', 'Sun Jul 09 22:32:11 EAT 2017', 5000, '0774863109', '0700023456', 'airtel', 'client2'),
(4, 'withdraw', 'Sun Jul 09 22:35:44 EAT 2017', 20000, '0774863109', '0755525641', 'airtel', 'client2'),
(5, 'deposit', 'Sun Jul 09 22:39:10 EAT 2017', 100000, '0774863109', '075500435', 'airtel', 'client2'),
(6, 'deposit', 'Sun Jul 09 22:48:45 EAT 2017', 5000, '0774863109', '0755234562', 'airtel', 'client2'),
(7, 'deposit', 'Sun Jul 09 22:53:10 EAT 2017', 10000, '0774863109', '0700034562', 'airtel', 'client2'),
(8, 'withdraw', 'Sun Jul 09 22:55:34 EAT 2017', 10000, '0774863109', '0754327890', 'airtel', 'client2'),
(9, 'withdraw', 'Mon Jul 10 08:23:04 EAT 2017', 10000, '0754243503', '077756789', 'mtn', 'client3'),
(10, 'deposit', 'Mon Jul 10 08:25:55 EAT 2017', 50000, '0754243503', '0777345266', 'mtn', 'client3'),
(11, 'withdraw', 'Tue Jul 11 11:24:32 EAT 2017', 18000, '0754243503', '0754628975', 'airtel', 'client3'),
(12, 'deposit', 'Tue Jul 11 12:27:47 EAT 2017', 10000, '0700310267', '0700683144', 'airtel', 'client1'),
(13, 'deposit', 'Tue Jul 11 12:35:31 EAT 2017', 20000, '0774863109', '0772336394', 'mtn', 'client2'),
(14, 'deposit', 'Tue Jul 11 12:52:50 EAT 2017', 1000, '0700310267', '0701021643', 'airtel', 'client1'),
(15, 'deposit', 'Tue Jul 11 13:06:51 EAT 2017', 20000, '0756966966', '0754345345', 'airtel', 'client4'),
(16, 'deposit', 'Tue Jul 11 14:03:24 EAT 2017', 400000, '0700021267', '0755000011', 'airtel', 'client5'),
(17, 'deposit', 'Tue Jul 11 14:04:19 EAT 2017', 400000, '0700021267', '0777310245', 'mtn', 'client5');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `airtel_commission`
--
ALTER TABLE `airtel_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `kiosk`
--
ALTER TABLE `kiosk`
  ADD PRIMARY KEY (`kiosk_id`);

--
-- Indexes for table `kiosk_attendant`
--
ALTER TABLE `kiosk_attendant`
  ADD PRIMARY KEY (`attendant_id`);

--
-- Indexes for table `mtn_commission`
--
ALTER TABLE `mtn_commission`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `transaction`
--
ALTER TABLE `transaction`
  ADD PRIMARY KEY (`transaction_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `airtel_commission`
--
ALTER TABLE `airtel_commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kiosk`
--
ALTER TABLE `kiosk`
  MODIFY `kiosk_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `kiosk_attendant`
--
ALTER TABLE `kiosk_attendant`
  MODIFY `attendant_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `mtn_commission`
--
ALTER TABLE `mtn_commission`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
--
-- AUTO_INCREMENT for table `transaction`
--
ALTER TABLE `transaction`
  MODIFY `transaction_id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
