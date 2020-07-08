/*
Navicat MySQL Data Transfer

Source Server         : 192.168.254.128
Source Server Version : 50536
Source Host           : 192.168.254.128:3306
Source Database       : springdb

Target Server Type    : MYSQL
Target Server Version : 50536
File Encoding         : 65001

Date: 2020-07-07 22:23:54
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_permission
-- ----------------------------
INSERT INTO `p_permission` VALUES ('1', '添加用户', 'adduser', '/view/user/adduser.jsp');
INSERT INTO `p_permission` VALUES ('2', '用户列表', 'userlist', '/view/user/userlist.jsp');

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
INSERT INTO `p_role_permission` VALUES ('1', '2', '1');
INSERT INTO `p_role_permission` VALUES ('2', '1', '2');
INSERT INTO `p_role_permission` VALUES ('3', '2', '2');

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
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of p_user
-- ----------------------------
INSERT INTO `p_user` VALUES ('1', 'admin', 'c2b632dc87637a5fd03fdf9b61693d17', null, null, null, '1', null, null);
INSERT INTO `p_user` VALUES ('3', 'zhangsan', '561061e40397c7280b6740f38b318f3f', null, null, '0', '1', null, null);
INSERT INTO `p_user` VALUES ('4', 'lisi', 'e5bdb049b0e84ed17a9904cfb169f9b3', null, null, '0', '1', null, null);
INSERT INTO `p_user` VALUES ('5', 'oc_reign', 'c7c9c5aed613dff10a21583f7b97b95d', null, null, '0', '0', null, null);
INSERT INTO `p_user` VALUES ('6', 'oc_reign01', '577e51ee40779de542cc22ff1e15d43a', null, null, '0', '0', null, null);
INSERT INTO `p_user` VALUES ('7', 'oc_reign02', 'e833c8e5ecbda282772575169a728e4b', null, null, '0', '0', null, null);
INSERT INTO `p_user` VALUES ('8', '', '678d3eb95c0cfab92819ddfc60c2a8c0', null, null, '0', '1', null, null);
INSERT INTO `p_user` VALUES ('9', 'hyy', 'a18b97b0a3e9452f2f66761d00ef4c6b', null, null, '0', '1', null, null);
INSERT INTO `p_user` VALUES ('10', 'oc_reign03', '330648c44d0b16acf3c5708e8af81938', null, null, '0', '1', null, null);
INSERT INTO `p_user` VALUES ('11', 'oc_reign05', '93ccb34a2d61cf8dc7ad6e40dfff198d', null, null, '0', '1', null, null);
INSERT INTO `p_user` VALUES ('12', 'oc_reign06', '4241072237af24c9882422aafdb53be1', null, null, '0', '1', null, null);
INSERT INTO `p_user` VALUES ('13', 'oc_reign06', '4241072237af24c9882422aafdb53be1', null, null, '0', '1', null, null);
INSERT INTO `p_user` VALUES ('14', 'admin01', 'fc47cffd276b8286bcee5ff285a783de', null, null, '0', '1', null, null);
INSERT INTO `p_user` VALUES ('15', 'admin02', 'efd7d63aa87071b744c8e8a3d038bcef', null, null, '0', '1', null, null);
INSERT INTO `p_user` VALUES ('16', 'admin03', '4e41bd2ff6e30c4b3a1a5de100f5fddc', null, null, '0', '1', null, null);

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

