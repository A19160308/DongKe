/*
Navicat MySQL Data Transfer

Source Server         : jiepeixun
Source Server Version : 50722
Source Host           : localhost:3306
Source Database       : xpxdemo

Target Server Type    : MYSQL
Target Server Version : 50722
File Encoding         : 65001

Date: 2019-03-19 11:05:21
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for plant_message
-- ----------------------------
DROP TABLE IF EXISTS `plant_message`;
CREATE TABLE `plant_message` (
  `plant_name` varchar(30) DEFAULT NULL,
  `img_big` varchar(30) DEFAULT NULL,
  `img_s1` varchar(30) DEFAULT NULL,
  `img_s2` varchar(30) DEFAULT NULL,
  `img_s3` varchar(30) DEFAULT NULL,
  `big_note` varchar(30) DEFAULT NULL,
  `plant_score` double(11,1) unsigned DEFAULT NULL,
  `plant_flag` int(11) NOT NULL DEFAULT '1',
  `plant_id` int(11) NOT NULL AUTO_INCREMENT,
  `plant_text` varchar(30) DEFAULT NULL,
  `plant_final` int(11) NOT NULL DEFAULT '0',
  PRIMARY KEY (`plant_id`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plant_message
-- ----------------------------
INSERT INTO `plant_message` VALUES ('细叶百合', '细叶百合 (1).jpg', '细叶百合 (2).jpg', '细叶百合 (3).jpg', '细叶百合 (4).jpg', '细叶百合 (1).docx', '1.0', '1', '37', '1', '1');
INSERT INTO `plant_message` VALUES ('黄花菜', '黄花菜（小花萱草） (1).jpg', '黄花菜（小花萱草） (2).jpg', '黄花菜（小花萱草） (3).jpg', '黄花菜（小花萱草） (4).jpg', '黄花菜（小花萱草） (1).docx', '0.0', '1', '38', '0', '2');
INSERT INTO `plant_message` VALUES ('草木犀', '草木犀 (1).jpg', '草木犀 (2).jpg', '草木犀 (3).jpg', '草木犀 (4).jpg', '草木犀 (1).docx', '0.9', '2', '39', '0.9', '1');
INSERT INTO `plant_message` VALUES ('扁茎黄耆', '扁茎黄耆   (1).jpg', '扁茎黄耆   (2).jpg', '扁茎黄耆   (3).jpg', '扁茎黄耆   (4).png', 'null', '0.0', '1', '40', '0', '2');
INSERT INTO `plant_message` VALUES ('紫花苜蓿', '紫花苜蓿 (1).gif', '紫花苜蓿 (2).jpg', '紫花苜蓿 (3).jpg', '紫花苜蓿 (4).jpg', '紫花苜蓿 (1).docx', '1.0', '1', '41', '1', '1');
INSERT INTO `plant_message` VALUES ('白三叶', '白三叶 (1).jpg', '白三叶 (2).jpg', '白三叶 (3).jpg', '白三叶 (4).png', '白三叶 (1).docx', '1.0', '1', '42', '1', '1');
INSERT INTO `plant_message` VALUES ('草地早熟禾', '草地早熟禾   (1).png', '草地早熟禾   (2).png', '草地早熟禾   (3).jpg', '草地早熟禾   (4).png', '草地早熟禾   (1).docx', '0.0', '2', '43', '0', '2');
INSERT INTO `plant_message` VALUES ('苍耳', '苍耳 (1).jpg', '苍耳 (2).jpg', '苍耳 (3).jpg', '苍耳 (4).png', '苍耳 (1).docx', '0.9', '2', '44', '0.9', '1');
INSERT INTO `plant_message` VALUES ('大籽蒿', '大籽蒿 (1).png', '大籽蒿 (2).png', '大籽蒿 (3).png', '大籽蒿 (4).png', '大籽蒿 (1).docx', '1.0', '1', '45', '1', '1');
INSERT INTO `plant_message` VALUES ('山马兰', '山马兰 (1).jpg', '山马兰 (2).jpg', '山马兰 (3).png', '山马兰 (4).png', '山马兰 (1).docx', '0.0', '1', '46', '0', '2');

-- ----------------------------
-- Table structure for record
-- ----------------------------
DROP TABLE IF EXISTS `record`;
CREATE TABLE `record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_id` int(11) DEFAULT NULL,
  `plant_id` int(11) DEFAULT NULL,
  `score` double(11,1) DEFAULT NULL,
  `score_text` varchar(30) NOT NULL DEFAULT '',
  `final_flag` int(11) NOT NULL DEFAULT '0' COMMENT '返回看错题界面  判断这个题是不是已经做过(非0) 也判断是否提示(1和2)',
  `record_flag` int(11) NOT NULL DEFAULT '1' COMMENT '只为判断 是否提示 用于newdisplay展示 ',
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of record
-- ----------------------------
INSERT INTO `record` VALUES ('44', '5', '37', '1.0', '1', '1', '1');
INSERT INTO `record` VALUES ('45', '5', '38', '0.0', '0', '2', '1');
INSERT INTO `record` VALUES ('46', '5', '39', '0.9', '0.9', '1', '2');
INSERT INTO `record` VALUES ('47', '5', '40', '0.0', '0', '2', '1');
INSERT INTO `record` VALUES ('48', '5', '41', '1.0', '1', '1', '1');
INSERT INTO `record` VALUES ('49', '5', '42', '1.0', '1', '1', '1');
INSERT INTO `record` VALUES ('50', '5', '43', '0.0', '0', '2', '2');
INSERT INTO `record` VALUES ('51', '5', '44', '0.9', '0.9', '1', '2');
INSERT INTO `record` VALUES ('52', '5', '45', '1.0', '1', '1', '1');
INSERT INTO `record` VALUES ('53', '5', '46', '0.0', '0', '2', '1');

-- ----------------------------
-- Table structure for score_record
-- ----------------------------
DROP TABLE IF EXISTS `score_record`;
CREATE TABLE `score_record` (
  `record_id` int(11) NOT NULL AUTO_INCREMENT,
  `stu_name` varchar(30) DEFAULT NULL,
  `s_1` double(30,0) DEFAULT NULL,
  `s_2` double(30,0) DEFAULT NULL,
  `s_3` double(30,0) DEFAULT NULL,
  `s_4` double(30,0) DEFAULT NULL,
  `s_5` double(30,0) DEFAULT NULL,
  `s_6` double(30,0) DEFAULT NULL,
  `s_7` double(30,0) DEFAULT NULL,
  `s_8` double(30,0) DEFAULT NULL,
  `s_9` double(30,0) DEFAULT NULL,
  `s_10` double(30,0) DEFAULT NULL,
  `s_11` double(30,0) DEFAULT NULL,
  `s_12` double(30,0) DEFAULT NULL,
  `s_13` double(30,0) DEFAULT NULL,
  `s_14` double(30,0) DEFAULT NULL,
  `s_15` double(30,0) DEFAULT NULL,
  `s_16` double(30,0) DEFAULT NULL,
  `s_17` double(30,0) DEFAULT NULL,
  `s_18` double(30,0) DEFAULT NULL,
  `s_19` double(30,0) DEFAULT NULL,
  `s_20` double(30,0) DEFAULT NULL,
  PRIMARY KEY (`record_id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of score_record
-- ----------------------------
INSERT INTO `score_record` VALUES ('1', null, '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0');
INSERT INTO `score_record` VALUES ('2', 'xpx', null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null, null);

-- ----------------------------
-- Table structure for stu_message
-- ----------------------------
DROP TABLE IF EXISTS `stu_message`;
CREATE TABLE `stu_message` (
  `stu_name` varchar(15) NOT NULL,
  `stu_password` varchar(15) DEFAULT NULL,
  `stu_score` double(11,1) DEFAULT NULL,
  `flag` int(11) DEFAULT '1',
  `stu_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`stu_id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of stu_message
-- ----------------------------
INSERT INTO `stu_message` VALUES ('SDAFSA', 'SADSA', null, '1', '3');
INSERT INTO `stu_message` VALUES ('xpx', '123456', '5.8', '1', '5');
INSERT INTO `stu_message` VALUES ('zhangsan', '789456', null, '1', '6');
INSERT INTO `stu_message` VALUES ('解佩勋', '862241189', null, '1', '7');
INSERT INTO `stu_message` VALUES ('999', '999', null, '1', '8');
INSERT INTO `stu_message` VALUES ('DOUISHD', '78978', null, '1', '9');
INSERT INTO `stu_message` VALUES ('wty', '123456', '0.0', '1', '10');

-- ----------------------------
-- Table structure for tea_message
-- ----------------------------
DROP TABLE IF EXISTS `tea_message`;
CREATE TABLE `tea_message` (
  `tea_name` varchar(15) NOT NULL,
  `tea_password` varchar(255) DEFAULT NULL,
  `flag` int(11) DEFAULT '2',
  `tea_id` int(11) NOT NULL AUTO_INCREMENT,
  PRIMARY KEY (`tea_id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of tea_message
-- ----------------------------
INSERT INTO `tea_message` VALUES ('987', '987', '2', '1');
INSERT INTO `tea_message` VALUES ('ryt', '654321', '2', '3');
INSERT INTO `tea_message` VALUES ('xpx', '123456', '2', '4');
