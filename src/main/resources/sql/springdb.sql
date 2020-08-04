/*
Navicat MySQL Data Transfer

Source Server         : win192.168.254.128
Source Server Version : 50536
Source Host           : 192.168.254.128:3306
Source Database       : springdb

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2020-07-15 19:33:03
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `p_permission`
-- ----------------------------
DROP TABLE IF EXISTS `p_permission`;
CREATE TABLE `p_permission` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  `url` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_permission
-- ----------------------------
INSERT INTO `p_permission` VALUES ('1', '图标', 'anon', '/favicon.ico');
INSERT INTO `p_permission` VALUES ('2', '静态资源', 'anon', '/static/**');
INSERT INTO `p_permission` VALUES ('3', '登录', 'anon', '/shiros/login.do');
INSERT INTO `p_permission` VALUES ('4', '注册页面', 'anon', '/view/register.jsp');
INSERT INTO `p_permission` VALUES ('5', '注册接口', 'anon', '/shiros/register.do');
INSERT INTO `p_permission` VALUES ('6', '首页', 'user', '/view/index.jsp');
INSERT INTO `p_permission` VALUES ('7', 'shiro模块', 'user', '/shiros/**');
INSERT INTO `p_permission` VALUES ('8', '上传头像', 'user', '/users/uploadPhoto.do');
INSERT INTO `p_permission` VALUES ('9', '用户列表', 'perms[userlist]', '/view/user/userlist.jsp');
INSERT INTO `p_permission` VALUES ('10', '添加用户', 'perms[adduser]', '/view/user/adduser.jsp');
INSERT INTO `p_permission` VALUES ('11', '登出', 'logout', '/shiros/logout.do');
INSERT INTO `p_permission` VALUES ('12', '全局', 'authc', '/**');

-- ----------------------------
-- Table structure for `p_role`
-- ----------------------------
DROP TABLE IF EXISTS `p_role`;
CREATE TABLE `p_role` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) DEFAULT NULL,
  `code` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_role
-- ----------------------------
INSERT INTO `p_role` VALUES ('1', '普通用户', 'user');
INSERT INTO `p_role` VALUES ('2', '管理员', 'admin');

-- ----------------------------
-- Table structure for `p_role_permission`
-- ----------------------------
DROP TABLE IF EXISTS `p_role_permission`;
CREATE TABLE `p_role_permission` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `rid` bigint(11) DEFAULT NULL,
  `pid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_role_permission
-- ----------------------------
INSERT INTO `p_role_permission` VALUES ('1', '1', '8');
INSERT INTO `p_role_permission` VALUES ('2', '2', '8');
INSERT INTO `p_role_permission` VALUES ('3', '2', '9');

-- ----------------------------
-- Table structure for `p_user`
-- ----------------------------
DROP TABLE IF EXISTS `p_user`;
CREATE TABLE `p_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `phone` varchar(255) DEFAULT NULL,
  `createTime` varchar(255) DEFAULT NULL,
  `type` int(11) DEFAULT NULL,
  `status` int(11) DEFAULT NULL,
  `opLog` varchar(255) DEFAULT NULL,
  `faceId` varchar(255) DEFAULT NULL,
  `photoURL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_user
-- ----------------------------
INSERT INTO `p_user` VALUES ('1', 'admin', 'c2b632dc87637a5fd03fdf9b61693d17', null, null, null, '1', null, null, null);
INSERT INTO `p_user` VALUES ('3', 'zhangsan', '561061e40397c7280b6740f38b318f3f', null, null, '0', '1', null, null, null);

-- ----------------------------
-- Table structure for `p_user_role`
-- ----------------------------
DROP TABLE IF EXISTS `p_user_role`;
CREATE TABLE `p_user_role` (
  `id` bigint(11) NOT NULL AUTO_INCREMENT,
  `uid` bigint(11) DEFAULT NULL,
  `rid` bigint(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_user_role
-- ----------------------------
INSERT INTO `p_user_role` VALUES ('1', '1', '2');
INSERT INTO `p_user_role` VALUES ('2', '3', '1');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(50) DEFAULT NULL,
  `age` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
