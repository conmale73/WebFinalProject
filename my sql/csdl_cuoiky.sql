-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 02, 2021 lúc 03:47 PM
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
-- Cơ sở dữ liệu: `csdl_cuoiky`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `ProductName` varchar(255) NOT NULL,
  `Price` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inforbidder`
--

CREATE TABLE `inforbidder` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `time_bidder` datetime DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `comment` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inforseller`
--

CREATE TABLE `inforseller` (
  `id` int(11) DEFAULT NULL,
  `id_product` int(11) DEFAULT NULL,
  `time_seller` int(11) DEFAULT NULL,
  `rating` float DEFAULT NULL,
  `comment` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `listbidder`
--

CREATE TABLE `listbidder` (
  `id` int(11) NOT NULL,
  `id_product` int(11) DEFAULT NULL,
  `bidder_price` int(11) NOT NULL,
  `time_bidder` datetime NOT NULL,
  `status` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `listseller`
--

CREATE TABLE `listseller` (
  `id` int(11) NOT NULL,
  `id_product` int(11) NOT NULL,
  `seller_price_first` int(11) NOT NULL,
  `seller_sell_now` int(11) DEFAULT NULL,
  `time_seller` datetime DEFAULT NULL,
  `status` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `user`
--

CREATE TABLE `user` (
  `id` int(11) NOT NULL,
  `account` varchar(255) NOT NULL,
  `pass` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `address` varchar(255) NOT NULL,
  `email` varchar(255) NOT NULL,
  `level` int(11) NOT NULL,
  `dob` datetime DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Đang đổ dữ liệu cho bảng `user`
--

INSERT INTO `user` (`id`, `account`, `pass`, `name`, `address`, `email`, `level`, `dob`) VALUES
(1, 'user01', '74561', '', '', '', 0, NULL),
(2, 'user02', '11131', '', '', '', 0, NULL),
(3, 'dg444035', '$2a$12$8cZAj0UtLUTlws8bruuzBeN77ZAVYy1unJSOhVIkJww.tq8K1ctyK', 'CHU NGUYEN ANH TUAN', 'street 1', '19110308@student.hcmute.edu.vn', 0, '2021-11-30 00:00:00'),
(4, 'p2935827', '$2a$12$Q0wgT4uqv1o6L2OKpqIa0.7tPdX/1OSOMqgiRCcuGK7I2VncPTtyG', 'CHU NGUYEN ANH TUAN', 'street 1', '19110308@student.hcmute.edu.vn', 0, '2021-12-10 00:00:00'),
(5, 'admin', '$2a$12$QiEs/eRSiKXNL5WdVxw0zuUZ5m8g0cKGk79QbqoLkJkv8a4swHd7a', 'dsadsa', '', 'swan4567890@gmail.com', 0, '2021-12-07 00:00:00');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT cho bảng `user`
--
ALTER TABLE `user`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
