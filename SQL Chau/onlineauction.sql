-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 29, 2021 lúc 11:14 AM
-- Phiên bản máy phục vụ: 10.4.21-MariaDB
-- Phiên bản PHP: 8.0.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `onlineauction`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `category`
--

CREATE TABLE `category` (
  `IDDanhMuc` int(11) NOT NULL,
  `TenDanhMuc` varchar(50) CHARACTER SET utf8 NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `category`
--

INSERT INTO `category` (`IDDanhMuc`, `TenDanhMuc`) VALUES
(2, 'Đồ cổ'),
(1, 'Đồ công nghệ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `daugia`
--

CREATE TABLE `daugia` (
  `IDSanPham` varchar(50) CHARACTER SET utf8 NOT NULL,
  `LuotDauGia` int(11) NOT NULL,
  `GiaDat` double NOT NULL,
  `IDNguoiDatGia` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `daugia`
--

INSERT INTO `daugia` (`IDSanPham`, `LuotDauGia`, `GiaDat`, `IDNguoiDatGia`) VALUES
('CN001', 1, 71000000, 2),
('CN001', 2, 73000000, 1),
('CN001', 2, 73000000, 1),
('CN002', 1, 105990000, 2);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `hoadon`
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
-- Cấu trúc bảng cho bảng `product`
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
-- Đang đổ dữ liệu cho bảng `product`
--

INSERT INTO `product` (`IDSanPham`, `TenSanPham`, `IDNguoiBan`, `GiaHienTai`, `GiaMuaNgay`, `BuocGia`, `IDDanhMuc`, `IDNguoiGiuGiaHienTai`, `ThoiGianDangBan`, `ThoiGianKetThuc`, `ChiTiet`, `AnhChinh`, `AnhPhu`) VALUES
('CN001', 'Laptop Apple Mac Pro', 1, 73000000, 150000000, 1000000, 1, 2, '2021-12-26 07:31:25', '2022-01-07 20:03:25', 'Phiên bản Mac Pro 2019 tiêu chuẩn với chip Intel Xeon W 8 nhân 3.5GHz, RAM 48GB, SSD 256GB và VGA Radeon Pro 580X có giá bán 5.999 USD, nhưng được bán trong cửa hàng tân trang của Apple với giá 5.349 USD. ', 'anhchinh.jpg', 'anhphu1.jpg'),
('CN002', 'Laptop Razer Blade 17 (2021)', 1, 105990000, 116000000, 1000000, 1, 2, '2021-12-26 06:31:05', '2022-01-21 19:31:05', 'Razer Blade 17 (2021) là một trong những chiếc laptop gaming cao cấp đang được săn đón nhất ở thời điểm hiện tai. Khôn chỉ sở hữu thiết kế đẹp mắt với nhiều tính năng ưu việt hơn hẳn các đối thủ. ', 'anhchinh.jpg', 'anhphu1.jpg'),
('CN003', 'MJ\'S Swarovski & Diamond Studded Notebook', 1, 802725000, 913836000, 1000000, 1, 2, '2021-12-26 06:59:44', '2022-01-15 19:59:44', 'Bề mặt nắp laptop được nạm kim cương Swarovski cực kỳ quý giá, và toàn thân máy đều được mạ vàng, chuột dát vàng, thời gian bảo hành lên đến 10 năm. Ngoài ra còn được tặng thêm bọc bằng da cá sấu.', 'anhchinh.jpg', 'anhphu1.jpg'),
('CN004', 'Dell Xps 15 9510 Gen 11th', 1, 52990000, 63000000, 1000000, 1, 2, '2021-12-18 19:54:31', '2022-01-17 19:54:31', 'Dell Xps 9510 đang là chiếc laptop doanh nhân 2 in 1 mỏng nhẹ và bền bỉ nhất hiện nay. Ngoài thiết kế sang trọng, hiện đại thì chiếc máy tính xách tay này còn được đánh giá cao nhờ hiệu năng mạnh mẽ.', 'anhchinh.jpg', 'anhphu1.jpg'),
('CN005', 'CTO – MacBook Pro 16 inch 2020 New– (Space Gray/i9 2.4Ghz/64GB/1TB/5600M)', 1, 108000000, 119000000, 1000000, 1, 2, '2021-12-20 19:49:55', '2022-01-19 19:49:55', 'Theo như giới thiệu, CTO – MacBook Pro 16 inch 2019 New được cho sẽ trở thành chiếc máy tính xách tay tốt nhất trên thế giới.', 'anhchinh.jpg', 'anhphu1.jpg'),
('DC001', 'Thánh chỉ vua Càn Long', 1, 300000000, 500000000, 10000000, 2, 2, '2021-12-14 10:01:49', '2022-01-21 16:01:50', 'Thánh Chỉ niên hiệu vua Càn Long', 'anhchinh.jpg', 'anhphu1.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
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
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`ID`, `username`, `password`, `HoTen`, `NgaySinh`, `DiaChi`, `Email`, `DiemUyTin`, `Quyen`) VALUES
(1, 'helloworld1', '$2a$12$i2hAfx0keY737E7d9NHfQeZyJJ0Hxc0cB8f6553QYoUy0zc80fiqa', 'Dương Quá', '2001-12-11', 'TP Hồ Chí Minh', 'quanhi@gmail.com', 90, 1),
(2, 'femaletieulong', '$2a$12$i2hAfx0keY737E7d9NHfQeZyJJ0Hxc0cB8f6553QYoUy0zc80fiqa', 'Tiểu Long Nữ Cute', '1995-12-14', 'TP Hồ Chí Minh', 'coco@gmail.com', 90, 0),
(3, 'anything', '$2a$12$/GeXCmk0Ui.PcU/N/x0ej.1.hC/asP5dY3faHU.3X2vTkhZ/3awl.', 'Any', '2009-12-13', 'Quáº£ng NgÃ£i', 'abcxyz@gmail.com', 90, 0),
(4, 'damn', '$2a$12$IdkOYvigeQO2.vNDyTyNHOsvGEpicUdBjiYO8Pxov.WgATAKNvhS2', 'Damn Bro', '2021-12-25', 'áº¥c351313', 'a1sd531@gmail.com', 90, 0),
(5, 'admin2', '$2a$12$ljL/vuh6tqr6mElrjeLpaO24foa6rx3zm8TzS44ISogVO97ph1k/q', 'Admin No.2', '2001-03-07', 'QN', 'conmalenumber2@gmail.com', 90, 2);

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `category`
--
ALTER TABLE `category`
  ADD PRIMARY KEY (`IDDanhMuc`),
  ADD UNIQUE KEY `IDDanhMuc` (`IDDanhMuc`),
  ADD UNIQUE KEY `TenDanhMuc` (`TenDanhMuc`);

--
-- Chỉ mục cho bảng `hoadon`
--
ALTER TABLE `hoadon`
  ADD PRIMARY KEY (`IDHoaDon`);

--
-- Chỉ mục cho bảng `product`
--
ALTER TABLE `product`
  ADD PRIMARY KEY (`IDSanPham`),
  ADD UNIQUE KEY `IDSanPham` (`IDSanPham`);
ALTER TABLE `product` ADD FULLTEXT KEY `TenSanPham` (`TenSanPham`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`ID`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
