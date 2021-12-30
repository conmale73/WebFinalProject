-- phpMyAdmin SQL Dump
-- version 5.1.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th12 30, 2021 lúc 06:25 PM
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
(2, 'Đồ cổ'),
(1, 'Đồ Công Nghệ'),
(32, 'Đồng hồ');

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
('CN001', 15, 89, 1),
('CN001', 1, 71000, 2),
('CN001', 2, 73000, 1),
('CN001', 3, 74000, 3),
('CN001', 4, 75000, 15),
('CN001', 5, 77000, 2),
('CN001', 6, 80000, 1),
('CN004', 1, 50000, 1),
('CN004', 2, 51000, 2),
('CN004', 3, 52990, 1),
('CN001', 7, 81000, 2),
('CN001', 8, 83000, 2),
('CN001', 9, 84000, 1),
('CN001', 10, 85000, 1),
('CN001', 11, 86000, 1),
('CN001', 12, 87000, 1),
('CN001', 13, 88000, 1),
('CN004', 4, 53990, 1),
('CN004', 5, 54990, 1),
('CN004', 6, 55990, 1),
('CN002', 1, 116000, 3),
('CN003', 1, 802725, 15),
('CN005', 1, 108000, 15),
('CN006', 1, 730320, 15),
('CN007', 1, 1780155, 3),
('CN009', 1, 244200, 3),
('DC006', 1, 151000, 3),
('DC007', 1, 161000, 3),
('DC008', 1, 288000, 3),
('DC009', 1, 308000, 15),
('DC010', 1, 802000, 15),
('CN006', 2, 731320, 26),
('CN007', 2, 1781155, 26),
('CN007', 3, 1781155, 26);

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
(15, 0, '2022-12-28 02:05:35', 1),
(26, 0, '2021-12-30 00:00:00', 1);

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
('CN001', 'Apple Mac Pro', 3, 89, 150000, 1000, 1, 1, '2021-12-26 07:31:25', '2022-01-07 20:03:25', 'Phiên bản Mac Pro 2019 tiêu chuẩn với chip Intel Xeon W 8 nhân 3.5GHz, RAM 48GB, SSD 256GB và VGA Radeon Pro 580X có giá bán 5.999 USD, nhưng được bán trong cửa hàng tân trang của Apple với giá 5.349 USD.', 'anhchinh.jpg', 'anhphu1.jpg'),
('CN002', 'Laptop Razer Blade 17 (2021)', 25, 105990, 116000, 1000, 1, 26, '2021-12-26 06:31:05', '2022-01-21 19:31:05', 'Razer Blade 17 (2021) là một trong những chiếc laptop gaming cao cấp đang được săn đón nhất ở thời điểm hiện tai. Khôn chỉ sở hữu thiết kế đẹp mắt với nhiều tính năng ưu việt hơn hẳn các đối thủ. ', 'anhchinh.jpg', 'anhphu1.jpg'),
('CN003', 'MJS Swarovski & Diamond Studded Notebook', 1, 802725, 913836, 1000, 1, 2, '2021-12-26 06:59:44', '2022-01-15 19:59:44', 'Bề mặt nắp laptop được nạm kim cương Swarovski cực kỳ quý giá, và toàn thân máy đều được mạ vàng, chuột dát vàng, thời gian bảo hành lên đến 10 năm. Ngoài ra còn được tặng thêm bọc bằng da cá sấu.', 'anhchinh.jpg', 'anhphu1.jpg'),
('CN004', 'Dell Xps 15 9510 Gen 11th', 3, 55990, 63000, 1000, 1, 1, '2021-12-18 19:54:31', '2022-01-17 19:54:31', 'Dell Xps 9510 đang là chiếc laptop doanh nhân 2 in 1 mỏng nhẹ và bền bỉ nhất hiện nay. Ngoài thiết kế sang trọng, hiện đại thì chiếc máy tính xách tay này còn được đánh giá cao nhờ hiệu năng mạnh mẽ.', 'anhchinh.jpg', 'anhphu1.jpg'),
('CN005', 'CTO – MacBook Pro 16 inch 2020 New– (Space Gray/i9 2.4Ghz/64GB/1TB/5600M)', 1, 108000, 119000, 1000, 1, 2, '2021-12-20 19:49:55', '2022-01-19 19:49:55', 'Theo như giới thiệu, CTO – MacBook Pro 16 inch 2019 New được cho sẽ trở thành chiếc máy tính xách tay tốt nhất trên thế giới.', 'anhchinh.jpg', 'anhphu1.jpg'),
('CN006', 'iPhone 6 Falcon Supernova Pink Diamond (48.4 triệu USD)', 25, 731320000, 841430, 1000, 1, 0, '2021-12-29 13:05:23', '2021-12-29 13:05:23', 'Chiếc điện thoại không nạm các hạt kim cương, mà dát vàng 18 k với viên kim cương hồng khổng lồ ở phía sau lưng.', 'anhchinh.jpg', 'anhphu1.jpg'),
('CN007', 'Stuart Hughes iPhone 4s Elite Gold', 25, 1781155, 2891266, 1000, 1, 26, '2021-12-29 13:19:39', '2021-12-29 13:19:39', 'iPhone 4S Elite Gold được trang trí bởi 500 viên kim cương đắt tiền với mặt sau máy là 24 carat vàng và 53 viên kim cương cho logo Apple. Phím Home cũng được trang trí bởi kim cương 2,6 carat cùng các viên nhỏ hơn xung quanh. Bản iPhone 4S này là bản 64GB', 'anhchinh.jpg', 'anhphu1.jpg'),
('CN008', 'Diamond Crypto Smartphone', 1, 296692, 397793, 1000, 1, 2, '2021-12-29 13:29:40', '2021-12-29 13:29:40', 'Đây là chiếc điện thoại dành cho người người cần sự bảo mật cao cấp, muốn duy trì kết nối một cách an toàn bởi máy chạy hệ điều hành Windows CE và bộ xử lý Motorola MX21, toàn bộ thiết bị đều được mã hóa, kể cả gọi thoại và SMS.', 'anhchinh.jpg', 'anhphu.jpg'),
('CN009', 'Goldvish Le Million', 1, 244200, 355311, 1000, 1, 2, '2021-12-29 13:38:01', '2021-12-29 13:38:01', 'Các nhà thiết kế lừng danh cũng phải công nhận Goldvish “Le million” có thiết kế tinh xảo, chế tác xa xỉ chưa từng có với bộ vỏ làm bằng vàng 18k, dát kim cương VVS-120 carat.', 'anhchinh.jpg', 'anhphu1.jpg'),
('CN010', 'Gresso Luxor Las Vegas Jackpot', 1, 226399, 337499, 1000, 1, 2, '2021-12-29 13:43:33', '2021-12-29 13:43:33', 'Luxor Las Vegas Jackpot được làm từ kim cương đen, vàng 18K và chất liệu gỗ đen châu Phi 200 năm tuổi (chất liệu truyền thống của thiết kế điện thoại Gresso). Điện thoại có 180gr vàng, 45.5 carat kim cương đen. Điện thoại có bàn phím làm từ sapphire được đánh bóng thủ công với công cụ làm đá kim cương sau đó chữ số và các chữ cái được bắn lên nút bấm bằng laser.', 'anhchinh.jpg', 'anhphu.jpg'),
('DC001', 'Thánh chỉ vua Càn Long', 1, 300000, 500000, 10000, 2, 2, '2021-12-14 10:01:49', '2022-01-21 16:01:50', 'Thánh Chỉ niên hiệu vua Càn Long', 'anhchinh.jpg', 'anhphu1.jpg'),
('DC002', 'Thanh kiếm của Napoléon', 1, 146064, 246064, 1000, 2, 2, '2021-12-29 13:50:22', '2021-12-29 13:50:22', 'Đây là thanh kiếm đã theo Napoléon Bonaparte trong chiến dịch xâm lược Ai Cập. Sau đó, nó đã được trao lại cho anh trai của Napoléon trong đám cưới của ông.', 'anhchinh.jpg', 'anhphu1.jpg'),
('DC003', 'Liễn bạc hoàng gia Pháp', 1, 97000, 98000, 1000, 2, 2, '2021-12-29 13:57:20', '2021-12-29 13:57:20', 'Chiếc liễn được nhà kim hoàn Thomas Germain đúc dành riêng cho vua Louis XV. Từ năm 1723, Germain chỉ phục vụ hoàng tộc vì được ưu ái nhờ phong cách Rococo thời thượng lúc bấy giờ. Trên nắp đậy là hình những món ăn từ rau quả, chim muông, tay nắm có hình đầu lợn rừng.', 'anhchinh.jpg', 'anhphu1.jpg'),
('DC004', 'Vương miện ngọc lục bảo của công nương Katherine Henckel', 1, 121000, 221000, 1000, 2, 2, '2021-12-29 14:03:21', '2021-12-29 14:03:21', 'Vương miện này nạm 11 viên ngọc lục bảo quý hiếm từ Colombia với độ trong hoàn hảo, tổng trọng lượng lên tới 500 carat. Hoàng tử Đức Guido Henckel đã yêu cầu đúc món trang sức này cho vợ là công nương Katherine Henckel.', 'anhchinh.jpg', 'anhphu1.jpg'),
('DC005', 'Âu vàng ba chân thời nhà Minh', 1, 142000, 242000, 1000, 2, 2, '2021-12-29 14:14:40', '2021-12-29 14:14:40', 'Hiện trên thế giới chỉ còn 8 chiếc âu cùng loại. Cổ vật này được chạm khắc hình rồng, có ba chân và được khảm bằng ngọc trai.', 'anhchinh.jpg', 'anhphu1.jpg'),
('DC006', 'Bình sứ tráng men triều Thanh', 1, 151000, 251000, 1000, 2, 2, '2021-12-29 14:20:47', '2021-12-29 14:20:47', 'Chiếc bình được làm tại Trung Quốc vào thế kỷ 18. Hiện tại, bảo tàng nghệ thuật Matsuoka Nhật Bản có một chiếc bình giống hệt chiếc này. ', 'anhchinh.jpg', 'anhphu1.jpg'),
('DC007', 'Tù và Olyphant', 1, 161000, 261000, 1000, 2, 2, '2021-12-29 14:26:57', '2021-12-29 14:26:57', 'Chiếc tù và được làm từ ngà voi vào khoảng thế kỷ 11, trên thế giới chỉ còn chiếc 6 tù và tương tự. Cổ vật này được làm để phục vụ nhu cầu của giới quý tộc khi đi săn bắn hoặc trong chiến tranh.', 'anhchinh.jpg', 'anhphu1.jpg'),
('DC008', 'Tủ Badminton', 1, 288000, 388000, 1000, 2, 2, '2021-12-29 14:34:30', '2021-12-29 14:34:30', 'Món cổ vật này được chế tác tại Florence bởi 30 thợ thủ công trong vòng sáu năm. Trước đây, nó từng được bán cho Hoàng tử của Liechtenstein, nhưng hiện tại nó đang được đặt trong Bảo tàng Liechtenstein để phục vụ du khách tham quan.', 'anhchinh.jpg', 'anhphu1.jpg'),
('DC009', 'Cổ bản Leicester của Leonardo da Vinci', 1, 308000, 408000, 1000, 2, 2, '2021-12-29 14:39:08', '2021-12-29 14:39:08', 'Đây là cuốn sổ bao gồm các nội dung về sáng chế được DaVinci viết ngược suốt 72 trang, cùng nhiều bản nháp và phác họa, lý thuyết về địa chất, hóa thạch và thiên văn.', 'anhchinh.jpg', 'anhphu1.jpg'),
('DC010', 'Bình gốm từ triều đại nhà Thanh', 1, 802000, 902000, 1000, 2, 2, '2021-12-29 14:45:33', '2021-12-29 14:45:33', 'Là món đồ cổ được bán đắt nhất trên toàn thế giới, chiếc bình này được chế tác vào thế kỷ 18, những năm 1740. Các hoa văn tinh xảo, rõ nét và hài hòa của nó được ca ngợi là đỉnh cao của nghệ thuật làm gốm. Dấu ấn triện của hoàng gia thể hiện nó ra đời vào đời vua Càn Long.', 'anhchinh.jpg', 'anhphu1.jpg');

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
(1, 'duchau', '$2a$12$mTYLRxhpnQaYalj5/mXGzeAEgHDLkHn8eHrLMv6uBAmUiwOrs3/DG', 'Vũ Đức Hậu', '2001-03-07', 'Quảng Ngãi', 'conmalenumber2@gmail.com', 90, 0),
(2, 'abc', '$2a$12$mTYLRxhpnQaYalj5/mXGzeAEgHDLkHn8eHrLMv6uBAmUiwOrs3/DG', 'Ây Bi Xi', '2001-12-11', 'aaaaaaaaaaaâ', 'abc@gmail.com', 90, 0),
(3, 'damngoodseller', '$2a$12$MtJN15lLK2bvLpdnL6U.6.QSYc8hUFNLvoIlUQItY28rKvxQr.ubq', 'Dương Quá', '1995-12-14', 'TQ', 'cuccutkuteahehe@gmail.com', 90, 1),
(14, 'admin', '$2a$12$mTYLRxhpnQaYalj5/mXGzeAEgHDLkHn8eHrLMv6uBAmUiwOrs3/DG', 'Nguyễn Ngọc Ngạn', '2021-12-25', 'Đà Lạt', 'swan4567890@gmail.com', 90, 2),
(15, 'admin123456', '$2a$12$HW5wK0AVuAkF7ONhTJLew.t8C2Wx3mjBWSKGi1mvjCnvAyxqS1Ul6', 'Hề Chúa', '2022-03-30', 'TP.hcm', 'swan4567890@gmail.com', 90, 1),
(20, 'bidder007', '$2a$12$YR0484DYMHSGSQDGpt.nzuWAg8mxyYdHBGzBq61mePs041dpG2s12', 'CHU NGUYEN ANH TUAN', '2021-12-25', 'street 1', '19110308nb@student.hcmute.edu.vn', 90, 0),
(21, 'anhtuan', '$2a$12$F/m07PSYW4KruzRVjdEXU.XaFqubdisdOIwOj5VWxuSE87C19b9c2', 'anh tuan', '2020-01-03', 'tp hcm', 'vantinh101@gmail.com', 90, 2),
(22, 'vichi123', '$2a$12$pytyx/R8eaezLmSDnZ/2tO2C97H3gh0t1DW/lmd6VApFZoymNz3uW', 'Chi Vi', '2014-02-13', 'Dong Nai', 'nhatsangtv123@gmail.com', 90, 0),
(23, 'nhatnguyen1231', '$2a$12$K017apyeyaZSY0sHrENGEusu/8dxeWNnd6jVLauioIjbJaNHMlzjK', 'CHU NGUYEN ANH TUAN', '2021-12-10', 'Da lat', 'swan45678901@gmail.com', 90, 0),
(25, 'nguyenngocha', '$2a$12$agEI2zNtgeUlOj.JU6cy3uMwaRy1ysiaVmz8EeGGA6edOzUI8wVvS', 'bfdbfdbdf', '2012-12-06', 'Dong Nai', 'swan4567890@gmail.com', 90, 1),
(26, 'vantai1223', '$2a$12$jBleU2LEQkYqaXxvcBc.K.C2okGsPaRLCFr1GaOmdZa3OSLdqgdZq', 'CHU NGUYEN ANH TUAN', '2022-02-15', 'street 1', '19110308@student.hcmute.edu.vn', 90, 0);

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
  MODIFY `ID` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=27;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
