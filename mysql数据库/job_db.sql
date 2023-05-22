/*
Navicat MySQL Data Transfer

Source Server         : localhost_3306
Source Server Version : 50051
Source Host           : localhost:3306
Source Database       : job_db

Target Server Type    : MYSQL
Target Server Version : 50051
File Encoding         : 65001

Date: 2019-06-17 19:58:07
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for `admin`
-- ----------------------------
DROP TABLE IF EXISTS `admin`;
CREATE TABLE `admin` (
  `username` varchar(20) NOT NULL,
  `password` varchar(20) default NULL,
  PRIMARY KEY  (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of admin
-- ----------------------------
INSERT INTO `admin` VALUES ('a', 'a');

-- ----------------------------
-- Table structure for `delivery`
-- ----------------------------
DROP TABLE IF EXISTS `delivery`;
CREATE TABLE `delivery` (
  `deliveryId` int(11) NOT NULL auto_increment,
  `jobObj` int(11) default NULL,
  `userObj` varchar(20) default NULL,
  `deliveryTime` varchar(20) default NULL,
  `stateObj` int(11) default NULL,
  `deliveryDemo` longtext,
  PRIMARY KEY  (`deliveryId`),
  KEY `FK34EF80142C0CA901` (`stateObj`),
  KEY `FK34EF80142FB9D295` (`jobObj`),
  KEY `FK34EF8014C80FC67` (`userObj`),
  CONSTRAINT `FK34EF80142C0CA901` FOREIGN KEY (`stateObj`) REFERENCES `deliverystate` (`stateId`),
  CONSTRAINT `FK34EF80142FB9D295` FOREIGN KEY (`jobObj`) REFERENCES `job` (`jobId`),
  CONSTRAINT `FK34EF8014C80FC67` FOREIGN KEY (`userObj`) REFERENCES `userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of delivery
-- ----------------------------
INSERT INTO `delivery` VALUES ('2', '1', 'user1', '2019-06-17 16:18:56', '1', '');
INSERT INTO `delivery` VALUES ('3', '3', 'user2', '2019-06-17 18:16:27', '4', '表现不错');
INSERT INTO `delivery` VALUES ('4', '4', 'user1', '2019-06-17 19:47:06', '3', '看了你的简历，你周末下午3点来面试');

-- ----------------------------
-- Table structure for `deliverystate`
-- ----------------------------
DROP TABLE IF EXISTS `deliverystate`;
CREATE TABLE `deliverystate` (
  `stateId` int(11) NOT NULL auto_increment,
  `stateName` varchar(20) default NULL,
  PRIMARY KEY  (`stateId`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of deliverystate
-- ----------------------------
INSERT INTO `deliverystate` VALUES ('1', '简历待处理');
INSERT INTO `deliverystate` VALUES ('2', '简历不合格不通过');
INSERT INTO `deliverystate` VALUES ('3', '简历合格,通知面试');
INSERT INTO `deliverystate` VALUES ('4', '面试通过');
INSERT INTO `deliverystate` VALUES ('5', '面试失败');

-- ----------------------------
-- Table structure for `job`
-- ----------------------------
DROP TABLE IF EXISTS `job`;
CREATE TABLE `job` (
  `jobId` int(11) NOT NULL auto_increment,
  `qiyeObj` varchar(20) default NULL,
  `positionName` varchar(40) default NULL,
  `jobTypeObj` int(11) default NULL,
  `specialObj` int(11) default NULL,
  `personNum` varchar(20) default NULL,
  `city` varchar(20) default NULL,
  `salary` varchar(20) default NULL,
  `schoolRecordObj` int(11) default NULL,
  `workYears` varchar(20) default NULL,
  `workAddress` varchar(20) default NULL,
  `welfare` longtext,
  `positionDesc` longtext,
  `connectPerson` varchar(20) default NULL,
  `telephone` varchar(20) default NULL,
  PRIMARY KEY  (`jobId`),
  KEY `FK1239D30D1E779` (`qiyeObj`),
  KEY `FK1239DB71C1763` (`specialObj`),
  KEY `FK1239D731F4575` (`jobTypeObj`),
  KEY `FK1239DF61741F9` (`schoolRecordObj`),
  CONSTRAINT `FK1239D30D1E779` FOREIGN KEY (`qiyeObj`) REFERENCES `qiye` (`qiyeUserName`),
  CONSTRAINT `FK1239D731F4575` FOREIGN KEY (`jobTypeObj`) REFERENCES `jobtype` (`jobTypeId`),
  CONSTRAINT `FK1239DB71C1763` FOREIGN KEY (`specialObj`) REFERENCES `specialinfo` (`specialId`),
  CONSTRAINT `FK1239DF61741F9` FOREIGN KEY (`schoolRecordObj`) REFERENCES `schoolrecord` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of job
-- ----------------------------
INSERT INTO `job` VALUES ('1', 'qy1', 'PHP后端程序员', '1', '1', '3', '成都', '8000元/月', '1', '2年以上', '成都市区', '五险一金，法定节假日', '精通php网站后台开发，包括各种开源框架ThinkPHP等', '王先生', '028-83490342');
INSERT INTO `job` VALUES ('3', 'qy2', '市场渠道专员', '1', '2', '2', '成都', '6500', '3', '2年以上', '成都市春熙路', '公司提供五险一金，周末双休，送交通补助', '负责公司产品市场拓宽，工作认真', '李小姐', '028-83942943');
INSERT INTO `job` VALUES ('4', 'qy2', 'html5前端程序员', '1', '1', '3', '成都', '9000+', '4', '3年以上', '四川成都锦江区', '五险一金、十三薪（现在一般互联网公司十四薪、十五薪也有）、定期体检、团建、节日福利、带薪年假、免费早午餐', '工作认真负责，能适应加班压力', '李小姐', '028-83940834');

-- ----------------------------
-- Table structure for `jobtype`
-- ----------------------------
DROP TABLE IF EXISTS `jobtype`;
CREATE TABLE `jobtype` (
  `jobTypeId` int(11) NOT NULL auto_increment,
  `typeName` varchar(20) default NULL,
  PRIMARY KEY  (`jobTypeId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobtype
-- ----------------------------
INSERT INTO `jobtype` VALUES ('1', '全职');
INSERT INTO `jobtype` VALUES ('2', '兼职');

-- ----------------------------
-- Table structure for `jobwant`
-- ----------------------------
DROP TABLE IF EXISTS `jobwant`;
CREATE TABLE `jobwant` (
  `wantId` int(11) NOT NULL auto_increment,
  `jobTypeObj` int(11) default NULL,
  `specialObj` int(11) default NULL,
  `positionName` varchar(50) default NULL,
  `salary` varchar(20) default NULL,
  `workCity` varchar(20) default NULL,
  `wantMemo` longtext,
  `userObj` varchar(20) default NULL,
  `addTime` varchar(20) default NULL,
  PRIMARY KEY  (`wantId`),
  KEY `FKD85134DB71C1763` (`specialObj`),
  KEY `FKD85134D731F4575` (`jobTypeObj`),
  KEY `FKD85134DC80FC67` (`userObj`),
  CONSTRAINT `FKD85134D731F4575` FOREIGN KEY (`jobTypeObj`) REFERENCES `jobtype` (`jobTypeId`),
  CONSTRAINT `FKD85134DB71C1763` FOREIGN KEY (`specialObj`) REFERENCES `specialinfo` (`specialId`),
  CONSTRAINT `FKD85134DC80FC67` FOREIGN KEY (`userObj`) REFERENCES `userinfo` (`user_name`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of jobwant
-- ----------------------------
INSERT INTO `jobwant` VALUES ('1', '1', '1', '软件程序员', '5000+', '成都', '我想找一个php开发网站方面的程序员职位', 'user1', '2019-06-17 12:11:23');
INSERT INTO `jobwant` VALUES ('2', '1', '2', '市场营销专员', '6000+', '成都', '我学电子商务的，对市场营销比较熟悉', 'user2', '2019-06-17 18:19:12');

-- ----------------------------
-- Table structure for `news`
-- ----------------------------
DROP TABLE IF EXISTS `news`;
CREATE TABLE `news` (
  `newsId` int(11) NOT NULL auto_increment,
  `newsClassObj` int(11) default NULL,
  `title` varchar(80) default NULL,
  `content` longtext,
  `publishDate` varchar(30) default NULL,
  PRIMARY KEY  (`newsId`),
  KEY `FK24FEF3EF8B86F5` (`newsClassObj`),
  CONSTRAINT `FK24FEF3EF8B86F5` FOREIGN KEY (`newsClassObj`) REFERENCES `newsclass` (`newsClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of news
-- ----------------------------
INSERT INTO `news` VALUES ('1', '3', '求职招聘app系统上线了', '公司企业来这里发布职位，用户可以来找工作哦！', '2019-06-05 16:52:28');
INSERT INTO `news` VALUES ('2', '1', '关于简历投递渠道', '个人建议的顺序（按先后顺序排序）：朋友推荐或内部推荐，微信群（很多招聘信息都会留下邮箱），拉勾网及BOSS直聘，猎聘网，智联招聘及前程无忧。\r\n此外，还可以委托一些热心并且有一定资源的猎头朋友（不管是付费推荐还是友情推荐），但需要说明的是，猎头的本质是帮企业招人或者做双方的撮合匹配，并不是帮人找工作；企业的官方招聘平台也是一个重要的投递渠道；', '2019-06-05 16:52:28');
INSERT INTO `news` VALUES ('3', '2', 'XXX招聘会', '这个星期六在学校体育馆XXX公司要来举行招聘会，有兴趣的同学来参加吧', '2019-06-05 16:52:28');

-- ----------------------------
-- Table structure for `newsclass`
-- ----------------------------
DROP TABLE IF EXISTS `newsclass`;
CREATE TABLE `newsclass` (
  `newsClassId` int(11) NOT NULL auto_increment,
  `newsClassName` varchar(20) default NULL,
  PRIMARY KEY  (`newsClassId`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of newsclass
-- ----------------------------
INSERT INTO `newsclass` VALUES ('1', '求职技巧');
INSERT INTO `newsclass` VALUES ('2', '宣讲会');
INSERT INTO `newsclass` VALUES ('3', '系统公告');

-- ----------------------------
-- Table structure for `qiye`
-- ----------------------------
DROP TABLE IF EXISTS `qiye`;
CREATE TABLE `qiye` (
  `qiyeUserName` varchar(20) NOT NULL,
  `password` varchar(20) default NULL,
  `qiyeName` varchar(20) default NULL,
  `qiyeQualify` varchar(40) default NULL,
  `qiyePropertyObj` int(11) default NULL,
  `qiyeProfessionObj` int(11) default NULL,
  `qiyeScale` varchar(20) default NULL,
  `connectPerson` varchar(20) default NULL,
  `telephone` varchar(20) default NULL,
  `email` varchar(30) default NULL,
  `address` varchar(80) default NULL,
  PRIMARY KEY  (`qiyeUserName`),
  KEY `FK266B44590C9799` (`qiyeProfessionObj`),
  KEY `FK266B44464A5D79` (`qiyePropertyObj`),
  CONSTRAINT `FK266B44464A5D79` FOREIGN KEY (`qiyePropertyObj`) REFERENCES `qiyeproperty` (`id`),
  CONSTRAINT `FK266B44590C9799` FOREIGN KEY (`qiyeProfessionObj`) REFERENCES `qiyeprofession` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qiye
-- ----------------------------
INSERT INTO `qiye` VALUES ('qy1', '123', '四川泉河软件有限公司', '营业执照已验证 1网邻通会员1年', '1', '1', '1-49人', '赵先生', '02882980834', 'zhaomingz@163.com', '四川省成都市金牛区金牛万达A座202');
INSERT INTO `qiye` VALUES ('qy2', '123', '成都阳光软件公司', '诚信通1年', '1', '1', '100人', '王曦彤', '028-82984083', 'xitong@126.com', '四川成都双流区飞机场');

-- ----------------------------
-- Table structure for `qiyeprofession`
-- ----------------------------
DROP TABLE IF EXISTS `qiyeprofession`;
CREATE TABLE `qiyeprofession` (
  `id` int(11) NOT NULL auto_increment,
  `professionName` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qiyeprofession
-- ----------------------------
INSERT INTO `qiyeprofession` VALUES ('1', '计算机/互联网/软件');
INSERT INTO `qiyeprofession` VALUES ('2', '生物/制药/医疗器械');
INSERT INTO `qiyeprofession` VALUES ('3', '交通/运输/物流');

-- ----------------------------
-- Table structure for `qiyeproperty`
-- ----------------------------
DROP TABLE IF EXISTS `qiyeproperty`;
CREATE TABLE `qiyeproperty` (
  `id` int(11) NOT NULL auto_increment,
  `propertyName` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of qiyeproperty
-- ----------------------------
INSERT INTO `qiyeproperty` VALUES ('1', '私营');
INSERT INTO `qiyeproperty` VALUES ('2', '民营');

-- ----------------------------
-- Table structure for `schoolrecord`
-- ----------------------------
DROP TABLE IF EXISTS `schoolrecord`;
CREATE TABLE `schoolrecord` (
  `id` int(11) NOT NULL auto_increment,
  `schooRecordName` varchar(20) default NULL,
  PRIMARY KEY  (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of schoolrecord
-- ----------------------------
INSERT INTO `schoolrecord` VALUES ('1', '小学');
INSERT INTO `schoolrecord` VALUES ('2', '初中');
INSERT INTO `schoolrecord` VALUES ('3', '高中/大专');
INSERT INTO `schoolrecord` VALUES ('4', '本科');

-- ----------------------------
-- Table structure for `specialinfo`
-- ----------------------------
DROP TABLE IF EXISTS `specialinfo`;
CREATE TABLE `specialinfo` (
  `specialId` int(11) NOT NULL auto_increment,
  `specialName` varchar(20) default NULL,
  PRIMARY KEY  (`specialId`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of specialinfo
-- ----------------------------
INSERT INTO `specialinfo` VALUES ('1', '计算机专业');
INSERT INTO `specialinfo` VALUES ('2', '电子商务专业');

-- ----------------------------
-- Table structure for `userinfo`
-- ----------------------------
DROP TABLE IF EXISTS `userinfo`;
CREATE TABLE `userinfo` (
  `user_name` varchar(20) NOT NULL,
  `password` varchar(30) default NULL,
  `name` varchar(20) default NULL,
  `gender` varchar(4) default NULL,
  `birthDate` datetime default NULL,
  `userPhoto` varchar(50) default NULL,
  `myShoolRecord` int(11) default NULL,
  `schoolName` varchar(20) default NULL,
  `workYears` varchar(50) default NULL,
  `telephone` varchar(20) default NULL,
  `email` varchar(50) default NULL,
  `address` varchar(80) default NULL,
  `qzyx` longtext,
  `gzjl` longtext,
  `jyjl` longtext,
  `zwpj` longtext,
  `regTime` varchar(30) default NULL,
  PRIMARY KEY  (`user_name`),
  KEY `FKF3F34B39EA2B99E3` (`myShoolRecord`),
  CONSTRAINT `FKF3F34B39EA2B99E3` FOREIGN KEY (`myShoolRecord`) REFERENCES `schoolrecord` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of userinfo
-- ----------------------------
INSERT INTO `userinfo` VALUES ('user1', '123', '张晓丽', '女', '2019-06-09 00:00:00', 'upload/07B45C1CD1AE8596528E7ED034F9E73C.jpg', '1', '成都理工大学', '1年', '13508039943', 'xiaoli@163.com', '四川成都二仙桥', '计算机程序员', '软件公司工作2年', '大学本科', '技术过硬', '2019-06-05 15:32:25');
INSERT INTO `userinfo` VALUES ('user2', '123', '王桃桃', '女', '2019-06-17 00:00:00', 'upload/54B404A2080A3C1885527E4795ED2463.jpg', '4', '电子科技大学', '2年', '13598008432', 'taotao@163.com', '四川南充', '电子商务营销类', '市场推广营销2年', '本科毕业', '良好', '2019-06-17 18:16:07');
