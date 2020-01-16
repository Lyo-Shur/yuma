/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50528
Source Host           : localhost:3306
Source Database       : test

Target Server Type    : MYSQL
Target Server Version : 50528
File Encoding         : 65001

Date: 2020-01-16 10:50:26
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for yuma_group
-- ----------------------------
DROP TABLE IF EXISTS `yuma_group`;
CREATE TABLE `yuma_group` (
  `group_key` varchar(255) NOT NULL COMMENT 'group_key',
  PRIMARY KEY (`group_key`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='yuma_group';

-- ----------------------------
-- Records of yuma_group
-- ----------------------------
INSERT INTO `yuma_group` VALUES ('admin');

-- ----------------------------
-- Table structure for yuma_group_permission
-- ----------------------------
DROP TABLE IF EXISTS `yuma_group_permission`;
CREATE TABLE `yuma_group_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `group_key` varchar(255) NOT NULL COMMENT 'group_key',
  `permission_id` int(11) NOT NULL COMMENT 'permission_id',
  PRIMARY KEY (`id`),
  KEY `group_key` (`group_key`),
  KEY `permission_id` (`permission_id`),
  CONSTRAINT `yuma_group_permission_ibfk_1` FOREIGN KEY (`group_key`) REFERENCES `yuma_group` (`group_key`) ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `yuma_group_permission_ibfk_2` FOREIGN KEY (`permission_id`) REFERENCES `yuma_permission` (`id`) ON DELETE CASCADE ON UPDATE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='yuma_group_permission';

-- ----------------------------
-- Records of yuma_group_permission
-- ----------------------------
INSERT INTO `yuma_group_permission` VALUES ('1', 'admin', '1');
INSERT INTO `yuma_group_permission` VALUES ('2', 'admin', '2');
INSERT INTO `yuma_group_permission` VALUES ('3', 'admin', '3');
INSERT INTO `yuma_group_permission` VALUES ('4', 'admin', '4');
INSERT INTO `yuma_group_permission` VALUES ('5', 'admin', '5');

-- ----------------------------
-- Table structure for yuma_permission
-- ----------------------------
DROP TABLE IF EXISTS `yuma_permission`;
CREATE TABLE `yuma_permission` (
  `id` int(11) NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `permission_key` varchar(255) NOT NULL COMMENT 'permission_key',
  `memo` varchar(255) NOT NULL COMMENT 'memo',
  `father_id` int(11) NOT NULL COMMENT 'father_id',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='yuma_permission';

-- ----------------------------
-- Records of yuma_permission
-- ----------------------------
INSERT INTO `yuma_permission` VALUES ('1', 'root', 'root', '-1');
INSERT INTO `yuma_permission` VALUES ('2', 'file', 'file', '1');
INSERT INTO `yuma_permission` VALUES ('3', 'sign', 'sign', '1');
INSERT INTO `yuma_permission` VALUES ('4', 'list', 'list', '2');
INSERT INTO `yuma_permission` VALUES ('5', 'delete', 'delete', '2');
