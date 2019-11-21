/*
 Navicat Premium Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50624
 Source Host           : localhost:3306
 Source Schema         : ss

 Target Server Type    : MySQL
 Target Server Version : 50624
 File Encoding         : 65001

 Date: 21/11/2019 12:09:15
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for t_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_permission`;
CREATE TABLE `t_permission`  (
  `permission_id` int(11) NOT NULL AUTO_INCREMENT,
  `company_id` int(11) NULL DEFAULT NULL COMMENT '公司ID',
  `enterprise_id` int(11) NULL DEFAULT NULL COMMENT '企业id',
  `alias` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '别名 例:（中文:菜单创建）',
  `name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '名称 例:(英文:MENU_CREATE)',
  `pid` int(11) NULL DEFAULT NULL COMMENT '上级权限',
  `level` int(3) NULL DEFAULT NULL COMMENT '层级',
  `create_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) ON UPDATE CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_at` timestamp(0) NOT NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '更新时间',
  `create_persion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '创建人',
  `update_persion` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '更新人',
  `permission_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面路径',
  `view_icon` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '页面图标',
  `is_button` smallint(255) NULL DEFAULT NULL COMMENT '是否是按钮',
  PRIMARY KEY (`permission_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_permission
-- ----------------------------
INSERT INTO `t_permission` VALUES (1, NULL, NULL, '管理员主页', 'auth_admin_home', NULL, 1, '2019-11-21 11:35:44', '2019-11-20 15:21:19', NULL, NULL, '/admin/home', NULL, 0);
INSERT INTO `t_permission` VALUES (2, NULL, NULL, '用户信息页', 'auth_user_info', NULL, 1, '2019-11-21 11:38:33', '2019-11-20 15:21:47', NULL, NULL, '/user/info', NULL, NULL);

-- ----------------------------
-- Table structure for t_role_permission
-- ----------------------------
DROP TABLE IF EXISTS `t_role_permission`;
CREATE TABLE `t_role_permission`  (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `role_id` int(11) NULL DEFAULT NULL COMMENT '角色ID',
  `permission_id` int(11) NULL DEFAULT NULL COMMENT '权限ID',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '公司ID',
  `enterprise_id` int(11) NULL DEFAULT NULL COMMENT '企业id',
  `delete_status` smallint(1) NULL DEFAULT NULL COMMENT '逻辑删除',
  `create_at` timestamp(0) NULL DEFAULT CURRENT_TIMESTAMP(0) COMMENT '创建时间',
  `update_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_1`(`role_id`) USING BTREE,
  INDEX `FK_Reference_18`(`company_id`) USING BTREE,
  INDEX `FK_Reference_2`(`permission_id`) USING BTREE,
  INDEX `FK_Reference_35`(`enterprise_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role_permission
-- ----------------------------
INSERT INTO `t_role_permission` VALUES (1, 1, 1, NULL, NULL, 1, '2019-11-20 15:22:36', NULL);
INSERT INTO `t_role_permission` VALUES (2, 2, 2, NULL, NULL, 1, '2019-11-20 15:22:42', NULL);

-- ----------------------------
-- Table structure for t_role_tbl
-- ----------------------------
DROP TABLE IF EXISTS `t_role_tbl`;
CREATE TABLE `t_role_tbl`  (
  `role_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户角色 二级管理员id 为 8 管理员id 为 1 写死',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '公司ID',
  `enterprise_id` int(11) NULL DEFAULT NULL COMMENT '企业id',
  `role_name` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色名',
  `role_code` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '角色code',
  `delete_status` smallint(1) NULL DEFAULT NULL COMMENT '逻辑删除',
  `create_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`role_id`) USING BTREE,
  INDEX `FK_Reference_19`(`company_id`) USING BTREE,
  INDEX `FK_Reference_32`(`enterprise_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_role_tbl
-- ----------------------------
INSERT INTO `t_role_tbl` VALUES (1, 1, 1, '管理员', 'admin', 1, '2019-06-03 17:36:00', NULL);
INSERT INTO `t_role_tbl` VALUES (2, 1, 1, '用户', 'user', 1, NULL, NULL);

-- ----------------------------
-- Table structure for t_user_role
-- ----------------------------
DROP TABLE IF EXISTS `t_user_role`;
CREATE TABLE `t_user_role`  (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT '自动增加',
  `role_id` int(11) NULL DEFAULT NULL COMMENT '用户角色',
  `user_id` int(11) NULL DEFAULT NULL COMMENT '用户ID',
  `enterprise_id` int(11) NULL DEFAULT NULL COMMENT '企业ID',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '公司ID',
  `delete_status` smallint(1) NULL DEFAULT NULL COMMENT '逻辑删除',
  `create_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE,
  INDEX `FK_Reference_31`(`enterprise_id`) USING BTREE,
  INDEX `FK_Reference_33`(`company_id`) USING BTREE,
  INDEX `FK_Reference_4`(`user_id`) USING BTREE,
  INDEX `FK_Reference_5`(`role_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 108 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_role
-- ----------------------------
INSERT INTO `t_user_role` VALUES (105, 1, 1, NULL, NULL, NULL, NULL, NULL);
INSERT INTO `t_user_role` VALUES (106, 2, 2, NULL, NULL, NULL, NULL, NULL);

-- ----------------------------
-- Table structure for t_user_tbl
-- ----------------------------
DROP TABLE IF EXISTS `t_user_tbl`;
CREATE TABLE `t_user_tbl`  (
  `user_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '用户ID',
  `user_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '用户名字',
  `password` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '密码',
  `nick_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '昵称',
  `head_portrait_url` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '头像地址',
  `department_id` int(11) NULL DEFAULT NULL COMMENT '部门ID',
  `company_id` int(11) NULL DEFAULT NULL COMMENT '公司ID ',
  `enterprise_id` int(11) NULL DEFAULT NULL COMMENT '企业ID',
  `enterprise_name` varchar(200) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '企业名称',
  `is_stop` smallint(4) NULL DEFAULT NULL COMMENT '用户停用标志，1：停用；0：未停用 默认为未停用',
  `mobile` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '手机',
  `email` varchar(255) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '邮箱',
  `is_login` smallint(6) NULL DEFAULT NULL COMMENT '是否登录',
  `login_ip` varchar(50) CHARACTER SET utf8mb4 COLLATE utf8mb4_general_ci NULL DEFAULT NULL COMMENT '登录ip',
  `last_login_time` timestamp(0) NULL DEFAULT NULL COMMENT '上次登录时间',
  `last_logout_time` timestamp(0) NULL DEFAULT NULL COMMENT '上次退出时间',
  `delete_status` smallint(6) NULL DEFAULT 1 COMMENT '逻辑删除',
  `create_at` timestamp(0) NULL DEFAULT NULL COMMENT '创建时间',
  `update_at` timestamp(0) NULL DEFAULT NULL COMMENT '更新时间',
  PRIMARY KEY (`user_id`) USING BTREE
) ENGINE = InnoDB AUTO_INCREMENT = 3 CHARACTER SET = utf8mb4 COLLATE = utf8mb4_general_ci COMMENT = '用户表' ROW_FORMAT = Compact;

-- ----------------------------
-- Records of t_user_tbl
-- ----------------------------
INSERT INTO `t_user_tbl` VALUES (1, 'admin1', '$2a$10$HbSJUPk0ezeJ1W1oLpk/pOuoVEVhQGou.jUEKo66XjVZQFoyLsT8e', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);
INSERT INTO `t_user_tbl` VALUES (2, 'user1', '$2a$10$HbSJUPk0ezeJ1W1oLpk/pOuoVEVhQGou.jUEKo66XjVZQFoyLsT8e', NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL, NULL, NULL, NULL, NULL, 1, NULL, NULL);

SET FOREIGN_KEY_CHECKS = 1;
