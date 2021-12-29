-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 28, 2021 lúc 08:05 AM
-- Phiên bản máy phục vụ: 10.4.20-MariaDB
-- Phiên bản PHP: 7.4.22

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
(32, 'Trang Sức'),
(2, 'Đồ cổ'),
(1, 'Đồ Công Nghệ');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `daugia`
--

CREATE TABLE `daugia` (
  `IDSanPham` varchar(50) CHARACTER SET utf8 NOT NULL,
  `LuotDauGia` int(11) NOT NULL,
  `GiaDat` double NOT NULL,
  `IDNguoiDatGia` int(11) NOT NULL,
  `ThoiGian` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `daugia`
--

INSERT INTO `daugia` (`IDSanPham`, `LuotDauGia`, `GiaDat`, `IDNguoiDatGia`, `ThoiGian`) VALUES
('CN001', 1, 71000000, 9, NULL),
('CN001', 2, 73000000, 11, NULL),
('CN001', 2, 73000000, 11, NULL);

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
-- Cấu trúc bảng cho bảng `listrequest`
--

CREATE TABLE `listrequest` (
  `id` int(11) NOT NULL,
  `request` int(11) DEFAULT NULL,
  `ThoiGian` datetime DEFAULT NULL,
  `xacnhan` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Đang đổ dữ liệu cho bảng `listrequest`
--

INSERT INTO `listrequest` (`id`, `request`, `ThoiGian`, `xacnhan`) VALUES
(15, 0, '2022-12-28 02:05:35', 1);

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
('CN001', 'Máy tính Apple Mac Pro', 16, 7000, 15000, 100, 1, 2, '2021-12-03 20:03:25', '2021-12-07 20:03:25', 'Phiên bản Mac Pro 2019 tiêu chuẩn với chip Intel Xeon W 8 nhân 3.5GHz, RAM 48GB, SSD 256GB và VGA Radeon Pro 580X có giá bán 5.999 USD, nhưng được bán trong cửa hàng tân trang của Apple với giá 5.349 USD. ', '', ''),
('DC001', 'Thánh chỉ vua Càn Long', 18, 300000000, 500000000, 10000000, 2, 2, '2021-12-14 10:01:49', '2021-12-21 16:01:50', 'Thánh Chỉ niên hiệu vua Càn Long', 'anhchinh.jpg', 'anhphu1.jpg');

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
(14, 'admin', '$2a$12$mTYLRxhpnQaYalj5/mXGzeAEgHDLkHn8eHrLMv6uBAmUiwOrs3/DG', 'Nguyễn Ngọc Ngạn', '2021-12-25', 'Đà Lạt', 'swan4567890@gmail.com', 90, 2),
(15, 'admin123456', '$2a$12$HW5wK0AVuAkF7ONhTJLew.t8C2Wx3mjBWSKGi1mvjCnvAyxqS1Ul6', 'Hề Chúa', '2022-03-30', 'TP.hcm', 'swan4567890@gmail.com', 90, 1);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
