/*
SQLyog Ultimate v11.33 (64 bit)
MySQL - 5.7.17-log : Database - grun
*********************************************************************
*/

/*!40101 SET NAMES utf8 */;

/*!40101 SET SQL_MODE=''*/;

/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;
CREATE DATABASE /*!32312 IF NOT EXISTS*/`grun` /*!40100 DEFAULT CHARACTER SET utf8 COLLATE utf8_bin */;

/*Table structure for table `grun_calendar` */

DROP TABLE IF EXISTS `grun_calendar`;

CREATE TABLE `grun_calendar` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '校历表',
  `year_code` char(4) COLLATE utf8mb4_bin NOT NULL COMMENT '年号 2014,2015',
  `name` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '名称',
  `bgein1` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '第一学期开始',
  `end1` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '第一学期结束',
  `bgein2` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '第二学期开始',
  `end2` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '第二学期结束',
  `xq` int(11) DEFAULT NULL COMMENT '第几学期',
  `ymd` char(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '年月日yyyymmdd',
  `ym` char(6) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '年月日yyyymm',
  `ymdtxt` char(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '年月日yyyy-mm-dd',
  `wkday` int(6) DEFAULT NULL COMMENT '周几',
  `week1` int(11) DEFAULT NULL COMMENT '学年周次',
  `week2` int(11) DEFAULT NULL COMMENT '学期周次',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '内容',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据创建者',
  `updater` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据修改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2183 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='校历表';

/*Table structure for table `grun_clazz` */

DROP TABLE IF EXISTS `grun_clazz`;

CREATE TABLE `grun_clazz` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `clazz_code` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '班号',
  `clazz_name` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '班级名称',
  `major_code` char(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '专业分类码  -- 参见 DM-ZDZY《中等职业学校专业代码》 (SB010205:ZYFLM)',
  `create_at` char(6) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '建班年月',
  `lenth` decimal(3,1) DEFAULT NULL COMMENT '学制',
  `staff_code` varchar(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '班主任职工号',
  `monitor` varchar(10) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '班长学号',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据创建者',
  `updater` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据修改者',
  `room_no` varchar(12) COLLATE utf8mb4_bin DEFAULT '' COMMENT '教室编号',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=81 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='1.2 班级信息';

/*Table structure for table `grun_course` */

DROP TABLE IF EXISTS `grun_course`;

CREATE TABLE `grun_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `cause_code` char(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '课程号',
  `name` varchar(60) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '课程名称',
  `enname` varchar(180) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '课程英文名称',
  `method` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '网上教学状况',
  `description` text COLLATE utf8mb4_bin COMMENT '课程简介',
  `requirement` text COLLATE utf8mb4_bin COMMENT '课程要求',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据创建者',
  `updater` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据修改者',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='4.1.1 课程基本情况';

/*Table structure for table `grun_major_course` */

DROP TABLE IF EXISTS `grun_major_course`;

CREATE TABLE `grun_major_course` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '专业培养方案',
  `yyyy` char(4) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '年号',
  `major_code` char(6) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '专业码  -- 参见 DM-ZDZY《中等职业学校专业代码》 (JX020106:ZYM)',
  `cause_code` char(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '课程号',
  `ctype` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '课程类别 DM_KCLB',
  `period` decimal(3,0) DEFAULT NULL COMMENT '总学时',
  `credit` decimal(3,0) DEFAULT NULL COMMENT '总学分',
  `teaching` decimal(3,0) DEFAULT NULL,
  `experiment` decimal(3,0) DEFAULT NULL,
  `practice` decimal(3,0) DEFAULT NULL,
  `teach_way` char(1) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '授课方式码  -- 参见 DM-SKFS《授课方式代码》 (JX010207:SKFSM)',
  `meterial` text COLLATE utf8mb4_bin,
  `reference` text COLLATE utf8mb4_bin,
  `premise` text COLLATE utf8mb4_bin,
  `semester_code` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '开课学期码  -- 参见 DM-XQ《学期代码》 (JX010211:KKXQM)',
  `exam_method` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '考试方式  -- 参见 DM-KSFS《考试方式代码》 (JX010212:KSFSM)',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT '数据创建者',
  `updater` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT '数据修改者',
  `JY_KCFL` int(11) DEFAULT NULL COMMENT '课程分类,1,2,3,4,5,6,7',
  `xq1` varchar(4) COLLATE utf8mb4_bin DEFAULT '0',
  `xq2` varchar(4) COLLATE utf8mb4_bin DEFAULT '0',
  `xq3` varchar(4) COLLATE utf8mb4_bin DEFAULT '0',
  `xq4` varchar(4) COLLATE utf8mb4_bin DEFAULT '0',
  `xq5` varchar(4) COLLATE utf8mb4_bin DEFAULT '0',
  `xq6` varchar(4) COLLATE utf8mb4_bin DEFAULT '0',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='4.2.1 专业培養方案';

/*Table structure for table `grun_staff` */

DROP TABLE IF EXISTS `grun_staff`;

CREATE TABLE `grun_staff` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_code` char(8) COLLATE utf8mb4_bin DEFAULT '' COMMENT '职工号',
  `department_code` char(5) COLLATE utf8mb4_bin DEFAULT '' COMMENT '科室号',
  `name` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT '姓名',
  `enname` varchar(60) COLLATE utf8mb4_bin DEFAULT '' COMMENT '姓名拼音',
  `alias` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT '曾用名',
  `idno` varchar(18) COLLATE utf8mb4_bin DEFAULT '' COMMENT '身份证号',
  `birth_date` char(8) COLLATE utf8mb4_bin DEFAULT '' COMMENT '出生日期',
  `sex` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '性别码  -- 参见 GB/T2261.1《人的性别代码》 (JZ010008:XBM)',
  `nation` char(2) COLLATE utf8mb4_bin DEFAULT '' COMMENT '民族码  -- 参见 GB/T3304《中国各民族名称罗马字母拼写法和代码》 (JZ010009:MZM)',
  `health_status` char(2) COLLATE utf8mb4_bin DEFAULT '' COMMENT '健康状况码  -- 参见 GB/T2261.3《健康状况代码》 (JZ010010:JKZKM)',
  `blood` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '血型码  -- 参见 DM-XX《血型代码》 (JZ010011:XXM)',
  `religion` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT '宗教信仰',
  `oversea` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '港澳台侨码  -- 参见 DM-GATQ《港澳台侨外代码》 (JZ010013:GATQM)',
  `marital` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '婚姻状况码  -- 参见 GB/T4766《婚姻状况代码》 (JZ010014:HYZKM)',
  `native_place` char(6) COLLATE utf8mb4_bin DEFAULT '' COMMENT '籍贯码  -- 参见 GB/T2260《行政区划代码》 (JZ010015:JGM)',
  `birth_place` char(6) COLLATE utf8mb4_bin DEFAULT '' COMMENT '出生地码  -- 参见 GB/T2260《行政区划代码》 (JZ010016:CSDM)',
  `family_class` char(2) COLLATE utf8mb4_bin DEFAULT '' COMMENT '家庭出身码  -- 参见 GB/T4765《家庭出身代码》 (JZ010017:JTCSM)',
  `person_class` char(2) COLLATE utf8mb4_bin DEFAULT '' COMMENT '本人成分码  -- 参见 GB/T4764《本人成分代码》 (JZ010018:BRCFM)',
  `family_address` varchar(60) COLLATE utf8mb4_bin DEFAULT '' COMMENT '家庭住址',
  `address` varchar(60) COLLATE utf8mb4_bin DEFAULT '' COMMENT '现住址',
  `residence` varchar(60) COLLATE utf8mb4_bin DEFAULT '' COMMENT '户口所在地',
  `household` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '户口性质码  -- 参见 DM-HKXZ《户口性质代码》 (JZ010022:HKXZM)',
  `education` char(2) COLLATE utf8mb4_bin DEFAULT '' COMMENT '文化程度码  -- 参见 GB/T4658《文化程度代码》 (JZ010023:WHCDM)',
  `employ_date` char(6) COLLATE utf8mb4_bin DEFAULT '' COMMENT '参加工作年月',
  `regist_date` char(6) COLLATE utf8mb4_bin DEFAULT '' COMMENT '来校年月',
  `teach_date` char(6) COLLATE utf8mb4_bin DEFAULT '' COMMENT '从教年月',
  `systematic` char(2) COLLATE utf8mb4_bin DEFAULT '' COMMENT '编制类别码  -- 参见 DM-BZLB《编制类别代码》 (JZ010027:BZLBM)',
  `staff_category` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '教职工类别码  -- 参见 DM-JZGLB《教职工类别代码》 (JZ010028:JZGLBM)',
  `profession` varchar(8) COLLATE utf8mb4_bin DEFAULT '' COMMENT '现从事专业号',
  `status` char(1) COLLATE utf8mb4_bin DEFAULT '' COMMENT '任课状况',
  `docno` varchar(10) COLLATE utf8mb4_bin DEFAULT '' COMMENT '档案编号',
  `doctext` text COLLATE utf8mb4_bin COMMENT '档案文本',
  `picture` blob COMMENT '照片',
  `post` varchar(60) COLLATE utf8mb4_bin DEFAULT '' COMMENT '通信地址',
  `phone` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT '联系电话',
  `postcode` char(6) COLLATE utf8mb4_bin DEFAULT '' COMMENT '邮政编码',
  `email` varchar(30) COLLATE utf8mb4_bin DEFAULT '' COMMENT '电子信箱',
  `homepage` varchar(60) COLLATE utf8mb4_bin DEFAULT '' COMMENT '主页地址',
  `skill` text COLLATE utf8mb4_bin COMMENT '特长',
  `station` char(2) COLLATE utf8mb4_bin DEFAULT '' COMMENT '岗位名称 -- 参见BM_JGGWBM',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT '数据创建者',
  `updater` varchar(20) COLLATE utf8mb4_bin DEFAULT '' COMMENT '数据修改者',
  `majors` varchar(255) COLLATE utf8mb4_bin DEFAULT '',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=250 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='3.1 教职工基本情况信息';

/*Table structure for table `grun_staff_major` */

DROP TABLE IF EXISTS `grun_staff_major`;

CREATE TABLE `grun_staff_major` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `staff_code` char(8) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '职工号',
  `major_code` char(6) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '关系码  -- 参见 GB/T4761《家庭关系代码》 (JZ310201:GXM)',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='3.31.2 教职工所教专业';

/*Table structure for table `grun_teaching_room` */

DROP TABLE IF EXISTS `grun_teaching_room`;

CREATE TABLE `grun_teaching_room` (
  `room_no` varchar(12) COLLATE utf8mb4_bin NOT NULL COMMENT '房间编号',
  `name` varchar(60) COLLATE utf8mb4_bin DEFAULT '' COMMENT '房间名称',
  `room_type` char(2) COLLATE utf8mb4_bin DEFAULT '' COMMENT '房间用途码  -- 参见 DM-FJYT《房间用途代码》 (FC020203:FJYTM)',
  `floor` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '房间地址',
  `area_struct` int(8) DEFAULT '0' COMMENT '房间建筑面积',
  `area_usable` int(8) DEFAULT '0' COMMENT '房间使用面积',
  `capacity` int(8) DEFAULT '0' COMMENT '可容纳人数',
  `create_time` datetime DEFAULT CURRENT_TIMESTAMP COMMENT '创建时间',
  `update_time` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间',
  `creator` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据创建者',
  `updater` varchar(20) COLLATE utf8mb4_bin DEFAULT NULL COMMENT '数据修改者',
  `department_code` varchar(6) COLLATE utf8mb4_bin DEFAULT '' COMMENT '所属部门',
  `remark` varchar(255) COLLATE utf8mb4_bin DEFAULT '' COMMENT '备注',
  PRIMARY KEY (`room_no`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_bin ROW_FORMAT=DYNAMIC COMMENT='8.2.2 建筑物房间情况';

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;
