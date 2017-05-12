/*
Navicat MySQL Data Transfer

Source Server         : 本地
Source Server Version : 50635
Source Host           : localhost:3306
Source Database       : ld

Target Server Type    : MYSQL
Target Server Version : 50635
File Encoding         : 65001

Date: 2017-05-12 13:24:05
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of agent_purchase
-- ----------------------------

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
-- Table structure for `drinking_water`
-- ----------------------------
DROP TABLE IF EXISTS `drinking_water`;
CREATE TABLE `drinking_water` (
  `ID` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUM` varchar(64) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `BARREL_COUNT` int(11) DEFAULT '0' COMMENT '桶装水数量',
  `BARREL_LIMITCOUNT` int(11) DEFAULT NULL COMMENT '桶装水限额',
  `BOTTLE_COUNT` int(11) DEFAULT '0' COMMENT '瓶装矿泉水（提）数量',
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of drinking_water
-- ----------------------------

-- ----------------------------
-- Table structure for `fac_sta`
-- ----------------------------
DROP TABLE IF EXISTS `fac_sta`;
CREATE TABLE `fac_sta` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `FAC_NUMBER` varchar(64) DEFAULT NULL,
  `COMMENT` varchar(64) DEFAULT NULL,
  `NAME` varchar(64) DEFAULT NULL,
  `COMPANY` varchar(64) DEFAULT NULL,
  `TYPE` varchar(64) DEFAULT NULL,
  `CAT` varchar(64) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `BAD` int(11) DEFAULT NULL,
  `FREE` int(11) DEFAULT NULL,
  `WORKING` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `FAC_NUMBER` (`FAC_NUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of fac_sta
-- ----------------------------
INSERT INTO `fac_sta` VALUES ('1', '家电', '无', '全自动节能双开门冰箱', '海尔', '家电', '冰箱', '10', '2', '7', '8');

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
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8;

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
INSERT INTO `flight_picking` VALUES ('14', '2017-04-27', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('15', '2017-04-27', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('16', '2017-04-27', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('17', '2017-04-27', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('18', '2017-04-27', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
INSERT INTO `flight_picking` VALUES ('19', '2017-04-27', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null);
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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of grocery_item
-- ----------------------------
INSERT INTO `grocery_item` VALUES ('10', '????2', '??', '??', '52', null, null, null, '52', '10', '12');

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
  `TYPE` int(11) DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ITEM_ID` (`ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

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
  PRIMARY KEY (`ID`),
  UNIQUE KEY `CONTRACT_NUMBER` (`CONTRACT_NUMBER`),
  KEY `GUEST_NAME` (`GUEST_NAME`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=61 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guest
-- ----------------------------
INSERT INTO `guest` VALUES ('1', 'Ada', 'W33-3', null, 'S131', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0');
INSERT INTO `guest` VALUES ('2', 'Alice1', 'W32-1', null, 'S132', '13581818112', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0');
INSERT INTO `guest` VALUES ('3', 'Tom', 'W2-1', null, 'S12', '13581818112', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0');
INSERT INTO `guest` VALUES ('47', 'Ada3', 'W10-3', null, 'S1313', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0');
INSERT INTO `guest` VALUES ('49', 'Ada5', 'W11-1', null, 'S1311', '13581818113', 'Amazon', '主管', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0');
INSERT INTO `guest` VALUES ('50', '测', 'W7-3', null, 'S020', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0');
INSERT INTO `guest` VALUES ('54', 'Ada', 'W33-2', null, 'S142', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0');
INSERT INTO `guest` VALUES ('57', 'Alexa', 'W33-3', null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `guest` VALUES ('58', 'Alice2', 'W33-3', null, null, null, null, null, null, null, null, null, null, null, null, null, '1');
INSERT INTO `guest` VALUES ('59', 'aaa', 'W6-1', null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
INSERT INTO `guest` VALUES ('60', 'abc', 'W26-3', null, null, null, null, null, null, null, null, null, null, null, null, null, '0');

-- ----------------------------
-- Table structure for `guest_balance`
-- ----------------------------
DROP TABLE IF EXISTS `guest_balance`;
CREATE TABLE `guest_balance` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `GUEST_ID` int(10) unsigned DEFAULT NULL,
  `ROOM_NUMBER` varchar(64) DEFAULT NULL,
  `CHARGE_DAY` int(11) DEFAULT NULL,
  `CHARGE_TURN` int(11) DEFAULT NULL,
  `CHARGE_WAY` varchar(64) DEFAULT NULL,
  `RETURN_DAY` int(11) DEFAULT NULL,
  `RETURN_TURN` int(11) DEFAULT NULL,
  `INVOICE_DAY` int(11) DEFAULT NULL,
  `INVOICE_TURN` int(11) DEFAULT NULL,
  `INVOICE_AHEAD` int(11) DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `GUEST_ID` (`GUEST_ID`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`),
  CONSTRAINT `guest_balance_ibfk_1` FOREIGN KEY (`GUEST_ID`) REFERENCES `guest` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guest_balance
-- ----------------------------
INSERT INTO `guest_balance` VALUES ('1', '1', 'W33-3', '20', '30', '现金', '1', '30', '4', '30', '30', '0');
INSERT INTO `guest_balance` VALUES ('2', '2', 'W32-1', '20', '30', '现金', '1', '30', '4', '30', '30', '0');
INSERT INTO `guest_balance` VALUES ('3', '3', 'W2-1', '20', '30', '现金', '1', '30', '4', '30', '30', '0');
INSERT INTO `guest_balance` VALUES ('28', '47', 'W33-3', '20', '30', '现金', '1', '30', '4', '30', '30', '0');
INSERT INTO `guest_balance` VALUES ('29', '49', 'W33-3', '20', '30', '现金', '1', '30', '4', '30', '30', '0');
INSERT INTO `guest_balance` VALUES ('30', '50', 'W33-3', '20', '30', '现金', '1', '30', '4', '30', '30', '0');
INSERT INTO `guest_balance` VALUES ('31', '54', 'W33-2', '20', '30', '现金', '1', '30', '4', '30', '30', '0');

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
  PRIMARY KEY (`ID`),
  KEY `GUEST_ID` (`GUEST_ID`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`),
  CONSTRAINT `guest_service_ibfk_1` FOREIGN KEY (`GUEST_ID`) REFERENCES `guest` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=353 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of guest_service
-- ----------------------------
INSERT INTO `guest_service` VALUES ('1', '1', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('2', '1', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('3', '1', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7');
INSERT INTO `guest_service` VALUES ('4', '1', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('5', '1', 'W33-3', 'water', '1000', '1', '1000', null, '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('6', '1', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('7', '1', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('8', '1', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('9', '1', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('10', '1', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('11', '1', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('12', '2', 'W32-1', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('13', '2', 'W32-1', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('14', '2', 'W32-1', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7');
INSERT INTO `guest_service` VALUES ('15', '2', 'W32-1', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('16', '2', 'W32-1', 'water', '1000', '1', '1000', null, '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('17', '2', 'W32-1', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('18', '2', 'W32-1', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('19', '2', 'W32-1', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('20', '2', 'W32-1', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('21', '2', 'W32-1', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('22', '2', 'W32-1', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('23', '3', 'W2-1', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('24', '3', 'W2-1', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('25', '3', 'W2-1', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7');
INSERT INTO `guest_service` VALUES ('26', '3', 'W2-1', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('27', '3', 'W2-1', 'water', '1000', '1', '1000', null, '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('28', '3', 'W2-1', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('29', '3', 'W2-1', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('30', '3', 'W2-1', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('31', '3', 'W2-1', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('32', '3', 'W2-1', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('33', '3', 'W2-1', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('309', '47', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('310', '47', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('311', '47', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7');
INSERT INTO `guest_service` VALUES ('312', '47', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('313', '47', 'W33-3', 'water', '1000', '1', '1000', null, '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('314', '47', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('315', '47', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('316', '47', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('317', '47', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('318', '47', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('319', '47', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('320', '49', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('321', '49', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('322', '49', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7');
INSERT INTO `guest_service` VALUES ('323', '49', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('324', '49', 'W33-3', 'water', '1000', '1', '1000', null, '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('325', '49', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('326', '49', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('327', '49', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('328', '49', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('329', '49', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('330', '49', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('331', '50', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('332', '50', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('333', '50', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7');
INSERT INTO `guest_service` VALUES ('334', '50', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('335', '50', 'W33-3', 'water', '1000', '1', '1000', null, '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('336', '50', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('337', '50', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('338', '50', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('339', '50', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('340', '50', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('341', '50', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('342', '54', 'W33-2', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('343', '54', 'W33-2', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('344', '54', 'W33-2', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7');
INSERT INTO `guest_service` VALUES ('345', '54', 'W33-2', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('346', '54', 'W33-2', 'water', '1000', '1', '1000', null, '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('347', '54', 'W33-2', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('348', '54', 'W33-2', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('349', '54', 'W33-2', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('350', '54', 'W33-2', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('351', '54', 'W33-2', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9');
INSERT INTO `guest_service` VALUES ('352', '54', 'W33-2', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9');

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
  PRIMARY KEY (`ID`),
  KEY `GUEST_ID` (`GUEST_ID`),
  CONSTRAINT `host_ibfk_1` FOREIGN KEY (`GUEST_ID`) REFERENCES `guest` (`ID`) ON DELETE CASCADE
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of host
-- ----------------------------
INSERT INTO `host` VALUES ('1', '1', 'bob', '20000.5', '10000.5', '5000.5', null, '0');
INSERT INTO `host` VALUES ('2', '2', 'bob', '20000.5', '10000.5', '5000.5', null, '0');
INSERT INTO `host` VALUES ('3', '3', 'bob', '20000.5', '10000.5', '5000.5', null, '0');
INSERT INTO `host` VALUES ('15', '47', 'bob', '20000.5', '10000.5', '5000.5', null, '0');
INSERT INTO `host` VALUES ('16', '49', 'bob', '20000.5', '10000.5', '5000.5', null, '0');
INSERT INTO `host` VALUES ('17', '50', 'bob', '20000.5', '10000.5', '5000.5', null, '0');
INSERT INTO `host` VALUES ('18', '54', 'bob', '20000.5', '10000.5', '5000.5', null, '0');

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
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8;

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
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of laundry
-- ----------------------------
INSERT INTO `laundry` VALUES ('1', '2017-05-02', 'W33-3', '1', 'Ada', '[]', '[]', null, null, null, null, null);
INSERT INTO `laundry` VALUES ('2', '2017-05-04', 'W2-1', '3', 'Tom', '[]', '[]', null, null, null, null, null);
INSERT INTO `laundry` VALUES ('3', '2017-05-17', 'W10-3', '47', 'Ada3', '[]', '[]', null, null, null, null, null);
INSERT INTO `laundry` VALUES ('4', '2017-05-09', 'W11-1', '49', 'Ada5', '[]', '[]', null, null, null, null, null);
INSERT INTO `laundry` VALUES ('5', '2017-04-12', 'W6-1', '59', 'aaa', '[{\"count\":4,\"name\":\"西服上衣\",\"mode\":\"单熨\"}]', '[]', null, null, null, null, null);
INSERT INTO `laundry` VALUES ('6', '2017-05-11', 'W7-3', '60', 'abc', '[{\"count\":2,\"name\":\"短裤\",\"mode\":\"干洗\"},{\"count\":4,\"name\":\"西服上衣\",\"mode\":\"单熨\"}]', '[]', null, null, null, null, null);
INSERT INTO `laundry` VALUES ('7', '2017-03-09', 'W1-3', '50', '测', '[{\"count\":2,\"name\":\"短裤\",\"mode\":\"干洗\"}]', '[{\"price\":5,\"count\":1,\"name\":\"袜子\",\"mode\":\"水洗\"}]', null, null, null, null, null);
INSERT INTO `laundry` VALUES ('10', '2017-04-27', 'W33-3', '1', 'Ada', '[{\"count\":16,\"name\":\"短裤\",\"mode\":\"干洗\"},{\"count\":32,\"name\":\"西服上衣\",\"mode\":\"单熨\"},{\"count\":160,\"name\":\"羽绒服\",\"mode\":\"水洗\"},{\"count\":45,\"name\":\"帽子\",\"mode\":\"水洗\"}]', '[{\"price\":20,\"count\":1,\"name\":\"袜子\",\"mode\":\"水洗\"},{\"price\":10,\"count\":15,\"name\":\"儿童服\",\"mode\":\"干洗\"},{\"price\":15,\"count\":30,\"name\":\"运动衣\",\"mode\":\"水洗\"},{\"price\":13,\"count\":150,\"name\":\"户外服\",\"mode\":\"单熨\"},{\"price\":5,\"count\":15,\"name\":\"袜子\",\"mode\":\"水洗\"}]', '464', '8000', null, null, null);

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of maintain
-- ----------------------------

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of meal
-- ----------------------------

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
  PRIMARY KEY (`ID`),
  UNIQUE KEY `NAME` (`NAME`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan
-- ----------------------------
INSERT INTO `plan` VALUES ('10', '2016-11-29采购冰箱9089', '2017-03-17 03:45:22', '0', 'Alice', '无', '1');
INSERT INTO `plan` VALUES ('11', '2016-11-29????', '2017-04-27 13:40:03', '0', 'Alice', '?', null);
INSERT INTO `plan` VALUES ('12', null, null, null, null, null, '1');
INSERT INTO `plan` VALUES ('13', null, null, null, null, null, '1');
INSERT INTO `plan` VALUES ('14', null, null, null, null, null, '1');
INSERT INTO `plan` VALUES ('15', '2016-11-29采购冰箱', '2017-05-09 14:18:55', '1.52', 'Alice', '无', null);

-- ----------------------------
-- Table structure for `plan_detail`
-- ----------------------------
DROP TABLE IF EXISTS `plan_detail`;
CREATE TABLE `plan_detail` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `PLAN_ID` int(11) DEFAULT NULL,
  `FAC_ID` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `ALREADY` int(11) DEFAULT NULL,
  `ALL_MONEY` double DEFAULT NULL,
  `COMMENT` varchar(64) DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `PLAN_ID` (`PLAN_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_detail
-- ----------------------------
INSERT INTO `plan_detail` VALUES ('1', '15', '1', '10', '0', '1.52', '无', null);

-- ----------------------------
-- Table structure for `plan_progress`
-- ----------------------------
DROP TABLE IF EXISTS `plan_progress`;
CREATE TABLE `plan_progress` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `TIME` datetime DEFAULT NULL,
  `PLAN_ID` int(11) DEFAULT NULL,
  `FAC_ID` int(11) DEFAULT NULL,
  `TERM` int(11) DEFAULT NULL,
  `TOTAL` int(11) DEFAULT NULL,
  `STAFF` varchar(64) DEFAULT NULL,
  `ALL_MONEY` double DEFAULT NULL,
  `COMMENT` varchar(64) DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `PLAN_ID` (`PLAN_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of plan_progress
-- ----------------------------

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
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ROOM_NUMBER` (`ROOM_NUMBER`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room
-- ----------------------------
INSERT INTO `room` VALUES ('1', 'W2-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('2', 'W2-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('3', 'W2-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('4', 'W3-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('5', 'W3-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('6', 'W3-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('7', 'W3-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('8', 'W4-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('9', 'W4-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('10', 'W4-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('11', 'W4-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('12', 'W5-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('13', 'W5-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('14', 'W5-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('15', 'W5-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('16', 'W6-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('17', 'W6-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('18', 'W6-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('19', 'W6-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('20', 'W7-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('21', 'W7-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('22', 'W7-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('23', 'W7-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('24', 'W8-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('25', 'W8-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('26', 'W8-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('27', 'W8-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('28', 'W9-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('29', 'W9-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('30', 'W9-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('31', 'W9-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('32', 'W10-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('33', 'W10-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('34', 'W10-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('35', 'W10-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('36', 'W11-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('37', 'W11-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('38', 'W11-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('39', 'W11-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('40', 'W12-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('41', 'W12-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('42', 'W12-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('43', 'W12-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('44', 'W13-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('45', 'W13-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('46', 'W13-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('47', 'W13-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('48', 'W14-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('49', 'W14-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('50', 'W14-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('51', 'W14-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('52', 'W15-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('53', 'W15-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('54', 'W15-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('55', 'W15-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('56', 'W16-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('57', 'W16-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('58', 'W16-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('59', 'W16-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('60', 'W17-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('61', 'W17-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('62', 'W17-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('63', 'W17-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('64', 'W18-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('65', 'W18-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('66', 'W18-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('67', 'W18-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('68', 'W19-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('69', 'W19-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('70', 'W19-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('71', 'W19-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('72', 'W20-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('73', 'W20-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('74', 'W20-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('75', 'W20-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('76', 'W21-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('77', 'W21-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('78', 'W21-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('79', 'W21-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('80', 'W22-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('81', 'W22-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('82', 'W22-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('83', 'W22-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('84', 'W23-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('85', 'W23-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('86', 'W23-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('87', 'W23-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('88', 'W24-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('89', 'W24-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('90', 'W24-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('91', 'W24-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('92', 'W25-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('93', 'W25-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('94', 'W25-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('95', 'W26-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('96', 'W26-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('97', 'W26-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('98', 'W27-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('99', 'W27-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('100', 'W27-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('101', 'W28-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('102', 'W28-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('103', 'W28-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('104', 'W29-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('105', 'W29-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('106', 'W29-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('107', 'W30-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('108', 'W30-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('109', 'W30-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('110', 'W31-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('111', 'W31-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('112', 'W31-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('113', 'W32-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('114', 'W32-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('115', 'W32-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('116', 'W33-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('117', 'W33-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('118', 'W33-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('119', 'W34-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('120', 'W34-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('121', 'W34-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('122', 'W35-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('123', 'W35-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('124', 'E2-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('125', 'E2-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('126', 'E2-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('127', 'E2-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('128', 'E3-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('129', 'E3-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('130', 'E3-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('131', 'E3-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('132', 'E3-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('133', 'E4-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('134', 'E4-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('135', 'E4-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('136', 'E4-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('137', 'E4-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('138', 'E5-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('139', 'E5-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('140', 'E5-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('141', 'E5-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('142', 'E5-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('143', 'E6-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('144', 'E6-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('145', 'E6-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('146', 'E6-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('147', 'E6-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('148', 'E7-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('149', 'E7-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('150', 'E7-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('151', 'E7-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('152', 'E7-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('153', 'E8-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('154', 'E8-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('155', 'E8-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('156', 'E8-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('157', 'E8-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('158', 'E9-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('159', 'E9-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('160', 'E9-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('161', 'E9-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('162', 'E9-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('163', 'E10-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('164', 'E10-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('165', 'E10-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('166', 'E10-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('167', 'E10-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('168', 'E11-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('169', 'E11-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('170', 'E11-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('171', 'E11-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('172', 'E11-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('173', 'E12-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('174', 'E12-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('175', 'E12-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('176', 'E12-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('177', 'E12-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('178', 'E13-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('179', 'E13-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('180', 'E13-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('181', 'E13-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('182', 'E13-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('183', 'E14-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('184', 'E14-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('185', 'E14-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('186', 'E14-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('187', 'E14-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('188', 'E15-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('189', 'E15-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('190', 'E15-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('191', 'E15-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('192', 'E15-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('193', 'E16-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('194', 'E16-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('195', 'E16-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('196', 'E16-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('197', 'E16-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('198', 'E17-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('199', 'E17-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('200', 'E17-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('201', 'E17-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('202', 'E17-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('203', 'E18-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('204', 'E18-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('205', 'E18-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('206', 'E18-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('207', 'E18-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('208', 'E19-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('209', 'E19-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('210', 'E19-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('211', 'E19-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('212', 'E19-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('213', 'E20-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('214', 'E20-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('215', 'E20-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('216', 'E20-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('217', 'E20-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('218', 'E21-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('219', 'E21-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('220', 'E21-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('221', 'E21-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('222', 'E21-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('223', 'E22-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('224', 'E22-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('225', 'E22-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('226', 'E22-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('227', 'E22-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('228', 'E23-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('229', 'E23-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('230', 'E23-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('231', 'E23-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('232', 'E23-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('233', 'E24-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('234', 'E24-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('235', 'E24-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('236', 'E24-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('237', 'E24-6', null, null, null, null, null);
INSERT INTO `room` VALUES ('238', 'E25-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('239', 'E25-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('240', 'E25-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('241', 'E25-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('242', 'E26-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('243', 'E26-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('244', 'E26-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('245', 'E26-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('246', 'E27-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('247', 'E27-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('248', 'E27-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('249', 'E27-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('250', 'E28-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('251', 'E28-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('252', 'E28-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('253', 'E28-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('254', 'E29-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('255', 'E29-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('256', 'E29-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('257', 'E29-5', null, null, null, null, null);
INSERT INTO `room` VALUES ('258', 'E30-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('259', 'E30-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('260', 'E30-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('261', 'E31-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('262', 'E31-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('263', 'E31-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('264', 'E32-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('265', 'E32-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('266', 'E32-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('267', 'E33-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('268', 'E33-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('269', 'E33-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('270', 'E34-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('271', 'E34-2', null, null, null, null, null);
INSERT INTO `room` VALUES ('272', 'E34-3', null, null, null, null, null);
INSERT INTO `room` VALUES ('273', 'E35-1', null, null, null, null, null);
INSERT INTO `room` VALUES ('274', 'E35-2', null, null, null, null, null);

-- ----------------------------
-- Table structure for `room_item`
-- ----------------------------
DROP TABLE IF EXISTS `room_item`;
CREATE TABLE `room_item` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_ID` int(11) DEFAULT NULL,
  `ITEM_ID` int(11) DEFAULT NULL,
  `TYPE` varchar(64) DEFAULT NULL,
  `TAG` varchar(64) DEFAULT NULL,
  `COMM` varchar(64) DEFAULT NULL,
  `STATE` int(11) DEFAULT NULL,
  PRIMARY KEY (`ID`),
  KEY `ROOM_ID` (`ROOM_ID`),
  KEY `ITEM_ID` (`ITEM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_item
-- ----------------------------
INSERT INTO `room_item` VALUES ('3', '119', '1', null, '123', '无', '0');

-- ----------------------------
-- Table structure for `room_meter`
-- ----------------------------
DROP TABLE IF EXISTS `room_meter`;
CREATE TABLE `room_meter` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_ID` int(11) DEFAULT NULL,
  `TYPE` int(10) unsigned DEFAULT NULL,
  `METER_NUMBER` varchar(64) DEFAULT NULL,
  `YEAR_INIT_VAL` double DEFAULT NULL,
  `LAST_MONTH_VAL` double DEFAULT NULL,
  `CUR_VAL` double DEFAULT NULL,
  `CUR_TIME` date DEFAULT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `METER_NUMBER` (`METER_NUMBER`),
  KEY `ROOM_ID` (`ROOM_ID`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_meter
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_pic
-- ----------------------------
INSERT INTO `room_pic` VALUES ('2', '116', '1', null, '1', '1', '/resources/room_pic/1.jpg');
INSERT INTO `room_pic` VALUES ('3', '117', '1', null, '1', '1', '/resources/room_pic/DSC_0035.JPG');

-- ----------------------------
-- Table structure for `room_state`
-- ----------------------------
DROP TABLE IF EXISTS `room_state`;
CREATE TABLE `room_state` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUMBER` varchar(64) NOT NULL,
  `CUS_ID` int(11) DEFAULT NULL,
  `CUS_NAME` varchar(64) DEFAULT NULL,
  `STATE` int(11) DEFAULT '0',
  `ROOM_ID` int(11) NOT NULL,
  PRIMARY KEY (`ID`),
  UNIQUE KEY `ROOM_NUMBER` (`ROOM_NUMBER`),
  UNIQUE KEY `ROOM_ID` (`ROOM_ID`)
) ENGINE=InnoDB AUTO_INCREMENT=275 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of room_state
-- ----------------------------
INSERT INTO `room_state` VALUES ('1', 'W2-1', '3', 'Tom', '1', '1');
INSERT INTO `room_state` VALUES ('2', 'W2-2', null, null, '0', '2');
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
INSERT INTO `room_state` VALUES ('22', 'W7-3', null, null, '0', '22');
INSERT INTO `room_state` VALUES ('23', 'W7-5', null, null, '0', '23');
INSERT INTO `room_state` VALUES ('24', 'W8-1', null, null, '0', '24');
INSERT INTO `room_state` VALUES ('25', 'W8-2', null, null, '0', '25');
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
INSERT INTO `room_state` VALUES ('38', 'W11-3', null, null, '0', '38');
INSERT INTO `room_state` VALUES ('39', 'W11-5', null, null, '0', '39');
INSERT INTO `room_state` VALUES ('40', 'W12-1', null, null, '0', '40');
INSERT INTO `room_state` VALUES ('41', 'W12-2', null, null, '0', '41');
INSERT INTO `room_state` VALUES ('42', 'W12-3', null, null, '0', '42');
INSERT INTO `room_state` VALUES ('43', 'W12-5', null, null, '0', '43');
INSERT INTO `room_state` VALUES ('44', 'W13-1', null, null, '0', '44');
INSERT INTO `room_state` VALUES ('45', 'W13-2', null, null, '0', '45');
INSERT INTO `room_state` VALUES ('46', 'W13-3', null, null, '0', '46');
INSERT INTO `room_state` VALUES ('47', 'W13-5', null, null, '0', '47');
INSERT INTO `room_state` VALUES ('48', 'W14-1', null, null, '0', '48');
INSERT INTO `room_state` VALUES ('49', 'W14-2', null, null, '0', '49');
INSERT INTO `room_state` VALUES ('50', 'W14-3', null, null, '0', '50');
INSERT INTO `room_state` VALUES ('51', 'W14-5', null, null, '0', '51');
INSERT INTO `room_state` VALUES ('52', 'W15-1', null, null, '0', '52');
INSERT INTO `room_state` VALUES ('53', 'W15-2', null, null, '0', '53');
INSERT INTO `room_state` VALUES ('54', 'W15-3', null, null, '0', '54');
INSERT INTO `room_state` VALUES ('55', 'W15-5', null, null, '0', '55');
INSERT INTO `room_state` VALUES ('56', 'W16-1', null, null, '0', '56');
INSERT INTO `room_state` VALUES ('57', 'W16-2', null, null, '0', '57');
INSERT INTO `room_state` VALUES ('58', 'W16-3', null, null, '0', '58');
INSERT INTO `room_state` VALUES ('59', 'W16-5', null, null, '0', '59');
INSERT INTO `room_state` VALUES ('60', 'W17-1', null, null, '0', '60');
INSERT INTO `room_state` VALUES ('61', 'W17-2', null, null, '0', '61');
INSERT INTO `room_state` VALUES ('62', 'W17-3', null, null, '0', '62');
INSERT INTO `room_state` VALUES ('63', 'W17-5', null, null, '0', '63');
INSERT INTO `room_state` VALUES ('64', 'W18-1', null, null, '0', '64');
INSERT INTO `room_state` VALUES ('65', 'W18-2', null, null, '0', '65');
INSERT INTO `room_state` VALUES ('66', 'W18-3', null, null, '0', '66');
INSERT INTO `room_state` VALUES ('67', 'W18-5', null, null, '0', '67');
INSERT INTO `room_state` VALUES ('68', 'W19-1', null, null, '0', '68');
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
INSERT INTO `room_state` VALUES ('88', 'W24-1', null, null, '0', '88');
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
INSERT INTO `room_state` VALUES ('100', 'W27-3', null, null, '0', '100');
INSERT INTO `room_state` VALUES ('101', 'W28-1', null, null, '0', '101');
INSERT INTO `room_state` VALUES ('102', 'W28-2', null, null, '0', '102');
INSERT INTO `room_state` VALUES ('103', 'W28-3', null, null, '0', '103');
INSERT INTO `room_state` VALUES ('104', 'W29-1', null, null, '0', '104');
INSERT INTO `room_state` VALUES ('105', 'W29-2', null, null, '0', '105');
INSERT INTO `room_state` VALUES ('106', 'W29-3', null, null, '0', '106');
INSERT INTO `room_state` VALUES ('107', 'W30-1', null, null, '0', '107');
INSERT INTO `room_state` VALUES ('108', 'W30-2', null, null, '0', '108');
INSERT INTO `room_state` VALUES ('109', 'W30-3', null, null, '0', '109');
INSERT INTO `room_state` VALUES ('110', 'W31-1', null, null, '0', '110');
INSERT INTO `room_state` VALUES ('111', 'W31-2', null, null, '0', '111');
INSERT INTO `room_state` VALUES ('112', 'W31-3', null, null, '0', '112');
INSERT INTO `room_state` VALUES ('113', 'W32-1', '31', 'alice1', '1', '113');
INSERT INTO `room_state` VALUES ('114', 'W32-2', null, null, '0', '114');
INSERT INTO `room_state` VALUES ('115', 'W32-3', null, null, '0', '115');
INSERT INTO `room_state` VALUES ('116', 'W33-1', '25', 'Ada', '1', '116');
INSERT INTO `room_state` VALUES ('117', 'W33-2', '54', 'Ada', '1', '117');
INSERT INTO `room_state` VALUES ('118', 'W33-3', '50', '测', '1', '118');
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shoes_polishing
-- ----------------------------

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
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of shuttle_bus
-- ----------------------------
INSERT INTO `shuttle_bus` VALUES ('1', '2017', '3', 'W32-1', '2', 'Alice1', '张三，李四，王五', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '9', '2017-04-12 12:38:49', '2017-05-15 12:38:53', '2017-06-28 12:38:55');
INSERT INTO `shuttle_bus` VALUES ('10', '2017', '5', 'W33-3', '1', 'Ada', '钱六，李明，王小虎，zzzz，姚陈堃', '0', '0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '14', '140', '2017-02-15 12:38:59', '2017-05-29 12:39:23', '2017-05-12 13:21:43');
INSERT INTO `shuttle_bus` VALUES ('29', '2017', '5', 'W7-3', '50', '测', '李逍遥，赵灵儿', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '1', '0', '1', '0', '0', '5', '50', '2017-05-24 12:39:03', '2017-04-25 12:39:25', '2017-05-12 13:14:13');
INSERT INTO `shuttle_bus` VALUES ('30', '2017', '5', 'W2-1', '3', 'Tom', '林月如，阿奴', '0', '0', '1', '1', '0', '0', '0', '0', '1', '1', '1', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '9', '99', '2017-05-24 12:39:07', '2017-05-25 12:39:29', '2017-03-22 12:39:43');
INSERT INTO `shuttle_bus` VALUES ('31', '2017', '5', 'W6-1', '59', 'aaa', '景天，雪见', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '2', '20', '2017-02-22 12:39:10', '2017-03-15 12:39:33', '2017-02-21 12:39:46');
INSERT INTO `shuttle_bus` VALUES ('34', '2017', '5', 'W33-2', '54', 'Ada', '云天河，柳梦璃', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0', '7', '70', '2015-11-15 12:39:15', '2017-03-07 12:39:36', '2017-05-12 12:01:09');
INSERT INTO `shuttle_bus` VALUES ('39', '2017', '5', 'W33-3', '58', 'Alice2', '陈靖仇', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1', '1', '1', '0', '0', '9', '90', '2017-05-01 00:00:00', '2017-05-12 11:58:10', '2017-05-12 12:31:02');

-- ----------------------------
-- Table structure for `sources`
-- ----------------------------
DROP TABLE IF EXISTS `sources`;
CREATE TABLE `sources` (
  `ID` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `ROOM_NUMBER` varchar(64) DEFAULT NULL,
  `GUEST_ID` int(11) DEFAULT NULL,
  `GUEST_NAME` varchar(64) DEFAULT NULL,
  `TIME` datetime DEFAULT NULL,
  `TYPE` int(11) DEFAULT NULL,
  `METER` varchar(64) DEFAULT NULL,
  `LAST_DATA` double DEFAULT NULL,
  `CURRENT_DATA` double DEFAULT NULL,
  `COUNT` double DEFAULT NULL,
  `MONEY` double DEFAULT NULL,
  `SYS_STATE` int(11) DEFAULT '1',
  PRIMARY KEY (`ID`),
  KEY `ROOM_NUMBER` (`ROOM_NUMBER`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of sources
-- ----------------------------

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
INSERT INTO `staff` VALUES ('2', 'lucy', '点餐', '客服部', '2017-05-25', '1');
INSERT INTO `staff` VALUES ('3', 'andy', '点餐', '客服部', '2017-05-25', '1');
INSERT INTO `staff` VALUES ('4', 'andrew', '洗衣', '客服部', '2017-05-25', '1');

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
  PRIMARY KEY (`ID`),
  UNIQUE KEY `USERNAME` (`USERNAME`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of user
-- ----------------------------
INSERT INTO `user` VALUES ('1', 'BUPTADMIN', 'e10adc3949ba59abbe56e057f20f883e', 'BUPTADMIN', 'SYS_001', '???', '0', '262143', '2016-10-08', '2017-05-11', '1');
INSERT INTO `user` VALUES ('2', 'test', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_001', '???', '1', '262143', '2016-10-08', '2017-05-12', '1');
INSERT INTO `user` VALUES ('10', '王二', 'e10adc3949ba59abbe56e057f20f883e', '王二', '王二', '财务部', '1', '262143', '2017-03-17', '2017-03-17', '1');
INSERT INTO `user` VALUES ('11', 'test8', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_', '客房部', '1', '262143', '2017-03-28', '2017-03-28', '1');
INSERT INTO `user` VALUES ('12', 'testr345', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_', '客房部', '0', '262143', '2017-03-29', '2017-03-29', '1');
INSERT INTO `user` VALUES ('14', 'test12312', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_', '客房部', '0', '262143', '2017-04-24', '2017-04-24', '1');
