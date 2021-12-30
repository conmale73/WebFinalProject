-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 30, 2021 at 03:09 PM
-- Server version: 10.4.20-MariaDB
-- PHP Version: 8.0.9

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `onlineauction`
--

-- --------------------------------------------------------

--
-- Table structure for table `daugia`
--

CREATE TABLE `daugia` (
  `IDSanPham` varchar(50) CHARACTER SET utf8 NOT NULL,
  `LuotDauGia` int(11) NOT NULL,
  `GiaDat` double NOT NULL,
  `IDNguoiDatGia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `daugia`
--

INSERT INTO `daugia` (`IDSanPham`, `LuotDauGia`, `GiaDat`, `IDNguoiDatGia`) VALUES
('CN001', 1, 71000000, 2),
('CN001', 2, 73000000, 1),
('CN001', 3, 74000000, 3),
('CN001', 4, 75000000, 15),
('CN001', 5, 77000000, 2),
('CN001', 6, 80000000, 1),
('CN004', 1, 50000000, 1),
('CN004', 2, 51000000, 2),
('CN004', 3, 52990000, 1),
('CN001', 7, 81000000, 2);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
