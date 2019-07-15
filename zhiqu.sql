/*
Navicat MySQL Data Transfer

Source Server         : qwe
Source Server Version : 50561
Source Host           : localhost:3306
Source Database       : zhiqu

Target Server Type    : MYSQL
Target Server Version : 50561
File Encoding         : 65001

Date: 2019-07-15 10:02:59
*/

SET FOREIGN_KEY_CHECKS=0;
-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `admin_id` int(20) NOT NULL AUTO_INCREMENT,
  `admin_name` int(10) NOT NULL,
  `admin_password` int(10) NOT NULL,
  PRIMARY KEY (`admin_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO admin VALUES ('1', '123456', '123456');

-- ----------------------------
-- Table structure for `answer`
-- ----------------------------
DROP TABLE IF EXISTS `answer`;
CREATE TABLE `answer` (
  `answer_id` int(20) NOT NULL AUTO_INCREMENT,
  `reply_content` longtext,
  `reply_name` varchar(50) DEFAULT NULL,
  `question_id` int(20) DEFAULT NULL,
  `reply_order` int(11) DEFAULT '0' COMMENT '回复顺序',
  `user_id` int(40) NOT NULL,
  `create_time` datetime DEFAULT '0000-00-00 00:00:00',
  `status` int(11) DEFAULT '0' COMMENT '回答状态  0:已回答 1：被采纳',
  PRIMARY KEY (`answer_id`),
  KEY `idx__q_nswr__question` (`question_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8 COMMENT='知趣回复表';

-- ----------------------------
-- Records of answer
-- ----------------------------
INSERT INTO answer VALUES ('9', '测试答案显示页面，', null, '71', null, '1', '2019-05-30 20:42:38', null);
INSERT INTO answer VALUES ('27', 'dd', null, '71', null, '5', '2019-05-31 15:56:55', null);
INSERT INTO answer VALUES ('58', '吴亚飞，，，，，，，，', null, '170', null, '2', '2019-06-08 18:17:04', null);
INSERT INTO answer VALUES ('59', '测试', null, '173', null, '5', '2019-07-12 08:54:45', null);

-- ----------------------------
-- Table structure for `answer_comment`
-- ----------------------------
DROP TABLE IF EXISTS `answer_comment`;
CREATE TABLE `answer_comment` (
  `comm_id` int(20) NOT NULL AUTO_INCREMENT,
  `com_ content` varchar(400) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` varchar(50) NOT NULL,
  `user_id` varchar(50) DEFAULT NULL,
  `answer_id` int(20) DEFAULT NULL,
  PRIMARY KEY (`comm_id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of answer_comment
-- ----------------------------
INSERT INTO answer_comment VALUES ('1', 'a奥术大师多', null, '1', '1', '51');

-- ----------------------------
-- Table structure for `question`
-- ----------------------------
DROP TABLE IF EXISTS `question`;
CREATE TABLE `question` (
  `question_id` int(20) NOT NULL AUTO_INCREMENT,
  `summary` varchar(400) NOT NULL COMMENT '问题简述',
  `question_content` longtext NOT NULL,
  `asker_name` varchar(50) DEFAULT NULL,
  `replied` int(11) DEFAULT '0' COMMENT '回复数',
  `user_id` int(40) NOT NULL,
  `create_time` datetime DEFAULT NULL,
  `create_user_id` varchar(50) DEFAULT NULL,
  `update_time` timestamp NULL DEFAULT NULL,
  `update_user_id` varchar(50) DEFAULT NULL,
  `delete_is` int(11) DEFAULT '0',
  `delete_time` timestamp NULL DEFAULT NULL,
  `answer_status` int(20) DEFAULT '0' COMMENT '是否以采纳',
  PRIMARY KEY (`question_id`),
  KEY `idx__q_qustn__creator` (`create_user_id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=175 DEFAULT CHARSET=utf8 COMMENT='知趣问题表';

-- ----------------------------
-- Records of question
-- ----------------------------
INSERT INTO question VALUES ('71', '测试用例n', '时间', null, '0', '1', '2019-05-19 16:58:04', null, null, null, '0', null, '0');
INSERT INTO question VALUES ('166', '什么什么什么什么阿萨德', '奥术大师多奥术大师多，阿是大师大师的，奥术大师多，奥术大师多 阿萨德', null, null, '4', '2019-06-01 16:59:20', null, null, null, '0', null, '0');
INSERT INTO question VALUES ('170', '测试问题答案显示页面', '测试问题答案显示页面测试问题答案显示页面测试问题答案显示页面测试问题答案显示页面测试问题答案显示页面测试问题答案显示页面测试问题答案显示页面', null, null, '6', '2019-06-04 19:37:03', null, null, null, '0', null, '0');
INSERT INTO question VALUES ('172', '水电费水电费', '水电费是大哥大法官', null, null, '5', '2019-06-24 17:10:24', null, null, null, '0', null, '0');
INSERT INTO question VALUES ('173', 'dawdwaa', 'dwadasdsad', null, null, '5', '2019-06-24 17:19:48', null, null, null, '0', null, '0');
INSERT INTO question VALUES ('174', '复习测试', '点点点', null, null, '5', '2019-07-15 09:26:37', null, null, null, '0', null, '0');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `user_id` int(30) NOT NULL AUTO_INCREMENT,
  `user_name` varchar(20) NOT NULL,
  `user_password` varchar(20) NOT NULL,
  `user_age` int(10) DEFAULT NULL,
  `user_sex` varchar(5) DEFAULT NULL,
  `question_id` bigint(20) DEFAULT NULL,
  `answer_id` bigint(20) DEFAULT NULL,
  PRIMARY KEY (`user_id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO user VALUES ('1', 'qwe', '134', '23', '男', null, null);
INSERT INTO user VALUES ('2', 'qimubai', '123456', '23', '男', null, null);
INSERT INTO user VALUES ('5', '小芳', '123456', '23', '女', null, null);
INSERT INTO user VALUES ('6', '齐', '123', '25', '男', null, null);
INSERT INTO user VALUES ('14', '阿萨德', '123456', '23', '男', null, null);
INSERT INTO user VALUES ('15', '全文', '123', '12', '男', null, null);
