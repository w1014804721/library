﻿# Host: 127.0.0.1  (Version 5.6.24)
# Date: 2016-07-02 17:11:20
# Generator: MySQL-Front 5.3  (Build 5.39)

/*!40101 SET NAMES utf8 */;

#
# Structure for table "borrow"
#

DROP TABLE IF EXISTS `borrow`;
CREATE TABLE `borrow` (
  `user` varchar(255) NOT NULL DEFAULT '0',
  `book_id` varchar(255) NOT NULL DEFAULT '',
  `borrowTime` date NOT NULL DEFAULT '1000-01-01',
  `returnTime` date DEFAULT NULL,
  `fine` int(11) NOT NULL DEFAULT '0',
  `b_status` int(11) NOT NULL DEFAULT '2',
  `duration` date DEFAULT '1000-01-01',
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `finedate` date DEFAULT '0000-00-00',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8;

#
# Data for table "borrow"
#

INSERT INTO `borrow` VALUES ('1','1','2016-07-01','2016-07-01',0,1,'2016-06-12',12,'0000-00-00'),('1','1','2016-07-01','2016-07-01',0,1,'2016-06-12',13,'0000-00-00'),('1','1','2016-07-01','2016-07-01',0,1,'2016-06-12',14,'0000-00-00'),('1','1','2016-07-01','2016-07-01',0,1,'2016-06-22',15,'0000-00-00'),('1','1','2016-07-01','2016-07-01',0,1,'2016-07-26',16,'0000-00-00'),('1','1','2016-07-01','2016-07-01',0,1,'2016-07-26',17,'0000-00-00'),('1','1','2016-07-01','2016-07-01',0,1,'2016-07-26',18,'0000-00-00'),('1','1','2016-07-01','2016-07-01',0,1,'2016-07-26',19,'0000-00-00'),('1','1','2016-07-01','2016-07-01',0,1,'2016-09-29',20,'0000-00-00'),('1','1','2016-07-01','2016-07-01',0,1,'2016-07-31',21,'0000-00-00'),('1','1','2016-07-01','2016-07-01',0,1,'2016-10-09',22,'0000-00-00'),('1','1','2016-07-01','2016-07-01',0,1,'2016-10-09',23,'2016-07-01'),('1','1','2016-05-01','2016-07-01',0,1,'2016-06-01',24,'2016-07-01'),('1','1','2016-07-02','2016-07-02',0,1,'2016-09-30',25,'2016-07-02');