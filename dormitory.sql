/*
 Navicat Premium Data Transfer

 Source Server         : manjaro
 Source Server Type    : MySQL
 Source Server Version : 80033 (8.0.33)
 Source Host           : 192.168.103.130:3306
 Source Schema         : dormitory

 Target Server Type    : MySQL
 Target Server Version : 80033 (8.0.33)
 File Encoding         : 65001

 Date: 27/06/2023 18:35:15
*/
CREATE DATABASE /*!32312 IF NOT EXISTS*/ `dormitory` /*!40100 DEFAULT CHARACTER SET utf8 */ /*!80016 DEFAULT ENCRYPTION='N' */;

USE `dormitory`;

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for absent
-- ----------------------------
DROP TABLE IF EXISTS `absent`;
CREATE TABLE `absent`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_id` int NULL DEFAULT NULL,
  `dormitory_id` int NULL DEFAULT NULL,
  `student_id` int NULL DEFAULT NULL,
  `dormitory_admin_id` int NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `reason` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 17 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of absent
-- ----------------------------
INSERT INTO `absent` VALUES (13, 1, 2, 5, 16, '2022-04-16', '请假');
INSERT INTO `absent` VALUES (14, 1, 1, 1, 1, '2022-04-26', '请假');
INSERT INTO `absent` VALUES (15, 2, 5, 63, 1, '2022-04-26', '请假');
INSERT INTO `absent` VALUES (16, 1, 2, 6, 1, '2023-06-12', '请假');

-- ----------------------------
-- Table structure for building
-- ----------------------------
DROP TABLE IF EXISTS `building`;
CREATE TABLE `building`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `name` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `introduction` varchar(1000) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `admin_id` int NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of building
-- ----------------------------
INSERT INTO `building` VALUES (1, '1号楼', '机械工程学院宿舍楼', 16);
INSERT INTO `building` VALUES (2, '2号楼', '计算机学院宿舍楼', 16);
INSERT INTO `building` VALUES (5, '5号楼', '计算机学院宿舍楼', 16);

-- ----------------------------
-- Table structure for dormitory
-- ----------------------------
DROP TABLE IF EXISTS `dormitory`;
CREATE TABLE `dormitory`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_id` int NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `type` int NULL DEFAULT NULL,
  `available` int NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 307 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dormitory
-- ----------------------------
INSERT INTO `dormitory` VALUES (2, 1, '102', 4, 0, '88230002');
INSERT INTO `dormitory` VALUES (3, 1, '211', 4, 0, '88230007');
INSERT INTO `dormitory` VALUES (4, 2, '212', 6, 0, '88230008');
INSERT INTO `dormitory` VALUES (5, 2, '321', 8, 0, '88230013');
INSERT INTO `dormitory` VALUES (6, 2, '322', 10, 9, '88230016');
INSERT INTO `dormitory` VALUES (36, 1, '666', 6, 6, '88136666');
INSERT INTO `dormitory` VALUES (306, 2, '机械系', 6, 6, '80000076');

-- ----------------------------
-- Table structure for dormitory_admin
-- ----------------------------
DROP TABLE IF EXISTS `dormitory_admin`;
CREATE TABLE `dormitory_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `gender` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 21 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of dormitory_admin
-- ----------------------------
INSERT INTO `dormitory_admin` VALUES (1, 'll', '123123', '宋玉', '女', '13312345678');
INSERT INTO `dormitory_admin` VALUES (2, 'ww', '123123', '王力', '男', '13612345678');
INSERT INTO `dormitory_admin` VALUES (20, 'dd', '123456', '李乐', '男', '12879635633');

-- ----------------------------
-- Table structure for fix
-- ----------------------------
DROP TABLE IF EXISTS `fix`;
CREATE TABLE `fix`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `building_id` int NULL DEFAULT NULL,
  `dormitory_id` int NULL DEFAULT NULL,
  `student_id` int NULL DEFAULT NULL,
  `dormitory_admin_id` int NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `reason` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of fix
-- ----------------------------
INSERT INTO `fix` VALUES (13, 1, 2, 5, 16, '2022-04-16', '窗户损坏');
INSERT INTO `fix` VALUES (14, 1, 1, 1, 1, '2022-04-26', '门把手损坏');
INSERT INTO `fix` VALUES (15, 2, 5, 63, 1, '2022-04-26', '空调坏了');
INSERT INTO `fix` VALUES (16, 1, 1, 1, 16, '2023-05-31', '门坏了');
INSERT INTO `fix` VALUES (17, 2, 5, 69, 16, '2023-06-07', '水管坏了');

-- ----------------------------
-- Table structure for moveout
-- ----------------------------
DROP TABLE IF EXISTS `moveout`;
CREATE TABLE `moveout`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `student_id` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dormitory_id` varchar(50) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `reason` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 18 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of moveout
-- ----------------------------
INSERT INTO `moveout` VALUES (15, '63', '6', '毕业', '2022-04-17');
INSERT INTO `moveout` VALUES (17, '18', '4', '毕业', '2022-04-27');

-- ----------------------------
-- Table structure for pre_admin
-- ----------------------------
DROP TABLE IF EXISTS `pre_admin`;
CREATE TABLE `pre_admin`  (
  `pre_adm_username` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pre_adm_password` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pre_adm_name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pre_adm_gender` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pre_adm_tele` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pre_admin
-- ----------------------------
INSERT INTO `pre_admin` VALUES ('mm', '123456', '11', '1', '11111111111');

-- ----------------------------
-- Table structure for pre_stu
-- ----------------------------
DROP TABLE IF EXISTS `pre_stu`;
CREATE TABLE `pre_stu`  (
  `stu_num` varchar(15) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pre_stu_name` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pre_stu_gender` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pre_stu_dormitory_id` int NULL DEFAULT NULL,
  `pre_stu_state` varchar(10) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `pre_stu_date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL
) ENGINE = InnoDB CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of pre_stu
-- ----------------------------

-- ----------------------------
-- Table structure for student
-- ----------------------------
DROP TABLE IF EXISTS `student`;
CREATE TABLE `student`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `number` varchar(11) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `gender` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `dormitory_id` int NULL DEFAULT NULL,
  `state` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `create_date` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 72 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of student
-- ----------------------------
INSERT INTO `student` VALUES (1, '020', '乐在', '男', 5, '入住', '2022-04-14');
INSERT INTO `student` VALUES (2, '002', '曹海', '男', 5, '入住', '2022-04-14');
INSERT INTO `student` VALUES (3, '003', '李力', '男', 5, '入住', '2022-04-14');
INSERT INTO `student` VALUES (4, '004', '赵昭', '男', 5, '入住', '2022-04-14');
INSERT INTO `student` VALUES (5, '005', '王维利', '男', 2, '入住', '2022-04-14');
INSERT INTO `student` VALUES (6, '006', '李双', '女', 2, '入住', '2022-04-14');
INSERT INTO `student` VALUES (7, '007', '李小峰', '男', 2, '入住', '2022-04-14');
INSERT INTO `student` VALUES (8, '008', '孙奇', '男', 2, '入住', '2022-04-14');
INSERT INTO `student` VALUES (9, '009', '李立', '女', 3, '入住', '2022-04-14');
INSERT INTO `student` VALUES (10, '010', '周华发', '男', 3, '入住', '2022-04-14');
INSERT INTO `student` VALUES (11, '011', '赵正义', '男', 3, '入住', '2022-04-14');
INSERT INTO `student` VALUES (12, '012', '李明', '男', 3, '入住', '2022-04-14');
INSERT INTO `student` VALUES (13, '013', '许鹏飞', '男', 4, '入住', '2022-04-14');
INSERT INTO `student` VALUES (14, '014', '朱海', '男', 4, '入住', '2022-04-14');
INSERT INTO `student` VALUES (15, '015', '苏苏苏', '男', 4, '入住', '2022-04-14');
INSERT INTO `student` VALUES (16, '016', '李雪', '女', 4, '入住', '2022-04-14');
INSERT INTO `student` VALUES (17, '017', '李爽', '女', 4, '入住', '2022-04-14');
INSERT INTO `student` VALUES (18, '018', '王纯', '女', 4, '迁出', '2022-04-14');
INSERT INTO `student` VALUES (63, '019', '小明', '男', 5, '迁出', '2022-04-17');
INSERT INTO `student` VALUES (67, '774', '祁明', '男', 4, '入住', '2020-04-17');
INSERT INTO `student` VALUES (68, '020', '摊位人', '男', 5, '入住', '2023-06-26');
INSERT INTO `student` VALUES (70, '2020218166', '李其', '男', 6, '入住', '2023-06-27');
INSERT INTO `student` VALUES (71, '2020218466', '李强', '男', 5, '入住', '2023-06-27');

-- ----------------------------
-- Table structure for system_admin
-- ----------------------------
DROP TABLE IF EXISTS `system_admin`;
CREATE TABLE `system_admin`  (
  `id` int NOT NULL AUTO_INCREMENT,
  `username` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `password` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `name` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  `telephone` varchar(20) CHARACTER SET utf8mb3 COLLATE utf8mb3_general_ci NULL DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb3 COLLATE = utf8mb3_general_ci ROW_FORMAT = DYNAMIC;

-- ----------------------------
-- Records of system_admin
-- ----------------------------
INSERT INTO `system_admin` VALUES (1, 'qiming', '123456789', '祁明', '17538143425');
INSERT INTO `system_admin` VALUES (2, 'admin', '123456', '管理员', '00000000');

-- ----------------------------
-- View structure for secure_view1
-- ----------------------------
DROP VIEW IF EXISTS `secure_view1`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `secure_view1` AS select `b`.`id` AS `id`,`b`.`introduction` AS `introduction`,`da`.`username` AS `username`,`da`.`telephone` AS `telephone`,`d`.`name` AS `name` from ((`building` `b` join `dormitory` `d`) join `dormitory_admin` `da`) where ((`b`.`id` = 1) and (`d`.`building_id` = `b`.`id`) and (`b`.`id` = `da`.`id`));

-- ----------------------------
-- View structure for secure_view2
-- ----------------------------
DROP VIEW IF EXISTS `secure_view2`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `secure_view2` AS select `b`.`id` AS `id`,`b`.`introduction` AS `introduction`,`da`.`username` AS `username`,`da`.`telephone` AS `telephone`,`d`.`name` AS `name` from ((`building` `b` join `dormitory` `d`) join `dormitory_admin` `da`) where ((`b`.`id` = 2) and (`d`.`building_id` = `b`.`id`) and (`b`.`id` = `da`.`id`));

-- ----------------------------
-- View structure for secure_view3
-- ----------------------------
DROP VIEW IF EXISTS `secure_view3`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `secure_view3` AS select `b`.`id` AS `id`,`b`.`introduction` AS `introduction`,`da`.`username` AS `username`,`da`.`telephone` AS `telephone`,`d`.`name` AS `name` from ((`building` `b` join `dormitory` `d`) join `dormitory_admin` `da`) where ((`b`.`id` = 16) and (`d`.`building_id` = `b`.`id`) and (`b`.`id` = `da`.`id`));

-- ----------------------------
-- View structure for student_absent_view
-- ----------------------------
DROP VIEW IF EXISTS `student_absent_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `student_absent_view` AS select `s`.`id` AS `id`,`s`.`number` AS `number`,`s`.`name` AS `name`,count(`a`.`student_id`) AS `absence_count` from (`student` `s` left join `absent` `a` on((`s`.`id` = `a`.`student_id`))) group by `s`.`id`,`s`.`number`,`s`.`name`;

-- ----------------------------
-- View structure for student_moveout_view
-- ----------------------------
DROP VIEW IF EXISTS `student_moveout_view`;
CREATE ALGORITHM = UNDEFINED SQL SECURITY DEFINER VIEW `student_moveout_view` AS select `s`.`number` AS `number`,`s`.`name` AS `name`,`m`.`dormitory_id` AS `dormitory_id`,`m`.`reason` AS `reason`,`m`.`create_date` AS `create_date` from (`student` `s` join `moveout` `m` on((`s`.`id` = `m`.`student_id`)));

SET FOREIGN_KEY_CHECKS = 1;
