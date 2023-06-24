-- phpMyAdmin SQL Dump
-- version 5.2.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 30, 2023 at 05:32 AM
-- Server version: 10.4.24-MariaDB
-- PHP Version: 7.4.29

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `bengkel`
--

-- --------------------------------------------------------

--
-- Table structure for table `member`
--

CREATE TABLE `member` (
  `id_member` int(11) NOT NULL,
  `nama_member` varchar(255) DEFAULT NULL,
  `jenis_mobil` varchar(255) DEFAULT NULL,
  `plat_nomor` varchar(255) DEFAULT NULL,
  `alamat` varchar(255) DEFAULT NULL,
  `nomor_telepon` varchar(255) DEFAULT NULL,
  `is_active` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `member`
--

INSERT INTO `member` (`id_member`, `nama_member`, `jenis_mobil`, `plat_nomor`, `alamat`, `nomor_telepon`, `is_active`) VALUES
(4, 'Adhimukti Surya A', 'Toyota Calya', 'AD 1372 WP', 'Badranasri', '081329844484', '1'),
(5, 'Sutatmo', 'Toyota Calya', 'AD 1373 WP', 'Badranasri', '081393496011', '1'),
(6, 'Bramastrya Rinanto', 'Honda City', 'AD 1727 DU', 'Banjarsari', '085728123219', '1');

-- --------------------------------------------------------

--
-- Table structure for table `services`
--

CREATE TABLE `services` (
  `id_service` int(11) NOT NULL,
  `id_member` int(11) NOT NULL,
  `tanggal` date NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `services`
--

INSERT INTO `services` (`id_service`, `id_member`, `tanggal`) VALUES
(1, 4, '2023-05-25'),
(7, 6, '2023-05-26'),
(8, 6, '2023-05-29');

-- --------------------------------------------------------

--
-- Table structure for table `service_detail`
--

CREATE TABLE `service_detail` (
  `id_service_detail` int(11) NOT NULL,
  `id_service` int(11) NOT NULL,
  `id_barang` int(11) NOT NULL,
  `nama_barang` varchar(255) NOT NULL,
  `jumlah_barang` int(11) NOT NULL,
  `harga` int(11) NOT NULL,
  `total_harga` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `service_detail`
--

INSERT INTO `service_detail` (`id_service_detail`, `id_service`, `id_barang`, `nama_barang`, `jumlah_barang`, `harga`, `total_harga`) VALUES
(2, 1, 0, 'Switch Mundur', 1, 80000, 80000),
(3, 1, 0, 'shock breaker', 4, 60000, 240000),
(4, 7, 0, 'oli', 2, 120000, 240000),
(5, 8, 0, 'oli', 2, 40000, 80000);

-- --------------------------------------------------------

--
-- Table structure for table `system_icon`
--

CREATE TABLE `system_icon` (
  `id` int(11) NOT NULL,
  `icon` varchar(32) DEFAULT NULL,
  `icon_name` varchar(32) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_icon`
--

INSERT INTO `system_icon` (`id`, `icon`, `icon_name`) VALUES
(1, 'fa fa-glass', 'fa fa-glass'),
(2, 'fa fa-music', 'fa fa-music'),
(3, 'fa fa-search', 'fa fa-search'),
(4, 'fa fa-envelope-o', 'fa fa-envelope-o'),
(5, 'fa fa-heart', 'fa fa-heart'),
(6, 'fa fa-star', 'fa fa-star'),
(7, 'fa fa-star-o', 'fa fa-star-o'),
(8, 'fa fa-user', 'fa fa-user'),
(9, 'fa fa-film', 'fa fa-film'),
(10, 'fa fa-th-large', 'fa fa-th-large'),
(11, 'fa fa-th', 'fa fa-th'),
(12, 'fa fa-th-list', 'fa fa-th-list'),
(13, 'fa fa-check', 'fa fa-check'),
(14, 'fa fa-times', 'fa fa-times'),
(15, 'fa fa-search-plus', 'fa fa-search-plus'),
(16, 'fa fa-search-minus', 'fa fa-search-minus'),
(17, 'fa fa-power-off', 'fa fa-power-off'),
(18, 'fa fa-signal', 'fa fa-signal'),
(19, 'fa fa-cog', 'fa fa-cog'),
(20, 'fa fa-trash-o', 'fa fa-trash-o'),
(21, 'fa fa-home', 'fa fa-home'),
(22, 'fa fa-file-o', 'fa fa-file-o'),
(23, 'fa fa-clock-o', 'fa fa-clock-o'),
(24, 'fa fa-road', 'fa fa-road'),
(25, 'fa fa-download', 'fa fa-download'),
(26, 'fa fa-arrow-circle-o-down', 'fa fa-arrow-circle-o-down'),
(27, 'fa fa-arrow-circle-o-up', 'fa fa-arrow-circle-o-up'),
(28, 'fa fa-inbox', 'fa fa-inbox'),
(29, 'fa fa-play-circle-o', 'fa fa-play-circle-o'),
(30, 'fa fa-repeat', 'fa fa-repeat'),
(31, 'fa fa-refresh', 'fa fa-refresh'),
(32, 'fa fa-list-alt', 'fa fa-list-alt'),
(33, 'fa fa-lock', 'fa fa-lock'),
(34, 'fa fa-flag', 'fa fa-flag'),
(35, 'fa fa-headphones', 'fa fa-headphones'),
(36, 'fa fa-volume-off', 'fa fa-volume-off'),
(37, 'fa fa-volume-down', 'fa fa-volume-down'),
(38, 'fa fa-volume-up', 'fa fa-volume-up'),
(39, 'fa fa-qrcode', 'fa fa-qrcode'),
(40, 'fa fa-barcode', 'fa fa-barcode'),
(41, 'fa fa-tag', 'fa fa-tag'),
(42, 'fa fa-tags', 'fa fa-tags'),
(43, 'fa fa-book', 'fa fa-book'),
(44, 'fa fa-bookmark', 'fa fa-bookmark'),
(45, 'fa fa-print', 'fa fa-print'),
(46, 'fa fa-camera', 'fa fa-camera'),
(47, 'fa fa-font', 'fa fa-font'),
(48, 'fa fa-bold', 'fa fa-bold'),
(49, 'fa fa-italic', 'fa fa-italic'),
(50, 'fa fa-text-height', 'fa fa-text-height'),
(51, 'fa fa-text-width', 'fa fa-text-width'),
(52, 'fa fa-align-left', 'fa fa-align-left'),
(53, 'fa fa-align-center', 'fa fa-align-center'),
(54, 'fa fa-align-right', 'fa fa-align-right'),
(55, 'fa fa-align-justify', 'fa fa-align-justify'),
(56, 'fa fa-list', 'fa fa-list'),
(57, 'fa fa-outdent', 'fa fa-outdent'),
(58, 'fa fa-indent', 'fa fa-indent'),
(59, 'fa fa-video-camera', 'fa fa-video-camera'),
(60, 'fa fa-picture-o', 'fa fa-picture-o'),
(61, 'fa fa-pencil', 'fa fa-pencil'),
(62, 'fa fa-map-marker', 'fa fa-map-marker'),
(63, 'fa fa-adjust', 'fa fa-adjust'),
(64, 'fa fa-tint', 'fa fa-tint'),
(65, 'fa fa-pencil-square-o', 'fa fa-pencil-square-o'),
(66, 'fa fa-share-square-o', 'fa fa-share-square-o'),
(67, 'fa fa-check-square-o', 'fa fa-check-square-o'),
(68, 'fa fa-arrows', 'fa fa-arrows'),
(69, 'fa fa-step-backward', 'fa fa-step-backward'),
(70, 'fa fa-fast-backward', 'fa fa-fast-backward'),
(71, 'fa fa-backward', 'fa fa-backward'),
(72, 'fa fa-play', 'fa fa-play'),
(73, 'fa fa-pause', 'fa fa-pause'),
(74, 'fa fa-stop', 'fa fa-stop'),
(75, 'fa fa-forward', 'fa fa-forward'),
(76, 'fa fa-fast-forward', 'fa fa-fast-forward'),
(77, 'fa fa-step-forward', 'fa fa-step-forward'),
(78, 'fa fa-eject', 'fa fa-eject'),
(79, 'fa fa-chevron-left', 'fa fa-chevron-left'),
(80, 'fa fa-chevron-right', 'fa fa-chevron-right'),
(81, 'fa fa-plus-circle', 'fa fa-plus-circle'),
(82, 'fa fa-minus-circle', 'fa fa-minus-circle'),
(83, 'fa fa-times-circle', 'fa fa-times-circle'),
(84, 'fa fa-check-circle', 'fa fa-check-circle'),
(85, 'fa fa-question-circle', 'fa fa-question-circle'),
(86, 'fa fa-info-circle', 'fa fa-info-circle'),
(87, 'fa fa-crosshairs', 'fa fa-crosshairs'),
(88, 'fa fa-times-circle-o', 'fa fa-times-circle-o'),
(89, 'fa fa-check-circle-o', 'fa fa-check-circle-o'),
(90, 'fa fa-ban', 'fa fa-ban'),
(91, 'fa fa-arrow-left', 'fa fa-arrow-left'),
(92, 'fa fa-arrow-right', 'fa fa-arrow-right'),
(93, 'fa fa-arrow-up', 'fa fa-arrow-up'),
(94, 'fa fa-arrow-down', 'fa fa-arrow-down'),
(95, 'fa fa-share', 'fa fa-share'),
(96, 'fa fa-expand', 'fa fa-expand'),
(97, 'fa fa-compress', 'fa fa-compress'),
(98, 'fa fa-plus', 'fa fa-plus'),
(99, 'fa fa-minus', 'fa fa-minus'),
(100, 'fa fa-asterisk', 'fa fa-asterisk'),
(101, 'fa fa-exclamation-circle', 'fa fa-exclamation-circle'),
(102, 'fa fa-gift', 'fa fa-gift'),
(103, 'fa fa-leaf', 'fa fa-leaf'),
(104, 'fa fa-fire', 'fa fa-fire'),
(105, 'fa fa-eye', 'fa fa-eye'),
(106, 'fa fa-eye-slash', 'fa fa-eye-slash'),
(107, 'fa fa-exclamation-triangle', 'fa fa-exclamation-triangle'),
(108, 'fa fa-plane', 'fa fa-plane'),
(109, 'fa fa-calendar', 'fa fa-calendar'),
(110, 'fa fa-random', 'fa fa-random'),
(111, 'fa fa-comment', 'fa fa-comment'),
(112, 'fa fa-magnet', 'fa fa-magnet'),
(113, 'fa fa-chevron-up', 'fa fa-chevron-up'),
(114, 'fa fa-chevron-down', 'fa fa-chevron-down'),
(115, 'fa fa-retweet', 'fa fa-retweet'),
(116, 'fa fa-shopping-cart', 'fa fa-shopping-cart'),
(117, 'fa fa-folder', 'fa fa-folder'),
(118, 'fa fa-folder-open', 'fa fa-folder-open'),
(119, 'fa fa-arrows-v', 'fa fa-arrows-v'),
(120, 'fa fa-arrows-h', 'fa fa-arrows-h'),
(121, 'fa fa-bar-chart', 'fa fa-bar-chart'),
(122, 'fa fa-twitter-square', 'fa fa-twitter-square'),
(123, 'fa fa-facebook-square', 'fa fa-facebook-square'),
(124, 'fa fa-camera-retro', 'fa fa-camera-retro'),
(125, 'fa fa-key', 'fa fa-key'),
(126, 'fa fa-cogs', 'fa fa-cogs'),
(127, 'fa fa-comments', 'fa fa-comments'),
(128, 'fa fa-thumbs-o-up', 'fa fa-thumbs-o-up'),
(129, 'fa fa-thumbs-o-down', 'fa fa-thumbs-o-down'),
(130, 'fa fa-star-half', 'fa fa-star-half'),
(131, 'fa fa-heart-o', 'fa fa-heart-o'),
(132, 'fa fa-sign-out', 'fa fa-sign-out'),
(133, 'fa fa-linkedin-square', 'fa fa-linkedin-square'),
(134, 'fa fa-thumb-tack', 'fa fa-thumb-tack'),
(135, 'fa fa-external-link', 'fa fa-external-link'),
(136, 'fa fa-sign-in', 'fa fa-sign-in'),
(137, 'fa fa-trophy', 'fa fa-trophy'),
(138, 'fa fa-github-square', 'fa fa-github-square'),
(139, 'fa fa-upload', 'fa fa-upload'),
(140, 'fa fa-lemon-o', 'fa fa-lemon-o'),
(141, 'fa fa-phone', 'fa fa-phone'),
(142, 'fa fa-square-o', 'fa fa-square-o'),
(143, 'fa fa-bookmark-o', 'fa fa-bookmark-o'),
(144, 'fa fa-phone-square', 'fa fa-phone-square'),
(145, 'fa fa-twitter', 'fa fa-twitter'),
(146, 'fa fa-facebook', 'fa fa-facebook'),
(147, 'fa fa-github', 'fa fa-github'),
(148, 'fa fa-unlock', 'fa fa-unlock'),
(149, 'fa fa-credit-card', 'fa fa-credit-card'),
(150, 'fa fa-rss', 'fa fa-rss'),
(151, 'fa fa-hdd-o', 'fa fa-hdd-o'),
(152, 'fa fa-bullhorn', 'fa fa-bullhorn'),
(153, 'fa fa-bell', 'fa fa-bell'),
(154, 'fa fa-certificate', 'fa fa-certificate'),
(155, 'fa fa-hand-o-right', 'fa fa-hand-o-right'),
(156, 'fa fa-hand-o-left', 'fa fa-hand-o-left'),
(157, 'fa fa-hand-o-up', 'fa fa-hand-o-up'),
(158, 'fa fa-hand-o-down', 'fa fa-hand-o-down'),
(159, 'fa fa-arrow-circle-left', 'fa fa-arrow-circle-left'),
(160, 'fa fa-arrow-circle-right', 'fa fa-arrow-circle-right'),
(161, 'fa fa-arrow-circle-up', 'fa fa-arrow-circle-up'),
(162, 'fa fa-arrow-circle-down', 'fa fa-arrow-circle-down'),
(163, 'fa fa-globe', 'fa fa-globe'),
(164, 'fa fa-wrench', 'fa fa-wrench'),
(165, 'fa fa-tasks', 'fa fa-tasks'),
(166, 'fa fa-filter', 'fa fa-filter'),
(167, 'fa fa-briefcase', 'fa fa-briefcase'),
(168, 'fa fa-arrows-alt', 'fa fa-arrows-alt'),
(169, 'fa fa-users', 'fa fa-users'),
(170, 'fa fa-link', 'fa fa-link'),
(171, 'fa fa-cloud', 'fa fa-cloud'),
(172, 'fa fa-flask', 'fa fa-flask'),
(173, 'fa fa-scissors', 'fa fa-scissors'),
(174, 'fa fa-files-o', 'fa fa-files-o'),
(175, 'fa fa-paperclip', 'fa fa-paperclip'),
(176, 'fa fa-floppy-o', 'fa fa-floppy-o'),
(177, 'fa fa-square', 'fa fa-square'),
(178, 'fa fa-bars', 'fa fa-bars'),
(179, 'fa fa-list-ul', 'fa fa-list-ul'),
(180, 'fa fa-list-ol', 'fa fa-list-ol'),
(181, 'fa fa-strikethrough', 'fa fa-strikethrough'),
(182, 'fa fa-underline', 'fa fa-underline'),
(183, 'fa fa-table', 'fa fa-table'),
(184, 'fa fa-magic', 'fa fa-magic'),
(185, 'fa fa-truck', 'fa fa-truck'),
(186, 'fa fa-pinterest', 'fa fa-pinterest'),
(187, 'fa fa-pinterest-square', 'fa fa-pinterest-square'),
(188, 'fa fa-google-plus-square', 'fa fa-google-plus-square'),
(189, 'fa fa-google-plus', 'fa fa-google-plus'),
(190, 'fa fa-money', 'fa fa-money'),
(191, 'fa fa-caret-down', 'fa fa-caret-down'),
(192, 'fa fa-caret-up', 'fa fa-caret-up'),
(193, 'fa fa-caret-left', 'fa fa-caret-left'),
(194, 'fa fa-caret-right', 'fa fa-caret-right'),
(195, 'fa fa-columns', 'fa fa-columns'),
(196, 'fa fa-sort', 'fa fa-sort'),
(197, 'fa fa-sort-desc', 'fa fa-sort-desc'),
(198, 'fa fa-sort-asc', 'fa fa-sort-asc'),
(199, 'fa fa-envelope', 'fa fa-envelope'),
(200, 'fa fa-linkedin', 'fa fa-linkedin'),
(201, 'fa fa-undo', 'fa fa-undo'),
(202, 'fa fa-gavel', 'fa fa-gavel'),
(203, 'fa fa-tachometer', 'fa fa-tachometer'),
(204, 'fa fa-comment-o', 'fa fa-comment-o'),
(205, 'fa fa-comments-o', 'fa fa-comments-o'),
(206, 'fa fa-bolt', 'fa fa-bolt'),
(207, 'fa fa-sitemap', 'fa fa-sitemap'),
(208, 'fa fa-umbrella', 'fa fa-umbrella'),
(209, 'fa fa-clipboard', 'fa fa-clipboard'),
(210, 'fa fa-lightbulb-o', 'fa fa-lightbulb-o'),
(211, 'fa fa-exchange', 'fa fa-exchange'),
(212, 'fa fa-cloud-download', 'fa fa-cloud-download'),
(213, 'fa fa-cloud-upload', 'fa fa-cloud-upload'),
(214, 'fa fa-user-md', 'fa fa-user-md'),
(215, 'fa fa-stethoscope', 'fa fa-stethoscope'),
(216, 'fa fa-suitcase', 'fa fa-suitcase'),
(217, 'fa fa-bell-o', 'fa fa-bell-o'),
(218, 'fa fa-coffee', 'fa fa-coffee'),
(219, 'fa fa-cutlery', 'fa fa-cutlery'),
(220, 'fa fa-file-text-o', 'fa fa-file-text-o'),
(221, 'fa fa-building-o', 'fa fa-building-o'),
(222, 'fa fa-hospital-o', 'fa fa-hospital-o'),
(223, 'fa fa-ambulance', 'fa fa-ambulance'),
(224, 'fa fa-medkit', 'fa fa-medkit'),
(225, 'fa fa-fighter-jet', 'fa fa-fighter-jet'),
(226, 'fa fa-beer', 'fa fa-beer'),
(227, 'fa fa-h-square', 'fa fa-h-square'),
(228, 'fa fa-plus-square', 'fa fa-plus-square'),
(229, 'fa fa-angle-double-left', 'fa fa-angle-double-left'),
(230, 'fa fa-angle-double-right', 'fa fa-angle-double-right'),
(231, 'fa fa-angle-double-up', 'fa fa-angle-double-up'),
(232, 'fa fa-angle-double-down', 'fa fa-angle-double-down'),
(233, 'fa fa-angle-left', 'fa fa-angle-left'),
(234, 'fa fa-angle-right', 'fa fa-angle-right'),
(235, 'fa fa-angle-up', 'fa fa-angle-up'),
(236, 'fa fa-angle-down', 'fa fa-angle-down'),
(237, 'fa fa-desktop', 'fa fa-desktop'),
(238, 'fa fa-laptop', 'fa fa-laptop'),
(239, 'fa fa-tablet', 'fa fa-tablet'),
(240, 'fa fa-mobile', 'fa fa-mobile'),
(241, 'fa fa-circle-o', 'fa fa-circle-o'),
(242, 'fa fa-quote-left', 'fa fa-quote-left'),
(243, 'fa fa-quote-right', 'fa fa-quote-right'),
(244, 'fa fa-spinner', 'fa fa-spinner'),
(245, 'fa fa-circle', 'fa fa-circle'),
(246, 'fa fa-reply', 'fa fa-reply'),
(247, 'fa fa-github-alt', 'fa fa-github-alt'),
(248, 'fa fa-folder-o', 'fa fa-folder-o'),
(249, 'fa fa-folder-open-o', 'fa fa-folder-open-o'),
(250, 'fa fa-smile-o', 'fa fa-smile-o'),
(251, 'fa fa-frown-o', 'fa fa-frown-o'),
(252, 'fa fa-meh-o', 'fa fa-meh-o'),
(253, 'fa fa-gamepad', 'fa fa-gamepad'),
(254, 'fa fa-keyboard-o', 'fa fa-keyboard-o'),
(255, 'fa fa-flag-o', 'fa fa-flag-o'),
(256, 'fa fa-flag-checkered', 'fa fa-flag-checkered'),
(257, 'fa fa-terminal', 'fa fa-terminal'),
(258, 'fa fa-code', 'fa fa-code'),
(259, 'fa fa-reply-all', 'fa fa-reply-all'),
(260, 'fa fa-star-half-o', 'fa fa-star-half-o'),
(261, 'fa fa-location-arrow', 'fa fa-location-arrow'),
(262, 'fa fa-crop', 'fa fa-crop'),
(263, 'fa fa-code-fork', 'fa fa-code-fork'),
(264, 'fa fa-chain-broken', 'fa fa-chain-broken'),
(265, 'fa fa-question', 'fa fa-question'),
(266, 'fa fa-info', 'fa fa-info'),
(267, 'fa fa-exclamation', 'fa fa-exclamation'),
(268, 'fa fa-superscript', 'fa fa-superscript'),
(269, 'fa fa-subscript', 'fa fa-subscript'),
(270, 'fa fa-eraser', 'fa fa-eraser'),
(271, 'fa fa-puzzle-piece', 'fa fa-puzzle-piece'),
(272, 'fa fa-microphone', 'fa fa-microphone'),
(273, 'fa fa-microphone-slash', 'fa fa-microphone-slash'),
(274, 'fa fa-shield', 'fa fa-shield'),
(275, 'fa fa-calendar-o', 'fa fa-calendar-o'),
(276, 'fa fa-fire-extinguisher', 'fa fa-fire-extinguisher'),
(277, 'fa fa-rocket', 'fa fa-rocket'),
(278, 'fa fa-maxcdn', 'fa fa-maxcdn'),
(279, 'fa fa-chevron-circle-left', 'fa fa-chevron-circle-left'),
(280, 'fa fa-chevron-circle-right', 'fa fa-chevron-circle-right'),
(281, 'fa fa-chevron-circle-up', 'fa fa-chevron-circle-up'),
(282, 'fa fa-chevron-circle-down', 'fa fa-chevron-circle-down'),
(283, 'fa fa-html5', 'fa fa-html5'),
(284, 'fa fa-css3', 'fa fa-css3'),
(285, 'fa fa-anchor', 'fa fa-anchor'),
(286, 'fa fa-unlock-alt', 'fa fa-unlock-alt'),
(287, 'fa fa-bullseye', 'fa fa-bullseye'),
(288, 'fa fa-ellipsis-h', 'fa fa-ellipsis-h'),
(289, 'fa fa-ellipsis-v', 'fa fa-ellipsis-v'),
(290, 'fa fa-rss-square', 'fa fa-rss-square'),
(291, 'fa fa-play-circle', 'fa fa-play-circle'),
(292, 'fa fa-ticket', 'fa fa-ticket'),
(293, 'fa fa-minus-square', 'fa fa-minus-square'),
(294, 'fa fa-minus-square-o', 'fa fa-minus-square-o'),
(295, 'fa fa-level-up', 'fa fa-level-up'),
(296, 'fa fa-level-down', 'fa fa-level-down'),
(297, 'fa fa-check-square', 'fa fa-check-square'),
(298, 'fa fa-pencil-square', 'fa fa-pencil-square'),
(299, 'fa fa-external-link-square', 'fa fa-external-link-square'),
(300, 'fa fa-share-square', 'fa fa-share-square'),
(301, 'fa fa-compass', 'fa fa-compass'),
(302, 'fa fa-caret-square-o-down', 'fa fa-caret-square-o-down'),
(303, 'fa fa-caret-square-o-up', 'fa fa-caret-square-o-up'),
(304, 'fa fa-caret-square-o-right', 'fa fa-caret-square-o-right'),
(305, 'fa fa-eur', 'fa fa-eur'),
(306, 'fa fa-gbp', 'fa fa-gbp'),
(307, 'fa fa-usd', 'fa fa-usd'),
(308, 'fa fa-inr', 'fa fa-inr'),
(309, 'fa fa-jpy', 'fa fa-jpy'),
(310, 'fa fa-rub', 'fa fa-rub'),
(311, 'fa fa-krw', 'fa fa-krw'),
(312, 'fa fa-btc', 'fa fa-btc'),
(313, 'fa fa-file', 'fa fa-file'),
(314, 'fa fa-file-text', 'fa fa-file-text'),
(315, 'fa fa-sort-alpha-asc', 'fa fa-sort-alpha-asc'),
(316, 'fa fa-sort-alpha-desc', 'fa fa-sort-alpha-desc'),
(317, 'fa fa-sort-amount-asc', 'fa fa-sort-amount-asc'),
(318, 'fa fa-sort-amount-desc', 'fa fa-sort-amount-desc'),
(319, 'fa fa-sort-numeric-asc', 'fa fa-sort-numeric-asc'),
(320, 'fa fa-sort-numeric-desc', 'fa fa-sort-numeric-desc'),
(321, 'fa fa-thumbs-up', 'fa fa-thumbs-up'),
(322, 'fa fa-thumbs-down', 'fa fa-thumbs-down'),
(323, 'fa fa-youtube-square', 'fa fa-youtube-square'),
(324, 'fa fa-youtube', 'fa fa-youtube'),
(325, 'fa fa-xing', 'fa fa-xing'),
(326, 'fa fa-xing-square', 'fa fa-xing-square'),
(327, 'fa fa-youtube-play', 'fa fa-youtube-play'),
(328, 'fa fa-dropbox', 'fa fa-dropbox'),
(329, 'fa fa-stack-overflow', 'fa fa-stack-overflow'),
(330, 'fa fa-instagram', 'fa fa-instagram'),
(331, 'fa fa-flickr', 'fa fa-flickr'),
(332, 'fa fa-adn', 'fa fa-adn'),
(333, 'fa fa-bitbucket', 'fa fa-bitbucket'),
(334, 'fa fa-bitbucket-square', 'fa fa-bitbucket-square'),
(335, 'fa fa-tumblr', 'fa fa-tumblr'),
(336, 'fa fa-tumblr-square', 'fa fa-tumblr-square'),
(337, 'fa fa-long-arrow-down', 'fa fa-long-arrow-down'),
(338, 'fa fa-long-arrow-up', 'fa fa-long-arrow-up'),
(339, 'fa fa-long-arrow-left', 'fa fa-long-arrow-left'),
(340, 'fa fa-long-arrow-right', 'fa fa-long-arrow-right'),
(341, 'fa fa-apple', 'fa fa-apple'),
(342, 'fa fa-windows', 'fa fa-windows'),
(343, 'fa fa-android', 'fa fa-android'),
(344, 'fa fa-linux', 'fa fa-linux'),
(345, 'fa fa-dribbble', 'fa fa-dribbble'),
(346, 'fa fa-skype', 'fa fa-skype'),
(347, 'fa fa-foursquare', 'fa fa-foursquare'),
(348, 'fa fa-trello', 'fa fa-trello'),
(349, 'fa fa-female', 'fa fa-female'),
(350, 'fa fa-male', 'fa fa-male'),
(351, 'fa fa-gittip', 'fa fa-gittip'),
(352, 'fa fa-sun-o', 'fa fa-sun-o'),
(353, 'fa fa-moon-o', 'fa fa-moon-o'),
(354, 'fa fa-archive', 'fa fa-archive'),
(355, 'fa fa-bug', 'fa fa-bug'),
(356, 'fa fa-vk', 'fa fa-vk'),
(357, 'fa fa-weibo', 'fa fa-weibo'),
(358, 'fa fa-renren', 'fa fa-renren'),
(359, 'fa fa-pagelines', 'fa fa-pagelines'),
(360, 'fa fa-stack-exchange', 'fa fa-stack-exchange'),
(361, 'fa fa-arrow-circle-o-right', 'fa fa-arrow-circle-o-right'),
(362, 'fa fa-arrow-circle-o-left', 'fa fa-arrow-circle-o-left'),
(363, 'fa fa-caret-square-o-left', 'fa fa-caret-square-o-left'),
(364, 'fa fa-dot-circle-o', 'fa fa-dot-circle-o'),
(365, 'fa fa-wheelchair', 'fa fa-wheelchair'),
(366, 'fa fa-vimeo-square', 'fa fa-vimeo-square'),
(367, 'fa fa-try', 'fa fa-try'),
(368, 'fa fa-plus-square-o', 'fa fa-plus-square-o'),
(369, 'fa fa-space-shuttle', 'fa fa-space-shuttle'),
(370, 'fa fa-slack', 'fa fa-slack'),
(371, 'fa fa-envelope-square', 'fa fa-envelope-square'),
(372, 'fa fa-wordpress', 'fa fa-wordpress'),
(373, 'fa fa-openid', 'fa fa-openid'),
(374, 'fa fa-university', 'fa fa-university'),
(375, 'fa fa-graduation-cap', 'fa fa-graduation-cap'),
(376, 'fa fa-yahoo', 'fa fa-yahoo'),
(377, 'fa fa-google', 'fa fa-google'),
(378, 'fa fa-reddit', 'fa fa-reddit'),
(379, 'fa fa-reddit-square', 'fa fa-reddit-square'),
(380, 'fa fa-stumbleupon-circle', 'fa fa-stumbleupon-circle'),
(381, 'fa fa-stumbleupon', 'fa fa-stumbleupon'),
(382, 'fa fa-delicious', 'fa fa-delicious'),
(383, 'fa fa-digg', 'fa fa-digg'),
(384, 'fa fa-pied-piper', 'fa fa-pied-piper'),
(385, 'fa fa-pied-piper-alt', 'fa fa-pied-piper-alt'),
(386, 'fa fa-drupal', 'fa fa-drupal'),
(387, 'fa fa-joomla', 'fa fa-joomla'),
(388, 'fa fa-language', 'fa fa-language'),
(389, 'fa fa-fax', 'fa fa-fax'),
(390, 'fa fa-building', 'fa fa-building'),
(391, 'fa fa-child', 'fa fa-child'),
(392, 'fa fa-paw', 'fa fa-paw'),
(393, 'fa fa-spoon', 'fa fa-spoon'),
(394, 'fa fa-cube', 'fa fa-cube'),
(395, 'fa fa-cubes', 'fa fa-cubes'),
(396, 'fa fa-behance', 'fa fa-behance'),
(397, 'fa fa-behance-square', 'fa fa-behance-square'),
(398, 'fa fa-steam', 'fa fa-steam'),
(399, 'fa fa-steam-square', 'fa fa-steam-square'),
(400, 'fa fa-recycle', 'fa fa-recycle'),
(401, 'fa fa-car', 'fa fa-car'),
(402, 'fa fa-taxi', 'fa fa-taxi'),
(403, 'fa fa-tree', 'fa fa-tree'),
(404, 'fa fa-spotify', 'fa fa-spotify'),
(405, 'fa fa-deviantart', 'fa fa-deviantart'),
(406, 'fa fa-soundcloud', 'fa fa-soundcloud'),
(407, 'fa fa-database', 'fa fa-database'),
(408, 'fa fa-file-pdf-o', 'fa fa-file-pdf-o'),
(409, 'fa fa-file-word-o', 'fa fa-file-word-o'),
(410, 'fa fa-file-excel-o', 'fa fa-file-excel-o'),
(411, 'fa fa-file-powerpoint-o', 'fa fa-file-powerpoint-o'),
(412, 'fa fa-file-image-o', 'fa fa-file-image-o'),
(413, 'fa fa-file-archive-o', 'fa fa-file-archive-o'),
(414, 'fa fa-file-audio-o', 'fa fa-file-audio-o'),
(415, 'fa fa-file-video-o', 'fa fa-file-video-o'),
(416, 'fa fa-file-code-o', 'fa fa-file-code-o'),
(417, 'fa fa-vine', 'fa fa-vine'),
(418, 'fa fa-codepen', 'fa fa-codepen'),
(419, 'fa fa-jsfiddle', 'fa fa-jsfiddle'),
(420, 'fa fa-life-ring', 'fa fa-life-ring'),
(421, 'fa fa-circle-o-notch', 'fa fa-circle-o-notch'),
(422, 'fa fa-rebel', 'fa fa-rebel'),
(423, 'fa fa-empire', 'fa fa-empire'),
(424, 'fa fa-git-square', 'fa fa-git-square'),
(425, 'fa fa-git', 'fa fa-git'),
(426, 'fa fa-hacker-news', 'fa fa-hacker-news'),
(427, 'fa fa-tencent-weibo', 'fa fa-tencent-weibo'),
(428, 'fa fa-qq', 'fa fa-qq'),
(429, 'fa fa-weixin', 'fa fa-weixin'),
(430, 'fa fa-paper-plane', 'fa fa-paper-plane'),
(431, 'fa fa-paper-plane-o', 'fa fa-paper-plane-o'),
(432, 'fa fa-history', 'fa fa-history'),
(433, 'fa fa-circle-thin', 'fa fa-circle-thin'),
(434, 'fa fa-header', 'fa fa-header'),
(435, 'fa fa-paragraph', 'fa fa-paragraph'),
(436, 'fa fa-sliders', 'fa fa-sliders'),
(437, 'fa fa-share-alt', 'fa fa-share-alt'),
(438, 'fa fa-share-alt-square', 'fa fa-share-alt-square'),
(439, 'fa fa-bomb', 'fa fa-bomb'),
(440, 'fa fa-futbol-o', 'fa fa-futbol-o'),
(441, 'fa fa-tty', 'fa fa-tty'),
(442, 'fa fa-binoculars', 'fa fa-binoculars'),
(443, 'fa fa-plug', 'fa fa-plug'),
(444, 'fa fa-slideshare', 'fa fa-slideshare'),
(445, 'fa fa-twitch', 'fa fa-twitch'),
(446, 'fa fa-yelp', 'fa fa-yelp'),
(447, 'fa fa-newspaper-o', 'fa fa-newspaper-o'),
(448, 'fa fa-wifi', 'fa fa-wifi'),
(449, 'fa fa-calculator', 'fa fa-calculator'),
(450, 'fa fa-paypal', 'fa fa-paypal'),
(451, 'fa fa-google-wallet', 'fa fa-google-wallet'),
(452, 'fa fa-cc-visa', 'fa fa-cc-visa'),
(453, 'fa fa-cc-mastercard', 'fa fa-cc-mastercard'),
(454, 'fa fa-cc-discover', 'fa fa-cc-discover'),
(455, 'fa fa-cc-amex', 'fa fa-cc-amex'),
(456, 'fa fa-cc-paypal', 'fa fa-cc-paypal'),
(457, 'fa fa-cc-stripe', 'fa fa-cc-stripe'),
(458, 'fa fa-bell-slash', 'fa fa-bell-slash'),
(459, 'fa fa-bell-slash-o', 'fa fa-bell-slash-o'),
(460, 'fa fa-trash', 'fa fa-trash'),
(461, 'fa fa-copyright', 'fa fa-copyright'),
(462, 'fa fa-at', 'fa fa-at'),
(463, 'fa fa-eyedropper', 'fa fa-eyedropper'),
(464, 'fa fa-paint-brush', 'fa fa-paint-brush'),
(465, 'fa fa-birthday-cake', 'fa fa-birthday-cake'),
(466, 'fa fa-area-chart', 'fa fa-area-chart'),
(467, 'fa fa-pie-chart', 'fa fa-pie-chart'),
(468, 'fa fa-line-chart', 'fa fa-line-chart'),
(469, 'fa fa-lastfm', 'fa fa-lastfm'),
(470, 'fa fa-lastfm-square', 'fa fa-lastfm-square'),
(471, 'fa fa-toggle-off', 'fa fa-toggle-off'),
(472, 'fa fa-toggle-on', 'fa fa-toggle-on'),
(473, 'fa fa-bicycle', 'fa fa-bicycle'),
(474, 'fa fa-bus', 'fa fa-bus'),
(475, 'fa fa-ioxhost', 'fa fa-ioxhost'),
(476, 'fa fa-angellist', 'fa fa-angellist'),
(477, 'fa fa-cc', 'fa fa-cc'),
(478, 'fa fa-ils', 'fa fa-ils'),
(479, 'fa fa-meanpath', 'fa fa-meanpath');

-- --------------------------------------------------------

--
-- Table structure for table `system_settings`
--

CREATE TABLE `system_settings` (
  `id` int(11) NOT NULL,
  `nama` varchar(32) NOT NULL,
  `logo` varchar(12) NOT NULL,
  `footer_left` varchar(32) DEFAULT NULL,
  `footer_right` varchar(12) DEFAULT NULL,
  `icon` varchar(32) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `system_settings`
--

INSERT INTO `system_settings` (`id`, `nama`, `logo`, `footer_left`, `footer_right`, `icon`) VALUES
(1, 'BANARAN AUTO <br/> SERVICE', 'User.jpg', 'CreatedBy Suryaism', '2023', 'bas.png');

-- --------------------------------------------------------

--
-- Table structure for table `user`
--

CREATE TABLE `user` (
  `id_user` int(11) NOT NULL,
  `username` varchar(12) NOT NULL,
  `password` varchar(32) NOT NULL,
  `id_role` int(11) NOT NULL,
  `is_active` int(11) NOT NULL DEFAULT 0
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user`
--

INSERT INTO `user` (`id_user`, `username`, `password`, `id_role`, `is_active`) VALUES
(1, 'admin', 'c93ccd78b2076528346216b3b2f701e6', 1, 1),
(2, 'admin1', '21232f297a57a5a743894a0e4a801fc3', 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `user_access`
--

CREATE TABLE `user_access` (
  `id` int(11) NOT NULL,
  `id_role` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_access`
--

INSERT INTO `user_access` (`id`, `id_role`, `id_menu`) VALUES
(1, 1, 99),
(2, 1, 1),
(3, 1, 103),
(4, 2, 1),
(5, 2, 103),
(6, 1, 105),
(7, 2, 105);

-- --------------------------------------------------------

--
-- Table structure for table `user_menu`
--

CREATE TABLE `user_menu` (
  `id_menu` int(11) NOT NULL,
  `title` varchar(32) NOT NULL,
  `icon` varchar(32) NOT NULL,
  `url` varchar(255) DEFAULT NULL,
  `is_active` int(11) NOT NULL DEFAULT 1,
  `no_order` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_menu`
--

INSERT INTO `user_menu` (`id_menu`, `title`, `icon`, `url`, `is_active`, `no_order`) VALUES
(1, 'Dashboard', 'fa fa-list', 'dashboard', 1, 1),
(99, 'Super Admin', 'fa fa-list', NULL, 1, 0),
(103, 'Member', 'fa fa-user', 'member', 1, 3),
(105, 'Services', 'fa fa-pencil', 'services', 1, 4);

-- --------------------------------------------------------

--
-- Table structure for table `user_role`
--

CREATE TABLE `user_role` (
  `id_role` int(11) NOT NULL,
  `role` varchar(12) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_role`
--

INSERT INTO `user_role` (`id_role`, `role`) VALUES
(1, 'Super Admin'),
(2, 'Admin');

-- --------------------------------------------------------

--
-- Table structure for table `user_submenu`
--

CREATE TABLE `user_submenu` (
  `id_submenu` int(11) NOT NULL,
  `id_menu` int(11) NOT NULL,
  `no_urut` int(11) NOT NULL,
  `is_active` int(11) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  `icon` varchar(255) DEFAULT NULL,
  `title` varchar(255) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;

--
-- Dumping data for table `user_submenu`
--

INSERT INTO `user_submenu` (`id_submenu`, `id_menu`, `no_urut`, `is_active`, `url`, `icon`, `title`) VALUES
(1, 99, 1, 1, 'user', 'fa fa-database', 'Manage Account'),
(4, 99, 4, 1, 'menu', 'fa fa-database', 'Manage Menu'),
(5, 99, 2, 1, 'role', 'fa fa-database', 'Manage Role'),
(6, 99, 3, 1, 'access', 'fa fa-database', 'Manage User Access');

--
-- Indexes for dumped tables
--

--
-- Indexes for table `member`
--
ALTER TABLE `member`
  ADD PRIMARY KEY (`id_member`);

--
-- Indexes for table `services`
--
ALTER TABLE `services`
  ADD PRIMARY KEY (`id_service`);

--
-- Indexes for table `service_detail`
--
ALTER TABLE `service_detail`
  ADD PRIMARY KEY (`id_service_detail`);

--
-- Indexes for table `system_icon`
--
ALTER TABLE `system_icon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `system_settings`
--
ALTER TABLE `system_settings`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user`
--
ALTER TABLE `user`
  ADD PRIMARY KEY (`id_user`);

--
-- Indexes for table `user_access`
--
ALTER TABLE `user_access`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `user_menu`
--
ALTER TABLE `user_menu`
  ADD PRIMARY KEY (`id_menu`);

--
-- Indexes for table `user_role`
--
ALTER TABLE `user_role`
  ADD PRIMARY KEY (`id_role`);

--
-- Indexes for table `user_submenu`
--
ALTER TABLE `user_submenu`
  ADD PRIMARY KEY (`id_submenu`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `member`
--
ALTER TABLE `member`
  MODIFY `id_member` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=7;

--
-- AUTO_INCREMENT for table `services`
--
ALTER TABLE `services`
  MODIFY `id_service` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=9;

--
-- AUTO_INCREMENT for table `service_detail`
--
ALTER TABLE `service_detail`
  MODIFY `id_service_detail` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `system_icon`
--
ALTER TABLE `system_icon`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=480;

--
-- AUTO_INCREMENT for table `user`
--
ALTER TABLE `user`
  MODIFY `id_user` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_access`
--
ALTER TABLE `user_access`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;

--
-- AUTO_INCREMENT for table `user_menu`
--
ALTER TABLE `user_menu`
  MODIFY `id_menu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=106;

--
-- AUTO_INCREMENT for table `user_role`
--
ALTER TABLE `user_role`
  MODIFY `id_role` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `user_submenu`
--
ALTER TABLE `user_submenu`
  MODIFY `id_submenu` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
