/*
SQLyog Enterprise - MySQL GUI v4.1
Host - 4.1.8-nt : Database - schedule_maker
*********************************************************************
Server version : 4.1.8-nt
*/

SET FOREIGN_KEY_CHECKS=0;

create database if not exists `schedule_maker`;

USE `schedule_maker`;

/*Table structure for table `schedule` */

drop table if exists `schedule`;

CREATE TABLE `schedule` (
  `id` int(11) NOT NULL default '0',
  `classNbr` varchar(100) NOT NULL default '',
  `courseId` varchar(6) NOT NULL default '',
  PRIMARY KEY  (`id`,`classNbr`,`courseId`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `schedule` */

/*Table structure for table `student` */

drop table if exists `student`;

CREATE TABLE `student` (
  `ssn` varchar(9) NOT NULL default '',
  `pantherID` varchar(7) NOT NULL default '',
  `firstname` varchar(100) default NULL,
  `lastname` varchar(100) default NULL,
  PRIMARY KEY  (`ssn`),
  UNIQUE KEY `PK_Student` (`ssn`),
  KEY `pantherID` (`pantherID`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `student` */

/*Table structure for table `student_schedule` */

drop table if exists `student_schedule`;

CREATE TABLE `student_schedule` (
  `id` int(11) NOT NULL default '0',
  `pantherID` varchar(7) NOT NULL default '',
  PRIMARY KEY  (`id`,`pantherID`),
  KEY `pantherID` (`pantherID`),
  CONSTRAINT `student_schedule_ibfk_2` FOREIGN KEY (`pantherID`) REFERENCES `student` (`pantherID`) ON UPDATE CASCADE,
  CONSTRAINT `student_schedule_ibfk_1` FOREIGN KEY (`id`) REFERENCES `schedule` (`id`) ON UPDATE CASCADE
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

/*Data for the table `student_schedule` */

SET FOREIGN_KEY_CHECKS=1;
