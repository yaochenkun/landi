/*
Navicat MySQL Data Transfer

Source Server         : ld
Source Server Version : 50556
Source Host           : localhost:3306
Source Database       : ld

Target Server Type    : MYSQL
Target Server Version : 50556
File Encoding         : 65001

Date: 2017-12-25 11:54:17
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `agent_purchase`
-- ----------------------------
DROP TABLE IF EXISTS `agent_purchase`;
CREATE TABLE `agent_purchase` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUM` varchar(64) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `GOOD_NAME` varchar(64) DEFAULT NULL COMMENT '代购物品名称',
  `COUNT` int(11) DEFAULT NULL,
  `COVER_PRICE` double DEFAULT NULL COMMENT '垫付费',
  `SERVICE_PRICE` double DEFAULT NULL COMMENT '服务费',
  `PAY_MODE` tinyint(3) DEFAULT NULL COMMENT '支付方式（现金0 月结1）',
  `COMMENT` varchar(64) DEFAULT NULL,
  `STAFF_ID` int(11) DEFAULT NULL COMMENT '垫付人ID(就是一个员工staff)',
  `STAFF_NAME` varchar(64) DEFAULT NULL,
  `OCCUR_TIME` datetime DEFAULT NULL,
  `IMPORT_TIME` datetime DEFAULT NULL,
  `EDIT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent_purchase
-- ----------------------------
INSERT INTO `agent_purchase` VALUES ('2', 'W33-2', '54', 'Ada', '无', '1', '1', '1', '0', '无21', '4', 'andrew', '2017-06-12 00:00:00', '2017-06-12 20:28:33', '2017-06-12 20:44:18');
INSERT INTO `agent_purchase` VALUES ('3', 'W33-2', '54', 'Ada', '无', '1', '11', '21', '1', '无1', '0', '请选择', '2017-06-16 00:00:00', '2017-06-12 20:34:08', '2017-06-12 20:43:30');
INSERT INTO `agent_purchase` VALUES ('4', 'W33-2', '54', 'Ada', '无', '0', '0', '0', '0', '无sdfasdf', '0', '请选择', '2017-06-12 00:00:00', '2017-06-12 20:45:50', '2017-06-12 20:45:50');
INSERT INTO `agent_purchase` VALUES ('5', 'W11-1', '49', 'Ada5', '无', '0', '0', '0', '1', '无', '0', '请选择', '2017-06-12 00:00:00', '2017-06-12 21:53:48', '2017-06-12 21:53:48');
INSERT INTO `agent_purchase` VALUES ('6', 'W7-3', '50', '测', '无', '0', '0', '0', '0', '无', '0', '请选择', '2017-06-12 00:00:00', '2017-06-12 21:54:28', '2017-06-12 21:54:28');
INSERT INTO `agent_purchase` VALUES ('7', 'W33-2', '54', 'Ada', '无', '0', '0', '0', '0', '无', '0', '请选择', '2017-06-11 00:00:00', '2017-06-12 21:57:32', '2017-06-12 21:57:32');
INSERT INTO `agent_purchase` VALUES ('8', 'W11-1', '49', 'Ada5', '无', '0', '0', '0', '0', '无', '11', 'test', '2017-06-14 00:00:00', '2017-06-14 12:08:51', '2017-06-14 12:09:01');
INSERT INTO `agent_purchase` VALUES ('9', 'W33-3', '105', 'Ada', '无', '0', '0', '0', '0', '无', '0', '请选择', '2017-10-29 00:00:00', '2017-10-29 19:39:46', '2017-10-29 19:39:46');
INSERT INTO `agent_purchase` VALUES ('10', 'W33-3', '105', 'Ada', '无', '0', '0', '0', '0', '无', '0', '请选择', '2017-10-29 00:00:00', '2017-10-29 19:39:48', '2017-10-29 19:39:48');

-- ----------------------------
-- Table structure for `contract_income`
-- ----------------------------
DROP TABLE IF EXISTS `contract_income`;
CREATE TABLE `contract_income` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUMBER` varchar(64) DEFAULT NULL,
  `TIME` date DEFAULT NULL,
  `RECEIVE` double DEFAULT '0',
  `PAY` double DEFAULT '0',
  `BENIFIT` double DEFAULT '0',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of contract_income
-- ----------------------------

-- ----------------------------
-- Table structure for `cost_le`
-- ----------------------------
DROP TABLE IF EXISTS `cost_le`;
CREATE TABLE `cost_le` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUM` varchar(64) DEFAULT NULL,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `PROJECT` varchar(64) DEFAULT NULL,
  `CUSTOMER_SERVICE_STAFF` varchar(64) DEFAULT NULL,
  `OPERATION_STAFF` varchar(64) DEFAULT NULL,
  `REASON` varchar(64) DEFAULT NULL,
  `OCCUR_TIME` datetime DEFAULT NULL,
  `COST` double DEFAULT '0',
  `TYPE` varchar(64) DEFAULT NULL COMMENT '表示福利费，还是安抚费 ',
  `STATE` int(3) DEFAULT NULL COMMENT '1 表示数据有效，0 表示数据无效',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of cost_le
-- ----------------------------
INSERT INTO `cost_le` VALUES ('12', 'W33-3', 'Ada', '', '', '', '', '2017-07-12 14:42:40', '0', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('13', 'W33-3', 'Ada', '', '', '', '', '2017-07-12 14:48:35', '0', 'appease', '1');
INSERT INTO `cost_le` VALUES ('14', 'W33-3', 'Ada', '', '', '', '', '2017-07-17 10:34:52', '0', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('15', 'W33-2', 'Ada', '', '', '', '', '2017-07-17 10:35:08', '0', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('16', 'W24-1', 'Ada', '', '', '', '', '2017-07-17 10:35:45', '0', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('17', 'W33-2', 'Ada', '', '', '', '', '2017-12-18 21:06:03', '2', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('18', 'W33-2', 'Ada', '', '', '', '', '2017-12-18 21:06:08', '3', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('19', 'W33-2', 'Ada', '', '', '', '', '2017-12-18 21:06:14', '4', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('20', 'W33-2', 'Ada', '', '', '', '', '2017-12-18 21:06:19', '3', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('21', 'W33-2', 'Ada', '', '', '', '', '2017-12-18 21:06:29', '34', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('22', 'W33-2', 'Ada', '', '', '', '', '2017-12-18 21:06:34', '34', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('23', 'W33-2', 'Ada', '', '', '', '', '2017-12-18 21:06:38', '23', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('24', 'W33-2', 'Ada', '', '', '', '', '2017-12-18 21:06:55', '3', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('25', 'W33-2', 'Ada', '', '', '', '', '2017-12-18 21:06:59', '3', 'welfare', '1');
INSERT INTO `cost_le` VALUES ('26', 'W33-2', 'Ada', '', '', '', '', '2017-12-18 21:07:03', '34', 'welfare', '1');

-- ----------------------------
-- Table structure for `daily_service`
-- ----------------------------
DROP TABLE IF EXISTS `daily_service`;
CREATE TABLE `daily_service` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TYPE` int(11) DEFAULT NULL,
  `ROOM_NUMBER` varchar(64) NOT NULL,
  `GUEST_ID` int(11) NOT NULL,
  `GUEST_NAME` varchar(64) NOT NULL,
  `ITEM` varchar(64) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `MONEY` double DEFAULT NULL,
  `COMMENT` varchar(128) DEFAULT NULL,
  `RTIME` datetime DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of daily_service
-- ----------------------------

-- ----------------------------
-- Table structure for `diary_reminder`
-- ----------------------------
DROP TABLE IF EXISTS `diary_reminder`;
CREATE TABLE `diary_reminder` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(64) DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL,
  `REMIND_DATE` date DEFAULT NULL,
  `EDIT_TIME` datetime DEFAULT NULL,
  `STATE` varchar(10) DEFAULT NULL COMMENT '完成情况（完成、未完成）',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of diary_reminder
-- ----------------------------
INSERT INTO `diary_reminder` VALUES ('1', '2', '我离开就是地方离开就是打发', '老师肯定积分；alksjflkasndlmnc.xzncv./,zxmcvlkajsdf\n\n是的发送到了；放假快乐健康 \n‘d放声大哭放假了\n收到反馈', '2017-06-11', '2017-06-15 16:50:52', '完成');
INSERT INTO `diary_reminder` VALUES ('2', '2', '订水', '记得明天给20-8房间的人订桶水', '2017-06-08', '2017-06-15 16:50:41', '完成');
INSERT INTO `diary_reminder` VALUES ('4', '2', '呵呵1', '杀是的发送到发生', '2017-06-12', '2017-06-15 16:44:05', '完成');
INSERT INTO `diary_reminder` VALUES ('7', '2', '呜呜呜3', '理科生觉得浪费空间阿斯利康打飞机阿萨德', '2017-06-12', '2017-06-12 16:49:37', '未完成');
INSERT INTO `diary_reminder` VALUES ('9', '2', '我', '他他他', '2017-06-12', '2017-06-12 14:11:23', '未完成');
INSERT INTO `diary_reminder` VALUES ('10', '2', '1', '2', '2017-06-12', '2017-06-12 14:56:20', '未完成');
INSERT INTO `diary_reminder` VALUES ('11', '2', '今天天气好', '阿斯顿发生来得快；放假啊；老师肯德基', '2017-06-11', '2017-06-12 15:06:13', '未完成');
INSERT INTO `diary_reminder` VALUES ('12', '2', '今天蓝迪', '拉开距离水电费', '2017-06-14', '2017-06-14 14:18:18', '未完成');
INSERT INTO `diary_reminder` VALUES ('13', '2', '轩辕剑', '哈哈哈哈', '2017-06-14', '2017-06-15 15:15:07', '未完成');
INSERT INTO `diary_reminder` VALUES ('14', '2', '轩辕剑1', '哈哈哈哈', '2017-06-14', '2017-06-15 15:15:11', '未完成');
INSERT INTO `diary_reminder` VALUES ('15', '2', '轩辕剑2', '哈哈哈哈', '2017-06-14', '2017-06-15 15:15:15', '未完成');
INSERT INTO `diary_reminder` VALUES ('16', '2', 'yaochenkun', 'sdfsdf', '2017-07-13', '2017-06-16 17:04:33', '未完成');
INSERT INTO `diary_reminder` VALUES ('17', '2', 'yaochenkun1', 'sdfsdf1', '2017-07-13', '2017-06-16 17:04:37', '未完成');
INSERT INTO `diary_reminder` VALUES ('18', '10', 'sss', 's\'s', '2017-06-16', '2017-06-16 17:05:19', '完成');
INSERT INTO `diary_reminder` VALUES ('19', '2', 'hahah', 'sdfasdf', '2017-06-20', '2017-06-20 21:04:33', '完成');

-- ----------------------------
-- Table structure for `drinking_water`
-- ----------------------------
DROP TABLE IF EXISTS `drinking_water`;
CREATE TABLE `drinking_water` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUM` varchar(64) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `BARREL_COUNT` int(11) DEFAULT '0' COMMENT '桶装水数量',
  `BARREL_REMAINCOUNT` int(11) DEFAULT '0',
  `BARREL_LIMITCOUNT` int(11) DEFAULT NULL COMMENT '桶装水限额',
  `BARREL_UNITPRICE` double DEFAULT '0',
  `BOTTLE_COUNT` int(11) DEFAULT '0' COMMENT '瓶装矿泉水（提）数量',
  `BOTTLE_REMAINCOUNT` int(11) DEFAULT NULL,
  `BOTTLE_LIMITCOUNT` int(11) DEFAULT NULL COMMENT '瓶装矿泉水（提）限额',
  `BOTTLE_UNITPRICE` double DEFAULT NULL,
  `EXCESS_PRICE` double DEFAULT NULL COMMENT '超出限额数量的总金额',
  `PAY_MODE` tinyint(3) DEFAULT NULL COMMENT '支付方式（现金0 月结1）',
  `COMMENT` varchar(64) DEFAULT NULL,
  `STAFF_ID` int(11) DEFAULT NULL,
  `STAFF_NAME` varchar(64) DEFAULT NULL,
  `OCCUR_TIME` datetime DEFAULT NULL,
  `IMPORT_TIME` datetime DEFAULT NULL,
  `EDIT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drinking_water
-- ----------------------------
INSERT INTO `drinking_water` VALUES ('1', 'W11-1', '49', 'Ada5', '0', '0', '0', '10', '3', '-3', '0', '2', '6', '1', '', null, null, '2017-05-27 00:00:00', '2017-05-27 10:58:43', '2017-05-27 10:59:37');
INSERT INTO `drinking_water` VALUES ('2', 'W33-3', '1', 'Ada', '0', '0', '0', '10', '2', '-2', '0', '32', '64', '0', 'haha', null, null, '2017-05-27 00:00:00', '2017-05-27 11:00:14', '2017-05-27 11:00:14');
INSERT INTO `drinking_water` VALUES ('3', 'W11-1', '49', 'Ada5', '4', '-4', '0', '10', '0', '-3', '0', '0', '46', '0', '', null, null, '2017-05-27 00:00:00', '2017-05-27 11:00:43', '2017-05-27 11:00:43');
INSERT INTO `drinking_water` VALUES ('4', 'W33-3', '1', 'Ada', '123', '-123', '0', '10', '0', '-2', '0', '0', '1294', '0', '', null, null, '2017-06-12 00:00:00', '2017-06-12 22:17:45', '2017-06-12 22:17:45');
INSERT INTO `drinking_water` VALUES ('5', 'W33-3', '105', 'Ada', '1', '0', '1', '10', '0', '1', '1', '0', '0', '0', '2', null, null, '2017-10-24 00:00:00', '2017-10-24 10:24:25', '2017-10-24 10:24:25');
INSERT INTO `drinking_water` VALUES ('6', 'W33-3', '105', 'Ada', '1', '-1', '1', '10', '0', '1', '1', '0', '10', '0', '2', null, null, '2017-10-24 00:00:00', '2017-10-24 10:24:28', '2017-10-24 10:24:28');
INSERT INTO `drinking_water` VALUES ('7', 'W33-3', '105', 'Ada', '1', '-2', '1', '10', '0', '1', '1', '0', '20', '0', '2', null, null, '2017-10-24 00:00:00', '2017-10-24 10:24:30', '2017-10-24 10:24:30');
INSERT INTO `drinking_water` VALUES ('8', 'W33-3', '105', 'Ada', '1', '-3', '1', '10', '0', '1', '1', '0', '30', '0', '2', null, null, '2017-10-24 00:00:00', '2017-10-24 10:24:33', '2017-10-24 10:24:33');
INSERT INTO `drinking_water` VALUES ('9', 'W33-3', '105', 'Ada', '1', '-4', '1', '10', '0', '1', '1', '0', '40', '0', '2', null, null, '2017-10-24 00:00:00', '2017-10-24 10:24:36', '2017-10-24 10:24:36');
INSERT INTO `drinking_water` VALUES ('10', 'W33-3', '105', 'Ada', '1', '-5', '1', '10', '0', '1', '1', '0', '50', '0', '2', null, null, '2017-10-24 00:00:00', '2017-10-24 10:24:39', '2017-10-24 10:24:39');

-- ----------------------------
-- Table structure for `emergency_problem`
-- ----------------------------
DROP TABLE IF EXISTS `emergency_problem`;
CREATE TABLE `emergency_problem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROOM_NUM` varchar(255) DEFAULT NULL,
  `ROOM_STATE` varchar(255) DEFAULT NULL,
  `GUEST_NAME` varchar(255) DEFAULT NULL,
  `OCCUR_TIME` datetime DEFAULT NULL,
  `ATTENDANCE_TIME` datetime DEFAULT NULL,
  `DECLARANT` varchar(15) DEFAULT NULL COMMENT '申请人',
  `DEALING` varchar(15) DEFAULT NULL COMMENT '处理人',
  `DAMAGE_DETAIL` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of emergency_problem
-- ----------------------------
INSERT INTO `emergency_problem` VALUES ('1', 'W2-1', '已入住', 'Tom', '2017-12-19 21:07:00', '2017-12-19 21:07:00', '', '张三', ',,,目击人:false,备注:sdf');
INSERT INTO `emergency_problem` VALUES ('2', 'W2-1', '已入住', 'Tom', '2017-12-19 21:07:00', '2017-12-19 21:07:00', '', '张三', '报修:报修;true;,,,目击人:false,备注:备注');
INSERT INTO `emergency_problem` VALUES ('3', 'W2-1', '已入住', 'Tom', '2017-12-19 21:07:00', '2017-12-19 21:07:00', '', '张三', ',人员:false;,,目击人:false,备注:备注');
INSERT INTO `emergency_problem` VALUES ('4', 'W2-1', '已入住', 'Tom', '2017-01-01 01:01:00', '2017-01-01 01:01:00', '', 'zhangg', '报修:qwe;true;q2we,人员:true;qw;qw;ew;wq;true;qwe,,,备注:');
INSERT INTO `emergency_problem` VALUES ('5', 'W2-1', '已入住', 'Tom', '2017-12-19 21:07:00', '2017-12-19 21:07:00', 'test', 'zhangdan', '报修:wer;true;werw,,,,备注:er');

-- ----------------------------
-- Table structure for `fac_sta`
-- ----------------------------
DROP TABLE IF EXISTS `fac_sta`;
CREATE TABLE `fac_sta` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TYPE` varchar(64) DEFAULT NULL,
  `CAT` varchar(64) DEFAULT NULL,
  `BRAND` varchar(64) DEFAULT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `OWNER` varchar(64) DEFAULT NULL COMMENT '归属权',
  `REPO_ID` int(11) DEFAULT NULL,
  `REPO_NUM` varchar(64) DEFAULT NULL COMMENT '库房号码',
  `TOTAL` int(11) DEFAULT NULL,
  `FREE` int(11) DEFAULT NULL COMMENT '待分配',
  `WORKING` int(11) DEFAULT NULL COMMENT '可用',
  `MAINTAIN` int(11) DEFAULT NULL COMMENT '维修',
  `BAD` int(11) DEFAULT NULL COMMENT '报废',
  `COMMENT` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=92 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fac_sta
-- ----------------------------
INSERT INTO `fac_sta` VALUES ('78', '家电', '空调', '海尔', 'GT双开门冰箱', 'LE固定资产', null, 'R3-2', '7', '0', '5', '2', '0', '无');
INSERT INTO `fac_sta` VALUES ('79', '家电', '电视', '格力', 'GT双开门冰箱', 'LE固定资产', null, 'R8-8', '0', '0', '0', '0', '0', '无');
INSERT INTO `fac_sta` VALUES ('80', '家电', '空调', '海尔', 'GT双开门冰箱', 'LE固定资产', null, 'R8-8', '0', '0', '0', '0', '0', '无');
INSERT INTO `fac_sta` VALUES ('85', '家电', '空调', '海尔', 'GT双开门冰箱', 'LE固定资产', null, 'R5-6', '1', '1', '0', '0', '0', '无');
INSERT INTO `fac_sta` VALUES ('86', '家电', '空调', '海尔', 'GT双开门冰箱', 'LE管理资产(SPC)', null, 'R7-8', '3', '3', '0', '0', '0', '无');
INSERT INTO `fac_sta` VALUES ('87', '家电', '空调', '海尔', 'GT双开门冰箱', 'LE固定资产', null, 'R1-1', '5', '5', '0', '0', '0', '无');
INSERT INTO `fac_sta` VALUES ('88', '家电', '空调', '海尔', 'GT双开门冰箱', 'LE固定资产', null, 'R7-8', '1', '1', '0', '0', '0', '无');
INSERT INTO `fac_sta` VALUES ('89', '家具', '沙发', '皇朝', 'GT双开门冰箱', 'LE固定资产', null, 'R3-2', '7', '0', '7', '0', '0', '无');
INSERT INTO `fac_sta` VALUES ('90', '备品', '床单', '多喜爱', '床单', 'LE管理资产(小业主)', null, 'R3-2', '7', '0', '3', '4', '0', '无');
INSERT INTO `fac_sta` VALUES ('91', '备品', '床单', '多喜爱', '多喜爱床单', 'LE管理资产(SPC)', null, 'R8-8', '10', '5', '2', '2', '1', '无');

-- ----------------------------
-- Table structure for `flight_picking`
-- ----------------------------
DROP TABLE IF EXISTS `flight_picking`;
CREATE TABLE `flight_picking` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `TIME` date DEFAULT NULL,
  `ROOM_NUMBER` varchar(64) DEFAULT NULL,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `TYPE` varchar(64) CHARACTER SET utf8 COLLATE utf8_unicode_ci DEFAULT NULL COMMENT 'welcome：接机  farewell：送机',
  `FLIGHT_NUMBER` varchar(64) DEFAULT NULL,
  `PLATE_NUMBER` varchar(64) DEFAULT NULL,
  `PICKER_NAME` varchar(64) DEFAULT NULL,
  `PICKER_TELE` varchar(64) DEFAULT NULL,
  `CONTACT_NAME` varchar(64) DEFAULT NULL,
  `CONTACT_TELE` varchar(64) DEFAULT NULL,
  `OCCUR_TIME` datetime DEFAULT NULL,
  `IMPORT_TIME` datetime DEFAULT NULL,
  `EDIT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=71 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of flight_picking
-- ----------------------------
INSERT INTO `flight_picking` VALUES ('1', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '?XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('2', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('3', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('4', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('5', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('6', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('7', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('8', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('9', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('10', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('11', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('12', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('13', '2017-04-27', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('20', '2017-04-27', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('21', '2017-04-27', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('22', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('23', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('24', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('25', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('26', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('27', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('28', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('29', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('30', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('31', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('32', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('33', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('34', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('35', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('36', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('37', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('38', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('39', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('40', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('41', '2017-04-28', 'W31-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('42', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('43', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('44', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('45', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('46', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('47', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('48', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('49', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('50', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('51', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('52', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('55', '2017-05-19', 'W35-1', 'Alice', 'farewell', 'CA1344', 'S12345', 'Tom', '13980823993', 'Bob', '84523892', '2017-05-19 00:00:00', null, '2017-05-13 14:39:25');
INSERT INTO `flight_picking` VALUES ('56', '2017-05-27', 'W35-1', 'YaoChenKun', 'farewell', 'CA13441', 'S123451', 'Tom', '13980823993', 'Bob', '15122707970', '2017-05-27 00:00:00', '2017-05-12 16:50:15', '2017-05-12 22:01:24');
INSERT INTO `flight_picking` VALUES ('57', '2017-05-12', 'W35-1', 'Alice', 'farewell', 'CA1344', 'S12345', 'Tom', '13980823993', 'Bob', '12345678910', '2017-05-12 00:00:00', '2017-05-12 16:51:52', '2017-05-12 16:51:52');
INSERT INTO `flight_picking` VALUES ('60', '2017-05-12', 'W22-2', 'Ken', 'farewell', 'CA1344', 'S12345', 'Tom', '13980823993', 'Bob', '12345678910', '2017-05-12 00:00:00', '2017-05-12 18:13:42', '2017-05-12 22:01:32');
INSERT INTO `flight_picking` VALUES ('61', '2017-05-19', 'W35-1', 'Alice', 'welcome', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-19 00:00:00', '2017-05-13 14:38:57', '2017-05-13 14:39:50');
INSERT INTO `flight_picking` VALUES ('62', '2017-05-17', 'W35-1', 'Alice', 'welcome', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-17 00:00:00', '2017-05-13 15:02:14', '2017-05-13 15:02:14');
INSERT INTO `flight_picking` VALUES ('63', '2017-05-12', 'W35-1', 'Alice', 'welcome', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-12 00:00:00', '2017-05-16 11:56:33', '2017-05-16 11:56:33');
INSERT INTO `flight_picking` VALUES ('64', '2017-05-16', 'W7-3', '测', 'farewell', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-16 00:00:00', '2017-05-16 11:56:52', '2017-05-16 16:12:19');
INSERT INTO `flight_picking` VALUES ('65', '2017-05-12', 'W35-1', 'Alice2', 'welcome', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-12 00:00:00', '2017-05-16 11:57:01', '2017-05-16 11:57:01');
INSERT INTO `flight_picking` VALUES ('66', '2017-05-16', 'W33-3', 'Ada', 'welcome', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-16 00:00:00', '2017-05-16 11:57:11', '2017-05-16 16:10:12');
INSERT INTO `flight_picking` VALUES ('67', '2017-05-12', 'W35-1', 'Alice34', 'farewell', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-12 00:00:00', '2017-05-16 11:57:38', '2017-05-16 11:57:38');
INSERT INTO `flight_picking` VALUES ('69', '2017-05-16', 'W33-2', 'Ada', 'farewell', '', '', '', '1', '', '2', '2017-05-16 00:00:00', '2017-05-16 16:12:43', '2017-05-16 16:14:39');
INSERT INTO `flight_picking` VALUES ('70', '2017-05-25', 'W11-1', 'Ada5', 'welcome', '1', '2', '3', '4', '5', '7', '2017-05-25 00:00:00', '2017-05-25 15:27:15', '2017-05-25 15:27:26');

-- ----------------------------
-- Table structure for `grocery_item`
-- ----------------------------
DROP TABLE IF EXISTS `grocery_item`;
CREATE TABLE `grocery_item` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) DEFAULT NULL,
  `TYPE` varchar(64) DEFAULT NULL,
  `CAT` varchar(64) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT '0',
  `TOTAL_LOSS` int(11) DEFAULT '0',
  `TOTAL_SOLD` int(11) DEFAULT '0',
  `TOTAL_BENIFIT` double DEFAULT '0',
  `AVALIABLE` int(11) DEFAULT '0',
  `BUY_MONEY` double DEFAULT NULL,
  `SELL_MONEY` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grocery_item
-- ----------------------------
INSERT INTO `grocery_item` VALUES ('12', '汇源果汁2', '饮料', '果汁', '62', '4', '27', '14', '31', '10', '12');
INSERT INTO `grocery_item` VALUES ('13', '汇源果汁', '饮料', '果汁', '50', '0', '0', '0', '50', '10', '12');
INSERT INTO `grocery_item` VALUES ('15', '农夫山泉', '饮料', '纯净水', '52', '2', '2', '-16', '48', '10', '12');
INSERT INTO `grocery_item` VALUES ('16', '怡宝', '饮料', '纯净水', '50', '0', '0', '0', '50', '10', '12');
INSERT INTO `grocery_item` VALUES ('17', '可乐', '饮料', '饮料', '50', '0', '0', '0', '50', '10', '12');
INSERT INTO `grocery_item` VALUES ('18', '1', '饮料', '果汁', '50', '0', '0', '0', '50', '10', '12');
INSERT INTO `grocery_item` VALUES ('19', '2', '饮料', '果汁', '50', '0', '0', '0', '50', '10', '12');
INSERT INTO `grocery_item` VALUES ('20', '3', '饮料', '果汁', '50', '0', '0', '0', '50', '10', '12');
INSERT INTO `grocery_item` VALUES ('21', '4', '饮料', '果汁', '50', '0', '0', '0', '50', '10', '12');
INSERT INTO `grocery_item` VALUES ('22', '5', '饮料', '果汁', '50', '0', '0', '0', '50', '10', '12');

-- ----------------------------
-- Table structure for `grocery_running`
-- ----------------------------
DROP TABLE IF EXISTS `grocery_running`;
CREATE TABLE `grocery_running` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CTIME` datetime DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `PER_MONEY` double DEFAULT NULL,
  `ALL_MONEY` double DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL COMMENT '1 buy, 2 sell, 3 use',
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ITEM_ID` (`ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grocery_running
-- ----------------------------
INSERT INTO `grocery_running` VALUES ('1', '2017-03-14 11:48:12', '1', '2', '10', '20', '1', '1');
INSERT INTO `grocery_running` VALUES ('2', '2017-03-14 11:48:17', '1', '2', '10', '20', '1', '1');
INSERT INTO `grocery_running` VALUES ('3', '2017-03-14 11:48:21', '1', '2', '12', '24', '2', '1');
INSERT INTO `grocery_running` VALUES ('4', '2017-03-14 11:48:25', '1', '2', '10', '20', '3', '1');
INSERT INTO `grocery_running` VALUES ('5', '2017-03-14 11:48:34', '1', '2', '12', '24', '2', '1');
INSERT INTO `grocery_running` VALUES ('6', '2017-03-14 11:48:39', '1', '2', '10', '20', '3', '1');
INSERT INTO `grocery_running` VALUES ('7', '2017-03-16 21:22:16', '1', '2', '12', '24', '2', '1');
INSERT INTO `grocery_running` VALUES ('8', '2017-04-27 13:36:29', '10', '2', '12', '24', '2', null);
INSERT INTO `grocery_running` VALUES ('9', '2017-04-27 13:36:33', '10', '2', '10', '20', '1', null);
INSERT INTO `grocery_running` VALUES ('10', '2017-04-27 13:36:48', '10', '2', '10', '20', '3', null);
INSERT INTO `grocery_running` VALUES ('11', '2017-11-01 11:16:24', '11', '2', '10', '20', '1', null);
INSERT INTO `grocery_running` VALUES ('12', '2017-11-01 11:16:48', '11', '2', '10', '20', '1', null);
INSERT INTO `grocery_running` VALUES ('13', '2017-11-02 10:16:08', '10', '2', '10', '20', '1', null);
INSERT INTO `grocery_running` VALUES ('14', '2017-11-02 11:14:45', '12', '2', '10', '20', '1', null);
INSERT INTO `grocery_running` VALUES ('15', '2017-11-02 11:14:55', '12', '2', '10', '20', '1', null);
INSERT INTO `grocery_running` VALUES ('16', '2017-11-02 11:15:01', '12', '2', '10', '20', '1', null);
INSERT INTO `grocery_running` VALUES ('17', '2017-11-02 11:15:08', '12', '23', '12', '276', '2', null);
INSERT INTO `grocery_running` VALUES ('18', '2017-11-02 11:16:31', '12', '2', '10', '20', '3', null);
INSERT INTO `grocery_running` VALUES ('19', '2017-11-06 09:48:39', '12', '2', '10', '20', '1', null);
INSERT INTO `grocery_running` VALUES ('20', '2017-11-06 09:48:41', '12', '2', '12', '24', '2', null);
INSERT INTO `grocery_running` VALUES ('21', '2017-11-06 09:48:44', '12', '2', '10', '20', '1', null);
INSERT INTO `grocery_running` VALUES ('22', '2017-11-06 09:48:47', '12', '2', '12', '24', '2', null);
INSERT INTO `grocery_running` VALUES ('23', '2017-11-06 09:49:51', '12', '2', '10', '20', '1', null);
INSERT INTO `grocery_running` VALUES ('24', '2017-11-06 10:32:59', '12', '2', '10', '20', '3', null);
INSERT INTO `grocery_running` VALUES ('25', '2017-11-07 11:16:42', '15', '2', '10', '20', '3', null);
INSERT INTO `grocery_running` VALUES ('26', '2017-11-07 11:16:52', '15', '2', '12', '24', '2', null);
INSERT INTO `grocery_running` VALUES ('27', '2017-11-07 11:16:58', '15', '2', '10', '20', '1', null);

-- ----------------------------
-- Table structure for `guest`
-- ----------------------------
DROP TABLE IF EXISTS `guest`;
CREATE TABLE `guest` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `ROOM_NUMBER` varchar(64) DEFAULT NULL,
  `ROOM_TYPE` varchar(64) DEFAULT NULL,
  `CONTRACT_NUMBER` varchar(64) DEFAULT NULL,
  `TEL` varchar(64) DEFAULT NULL,
  `COMPANY` varchar(64) DEFAULT NULL,
  `TITLE` varchar(64) DEFAULT NULL,
  `PERSONS` int(11) DEFAULT NULL,
  `COMING` int(11) DEFAULT NULL,
  `PARKING` varchar(64) DEFAULT NULL,
  `CAR` varchar(64) DEFAULT NULL,
  `COMMENT` varchar(256) DEFAULT NULL,
  `CHARGE` double DEFAULT NULL,
  `TIMEIN` datetime DEFAULT NULL,
  `TIMEOUT` datetime DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1' COMMENT '正在入住0  历史入住1',
  `OTHER_GUESTS` varchar(255) DEFAULT NULL,
  `GUEST_TYPE` varchar(255) DEFAULT NULL,
  `BIRTHDAY` date DEFAULT NULL,
  `EMAIL` varchar(64) DEFAULT NULL,
  `COMPANY_CONTACTOR` varchar(64) DEFAULT NULL,
  `COMPANY_TEL` varchar(64) DEFAULT NULL,
  `COMPANY_ACCOUNT` varchar(64) DEFAULT NULL,
  `COMPANY_INVOICE` varchar(64) DEFAULT NULL,
  `COMPANY_PAYMODE` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CONTRACT_NUMBER` (`CONTRACT_NUMBER`),
  KEY `GUEST_NAME` (`GUEST_NAME`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guest
-- ----------------------------
INSERT INTO `guest` VALUES ('1', 'Ada', 'W33-3', null, 'S131', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `guest` VALUES ('2', 'Alice1', 'W32-1', null, 'S132', '13581818112', 'Amazon', '经理', '2', null, 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `guest` VALUES ('3', 'Tom', 'W2-1', null, 'S12', '13581818112', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `guest` VALUES ('47', 'Ada3', 'W10-3', null, 'S1313', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `guest` VALUES ('49', 'Ada5', 'W11-1', null, 'S1311', '13581818113', 'Amazon', '主管', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `guest` VALUES ('50', '测', 'W7-3', null, 'S020', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `guest` VALUES ('54', 'Ada', 'W33-2', null, 'S142', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `guest` VALUES ('57', 'Alexa', 'W33-3', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `guest` VALUES ('58', 'Alice2', 'W33-3', null, null, null, null, null, null, null, null, null, null, null, null, null, '1', null, null, null, null, null, null, null, null, null);
INSERT INTO `guest` VALUES ('59', 'aaa', 'W6-1', null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `guest` VALUES ('60', 'abc', 'W26-3', null, null, null, null, null, null, null, null, null, null, null, null, null, '0', null, null, null, null, null, null, null, null, null);
INSERT INTO `guest` VALUES ('62', 'Ada', 'W33-3', null, 'S137', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-20 00:00:00', '2017-06-02 00:00:00', '0', '张三,李四,王五', '日本', '2017-06-20', '无', '无', '无', '无', '无', '银行转账');
INSERT INTO `guest` VALUES ('63', 'Ada', 'W33-3', null, 'S13111', '13581818113', 'Amazon', '经理', '2', '1', 'T3', null, '无', '15000.5', '2017-06-20 00:00:00', '2017-06-20 00:00:00', '0', '张三,李四,王五', '其它', '2017-06-20', '无', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('64', 'Ada', 'W33-3', null, 'S1315555', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-20 00:00:00', '2017-06-20 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-20', '无', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('66', 'Ada23', 'W33-3', null, 'S1315555s', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-20 00:00:00', '2017-06-20 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-20', '无', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('67', 'Ada', 'W33-3', null, 'S1319999', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-21 00:00:00', '2017-06-21 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-21', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('69', 'Ada', 'W33-3', null, 'S131555', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-21 00:00:00', '2017-06-21 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-21', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('72', 'Ada', 'W33-3', null, 'S1315556', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-21 00:00:00', '2017-06-21 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-21', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('73', 'Ada', 'W33-3', null, 'S13190808', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-21 00:00:00', '2017-06-21 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-21', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('74', 'Ada', 'W33-3', null, 'S131sdfsdf', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2020-06-13 00:00:00', '0', '张三,李四,王五', '欧美', '1993-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('75', 'Ada', 'W33-3', null, 'S131sssdfsdf', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2021-06-19 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('77', 'Ada', 'W33-3', null, 'S131ssssssss', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2021-06-19 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('78', 'Ada', 'W33-3', null, 'S131ssssssssd', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2021-06-19 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('80', 'Ada', 'W33-3', null, 'S131fff', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-18 00:00:00', '2021-06-20 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('81', 'Ada', 'W33-3', null, 'S131kjhkjh', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2024-09-13 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('83', 'Ada', 'W33-3', null, 'S131kjhkjh11', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2024-09-13 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('84', 'Ada', 'W33-3', null, 'S131kjhkjh11d', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2024-11-08 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('85', 'Ada', 'W33-3', null, 'S131ss123123', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2019-11-08 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('87', 'Ada', 'W33-3', null, 'S131ffff', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2022-06-18 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('88', 'Ada', 'W33-3', null, 'S131ffff1', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2022-11-07 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('89', 'Ada', 'W33-3', null, 'S131ffff12', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2022-11-08 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('90', 'Ada', 'W33-3', null, 'S131sdssdf', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2021-11-07 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('91', 'Ada', 'W33-3', null, '1', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2021-11-08 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('92', 'Ada', 'W33-3', null, 'S131sssssfsdfasdf', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2020-06-18 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('93', 'Ada', 'W33-3', null, '1dsd', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2020-11-08 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('94', 'Ada', 'W33-3', null, 'S13155555', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2019-11-08 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('95', 'Ada', 'W33-3', null, 'S131555556', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2019-11-08 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('97', 'Ada', 'W33-3', null, 'S1310000', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2020-11-08 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('98', 'Ada', 'W33-3', null, 'S131789789789', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2020-11-08 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('100', 'Ada', 'W33-3', null, 'S1317897897891', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2020-11-07 00:00:00', '0', '张三,李四,王五', '欧美', '2017-11-08', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('101', 'Ada', 'W33-3', null, 'S13178978978912', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2020-11-07 00:00:00', '0', '张三,李四,王五', '欧美', '2017-04-05', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('102', 'Ada', 'W33-3', null, 'S131sdfasdfasdfsdf', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2019-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-05-10', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('103', 'Ada', 'W33-3', null, 'S1310-0-0-0', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2019-06-29 00:00:00', '0', '张三,李四,王五', '欧美', '2017-04-13', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('104', 'Ada', 'W33-3', null, 'S1310-0-0-02', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2019-06-29 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('105', 'Ada', 'W33-3', null, 'S1310-0-0-021', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2019-06-29 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-25', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('106', 'Ada', 'W32-2', null, 'S131sdfasdfasdfasdf', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('107', 'Ada', 'W30-3', null, 'S131asdfasdf', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('108', 'Ada', 'W29-1', null, 'S131sdfsdfasdas', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('109', 'Ada', 'W29-2', null, 'S131sfsdfqweqwe', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('110', 'Ada', 'W27-3', null, 'S1312222222222', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('111', 'Ada', 'W18-3', null, 'S1319017204891723', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('112', 'Ada', 'W11-3', null, 'S131sdfasdfasdf', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('113', 'Ada', 'W7-3', null, 'S1313323', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('114', 'Ada', 'W8-2', null, 'S1312312312', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('115', 'Ada', 'W12-3', null, 'S1319890890890', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('116', 'Ada', 'W16-3', null, 'S131123123123', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('117', 'Ada', 'W16-2', null, 'S1312344668', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('118', 'Ada', 'W14-2', null, 'S13198789', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('119', 'Ada', 'W15-2', null, 'S131888888', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('120', 'Ada', 'W19-1', null, 'S131sdfsdfaweqwwe', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('121', 'Ada', 'W24-1', null, 'S1315686796796', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-06-22 00:00:00', '2017-06-22 00:00:00', '0', '张三,李四,王五', '欧美', '2017-06-22', 'on', '无', '无', '无', '无', '现金');
INSERT INTO `guest` VALUES ('124', 'Ada', 'W2-2', null, 'S133', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2017-10-09 00:00:00', '2017-10-09 00:00:00', '0', '张三,李四,王五', '欧美', '2017-10-09', 'on', '无', '无', '无', '无', '现金');

-- ----------------------------
-- Table structure for `guest_balance`
-- ----------------------------
DROP TABLE IF EXISTS `guest_balance`;
CREATE TABLE `guest_balance` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GUEST_ID` int(10) unsigned DEFAULT NULL,
  `ROOM_NUMBER` varchar(64) DEFAULT NULL,
  `CHARGE_TURN` int(11) DEFAULT NULL,
  `CHARGE_WAY` varchar(64) DEFAULT NULL,
  `RETURN_TURN` int(11) DEFAULT NULL,
  `INVOICE_TURN` int(11) DEFAULT NULL,
  `BEGIN_DAY` date DEFAULT NULL,
  `END_DAY` date DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `GUEST_ID` (`GUEST_ID`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`),
  CONSTRAINT `guest_balance_ibfk_1` FOREIGN KEY (`GUEST_ID`) REFERENCES `guest` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guest_balance
-- ----------------------------
INSERT INTO `guest_balance` VALUES ('1', '1', 'W33-3', '30', '现金', '30', '30', null, null, '0');
INSERT INTO `guest_balance` VALUES ('2', '2', 'W32-1', '30', '现金', '30', '30', null, null, '0');
INSERT INTO `guest_balance` VALUES ('3', '3', 'W2-1', '30', '现金', '30', '30', null, null, '0');
INSERT INTO `guest_balance` VALUES ('28', '47', 'W33-3', '30', '现金', '30', '30', null, null, '0');
INSERT INTO `guest_balance` VALUES ('29', '49', 'W33-3', '30', '现金', '30', '30', null, null, '0');
INSERT INTO `guest_balance` VALUES ('30', '50', 'W33-3', '30', '现金', '30', '30', null, null, '0');
INSERT INTO `guest_balance` VALUES ('31', '54', 'W33-2', '30', '现金', '30', '30', null, null, '0');
INSERT INTO `guest_balance` VALUES ('32', '62', 'W33-3', '30', '现金', '30', '30', '2017-06-20', '2017-06-20', '0');
INSERT INTO `guest_balance` VALUES ('33', '63', 'W33-3', '30', '现金', '30', '30', '2017-06-20', '2017-06-20', '0');
INSERT INTO `guest_balance` VALUES ('34', '64', 'W33-3', '30', '现金', '30', '30', '2017-06-20', '2017-06-20', '0');
INSERT INTO `guest_balance` VALUES ('35', '66', 'W33-3', '30', '现金', '30', '30', '2017-06-20', '2017-06-20', '0');
INSERT INTO `guest_balance` VALUES ('36', '67', 'W33-3', '30', '现金', '30', '30', '2017-06-21', '2017-06-21', '0');
INSERT INTO `guest_balance` VALUES ('37', '69', 'W33-3', '30', '现金', '30', '30', '2017-06-21', '2017-06-21', '0');
INSERT INTO `guest_balance` VALUES ('38', '72', 'W33-3', '30', '现金', '30', '30', '2017-06-21', '2017-06-21', '0');
INSERT INTO `guest_balance` VALUES ('39', '73', 'W33-3', '30', '现金', '30', '30', '2017-06-21', '2017-06-21', '0');
INSERT INTO `guest_balance` VALUES ('40', '74', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('41', '75', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('42', '77', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('43', '78', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('44', '80', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('45', '81', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('46', '83', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('47', '84', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('48', '85', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('49', '87', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('50', '88', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('51', '89', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('52', '90', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('53', '91', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('54', '92', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('55', '93', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('56', '94', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('57', '95', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('58', '97', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('59', '98', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('60', '100', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('61', '101', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('62', '102', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('63', '103', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('64', '104', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('65', '105', 'W33-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('66', '106', 'W32-2', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('67', '107', 'W30-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('68', '108', 'W29-1', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('69', '109', 'W29-2', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('70', '110', 'W27-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('71', '111', 'W18-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('72', '112', 'W11-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('73', '113', 'W7-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('74', '114', 'W8-2', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('75', '115', 'W12-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('76', '116', 'W16-3', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('77', '117', 'W16-2', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('78', '118', 'W14-2', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('79', '119', 'W15-2', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('80', '120', 'W19-1', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('81', '121', 'W24-1', '30', '现金', '30', '30', '2017-06-22', '2017-06-22', '0');
INSERT INTO `guest_balance` VALUES ('82', '122', 'W22-2', '1', '现金', '1', '1', '2017-09-20', '2017-09-20', '0');
INSERT INTO `guest_balance` VALUES ('83', '124', 'W22-1', '1', '现金', '1', '1', '2017-09-20', '2017-09-20', '0');
INSERT INTO `guest_balance` VALUES ('84', '125', 'W15-3', '1', '现金', '1', '1', '2017-09-20', '2017-09-20', '0');
INSERT INTO `guest_balance` VALUES ('85', '126', 'W17-3', '1', '现金', '1', '1', '2017-09-20', '2017-09-20', '0');
INSERT INTO `guest_balance` VALUES ('86', '128', 'W7-1', '1', '现金', '1', '1', '2017-09-20', '2017-09-20', '0');
INSERT INTO `guest_balance` VALUES ('87', '129', 'W18-2', '1', '现金', '1', '1', '2017-10-12', '2017-10-12', '0');

-- ----------------------------
-- Table structure for `guest_service`
-- ----------------------------
DROP TABLE IF EXISTS `guest_service`;
CREATE TABLE `guest_service` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GUEST_ID` int(10) unsigned DEFAULT NULL,
  `ROOM_NUMBER` varchar(64) DEFAULT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `LECHARGE` double DEFAULT NULL,
  `LECOUNT` int(11) DEFAULT NULL,
  `SPCHARGE` double DEFAULT NULL,
  `SPCOUNT` int(11) DEFAULT NULL,
  `TURN` int(11) DEFAULT NULL,
  `COMMENT` varchar(256) DEFAULT NULL,
  `FREE` int(11) DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  `FREE_MONEY` double DEFAULT NULL COMMENT '赠送金额',
  `FREE_REASON` varchar(64) DEFAULT NULL COMMENT '赠送理由',
  PRIMARY KEY (`ID`),
  KEY `GUEST_ID` (`GUEST_ID`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`),
  CONSTRAINT `guest_service_ibfk_1` FOREIGN KEY (`GUEST_ID`) REFERENCES `guest` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=985 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guest_service
-- ----------------------------
INSERT INTO `guest_service` VALUES ('1', '1', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('2', '1', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('3', '1', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', null, null);
INSERT INTO `guest_service` VALUES ('4', '1', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('5', '1', 'W33-3', 'water', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('6', '1', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('7', '1', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('8', '1', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('9', '1', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('10', '1', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('11', '1', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('12', '2', 'W32-1', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('13', '2', 'W32-1', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('14', '2', 'W32-1', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', null, null);
INSERT INTO `guest_service` VALUES ('15', '2', 'W32-1', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('16', '2', 'W32-1', 'water', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('17', '2', 'W32-1', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('18', '2', 'W32-1', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('19', '2', 'W32-1', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('20', '2', 'W32-1', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('21', '2', 'W32-1', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('22', '2', 'W32-1', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('23', '3', 'W2-1', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('24', '3', 'W2-1', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('25', '3', 'W2-1', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', null, null);
INSERT INTO `guest_service` VALUES ('26', '3', 'W2-1', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('27', '3', 'W2-1', 'water', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('28', '3', 'W2-1', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('29', '3', 'W2-1', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('30', '3', 'W2-1', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('31', '3', 'W2-1', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('32', '3', 'W2-1', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('33', '3', 'W2-1', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('309', '47', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('310', '47', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('311', '47', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', null, null);
INSERT INTO `guest_service` VALUES ('312', '47', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('313', '47', 'W33-3', 'water', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('314', '47', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('315', '47', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('316', '47', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('317', '47', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('318', '47', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('319', '47', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('320', '49', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('321', '49', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('322', '49', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', null, null);
INSERT INTO `guest_service` VALUES ('323', '49', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('324', '49', 'W33-3', 'water', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('325', '49', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('326', '49', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('327', '49', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('328', '49', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('329', '49', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('330', '49', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('331', '50', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('332', '50', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('333', '50', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', null, null);
INSERT INTO `guest_service` VALUES ('334', '50', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('335', '50', 'W33-3', 'water', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('336', '50', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('337', '50', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('338', '50', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('339', '50', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('340', '50', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('341', '50', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('342', '54', 'W33-2', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('343', '54', 'W33-2', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('344', '54', 'W33-2', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', null, null);
INSERT INTO `guest_service` VALUES ('345', '54', 'W33-2', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('346', '54', 'W33-2', 'water', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('347', '54', 'W33-2', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('348', '54', 'W33-2', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('349', '54', 'W33-2', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('350', '54', 'W33-2', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('351', '54', 'W33-2', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('352', '54', 'W33-2', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('353', '62', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('354', '62', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('355', '62', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('356', '62', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('357', '62', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('358', '62', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('359', '62', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', null, null);
INSERT INTO `guest_service` VALUES ('360', '62', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('361', '62', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('362', '62', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('363', '62', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('364', '62', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('365', '63', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('366', '63', 'W33-3', 'Plaza', '1000', '1', '1000', '1', '1', '无', '0', '1', null, null);
INSERT INTO `guest_service` VALUES ('367', '63', 'W33-3', '香格里拉', '1000', '1', '1000', '1', '1', '无', '0', '1', null, null);
INSERT INTO `guest_service` VALUES ('368', '63', 'W33-3', 'Plaza', '1000', '1', '1000', '1', '1', '无', '0', '1', null, null);
INSERT INTO `guest_service` VALUES ('369', '63', 'W33-3', '擦鞋费', '1000', '1', '1000', '1', '1', '无', '0', '3', null, null);
INSERT INTO `guest_service` VALUES ('370', '63', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '1', '9', null, null);
INSERT INTO `guest_service` VALUES ('371', '63', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('372', '63', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('373', '63', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('374', '63', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '1', '9', null, null);
INSERT INTO `guest_service` VALUES ('375', '63', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', null, null);
INSERT INTO `guest_service` VALUES ('376', '63', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('377', '63', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '1', '9', null, null);
INSERT INTO `guest_service` VALUES ('378', '63', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('379', '63', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('380', '63', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '1', '9', null, null);
INSERT INTO `guest_service` VALUES ('381', '64', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('382', '64', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('383', '64', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('384', '64', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('385', '64', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('386', '64', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('387', '64', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', null, null);
INSERT INTO `guest_service` VALUES ('388', '64', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('389', '64', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('390', '64', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('391', '64', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('392', '64', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('393', '66', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('394', '66', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('395', '66', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('396', '66', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('397', '66', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('398', '66', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('399', '66', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', null, null);
INSERT INTO `guest_service` VALUES ('400', '66', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('401', '66', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('402', '66', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('403', '66', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('404', '66', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', null, null);
INSERT INTO `guest_service` VALUES ('405', '67', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('406', '67', 'W33-3', '阿拉伯之塔', '1000', '1', '1000', '1', '1', '无', '0', '1', '0', '');
INSERT INTO `guest_service` VALUES ('407', '67', 'W33-3', 'Plaza', '1000', '1', '1000', '1', '1', '无', '0', '1', '0', '');
INSERT INTO `guest_service` VALUES ('408', '67', 'W33-3', '费用项目1', '1000', '1', '1000', '1', '1', '无', '0', '3', '0', '');
INSERT INTO `guest_service` VALUES ('409', '67', 'W33-3', '刷鞋费', '1000', '1', '1000', '1', '1', '无', '0', '3', '0', '');
INSERT INTO `guest_service` VALUES ('410', '67', 'W33-3', '擦鞋费', '1000', '1', '1000', '1', '1', '无', '0', '3', '0', '');
INSERT INTO `guest_service` VALUES ('411', '67', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('412', '67', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('413', '67', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('414', '67', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('415', '67', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('416', '67', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '5', '0', '');
INSERT INTO `guest_service` VALUES ('417', '67', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '1', '9', '6.66', '呵呵呵');
INSERT INTO `guest_service` VALUES ('418', '67', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('419', '67', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('420', '67', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('421', '67', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('422', '69', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('423', '69', 'W33-3', 'Plaza', '1000', '1', '1000', '1', '1', '无', '0', '1', '0', '');
INSERT INTO `guest_service` VALUES ('424', '69', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('425', '69', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('426', '69', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('427', '69', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('428', '69', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('429', '69', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('430', '69', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('431', '69', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('432', '69', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('433', '69', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('434', '69', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('435', '72', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('436', '72', 'W33-3', 'Plaza', '1000', '1', '1000', '1', '1', '无', '0', '1', '0', '');
INSERT INTO `guest_service` VALUES ('437', '72', 'W33-3', '费用项目', '1000', '1', '1000', '1', '1', '无', '0', '3', '0', '');
INSERT INTO `guest_service` VALUES ('438', '72', 'W33-3', '费用项目2', '1000', '1', '1000', '1', '1', '无', '0', '3', '0', '');
INSERT INTO `guest_service` VALUES ('439', '72', 'W33-3', '费用项目1', '1000', '1', '1000', '1', '1', '无', '0', '3', '0', '');
INSERT INTO `guest_service` VALUES ('440', '72', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('441', '72', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('442', '72', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('443', '72', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('444', '72', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('445', '72', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('446', '72', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '1', '9', '4.44', 'sss');
INSERT INTO `guest_service` VALUES ('447', '72', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('448', '72', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('449', '72', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('450', '72', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('451', '73', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('452', '73', 'W33-3', '阿拉伯之塔', '1000', '1', '1000', '1', '1', '无', '1', '1', '6.57', 'hehe');
INSERT INTO `guest_service` VALUES ('453', '73', 'W33-3', 'Plaza', '1000', '1', '1000', '1', '1', '无', '0', '1', '0', '');
INSERT INTO `guest_service` VALUES ('454', '73', 'W33-3', '阿拉伯之塔', '1000', '1', '1000', '1', '1', '无', '1', '1', '3.67', '666');
INSERT INTO `guest_service` VALUES ('455', '73', 'W33-3', '费用项目2', '1000', '1', '1000', '1', '1', '无', '1', '3', '7.89', '');
INSERT INTO `guest_service` VALUES ('456', '73', 'W33-3', '费用项目1', '1000', '1', '1000', '1', '1', '无', '0', '3', '0', '');
INSERT INTO `guest_service` VALUES ('457', '73', 'W33-3', '费用项目', '1000', '1', '1000', '1', '1', '无', '1', '3', '5.555', 'sdfsdf');
INSERT INTO `guest_service` VALUES ('458', '73', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('459', '73', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('460', '73', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('461', '73', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('462', '73', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('463', '73', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('464', '73', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('465', '73', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('466', '73', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('467', '73', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('468', '73', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('469', '74', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('470', '74', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('471', '74', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('472', '74', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('473', '74', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('474', '74', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('475', '74', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('476', '74', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('477', '74', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('478', '74', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('479', '74', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('480', '74', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('481', '75', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('482', '75', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('483', '75', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('484', '75', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('485', '75', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('486', '75', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('487', '75', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('488', '75', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('489', '75', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('490', '75', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('491', '75', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('492', '75', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('493', '77', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('494', '77', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('495', '77', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('496', '77', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('497', '77', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('498', '77', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('499', '77', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('500', '77', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('501', '77', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('502', '77', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('503', '77', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('504', '77', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('505', '78', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('506', '78', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('507', '78', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('508', '78', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('509', '78', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('510', '78', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('511', '78', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('512', '78', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('513', '78', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('514', '78', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('515', '78', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('516', '78', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('517', '80', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('518', '80', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('519', '80', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('520', '80', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('521', '80', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('522', '80', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('523', '80', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('524', '80', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('525', '80', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('526', '80', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('527', '80', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('528', '80', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('529', '81', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('530', '81', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('531', '81', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('532', '81', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('533', '81', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('534', '81', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('535', '81', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('536', '81', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('537', '81', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('538', '81', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('539', '81', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('540', '81', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('541', '83', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('542', '83', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('543', '83', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('544', '83', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('545', '83', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('546', '83', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('547', '83', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('548', '83', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('549', '83', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('550', '83', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('551', '83', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('552', '83', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('553', '84', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('554', '84', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('555', '84', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('556', '84', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('557', '84', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('558', '84', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('559', '84', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('560', '84', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('561', '84', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('562', '84', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('563', '84', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('564', '84', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('565', '85', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('566', '85', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('567', '85', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('568', '85', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('569', '85', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('570', '85', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('571', '85', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('572', '85', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('573', '85', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('574', '85', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('575', '85', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('576', '85', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('577', '87', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('578', '87', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('579', '87', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('580', '87', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('581', '87', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('582', '87', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('583', '87', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('584', '87', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('585', '87', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('586', '87', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('587', '87', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('588', '87', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('589', '88', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('590', '88', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('591', '88', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('592', '88', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('593', '88', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('594', '88', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('595', '88', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('596', '88', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('597', '88', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('598', '88', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('599', '88', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('600', '88', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('601', '89', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('602', '89', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('603', '89', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('604', '89', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('605', '89', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('606', '89', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('607', '89', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('608', '89', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('609', '89', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('610', '89', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('611', '89', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('612', '89', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('613', '90', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('614', '90', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('615', '90', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('616', '90', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('617', '90', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('618', '90', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('619', '90', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('620', '90', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('621', '90', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('622', '90', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('623', '90', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('624', '90', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('625', '91', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('626', '91', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('627', '91', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('628', '91', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('629', '91', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('630', '91', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('631', '91', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('632', '91', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('633', '91', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('634', '91', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('635', '91', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('636', '91', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('637', '92', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('638', '92', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('639', '92', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('640', '92', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('641', '92', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('642', '92', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('643', '92', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('644', '92', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('645', '92', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('646', '92', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('647', '92', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('648', '92', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('649', '93', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('650', '93', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('651', '93', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('652', '93', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('653', '93', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('654', '93', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('655', '93', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('656', '93', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('657', '93', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('658', '93', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('659', '93', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('660', '93', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('661', '94', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('662', '94', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('663', '94', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('664', '94', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('665', '94', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('666', '94', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('667', '94', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('668', '94', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('669', '94', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('670', '94', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('671', '94', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('672', '94', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('673', '95', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('674', '95', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('675', '95', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('676', '95', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('677', '95', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('678', '95', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('679', '95', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('680', '95', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('681', '95', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('682', '95', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('683', '95', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('684', '95', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('685', '97', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('686', '97', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('687', '97', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('688', '97', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('689', '97', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('690', '97', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('691', '97', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('692', '97', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('693', '97', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('694', '97', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('695', '97', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('696', '97', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('697', '98', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('698', '98', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('699', '98', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('700', '98', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('701', '98', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('702', '98', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('703', '98', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('704', '98', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('705', '98', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('706', '98', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('707', '98', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('708', '98', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('709', '100', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('710', '100', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('711', '100', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('712', '100', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('713', '100', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('714', '100', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('715', '100', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('716', '100', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('717', '100', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('718', '100', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('719', '100', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('720', '100', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('721', '101', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('722', '101', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('723', '101', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('724', '101', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('725', '101', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('726', '101', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('727', '101', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('728', '101', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('729', '101', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('730', '101', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('731', '101', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('732', '101', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('733', '102', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('734', '102', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('735', '102', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('736', '102', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('737', '102', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('738', '102', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('739', '102', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('740', '102', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('741', '102', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('742', '102', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('743', '102', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('744', '102', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('745', '103', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('746', '103', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('747', '103', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('748', '103', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('749', '103', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('750', '103', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('751', '103', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('752', '103', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('753', '103', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('754', '103', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('755', '103', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('756', '103', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('757', '104', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('758', '104', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('759', '104', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('760', '104', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('761', '104', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('762', '104', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('763', '104', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('764', '104', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('765', '104', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('766', '104', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('767', '104', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('768', '104', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('769', '105', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('770', '105', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('771', '105', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('772', '105', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('773', '105', 'W33-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('774', '105', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('775', '105', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('776', '105', 'W33-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('777', '105', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('778', '105', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('779', '105', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('780', '105', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('781', '106', 'W32-2', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('782', '106', 'W32-2', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('783', '106', 'W32-2', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('784', '106', 'W32-2', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('785', '106', 'W32-2', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('786', '106', 'W32-2', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('787', '106', 'W32-2', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('788', '106', 'W32-2', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('789', '106', 'W32-2', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('790', '106', 'W32-2', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('791', '106', 'W32-2', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('792', '106', 'W32-2', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('793', '107', 'W30-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('794', '107', 'W30-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('795', '107', 'W30-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('796', '107', 'W30-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('797', '107', 'W30-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('798', '107', 'W30-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('799', '107', 'W30-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('800', '107', 'W30-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('801', '107', 'W30-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('802', '107', 'W30-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('803', '107', 'W30-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('804', '107', 'W30-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('805', '108', 'W29-1', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('806', '108', 'W29-1', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('807', '108', 'W29-1', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('808', '108', 'W29-1', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('809', '108', 'W29-1', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('810', '108', 'W29-1', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('811', '108', 'W29-1', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('812', '108', 'W29-1', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('813', '108', 'W29-1', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('814', '108', 'W29-1', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('815', '108', 'W29-1', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('816', '108', 'W29-1', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('817', '109', 'W29-2', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('818', '109', 'W29-2', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('819', '109', 'W29-2', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('820', '109', 'W29-2', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('821', '109', 'W29-2', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('822', '109', 'W29-2', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('823', '109', 'W29-2', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('824', '109', 'W29-2', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('825', '109', 'W29-2', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('826', '109', 'W29-2', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('827', '109', 'W29-2', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('828', '109', 'W29-2', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('829', '110', 'W27-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('830', '110', 'W27-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('831', '110', 'W27-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('832', '110', 'W27-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('833', '110', 'W27-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('834', '110', 'W27-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('835', '110', 'W27-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('836', '110', 'W27-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('837', '110', 'W27-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('838', '110', 'W27-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('839', '110', 'W27-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('840', '110', 'W27-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('841', '111', 'W18-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('842', '111', 'W18-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('843', '111', 'W18-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('844', '111', 'W18-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('845', '111', 'W18-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('846', '111', 'W18-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('847', '111', 'W18-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('848', '111', 'W18-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('849', '111', 'W18-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('850', '111', 'W18-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('851', '111', 'W18-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('852', '111', 'W18-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('853', '112', 'W11-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('854', '112', 'W11-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('855', '112', 'W11-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('856', '112', 'W11-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('857', '112', 'W11-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('858', '112', 'W11-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('859', '112', 'W11-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('860', '112', 'W11-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('861', '112', 'W11-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('862', '112', 'W11-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('863', '112', 'W11-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('864', '112', 'W11-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('865', '113', 'W7-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('866', '113', 'W7-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('867', '113', 'W7-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('868', '113', 'W7-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('869', '113', 'W7-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('870', '113', 'W7-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('871', '113', 'W7-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('872', '113', 'W7-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('873', '113', 'W7-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('874', '113', 'W7-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('875', '113', 'W7-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('876', '113', 'W7-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('877', '114', 'W8-2', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('878', '114', 'W8-2', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('879', '114', 'W8-2', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('880', '114', 'W8-2', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('881', '114', 'W8-2', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('882', '114', 'W8-2', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('883', '114', 'W8-2', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('884', '114', 'W8-2', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('885', '114', 'W8-2', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('886', '114', 'W8-2', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('887', '114', 'W8-2', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('888', '114', 'W8-2', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('889', '115', 'W12-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('890', '115', 'W12-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('891', '115', 'W12-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('892', '115', 'W12-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('893', '115', 'W12-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('894', '115', 'W12-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('895', '115', 'W12-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('896', '115', 'W12-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('897', '115', 'W12-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('898', '115', 'W12-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('899', '115', 'W12-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('900', '115', 'W12-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('901', '116', 'W16-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('902', '116', 'W16-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('903', '116', 'W16-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('904', '116', 'W16-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('905', '116', 'W16-3', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('906', '116', 'W16-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('907', '116', 'W16-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('908', '116', 'W16-3', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('909', '116', 'W16-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('910', '116', 'W16-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('911', '116', 'W16-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('912', '116', 'W16-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('913', '117', 'W16-2', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('914', '117', 'W16-2', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('915', '117', 'W16-2', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('916', '117', 'W16-2', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('917', '117', 'W16-2', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('918', '117', 'W16-2', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('919', '117', 'W16-2', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('920', '117', 'W16-2', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('921', '117', 'W16-2', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('922', '117', 'W16-2', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('923', '117', 'W16-2', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('924', '117', 'W16-2', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('925', '118', 'W14-2', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('926', '118', 'W14-2', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('927', '118', 'W14-2', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('928', '118', 'W14-2', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('929', '118', 'W14-2', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('930', '118', 'W14-2', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('931', '118', 'W14-2', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('932', '118', 'W14-2', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('933', '118', 'W14-2', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('934', '118', 'W14-2', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('935', '118', 'W14-2', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('936', '118', 'W14-2', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('937', '119', 'W15-2', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('938', '119', 'W15-2', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('939', '119', 'W15-2', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('940', '119', 'W15-2', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('941', '119', 'W15-2', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('942', '119', 'W15-2', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('943', '119', 'W15-2', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('944', '119', 'W15-2', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('945', '119', 'W15-2', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('946', '119', 'W15-2', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('947', '119', 'W15-2', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('948', '119', 'W15-2', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('949', '120', 'W19-1', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('950', '120', 'W19-1', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('951', '120', 'W19-1', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('952', '120', 'W19-1', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('953', '120', 'W19-1', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('954', '120', 'W19-1', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('955', '120', 'W19-1', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('956', '120', 'W19-1', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('957', '120', 'W19-1', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('958', '120', 'W19-1', 'Int', '1000.5', '1', '1000', '1', '1', '无', '1', '9', '0', '');
INSERT INTO `guest_service` VALUES ('959', '120', 'W19-1', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('960', '120', 'W19-1', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('961', '121', 'W24-1', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('962', '121', 'W24-1', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('963', '121', 'W24-1', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('964', '121', 'W24-1', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('965', '121', 'W24-1', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('966', '121', 'W24-1', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('967', '121', 'W24-1', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('968', '121', 'W24-1', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('969', '121', 'W24-1', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('970', '121', 'W24-1', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('971', '121', 'W24-1', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('972', '121', 'W24-1', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('973', '124', 'W2-2', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('974', '124', 'W2-2', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('975', '124', 'W2-2', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('976', '124', 'W2-2', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('977', '124', 'W2-2', 'bottlewater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('978', '124', 'W2-2', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('979', '124', 'W2-2', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7', '0', '');
INSERT INTO `guest_service` VALUES ('980', '124', 'W2-2', 'barrelwater', '1000', '1', '1000', null, '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('981', '124', 'W2-2', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('982', '124', 'W2-2', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('983', '124', 'W2-2', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');
INSERT INTO `guest_service` VALUES ('984', '124', 'W2-2', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9', '0', '');

-- ----------------------------
-- Table structure for `host`
-- ----------------------------
DROP TABLE IF EXISTS `host`;
CREATE TABLE `host` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GUEST_ID` int(10) unsigned DEFAULT NULL,
  `HOST_NAME` varchar(64) DEFAULT NULL,
  `RENT_CHARGE` double DEFAULT NULL,
  `SERVICE_CHARGE` double DEFAULT NULL,
  `RETURN_MONEY` double DEFAULT NULL,
  `OTHER_CHARGE` double DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  `HOST_TYPE` varchar(64) DEFAULT NULL COMMENT 'SPC或小业主',
  `HOST_IDENTITY` varchar(64) DEFAULT NULL,
  `HOST_ACCOUNT` varchar(64) DEFAULT NULL,
  `TAX_CHARGE` double DEFAULT NULL,
  `TENET_CHARGE` double DEFAULT NULL COMMENT '物业管理费',
  `HEATING_CHARGE` double DEFAULT NULL,
  `ACTUAL_CHARGE` double DEFAULT NULL,
  `SPC_RECOVER` varchar(255) DEFAULT NULL COMMENT '是否追缴物业费（追缴/不追缴）',
  `HEATING_RECOVER` varchar(255) DEFAULT NULL COMMENT '是否追缴采暖费（追缴/不追缴）',
  `ACCOUNT_COMMENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `GUEST_ID` (`GUEST_ID`),
  CONSTRAINT `host_ibfk_1` FOREIGN KEY (`GUEST_ID`) REFERENCES `guest` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=75 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of host
-- ----------------------------
INSERT INTO `host` VALUES ('1', '1', 'bob', '20000.5', '10000.5', '5000.5', null, '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `host` VALUES ('2', '2', 'bob', '20000.5', '10000.5', '5000.5', null, '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `host` VALUES ('3', '3', 'bob', '20000.5', '10000.5', '5000.5', null, '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `host` VALUES ('15', '47', 'bob', '20000.5', '10000.5', '5000.5', null, '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `host` VALUES ('16', '49', 'bob', '20000.5', '10000.5', '5000.5', null, '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `host` VALUES ('17', '50', 'bob', '20000.5', '10000.5', '5000.5', null, '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `host` VALUES ('18', '54', 'bob', '20000.5', '10000.5', '5000.5', null, '0', null, null, null, null, null, null, null, null, null, null);
INSERT INTO `host` VALUES ('19', '62', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('20', '63', '张琴', '20000.5', '10000.5', '5000', '66', '0', '小业主', '09478093845093840593845', '983201928301922', '33.2', '21', '44.8', '4835', null, null, null);
INSERT INTO `host` VALUES ('21', '64', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('22', '66', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('23', '67', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('24', '69', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('25', '72', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('26', '73', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('27', '74', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('28', '75', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('29', '77', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('30', '78', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('31', '80', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('32', '81', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('33', '83', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('34', '84', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('35', '85', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('36', '87', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('37', '88', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('38', '89', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('39', '90', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('40', '91', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('41', '92', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('42', '93', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('43', '94', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('44', '95', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('45', '97', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('46', '98', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('47', '100', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('48', '101', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('49', '102', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('50', '103', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('51', '104', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('52', '105', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('53', '106', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('54', '107', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('55', '108', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('56', '109', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('57', '110', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('58', '111', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('59', '112', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('60', '113', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('61', '114', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('62', '115', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('63', '116', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('64', '117', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('65', '118', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('66', '119', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('67', '120', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('68', '121', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', null, null, null);
INSERT INTO `host` VALUES ('69', '122', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', '不追缴', '不追缴', '中国农业银行北洋支行');
INSERT INTO `host` VALUES ('70', '124', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', '不追缴', '不追缴', '中国农业银行北洋支行');
INSERT INTO `host` VALUES ('71', '125', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', '不追缴', '不追缴', '中国农业银行北洋支行');
INSERT INTO `host` VALUES ('72', '126', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', '不追缴', '不追缴', '中国农业银行北洋支行');
INSERT INTO `host` VALUES ('73', '128', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', '不追缴', '不追缴', '中国农业银行北洋支行');
INSERT INTO `host` VALUES ('74', '129', 'SPC', '20000.5', '10000.5', '0', '0', '0', 'SPC', '09478093845093840593845', '98320192830192', '0', '0', '0', '0', '不追缴', '不追缴', '中国农业银行北洋支行');

-- ----------------------------
-- Table structure for `income`
-- ----------------------------
DROP TABLE IF EXISTS `income`;
CREATE TABLE `income` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUMBER` varchar(64) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `TIME` datetime DEFAULT NULL,
  `CONTRACT_RECEIVE` double DEFAULT '0',
  `CONTAACT_PAY` double DEFAULT '0',
  `BENIFIT` double DEFAULT '0',
  `SOURCE` double DEFAULT '0',
  `DAILY_SERVICE` double DEFAULT '0',
  `MAINTAIN` double DEFAULT '0',
  `SHUTTLE_BUS` double DEFAULT '0',
  `LAUNDRY` double DEFAULT '0',
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of income
-- ----------------------------

-- ----------------------------
-- Table structure for `intern`
-- ----------------------------
DROP TABLE IF EXISTS `intern`;
CREATE TABLE `intern` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GUEST_ID` int(10) unsigned DEFAULT NULL,
  `LE_1` double DEFAULT NULL,
  `LE_2` double DEFAULT NULL,
  `LE_3` double DEFAULT NULL,
  `LE_SERVICE` double DEFAULT NULL,
  `IN_1` double DEFAULT NULL,
  `IN_2` double DEFAULT NULL,
  `IN_3` double DEFAULT NULL,
  `IN_SERVICE` double DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  `IN_NAME` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `GUEST_ID` (`GUEST_ID`),
  CONSTRAINT `intern_ibfk_1` FOREIGN KEY (`GUEST_ID`) REFERENCES `guest` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=70 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of intern
-- ----------------------------
INSERT INTO `intern` VALUES ('1', '1', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('2', '2', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('3', '3', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('15', '47', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('16', '49', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('17', '50', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('18', '54', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('19', '62', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('20', '63', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('21', '64', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('22', '66', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('23', '67', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('24', '69', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('25', '72', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('26', '73', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('27', '74', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('28', '75', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('29', '77', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('30', '78', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('31', '80', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('32', '81', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('33', '83', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('34', '84', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('35', '85', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('36', '87', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('37', '88', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('38', '89', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('39', '90', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('40', '91', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('41', '92', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('42', '93', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('43', '94', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('44', '95', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('45', '97', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('46', '98', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('47', '100', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('48', '101', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('49', '102', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('50', '103', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('51', '104', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('52', '105', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('53', '106', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('54', '107', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('55', '108', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('56', '109', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('57', '110', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('58', '111', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('59', '112', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('60', '113', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('61', '114', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('62', '115', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('63', '116', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('64', '117', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('65', '118', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('66', '119', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('67', '120', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('68', '121', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
INSERT INTO `intern` VALUES ('69', '124', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');

-- ----------------------------
-- Table structure for `invoice`
-- ----------------------------
DROP TABLE IF EXISTS `invoice`;
CREATE TABLE `invoice` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NUM` varchar(64) DEFAULT NULL,
  `PLAN_ID` int(11) DEFAULT NULL,
  `MONEY` double DEFAULT NULL,
  `CTIME` datetime DEFAULT NULL,
  `TERM` int(11) DEFAULT NULL,
  `OTHERS` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `PLAN_ID` (`PLAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invoice
-- ----------------------------

-- ----------------------------
-- Table structure for `invoice_detail`
-- ----------------------------
DROP TABLE IF EXISTS `invoice_detail`;
CREATE TABLE `invoice_detail` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `INV_ID` int(11) DEFAULT NULL,
  `ITEM` varchar(64) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `ALL_MONEY` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `INV_ID` (`INV_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of invoice_detail
-- ----------------------------

-- ----------------------------
-- Table structure for `laundry`
-- ----------------------------
DROP TABLE IF EXISTS `laundry`;
CREATE TABLE `laundry` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `DATE` date DEFAULT NULL,
  `ROOM_NUM` varchar(64) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `CLOTHES` varchar(1024) DEFAULT '[]',
  `OTHER` varchar(1024) DEFAULT '[]',
  `COUNT` int(11) DEFAULT '0',
  `TOTAL_PRICE` int(11) DEFAULT '0',
  `OCCUR_TIME` datetime DEFAULT NULL,
  `IMPORT_TIME` datetime DEFAULT NULL,
  `EDIT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of laundry
-- ----------------------------
INSERT INTO `laundry` VALUES ('1', '2017-05-02', 'W33-3', '1', 'Ada', '[]', '[]', '0', '0', '2017-06-01 23:51:39', '2017-05-18 23:52:18', '2017-05-31 23:52:21');
INSERT INTO `laundry` VALUES ('2', '2017-05-04', 'W2-1', '3', 'Tom', '[]', '[]', '0', '0', '2017-06-07 23:51:47', '2017-05-16 23:52:14', '2017-05-18 23:52:23');
INSERT INTO `laundry` VALUES ('3', '2017-04-27', 'W10-3', '47', 'Ada3', '[{\"name\":\"女装衬衫\",\"count\":1,\"mode\":\"水洗\"},{\"name\":\"睡衣\",\"count\":2,\"mode\":\"干洗\"},{\"name\":\"西服上衣\",\"count\":4,\"mode\":\"单熨\"},{\"name\":\"领带\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"围巾\",\"count\":3,\"mode\":\"单熨\"}]', '[{\"name\":\"我的衣服\",\"count\":3,\"mode\":\"干洗\",\"price\":44},{\"name\":\"我的裤子\",\"count\":4,\"mode\":\"干洗\",\"price\":55}]', '18', '505', '2017-04-27 00:00:00', '2017-05-08 23:52:11', '2017-05-15 00:14:50');
INSERT INTO `laundry` VALUES ('7', '2017-03-09', 'W1-3', '50', '测', '[{\"count\":2,\"name\":\"短裤\",\"mode\":\"干洗\"}]', '[{\"price\":5,\"count\":1,\"name\":\"袜子\",\"mode\":\"水洗\"}]', '0', '0', '2017-05-24 23:51:54', '2017-05-23 23:52:08', '2017-05-17 23:52:29');
INSERT INTO `laundry` VALUES ('11', '2017-05-12', 'W6-1', '59', 'aaa', '[{\"count\":1,\"name\":\"西服上衣\",\"mode\":\"单熨\"},{\"count\":20,\"name\":\"西服裤子\",\"mode\":\"单熨\"},{\"count\":2,\"name\":\"西服马甲\",\"mode\":\"单熨\"},{\"count\":2,\"name\":\"领带\",\"mode\":\"单熨\"},{\"count\":2,\"name\":\"休闲上衣\",\"mode\":\"单熨\"}]', '[]', '27', '222', '2017-05-17 23:52:00', '2017-05-29 23:52:03', '2017-05-06 23:52:34');
INSERT INTO `laundry` VALUES ('12', '2017-05-12', 'W7-3', '50', '测', '[{\"count\":2,\"name\":\"西服上衣\",\"mode\":\"单熨\"},{\"count\":2,\"name\":\"西服裤子\",\"mode\":\"单熨\"},{\"count\":2,\"name\":\"西服马甲\",\"mode\":\"单熨\"},{\"count\":1,\"name\":\"领带\",\"mode\":\"单熨\"},{\"count\":1,\"name\":\"休闲上衣\",\"mode\":\"单熨\"},{\"count\":1,\"name\":\"毛衣\",\"mode\":\"单熨\"}]', '[]', '9', '80', '2017-05-12 00:00:00', '2017-05-12 23:34:28', '2017-05-12 23:35:39');
INSERT INTO `laundry` VALUES ('24', '2017-05-14', 'W26-3', '60', 'abc', '[{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"水洗\"},{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"干洗\"}]', '[]', '2', '45', '2017-05-14 00:00:00', '2017-05-14 15:56:46', '2017-05-14 15:56:46');
INSERT INTO `laundry` VALUES ('25', '2017-05-14', 'W26-3', '60', 'abc', '[{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"水洗\"},{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"干洗\"}]', '[]', '2', '45', '2017-05-14 00:00:00', '2017-05-14 15:56:57', '2017-05-14 15:56:57');
INSERT INTO `laundry` VALUES ('27', '2017-05-14', 'W26-3', '60', 'abc', '[{\"name\":\"领带\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"风衣\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"休闲裤\",\"count\":10,\"mode\":\"单熨\"}]', '[]', '13', '120', '2017-05-14 00:00:00', '2017-05-14 15:59:27', '2017-05-14 15:59:27');
INSERT INTO `laundry` VALUES ('28', '2017-05-14', 'W26-3', '60', 'abc', '[{\"name\":\"西服裤子\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"毛衣\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"休闲裤\",\"count\":8,\"mode\":\"单熨\"}]', '[]', '11', '90', '2017-05-14 00:00:00', '2017-05-14 16:00:37', '2017-05-14 16:00:37');
INSERT INTO `laundry` VALUES ('30', '2017-05-14', 'W26-3', '60', 'abc', '[{\"name\":\"领带\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"毛衣\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"羊绒外套（短）\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '4', '50', '2017-05-14 00:00:00', '2017-05-14 16:03:51', '2017-05-14 16:03:51');
INSERT INTO `laundry` VALUES ('31', '2017-05-14', 'W26-3', '60', 'abc', '[{\"name\":\"西服上衣\",\"count\":8,\"mode\":\"干洗\"},{\"name\":\"西服裤子\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '10', '256', '2017-05-14 00:00:00', '2017-05-14 16:04:34', '2017-05-14 16:04:34');
INSERT INTO `laundry` VALUES ('32', '2017-05-15', 'W33-3', '1', 'Ada', '[{\"name\":\"背心\",\"count\":5,\"mode\":\"水洗\"},{\"name\":\"休闲上衣\",\"count\":5,\"mode\":\"干洗\"},{\"name\":\"羽绒外套（短）\",\"count\":5,\"mode\":\"干洗\"},{\"name\":\"羊绒外套（中）\",\"count\":3,\"mode\":\"单熨\"}]', '[{\"name\":\"手巾\",\"count\":2,\"mode\":\"水洗\",\"price\":10},{\"name\":\"护甲\",\"count\":2,\"mode\":\"干洗\",\"price\":104},{\"name\":\"护膝\",\"count\":1,\"mode\":\"干洗\",\"price\":43},{\"name\":\"盔甲\",\"count\":3,\"mode\":\"单熨\",\"price\":57}]', '26', '1042', '2017-05-15 00:00:00', '2017-05-15 00:20:55', '2017-05-15 17:41:34');
INSERT INTO `laundry` VALUES ('33', '2017-05-16', 'W11-1', '49', 'Ada5', '[{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"干洗\"},{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"干洗\"},{\"name\":\"T恤\",\"count\":1,\"mode\":\"干洗\"},{\"name\":\"丝质围巾\",\"count\":1,\"mode\":\"干洗\"}]', '[{\"name\":\"皮鞋2\",\"count\":5,\"mode\":\"水洗\",\"price\":14},{\"name\":\"皮鞋3\",\"count\":1,\"mode\":\"水洗\",\"price\":15},{\"name\":\"皮鞋1\",\"count\":2,\"mode\":\"干洗\",\"price\":102}]', '12', '399', '2017-05-16 00:00:00', '2017-05-16 14:48:27', '2017-05-16 14:48:27');
INSERT INTO `laundry` VALUES ('34', '2017-05-16', 'W33-3', '1', 'Ada', '[{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"水洗\"}]', '[]', '1', '20', '2017-05-16 00:00:00', '2017-05-16 14:49:25', '2017-05-16 14:49:25');
INSERT INTO `laundry` VALUES ('35', '2017-05-16', 'W7-3', '50', '测', '[{\"name\":\"西服上衣\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"西服裤子\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '2', '18', '2017-05-16 00:00:00', '2017-05-16 17:04:15', '2017-05-16 17:04:15');
INSERT INTO `laundry` VALUES ('36', '2017-05-16', 'W7-3', '50', '测', '[]', '[]', '0', '0', '2017-05-16 00:00:00', '2017-05-16 17:04:29', '2017-05-16 17:04:29');
INSERT INTO `laundry` VALUES ('37', '2017-05-16', 'W7-3', '50', '测', '[]', '[]', '0', '0', '2017-05-16 00:00:00', '2017-05-16 17:04:50', '2017-05-16 17:04:50');
INSERT INTO `laundry` VALUES ('38', '2017-05-24', 'W11-1', '49', 'Ada5', '[{\"name\":\"休闲上衣\",\"count\":22,\"mode\":\"单熨\"},{\"name\":\"毛衣/毛衣外套\",\"count\":1,\"mode\":\"单熨\"}]', '[{\"name\":\"其他1\",\"count\":1,\"mode\":\"干洗\",\"price\":10},{\"name\":\"布衣\",\"count\":1,\"mode\":\"干洗\",\"price\":40},{\"name\":\"卫衣\",\"count\":2,\"mode\":\"单熨\",\"price\":33}]', '27', '346', '2017-05-24 00:00:00', '2017-05-25 15:26:09', '2017-05-25 15:53:26');
INSERT INTO `laundry` VALUES ('39', '2017-05-25', 'W11-1', '49', 'Ada5', '[{\"name\":\"西服马甲\",\"count\":3,\"mode\":\"单熨\"}]', '[]', '3', '24', '2017-05-25 00:00:00', '2017-05-25 15:56:12', '2017-05-25 15:56:12');
INSERT INTO `laundry` VALUES ('40', '2017-05-25', 'W33-3', '1', 'Ada', '[{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"水洗\"},{\"name\":\"毛衣/毛衣外套\",\"count\":1,\"mode\":\"干洗\"}]', '[]', '2', '50', '2017-05-25 00:00:00', '2017-05-25 15:56:26', '2017-05-25 15:56:26');
INSERT INTO `laundry` VALUES ('41', '2017-05-25', 'W33-3', '1', 'Ada', '[{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"干洗\"},{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '2', '35', '2017-05-25 00:00:00', '2017-05-25 16:00:54', '2017-05-25 16:00:54');
INSERT INTO `laundry` VALUES ('42', '2017-05-16', 'W11-1', '49', 'Ada5', '[{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"领带\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '2', '16', '2017-05-16 00:00:00', '2017-05-25 16:01:58', '2017-05-25 16:06:53');
INSERT INTO `laundry` VALUES ('43', '2017-05-24', 'W33-3', '1', 'Ada', '[{\"name\":\"西服上衣\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '1', '10', '2017-05-24 00:00:00', '2017-05-25 16:04:01', '2017-05-25 16:04:01');
INSERT INTO `laundry` VALUES ('44', '2017-05-23', 'W11-1', '49', 'Ada5', '[{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"领带\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '2', '16', '2017-05-23 00:00:00', '2017-05-25 16:05:38', '2017-05-25 16:05:38');
INSERT INTO `laundry` VALUES ('45', '2017-06-05', 'W33-3', '1', 'Ada', '[{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '1', '8', '2017-06-05 00:00:00', '2017-06-05 14:21:41', '2017-06-05 14:21:41');

-- ----------------------------
-- Table structure for `mail_reminder`
-- ----------------------------
DROP TABLE IF EXISTS `mail_reminder`;
CREATE TABLE `mail_reminder` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `SENDER_ID` int(11) DEFAULT NULL,
  `SENDER_NAME` varchar(64) DEFAULT NULL,
  `RECEIVER_ID` int(11) DEFAULT NULL,
  `RECEIVER_NAME` varchar(64) DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `CONTENT` varchar(1000) DEFAULT NULL,
  `REMIND_DATE` date DEFAULT NULL,
  `EDIT_TIME` datetime DEFAULT NULL,
  `STATE` varchar(10) DEFAULT NULL COMMENT '完成、未完成',
  `RECEIVE_STATE` varchar(255) DEFAULT '',
  `REPLY` varchar(1000) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of mail_reminder
-- ----------------------------
INSERT INTO `mail_reminder` VALUES ('2', '2', 'test', '10', '王二', 'heheh1', 'lkjsldkfjsd\ns\ndf\'asdf', '2017-06-11', '2017-06-12 17:05:57', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('3', '2', 'test', '12', 'testr345', 'sdf', 'asdf', '2017-06-12', '2017-06-12 16:33:34', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('6', '11', 'test8', '2', 'test', 'hahah', '今天好玩吗', '2017-06-14', '2017-06-14 14:54:51', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('7', '11', 'test8', '2', 'test', '嘿嘿', '在吗啊', '2017-06-14', '2017-06-14 14:55:02', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('8', '10', '王二', '2', 'test', '记得叫水哦', '立刻就死定了开发建设劳动法', '2017-06-09', '2017-06-14 14:58:41', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('9', '10', '王二', '2', 'test', '记得叫水哦1112', '立刻就死定了开发建设劳动法2', '2017-06-09', '2017-06-14 14:58:47', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('10', '10', '王二', '2', 'test', '你好', '今天：\n 记得把东西还给客人\n    姚陈堃', '2017-06-14', '2017-06-15 16:50:30', '完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('11', '2', 'test', '10', '王二', '1', '2', '2017-06-14', '2017-06-14 15:00:47', '完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('12', '2', 'test', '10', '王二', '3', '4', '2017-06-14', '2017-06-14 15:00:58', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('13', '2', 'test', '10', '王二', '5', '46', '2017-06-14', '2017-06-14 15:01:03', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('14', '2', 'test', '10', '王二', '57', '7', '2017-06-14', '2017-06-14 15:01:07', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('15', '2', 'test', '10', '王二', '578', '78', '2017-06-14', '2017-06-14 15:01:10', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('16', '10', '王二', '2', 'test', '今天天好蓝1', '', '2017-06-15', '2017-06-15 16:47:31', '完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('17', '10', '王二', '2', 'test', '远方的朋友还好吗', '', '2017-06-15', '2017-06-15 16:47:29', '完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('18', '14', 'test12312', '2', 'test', 'haha', 'sdfsdfasdf', '2017-06-15', '2017-06-15 16:47:00', '完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('19', '14', 'test12312', '2', 'test', 'W33-2的客人需要水', 'sdfsdfasdf', '2017-06-15', '2017-06-16 15:12:24', '完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('20', '10', '王二', '2', 'test', '`12123123sss', 'sdfsdfasdfa', '2017-07-13', '2017-06-16 17:05:42', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('21', '2', 'test', '10', '王二', '111', 'dsdf', '2017-09-14', '2017-09-14 16:40:45', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('23', '2', 'test', '2', 'test', 'xxxx', 'sdfsdfsdf', '2017-09-14', '2017-09-14 16:41:30', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('24', '2', 'test', '10', '王二', '22', '332', '2017-10-09', '2017-10-09 10:57:31', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('25', '2', 'test', '14', 'testr345', '12', 'sssss', '2017-10-09', '2017-10-09 11:29:40', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('26', '2', 'test', '12', 'yaochenkun', '12', 'sssss', '2017-10-09', '2017-10-09 11:29:40', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('27', '2', 'test', '14', 'test12312', 'hello', 'hello1', '2017-10-09', '2017-10-09 11:31:10', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('28', '2', 'test', '11', 'test8', 'hello', 'hello1', '2017-10-09', '2017-10-09 11:31:10', '未完成', '待接受', null);
INSERT INTO `mail_reminder` VALUES ('29', '2', 'test', '2', 'test', 'hello呼呼呼呼1', 'hello1222222222\nalskdjflaksdfasf', '2017-10-09', '2017-10-09 15:57:01', '未完成', '已接受', 'dsdfsdfsdfddddd111');
INSERT INTO `mail_reminder` VALUES ('30', '2', 'test', '1', 'BUPTADMIN', 'xixixixi', 'lkjlsdkjfsdfsdf', '2017-10-09', '2017-10-09 15:06:07', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('31', '2', 'test', '20', 'yaochenkun', 'xixixixi', 'lkjlsdkjfsdfsdf', '2017-10-09', '2017-10-09 15:06:07', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('32', '2', 'test', '11', 'test8', '呼呼呼呼', '山东师范是', '2017-10-09', '2017-10-09 15:57:28', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('33', '2', 'test', '2', 'test', '呼呼呼呼', '山东师范是', '2017-10-09', '2017-10-09 15:58:02', '未完成', '已回复', '收到啦~~');
INSERT INTO `mail_reminder` VALUES ('34', '2', 'test', '20', 'yaochenkun', '1', '22', '2017-10-17', '2017-10-17 10:26:24', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('35', '2', 'test', '20', 'yaochenkun', '1', '22', '2017-10-17', '2017-10-17 10:26:24', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('36', '2', 'test', '2', 'test', '1', '22', '2017-10-17', '2017-10-17 10:27:12', '未完成', '已回复', '223123123');
INSERT INTO `mail_reminder` VALUES ('37', '0', 'ADMIN', '1', 'BUPTADMIN', '紧急事件处理', '您有一个紧急事件亟待处理!', '2017-12-19', '2017-12-25 09:45:27', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('38', '0', 'ADMIN', '2', 'test', '紧急事件处理', '您有一个紧急事件亟待处理!', '2017-12-19', '2017-12-25 09:45:27', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('39', '0', 'ADMIN', '10', '王二', '紧急事件处理', '您有一个紧急事件亟待处理!', '2017-12-19', '2017-12-25 09:45:27', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('40', '0', 'ADMIN', '11', 'test', '紧急事件处理', '您有一个紧急事件亟待处理!', '2017-12-19', '2017-12-25 09:45:27', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('41', '0', 'ADMIN', '12', 'test', '紧急事件处理', '您有一个紧急事件亟待处理!', '2017-12-19', '2017-12-25 09:45:27', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('42', '0', 'ADMIN', '14', 'test', '紧急事件处理', '您有一个紧急事件亟待处理!', '2017-12-19', '2017-12-25 09:45:27', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('43', '0', 'ADMIN', '20', '姚陈堃', '紧急事件处理', '您有一个紧急事件亟待处理!', '2017-12-19', '2017-12-25 09:45:27', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('44', '0', 'ADMIN', '21', 'lkjdlfsldf', '紧急事件处理', '您有一个紧急事件亟待处理!', '2017-12-19', '2017-12-25 09:45:27', '未完成', '待接受', '');
INSERT INTO `mail_reminder` VALUES ('45', '0', 'ADMIN', '22', 'test', '紧急事件处理', '您有一个紧急事件亟待处理!', '2017-12-19', '2017-12-25 09:45:27', '未完成', '待接受', '');

-- ----------------------------
-- Table structure for `maintain`
-- ----------------------------
DROP TABLE IF EXISTS `maintain`;
CREATE TABLE `maintain` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUMBER` varchar(64) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `STIME` datetime DEFAULT NULL,
  `FTIME` datetime DEFAULT NULL,
  `ETIME` datetime DEFAULT NULL,
  `LEVEL` int(11) DEFAULT NULL,
  `PROBLEM` varchar(1024) DEFAULT '',
  `PRO_TYPE` varchar(256) DEFAULT NULL,
  `PRO_CAUSE` varchar(256) DEFAULT NULL,
  `PRO_DETAIL` varchar(1024) DEFAULT '',
  `PIC` varchar(256) DEFAULT NULL,
  `CHARGE` double DEFAULT '0',
  `TIMES` int(11) DEFAULT '1',
  `COMMENT` varchar(256) DEFAULT NULL,
  `FOLLOW` varchar(1024) DEFAULT '',
  `STATE` int(11) DEFAULT '0',
  `PAY` tinyint(1) DEFAULT '0',
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maintain
-- ----------------------------
INSERT INTO `maintain` VALUES ('1', 'W33-3', null, '2017-09-11 00:00:00', null, '2017-09-12 00:00:00', null, '空调故障', '', '', '1', null, '12', '1', '12', '', '1', '0', '1');

-- ----------------------------
-- Table structure for `meal`
-- ----------------------------
DROP TABLE IF EXISTS `meal`;
CREATE TABLE `meal` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUM` varchar(64) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `RESTAURANT_NAME` varchar(64) DEFAULT NULL,
  `TOTAL_PRICE` double DEFAULT NULL COMMENT '总消费费用',
  `PAY_MODE` tinyint(3) DEFAULT NULL COMMENT '支付方式（现金0 月结1）',
  `COMMENT` varchar(64) DEFAULT NULL,
  `STAFF_ID` int(11) DEFAULT NULL COMMENT '点餐人的ID号',
  `STAFF_NAME` varchar(64) DEFAULT NULL,
  `OCCUR_TIME` datetime DEFAULT NULL COMMENT '发生时间(点餐时间）',
  `IMPORT_TIME` datetime DEFAULT NULL,
  `EDIT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meal
-- ----------------------------
INSERT INTO `meal` VALUES ('1', 'W33-2', '54', 'Ada', '其他', '0', '0', '无', '3', 'andy', '2017-06-10 00:00:00', '2017-06-12 20:25:30', '2017-06-12 20:25:30');
INSERT INTO `meal` VALUES ('3', 'W33-2', '54', 'Ada', '其他', '0', '0', '无', '0', '请选择', '2017-06-12 00:00:00', '2017-06-12 20:26:43', '2017-06-12 20:26:43');
INSERT INTO `meal` VALUES ('4', 'W33-2', '54', 'Ada', '其他', '0', '0', '无', '1', 'ken', '2017-06-12 00:00:00', '2017-06-12 20:26:55', '2017-06-12 20:53:38');
INSERT INTO `meal` VALUES ('5', 'W33-2', '54', 'Ada', '其他', '0', '0', '无', '0', '请选择', '2017-06-12 00:00:00', '2017-06-12 20:27:01', '2017-06-12 20:27:01');
INSERT INTO `meal` VALUES ('6', 'W33-2', '54', 'Ada', '其他', '0', '0', '无', '0', '请选择', '2017-06-12 00:00:00', '2017-06-12 20:28:01', '2017-06-12 20:28:01');
INSERT INTO `meal` VALUES ('7', 'W33-2', '54', 'Ada', '其他', '0', '0', '无', '0', '请选择', '2017-06-12 00:00:00', '2017-06-12 20:28:08', '2017-06-12 20:28:08');
INSERT INTO `meal` VALUES ('8', 'W7-3', '50', '测', '其他', '0', '0', '无', '0', '请选择', '2017-06-12 00:00:00', '2017-06-12 22:05:00', '2017-06-12 22:05:00');
INSERT INTO `meal` VALUES ('9', 'W11-1', '49', 'Ada5', '亚当饼王', '0', '1', '无', '2', 'test', '2017-06-14 00:00:00', '2017-06-14 12:05:45', '2017-06-14 12:06:00');
INSERT INTO `meal` VALUES ('10', 'W11-1', '49', 'Ada5', '元气寿司', '0', '0', '无', '0', '请选择', '2017-06-14 00:00:00', '2017-06-14 12:34:02', '2017-06-14 12:34:41');
INSERT INTO `meal` VALUES ('11', 'W33-3', '105', 'Ada', '大宅门', '30', '0', '无', '2', 'test', '2017-10-18 00:00:00', '2017-10-18 16:49:27', '2017-10-18 16:49:27');
INSERT INTO `meal` VALUES ('12', 'W33-3', '105', 'Ada', '海底捞', '22', '0', '无', '2', 'test', '2017-10-18 00:00:00', '2017-10-18 16:53:21', '2017-10-18 16:53:21');
INSERT INTO `meal` VALUES ('13', 'W33-3', '105', 'Ada', '海底捞', '22', '0', '无', '2', 'test', '2017-10-18 00:00:00', '2017-10-18 16:53:31', '2017-10-18 16:53:31');
INSERT INTO `meal` VALUES ('14', 'W33-2', '54', 'Ada', '其他', '0', '0', '无', '0', '请选择', '2017-10-24 00:00:00', '2017-10-24 09:34:25', '2017-10-24 09:34:25');
INSERT INTO `meal` VALUES ('15', 'W33-2', '54', 'Ada', '其他', '0', '0', '无', '0', '请选择', '2017-10-24 00:00:00', '2017-10-24 09:34:28', '2017-10-24 09:34:28');

-- ----------------------------
-- Table structure for `message`
-- ----------------------------
DROP TABLE IF EXISTS `message`;
CREATE TABLE `message` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `CTIME` date NOT NULL,
  `NTIME` date NOT NULL,
  `TYPE` int(11) NOT NULL,
  `USERID` int(10) unsigned NOT NULL DEFAULT '0',
  `CONTENT` varchar(256) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `USERID` (`USERID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of message
-- ----------------------------

-- ----------------------------
-- Table structure for `other_fare`
-- ----------------------------
DROP TABLE IF EXISTS `other_fare`;
CREATE TABLE `other_fare` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUM` varchar(64) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `USAGE_TYPE` varchar(64) DEFAULT NULL,
  `PAY_MODE` tinyint(3) DEFAULT NULL,
  `COMMENT` varchar(64) DEFAULT NULL,
  `TOTAL_PRICE` double DEFAULT NULL,
  `STAFF_ID` int(11) DEFAULT NULL,
  `STAFF_NAME` varchar(64) DEFAULT NULL,
  `OCCUR_TIME` datetime DEFAULT NULL,
  `IMPORT_TIME` datetime DEFAULT NULL,
  `EDIT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of other_fare
-- ----------------------------
INSERT INTO `other_fare` VALUES ('1', 'W33-3', '1', 'Ada', '租车', '1', '无', '23.8', null, '姚陈坤', '2017-05-25 00:00:00', '2017-05-25 15:31:16', '2017-05-25 15:32:13');
INSERT INTO `other_fare` VALUES ('2', 'W11-1', '49', 'Ada5', '出租车', '1', '租了一辆车', '200.72', null, '小明', '2017-05-25 00:00:00', '2017-05-25 15:32:48', '2017-05-25 15:32:48');
INSERT INTO `other_fare` VALUES ('3', 'W33-3', '105', 'Ada', '租车', '0', '4', '4', null, '4', '2017-11-01 00:00:00', '2017-11-01 10:55:51', '2017-11-01 10:55:51');
INSERT INTO `other_fare` VALUES ('4', 'W33-3', '105', 'Ada', '租车', '0', '4', '4', null, '4', '2017-11-01 00:00:00', '2017-11-01 10:55:53', '2017-11-01 10:55:53');
INSERT INTO `other_fare` VALUES ('5', 'W33-3', '105', 'Ada', '租车', '0', '4', '4', null, '4', '2017-11-01 00:00:00', '2017-11-01 10:55:56', '2017-11-01 10:55:56');
INSERT INTO `other_fare` VALUES ('6', 'W33-3', '105', 'Ada', '租车', '0', '4', '4', null, '4', '2017-11-01 00:00:00', '2017-11-01 10:55:59', '2017-11-01 10:55:59');
INSERT INTO `other_fare` VALUES ('7', 'W33-3', '105', 'Ada', '租车', '0', '4', '4', null, '4', '2017-11-01 00:00:00', '2017-11-01 10:56:01', '2017-11-01 10:56:01');
INSERT INTO `other_fare` VALUES ('8', 'W33-3', '105', 'Ada', '租车', '0', '4', '4', null, '4', '2017-11-01 00:00:00', '2017-11-01 10:56:03', '2017-11-01 10:56:03');
INSERT INTO `other_fare` VALUES ('9', 'W33-3', '105', 'Ada', '租车', '0', '4', '4', null, '4', '2017-11-01 00:00:00', '2017-11-01 10:56:06', '2017-11-01 10:56:06');
INSERT INTO `other_fare` VALUES ('10', 'W33-3', '105', 'Ada', '租车', '0', '这是一个长字符串长字符串长字符串', '4343434343', null, '34', '2017-11-01 00:00:00', '2017-11-01 11:02:00', '2017-11-01 11:02:00');

-- ----------------------------
-- Table structure for `plan`
-- ----------------------------
DROP TABLE IF EXISTS `plan`;
CREATE TABLE `plan` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) DEFAULT NULL,
  `CTIME` datetime DEFAULT NULL,
  `MONEY` double DEFAULT NULL,
  `STAFF` varchar(64) DEFAULT NULL,
  `COMMENT` varchar(64) DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=98 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('90', '2017-06-02采购冰箱', '2017-06-02 13:31:16', '100', 'Alice', '无', null);
INSERT INTO `plan` VALUES ('91', '2017-06-02采购冰箱', '2017-06-02 13:32:00', '100', 'Alice', '无', null);
INSERT INTO `plan` VALUES ('92', '2017-06-02采购冰箱', '2017-06-02 13:33:42', '50', 'Alice', '无', null);
INSERT INTO `plan` VALUES ('93', '2017-06-02采购冰箱', '2017-06-02 14:10:15', '200', 'Alice', '无', null);
INSERT INTO `plan` VALUES ('94', '2017-06-02采购冰箱', '2017-06-02 16:18:47', '100', 'Alice', '无', null);
INSERT INTO `plan` VALUES ('95', '2017-06-02采购冰箱', '2017-06-02 16:22:36', '100', 'Alice', '无', null);
INSERT INTO `plan` VALUES ('96', '2017-06-02采购冰箱', '2017-06-02 16:44:23', '100', 'Alice', '无', null);
INSERT INTO `plan` VALUES ('97', '2017-11-07采购冰箱', '2017-11-07 11:15:33', '0', 'Alice', '无', null);

-- ----------------------------
-- Table structure for `plan_detail`
-- ----------------------------
DROP TABLE IF EXISTS `plan_detail`;
CREATE TABLE `plan_detail` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PLAN_ID` int(11) DEFAULT NULL,
  `FAC_ID` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `ALREADY` int(11) DEFAULT '0',
  `UNITPRICE` double DEFAULT NULL,
  `ALL_MONEY` double DEFAULT NULL,
  `PROVIDER` varchar(64) DEFAULT NULL COMMENT '供应商',
  `INVOICE_TYPE` varchar(20) DEFAULT '' COMMENT '不含票  含普票 含增票',
  `RECEIVED` varchar(10) DEFAULT '' COMMENT '是否收到（0否 1收到）',
  `ORDER_DATE` date DEFAULT NULL COMMENT '下单日期',
  `ARRIVAL_DATE` date DEFAULT NULL COMMENT '到货日期',
  `COMMENT` varchar(64) DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `PLAN_ID` (`PLAN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_detail
-- ----------------------------
INSERT INTO `plan_detail` VALUES ('86', '90', '78', '10', '10', '10', '100', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null);
INSERT INTO `plan_detail` VALUES ('87', '91', '79', '10', '0', '10', '100', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null);
INSERT INTO `plan_detail` VALUES ('88', '92', '78', '5', '4', '10', '50', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null);
INSERT INTO `plan_detail` VALUES ('89', '93', '86', '10', '3', '10', '100', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null);
INSERT INTO `plan_detail` VALUES ('90', '93', '87', '10', '4', '10', '100', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null);
INSERT INTO `plan_detail` VALUES ('91', '94', '89', '10', '7', '10', '100', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null);
INSERT INTO `plan_detail` VALUES ('92', '95', '90', '10', '7', '10', '100', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null);
INSERT INTO `plan_detail` VALUES ('93', '96', '91', '10', '10', '10', '100', '国美电器', '不含票', '-', '2017-06-02', '2017-06-02', '无', null);

-- ----------------------------
-- Table structure for `plan_progress`
-- ----------------------------
DROP TABLE IF EXISTS `plan_progress`;
CREATE TABLE `plan_progress` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TIME` datetime DEFAULT NULL,
  `PLAN_ID` int(11) DEFAULT NULL,
  `FAC_ID` int(11) DEFAULT NULL,
  `TERM` varchar(64) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `STAFF` varchar(64) DEFAULT NULL,
  `ALL_MONEY` double DEFAULT NULL,
  `COMMENT` varchar(64) DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `PLAN_ID` (`PLAN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=68 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_progress
-- ----------------------------
INSERT INTO `plan_progress` VALUES ('51', '2017-06-02 12:45:46', '88', '68', '采购', '8', 'Alice', '80', '无', null);
INSERT INTO `plan_progress` VALUES ('52', '2017-06-02 13:31:42', '90', '78', '采购', '10', 'Alice', '100', '无', null);
INSERT INTO `plan_progress` VALUES ('53', '2017-06-02 13:34:07', '92', '78', '采购', '4', 'Alice', '40', '无', null);
INSERT INTO `plan_progress` VALUES ('54', '2017-06-02 14:12:13', '93', '86', '采购', '3', 'Alice', '30', '无', null);
INSERT INTO `plan_progress` VALUES ('55', '2017-06-02 14:12:48', '93', '87', '采购', '4', 'Alice', '40', '无', null);
INSERT INTO `plan_progress` VALUES ('56', '2017-06-02 16:19:08', '94', '89', '采购', '1', 'Alice', '10', '无', null);
INSERT INTO `plan_progress` VALUES ('57', '2017-06-02 16:19:18', '94', '89', '采购', '6', 'Alice', '60', '无', null);
INSERT INTO `plan_progress` VALUES ('58', '2017-06-02 16:23:08', '95', '90', '采购', '7', 'Alice', '70', '无', null);
INSERT INTO `plan_progress` VALUES ('59', '2017-06-02 16:44:35', '96', '91', '采购', '10', 'Alice', '100', '无', null);
INSERT INTO `plan_progress` VALUES ('60', '2017-09-08 15:54:17', '91', '79', '采购', '1', 'Alice', '10', '无', null);
INSERT INTO `plan_progress` VALUES ('61', '2017-09-18 19:07:39', '91', '79', '采购', '2', 'Alice', '20', '无', null);
INSERT INTO `plan_progress` VALUES ('62', '2017-09-18 19:09:22', '91', '79', '采购', '5', 'ZhangSan', '50', '无', null);
INSERT INTO `plan_progress` VALUES ('63', '2017-09-20 15:19:23', '91', '79', '采购', '1', 'Alice', '10', '无', null);
INSERT INTO `plan_progress` VALUES ('64', '2017-09-20 15:19:28', '91', '79', '采购', '1', 'Alice', '10', '无', null);
INSERT INTO `plan_progress` VALUES ('65', '2017-09-20 15:22:03', '93', '86', '采购', '1', 'Alice', '10', '无', null);
INSERT INTO `plan_progress` VALUES ('66', '2017-09-20 15:22:54', '93', '87', '采购', '1', 'Alice', '10', '无', null);
INSERT INTO `plan_progress` VALUES ('67', '2017-09-20 18:16:18', '104', '92', '采购', '1', 'Alice', '10', '无', null);

-- ----------------------------
-- Table structure for `problem`
-- ----------------------------
DROP TABLE IF EXISTS `problem`;
CREATE TABLE `problem` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `ROOM_NUM` varchar(255) DEFAULT NULL,
  `ROOM_STATE` varchar(255) DEFAULT NULL,
  `GUEST_NAME` varchar(255) DEFAULT NULL,
  `REFLECT_DATE` date DEFAULT NULL COMMENT '报修时间',
  `SOLVE_DATE` date DEFAULT NULL COMMENT '需要解决时间',
  `REFLECTER_ID` int(11) DEFAULT NULL COMMENT '申报人',
  `REFLECTER_NAME` varchar(255) DEFAULT NULL,
  `DESCRIPTION` varchar(255) DEFAULT NULL COMMENT '问题描述',
  `OUTSIDER_REASON` varchar(255) DEFAULT NULL,
  `OUTSIDER_COMMENT` varchar(255) DEFAULT NULL COMMENT '备注',
  `IS_LEMANAGE` int(11) DEFAULT NULL,
  `TYPE` varchar(255) DEFAULT NULL,
  `SUBTYPE` varchar(255) DEFAULT NULL,
  `LEVEL` varchar(255) DEFAULT NULL,
  `REPAIRER_REASON` varchar(255) DEFAULT NULL,
  `REPAIRER_COMMENT` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem
-- ----------------------------
INSERT INTO `problem` VALUES ('3', 'W33-2', '已入住', 'Ada', '2017-10-12', '2017-10-12', '2', 'test', 'xxxx', null, null, '1', '房屋问题', '地板损坏', '一级', null, 'ssss');
INSERT INTO `problem` VALUES ('4', 'W33-2', '已入住', 'Ada', '2017-10-12', '2017-10-12', '2', 'test', 'd', null, null, '1', '房屋问题', '地板损坏', '一级', null, 'd');
INSERT INTO `problem` VALUES ('5', 'W33-2', '已入住', 'Ada', '2017-10-12', '2017-10-12', '2', 'test', 'c', null, null, '1', '房屋问题', '地板损坏', '一级', null, 'ddd');
INSERT INTO `problem` VALUES ('6', 'W33-2', '已入住', 'Ada', '2017-10-12', '2017-10-12', '2', 'test', 'xxx', null, null, '1', '房屋问题', '地板损坏', '一级', null, 'ff');
INSERT INTO `problem` VALUES ('7', 'W33-2', '已入住', 'Ada', '2017-10-12', '2017-10-12', '2', 'test', 'xx', null, null, '1', '房屋问题', '地板损坏', '一级', null, 'xx');
INSERT INTO `problem` VALUES ('8', 'W33-2', '已入住', 'Ada', '2017-10-12', '2017-10-12', '2', 'test', 'xx', null, null, '1', '房屋问题', '地板损坏', '一级', null, 'xx');
INSERT INTO `problem` VALUES ('9', 'W33-2', '已入住', 'Ada', '2017-10-12', '2017-10-12', '2', 'test', '1', null, null, '1', '房屋问题', '地板损坏', '一级', null, '2');
INSERT INTO `problem` VALUES ('11', 'W33-2', '已入住', 'Ada', '2017-10-12', '2017-10-12', '2', 'test', '1', null, null, '1', '房屋问题', '地板损坏', '一级', null, '1');
INSERT INTO `problem` VALUES ('13', 'W17-3', '已入住', 'Ada', '2017-10-13', '2017-10-19', '2', 'test', 'aa11133333333', null, null, '1', '消耗品问题', '没有洗漱用具', '三级', null, '222');
INSERT INTO `problem` VALUES ('14', 'W17-3', '已入住', 'Ada', '2017-10-13', '2017-10-13', '2', 'test', 'xxxx', 'yyyy', 'zzzz', '0', '能源问题', '用电问题', '', null, '');
INSERT INTO `problem` VALUES ('15', 'W33-2', '已入住', 'Ada', '2017-10-13', '2017-10-21', '2', 'test', '11111133333', null, null, '1', '消耗品问题', '没有洗漱用具', '四级', null, '2222222244444');
INSERT INTO `problem` VALUES ('16', 'W33-2', '已入住', 'Ada', '2017-10-13', '2017-10-13', '2', 'test', '', null, null, '0', '房屋问题', '地板损坏', '一级', null, '');
INSERT INTO `problem` VALUES ('17', 'W33-2', '已入住', 'Ada', '2017-10-13', '2017-10-13', '2', 'test', '222', null, null, '1', '房屋问题', '地板损坏', '三级', null, 'sss');
INSERT INTO `problem` VALUES ('18', 'W33-3', '已入住', 'Ada', '2017-10-13', '2017-10-13', '2', 'test', '7878787878787878', null, null, '1', '消耗品问题', '没有洗漱用具', '三级', null, '89898989898989');
INSERT INTO `problem` VALUES ('19', 'W33-2', '已入住', 'Ada', '2017-10-13', '2017-10-22', '2', 'test', '111', null, null, '1', '房屋问题', '地板损坏', '一级', null, '22');
INSERT INTO `problem` VALUES ('20', 'W33-2', '已入住', 'Ada', '2017-10-13', '2017-10-22', '2', 'test', 'sdfsdf', null, null, '1', '房屋问题', '地板损坏', '四级', null, '11');
INSERT INTO `problem` VALUES ('21', 'W33-3', '已入住', 'Ada', '2017-10-13', '2017-10-13', '2', 'test', '1', null, null, '1', '房屋问题', '地板损坏', '一级', null, '2');
INSERT INTO `problem` VALUES ('23', 'W2-1', '已入住', 'Tom', '2017-12-19', '2017-12-19', '2', 'test', 'qwe', '', '', '0', null, null, null, null, null);

-- ----------------------------
-- Table structure for `problem_reply`
-- ----------------------------
DROP TABLE IF EXISTS `problem_reply`;
CREATE TABLE `problem_reply` (
  `ID` int(11) NOT NULL AUTO_INCREMENT,
  `PROBLEM_ID` int(11) DEFAULT NULL,
  `LAST_REPLAY_DATE` date DEFAULT NULL,
  `LAST_REPLAY_DESCRIPTION` varchar(255) DEFAULT NULL,
  `DEPARTMENT` varchar(100) DEFAULT NULL COMMENT '分配部门',
  `INFO_SOURCE` varchar(25) DEFAULT NULL COMMENT '信息来源',
  `FARE` double DEFAULT NULL,
  `PROBLEM_STATE` varchar(15) DEFAULT NULL COMMENT '问题状态：跟踪中 搁置处理 确认完成',
  `FARE_DETAIL` varchar(255) DEFAULT NULL COMMENT '费用明细',
  `FARE_PAY` varchar(25) DEFAULT NULL COMMENT 'LE承担 租客承担 SPC承担 其他承担',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of problem_reply
-- ----------------------------
INSERT INTO `problem_reply` VALUES ('1', '11', '2017-12-24', null, null, null, null, '搁置处理', null, null);
INSERT INTO `problem_reply` VALUES ('4', '23', '2017-12-24', 'were', null, '第一太平', '0', '跟踪中', '', '');

-- ----------------------------
-- Table structure for `repository`
-- ----------------------------
DROP TABLE IF EXISTS `repository`;
CREATE TABLE `repository` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `REPO_NUM` varchar(64) DEFAULT NULL,
  `ADDRESS` varchar(64) DEFAULT NULL,
  `AREA` double DEFAULT NULL,
  `MANAGER_ID` int(11) DEFAULT NULL,
  `MANAGER_NAME` varchar(64) DEFAULT NULL COMMENT '管理员',
  `STATE` tinyint(3) DEFAULT '0' COMMENT '0:空闲 1:占用',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `REPO_NUM` (`REPO_NUM`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of repository
-- ----------------------------
INSERT INTO `repository` VALUES ('1', 'R3-2', '惠新西街库房3-2', '100', '1', '张三', '1');
INSERT INTO `repository` VALUES ('2', 'R4-6', '崇文门库房4-6', '400', '2', '李四', '1');
INSERT INTO `repository` VALUES ('3', 'R7-8', '北邮库房7-8', '200', '1', '张三', '0');
INSERT INTO `repository` VALUES ('4', 'R8-8', '明光桥8-8', '200', '2', '李四', '0');
INSERT INTO `repository` VALUES ('5', 'R5-6', '蓟门桥5-6', '100', '3', '王五', '0');
INSERT INTO `repository` VALUES ('12', 'R1-1', '东直门1-1', '200', '4', '钱六', '0');
INSERT INTO `repository` VALUES ('13', 'R10-10', '北航10-10', '2000', '4', '钱六', '0');

-- ----------------------------
-- Table structure for `room`
-- ----------------------------
DROP TABLE IF EXISTS `room`;
CREATE TABLE `room` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUMBER` varchar(64) DEFAULT '',
  `TYPE` varchar(64) DEFAULT NULL,
  `AREA` double DEFAULT NULL,
  `RENT` int(11) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  `COMM` varchar(256) DEFAULT NULL,
  `OWNER_NAME` varchar(10) DEFAULT NULL,
  `RECEIPT_TIME` datetime DEFAULT NULL COMMENT '接收时间',
  `REFUND_TIME` datetime DEFAULT NULL COMMENT '退还时间',
  `REPLACE_ROOM` varchar(64) DEFAULT '',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ROOM_NUMBER` (`ROOM_NUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', 'W2-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('2', 'W2-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('3', 'W2-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('4', 'W3-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('5', 'W3-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('6', 'W3-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('7', 'W3-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('8', 'W4-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('9', 'W4-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('10', 'W4-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('11', 'W4-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('12', 'W5-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('13', 'W5-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('14', 'W5-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('15', 'W5-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('16', 'W6-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('17', 'W6-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('18', 'W6-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('19', 'W6-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('20', 'W7-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('21', 'W7-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('22', 'W7-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('23', 'W7-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('24', 'W8-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('25', 'W8-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('26', 'W8-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('27', 'W8-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('28', 'W9-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('29', 'W9-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('30', 'W9-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('31', 'W9-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('32', 'W10-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('33', 'W10-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('34', 'W10-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('35', 'W10-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('36', 'W11-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('37', 'W11-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('38', 'W11-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('39', 'W11-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('40', 'W12-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('41', 'W12-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('42', 'W12-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('43', 'W12-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('44', 'W13-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('45', 'W13-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('46', 'W13-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('47', 'W13-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('48', 'W14-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('49', 'W14-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('50', 'W14-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('51', 'W14-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('52', 'W15-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('53', 'W15-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('54', 'W15-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('55', 'W15-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('56', 'W16-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('57', 'W16-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('58', 'W16-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('59', 'W16-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('60', 'W17-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('61', 'W17-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('62', 'W17-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('63', 'W17-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('64', 'W18-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('65', 'W18-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('66', 'W18-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('67', 'W18-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('68', 'W19-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('69', 'W19-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('70', 'W19-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('71', 'W19-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('72', 'W20-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('73', 'W20-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('74', 'W20-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('75', 'W20-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('76', 'W21-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('77', 'W21-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('78', 'W21-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('79', 'W21-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('80', 'W22-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('81', 'W22-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('82', 'W22-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('83', 'W22-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('84', 'W23-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('85', 'W23-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('86', 'W23-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('87', 'W23-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('88', 'W24-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('89', 'W24-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('90', 'W24-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('91', 'W24-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('92', 'W25-1', '小业主', null, null, '1', '无', 'wewe', '2017-07-20 00:00:00', null, null);
INSERT INTO `room` VALUES ('93', 'W25-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('94', 'W25-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('95', 'W26-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('96', 'W26-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('97', 'W26-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('98', 'W27-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('99', 'W27-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('100', 'W27-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('101', 'W28-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('102', 'W28-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('103', 'W28-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('104', 'W29-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('105', 'W29-2', 'SPC', null, null, '1', '无', null, '2017-09-26 00:00:00', null, null);
INSERT INTO `room` VALUES ('106', 'W29-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('107', 'W30-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('108', 'W30-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('109', 'W30-3', 'LE', null, null, null, '无', null, '2017-07-04 00:00:00', '2017-07-04 00:00:00', null);
INSERT INTO `room` VALUES ('110', 'W31-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('111', 'W31-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('112', 'W31-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('113', 'W32-1', '小业主', null, null, '1', '无', null, '2017-07-04 00:00:00', null, null);
INSERT INTO `room` VALUES ('114', 'W32-2', 'SPC', null, null, '1', '无', null, '2017-07-04 00:00:00', null, null);
INSERT INTO `room` VALUES ('115', 'W32-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('116', 'W33-1', '小业主', null, null, '1', '无', '', '2017-07-04 00:00:00', null, null);
INSERT INTO `room` VALUES ('117', 'W33-2', '小业主', null, null, '1', '无', '', '2017-07-06 00:00:00', null, null);
INSERT INTO `room` VALUES ('118', 'W33-3', 'LE', null, null, '1', '无', null, '2017-07-04 00:00:00', null, null);
INSERT INTO `room` VALUES ('119', 'W34-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('120', 'W34-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('121', 'W34-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('122', 'W35-1', 'LE', null, null, '1', '无', null, '2017-07-10 00:00:00', null, null);
INSERT INTO `room` VALUES ('123', 'W35-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('124', 'E2-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('125', 'E2-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('126', 'E2-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('127', 'E2-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('128', 'E3-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('129', 'E3-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('130', 'E3-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('131', 'E3-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('132', 'E3-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('133', 'E4-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('134', 'E4-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('135', 'E4-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('136', 'E4-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('137', 'E4-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('138', 'E5-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('139', 'E5-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('140', 'E5-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('141', 'E5-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('142', 'E5-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('143', 'E6-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('144', 'E6-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('145', 'E6-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('146', 'E6-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('147', 'E6-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('148', 'E7-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('149', 'E7-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('150', 'E7-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('151', 'E7-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('152', 'E7-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('153', 'E8-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('154', 'E8-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('155', 'E8-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('156', 'E8-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('157', 'E8-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('158', 'E9-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('159', 'E9-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('160', 'E9-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('161', 'E9-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('162', 'E9-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('163', 'E10-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('164', 'E10-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('165', 'E10-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('166', 'E10-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('167', 'E10-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('168', 'E11-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('169', 'E11-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('170', 'E11-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('171', 'E11-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('172', 'E11-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('173', 'E12-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('174', 'E12-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('175', 'E12-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('176', 'E12-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('177', 'E12-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('178', 'E13-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('179', 'E13-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('180', 'E13-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('181', 'E13-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('182', 'E13-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('183', 'E14-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('184', 'E14-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('185', 'E14-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('186', 'E14-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('187', 'E14-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('188', 'E15-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('189', 'E15-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('190', 'E15-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('191', 'E15-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('192', 'E15-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('193', 'E16-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('194', 'E16-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('195', 'E16-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('196', 'E16-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('197', 'E16-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('198', 'E17-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('199', 'E17-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('200', 'E17-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('201', 'E17-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('202', 'E17-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('203', 'E18-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('204', 'E18-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('205', 'E18-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('206', 'E18-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('207', 'E18-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('208', 'E19-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('209', 'E19-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('210', 'E19-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('211', 'E19-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('212', 'E19-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('213', 'E20-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('214', 'E20-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('215', 'E20-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('216', 'E20-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('217', 'E20-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('218', 'E21-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('219', 'E21-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('220', 'E21-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('221', 'E21-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('222', 'E21-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('223', 'E22-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('224', 'E22-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('225', 'E22-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('226', 'E22-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('227', 'E22-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('228', 'E23-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('229', 'E23-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('230', 'E23-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('231', 'E23-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('232', 'E23-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('233', 'E24-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('234', 'E24-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('235', 'E24-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('236', 'E24-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('237', 'E24-6', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('238', 'E25-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('239', 'E25-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('240', 'E25-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('241', 'E25-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('242', 'E26-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('243', 'E26-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('244', 'E26-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('245', 'E26-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('246', 'E27-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('247', 'E27-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('248', 'E27-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('249', 'E27-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('250', 'E28-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('251', 'E28-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('252', 'E28-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('253', 'E28-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('254', 'E29-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('255', 'E29-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('256', 'E29-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('257', 'E29-5', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('258', 'E30-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('259', 'E30-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('260', 'E30-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('261', 'E31-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('262', 'E31-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('263', 'E31-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('264', 'E32-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('265', 'E32-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('266', 'E32-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('267', 'E33-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('268', 'E33-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('269', 'E33-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('270', 'E34-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('271', 'E34-2', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('272', 'E34-3', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('273', 'E35-1', null, null, null, null, null, null, null, null, '');
INSERT INTO `room` VALUES ('274', 'E35-2', null, null, null, null, null, null, null, null, '');

-- ----------------------------
-- Table structure for `room_item`
-- ----------------------------
DROP TABLE IF EXISTS `room_item`;
CREATE TABLE `room_item` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUM` varchar(64) DEFAULT NULL,
  `FAC_ID` int(11) DEFAULT NULL,
  `TAG` varchar(64) DEFAULT NULL,
  `ALLOCATE_TYPE` varchar(10) DEFAULT NULL COMMENT '分配、借用、-（新维修时生成的）',
  `STATE` varchar(11) DEFAULT NULL COMMENT '维修中0 使用中1',
  `BORROW_DATE` date DEFAULT NULL,
  `RETURN_DATE` date DEFAULT NULL,
  `MAINTAIN_DURATION` int(11) DEFAULT NULL COMMENT '维修时长（天）',
  `COMM` varchar(64) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROOM_ID` (`ROOM_NUM`),
  KEY `ITEM_ID` (`FAC_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=122 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_item
-- ----------------------------
INSERT INTO `room_item` VALUES ('95', 'W34-1', '78', '123', '分配', '正常', null, null, null, '无');
INSERT INTO `room_item` VALUES ('96', 'W2-3', '78', '456', '借用', '正常', '2017-06-02', '2017-06-24', null, '无');
INSERT INTO `room_item` VALUES ('97', 'W8-8', '78', '冰箱1', '分配', '正常', null, null, null, '无');
INSERT INTO `room_item` VALUES ('98', 'W3-4', '78', '海尔冰箱1', '借用', '正常', '2017-06-02', '2017-06-24', null, '无');
INSERT INTO `room_item` VALUES ('99', 'W8-8', '78', '冰箱1', '分配', '正常', null, null, null, '无');
INSERT INTO `room_item` VALUES ('100', 'W34-1', '89', '123', '分配', '正常', null, null, null, '无');
INSERT INTO `room_item` VALUES ('101', 'W33-3', '89', '456', '借用', '正常', '2017-06-02', '2017-06-02', null, '无');
INSERT INTO `room_item` VALUES ('102', 'W33-3', '89', '456', '借用', '正常', '2017-06-02', '2017-06-02', null, '无');
INSERT INTO `room_item` VALUES ('103', 'W33-3', '89', '456', '借用', '正常', '2017-06-02', '2017-06-02', null, '无');
INSERT INTO `room_item` VALUES ('104', 'W34-1', '89', '123', '分配', '正常', null, null, null, '无');
INSERT INTO `room_item` VALUES ('105', 'W34-1', '89', '555', '分配', '正常', null, null, null, '无');
INSERT INTO `room_item` VALUES ('106', 'W1-1', '89', '555', '分配', '正常', null, null, null, '无');
INSERT INTO `room_item` VALUES ('107', 'W34-1', '90', '123', '分配', '正常', null, null, null, '无');
INSERT INTO `room_item` VALUES ('108', 'W34-1', '90', '223', '借用', '正常', '2017-06-02', '2017-06-02', null, '无');
INSERT INTO `room_item` VALUES ('109', 'W34-1', '90', '5', '分配', '正常', null, null, null, '无');
INSERT INTO `room_item` VALUES ('110', 'W4-6', '90', '223', '借用', '维修中', '2017-06-02', '2017-06-02', '33', '无');
INSERT INTO `room_item` VALUES ('112', '-', '90', '-', '-', '维修中', null, null, '3', '无');
INSERT INTO `room_item` VALUES ('113', 'W34-1', '90', '123', '分配', '维修中', null, null, '3333', '无');
INSERT INTO `room_item` VALUES ('114', '-', '90', '-', '-', '维修中', null, null, '3', '无');
INSERT INTO `room_item` VALUES ('115', 'W34-1', '91', '123', '分配', '正常', null, null, null, '无');
INSERT INTO `room_item` VALUES ('116', 'W33-3', '91', '456', '分配', '维修中', null, null, '3', '无');
INSERT INTO `room_item` VALUES ('117', 'W3-1', '91', '1', '借用', '正常', '2017-06-02', '2017-06-02', null, '无');
INSERT INTO `room_item` VALUES ('119', '-', '91', '-', '-', '维修中', null, null, '2', '无');
INSERT INTO `room_item` VALUES ('120', 'W34-1', '78', '123', '借用', '维修中', '2017-06-02', '2017-06-02', '3', '无');
INSERT INTO `room_item` VALUES ('121', '-', '78', '-', '-', '维修中', null, null, '3', '无');

-- ----------------------------
-- Table structure for `room_meter`
-- ----------------------------
DROP TABLE IF EXISTS `room_meter`;
CREATE TABLE `room_meter` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_ID` int(11) DEFAULT NULL,
  `TYPE` varchar(11) DEFAULT NULL COMMENT 'water gas elec',
  `METER_NUMBER` varchar(64) DEFAULT NULL,
  `YEAR_INIT_VAL` double DEFAULT NULL,
  `LAST_MONTH_VAL` double DEFAULT NULL,
  `CUR_VAL` double DEFAULT NULL,
  `MONTH` int(10) DEFAULT NULL COMMENT '计费月份',
  `STEP` int(5) DEFAULT NULL COMMENT '阶梯计价',
  `MONEY` double DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `METER_NUMBER` (`METER_NUMBER`),
  KEY `ROOM_ID` (`ROOM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=1097 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_meter
-- ----------------------------
INSERT INTO `room_meter` VALUES ('1', '1', 'water', null, null, '49', '56', '9', '1', '4.4');
INSERT INTO `room_meter` VALUES ('2', '2', 'water', null, null, '23', '24', '11', '1', '9.600000000000001');
INSERT INTO `room_meter` VALUES ('3', '3', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('4', '4', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('5', '5', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('6', '6', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('7', '7', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('8', '8', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('9', '9', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('10', '10', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('11', '11', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('12', '12', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('13', '13', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('14', '14', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('15', '15', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('16', '16', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('17', '17', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('18', '18', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('19', '19', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('20', '20', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('21', '21', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('22', '22', 'water', null, null, null, '45', '11', '1', '18');
INSERT INTO `room_meter` VALUES ('23', '23', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('24', '24', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('25', '25', 'water', null, null, '2', '3', '11', '1', '1.2000000000000002');
INSERT INTO `room_meter` VALUES ('26', '26', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('27', '27', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('28', '28', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('29', '29', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('30', '30', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('31', '31', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('32', '32', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('33', '33', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('34', '34', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('35', '35', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('36', '36', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('37', '37', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('38', '38', 'water', null, null, null, '2', '11', '1', '0.8');
INSERT INTO `room_meter` VALUES ('39', '39', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('40', '40', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('41', '41', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('42', '42', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('43', '43', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('44', '44', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('45', '45', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('46', '46', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('47', '47', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('48', '48', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('49', '49', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('50', '50', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('51', '51', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('52', '52', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('53', '53', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('54', '54', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('55', '55', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('56', '56', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('57', '57', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('58', '58', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('59', '59', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('60', '60', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('61', '61', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('62', '62', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('63', '63', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('64', '64', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('65', '65', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('66', '66', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('67', '67', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('68', '68', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('69', '69', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('70', '70', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('71', '71', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('72', '72', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('73', '73', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('74', '74', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('75', '75', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('76', '76', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('77', '77', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('78', '78', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('79', '79', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('80', '80', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('81', '81', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('82', '82', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('83', '83', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('84', '84', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('85', '85', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('86', '86', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('87', '87', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('88', '88', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('89', '89', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('90', '90', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('91', '91', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('92', '92', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('93', '93', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('94', '94', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('95', '95', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('96', '96', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('97', '97', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('98', '98', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('99', '99', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('100', '100', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('101', '101', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('102', '102', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('103', '103', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('104', '104', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('105', '105', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('106', '106', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('107', '107', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('108', '108', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('109', '109', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('110', '110', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('111', '111', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('112', '112', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('113', '113', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('114', '114', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('115', '115', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('116', '116', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('117', '117', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('118', '118', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('119', '119', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('120', '120', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('121', '121', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('122', '122', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('123', '123', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('124', '124', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('125', '125', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('126', '126', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('127', '127', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('128', '128', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('129', '129', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('130', '130', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('131', '131', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('132', '132', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('133', '133', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('134', '134', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('135', '135', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('136', '136', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('137', '137', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('138', '138', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('139', '139', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('140', '140', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('141', '141', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('142', '142', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('143', '143', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('144', '144', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('145', '145', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('146', '146', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('147', '147', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('148', '148', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('149', '149', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('150', '150', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('151', '151', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('152', '152', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('153', '153', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('154', '154', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('155', '155', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('156', '156', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('157', '157', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('158', '158', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('159', '159', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('160', '160', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('161', '161', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('162', '162', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('163', '163', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('164', '164', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('165', '165', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('166', '166', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('167', '167', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('168', '168', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('169', '169', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('170', '170', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('171', '171', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('172', '172', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('173', '173', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('174', '174', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('175', '175', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('176', '176', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('177', '177', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('178', '178', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('179', '179', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('180', '180', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('181', '181', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('182', '182', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('183', '183', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('184', '184', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('185', '185', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('186', '186', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('187', '187', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('188', '188', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('189', '189', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('190', '190', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('191', '191', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('192', '192', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('193', '193', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('194', '194', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('195', '195', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('196', '196', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('197', '197', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('198', '198', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('199', '199', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('200', '200', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('201', '201', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('202', '202', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('203', '203', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('204', '204', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('205', '205', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('206', '206', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('207', '207', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('208', '208', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('209', '209', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('210', '210', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('211', '211', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('212', '212', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('213', '213', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('214', '214', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('215', '215', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('216', '216', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('217', '217', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('218', '218', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('219', '219', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('220', '220', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('221', '221', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('222', '222', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('223', '223', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('224', '224', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('225', '225', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('226', '226', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('227', '227', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('228', '228', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('229', '229', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('230', '230', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('231', '231', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('232', '232', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('233', '233', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('234', '234', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('235', '235', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('236', '236', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('237', '237', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('238', '238', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('239', '239', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('240', '240', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('241', '241', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('242', '242', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('243', '243', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('244', '244', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('245', '245', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('246', '246', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('247', '247', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('248', '248', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('249', '249', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('250', '250', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('251', '251', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('252', '252', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('253', '253', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('254', '254', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('255', '255', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('256', '256', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('257', '257', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('258', '258', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('259', '259', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('260', '260', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('261', '261', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('262', '262', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('263', '263', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('264', '264', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('265', '265', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('266', '266', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('267', '267', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('268', '268', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('269', '269', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('270', '270', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('271', '271', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('272', '272', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('273', '273', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('274', '274', 'water', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('275', '1', 'elec', null, null, '14', '14', '11', '1', '5.6000000000000005');
INSERT INTO `room_meter` VALUES ('276', '2', 'elec', null, null, '2', '3', '11', '1', '1.2000000000000002');
INSERT INTO `room_meter` VALUES ('277', '3', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('278', '4', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('279', '5', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('280', '6', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('281', '7', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('282', '8', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('283', '9', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('284', '10', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('285', '11', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('286', '12', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('287', '13', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('288', '14', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('289', '15', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('290', '16', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('291', '17', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('292', '18', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('293', '19', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('294', '20', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('295', '21', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('296', '22', 'elec', null, null, null, '10', '11', '1', '4');
INSERT INTO `room_meter` VALUES ('297', '23', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('298', '24', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('299', '25', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('300', '26', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('301', '27', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('302', '28', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('303', '29', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('304', '30', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('305', '31', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('306', '32', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('307', '33', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('308', '34', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('309', '35', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('310', '36', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('311', '37', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('312', '38', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('313', '39', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('314', '40', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('315', '41', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('316', '42', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('317', '43', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('318', '44', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('319', '45', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('320', '46', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('321', '47', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('322', '48', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('323', '49', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('324', '50', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('325', '51', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('326', '52', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('327', '53', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('328', '54', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('329', '55', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('330', '56', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('331', '57', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('332', '58', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('333', '59', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('334', '60', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('335', '61', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('336', '62', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('337', '63', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('338', '64', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('339', '65', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('340', '66', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('341', '67', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('342', '68', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('343', '69', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('344', '70', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('345', '71', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('346', '72', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('347', '73', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('348', '74', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('349', '75', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('350', '76', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('351', '77', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('352', '78', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('353', '79', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('354', '80', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('355', '81', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('356', '82', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('357', '83', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('358', '84', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('359', '85', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('360', '86', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('361', '87', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('362', '88', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('363', '89', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('364', '90', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('365', '91', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('366', '92', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('367', '93', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('368', '94', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('369', '95', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('370', '96', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('371', '97', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('372', '98', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('373', '99', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('374', '100', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('375', '101', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('376', '102', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('377', '103', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('378', '104', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('379', '105', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('380', '106', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('381', '107', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('382', '108', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('383', '109', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('384', '110', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('385', '111', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('386', '112', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('387', '113', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('388', '114', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('389', '115', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('390', '116', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('391', '117', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('392', '118', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('393', '119', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('394', '120', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('395', '121', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('396', '122', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('397', '123', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('398', '124', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('399', '125', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('400', '126', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('401', '127', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('402', '128', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('403', '129', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('404', '130', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('405', '131', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('406', '132', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('407', '133', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('408', '134', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('409', '135', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('410', '136', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('411', '137', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('412', '138', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('413', '139', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('414', '140', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('415', '141', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('416', '142', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('417', '143', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('418', '144', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('419', '145', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('420', '146', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('421', '147', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('422', '148', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('423', '149', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('424', '150', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('425', '151', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('426', '152', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('427', '153', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('428', '154', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('429', '155', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('430', '156', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('431', '157', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('432', '158', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('433', '159', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('434', '160', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('435', '161', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('436', '162', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('437', '163', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('438', '164', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('439', '165', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('440', '166', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('441', '167', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('442', '168', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('443', '169', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('444', '170', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('445', '171', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('446', '172', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('447', '173', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('448', '174', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('449', '175', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('450', '176', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('451', '177', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('452', '178', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('453', '179', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('454', '180', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('455', '181', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('456', '182', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('457', '183', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('458', '184', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('459', '185', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('460', '186', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('461', '187', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('462', '188', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('463', '189', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('464', '190', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('465', '191', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('466', '192', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('467', '193', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('468', '194', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('469', '195', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('470', '196', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('471', '197', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('472', '198', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('473', '199', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('474', '200', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('475', '201', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('476', '202', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('477', '203', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('478', '204', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('479', '205', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('480', '206', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('481', '207', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('482', '208', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('483', '209', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('484', '210', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('485', '211', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('486', '212', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('487', '213', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('488', '214', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('489', '215', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('490', '216', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('491', '217', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('492', '218', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('493', '219', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('494', '220', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('495', '221', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('496', '222', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('497', '223', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('498', '224', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('499', '225', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('500', '226', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('501', '227', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('502', '228', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('503', '229', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('504', '230', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('505', '231', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('506', '232', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('507', '233', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('508', '234', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('509', '235', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('510', '236', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('511', '237', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('512', '238', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('513', '239', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('514', '240', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('515', '241', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('516', '242', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('517', '243', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('518', '244', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('519', '245', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('520', '246', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('521', '247', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('522', '248', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('523', '249', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('524', '250', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('525', '251', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('526', '252', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('527', '253', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('528', '254', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('529', '255', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('530', '256', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('531', '257', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('532', '258', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('533', '259', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('534', '260', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('535', '261', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('536', '262', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('537', '263', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('538', '264', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('539', '265', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('540', '266', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('541', '267', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('542', '268', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('543', '269', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('544', '270', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('545', '271', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('546', '272', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('547', '273', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('548', '274', 'elec', null, null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('549', '1', 'gas', '1', null, '4', '5', '11', '1', '1.5');
INSERT INTO `room_meter` VALUES ('550', '2', 'gas', '2', null, null, '2', '11', '1', '0.6');
INSERT INTO `room_meter` VALUES ('551', '3', 'gas', '3', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('552', '4', 'gas', '4', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('553', '5', 'gas', '5', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('554', '6', 'gas', '6', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('555', '7', 'gas', '7', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('556', '8', 'gas', '8', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('557', '9', 'gas', '9', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('558', '10', 'gas', '10', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('559', '11', 'gas', '11', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('560', '12', 'gas', '12', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('561', '13', 'gas', '13', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('562', '14', 'gas', '14', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('563', '15', 'gas', '15', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('564', '16', 'gas', '16', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('565', '17', 'gas', '17', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('566', '18', 'gas', '18', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('567', '19', 'gas', '19', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('568', '20', 'gas', '20', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('569', '21', 'gas', '21', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('570', '22', 'gas', '22', null, null, '2', '11', '1', '0.6');
INSERT INTO `room_meter` VALUES ('571', '23', 'gas', '23', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('572', '24', 'gas', '24', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('573', '25', 'gas', '25', null, null, '2', '11', '1', '0.6');
INSERT INTO `room_meter` VALUES ('574', '26', 'gas', '26', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('575', '27', 'gas', '27', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('576', '28', 'gas', '28', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('577', '29', 'gas', '29', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('578', '30', 'gas', '30', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('579', '31', 'gas', '31', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('580', '32', 'gas', '32', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('581', '33', 'gas', '33', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('582', '34', 'gas', '34', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('583', '35', 'gas', '35', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('584', '36', 'gas', '36', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('585', '37', 'gas', '37', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('586', '38', 'gas', '38', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('587', '39', 'gas', '39', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('588', '40', 'gas', '40', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('589', '41', 'gas', '41', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('590', '42', 'gas', '42', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('591', '43', 'gas', '43', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('592', '44', 'gas', '44', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('593', '45', 'gas', '45', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('594', '46', 'gas', '46', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('595', '47', 'gas', '47', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('596', '48', 'gas', '48', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('597', '49', 'gas', '49', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('598', '50', 'gas', '50', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('599', '51', 'gas', '51', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('600', '52', 'gas', '52', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('601', '53', 'gas', '53', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('602', '54', 'gas', '54', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('603', '55', 'gas', '55', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('604', '56', 'gas', '56', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('605', '57', 'gas', '57', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('606', '58', 'gas', '58', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('607', '59', 'gas', '59', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('608', '60', 'gas', '60', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('609', '61', 'gas', '61', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('610', '62', 'gas', '62', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('611', '63', 'gas', '63', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('612', '64', 'gas', '64', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('613', '65', 'gas', '65', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('614', '66', 'gas', '66', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('615', '67', 'gas', '67', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('616', '68', 'gas', '68', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('617', '69', 'gas', '69', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('618', '70', 'gas', '70', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('619', '71', 'gas', '71', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('620', '72', 'gas', '72', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('621', '73', 'gas', '73', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('622', '74', 'gas', '74', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('623', '75', 'gas', '75', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('624', '76', 'gas', '76', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('625', '77', 'gas', '77', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('626', '78', 'gas', '78', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('627', '79', 'gas', '79', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('628', '80', 'gas', '80', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('629', '81', 'gas', '81', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('630', '82', 'gas', '82', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('631', '83', 'gas', '83', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('632', '84', 'gas', '84', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('633', '85', 'gas', '85', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('634', '86', 'gas', '86', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('635', '87', 'gas', '87', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('636', '88', 'gas', '88', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('637', '89', 'gas', '89', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('638', '90', 'gas', '90', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('639', '91', 'gas', '91', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('640', '92', 'gas', '92', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('641', '93', 'gas', '93', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('642', '94', 'gas', '94', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('643', '95', 'gas', '95', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('644', '96', 'gas', '96', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('645', '97', 'gas', '97', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('646', '98', 'gas', '98', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('647', '99', 'gas', '99', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('648', '100', 'gas', '100', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('649', '101', 'gas', '101', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('650', '102', 'gas', '102', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('651', '103', 'gas', '103', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('652', '104', 'gas', '104', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('653', '105', 'gas', '105', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('654', '106', 'gas', '106', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('655', '107', 'gas', '107', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('656', '108', 'gas', '108', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('657', '109', 'gas', '109', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('658', '110', 'gas', '110', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('659', '111', 'gas', '111', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('660', '112', 'gas', '112', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('661', '113', 'gas', '113', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('662', '114', 'gas', '114', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('663', '115', 'gas', '115', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('664', '116', 'gas', '116', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('665', '117', 'gas', '117', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('666', '118', 'gas', '118', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('667', '119', 'gas', '119', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('668', '120', 'gas', '120', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('669', '121', 'gas', '121', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('670', '122', 'gas', '122', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('671', '123', 'gas', '123', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('672', '124', 'gas', '124', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('673', '125', 'gas', '125', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('674', '126', 'gas', '126', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('675', '127', 'gas', '127', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('676', '128', 'gas', '128', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('677', '129', 'gas', '129', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('678', '130', 'gas', '130', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('679', '131', 'gas', '131', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('680', '132', 'gas', '132', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('681', '133', 'gas', '133', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('682', '134', 'gas', '134', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('683', '135', 'gas', '135', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('684', '136', 'gas', '136', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('685', '137', 'gas', '137', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('686', '138', 'gas', '138', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('687', '139', 'gas', '139', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('688', '140', 'gas', '140', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('689', '141', 'gas', '141', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('690', '142', 'gas', '142', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('691', '143', 'gas', '143', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('692', '144', 'gas', '144', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('693', '145', 'gas', '145', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('694', '146', 'gas', '146', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('695', '147', 'gas', '147', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('696', '148', 'gas', '148', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('697', '149', 'gas', '149', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('698', '150', 'gas', '150', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('699', '151', 'gas', '151', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('700', '152', 'gas', '152', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('701', '153', 'gas', '153', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('702', '154', 'gas', '154', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('703', '155', 'gas', '155', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('704', '156', 'gas', '156', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('705', '157', 'gas', '157', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('706', '158', 'gas', '158', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('707', '159', 'gas', '159', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('708', '160', 'gas', '160', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('709', '161', 'gas', '161', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('710', '162', 'gas', '162', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('711', '163', 'gas', '163', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('712', '164', 'gas', '164', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('713', '165', 'gas', '165', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('714', '166', 'gas', '166', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('715', '167', 'gas', '167', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('716', '168', 'gas', '168', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('717', '169', 'gas', '169', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('718', '170', 'gas', '170', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('719', '171', 'gas', '171', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('720', '172', 'gas', '172', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('721', '173', 'gas', '173', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('722', '174', 'gas', '174', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('723', '175', 'gas', '175', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('724', '176', 'gas', '176', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('725', '177', 'gas', '177', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('726', '178', 'gas', '178', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('727', '179', 'gas', '179', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('728', '180', 'gas', '180', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('729', '181', 'gas', '181', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('730', '182', 'gas', '182', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('731', '183', 'gas', '183', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('732', '184', 'gas', '184', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('733', '185', 'gas', '185', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('734', '186', 'gas', '186', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('735', '187', 'gas', '187', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('736', '188', 'gas', '188', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('737', '189', 'gas', '189', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('738', '190', 'gas', '190', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('739', '191', 'gas', '191', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('740', '192', 'gas', '192', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('741', '193', 'gas', '193', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('742', '194', 'gas', '194', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('743', '195', 'gas', '195', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('744', '196', 'gas', '196', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('745', '197', 'gas', '197', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('746', '198', 'gas', '198', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('747', '199', 'gas', '199', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('748', '200', 'gas', '200', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('749', '201', 'gas', '201', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('750', '202', 'gas', '202', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('751', '203', 'gas', '203', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('752', '204', 'gas', '204', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('753', '205', 'gas', '205', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('754', '206', 'gas', '206', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('755', '207', 'gas', '207', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('756', '208', 'gas', '208', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('757', '209', 'gas', '209', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('758', '210', 'gas', '210', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('759', '211', 'gas', '211', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('760', '212', 'gas', '212', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('761', '213', 'gas', '213', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('762', '214', 'gas', '214', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('763', '215', 'gas', '215', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('764', '216', 'gas', '216', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('765', '217', 'gas', '217', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('766', '218', 'gas', '218', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('767', '219', 'gas', '219', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('768', '220', 'gas', '220', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('769', '221', 'gas', '221', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('770', '222', 'gas', '222', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('771', '223', 'gas', '223', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('772', '224', 'gas', '224', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('773', '225', 'gas', '225', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('774', '226', 'gas', '226', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('775', '227', 'gas', '227', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('776', '228', 'gas', '228', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('777', '229', 'gas', '229', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('778', '230', 'gas', '230', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('779', '231', 'gas', '231', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('780', '232', 'gas', '232', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('781', '233', 'gas', '233', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('782', '234', 'gas', '234', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('783', '235', 'gas', '235', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('784', '236', 'gas', '236', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('785', '237', 'gas', '237', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('786', '238', 'gas', '238', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('787', '239', 'gas', '239', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('788', '240', 'gas', '240', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('789', '241', 'gas', '241', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('790', '242', 'gas', '242', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('791', '243', 'gas', '243', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('792', '244', 'gas', '244', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('793', '245', 'gas', '245', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('794', '246', 'gas', '246', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('795', '247', 'gas', '247', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('796', '248', 'gas', '248', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('797', '249', 'gas', '249', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('798', '250', 'gas', '250', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('799', '251', 'gas', '251', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('800', '252', 'gas', '252', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('801', '253', 'gas', '253', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('802', '254', 'gas', '254', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('803', '255', 'gas', '255', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('804', '256', 'gas', '256', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('805', '257', 'gas', '257', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('806', '258', 'gas', '258', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('807', '259', 'gas', '259', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('808', '260', 'gas', '260', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('809', '261', 'gas', '261', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('810', '262', 'gas', '262', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('811', '263', 'gas', '263', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('812', '264', 'gas', '264', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('813', '265', 'gas', '265', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('814', '266', 'gas', '266', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('815', '267', 'gas', '267', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('816', '268', 'gas', '268', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('817', '269', 'gas', '269', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('818', '270', 'gas', '270', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('819', '271', 'gas', '271', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('820', '272', 'gas', '272', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('821', '273', 'gas', '273', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('822', '274', 'gas', '274', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('823', '1', 'gas', '275', null, null, '2', '11', '1', '0.6');
INSERT INTO `room_meter` VALUES ('824', '2', 'gas', '276', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('825', '3', 'gas', '277', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('826', '4', 'gas', '278', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('827', '5', 'gas', '279', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('828', '6', 'gas', '280', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('829', '7', 'gas', '281', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('830', '8', 'gas', '282', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('831', '9', 'gas', '283', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('832', '10', 'gas', '284', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('833', '11', 'gas', '285', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('834', '12', 'gas', '286', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('835', '13', 'gas', '287', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('836', '14', 'gas', '288', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('837', '15', 'gas', '289', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('838', '16', 'gas', '290', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('839', '17', 'gas', '291', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('840', '18', 'gas', '292', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('841', '19', 'gas', '293', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('842', '20', 'gas', '294', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('843', '21', 'gas', '295', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('844', '22', 'gas', '296', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('845', '23', 'gas', '297', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('846', '24', 'gas', '298', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('847', '25', 'gas', '299', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('848', '26', 'gas', '300', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('849', '27', 'gas', '301', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('850', '28', 'gas', '302', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('851', '29', 'gas', '303', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('852', '30', 'gas', '304', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('853', '31', 'gas', '305', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('854', '32', 'gas', '306', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('855', '33', 'gas', '307', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('856', '34', 'gas', '308', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('857', '35', 'gas', '309', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('858', '36', 'gas', '310', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('859', '37', 'gas', '311', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('860', '38', 'gas', '312', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('861', '39', 'gas', '313', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('862', '40', 'gas', '314', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('863', '41', 'gas', '315', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('864', '42', 'gas', '316', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('865', '43', 'gas', '317', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('866', '44', 'gas', '318', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('867', '45', 'gas', '319', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('868', '46', 'gas', '320', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('869', '47', 'gas', '321', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('870', '48', 'gas', '322', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('871', '49', 'gas', '323', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('872', '50', 'gas', '324', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('873', '51', 'gas', '325', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('874', '52', 'gas', '326', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('875', '53', 'gas', '327', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('876', '54', 'gas', '328', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('877', '55', 'gas', '329', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('878', '56', 'gas', '330', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('879', '57', 'gas', '331', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('880', '58', 'gas', '332', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('881', '59', 'gas', '333', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('882', '60', 'gas', '334', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('883', '61', 'gas', '335', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('884', '62', 'gas', '336', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('885', '63', 'gas', '337', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('886', '64', 'gas', '338', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('887', '65', 'gas', '339', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('888', '66', 'gas', '340', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('889', '67', 'gas', '341', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('890', '68', 'gas', '342', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('891', '69', 'gas', '343', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('892', '70', 'gas', '344', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('893', '71', 'gas', '345', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('894', '72', 'gas', '346', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('895', '73', 'gas', '347', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('896', '74', 'gas', '348', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('897', '75', 'gas', '349', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('898', '76', 'gas', '350', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('899', '77', 'gas', '351', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('900', '78', 'gas', '352', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('901', '79', 'gas', '353', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('902', '80', 'gas', '354', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('903', '81', 'gas', '355', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('904', '82', 'gas', '356', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('905', '83', 'gas', '357', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('906', '84', 'gas', '358', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('907', '85', 'gas', '359', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('908', '86', 'gas', '360', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('909', '87', 'gas', '361', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('910', '88', 'gas', '362', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('911', '89', 'gas', '363', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('912', '90', 'gas', '364', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('913', '91', 'gas', '365', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('914', '92', 'gas', '366', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('915', '93', 'gas', '367', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('916', '94', 'gas', '368', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('917', '95', 'gas', '369', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('918', '96', 'gas', '370', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('919', '97', 'gas', '371', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('920', '98', 'gas', '372', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('921', '99', 'gas', '373', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('922', '100', 'gas', '374', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('923', '101', 'gas', '375', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('924', '102', 'gas', '376', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('925', '103', 'gas', '377', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('926', '104', 'gas', '378', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('927', '105', 'gas', '379', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('928', '106', 'gas', '380', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('929', '107', 'gas', '381', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('930', '108', 'gas', '382', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('931', '109', 'gas', '383', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('932', '110', 'gas', '384', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('933', '111', 'gas', '385', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('934', '112', 'gas', '386', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('935', '113', 'gas', '387', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('936', '114', 'gas', '388', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('937', '115', 'gas', '389', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('938', '116', 'gas', '390', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('939', '117', 'gas', '391', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('940', '118', 'gas', '392', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('941', '119', 'gas', '393', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('942', '120', 'gas', '394', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('943', '121', 'gas', '395', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('944', '122', 'gas', '396', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('945', '123', 'gas', '397', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('946', '124', 'gas', '398', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('947', '125', 'gas', '399', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('948', '126', 'gas', '400', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('949', '127', 'gas', '401', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('950', '128', 'gas', '402', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('951', '129', 'gas', '403', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('952', '130', 'gas', '404', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('953', '131', 'gas', '405', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('954', '132', 'gas', '406', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('955', '133', 'gas', '407', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('956', '134', 'gas', '408', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('957', '135', 'gas', '409', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('958', '136', 'gas', '410', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('959', '137', 'gas', '411', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('960', '138', 'gas', '412', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('961', '139', 'gas', '413', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('962', '140', 'gas', '414', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('963', '141', 'gas', '415', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('964', '142', 'gas', '416', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('965', '143', 'gas', '417', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('966', '144', 'gas', '418', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('967', '145', 'gas', '419', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('968', '146', 'gas', '420', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('969', '147', 'gas', '421', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('970', '148', 'gas', '422', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('971', '149', 'gas', '423', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('972', '150', 'gas', '424', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('973', '151', 'gas', '425', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('974', '152', 'gas', '426', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('975', '153', 'gas', '427', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('976', '154', 'gas', '428', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('977', '155', 'gas', '429', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('978', '156', 'gas', '430', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('979', '157', 'gas', '431', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('980', '158', 'gas', '432', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('981', '159', 'gas', '433', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('982', '160', 'gas', '434', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('983', '161', 'gas', '435', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('984', '162', 'gas', '436', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('985', '163', 'gas', '437', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('986', '164', 'gas', '438', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('987', '165', 'gas', '439', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('988', '166', 'gas', '440', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('989', '167', 'gas', '441', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('990', '168', 'gas', '442', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('991', '169', 'gas', '443', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('992', '170', 'gas', '444', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('993', '171', 'gas', '445', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('994', '172', 'gas', '446', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('995', '173', 'gas', '447', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('996', '174', 'gas', '448', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('997', '175', 'gas', '449', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('998', '176', 'gas', '450', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('999', '177', 'gas', '451', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1000', '178', 'gas', '452', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1001', '179', 'gas', '453', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1002', '180', 'gas', '454', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1003', '181', 'gas', '455', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1004', '182', 'gas', '456', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1005', '183', 'gas', '457', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1006', '184', 'gas', '458', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1007', '185', 'gas', '459', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1008', '186', 'gas', '460', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1009', '187', 'gas', '461', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1010', '188', 'gas', '462', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1011', '189', 'gas', '463', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1012', '190', 'gas', '464', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1013', '191', 'gas', '465', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1014', '192', 'gas', '466', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1015', '193', 'gas', '467', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1016', '194', 'gas', '468', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1017', '195', 'gas', '469', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1018', '196', 'gas', '470', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1019', '197', 'gas', '471', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1020', '198', 'gas', '472', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1021', '199', 'gas', '473', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1022', '200', 'gas', '474', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1023', '201', 'gas', '475', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1024', '202', 'gas', '476', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1025', '203', 'gas', '477', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1026', '204', 'gas', '478', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1027', '205', 'gas', '479', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1028', '206', 'gas', '480', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1029', '207', 'gas', '481', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1030', '208', 'gas', '482', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1031', '209', 'gas', '483', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1032', '210', 'gas', '484', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1033', '211', 'gas', '485', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1034', '212', 'gas', '486', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1035', '213', 'gas', '487', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1036', '214', 'gas', '488', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1037', '215', 'gas', '489', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1038', '216', 'gas', '490', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1039', '217', 'gas', '491', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1040', '218', 'gas', '492', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1041', '219', 'gas', '493', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1042', '220', 'gas', '494', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1043', '221', 'gas', '495', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1044', '222', 'gas', '496', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1045', '223', 'gas', '497', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1046', '224', 'gas', '498', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1047', '225', 'gas', '499', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1048', '226', 'gas', '500', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1049', '227', 'gas', '501', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1050', '228', 'gas', '502', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1051', '229', 'gas', '503', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1052', '230', 'gas', '504', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1053', '231', 'gas', '505', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1054', '232', 'gas', '506', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1055', '233', 'gas', '507', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1056', '234', 'gas', '508', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1057', '235', 'gas', '509', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1058', '236', 'gas', '510', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1059', '237', 'gas', '511', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1060', '238', 'gas', '512', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1061', '239', 'gas', '513', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1062', '240', 'gas', '514', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1063', '241', 'gas', '515', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1064', '242', 'gas', '516', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1065', '243', 'gas', '517', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1066', '244', 'gas', '518', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1067', '245', 'gas', '519', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1068', '246', 'gas', '520', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1069', '247', 'gas', '521', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1070', '248', 'gas', '522', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1071', '249', 'gas', '523', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1072', '250', 'gas', '524', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1073', '251', 'gas', '525', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1074', '252', 'gas', '526', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1075', '253', 'gas', '527', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1076', '254', 'gas', '528', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1077', '255', 'gas', '529', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1078', '256', 'gas', '530', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1079', '257', 'gas', '531', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1080', '258', 'gas', '532', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1081', '259', 'gas', '533', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1082', '260', 'gas', '534', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1083', '261', 'gas', '535', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1084', '262', 'gas', '536', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1085', '263', 'gas', '537', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1086', '264', 'gas', '538', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1087', '265', 'gas', '539', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1088', '266', 'gas', '540', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1089', '267', 'gas', '541', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1090', '268', 'gas', '542', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1091', '269', 'gas', '543', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1092', '270', 'gas', '544', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1093', '271', 'gas', '545', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1094', '272', 'gas', '546', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1095', '273', 'gas', '547', null, null, null, null, null, null);
INSERT INTO `room_meter` VALUES ('1096', '274', 'gas', '548', null, null, null, null, null, null);

-- ----------------------------
-- Table structure for `room_pic`
-- ----------------------------
DROP TABLE IF EXISTS `room_pic`;
CREATE TABLE `room_pic` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_ID` int(11) DEFAULT NULL,
  `TYPE` int(10) unsigned DEFAULT NULL,
  `CTIME` date DEFAULT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `TAG` varchar(64) DEFAULT NULL,
  `PATH` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROOM_ID` (`ROOM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_pic
-- ----------------------------
INSERT INTO `room_pic` VALUES ('2', '116', '1', null, '1', '1', '/resources/room_pic/1.jpg');
INSERT INTO `room_pic` VALUES ('3', '117', '1', null, '1', '1', '/resources/room_pic/DSC_0035.JPG');
INSERT INTO `room_pic` VALUES ('4', '1', '1', null, '1', '1', '/resources/room_pic/IMG_1080.JPG');
INSERT INTO `room_pic` VALUES ('5', '1', '1', null, '1', '1', '/resources/room_pic/IMG_1042.JPG');
INSERT INTO `room_pic` VALUES ('6', '1', '1', null, '1', '1', '/resources/room_pic/无标题.png');
INSERT INTO `room_pic` VALUES ('7', '1', '1', null, '1', '1', '/resources/room_pic/身份证-反面.jpg');
INSERT INTO `room_pic` VALUES ('8', '122', '1', null, '1', '1', '/resources/room_pic/毕业证.jpg');

-- ----------------------------
-- Table structure for `room_state`
-- ----------------------------
DROP TABLE IF EXISTS `room_state`;
CREATE TABLE `room_state` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUMBER` varchar(64) NOT NULL,
  `CUS_ID` int(11) DEFAULT NULL,
  `CUS_NAME` varchar(64) DEFAULT NULL,
  `STATE` int(11) DEFAULT '0' COMMENT '0表示无人入住 1表示已有人入住 2房间非管理 3 其他使用',
  `ROOM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ROOM_NUMBER` (`ROOM_NUMBER`),
  UNIQUE KEY `ROOM_ID` (`ROOM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_state
-- ----------------------------
INSERT INTO `room_state` VALUES ('1', 'W2-1', '3', 'Tom', '1', '1');
INSERT INTO `room_state` VALUES ('2', 'W2-2', '124', 'Ada', '1', '2');
INSERT INTO `room_state` VALUES ('3', 'W2-3', null, null, '0', '3');
INSERT INTO `room_state` VALUES ('4', 'W3-1', null, null, '0', '4');
INSERT INTO `room_state` VALUES ('5', 'W3-2', null, null, '0', '5');
INSERT INTO `room_state` VALUES ('6', 'W3-3', null, null, '0', '6');
INSERT INTO `room_state` VALUES ('7', 'W3-5', null, null, '0', '7');
INSERT INTO `room_state` VALUES ('8', 'W4-1', null, null, '0', '8');
INSERT INTO `room_state` VALUES ('9', 'W4-2', null, null, '0', '9');
INSERT INTO `room_state` VALUES ('10', 'W4-3', null, null, '0', '10');
INSERT INTO `room_state` VALUES ('11', 'W4-5', null, null, '0', '11');
INSERT INTO `room_state` VALUES ('12', 'W5-1', null, null, '0', '12');
INSERT INTO `room_state` VALUES ('13', 'W5-2', null, null, '0', '13');
INSERT INTO `room_state` VALUES ('14', 'W5-3', null, null, '0', '14');
INSERT INTO `room_state` VALUES ('15', 'W5-5', null, null, '0', '15');
INSERT INTO `room_state` VALUES ('16', 'W6-1', null, null, '0', '16');
INSERT INTO `room_state` VALUES ('17', 'W6-2', null, null, '0', '17');
INSERT INTO `room_state` VALUES ('18', 'W6-3', null, null, '0', '18');
INSERT INTO `room_state` VALUES ('19', 'W6-5', null, null, '0', '19');
INSERT INTO `room_state` VALUES ('20', 'W7-1', null, null, '0', '20');
INSERT INTO `room_state` VALUES ('21', 'W7-2', null, null, '0', '21');
INSERT INTO `room_state` VALUES ('22', 'W7-3', '113', 'Ada', '1', '22');
INSERT INTO `room_state` VALUES ('23', 'W7-5', null, null, '0', '23');
INSERT INTO `room_state` VALUES ('24', 'W8-1', null, null, '0', '24');
INSERT INTO `room_state` VALUES ('25', 'W8-2', '114', 'Ada', '1', '25');
INSERT INTO `room_state` VALUES ('26', 'W8-3', null, null, '0', '26');
INSERT INTO `room_state` VALUES ('27', 'W8-5', null, null, '0', '27');
INSERT INTO `room_state` VALUES ('28', 'W9-1', null, null, '0', '28');
INSERT INTO `room_state` VALUES ('29', 'W9-2', null, null, '0', '29');
INSERT INTO `room_state` VALUES ('30', 'W9-3', null, null, '0', '30');
INSERT INTO `room_state` VALUES ('31', 'W9-5', null, null, '0', '31');
INSERT INTO `room_state` VALUES ('32', 'W10-1', null, null, '0', '32');
INSERT INTO `room_state` VALUES ('33', 'W10-2', null, null, '0', '33');
INSERT INTO `room_state` VALUES ('34', 'W10-3', null, null, '0', '34');
INSERT INTO `room_state` VALUES ('35', 'W10-5', null, null, '0', '35');
INSERT INTO `room_state` VALUES ('36', 'W11-1', null, null, '0', '36');
INSERT INTO `room_state` VALUES ('37', 'W11-2', null, null, '0', '37');
INSERT INTO `room_state` VALUES ('38', 'W11-3', '112', 'Ada', '1', '38');
INSERT INTO `room_state` VALUES ('39', 'W11-5', null, null, '0', '39');
INSERT INTO `room_state` VALUES ('40', 'W12-1', null, null, '0', '40');
INSERT INTO `room_state` VALUES ('41', 'W12-2', null, null, '0', '41');
INSERT INTO `room_state` VALUES ('42', 'W12-3', '115', 'Ada', '1', '42');
INSERT INTO `room_state` VALUES ('43', 'W12-5', null, null, '0', '43');
INSERT INTO `room_state` VALUES ('44', 'W13-1', null, null, '0', '44');
INSERT INTO `room_state` VALUES ('45', 'W13-2', null, null, '0', '45');
INSERT INTO `room_state` VALUES ('46', 'W13-3', null, null, '0', '46');
INSERT INTO `room_state` VALUES ('47', 'W13-5', null, null, '0', '47');
INSERT INTO `room_state` VALUES ('48', 'W14-1', null, null, '0', '48');
INSERT INTO `room_state` VALUES ('49', 'W14-2', '118', 'Ada', '1', '49');
INSERT INTO `room_state` VALUES ('50', 'W14-3', null, null, '0', '50');
INSERT INTO `room_state` VALUES ('51', 'W14-5', null, null, '0', '51');
INSERT INTO `room_state` VALUES ('52', 'W15-1', null, null, '0', '52');
INSERT INTO `room_state` VALUES ('53', 'W15-2', '119', 'Ada', '1', '53');
INSERT INTO `room_state` VALUES ('54', 'W15-3', null, null, '0', '54');
INSERT INTO `room_state` VALUES ('55', 'W15-5', null, null, '0', '55');
INSERT INTO `room_state` VALUES ('56', 'W16-1', null, null, '0', '56');
INSERT INTO `room_state` VALUES ('57', 'W16-2', '117', 'Ada', '1', '57');
INSERT INTO `room_state` VALUES ('58', 'W16-3', '116', 'Ada', '1', '58');
INSERT INTO `room_state` VALUES ('59', 'W16-5', null, null, '0', '59');
INSERT INTO `room_state` VALUES ('60', 'W17-1', null, null, '0', '60');
INSERT INTO `room_state` VALUES ('61', 'W17-2', null, null, '0', '61');
INSERT INTO `room_state` VALUES ('62', 'W17-3', null, null, '0', '62');
INSERT INTO `room_state` VALUES ('63', 'W17-5', null, null, '0', '63');
INSERT INTO `room_state` VALUES ('64', 'W18-1', null, null, '0', '64');
INSERT INTO `room_state` VALUES ('65', 'W18-2', null, null, '0', '65');
INSERT INTO `room_state` VALUES ('66', 'W18-3', '111', 'Ada', '1', '66');
INSERT INTO `room_state` VALUES ('67', 'W18-5', null, null, '0', '67');
INSERT INTO `room_state` VALUES ('68', 'W19-1', '120', 'Ada', '1', '68');
INSERT INTO `room_state` VALUES ('69', 'W19-2', null, null, '0', '69');
INSERT INTO `room_state` VALUES ('70', 'W19-3', null, null, '0', '70');
INSERT INTO `room_state` VALUES ('71', 'W19-5', null, null, '0', '71');
INSERT INTO `room_state` VALUES ('72', 'W20-1', null, null, '0', '72');
INSERT INTO `room_state` VALUES ('73', 'W20-2', null, null, '0', '73');
INSERT INTO `room_state` VALUES ('74', 'W20-3', null, null, '0', '74');
INSERT INTO `room_state` VALUES ('75', 'W20-5', null, null, '0', '75');
INSERT INTO `room_state` VALUES ('76', 'W21-1', null, null, '0', '76');
INSERT INTO `room_state` VALUES ('77', 'W21-2', null, null, '0', '77');
INSERT INTO `room_state` VALUES ('78', 'W21-3', null, null, '0', '78');
INSERT INTO `room_state` VALUES ('79', 'W21-5', null, null, '0', '79');
INSERT INTO `room_state` VALUES ('80', 'W22-1', null, null, '0', '80');
INSERT INTO `room_state` VALUES ('81', 'W22-2', null, null, '0', '81');
INSERT INTO `room_state` VALUES ('82', 'W22-3', null, null, '0', '82');
INSERT INTO `room_state` VALUES ('83', 'W22-5', null, null, '0', '83');
INSERT INTO `room_state` VALUES ('84', 'W23-1', null, null, '0', '84');
INSERT INTO `room_state` VALUES ('85', 'W23-2', null, null, '0', '85');
INSERT INTO `room_state` VALUES ('86', 'W23-3', null, null, '0', '86');
INSERT INTO `room_state` VALUES ('87', 'W23-5', null, null, '0', '87');
INSERT INTO `room_state` VALUES ('88', 'W24-1', '121', 'Ada', '1', '88');
INSERT INTO `room_state` VALUES ('89', 'W24-2', null, null, '0', '89');
INSERT INTO `room_state` VALUES ('90', 'W24-3', null, null, '0', '90');
INSERT INTO `room_state` VALUES ('91', 'W24-5', null, null, '0', '91');
INSERT INTO `room_state` VALUES ('92', 'W25-1', null, null, '0', '92');
INSERT INTO `room_state` VALUES ('93', 'W25-2', null, null, '0', '93');
INSERT INTO `room_state` VALUES ('94', 'W25-3', null, null, '0', '94');
INSERT INTO `room_state` VALUES ('95', 'W26-1', null, null, '0', '95');
INSERT INTO `room_state` VALUES ('96', 'W26-2', null, null, '0', '96');
INSERT INTO `room_state` VALUES ('97', 'W26-3', null, null, '0', '97');
INSERT INTO `room_state` VALUES ('98', 'W27-1', null, null, '0', '98');
INSERT INTO `room_state` VALUES ('99', 'W27-2', null, null, '0', '99');
INSERT INTO `room_state` VALUES ('100', 'W27-3', '110', 'Ada', '1', '100');
INSERT INTO `room_state` VALUES ('101', 'W28-1', null, null, '0', '101');
INSERT INTO `room_state` VALUES ('102', 'W28-2', null, null, '0', '102');
INSERT INTO `room_state` VALUES ('103', 'W28-3', null, null, '0', '103');
INSERT INTO `room_state` VALUES ('104', 'W29-1', '108', 'Ada', '1', '104');
INSERT INTO `room_state` VALUES ('105', 'W29-2', '109', 'Ada', '1', '105');
INSERT INTO `room_state` VALUES ('106', 'W29-3', null, null, '0', '106');
INSERT INTO `room_state` VALUES ('107', 'W30-1', null, null, '0', '107');
INSERT INTO `room_state` VALUES ('108', 'W30-2', null, null, '0', '108');
INSERT INTO `room_state` VALUES ('109', 'W30-3', '107', 'Ada', '1', '109');
INSERT INTO `room_state` VALUES ('110', 'W31-1', null, null, '0', '110');
INSERT INTO `room_state` VALUES ('111', 'W31-2', null, null, '0', '111');
INSERT INTO `room_state` VALUES ('112', 'W31-3', null, null, '0', '112');
INSERT INTO `room_state` VALUES ('113', 'W32-1', '31', 'alice1', '1', '113');
INSERT INTO `room_state` VALUES ('114', 'W32-2', '106', 'Ada', '1', '114');
INSERT INTO `room_state` VALUES ('115', 'W32-3', null, null, '0', '115');
INSERT INTO `room_state` VALUES ('116', 'W33-1', '25', 'Ada', '1', '116');
INSERT INTO `room_state` VALUES ('117', 'W33-2', '54', 'Ada', '1', '117');
INSERT INTO `room_state` VALUES ('118', 'W33-3', '105', 'Ada', '1', '118');
INSERT INTO `room_state` VALUES ('119', 'W34-1', null, null, '0', '119');
INSERT INTO `room_state` VALUES ('120', 'W34-2', null, null, '0', '120');
INSERT INTO `room_state` VALUES ('121', 'W34-3', null, null, '0', '121');
INSERT INTO `room_state` VALUES ('122', 'W35-1', null, null, '0', '122');
INSERT INTO `room_state` VALUES ('123', 'W35-2', null, null, '0', '123');
INSERT INTO `room_state` VALUES ('124', 'E2-1', null, null, '0', '124');
INSERT INTO `room_state` VALUES ('125', 'E2-2', null, null, '0', '125');
INSERT INTO `room_state` VALUES ('126', 'E2-3', null, null, '0', '126');
INSERT INTO `room_state` VALUES ('127', 'E2-5', null, null, '0', '127');
INSERT INTO `room_state` VALUES ('128', 'E3-1', null, null, '0', '128');
INSERT INTO `room_state` VALUES ('129', 'E3-2', null, null, '0', '129');
INSERT INTO `room_state` VALUES ('130', 'E3-3', null, null, '0', '130');
INSERT INTO `room_state` VALUES ('131', 'E3-5', null, null, '0', '131');
INSERT INTO `room_state` VALUES ('132', 'E3-6', null, null, '0', '132');
INSERT INTO `room_state` VALUES ('133', 'E4-1', null, null, '0', '133');
INSERT INTO `room_state` VALUES ('134', 'E4-2', null, null, '0', '134');
INSERT INTO `room_state` VALUES ('135', 'E4-3', null, null, '0', '135');
INSERT INTO `room_state` VALUES ('136', 'E4-5', null, null, '0', '136');
INSERT INTO `room_state` VALUES ('137', 'E4-6', null, null, '0', '137');
INSERT INTO `room_state` VALUES ('138', 'E5-1', null, null, '0', '138');
INSERT INTO `room_state` VALUES ('139', 'E5-2', null, null, '0', '139');
INSERT INTO `room_state` VALUES ('140', 'E5-3', null, null, '0', '140');
INSERT INTO `room_state` VALUES ('141', 'E5-5', null, null, '0', '141');
INSERT INTO `room_state` VALUES ('142', 'E5-6', null, null, '0', '142');
INSERT INTO `room_state` VALUES ('143', 'E6-1', null, null, '0', '143');
INSERT INTO `room_state` VALUES ('144', 'E6-2', null, null, '0', '144');
INSERT INTO `room_state` VALUES ('145', 'E6-3', null, null, '0', '145');
INSERT INTO `room_state` VALUES ('146', 'E6-5', null, null, '0', '146');
INSERT INTO `room_state` VALUES ('147', 'E6-6', null, null, '0', '147');
INSERT INTO `room_state` VALUES ('148', 'E7-1', null, null, '0', '148');
INSERT INTO `room_state` VALUES ('149', 'E7-2', null, null, '0', '149');
INSERT INTO `room_state` VALUES ('150', 'E7-3', null, null, '0', '150');
INSERT INTO `room_state` VALUES ('151', 'E7-5', null, null, '0', '151');
INSERT INTO `room_state` VALUES ('152', 'E7-6', null, null, '0', '152');
INSERT INTO `room_state` VALUES ('153', 'E8-1', null, null, '0', '153');
INSERT INTO `room_state` VALUES ('154', 'E8-2', null, null, '0', '154');
INSERT INTO `room_state` VALUES ('155', 'E8-3', null, null, '0', '155');
INSERT INTO `room_state` VALUES ('156', 'E8-5', null, null, '0', '156');
INSERT INTO `room_state` VALUES ('157', 'E8-6', null, null, '0', '157');
INSERT INTO `room_state` VALUES ('158', 'E9-1', null, null, '0', '158');
INSERT INTO `room_state` VALUES ('159', 'E9-2', null, null, '0', '159');
INSERT INTO `room_state` VALUES ('160', 'E9-3', null, null, '0', '160');
INSERT INTO `room_state` VALUES ('161', 'E9-5', null, null, '0', '161');
INSERT INTO `room_state` VALUES ('162', 'E9-6', null, null, '0', '162');
INSERT INTO `room_state` VALUES ('163', 'E10-1', null, null, '0', '163');
INSERT INTO `room_state` VALUES ('164', 'E10-2', null, null, '0', '164');
INSERT INTO `room_state` VALUES ('165', 'E10-3', null, null, '0', '165');
INSERT INTO `room_state` VALUES ('166', 'E10-5', null, null, '0', '166');
INSERT INTO `room_state` VALUES ('167', 'E10-6', null, null, '0', '167');
INSERT INTO `room_state` VALUES ('168', 'E11-1', null, null, '0', '168');
INSERT INTO `room_state` VALUES ('169', 'E11-2', null, null, '0', '169');
INSERT INTO `room_state` VALUES ('170', 'E11-3', null, null, '0', '170');
INSERT INTO `room_state` VALUES ('171', 'E11-5', null, null, '0', '171');
INSERT INTO `room_state` VALUES ('172', 'E11-6', null, null, '0', '172');
INSERT INTO `room_state` VALUES ('173', 'E12-1', null, null, '0', '173');
INSERT INTO `room_state` VALUES ('174', 'E12-2', null, null, '0', '174');
INSERT INTO `room_state` VALUES ('175', 'E12-3', null, null, '0', '175');
INSERT INTO `room_state` VALUES ('176', 'E12-5', null, null, '0', '176');
INSERT INTO `room_state` VALUES ('177', 'E12-6', null, null, '0', '177');
INSERT INTO `room_state` VALUES ('178', 'E13-1', null, null, '0', '178');
INSERT INTO `room_state` VALUES ('179', 'E13-2', null, null, '0', '179');
INSERT INTO `room_state` VALUES ('180', 'E13-3', null, null, '0', '180');
INSERT INTO `room_state` VALUES ('181', 'E13-5', null, null, '0', '181');
INSERT INTO `room_state` VALUES ('182', 'E13-6', null, null, '0', '182');
INSERT INTO `room_state` VALUES ('183', 'E14-1', null, null, '0', '183');
INSERT INTO `room_state` VALUES ('184', 'E14-2', null, null, '0', '184');
INSERT INTO `room_state` VALUES ('185', 'E14-3', null, null, '0', '185');
INSERT INTO `room_state` VALUES ('186', 'E14-5', null, null, '0', '186');
INSERT INTO `room_state` VALUES ('187', 'E14-6', null, null, '0', '187');
INSERT INTO `room_state` VALUES ('188', 'E15-1', null, null, '0', '188');
INSERT INTO `room_state` VALUES ('189', 'E15-2', null, null, '0', '189');
INSERT INTO `room_state` VALUES ('190', 'E15-3', null, null, '0', '190');
INSERT INTO `room_state` VALUES ('191', 'E15-5', null, null, '0', '191');
INSERT INTO `room_state` VALUES ('192', 'E15-6', null, null, '0', '192');
INSERT INTO `room_state` VALUES ('193', 'E16-1', null, null, '0', '193');
INSERT INTO `room_state` VALUES ('194', 'E16-2', null, null, '0', '194');
INSERT INTO `room_state` VALUES ('195', 'E16-3', null, null, '0', '195');
INSERT INTO `room_state` VALUES ('196', 'E16-5', null, null, '0', '196');
INSERT INTO `room_state` VALUES ('197', 'E16-6', null, null, '0', '197');
INSERT INTO `room_state` VALUES ('198', 'E17-1', null, null, '0', '198');
INSERT INTO `room_state` VALUES ('199', 'E17-2', null, null, '0', '199');
INSERT INTO `room_state` VALUES ('200', 'E17-3', null, null, '0', '200');
INSERT INTO `room_state` VALUES ('201', 'E17-5', null, null, '0', '201');
INSERT INTO `room_state` VALUES ('202', 'E17-6', null, null, '0', '202');
INSERT INTO `room_state` VALUES ('203', 'E18-1', null, null, '0', '203');
INSERT INTO `room_state` VALUES ('204', 'E18-2', null, null, '0', '204');
INSERT INTO `room_state` VALUES ('205', 'E18-3', null, null, '0', '205');
INSERT INTO `room_state` VALUES ('206', 'E18-5', null, null, '0', '206');
INSERT INTO `room_state` VALUES ('207', 'E18-6', null, null, '0', '207');
INSERT INTO `room_state` VALUES ('208', 'E19-1', null, null, '0', '208');
INSERT INTO `room_state` VALUES ('209', 'E19-2', null, null, '0', '209');
INSERT INTO `room_state` VALUES ('210', 'E19-3', null, null, '0', '210');
INSERT INTO `room_state` VALUES ('211', 'E19-5', null, null, '0', '211');
INSERT INTO `room_state` VALUES ('212', 'E19-6', null, null, '0', '212');
INSERT INTO `room_state` VALUES ('213', 'E20-1', null, null, '0', '213');
INSERT INTO `room_state` VALUES ('214', 'E20-2', null, null, '0', '214');
INSERT INTO `room_state` VALUES ('215', 'E20-3', null, null, '0', '215');
INSERT INTO `room_state` VALUES ('216', 'E20-5', null, null, '0', '216');
INSERT INTO `room_state` VALUES ('217', 'E20-6', null, null, '0', '217');
INSERT INTO `room_state` VALUES ('218', 'E21-1', null, null, '0', '218');
INSERT INTO `room_state` VALUES ('219', 'E21-2', null, null, '0', '219');
INSERT INTO `room_state` VALUES ('220', 'E21-3', null, null, '0', '220');
INSERT INTO `room_state` VALUES ('221', 'E21-5', null, null, '0', '221');
INSERT INTO `room_state` VALUES ('222', 'E21-6', null, null, '0', '222');
INSERT INTO `room_state` VALUES ('223', 'E22-1', null, null, '0', '223');
INSERT INTO `room_state` VALUES ('224', 'E22-2', null, null, '0', '224');
INSERT INTO `room_state` VALUES ('225', 'E22-3', null, null, '0', '225');
INSERT INTO `room_state` VALUES ('226', 'E22-5', null, null, '0', '226');
INSERT INTO `room_state` VALUES ('227', 'E22-6', null, null, '0', '227');
INSERT INTO `room_state` VALUES ('228', 'E23-1', null, null, '0', '228');
INSERT INTO `room_state` VALUES ('229', 'E23-2', null, null, '0', '229');
INSERT INTO `room_state` VALUES ('230', 'E23-3', null, null, '0', '230');
INSERT INTO `room_state` VALUES ('231', 'E23-5', null, null, '0', '231');
INSERT INTO `room_state` VALUES ('232', 'E23-6', null, null, '0', '232');
INSERT INTO `room_state` VALUES ('233', 'E24-1', null, null, '0', '233');
INSERT INTO `room_state` VALUES ('234', 'E24-2', null, null, '0', '234');
INSERT INTO `room_state` VALUES ('235', 'E24-3', null, null, '0', '235');
INSERT INTO `room_state` VALUES ('236', 'E24-5', null, null, '0', '236');
INSERT INTO `room_state` VALUES ('237', 'E24-6', null, null, '0', '237');
INSERT INTO `room_state` VALUES ('238', 'E25-1', null, null, '0', '238');
INSERT INTO `room_state` VALUES ('239', 'E25-2', null, null, '0', '239');
INSERT INTO `room_state` VALUES ('240', 'E25-3', null, null, '0', '240');
INSERT INTO `room_state` VALUES ('241', 'E25-5', null, null, '0', '241');
INSERT INTO `room_state` VALUES ('242', 'E26-1', null, null, '0', '242');
INSERT INTO `room_state` VALUES ('243', 'E26-2', null, null, '0', '243');
INSERT INTO `room_state` VALUES ('244', 'E26-3', null, null, '0', '244');
INSERT INTO `room_state` VALUES ('245', 'E26-5', null, null, '0', '245');
INSERT INTO `room_state` VALUES ('246', 'E27-1', null, null, '0', '246');
INSERT INTO `room_state` VALUES ('247', 'E27-2', null, null, '0', '247');
INSERT INTO `room_state` VALUES ('248', 'E27-3', null, null, '0', '248');
INSERT INTO `room_state` VALUES ('249', 'E27-5', null, null, '0', '249');
INSERT INTO `room_state` VALUES ('250', 'E28-1', null, null, '0', '250');
INSERT INTO `room_state` VALUES ('251', 'E28-2', null, null, '0', '251');
INSERT INTO `room_state` VALUES ('252', 'E28-3', null, null, '0', '252');
INSERT INTO `room_state` VALUES ('253', 'E28-5', null, null, '0', '253');
INSERT INTO `room_state` VALUES ('254', 'E29-1', null, null, '0', '254');
INSERT INTO `room_state` VALUES ('255', 'E29-2', null, null, '0', '255');
INSERT INTO `room_state` VALUES ('256', 'E29-3', null, null, '0', '256');
INSERT INTO `room_state` VALUES ('257', 'E29-5', null, null, '0', '257');
INSERT INTO `room_state` VALUES ('258', 'E30-1', null, null, '0', '258');
INSERT INTO `room_state` VALUES ('259', 'E30-2', null, null, '0', '259');
INSERT INTO `room_state` VALUES ('260', 'E30-3', null, null, '0', '260');
INSERT INTO `room_state` VALUES ('261', 'E31-1', null, null, '0', '261');
INSERT INTO `room_state` VALUES ('262', 'E31-2', null, null, '0', '262');
INSERT INTO `room_state` VALUES ('263', 'E31-3', null, null, '0', '263');
INSERT INTO `room_state` VALUES ('264', 'E32-1', null, null, '0', '264');
INSERT INTO `room_state` VALUES ('265', 'E32-2', null, null, '0', '265');
INSERT INTO `room_state` VALUES ('266', 'E32-3', null, null, '0', '266');
INSERT INTO `room_state` VALUES ('267', 'E33-1', null, null, '0', '267');
INSERT INTO `room_state` VALUES ('268', 'E33-2', null, null, '0', '268');
INSERT INTO `room_state` VALUES ('269', 'E33-3', null, null, '0', '269');
INSERT INTO `room_state` VALUES ('270', 'E34-1', null, null, '0', '270');
INSERT INTO `room_state` VALUES ('271', 'E34-2', null, null, '0', '271');
INSERT INTO `room_state` VALUES ('272', 'E34-3', null, null, '0', '272');
INSERT INTO `room_state` VALUES ('273', 'E35-1', null, null, '0', '273');
INSERT INTO `room_state` VALUES ('274', 'E35-2', null, null, '0', '274');

-- ----------------------------
-- Table structure for `shoes_polishing`
-- ----------------------------
DROP TABLE IF EXISTS `shoes_polishing`;
CREATE TABLE `shoes_polishing` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUM` varchar(64) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `GUEST_NAME` varchar(11) DEFAULT NULL,
  `COUNT` int(11) DEFAULT NULL,
  `TOTAL_PRICE` double DEFAULT NULL,
  `PAY_MODE` tinyint(3) DEFAULT NULL COMMENT '支付方式：现金0 月结1',
  `COMMENT` varchar(64) DEFAULT NULL,
  `STAFF_ID` int(11) DEFAULT NULL,
  `STAFF_NAME` varchar(64) DEFAULT NULL,
  `OCCUR_TIME` datetime DEFAULT NULL,
  `IMPORT_TIME` datetime DEFAULT NULL,
  `EDIT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoes_polishing
-- ----------------------------
INSERT INTO `shoes_polishing` VALUES ('1', 'W33-2', '54', 'Ada', '0', '0', '0', '无', '0', 'null', '2017-06-12 00:00:00', '2017-06-12 21:55:28', '2017-06-12 21:55:28');
INSERT INTO `shoes_polishing` VALUES ('3', 'W11-1', '49', 'Ada5', '0', '0', '0', '无', '0', 'null', '2017-06-12 00:00:00', '2017-06-12 21:55:38', '2017-06-12 21:55:38');
INSERT INTO `shoes_polishing` VALUES ('4', 'W33-2', '54', 'Ada', '0', '0', '0', '无', '0', 'null', '2017-06-11 00:00:00', '2017-06-12 21:56:13', '2017-06-12 21:56:13');
INSERT INTO `shoes_polishing` VALUES ('5', 'W11-1', '49', 'Ada5', '0', '0', '0', '无', '0', 'null', '2017-06-12 00:00:00', '2017-06-12 22:06:06', '2017-06-12 22:06:06');
INSERT INTO `shoes_polishing` VALUES ('6', 'w33-3', '105', 'Ada', '0', '0', '0', '无', '0', 'null', '2017-10-26 00:00:00', '2017-10-26 13:24:15', '2017-10-26 13:24:15');
INSERT INTO `shoes_polishing` VALUES ('7', 'w33-3', '105', 'Ada', '0', '0', '0', '无', '0', 'null', '2017-10-26 00:00:00', '2017-10-26 14:09:52', '2017-10-26 14:09:52');
INSERT INTO `shoes_polishing` VALUES ('8', 'w33-3', '105', 'Ada', '0', '0', '0', '无', '0', 'null', '2017-10-26 00:00:00', '2017-10-26 14:09:54', '2017-10-26 14:09:54');
INSERT INTO `shoes_polishing` VALUES ('9', 'w33-3', '105', 'Ada', '0', '0', '0', '无', '0', 'null', '2017-10-26 00:00:00', '2017-10-26 14:09:57', '2017-10-26 14:09:57');
INSERT INTO `shoes_polishing` VALUES ('10', 'w33-3', '105', 'Ada', '0', '20', '0', '无', '0', 'null', '2017-10-26 00:00:00', '2017-10-26 14:10:00', '2017-10-26 14:17:27');

-- ----------------------------
-- Table structure for `shuttle_bus`
-- ----------------------------
DROP TABLE IF EXISTS `shuttle_bus`;
CREATE TABLE `shuttle_bus` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `YEAR` int(11) DEFAULT NULL,
  `MONTH` int(11) DEFAULT NULL,
  `ROOM_NUM` varchar(64) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `OTHER_PEOPLE` varchar(100) DEFAULT '',
  `FIRST` int(11) DEFAULT '0',
  `SECOND` int(11) DEFAULT '0',
  `THIRD` int(11) DEFAULT '0',
  `FOURTH` int(11) DEFAULT '0',
  `FIFTH` int(11) DEFAULT '0',
  `SIXTH` int(11) DEFAULT '0',
  `SEVENTH` int(11) DEFAULT '0',
  `EIGHTH` int(11) DEFAULT '0',
  `NINTH` int(11) DEFAULT '0',
  `TENTH` int(11) DEFAULT '0',
  `ELEVENTH` int(11) DEFAULT '0',
  `TWELFTH` int(11) DEFAULT '0',
  `THIRTEENTH` int(11) DEFAULT '0',
  `FOURTEENTH` int(11) DEFAULT '0',
  `FIFTEENTH` int(11) DEFAULT '0',
  `SIXTEENTH` int(11) DEFAULT '0',
  `SEVENTEENTH` int(11) DEFAULT '0',
  `EIGHTEENTH` int(11) DEFAULT '0',
  `NINETEENTH` int(11) DEFAULT '0',
  `TWENTIETH` int(11) DEFAULT '0',
  `TWENTY_FIRST` int(11) DEFAULT '0',
  `TWENTY_SECOND` int(11) DEFAULT '0',
  `TWENTY_THIRD` int(11) DEFAULT '0',
  `TWENTY_FOURTH` int(11) DEFAULT '0',
  `TWENTY_FIFTH` int(11) DEFAULT '0',
  `TWENTY_SIXTH` int(11) DEFAULT '0',
  `TWENTY_SEVENTH` int(11) DEFAULT '0',
  `TWENTY_EIGHTH` int(11) DEFAULT '0',
  `TWENTY_NINTH` int(11) DEFAULT '0',
  `THIRTIETH` int(11) DEFAULT '0',
  `THIRTY_FIRST` int(11) DEFAULT '0',
  `DAYS` int(11) DEFAULT '0',
  `TOTAL` int(11) DEFAULT '0',
  `OCCUR_TIME` datetime DEFAULT NULL,
  `IMPORT_TIME` datetime DEFAULT NULL,
  `EDIT_TIME` datetime DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `YEAR` (`YEAR`,`MONTH`,`GUEST_ID`),
  KEY `ROOM_NUM` (`ROOM_NUM`)
) ENGINE=InnoDB AUTO_INCREMENT=46 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shuttle_bus
-- ----------------------------
INSERT INTO `shuttle_bus` VALUES ('1', '2017', '3', 'W32-1', '2', 'Alice1', '张三，李四，王五', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '9', '2017-04-12 12:38:49', '2017-05-15 12:38:53', '2017-06-28 12:38:55');
INSERT INTO `shuttle_bus` VALUES ('29', '2016', '12', 'W7-3', '50', '测', '李逍遥，赵灵儿，林月如', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1', '0', '1', '0', '0', '8', '80', '2016-12-01 12:00:00', '2017-04-25 12:39:25', '2017-05-14 14:50:32');
INSERT INTO `shuttle_bus` VALUES ('30', '2017', '7', 'W2-1', '3', 'Tom', '林月如，阿奴', '0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1', '1', '1', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '18', '198', '2017-07-01 12:00:00', '2017-05-25 12:39:29', '2017-05-25 15:33:36');
INSERT INTO `shuttle_bus` VALUES ('31', '2017', '5', 'W6-1', '59', 'aaa', '景天，雪见', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '2', '20', '2017-02-22 12:39:10', '2017-03-15 12:39:33', '2017-10-31 11:08:21');
INSERT INTO `shuttle_bus` VALUES ('34', '2017', '5', 'W33-2', '54', 'Ada', '云天河，柳梦璃', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0', '7', '70', '2015-11-15 12:39:15', '2017-03-07 12:39:36', '2017-10-31 11:06:45');
INSERT INTO `shuttle_bus` VALUES ('39', '2017', '5', 'W33-3', '58', 'Alice2', '陈靖仇', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1', '1', '1', '0', '0', '9', '90', '2017-05-01 00:00:00', '2017-05-12 11:58:10', '2017-05-12 12:31:02');
INSERT INTO `shuttle_bus` VALUES ('40', '2017', '5', 'W33-3', '1', 'Ada', '张三，李四，王五', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '0', '0', '9', '90', '2017-05-01 12:00:00', '2017-05-13 14:26:01', '2017-05-13 14:34:40');
INSERT INTO `shuttle_bus` VALUES ('41', '2017', '6', 'W33-3', '1', 'Ada', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '2', '20', '2017-06-01 12:00:01', '2017-05-13 14:26:53', '2017-05-13 14:26:53');
INSERT INTO `shuttle_bus` VALUES ('42', '2017', '5', 'W7-3', '50', '测', 'hahah，hahah', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '2', '20', '2017-05-01 00:00:00', '2017-05-16 10:34:49', '2017-05-16 10:34:49');
INSERT INTO `shuttle_bus` VALUES ('44', '2017', '5', 'W11-1', '49', 'Ada5', 'Bruno Mars, Alexa Keys，aa', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '5', '50', '2017-05-01 00:00:01', '2017-05-16 11:52:51', '2017-05-16 11:53:38');
INSERT INTO `shuttle_bus` VALUES ('45', '2017', '5', 'W33-3', '105', 'Ada', '', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0', '7', '70', '2017-05-01 00:00:00', '2017-10-31 11:04:58', '2017-10-31 11:07:00');

-- ----------------------------
-- Table structure for `sources`
-- ----------------------------
DROP TABLE IF EXISTS `sources`;
CREATE TABLE `sources` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUMBER` varchar(64) DEFAULT NULL,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `TYPE` varchar(11) DEFAULT NULL COMMENT '水费 电费 燃气费',
  `METER` varchar(64) DEFAULT NULL,
  `CUR_MONTH_VAL` double DEFAULT NULL,
  `MONEY` double DEFAULT NULL,
  `UPDATE_TIME` datetime DEFAULT NULL COMMENT '更新日期',
  `READING_TIME` datetime DEFAULT NULL COMMENT '抄表日期',
  `MONTH` int(10) DEFAULT NULL COMMENT '月份',
  `SYS_STATE` int(11) DEFAULT '1' COMMENT '0 表示历史记录 1表示现在记录',
  `LOG` varchar(10) DEFAULT NULL COMMENT '入住 退租 计费',
  PRIMARY KEY (`ID`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=34 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sources
-- ----------------------------
INSERT INTO `sources` VALUES ('1', 'W2-2', 'Ada', 'water', 'W2-2', '12', '4.800000000000001', '2017-12-06 00:00:00', '2017-12-06 00:00:00', '11', '1', '入住');
INSERT INTO `sources` VALUES ('2', 'W7-3', 'Ada', 'water', 'W7-3', '45', '18', '2017-12-06 00:00:00', '2017-12-06 00:00:00', '11', '1', '入住');
INSERT INTO `sources` VALUES ('3', 'W2-1', 'Tom', 'water', 'W2-1', '34', '13.600000000000001', '2014-12-06 00:00:00', '2014-12-06 00:00:00', '11', '1', '入住');
INSERT INTO `sources` VALUES ('4', 'W2-1', 'Tom', 'water', 'W2-1', '34', '13.600000000000001', '2017-12-06 00:00:00', '2017-11-16 00:00:00', '10', '1', '计费');
INSERT INTO `sources` VALUES ('5', 'W2-1', 'Tom', 'water', 'W2-1', '34', '13.600000000000001', '2017-12-06 00:00:00', '2017-10-05 00:00:00', '9', '1', '计费');
INSERT INTO `sources` VALUES ('6', 'W2-2', 'Ada', 'water', 'W2-2', '23', '9.200000000000001', '2017-12-13 00:00:00', '2017-12-06 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('7', 'W2-1', 'Tom', 'water', 'W2-1', '45', '18', '2017-12-14 00:00:00', '2017-10-05 00:00:00', '9', '1', '计费');
INSERT INTO `sources` VALUES ('8', 'W2-1', 'Tom', 'water', 'W2-1', '45', '18', '2017-12-14 00:00:00', '2015-12-11 00:00:00', '9', '1', '计费');
INSERT INTO `sources` VALUES ('9', 'W2-1', 'Tom', 'water', 'W2-1', '45', '18', '2017-12-14 00:00:00', '2016-12-08 00:00:00', '9', '1', '计费');
INSERT INTO `sources` VALUES ('10', 'W2-1', 'Tom', 'elec', 'W2-1', '12', '4.800000000000001', '2017-12-16 00:00:00', '2014-12-12 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('11', 'W2-1', 'Tom', 'elec', 'W2-1', '13', '5.2', '2017-12-16 00:00:00', '2014-12-12 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('12', 'W2-1', 'Tom', 'water', 'W2-1', '46', '0.4', '2017-12-16 00:00:00', '2016-12-08 00:00:00', '9', '1', '计费');
INSERT INTO `sources` VALUES ('13', 'W2-1', 'Tom', 'water', 'W2-1', '47', '0.4', '2017-12-16 00:00:00', '2016-12-08 00:00:00', '9', '1', '计费');
INSERT INTO `sources` VALUES ('14', 'W2-2', 'Ada', 'water', 'W2-2', '24', '0.4', '2017-12-16 00:00:00', '2017-12-06 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('15', 'W2-1', 'Tom', 'elec', 'W2-1', '14', '0.4', '2017-12-16 00:00:00', '2014-12-12 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('16', 'W2-1', 'Tom', 'elec', 'W2-1', '14', '0', '2017-12-16 00:00:00', '2014-12-12 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('17', 'W2-1', 'Tom', 'water', 'W2-1', '49', '0.8', '2017-12-16 00:00:00', '2016-12-08 00:00:00', '9', '1', '计费');
INSERT INTO `sources` VALUES ('18', 'W2-1', 'Tom', 'water', 'W2-1', '56', '2.8000000000000003', '2017-12-17 00:00:00', '2016-12-08 00:00:00', '9', '1', '计费');
INSERT INTO `sources` VALUES ('19', 'W8-2', 'Ada', 'water', 'W8-2', '2', '0.8', '2017-12-17 00:00:00', '2017-12-17 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('20', 'W8-2', 'Ada', 'water', 'W8-2', '3', '0.4', '2017-12-17 00:00:00', '2017-12-17 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('21', 'W2-2', 'Ada', 'elec', 'W2-2', '2', '0.8', '2017-12-17 00:00:00', '2017-12-17 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('22', 'W2-2', 'Ada', 'elec', 'W2-2', '3', '0.4', '2017-12-17 00:00:00', '2015-12-10 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('23', 'W2-1', 'Tom', 'water', 'W2-1', '50', '0.8', '2017-12-17 13:38:29', '2017-12-17 13:38:36', '11', '1', '退租');
INSERT INTO `sources` VALUES ('24', 'W2-1', 'Alia', 'water', 'W2-1', '0', '0', '2017-12-19 13:39:49', '2017-12-19 13:39:54', '11', '1', '入住');
INSERT INTO `sources` VALUES ('25', 'W7-3', 'Ada', 'elec', 'W7-3', '10', '4', '2017-12-17 00:00:00', '2017-12-17 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('26', 'W2-1', 'Tom', 'gas', '1', '2', '0.6', '2017-12-17 00:00:00', '2017-12-17 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('27', 'W11-3', 'Ada', 'water', 'W11-3', '2', '0.8', '2017-12-17 00:00:00', '2017-12-17 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('28', 'W2-2', 'Ada', 'gas', '2', '2', '0.6', '2017-12-17 00:00:00', '2017-12-17 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('29', 'W2-1', 'Tom', 'gas', '1', '4', '0.6', '2017-12-17 00:00:00', '2017-12-17 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('30', 'W2-1', 'Tom', 'gas', '1', '5', '0.3', '2017-12-17 00:00:00', '2017-12-17 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('31', 'W7-3', 'Ada', 'gas', '22', '2', '0.6', '2017-12-18 00:00:00', '2017-12-18 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('32', 'W2-1', 'Tom', 'gas', '275', '2', '0.6', '2017-12-18 00:00:00', '2017-12-18 00:00:00', '11', '1', '计费');
INSERT INTO `sources` VALUES ('33', 'W8-2', 'Ada', 'gas', '25', '2', '0.6', '2017-12-18 00:00:00', '2017-12-18 00:00:00', '11', '1', '计费');

-- ----------------------------
-- Table structure for `staff`
-- ----------------------------
DROP TABLE IF EXISTS `staff`;
CREATE TABLE `staff` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `NAME` varchar(64) DEFAULT '' COMMENT '考虑职员名称的唯一性约束问题！',
  `DUTY` varchar(64) DEFAULT NULL COMMENT '职务',
  `DEPART` varchar(64) DEFAULT NULL COMMENT '部门',
  `JOIN_DATE` date DEFAULT NULL COMMENT '加入日期',
  `STATE` tinyint(3) DEFAULT NULL COMMENT '1 在职 0 已解雇',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of staff
-- ----------------------------
INSERT INTO `staff` VALUES ('1', 'ken', '点餐', '客服部', '2017-05-11', '1');
INSERT INTO `staff` VALUES ('2', 'lucy', '代购', '客服部', '2017-05-25', '1');
INSERT INTO `staff` VALUES ('3', 'andy', '点餐', '客服部', '2017-05-25', '1');
INSERT INTO `staff` VALUES ('4', 'andrew', '代购', '客服部', '2017-05-25', '1');

-- ----------------------------
-- Table structure for `system_reminder`
-- ----------------------------
DROP TABLE IF EXISTS `system_reminder`;
CREATE TABLE `system_reminder` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `USER_ID` int(11) DEFAULT NULL,
  `TITLE` varchar(200) DEFAULT NULL,
  `CONTENT` varchar(500) DEFAULT NULL,
  `REMIND_DATE` date DEFAULT NULL,
  `STATE` varchar(10) DEFAULT NULL COMMENT '完成、未完成',
  PRIMARY KEY (`ID`)
) ENGINE=InnoDB AUTO_INCREMENT=94 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of system_reminder
-- ----------------------------
INSERT INTO `system_reminder` VALUES ('91', '10', '1', '1', '2017-06-22', '未完成');
INSERT INTO `system_reminder` VALUES ('92', '10', '1', '1', '2018-06-22', '未完成');
INSERT INTO `system_reminder` VALUES ('93', '10', '1', '1', '2019-06-22', '未完成');

-- ----------------------------
-- Table structure for `user`
-- ----------------------------
DROP TABLE IF EXISTS `user`;
CREATE TABLE `user` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `USERNAME` varchar(64) NOT NULL,
  `PASSWD` varchar(64) NOT NULL,
  `NAME` varchar(64) NOT NULL,
  `NUM` varchar(64) DEFAULT NULL,
  `DEPART` varchar(64) DEFAULT NULL,
  `ROLE` int(10) unsigned NOT NULL DEFAULT '0',
  `AUTH` int(10) unsigned NOT NULL DEFAULT '0',
  `CTIME` date DEFAULT NULL,
  `LTIME` date DEFAULT NULL,
  `STATE` int(10) unsigned NOT NULL DEFAULT '1',
  `RESET_PASSWD` tinyint(3) DEFAULT '0' COMMENT '是否修改过密码（初始为0）',
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERNAME` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'BUPTADMIN', 'e10adc3949ba59abbe56e057f20f883e', 'BUPTADMIN', 'SYS_001', '财务部', '0', '1835008', '2016-10-08', '2017-11-07', '1', '1');
INSERT INTO `user` VALUES ('2', 'test', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_001', '客服部', '4', '786431', '2016-10-08', '2017-12-25', '1', '1');
INSERT INTO `user` VALUES ('10', '王二', 'e10adc3949ba59abbe56e057f20f883e', '王二', '王二', '财务部', '4', '262143', '2017-03-17', '2017-06-16', '1', '1');
INSERT INTO `user` VALUES ('11', 'test8', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_', '客房部', '4', '262143', '2017-03-28', '2017-06-19', '1', '0');
INSERT INTO `user` VALUES ('12', 'testr345', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_', '客房部', '0', '1835008', '2017-03-29', '2017-03-29', '1', '0');
INSERT INTO `user` VALUES ('14', 'test12312', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_', '客房部', '0', '1835008', '2017-04-24', '2017-06-15', '1', '1');
INSERT INTO `user` VALUES ('20', 'yaochenkun', 'e10adc3949ba59abbe56e057f20f883e', '姚陈堃', 'TEST_123123123', '客房部', '4', '262143', '2017-06-19', '2017-06-19', '1', '1');
INSERT INTO `user` VALUES ('21', 'ken19931108', 'e10adc3949ba59abbe56e057f20f883e', 'lkjdlfsldf', 'TEST_123123', '客房部', '3', '1048576', '2017-06-19', '2017-06-19', '1', '1');
INSERT INTO `user` VALUES ('22', 'ken', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_', '客房部', '1', '262144', '2017-06-19', '2017-06-19', '1', '1');
INSERT INTO `user` VALUES ('23', 'ken1', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_', '客房部', '2', '524288', '2017-06-19', '2017-06-19', '1', '1');
