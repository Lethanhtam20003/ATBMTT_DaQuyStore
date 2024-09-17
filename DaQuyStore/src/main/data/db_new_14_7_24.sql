-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Máy chủ: 127.0.0.1
-- Thời gian đã tạo: Th7 14, 2024 lúc 02:38 PM
-- Phiên bản máy phục vụ: 10.4.32-MariaDB
-- Phiên bản PHP: 8.2.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Cơ sở dữ liệu: `new`
--

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `activacation_code`
--

CREATE TABLE `activacation_code` (
  `activationCode` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `date_limit` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `activacation_code`
--

INSERT INTO `activacation_code` (`activationCode`, `username`, `password`, `email`, `date_limit`) VALUES
('2024-07-05cGKvZrnVWT', 'qa', '123hihi', 'tam1442k3@gmail.com', '2024-07-05 14:51:25'),
('2024-07-05qFkjNgtIQX', 'qa', '111hihi', 'tam1442k3@gmail.com', '2024-07-05 14:57:38'),
('2024-07-05Xp6IHZz7hi', 'qa', '111hihi', 'tam1442k3@gmail.com', '2024-07-05 14:54:55');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `categories`
--

CREATE TABLE `categories` (
  `id` int(11) NOT NULL,
  `category_name` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `created_at` datetime DEFAULT NULL,
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_link` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `categories`
--

INSERT INTO `categories` (`id`, `category_name`, `created_at`, `updated_at`, `deleted_at`, `status`, `img_link`) VALUES
(1, 'Ruby', '2024-01-10 00:00:00', NULL, NULL, NULL, 'https://iruby.vn/wp-content/uploads/2023/10/ruby-e1703317900141.jpg'),
(2, 'Sapphine', '2024-02-10 00:00:00', NULL, NULL, NULL, 'https://iruby.vn/wp-content/uploads/2023/10/pink-sapphire.jpg'),
(3, 'Ngọc lục bảo', '2024-01-01 00:00:00', NULL, NULL, NULL, 'https://iruby.vn/wp-content/uploads/2023/10/ngoc-luc-bao.jpg'),
(4, 'Spinel', '2024-03-10 00:00:00', NULL, NULL, NULL, 'https://iruby.vn/wp-content/uploads/2023/10/spinel.jpg'),
(5, 'Tourmaline', '2023-12-10 00:00:00', NULL, NULL, NULL, 'https://iruby.vn/wp-content/uploads/2023/10/GREEN-TOURMALINE.jpg'),
(6, 'Aquamarine', '2024-02-27 00:00:00', NULL, NULL, NULL, 'https://iruby.vn/wp-content/uploads/2023/10/aquamarine.jpg'),
(7, 'Peridot', '2024-03-15 00:00:00', NULL, NULL, NULL, 'https://iruby.vn/wp-content/uploads/2023/10/Peridot.jpg'),
(8, 'Garnet', '2024-03-03 00:00:00', NULL, NULL, NULL, 'https://iruby.vn/wp-content/uploads/2023/10/garnet.jpg'),
(9, 'Zircon', '2024-02-06 00:00:00', NULL, NULL, NULL, 'https://iruby.vn/wp-content/uploads/2023/10/zircon.jpg'),
(10, 'Topaz', '2024-02-14 00:00:00', NULL, NULL, NULL, 'https://iruby.vn/wp-content/uploads/2023/10/topaz-1.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventories`
--

CREATE TABLE `inventories` (
  `id` int(11) NOT NULL,
  `date` datetime NOT NULL DEFAULT current_timestamp(),
  `user_imported` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `inventories`
--

INSERT INTO `inventories` (`id`, `date`, `user_imported`) VALUES
(1, '2024-05-08 21:27:59', 'ADMIN'),
(2, '2024-05-08 21:27:59', 'ADMIN'),
(3, '2024-05-08 21:27:59', 'ADMIN'),
(5, '2024-05-08 21:29:41', 'ADMIN'),
(6, '2024-05-08 21:29:41', 'ADMIN'),
(7, '2024-05-08 21:29:41', 'ADMIN');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `inventory_detail`
--

CREATE TABLE `inventory_detail` (
  `id` int(11) NOT NULL,
  `product_id` int(5) NOT NULL,
  `quantity` int(15) NOT NULL,
  `price` float NOT NULL,
  `status_deleted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `remaining` int(5) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `inventory_detail`
--

INSERT INTO `inventory_detail` (`id`, `product_id`, `quantity`, `price`, `status_deleted`, `remaining`) VALUES
(1, 20, 50, 6090000, 'chưa xóa', 0),
(2, 20, 40, 6090000, 'chưa xóa', 0),
(3, 20, 35, 6090000, 'chưa xóa', 0),
(5, 25, 40, 5000000, 'chưa xóa', 0),
(6, 25, 30, 5000000, 'chưa xóa', 0),
(7, 25, 40, 5000000, 'chưa xóa', 0);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `log`
--

CREATE TABLE `log` (
  `id` int(5) NOT NULL,
  `ip_address` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `prev_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `current_value` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` timestamp NOT NULL DEFAULT current_timestamp() ON UPDATE current_timestamp(),
  `level` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `log`
--

INSERT INTO `log` (`id`, `ip_address`, `prev_value`, `current_value`, `created_at`, `level`) VALUES
(1, '1.2.3.4.5', 'model.modelAdmin.ProductAdmin@6df88031', 'model.modelAdmin.ProductAdmin@f5d61b7', '2024-05-21 10:16:34', 'ALERT'),
(2, '1.2.3.4.5', 'model.modelAdmin.ProductAdmin@5da878b5', 'model.modelAdmin.ProductAdmin@17479a64', '2024-05-21 10:16:39', 'WARNING'),
(3, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 16:04:55.833', 'Lấy dữ liệu2024-06-20 16:04:55.833', '2024-06-20 09:04:56', 'INFORM'),
(4, '0:0:0:0:0:0:0:1', 'User có id là:3chưa xóa', 'Đã xóa3', '2024-06-20 09:05:09', 'DANGER'),
(5, '0:0:0:0:0:0:0:1', 'User có id là:16chưa thay đổi role', 'User có id là:16đã thay đổi roleprohibit', '2024-06-20 09:05:16', 'DANGER'),
(6, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 16:05:18.647', 'Lấy dữ liệu2024-06-20 16:05:18.647', '2024-06-20 09:05:18', 'INFORM'),
(7, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:45:27', 'Đã lấy dữ liệu17:45:27', '2024-06-20 10:45:27', 'INFORM'),
(8, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:45:28', 'Đã lấy dữ liệu17:45:28', '2024-06-20 10:45:28', 'INFORM'),
(9, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:45:28', 'Đã lấy dữ liệu17:45:28', '2024-06-20 10:45:28', 'INFORM'),
(10, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:45:28', 'Đã lấy dữ liệu17:45:28', '2024-06-20 10:45:28', 'INFORM'),
(11, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:45:29', 'Đã lấy dữ liệu17:45:29', '2024-06-20 10:45:29', 'INFORM'),
(12, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:45:29', 'Đã lấy dữ liệu17:45:29', '2024-06-20 10:45:29', 'INFORM'),
(13, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:45:35', 'Đã lấy dữ liệu17:45:35', '2024-06-20 10:45:35', 'INFORM'),
(14, '0:0:0:0:0:0:0:1', 'Chưa xóa17:45:36', 'Đã xóa17:45:36', '2024-06-20 10:45:36', 'DANGER'),
(15, '0:0:0:0:0:0:0:1', 'Chưa cập nhật17:45:54đơn hàng có id10', 'Đã xóa17:45:54đơn hàng có id10', '2024-06-20 10:45:54', 'DANGER'),
(16, '0:0:0:0:0:0:0:1', 'Chưa cập nhật17:46:00đơn hàng có id10', 'Đã xóa17:46:00đơn hàng có id10', '2024-06-20 10:46:00', 'DANGER'),
(17, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:46:03', 'Đã lấy dữ liệu17:46:03', '2024-06-20 10:46:03', 'INFORM'),
(18, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:46:05', 'Đã lấy dữ liệu17:46:05', '2024-06-20 10:46:05', 'INFORM'),
(19, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:46:05', 'Đã lấy dữ liệu17:46:05', '2024-06-20 10:46:05', 'INFORM'),
(20, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:46:06', 'Đã lấy dữ liệu17:46:06', '2024-06-20 10:46:06', 'INFORM'),
(21, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:46:06', 'Đã lấy dữ liệu17:46:06', '2024-06-20 10:46:06', 'INFORM'),
(22, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:46:07', 'Đã lấy dữ liệu17:46:07', '2024-06-20 10:46:07', 'INFORM'),
(23, '0:0:0:0:0:0:0:1', 'Chưa cập nhật17:46:10đơn hàng có id8', 'Đã xóa17:46:10đơn hàng có id8', '2024-06-20 10:46:10', 'DANGER'),
(24, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:46:14', 'Đã lấy dữ liệu17:46:14', '2024-06-20 10:46:14', 'INFORM'),
(25, '0:0:0:0:0:0:0:1', 'Chưa cập nhật17:46:23đơn hàng có id9', 'Đã xóa17:46:23đơn hàng có id9', '2024-06-20 10:46:23', 'DANGER'),
(26, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:46:27', 'Đã lấy dữ liệu17:46:27', '2024-06-20 10:46:27', 'INFORM'),
(27, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:46:27', 'Đã lấy dữ liệu17:46:27', '2024-06-20 10:46:27', 'INFORM'),
(28, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:46:28', 'Đã lấy dữ liệu17:46:28', '2024-06-20 10:46:28', 'INFORM'),
(29, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:46:28', 'Đã lấy dữ liệu17:46:28', '2024-06-20 10:46:28', 'INFORM'),
(30, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu17:46:29', 'Đã lấy dữ liệu17:46:29', '2024-06-20 10:46:29', 'INFORM'),
(31, '0:0:0:0:0:0:0:1', 'Chưa cập nhật17:46:31đơn hàng có id3', 'Đã xóa17:46:31đơn hàng có id3', '2024-06-20 10:46:31', 'DANGER'),
(32, '0:0:0:0:0:0:0:1', 'Chưa cập nhật17:46:38đơn hàng có id7', 'Đã xóa17:46:38đơn hàng có id7', '2024-06-20 10:46:38', 'DANGER'),
(33, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 19:58:50.771', 'Đã truy cập ngày:2024-06-20 19:58:50.771', '2024-06-20 12:58:50', 'INFORM'),
(34, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 19:59:43.689', 'Đã truy cập ngày:2024-06-20 19:59:43.689', '2024-06-20 12:59:43', 'INFORM'),
(35, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:01:21.228', 'Đã truy cập ngày:2024-06-20 20:01:21.228', '2024-06-20 13:01:21', 'INFORM'),
(36, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-20 20:01:22.568sản phẩm có id5', 'Đã xóa  ngày:2024-06-20 20:01:22.568sản phẩm có id5', '2024-06-20 13:01:22', 'DANGER'),
(37, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:01:25.533', 'Đã truy cập ngày:2024-06-20 20:01:25.533', '2024-06-20 13:01:25', 'INFORM'),
(38, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-20 20:02:33.122sản phẩm có id6', 'Đã xóa  ngày:2024-06-20 20:02:33.122sản phẩm có id6', '2024-06-20 13:02:33', 'DANGER'),
(39, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:02:35.765', 'Đã truy cập ngày:2024-06-20 20:02:35.765', '2024-06-20 13:02:35', 'INFORM'),
(40, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:04:39.973', 'Đã truy cập ngày:2024-06-20 20:04:40.158', '2024-06-20 13:04:40', 'INFORM'),
(41, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:05:45.705', 'Đã truy cập ngày:2024-06-20 20:05:45.705', '2024-06-20 13:05:45', 'INFORM'),
(42, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-20 20:05:49.593sản phẩm có id7', 'Đã xóa  ngày:2024-06-20 20:05:49.593sản phẩm có id7', '2024-06-20 13:05:49', 'DANGER'),
(43, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:05:52.459', 'Đã truy cập ngày:2024-06-20 20:05:52.459', '2024-06-20 13:05:52', 'INFORM'),
(44, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:08:21.604', 'Đã truy cập ngày:2024-06-20 20:08:21.604', '2024-06-20 13:08:21', 'INFORM'),
(45, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:12:42.085', 'Đã truy cập ngày:2024-06-20 20:12:42.286', '2024-06-20 13:12:42', 'INFORM'),
(46, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:14:12.113', 'Đã truy cập ngày:2024-06-20 20:14:12.113', '2024-06-20 13:14:12', 'INFORM'),
(47, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:16:49.491', 'Đã truy cập ngày:2024-06-20 20:16:49.491', '2024-06-20 13:16:49', 'INFORM'),
(48, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:20:36.736', 'Đã truy cập ngày:2024-06-20 20:20:36.736', '2024-06-20 13:20:36', 'INFORM'),
(49, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:25:14.531', 'Đã truy cập ngày:2024-06-20 20:25:14.531', '2024-06-20 13:25:14', 'INFORM'),
(50, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 20:32:23.894', 'Đã truy cập ngày:2024-06-20 20:32:23.894', '2024-06-20 13:32:24', 'INFORM'),
(51, '0:0:0:0:0:0:0:1', 'Chưa  cập nhật thành công sản phẩm có id:162024-06-20 20:32:31.849', 'Đã cập nhật thành công sản phẩm có id:162024-06-20 20:32:31.849', '2024-06-20 13:32:31', 'DANGER'),
(52, '0:0:0:0:0:0:0:1', 'Chưa thêm dữ liệu', 'Đã thêm sản phẩm thảnh công2024-06-20 21:08:24.834', '2024-06-20 14:08:24', 'ALERT'),
(53, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 21:11:36.387', 'Đã truy cập ngày:2024-06-20 21:11:36.387', '2024-06-20 14:11:36', 'INFORM'),
(54, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 21:12:36.089', 'Lấy dữ liệu2024-06-20 21:12:36.089', '2024-06-20 14:12:36', 'INFORM'),
(55, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 21:13:10.257', 'Đã truy cập ngày:2024-06-20 21:13:10.257', '2024-06-20 14:13:10', 'INFORM'),
(56, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 21:13:12.387', 'Đã truy cập ngày:2024-06-20 21:13:12.387', '2024-06-20 14:13:12', 'INFORM'),
(57, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 21:13:14.034', 'Lấy dữ liệu2024-06-20 21:13:14.034', '2024-06-20 14:13:14', 'INFORM'),
(58, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 21:13:41.488', 'Lấy dữ liệu2024-06-20 21:13:41.488', '2024-06-20 14:13:41', 'INFORM'),
(59, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 21:24:27.872', 'Lấy dữ liệu2024-06-20 21:24:27.872', '2024-06-20 14:24:28', 'INFORM'),
(60, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 21:31:21.027', 'Lấy dữ liệu2024-06-20 21:31:21.027', '2024-06-20 14:31:21', 'INFORM'),
(61, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 21:32:36.798', 'Lấy dữ liệu2024-06-20 21:32:36.798', '2024-06-20 14:32:36', 'INFORM'),
(62, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:39:22', 'Đã lấy dữ liệu21:39:22', '2024-06-20 14:39:22', 'INFORM'),
(63, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:39:28', 'Đã lấy dữ liệu21:39:28', '2024-06-20 14:39:28', 'INFORM'),
(64, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:39:29', 'Đã lấy dữ liệu21:39:29', '2024-06-20 14:39:29', 'INFORM'),
(65, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:39:31', 'Đã lấy dữ liệu21:39:31', '2024-06-20 14:39:31', 'INFORM'),
(66, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:39:33', 'Đã lấy dữ liệu21:39:33', '2024-06-20 14:39:33', 'INFORM'),
(67, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 21:41:43.926', 'Lấy dữ liệu2024-06-20 21:41:43.926', '2024-06-20 14:41:43', 'INFORM'),
(68, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:41:50', 'Đã lấy dữ liệu21:41:50', '2024-06-20 14:41:50', 'INFORM'),
(69, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:41:52', 'Đã lấy dữ liệu21:41:52', '2024-06-20 14:41:52', 'INFORM'),
(70, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:41:53', 'Đã lấy dữ liệu21:41:53', '2024-06-20 14:41:53', 'INFORM'),
(71, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:41:54', 'Đã lấy dữ liệu21:41:54', '2024-06-20 14:41:54', 'INFORM'),
(72, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:41:55', 'Đã lấy dữ liệu21:41:55', '2024-06-20 14:41:55', 'INFORM'),
(73, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:42:11', 'Đã lấy dữ liệu21:42:11', '2024-06-20 14:42:11', 'INFORM'),
(74, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:42:14', 'Đã lấy dữ liệu21:42:14', '2024-06-20 14:42:14', 'INFORM'),
(75, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:42:15', 'Đã lấy dữ liệu21:42:15', '2024-06-20 14:42:15', 'INFORM'),
(76, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:42:15', 'Đã lấy dữ liệu21:42:15', '2024-06-20 14:42:15', 'INFORM'),
(77, '0:0:0:0:0:0:0:1', 'Chưa lấy dữ liệu21:42:16', 'Đã lấy dữ liệu21:42:16', '2024-06-20 14:42:16', 'INFORM'),
(78, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 21:44:12.288', 'Đã truy cập ngày:2024-06-20 21:44:12.288', '2024-06-20 14:44:12', 'INFORM'),
(79, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 21:50:36.994', 'Lấy dữ liệu2024-06-20 21:50:36.994', '2024-06-20 14:50:36', 'INFORM'),
(80, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 21:51:32.319', 'Lấy dữ liệu2024-06-20 21:51:32.319', '2024-06-20 14:51:32', 'INFORM'),
(81, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 21:51:34.228', 'Lấy dữ liệu2024-06-20 21:51:34.228', '2024-06-20 14:51:34', 'INFORM'),
(82, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 21:51:37.67', 'Đã truy cập ngày:2024-06-20 21:51:37.67', '2024-06-20 14:51:37', 'INFORM'),
(83, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-20 21:51:40.813', 'Đã truy cập ngày:2024-06-20 21:51:40.813', '2024-06-20 14:51:40', 'INFORM'),
(84, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-20 21:51:42.803', 'Lấy dữ liệu2024-06-20 21:51:42.803', '2024-06-20 14:51:42', 'INFORM'),
(85, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-22 21:09:12.488', 'Đã truy cập ngày:2024-06-22 21:09:12.488', '2024-06-22 14:09:12', 'INFORM'),
(86, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-22 21:09:17.011sản phẩm có id8', 'Đã xóa  ngày:2024-06-22 21:09:17.011sản phẩm có id8', '2024-06-22 14:09:17', 'DANGER'),
(87, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-22 21:09:27.128sản phẩm có id8', 'Đã xóa  ngày:2024-06-22 21:09:27.128sản phẩm có id8', '2024-06-22 14:09:27', 'DANGER'),
(88, '0:0:0:0:0:0:0:1', 'Chưa truy cập ngày2024-06-22 21:09:29.804', 'Đã truy cập ngày:2024-06-22 21:09:29.804', '2024-06-22 14:09:29', 'INFORM'),
(89, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-22 21:09:37.69sản phẩm có id9', 'Đã xóa  ngày:2024-06-22 21:09:37.69sản phẩm có id9', '2024-06-22 14:09:37', 'DANGER'),
(90, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-22 21:09:43.24sản phẩm có id9', 'Đã xóa  ngày:2024-06-22 21:09:43.24sản phẩm có id9', '2024-06-22 14:09:43', 'DANGER'),
(91, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-22 21:09:49.614sản phẩm có id11', 'Đã xóa  ngày:2024-06-22 21:09:49.614sản phẩm có id11', '2024-06-22 14:09:49', 'DANGER'),
(92, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-22 21:09:52.503sản phẩm có id11', 'Đã xóa  ngày:2024-06-22 21:09:52.503sản phẩm có id11', '2024-06-22 14:09:52', 'DANGER'),
(93, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-22 21:10:57.954sản phẩm có id10', 'Đã xóa  ngày:2024-06-22 21:10:57.954sản phẩm có id10', '2024-06-22 14:10:57', 'DANGER'),
(94, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-22 21:11:07.02sản phẩm có id10', 'Đã xóa  ngày:2024-06-22 21:11:07.02sản phẩm có id10', '2024-06-22 14:11:07', 'DANGER'),
(95, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-22 21:11:10.651sản phẩm có id12', 'Đã xóa  ngày:2024-06-22 21:11:10.651sản phẩm có id12', '2024-06-22 14:11:10', 'DANGER'),
(96, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-22 21:11:22.443sản phẩm có id12', 'Đã xóa  ngày:2024-06-22 21:11:22.443sản phẩm có id12', '2024-06-22 14:11:22', 'DANGER'),
(97, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-22 21:11:44.603sản phẩm có id17', 'Đã xóa  ngày:2024-06-22 21:11:44.603sản phẩm có id17', '2024-06-22 14:11:44', 'DANGER'),
(98, '0:0:0:0:0:0:0:1', 'Chưa xóa ngày2024-06-22 21:12:24.93sản phẩm có id17', 'Đã xóa  ngày:2024-06-22 21:12:24.93sản phẩm có id17', '2024-06-22 14:12:24', 'DANGER'),
(99, '0:0:0:0:0:0:0:1', 'Chưa có dữ liệu2024-06-22 21:17:53.477', 'Lấy dữ liệu2024-06-22 21:17:53.477', '2024-06-22 14:17:53', 'INFORM'),
(100, '0:0:0:0:0:0:0:1', 'User có id là:1chưa xóa', 'Đã xóa1', '2024-06-22 14:17:58', 'DANGER'),
(101, '0:0:0:0:0:0:0:1', 'User có id là:16chưa xóa', 'Đã xóa16', '2024-06-22 14:18:03', 'DANGER'),
(102, '0:0:0:0:0:0:0:1', 'User có id là:3chưa xóa', 'Đã xóa3', '2024-06-22 14:18:06', 'DANGER');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `orders`
--

CREATE TABLE `orders` (
  `id` int(11) NOT NULL,
  `created_at` datetime NOT NULL DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `total_price` float DEFAULT NULL,
  `status` enum('chờ xác nhận','chờ giao','đang giao','đã giao','hủy') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `statusPayment` varchar(50) NOT NULL DEFAULT '',
  `typeShip` enum('ship','Pick up at the shop') DEFAULT NULL,
  `address` varchar(200) DEFAULT NULL,
  `shipCost` float DEFAULT NULL,
  `TypePayment` varchar(50) NOT NULL DEFAULT '',
  `note` varchar(500) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `orders`
--

INSERT INTO `orders` (`id`, `created_at`, `updated_at`, `total_price`, `status`, `user_id`, `statusPayment`, `typeShip`, `address`, `shipCost`, `TypePayment`, `note`) VALUES
(1, '2024-07-07 19:33:27', NULL, 180000, 'đang giao', 27, 'da thanh toan', 'Pick up at the shop', NULL, 0, 'pay down', NULL),
(11, '2024-07-07 20:30:38', '2024-07-08 18:48:32', 4980000, 'chờ xác nhận', 27, 'da thanh toan', 'Pick up at the shop', '', 20000, 'pay down', ''),
(12, '2024-07-07 20:31:35', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(14, '2024-07-07 20:44:55', NULL, 4980000, 'chờ giao', 27, 'chua thanh toan', 'ship', 'viet nam, Xã Chiềng Ân, Huyện Mường La, Tỉnh Sơn La', 20000, 'chuyen khoan', 'hhjjkgjjkk'),
(15, '2024-07-07 21:00:12', NULL, 39980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(16, '2024-07-07 21:03:57', NULL, 19980000, 'đã giao', 27, 'chua thanh toan', 'ship', 'SÆ¡n bÃ¬nh, Xã Đồng Tiến, Huyện Cô Tô, Tỉnh Quảng Ninh', 20000, 'chuyen khoan', 'dung bao h'),
(17, '2024-07-08 08:25:16', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(18, '2024-07-08 08:39:14', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(19, '2024-07-08 08:39:45', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(20, '2024-07-08 08:40:11', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(21, '2024-07-08 08:40:19', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(22, '2024-07-08 08:42:28', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(23, '2024-07-08 08:42:38', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(24, '2024-07-08 08:42:47', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(25, '2024-07-08 08:43:13', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(26, '2024-07-08 09:31:03', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(27, '2024-07-08 09:31:28', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(28, '2024-07-08 09:31:35', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(29, '2024-07-08 09:40:56', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(30, '2024-07-08 09:41:58', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(31, '2024-07-08 09:42:12', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(32, '2024-07-08 09:42:33', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(33, '2024-07-08 09:43:21', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(34, '2024-07-08 09:43:49', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(35, '2024-07-08 09:44:08', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(36, '2024-07-08 09:58:13', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(37, '2024-07-08 09:58:38', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(38, '2024-07-08 10:03:12', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(39, '2024-07-08 10:04:04', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(40, '2024-07-08 10:08:04', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', ''),
(41, '2024-07-08 14:12:10', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(42, '2024-07-08 14:24:04', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(43, '2024-07-08 14:24:49', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(44, '2024-07-08 14:25:57', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(45, '2024-07-08 14:28:29', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(46, '2024-07-08 14:29:56', NULL, 14980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(47, '2024-07-08 14:30:29', NULL, 14980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(48, '2024-07-08 14:30:55', NULL, 14980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(49, '2024-07-08 14:41:54', NULL, 14980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(50, '2024-07-08 14:47:53', NULL, 14980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(51, '2024-07-08 14:48:06', NULL, 14980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(52, '2024-07-08 14:52:02', NULL, 29980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(53, '2024-07-08 14:53:24', NULL, 29980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, 'tien mat', 'nhan luc s'),
(54, '2024-07-08 15:11:39', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(55, '2024-07-08 15:13:31', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(56, '2024-07-08 15:14:15', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(57, '2024-07-08 15:14:19', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(58, '2024-07-08 15:15:07', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(59, '2024-07-08 15:16:08', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(60, '2024-07-08 15:16:26', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(61, '2024-07-08 15:18:19', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(62, '2024-07-08 15:20:23', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(63, '2024-07-08 15:20:41', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(64, '2024-07-08 15:21:00', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(65, '2024-07-08 15:21:41', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(66, '2024-07-08 15:22:08', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(67, '2024-07-08 15:22:53', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(68, '2024-07-08 15:24:36', NULL, 9980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(69, '2024-07-08 15:26:52', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(70, '2024-07-08 15:27:22', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(71, '2024-07-08 15:27:36', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(72, '2024-07-08 15:29:00', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(73, '2024-07-08 15:29:15', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(74, '2024-07-08 15:29:44', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(75, '2024-07-08 15:29:59', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(76, '2024-07-08 15:30:12', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(77, '2024-07-08 15:30:54', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(78, '2024-07-08 15:31:05', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(79, '2024-07-08 15:31:39', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(80, '2024-07-08 15:32:19', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(81, '2024-07-08 15:32:42', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(82, '2024-07-08 15:33:08', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(83, '2024-07-08 15:33:26', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(84, '2024-07-08 15:34:17', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(85, '2024-07-08 15:34:27', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(86, '2024-07-08 15:34:33', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(87, '2024-07-08 15:34:47', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(88, '2024-07-08 15:35:02', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(89, '2024-07-08 15:35:11', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(90, '2024-07-08 15:35:45', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(91, '2024-07-08 15:35:54', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(92, '2024-07-08 15:36:53', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(93, '2024-07-08 15:37:02', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(94, '2024-07-08 15:37:29', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(95, '2024-07-08 15:37:42', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(96, '2024-07-08 15:37:55', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(97, '2024-07-08 15:46:38', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(98, '2024-07-08 15:47:01', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(99, '2024-07-08 15:47:22', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(100, '2024-07-08 15:51:10', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(101, '2024-07-08 15:52:15', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(102, '2024-07-08 15:52:19', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(103, '2024-07-08 15:54:07', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(104, '2024-07-08 15:54:30', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(105, '2024-07-08 15:54:54', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(106, '2024-07-08 15:55:40', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(107, '2024-07-08 15:55:56', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(108, '2024-07-08 15:56:03', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(109, '2024-07-08 15:56:05', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(110, '2024-07-08 15:56:13', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(111, '2024-07-08 15:56:35', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(112, '2024-07-08 15:56:45', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'co be hom hinh, Xã Tiến Dũng, Huyện Yên Dũng, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'xin dung b'),
(113, '2024-07-08 15:57:56', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(114, '2024-07-08 15:58:39', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(115, '2024-07-08 15:58:53', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(116, '2024-07-08 15:59:23', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(117, '2024-07-08 15:59:39', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(118, '2024-07-08 16:01:39', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(119, '2024-07-08 16:01:56', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(120, '2024-07-08 16:03:17', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(121, '2024-07-08 16:03:35', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(122, '2024-07-08 16:04:03', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(123, '2024-07-08 16:04:49', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(124, '2024-07-08 16:06:30', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(125, '2024-07-08 16:07:21', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(126, '2024-07-08 16:07:29', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(127, '2024-07-08 16:08:06', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(128, '2024-07-08 16:08:34', NULL, 39780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga con hau an, Phường Cải Đan, Thành phố Sông Công, Tỉnh Thái Nguyên', 20000, 'chuyen khoan', 'cho cadsss'),
(129, '2024-07-08 16:22:03', NULL, 44780000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'ga com , Xã Lệ Viễn, Huyện Sơn Động, Tỉnh Bắc Giang', 20000, 'chuyen khoan', 'giao hang '),
(130, '2024-07-08 17:02:19', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'SÆ¡n bÃ¬nh, Xã Chu Điện, Huyện Lục Nam, Tỉnh Bắc Giang', 20000, '', 'cho cadsssdasdacccccccc'),
(131, '2024-07-08 17:04:34', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(132, '2024-07-08 18:38:16', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'SÆ¡n bÃ¬nh', 20000, '', 'ssdasdadasda'),
(133, '2024-07-08 18:42:22', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(134, '2024-07-08 18:43:45', NULL, 4980000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(135, '2024-07-08 18:46:15', NULL, 4980000, 'đang giao', 27, 'đã thanh toán', 'ship', 'viet nam, Xã Tuấn Đạo, Huyện Sơn Động, Tỉnh Bắc Giang', 20000, 'chuyển khoản', 'giao hang '),
(136, '2024-07-08 18:54:45', NULL, 19980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(137, '2024-07-08 18:57:00', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(138, '2024-07-08 18:57:11', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(139, '2024-07-08 18:58:29', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(140, '2024-07-08 18:58:50', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(141, '2024-07-08 18:58:57', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(142, '2024-07-08 19:01:23', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(143, '2024-07-08 19:02:11', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(144, '2024-07-08 19:03:11', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(145, '2024-07-08 19:04:13', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(146, '2024-07-09 15:22:40', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(147, '2024-07-09 15:23:32', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(148, '2024-07-09 15:23:53', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(149, '2024-07-09 15:24:18', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(150, '2024-07-09 15:25:29', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(151, '2024-07-09 15:31:34', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(152, '2024-07-09 15:31:35', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(153, '2024-07-09 15:31:35', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(154, '2024-07-09 15:31:36', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(155, '2024-07-09 15:31:37', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(156, '2024-07-09 15:31:37', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(157, '2024-07-09 15:31:47', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(158, '2024-07-09 15:31:52', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(159, '2024-07-09 15:35:35', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(160, '2024-07-09 15:36:43', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(161, '2024-07-09 15:41:35', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(162, '2024-07-09 15:41:52', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(163, '2024-07-09 15:42:08', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(164, '2024-07-09 15:42:16', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(165, '2024-07-09 15:42:38', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(166, '2024-07-09 15:42:52', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(167, '2024-07-09 15:43:06', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(168, '2024-07-09 15:43:56', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(169, '2024-07-09 15:44:08', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(170, '2024-07-09 15:44:26', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(171, '2024-07-09 15:44:36', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(172, '2024-07-09 15:44:51', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(173, '2024-07-09 15:45:31', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(174, '2024-07-09 15:48:07', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(175, '2024-07-09 15:48:15', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(176, '2024-07-09 16:07:30', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(177, '2024-07-09 18:19:01', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(178, '2024-07-09 19:08:04', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(179, '2024-07-09 19:10:46', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(180, '2024-07-09 19:21:40', '2024-07-09 19:21:42', 4980000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(181, '2024-07-09 19:25:30', '2024-07-09 19:25:31', 4980000, 'đã giao', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(182, '2024-07-09 19:26:49', '2024-07-09 19:26:51', 4980000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(183, '2024-07-09 19:31:14', '2024-07-09 19:31:15', 4980000, 'chờ giao', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(184, '2024-07-09 19:31:48', '2024-07-09 19:31:49', -20000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(185, '2024-07-09 19:32:24', '2024-07-09 19:32:27', -20000, 'đã giao', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(186, '2024-07-09 19:32:33', '2024-07-09 19:32:34', -20000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(187, '2024-07-09 19:32:39', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(188, '2024-07-09 19:34:34', '2024-07-09 19:34:35', -20000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(189, '2024-07-09 19:34:41', NULL, -20000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(190, '2024-07-09 19:37:05', '2024-07-09 19:37:06', 4980000, 'hủy', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(191, '2024-07-09 19:39:42', '2024-07-09 19:39:43', 4980000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(192, '2024-07-09 19:40:22', '2024-07-09 19:40:23', -20000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(193, '2024-07-09 19:40:44', '2024-07-09 19:40:45', -20000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(194, '2024-07-09 19:41:55', '2024-07-09 19:42:09', 4980000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(195, '2024-07-09 19:48:42', '2024-07-09 19:50:28', 4980000, 'đang giao', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(196, '2024-07-09 19:50:33', '2024-07-09 19:50:34', -20000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(197, '2024-07-09 19:54:51', '2024-07-09 19:55:08', 4980000, 'chờ xác nhận', 27, 'đã thanh toán', 'ship', 'sd', 20000, 'chuyển khoản', ''),
(198, '2024-07-09 21:04:49', '2024-07-09 21:05:11', 34780000, 'chờ xác nhận', 27, 'đã thanh toán', 'ship', 'sd, Thị trấn Đạo Đức, Huyện Bình Xuyên, Tỉnh Vĩnh Phúc', 20000, 'chuyển khoản', ''),
(199, '2024-07-09 21:12:57', NULL, 3980000, 'chờ xác nhận', 27, 'chua thanh toan', 'Pick up at the shop', '', 20000, '', ''),
(200, '2024-07-10 10:03:16', '2024-07-10 10:03:19', 29980000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(201, '2024-07-10 10:40:51', NULL, 4980000, 'chờ xác nhận', 27, 'chua thanh toan', 'ship', 'sdas, Xã Vũ Lăng, Huyện Bắc Sơn, Tỉnh Lạng Sơn', 20000, '', 'sin dung bat may'),
(202, '2024-07-10 17:02:39', NULL, 4980000, 'chờ xác nhận', 27, 'chưa thanh toán', 'Pick up at the shop', '', 20000, '', ''),
(203, '2024-07-10 17:07:35', NULL, 4980000, 'chờ xác nhận', 27, 'chưa thanh toán', 'Pick up at the shop', '', 20000, '', ''),
(204, '2024-07-13 16:04:17', '2024-07-13 16:04:20', 4980000, 'chờ xác nhận', 27, 'đã thanh toán', 'Pick up at the shop', '', 20000, 'chuyển khoản', ''),
(205, '2024-07-13 16:06:37', '2024-07-13 16:06:40', 9980000, 'chờ xác nhận', 27, 'đã thanh toán', 'ship', 'SÆ¡n bÃ¬nh', 20000, 'chuyển khoản', 'dung bao h');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `order_details`
--

CREATE TABLE `order_details` (
  `order_id` int(11) NOT NULL,
  `product_id` int(11) NOT NULL,
  `quantity_total` double NOT NULL DEFAULT 0,
  `total_price` double NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `order_details`
--

INSERT INTO `order_details` (`order_id`, `product_id`, `quantity_total`, `total_price`) VALUES
(1, 4, 1, 200000),
(16, 3, 1, 10000000),
(16, 1, 2, 10000000),
(17, 1, 2, 10000000),
(18, 1, 2, 10000000),
(19, 1, 2, 10000000),
(20, 1, 2, 10000000),
(21, 1, 2, 10000000),
(22, 1, 2, 10000000),
(23, 1, 2, 10000000),
(24, 1, 2, 10000000),
(25, 1, 2, 10000000),
(26, 1, 4, 20000000),
(27, 1, 4, 20000000),
(28, 1, 4, 20000000),
(29, 1, 4, 20000000),
(30, 1, 4, 20000000),
(31, 1, 4, 20000000),
(32, 1, 4, 20000000),
(33, 1, 4, 20000000),
(34, 1, 4, 20000000),
(35, 1, 4, 20000000),
(36, 1, 4, 20000000),
(37, 1, 4, 20000000),
(38, 1, 4, 20000000),
(39, 1, 4, 20000000),
(40, 1, 4, 20000000),
(41, 1, 2, 10000000),
(42, 1, 2, 10000000),
(43, 1, 2, 10000000),
(44, 1, 2, 10000000),
(45, 1, 2, 10000000),
(46, 1, 3, 15000000),
(47, 1, 3, 15000000),
(48, 1, 3, 15000000),
(49, 1, 3, 15000000),
(50, 1, 3, 15000000),
(51, 1, 3, 15000000),
(52, 1, 6, 30000000),
(53, 1, 6, 30000000),
(54, 1, 1, 5000000),
(55, 1, 2, 10000000),
(56, 1, 2, 10000000),
(57, 1, 2, 10000000),
(58, 1, 2, 10000000),
(59, 1, 2, 10000000),
(60, 1, 2, 10000000),
(61, 1, 2, 10000000),
(62, 1, 2, 10000000),
(63, 1, 2, 10000000),
(64, 1, 2, 10000000),
(65, 1, 2, 10000000),
(66, 1, 2, 10000000),
(67, 1, 2, 10000000),
(68, 1, 2, 10000000),
(69, 3, 1, 10000000),
(69, 1, 3, 15000000),
(69, 2, 1, 5000000),
(69, 4, 1, 9800000),
(70, 3, 1, 10000000),
(70, 1, 3, 15000000),
(70, 2, 1, 5000000),
(70, 4, 1, 9800000),
(71, 3, 1, 10000000),
(71, 1, 3, 15000000),
(71, 2, 1, 5000000),
(71, 4, 1, 9800000),
(72, 3, 1, 10000000),
(72, 1, 3, 15000000),
(72, 2, 1, 5000000),
(72, 4, 1, 9800000),
(73, 3, 1, 10000000),
(73, 1, 3, 15000000),
(73, 2, 1, 5000000),
(73, 4, 1, 9800000),
(74, 3, 1, 10000000),
(74, 1, 3, 15000000),
(74, 2, 1, 5000000),
(74, 4, 1, 9800000),
(75, 3, 1, 10000000),
(75, 1, 3, 15000000),
(75, 2, 1, 5000000),
(75, 4, 1, 9800000),
(76, 3, 1, 10000000),
(76, 1, 3, 15000000),
(76, 2, 1, 5000000),
(76, 4, 1, 9800000),
(77, 3, 1, 10000000),
(77, 1, 3, 15000000),
(77, 2, 1, 5000000),
(77, 4, 1, 9800000),
(78, 3, 1, 10000000),
(78, 1, 3, 15000000),
(78, 2, 1, 5000000),
(78, 4, 1, 9800000),
(79, 3, 1, 10000000),
(79, 1, 3, 15000000),
(79, 2, 1, 5000000),
(79, 4, 1, 9800000),
(80, 3, 1, 10000000),
(80, 1, 3, 15000000),
(80, 2, 1, 5000000),
(80, 4, 1, 9800000),
(81, 3, 1, 10000000),
(81, 1, 3, 15000000),
(81, 2, 1, 5000000),
(81, 4, 1, 9800000),
(82, 3, 1, 10000000),
(82, 1, 3, 15000000),
(82, 2, 1, 5000000),
(82, 4, 1, 9800000),
(83, 3, 1, 10000000),
(83, 1, 3, 15000000),
(83, 2, 1, 5000000),
(83, 4, 1, 9800000),
(84, 3, 1, 10000000),
(84, 1, 3, 15000000),
(84, 2, 1, 5000000),
(84, 4, 1, 9800000),
(85, 3, 1, 10000000),
(85, 1, 3, 15000000),
(85, 2, 1, 5000000),
(85, 4, 1, 9800000),
(86, 3, 1, 10000000),
(86, 1, 3, 15000000),
(86, 2, 1, 5000000),
(86, 4, 1, 9800000),
(87, 3, 1, 10000000),
(87, 1, 3, 15000000),
(87, 2, 1, 5000000),
(87, 4, 1, 9800000),
(88, 3, 1, 10000000),
(88, 1, 3, 15000000),
(88, 2, 1, 5000000),
(88, 4, 1, 9800000),
(89, 3, 1, 10000000),
(89, 1, 3, 15000000),
(89, 2, 1, 5000000),
(89, 4, 1, 9800000),
(90, 3, 1, 10000000),
(90, 1, 3, 15000000),
(90, 2, 1, 5000000),
(90, 4, 1, 9800000),
(91, 3, 1, 10000000),
(91, 1, 3, 15000000),
(91, 2, 1, 5000000),
(91, 4, 1, 9800000),
(92, 3, 1, 10000000),
(92, 1, 3, 15000000),
(92, 2, 1, 5000000),
(92, 4, 1, 9800000),
(93, 3, 1, 10000000),
(93, 1, 3, 15000000),
(93, 2, 1, 5000000),
(93, 4, 1, 9800000),
(94, 3, 1, 10000000),
(94, 1, 3, 15000000),
(94, 2, 1, 5000000),
(94, 4, 1, 9800000),
(95, 3, 1, 10000000),
(95, 1, 3, 15000000),
(95, 2, 1, 5000000),
(95, 4, 1, 9800000),
(96, 3, 1, 10000000),
(96, 1, 3, 15000000),
(96, 2, 1, 5000000),
(96, 4, 1, 9800000),
(97, 3, 1, 10000000),
(97, 1, 3, 15000000),
(97, 2, 1, 5000000),
(97, 4, 1, 9800000),
(98, 3, 1, 10000000),
(98, 1, 3, 15000000),
(98, 2, 1, 5000000),
(98, 4, 1, 9800000),
(99, 3, 1, 10000000),
(99, 1, 3, 15000000),
(99, 2, 1, 5000000),
(99, 4, 1, 9800000),
(100, 3, 1, 10000000),
(100, 1, 3, 15000000),
(100, 2, 1, 5000000),
(100, 4, 1, 9800000),
(101, 3, 1, 10000000),
(101, 1, 3, 15000000),
(101, 2, 1, 5000000),
(101, 4, 1, 9800000),
(102, 3, 1, 10000000),
(102, 1, 3, 15000000),
(102, 2, 1, 5000000),
(102, 4, 1, 9800000),
(103, 3, 1, 10000000),
(103, 1, 3, 15000000),
(103, 2, 1, 5000000),
(103, 4, 1, 9800000),
(104, 3, 1, 10000000),
(104, 1, 3, 15000000),
(104, 2, 1, 5000000),
(104, 4, 1, 9800000),
(105, 3, 1, 10000000),
(105, 1, 3, 15000000),
(105, 2, 1, 5000000),
(105, 4, 1, 9800000),
(106, 3, 1, 10000000),
(106, 1, 3, 15000000),
(106, 2, 1, 5000000),
(106, 4, 1, 9800000),
(107, 3, 1, 10000000),
(107, 1, 3, 15000000),
(107, 2, 1, 5000000),
(107, 4, 1, 9800000),
(108, 3, 1, 10000000),
(108, 1, 3, 15000000),
(108, 2, 1, 5000000),
(108, 4, 1, 9800000),
(109, 3, 1, 10000000),
(109, 1, 3, 15000000),
(109, 2, 1, 5000000),
(109, 4, 1, 9800000),
(110, 3, 1, 10000000),
(110, 1, 3, 15000000),
(110, 2, 1, 5000000),
(110, 4, 1, 9800000),
(111, 3, 1, 10000000),
(111, 1, 3, 15000000),
(111, 2, 1, 5000000),
(111, 4, 1, 9800000),
(112, 3, 1, 10000000),
(112, 1, 3, 15000000),
(112, 2, 1, 5000000),
(112, 4, 1, 9800000),
(113, 3, 1, 10000000),
(113, 1, 3, 15000000),
(113, 2, 1, 5000000),
(113, 4, 1, 9800000),
(114, 3, 1, 10000000),
(114, 1, 3, 15000000),
(114, 2, 1, 5000000),
(114, 4, 1, 9800000),
(115, 3, 1, 10000000),
(115, 1, 3, 15000000),
(115, 2, 1, 5000000),
(115, 4, 1, 9800000),
(116, 3, 1, 10000000),
(116, 1, 3, 15000000),
(116, 2, 1, 5000000),
(116, 4, 1, 9800000),
(117, 3, 1, 10000000),
(117, 1, 3, 15000000),
(117, 2, 1, 5000000),
(117, 4, 1, 9800000),
(118, 3, 1, 10000000),
(118, 1, 3, 15000000),
(118, 2, 1, 5000000),
(118, 4, 1, 9800000),
(119, 3, 1, 10000000),
(119, 1, 3, 15000000),
(119, 2, 1, 5000000),
(119, 4, 1, 9800000),
(120, 3, 1, 10000000),
(120, 1, 3, 15000000),
(120, 2, 1, 5000000),
(120, 4, 1, 9800000),
(121, 3, 1, 10000000),
(121, 1, 3, 15000000),
(121, 2, 1, 5000000),
(121, 4, 1, 9800000),
(122, 3, 1, 10000000),
(122, 1, 3, 15000000),
(122, 2, 1, 5000000),
(122, 4, 1, 9800000),
(123, 3, 1, 10000000),
(123, 1, 3, 15000000),
(123, 2, 1, 5000000),
(123, 4, 1, 9800000),
(124, 3, 1, 10000000),
(124, 1, 3, 15000000),
(124, 2, 1, 5000000),
(124, 4, 1, 9800000),
(125, 3, 1, 10000000),
(125, 1, 3, 15000000),
(125, 2, 1, 5000000),
(125, 4, 1, 9800000),
(126, 3, 1, 10000000),
(126, 1, 3, 15000000),
(126, 2, 1, 5000000),
(126, 4, 1, 9800000),
(127, 3, 1, 10000000),
(127, 1, 3, 15000000),
(127, 2, 1, 5000000),
(127, 4, 1, 9800000),
(128, 3, 1, 10000000),
(128, 1, 3, 15000000),
(128, 2, 1, 5000000),
(128, 4, 1, 9800000),
(129, 3, 1, 10000000),
(129, 1, 4, 20000000),
(129, 2, 1, 5000000),
(129, 4, 1, 9800000),
(130, 1, 1, 5000000),
(131, 1, 1, 5000000),
(132, 1, 1, 5000000),
(133, 1, 1, 5000000),
(134, 1, 1, 5000000),
(135, 1, 1, 5000000),
(136, 1, 4, 20000000),
(146, 1, 1, 5000000),
(151, 1, 1, 5000000),
(157, 1, 1, 5000000),
(159, 1, 1, 5000000),
(161, 1, 1, 5000000),
(174, 1, 1, 5000000),
(176, 1, 1, 5000000),
(177, 1, 1, 5000000),
(178, 1, 1, 5000000),
(179, 1, 1, 5000000),
(180, 1, 1, 5000000),
(181, 1, 1, 5000000),
(182, 1, 1, 5000000),
(183, 1, 1, 5000000),
(190, 1, 1, 5000000),
(191, 1, 1, 5000000),
(194, 1, 1, 5000000),
(195, 1, 1, 5000000),
(197, 1, 1, 5000000),
(198, 1, 4, 20000000),
(198, 2, 1, 5000000),
(198, 4, 1, 9800000),
(199, 5, 1, 4000000),
(200, 1, 3, 15000000),
(200, 3, 1, 10000000),
(200, 2, 1, 5000000),
(201, 1, 1, 5000000),
(202, 1, 1, 5000000),
(203, 1, 1, 5000000),
(204, 1, 1, 5000000),
(205, 1, 2, 10000000);

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `products`
--

CREATE TABLE `products` (
  `id` int(11) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `product_name` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `price` float DEFAULT NULL,
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `sale` int(11) DEFAULT 0,
  `hot` tinyint(1) DEFAULT 0,
  `description` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `information` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `deleted_at` datetime DEFAULT NULL,
  `image_product` int(11) DEFAULT NULL,
  `status_deleted` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `products`
--

INSERT INTO `products` (`id`, `category_id`, `product_name`, `price`, `status`, `sale`, `hot`, `description`, `information`, `created_at`, `updated_at`, `deleted_at`, `image_product`, `status_deleted`) VALUES
(1, 1, 'Đá Ruby cacbon tự nhiên', 5000000, 'còn hàng', 4500000, 1, 'Đá Topaz tự nhiên sở hữu vẻ đẹp tự nhiên nguyên bản, độ tinh khiết cao rất phù hợp lên nhẫn nữ. Giác cắt Round - Facet hiện đại đảm bảo cho thiết kế của bạn luôn rực rỡ và thu hút ở bất cứ hoàn cảnh xuất hiện nào. ', '/color:trắng,weight:3,88ct,size:10,1 - 6,2mm,opacity:trắng trong,cutting_form:Hình khối round - facet/', '2024-04-23 19:26:37', '2024-04-03 19:28:13', '2024-04-01 19:28:17', 1, 'da xoa'),
(2, 1, 'Đá Ruby chất kính trong', 5000000, 'còn hàng', 4500000, 1, 'Đá Topaz tự nhiên sở hữu vẻ đẹp tự nhiên nguyên bản, độ tinh khiết cao rất phù hợp lên nhẫn nữ. Giác cắt Round - Facet hiện đại đảm bảo cho thiết kế của bạn luôn rực rỡ và thu hút ở bất cứ hoàn cảnh xuất hiện nào. ', '0/color:trắng,weight:3,88ct,size:10,1 - 6,2mm,opacity:trắng trong,cutting_form:Hình khối round - facet/', '2024-04-04 19:26:37', '2024-04-03 19:28:20', '2024-04-03 19:28:22', 2, 'da xoa'),
(3, 6, 'Aquamarine xanh biển tự nhiên', 10000000, 'còn hàng', 9000000, 1, 'Đá Topaz tự nhiên sở hữu vẻ đẹp tự nhiên nguyên bản, độ tinh khiết cao rất phù hợp lên nhẫn nữ. Giác cắt Round - Facet hiện đại đảm bảo cho thiết kế của bạn luôn rực rỡ và thu hút ở bất cứ hoàn cảnh xuất hiện nào. ', '/color:trắng,weight:3,88ct,size:10,1 - 6,2mm,opacity:trắng trong,cutting_form:Hình khối round - facet/', '2024-04-29 19:26:37', '2024-04-01 19:28:26', '2024-04-03 19:28:29', 3, 'da xoa'),
(4, 6, 'Aquamarine xanh biển chiều ', 9800000, 'còn hàng', 9500000, 1, 'Đá Topaz tự nhiên sở hữu vẻ đẹp tự nhiên nguyên bản, độ tinh khiết cao rất phù hợp lên nhẫn nữ. Giác cắt Round - Facet hiện đại đảm bảo cho thiết kế của bạn luôn rực rỡ và thu hút ở bất cứ hoàn cảnh xuất hiện nào. ', '/color:trắng,weight:3,88ct,size:10,1 - 6,2mm,opacity:trắng trong,cutting_form:Hình khối round - facet/', '2024-04-29 19:26:37', '2024-04-09 19:28:32', '2024-04-24 19:28:37', 4, 'da xoa'),
(5, 3, 'Tourmaline cắt giác emerald tự nhiên', 4000000, 'còn hàng', 3500000, 1, 'Đá Topaz tự nhiên sở hữu vẻ đẹp tự nhiên nguyên bản, độ tinh khiết cao rất phù hợp lên nhẫn nữ. Giác cắt Round - Facet hiện đại đảm bảo cho thiết kế của bạn luôn rực rỡ và thu hút ở bất cứ hoàn cảnh xuất hiện nào. ', '/color:trắng,weight:3,88ct,size:10,1 - 6,2mm,opacity:trắng trong,cutting_form:Hình khối round - facet/', '2024-04-12 19:26:37', '2024-04-01 19:28:40', '2024-04-17 19:28:44', 5, 'da xoa'),
(6, 10, 'Viên Topaz trắng tinh khiết 3,88ct – IRTP57 2311388', 5820000, 'còn hàng', 300000, 1, 'Đá Topaz tự nhiên sở hữu vẻ đẹp tự nhiên nguyên bản, độ tinh khiết cao rất phù hợp lên nhẫn nữ. Giác cắt Round - Facet hiện đại đảm bảo cho thiết kế của bạn luôn rực rỡ và thu hút ở bất cứ hoàn cảnh xuất hiện nào. ', '/color:trắng,weight:3,88ct,size:10,1 - 6,2mm,opacity:trắng trong,cutting_form:Hình khối round - facet/', '2024-04-26 15:48:59', '2024-04-26 15:48:59', NULL, 100, 'da xoa'),
(7, 10, 'Viên Topaz màu trắng tinh khiết tự nhiên 100% 2,26ct – IRTP 237226', 3164000, 'còn hàng', 300000, 1, 'Đá Topaz không chỉ là món trang sức đá màu đặc biệt mà nó còn mang nhiều ý nghĩa về phong thủy và sức khỏe. Với đa dạng giá trị như vậy, loại đá này đã được nhiều người săn đón trên thị trường.', '/color:trắng,weight:2,26ct,size:7,4 - 7,1 - 5,3mm,opacity:Sạch tinh bằng mắt thường,cutting_form:Cắt khối Emerald tiêu chuẩn./', '2024-04-26 15:50:26', '2024-04-26 15:50:26', NULL, 64, 'da xoa'),
(8, 6, 'Tinh thể Aquamarine màu xanh lam 6,63g – IRAQ 236663\n', 5000000, 'háº¿t hÃ ng', 500000, 1, 'Tinh thể aquamarine là khoáng vật nằm trong nhóm Beryl có màu sắc xanh lam. Trong đó, loại màu xanh lam,được hình thành trong tự nhiên qua quá trình chuyển hóa của các vật chất tự nhiên. Chúng thường nằm sâu trong lòng đất và tích tụ rất nhiều năng lượng của vũ trụ.', '/color:xanh lam,weight:6,63g,size:4,4 - 1,1cm,opacity:trong suốt,cutting_form:chưa xác định/', '2024-04-26 15:52:55', '2024-04-26 15:52:55', NULL, 77, 'da xoa'),
(9, 2, 'Đá Sapphire cháo đồng An Phú Lục Yên 1,22ct – IRSP217 2404122', 33600000, 'còn hàng', 500000, 1, 'Sapphire màu cháo đồng tự nhiên, xuất xứ: Lục Yên. Trọng lượng: 1,22ct, hình khối heart - facet. Độ tinh khiết cao, lành sạch 99%. Phù hợp lên mẫu nhẫn, mặt dây chuyền.', '/color:hồng,weight:1,22ct,size:5,9 x 6,8 - 4mm,opacity:Độ chiếu toàn viên, đủ đáy,cutting_form:Heart - facet/', '2024-04-26 15:52:55', '2024-04-26 15:52:55', NULL, 1, 'da xoa'),
(10, 2, 'Đá Sapphire xanh lục Phan Thiết 6,99ct – IRGS171 2403699', 125820000, 'còn hàng', 10000000, 1, 'Đá Sapphire màu xanh lục tự nhiên, giác cắt quốc tế cushion - facet, lửa chiếu long lanh, đủ đáy, độ lành sạch 99%, độ tinh khiết cao. Trọng lượng 6,99ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:xanh lục,weight:6,99ct,size:11 x 10,3 - 7,6mm,opacity:Đủ đáy,Chiếu long lanh toàn viên,cutting_form:Cushion - facet/', '2024-04-26 15:57:06', '2024-04-26 15:57:06', NULL, NULL, 'da xoa'),
(11, 2, 'Viên Sapphire vàng tự nhiên 100% chưa qua nhiệt 2,62ct – IRYS152 2312262', 47160000, 'còn hàng', 5000000, 1, 'Sapphire vàng giúp chủ sở hữu loại bỏ được những suy nghĩ tiêu cực để mang lại sự thông thái về trí tuệ và tri thức.', '/color:vàng,weight:2,62ct,size:7,2mm - 5,5mm,opacity:Chiếu đẹp toàn viền, đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối round - facet/', '2024-04-26 15:57:06', '2024-04-26 15:57:06', NULL, NULL, 'da xoa'),
(12, 5, 'Đá Tourmaline đỏ tự nhiên 100% 3,52ct – IRTM40 2401352', 24640000, 'còn hàng', 1000000, 1, 'Đá Tourmaline có màu đỏ tự nhiên 100%, trọng lượng: 3,52ct, cắt giác facet, hình khối oval tiêu chuẩn. Phù hợp lên nhẫn và dây chuyền thiết kế.', '/color:Đỏ,weight:3,52ct,size:10,6 x 8,5 - 5,9mm,opacity:Chiếu bung toàn viên, đầy đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối oval - facet/', '2024-04-26 16:00:19', '2024-04-26 16:00:19', NULL, NULL, 'da xoa'),
(13, 5, 'Đá Tourmaline xanh lục siêu rực 3,34ct – IRTM31 2401334', 16700000, 'còn hàng', 2000000, 1, 'Đá Tourmaline có khả năng tạo ra những ion âm, có tác dụng trung hòa ion dương, làm sạch bầu không khí, giúp bầu không khí trở nên trong lành và an toàn hơn.', '/color:xanh lục,weight:3,34ct,size:8,9 x 8,2 - 5,1mm,opacity:Chiếu đẹp toàn viên, đầy đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối cushion - facet/', '2024-04-26 16:00:19', '2024-04-26 16:01:19', NULL, NULL, 'chua xoa'),
(14, 2, 'Viên Sapphire sao trắng tự nhiên 100% 4,23ct – IRSP151 2312423', 29610000, 'còn hàng', 1000000, 1, 'Đá Sapphire sao trắng sáng rõ ràng, mặt trơn bóng, láng mịn. Biểu trưng cho sự sang trọng, lịch lãm và có khả năng mang lại sự giàu sang, phú quý. Phù hợp với thiết kế nhẫn hoặc mặt dây chuyền.\r\n\r\n', '/color:trắng,weight:4,23ct,size:9,6 x 8,6 - 4,9mm,opacity:Sao nét thẳng cánh cân trục cân đỉnh, chùm chân không ngắt không đứt.,cutting_form:Hình khối Oval - cabochon/', '2024-04-27 12:50:24', '2024-04-27 12:51:24', NULL, NULL, 'chua xoa'),
(15, 2, 'Viên Sapphire sao nét 10 điểm màu lavender – IRSS 2211745', 37250000, 'còn hàng', 0, 1, 'Sapphire sao nét căng 10 điểm tuyển chọn kỹ lưỡng, cánh sao nét căng cân trục cân đỉnh. Màu Lavender đẹp lạ cá tính mang phong cách riêng.\r\n\r\n', '/color:Tím,weight:7.45ct,size:12 * 9.2 * 6.5mm,opacity:Bán trong - trong (chất bền vững liên kết tốt),cutting_form:Mài trơn cabachon/', '2024-04-27 12:53:07', '2024-04-27 12:53:07', NULL, NULL, 'chua xoa'),
(16, 2, 'Viên Sapphire đen tuyền 4,45ct – IRSP138 2311445\n', 8900000, 'cÃ²n hÃ ng', 0, 1, 'Đá Sapphire đen tượng trưng cho sự bí ẩn, cuốn hút, đồng thời là biểu tượng của thịnh vượng. Nhẫn và vòng tay, dây chuyền trang sức từ đá Sapphire đặc biệt phù hợp với những người mệnh Thủy, Mộc', '/color:đen,weight:4,45ct,size:9,6 x 8,4 - 6mm,opacity:Chiếu bung toàn viên, đủ đáy,cutting_form:Hình khối cushion - facet/', '2024-04-27 12:54:45', '2024-04-27 12:54:45', NULL, NULL, 'chua xoa'),
(17, 2, 'Viên Sapphire đen tuyền 4,27ct – IRSP137 2311427', 8540000, 'còn hàng', 0, 1, 'Đá Sapphire đen tuyền 100% tự nhiên, thể hiện sự tự tin, quyết đoán và khả năng kiểm soát trong cuộc sống. Một trong những ý nghĩa quan trọng khác của đá sapphire đen là sự bình an và bảo vệ. \r\n\r\n', '/color:đen,weight:4,27ct,size:10,2 x 7,8 - 6,1mm,opacity:Chiếu toàn viên, đủ đáy,cutting_form:Hình khối oval - facet/', '2024-04-27 12:56:07', '2024-04-27 12:56:07', NULL, NULL, 'da xoa'),
(18, 2, 'Viên Sapphire đen tuyền khối oval tiêu chuẩn 4,78ct – IRSP 237478', 9000000, 'còn hàng', 0, 1, 'ĐáSapphire đen khối Oval cắt giác facet tiêu chuẩn quốc tế hiện đại, rất phù hợp lên nhẫn nam với trọng lượng 4,78ct. viên đá mang nguồn sức mạnh nội lực, sự uy nghiêm có chút cuốn hút rất khó tả.\r\n\r\n', '/color:đen,weight:4,78ct,size:10,6 - 9 - 5,9mm,opacity:trong,cutting_form:Cắt giác Facet đẹp tiêu chuẩn/', '2024-04-27 12:57:21', '2024-04-27 12:57:21', NULL, NULL, 'chua xoa'),
(19, 2, 'Đôi pink Sapphire facet hồng Lục Yên 1,05ct – IRSP141 2311105\n', 18900000, 'còn hàng', 0, 1, 'Đôi đá Sapphire Lục Yên màu hồng siêu hot được tuyển chọn và hoàn thiện tỉ mỉ, tinh tế. Hai viên Sapphire có kích thước bằng nhau thích hợp lên thiết kế nhẫn cưới hoặc khuyên tai cho mọi lứa tuổi.\r\n\r\n', '/color:hồng,weight:1,05ct,size:5,1mm - 5,1mm,opacity:Chiếu đẹp toàn viền, đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối oval - facet/', '2024-04-27 12:59:06', '2024-04-27 12:59:06', NULL, NULL, 'chua xoa'),
(20, 2, 'Viên Sapphire màu tím 0,87ct – IRSP 236087', 6090000, 'còn hàng', 0, 1, 'Viên Sapphire tím đẹp nguyên bản tự nhiên 100%, cắt facet hiện đại sang trọng. Lên thiết kế đẹp cuốn hút, sự lựa chọn hoàn cho những ai có con mắt tinh tế. \r\n\r\n', '/color:tím hồng,weight:0,87ct,size:6,8 - 5 - 3,6mm,opacity:độ lành sạch cao,cutting_form:chưa xác định/\r\n', '2024-04-27 13:00:30', '2024-04-27 13:00:30', NULL, NULL, 'chua xoa'),
(21, 2, 'Viên Sapphire màu hot pink 3,30ct tự nhiên 100% – IRPS142 238330\n', 186000000, 'hết hàng', 0, 1, 'Sở hữu vẻ đẹp lung linh, sang trọng và quyền quý, Sapphire từ lâu đã chiếm trọn tìm cảm trong trái tim những người yêu đá quý. Nhưng Sapphire không chỉ gây ấn tượng với vẻ đẹp độc đáo bên ngoài mà còn được yêu thích và nổi tiếng với công dụng và ý nghĩa vô cùng tuyệt vời. ', '/color:hồng,weight:3,30ct,size:9,4 x 7,9 - 4,9mm,opacity:Độ lành sạch cao,cutting_form:Hình khối oval - facet/', '2024-04-27 13:17:59', '2024-04-27 13:17:59', NULL, NULL, 'chua xoa'),
(22, 2, 'Viên Sapphire hồng chiếu bung tuyệt đẹp 2,56ct – IRSP 2208256\n', 56760000, 'còn hàng', 0, 1, 'Viên Sapphire hồng 2.56ct chiếu bung toàn viên màu tuyệt đẹp, phù hợp mệnh Hỏa và Thổ, dễ lên mặt dây chuyền hoặc mặt nhẫn.\r\n\r\n', '/color:hồng,weight:2,56ct,size:7.4 * 7.3 * 5.5mm,opacity:Trong suốt, sạch mắt thường,cutting_form:Cushion cân đối đủ đáy/', '2024-04-27 13:20:10', '2024-04-27 13:20:10', NULL, NULL, 'chua xoa'),
(23, 2, 'Viên Sapphire tím hồng sáng lấp lánh 2,27ct – IRSP 2208227', 49940000, 'còn hàng', 200000, 0, 'Viên Sapphire tím hồng 2,27ct chiếu toàn viên màu lạ tuyệt đẹp. Xuất xứ: Lục Yên màu sắc: Tím hồng, phù hợp làm mặt dây chuyền, mặt nhẫn.\r\n\r\n', '/color:tím hồng,weight:2,27ct,size:7.7 * 6.6 * 4.6mm,opacity:Trong suốt, sạch tinh mắt thường,cutting_form:Cushion cân đối đủ đáy/', '2024-04-27 13:21:29', '2024-04-27 13:21:29', NULL, NULL, 'chua xoa'),
(24, 2, 'Đôi Sapphire hồng Lục Yên 0,87ct – IRSP142 2311087\n', 16530000, 'còn hàng', 500000, 1, 'Đôi đá Sapphire Lục Yên màu hồng được tuyển chọn và hoàn thiện tỉ mỉ, tinh tế. Đá Sapphire hồng mang lại may mắn và tài lộc cho người sở hữu. Năng lượng từ đá Sapphire sẽ giúp chủ nhân tránh được những điềm xui rủi trong cuộc sống.\r\n\r\n', '/color:hồng,weight:0,87ct,size:4,2mm - 3,9mm,opacity:Chiếu toàn viên từ đáy, từ mọi giác cắt sáng rực.,cutting_form:Hình khối round - facet/', '2024-04-27 13:23:04', '2024-04-27 13:23:04', NULL, NULL, 'chua xoa'),
(25, 2, 'Đá Sapphire facet hồng phớt tím 1,28ct – IRSP149 2312128', 19200000, 'còn hàng', 5000000, 1, 'Sapphire màu tím tượng trưng cho sự chung thủy trong tình yêu và hôn nhân viên mãn. Những trang sức được làm từ đá Sapphire tím rất được các cặp đôi yêu thích, được lựa chọn để làm quà tặng cho nhau trong những dịp quan trọng.\r\n\r\n', '/color:đỏ hồng,weight:1,28ct,size:5,7 x 5,4 - 4,2mm,opacity:Chiếu đẹp toàn viền, đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối oval - facet/', '2024-04-27 13:30:24', '2024-04-27 13:30:24', NULL, NULL, 'chua xoa'),
(26, 1, 'Đá Ruby giọt nước tự nhiên 100% 1,12ct – IRRF215 2404112', 17920000, 'còn hàng', 1000000, 1, 'Đá Ruby đỏ hồng nguyên bản, giác cắt quốc tế pear - facet. Độ  long lanh, đủ đáy. Trọng lượng 1,12ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:đỏ,weight:1,12ct,size:6,4 x 5 - 3,9mm,opacity:Đủ đáy,Chiếu long lanh toàn viên,cutting_form:Pear - facet/', '2024-04-27 21:09:56', '2024-04-27 21:09:56', NULL, NULL, 'chua xoa'),
(27, 1, 'Đá Ruby huyết bồ câu nguyên bản Lục Yên 1,50ct – IRRF216 2404150', 52500000, 'còn hàng', 5000000, 0, 'Đá Ruby huyết bồ câu nguyên bản, xuất xứ: Lục Yên, giác cắt quốc tế cushion - facet. Độ chiếu tốt, đủ đáy. Trọng lượng 1,50ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:đỏ,weight:1,50ct,size:6,9 x 5,8 - 3,8mm,opacity:Đủ đáy,Độ chiếu tốt,cutting_form:Cushion - facet/', '2024-04-27 21:09:56', '2024-04-27 21:09:56', NULL, NULL, 'chua xoa'),
(28, 1, 'Đá Ruby cabochon Lục Yên 1,76ct – IRRC214 2404176\n', 10560000, 'còn hàng', 1000000, 0, 'Đá Ruby màu đỏ đẹp. Xuất xứ: Lục Yên. Chất kính trong, liên kết bền vững, trọng lượng 1,76ct, hình khối cabochon. Phù hợp lên mẫu nhẫn, mặt dây thiết kế.\r\n\r\n', '/color:đỏ hồng,weight:1,76ct,size:8,2 x 6,5 - 3mm,opacity:Chất kính trong,cutting_form:Cabochon bề mặt sáng bóng/', '2024-04-27 21:12:37', '2024-04-27 21:12:37', NULL, NULL, 'chua xoa'),
(29, 1, 'Đá Ruby facet đỏ hồng Lục Yên tự nhiên 1,52ct – IRRF211 2403152\n', 45000000, 'còn hàng', 1000000, 0, 'Đá Ruby Lục Yên, giác cắt quốc tế cushion - facet. Độ long lanh toàn viên, đủ đáy. Trọng lượng 1,52ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:đỏ hồng,weight:1,52ct,size:7 x 5,5 - 4,7mm,opacity:Chiếu long lanh toàn viên,Đủ đáy,cutting_form:Cushion - facet/', '2024-04-27 21:12:37', '2024-04-27 21:12:37', NULL, NULL, 'chua xoa'),
(30, 1, 'Đá Ruby cabochon Lục Yên 9,65ct – IRRC208 2403965\n', 76000000, 'còn hàng', 5500000, 0, 'Đá Ruby màu đỏ đẹp, khối cao, mặt mịn, chất bán trong, liên kết bền vững, trọng lượng 9,65ct, hình khối cabochon.\r\n\r\n', '/color:đỏ,weight:9,65ct,size:13 x 11 - 6,2mm,opacity:chất bán trong,cutting_form:Oval - cabochon/', '2024-04-27 21:14:46', '2024-04-27 21:14:46', NULL, NULL, 'chua xoa'),
(31, 1, 'Đá Ruby facet Lục Yên 3,00ct – IRRF207 2402300', 163000000, 'háº¿t hÃ ng', 5000000, 0, 'Đá Ruby Lục Yên, đủ đáy, giác cắt quốc tế cushion - facet. Độ chiếu tốt, đủ đáy. Trọng lượng 3,00ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:đỏ,weight:3,00ct,size:8,3 x 8,2 - 5mm,opacity:Độ chiếu tốt,Đủ đáy,cutting_form:Hình khối cushion - facet/', '2024-04-27 21:14:46', '2024-04-27 21:14:46', NULL, NULL, 'chua xoa'),
(32, 1, 'Đá Ruby cabochon tự nhiên 100% 1,85ct – IRRC206 2401185\n', 12950000, 'còn hàng', 5000000, 0, 'Đá Ruby màu đỏ, khối cao, mặt mịn, chất lành không rạn, chất liên kết bền vững, trọng lượng 1,85ct, hình khối cabochon.\r\n\r\n', '/color:đỏ,weight:1,85ct,size:6,5 x 6 - 4,4mm,opacity:Chất lành không rạn,Khối cao - mặt mịn,cutting_form:Cabochon bề mặt sáng bóng/', '2024-04-27 21:17:39', '2024-04-27 21:17:39', NULL, NULL, 'chua xoa'),
(33, 1, 'Viên Ruby facet đỏ hồng ánh cháo đồng 1,22ct – IRRF203 2401122\n', 24400000, 'còn hàng', 100000, 0, 'Đá Ruby hồng là một trong những loại đá quý hoàn hảo và đẹp nhất, chúng thể hiện quyền lực, sự tự do, may mắn và vui vẻ.\r\n\r\n', '/color:đỏ,weight:1,22ct,size:6,5 x 5,5 - 4,1mm,opacity:Chiếu bung toàn viên, đầy đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Cushion - facet/', '2024-04-27 21:17:39', '2024-04-27 21:17:39', NULL, NULL, 'chua xoa'),
(34, 1, 'Viên Ruby cabochon huyết kính 1,13ct – IRRC196 2312113\n', 5300000, 'còn hàng', 500000, 0, 'Với những người có mệnh Hỏa, Ruby đỏ là đá có màu tương hợp. Vì vậy viên đá này sẽ luôn mang đến cho những chủ nhân mệnh Hỏa những điều tốt lành nhất về sức khỏe và sự nghiệp.\r\n\r\n', '/color:đỏ,weight:1,13ct,size:5,9 x 5,4 - 3,2mm,opacity:Chất ngọc lành sạch,cutting_form:Hình khối Oval - cabochon/', '2024-04-27 21:24:42', '2024-04-27 21:24:42', NULL, NULL, 'chua xoa'),
(35, 1, 'Viên Ruby cabochon Lục Yên 0,97ct – IRRC195 2312097\n', 10000000, 'còn hàng', 500000, 0, 'Đá Ruby rất tốt cho người mệnh thổ bởi vì Hỏa sinh Thổ, mọi vật bị đốt cháy sẽ hóa thành tro, bụi, đất, cát, khi đó hỏa của lửa sẽ sinh ra thổ của đất.\r\n\r\n', '/color:đỏ,weight:0,97ct,size:chưa xấc định,opacity:Chất ngọc kính trong,cutting_form:Hình khối Oval - cabochon/', '2024-04-27 21:24:42', '2024-04-27 21:24:42', NULL, NULL, 'chua xoa'),
(36, 1, 'Viên Ruby sao tự nhiên 100% 0,98ct – IRSR184 2312098\n', 17640000, 'còn hàng', 500000, 0, 'Ruby sao dáng oval hiện đại, màu bóng đỏ ánh tím đẹp lạ mang cá tính riêng. Màu của sự may mắn, tương sinh với mệnh Thổ và Hỏa. Phù hợp lên thiết kế mặt dây chuyền hoặc mặt nhẫn.\r\n\r\n', '/color:đỏ,weight:0,98ct,size:6,6 x 5 - 3,1mm,opacity:Chất kính trong bền vững,cutting_form:Hình khối Oval - cabochon/', '2024-04-27 21:26:51', '2024-04-27 21:26:51', NULL, NULL, 'chua xoa'),
(37, 1, 'Viên Ruby facet đỏ hồng Lục Yên 2,20ct – IRRF182 2312220\n', 120000000, 'còn hàng', 5000000, 0, 'Đá Ruby màu đỏ hồng rực lửa tự nhiên, cắt giác facet sáng bóng, dáng Cushion. Phù hợp lên thiết kế mặt nhẫn hoặc mặt dây chuyền.\r\n\r\n', '/color:đỏ,weight:2,20ct,size:8,7 x 6,4 - 4,3mm,opacity:Hình khối cushion - facet,cutting_form:Chiếu bung toàn viên từ đáy, từ mọi giác cắt sáng rực./', '2024-04-27 21:26:51', '2024-04-27 21:26:51', NULL, NULL, 'chua xoa'),
(38, 1, 'Viên Ruby facet đỏ hồng có sắc cháo đồng đẹp 1,75ct – IRRF177 2312175\n', 56000000, 'còn hàng', 5000000, 1, 'Đá Ruby là loại đá quý được lựa chọn để lên mẫu trang sức để có thể thuận tiện mang bên mình. Ngoài ra, đá Ruby có ý nghĩa sâu sắc trong phong thủy. Đây là viên đá tượng trưng cho Hỏa – nguyên tố mạnh mẽ nhất trong ngũ hành.\r\n\r\n', '/color:đỏ,weight:1,75ct,size:9,1 x 5,3 - 3,7mm,opacity:Chiếu đẹp toàn viên, đầy đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối giọt nước/', '2024-04-27 21:29:11', '2024-04-27 21:29:11', NULL, NULL, 'chua xoa'),
(39, 1, 'Viên Ruby cabochon đỏ huyết 7,28ct – IRRC173 2312728', 43680000, 'còn hàng', 5000000, 1, 'Đá Ruby là loại đá quý rất hiếm có, nhất là những viên đá quý Ruby có chất lượng tuyệt hảo.\r\n\r\n', '/color:đỏ,weight:7,28ct,size:11,1 x 9,2 - 7,3mm,opacity:Chất kính trong bền vững,cutting_form:Hình khối Oval - cabochon/', '2024-04-27 21:29:11', '2024-04-27 21:29:11', NULL, NULL, 'chua xoa'),
(40, 1, 'Viên Ruby sao Nghệ An 3,43ct tự nhiên – IRSR140 238343\n', 12000000, 'còn hàng', 1000000, 1, 'Đá Ruby sao là những viên đá phát sáng ra ngôi sao 6 cánh đối xứng với nhau, Ngôi sao tạo điểm nhấn và thu hút ánh nhìn của bất cứ ai từng được ngắm nhìn. Bởi vẻ đẹp riêng biệt Ruby sao luôn được săn lùng và tìm kiếm.\r\n\r\n', '/color:đỏ,weight:3,43ct,size:8,5 x 7,5 - 5,3m,opacity:Chất ngọc kính trong,cutting_form:Mài trơn cabochon láng mịn/', '2024-04-27 21:31:33', '2024-04-27 21:31:33', NULL, NULL, 'chua xoa'),
(41, 1, 'Viên Ruby facet 1,65ct Lục Yên – IRRF138 238165\r\n', 18000000, 'còn hàng', 5000000, 1, 'Đá Ruby được xem là biểu tượng của tình yêu, biểu trưng cho sự nồng nàn và lãng mạn. Chính vì vậy, Nhẫn đá Ruby thường được chọn làm món quà truyền thống dành cho các cặp vợ chồng nhân kỷ niệm 40 năm ngày cưới của mình.\r\n\r\n', '/color:đỏ hồng,weight:1,65ct,size:7,5 x 6,7 - 4,8mm,opacity:có chút bao thể tự nhiên,cutting_form:khối oval - facet/\r\n', '2024-04-27 21:31:33', '2024-04-27 21:31:33', NULL, NULL, 'chua xoa'),
(42, 1, 'Đôi Ruby facet đỏ hồng Lục Yên 1,50ct – IRRF163 2311150\n', 28500000, 'còn hàng', 100000, 1, 'Đôi đá Ruby Lục Yên nhỏ xinh màu đỏ hồng, được hoàn thiện tỉ mỉ tinh tế, đẹp về chất lượng sẽ tạo được ấn tượng mạnh với mọi người, đặt biệt khi được chế tác thành đôi bông tai.\r\n\r\n', '/color:Đỏ,Hồng,weight:1,50ct,size:5,3mm - 5,4mm,opacity:Chiếu đẹp toàn viên, đầy đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối cushion - facet/', '2024-04-27 21:56:27', '2024-04-27 21:56:27', NULL, NULL, 'chua xoa'),
(43, 1, 'Viên Ruby cabochon Lục Yên 13,5ct – IRRC161 2311135\n', 236250000, 'còn hàng', 100000, 1, 'Đá Ruby luôn được xem như loại đá quý hiếm nhất trên thế giới. Hội tụ đầy đủ tiêu chuẩn một viên đá quý cần có như là: màu sắc rực rỡ, độ cứng tốt nhất, phát sáng cực mạnh. Thêm vào đó đây là loại đá quý rất hiếm có, nhất là những viên đá quý Ruby có chất lượng tuyệt hảo.\r\n\r\n', '/color:đỏ,weight:13,5ct,size:13,6 x 11,4 - 8mm,opacity:Trong suốt 100%,cutting_form:Khối oval - cabochon/\r\n', '2024-04-27 21:56:27', '2024-04-27 21:56:27', NULL, NULL, 'chua xoa'),
(44, 1, 'Viên Ruby facet hồng Lục Yên 0,58ct – IRRF153 2310058\r\n', 7500000, 'còn hàng', 500000, 1, 'Màu sắc của nhẫn đá Ruby là màu đỏ, hồng nên sẽ phù hợp với những người thuộc mệnh thổ, hoả, thuỷ. Mang đến cho người sở hữu những điều may mắn, tốt lành trong tình duyên, công việc, sự nghiệp.\r\n\r\n', '/color:đỏ,weight:0,58ct,size:4,9 x 4,8 - 2,6mm,opacity:Chiếu đẹp toàn viền, đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Khối cushion - facet/', '2024-04-27 21:58:28', '2024-04-27 21:58:28', NULL, NULL, 'chua xoa'),
(45, 1, 'Viên Ruby facet đỏ hồng Lục Yên 0,76ct – IRRF154 2310076\r\n', 11000000, 'còn hàng', 200000, 1, 'Đá Ruby mang ý nghĩa đại diện cho quyền lực, thịnh vượng. Những người sở hữu những viên đá Ruby sẽ gặp nhiều thành công trong sự nghiệp, có thể làm chủ cuộc sống của bản thân và đạt được những điều mình mong muốn.\r\n\r\n', '/color:đỏ,weight:0,76ct,size:6,3 x 4,8 - 3,1mm,opacity:Chiếu đẹp toàn viên, đầy đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối oval - facet/', '2024-04-27 21:58:28', '2024-04-27 21:58:28', NULL, NULL, 'chua xoa'),
(46, 1, 'Viên Ruby facet tự nhiên 0,62ct – IRRF147 239062\r\n', 6000000, 'còn hàng', 500000, 1, 'Đá Ruby viên đá biểu tượng của tình sự gắn kết vĩnh cửu, trong phong thủy màu đỏ là màu đem lại may mắn và tài lộc. Ruby Facet tự nhiên giác cắt sáng long lanh giúp bạn lên nhẫn hay mặt dây đều đẹp. \r\n\r\n', '/color:đỏ,weight:0,62ct,size:4,5 x 3,9 - 3,7mm,opacity:trong suốt,cutting_form:facet đầy đủ/', '2024-04-27 22:00:34', '2024-04-27 22:00:34', NULL, NULL, 'chua xoa'),
(47, 1, 'Viên Ruby facet 1,65ct Lục Yên – IRRF138 238165\r\n', 18000000, 'còn hàng', 500000, 1, 'Đá Ruby được xem là biểu tượng của tình yêu, biểu trưng cho sự nồng nàn và lãng mạn. Chính vì vậy, Nhẫn đá Ruby thường được chọn làm món quà truyền thống dành cho các cặp vợ chồng nhân kỷ niệm 40 năm ngày cưới của mình.\r\n\r\n', '/color:đỏ,weight:1,65ct,size:7,5 x 6,7 - 4,8mm,opacity:có chút bao thể tự nhiên,cutting_form:khối oval - facet/', '2024-04-27 22:00:34', '2024-04-27 22:00:34', NULL, NULL, 'chua xoa'),
(48, 1, 'Viên Ruby facet màu đỏ huyết tự nhiên 1,63ct – IRRF04 238163\r\n', 240000000, 'còn hàng', 5000000, 1, 'Ruby là biểu tượng của sự quý phái, sang trọng và đẳng cấp. Được mệnh danh là Vua của các loại đá quý tự nhiên. Người xưa tin rằng Ruby vượt trội hơn các loại đá quý khác về đặc tính và giá trị của nó đôi khi còn vượt qua cả Kim Cương.\r\n\r\n', '/color:đỏ,weight:1,63ct,size:7,8 - 6 - 3,8mm,opacity:Sạch 95% có bao thể đặc trưng,cutting_form:Oval facet tiêu chuẩn/', '2024-04-27 22:05:07', '2024-04-27 22:05:07', NULL, NULL, 'chua xoa'),
(49, 1, 'Viên Ruby cabochon màu đỏ hồng Lục Yên 5,67ct – IRRB 235567\n', 26000000, 'còn hàng', 500000, 1, 'Dựa trên quan niệm phong thủy, đá Ruby được xem là lá bùa hộ mệnh cho nhũng ai sở hữu chúng. Viên đá Ruby màu đỏ hồng, tượng trưng một trái tim vĩ đại. Sở hữu được viên Hồng Ngọc Ruby này nghĩa là bạn đã có được may mắn và hạnh phúc trong cuộc sống.\r\n\r\n', '/color:đỏ,weight:5,67ct,size:9,5 - 9,2 - 6,3mm,opacity:Chất kính trong bền vững,cutting_form:Mài trơn cabochon láng mịn/', '2024-04-27 22:05:07', '2024-04-27 22:05:07', NULL, NULL, 'chua xoa'),
(50, 1, 'Viên Ruby sao Yên Bái sao nét 2,48ct – IRRB 237248\n', 36000000, 'còn hàng', 500000, 1, 'Đá Ruby sao không những được đánh giá cao về giá trị thẩm mỹ mà nó còn có những ý nghĩa tuyệt vời mà ít ai biết đến. Với màu đỏ hồng không chỉ tôn vinh vẻ đẹp của phụ nữ, đá Ruby còn là biểu tưởng của tình yêu nồng cháy đôi lứa.\r\n\r\n', '/color:đỏ hồng,weight:2.48ct,size:9 - 6,1 - 4mm,opacity:có bao thể tự nhiên của đá,cutting_form:Mài trơn cabochon láng mịn/', '2024-04-27 22:07:00', '2024-04-27 22:07:00', NULL, NULL, 'chua xoa'),
(51, 1, 'Viên Ruby facet Lục Yên hàng tự nhiên 0,79ct – IRRB 237079\r\n', 18000000, 'còn hàng', 500000, 1, 'Ruby là loại đá quý đặc biệt, được hình thành trong quá trình biến đổi địa chất phức tạp, hấp thụ tinh hoa đất trời. Vì vậy, Ruby mang lại cho mình nguồn năng lượng và linh khí cao, do đó Ruby thường được làm vật may mắn trong phong thủy.\r\n\r\n', '/color:đỏ huyết,weight:0,79ct,size:5,5 - 4,7 - 3,5mm,opacity:độ lành sạch cao,cutting_form:Giác cắt Facet tiêu chuẩn đủ đáy/', '2024-04-27 22:07:00', '2024-04-27 22:07:00', NULL, NULL, 'chua xoa'),
(52, 1, 'Viên Ruby sao đẹp xuất sắc 2,18ct – IRRB 236218\r\n', 120000000, 'còn hàng', 10000000, 1, 'Ruby sao viên đá mang vẻ đẹp độc đáo, xuất xứ Nghệ An. Sở hữu tất cả những yếu tố tạo nên một siêu phẩm, chất ngọc trong, không rạn vỡ lên mặt nhẫn xứng tầm chủ sở hữu.\r\n\r\n', '/color:đỏ,weight:2,18ct,size:7,8 - 5,8 - 4,8mm,opacity:Chiếu đẹp toàn bề mặt,cutting_form:Oval cabachon/', '2024-04-27 22:09:38', '2024-04-27 22:09:38', NULL, NULL, 'chua xoa'),
(53, 1, 'Viên Ruby Cabochon màu đỏ huyết 4,50ct – IRRB 236450\r\n', 32000000, 'còn hàng', 500000, 1, 'Đá Ruby có thể khiến người đeo toát nên vẻ sang trọng. Ý nghĩa của đá Ruby trong gia đình đá quý tượng trưng cho sự ấm áp vì thế trang sức đá Ruby được rất nhiều khách hàng lựa chọn để làm quà tặng dành cho những người thân yêu trong những dịp quan trọng.\r\n\r\n', '/color:đỏ,weight:4,50ct,size:10,4 - 8,1 - 4,8mm,opacity:Chất kính trong bền vững,cutting_form:Mài trơn cabochon láng mịn/', '2024-04-27 22:09:38', '2024-04-27 22:09:38', NULL, NULL, 'chua xoa'),
(54, 1, 'Viên Ruby cabochon màu đỏ huyết 2,91ct – IRRB 236291\r\n', 26000000, 'còn hàng', 1000000, 1, 'Đá Ruby là một trong những loại đá quý phổ biến nhất và được sử dụng để làm trang sức. Với màu sắc đỏ huyết bồ câu và ánh lấp lánh đặc biệt, Ruby thường được đặt trong các thiết kế nhẫn, dây chuyền và vòng tay.\r\n\r\n', '/color:đỏ huyết,weight:2,91ct,size:8,5 - 6,9 - 5,1mm,opacity:Mài trơn cabochon láng mịn,cutting_form:cacbochon/', '2024-04-27 22:12:54', '2024-04-27 22:12:54', NULL, NULL, 'chua xoa'),
(55, 1, 'Viên Ruby facet Lục Yên tự nhiên 0,56ct – IRRB 235056\r\n', 8400000, 'còn hàng', 1000000, 0, 'Ruby facet có xuất xứ Lục Yên  tự nhiên đẹp không tỳ vết, trọng lượng 0,56ct xinh xắn khi lên mặt nhẫn hay mặt dây chuyền đặc biệt dành riêng cho mệnh Hỏa và Thổ.\r\n\r\n', '/color:đỏ,weight:0,56ct,size:5,5 - 3,8 - 2,8mm,opacity:Chiếu đẹp toàn viên, đủ đáy,cutting_form:Giác cắt Facet tiêu chuẩn đủ đáy/', '2024-04-27 22:12:54', '2024-04-27 22:12:54', NULL, NULL, 'chua xoa'),
(56, 1, 'Viên Ruby facet đỏ hồng tự nhiên 0,37ct – IRRB 2350037\n', 5500000, 'còn hàng', 500000, 1, 'Ruby facet dáng Oval hiện đại, màu đỏ hồng đẹp lạ mang cá tính riêng. Màu của sự may mắn, tương sinh với mệnh Thổ và Hỏa.\r\n\r\n', '/color:đỏ hồng,weight:0.37ct,size:6,5 - 3,5 - 2mm,opacity:Chiếu đẹp toàn viên, đầy đủ đáy,cutting_form:facet/', '2024-04-27 22:15:22', '2024-04-27 22:15:22', NULL, NULL, 'chua xoa'),
(57, 1, 'Viên Ruby đỏ hồng Lục Yên 0,36ct – IRRB 235036\r\n', 5400000, 'còn hàng', 100000, 1, 'Ruby facet Lục Yên cắt giác Facet màu đỏ hồng tươi sáng, dáng tròn xinh xắn phù hợp cho nữ lên mặt nhẫn. Khối đẹp tiêu chuẩn, đủ đáy lửa chiếu đẹp toàn viên.\r\n\r\n', '/color:đỏ hồng,weight:0.36ct,size:4,2 - 3,9 - 2,6mm,opacity:Chiếu toàn viên, đủ đáy,cutting_form:Cắt giác Facet đẹp tiêu chuẩn, góc cắt sắc nét./', '2024-04-27 22:15:22', '2024-04-27 22:15:22', NULL, NULL, 'chua xoa'),
(58, 1, 'Viên Ruby Lục Yên màu đỏ huyết 0,90ct – IRRB 235090\n', 4500000, 'còn hàng', 0, 0, 'Viên Ruby cùng vẻ lung linh, sang trọng mà nó sở hữu. Đá Ruby cabachon cũng là một trong những loại đá trang sức rất được lòng các chị em phụ nữ bởi sự tinh tế và cuốn hút  nó mang lại.\r\n\r\n', '/color:đỏ hồng,weight:0,90ct,size:5,5 - 5,4 - 2,7mm,opacity:Chất kính trong bền vĩnh cửu,cutting_form:Mài trơn cabachon bóng mịn/', '2024-04-27 22:17:52', '2024-04-27 22:17:52', NULL, NULL, 'chua xoa'),
(59, 1, 'Viên Ruby cabachon màu đỏ huyết 0,92ct – IRRB 235092\n', 4600000, 'còn hàng', 0, 0, 'Viên Ruby là biểu tượng của tình yêu, sự gắn kết chính vì thế Ruby luôn được ưu tiên lựa chọn trong những dịp quan trọng để làm quà tặng. Những thiết kế phổ biến như vòng tay, nhẫn, dây chuyền…\r\n\r\n', '/color:đỏ huyết,weight:0.92ct,size:5,9 - 4,8 - 2,9mm,opacity:Mài trơn cabachon bóng mịn,cutting_form::chất bán trong/', '2024-04-27 22:17:52', '2024-04-27 22:17:52', NULL, NULL, 'chua xoa'),
(60, 1, 'Viên Ruby facet đỏ hồng Lục Yên 1,30ct – IRRB 234130\n', 2600000, 'còn hàng', 0, 0, 'Ruby facet có xuất xứ Lục Yên  tự nhiên đẹp không tỳ vết, trọng lượng 1.ct xinh xắn khi lên mặt nhẫn hay mặt dây chuyền đặc biệt dành riêng cho mệnh Hỏa và Thổ.\r\n\r\n', '/color:đỏ hồng,weight:1.30ct,size:6,3 - 5,1 - 4,2mm,opacity:lành sạch liên kết bền vững,cutting_form:Chiếu toàn viên, đủ đáy/', '2024-04-27 22:21:28', '2024-04-27 22:21:28', NULL, NULL, 'chua xoa'),
(61, 1, 'Viên Ruby cabochon Lục Yên tự nhiên 100% 5,00ct – IRRB 237500', 22000000, 'hết hàng', 500000, 1, 'Viên Ruby cùng vẻ lung linh, sang trọng mà nó sở hữu. Ruby Cabachon là viên đá mà các nhà thiết kế trang sức luôn ưu ái lựa chọn bởi vẻ đẹp mà nó sở hữu cuốn hút, đam mê như một sức mạnh vô hình khiến bạn say mê nó. \r\n\r\n', '/color:đỏ,weight:5.00ct,size:10,9 - 8,9 - 4,2mm,opacity:Chất kính trong,cutting_form:Mài trơn cabochon láng mịn/', '2024-04-28 08:31:57', '2024-04-28 08:31:57', NULL, NULL, 'chua xoa'),
(62, 1, 'Viên Ruby facet đỏ hồng tự nhiên 0,37ct – IRRB 2350037\n', 5500000, 'còn hàng', 500000, 0, 'Ruby facet dáng Oval hiện đại, màu đỏ hồng đẹp lạ mang cá tính riêng. Màu của sự may mắn, tương sinh với mệnh Thổ và Hỏa.\r\n\r\n', '/color:đỏ hồng,weight:0.37ct,size:6,5 - 3,5 - 2mm,opacity:Chiếu đẹp toàn viên, đầy đủ đáy,cutting_form:facet/', '2024-04-28 08:59:47', '2024-04-28 08:59:47', NULL, NULL, 'chua xoa'),
(63, 1, 'Viên Ruby facet Lục Yên màu cháo đồng 0,70ct – IRRB 235070\n', 10500000, 'còn hàng', 0, 0, 'Ruby facet Lục Yên  tự nhiên nguyên bản đẹp không tỳ vết, trọng lượng 0,70ct xinh xắn khi lên mặt nhẫn hay mặt dây chuyền đặc biệt dành riêng cho mệnh Hỏa và Thổ.\r\n\r\n', '/color:đỏ hồng,weight:0,70ct,size:5,5 - 5 - 2,8mm,opacity:Sạch 95% có bao thể đặc trưng,cutting_form:Giác cắt Facet đẹp tiêu chuẩn/', '2024-04-28 09:13:42', '2024-04-28 09:13:42', NULL, NULL, 'chua xoa'),
(64, 1, 'Đôi Ruby facet Lục Yên tự nhiên 1,10ct – IRRB 234110\n', 15000000, 'còn hàng', 500000, 0, 'Đôi Ruby Lục Yên màu đỏ tím được tuyển chọn kỹ lưỡng từ vùng đất Ngọc Lục Yên, giác cắt tiêu chuẩn khối hiện đại, khối tiêu làm nhẫn cưới hoặc làm mặt nhẫn đôi là siêu phẩm.\r\n\r\n', '/color:đỏ tím,weight:1,10ct,size:5mm - 4,6mm,opacity:có bao thể tự nhiên của đá,cutting_form:Giác cắt Facet đẹp tiêu chuẩn/', '2024-04-28 09:13:42', '2024-04-28 09:13:42', NULL, NULL, 'chua xoa'),
(65, 1, 'Viên Ruby đỏ huyết bồ câu facet 0,95ct – IRRF 2302095\n', 28500000, 'còn hàng', 0, 0, 'Viên Ruby đỏ huyết bồ câu, chất ngọc đẹp long lanh phát quang rực rỡ. Khối đẹp tiêu chuẩn, lên mặt dây nhẫn cho nữ chủ nhân mệnh Hỏa, mệnh Thổ xuất sắc.\r\n\r\n', '/color:đỏ huyết,weight:0.95ct,size:6.1 * 5 * 3.1mm,opacity:Sạch tinh bằng mắt thường,cutting_form:Giác cắt Facet đẹp tiêu chuẩn, góc đẹp long lanh/', '2024-04-28 09:49:54', '2024-04-28 09:49:54', NULL, NULL, 'chua xoa'),
(66, 1, 'Viên Ruby Sao Yên Bái siêu nét 18,45ct – IRRS 22111845\n', 184500000, 'còn hàng', 0, 0, 'Ruby Sao Yên Bái nét tiêu chuẩn, tuyển chọn kỹ lưỡng về chất lượng và giá trị kinh tế. Có độ trong mọng mịn rất đẹp xứng đáng để anh chị sưu tầm và chơi lâu dài.\r\n\r\n', '/color:đỏ hồng,weight:18,45ct,size:19,1 * 11,8 * 6,9mm,opacity:Có độ trong mọng mịn rất đẹp.,cutting_form:Oval cabachon', '2024-04-28 09:49:54', '2024-04-28 09:49:54', NULL, NULL, 'chua xoa'),
(67, 1, 'Đôi đá Ruby huyết kính 3,25ct – IRRB 2209325\r\n', 19500000, 'còn hàng', 0, 0, 'Hoa tai đá Ruby huyết kính hàng tuyển chọn, đẹp sang trọng cho quý cô yêu thích màu đỏ may mắn, tài lộc và sự bí ẩn.\r\n\r\n', '/color:đỏ huyết,weight:3,25ct cả đôi.size:viên bên trái7,1 * 5,4 * 3,7mm /  Viên bên phải: 7,6 * 5,6 * 3.9mm,opacity:Chất kính trong,cutting_form:Mài trơn cabachon/', '2024-04-28 09:52:14', '2024-04-28 09:52:14', NULL, NULL, 'chua xoa'),
(68, 1, 'Viên Ruby đỏ huyết kính Lục Yên 7,45ct hàng tuyển – IRRB 2207745\n', 60000000, 'còn hàng', 0, 0, 'Viên đá Ruby huyết kính Lục Yên hàng tuyển chọn hiếm có, đỏ rực chất kính trong. Xuất xứ Lục Yên, tự nhiên 100% màu đỏ huyết chất kính, có rạn kín và bao thể tự nhiên bên trong đá.\r\n\r\n', '/color:đỏ huyết,weight:7.45 ct,size:12.7 - 10.3 - 6.5 mm,opacity:Bán trong – trong kính bền vững,cutting_form:Mài trơn cabachon/', '2024-04-28 09:52:14', '2024-04-28 09:52:14', NULL, NULL, 'chua xoa'),
(69, 1, 'Viên Ruby facet Lục Yên 1,79ct – IRRF 2206179\r\n', 62650000, 'còn hàng', 0, 0, 'Viên Ruby facet Lục Yên là viên đá rất đẹp, khai thác tự nhiên thiên nhiên 100% trên mỏ đá của Lục Yên - Yên Bái\r\n\r\n', '/color:đỏ hồng,weight:1.79ct,size:8.7-6.4-4.4ct,opacity:Sạch tinh bằng mắt thường,cutting_form:facet/', '2024-04-28 09:59:53', '2024-04-28 09:59:53', NULL, NULL, 'chua xoa'),
(70, 1, 'Viên Ruby đỏ hồng Lục Yên 2,2ct chiếu đẹp – IRRF 2206220\r\n', 70000000, 'còn hàng', 0, 0, 'Viên Ruby đỏ hồng lửa chiếu toàn viên, chất đá đanh rực sáng trọng lượng: 2,2ct, kích thước: 8.7 - 6.4 - 4.4 mm xuất xứ đá núi Lục Yên.\r\n\r\n', '/color:đỏ hồng,weight:2.2 ct,size:8.7 - 6.4 - 4.4 mm,opacity:Trong suốt, có lỗi tự nhiên kín dưới đáy khó thấy, lửa chiếu bung toàn viên từng giác cắt.,cutting_form:facet/', '2024-04-28 09:59:53', '2024-04-28 09:59:53', NULL, NULL, 'chua xoa'),
(71, 6, 'Đá Aquamarine xanh biển Thanh Hoá 2,87ct – IRAQ20 2404287\r\n', 172300000, 'còn hàng', 0, 0, 'Đá Aquamarine màu xanh biển tự nhiên, xuất xứ: Thanh Hoá, giác cắt quốc tế pear - facet, chiếu toàn viên long lanh, độ lành sạch chất lành không rạn vỡ, tinh khiết cao. Trọng lượng 2,87ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:xanh biển,weight:2,87ct,size:13 x 7,8 - 5,3mm,opacity:Chiếu long lanh toàn viên,Đủ đáy,cutting_form:Pear - facet/', '2024-04-28 11:10:14', '2024-04-28 11:10:14', NULL, NULL, 'chua xoa'),
(72, 6, 'Đá Aquamarine xanh biển tự nhiên 100% 2,94ct – IRAQ19 2404294\r\n', 14700000, 'còn hàng', 0, 0, 'Đá Aquamarine màu xanh biển tự nhiên, giác cắt quốc tế cushion - facet, chiếu toàn viên long lanh, độ lành sạch, tinh khiết cao. Trọng lượng 2,94ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:xanh biển,weight:2,94ct,size:9,7 x 7,9 - 6,3mm,opacity:Đủ đáy,Chiếu long lanh toàn viên,cutting_form:Cushion - facet/', '2024-04-28 11:10:14', '2024-04-28 11:10:14', NULL, NULL, 'chua xoa'),
(73, 6, 'Đá Aquamarine xanh biển tự nhiên 5,00ct – IRAQ18 2403500\r\n', 25000000, 'còn hàng', 0, 0, 'Đá Aquamarine màu xanh biển tự nhiên, giác cắt quốc tế emerald - facet, chiếu rực rỡ toàn viên, độ lành sạch, tinh khiết cao. Trọng lượng 5,00ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:xanh biển,weight:5,00ct,size:12,1 x 9 - 6mm,opacity:Lửa chiếu rực rỡ toàn viên,cutting_form:Emerald - facet/', '2024-04-28 11:11:50', '2024-04-28 11:11:50', NULL, NULL, 'chua xoa'),
(74, 6, 'Đá Aquamarine xanh biển tự nhiên 3,50ct – IRAQ17 2403350\r\n', 18000000, 'còn hàng', 0, 0, 'Đá Aquamarine màu xanh biển tự nhiên, giác cắt quốc tế radiant - facet, chiếu toàn viên long lanh, độ lành sạch 99%, tinh khiết cao. Trọng lượng 3,50ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:xanh biển,weight:3,50ct,size:8,9 x 8,5 - 7mm.opacity:Chiếu long lanh toàn viên,cutting_form:Radiant - facet/', '2024-04-28 11:11:50', '2024-04-28 11:11:50', NULL, NULL, 'chua xoa'),
(75, 6, 'Đá Aquamarine xanh biển tự nhiên 5,29ct – IRAQ16 2403529\r\n', 26500000, 'còn hàng', 0, 0, 'Đá Aquamarine màu xanh biển tự nhiên 100%, giác cắt quốc tế asscher - facet, chiếu toàn viên long lanh. Trọng lượng 5,29ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:xanh biển,weight:5,29ct,color:11,7 x 8,9 - 7,1mm,opacity:Độ lành sạch 99%,cutting_form:Asscher - facet/', '2024-04-28 11:13:51', '2024-04-28 11:13:51', NULL, NULL, 'chua xoa'),
(76, 6, 'Đá Aquamarine xanh biển tự nhiên 100% 6,58ct – IRAQ15 2402658\r\n', 32900000, 'còn hàng', 0, 0, 'Đá Aquamarine màu xanh biển tự nhiên 100%, giác cắt quốc tế Cushion - facet, lửa chiếu toàn viên long lanh. Trọng lượng 6,58ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:xanh biển,weight:6,58ct,size:12,1 x 11,2 - 8,2mm,opacity:Chiếu long lanh toàn viên,cutting_form:Hình khối cushion - facet', '2024-04-28 11:13:51', '2024-04-28 11:13:51', NULL, NULL, 'chua xoa'),
(77, 6, 'Đá Aquamarine xanh biển tự nhiên 100% 4,17ct – IRAQ14 2402417\r\n', 25000000, 'còn hàng', 0, 0, 'Đá Aquamarine màu xanh biển tự nhiên 100%, đủ đáy, giác cắt quốc tế Cushion - facet, lửa chiếu toàn viên long lanh. Trọng lượng 4,17ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:xanh biển,weight:4,17ct,size:9,4 x 9,2 - 7,3mm,opacity:Chiếu long lanh toàn viên,cutting_form:Hình khối cushion - facet/', '2024-04-28 11:18:14', '2024-04-28 11:18:14', NULL, NULL, 'chua xoa'),
(78, 6, 'Đá Aquamarine xanh biển tự nhiên 100% 7,73ct – IRAQ13 2402773\r\n', 31000000, 'còn hàng', 0, 0, 'Đá Aquamarine màu xanh biển tự nhiên 100%, đủ đáy, giác cắt quốc tế Princess - facet, hình khối cushion, lửa chiếu toàn viên sáng rực. Trọng lượng 7,73ct. Phù hợp lên mặt dây chuyền và nhẫn.\r\n\r\n', '/color:xanh dương,weight:7,73ct,size:13,5 x 10,4 - 8,2mm,opacity:Lửa chiếu rực rỡ toàn viên,cutting_form:Hình khối Princess - facet,Cushion', '2024-04-28 11:18:14', '2024-04-28 11:18:14', NULL, NULL, 'chua xoa'),
(79, 6, 'Đá Aquamarine xanh biển có gam màu đẹp nhất 4,30ct – IRAQ08 2401430\r\n', 19350000, 'còn hàng', 0, 0, 'Đá Aquamarine màu xanh biển, đủ đáy, giác cắt quốc tế, độ chiếu toàn viên long lanh. Trọng lượng 4,30ct, hình khối cushion - facet. \r\n\r\n', '/color:xanh dương,weight:4,30ct,size:11,1 x 9,9 - 5,7mm,opacity:Chiếu đẹp mọi góc cạnh, đủ đáy,cutting_form:Hình khối cushion - facet/', '2024-04-28 11:20:12', '2024-04-28 11:20:12', NULL, NULL, 'chua xoa'),
(80, 6, 'Đá Aquamarine xanh biển tự nhiên 100% 4,50ct – IRAQ07 2401450\r\n', 20300000, 'còn hàng', 0, 0, 'Đá Aquamarine màu xanh biển, đủ đáy, giác cắt quốc tế, trọng lượng 4,50ct, hình khối cushion - facet.\r\n\r\n', '/color:xanh lam,weight:4,50ct,size:11,3 x 8,9 - 6,4mm,opacity:Bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối cushion - facet/', '2024-04-28 11:20:12', '2024-04-28 11:20:12', NULL, NULL, 'chua xoa'),
(81, 6, 'Viên Aquamarine xanh dương tự nhiên 4,51ct – IRAQ6 2312451\r\n', 36100000, 'còn hàng', 0, 0, 'Đá Aquamarine có màu sắc xanh dương trong tự nhiên. Giác cắt sáng đẹp, dáng giọt nước, phù hợp lên mặt dây chuyền hoặc mẫu nhẫn thiết kế rất đẹp.\r\n\r\n', '/color:xanh dương,weight:4,51ct,size:10,2 x 9 - 7,9mm,opacity: Chiếu bung toàn viên, đầy đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối cushion - facet/', '2024-04-28 11:22:19', '2024-04-28 11:22:19', NULL, NULL, 'chua xoa'),
(82, 6, 'Viên Aquamarine màu xanh dương 9,56ct – IRAQ5 2312956\r\n', 40000000, 'còn hàng', 0, 0, 'Đá Aquamarine có màu sắc xanh dương trong tự nhiên. Chúng thường nằm sâu trong lòng đất và tích tụ rất nhiều năng lượng của vũ trụ. Giác cắt sáng đẹp, dáng giọt nước, phù hợp lên mặt dây chuyền.\r\n\r\n', '/color:xanh lam,weight:9,56ct,size:16,6 x 12 - 8,6mm,opacity:Chiếu đẹp toàn viên, đầy đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối giọt nước/', '2024-04-28 11:22:19', '2024-04-28 11:22:19', NULL, NULL, 'chua xoa'),
(83, 6, 'Tinh thể Aquamarine màu xanh lam 6,63g – IRAQ 236663\r\n', 20000000, 'còn hàng', 0, 0, 'Tinh thể aquamarine là khoáng vật nằm trong nhóm Beryl có màu sắc xanh lam. Trong đó, loại màu xanh lam,được hình thành trong tự nhiên qua quá trình chuyển hóa của các vật chất tự nhiên. Chúng thường nằm sâu trong lòng đất và tích tụ rất nhiều năng lượng của vũ trụ.\r\n\r\n', '/color:xanh lam,weight:6,63g,size:4,4 - 1,1cm,opacity:sạch trong,cutting_form:chưa xác định/', '2024-04-28 11:24:34', '2024-04-28 11:24:34', NULL, NULL, 'chua xoa'),
(84, 6, 'Viên Aquamarine xanh dương 3,04 ct – IRAQ 233304\r\n', 10000000, 'còn hàng', 0, 0, 'Đá Aquamarine xanh dương, màu xanh nhẹ nhàng tinh tế, hiện đại. Chất ngọc lành sạch tinh có thể nhìn bằng mắt thường. Đá Aquamarine phù hợp mệnh Mộc và mệnh Thủy.\r\n\r\n', '/color:xanh nước biển,weight:3.04ct,size:8.4 * 7.2 * 6.2mm,opacity:Phát quang mạnh và hút sáng,cutting_form:Cắt khối Emerald tiêu chuẩn./', '2024-04-28 11:24:34', '2024-04-28 11:24:34', NULL, NULL, 'chua xoa'),
(85, 6, 'Viên Aquamarine xanh tự nhiên đẹp tinh tế – IRAQ 221163\r\n', 28350000, 'còn hàng', 0, 0, 'Đá Aquamarine xanh đẹp tự nhiên màu xanh của Aquamarine, viên đá của thần biển bảo hộ và đem đến may mắn cho chủ sở hữu. Đẹp dịu dàng tinh tế sang trọng là những danh từ dành riêng cho viên đá này!\r\n\r\n', '/color:xanh lam,weight:6,3ct,size:12 * 9 * 7,2mm,opacity:Sạch tinh bằng mắt thường,cutting_form:Baguette vuông chữ nhật/', '2024-04-28 11:31:24', '2024-04-28 11:31:24', NULL, NULL, 'chua xoa'),
(86, 6, 'Viên Aquamarine xanh nước biển 9,95ct – IRAQ 2206995\r\n', 10750000, 'còn hàng', 0, 0, 'Viên đá Aquamarine xanh nước biển có màu xanh Lam nhạt tuyệt đẹp, trọng lượng 9,95ct, kích thước 22 x 8.6 x 6.2 mm tỷ lệ cân đối làm trang sức nhẫn, mặt dây.\r\n\r\n', '/color:xanh nước biển,weight:9.95ct,size:22 x 8.6 x 6.2 mm,opacity:trong suốt,cutting_form:giác cắt/', '2024-04-28 11:31:24', '2024-04-28 11:31:24', NULL, NULL, 'chua xoa'),
(87, 5, 'Đá Tourmaline xanh lục siêu rực 3,33ct – IRTM32 2401333\r\n', 16650000, 'còn hàng', 0, 0, 'Đá Tourmaline tác động tới luân xa số 4 - Anahata, giúp chữa lành cho tim, nâng cao hệ miễn dịch, khơi mở tình yêu thương của con người. Biểu tượng cho năng lượng sống, phát triển và thịnh vượng.\r\n\r\n', '/color:xanh lục,weight:3,33ct,size:8,9 x 8,1 - 5,2mm,opacity:Chiếu bung toàn viên, đầy đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối cushion - facet/', '2024-04-28 11:33:52', '2024-04-28 11:33:52', NULL, NULL, 'chua xoa'),
(88, 5, 'Đá Tourmaline xanh lục siêu rực 3,34ct – IRTM31 2401334\n', 17000000, 'còn hàng', 0, 0, 'Đá Tourmaline có khả năng tạo ra những ion âm, có tác dụng trung hòa ion dương, làm sạch bầu không khí, giúp bầu không khí trở nên trong lành và an toàn hơn.\r\n\r\n', '/color:xanh lục,weight:3,34ct,size:8,9 x 8,2 - 5,1mm,opacity:Chiếu đẹp toàn viên, đầy đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Hình khối cushion - facet/', '2024-04-28 11:33:52', '2024-04-28 11:33:52', NULL, NULL, 'chua xoa'),
(89, 5, 'Viên Tourmaline tự nhiên 100% 3,52ct – IRTM29 2310352\r\n', 31700000, 'còn hàng', 0, 0, 'Tourmaline xanh lục giúp bạn khai mở trái tim tràn đầy yêu thương, và đón nhận sự cân bằng của cơ thể, giúp loại bỏ đi các chất độc trong cơ thể, giúp giảm stress, đem lại giấc ngủ ngon và sâu, tạo cảm giác bình an hơn. Đặc biệt, Tourmaline có thể được dùng để chữa các bệnh về tim, hệ miễn dịch.\r\n\r\n', '/color:xanh lục,weight:3,52ct,size:10,8 x 9,1 - 5,3mm,opacity:Chiếu đẹp toàn viên, đầy đủ đáy, bề mặt sáng bóng giác cắt đẹp,cutting_form:Giác cắt Facet tiêu chuẩn đủ đáy/', '2024-04-28 11:36:13', '2024-04-28 11:36:13', NULL, NULL, 'chua xoa'),
(90, 5, 'Viên Tourmaline màu xanh lục sáng 3,55ct – IRTM 235355\n', 22000000, 'còn hàng', 0, 0, 'Viên Tourmaline xanh lục sáng tươi, màu xanh đẹp cuốn hút đầy say mê không thể rời mắt. Xanh của sự sinh nổi nảy nở là biểu tượng của sự khởi đầu thành công!\r\n\r\n', '/color:xanh lục,weight:3,55ct,size8,5 - 8,3 - 7,2mm,opacity:Sạch tinh bằng mắt thường,cutting_form:Giác cắt Facet tiêu chuẩn đủ đáy/', '2024-04-28 11:36:13', '2024-04-28 11:36:13', NULL, NULL, 'chua xoa'),
(91, 8, 'Đá Garnet Lục Yên tự nhiên 100% 5,30ct – IRGN113 2401530\r\n', 21200000, 'còn hàng', 0, 0, 'Đá Garnet tự nhiên 100%, gam màu đẹp nhất, có trọng lượng: 5,30ct, hình khối cushion - facet, độ chiếu tốt, đủ đáy. Phù hợp lên mẫu nhẫn hoặc mặt dây thiết kế.\r\n\r\n', '/color:đỏ;weight:5,30ct;size:9,3 x 9,2 - 7mm;opacity:Chiếu đẹp toàn viên, đầy đủ đáy;cutting_form:Hình khối cushion - facet/', '2024-04-28 13:18:50', '2024-04-28 13:18:50', NULL, NULL, 'chua xoa'),
(92, 8, 'Đá Garnet Lục Yên tự nhiên 100% 1,75ct – IRGN112 2401175\r\n', 7000000, 'hết hàng', 0, 0, 'Đá Garnet tự nhiên 100% xuất xứ từ mỏ mới của Lục Yên màu rất đẹp đỏ sáng khác hoàn toàn với đá Garnet trước đây, có trọng lượng: 1,75ct, hình khối oval - facet, đủ đáy, lành sạch cao, lửa chiếu rực rỡ. Phù hợp lên mẫu nhẫn hoặc mặt dây thiết kế.\r\n\r\n', '/color:đỏ;weight:1,75ct;size:7,3 x 6,6 - 4,4mm;opacity:Lửa chiếu rực rỡ toàn viên\r\n;cutting_form:Hình khối oval - facet/\r\n', '2024-04-28 13:18:50', '2024-04-28 13:18:50', NULL, NULL, 'chua xoa'),
(93, 8, 'Đá Garnet Lục Yên tự nhiên 100% 2,37ct – IRGN111 2401273\r\n', 11000000, 'hết hàng', 0, 0, 'Đá Garnet tự nhiên 100% xuất xứ từ mỏ mới của Lục Yên màu rất đẹp đỏ sáng khác hoàn toàn với đá Garnet trước đây, có trọng lượng: 2,73ct, hình khối cushion - facet, đủ đáy, lành sạch cao, chiếu rực rỡ. Phù hợp lên mẫu nhẫn hoặc mặt dây thiết kế.\r\n\r\n', '/color:đỏ;weight:2,37ct;size:7,8 x 7,5 - 4,6mm;opacity:Chiếu đẹp toàn viên, mọi giác cắt sáng rực;cutting_form:Hình khối cushion - facet/', '2024-04-28 13:24:54', '2024-04-28 13:24:54', NULL, NULL, 'chua xoa'),
(94, 8, 'Đá Garnet màu đỏ hồng tự nhiên 100% Lục Yên 2,19ct – IRGN108 2401219\r\n', 9000000, 'hết hàng', 0, 0, 'Đá Garnet tự nhiên 100% xuất xứ từ mỏ mới của Lục Yên màu rất đẹp đỏ sáng khác hoàn toàn với đá Garnet trước đây, có trọng lượng: 2,19ct, hình khối cushion - facet, đủ đáy, tinh khiết và lành sạch cao. Phù hợp lên mẫu nhẫn hoặc mặt dây thiết kế.\r\n\r\n', '/color:đỏ;weight:2,19ct;size:7,6 x 7 - 4,9mm;opacity:Chiếu đẹp mọi góc cạnh, đủ đáy;cutting_form:Hình khối cushion - facet/', '2024-04-28 13:24:54', '2024-04-28 13:24:54', NULL, NULL, 'chua xoa'),
(95, 8, 'Viên Garnet màu xanh táo hiếm gặp 4,15ct – IRGN 235415\r\n', 56000000, 'hết hàng', 0, 0, 'Những màu sắc mà thiên nhiên mang lại, đá garnet màu xanh táo hiếm gặp được mọi người đặt trọn niềm yêu thích đặc biệt. Đá garnet màu xanh táo được biết đến mang may nắm và giàu có cho chủ sở hữu.\r\n\r\n', '/color:xanh lá;weight:4,15ct\r\n;size:8,7 - 8,7 - 6,7mm;opacity:độ lành sạch cao\r\n;cutting_form:Giác cắt Facet đẹp tiêu chuẩn/\r\n', '2024-04-28 13:33:43', '2024-04-28 13:33:43', NULL, NULL, 'chua xoa'),
(96, 8, 'Viên Tsavorite xanh lục bảo hiếm có 3,2ct – IRTS 221132\r\n', 32000000, 'còn hàng', 0, 0, 'Đá Tsavorite (Garnet xanh) màu xanh lục bảo hiếm gặp. Xanh lục  thuộc Top đầu dòng đá Tsovarite, đẹp như Ngọc lục bảo màu đẹp nhất.\r\n\r\n', '/color:xanh lá;weight:3,2ct\r\n;size:8.2 * 7.4 * 6mm\r\n;opacity:Sạch 95% có bao thể đặc trưng\r\n;cutting_form:Giác cắt Facet đẹp tiêu chuẩn/', '2024-04-28 13:33:43', '2024-04-28 13:33:43', NULL, NULL, 'chua xoa'),
(97, 8, 'Viên Garnet trái tim màu hồng tím 3,00ct – IRGN82 233300\r\n', 6600000, 'còn hàng', 0, 0, 'Đá Garnet mang lại may mắn, cân bằng năng lượng, sức khỏe dồi dào. Viên đá này còn mang ý nghĩa như một lá bùa hộ mệnh. So với các loại đá phong thủy khác, đá Garnet có nhiều sắc và được nhiều  người chọn lựa.\r\n\r\n', '/color:đỏ;weight:3,00ct;size:8,2 - 8,8 -5,4mm;opacity:Chiếu đẹp toàn viên, đủ đáy;cutting_form:Hình khối Heart - Facet', '2024-04-28 14:15:24', '2024-04-28 14:15:24', NULL, NULL, 'chua xoa'),
(98, 8, 'Viên Garnet màu tím tự nhiên 0,99ct – IRGN 234099\r\n', 2000000, 'hết hàng', 0, 0, 'Đá Garnet đỏ đậm tự nhiên 100%  khối cao, cắt facet đẹp,  màu đẹp mê đắm. Dành riêng cho mệnh Hỏa và Thổ lên siêu phẩm xuất sắc khi thiết kế mặt nhẫn hay mặt dây chuyền.\r\n\r\n', '/color:đỏ tím;weight:0,99ct\r\n;size:6 - 4,6 - 3,4mm\r\n;opacity:Chiếu đẹp toàn viên\r\n;cutting_form:Giác cắt Facet tiêu chuẩn\r\n/', '2024-04-28 14:15:24', '2024-04-28 14:15:24', NULL, NULL, 'chua xoa'),
(99, 8, 'Viên Garnet màu đỏ tím 2,87ct – IRGN 233287\r\n', 5750000, 'hết hàng', 0, 0, 'Đá Garnet màu đỏ tím đẹp lạ cuốn hút, rất phù hợp lên nhẫn nữ, mặt dây, hoa tai. Vẻ đẹp cuốn hút lạ mắt của viên đá khẳng định gu thẩm mỹ của chủ sở hữu.\r\n\r\n', '/color:đỏ tím;weight:2,87ct\r\n;size:9,1 * 6,6 * 4,8mm\r\n;opacity:Sạch tinh bằng mắt thường;cutting_form:Giác cắt Facet đẹp tiêu chuẩn, góc đẹp long lanh\r\n/\r\n\r\n', '2024-04-28 14:21:43', '2024-04-28 14:21:43', NULL, NULL, 'chua xoa'),
(100, 8, 'Viên Rhodolite Garnet đẹp hiện đại 2,34ct – IRGN 233234\r\n', 6800000, 'hết hàng', 0, 0, 'Viên Rhodolite Granet dáng hiện đại được tuyển chọn kỹ lưỡng từ những viên đá thô tại mỏ. Rhodolite Garnet tượng trưng cho tình yêu, sự thủy chung rất phù hợp để lên nhẫn cưới, đính hôn hay tặng bạn gái…\r\n\r\n', '/color:đỏ tím;weight:2,76ct;size:9.0 * 5.7 * 4.2mm\r\n;opacity:Sạch tinh bằng mắt thường\r\n;cutting_form:Emerald tinh khiết/\r\n', '2024-04-28 14:21:43', '2024-04-28 14:21:43', NULL, NULL, 'da xoa');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `product_image`
--

CREATE TABLE `product_image` (
  `id` int(11) NOT NULL,
  `img_main` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_1` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_2` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_3` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `img_4` text CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `product_image`
--

INSERT INTO `product_image` (`id`, `img_main`, `img_1`, `img_2`, `img_3`, `img_4`) VALUES
(1, 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-cabochon-tu-nhien-100-185ct-IRRC206-240118500000.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-cabochon-tu-nhien-100-185ct-IRRC206-240118500001.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-cabochon-tu-nhien-100-185ct-IRRC206-240118500001.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-cabochon-tu-nhien-100-185ct-IRRC206-240118500003.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-cabochon-tu-nhien-100-185ct-IRRC206-240118500004.jpg'),
(2, 'https://iruby.vn/wp-content/uploads/2024/02/Vien-Ruby-cabochon-chat-kinh-trong-141ct-IRRC205-240114100000.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Vien-Ruby-cabochon-chat-kinh-trong-141ct-IRRC205-240114100001.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Vien-Ruby-cabochon-chat-kinh-trong-141ct-IRRC205-240114100002.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Vien-Ruby-cabochon-chat-kinh-trong-141ct-IRRC205-240114100003.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Vien-Ruby-cabochon-chat-kinh-trong-141ct-IRRC205-240114100004.jpg'),
(3, 'https://iruby.vn/wp-content/uploads/2024/01/Da-Ruby-cabochon-mau-do-tu-nhien-100-726ct-IRRC204-240172600000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Ruby-cabochon-mau-do-tu-nhien-100-726ct-IRRC204-240172600001.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Ruby-cabochon-mau-do-tu-nhien-100-726ct-IRRC204-240172600002.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Ruby-cabochon-mau-do-tu-nhien-100-726ct-IRRC204-240172600003.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Ruby-cabochon-mau-do-tu-nhien-100-726ct-IRRC204-240172600004.jpg'),
(4, 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-Luc-Yen-103ct-IRRC199-231210300000.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-Luc-Yen-103ct-IRRC199-231210300001.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-Luc-Yen-103ct-IRRC199-231210300002.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-Luc-Yen-103ct-IRRC199-231210300003.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-Luc-Yen-103ct-IRRC199-231210300004.jpg'),
(5, 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-658ct-IRAQ15-240265800000.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-658ct-IRAQ15-240265800001.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-658ct-IRAQ15-240265800002.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-658ct-IRAQ15-240265800003.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-658ct-IRAQ15-240265800004.jpg'),
(6, 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Topaz-trang-tinh-khiet-388ct-IRTP57-231138800000.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Topaz-trang-tinh-khiet-388ct-IRTP57-231138800003.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Topaz-trang-tinh-khiet-388ct-IRTP57-231138800002.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Topaz-trang-tinh-khiet-388ct-IRTP57-231138800001.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Topaz-trang-tinh-khiet-388ct-IRTP57-231138800004.jpg'),
(7, 'https://iruby.vn/wp-content/uploads/2023/07/Da-Topaz-mau-trang-tinh-khiet-tu-nhien-100-226ct-IRTP-23722600004.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Da-Topaz-mau-trang-tinh-khiet-tu-nhien-100-226ct-IRTP-23722600001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Da-Topaz-mau-trang-tinh-khiet-tu-nhien-100-226ct-IRTP-23722600000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Da-Topaz-mau-trang-tinh-khiet-tu-nhien-100-226ct-IRTP-23722600002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Da-Topaz-mau-trang-tinh-khiet-tu-nhien-100-226ct-IRTP-23722600003-150x150.jpg'),
(8, 'https://iruby.vn/wp-content/uploads/2023/07/Da-Topaz-mau-trang-tinh-khiet-tu-nhien-100-226ct-IRTP-23722600004.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Da-Topaz-mau-trang-tinh-khiet-tu-nhien-100-226ct-IRTP-23722600001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Da-Topaz-mau-trang-tinh-khiet-tu-nhien-100-226ct-IRTP-23722600000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Da-Topaz-mau-trang-tinh-khiet-tu-nhien-100-226ct-IRTP-23722600002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Da-Topaz-mau-trang-tinh-khiet-tu-nhien-100-226ct-IRTP-23722600003-150x150.jpg'),
(9, 'https://iruby.vn/wp-content/uploads/2024/04/Da-Sapphire-chao-dong-An-Phu-Luc-Yen-122ct-IRSP217-240412200000.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Sapphire-chao-dong-An-Phu-Luc-Yen-122ct-IRSP217-240412200001.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Sapphire-chao-dong-An-Phu-Luc-Yen-122ct-IRSP217-240412200002.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Sapphire-chao-dong-An-Phu-Luc-Yen-122ct-IRSP217-240412200003.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Sapphire-chao-dong-An-Phu-Luc-Yen-122ct-IRSP217-240412200004.jpg'),
(10, 'https://iruby.vn/wp-content/uploads/2024/03/Da-Sapphire-xanh-luc-Phan-Thiet-699ct-IRGS171-240369900000.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Sapphire-xanh-luc-Phan-Thiet-699ct-IRGS171-240369900001.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Sapphire-xanh-luc-Phan-Thiet-699ct-IRGS171-240369900002.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Sapphire-xanh-luc-Phan-Thiet-699ct-IRGS171-240369900003.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Sapphire-xanh-luc-Phan-Thiet-699ct-IRGS171-240369900004.jpg'),
(11, 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-vang-tu-nhien-100-chua-qua-nhiet-162ct-IRYS152-231216200000.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-vang-tu-nhien-100-chua-qua-nhiet-162ct-IRYS152-231216200002.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-vang-tu-nhien-100-chua-qua-nhiet-162ct-IRYS152-231216200001.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-vang-tu-nhien-100-chua-qua-nhiet-162ct-IRYS152-231216200003.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-vang-tu-nhien-100-chua-qua-nhiet-162ct-IRYS152-231216200004.jpg'),
(12, 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-do-tu-nhien-100-352ct-IRTM40-240135200000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-do-tu-nhien-100-352ct-IRTM40-240135200001.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-do-tu-nhien-100-352ct-IRTM40-240135200002.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-do-tu-nhien-100-352ct-IRTM40-240135200003.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-do-tu-nhien-100-352ct-IRTM40-240135200004.jpg'),
(13, 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-334ct-IRTM31-240133400000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-334ct-IRTM31-240133400001.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-334ct-IRTM31-240133400002.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-334ct-IRTM31-240133400003.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-334ct-IRTM31-240133400004.jpg'),
(14, 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-sao-trang-tu-nhien-100-423ct-IRSP151-231242300000.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-sao-trang-tu-nhien-100-423ct-IRSP151-231242300001.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-sao-trang-tu-nhien-100-423ct-IRSP151-231242300002.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-sao-trang-tu-nhien-100-423ct-IRSP151-231242300003.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-sao-trang-tu-nhien-100-423ct-IRSP151-231242300004.jpg'),
(15, 'https://iruby.vn/wp-content/uploads/2022/11/PhotoRoom_20221108_122653.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/mat-sau-sapphire-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/sapphire-sao-dep-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/sapphire-sao-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/sapphire-sao-lavender-150x150.jpg'),
(16, 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Sapphire-den-tuyen-445ct-IRSP138-231144500000.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Sapphire-den-tuyen-445ct-IRSP138-231144500001.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Sapphire-den-tuyen-445ct-IRSP138-231144500002.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Sapphire-den-tuyen-445ct-IRSP138-231144500003.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Sapphire-den-tuyen-445ct-IRSP138-231144500004.jpg'),
(17, 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Sapphire-den-tuyen-427ct-IRSP137-231142700000.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Sapphire-den-tuyen-427ct-IRSP137-231142700000.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Sapphire-den-tuyen-427ct-IRSP137-231142700002.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Sapphire-den-tuyen-427ct-IRSP137-231142700003.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Sapphire-den-tuyen-427ct-IRSP137-231142700004.jpg'),
(18, 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Sapphire-den-tuyen-khoi-Oval-tieu-chuan-478ct-IRSP-23747800004.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Sapphire-den-tuyen-khoi-Oval-tieu-chuan-478ct-IRSP-23747800002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Sapphire-den-tuyen-khoi-Oval-tieu-chuan-478ct-IRSP-23747800003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Sapphire-den-tuyen-khoi-Oval-tieu-chuan-478ct-IRSP-23747800000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Sapphire-den-tuyen-khoi-Oval-tieu-chuan-478ct-IRSP-23747800001-150x150.jpg'),
(19, 'https://iruby.vn/wp-content/uploads/2023/11/Doi-pink-Sapphire-facet-hong-Luc-Yen-105ct-IRSP141-231110500000.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Doi-pink-Sapphire-facet-hong-Luc-Yen-105ct-IRSP141-231110500001.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Doi-pink-Sapphire-facet-hong-Luc-Yen-105ct-IRSP141-231110500002.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Doi-pink-Sapphire-facet-hong-Luc-Yen-105ct-IRSP141-231110500003.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Doi-pink-Sapphire-facet-hong-Luc-Yen-105ct-IRSP141-231110500004.jpg'),
(20, 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Sapphire-mau-tim-087ct-IRSP-23608700004.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Sapphire-mau-tim-087ct-IRSP-23608700001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Sapphire-mau-tim-087ct-IRSP-23608700000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Sapphire-mau-tim-087ct-IRSP-23608700002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Sapphire-mau-tim-087ct-IRSP-23608700003-150x150.jpg'),
(21, 'https://iruby.vn/wp-content/uploads/2023/08/vien-Sapphire-mau-HOT-Pink-330ct-tu-nhien-100-IRPS142-23833000000.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/vien-Sapphire-mau-HOT-Pink-330ct-tu-nhien-100-IRPS142-23833000003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/vien-Sapphire-mau-HOT-Pink-330ct-tu-nhien-100-IRPS142-23833000001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/vien-Sapphire-mau-HOT-Pink-330ct-tu-nhien-100-IRPS142-23833000002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/vien-Sapphire-mau-HOT-Pink-330ct-tu-nhien-100-IRPS142-23833000002-150x150.jpg'),
(22, 'https://iruby.vn/wp-content/uploads/2022/08/da-Sapphire-hong-258ct-1.png', 'https://iruby.vn/wp-content/uploads/2022/08/da-Sapphire-hong-258ct-3-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/08/da-Sapphire-hong-258ct-2-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/08/da-Sapphire-hong-258ct-4-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/08/da-Sapphire-hong-258ct-1-150x150.jpg'),
(23, 'https://iruby.vn/wp-content/uploads/2022/08/sapphire-tim-hong-227-1.png', 'https://iruby.vn/wp-content/uploads/2022/08/sapphire-tim-hong-227-4-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/08/sapphire-tim-hong-227-2-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/08/sapphire-tim-hong-227-1-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/08/sapphire-tim-hong-227-5-150x150.jpg'),
(24, 'https://iruby.vn/wp-content/uploads/2023/11/Doi-Sapphire-hong-Luc-Yen-087ct-IRSP142-231108700000.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Doi-Sapphire-hong-Luc-Yen-087ct-IRSP142-231108700001.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Doi-Sapphire-hong-Luc-Yen-087ct-IRSP142-231108700002.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Doi-Sapphire-hong-Luc-Yen-087ct-IRSP142-231108700003.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Doi-Sapphire-hong-Luc-Yen-087ct-IRSP142-231108700004.jpg'),
(25, 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-facet-hong-phot-tim-128ct-IRSP149-231212800000.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-facet-hong-phot-tim-128ct-IRSP149-231212800001.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-facet-hong-phot-tim-128ct-IRSP149-231212800002.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-facet-hong-phot-tim-128ct-IRSP149-231212800003.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Sapphire-facet-hong-phot-tim-128ct-IRSP149-231212800004.jpg'),
(26, 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-giot-nuoc-tu-nhien-100-112ct-IRRF215-240411200000.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-giot-nuoc-tu-nhien-100-112ct-IRRF215-240411200001.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-giot-nuoc-tu-nhien-100-112ct-IRRF215-240411200003.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-giot-nuoc-tu-nhien-100-112ct-IRRF215-240411200003.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-giot-nuoc-tu-nhien-100-112ct-IRRF215-240411200004.jpg'),
(27, 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-huyet-bo-cau-nguyen-ban-Luc-Yen-150ct-IRRF216-240415000000.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-huyet-bo-cau-nguyen-ban-Luc-Yen-150ct-IRRF216-240415000001.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-huyet-bo-cau-nguyen-ban-Luc-Yen-150ct-IRRF216-240415000002.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-huyet-bo-cau-nguyen-ban-Luc-Yen-150ct-IRRF216-240415000003.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-huyet-bo-cau-nguyen-ban-Luc-Yen-150ct-IRRF216-240415000004.jpg'),
(28, 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-cabochon-Luc-Yen-176ct-IRRC214-240417600000.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-cabochon-Luc-Yen-176ct-IRRC214-240417600001.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-cabochon-Luc-Yen-176ct-IRRC214-240417600002.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-cabochon-Luc-Yen-176ct-IRRC214-240417600003.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Ruby-cabochon-Luc-Yen-176ct-IRRC214-240417600004.jpg'),
(29, 'https://iruby.vn/wp-content/uploads/2024/03/Da-Ruby-facet-do-hong-Luc-Yen-tu-nhien-100-152ct-IRRF211-240315200000.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Ruby-facet-do-hong-Luc-Yen-tu-nhien-100-152ct-IRRF211-240315200002.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Ruby-facet-do-hong-Luc-Yen-tu-nhien-100-152ct-IRRF211-240315200001.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Ruby-facet-do-hong-Luc-Yen-tu-nhien-100-152ct-IRRF211-240315200003.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Ruby-facet-do-hong-Luc-Yen-tu-nhien-100-152ct-IRRF211-240315200004.jpg'),
(30, 'https://iruby.vn/wp-content/uploads/2024/03/Da-Ruby-cabochon-Luc-Yen-965ct-IRRC208-240396500000.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Ruby-cabochon-Luc-Yen-965ct-IRRC208-240396500000.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Ruby-cabochon-Luc-Yen-965ct-IRRC208-240396500000.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Ruby-cabochon-Luc-Yen-965ct-IRRC208-240396500000.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Ruby-cabochon-Luc-Yen-965ct-IRRC208-240396500000.jpg'),
(31, 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-facet-Luc-Yen-300ct-IRRF207-240230000000-1.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-facet-Luc-Yen-300ct-IRRF207-240230000001-1.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-facet-Luc-Yen-300ct-IRRF207-240230000003-1.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-facet-Luc-Yen-300ct-IRRF207-240230000003-1.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-facet-Luc-Yen-300ct-IRRF207-240230000004-2.jpg'),
(32, 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-cabochon-tu-nhien-100-185ct-IRRC206-240118500000.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-cabochon-tu-nhien-100-185ct-IRRC206-240118500001.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-cabochon-tu-nhien-100-185ct-IRRC206-240118500002.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-cabochon-tu-nhien-100-185ct-IRRC206-240118500003.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Ruby-cabochon-tu-nhien-100-185ct-IRRC206-240118500004.jpg'),
(33, 'https://iruby.vn/wp-content/uploads/2024/01/Vien-Ruby-facet-do-hong-anh-chao-dong-122ct-IRRF203-240112200000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Vien-Ruby-facet-do-hong-anh-chao-dong-122ct-IRRF203-240112200001.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Vien-Ruby-facet-do-hong-anh-chao-dong-122ct-IRRF203-240112200002.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Vien-Ruby-facet-do-hong-anh-chao-dong-122ct-IRRF203-240112200003.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Vien-Ruby-facet-do-hong-anh-chao-dong-122ct-IRRF203-240112200004.jpg'),
(34, 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-113ct-IRRC196-231211300000.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-113ct-IRRC196-231211300001.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-113ct-IRRC196-231211300002.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-113ct-IRRC196-231211300003.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-113ct-IRRC196-231211300005.jpg'),
(35, 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-Luc-Yen-097ct-IRRC195-231209700000-1.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-Luc-Yen-097ct-IRRC195-231209700000-1.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-Luc-Yen-097ct-IRRC195-231209700000-1.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-Luc-Yen-097ct-IRRC195-231209700000-1.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-Luc-Yen-097ct-IRRC195-231209700000-1.jpg'),
(36, 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-sao-tu-nhien-100-098ct-IRSR184-231209800000.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-sao-tu-nhien-100-098ct-IRSR184-231209800003.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-sao-tu-nhien-100-098ct-IRSR184-231209800001.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-sao-tu-nhien-100-098ct-IRSR184-231209800002.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-sao-tu-nhien-100-098ct-IRSR184-231209800004.jpg'),
(37, 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-facet-do-hong-Luc-Yen-220ct-IRRF182-231222000000.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-facet-do-hong-Luc-Yen-220ct-Luxury-IRRF182-231222000000.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-facet-do-hong-Luc-Yen-220ct-Luxury-IRRF182-231222000001.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-facet-do-hong-Luc-Yen-220ct-Luxury-IRRF182-231222000002.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-facet-do-hong-Luc-Yen-220ct-Luxury-IRRF182-231222000003.jpg'),
(38, 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-facet-do-hong-co-sac-chao-dong-dep-175ct-IRRF177-231217500000.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-facet-do-hong-co-sac-chao-dong-dep-175ct-IRRF177-231217500001.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-facet-do-hong-co-sac-chao-dong-dep-175ct-IRRF177-231217500002.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-facet-do-hong-co-sac-chao-dong-dep-175ct-IRRF177-231217500003.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-facet-do-hong-co-sac-chao-dong-dep-175ct-IRRF177-231217500004.jpg'),
(39, 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-728ct-IRRC173-231272800000.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-728ct-IRRC173-231272800001.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-728ct-IRRC173-231272800003.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-728ct-IRRC173-231272800003.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Ruby-cabochon-huyet-kinh-728ct-IRRC173-231272800004.jpg'),
(40, 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-sao-Nghe-An-343ct-tu-nhien-IRSR140-23834300004.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-sao-Nghe-An-343ct-tu-nhien-IRSR140-23834300001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-sao-Nghe-An-343ct-tu-nhien-IRSR140-23834300000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-sao-Nghe-An-343ct-tu-nhien-IRSR140-23834300002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-sao-Nghe-An-343ct-tu-nhien-IRSR140-23834300003-150x150.jpg'),
(41, 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-facet-165ct-Luc-Yen-IRRF138-23816500004.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-facet-165ct-Luc-Yen-IRRF138-23816500003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-facet-165ct-Luc-Yen-IRRF138-23816500002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-facet-165ct-Luc-Yen-IRRF138-23816500001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-facet-165ct-Luc-Yen-IRRF138-23816500000-150x150.jpg'),
(42, 'https://iruby.vn/wp-content/uploads/2023/11/Doi-Ruby-facet-do-hong-Luc-Yen-150ct-IRRF163-231115000000.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Doi-Ruby-facet-do-hong-Luc-Yen-150ct-IRRF163-231115000001.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Doi-Ruby-facet-do-hong-Luc-Yen-150ct-IRRF163-231115000002.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Doi-Ruby-facet-do-hong-Luc-Yen-150ct-IRRF163-231115000003.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Doi-Ruby-facet-do-hong-Luc-Yen-150ct-IRRF163-231115000004.jpg'),
(43, 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Ruby-cabochon-Luc-Yen-135ct-IRRC161-231113500000.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Ruby-cabochon-Luc-Yen-135ct-IRRC161-231113500001.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Ruby-cabochon-Luc-Yen-135ct-IRRC161-231113500002.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Ruby-cabochon-Luc-Yen-135ct-IRRC161-231113500003.jpg', 'https://iruby.vn/wp-content/uploads/2023/11/Vien-Ruby-cabochon-Luc-Yen-135ct-IRRC161-231113500004.jpg'),
(44, 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-hong-Luc-Yen-058ct-IRRF153-231005800000.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-hong-Luc-Yen-058ct-IRRF153-231005800001.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-hong-Luc-Yen-058ct-IRRF153-231005800002.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-hong-Luc-Yen-058ct-IRRF153-231005800003.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-hong-Luc-Yen-058ct-IRRF153-231005800004.jpg'),
(45, 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-do-hong-Luc-Yen-076ct-IRRF154-231007600000.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-do-hong-Luc-Yen-076ct-IRRF154-231007600001.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-do-hong-Luc-Yen-076ct-IRRF154-231007600002.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-do-hong-Luc-Yen-076ct-IRRF154-231007600003.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-do-hong-Luc-Yen-076ct-IRRF154-231007600004.jpg'),
(46, 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-tu-nhien-062ct-IRRF147-23906200004.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-tu-nhien-062ct-IRRF147-23906200002.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-tu-nhien-062ct-IRRF147-23906200003.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-tu-nhien-062ct-IRRF147-23906200000.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Ruby-facet-tu-nhien-062ct-IRRF147-23906200001.jpg'),
(47, 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-facet-165ct-Luc-Yen-IRRF138-23816500004.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-facet-165ct-Luc-Yen-IRRF138-23816500003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-facet-165ct-Luc-Yen-IRRF138-23816500002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-facet-165ct-Luc-Yen-IRRF138-23816500001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Ruby-facet-165ct-Luc-Yen-IRRF138-23816500000-150x150.jpg'),
(48, 'https://iruby.vn/wp-content/uploads/2023/08/linh-xinh-gai-00004.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/linh-xinh-gai-00001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/linh-xinh-gai-00000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/linh-xinh-gai-00002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/linh-xinh-gai-00003-150x150.jpg'),
(49, 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-mau-do-hong-Luc-Yen-567ct-IRRB-23556700004.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-mau-do-hong-Luc-Yen-567ct-IRRB-23556700001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-mau-do-hong-Luc-Yen-567ct-IRRB-23556700000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-mau-do-hong-Luc-Yen-567ct-IRRB-23556700002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-mau-do-hong-Luc-Yen-567ct-IRRB-23556700003-150x150.jpg'),
(50, 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-sao-Yen-Bai-khoi-cao-sao-net-248ct-IRRB-23724800004.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-sao-Yen-Bai-khoi-cao-sao-net-248ct-IRRB-23724800001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-sao-Yen-Bai-khoi-cao-sao-net-248ct-IRRB-23724800000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-sao-Yen-Bai-khoi-cao-sao-net-248ct-IRRB-23724800000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-sao-Yen-Bai-khoi-cao-sao-net-248ct-IRRB-23724800002-150x150.jpg'),
(51, 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-facet-Luc-Yen-hang-tu-nhien-079ct-IRRB-23707900004.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-facet-Luc-Yen-hang-tu-nhien-079ct-IRRB-23707900001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-facet-Luc-Yen-hang-tu-nhien-079ct-IRRB-23707900000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-facet-Luc-Yen-hang-tu-nhien-079ct-IRRB-23707900002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-facet-Luc-Yen-hang-tu-nhien-079ct-IRRB-23707900003-150x150.jpg'),
(52, 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-sao-dep-xuat-sac-218ct-IRRB-23621800005.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-sao-dep-xuat-sac-218ct-IRRB-23621800003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-sao-dep-xuat-sac-218ct-IRRB-23621800002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-sao-dep-xuat-sac-218ct-IRRB-23621800004-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-sao-dep-xuat-sac-218ct-IRRB-23621800001-150x150.jpg'),
(53, 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-mau-do-huyet-450ct-IRRB-23645000004.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-mau-do-huyet-450ct-IRRB-23645000002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-mau-do-huyet-450ct-IRRB-23645000001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-mau-do-huyet-450ct-IRRB-23645000003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-mau-do-huyet-450ct-IRRB-23645000000-150x150.jpg'),
(54, 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Ruby-Cbachon-mau-do-huyet-291ct-IRRB-23629100004.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Ruby-Cbachon-mau-do-huyet-291ct-IRRB-23629100001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Ruby-Cbachon-mau-do-huyet-291ct-IRRB-23629100000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Ruby-Cbachon-mau-do-huyet-291ct-IRRB-23629100002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Ruby-Cbachon-mau-do-huyet-291ct-IRRB-23629100003-150x150.jpg'),
(55, 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Ruby-facet-Luc-Yen-tu-nhien-056ct-IRRB-23505600004.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Ruby-facet-Luc-Yen-tu-nhien-056ct-IRRB-23505600001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Ruby-facet-Luc-Yen-tu-nhien-056ct-IRRB-23505600000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Ruby-facet-Luc-Yen-tu-nhien-056ct-IRRB-23505600002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Vien-Ruby-facet-Luc-Yen-tu-nhien-056ct-IRRB-23505600003-150x150.jpg'),
(56, 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-do-hong-tu-nhien-037ct-IRRB-235003700004.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-do-hong-tu-nhien-037ct-IRRB-235003700000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-do-hong-tu-nhien-037ct-IRRB-235003700002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-do-hong-tu-nhien-037ct-IRRB-235003700002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-do-hong-tu-nhien-037ct-IRRB-235003700003-150x150.jpg'),
(57, 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-Luc-Yen-do-hong-Luc-Yen-036ct-IRRB-23503600000.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-Luc-Yen-do-hong-Luc-Yen-036ct-IRRB-23503600004-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-Luc-Yen-do-hong-Luc-Yen-036ct-IRRB-23503600003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-Luc-Yen-do-hong-Luc-Yen-036ct-IRRB-23503600002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-Luc-Yen-do-hong-Luc-Yen-036ct-IRRB-23503600001-150x150.jpg'),
(58, 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-Luc-Yen-mau-do-huyet-090ct-IRRB-23509000004.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-Luc-Yen-mau-do-huyet-090ct-IRRB-23509000001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-Luc-Yen-mau-do-huyet-090ct-IRRB-23509000000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-Luc-Yen-mau-do-huyet-090ct-IRRB-23509000002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-Luc-Yen-mau-do-huyet-090ct-IRRB-23509000003-150x150.jpg'),
(59, 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-cabachon-mau-do-huyet-092ct-IRRB-23509200004.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-cabachon-mau-do-huyet-092ct-IRRB-23509200001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-cabachon-mau-do-huyet-092ct-IRRB-23509200000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-cabachon-mau-do-huyet-092ct-IRRB-23509200002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-cabachon-mau-do-huyet-092ct-IRRB-23509200002-150x150.jpg'),
(60, 'https://iruby.vn/wp-content/uploads/2023/05/Ruby-facet-tu-nhien-130ct-IRRB-23413000001.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Ruby-facet-tu-nhien-130ct-IRRB-23413000002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Ruby-facet-tu-nhien-130ct-IRRB-23413000009-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Ruby-facet-tu-nhien-130ct-IRRB-23413000005-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Ruby-facet-tu-nhien-130ct-IRRB-23413000004-150x150.jpg'),
(61, 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-Luc-Yen-tu-nhien-100-500ct-IRRB-23750000004.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-Luc-Yen-tu-nhien-100-500ct-IRRB-23750000001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-Luc-Yen-tu-nhien-100-500ct-IRRB-23750000000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-Luc-Yen-tu-nhien-100-500ct-IRRB-23750000003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/07/Vien-Ruby-cabochon-Luc-Yen-tu-nhien-100-500ct-IRRB-23750000002-150x150.jpg'),
(62, 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-do-hong-tu-nhien-037ct-IRRB-235003700004.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-do-hong-tu-nhien-037ct-IRRB-235003700000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-do-hong-tu-nhien-037ct-IRRB-235003700001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-do-hong-tu-nhien-037ct-IRRB-235003700002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-do-hong-tu-nhien-037ct-IRRB-235003700003-150x150.jpg'),
(63, 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-Luc-Yen-mau-chao-dong-070ct-IRRB-23507000001.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-Luc-Yen-mau-chao-dong-070ct-IRRB-23507000002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-Luc-Yen-mau-chao-dong-070ct-IRRB-23507000000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-Luc-Yen-mau-chao-dong-070ct-IRRB-23507000003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Ruby-facet-Luc-Yen-mau-chao-dong-070ct-IRRB-23507000004-150x150.jpg'),
(64, 'https://iruby.vn/wp-content/uploads/2023/05/Doi-ruby-facet-Luc-Yen-tu-nhien-110ct-IRRB-23411000001.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Doi-ruby-facet-Luc-Yen-tu-nhien-110ct-IRRB-23411000000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Doi-ruby-facet-Luc-Yen-tu-nhien-110ct-IRRB-23411000004-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Doi-ruby-facet-Luc-Yen-tu-nhien-110ct-IRRB-23411000002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Doi-ruby-facet-Luc-Yen-tu-nhien-110ct-IRRB-23411000003-150x150.jpg'),
(65, 'https://iruby.vn/wp-content/uploads/2023/02/PhotoRoom-20230225-111921-scaled.jpg', 'https://iruby.vn/wp-content/uploads/2023/02/Vien-Ruby-do-huyet-Bo-cau-facet-?-IRRF2302095-hinh-anh-1-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/02/Vien-Ruby-do-huyet-Bo-cau-facet-?-IRRF2302095-hinh-anh-5-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/02/Vien-Ruby-do-huyet-Bo-cau-facet-?-IRRF2302095-hinh-anh-2-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/02/Vien-Ruby-do-huyet-Bo-cau-facet-?-IRRF2302095-hinh-anh-3-150x150.jpg'),
(66, 'https://iruby.vn/wp-content/uploads/2022/11/Da-Ruby-Sao-Yen-Bai-sieu-net-1845ct-sieu-net-00005.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/Da-Ruby-Sao-Yen-Bai-sieu-net-1845ct-sieu-net-00004-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/Da-Ruby-Sao-Yen-Bai-sieu-net-1845ct-sieu-net-00003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/Da-Ruby-Sao-Yen-Bai-sieu-net-1845ct-sieu-net-00002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/Da-Ruby-Sao-Yen-Bai-sieu-net-1845ct-sieu-net-00000-150x150.jpg'),
(67, 'https://iruby.vn/wp-content/uploads/2022/09/doi-hoa-tai-ruby-1.png', 'https://iruby.vn/wp-content/uploads/2022/09/doi-hoa-tai-ruby-3-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/09/doi-hoa-tai-ruby-5-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/09/doi-hoa-tai-ruby-2-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/09/doi-hoa-tai-ruby-4-150x150.jpg'),
(68, 'https://iruby.vn/wp-content/uploads/2022/07/ruby-huyet-kinh-luc-yen.png', 'https://iruby.vn/wp-content/uploads/2022/07/ruby-tu-nhien-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/07/ruby-do-1-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/07/mua-da-ruby-o-dau-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/07/ruby-tu-nhien1-150x150.jpg'),
(69, 'https://iruby.vn/wp-content/uploads/2022/06/ruby-facet-lucyen.png', 'https://iruby.vn/wp-content/uploads/2022/06/IMG_4264-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/06/IMG_4267-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/06/IMG_4268-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/06/IMG_4268-150x150.jpg'),
(70, 'https://iruby.vn/wp-content/uploads/2022/06/ruby-facet-removebg-preview.png', 'https://iruby.vn/wp-content/uploads/2022/06/ruby-facet-lucyen-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/06/ruby-lucyen-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/06/sapphire-hong-do-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/06/ruby-facet-150x150.jpg'),
(71, 'https://iruby.vn/wp-content/uploads/2024/04/Da-Aquamarine-xanh-bien-Thanh-Hoa-287ct-IRAQ20-240428700000.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Aquamarine-xanh-bien-Thanh-Hoa-287ct-IRAQ20-240428700001.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Aquamarine-xanh-bien-Thanh-Hoa-287ct-IRAQ20-240428700002.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Aquamarine-xanh-bien-Thanh-Hoa-287ct-IRAQ20-240428700003.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Aquamarine-xanh-bien-Thanh-Hoa-287ct-IRAQ20-240428700004.jpg'),
(72, 'https://iruby.vn/wp-content/uploads/2024/04/Da-Aquamarine-xanh-bien-tu-nhien-100-294ct-IRAQ19-240429400000.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Aquamarine-xanh-bien-tu-nhien-100-294ct-IRAQ19-240429400001.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Aquamarine-xanh-bien-tu-nhien-100-294ct-IRAQ19-240429400002.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Aquamarine-xanh-bien-tu-nhien-100-294ct-IRAQ19-240429400003.jpg', 'https://iruby.vn/wp-content/uploads/2024/04/Da-Aquamarine-xanh-bien-tu-nhien-100-294ct-IRAQ19-240429400004.jpg'),
(73, 'https://iruby.vn/wp-content/uploads/2024/03/Da-Aquamarine-xanh-bien-tu-nhien-IRAQ18-240350000000.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Aquamarine-xanh-bien-tu-nhien-IRAQ18-240350000001.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Aquamarine-xanh-bien-tu-nhien-IRAQ18-240350000001.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Aquamarine-xanh-bien-tu-nhien-IRAQ18-240350000003.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Aquamarine-xanh-bien-tu-nhien-IRAQ18-240350000004.jpg'),
(74, 'https://iruby.vn/wp-content/uploads/2024/03/Da-Aquamarine-xanh-bien-tu-nhien-IRAQ17-240335000000-1.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Aquamarine-xanh-bien-tu-nhien-IRAQ17-240335000001-1.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Aquamarine-xanh-bien-tu-nhien-IRAQ17-240335000002-1.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Aquamarine-xanh-bien-tu-nhien-IRAQ17-240335000003-1.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Da-Aquamarine-xanh-bien-tu-nhien-IRAQ17-240335000004-1.jpg'),
(75, 'https://iruby.vn/wp-content/uploads/2024/03/Aquamarine-xanh-bien-tu-nhien-IRAQ16-240352900000.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Aquamarine-xanh-bien-tu-nhien-IRAQ16-240352900001.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Aquamarine-xanh-bien-tu-nhien-IRAQ16-240352900002.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Aquamarine-xanh-bien-tu-nhien-IRAQ16-240352900003.jpg', 'https://iruby.vn/wp-content/uploads/2024/03/Aquamarine-xanh-bien-tu-nhien-IRAQ16-240352900004.jpg'),
(76, 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-658ct-IRAQ15-240265800000.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-658ct-IRAQ15-240265800001.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-658ct-IRAQ15-240265800002.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-658ct-IRAQ15-240265800002.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-658ct-IRAQ15-240265800003.jpg'),
(77, 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-417ct-IRAQ14-240241700000.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-417ct-IRAQ14-240241700001.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-417ct-IRAQ14-240241700002.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-417ct-IRAQ14-240241700003.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-417ct-IRAQ14-240241700004.jpg'),
(78, 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-773ct-IRAQ13-240277300000.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-773ct-IRAQ13-240277300001.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-773ct-IRAQ13-240277300002.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-773ct-IRAQ13-240277300003.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Aquamarine-xanh-bien-tu-nhien-100-773ct-IRAQ13-240277300004.jpg'),
(79, 'https://iruby.vn/wp-content/uploads/2024/01/Da-Aquamarine-xanh-bien-co-gam-mau-dep-nhat-430ct-IRAQ08-240143000000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Aquamarine-xanh-bien-co-gam-mau-dep-nhat-430ct-IRAQ08-240143000001.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Aquamarine-xanh-bien-co-gam-mau-dep-nhat-430ct-IRAQ08-240143000002.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Aquamarine-xanh-bien-co-gam-mau-dep-nhat-430ct-IRAQ08-240143000003.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Aquamarine-xanh-bien-co-gam-mau-dep-nhat-430ct-IRAQ08-240143000004.jpg'),
(80, 'https://iruby.vn/wp-content/uploads/2024/01/Da-Aquamarine-xanh-bien-tu-nhien-100-450ct-IRAQ07-240145000000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Aquamarine-xanh-bien-tu-nhien-100-450ct-IRAQ07-240145000001.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Aquamarine-xanh-bien-tu-nhien-100-450ct-IRAQ07-240145000002.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Aquamarine-xanh-bien-tu-nhien-100-450ct-IRAQ07-240145000003.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Aquamarine-xanh-bien-tu-nhien-100-450ct-IRAQ07-240145000004.jpg'),
(81, 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Aquamaline-xanh-duong-tu-nhien-451ct-IRAQ6-231245100000.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Aquamaline-xanh-duong-tu-nhien-451ct-IRAQ6-231245100001.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Aquamaline-xanh-duong-tu-nhien-451ct-IRAQ6-231245100002.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Aquamaline-xanh-duong-tu-nhien-451ct-IRAQ6-231245100003.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Aquamaline-xanh-duong-tu-nhien-451ct-IRAQ6-231245100004.jpg'),
(82, 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Aquamarine-mau-xanh-duong-956ct-IRAQ5-231295600000.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Aquamarine-mau-xanh-duong-956ct-IRAQ5-231295600001.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Aquamarine-mau-xanh-duong-956ct-IRAQ5-231295600002.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Aquamarine-mau-xanh-duong-956ct-IRAQ5-231295600003.jpg', 'https://iruby.vn/wp-content/uploads/2023/12/Vien-Aquamarine-mau-xanh-duong-956ct-IRAQ5-231295600004.jpg'),
(83, 'https://iruby.vn/wp-content/uploads/2023/06/Tinh-the-aqua-mau-xanh-lam-663g-IRAQ-23666300004.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Tinh-the-aqua-mau-xanh-lam-663g-IRAQ-23666300001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Tinh-the-aqua-mau-xanh-lam-663g-IRAQ-23666300001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Tinh-the-aqua-mau-xanh-lam-663g-IRAQ-23666300002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Tinh-the-aqua-mau-xanh-lam-663g-IRAQ-23666300003-150x150.jpg'),
(84, 'https://iruby.vn/wp-content/uploads/2023/03/Aquamarine-xanh-duong-IRAQ23330400005.jpg', 'https://iruby.vn/wp-content/uploads/2023/03/Aquamarine-xanh-duong-IRAQ23330400004-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/03/Aquamarine-xanh-duong-IRAQ23330400000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/03/Aquamarine-xanh-duong-IRAQ23330400001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/03/Aquamarine-xanh-duong-IRAQ23330400003-150x150.jpg'),
(85, 'https://iruby.vn/wp-content/uploads/2022/11/aquamarine-xanh-lam.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/aquamarine-dep-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/aquamarine-xanh-lam-dep-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/emerald-aquamarie-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/aquamarine-xanh-dep-diu-dang-150x150.jpg'),
(86, 'https://iruby.vn/wp-content/uploads/2022/06/aquamarine-removebg-preview.png', 'https://iruby.vn/wp-content/uploads/2022/06/da-aqua-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/06/IMG_4497-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/06/IMG_4497-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/06/menh-thuy-150x150.jpg'),
(87, 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-333ct-IRTM32-240133300000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-333ct-IRTM32-240133300000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-333ct-IRTM32-240133300000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-333ct-IRTM32-240133300003.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-333ct-IRTM32-240133300004.jpg'),
(88, 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-334ct-IRTM31-240133400000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-334ct-IRTM31-240133400001.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-334ct-IRTM31-240133400002.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-334ct-IRTM31-240133400002.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Tourmaline-xanh-luc-sieu-ruc-334ct-IRTM31-240133400002.jpg'),
(89, 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Tourmaline-tu-nhien-100-352ct-IRTM29-231035200003.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Tourmaline-tu-nhien-100-352ct-IRTM29-231035200001.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Tourmaline-tu-nhien-100-352ct-IRTM29-231035200000.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Tourmaline-tu-nhien-100-352ct-IRTM29-231035200004.jpg', 'https://iruby.vn/wp-content/uploads/2023/10/Vien-Tourmaline-tu-nhien-100-352ct-IRTM29-231035200002.jpg'),
(90, 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Tuormaline-mau-xanh-luc-sang-355ct-23535500004.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Tuormaline-mau-xanh-luc-sang-355ct-23535500001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Tuormaline-mau-xanh-luc-sang-355ct-23535500000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Tuormaline-mau-xanh-luc-sang-355ct-23535500002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/05/Vien-Tuormaline-mau-xanh-luc-sang-355ct-23535500003-150x150.jpg'),
(91, 'https://iruby.vn/wp-content/uploads/2024/02/Da-Garnet-Luc-Yen-tu-nhien-100-530ct-IRGN113-240153000000.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Garnet-Luc-Yen-tu-nhien-100-530ct-IRGN113-240153000005.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Garnet-Luc-Yen-tu-nhien-100-530ct-IRGN113-240153000002.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Garnet-Luc-Yen-tu-nhien-100-530ct-IRGN113-240153000003.jpg', 'https://iruby.vn/wp-content/uploads/2024/02/Da-Garnet-Luc-Yen-tu-nhien-100-530ct-IRGN113-240153000004.jpg'),
(92, 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-Luc-Yen-tu-nhien-100-175ct-IRGN112-240117500000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-Luc-Yen-tu-nhien-100-175ct-IRGN112-240117500005.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-Luc-Yen-tu-nhien-100-175ct-IRGN112-240117500002.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-Luc-Yen-tu-nhien-100-175ct-IRGN112-240117500003.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-Luc-Yen-tu-nhien-100-175ct-IRGN112-240117500003.jpg');
INSERT INTO `product_image` (`id`, `img_main`, `img_1`, `img_2`, `img_3`, `img_4`) VALUES
(93, 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-Luc-Yen-tu-nhien-100-237ct-IRGN111-240127300000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-Luc-Yen-tu-nhien-100-237ct-IRGN111-240127300001.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-Luc-Yen-tu-nhien-100-237ct-IRGN111-240127300002.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-Luc-Yen-tu-nhien-100-237ct-IRGN111-240127300003.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-Luc-Yen-tu-nhien-100-237ct-IRGN111-240127300004.jpg'),
(94, 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-mau-do-hong-tu-nhien-100-219ct-IRGN108-240121900000.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-mau-do-hong-tu-nhien-100-219ct-IRGN108-240121900001.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-mau-do-hong-tu-nhien-100-219ct-IRGN108-240121900002.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-mau-do-hong-tu-nhien-100-219ct-IRGN108-240121900003.jpg', 'https://iruby.vn/wp-content/uploads/2024/01/Da-Garnet-mau-do-hong-tu-nhien-100-219ct-IRGN108-240121900004.jpg'),
(95, 'https://iruby.vn/wp-content/uploads/2023/06/Da-Garnet-mau-xanh-tao-hiem-gap-415ct-IRGN-23541500004.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Da-Garnet-mau-xanh-tao-hiem-gap-415ct-IRGN-23541500001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Da-Garnet-mau-xanh-tao-hiem-gap-415ct-IRGN-23541500000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Da-Garnet-mau-xanh-tao-hiem-gap-415ct-IRGN-23541500002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/06/Da-Garnet-mau-xanh-tao-hiem-gap-415ct-IRGN-23541500003-150x150.jpg'),
(96, 'https://iruby.vn/wp-content/uploads/2022/11/da-garnetxanh-1.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/da-garnetxanh-2-e1668169004903-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/da-garnetxanh-3-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/da-garnetxanh-4-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2022/11/da-garnetxanh-5-150x150.jpg'),
(97, 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Tuormaline-trai-tim-mau-do-thuan-300ct-IRTM29-2333000004.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Tuormaline-trai-tim-mau-do-thuan-300ct-IRTM29-2333000001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Tuormaline-trai-tim-mau-do-thuan-300ct-IRTM29-2333000000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Tuormaline-trai-tim-mau-do-thuan-300ct-IRTM29-2333000002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/08/Vien-Tuormaline-trai-tim-mau-do-thuan-300ct-IRTM29-2333000003-150x150.jpg'),
(98, 'https://iruby.vn/wp-content/uploads/2023/04/Da-Garnet-mau-do-tim-099ct-IRGN23409900005.jpg', 'https://iruby.vn/wp-content/uploads/2023/04/Da-Garnet-mau-do-tim-099ct-IRGN23409900002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/04/Da-Garnet-mau-do-tim-099ct-IRGN23409900003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/04/Da-Garnet-mau-do-tim-099ct-IRGN23409900000-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/04/Da-Garnet-mau-do-tim-099ct-IRGN23409900001-150x150.jpg'),
(99, 'https://iruby.vn/wp-content/uploads/2023/04/Da-Garnet-mau-do-tim-287ct-IRGN23328700004.jpg', 'https://iruby.vn/wp-content/uploads/2023/04/Da-Garnet-mau-do-tim-287ct-IRGN23328700002-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/04/Da-Garnet-mau-do-tim-287ct-IRGN23328700001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/04/Da-Garnet-mau-do-tim-287ct-IRGN23328700003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/04/Da-Garnet-mau-do-tim-287ct-IRGN23328700000-150x150.jpg'),
(100, 'https://iruby.vn/wp-content/uploads/2023/03/Vien-Rhodolite-garnet-dep-tu-nhien-3.24ct-IRGN23323400000.jpg', 'https://iruby.vn/wp-content/uploads/2023/03/Vien-Rhodolite-garnet-dep-tu-nhien-3.24ct-IRGN23323400004-1-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/03/Vien-Rhodolite-garnet-dep-tu-nhien-3.24ct-IRGN23323400003-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/03/Vien-Rhodolite-garnet-dep-tu-nhien-3.24ct-IRGN23323400001-150x150.jpg', 'https://iruby.vn/wp-content/uploads/2023/03/Vien-Rhodolite-garnet-dep-tu-nhien-3.24ct-IRGN23323400002-150x150.jpg');

-- --------------------------------------------------------

--
-- Cấu trúc bảng cho bảng `users`
--

CREATE TABLE `users` (
  `id` int(11) NOT NULL,
  `username` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `password` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `full_name` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT 'user',
  `gender` enum('nam','nu','khac') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `birthday` datetime DEFAULT NULL,
  `email` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL,
  `phone` varchar(10) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `address` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `avatar` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT '../img/avatar.png',
  `created_at` datetime DEFAULT current_timestamp(),
  `updated_at` datetime DEFAULT NULL,
  `delete_at` datetime DEFAULT NULL,
  `role` enum('user','admin','prohibit') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'user',
  `status` varchar(30) CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci DEFAULT NULL,
  `type_login` enum('web','facebook','google') CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'web'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Đang đổ dữ liệu cho bảng `users`
--

INSERT INTO `users` (`id`, `username`, `password`, `full_name`, `gender`, `birthday`, `email`, `phone`, `address`, `avatar`, `created_at`, `updated_at`, `delete_at`, `role`, `status`, `type_login`) VALUES
(1, 'tan', 'hihhaha', 'user', 'nu', '2024-06-20 21:15:01', 'tam@gmail.com', '0918247523', 'mach thi lieu', '/DaQuyStore_war/img/avatar.png', '2024-03-31 19:12:51', '2024-04-10 23:06:58', '2024-03-31 14:11:39', 'user', 'chưa xóa', 'web'),
(3, 'tai', 'hihhaha', 'tai', 'nam', '2024-06-26 21:15:03', 'tai@gmail.com', '0932746373', 'mach thi lieu', '/DaQuyStore_war/img/avatar.png', '2024-04-02 10:50:30', '2024-06-13 21:17:27', '2024-04-02 05:45:42', 'user', 'chưa xóa', 'web'),
(16, '21130525@st.hcmuaf.edu.vn', 'hihhaha', 'Tâm Lê Thanh', 'nam', '2024-06-26 21:15:06', '21130525@st.hcmuaf.edu.vn', '0909323573', 'mach thi lieu', 'https://lh3.googleusercontent.com/a/ACg8ocI_nFQBuGF1zpQF5qrv9GUrDzI2v3FJaAO8Qjpn9RxiQ0DJ-Zw=s96-c', '2024-04-17 17:08:08', '2024-06-11 21:17:29', '2024-06-12 21:17:32', 'prohibit', 'chưa xóa', 'google'),
(27, 'qa', '111hihi', 'le thanh tam', 'nam', '2020-06-25 00:00:00', 'tam1442k3@gmail.com', '0343381360', 'ba ria vung tau', '/DaQuyStore_war/img/avatar.png', '2024-07-05 14:58:06', '2024-07-06 11:39:08', NULL, 'user', 'chưa xóa', 'web'),
(28, 'tam1442k3@gmail.com', '103100619580639771969hihi', 'Lê Tâm', NULL, NULL, 'tam1442k3@gmail.com', NULL, NULL, 'https://lh3.googleusercontent.com/a/ACg8ocK-lxumFg90gGuo6IQE6FAif3yoNvIBgYgU1FDrETh6ppAscw=s96-c', '2024-07-13 15:58:42', NULL, NULL, 'user', 'chưa xóa', 'google');

--
-- Chỉ mục cho các bảng đã đổ
--

--
-- Chỉ mục cho bảng `activacation_code`
--
ALTER TABLE `activacation_code`
  ADD PRIMARY KEY (`activationCode`);

--
-- Chỉ mục cho bảng `categories`
--
ALTER TABLE `categories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `inventories`
--
ALTER TABLE `inventories`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `inventory_detail`
--
ALTER TABLE `inventory_detail`
  ADD PRIMARY KEY (`id`,`product_id`);

--
-- Chỉ mục cho bảng `log`
--
ALTER TABLE `log`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`),
  ADD KEY `user_id` (`user_id`);

--
-- Chỉ mục cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD KEY `order_id` (`order_id`),
  ADD KEY `product_id` (`product_id`);

--
-- Chỉ mục cho bảng `products`
--
ALTER TABLE `products`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_category` (`category_id`),
  ADD KEY `image_product` (`image_product`);

--
-- Chỉ mục cho bảng `product_image`
--
ALTER TABLE `product_image`
  ADD PRIMARY KEY (`id`);

--
-- Chỉ mục cho bảng `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`,`email`);

--
-- AUTO_INCREMENT cho các bảng đã đổ
--

--
-- AUTO_INCREMENT cho bảng `categories`
--
ALTER TABLE `categories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT cho bảng `inventories`
--
ALTER TABLE `inventories`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT cho bảng `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=206;

--
-- AUTO_INCREMENT cho bảng `products`
--
ALTER TABLE `products`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=101;

--
-- AUTO_INCREMENT cho bảng `product_image`
--
ALTER TABLE `product_image`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=102;

--
-- AUTO_INCREMENT cho bảng `users`
--
ALTER TABLE `users`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=29;

--
-- Các ràng buộc cho các bảng đã đổ
--

--
-- Các ràng buộc cho bảng `orders`
--
ALTER TABLE `orders`
  ADD CONSTRAINT `orders_ibfk_1` FOREIGN KEY (`user_id`) REFERENCES `users` (`id`);

--
-- Các ràng buộc cho bảng `order_details`
--
ALTER TABLE `order_details`
  ADD CONSTRAINT `order_details_ibfk_1` FOREIGN KEY (`order_id`) REFERENCES `orders` (`id`),
  ADD CONSTRAINT `order_details_ibfk_2` FOREIGN KEY (`product_id`) REFERENCES `products` (`id`);

--
-- Các ràng buộc cho bảng `products`
--
ALTER TABLE `products`
  ADD CONSTRAINT `fk_category` FOREIGN KEY (`category_id`) REFERENCES `categories` (`id`),
  ADD CONSTRAINT `fk_img` FOREIGN KEY (`image_product`) REFERENCES `product_image` (`id`);
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
