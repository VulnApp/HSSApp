-- phpMyAdmin SQL Dump
-- version 5.1.3
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: Nov 14, 2022 at 07:53 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 8.1.5

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

--
-- Database: `hss_db`
--

-- --------------------------------------------------------

--
-- Table structure for table `brand_list`
--

CREATE TABLE `brand_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `image_path` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `brand_list`
--

INSERT INTO `brand_list` (`id`, `name`, `image_path`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Arai', 'uploads/brands/brand-1.png?v=1668389508', 1, '2022-11-14 09:31:48', '2022-11-14 09:31:48'),
(2, 'Bell', 'uploads/brands/brand-2.png?v=1668389522', 1, '2022-11-14 09:32:02', '2022-11-14 09:32:02'),
(3, 'HJC', 'uploads/brands/brand-3.png?v=1668389534', 1, '2022-11-14 09:32:14', '2022-11-14 09:32:14'),
(4, 'AVG', 'uploads/brands/brand-4.png?v=1668389547', 1, '2022-11-14 09:32:27', '2022-11-14 09:32:27'),
(5, 'Shoei', 'uploads/brands/brand-5.png?v=1668389571', 1, '2022-11-14 09:32:51', '2022-11-14 09:32:51'),
(6, 'Spyder', 'uploads/brands/brand-6.png?v=1668389584', 1, '2022-11-14 09:33:04', '2022-11-14 09:33:04');

-- --------------------------------------------------------

--
-- Table structure for table `category_list`
--

CREATE TABLE `category_list` (
  `id` int(30) NOT NULL,
  `name` text NOT NULL,
  `description` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 1,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `category_list`
--

INSERT INTO `category_list` (`id`, `name`, `description`, `status`, `date_created`, `date_updated`) VALUES
(1, 'Full Face', 'Full Face Helmet', 1, '2022-11-14 09:34:17', NULL),
(2, 'Flip-up', 'Flip-up Helmet', 1, '2022-11-14 09:34:33', NULL),
(3, 'Open Face', 'Open Face Helmet', 1, '2022-11-14 09:34:50', NULL),
(4, 'Half', 'Half Helmet', 1, '2022-11-14 09:35:09', NULL),
(5, 'Dirt Bike', 'Dirt Bike Helmet', 1, '2022-11-14 09:35:24', NULL),
(6, 'Dual Sport', 'Dual Sport Helmet', 1, '2022-11-14 09:35:41', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `helmet_list`
--

CREATE TABLE `helmet_list` (
  `id` int(30) NOT NULL,
  `brand_id` int(30) NOT NULL,
  `category_id` int(30) NOT NULL,
  `price` float NOT NULL DEFAULT 0,
  `product_title` text NOT NULL,
  `description` text NOT NULL,
  `color` varchar(250) NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `helmet_list`
--

INSERT INTO `helmet_list` (`id`, `brand_id`, `category_id`, `price`, `product_title`, `description`, `color`, `status`, `date_created`, `date_updated`) VALUES
(2, 6, 2, 999.99, 'Force Series 1', '&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Lorem ipsum dolor sit amet, consectetur adipiscing elit. In sit amet fringilla mauris. Morbi varius neque id fringilla finibus. Maecenas eu nisl faucibus est blandit viverra. Sed porta porttitor turpis sit amet auctor. Maecenas eget eros tellus. Ut eget turpis mi. Maecenas aliquet, nibh non feugiat porta, quam est luctus nisl, non molestie ex turpis sed tellus. Morbi ultricies, purus ut bibendum sollicitudin, lectus lorem mattis sapien, sed condimentum tortor lorem vel mi. Aenean elementum magna tellus, vel fermentum risus bibendum ac. Donec eu tincidunt dolor, in elementum dolor. Curabitur porta felis sit amet augue porta congue. Nullam dui orci, finibus ac posuere sit amet, commodo a neque.&lt;/p&gt;&lt;p&gt;&lt;br&gt;&lt;/p&gt;&lt;p&gt;Duis gravida libero id est ullamcorper, sodales dapibus odio lacinia. Nam molestie sagittis neque efficitur hendrerit. Suspendisse vitae nulla velit. Interdum et malesuada fames ac ante ipsum primis in faucibus. Fusce sollicitudin at quam at ultricies. Cras id turpis eget arcu congue suscipit a sed sem. Sed vel fringilla diam. Morbi est sem, elementum non porta vitae, ornare sit amet dolor. Pellentesque ac velit fermentum, posuere nunc a, mattis tortor. Suspendisse tincidunt tristique massa. Nam tristique pulvinar est, eget consequat ipsum efficitur vel. Vivamus volutpat sapien vitae ultrices ultrices. Pellentesque iaculis, tortor a porta ullamcorper, enim eros mattis dui, laoreet placerat mauris sem eget odio. Suspendisse ac est at nisi interdum viverra. Donec ullamcorper commodo lorem, ut tristique nisi convallis nec.&lt;/p&gt;', 'Black/Red', 0, '2022-11-14 10:29:26', NULL),
(3, 1, 1, 999.99, 'KIYONARI TRICO FROST', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Suspendisse sit amet laoreet turpis. Cras scelerisque metus sed lorem efficitur, vitae lobortis dolor faucibus. Lorem ipsum dolor sit amet, consectetur adipiscing elit. Mauris sagittis, lectus eu interdum egestas, massa arcu aliquet leo, in dapibus ipsum quam ut felis. Vivamus feugiat finibus ex sed porttitor. Aenean vehicula ipsum a tortor ornare posuere. Sed dolor mauris, malesuada vel iaculis id, convallis et mi. Aenean ultrices lacus laoreet eros tincidunt sollicitudin. Nulla vitae pretium lacus. Maecenas sit amet nisi consequat, pharetra lectus vel, pretium elit. In eros arcu, eleifend et mattis at, dictum gravida metus. Maecenas cursus congue dolor, eu aliquet arcu egestas vitae. Fusce hendrerit felis eget erat consequat molestie.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Proin metus urna, maximus ut venenatis in, finibus in massa. Donec imperdiet leo libero, sit amet vestibulum mi fermentum et. Mauris maximus lacus eget lectus lacinia, sed porttitor elit euismod. Mauris condimentum iaculis tortor sit amet sodales. Fusce ultrices augue a mi mollis, vitae sagittis velit mattis. Curabitur fringilla magna sed nisi aliquet, in tristique sapien tincidunt. Aliquam varius laoreet placerat. Pellentesque nec neque vehicula, tempus sapien at, fringilla mauris. Maecenas ut orci odio. Suspendisse potenti. Nam nec risus vel massa congue tempor. Curabitur vestibulum nibh sed erat placerat efficitur. Fusce id facilisis leo. Etiam volutpat in metus sed aliquam.&lt;/p&gt;', 'Black/Gray', 0, '2022-11-14 11:15:26', NULL),
(4, 6, 1, 888.88, 'Rover Plain', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Vivamus lobortis nisl ac tellus elementum, a viverra sem vestibulum. Sed non tristique purus, sit amet malesuada odio. Praesent egestas, eros a faucibus volutpat, elit tortor convallis ex, vitae accumsan neque velit quis lectus. Sed commodo nisi non placerat bibendum. Ut gravida, lacus non efficitur rutrum, libero eros venenatis ex, eu pharetra dolor sapien at arcu. Ut tincidunt pharetra ex, ac finibus augue mattis vel. Praesent rutrum elementum felis, ac sagittis enim sodales in. Nullam efficitur, lacus non aliquam finibus, ante augue ultrices nisl, a condimentum purus est ac purus. Duis eu aliquam tortor, sed congue mauris. Nullam id tristique arcu. Nunc tincidunt volutpat neque, at gravida lacus efficitur sed. Mauris eu iaculis nunc. Vivamus fermentum, mi sed molestie porta, erat felis laoreet dui, vel vulputate est metus non nibh. Nam pharetra lobortis erat nec imperdiet. Phasellus tincidunt lorem in ex commodo bibendum. Nunc eu nisi velit.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Donec nisl enim, bibendum ut mauris nec, aliquet viverra nisl. Sed sed felis sed orci molestie scelerisque a in erat. Nunc fermentum lorem at nunc consequat, quis hendrerit nibh consectetur. Praesent est nulla, consequat ac magna ultricies, ullamcorper egestas nunc. Phasellus et ullamcorper sapien. Nunc a neque pellentesque, rutrum justo non, luctus enim. In eget purus faucibus felis euismod lobortis. Sed cursus aliquam ante eget imperdiet. Donec rutrum arcu vel tortor euismod porttitor. Quisque cursus vehicula libero at blandit. Integer vel malesuada erat. Pellentesque commodo lobortis purus eget maximus.&lt;/p&gt;', 'Black', 0, '2022-11-14 11:34:59', NULL),
(5, 2, 5, 988.88, 'Moto-10 Spherical', '&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Etiam nec varius dui. Integer quis ipsum felis. Duis tristique ultrices euismod. Quisque venenatis massa sit amet molestie mattis. Donec pulvinar sapien eu libero lobortis iaculis. Donec id odio eget enim faucibus ornare. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nam vehicula diam sed eleifend interdum. Vestibulum in enim eu eros efficitur fermentum. Aliquam varius, ante eu interdum lacinia, tortor justo euismod risus, ut venenatis arcu lorem a ante. Sed feugiat, neque ac varius efficitur, turpis erat malesuada tellus, ut pulvinar ipsum nulla quis mauris. Vestibulum a neque ut diam maximus tristique. Aenean blandit sollicitudin pulvinar. Pellentesque molestie sollicitudin nibh, sed imperdiet nisl commodo quis.&lt;/p&gt;&lt;p style=&quot;margin-right: 0px; margin-bottom: 15px; margin-left: 0px; padding: 0px; text-align: justify; color: rgb(0, 0, 0); font-family: &amp;quot;Open Sans&amp;quot;, Arial, sans-serif; font-size: 14px;&quot;&gt;Integer at elit consequat, fermentum ipsum sit amet, mattis tellus. Phasellus eget bibendum augue. Donec in posuere sem, vitae tempus dui. Class aptent taciti sociosqu ad litora torquent per conubia nostra, per inceptos himenaeos. Donec ac augue lacinia, maximus dolor a, tempor nisl. Praesent dictum leo urna, posuere pretium nisl maximus in. Aenean ut est vitae ante congue suscipit eget vel orci. Nulla non velit in enim sollicitudin lobortis. Interdum et malesuada fames ac ante ipsum primis in faucibus. Suspendisse sed tincidunt nisl. Curabitur pretium porttitor est, ac tempor nisi sagittis in. Nulla facilisi. Nullam lobortis eros quis luctus ultrices.&lt;/p&gt;', 'Blue/Gray', 0, '2022-11-14 12:00:29', NULL);

-- --------------------------------------------------------

--
-- Table structure for table `inquiry_list`
--

CREATE TABLE `inquiry_list` (
  `id` int(30) NOT NULL,
  `helmet_id` int(30) NOT NULL,
  `fullname` text NOT NULL,
  `email` varchar(250) NOT NULL,
  `contact` varchar(20) NOT NULL,
  `message` text NOT NULL,
  `status` tinyint(1) NOT NULL DEFAULT 0,
  `remarks` text DEFAULT NULL,
  `date_created` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `inquiry_list`
--

INSERT INTO `inquiry_list` (`id`, `helmet_id`, `fullname`, `email`, `contact`, `message`, `status`, `remarks`, `date_created`, `date_updated`) VALUES
(1, 3, 'Mark Cooper', 'mcooper@mail.com', '09123564789', 'Sample inquiry', 0, NULL, '2022-11-14 11:39:21', '2022-11-14 11:50:32');

-- --------------------------------------------------------

--
-- Table structure for table `system_info`
--

CREATE TABLE `system_info` (
  `id` int(30) NOT NULL,
  `meta_field` text NOT NULL,
  `meta_value` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_info`
--

INSERT INTO `system_info` (`id`, `meta_field`, `meta_value`) VALUES
(1, 'name', 'Helmet Store Showroom - PHP'),
(6, 'short_name', 'HSS - PHP'),
(11, 'logo', 'uploads/logo-1668388830.png'),
(13, 'user_avatar', 'uploads/user_avatar.jpg'),
(14, 'cover', 'uploads/cover-1668388830.png'),
(15, 'content', 'Array');

-- --------------------------------------------------------

--
-- Table structure for table `users`
--

CREATE TABLE `users` (
  `id` int(50) NOT NULL,
  `firstname` varchar(250) NOT NULL,
  `middlename` text DEFAULT NULL,
  `lastname` varchar(250) NOT NULL,
  `username` text NOT NULL,
  `password` text NOT NULL,
  `avatar` text DEFAULT NULL,
  `last_login` datetime DEFAULT NULL,
  `type` tinyint(1) NOT NULL DEFAULT 0,
  `status` int(1) NOT NULL DEFAULT 1 COMMENT '0=not verified, 1 = verified',
  `date_added` datetime NOT NULL DEFAULT current_timestamp(),
  `date_updated` datetime DEFAULT NULL ON UPDATE current_timestamp()
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `users`
--

INSERT INTO `users` (`id`, `firstname`, `middlename`, `lastname`, `username`, `password`, `avatar`, `last_login`, `type`, `status`, `date_added`, `date_updated`) VALUES
(1, 'Adminstrator', NULL, 'Admin', 'admin', '0192023a7bbd73250516f069df18b500', 'uploads/avatar-1.png?v=1635556826', NULL, 1, 1, '2021-01-20 14:02:37', '2021-11-27 13:39:11'),
(3, 'John', NULL, 'Smith', 'jsmith', '1254737c076cf867dc53d60a0364f38e', 'uploads/avatar-3.png?v=1668397860', NULL, 2, 1, '2022-11-14 11:51:00', '2022-11-14 11:52:04');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `brand_list`
--
ALTER TABLE `brand_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `category_list`
--
ALTER TABLE `category_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `helmet_list`
--
ALTER TABLE `helmet_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `inquiry_list`
--
ALTER TABLE `inquiry_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_info`
--
ALTER TABLE `system_info`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `brand_list`
--
ALTER TABLE `brand_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `category_list`
--
ALTER TABLE `category_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `helmet_list`
--
ALTER TABLE `helmet_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `inquiry_list`
--
ALTER TABLE `inquiry_list`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `system_info`
--
ALTER TABLE `system_info`
  MODIFY `id` int(30) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=16;

--
-- AUTO_INCREMENT for table `users`
--
ALTER TABLE `users`
  MODIFY `id` int(50) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;
COMMIT;
