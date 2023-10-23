/*
 Navicat Premium Data Transfer

 Source Server         : sman4
 Source Server Type    : MySQL
 Source Server Version : 100421 (10.4.21-MariaDB)
 Source Host           : localhost:3306
 Source Schema         : db_keuangan

 Target Server Type    : MySQL
 Target Server Version : 100421 (10.4.21-MariaDB)
 File Encoding         : 65001

 Date: 18/10/2023 13:20:55
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dana_keluar
-- ----------------------------
DROP TABLE IF EXISTS `dana_keluar`;
CREATE TABLE `dana_keluar`  (
  `id_keluar` int NOT NULL AUTO_INCREMENT,
  `kode_anggaran` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `dana_keluar` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keperluan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_keluar`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 35 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dana_keluar
-- ----------------------------

-- ----------------------------
-- Table structure for dana_masuk
-- ----------------------------
DROP TABLE IF EXISTS `dana_masuk`;
CREATE TABLE `dana_masuk`  (
  `id_masuk` int NOT NULL AUTO_INCREMENT,
  `kode_anggaran` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `nama` varchar(100) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `kelas` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `tanggal` date NOT NULL,
  `dana_masuk` varchar(12) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `keterangan` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id_masuk`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 83 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of dana_masuk
-- ----------------------------

-- ----------------------------
-- Table structure for kelas
-- ----------------------------
DROP TABLE IF EXISTS `kelas`;
CREATE TABLE `kelas`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `nama_kelas` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 31 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of kelas
-- ----------------------------
INSERT INTO `kelas` VALUES (1, 'X -1');
INSERT INTO `kelas` VALUES (2, 'X - 2');
INSERT INTO `kelas` VALUES (3, 'X - 3');
INSERT INTO `kelas` VALUES (4, 'X - 4');
INSERT INTO `kelas` VALUES (5, 'X - 5');
INSERT INTO `kelas` VALUES (6, 'X - 6');
INSERT INTO `kelas` VALUES (7, 'X - 7');
INSERT INTO `kelas` VALUES (8, 'X - 8');
INSERT INTO `kelas` VALUES (9, 'XI - MIPA 1');
INSERT INTO `kelas` VALUES (10, 'XI - MIPA 2');
INSERT INTO `kelas` VALUES (11, 'XI - MIPA 3');
INSERT INTO `kelas` VALUES (12, 'XI - MIPA 4');
INSERT INTO `kelas` VALUES (13, 'XI - MIPA 5');
INSERT INTO `kelas` VALUES (14, 'XI - MIPA 6');
INSERT INTO `kelas` VALUES (15, 'XI - MIPA 7');
INSERT INTO `kelas` VALUES (16, 'XI - IPS 1');
INSERT INTO `kelas` VALUES (17, 'XI - IPS 2');
INSERT INTO `kelas` VALUES (18, 'XI - IPS 3');
INSERT INTO `kelas` VALUES (19, 'XI - IPS 4');
INSERT INTO `kelas` VALUES (20, 'XII - MIPA 1');
INSERT INTO `kelas` VALUES (21, 'XII - MIPA 2');
INSERT INTO `kelas` VALUES (22, 'XII - MIPA 3');
INSERT INTO `kelas` VALUES (23, 'XII - MIPA 4');
INSERT INTO `kelas` VALUES (24, 'XII - MIPA 5');
INSERT INTO `kelas` VALUES (25, 'XII - MIPA 6');
INSERT INTO `kelas` VALUES (26, 'XII - MIPA 7');
INSERT INTO `kelas` VALUES (27, 'XII - IPS 1');
INSERT INTO `kelas` VALUES (28, 'XII - IPS 2');
INSERT INTO `kelas` VALUES (29, 'XII - IPS 3');
INSERT INTO `kelas` VALUES (30, 'XII - IPS 4');

-- ----------------------------
-- Table structure for keuangan
-- ----------------------------
DROP TABLE IF EXISTS `keuangan`;
CREATE TABLE `keuangan`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `kode_anggaran` varchar(11) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `saldo` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `nama_anggaran` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 7 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of keuangan
-- ----------------------------
INSERT INTO `keuangan` VALUES (4, 'A.2023', '0', 'KOMITE');
INSERT INTO `keuangan` VALUES (5, 'B.2023', '0', 'BOS');
INSERT INTO `keuangan` VALUES (6, 'C.2023', '0', 'BOPD');

-- ----------------------------
-- Table structure for user
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `password` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `photo` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  `login_session_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `email_status` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `password_expire_date` datetime NULL DEFAULT '2024-01-06 00:00:00',
  `password_reset_key` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL,
  `roles` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 4 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Dynamic;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES (1, 'admin', '$2y$10$ZVvysc9TcD2XvX4uPwgfKOMPsXg9svTGdHu2Os9eleGknNdnNjbLm', 'shinichiwildan@outlook.com', 'http://localhost:81/keuangan/uploads/files/logo.png', NULL, NULL, '2024-01-06 00:00:00', NULL, 'admin');
INSERT INTO `user` VALUES (2, 'kepsek', '$2y$10$1MQfcHAQ8E/hoGQd0J0Vre7k1Cjh96.XpyilYKeToAfE/mg8vibSa', '', '', NULL, NULL, '2024-01-06 00:00:00', NULL, 'kepsek');
INSERT INTO `user` VALUES (3, 'sman4', '$2y$10$7JGsKLnVt5YTEtaH7Z.PqeaEnQTVXVPQviu4mKLwqm1Mstdgqsk3a', '', '', NULL, NULL, '2024-01-06 00:00:00', NULL, 'user');

-- ----------------------------
-- Triggers structure for table dana_keluar
-- ----------------------------
DROP TRIGGER IF EXISTS `keluar`;
delimiter ;;
CREATE TRIGGER `keluar` AFTER INSERT ON `dana_keluar` FOR EACH ROW BEGIN
UPDATE keuangan SET saldo = saldo - NEW.dana_keluar
WHERE kode_anggaran = NEW.kode_anggaran;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table dana_keluar
-- ----------------------------
DROP TRIGGER IF EXISTS `hapusk`;
delimiter ;;
CREATE TRIGGER `hapusk` AFTER DELETE ON `dana_keluar` FOR EACH ROW BEGIN
UPDATE keuangan SET saldo = saldo + OLD.dana_keluar
WHERE kode_anggaran = OLD.kode_anggaran;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table dana_masuk
-- ----------------------------
DROP TRIGGER IF EXISTS `masuk`;
delimiter ;;
CREATE TRIGGER `masuk` AFTER INSERT ON `dana_masuk` FOR EACH ROW BEGIN
UPDATE keuangan SET saldo = saldo + NEW.dana_masuk
WHERE kode_anggaran = NEW.kode_anggaran;
END
;;
delimiter ;

-- ----------------------------
-- Triggers structure for table dana_masuk
-- ----------------------------
DROP TRIGGER IF EXISTS `hapus`;
delimiter ;;
CREATE TRIGGER `hapus` AFTER DELETE ON `dana_masuk` FOR EACH ROW BEGIN
UPDATE keuangan SET saldo = saldo - OLD.dana_masuk
WHERE kode_anggaran = OLD.kode_anggaran;
END
;;
delimiter ;

SET FOREIGN_KEY_CHECKS = 1;
