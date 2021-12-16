-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Dec 16, 2021 at 02:58 PM
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
-- Table structure for table `category`
--

CREATE TABLE `category` (
  `IDDanhMuc` int(11) NOT NULL,
  `TenDanhMuc` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category`
--

INSERT INTO `category` (`IDDanhMuc`, `TenDanhMuc`) VALUES
(2, 'Đồ cổ'),
(1, 'Đồ công nghệ');

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
('CN001', 2, 73000000, 1);

-- --------------------------------------------------------

--
-- Table structure for table `hoadon`
--

CREATE TABLE `hoadon` (
  `IDHoaDon` int(11) NOT NULL,
  `IDSanPham` int(11) NOT NULL,
  `IDNguoiBan` int(11) NOT NULL,
  `IDNguoiMua` int(11) NOT NULL,
  `GiaBan` double NOT NULL,
  `ThoiGianBan` datetime NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

-- --------------------------------------------------------

--
-- Table structure for table `product`
--

CREATE TABLE `product` (
  `IDSanPham` varchar(10) CHARACTER SET utf8 NOT NULL,
  `TenSanPham` varchar(255) CHARACTER SET utf8 NOT NULL,
  `IDNguoiBan` int(11) NOT NULL,
  `GiaHienTai` int(11) NOT NULL,
  `GiaMuaNgay` double DEFAULT NULL,
  `BuocGia` double NOT NULL,
  `IDDanhMuc` int(11) NOT NULL,
  `IDNguoiGiuGiaHienTai` int(11) NOT NULL,
  `ThoiGianDangBan` datetime NOT NULL,
  `ThoiGianKetThuc` datetime NOT NULL,
  `ChiTiet` text CHARACTER SET utf8 DEFAULT NULL,
  `AnhChinh` varchar(100) CHARACTER SET utf8 DEFAULT NULL,
  `AnhPhu` varchar(100) CHARACTER SET utf8 DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `product`
--

INSERT INTO `product` (`IDSanPham`, `TenSanPham`, `IDNguoiBan`, `GiaHienTai`, `GiaMuaNgay`, `BuocGia`, `IDDanhMuc`, `IDNguoiGiuGiaHienTai`, `ThoiGianDangBan`, `ThoiGianKetThuc`, `ChiTiet`, `AnhChinh`, `AnhPhu`) VALUES
('CN001', 'Máy tính Apple Mac Pro', 1, 73000000, 150000000, 1000000, 1, 2, '2021-12-03 20:03:25', '2021-12-07 20:03:25', 'Phiên bản Mac Pro 2019 tiêu chuẩn với chip Intel Xeon W 8 nhân 3.5GHz, RAM 48GB, SSD 256GB và VGA Radeon Pro 580X có giá bán 5.999 USD, nhưng được bán trong cửa hàng tân trang của Apple với giá 5.349 USD. ', 'anhchinh.jpg', 'anhphu1.jpg'),
('DC001', 'Thánh chỉ vua Càn Long', 1, 300000000, 500000000, 10000000, 2, 2, '2021-12-14 10:01:49', '2021-12-21 16:01:50', 'Thánh Chỉ niên hiệu vua Càn Long', 'anhchinh.jpg', 'anhphu1.jpg');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `ID` int(11) NOT NULL,
  `username` varchar(255) CHARACTER SET utf8 NOT NULL,
  `password` varchar(255) CHARACTER SET utf8 NOT NULL,
  `HoTen` varchar(50) CHARACTER SET utf8 NOT NULL,
  `NgaySinh` date NOT NULL,
  `DiaChi` varchar(200) CHARACTER SET utf8 NOT NULL,
  `Email` varchar(50) CHARACTER SET utf8 NOT NULL,
  `DiemUyTin` int(3) NOT NULL DEFAULT 90,
  `Quyen` int(1) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`ID`, `username`, `password`, `HoTen`, `NgaySinh`, `DiaChi`, `Email`, `DiemUyTin`, `Quyen`) VALUES
(1, 'helloworld1', '$2a$12$i2hAfx0keY737E7d9NHfQeZyJJ0Hxc0cB8f6553QYoUy0zc80fiqa', 'Dương Quá', '2001-12-11', 'TP Hồ Chí Minh', 'quanhi@gmail.com', 90, 1),
(2, 'femaletieulong', '$2a$12$i2hAfx0keY737E7d9NHfQeZyJJ0Hxc0cB8f6553QYoUy0zc80fiqa', 'Tiểu Long Nữ Cute', '1995-12-14', 'TP Hồ Chí Minh', 'coco@gmail.com', 90, 0),
(3, 'anything', '$2a$12$/GeXCmk0Ui.PcU/N/x0ej.1.hC/asP5dY3faHU.3X2vTkhZ/3awl.', 'Any', '2009-12-13', 'Quáº£ng NgÃ£i', 'abcxyz@gmail.com', 90, 0),
(4, 'damn', '$2a$12$IdkOYvigeQO2.vNDyTyNHOsvGEpicUdBjiYO8Pxov.WgATAKNvhS2', 'Damn Bro', '2021-12-25', 'áº¥c351313', 'a1sd531@gmail.com', 90, 0),
(5, 'admin2', '$2a$12$ljL/vuh6tqr6mElrjeLpaO24foa6rx3zm8TzS44ISogVO97ph1k/q', 'Admin No.2', '2001-03-07', 'QN', 'conmalenumber2@gmail.com', 90, 2);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`IDDanhMuc`),
  ADD UNIQUE KEY `IDDanhMuc` (`IDDanhMuc`),
  ADD UNIQUE KEY `TenDanhMuc` (`TenDanhMuc`);

--
-- Indexes for table `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`IDHoaDon`);

--
-- Indexes for table `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`IDSanPham`),
  ADD UNIQUE KEY `IDSanPham` (`IDSanPham`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
