-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Aug 07, 2025 at 11:37 AM
-- Server version: 10.4.32-MariaDB
-- PHP Version: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `snapeats_groupx.sql`
--

-- --------------------------------------------------------

--
-- Table structure for table `deliverydriver`
--

CREATE TABLE `deliverydriver` (
  `licenseNumber` varchar(20) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `mobileNumber` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `dateOfBirth` date DEFAULT NULL,
  `currentLocation` varchar(100) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `deliverydriver`
--

INSERT INTO `deliverydriver` (`licenseNumber`, `firstName`, `lastName`, `mobileNumber`, `email`, `dateOfBirth`, `currentLocation`) VALUES
('D001', 'Alex', 'White', '0411222333', 'alex@example.com', '1995-01-01', 'Parramatta'),
('D002', 'Hannah', 'Green', '0411222444', 'hannah@example.com', '1998-03-05', 'Penrith'),
('D003', 'Liam', 'Black', '0411222555', 'liam@example.com', '2000-07-15', 'Sydney'),
('D004', 'Chloe', 'Blue', '0411222666', 'chloe@example.com', '1993-11-20', 'Liverpool'),
('D005', 'Ethan', 'Grey', '0411222777', 'ethan@example.com', '1991-09-10', 'Blacktown');

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `memberId` int(11) NOT NULL,
  `firstName` varchar(50) DEFAULT NULL,
  `lastName` varchar(50) DEFAULT NULL,
  `street` varchar(100) DEFAULT NULL,
  `town` varchar(50) DEFAULT NULL,
  `postcode` varchar(10) DEFAULT NULL,
  `mobileNumber` varchar(15) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `membershipType` enum('Standard','Deluxe','Premium') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`memberId`, `firstName`, `lastName`, `street`, `town`, `postcode`, `mobileNumber`, `email`, `membershipType`) VALUES
(1, 'John', 'Smith', '12 Oak St', 'Sydney', '2000', '0412345678', 'john@example.com', 'Standard'),
(2, 'Emily', 'Jones', '34 Pine St', 'Parramatta', '2150', '0423456789', 'emily@example.com', 'Deluxe'),
(3, 'Michael', 'Lee', '56 Elm St', 'Liverpool', '2170', '0434567890', 'michael@example.com', 'Premium'),
(4, 'Sarah', 'Brown', '78 Maple St', 'Blacktown', '2148', '0445678901', 'sarah@example.com', 'Standard'),
(5, 'Daniel', 'Taylor', '90 Birch St', 'Penrith', '2750', '0456789012', 'daniel@example.com', 'Deluxe');

-- --------------------------------------------------------

--
-- Table structure for table `menuitem`
--

CREATE TABLE `menuitem` (
  `itemCode` varchar(10) NOT NULL,
  `restaurantCode` char(3) DEFAULT NULL,
  `description` varchar(255) DEFAULT NULL,
  `price` decimal(5,2) DEFAULT NULL,
  `calories` int(11) DEFAULT NULL,
  `dietaryClassification` enum('Vegan','Vegetarian','None') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `menuitem`
--

INSERT INTO `menuitem` (`itemCode`, `restaurantCode`, `description`, `price`, `calories`, `dietaryClassification`) VALUES
('201', '101', 'Pepperoni Pizza', 15.99, 800, 'None'),
('202', '102', 'Salmon Sushi', 12.50, 400, 'None'),
('203', '103', 'Cheeseburger', 10.00, 700, 'None'),
('204', '104', 'Butter Chicken', 13.50, 600, 'Vegetarian'),
('205', '105', 'Beef Taco', 8.00, 500, 'None');

-- --------------------------------------------------------

--
-- Table structure for table `orderitem`
--

CREATE TABLE `orderitem` (
  `orderId` int(11) NOT NULL,
  `itemCode` varchar(10) NOT NULL,
  `quantity` int(11) DEFAULT NULL,
  `specialRequest` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orderitem`
--

INSERT INTO `orderitem` (`orderId`, `itemCode`, `quantity`, `specialRequest`) VALUES
(301, '201', 1, 'Extra cheese'),
(302, '202', 2, 'No wasabi'),
(303, '203', 1, ''),
(304, '204', 3, 'Mild spice'),
(305, '205', 2, 'Add guacamole');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `orderId` int(11) NOT NULL,
  `memberId` int(11) DEFAULT NULL,
  `restaurantCode` char(3) DEFAULT NULL,
  `deliveryDriverId` varchar(20) DEFAULT NULL,
  `date` date DEFAULT NULL,
  `status` enum('Preparing','Picked Up','Delivered','Cancelled') DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`orderId`, `memberId`, `restaurantCode`, `deliveryDriverId`, `date`, `status`) VALUES
(301, 1, '101', 'D001', '2025-08-01', 'Delivered'),
(302, 2, '102', 'D002', '2025-08-02', 'Delivered'),
(303, 3, '103', 'D003', '2025-08-03', 'Preparing'),
(304, 4, '104', 'D004', '2025-08-04', 'Cancelled'),
(305, 5, '105', 'D005', '2025-08-05', 'Delivered');

-- --------------------------------------------------------

--
-- Table structure for table `restaurant`
--

CREATE TABLE `restaurant` (
  `restaurantCode` char(3) NOT NULL,
  `name` varchar(50) DEFAULT NULL,
  `address` varchar(100) DEFAULT NULL,
  `email` varchar(100) DEFAULT NULL,
  `contactNumber` varchar(15) DEFAULT NULL,
  `cuisineType` varchar(30) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `restaurant`
--

INSERT INTO `restaurant` (`restaurantCode`, `name`, `address`, `email`, `contactNumber`, `cuisineType`) VALUES
('101', 'Pizza Planet', '123 Main St', 'pizza@planet.com', '0298765432', 'Italian'),
('102', 'Sushi World', '456 Queen St', 'sushi@world.com', '0287654321', 'Japanese'),
('103', 'Burger Haven', '789 King St', 'burger@haven.com', '0276543210', 'American'),
('104', 'Curry Corner', '321 Prince St', 'curry@corner.com', '0265432109', 'Indian'),
('105', 'Taco Town', '654 Duke St', 'taco@town.com', '0254321098', 'Mexican');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `deliverydriver`
--
ALTER TABLE `deliverydriver`
  ADD PRIMARY KEY (`licenseNumber`);

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`memberId`);

--
-- Indexes for table `menuitem`
--
ALTER TABLE `menuitem`
  ADD PRIMARY KEY (`itemCode`),
  ADD KEY `restaurantCode` (`restaurantCode`);

--
-- Indexes for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD PRIMARY KEY (`orderId`,`itemCode`),
  ADD KEY `itemCode` (`itemCode`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`orderId`),
  ADD KEY `memberId` (`memberId`),
  ADD KEY `restaurantCode` (`restaurantCode`),
  ADD KEY `deliveryDriverId` (`deliveryDriverId`);

--
-- Indexes for table `restaurant`
--
ALTER TABLE `restaurant`
  ADD PRIMARY KEY (`restaurantCode`);

--
-- Constraints for dumped tables
--

--
-- Constraints for table `menuitem`
--
ALTER TABLE `menuitem`
  ADD CONSTRAINT `menuitem_ibfk_1` FOREIGN KEY (`restaurantCode`) REFERENCES `restaurant` (`restaurantCode`);

--
-- Constraints for table `orderitem`
--
ALTER TABLE `orderitem`
  ADD CONSTRAINT `orderitem_ibfk_1` FOREIGN KEY (`orderId`) REFERENCES `orders` (`orderId`),
  ADD CONSTRAINT `orderitem_ibfk_2` FOREIGN KEY (`itemCode`) REFERENCES `menuitem` (`itemCode`);

--
-- Constraints for table `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`memberId`) REFERENCES `member` (`memberId`),
  ADD CONSTRAINT `orders_ibfk_2` FOREIGN KEY (`restaurantCode`) REFERENCES `restaurant` (`restaurantCode`),
  ADD CONSTRAINT `orders_ibfk_3` FOREIGN KEY (`deliveryDriverId`) REFERENCES `deliverydriver` (`licenseNumber`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
