/*
 Navicat Premium Data Transfer

 Source Server         : localsaya
 Source Server Type    : MySQL
 Source Server Version : 80030 (8.0.30)
 Source Host           : localhost:3306
 Source Schema         : bengkel

 Target Server Type    : MySQL
 Target Server Version : 80030 (8.0.30)
 File Encoding         : 65001

 Date: 31/08/2023 09:49:54
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for barang_masuk
-- ----------------------------
DROP TABLE IF EXISTS `barang_masuk`;
CREATE TABLE `barang_masuk`  (
  `id_barangmasuk` int NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NULL DEFAULT NULL,
  `id_barang` int NULL DEFAULT NULL,
  `kode_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `jumlah_barang` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_barangmasuk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of barang_masuk
-- ----------------------------
INSERT INTO `barang_masuk` VALUES (1, '2023-08-24 07:00:00', 1, 'O14', 5);

-- ----------------------------
-- Table structure for master_barang
-- ----------------------------
DROP TABLE IF EXISTS `master_barang`;
CREATE TABLE `master_barang`  (
  `id_barang` int NOT NULL AUTO_INCREMENT,
  `kode_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `is_active` int NULL DEFAULT 1,
  `harga` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_barang`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of master_barang
-- ----------------------------
INSERT INTO `master_barang` VALUES (1, 'O14', 'Oli', 1, 78000);
INSERT INTO `master_barang` VALUES (2, 'SP01', 'Spion Agya', 1, 150000);

-- ----------------------------
-- Table structure for member
-- ----------------------------
DROP TABLE IF EXISTS `member`;
CREATE TABLE `member`  (
  `id_member` int NOT NULL AUTO_INCREMENT,
  `nama_member` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `jenis_mobil` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `plat_nomor` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `alamat` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `nomor_telepon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_member`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of member
-- ----------------------------
INSERT INTO `member` VALUES (5, 'Sutatmo', 'Toyota Calya', 'AD 1373 WP', 'Badranasri', '081393496011', '1');

-- ----------------------------
-- Table structure for service_detail
-- ----------------------------
DROP TABLE IF EXISTS `service_detail`;
CREATE TABLE `service_detail`  (
  `id_service_detail` int NOT NULL AUTO_INCREMENT,
  `id_service` int NOT NULL,
  `id_barang` int NOT NULL,
  `nama_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `jumlah_barang` int NOT NULL,
  `harga` int NOT NULL,
  `total_harga` int NOT NULL,
  PRIMARY KEY (`id_service_detail`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of service_detail
-- ----------------------------
INSERT INTO `service_detail` VALUES (2, 1, 1, 'Oli', 2, 78000, 156000);

-- ----------------------------
-- Table structure for services
-- ----------------------------
DROP TABLE IF EXISTS `services`;
CREATE TABLE `services`  (
  `id_service` int NOT NULL AUTO_INCREMENT,
  `id_member` int NOT NULL,
  `tanggal` date NOT NULL,
  PRIMARY KEY (`id_service`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of services
-- ----------------------------
INSERT INTO `services` VALUES (1, 5, '2023-08-31');

-- ----------------------------
-- Table structure for stokopname
-- ----------------------------
DROP TABLE IF EXISTS `stokopname`;
CREATE TABLE `stokopname`  (
  `id_stokopname` int NOT NULL AUTO_INCREMENT,
  `tanggal` datetime NULL DEFAULT NULL,
  `id_barang` int NULL DEFAULT NULL,
  `kode_barang` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `jumlah_barang` int NULL DEFAULT NULL,
  PRIMARY KEY (`id_stokopname`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of stokopname
-- ----------------------------
INSERT INTO `stokopname` VALUES (1, '2023-08-22 13:50:00', 1, 'O14', 12);
INSERT INTO `stokopname` VALUES (2, '2023-08-23 02:14:00', 1, 'O14', 15);

-- ----------------------------
-- Table structure for system_icon
-- ----------------------------
DROP TABLE IF EXISTS `system_icon`;
CREATE TABLE `system_icon`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon_name` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 480 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_icon
-- ----------------------------
INSERT INTO `system_icon` VALUES (1, 'fa fa-glass', 'fa fa-glass');
INSERT INTO `system_icon` VALUES (2, 'fa fa-music', 'fa fa-music');
INSERT INTO `system_icon` VALUES (3, 'fa fa-search', 'fa fa-search');
INSERT INTO `system_icon` VALUES (4, 'fa fa-envelope-o', 'fa fa-envelope-o');
INSERT INTO `system_icon` VALUES (5, 'fa fa-heart', 'fa fa-heart');
INSERT INTO `system_icon` VALUES (6, 'fa fa-star', 'fa fa-star');
INSERT INTO `system_icon` VALUES (7, 'fa fa-star-o', 'fa fa-star-o');
INSERT INTO `system_icon` VALUES (8, 'fa fa-user', 'fa fa-user');
INSERT INTO `system_icon` VALUES (9, 'fa fa-film', 'fa fa-film');
INSERT INTO `system_icon` VALUES (10, 'fa fa-th-large', 'fa fa-th-large');
INSERT INTO `system_icon` VALUES (11, 'fa fa-th', 'fa fa-th');
INSERT INTO `system_icon` VALUES (12, 'fa fa-th-list', 'fa fa-th-list');
INSERT INTO `system_icon` VALUES (13, 'fa fa-check', 'fa fa-check');
INSERT INTO `system_icon` VALUES (14, 'fa fa-times', 'fa fa-times');
INSERT INTO `system_icon` VALUES (15, 'fa fa-search-plus', 'fa fa-search-plus');
INSERT INTO `system_icon` VALUES (16, 'fa fa-search-minus', 'fa fa-search-minus');
INSERT INTO `system_icon` VALUES (17, 'fa fa-power-off', 'fa fa-power-off');
INSERT INTO `system_icon` VALUES (18, 'fa fa-signal', 'fa fa-signal');
INSERT INTO `system_icon` VALUES (19, 'fa fa-cog', 'fa fa-cog');
INSERT INTO `system_icon` VALUES (20, 'fa fa-trash-o', 'fa fa-trash-o');
INSERT INTO `system_icon` VALUES (21, 'fa fa-home', 'fa fa-home');
INSERT INTO `system_icon` VALUES (22, 'fa fa-file-o', 'fa fa-file-o');
INSERT INTO `system_icon` VALUES (23, 'fa fa-clock-o', 'fa fa-clock-o');
INSERT INTO `system_icon` VALUES (24, 'fa fa-road', 'fa fa-road');
INSERT INTO `system_icon` VALUES (25, 'fa fa-download', 'fa fa-download');
INSERT INTO `system_icon` VALUES (26, 'fa fa-arrow-circle-o-down', 'fa fa-arrow-circle-o-down');
INSERT INTO `system_icon` VALUES (27, 'fa fa-arrow-circle-o-up', 'fa fa-arrow-circle-o-up');
INSERT INTO `system_icon` VALUES (28, 'fa fa-inbox', 'fa fa-inbox');
INSERT INTO `system_icon` VALUES (29, 'fa fa-play-circle-o', 'fa fa-play-circle-o');
INSERT INTO `system_icon` VALUES (30, 'fa fa-repeat', 'fa fa-repeat');
INSERT INTO `system_icon` VALUES (31, 'fa fa-refresh', 'fa fa-refresh');
INSERT INTO `system_icon` VALUES (32, 'fa fa-list-alt', 'fa fa-list-alt');
INSERT INTO `system_icon` VALUES (33, 'fa fa-lock', 'fa fa-lock');
INSERT INTO `system_icon` VALUES (34, 'fa fa-flag', 'fa fa-flag');
INSERT INTO `system_icon` VALUES (35, 'fa fa-headphones', 'fa fa-headphones');
INSERT INTO `system_icon` VALUES (36, 'fa fa-volume-off', 'fa fa-volume-off');
INSERT INTO `system_icon` VALUES (37, 'fa fa-volume-down', 'fa fa-volume-down');
INSERT INTO `system_icon` VALUES (38, 'fa fa-volume-up', 'fa fa-volume-up');
INSERT INTO `system_icon` VALUES (39, 'fa fa-qrcode', 'fa fa-qrcode');
INSERT INTO `system_icon` VALUES (40, 'fa fa-barcode', 'fa fa-barcode');
INSERT INTO `system_icon` VALUES (41, 'fa fa-tag', 'fa fa-tag');
INSERT INTO `system_icon` VALUES (42, 'fa fa-tags', 'fa fa-tags');
INSERT INTO `system_icon` VALUES (43, 'fa fa-book', 'fa fa-book');
INSERT INTO `system_icon` VALUES (44, 'fa fa-bookmark', 'fa fa-bookmark');
INSERT INTO `system_icon` VALUES (45, 'fa fa-print', 'fa fa-print');
INSERT INTO `system_icon` VALUES (46, 'fa fa-camera', 'fa fa-camera');
INSERT INTO `system_icon` VALUES (47, 'fa fa-font', 'fa fa-font');
INSERT INTO `system_icon` VALUES (48, 'fa fa-bold', 'fa fa-bold');
INSERT INTO `system_icon` VALUES (49, 'fa fa-italic', 'fa fa-italic');
INSERT INTO `system_icon` VALUES (50, 'fa fa-text-height', 'fa fa-text-height');
INSERT INTO `system_icon` VALUES (51, 'fa fa-text-width', 'fa fa-text-width');
INSERT INTO `system_icon` VALUES (52, 'fa fa-align-left', 'fa fa-align-left');
INSERT INTO `system_icon` VALUES (53, 'fa fa-align-center', 'fa fa-align-center');
INSERT INTO `system_icon` VALUES (54, 'fa fa-align-right', 'fa fa-align-right');
INSERT INTO `system_icon` VALUES (55, 'fa fa-align-justify', 'fa fa-align-justify');
INSERT INTO `system_icon` VALUES (56, 'fa fa-list', 'fa fa-list');
INSERT INTO `system_icon` VALUES (57, 'fa fa-outdent', 'fa fa-outdent');
INSERT INTO `system_icon` VALUES (58, 'fa fa-indent', 'fa fa-indent');
INSERT INTO `system_icon` VALUES (59, 'fa fa-video-camera', 'fa fa-video-camera');
INSERT INTO `system_icon` VALUES (60, 'fa fa-picture-o', 'fa fa-picture-o');
INSERT INTO `system_icon` VALUES (61, 'fa fa-pencil', 'fa fa-pencil');
INSERT INTO `system_icon` VALUES (62, 'fa fa-map-marker', 'fa fa-map-marker');
INSERT INTO `system_icon` VALUES (63, 'fa fa-adjust', 'fa fa-adjust');
INSERT INTO `system_icon` VALUES (64, 'fa fa-tint', 'fa fa-tint');
INSERT INTO `system_icon` VALUES (65, 'fa fa-pencil-square-o', 'fa fa-pencil-square-o');
INSERT INTO `system_icon` VALUES (66, 'fa fa-share-square-o', 'fa fa-share-square-o');
INSERT INTO `system_icon` VALUES (67, 'fa fa-check-square-o', 'fa fa-check-square-o');
INSERT INTO `system_icon` VALUES (68, 'fa fa-arrows', 'fa fa-arrows');
INSERT INTO `system_icon` VALUES (69, 'fa fa-step-backward', 'fa fa-step-backward');
INSERT INTO `system_icon` VALUES (70, 'fa fa-fast-backward', 'fa fa-fast-backward');
INSERT INTO `system_icon` VALUES (71, 'fa fa-backward', 'fa fa-backward');
INSERT INTO `system_icon` VALUES (72, 'fa fa-play', 'fa fa-play');
INSERT INTO `system_icon` VALUES (73, 'fa fa-pause', 'fa fa-pause');
INSERT INTO `system_icon` VALUES (74, 'fa fa-stop', 'fa fa-stop');
INSERT INTO `system_icon` VALUES (75, 'fa fa-forward', 'fa fa-forward');
INSERT INTO `system_icon` VALUES (76, 'fa fa-fast-forward', 'fa fa-fast-forward');
INSERT INTO `system_icon` VALUES (77, 'fa fa-step-forward', 'fa fa-step-forward');
INSERT INTO `system_icon` VALUES (78, 'fa fa-eject', 'fa fa-eject');
INSERT INTO `system_icon` VALUES (79, 'fa fa-chevron-left', 'fa fa-chevron-left');
INSERT INTO `system_icon` VALUES (80, 'fa fa-chevron-right', 'fa fa-chevron-right');
INSERT INTO `system_icon` VALUES (81, 'fa fa-plus-circle', 'fa fa-plus-circle');
INSERT INTO `system_icon` VALUES (82, 'fa fa-minus-circle', 'fa fa-minus-circle');
INSERT INTO `system_icon` VALUES (83, 'fa fa-times-circle', 'fa fa-times-circle');
INSERT INTO `system_icon` VALUES (84, 'fa fa-check-circle', 'fa fa-check-circle');
INSERT INTO `system_icon` VALUES (85, 'fa fa-question-circle', 'fa fa-question-circle');
INSERT INTO `system_icon` VALUES (86, 'fa fa-info-circle', 'fa fa-info-circle');
INSERT INTO `system_icon` VALUES (87, 'fa fa-crosshairs', 'fa fa-crosshairs');
INSERT INTO `system_icon` VALUES (88, 'fa fa-times-circle-o', 'fa fa-times-circle-o');
INSERT INTO `system_icon` VALUES (89, 'fa fa-check-circle-o', 'fa fa-check-circle-o');
INSERT INTO `system_icon` VALUES (90, 'fa fa-ban', 'fa fa-ban');
INSERT INTO `system_icon` VALUES (91, 'fa fa-arrow-left', 'fa fa-arrow-left');
INSERT INTO `system_icon` VALUES (92, 'fa fa-arrow-right', 'fa fa-arrow-right');
INSERT INTO `system_icon` VALUES (93, 'fa fa-arrow-up', 'fa fa-arrow-up');
INSERT INTO `system_icon` VALUES (94, 'fa fa-arrow-down', 'fa fa-arrow-down');
INSERT INTO `system_icon` VALUES (95, 'fa fa-share', 'fa fa-share');
INSERT INTO `system_icon` VALUES (96, 'fa fa-expand', 'fa fa-expand');
INSERT INTO `system_icon` VALUES (97, 'fa fa-compress', 'fa fa-compress');
INSERT INTO `system_icon` VALUES (98, 'fa fa-plus', 'fa fa-plus');
INSERT INTO `system_icon` VALUES (99, 'fa fa-minus', 'fa fa-minus');
INSERT INTO `system_icon` VALUES (100, 'fa fa-asterisk', 'fa fa-asterisk');
INSERT INTO `system_icon` VALUES (101, 'fa fa-exclamation-circle', 'fa fa-exclamation-circle');
INSERT INTO `system_icon` VALUES (102, 'fa fa-gift', 'fa fa-gift');
INSERT INTO `system_icon` VALUES (103, 'fa fa-leaf', 'fa fa-leaf');
INSERT INTO `system_icon` VALUES (104, 'fa fa-fire', 'fa fa-fire');
INSERT INTO `system_icon` VALUES (105, 'fa fa-eye', 'fa fa-eye');
INSERT INTO `system_icon` VALUES (106, 'fa fa-eye-slash', 'fa fa-eye-slash');
INSERT INTO `system_icon` VALUES (107, 'fa fa-exclamation-triangle', 'fa fa-exclamation-triangle');
INSERT INTO `system_icon` VALUES (108, 'fa fa-plane', 'fa fa-plane');
INSERT INTO `system_icon` VALUES (109, 'fa fa-calendar', 'fa fa-calendar');
INSERT INTO `system_icon` VALUES (110, 'fa fa-random', 'fa fa-random');
INSERT INTO `system_icon` VALUES (111, 'fa fa-comment', 'fa fa-comment');
INSERT INTO `system_icon` VALUES (112, 'fa fa-magnet', 'fa fa-magnet');
INSERT INTO `system_icon` VALUES (113, 'fa fa-chevron-up', 'fa fa-chevron-up');
INSERT INTO `system_icon` VALUES (114, 'fa fa-chevron-down', 'fa fa-chevron-down');
INSERT INTO `system_icon` VALUES (115, 'fa fa-retweet', 'fa fa-retweet');
INSERT INTO `system_icon` VALUES (116, 'fa fa-shopping-cart', 'fa fa-shopping-cart');
INSERT INTO `system_icon` VALUES (117, 'fa fa-folder', 'fa fa-folder');
INSERT INTO `system_icon` VALUES (118, 'fa fa-folder-open', 'fa fa-folder-open');
INSERT INTO `system_icon` VALUES (119, 'fa fa-arrows-v', 'fa fa-arrows-v');
INSERT INTO `system_icon` VALUES (120, 'fa fa-arrows-h', 'fa fa-arrows-h');
INSERT INTO `system_icon` VALUES (121, 'fa fa-bar-chart', 'fa fa-bar-chart');
INSERT INTO `system_icon` VALUES (122, 'fa fa-twitter-square', 'fa fa-twitter-square');
INSERT INTO `system_icon` VALUES (123, 'fa fa-facebook-square', 'fa fa-facebook-square');
INSERT INTO `system_icon` VALUES (124, 'fa fa-camera-retro', 'fa fa-camera-retro');
INSERT INTO `system_icon` VALUES (125, 'fa fa-key', 'fa fa-key');
INSERT INTO `system_icon` VALUES (126, 'fa fa-cogs', 'fa fa-cogs');
INSERT INTO `system_icon` VALUES (127, 'fa fa-comments', 'fa fa-comments');
INSERT INTO `system_icon` VALUES (128, 'fa fa-thumbs-o-up', 'fa fa-thumbs-o-up');
INSERT INTO `system_icon` VALUES (129, 'fa fa-thumbs-o-down', 'fa fa-thumbs-o-down');
INSERT INTO `system_icon` VALUES (130, 'fa fa-star-half', 'fa fa-star-half');
INSERT INTO `system_icon` VALUES (131, 'fa fa-heart-o', 'fa fa-heart-o');
INSERT INTO `system_icon` VALUES (132, 'fa fa-sign-out', 'fa fa-sign-out');
INSERT INTO `system_icon` VALUES (133, 'fa fa-linkedin-square', 'fa fa-linkedin-square');
INSERT INTO `system_icon` VALUES (134, 'fa fa-thumb-tack', 'fa fa-thumb-tack');
INSERT INTO `system_icon` VALUES (135, 'fa fa-external-link', 'fa fa-external-link');
INSERT INTO `system_icon` VALUES (136, 'fa fa-sign-in', 'fa fa-sign-in');
INSERT INTO `system_icon` VALUES (137, 'fa fa-trophy', 'fa fa-trophy');
INSERT INTO `system_icon` VALUES (138, 'fa fa-github-square', 'fa fa-github-square');
INSERT INTO `system_icon` VALUES (139, 'fa fa-upload', 'fa fa-upload');
INSERT INTO `system_icon` VALUES (140, 'fa fa-lemon-o', 'fa fa-lemon-o');
INSERT INTO `system_icon` VALUES (141, 'fa fa-phone', 'fa fa-phone');
INSERT INTO `system_icon` VALUES (142, 'fa fa-square-o', 'fa fa-square-o');
INSERT INTO `system_icon` VALUES (143, 'fa fa-bookmark-o', 'fa fa-bookmark-o');
INSERT INTO `system_icon` VALUES (144, 'fa fa-phone-square', 'fa fa-phone-square');
INSERT INTO `system_icon` VALUES (145, 'fa fa-twitter', 'fa fa-twitter');
INSERT INTO `system_icon` VALUES (146, 'fa fa-facebook', 'fa fa-facebook');
INSERT INTO `system_icon` VALUES (147, 'fa fa-github', 'fa fa-github');
INSERT INTO `system_icon` VALUES (148, 'fa fa-unlock', 'fa fa-unlock');
INSERT INTO `system_icon` VALUES (149, 'fa fa-credit-card', 'fa fa-credit-card');
INSERT INTO `system_icon` VALUES (150, 'fa fa-rss', 'fa fa-rss');
INSERT INTO `system_icon` VALUES (151, 'fa fa-hdd-o', 'fa fa-hdd-o');
INSERT INTO `system_icon` VALUES (152, 'fa fa-bullhorn', 'fa fa-bullhorn');
INSERT INTO `system_icon` VALUES (153, 'fa fa-bell', 'fa fa-bell');
INSERT INTO `system_icon` VALUES (154, 'fa fa-certificate', 'fa fa-certificate');
INSERT INTO `system_icon` VALUES (155, 'fa fa-hand-o-right', 'fa fa-hand-o-right');
INSERT INTO `system_icon` VALUES (156, 'fa fa-hand-o-left', 'fa fa-hand-o-left');
INSERT INTO `system_icon` VALUES (157, 'fa fa-hand-o-up', 'fa fa-hand-o-up');
INSERT INTO `system_icon` VALUES (158, 'fa fa-hand-o-down', 'fa fa-hand-o-down');
INSERT INTO `system_icon` VALUES (159, 'fa fa-arrow-circle-left', 'fa fa-arrow-circle-left');
INSERT INTO `system_icon` VALUES (160, 'fa fa-arrow-circle-right', 'fa fa-arrow-circle-right');
INSERT INTO `system_icon` VALUES (161, 'fa fa-arrow-circle-up', 'fa fa-arrow-circle-up');
INSERT INTO `system_icon` VALUES (162, 'fa fa-arrow-circle-down', 'fa fa-arrow-circle-down');
INSERT INTO `system_icon` VALUES (163, 'fa fa-globe', 'fa fa-globe');
INSERT INTO `system_icon` VALUES (164, 'fa fa-wrench', 'fa fa-wrench');
INSERT INTO `system_icon` VALUES (165, 'fa fa-tasks', 'fa fa-tasks');
INSERT INTO `system_icon` VALUES (166, 'fa fa-filter', 'fa fa-filter');
INSERT INTO `system_icon` VALUES (167, 'fa fa-briefcase', 'fa fa-briefcase');
INSERT INTO `system_icon` VALUES (168, 'fa fa-arrows-alt', 'fa fa-arrows-alt');
INSERT INTO `system_icon` VALUES (169, 'fa fa-users', 'fa fa-users');
INSERT INTO `system_icon` VALUES (170, 'fa fa-link', 'fa fa-link');
INSERT INTO `system_icon` VALUES (171, 'fa fa-cloud', 'fa fa-cloud');
INSERT INTO `system_icon` VALUES (172, 'fa fa-flask', 'fa fa-flask');
INSERT INTO `system_icon` VALUES (173, 'fa fa-scissors', 'fa fa-scissors');
INSERT INTO `system_icon` VALUES (174, 'fa fa-files-o', 'fa fa-files-o');
INSERT INTO `system_icon` VALUES (175, 'fa fa-paperclip', 'fa fa-paperclip');
INSERT INTO `system_icon` VALUES (176, 'fa fa-floppy-o', 'fa fa-floppy-o');
INSERT INTO `system_icon` VALUES (177, 'fa fa-square', 'fa fa-square');
INSERT INTO `system_icon` VALUES (178, 'fa fa-bars', 'fa fa-bars');
INSERT INTO `system_icon` VALUES (179, 'fa fa-list-ul', 'fa fa-list-ul');
INSERT INTO `system_icon` VALUES (180, 'fa fa-list-ol', 'fa fa-list-ol');
INSERT INTO `system_icon` VALUES (181, 'fa fa-strikethrough', 'fa fa-strikethrough');
INSERT INTO `system_icon` VALUES (182, 'fa fa-underline', 'fa fa-underline');
INSERT INTO `system_icon` VALUES (183, 'fa fa-table', 'fa fa-table');
INSERT INTO `system_icon` VALUES (184, 'fa fa-magic', 'fa fa-magic');
INSERT INTO `system_icon` VALUES (185, 'fa fa-truck', 'fa fa-truck');
INSERT INTO `system_icon` VALUES (186, 'fa fa-pinterest', 'fa fa-pinterest');
INSERT INTO `system_icon` VALUES (187, 'fa fa-pinterest-square', 'fa fa-pinterest-square');
INSERT INTO `system_icon` VALUES (188, 'fa fa-google-plus-square', 'fa fa-google-plus-square');
INSERT INTO `system_icon` VALUES (189, 'fa fa-google-plus', 'fa fa-google-plus');
INSERT INTO `system_icon` VALUES (190, 'fa fa-money', 'fa fa-money');
INSERT INTO `system_icon` VALUES (191, 'fa fa-caret-down', 'fa fa-caret-down');
INSERT INTO `system_icon` VALUES (192, 'fa fa-caret-up', 'fa fa-caret-up');
INSERT INTO `system_icon` VALUES (193, 'fa fa-caret-left', 'fa fa-caret-left');
INSERT INTO `system_icon` VALUES (194, 'fa fa-caret-right', 'fa fa-caret-right');
INSERT INTO `system_icon` VALUES (195, 'fa fa-columns', 'fa fa-columns');
INSERT INTO `system_icon` VALUES (196, 'fa fa-sort', 'fa fa-sort');
INSERT INTO `system_icon` VALUES (197, 'fa fa-sort-desc', 'fa fa-sort-desc');
INSERT INTO `system_icon` VALUES (198, 'fa fa-sort-asc', 'fa fa-sort-asc');
INSERT INTO `system_icon` VALUES (199, 'fa fa-envelope', 'fa fa-envelope');
INSERT INTO `system_icon` VALUES (200, 'fa fa-linkedin', 'fa fa-linkedin');
INSERT INTO `system_icon` VALUES (201, 'fa fa-undo', 'fa fa-undo');
INSERT INTO `system_icon` VALUES (202, 'fa fa-gavel', 'fa fa-gavel');
INSERT INTO `system_icon` VALUES (203, 'fa fa-tachometer', 'fa fa-tachometer');
INSERT INTO `system_icon` VALUES (204, 'fa fa-comment-o', 'fa fa-comment-o');
INSERT INTO `system_icon` VALUES (205, 'fa fa-comments-o', 'fa fa-comments-o');
INSERT INTO `system_icon` VALUES (206, 'fa fa-bolt', 'fa fa-bolt');
INSERT INTO `system_icon` VALUES (207, 'fa fa-sitemap', 'fa fa-sitemap');
INSERT INTO `system_icon` VALUES (208, 'fa fa-umbrella', 'fa fa-umbrella');
INSERT INTO `system_icon` VALUES (209, 'fa fa-clipboard', 'fa fa-clipboard');
INSERT INTO `system_icon` VALUES (210, 'fa fa-lightbulb-o', 'fa fa-lightbulb-o');
INSERT INTO `system_icon` VALUES (211, 'fa fa-exchange', 'fa fa-exchange');
INSERT INTO `system_icon` VALUES (212, 'fa fa-cloud-download', 'fa fa-cloud-download');
INSERT INTO `system_icon` VALUES (213, 'fa fa-cloud-upload', 'fa fa-cloud-upload');
INSERT INTO `system_icon` VALUES (214, 'fa fa-user-md', 'fa fa-user-md');
INSERT INTO `system_icon` VALUES (215, 'fa fa-stethoscope', 'fa fa-stethoscope');
INSERT INTO `system_icon` VALUES (216, 'fa fa-suitcase', 'fa fa-suitcase');
INSERT INTO `system_icon` VALUES (217, 'fa fa-bell-o', 'fa fa-bell-o');
INSERT INTO `system_icon` VALUES (218, 'fa fa-coffee', 'fa fa-coffee');
INSERT INTO `system_icon` VALUES (219, 'fa fa-cutlery', 'fa fa-cutlery');
INSERT INTO `system_icon` VALUES (220, 'fa fa-file-text-o', 'fa fa-file-text-o');
INSERT INTO `system_icon` VALUES (221, 'fa fa-building-o', 'fa fa-building-o');
INSERT INTO `system_icon` VALUES (222, 'fa fa-hospital-o', 'fa fa-hospital-o');
INSERT INTO `system_icon` VALUES (223, 'fa fa-ambulance', 'fa fa-ambulance');
INSERT INTO `system_icon` VALUES (224, 'fa fa-medkit', 'fa fa-medkit');
INSERT INTO `system_icon` VALUES (225, 'fa fa-fighter-jet', 'fa fa-fighter-jet');
INSERT INTO `system_icon` VALUES (226, 'fa fa-beer', 'fa fa-beer');
INSERT INTO `system_icon` VALUES (227, 'fa fa-h-square', 'fa fa-h-square');
INSERT INTO `system_icon` VALUES (228, 'fa fa-plus-square', 'fa fa-plus-square');
INSERT INTO `system_icon` VALUES (229, 'fa fa-angle-double-left', 'fa fa-angle-double-left');
INSERT INTO `system_icon` VALUES (230, 'fa fa-angle-double-right', 'fa fa-angle-double-right');
INSERT INTO `system_icon` VALUES (231, 'fa fa-angle-double-up', 'fa fa-angle-double-up');
INSERT INTO `system_icon` VALUES (232, 'fa fa-angle-double-down', 'fa fa-angle-double-down');
INSERT INTO `system_icon` VALUES (233, 'fa fa-angle-left', 'fa fa-angle-left');
INSERT INTO `system_icon` VALUES (234, 'fa fa-angle-right', 'fa fa-angle-right');
INSERT INTO `system_icon` VALUES (235, 'fa fa-angle-up', 'fa fa-angle-up');
INSERT INTO `system_icon` VALUES (236, 'fa fa-angle-down', 'fa fa-angle-down');
INSERT INTO `system_icon` VALUES (237, 'fa fa-desktop', 'fa fa-desktop');
INSERT INTO `system_icon` VALUES (238, 'fa fa-laptop', 'fa fa-laptop');
INSERT INTO `system_icon` VALUES (239, 'fa fa-tablet', 'fa fa-tablet');
INSERT INTO `system_icon` VALUES (240, 'fa fa-mobile', 'fa fa-mobile');
INSERT INTO `system_icon` VALUES (241, 'fa fa-circle-o', 'fa fa-circle-o');
INSERT INTO `system_icon` VALUES (242, 'fa fa-quote-left', 'fa fa-quote-left');
INSERT INTO `system_icon` VALUES (243, 'fa fa-quote-right', 'fa fa-quote-right');
INSERT INTO `system_icon` VALUES (244, 'fa fa-spinner', 'fa fa-spinner');
INSERT INTO `system_icon` VALUES (245, 'fa fa-circle', 'fa fa-circle');
INSERT INTO `system_icon` VALUES (246, 'fa fa-reply', 'fa fa-reply');
INSERT INTO `system_icon` VALUES (247, 'fa fa-github-alt', 'fa fa-github-alt');
INSERT INTO `system_icon` VALUES (248, 'fa fa-folder-o', 'fa fa-folder-o');
INSERT INTO `system_icon` VALUES (249, 'fa fa-folder-open-o', 'fa fa-folder-open-o');
INSERT INTO `system_icon` VALUES (250, 'fa fa-smile-o', 'fa fa-smile-o');
INSERT INTO `system_icon` VALUES (251, 'fa fa-frown-o', 'fa fa-frown-o');
INSERT INTO `system_icon` VALUES (252, 'fa fa-meh-o', 'fa fa-meh-o');
INSERT INTO `system_icon` VALUES (253, 'fa fa-gamepad', 'fa fa-gamepad');
INSERT INTO `system_icon` VALUES (254, 'fa fa-keyboard-o', 'fa fa-keyboard-o');
INSERT INTO `system_icon` VALUES (255, 'fa fa-flag-o', 'fa fa-flag-o');
INSERT INTO `system_icon` VALUES (256, 'fa fa-flag-checkered', 'fa fa-flag-checkered');
INSERT INTO `system_icon` VALUES (257, 'fa fa-terminal', 'fa fa-terminal');
INSERT INTO `system_icon` VALUES (258, 'fa fa-code', 'fa fa-code');
INSERT INTO `system_icon` VALUES (259, 'fa fa-reply-all', 'fa fa-reply-all');
INSERT INTO `system_icon` VALUES (260, 'fa fa-star-half-o', 'fa fa-star-half-o');
INSERT INTO `system_icon` VALUES (261, 'fa fa-location-arrow', 'fa fa-location-arrow');
INSERT INTO `system_icon` VALUES (262, 'fa fa-crop', 'fa fa-crop');
INSERT INTO `system_icon` VALUES (263, 'fa fa-code-fork', 'fa fa-code-fork');
INSERT INTO `system_icon` VALUES (264, 'fa fa-chain-broken', 'fa fa-chain-broken');
INSERT INTO `system_icon` VALUES (265, 'fa fa-question', 'fa fa-question');
INSERT INTO `system_icon` VALUES (266, 'fa fa-info', 'fa fa-info');
INSERT INTO `system_icon` VALUES (267, 'fa fa-exclamation', 'fa fa-exclamation');
INSERT INTO `system_icon` VALUES (268, 'fa fa-superscript', 'fa fa-superscript');
INSERT INTO `system_icon` VALUES (269, 'fa fa-subscript', 'fa fa-subscript');
INSERT INTO `system_icon` VALUES (270, 'fa fa-eraser', 'fa fa-eraser');
INSERT INTO `system_icon` VALUES (271, 'fa fa-puzzle-piece', 'fa fa-puzzle-piece');
INSERT INTO `system_icon` VALUES (272, 'fa fa-microphone', 'fa fa-microphone');
INSERT INTO `system_icon` VALUES (273, 'fa fa-microphone-slash', 'fa fa-microphone-slash');
INSERT INTO `system_icon` VALUES (274, 'fa fa-shield', 'fa fa-shield');
INSERT INTO `system_icon` VALUES (275, 'fa fa-calendar-o', 'fa fa-calendar-o');
INSERT INTO `system_icon` VALUES (276, 'fa fa-fire-extinguisher', 'fa fa-fire-extinguisher');
INSERT INTO `system_icon` VALUES (277, 'fa fa-rocket', 'fa fa-rocket');
INSERT INTO `system_icon` VALUES (278, 'fa fa-maxcdn', 'fa fa-maxcdn');
INSERT INTO `system_icon` VALUES (279, 'fa fa-chevron-circle-left', 'fa fa-chevron-circle-left');
INSERT INTO `system_icon` VALUES (280, 'fa fa-chevron-circle-right', 'fa fa-chevron-circle-right');
INSERT INTO `system_icon` VALUES (281, 'fa fa-chevron-circle-up', 'fa fa-chevron-circle-up');
INSERT INTO `system_icon` VALUES (282, 'fa fa-chevron-circle-down', 'fa fa-chevron-circle-down');
INSERT INTO `system_icon` VALUES (283, 'fa fa-html5', 'fa fa-html5');
INSERT INTO `system_icon` VALUES (284, 'fa fa-css3', 'fa fa-css3');
INSERT INTO `system_icon` VALUES (285, 'fa fa-anchor', 'fa fa-anchor');
INSERT INTO `system_icon` VALUES (286, 'fa fa-unlock-alt', 'fa fa-unlock-alt');
INSERT INTO `system_icon` VALUES (287, 'fa fa-bullseye', 'fa fa-bullseye');
INSERT INTO `system_icon` VALUES (288, 'fa fa-ellipsis-h', 'fa fa-ellipsis-h');
INSERT INTO `system_icon` VALUES (289, 'fa fa-ellipsis-v', 'fa fa-ellipsis-v');
INSERT INTO `system_icon` VALUES (290, 'fa fa-rss-square', 'fa fa-rss-square');
INSERT INTO `system_icon` VALUES (291, 'fa fa-play-circle', 'fa fa-play-circle');
INSERT INTO `system_icon` VALUES (292, 'fa fa-ticket', 'fa fa-ticket');
INSERT INTO `system_icon` VALUES (293, 'fa fa-minus-square', 'fa fa-minus-square');
INSERT INTO `system_icon` VALUES (294, 'fa fa-minus-square-o', 'fa fa-minus-square-o');
INSERT INTO `system_icon` VALUES (295, 'fa fa-level-up', 'fa fa-level-up');
INSERT INTO `system_icon` VALUES (296, 'fa fa-level-down', 'fa fa-level-down');
INSERT INTO `system_icon` VALUES (297, 'fa fa-check-square', 'fa fa-check-square');
INSERT INTO `system_icon` VALUES (298, 'fa fa-pencil-square', 'fa fa-pencil-square');
INSERT INTO `system_icon` VALUES (299, 'fa fa-external-link-square', 'fa fa-external-link-square');
INSERT INTO `system_icon` VALUES (300, 'fa fa-share-square', 'fa fa-share-square');
INSERT INTO `system_icon` VALUES (301, 'fa fa-compass', 'fa fa-compass');
INSERT INTO `system_icon` VALUES (302, 'fa fa-caret-square-o-down', 'fa fa-caret-square-o-down');
INSERT INTO `system_icon` VALUES (303, 'fa fa-caret-square-o-up', 'fa fa-caret-square-o-up');
INSERT INTO `system_icon` VALUES (304, 'fa fa-caret-square-o-right', 'fa fa-caret-square-o-right');
INSERT INTO `system_icon` VALUES (305, 'fa fa-eur', 'fa fa-eur');
INSERT INTO `system_icon` VALUES (306, 'fa fa-gbp', 'fa fa-gbp');
INSERT INTO `system_icon` VALUES (307, 'fa fa-usd', 'fa fa-usd');
INSERT INTO `system_icon` VALUES (308, 'fa fa-inr', 'fa fa-inr');
INSERT INTO `system_icon` VALUES (309, 'fa fa-jpy', 'fa fa-jpy');
INSERT INTO `system_icon` VALUES (310, 'fa fa-rub', 'fa fa-rub');
INSERT INTO `system_icon` VALUES (311, 'fa fa-krw', 'fa fa-krw');
INSERT INTO `system_icon` VALUES (312, 'fa fa-btc', 'fa fa-btc');
INSERT INTO `system_icon` VALUES (313, 'fa fa-file', 'fa fa-file');
INSERT INTO `system_icon` VALUES (314, 'fa fa-file-text', 'fa fa-file-text');
INSERT INTO `system_icon` VALUES (315, 'fa fa-sort-alpha-asc', 'fa fa-sort-alpha-asc');
INSERT INTO `system_icon` VALUES (316, 'fa fa-sort-alpha-desc', 'fa fa-sort-alpha-desc');
INSERT INTO `system_icon` VALUES (317, 'fa fa-sort-amount-asc', 'fa fa-sort-amount-asc');
INSERT INTO `system_icon` VALUES (318, 'fa fa-sort-amount-desc', 'fa fa-sort-amount-desc');
INSERT INTO `system_icon` VALUES (319, 'fa fa-sort-numeric-asc', 'fa fa-sort-numeric-asc');
INSERT INTO `system_icon` VALUES (320, 'fa fa-sort-numeric-desc', 'fa fa-sort-numeric-desc');
INSERT INTO `system_icon` VALUES (321, 'fa fa-thumbs-up', 'fa fa-thumbs-up');
INSERT INTO `system_icon` VALUES (322, 'fa fa-thumbs-down', 'fa fa-thumbs-down');
INSERT INTO `system_icon` VALUES (323, 'fa fa-youtube-square', 'fa fa-youtube-square');
INSERT INTO `system_icon` VALUES (324, 'fa fa-youtube', 'fa fa-youtube');
INSERT INTO `system_icon` VALUES (325, 'fa fa-xing', 'fa fa-xing');
INSERT INTO `system_icon` VALUES (326, 'fa fa-xing-square', 'fa fa-xing-square');
INSERT INTO `system_icon` VALUES (327, 'fa fa-youtube-play', 'fa fa-youtube-play');
INSERT INTO `system_icon` VALUES (328, 'fa fa-dropbox', 'fa fa-dropbox');
INSERT INTO `system_icon` VALUES (329, 'fa fa-stack-overflow', 'fa fa-stack-overflow');
INSERT INTO `system_icon` VALUES (330, 'fa fa-instagram', 'fa fa-instagram');
INSERT INTO `system_icon` VALUES (331, 'fa fa-flickr', 'fa fa-flickr');
INSERT INTO `system_icon` VALUES (332, 'fa fa-adn', 'fa fa-adn');
INSERT INTO `system_icon` VALUES (333, 'fa fa-bitbucket', 'fa fa-bitbucket');
INSERT INTO `system_icon` VALUES (334, 'fa fa-bitbucket-square', 'fa fa-bitbucket-square');
INSERT INTO `system_icon` VALUES (335, 'fa fa-tumblr', 'fa fa-tumblr');
INSERT INTO `system_icon` VALUES (336, 'fa fa-tumblr-square', 'fa fa-tumblr-square');
INSERT INTO `system_icon` VALUES (337, 'fa fa-long-arrow-down', 'fa fa-long-arrow-down');
INSERT INTO `system_icon` VALUES (338, 'fa fa-long-arrow-up', 'fa fa-long-arrow-up');
INSERT INTO `system_icon` VALUES (339, 'fa fa-long-arrow-left', 'fa fa-long-arrow-left');
INSERT INTO `system_icon` VALUES (340, 'fa fa-long-arrow-right', 'fa fa-long-arrow-right');
INSERT INTO `system_icon` VALUES (341, 'fa fa-apple', 'fa fa-apple');
INSERT INTO `system_icon` VALUES (342, 'fa fa-windows', 'fa fa-windows');
INSERT INTO `system_icon` VALUES (343, 'fa fa-android', 'fa fa-android');
INSERT INTO `system_icon` VALUES (344, 'fa fa-linux', 'fa fa-linux');
INSERT INTO `system_icon` VALUES (345, 'fa fa-dribbble', 'fa fa-dribbble');
INSERT INTO `system_icon` VALUES (346, 'fa fa-skype', 'fa fa-skype');
INSERT INTO `system_icon` VALUES (347, 'fa fa-foursquare', 'fa fa-foursquare');
INSERT INTO `system_icon` VALUES (348, 'fa fa-trello', 'fa fa-trello');
INSERT INTO `system_icon` VALUES (349, 'fa fa-female', 'fa fa-female');
INSERT INTO `system_icon` VALUES (350, 'fa fa-male', 'fa fa-male');
INSERT INTO `system_icon` VALUES (351, 'fa fa-gittip', 'fa fa-gittip');
INSERT INTO `system_icon` VALUES (352, 'fa fa-sun-o', 'fa fa-sun-o');
INSERT INTO `system_icon` VALUES (353, 'fa fa-moon-o', 'fa fa-moon-o');
INSERT INTO `system_icon` VALUES (354, 'fa fa-archive', 'fa fa-archive');
INSERT INTO `system_icon` VALUES (355, 'fa fa-bug', 'fa fa-bug');
INSERT INTO `system_icon` VALUES (356, 'fa fa-vk', 'fa fa-vk');
INSERT INTO `system_icon` VALUES (357, 'fa fa-weibo', 'fa fa-weibo');
INSERT INTO `system_icon` VALUES (358, 'fa fa-renren', 'fa fa-renren');
INSERT INTO `system_icon` VALUES (359, 'fa fa-pagelines', 'fa fa-pagelines');
INSERT INTO `system_icon` VALUES (360, 'fa fa-stack-exchange', 'fa fa-stack-exchange');
INSERT INTO `system_icon` VALUES (361, 'fa fa-arrow-circle-o-right', 'fa fa-arrow-circle-o-right');
INSERT INTO `system_icon` VALUES (362, 'fa fa-arrow-circle-o-left', 'fa fa-arrow-circle-o-left');
INSERT INTO `system_icon` VALUES (363, 'fa fa-caret-square-o-left', 'fa fa-caret-square-o-left');
INSERT INTO `system_icon` VALUES (364, 'fa fa-dot-circle-o', 'fa fa-dot-circle-o');
INSERT INTO `system_icon` VALUES (365, 'fa fa-wheelchair', 'fa fa-wheelchair');
INSERT INTO `system_icon` VALUES (366, 'fa fa-vimeo-square', 'fa fa-vimeo-square');
INSERT INTO `system_icon` VALUES (367, 'fa fa-try', 'fa fa-try');
INSERT INTO `system_icon` VALUES (368, 'fa fa-plus-square-o', 'fa fa-plus-square-o');
INSERT INTO `system_icon` VALUES (369, 'fa fa-space-shuttle', 'fa fa-space-shuttle');
INSERT INTO `system_icon` VALUES (370, 'fa fa-slack', 'fa fa-slack');
INSERT INTO `system_icon` VALUES (371, 'fa fa-envelope-square', 'fa fa-envelope-square');
INSERT INTO `system_icon` VALUES (372, 'fa fa-wordpress', 'fa fa-wordpress');
INSERT INTO `system_icon` VALUES (373, 'fa fa-openid', 'fa fa-openid');
INSERT INTO `system_icon` VALUES (374, 'fa fa-university', 'fa fa-university');
INSERT INTO `system_icon` VALUES (375, 'fa fa-graduation-cap', 'fa fa-graduation-cap');
INSERT INTO `system_icon` VALUES (376, 'fa fa-yahoo', 'fa fa-yahoo');
INSERT INTO `system_icon` VALUES (377, 'fa fa-google', 'fa fa-google');
INSERT INTO `system_icon` VALUES (378, 'fa fa-reddit', 'fa fa-reddit');
INSERT INTO `system_icon` VALUES (379, 'fa fa-reddit-square', 'fa fa-reddit-square');
INSERT INTO `system_icon` VALUES (380, 'fa fa-stumbleupon-circle', 'fa fa-stumbleupon-circle');
INSERT INTO `system_icon` VALUES (381, 'fa fa-stumbleupon', 'fa fa-stumbleupon');
INSERT INTO `system_icon` VALUES (382, 'fa fa-delicious', 'fa fa-delicious');
INSERT INTO `system_icon` VALUES (383, 'fa fa-digg', 'fa fa-digg');
INSERT INTO `system_icon` VALUES (384, 'fa fa-pied-piper', 'fa fa-pied-piper');
INSERT INTO `system_icon` VALUES (385, 'fa fa-pied-piper-alt', 'fa fa-pied-piper-alt');
INSERT INTO `system_icon` VALUES (386, 'fa fa-drupal', 'fa fa-drupal');
INSERT INTO `system_icon` VALUES (387, 'fa fa-joomla', 'fa fa-joomla');
INSERT INTO `system_icon` VALUES (388, 'fa fa-language', 'fa fa-language');
INSERT INTO `system_icon` VALUES (389, 'fa fa-fax', 'fa fa-fax');
INSERT INTO `system_icon` VALUES (390, 'fa fa-building', 'fa fa-building');
INSERT INTO `system_icon` VALUES (391, 'fa fa-child', 'fa fa-child');
INSERT INTO `system_icon` VALUES (392, 'fa fa-paw', 'fa fa-paw');
INSERT INTO `system_icon` VALUES (393, 'fa fa-spoon', 'fa fa-spoon');
INSERT INTO `system_icon` VALUES (394, 'fa fa-cube', 'fa fa-cube');
INSERT INTO `system_icon` VALUES (395, 'fa fa-cubes', 'fa fa-cubes');
INSERT INTO `system_icon` VALUES (396, 'fa fa-behance', 'fa fa-behance');
INSERT INTO `system_icon` VALUES (397, 'fa fa-behance-square', 'fa fa-behance-square');
INSERT INTO `system_icon` VALUES (398, 'fa fa-steam', 'fa fa-steam');
INSERT INTO `system_icon` VALUES (399, 'fa fa-steam-square', 'fa fa-steam-square');
INSERT INTO `system_icon` VALUES (400, 'fa fa-recycle', 'fa fa-recycle');
INSERT INTO `system_icon` VALUES (401, 'fa fa-car', 'fa fa-car');
INSERT INTO `system_icon` VALUES (402, 'fa fa-taxi', 'fa fa-taxi');
INSERT INTO `system_icon` VALUES (403, 'fa fa-tree', 'fa fa-tree');
INSERT INTO `system_icon` VALUES (404, 'fa fa-spotify', 'fa fa-spotify');
INSERT INTO `system_icon` VALUES (405, 'fa fa-deviantart', 'fa fa-deviantart');
INSERT INTO `system_icon` VALUES (406, 'fa fa-soundcloud', 'fa fa-soundcloud');
INSERT INTO `system_icon` VALUES (407, 'fa fa-database', 'fa fa-database');
INSERT INTO `system_icon` VALUES (408, 'fa fa-file-pdf-o', 'fa fa-file-pdf-o');
INSERT INTO `system_icon` VALUES (409, 'fa fa-file-word-o', 'fa fa-file-word-o');
INSERT INTO `system_icon` VALUES (410, 'fa fa-file-excel-o', 'fa fa-file-excel-o');
INSERT INTO `system_icon` VALUES (411, 'fa fa-file-powerpoint-o', 'fa fa-file-powerpoint-o');
INSERT INTO `system_icon` VALUES (412, 'fa fa-file-image-o', 'fa fa-file-image-o');
INSERT INTO `system_icon` VALUES (413, 'fa fa-file-archive-o', 'fa fa-file-archive-o');
INSERT INTO `system_icon` VALUES (414, 'fa fa-file-audio-o', 'fa fa-file-audio-o');
INSERT INTO `system_icon` VALUES (415, 'fa fa-file-video-o', 'fa fa-file-video-o');
INSERT INTO `system_icon` VALUES (416, 'fa fa-file-code-o', 'fa fa-file-code-o');
INSERT INTO `system_icon` VALUES (417, 'fa fa-vine', 'fa fa-vine');
INSERT INTO `system_icon` VALUES (418, 'fa fa-codepen', 'fa fa-codepen');
INSERT INTO `system_icon` VALUES (419, 'fa fa-jsfiddle', 'fa fa-jsfiddle');
INSERT INTO `system_icon` VALUES (420, 'fa fa-life-ring', 'fa fa-life-ring');
INSERT INTO `system_icon` VALUES (421, 'fa fa-circle-o-notch', 'fa fa-circle-o-notch');
INSERT INTO `system_icon` VALUES (422, 'fa fa-rebel', 'fa fa-rebel');
INSERT INTO `system_icon` VALUES (423, 'fa fa-empire', 'fa fa-empire');
INSERT INTO `system_icon` VALUES (424, 'fa fa-git-square', 'fa fa-git-square');
INSERT INTO `system_icon` VALUES (425, 'fa fa-git', 'fa fa-git');
INSERT INTO `system_icon` VALUES (426, 'fa fa-hacker-news', 'fa fa-hacker-news');
INSERT INTO `system_icon` VALUES (427, 'fa fa-tencent-weibo', 'fa fa-tencent-weibo');
INSERT INTO `system_icon` VALUES (428, 'fa fa-qq', 'fa fa-qq');
INSERT INTO `system_icon` VALUES (429, 'fa fa-weixin', 'fa fa-weixin');
INSERT INTO `system_icon` VALUES (430, 'fa fa-paper-plane', 'fa fa-paper-plane');
INSERT INTO `system_icon` VALUES (431, 'fa fa-paper-plane-o', 'fa fa-paper-plane-o');
INSERT INTO `system_icon` VALUES (432, 'fa fa-history', 'fa fa-history');
INSERT INTO `system_icon` VALUES (433, 'fa fa-circle-thin', 'fa fa-circle-thin');
INSERT INTO `system_icon` VALUES (434, 'fa fa-header', 'fa fa-header');
INSERT INTO `system_icon` VALUES (435, 'fa fa-paragraph', 'fa fa-paragraph');
INSERT INTO `system_icon` VALUES (436, 'fa fa-sliders', 'fa fa-sliders');
INSERT INTO `system_icon` VALUES (437, 'fa fa-share-alt', 'fa fa-share-alt');
INSERT INTO `system_icon` VALUES (438, 'fa fa-share-alt-square', 'fa fa-share-alt-square');
INSERT INTO `system_icon` VALUES (439, 'fa fa-bomb', 'fa fa-bomb');
INSERT INTO `system_icon` VALUES (440, 'fa fa-futbol-o', 'fa fa-futbol-o');
INSERT INTO `system_icon` VALUES (441, 'fa fa-tty', 'fa fa-tty');
INSERT INTO `system_icon` VALUES (442, 'fa fa-binoculars', 'fa fa-binoculars');
INSERT INTO `system_icon` VALUES (443, 'fa fa-plug', 'fa fa-plug');
INSERT INTO `system_icon` VALUES (444, 'fa fa-slideshare', 'fa fa-slideshare');
INSERT INTO `system_icon` VALUES (445, 'fa fa-twitch', 'fa fa-twitch');
INSERT INTO `system_icon` VALUES (446, 'fa fa-yelp', 'fa fa-yelp');
INSERT INTO `system_icon` VALUES (447, 'fa fa-newspaper-o', 'fa fa-newspaper-o');
INSERT INTO `system_icon` VALUES (448, 'fa fa-wifi', 'fa fa-wifi');
INSERT INTO `system_icon` VALUES (449, 'fa fa-calculator', 'fa fa-calculator');
INSERT INTO `system_icon` VALUES (450, 'fa fa-paypal', 'fa fa-paypal');
INSERT INTO `system_icon` VALUES (451, 'fa fa-google-wallet', 'fa fa-google-wallet');
INSERT INTO `system_icon` VALUES (452, 'fa fa-cc-visa', 'fa fa-cc-visa');
INSERT INTO `system_icon` VALUES (453, 'fa fa-cc-mastercard', 'fa fa-cc-mastercard');
INSERT INTO `system_icon` VALUES (454, 'fa fa-cc-discover', 'fa fa-cc-discover');
INSERT INTO `system_icon` VALUES (455, 'fa fa-cc-amex', 'fa fa-cc-amex');
INSERT INTO `system_icon` VALUES (456, 'fa fa-cc-paypal', 'fa fa-cc-paypal');
INSERT INTO `system_icon` VALUES (457, 'fa fa-cc-stripe', 'fa fa-cc-stripe');
INSERT INTO `system_icon` VALUES (458, 'fa fa-bell-slash', 'fa fa-bell-slash');
INSERT INTO `system_icon` VALUES (459, 'fa fa-bell-slash-o', 'fa fa-bell-slash-o');
INSERT INTO `system_icon` VALUES (460, 'fa fa-trash', 'fa fa-trash');
INSERT INTO `system_icon` VALUES (461, 'fa fa-copyright', 'fa fa-copyright');
INSERT INTO `system_icon` VALUES (462, 'fa fa-at', 'fa fa-at');
INSERT INTO `system_icon` VALUES (463, 'fa fa-eyedropper', 'fa fa-eyedropper');
INSERT INTO `system_icon` VALUES (464, 'fa fa-paint-brush', 'fa fa-paint-brush');
INSERT INTO `system_icon` VALUES (465, 'fa fa-birthday-cake', 'fa fa-birthday-cake');
INSERT INTO `system_icon` VALUES (466, 'fa fa-area-chart', 'fa fa-area-chart');
INSERT INTO `system_icon` VALUES (467, 'fa fa-pie-chart', 'fa fa-pie-chart');
INSERT INTO `system_icon` VALUES (468, 'fa fa-line-chart', 'fa fa-line-chart');
INSERT INTO `system_icon` VALUES (469, 'fa fa-lastfm', 'fa fa-lastfm');
INSERT INTO `system_icon` VALUES (470, 'fa fa-lastfm-square', 'fa fa-lastfm-square');
INSERT INTO `system_icon` VALUES (471, 'fa fa-toggle-off', 'fa fa-toggle-off');
INSERT INTO `system_icon` VALUES (472, 'fa fa-toggle-on', 'fa fa-toggle-on');
INSERT INTO `system_icon` VALUES (473, 'fa fa-bicycle', 'fa fa-bicycle');
INSERT INTO `system_icon` VALUES (474, 'fa fa-bus', 'fa fa-bus');
INSERT INTO `system_icon` VALUES (475, 'fa fa-ioxhost', 'fa fa-ioxhost');
INSERT INTO `system_icon` VALUES (476, 'fa fa-angellist', 'fa fa-angellist');
INSERT INTO `system_icon` VALUES (477, 'fa fa-cc', 'fa fa-cc');
INSERT INTO `system_icon` VALUES (478, 'fa fa-ils', 'fa fa-ils');
INSERT INTO `system_icon` VALUES (479, 'fa fa-meanpath', 'fa fa-meanpath');

-- ----------------------------
-- Table structure for system_settings
-- ----------------------------
DROP TABLE IF EXISTS `system_settings`;
CREATE TABLE `system_settings`  (
  `id` int NOT NULL,
  `nama` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `logo` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `footer_left` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `footer_right` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of system_settings
-- ----------------------------
INSERT INTO `system_settings` VALUES (1, 'BANARAN AUTO <br/> SERVICE', 'User.jpg', 'CreatedBy Suryaism', '2023', 'bas.png');

-- ----------------------------
-- Table structure for tbl_verifikasi
-- ----------------------------
DROP TABLE IF EXISTS `tbl_verifikasi`;
CREATE TABLE `tbl_verifikasi`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `mac_address` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `verifikasi` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 2 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of tbl_verifikasi
-- ----------------------------
INSERT INTO `tbl_verifikasi` VALUES (1, 'E8-84-A5-E3-D0-18', 'a48ef3e3ca419e363c24f60e368503a4');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id_user` int NOT NULL AUTO_INCREMENT,
  `username` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `password` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `id_role` int NOT NULL,
  `is_active` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id_user`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', 'c93ccd78b2076528346216b3b2f701e6', 1, 1);
INSERT INTO `user` VALUES (2, 'admin1', '21232f297a57a5a743894a0e4a801fc3', 2, 1);

-- ----------------------------
-- Table structure for user_access
-- ----------------------------
DROP TABLE IF EXISTS `user_access`;
CREATE TABLE `user_access`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `id_role` int NOT NULL,
  `id_menu` int NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 10 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_access
-- ----------------------------
INSERT INTO `user_access` VALUES (1, 1, 99);
INSERT INTO `user_access` VALUES (2, 1, 1);
INSERT INTO `user_access` VALUES (3, 1, 103);
INSERT INTO `user_access` VALUES (4, 2, 1);
INSERT INTO `user_access` VALUES (5, 2, 103);
INSERT INTO `user_access` VALUES (6, 1, 105);
INSERT INTO `user_access` VALUES (7, 2, 105);
INSERT INTO `user_access` VALUES (8, 2, 106);
INSERT INTO `user_access` VALUES (9, 1, 106);

-- ----------------------------
-- Table structure for user_menu
-- ----------------------------
DROP TABLE IF EXISTS `user_menu`;
CREATE TABLE `user_menu`  (
  `id_menu` int NOT NULL AUTO_INCREMENT,
  `title` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `icon` varchar(32) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `is_active` int NOT NULL DEFAULT 1,
  `no_order` int NOT NULL,
  PRIMARY KEY (`id_menu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 107 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_menu
-- ----------------------------
INSERT INTO `user_menu` VALUES (1, 'Dashboard', 'fa fa-list', 'dashboard', 1, 1);
INSERT INTO `user_menu` VALUES (99, 'Super Admin', 'fa fa-list', NULL, 1, 0);
INSERT INTO `user_menu` VALUES (103, 'Member', 'fa fa-user', 'member', 1, 3);
INSERT INTO `user_menu` VALUES (105, 'Services', 'fa fa-pencil', 'services', 1, 4);
INSERT INTO `user_menu` VALUES (106, 'Barang', 'fa fa-file-o', '', 1, 2);

-- ----------------------------
-- Table structure for user_role
-- ----------------------------
DROP TABLE IF EXISTS `user_role`;
CREATE TABLE `user_role`  (
  `id_role` int NOT NULL AUTO_INCREMENT,
  `role` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NOT NULL,
  PRIMARY KEY (`id_role`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_role
-- ----------------------------
INSERT INTO `user_role` VALUES (1, 'Super Admin');
INSERT INTO `user_role` VALUES (2, 'Admin');

-- ----------------------------
-- Table structure for user_submenu
-- ----------------------------
DROP TABLE IF EXISTS `user_submenu`;
CREATE TABLE `user_submenu`  (
  `id_submenu` int NOT NULL AUTO_INCREMENT,
  `id_menu` int NOT NULL,
  `no_urut` int NOT NULL,
  `is_active` int NULL DEFAULT NULL,
  `url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  `title` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_0900_ai_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id_submenu`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 12 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_0900_ai_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user_submenu
-- ----------------------------
INSERT INTO `user_submenu` VALUES (1, 99, 1, 1, 'user', 'fa fa-database', 'Manage Account');
INSERT INTO `user_submenu` VALUES (4, 99, 4, 1, 'menu', 'fa fa-database', 'Manage Menu');
INSERT INTO `user_submenu` VALUES (5, 99, 2, 1, 'role', 'fa fa-database', 'Manage Role');
INSERT INTO `user_submenu` VALUES (6, 99, 3, 1, 'access', 'fa fa-database', 'Manage User Access');
INSERT INTO `user_submenu` VALUES (8, 106, 1, 1, 'masterbarang', 'fa fa-cog', 'Master Barang');
INSERT INTO `user_submenu` VALUES (9, 106, 2, 1, 'stokopname', 'fa fa-envelope-o', 'Stok Opname');
INSERT INTO `user_submenu` VALUES (10, 106, 3, 1, 'barangmasuk', 'fa fa-list-alt', 'Barang Masuk');
INSERT INTO `user_submenu` VALUES (11, 106, 4, 1, 'stok', 'fa fa-archive', 'Stok Barang');

-- ----------------------------
-- View structure for v_stok_barang
-- ----------------------------
DROP VIEW IF EXISTS `v_stok_barang`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `v_stok_barang` AS select `stok`.`id_barang` AS `id_barang`,`stok`.`kode_barang` AS `kode_barang`,`stok`.`nama_barang` AS `nama_barang`,`stok`.`is_active` AS `is_active`,`stok`.`harga` AS `harga`,`stok`.`tanggal_stok_opname` AS `tanggal_stok_opname`,`stok`.`stok_awal` AS `stok_awal`,`stok`.`stok_masuk` AS `stok_masuk`,`stok`.`stok_keluar` AS `stok_keluar`,((`stok`.`stok_awal` + `stok`.`stok_masuk`) - `stok`.`stok_keluar`) AS `stok_akhir` from (select `mb`.`id_barang` AS `id_barang`,`mb`.`kode_barang` AS `kode_barang`,`mb`.`nama_barang` AS `nama_barang`,`mb`.`is_active` AS `is_active`,`mb`.`harga` AS `harga`,`mso`.`tanggal_stok_opname` AS `tanggal_stok_opname`,(case when (`mso`.`tanggal_stok_opname` is not null) then (select `stokopname`.`jumlah_barang` from `stokopname` where ((`stokopname`.`id_barang` = `mb`.`id_barang`) and (`stokopname`.`tanggal` = `mso`.`tanggal_stok_opname`))) else 0 end) AS `stok_awal`,coalesce((select sum(`barang_masuk`.`jumlah_barang`) from `barang_masuk` where ((`barang_masuk`.`id_barang` = `mb`.`id_barang`) and (`barang_masuk`.`tanggal` > `mso`.`tanggal_stok_opname`)) group by `barang_masuk`.`id_barang`),0) AS `stok_masuk`,coalesce((select sum(coalesce(`sd`.`jumlah_barang`,0)) from (`service_detail` `sd` join `services` `s` on((`sd`.`id_service` = `s`.`id_service`))) where ((`sd`.`id_barang` = `mb`.`id_barang`) and (`s`.`tanggal` > `mso`.`tanggal_stok_opname`)) group by `sd`.`id_barang`),0) AS `stok_keluar` from (`master_barang` `mb` left join (select max(`stokopname`.`tanggal`) AS `tanggal_stok_opname`,`stokopname`.`id_barang` AS `id_barang`,`stokopname`.`kode_barang` AS `kode_barang` from `stokopname` group by `stokopname`.`id_barang`,`stokopname`.`kode_barang`) `mso` on((`mb`.`id_barang` = `mso`.`id_barang`)))) `stok`;

SET FOREIGN_KEY_CHECKS = 1;
