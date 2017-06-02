/*
 Navicat MySQL Data Transfer

 Source Server         : localhost
 Source Server Type    : MySQL
 Source Server Version : 50718
 Source Host           : localhost
 Source Database       : ld

 Target Server Type    : MySQL
 Target Server Version : 50718
 File Encoding         : utf-8

 Date: 06/03/2017 00:04:23 AM
*/

SET NAMES utf8;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
--  Table structure for `agent_purchase`
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
--  Table structure for `contract_income`
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
--  Table structure for `daily_service`
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
--  Table structure for `drinking_water`
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
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `drinking_water`
-- ----------------------------
BEGIN;
INSERT INTO `drinking_water` VALUES ('1', 'W11-1', '49', 'Ada5', '0', '0', '0', '10', '3', '-3', '0', '2', '6', '1', '', null, null, '2017-05-27 00:00:00', '2017-05-27 10:58:43', '2017-05-27 10:59:37'), ('2', 'W33-3', '1', 'Ada', '0', '0', '0', '10', '2', '-2', '0', '32', '64', '0', 'haha', null, null, '2017-05-27 00:00:00', '2017-05-27 11:00:14', '2017-05-27 11:00:14'), ('3', 'W11-1', '49', 'Ada5', '4', '-4', '0', '10', '0', '-3', '0', '0', '46', '0', '', null, null, '2017-05-27 00:00:00', '2017-05-27 11:00:43', '2017-05-27 11:00:43');
COMMIT;

-- ----------------------------
--  Table structure for `fac_sta`
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
--  Records of `fac_sta`
-- ----------------------------
BEGIN;
INSERT INTO `fac_sta` VALUES ('78', '家电', '空调', '海尔', 'GT双开门冰箱', 'LE固定资产', null, 'R3-2', '7', '0', '5', '2', '0', '无'), ('79', '家电', '电视', '格力', 'GT双开门冰箱', 'LE固定资产', null, 'R8-8', '0', '0', '0', '0', '0', '无'), ('80', '家电', '空调', '海尔', 'GT双开门冰箱', 'LE固定资产', null, 'R8-8', '0', '0', '0', '0', '0', '无'), ('85', '家电', '空调', '海尔', 'GT双开门冰箱', 'LE固定资产', null, 'R5-6', '1', '1', '0', '0', '0', '无'), ('86', '家电', '空调', '海尔', 'GT双开门冰箱', 'LE管理资产(SPC)', null, 'R7-8', '3', '3', '0', '0', '0', '无'), ('87', '家电', '空调', '海尔', 'GT双开门冰箱', 'LE固定资产', null, 'R1-1', '5', '5', '0', '0', '0', '无'), ('88', '家电', '空调', '海尔', 'GT双开门冰箱', 'LE固定资产', null, 'R7-8', '1', '1', '0', '0', '0', '无'), ('89', '家具', '沙发', '皇朝', 'GT双开门冰箱', 'LE固定资产', null, 'R3-2', '7', '0', '7', '0', '0', '无'), ('90', '备品', '床单', '多喜爱', '床单', 'LE管理资产(小业主)', null, 'R3-2', '7', '0', '3', '4', '0', '无'), ('91', '备品', '床单', '多喜爱', '多喜爱床单', 'LE管理资产(SPC)', null, 'R8-8', '10', '5', '2', '2', '1', '无');
COMMIT;

-- ----------------------------
--  Table structure for `flight_picking`
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
--  Records of `flight_picking`
-- ----------------------------
BEGIN;
INSERT INTO `flight_picking` VALUES ('1', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '?XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('2', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('3', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('4', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('5', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('6', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('7', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('8', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('9', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('10', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('11', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('12', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('13', '2017-04-27', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('20', '2017-04-27', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('21', '2017-04-27', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('22', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('23', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('24', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('25', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('26', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('27', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('28', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('29', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('30', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('31', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('32', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('33', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('34', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('35', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('36', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('37', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('38', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('39', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('40', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('41', '2017-04-28', 'W31-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('42', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('43', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('44', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('45', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('46', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('47', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('48', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('49', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('50', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('51', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('52', '2017-04-28', 'W33-3', 'yck', 'welcome', 'ZXY-3091', '京XXXXX', 'ken', '13980823993', 'tom', '15122707970', null, null, null), ('55', '2017-05-19', 'W35-1', 'Alice', 'farewell', 'CA1344', 'S12345', 'Tom', '13980823993', 'Bob', '84523892', '2017-05-19 00:00:00', null, '2017-05-13 14:39:25'), ('56', '2017-05-27', 'W35-1', 'YaoChenKun', 'farewell', 'CA13441', 'S123451', 'Tom', '13980823993', 'Bob', '15122707970', '2017-05-27 00:00:00', '2017-05-12 16:50:15', '2017-05-12 22:01:24'), ('57', '2017-05-12', 'W35-1', 'Alice', 'farewell', 'CA1344', 'S12345', 'Tom', '13980823993', 'Bob', '12345678910', '2017-05-12 00:00:00', '2017-05-12 16:51:52', '2017-05-12 16:51:52'), ('60', '2017-05-12', 'W22-2', 'Ken', 'farewell', 'CA1344', 'S12345', 'Tom', '13980823993', 'Bob', '12345678910', '2017-05-12 00:00:00', '2017-05-12 18:13:42', '2017-05-12 22:01:32'), ('61', '2017-05-19', 'W35-1', 'Alice', 'welcome', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-19 00:00:00', '2017-05-13 14:38:57', '2017-05-13 14:39:50'), ('62', '2017-05-17', 'W35-1', 'Alice', 'welcome', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-17 00:00:00', '2017-05-13 15:02:14', '2017-05-13 15:02:14'), ('63', '2017-05-12', 'W35-1', 'Alice', 'welcome', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-12 00:00:00', '2017-05-16 11:56:33', '2017-05-16 11:56:33'), ('64', '2017-05-16', 'W7-3', '测', 'farewell', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-16 00:00:00', '2017-05-16 11:56:52', '2017-05-16 16:12:19'), ('65', '2017-05-12', 'W35-1', 'Alice2', 'welcome', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-12 00:00:00', '2017-05-16 11:57:01', '2017-05-16 11:57:01'), ('66', '2017-05-16', 'W33-3', 'Ada', 'welcome', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-16 00:00:00', '2017-05-16 11:57:11', '2017-05-16 16:10:12'), ('67', '2017-05-12', 'W35-1', 'Alice34', 'farewell', 'CA1344', 'S12345', 'Tom', '12345678910', 'Bob', '12345678910', '2017-05-12 00:00:00', '2017-05-16 11:57:38', '2017-05-16 11:57:38'), ('69', '2017-05-16', 'W33-2', 'Ada', 'farewell', '', '', '', '1', '', '2', '2017-05-16 00:00:00', '2017-05-16 16:12:43', '2017-05-16 16:14:39'), ('70', '2017-05-25', 'W11-1', 'Ada5', 'welcome', '1', '2', '3', '4', '5', '7', '2017-05-25 00:00:00', '2017-05-25 15:27:15', '2017-05-25 15:27:26');
COMMIT;

-- ----------------------------
--  Table structure for `grocery_item`
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
--  Records of `grocery_item`
-- ----------------------------
BEGIN;
INSERT INTO `grocery_item` VALUES ('10', '????2', '??', '??', '52', null, null, null, '52', '10', '12');
COMMIT;

-- ----------------------------
--  Table structure for `grocery_running`
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
--  Records of `grocery_running`
-- ----------------------------
BEGIN;
INSERT INTO `grocery_running` VALUES ('1', '2017-03-14 11:48:12', '1', '2', '10', '20', '1', '1'), ('2', '2017-03-14 11:48:17', '1', '2', '10', '20', '1', '1'), ('3', '2017-03-14 11:48:21', '1', '2', '12', '24', '2', '1'), ('4', '2017-03-14 11:48:25', '1', '2', '10', '20', '3', '1'), ('5', '2017-03-14 11:48:34', '1', '2', '12', '24', '2', '1'), ('6', '2017-03-14 11:48:39', '1', '2', '10', '20', '3', '1'), ('7', '2017-03-16 21:22:16', '1', '2', '12', '24', '2', '1'), ('8', '2017-04-27 13:36:29', '10', '2', '12', '24', '2', null), ('9', '2017-04-27 13:36:33', '10', '2', '10', '20', '1', null), ('10', '2017-04-27 13:36:48', '10', '2', '10', '20', '3', null);
COMMIT;

-- ----------------------------
--  Table structure for `guest`
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
--  Records of `guest`
-- ----------------------------
BEGIN;
INSERT INTO `guest` VALUES ('1', 'Ada', 'W33-3', null, 'S131', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0'), ('2', 'Alice1', 'W32-1', null, 'S132', '13581818112', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0'), ('3', 'Tom', 'W2-1', null, 'S12', '13581818112', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0'), ('47', 'Ada3', 'W10-3', null, 'S1313', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0'), ('49', 'Ada5', 'W11-1', null, 'S1311', '13581818113', 'Amazon', '主管', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0'), ('50', '测', 'W7-3', null, 'S020', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0'), ('54', 'Ada', 'W33-2', null, 'S142', '13581818113', 'Amazon', '经理', '2', '0', 'T3', null, '无', '15000.5', '2016-11-11 00:00:00', '2017-11-11 00:00:00', '0'), ('57', 'Alexa', 'W33-3', null, null, null, null, null, null, null, null, null, null, null, null, null, '1'), ('58', 'Alice2', 'W33-3', null, null, null, null, null, null, null, null, null, null, null, null, null, '1'), ('59', 'aaa', 'W6-1', null, null, null, null, null, null, null, null, null, null, null, null, null, '0'), ('60', 'abc', 'W26-3', null, null, null, null, null, null, null, null, null, null, null, null, null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `guest_balance`
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
--  Records of `guest_balance`
-- ----------------------------
BEGIN;
INSERT INTO `guest_balance` VALUES ('1', '1', 'W33-3', '20', '30', '现金', '1', '30', '4', '30', '30', '0'), ('2', '2', 'W32-1', '20', '30', '现金', '1', '30', '4', '30', '30', '0'), ('3', '3', 'W2-1', '20', '30', '现金', '1', '30', '4', '30', '30', '0'), ('28', '47', 'W33-3', '20', '30', '现金', '1', '30', '4', '30', '30', '0'), ('29', '49', 'W33-3', '20', '30', '现金', '1', '30', '4', '30', '30', '0'), ('30', '50', 'W33-3', '20', '30', '现金', '1', '30', '4', '30', '30', '0'), ('31', '54', 'W33-2', '20', '30', '现金', '1', '30', '4', '30', '30', '0');
COMMIT;

-- ----------------------------
--  Table structure for `guest_service`
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
--  Records of `guest_service`
-- ----------------------------
BEGIN;
INSERT INTO `guest_service` VALUES ('1', '1', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('2', '1', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('3', '1', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7'), ('4', '1', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('5', '1', 'W33-3', 'water', '1000', '1', '1000', null, '1', '无', '0', '9'), ('6', '1', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9'), ('7', '1', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('8', '1', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('9', '1', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('10', '1', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('11', '1', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('12', '2', 'W32-1', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('13', '2', 'W32-1', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('14', '2', 'W32-1', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7'), ('15', '2', 'W32-1', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('16', '2', 'W32-1', 'water', '1000', '1', '1000', null, '1', '无', '0', '9'), ('17', '2', 'W32-1', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9'), ('18', '2', 'W32-1', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('19', '2', 'W32-1', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('20', '2', 'W32-1', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('21', '2', 'W32-1', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('22', '2', 'W32-1', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('23', '3', 'W2-1', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('24', '3', 'W2-1', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('25', '3', 'W2-1', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7'), ('26', '3', 'W2-1', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('27', '3', 'W2-1', 'water', '1000', '1', '1000', null, '1', '无', '0', '9'), ('28', '3', 'W2-1', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9'), ('29', '3', 'W2-1', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('30', '3', 'W2-1', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('31', '3', 'W2-1', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('32', '3', 'W2-1', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('33', '3', 'W2-1', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('309', '47', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('310', '47', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('311', '47', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7'), ('312', '47', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('313', '47', 'W33-3', 'water', '1000', '1', '1000', null, '1', '无', '0', '9'), ('314', '47', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9'), ('315', '47', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('316', '47', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('317', '47', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('318', '47', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('319', '47', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('320', '49', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('321', '49', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('322', '49', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7'), ('323', '49', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('324', '49', 'W33-3', 'water', '1000', '1', '1000', null, '1', '无', '0', '9'), ('325', '49', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9'), ('326', '49', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('327', '49', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('328', '49', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('329', '49', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('330', '49', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('331', '50', 'W33-3', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('332', '50', 'W33-3', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('333', '50', 'W33-3', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7'), ('334', '50', 'W33-3', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('335', '50', 'W33-3', 'water', '1000', '1', '1000', null, '1', '无', '0', '9'), ('336', '50', 'W33-3', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9'), ('337', '50', 'W33-3', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('338', '50', 'W33-3', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('339', '50', 'W33-3', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('340', '50', 'W33-3', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('341', '50', 'W33-3', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('342', '54', 'W33-2', 'newspaper', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('343', '54', 'W33-2', 'tv', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('344', '54', 'W33-2', 'resource', '1000.5', '1', '1000.2', '1', '1', '无', '0', '7'), ('345', '54', 'W33-2', 'break', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('346', '54', 'W33-2', 'water', '1000', '1', '1000', null, '1', '无', '0', '9'), ('347', '54', 'W33-2', 'Int', '1000.5', '1', '1000', '1', '1', '无', '0', '9'), ('348', '54', 'W33-2', 'daily', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('349', '54', 'W33-2', 'breakfast', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('350', '54', 'W33-2', 'park', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('351', '54', 'W33-2', 'cloth', '1000', '1', '1000', '1', '1', '无', '0', '9'), ('352', '54', 'W33-2', 'shopping', '1000', '1', '1000', '1', '1', '无', '0', '9');
COMMIT;

-- ----------------------------
--  Table structure for `host`
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
--  Records of `host`
-- ----------------------------
BEGIN;
INSERT INTO `host` VALUES ('1', '1', 'bob', '20000.5', '10000.5', '5000.5', null, '0'), ('2', '2', 'bob', '20000.5', '10000.5', '5000.5', null, '0'), ('3', '3', 'bob', '20000.5', '10000.5', '5000.5', null, '0'), ('15', '47', 'bob', '20000.5', '10000.5', '5000.5', null, '0'), ('16', '49', 'bob', '20000.5', '10000.5', '5000.5', null, '0'), ('17', '50', 'bob', '20000.5', '10000.5', '5000.5', null, '0'), ('18', '54', 'bob', '20000.5', '10000.5', '5000.5', null, '0');
COMMIT;

-- ----------------------------
--  Table structure for `income`
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
--  Table structure for `intern`
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
--  Records of `intern`
-- ----------------------------
BEGIN;
INSERT INTO `intern` VALUES ('1', '1', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家'), ('2', '2', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家'), ('3', '3', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家'), ('15', '47', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家'), ('16', '49', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家'), ('17', '50', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家'), ('18', '54', '0.3', '0.26', '0.16', '26000.2', '0.36', '0.26', '0.16', '36000.2', '0', '链家');
COMMIT;

-- ----------------------------
--  Table structure for `invoice`
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
--  Table structure for `invoice_detail`
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
--  Table structure for `laundry`
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `laundry`
-- ----------------------------
BEGIN;
INSERT INTO `laundry` VALUES ('1', '2017-05-02', 'W33-3', '1', 'Ada', '[]', '[]', '0', '0', '2017-06-01 23:51:39', '2017-05-18 23:52:18', '2017-05-31 23:52:21'), ('2', '2017-05-04', 'W2-1', '3', 'Tom', '[]', '[]', '0', '0', '2017-06-07 23:51:47', '2017-05-16 23:52:14', '2017-05-18 23:52:23'), ('3', '2017-04-27', 'W10-3', '47', 'Ada3', '[{\"name\":\"女装衬衫\",\"count\":1,\"mode\":\"水洗\"},{\"name\":\"睡衣\",\"count\":2,\"mode\":\"干洗\"},{\"name\":\"西服上衣\",\"count\":4,\"mode\":\"单熨\"},{\"name\":\"领带\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"围巾\",\"count\":3,\"mode\":\"单熨\"}]', '[{\"name\":\"我的衣服\",\"count\":3,\"mode\":\"干洗\",\"price\":44},{\"name\":\"我的裤子\",\"count\":4,\"mode\":\"干洗\",\"price\":55}]', '18', '505', '2017-04-27 00:00:00', '2017-05-08 23:52:11', '2017-05-15 00:14:50'), ('7', '2017-03-09', 'W1-3', '50', '测', '[{\"count\":2,\"name\":\"短裤\",\"mode\":\"干洗\"}]', '[{\"price\":5,\"count\":1,\"name\":\"袜子\",\"mode\":\"水洗\"}]', '0', '0', '2017-05-24 23:51:54', '2017-05-23 23:52:08', '2017-05-17 23:52:29'), ('11', '2017-05-12', 'W6-1', '59', 'aaa', '[{\"count\":1,\"name\":\"西服上衣\",\"mode\":\"单熨\"},{\"count\":20,\"name\":\"西服裤子\",\"mode\":\"单熨\"},{\"count\":2,\"name\":\"西服马甲\",\"mode\":\"单熨\"},{\"count\":2,\"name\":\"领带\",\"mode\":\"单熨\"},{\"count\":2,\"name\":\"休闲上衣\",\"mode\":\"单熨\"}]', '[]', '27', '222', '2017-05-17 23:52:00', '2017-05-29 23:52:03', '2017-05-06 23:52:34'), ('12', '2017-05-12', 'W7-3', '50', '测', '[{\"count\":2,\"name\":\"西服上衣\",\"mode\":\"单熨\"},{\"count\":2,\"name\":\"西服裤子\",\"mode\":\"单熨\"},{\"count\":2,\"name\":\"西服马甲\",\"mode\":\"单熨\"},{\"count\":1,\"name\":\"领带\",\"mode\":\"单熨\"},{\"count\":1,\"name\":\"休闲上衣\",\"mode\":\"单熨\"},{\"count\":1,\"name\":\"毛衣\",\"mode\":\"单熨\"}]', '[]', '9', '80', '2017-05-12 00:00:00', '2017-05-12 23:34:28', '2017-05-12 23:35:39'), ('24', '2017-05-14', 'W26-3', '60', 'abc', '[{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"水洗\"},{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"干洗\"}]', '[]', '2', '45', '2017-05-14 00:00:00', '2017-05-14 15:56:46', '2017-05-14 15:56:46'), ('25', '2017-05-14', 'W26-3', '60', 'abc', '[{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"水洗\"},{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"干洗\"}]', '[]', '2', '45', '2017-05-14 00:00:00', '2017-05-14 15:56:57', '2017-05-14 15:56:57'), ('27', '2017-05-14', 'W26-3', '60', 'abc', '[{\"name\":\"领带\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"风衣\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"休闲裤\",\"count\":10,\"mode\":\"单熨\"}]', '[]', '13', '120', '2017-05-14 00:00:00', '2017-05-14 15:59:27', '2017-05-14 15:59:27'), ('28', '2017-05-14', 'W26-3', '60', 'abc', '[{\"name\":\"西服裤子\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"毛衣\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"休闲裤\",\"count\":8,\"mode\":\"单熨\"}]', '[]', '11', '90', '2017-05-14 00:00:00', '2017-05-14 16:00:37', '2017-05-14 16:00:37'), ('30', '2017-05-14', 'W26-3', '60', 'abc', '[{\"name\":\"领带\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"毛衣\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"羊绒外套（短）\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '4', '50', '2017-05-14 00:00:00', '2017-05-14 16:03:51', '2017-05-14 16:03:51'), ('31', '2017-05-14', 'W26-3', '60', 'abc', '[{\"name\":\"西服上衣\",\"count\":8,\"mode\":\"干洗\"},{\"name\":\"西服裤子\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '10', '256', '2017-05-14 00:00:00', '2017-05-14 16:04:34', '2017-05-14 16:04:34'), ('32', '2017-05-15', 'W33-3', '1', 'Ada', '[{\"name\":\"背心\",\"count\":5,\"mode\":\"水洗\"},{\"name\":\"休闲上衣\",\"count\":5,\"mode\":\"干洗\"},{\"name\":\"羽绒外套（短）\",\"count\":5,\"mode\":\"干洗\"},{\"name\":\"羊绒外套（中）\",\"count\":3,\"mode\":\"单熨\"}]', '[{\"name\":\"手巾\",\"count\":2,\"mode\":\"水洗\",\"price\":10},{\"name\":\"护甲\",\"count\":2,\"mode\":\"干洗\",\"price\":104},{\"name\":\"护膝\",\"count\":1,\"mode\":\"干洗\",\"price\":43},{\"name\":\"盔甲\",\"count\":3,\"mode\":\"单熨\",\"price\":57}]', '26', '1042', '2017-05-15 00:00:00', '2017-05-15 00:20:55', '2017-05-15 17:41:34'), ('33', '2017-05-16', 'W11-1', '49', 'Ada5', '[{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"干洗\"},{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"干洗\"},{\"name\":\"T恤\",\"count\":1,\"mode\":\"干洗\"},{\"name\":\"丝质围巾\",\"count\":1,\"mode\":\"干洗\"}]', '[{\"name\":\"皮鞋2\",\"count\":5,\"mode\":\"水洗\",\"price\":14},{\"name\":\"皮鞋3\",\"count\":1,\"mode\":\"水洗\",\"price\":15},{\"name\":\"皮鞋1\",\"count\":2,\"mode\":\"干洗\",\"price\":102}]', '12', '399', '2017-05-16 00:00:00', '2017-05-16 14:48:27', '2017-05-16 14:48:27'), ('34', '2017-05-16', 'W33-3', '1', 'Ada', '[{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"水洗\"}]', '[]', '1', '20', '2017-05-16 00:00:00', '2017-05-16 14:49:25', '2017-05-16 14:49:25'), ('35', '2017-05-16', 'W7-3', '50', '测', '[{\"name\":\"西服上衣\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"西服裤子\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '2', '18', '2017-05-16 00:00:00', '2017-05-16 17:04:15', '2017-05-16 17:04:15'), ('36', '2017-05-16', 'W7-3', '50', '测', '[]', '[]', '0', '0', '2017-05-16 00:00:00', '2017-05-16 17:04:29', '2017-05-16 17:04:29'), ('37', '2017-05-16', 'W7-3', '50', '测', '[]', '[]', '0', '0', '2017-05-16 00:00:00', '2017-05-16 17:04:50', '2017-05-16 17:04:50'), ('38', '2017-05-24', 'W11-1', '49', 'Ada5', '[{\"name\":\"休闲上衣\",\"count\":22,\"mode\":\"单熨\"},{\"name\":\"毛衣/毛衣外套\",\"count\":1,\"mode\":\"单熨\"}]', '[{\"name\":\"其他1\",\"count\":1,\"mode\":\"干洗\",\"price\":10},{\"name\":\"布衣\",\"count\":1,\"mode\":\"干洗\",\"price\":40},{\"name\":\"卫衣\",\"count\":2,\"mode\":\"单熨\",\"price\":33}]', '27', '346', '2017-05-24 00:00:00', '2017-05-25 15:26:09', '2017-05-25 15:53:26'), ('39', '2017-05-25', 'W11-1', '49', 'Ada5', '[{\"name\":\"西服马甲\",\"count\":3,\"mode\":\"单熨\"}]', '[]', '3', '24', '2017-05-25 00:00:00', '2017-05-25 15:56:12', '2017-05-25 15:56:12'), ('40', '2017-05-25', 'W33-3', '1', 'Ada', '[{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"水洗\"},{\"name\":\"毛衣/毛衣外套\",\"count\":1,\"mode\":\"干洗\"}]', '[]', '2', '50', '2017-05-25 00:00:00', '2017-05-25 15:56:26', '2017-05-25 15:56:26'), ('41', '2017-05-25', 'W33-3', '1', 'Ada', '[{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"干洗\"},{\"name\":\"休闲上衣\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '2', '35', '2017-05-25 00:00:00', '2017-05-25 16:00:54', '2017-05-25 16:00:54'), ('42', '2017-05-16', 'W11-1', '49', 'Ada5', '[{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"领带\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '2', '16', '2017-05-16 00:00:00', '2017-05-25 16:01:58', '2017-05-25 16:06:53'), ('43', '2017-05-24', 'W33-3', '1', 'Ada', '[{\"name\":\"西服上衣\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '1', '10', '2017-05-24 00:00:00', '2017-05-25 16:04:01', '2017-05-25 16:04:01'), ('44', '2017-05-23', 'W11-1', '49', 'Ada5', '[{\"name\":\"西服马甲\",\"count\":1,\"mode\":\"单熨\"},{\"name\":\"领带\",\"count\":1,\"mode\":\"单熨\"}]', '[]', '2', '16', '2017-05-23 00:00:00', '2017-05-25 16:05:38', '2017-05-25 16:05:38');
COMMIT;

-- ----------------------------
--  Table structure for `maintain`
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
--  Table structure for `meal`
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
--  Table structure for `message`
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
--  Table structure for `other_fare`
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `other_fare`
-- ----------------------------
BEGIN;
INSERT INTO `other_fare` VALUES ('1', 'W33-3', '1', 'Ada', '租车', '1', '无', '23.8', null, '姚陈坤', '2017-05-25 00:00:00', '2017-05-25 15:31:16', '2017-05-25 15:32:13'), ('2', 'W11-1', '49', 'Ada5', '出租车', '1', '租了一辆车', '200.72', null, '小明', '2017-05-25 00:00:00', '2017-05-25 15:32:48', '2017-05-25 15:32:48');
COMMIT;

-- ----------------------------
--  Table structure for `plan`
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
) ENGINE=InnoDB AUTO_INCREMENT=97 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `plan`
-- ----------------------------
BEGIN;
INSERT INTO `plan` VALUES ('90', '2017-06-02采购冰箱', '2017-06-02 13:31:16', '100', 'Alice', '无', null), ('91', '2017-06-02采购冰箱', '2017-06-02 13:32:00', '100', 'Alice', '无', null), ('92', '2017-06-02采购冰箱', '2017-06-02 13:33:42', '50', 'Alice', '无', null), ('93', '2017-06-02采购冰箱', '2017-06-02 14:10:15', '200', 'Alice', '无', null), ('94', '2017-06-02采购冰箱', '2017-06-02 16:18:47', '100', 'Alice', '无', null), ('95', '2017-06-02采购冰箱', '2017-06-02 16:22:36', '100', 'Alice', '无', null), ('96', '2017-06-02采购冰箱', '2017-06-02 16:44:23', '100', 'Alice', '无', null);
COMMIT;

-- ----------------------------
--  Table structure for `plan_detail`
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
--  Records of `plan_detail`
-- ----------------------------
BEGIN;
INSERT INTO `plan_detail` VALUES ('86', '90', '78', '10', '10', '10', '100', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null), ('87', '91', '79', '10', '0', '10', '100', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null), ('88', '92', '78', '5', '4', '10', '50', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null), ('89', '93', '86', '10', '3', '10', '100', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null), ('90', '93', '87', '10', '4', '10', '100', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null), ('91', '94', '89', '10', '7', '10', '100', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null), ('92', '95', '90', '10', '7', '10', '100', '国美电器', '含普票', '是', '2017-06-02', '2017-06-02', '无', null), ('93', '96', '91', '10', '10', '10', '100', '国美电器', '不含票', '-', '2017-06-02', '2017-06-02', '无', null);
COMMIT;

-- ----------------------------
--  Table structure for `plan_progress`
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
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `plan_progress`
-- ----------------------------
BEGIN;
INSERT INTO `plan_progress` VALUES ('51', '2017-06-02 12:45:46', '88', '68', '采购', '8', 'Alice', '80', '无', null), ('52', '2017-06-02 13:31:42', '90', '78', '采购', '10', 'Alice', '100', '无', null), ('53', '2017-06-02 13:34:07', '92', '78', '采购', '4', 'Alice', '40', '无', null), ('54', '2017-06-02 14:12:13', '93', '86', '采购', '3', 'Alice', '30', '无', null), ('55', '2017-06-02 14:12:48', '93', '87', '采购', '4', 'Alice', '40', '无', null), ('56', '2017-06-02 16:19:08', '94', '89', '采购', '1', 'Alice', '10', '无', null), ('57', '2017-06-02 16:19:18', '94', '89', '采购', '6', 'Alice', '60', '无', null), ('58', '2017-06-02 16:23:08', '95', '90', '采购', '7', 'Alice', '70', '无', null), ('59', '2017-06-02 16:44:35', '96', '91', '采购', '10', 'Alice', '100', '无', null);
COMMIT;

-- ----------------------------
--  Table structure for `repository`
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
--  Records of `repository`
-- ----------------------------
BEGIN;
INSERT INTO `repository` VALUES ('1', 'R3-2', '惠新西街库房3-2', '100', '1', '张三', '1'), ('2', 'R4-6', '崇文门库房4-6', '400', '2', '李四', '1'), ('3', 'R7-8', '北邮库房7-8', '200', '1', '张三', '0'), ('4', 'R8-8', '明光桥8-8', '200', '2', '李四', '0'), ('5', 'R5-6', '蓟门桥5-6', '100', '3', '王五', '0'), ('12', 'R1-1', '东直门1-1', '200', '4', '钱六', '0'), ('13', 'R10-10', '北航10-10', '2000', '4', '钱六', '0');
COMMIT;

-- ----------------------------
--  Table structure for `room`
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
--  Records of `room`
-- ----------------------------
BEGIN;
INSERT INTO `room` VALUES ('1', 'W2-1', null, null, null, null, null), ('2', 'W2-2', null, null, null, null, null), ('3', 'W2-3', null, null, null, null, null), ('4', 'W3-1', null, null, null, null, null), ('5', 'W3-2', null, null, null, null, null), ('6', 'W3-3', null, null, null, null, null), ('7', 'W3-5', null, null, null, null, null), ('8', 'W4-1', null, null, null, null, null), ('9', 'W4-2', null, null, null, null, null), ('10', 'W4-3', null, null, null, null, null), ('11', 'W4-5', null, null, null, null, null), ('12', 'W5-1', null, null, null, null, null), ('13', 'W5-2', null, null, null, null, null), ('14', 'W5-3', null, null, null, null, null), ('15', 'W5-5', null, null, null, null, null), ('16', 'W6-1', null, null, null, null, null), ('17', 'W6-2', null, null, null, null, null), ('18', 'W6-3', null, null, null, null, null), ('19', 'W6-5', null, null, null, null, null), ('20', 'W7-1', null, null, null, null, null), ('21', 'W7-2', null, null, null, null, null), ('22', 'W7-3', null, null, null, null, null), ('23', 'W7-5', null, null, null, null, null), ('24', 'W8-1', null, null, null, null, null), ('25', 'W8-2', null, null, null, null, null), ('26', 'W8-3', null, null, null, null, null), ('27', 'W8-5', null, null, null, null, null), ('28', 'W9-1', null, null, null, null, null), ('29', 'W9-2', null, null, null, null, null), ('30', 'W9-3', null, null, null, null, null), ('31', 'W9-5', null, null, null, null, null), ('32', 'W10-1', null, null, null, null, null), ('33', 'W10-2', null, null, null, null, null), ('34', 'W10-3', null, null, null, null, null), ('35', 'W10-5', null, null, null, null, null), ('36', 'W11-1', null, null, null, null, null), ('37', 'W11-2', null, null, null, null, null), ('38', 'W11-3', null, null, null, null, null), ('39', 'W11-5', null, null, null, null, null), ('40', 'W12-1', null, null, null, null, null), ('41', 'W12-2', null, null, null, null, null), ('42', 'W12-3', null, null, null, null, null), ('43', 'W12-5', null, null, null, null, null), ('44', 'W13-1', null, null, null, null, null), ('45', 'W13-2', null, null, null, null, null), ('46', 'W13-3', null, null, null, null, null), ('47', 'W13-5', null, null, null, null, null), ('48', 'W14-1', null, null, null, null, null), ('49', 'W14-2', null, null, null, null, null), ('50', 'W14-3', null, null, null, null, null), ('51', 'W14-5', null, null, null, null, null), ('52', 'W15-1', null, null, null, null, null), ('53', 'W15-2', null, null, null, null, null), ('54', 'W15-3', null, null, null, null, null), ('55', 'W15-5', null, null, null, null, null), ('56', 'W16-1', null, null, null, null, null), ('57', 'W16-2', null, null, null, null, null), ('58', 'W16-3', null, null, null, null, null), ('59', 'W16-5', null, null, null, null, null), ('60', 'W17-1', null, null, null, null, null), ('61', 'W17-2', null, null, null, null, null), ('62', 'W17-3', null, null, null, null, null), ('63', 'W17-5', null, null, null, null, null), ('64', 'W18-1', null, null, null, null, null), ('65', 'W18-2', null, null, null, null, null), ('66', 'W18-3', null, null, null, null, null), ('67', 'W18-5', null, null, null, null, null), ('68', 'W19-1', null, null, null, null, null), ('69', 'W19-2', null, null, null, null, null), ('70', 'W19-3', null, null, null, null, null), ('71', 'W19-5', null, null, null, null, null), ('72', 'W20-1', null, null, null, null, null), ('73', 'W20-2', null, null, null, null, null), ('74', 'W20-3', null, null, null, null, null), ('75', 'W20-5', null, null, null, null, null), ('76', 'W21-1', null, null, null, null, null), ('77', 'W21-2', null, null, null, null, null), ('78', 'W21-3', null, null, null, null, null), ('79', 'W21-5', null, null, null, null, null), ('80', 'W22-1', null, null, null, null, null), ('81', 'W22-2', null, null, null, null, null), ('82', 'W22-3', null, null, null, null, null), ('83', 'W22-5', null, null, null, null, null), ('84', 'W23-1', null, null, null, null, null), ('85', 'W23-2', null, null, null, null, null), ('86', 'W23-3', null, null, null, null, null), ('87', 'W23-5', null, null, null, null, null), ('88', 'W24-1', null, null, null, null, null), ('89', 'W24-2', null, null, null, null, null), ('90', 'W24-3', null, null, null, null, null), ('91', 'W24-5', null, null, null, null, null), ('92', 'W25-1', null, null, null, null, null), ('93', 'W25-2', null, null, null, null, null), ('94', 'W25-3', null, null, null, null, null), ('95', 'W26-1', null, null, null, null, null), ('96', 'W26-2', null, null, null, null, null), ('97', 'W26-3', null, null, null, null, null), ('98', 'W27-1', null, null, null, null, null), ('99', 'W27-2', null, null, null, null, null), ('100', 'W27-3', null, null, null, null, null), ('101', 'W28-1', null, null, null, null, null), ('102', 'W28-2', null, null, null, null, null), ('103', 'W28-3', null, null, null, null, null), ('104', 'W29-1', null, null, null, null, null), ('105', 'W29-2', null, null, null, null, null), ('106', 'W29-3', null, null, null, null, null), ('107', 'W30-1', null, null, null, null, null), ('108', 'W30-2', null, null, null, null, null), ('109', 'W30-3', null, null, null, null, null), ('110', 'W31-1', null, null, null, null, null), ('111', 'W31-2', null, null, null, null, null), ('112', 'W31-3', null, null, null, null, null), ('113', 'W32-1', null, null, null, null, null), ('114', 'W32-2', null, null, null, null, null), ('115', 'W32-3', null, null, null, null, null), ('116', 'W33-1', null, null, null, null, null), ('117', 'W33-2', null, null, null, null, null), ('118', 'W33-3', null, null, null, null, null), ('119', 'W34-1', null, null, null, null, null), ('120', 'W34-2', null, null, null, null, null), ('121', 'W34-3', null, null, null, null, null), ('122', 'W35-1', null, null, null, null, null), ('123', 'W35-2', null, null, null, null, null), ('124', 'E2-1', null, null, null, null, null), ('125', 'E2-2', null, null, null, null, null), ('126', 'E2-3', null, null, null, null, null), ('127', 'E2-5', null, null, null, null, null), ('128', 'E3-1', null, null, null, null, null), ('129', 'E3-2', null, null, null, null, null), ('130', 'E3-3', null, null, null, null, null), ('131', 'E3-5', null, null, null, null, null), ('132', 'E3-6', null, null, null, null, null), ('133', 'E4-1', null, null, null, null, null), ('134', 'E4-2', null, null, null, null, null), ('135', 'E4-3', null, null, null, null, null), ('136', 'E4-5', null, null, null, null, null), ('137', 'E4-6', null, null, null, null, null), ('138', 'E5-1', null, null, null, null, null), ('139', 'E5-2', null, null, null, null, null), ('140', 'E5-3', null, null, null, null, null), ('141', 'E5-5', null, null, null, null, null), ('142', 'E5-6', null, null, null, null, null), ('143', 'E6-1', null, null, null, null, null), ('144', 'E6-2', null, null, null, null, null), ('145', 'E6-3', null, null, null, null, null), ('146', 'E6-5', null, null, null, null, null), ('147', 'E6-6', null, null, null, null, null), ('148', 'E7-1', null, null, null, null, null), ('149', 'E7-2', null, null, null, null, null), ('150', 'E7-3', null, null, null, null, null), ('151', 'E7-5', null, null, null, null, null), ('152', 'E7-6', null, null, null, null, null), ('153', 'E8-1', null, null, null, null, null), ('154', 'E8-2', null, null, null, null, null), ('155', 'E8-3', null, null, null, null, null), ('156', 'E8-5', null, null, null, null, null), ('157', 'E8-6', null, null, null, null, null), ('158', 'E9-1', null, null, null, null, null), ('159', 'E9-2', null, null, null, null, null), ('160', 'E9-3', null, null, null, null, null), ('161', 'E9-5', null, null, null, null, null), ('162', 'E9-6', null, null, null, null, null), ('163', 'E10-1', null, null, null, null, null), ('164', 'E10-2', null, null, null, null, null), ('165', 'E10-3', null, null, null, null, null), ('166', 'E10-5', null, null, null, null, null), ('167', 'E10-6', null, null, null, null, null), ('168', 'E11-1', null, null, null, null, null), ('169', 'E11-2', null, null, null, null, null), ('170', 'E11-3', null, null, null, null, null), ('171', 'E11-5', null, null, null, null, null), ('172', 'E11-6', null, null, null, null, null), ('173', 'E12-1', null, null, null, null, null), ('174', 'E12-2', null, null, null, null, null), ('175', 'E12-3', null, null, null, null, null), ('176', 'E12-5', null, null, null, null, null), ('177', 'E12-6', null, null, null, null, null), ('178', 'E13-1', null, null, null, null, null), ('179', 'E13-2', null, null, null, null, null), ('180', 'E13-3', null, null, null, null, null), ('181', 'E13-5', null, null, null, null, null), ('182', 'E13-6', null, null, null, null, null), ('183', 'E14-1', null, null, null, null, null), ('184', 'E14-2', null, null, null, null, null), ('185', 'E14-3', null, null, null, null, null), ('186', 'E14-5', null, null, null, null, null), ('187', 'E14-6', null, null, null, null, null), ('188', 'E15-1', null, null, null, null, null), ('189', 'E15-2', null, null, null, null, null), ('190', 'E15-3', null, null, null, null, null), ('191', 'E15-5', null, null, null, null, null), ('192', 'E15-6', null, null, null, null, null), ('193', 'E16-1', null, null, null, null, null), ('194', 'E16-2', null, null, null, null, null), ('195', 'E16-3', null, null, null, null, null), ('196', 'E16-5', null, null, null, null, null), ('197', 'E16-6', null, null, null, null, null), ('198', 'E17-1', null, null, null, null, null), ('199', 'E17-2', null, null, null, null, null), ('200', 'E17-3', null, null, null, null, null), ('201', 'E17-5', null, null, null, null, null), ('202', 'E17-6', null, null, null, null, null), ('203', 'E18-1', null, null, null, null, null), ('204', 'E18-2', null, null, null, null, null), ('205', 'E18-3', null, null, null, null, null), ('206', 'E18-5', null, null, null, null, null), ('207', 'E18-6', null, null, null, null, null), ('208', 'E19-1', null, null, null, null, null), ('209', 'E19-2', null, null, null, null, null), ('210', 'E19-3', null, null, null, null, null), ('211', 'E19-5', null, null, null, null, null), ('212', 'E19-6', null, null, null, null, null), ('213', 'E20-1', null, null, null, null, null), ('214', 'E20-2', null, null, null, null, null), ('215', 'E20-3', null, null, null, null, null), ('216', 'E20-5', null, null, null, null, null), ('217', 'E20-6', null, null, null, null, null), ('218', 'E21-1', null, null, null, null, null), ('219', 'E21-2', null, null, null, null, null), ('220', 'E21-3', null, null, null, null, null), ('221', 'E21-5', null, null, null, null, null), ('222', 'E21-6', null, null, null, null, null), ('223', 'E22-1', null, null, null, null, null), ('224', 'E22-2', null, null, null, null, null), ('225', 'E22-3', null, null, null, null, null), ('226', 'E22-5', null, null, null, null, null), ('227', 'E22-6', null, null, null, null, null), ('228', 'E23-1', null, null, null, null, null), ('229', 'E23-2', null, null, null, null, null), ('230', 'E23-3', null, null, null, null, null), ('231', 'E23-5', null, null, null, null, null), ('232', 'E23-6', null, null, null, null, null), ('233', 'E24-1', null, null, null, null, null), ('234', 'E24-2', null, null, null, null, null), ('235', 'E24-3', null, null, null, null, null), ('236', 'E24-5', null, null, null, null, null), ('237', 'E24-6', null, null, null, null, null), ('238', 'E25-1', null, null, null, null, null), ('239', 'E25-2', null, null, null, null, null), ('240', 'E25-3', null, null, null, null, null), ('241', 'E25-5', null, null, null, null, null), ('242', 'E26-1', null, null, null, null, null), ('243', 'E26-2', null, null, null, null, null), ('244', 'E26-3', null, null, null, null, null), ('245', 'E26-5', null, null, null, null, null), ('246', 'E27-1', null, null, null, null, null), ('247', 'E27-2', null, null, null, null, null), ('248', 'E27-3', null, null, null, null, null), ('249', 'E27-5', null, null, null, null, null), ('250', 'E28-1', null, null, null, null, null), ('251', 'E28-2', null, null, null, null, null), ('252', 'E28-3', null, null, null, null, null), ('253', 'E28-5', null, null, null, null, null), ('254', 'E29-1', null, null, null, null, null), ('255', 'E29-2', null, null, null, null, null), ('256', 'E29-3', null, null, null, null, null), ('257', 'E29-5', null, null, null, null, null), ('258', 'E30-1', null, null, null, null, null), ('259', 'E30-2', null, null, null, null, null), ('260', 'E30-3', null, null, null, null, null), ('261', 'E31-1', null, null, null, null, null), ('262', 'E31-2', null, null, null, null, null), ('263', 'E31-3', null, null, null, null, null), ('264', 'E32-1', null, null, null, null, null), ('265', 'E32-2', null, null, null, null, null), ('266', 'E32-3', null, null, null, null, null), ('267', 'E33-1', null, null, null, null, null), ('268', 'E33-2', null, null, null, null, null), ('269', 'E33-3', null, null, null, null, null), ('270', 'E34-1', null, null, null, null, null), ('271', 'E34-2', null, null, null, null, null), ('272', 'E34-3', null, null, null, null, null), ('273', 'E35-1', null, null, null, null, null), ('274', 'E35-2', null, null, null, null, null);
COMMIT;

-- ----------------------------
--  Table structure for `room_item`
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
--  Records of `room_item`
-- ----------------------------
BEGIN;
INSERT INTO `room_item` VALUES ('95', 'W34-1', '78', '123', '分配', '正常', null, null, null, '无'), ('96', 'W2-3', '78', '456', '借用', '正常', '2017-06-02', '2017-06-24', null, '无'), ('97', 'W8-8', '78', '冰箱1', '分配', '正常', null, null, null, '无'), ('98', 'W3-4', '78', '海尔冰箱1', '借用', '正常', '2017-06-02', '2017-06-24', null, '无'), ('99', 'W8-8', '78', '冰箱1', '分配', '正常', null, null, null, '无'), ('100', 'W34-1', '89', '123', '分配', '正常', null, null, null, '无'), ('101', 'W33-3', '89', '456', '借用', '正常', '2017-06-02', '2017-06-02', null, '无'), ('102', 'W33-3', '89', '456', '借用', '正常', '2017-06-02', '2017-06-02', null, '无'), ('103', 'W33-3', '89', '456', '借用', '正常', '2017-06-02', '2017-06-02', null, '无'), ('104', 'W34-1', '89', '123', '分配', '正常', null, null, null, '无'), ('105', 'W34-1', '89', '555', '分配', '正常', null, null, null, '无'), ('106', 'W1-1', '89', '555', '分配', '正常', null, null, null, '无'), ('107', 'W34-1', '90', '123', '分配', '正常', null, null, null, '无'), ('108', 'W34-1', '90', '223', '借用', '正常', '2017-06-02', '2017-06-02', null, '无'), ('109', 'W34-1', '90', '5', '分配', '正常', null, null, null, '无'), ('110', 'W4-6', '90', '223', '借用', '维修中', '2017-06-02', '2017-06-02', '33', '无'), ('112', '-', '90', '-', '-', '维修中', null, null, '3', '无'), ('113', 'W34-1', '90', '123', '分配', '维修中', null, null, '3333', '无'), ('114', '-', '90', '-', '-', '维修中', null, null, '3', '无'), ('115', 'W34-1', '91', '123', '分配', '正常', null, null, null, '无'), ('116', 'W33-3', '91', '456', '分配', '维修中', null, null, '3', '无'), ('117', 'W3-1', '91', '1', '借用', '正常', '2017-06-02', '2017-06-02', null, '无'), ('119', '-', '91', '-', '-', '维修中', null, null, '2', '无'), ('120', 'W34-1', '78', '123', '借用', '维修中', '2017-06-02', '2017-06-02', '3', '无'), ('121', '-', '78', '-', '-', '维修中', null, null, '3', '无');
COMMIT;

-- ----------------------------
--  Table structure for `room_meter`
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
--  Table structure for `room_pic`
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
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `room_pic`
-- ----------------------------
BEGIN;
INSERT INTO `room_pic` VALUES ('2', '116', '1', null, '1', '1', '/resources/room_pic/1.jpg'), ('3', '117', '1', null, '1', '1', '/resources/room_pic/DSC_0035.JPG'), ('4', '1', '1', null, '1', '1', '/resources/room_pic/IMG_1080.JPG'), ('5', '1', '1', null, '1', '1', '/resources/room_pic/IMG_1042.JPG');
COMMIT;

-- ----------------------------
--  Table structure for `room_state`
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
--  Records of `room_state`
-- ----------------------------
BEGIN;
INSERT INTO `room_state` VALUES ('1', 'W2-1', '3', 'Tom', '1', '1'), ('2', 'W2-2', null, null, '0', '2'), ('3', 'W2-3', null, null, '0', '3'), ('4', 'W3-1', null, null, '0', '4'), ('5', 'W3-2', null, null, '0', '5'), ('6', 'W3-3', null, null, '0', '6'), ('7', 'W3-5', null, null, '0', '7'), ('8', 'W4-1', null, null, '0', '8'), ('9', 'W4-2', null, null, '0', '9'), ('10', 'W4-3', null, null, '0', '10'), ('11', 'W4-5', null, null, '0', '11'), ('12', 'W5-1', null, null, '0', '12'), ('13', 'W5-2', null, null, '0', '13'), ('14', 'W5-3', null, null, '0', '14'), ('15', 'W5-5', null, null, '0', '15'), ('16', 'W6-1', null, null, '0', '16'), ('17', 'W6-2', null, null, '0', '17'), ('18', 'W6-3', null, null, '0', '18'), ('19', 'W6-5', null, null, '0', '19'), ('20', 'W7-1', null, null, '0', '20'), ('21', 'W7-2', null, null, '0', '21'), ('22', 'W7-3', null, null, '0', '22'), ('23', 'W7-5', null, null, '0', '23'), ('24', 'W8-1', null, null, '0', '24'), ('25', 'W8-2', null, null, '0', '25'), ('26', 'W8-3', null, null, '0', '26'), ('27', 'W8-5', null, null, '0', '27'), ('28', 'W9-1', null, null, '0', '28'), ('29', 'W9-2', null, null, '0', '29'), ('30', 'W9-3', null, null, '0', '30'), ('31', 'W9-5', null, null, '0', '31'), ('32', 'W10-1', null, null, '0', '32'), ('33', 'W10-2', null, null, '0', '33'), ('34', 'W10-3', null, null, '0', '34'), ('35', 'W10-5', null, null, '0', '35'), ('36', 'W11-1', null, null, '0', '36'), ('37', 'W11-2', null, null, '0', '37'), ('38', 'W11-3', null, null, '0', '38'), ('39', 'W11-5', null, null, '0', '39'), ('40', 'W12-1', null, null, '0', '40'), ('41', 'W12-2', null, null, '0', '41'), ('42', 'W12-3', null, null, '0', '42'), ('43', 'W12-5', null, null, '0', '43'), ('44', 'W13-1', null, null, '0', '44'), ('45', 'W13-2', null, null, '0', '45'), ('46', 'W13-3', null, null, '0', '46'), ('47', 'W13-5', null, null, '0', '47'), ('48', 'W14-1', null, null, '0', '48'), ('49', 'W14-2', null, null, '0', '49'), ('50', 'W14-3', null, null, '0', '50'), ('51', 'W14-5', null, null, '0', '51'), ('52', 'W15-1', null, null, '0', '52'), ('53', 'W15-2', null, null, '0', '53'), ('54', 'W15-3', null, null, '0', '54'), ('55', 'W15-5', null, null, '0', '55'), ('56', 'W16-1', null, null, '0', '56'), ('57', 'W16-2', null, null, '0', '57'), ('58', 'W16-3', null, null, '0', '58'), ('59', 'W16-5', null, null, '0', '59'), ('60', 'W17-1', null, null, '0', '60'), ('61', 'W17-2', null, null, '0', '61'), ('62', 'W17-3', null, null, '0', '62'), ('63', 'W17-5', null, null, '0', '63'), ('64', 'W18-1', null, null, '0', '64'), ('65', 'W18-2', null, null, '0', '65'), ('66', 'W18-3', null, null, '0', '66'), ('67', 'W18-5', null, null, '0', '67'), ('68', 'W19-1', null, null, '0', '68'), ('69', 'W19-2', null, null, '0', '69'), ('70', 'W19-3', null, null, '0', '70'), ('71', 'W19-5', null, null, '0', '71'), ('72', 'W20-1', null, null, '0', '72'), ('73', 'W20-2', null, null, '0', '73'), ('74', 'W20-3', null, null, '0', '74'), ('75', 'W20-5', null, null, '0', '75'), ('76', 'W21-1', null, null, '0', '76'), ('77', 'W21-2', null, null, '0', '77'), ('78', 'W21-3', null, null, '0', '78'), ('79', 'W21-5', null, null, '0', '79'), ('80', 'W22-1', null, null, '0', '80'), ('81', 'W22-2', null, null, '0', '81'), ('82', 'W22-3', null, null, '0', '82'), ('83', 'W22-5', null, null, '0', '83'), ('84', 'W23-1', null, null, '0', '84'), ('85', 'W23-2', null, null, '0', '85'), ('86', 'W23-3', null, null, '0', '86'), ('87', 'W23-5', null, null, '0', '87'), ('88', 'W24-1', null, null, '0', '88'), ('89', 'W24-2', null, null, '0', '89'), ('90', 'W24-3', null, null, '0', '90'), ('91', 'W24-5', null, null, '0', '91'), ('92', 'W25-1', null, null, '0', '92'), ('93', 'W25-2', null, null, '0', '93'), ('94', 'W25-3', null, null, '0', '94'), ('95', 'W26-1', null, null, '0', '95'), ('96', 'W26-2', null, null, '0', '96'), ('97', 'W26-3', null, null, '0', '97'), ('98', 'W27-1', null, null, '0', '98'), ('99', 'W27-2', null, null, '0', '99'), ('100', 'W27-3', null, null, '0', '100'), ('101', 'W28-1', null, null, '0', '101'), ('102', 'W28-2', null, null, '0', '102'), ('103', 'W28-3', null, null, '0', '103'), ('104', 'W29-1', null, null, '0', '104'), ('105', 'W29-2', null, null, '0', '105'), ('106', 'W29-3', null, null, '0', '106'), ('107', 'W30-1', null, null, '0', '107'), ('108', 'W30-2', null, null, '0', '108'), ('109', 'W30-3', null, null, '0', '109'), ('110', 'W31-1', null, null, '0', '110'), ('111', 'W31-2', null, null, '0', '111'), ('112', 'W31-3', null, null, '0', '112'), ('113', 'W32-1', '31', 'alice1', '1', '113'), ('114', 'W32-2', null, null, '0', '114'), ('115', 'W32-3', null, null, '0', '115'), ('116', 'W33-1', '25', 'Ada', '1', '116'), ('117', 'W33-2', '54', 'Ada', '1', '117'), ('118', 'W33-3', '50', '测', '1', '118'), ('119', 'W34-1', null, null, '0', '119'), ('120', 'W34-2', null, null, '0', '120'), ('121', 'W34-3', null, null, '0', '121'), ('122', 'W35-1', null, null, '0', '122'), ('123', 'W35-2', null, null, '0', '123'), ('124', 'E2-1', null, null, '0', '124'), ('125', 'E2-2', null, null, '0', '125'), ('126', 'E2-3', null, null, '0', '126'), ('127', 'E2-5', null, null, '0', '127'), ('128', 'E3-1', null, null, '0', '128'), ('129', 'E3-2', null, null, '0', '129'), ('130', 'E3-3', null, null, '0', '130'), ('131', 'E3-5', null, null, '0', '131'), ('132', 'E3-6', null, null, '0', '132'), ('133', 'E4-1', null, null, '0', '133'), ('134', 'E4-2', null, null, '0', '134'), ('135', 'E4-3', null, null, '0', '135'), ('136', 'E4-5', null, null, '0', '136'), ('137', 'E4-6', null, null, '0', '137'), ('138', 'E5-1', null, null, '0', '138'), ('139', 'E5-2', null, null, '0', '139'), ('140', 'E5-3', null, null, '0', '140'), ('141', 'E5-5', null, null, '0', '141'), ('142', 'E5-6', null, null, '0', '142'), ('143', 'E6-1', null, null, '0', '143'), ('144', 'E6-2', null, null, '0', '144'), ('145', 'E6-3', null, null, '0', '145'), ('146', 'E6-5', null, null, '0', '146'), ('147', 'E6-6', null, null, '0', '147'), ('148', 'E7-1', null, null, '0', '148'), ('149', 'E7-2', null, null, '0', '149'), ('150', 'E7-3', null, null, '0', '150'), ('151', 'E7-5', null, null, '0', '151'), ('152', 'E7-6', null, null, '0', '152'), ('153', 'E8-1', null, null, '0', '153'), ('154', 'E8-2', null, null, '0', '154'), ('155', 'E8-3', null, null, '0', '155'), ('156', 'E8-5', null, null, '0', '156'), ('157', 'E8-6', null, null, '0', '157'), ('158', 'E9-1', null, null, '0', '158'), ('159', 'E9-2', null, null, '0', '159'), ('160', 'E9-3', null, null, '0', '160'), ('161', 'E9-5', null, null, '0', '161'), ('162', 'E9-6', null, null, '0', '162'), ('163', 'E10-1', null, null, '0', '163'), ('164', 'E10-2', null, null, '0', '164'), ('165', 'E10-3', null, null, '0', '165'), ('166', 'E10-5', null, null, '0', '166'), ('167', 'E10-6', null, null, '0', '167'), ('168', 'E11-1', null, null, '0', '168'), ('169', 'E11-2', null, null, '0', '169'), ('170', 'E11-3', null, null, '0', '170'), ('171', 'E11-5', null, null, '0', '171'), ('172', 'E11-6', null, null, '0', '172'), ('173', 'E12-1', null, null, '0', '173'), ('174', 'E12-2', null, null, '0', '174'), ('175', 'E12-3', null, null, '0', '175'), ('176', 'E12-5', null, null, '0', '176'), ('177', 'E12-6', null, null, '0', '177'), ('178', 'E13-1', null, null, '0', '178'), ('179', 'E13-2', null, null, '0', '179'), ('180', 'E13-3', null, null, '0', '180'), ('181', 'E13-5', null, null, '0', '181'), ('182', 'E13-6', null, null, '0', '182'), ('183', 'E14-1', null, null, '0', '183'), ('184', 'E14-2', null, null, '0', '184'), ('185', 'E14-3', null, null, '0', '185'), ('186', 'E14-5', null, null, '0', '186'), ('187', 'E14-6', null, null, '0', '187'), ('188', 'E15-1', null, null, '0', '188'), ('189', 'E15-2', null, null, '0', '189'), ('190', 'E15-3', null, null, '0', '190'), ('191', 'E15-5', null, null, '0', '191'), ('192', 'E15-6', null, null, '0', '192'), ('193', 'E16-1', null, null, '0', '193'), ('194', 'E16-2', null, null, '0', '194'), ('195', 'E16-3', null, null, '0', '195'), ('196', 'E16-5', null, null, '0', '196'), ('197', 'E16-6', null, null, '0', '197'), ('198', 'E17-1', null, null, '0', '198'), ('199', 'E17-2', null, null, '0', '199'), ('200', 'E17-3', null, null, '0', '200'), ('201', 'E17-5', null, null, '0', '201'), ('202', 'E17-6', null, null, '0', '202'), ('203', 'E18-1', null, null, '0', '203'), ('204', 'E18-2', null, null, '0', '204'), ('205', 'E18-3', null, null, '0', '205'), ('206', 'E18-5', null, null, '0', '206'), ('207', 'E18-6', null, null, '0', '207'), ('208', 'E19-1', null, null, '0', '208'), ('209', 'E19-2', null, null, '0', '209'), ('210', 'E19-3', null, null, '0', '210'), ('211', 'E19-5', null, null, '0', '211'), ('212', 'E19-6', null, null, '0', '212'), ('213', 'E20-1', null, null, '0', '213'), ('214', 'E20-2', null, null, '0', '214'), ('215', 'E20-3', null, null, '0', '215'), ('216', 'E20-5', null, null, '0', '216'), ('217', 'E20-6', null, null, '0', '217'), ('218', 'E21-1', null, null, '0', '218'), ('219', 'E21-2', null, null, '0', '219'), ('220', 'E21-3', null, null, '0', '220'), ('221', 'E21-5', null, null, '0', '221'), ('222', 'E21-6', null, null, '0', '222'), ('223', 'E22-1', null, null, '0', '223'), ('224', 'E22-2', null, null, '0', '224'), ('225', 'E22-3', null, null, '0', '225'), ('226', 'E22-5', null, null, '0', '226'), ('227', 'E22-6', null, null, '0', '227'), ('228', 'E23-1', null, null, '0', '228'), ('229', 'E23-2', null, null, '0', '229'), ('230', 'E23-3', null, null, '0', '230'), ('231', 'E23-5', null, null, '0', '231'), ('232', 'E23-6', null, null, '0', '232'), ('233', 'E24-1', null, null, '0', '233'), ('234', 'E24-2', null, null, '0', '234'), ('235', 'E24-3', null, null, '0', '235'), ('236', 'E24-5', null, null, '0', '236'), ('237', 'E24-6', null, null, '0', '237'), ('238', 'E25-1', null, null, '0', '238'), ('239', 'E25-2', null, null, '0', '239'), ('240', 'E25-3', null, null, '0', '240'), ('241', 'E25-5', null, null, '0', '241'), ('242', 'E26-1', null, null, '0', '242'), ('243', 'E26-2', null, null, '0', '243'), ('244', 'E26-3', null, null, '0', '244'), ('245', 'E26-5', null, null, '0', '245'), ('246', 'E27-1', null, null, '0', '246'), ('247', 'E27-2', null, null, '0', '247'), ('248', 'E27-3', null, null, '0', '248'), ('249', 'E27-5', null, null, '0', '249'), ('250', 'E28-1', null, null, '0', '250'), ('251', 'E28-2', null, null, '0', '251'), ('252', 'E28-3', null, null, '0', '252'), ('253', 'E28-5', null, null, '0', '253'), ('254', 'E29-1', null, null, '0', '254'), ('255', 'E29-2', null, null, '0', '255'), ('256', 'E29-3', null, null, '0', '256'), ('257', 'E29-5', null, null, '0', '257'), ('258', 'E30-1', null, null, '0', '258'), ('259', 'E30-2', null, null, '0', '259'), ('260', 'E30-3', null, null, '0', '260'), ('261', 'E31-1', null, null, '0', '261'), ('262', 'E31-2', null, null, '0', '262'), ('263', 'E31-3', null, null, '0', '263'), ('264', 'E32-1', null, null, '0', '264'), ('265', 'E32-2', null, null, '0', '265'), ('266', 'E32-3', null, null, '0', '266'), ('267', 'E33-1', null, null, '0', '267'), ('268', 'E33-2', null, null, '0', '268'), ('269', 'E33-3', null, null, '0', '269'), ('270', 'E34-1', null, null, '0', '270'), ('271', 'E34-2', null, null, '0', '271'), ('272', 'E34-3', null, null, '0', '272'), ('273', 'E35-1', null, null, '0', '273'), ('274', 'E35-2', null, null, '0', '274');
COMMIT;

-- ----------------------------
--  Table structure for `shoes_polishing`
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
--  Table structure for `shuttle_bus`
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
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
--  Records of `shuttle_bus`
-- ----------------------------
BEGIN;
INSERT INTO `shuttle_bus` VALUES ('1', '2017', '3', 'W32-1', '2', 'Alice1', '张三，李四，王五', '0', '0', '0', '0', '0', '0', '9', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '9', '2017-04-12 12:38:49', '2017-05-15 12:38:53', '2017-06-28 12:38:55'), ('29', '2016', '12', 'W7-3', '50', '测', '李逍遥，赵灵儿，林月如', '1', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '1', '0', '1', '0', '1', '0', '0', '8', '80', '2016-12-01 12:00:00', '2017-04-25 12:39:25', '2017-05-14 14:50:32'), ('30', '2017', '7', 'W2-1', '3', 'Tom', '林月如，阿奴', '0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '1', '1', '1', '1', '1', '0', '0', '1', '1', '1', '0', '1', '1', '0', '1', '0', '0', '0', '0', '0', '0', '18', '198', '2017-07-01 12:00:00', '2017-05-25 12:39:29', '2017-05-25 15:33:36'), ('31', '2017', '5', 'W6-1', '59', 'aaa', '景天，雪见', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '2', '20', '2017-02-22 12:39:10', '2017-03-15 12:39:33', '2017-02-21 12:39:46'), ('34', '2017', '5', 'W33-2', '54', 'Ada', '云天河，柳梦璃', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0', '7', '70', '2015-11-15 12:39:15', '2017-03-07 12:39:36', '2017-05-12 12:01:09'), ('39', '2017', '5', 'W33-3', '58', 'Alice2', '陈靖仇', '0', '0', '0', '0', '0', '0', '1', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1', '1', '1', '0', '0', '9', '90', '2017-05-01 00:00:00', '2017-05-12 11:58:10', '2017-05-12 12:31:02'), ('40', '2017', '5', 'W33-3', '1', 'Ada', '张三，李四，王五', '0', '0', '0', '0', '0', '0', '1', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '0', '1', '1', '1', '1', '1', '0', '0', '9', '90', '2017-05-01 12:00:00', '2017-05-13 14:26:01', '2017-05-13 14:34:40'), ('41', '2017', '6', 'W33-3', '1', 'Ada', '', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '2', '20', '2017-06-01 12:00:01', '2017-05-13 14:26:53', '2017-05-13 14:26:53'), ('42', '2017', '5', 'W7-3', '50', '测', 'hahah，hahah', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '0', '0', '0', '0', '0', '0', '2', '20', '2017-05-01 00:00:00', '2017-05-16 10:34:49', '2017-05-16 10:34:49'), ('44', '2017', '5', 'W11-1', '49', 'Ada5', 'Bruno Mars, Alexa Keys，aa', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '1', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '0', '1', '1', '5', '50', '2017-05-01 00:00:01', '2017-05-16 11:52:51', '2017-05-16 11:53:38');
COMMIT;

-- ----------------------------
--  Table structure for `sources`
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
--  Table structure for `staff`
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
--  Records of `staff`
-- ----------------------------
BEGIN;
INSERT INTO `staff` VALUES ('1', 'ken', '点餐', '客服部', '2017-05-11', '1'), ('2', 'lucy', '点餐', '客服部', '2017-05-25', '1'), ('3', 'andy', '点餐', '客服部', '2017-05-25', '1'), ('4', 'andrew', '洗衣', '客服部', '2017-05-25', '1');
COMMIT;

-- ----------------------------
--  Table structure for `user`
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
--  Records of `user`
-- ----------------------------
BEGIN;
INSERT INTO `user` VALUES ('1', 'BUPTADMIN', 'e10adc3949ba59abbe56e057f20f883e', 'BUPTADMIN', 'SYS_001', '财务部', '0', '262143', '2016-10-08', '2017-05-16', '1'), ('2', 'test', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_001', '客服部', '1', '262143', '2016-10-08', '2017-06-02', '1'), ('10', '王二', 'e10adc3949ba59abbe56e057f20f883e', '王二', '王二', '财务部', '1', '262143', '2017-03-17', '2017-03-17', '1'), ('11', 'test8', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_', '客房部', '1', '262143', '2017-03-28', '2017-03-28', '1'), ('12', 'testr345', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_', '客房部', '0', '262143', '2017-03-29', '2017-03-29', '1'), ('14', 'test12312', 'e10adc3949ba59abbe56e057f20f883e', 'test', 'TEST_', '客房部', '0', '262143', '2017-04-24', '2017-04-24', '1');
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
