-- phpMyAdmin SQL Dump
-- version 5.2.1
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Mar 23, 2025 at 11:41 PM
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
-- Database: `opos2`
--

-- --------------------------------------------------------

--
-- Table structure for table `cart`
--

CREATE TABLE `cart` (
  `id` int(30) NOT NULL,
  `client_ip` varchar(20) NOT NULL,
  `user_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`) VALUES
(1, 'Thin Crust Pizza'),
(2, 'Thick Crust Pizza'),
(3, 'Sicilian Pizza'),
(4, 'Beverage');

-- --------------------------------------------------------

--
-- Table structure for table `orders`
--

CREATE TABLE `orders` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `address` text NOT NULL,
  `mobile` text NOT NULL,
  `email` text NOT NULL,
  `user_id` int(11) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `order_date` datetime NOT NULL DEFAULT current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `orders`
--

INSERT INTO `orders` (`id`, `name`, `address`, `mobile`, `email`, `user_id`, `status`, `order_date`) VALUES
(1, 'Mark Cooper', 'Sample Address', '0912345698', 'mcooper@mail.com', 0, 1, '2025-03-24 06:03:36'),
(2, '123 123', '123', '123', '123@gmail.com', 0, 0, '2025-03-24 06:19:43'),
(3, 'muhd khairuddin', 'no 30 lorong bahagia', '0108051072', 'hi@gmail.com', 0, 0, '2025-03-24 06:20:38'),
(4, 'muhd khairuddin', 'no 30 lorong bahagia', '0108051072', 'hi@gmail.com', 3, 0, '2025-03-24 06:21:56'),
(6, 'muhd khairuddin', 'no 30 lorong bahagia', '0108051072', 'hi@gmail.com', 0, 0, '2025-03-24 06:23:22'),
(7, 'muhd khairuddin', 'no 30 lorong bahagia', '0108051072', 'hi@gmail.com', 3, 0, '2025-03-24 06:24:11'),
(8, '123 123', '123', '123', '123@gmail.com', 2, 0, '2025-03-24 06:24:33'),
(9, '123 123', '123', '123', '123@gmail.com', 2, 0, '2025-03-24 06:25:29'),
(10, '123 123', '123', '123', '123@gmail.com', 2, 1, '2025-03-24 06:26:17'),
(11, 'rozi rozi', 'rozi', 'rozi', 'rozi@gmail.com', 4, 0, '2025-03-24 06:26:48');

-- --------------------------------------------------------

--
-- Table structure for table `order_list`
--

CREATE TABLE `order_list` (
  `id` int(30) NOT NULL,
  `order_id` int(30) NOT NULL,
  `product_id` int(30) NOT NULL,
  `qty` int(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `order_list`
--

INSERT INTO `order_list` (`id`, `order_id`, `product_id`, `qty`) VALUES
(1, 1, 2, 2),
(2, 2, 4, 1),
(3, 3, 4, 1),
(4, 4, 4, 1),
(6, 6, 4, 1),
(7, 7, 4, 1),
(8, 8, 4, 1),
(9, 9, 4, 1),
(10, 10, 4, 1),
(11, 11, 4, 1);

-- --------------------------------------------------------

--
-- Table structure for table `product_list`
--

CREATE TABLE `product_list` (
  `id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `name` varchar(100) NOT NULL,
  `description` text NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `img_path` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1 COMMENT '0= unavailable, 2 Available'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `product_list`
--

INSERT INTO `product_list` (`id`, `category_id`, `name`, `description`, `price`, `img_path`, `status`) VALUES
(1, 3, 'Sicilian Supreme', 'Sicilian-style pizza dengan extra topping untuk pengalaman rasa premium dan jahat!!', 18.99, '1676512620_Sicilian.jpg', 1),
(2, 1, 'Pepperoni Crisp', 'Kelembutan doh nipis dengan lapisan pepperoni yang kaya rasa', 380, '1676512800_thin-pepperoni.png', 1),
(3, 2, ' Detroit Deluxe', 'Pizza tebal dan rangup dengan keju cair hingga ke tepi', 360, '1742137260_Thick-Crust-Pizza-square-featured.jpg', 1),
(4, 4, 'Fizz Splash', 'Jus buah asli yang segar dan menyegarkan tekak', 111, '1742137320_size=600x600.png', 1),
(5, 3, ' Sicilian Classic', 'Pizza Sicilian klasik dengan rasa autentik yang memuaskan', 123, '1681114320_fernando-andrade-_P76trHTWDE-unsplash.jpg', 1),
(7, 4, 'Watermelon Juice', 'Air paling jahat!! ', 20, '1742119080_watermelon-juice-1.jpg', 1);

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `email` varchar(200) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `cover_img` text NOT NULL,
  `about_content` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `name`, `email`, `contact`, `cover_img`, `about_content`) VALUES
(1, 'Online Pizza Ordering System', 'kl2311015305@student.uptm.edu.my', '0108051072', 'pizza.jpg', '&lt;h1 style=&quot;margin-bottom: 0px; padding: 0px; line-height: 90px; color: rgb(0, 0, 0); text-align: center; font-size: 70px; font-family: DauphinPlain;&quot;&gt;&lt;p class=&quot;lead&quot; style=&quot;margin-bottom: 1rem; font-size: 1.25rem; color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;;&quot;&gt;At&amp;nbsp;&lt;span style=&quot;font-weight: bolder;&quot;&gt;The Best Pizza&lt;/span&gt;, we are passionate about crafting the most delicious, high-quality pizzas for our customers.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px;&quot;&gt;Founded with a love for authentic flavors, we use only the freshest ingredients, from our hand-kneaded dough to our signature tomato sauce, ensuring every bite is packed with perfection.&lt;/p&gt;&lt;p style=&quot;margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px;&quot;&gt;Our pizzas are baked in traditional stone ovens to achieve the perfect crispy crust and cheesy goodness.&lt;/p&gt;&lt;p class=&quot;font-weight-bold&quot; style=&quot;margin-bottom: 1rem; color: rgb(33, 37, 41); font-family: Merriweather, -apple-system, BlinkMacSystemFont, &amp;quot;Segoe UI&amp;quot;, Roboto, &amp;quot;Helvetica Neue&amp;quot;, Arial, &amp;quot;Noto Sans&amp;quot;, sans-serif, &amp;quot;Apple Color Emoji&amp;quot;, &amp;quot;Segoe UI Emoji&amp;quot;, &amp;quot;Segoe UI Symbol&amp;quot;, &amp;quot;Noto Color Emoji&amp;quot;; font-size: 16px;&quot;&gt;Why choose us?&lt;/p&gt;&lt;/h1&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;&lt;p&gt;&lt;/p&gt;');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(30) NOT NULL,
  `name` varchar(200) NOT NULL,
  `username` text NOT NULL,
  `password` varchar(200) NOT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 2 COMMENT '1=admin , 2 = staff'
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_general_ci;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `name`, `username`, `password`, `type`) VALUES
(1, 'Administrator', 'admin', '$2y$10$b.U/uJXcy1G3eE..hbzWcOkknjZqjCoggCIpg90llvzme20fB09i6', 1),
(2, 'Staff', 'staff', '$2y$10$DJbGDnA6bkOiS0TW08R5FOPruw0wRW4maShgWK8k6FlEfgNjbXsvm', 2);

-- --------------------------------------------------------

--
-- Table structure for table `user_info`
--

CREATE TABLE `user_info` (
  `user_id` int(10) NOT NULL,
  `first_name` varchar(100) NOT NULL,
  `last_name` varchar(100) NOT NULL,
  `email` varchar(300) NOT NULL,
  `password` varchar(300) NOT NULL,
  `mobile` varchar(10) NOT NULL,
  `address` varchar(300) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 COLLATE=latin1_swedish_ci;

--
-- Dumping data for table `user_info`
--

INSERT INTO `user_info` (`user_id`, `first_name`, `last_name`, `email`, `password`, `mobile`, `address`) VALUES
(1, 'Mark', 'Cooper', 'mcooper@mail.com', '$2y$10$Z.LYi0zrDsrCYIgU1e7yCOkn1lbREGbUcIpSvgkB0OPapDfp7Xc0a', '0912345698', 'Sample Address'),
(2, '123', '123', '123@gmail.com', '$2y$10$gH7lZKkm/Go0VDhhe0hfwOB3pvjDsFkBvs7HnnRe/TW9NUiCKjk9.', '123', '123'),
(3, 'muhd', 'khairuddin', 'hi@gmail.com', '$2y$10$Z8eI6FDw73ZGne2U.R4wlOXQqL6qUWMV8X2U.4EqXduxLgZmK2xoW', '0108051072', 'no 30 lorong bahagia'),
(4, 'rozi', 'rozi', 'rozi@gmail.com', '$2y$10$RhVJnxS.KoZqmzPNqAbvUOYUeRwUwdP4N7HbzE1tEpts/86rYnyLu', 'rozi', 'rozi');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `cart`
--
ALTER TABLE `cart`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `orders`
--
ALTER TABLE `orders`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `order_list`
--
ALTER TABLE `order_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `product_list`
--
ALTER TABLE `product_list`
  ADD PRIMARY KEY (`id`),
  ADD KEY `fk_product_category` (`category_id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_info`
--
ALTER TABLE `user_info`
  ADD PRIMARY KEY (`user_id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `cart`
--
ALTER TABLE `cart`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `orders`
--
ALTER TABLE `orders`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `order_list`
--
ALTER TABLE `order_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=12;

--
-- AUTO_INCREMENT for table `product_list`
--
ALTER TABLE `product_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `system_settings`
--
ALTER TABLE `system_settings`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_info`
--
ALTER TABLE `user_info`
  MODIFY `user_id` int(10) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- Constraints for dumped tables
--

--
-- Constraints for table `product_list`
--
ALTER TABLE `product_list`
  ADD CONSTRAINT `fk_product_category` FOREIGN KEY (`category_id`) REFERENCES `category_list` (`id`) ON DELETE CASCADE ON UPDATE CASCADE;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
