
-- phpMyAdmin SQL Dump
-- version 2.11.11.3
-- http://www.phpmyadmin.net
--
-- Host: 68.178.143.144
-- Generation Time: Nov 21, 2016 at 12:22 PM
-- Server version: 5.5.43
-- PHP Version: 5.1.6

SET SQL_MODE="NO_AUTO_VALUE_ON_ZERO";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `hawkeyecup`
--

-- --------------------------------------------------------

--
-- Table structure for table `courses`
--

CREATE TABLE `courses` (
  `course_id` int(11) NOT NULL AUTO_INCREMENT,
  `course_name` varchar(255) NOT NULL,
  PRIMARY KEY (`course_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `courses`
--

INSERT INTO `courses` VALUES(1, 'OCN Crooked Cat');
INSERT INTO `courses` VALUES(2, 'OCN Panther Lake');
INSERT INTO `courses` VALUES(3, 'Reunion (Nicklaus Course)');
INSERT INTO `courses` VALUES(4, 'Southern Dunes');
INSERT INTO `courses` VALUES(5, 'Eagle Creek');
INSERT INTO `courses` VALUES(6, 'Mystic Dunes');

-- --------------------------------------------------------

--
-- Table structure for table `course_detail`
--

CREATE TABLE `course_detail` (
  `course_id` int(11) NOT NULL,
  `hole` int(11) NOT NULL,
  `par` int(11) NOT NULL,
  `handicap` int(11) NOT NULL,
  PRIMARY KEY (`course_id`,`hole`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `course_detail`
--

INSERT INTO `course_detail` VALUES(1, 1, 5, 17);
INSERT INTO `course_detail` VALUES(1, 2, 4, 3);
INSERT INTO `course_detail` VALUES(1, 3, 4, 13);
INSERT INTO `course_detail` VALUES(1, 4, 5, 1);
INSERT INTO `course_detail` VALUES(1, 5, 4, 11);
INSERT INTO `course_detail` VALUES(1, 6, 3, 15);
INSERT INTO `course_detail` VALUES(1, 7, 4, 7);
INSERT INTO `course_detail` VALUES(1, 8, 3, 5);
INSERT INTO `course_detail` VALUES(1, 9, 4, 9);
INSERT INTO `course_detail` VALUES(1, 10, 4, 10);
INSERT INTO `course_detail` VALUES(1, 11, 4, 12);
INSERT INTO `course_detail` VALUES(1, 12, 4, 2);
INSERT INTO `course_detail` VALUES(1, 13, 3, 4);
INSERT INTO `course_detail` VALUES(1, 14, 5, 18);
INSERT INTO `course_detail` VALUES(1, 15, 3, 14);
INSERT INTO `course_detail` VALUES(1, 16, 4, 6);
INSERT INTO `course_detail` VALUES(1, 17, 5, 16);
INSERT INTO `course_detail` VALUES(1, 18, 4, 8);
INSERT INTO `course_detail` VALUES(2, 1, 4, 7);
INSERT INTO `course_detail` VALUES(2, 2, 5, 11);
INSERT INTO `course_detail` VALUES(2, 3, 4, 1);
INSERT INTO `course_detail` VALUES(2, 4, 3, 13);
INSERT INTO `course_detail` VALUES(2, 5, 4, 9);
INSERT INTO `course_detail` VALUES(2, 6, 3, 17);
INSERT INTO `course_detail` VALUES(2, 7, 5, 5);
INSERT INTO `course_detail` VALUES(2, 8, 4, 15);
INSERT INTO `course_detail` VALUES(2, 9, 4, 3);
INSERT INTO `course_detail` VALUES(2, 10, 5, 16);
INSERT INTO `course_detail` VALUES(2, 11, 3, 2);
INSERT INTO `course_detail` VALUES(2, 12, 4, 12);
INSERT INTO `course_detail` VALUES(2, 13, 4, 4);
INSERT INTO `course_detail` VALUES(2, 14, 5, 6);
INSERT INTO `course_detail` VALUES(2, 15, 3, 8);
INSERT INTO `course_detail` VALUES(2, 16, 4, 14);
INSERT INTO `course_detail` VALUES(2, 17, 3, 18);
INSERT INTO `course_detail` VALUES(2, 18, 5, 10);
INSERT INTO `course_detail` VALUES(3, 1, 4, 17);
INSERT INTO `course_detail` VALUES(3, 2, 4, 1);
INSERT INTO `course_detail` VALUES(3, 3, 5, 3);
INSERT INTO `course_detail` VALUES(3, 4, 4, 5);
INSERT INTO `course_detail` VALUES(3, 5, 3, 9);
INSERT INTO `course_detail` VALUES(3, 6, 5, 11);
INSERT INTO `course_detail` VALUES(3, 7, 4, 13);
INSERT INTO `course_detail` VALUES(3, 8, 3, 15);
INSERT INTO `course_detail` VALUES(3, 9, 4, 7);
INSERT INTO `course_detail` VALUES(3, 10, 4, 8);
INSERT INTO `course_detail` VALUES(3, 11, 3, 14);
INSERT INTO `course_detail` VALUES(3, 12, 4, 12);
INSERT INTO `course_detail` VALUES(3, 13, 4, 6);
INSERT INTO `course_detail` VALUES(3, 14, 4, 2);
INSERT INTO `course_detail` VALUES(3, 15, 5, 18);
INSERT INTO `course_detail` VALUES(3, 16, 3, 4);
INSERT INTO `course_detail` VALUES(3, 17, 4, 16);
INSERT INTO `course_detail` VALUES(3, 18, 5, 10);
INSERT INTO `course_detail` VALUES(4, 1, 4, 9);
INSERT INTO `course_detail` VALUES(4, 2, 4, 15);
INSERT INTO `course_detail` VALUES(4, 3, 3, 11);
INSERT INTO `course_detail` VALUES(4, 4, 5, 5);
INSERT INTO `course_detail` VALUES(4, 5, 4, 7);
INSERT INTO `course_detail` VALUES(4, 6, 3, 17);
INSERT INTO `course_detail` VALUES(4, 7, 4, 1);
INSERT INTO `course_detail` VALUES(4, 8, 4, 13);
INSERT INTO `course_detail` VALUES(4, 9, 5, 3);
INSERT INTO `course_detail` VALUES(4, 10, 4, 2);
INSERT INTO `course_detail` VALUES(4, 11, 3, 16);
INSERT INTO `course_detail` VALUES(4, 12, 5, 6);
INSERT INTO `course_detail` VALUES(4, 13, 4, 8);
INSERT INTO `course_detail` VALUES(4, 14, 3, 18);
INSERT INTO `course_detail` VALUES(4, 15, 4, 14);
INSERT INTO `course_detail` VALUES(4, 16, 5, 4);
INSERT INTO `course_detail` VALUES(4, 17, 4, 12);
INSERT INTO `course_detail` VALUES(4, 18, 4, 10);
INSERT INTO `course_detail` VALUES(5, 1, 4, 15);
INSERT INTO `course_detail` VALUES(5, 2, 4, 17);
INSERT INTO `course_detail` VALUES(5, 3, 4, 13);
INSERT INTO `course_detail` VALUES(5, 4, 5, 3);
INSERT INTO `course_detail` VALUES(5, 5, 3, 11);
INSERT INTO `course_detail` VALUES(5, 6, 4, 1);
INSERT INTO `course_detail` VALUES(5, 7, 4, 5);
INSERT INTO `course_detail` VALUES(5, 8, 3, 9);
INSERT INTO `course_detail` VALUES(5, 9, 5, 7);
INSERT INTO `course_detail` VALUES(5, 10, 4, 14);
INSERT INTO `course_detail` VALUES(5, 11, 3, 12);
INSERT INTO `course_detail` VALUES(5, 12, 4, 4);
INSERT INTO `course_detail` VALUES(5, 13, 5, 10);
INSERT INTO `course_detail` VALUES(5, 14, 4, 16);
INSERT INTO `course_detail` VALUES(5, 15, 4, 2);
INSERT INTO `course_detail` VALUES(5, 16, 5, 6);
INSERT INTO `course_detail` VALUES(5, 17, 3, 18);
INSERT INTO `course_detail` VALUES(5, 18, 5, 8);
INSERT INTO `course_detail` VALUES(6, 1, 4, 18);
INSERT INTO `course_detail` VALUES(6, 2, 3, 6);
INSERT INTO `course_detail` VALUES(6, 3, 4, 8);
INSERT INTO `course_detail` VALUES(6, 4, 4, 12);
INSERT INTO `course_detail` VALUES(6, 5, 5, 4);
INSERT INTO `course_detail` VALUES(6, 6, 4, 16);
INSERT INTO `course_detail` VALUES(6, 7, 5, 14);
INSERT INTO `course_detail` VALUES(6, 8, 3, 10);
INSERT INTO `course_detail` VALUES(6, 9, 4, 2);
INSERT INTO `course_detail` VALUES(6, 10, 4, 13);
INSERT INTO `course_detail` VALUES(6, 11, 4, 1);
INSERT INTO `course_detail` VALUES(6, 12, 4, 3);
INSERT INTO `course_detail` VALUES(6, 13, 4, 9);
INSERT INTO `course_detail` VALUES(6, 14, 3, 5);
INSERT INTO `course_detail` VALUES(6, 15, 5, 11);
INSERT INTO `course_detail` VALUES(6, 16, 3, 7);
INSERT INTO `course_detail` VALUES(6, 17, 5, 15);
INSERT INTO `course_detail` VALUES(6, 18, 4, 17);

-- --------------------------------------------------------

--
-- Table structure for table `golfer`
--

CREATE TABLE `golfer` (
  `golfer_id` int(11) NOT NULL AUTO_INCREMENT,
  `username` varchar(255) DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `password` varchar(255) DEFAULT NULL,
  `first_name` varchar(255) DEFAULT NULL,
  `last_name` varchar(255) DEFAULT NULL,
  `hometown` varchar(255) DEFAULT NULL,
  PRIMARY KEY (`golfer_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=17 ;

--
-- Dumping data for table `golfer`
--

INSERT INTO `golfer` VALUES(1, 'Bruns', '', '', '', 'Bruns', '');
INSERT INTO `golfer` VALUES(2, 'Clark', '', '', '', 'Clark', '');
INSERT INTO `golfer` VALUES(3, 'Delagardelle', '', '', '', 'Delagardelle', '');
INSERT INTO `golfer` VALUES(4, 'Greiner', '', '', '', 'Greiner', '');
INSERT INTO `golfer` VALUES(5, 'Henderson', '', '', '', 'Henderson', '');
INSERT INTO `golfer` VALUES(6, 'Hensley', '', '', '', 'Hensley', '');
INSERT INTO `golfer` VALUES(7, 'Johnson', '', '', '', 'Johnson', '');
INSERT INTO `golfer` VALUES(8, 'McCarter', '', '', '', 'McCarter', '');
INSERT INTO `golfer` VALUES(9, 'McGarvey', '', '', '', 'McGarvey', '');
INSERT INTO `golfer` VALUES(10, 'Mueller', '', '', '', 'Mueller', '');
INSERT INTO `golfer` VALUES(11, 'Nyhus', '', '', '', 'Nyhus', '');
INSERT INTO `golfer` VALUES(12, 'Reese', '', '', '', 'Reese', '');
INSERT INTO `golfer` VALUES(13, 'Reimers', '', '', '', 'Reimers', '');
INSERT INTO `golfer` VALUES(14, 'Scott', '', '', '', 'Scott', '');
INSERT INTO `golfer` VALUES(15, 'Sheets', '', '', '', 'Sheets', '');
INSERT INTO `golfer` VALUES(16, 'Stremlau', '', '', '', 'Stremlau', '');

-- --------------------------------------------------------

--
-- Table structure for table `round_course`
--

CREATE TABLE `round_course` (
  `round_id` int(11) NOT NULL,
  `course_id` int(11) NOT NULL,
  PRIMARY KEY (`round_id`,`course_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `round_course`
--

INSERT INTO `round_course` VALUES(1, 1);
INSERT INTO `round_course` VALUES(2, 2);
INSERT INTO `round_course` VALUES(3, 3);
INSERT INTO `round_course` VALUES(4, 4);
INSERT INTO `round_course` VALUES(5, 5);
INSERT INTO `round_course` VALUES(6, 6);

-- --------------------------------------------------------

--
-- Table structure for table `round_score`
--

CREATE TABLE `round_score` (
  `round_id` int(11) NOT NULL,
  `golfer_id` int(11) NOT NULL,
  `hole` int(11) NOT NULL,
  `score` int(11) NOT NULL,
  PRIMARY KEY (`round_id`,`golfer_id`,`hole`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `round_score`
--

INSERT INTO `round_score` VALUES(6, 1, 1, 5);
INSERT INTO `round_score` VALUES(6, 5, 1, 5);
INSERT INTO `round_score` VALUES(6, 15, 1, 7);
INSERT INTO `round_score` VALUES(6, 12, 1, 5);
INSERT INTO `round_score` VALUES(6, 8, 1, 5);
INSERT INTO `round_score` VALUES(6, 3, 1, 4);
INSERT INTO `round_score` VALUES(6, 2, 1, 4);
INSERT INTO `round_score` VALUES(6, 9, 1, 4);
INSERT INTO `round_score` VALUES(6, 7, 1, 5);
INSERT INTO `round_score` VALUES(6, 4, 1, 7);
INSERT INTO `round_score` VALUES(6, 13, 1, 4);
INSERT INTO `round_score` VALUES(6, 16, 1, 4);
INSERT INTO `round_score` VALUES(6, 1, 2, 4);
INSERT INTO `round_score` VALUES(6, 5, 2, 6);
INSERT INTO `round_score` VALUES(6, 15, 2, 8);
INSERT INTO `round_score` VALUES(6, 12, 2, 3);
INSERT INTO `round_score` VALUES(6, 8, 2, 6);
INSERT INTO `round_score` VALUES(6, 3, 2, 5);
INSERT INTO `round_score` VALUES(6, 2, 2, 5);
INSERT INTO `round_score` VALUES(6, 9, 2, 3);
INSERT INTO `round_score` VALUES(6, 7, 2, 6);
INSERT INTO `round_score` VALUES(6, 4, 2, 4);
INSERT INTO `round_score` VALUES(6, 13, 2, 6);
INSERT INTO `round_score` VALUES(6, 16, 2, 5);
INSERT INTO `round_score` VALUES(6, 1, 3, 6);
INSERT INTO `round_score` VALUES(6, 5, 3, 5);
INSERT INTO `round_score` VALUES(6, 15, 3, 5);
INSERT INTO `round_score` VALUES(6, 12, 3, 4);
INSERT INTO `round_score` VALUES(6, 1, 4, 5);
INSERT INTO `round_score` VALUES(6, 5, 4, 5);
INSERT INTO `round_score` VALUES(6, 15, 4, 5);
INSERT INTO `round_score` VALUES(6, 12, 4, 7);
INSERT INTO `round_score` VALUES(6, 1, 5, 5);
INSERT INTO `round_score` VALUES(6, 5, 5, 4);
INSERT INTO `round_score` VALUES(6, 15, 5, 5);
INSERT INTO `round_score` VALUES(6, 12, 5, 7);
INSERT INTO `round_score` VALUES(6, 1, 6, 6);
INSERT INTO `round_score` VALUES(6, 5, 6, 5);
INSERT INTO `round_score` VALUES(6, 15, 6, 6);
INSERT INTO `round_score` VALUES(6, 12, 6, 5);
INSERT INTO `round_score` VALUES(6, 1, 7, 6);
INSERT INTO `round_score` VALUES(6, 5, 7, 6);
INSERT INTO `round_score` VALUES(6, 15, 7, 7);
INSERT INTO `round_score` VALUES(6, 12, 7, 7);
INSERT INTO `round_score` VALUES(6, 1, 8, 4);
INSERT INTO `round_score` VALUES(6, 5, 8, 2);
INSERT INTO `round_score` VALUES(6, 15, 8, 5);
INSERT INTO `round_score` VALUES(6, 12, 8, 5);
INSERT INTO `round_score` VALUES(6, 1, 9, 3);
INSERT INTO `round_score` VALUES(6, 5, 9, 3);
INSERT INTO `round_score` VALUES(6, 15, 9, 3);
INSERT INTO `round_score` VALUES(6, 12, 9, 3);
INSERT INTO `round_score` VALUES(6, 1, 10, 5);
INSERT INTO `round_score` VALUES(6, 5, 10, 5);
INSERT INTO `round_score` VALUES(6, 15, 10, 8);
INSERT INTO `round_score` VALUES(6, 12, 10, 7);
INSERT INTO `round_score` VALUES(6, 1, 11, 5);
INSERT INTO `round_score` VALUES(6, 5, 11, 5);
INSERT INTO `round_score` VALUES(6, 15, 11, 6);
INSERT INTO `round_score` VALUES(6, 12, 11, 6);
INSERT INTO `round_score` VALUES(6, 1, 12, 5);
INSERT INTO `round_score` VALUES(6, 5, 12, 5);
INSERT INTO `round_score` VALUES(6, 15, 12, 5);
INSERT INTO `round_score` VALUES(6, 12, 12, 6);
INSERT INTO `round_score` VALUES(6, 8, 3, 6);
INSERT INTO `round_score` VALUES(6, 3, 3, 5);
INSERT INTO `round_score` VALUES(6, 2, 3, 6);
INSERT INTO `round_score` VALUES(6, 9, 3, 4);
INSERT INTO `round_score` VALUES(6, 1, 13, 4);
INSERT INTO `round_score` VALUES(6, 5, 13, 5);
INSERT INTO `round_score` VALUES(6, 15, 13, 5);
INSERT INTO `round_score` VALUES(6, 12, 13, 5);
INSERT INTO `round_score` VALUES(6, 8, 4, 4);
INSERT INTO `round_score` VALUES(6, 3, 4, 5);
INSERT INTO `round_score` VALUES(6, 2, 4, 5);
INSERT INTO `round_score` VALUES(6, 9, 4, 4);
INSERT INTO `round_score` VALUES(6, 3, 5, 4);
INSERT INTO `round_score` VALUES(6, 3, 6, 4);
INSERT INTO `round_score` VALUES(6, 8, 7, 6);
INSERT INTO `round_score` VALUES(6, 3, 8, 4);
INSERT INTO `round_score` VALUES(6, 3, 9, 5);
INSERT INTO `round_score` VALUES(6, 8, 10, 4);
INSERT INTO `round_score` VALUES(6, 3, 10, 4);
INSERT INTO `round_score` VALUES(6, 2, 10, 5);
INSERT INTO `round_score` VALUES(6, 9, 10, 5);
INSERT INTO `round_score` VALUES(6, 8, 11, 6);
INSERT INTO `round_score` VALUES(6, 3, 11, 6);
INSERT INTO `round_score` VALUES(6, 2, 11, 5);
INSERT INTO `round_score` VALUES(6, 9, 11, 7);
INSERT INTO `round_score` VALUES(6, 8, 12, 5);
INSERT INTO `round_score` VALUES(6, 3, 12, 5);
INSERT INTO `round_score` VALUES(6, 2, 12, 5);
INSERT INTO `round_score` VALUES(6, 9, 12, 8);
INSERT INTO `round_score` VALUES(6, 8, 13, 5);
INSERT INTO `round_score` VALUES(6, 3, 13, 5);
INSERT INTO `round_score` VALUES(6, 2, 13, 7);
INSERT INTO `round_score` VALUES(6, 9, 13, 8);
INSERT INTO `round_score` VALUES(6, 1, 14, 3);
INSERT INTO `round_score` VALUES(6, 5, 14, 4);
INSERT INTO `round_score` VALUES(6, 15, 14, 6);
INSERT INTO `round_score` VALUES(6, 12, 14, 8);
INSERT INTO `round_score` VALUES(6, 7, 3, 5);
INSERT INTO `round_score` VALUES(6, 4, 3, 4);
INSERT INTO `round_score` VALUES(6, 13, 3, 6);
INSERT INTO `round_score` VALUES(6, 16, 3, 4);
INSERT INTO `round_score` VALUES(6, 7, 4, 5);
INSERT INTO `round_score` VALUES(6, 4, 4, 6);
INSERT INTO `round_score` VALUES(6, 13, 4, 5);
INSERT INTO `round_score` VALUES(6, 16, 4, 5);
INSERT INTO `round_score` VALUES(6, 8, 14, 5);
INSERT INTO `round_score` VALUES(6, 3, 14, 4);
INSERT INTO `round_score` VALUES(6, 2, 14, 4);
INSERT INTO `round_score` VALUES(6, 9, 14, 4);
INSERT INTO `round_score` VALUES(6, 7, 5, 5);
INSERT INTO `round_score` VALUES(6, 4, 5, 5);
INSERT INTO `round_score` VALUES(6, 13, 5, 4);
INSERT INTO `round_score` VALUES(6, 16, 5, 5);
INSERT INTO `round_score` VALUES(6, 1, 15, 6);
INSERT INTO `round_score` VALUES(6, 5, 15, 6);
INSERT INTO `round_score` VALUES(6, 15, 15, 7);
INSERT INTO `round_score` VALUES(6, 12, 15, 6);
INSERT INTO `round_score` VALUES(6, 8, 15, 8);
INSERT INTO `round_score` VALUES(6, 3, 15, 6);
INSERT INTO `round_score` VALUES(6, 2, 15, 6);
INSERT INTO `round_score` VALUES(6, 9, 15, 5);
INSERT INTO `round_score` VALUES(6, 1, 16, 4);
INSERT INTO `round_score` VALUES(6, 5, 16, 3);
INSERT INTO `round_score` VALUES(6, 15, 16, 5);
INSERT INTO `round_score` VALUES(6, 12, 16, 6);
INSERT INTO `round_score` VALUES(6, 8, 16, 5);
INSERT INTO `round_score` VALUES(6, 3, 16, 3);
INSERT INTO `round_score` VALUES(6, 2, 16, 4);
INSERT INTO `round_score` VALUES(6, 9, 16, 4);
INSERT INTO `round_score` VALUES(6, 1, 17, 6);
INSERT INTO `round_score` VALUES(6, 5, 17, 6);
INSERT INTO `round_score` VALUES(6, 15, 17, 8);
INSERT INTO `round_score` VALUES(6, 12, 17, 8);
INSERT INTO `round_score` VALUES(6, 8, 17, 5);
INSERT INTO `round_score` VALUES(6, 3, 17, 5);
INSERT INTO `round_score` VALUES(6, 2, 17, 5);
INSERT INTO `round_score` VALUES(6, 9, 17, 8);
INSERT INTO `round_score` VALUES(6, 8, 18, 5);
INSERT INTO `round_score` VALUES(6, 3, 18, 4);
INSERT INTO `round_score` VALUES(6, 2, 18, 4);
INSERT INTO `round_score` VALUES(6, 9, 18, 6);
INSERT INTO `round_score` VALUES(6, 7, 6, 6);
INSERT INTO `round_score` VALUES(6, 7, 7, 5);
INSERT INTO `round_score` VALUES(6, 7, 8, 4);
INSERT INTO `round_score` VALUES(6, 7, 9, 6);
INSERT INTO `round_score` VALUES(6, 7, 10, 4);
INSERT INTO `round_score` VALUES(6, 4, 10, 4);
INSERT INTO `round_score` VALUES(6, 13, 10, 5);
INSERT INTO `round_score` VALUES(6, 16, 10, 6);
INSERT INTO `round_score` VALUES(6, 7, 11, 6);
INSERT INTO `round_score` VALUES(6, 4, 11, 6);
INSERT INTO `round_score` VALUES(6, 13, 11, 6);
INSERT INTO `round_score` VALUES(6, 16, 11, 5);
INSERT INTO `round_score` VALUES(6, 7, 12, 5);
INSERT INTO `round_score` VALUES(6, 4, 12, 6);
INSERT INTO `round_score` VALUES(6, 13, 12, 6);
INSERT INTO `round_score` VALUES(6, 16, 12, 5);
INSERT INTO `round_score` VALUES(6, 7, 13, 5);
INSERT INTO `round_score` VALUES(6, 4, 13, 6);
INSERT INTO `round_score` VALUES(6, 13, 13, 4);
INSERT INTO `round_score` VALUES(6, 16, 13, 5);
INSERT INTO `round_score` VALUES(6, 7, 14, 3);
INSERT INTO `round_score` VALUES(6, 4, 14, 5);
INSERT INTO `round_score` VALUES(6, 13, 14, 5);
INSERT INTO `round_score` VALUES(6, 16, 14, 4);
INSERT INTO `round_score` VALUES(6, 7, 15, 6);
INSERT INTO `round_score` VALUES(6, 4, 15, 7);
INSERT INTO `round_score` VALUES(6, 13, 15, 6);
INSERT INTO `round_score` VALUES(6, 16, 15, 8);
INSERT INTO `round_score` VALUES(6, 7, 16, 4);
INSERT INTO `round_score` VALUES(6, 4, 16, 4);
INSERT INTO `round_score` VALUES(6, 13, 16, 4);
INSERT INTO `round_score` VALUES(6, 16, 16, 4);
INSERT INTO `round_score` VALUES(6, 7, 17, 6);
INSERT INTO `round_score` VALUES(6, 4, 17, 5);
INSERT INTO `round_score` VALUES(6, 13, 17, 4);
INSERT INTO `round_score` VALUES(6, 16, 17, 6);
INSERT INTO `round_score` VALUES(6, 7, 18, 5);
INSERT INTO `round_score` VALUES(6, 4, 18, 5);
INSERT INTO `round_score` VALUES(6, 13, 18, 4);
INSERT INTO `round_score` VALUES(6, 16, 18, 5);
INSERT INTO `round_score` VALUES(6, 8, 5, 5);
INSERT INTO `round_score` VALUES(6, 2, 5, 4);
INSERT INTO `round_score` VALUES(6, 9, 5, 6);
INSERT INTO `round_score` VALUES(6, 8, 6, 5);
INSERT INTO `round_score` VALUES(6, 2, 6, 7);
INSERT INTO `round_score` VALUES(6, 9, 6, 5);
INSERT INTO `round_score` VALUES(6, 4, 6, 6);
INSERT INTO `round_score` VALUES(6, 13, 6, 4);
INSERT INTO `round_score` VALUES(6, 16, 6, 4);
INSERT INTO `round_score` VALUES(6, 3, 7, 5);
INSERT INTO `round_score` VALUES(6, 2, 7, 5);
INSERT INTO `round_score` VALUES(6, 9, 7, 7);
INSERT INTO `round_score` VALUES(6, 4, 7, 5);
INSERT INTO `round_score` VALUES(6, 13, 7, 6);
INSERT INTO `round_score` VALUES(6, 16, 7, 7);
INSERT INTO `round_score` VALUES(6, 8, 8, 4);
INSERT INTO `round_score` VALUES(6, 2, 8, 4);
INSERT INTO `round_score` VALUES(6, 9, 8, 5);
INSERT INTO `round_score` VALUES(6, 4, 8, 5);
INSERT INTO `round_score` VALUES(6, 13, 8, 6);
INSERT INTO `round_score` VALUES(6, 16, 8, 4);
INSERT INTO `round_score` VALUES(6, 8, 9, 4);
INSERT INTO `round_score` VALUES(6, 2, 9, 5);
INSERT INTO `round_score` VALUES(6, 9, 9, 6);
INSERT INTO `round_score` VALUES(6, 4, 9, 5);
INSERT INTO `round_score` VALUES(6, 13, 9, 4);
INSERT INTO `round_score` VALUES(6, 16, 9, 6);
INSERT INTO `round_score` VALUES(1, 16, 1, 6);
INSERT INTO `round_score` VALUES(1, 3, 1, 5);
INSERT INTO `round_score` VALUES(1, 12, 1, 7);
INSERT INTO `round_score` VALUES(1, 11, 1, 7);
INSERT INTO `round_score` VALUES(1, 1, 1, 5);
INSERT INTO `round_score` VALUES(1, 5, 1, 5);
INSERT INTO `round_score` VALUES(1, 2, 1, 6);
INSERT INTO `round_score` VALUES(1, 6, 1, 6);
INSERT INTO `round_score` VALUES(1, 16, 2, 5);
INSERT INTO `round_score` VALUES(1, 3, 2, 5);
INSERT INTO `round_score` VALUES(1, 12, 2, 6);
INSERT INTO `round_score` VALUES(1, 11, 2, 7);
INSERT INTO `round_score` VALUES(1, 9, 1, 5);
INSERT INTO `round_score` VALUES(1, 8, 1, 6);
INSERT INTO `round_score` VALUES(1, 13, 1, 5);
INSERT INTO `round_score` VALUES(1, 4, 1, 5);
INSERT INTO `round_score` VALUES(1, 1, 2, 5);
INSERT INTO `round_score` VALUES(1, 5, 2, 5);
INSERT INTO `round_score` VALUES(1, 2, 2, 5);
INSERT INTO `round_score` VALUES(1, 6, 2, 4);
INSERT INTO `round_score` VALUES(1, 16, 3, 6);
INSERT INTO `round_score` VALUES(1, 3, 3, 5);
INSERT INTO `round_score` VALUES(1, 12, 3, 6);
INSERT INTO `round_score` VALUES(1, 11, 3, 5);
INSERT INTO `round_score` VALUES(1, 9, 2, 5);
INSERT INTO `round_score` VALUES(1, 8, 2, 5);
INSERT INTO `round_score` VALUES(1, 13, 2, 5);
INSERT INTO `round_score` VALUES(1, 4, 2, 5);
INSERT INTO `round_score` VALUES(1, 1, 3, 5);
INSERT INTO `round_score` VALUES(1, 5, 3, 6);
INSERT INTO `round_score` VALUES(1, 2, 3, 5);
INSERT INTO `round_score` VALUES(1, 6, 3, 6);
INSERT INTO `round_score` VALUES(1, 16, 4, 5);
INSERT INTO `round_score` VALUES(1, 3, 4, 5);
INSERT INTO `round_score` VALUES(1, 12, 4, 6);
INSERT INTO `round_score` VALUES(1, 11, 4, 6);
INSERT INTO `round_score` VALUES(1, 9, 3, 5);
INSERT INTO `round_score` VALUES(1, 8, 3, 5);
INSERT INTO `round_score` VALUES(1, 13, 3, 4);
INSERT INTO `round_score` VALUES(1, 4, 3, 8);
INSERT INTO `round_score` VALUES(1, 1, 4, 6);
INSERT INTO `round_score` VALUES(1, 5, 4, 7);
INSERT INTO `round_score` VALUES(1, 2, 4, 4);
INSERT INTO `round_score` VALUES(1, 6, 4, 6);
INSERT INTO `round_score` VALUES(1, 16, 5, 4);
INSERT INTO `round_score` VALUES(1, 3, 5, 5);
INSERT INTO `round_score` VALUES(1, 12, 5, 5);
INSERT INTO `round_score` VALUES(1, 11, 5, 5);
INSERT INTO `round_score` VALUES(1, 9, 4, 5);
INSERT INTO `round_score` VALUES(1, 8, 4, 6);
INSERT INTO `round_score` VALUES(1, 13, 4, 6);
INSERT INTO `round_score` VALUES(1, 4, 4, 6);
INSERT INTO `round_score` VALUES(1, 1, 5, 5);
INSERT INTO `round_score` VALUES(1, 5, 5, 6);
INSERT INTO `round_score` VALUES(1, 2, 5, 5);
INSERT INTO `round_score` VALUES(1, 6, 5, 4);
INSERT INTO `round_score` VALUES(1, 16, 6, 3);
INSERT INTO `round_score` VALUES(1, 3, 6, 4);
INSERT INTO `round_score` VALUES(1, 12, 6, 4);
INSERT INTO `round_score` VALUES(1, 11, 6, 4);
INSERT INTO `round_score` VALUES(1, 9, 5, 5);
INSERT INTO `round_score` VALUES(1, 8, 5, 5);
INSERT INTO `round_score` VALUES(1, 13, 5, 5);
INSERT INTO `round_score` VALUES(1, 4, 5, 4);
INSERT INTO `round_score` VALUES(1, 1, 6, 5);
INSERT INTO `round_score` VALUES(1, 5, 6, 4);
INSERT INTO `round_score` VALUES(1, 2, 6, 3);
INSERT INTO `round_score` VALUES(1, 6, 6, 5);
INSERT INTO `round_score` VALUES(1, 16, 7, 4);
INSERT INTO `round_score` VALUES(1, 3, 7, 3);
INSERT INTO `round_score` VALUES(1, 12, 7, 6);
INSERT INTO `round_score` VALUES(1, 11, 7, 4);
INSERT INTO `round_score` VALUES(1, 9, 6, 4);
INSERT INTO `round_score` VALUES(1, 8, 6, 4);
INSERT INTO `round_score` VALUES(1, 13, 6, 3);
INSERT INTO `round_score` VALUES(1, 4, 6, 4);
INSERT INTO `round_score` VALUES(1, 16, 8, 4);
INSERT INTO `round_score` VALUES(1, 3, 8, 3);
INSERT INTO `round_score` VALUES(1, 12, 8, 4);
INSERT INTO `round_score` VALUES(1, 11, 8, 2);
INSERT INTO `round_score` VALUES(1, 1, 7, 5);
INSERT INTO `round_score` VALUES(1, 5, 7, 5);
INSERT INTO `round_score` VALUES(1, 2, 7, 4);
INSERT INTO `round_score` VALUES(1, 6, 7, 4);
INSERT INTO `round_score` VALUES(1, 1, 8, 4);
INSERT INTO `round_score` VALUES(1, 5, 8, 4);
INSERT INTO `round_score` VALUES(1, 2, 8, 4);
INSERT INTO `round_score` VALUES(1, 6, 8, 3);
INSERT INTO `round_score` VALUES(1, 9, 7, 6);
INSERT INTO `round_score` VALUES(1, 8, 7, 6);
INSERT INTO `round_score` VALUES(1, 13, 7, 4);
INSERT INTO `round_score` VALUES(1, 4, 7, 6);
INSERT INTO `round_score` VALUES(1, 16, 9, 5);
INSERT INTO `round_score` VALUES(1, 3, 9, 4);
INSERT INTO `round_score` VALUES(1, 12, 9, 6);
INSERT INTO `round_score` VALUES(1, 11, 9, 6);
INSERT INTO `round_score` VALUES(1, 1, 9, 7);
INSERT INTO `round_score` VALUES(1, 5, 9, 4);
INSERT INTO `round_score` VALUES(1, 2, 9, 5);
INSERT INTO `round_score` VALUES(1, 6, 9, 4);
INSERT INTO `round_score` VALUES(1, 16, 10, 5);
INSERT INTO `round_score` VALUES(1, 3, 10, 5);
INSERT INTO `round_score` VALUES(1, 12, 10, 6);
INSERT INTO `round_score` VALUES(1, 11, 10, 6);
INSERT INTO `round_score` VALUES(1, 9, 8, 5);
INSERT INTO `round_score` VALUES(1, 8, 8, 3);
INSERT INTO `round_score` VALUES(1, 13, 8, 4);
INSERT INTO `round_score` VALUES(1, 4, 8, 4);
INSERT INTO `round_score` VALUES(1, 9, 9, 5);
INSERT INTO `round_score` VALUES(1, 8, 9, 5);
INSERT INTO `round_score` VALUES(1, 13, 9, 5);
INSERT INTO `round_score` VALUES(1, 4, 9, 5);
INSERT INTO `round_score` VALUES(1, 1, 10, 5);
INSERT INTO `round_score` VALUES(1, 5, 10, 6);
INSERT INTO `round_score` VALUES(1, 2, 10, 4);
INSERT INTO `round_score` VALUES(1, 6, 10, 6);
INSERT INTO `round_score` VALUES(1, 16, 11, 4);
INSERT INTO `round_score` VALUES(1, 3, 11, 5);
INSERT INTO `round_score` VALUES(1, 12, 11, 6);
INSERT INTO `round_score` VALUES(1, 11, 11, 5);
INSERT INTO `round_score` VALUES(1, 1, 11, 4);
INSERT INTO `round_score` VALUES(1, 5, 11, 6);
INSERT INTO `round_score` VALUES(1, 2, 11, 5);
INSERT INTO `round_score` VALUES(1, 6, 11, 4);
INSERT INTO `round_score` VALUES(1, 9, 10, 6);
INSERT INTO `round_score` VALUES(1, 8, 10, 6);
INSERT INTO `round_score` VALUES(1, 13, 10, 7);
INSERT INTO `round_score` VALUES(1, 4, 10, 7);
INSERT INTO `round_score` VALUES(1, 16, 12, 7);
INSERT INTO `round_score` VALUES(1, 3, 12, 6);
INSERT INTO `round_score` VALUES(1, 12, 12, 7);
INSERT INTO `round_score` VALUES(1, 11, 12, 7);
INSERT INTO `round_score` VALUES(1, 1, 12, 6);
INSERT INTO `round_score` VALUES(1, 5, 12, 5);
INSERT INTO `round_score` VALUES(1, 2, 12, 5);
INSERT INTO `round_score` VALUES(1, 6, 12, 4);
INSERT INTO `round_score` VALUES(1, 9, 11, 5);
INSERT INTO `round_score` VALUES(1, 8, 11, 7);
INSERT INTO `round_score` VALUES(1, 13, 11, 8);
INSERT INTO `round_score` VALUES(1, 4, 11, 5);
INSERT INTO `round_score` VALUES(1, 16, 13, 4);
INSERT INTO `round_score` VALUES(1, 3, 13, 7);
INSERT INTO `round_score` VALUES(1, 12, 13, 6);
INSERT INTO `round_score` VALUES(1, 11, 13, 4);
INSERT INTO `round_score` VALUES(1, 1, 13, 2);
INSERT INTO `round_score` VALUES(1, 5, 13, 5);
INSERT INTO `round_score` VALUES(1, 2, 13, 4);
INSERT INTO `round_score` VALUES(1, 6, 13, 3);
INSERT INTO `round_score` VALUES(1, 9, 12, 5);
INSERT INTO `round_score` VALUES(1, 8, 12, 7);
INSERT INTO `round_score` VALUES(1, 13, 12, 6);
INSERT INTO `round_score` VALUES(1, 4, 12, 6);
INSERT INTO `round_score` VALUES(1, 16, 14, 6);
INSERT INTO `round_score` VALUES(1, 3, 14, 6);
INSERT INTO `round_score` VALUES(1, 12, 14, 8);
INSERT INTO `round_score` VALUES(1, 11, 14, 6);
INSERT INTO `round_score` VALUES(1, 9, 13, 8);
INSERT INTO `round_score` VALUES(1, 8, 13, 3);
INSERT INTO `round_score` VALUES(1, 13, 13, 4);
INSERT INTO `round_score` VALUES(1, 4, 13, 3);
INSERT INTO `round_score` VALUES(1, 16, 15, 4);
INSERT INTO `round_score` VALUES(1, 3, 15, 5);
INSERT INTO `round_score` VALUES(1, 12, 15, 4);
INSERT INTO `round_score` VALUES(1, 11, 15, 5);
INSERT INTO `round_score` VALUES(1, 1, 14, 6);
INSERT INTO `round_score` VALUES(1, 5, 14, 6);
INSERT INTO `round_score` VALUES(1, 2, 14, 4);
INSERT INTO `round_score` VALUES(1, 6, 14, 4);
INSERT INTO `round_score` VALUES(1, 9, 14, 7);
INSERT INTO `round_score` VALUES(1, 8, 14, 5);
INSERT INTO `round_score` VALUES(1, 13, 14, 6);
INSERT INTO `round_score` VALUES(1, 4, 14, 7);
INSERT INTO `round_score` VALUES(1, 16, 16, 5);
INSERT INTO `round_score` VALUES(1, 3, 16, 5);
INSERT INTO `round_score` VALUES(1, 12, 16, 7);
INSERT INTO `round_score` VALUES(1, 11, 16, 4);
INSERT INTO `round_score` VALUES(1, 9, 15, 3);
INSERT INTO `round_score` VALUES(1, 8, 15, 4);
INSERT INTO `round_score` VALUES(1, 13, 15, 3);
INSERT INTO `round_score` VALUES(1, 4, 15, 3);
INSERT INTO `round_score` VALUES(1, 1, 15, 5);
INSERT INTO `round_score` VALUES(1, 5, 15, 3);
INSERT INTO `round_score` VALUES(1, 2, 15, 4);
INSERT INTO `round_score` VALUES(1, 6, 15, 3);
INSERT INTO `round_score` VALUES(1, 1, 16, 3);
INSERT INTO `round_score` VALUES(1, 5, 16, 6);
INSERT INTO `round_score` VALUES(1, 2, 16, 5);
INSERT INTO `round_score` VALUES(1, 6, 16, 5);
INSERT INTO `round_score` VALUES(1, 16, 17, 6);
INSERT INTO `round_score` VALUES(1, 3, 17, 7);
INSERT INTO `round_score` VALUES(1, 12, 17, 6);
INSERT INTO `round_score` VALUES(1, 11, 17, 7);
INSERT INTO `round_score` VALUES(1, 9, 16, 5);
INSERT INTO `round_score` VALUES(1, 8, 16, 5);
INSERT INTO `round_score` VALUES(1, 13, 16, 5);
INSERT INTO `round_score` VALUES(1, 4, 16, 4);
INSERT INTO `round_score` VALUES(1, 1, 17, 5);
INSERT INTO `round_score` VALUES(1, 5, 17, 6);
INSERT INTO `round_score` VALUES(1, 2, 17, 5);
INSERT INTO `round_score` VALUES(1, 6, 17, 5);
INSERT INTO `round_score` VALUES(1, 16, 18, 5);
INSERT INTO `round_score` VALUES(1, 3, 18, 4);
INSERT INTO `round_score` VALUES(1, 12, 18, 6);
INSERT INTO `round_score` VALUES(1, 11, 18, 5);
INSERT INTO `round_score` VALUES(1, 1, 18, 5);
INSERT INTO `round_score` VALUES(1, 5, 18, 5);
INSERT INTO `round_score` VALUES(1, 2, 18, 5);
INSERT INTO `round_score` VALUES(1, 6, 18, 5);
INSERT INTO `round_score` VALUES(1, 9, 17, 8);
INSERT INTO `round_score` VALUES(1, 8, 17, 7);
INSERT INTO `round_score` VALUES(1, 13, 17, 5);
INSERT INTO `round_score` VALUES(1, 4, 17, 6);
INSERT INTO `round_score` VALUES(1, 9, 18, 6);
INSERT INTO `round_score` VALUES(1, 8, 18, 4);
INSERT INTO `round_score` VALUES(1, 13, 18, 6);
INSERT INTO `round_score` VALUES(1, 4, 18, 5);
INSERT INTO `round_score` VALUES(1, 15, 1, 6);
INSERT INTO `round_score` VALUES(1, 10, 1, 7);
INSERT INTO `round_score` VALUES(1, 14, 1, 6);
INSERT INTO `round_score` VALUES(1, 7, 1, 6);
INSERT INTO `round_score` VALUES(1, 15, 2, 5);
INSERT INTO `round_score` VALUES(1, 10, 2, 5);
INSERT INTO `round_score` VALUES(1, 14, 2, 6);
INSERT INTO `round_score` VALUES(1, 7, 2, 5);
INSERT INTO `round_score` VALUES(1, 15, 3, 6);
INSERT INTO `round_score` VALUES(1, 10, 3, 6);
INSERT INTO `round_score` VALUES(1, 14, 3, 7);
INSERT INTO `round_score` VALUES(1, 7, 3, 6);
INSERT INTO `round_score` VALUES(1, 15, 4, 6);
INSERT INTO `round_score` VALUES(1, 10, 4, 7);
INSERT INTO `round_score` VALUES(1, 14, 4, 6);
INSERT INTO `round_score` VALUES(1, 7, 4, 5);
INSERT INTO `round_score` VALUES(1, 15, 5, 6);
INSERT INTO `round_score` VALUES(1, 10, 5, 5);
INSERT INTO `round_score` VALUES(1, 14, 5, 4);
INSERT INTO `round_score` VALUES(1, 7, 5, 4);
INSERT INTO `round_score` VALUES(1, 15, 6, 3);
INSERT INTO `round_score` VALUES(1, 10, 6, 2);
INSERT INTO `round_score` VALUES(1, 14, 6, 3);
INSERT INTO `round_score` VALUES(1, 7, 6, 3);
INSERT INTO `round_score` VALUES(1, 15, 7, 8);
INSERT INTO `round_score` VALUES(1, 10, 7, 6);
INSERT INTO `round_score` VALUES(1, 14, 7, 4);
INSERT INTO `round_score` VALUES(1, 7, 7, 5);
INSERT INTO `round_score` VALUES(1, 15, 8, 4);
INSERT INTO `round_score` VALUES(1, 10, 8, 4);
INSERT INTO `round_score` VALUES(1, 14, 8, 6);
INSERT INTO `round_score` VALUES(1, 7, 8, 4);
INSERT INTO `round_score` VALUES(1, 15, 9, 4);
INSERT INTO `round_score` VALUES(1, 10, 9, 6);
INSERT INTO `round_score` VALUES(1, 14, 9, 7);
INSERT INTO `round_score` VALUES(1, 7, 9, 5);
INSERT INTO `round_score` VALUES(1, 15, 10, 4);
INSERT INTO `round_score` VALUES(1, 10, 10, 7);
INSERT INTO `round_score` VALUES(1, 14, 10, 5);
INSERT INTO `round_score` VALUES(1, 7, 10, 5);
INSERT INTO `round_score` VALUES(1, 15, 11, 5);
INSERT INTO `round_score` VALUES(1, 10, 11, 6);
INSERT INTO `round_score` VALUES(1, 14, 11, 6);
INSERT INTO `round_score` VALUES(1, 7, 11, 5);
INSERT INTO `round_score` VALUES(1, 15, 12, 5);
INSERT INTO `round_score` VALUES(1, 10, 12, 5);
INSERT INTO `round_score` VALUES(1, 14, 12, 6);
INSERT INTO `round_score` VALUES(1, 7, 12, 7);
INSERT INTO `round_score` VALUES(1, 15, 13, 5);
INSERT INTO `round_score` VALUES(1, 10, 13, 3);
INSERT INTO `round_score` VALUES(1, 14, 13, 3);
INSERT INTO `round_score` VALUES(1, 7, 13, 3);
INSERT INTO `round_score` VALUES(1, 15, 14, 7);
INSERT INTO `round_score` VALUES(1, 10, 14, 6);
INSERT INTO `round_score` VALUES(1, 14, 14, 6);
INSERT INTO `round_score` VALUES(1, 7, 14, 5);
INSERT INTO `round_score` VALUES(1, 15, 15, 4);
INSERT INTO `round_score` VALUES(1, 10, 15, 4);
INSERT INTO `round_score` VALUES(1, 14, 15, 8);
INSERT INTO `round_score` VALUES(1, 7, 15, 3);
INSERT INTO `round_score` VALUES(1, 15, 16, 4);
INSERT INTO `round_score` VALUES(1, 10, 16, 6);
INSERT INTO `round_score` VALUES(1, 14, 16, 5);
INSERT INTO `round_score` VALUES(1, 7, 16, 5);
INSERT INTO `round_score` VALUES(1, 15, 17, 7);
INSERT INTO `round_score` VALUES(1, 10, 17, 8);
INSERT INTO `round_score` VALUES(1, 14, 17, 5);
INSERT INTO `round_score` VALUES(1, 7, 17, 5);
INSERT INTO `round_score` VALUES(1, 15, 18, 6);
INSERT INTO `round_score` VALUES(1, 10, 18, 6);
INSERT INTO `round_score` VALUES(1, 14, 18, 5);
INSERT INTO `round_score` VALUES(1, 7, 18, 5);
INSERT INTO `round_score` VALUES(2, 16, 1, 6);
INSERT INTO `round_score` VALUES(2, 5, 1, 5);
INSERT INTO `round_score` VALUES(2, 11, 1, 6);
INSERT INTO `round_score` VALUES(2, 4, 1, 8);
INSERT INTO `round_score` VALUES(2, 1, 1, 5);
INSERT INTO `round_score` VALUES(2, 3, 1, 5);
INSERT INTO `round_score` VALUES(2, 14, 1, 6);
INSERT INTO `round_score` VALUES(2, 6, 1, 6);
INSERT INTO `round_score` VALUES(2, 15, 1, 5);
INSERT INTO `round_score` VALUES(2, 9, 1, 6);
INSERT INTO `round_score` VALUES(2, 13, 1, 6);
INSERT INTO `round_score` VALUES(2, 12, 1, 7);
INSERT INTO `round_score` VALUES(2, 16, 2, 6);
INSERT INTO `round_score` VALUES(2, 5, 2, 8);
INSERT INTO `round_score` VALUES(2, 11, 2, 7);
INSERT INTO `round_score` VALUES(2, 4, 2, 6);
INSERT INTO `round_score` VALUES(2, 1, 2, 6);
INSERT INTO `round_score` VALUES(2, 3, 2, 6);
INSERT INTO `round_score` VALUES(2, 14, 2, 5);
INSERT INTO `round_score` VALUES(2, 6, 2, 5);
INSERT INTO `round_score` VALUES(2, 10, 1, 5);
INSERT INTO `round_score` VALUES(2, 8, 1, 6);
INSERT INTO `round_score` VALUES(2, 2, 1, 4);
INSERT INTO `round_score` VALUES(2, 7, 1, 5);
INSERT INTO `round_score` VALUES(2, 15, 2, 7);
INSERT INTO `round_score` VALUES(2, 9, 2, 5);
INSERT INTO `round_score` VALUES(2, 13, 2, 6);
INSERT INTO `round_score` VALUES(2, 12, 2, 8);
INSERT INTO `round_score` VALUES(2, 16, 3, 5);
INSERT INTO `round_score` VALUES(2, 5, 3, 6);
INSERT INTO `round_score` VALUES(2, 11, 3, 6);
INSERT INTO `round_score` VALUES(2, 4, 3, 4);
INSERT INTO `round_score` VALUES(2, 10, 2, 6);
INSERT INTO `round_score` VALUES(2, 8, 2, 7);
INSERT INTO `round_score` VALUES(2, 2, 2, 5);
INSERT INTO `round_score` VALUES(2, 7, 2, 6);
INSERT INTO `round_score` VALUES(2, 1, 3, 7);
INSERT INTO `round_score` VALUES(2, 3, 3, 4);
INSERT INTO `round_score` VALUES(2, 14, 3, 5);
INSERT INTO `round_score` VALUES(2, 6, 3, 4);
INSERT INTO `round_score` VALUES(2, 16, 4, 6);
INSERT INTO `round_score` VALUES(2, 5, 4, 4);
INSERT INTO `round_score` VALUES(2, 11, 4, 4);
INSERT INTO `round_score` VALUES(2, 4, 4, 3);
INSERT INTO `round_score` VALUES(2, 15, 3, 6);
INSERT INTO `round_score` VALUES(2, 9, 3, 7);
INSERT INTO `round_score` VALUES(2, 13, 3, 6);
INSERT INTO `round_score` VALUES(2, 12, 3, 5);
INSERT INTO `round_score` VALUES(2, 1, 4, 7);
INSERT INTO `round_score` VALUES(2, 3, 4, 6);
INSERT INTO `round_score` VALUES(2, 14, 4, 2);
INSERT INTO `round_score` VALUES(2, 6, 4, 4);
INSERT INTO `round_score` VALUES(2, 10, 3, 6);
INSERT INTO `round_score` VALUES(2, 8, 3, 4);
INSERT INTO `round_score` VALUES(2, 2, 3, 4);
INSERT INTO `round_score` VALUES(2, 7, 3, 5);
INSERT INTO `round_score` VALUES(2, 16, 5, 5);
INSERT INTO `round_score` VALUES(2, 5, 5, 5);
INSERT INTO `round_score` VALUES(2, 11, 5, 5);
INSERT INTO `round_score` VALUES(2, 4, 5, 6);
INSERT INTO `round_score` VALUES(2, 15, 4, 3);
INSERT INTO `round_score` VALUES(2, 9, 4, 5);
INSERT INTO `round_score` VALUES(2, 13, 4, 3);
INSERT INTO `round_score` VALUES(2, 12, 4, 4);
INSERT INTO `round_score` VALUES(2, 1, 5, 6);
INSERT INTO `round_score` VALUES(2, 3, 5, 4);
INSERT INTO `round_score` VALUES(2, 14, 5, 5);
INSERT INTO `round_score` VALUES(2, 6, 5, 5);
INSERT INTO `round_score` VALUES(2, 16, 6, 6);
INSERT INTO `round_score` VALUES(2, 5, 6, 6);
INSERT INTO `round_score` VALUES(2, 11, 6, 4);
INSERT INTO `round_score` VALUES(2, 4, 6, 6);
INSERT INTO `round_score` VALUES(2, 10, 4, 2);
INSERT INTO `round_score` VALUES(2, 8, 4, 4);
INSERT INTO `round_score` VALUES(2, 2, 4, 5);
INSERT INTO `round_score` VALUES(2, 7, 4, 3);
INSERT INTO `round_score` VALUES(2, 15, 5, 8);
INSERT INTO `round_score` VALUES(2, 9, 5, 6);
INSERT INTO `round_score` VALUES(2, 13, 5, 5);
INSERT INTO `round_score` VALUES(2, 12, 5, 6);
INSERT INTO `round_score` VALUES(2, 1, 6, 5);
INSERT INTO `round_score` VALUES(2, 3, 6, 3);
INSERT INTO `round_score` VALUES(2, 14, 6, 3);
INSERT INTO `round_score` VALUES(2, 6, 6, 4);
INSERT INTO `round_score` VALUES(2, 16, 7, 8);
INSERT INTO `round_score` VALUES(2, 5, 7, 5);
INSERT INTO `round_score` VALUES(2, 11, 7, 6);
INSERT INTO `round_score` VALUES(2, 4, 7, 5);
INSERT INTO `round_score` VALUES(2, 10, 5, 7);
INSERT INTO `round_score` VALUES(2, 8, 5, 7);
INSERT INTO `round_score` VALUES(2, 2, 5, 6);
INSERT INTO `round_score` VALUES(2, 7, 5, 6);
INSERT INTO `round_score` VALUES(2, 15, 6, 5);
INSERT INTO `round_score` VALUES(2, 9, 6, 5);
INSERT INTO `round_score` VALUES(2, 13, 6, 5);
INSERT INTO `round_score` VALUES(2, 12, 6, 4);
INSERT INTO `round_score` VALUES(2, 10, 6, 3);
INSERT INTO `round_score` VALUES(2, 8, 6, 3);
INSERT INTO `round_score` VALUES(2, 2, 6, 3);
INSERT INTO `round_score` VALUES(2, 7, 6, 4);
INSERT INTO `round_score` VALUES(2, 1, 7, 7);
INSERT INTO `round_score` VALUES(2, 3, 7, 4);
INSERT INTO `round_score` VALUES(2, 14, 7, 8);
INSERT INTO `round_score` VALUES(2, 6, 7, 5);
INSERT INTO `round_score` VALUES(2, 16, 8, 4);
INSERT INTO `round_score` VALUES(2, 5, 8, 4);
INSERT INTO `round_score` VALUES(2, 11, 8, 6);
INSERT INTO `round_score` VALUES(2, 4, 8, 6);
INSERT INTO `round_score` VALUES(2, 15, 7, 8);
INSERT INTO `round_score` VALUES(2, 9, 7, 8);
INSERT INTO `round_score` VALUES(2, 13, 7, 8);
INSERT INTO `round_score` VALUES(2, 12, 7, 7);
INSERT INTO `round_score` VALUES(2, 10, 7, 8);
INSERT INTO `round_score` VALUES(2, 8, 7, 5);
INSERT INTO `round_score` VALUES(2, 2, 7, 7);
INSERT INTO `round_score` VALUES(2, 7, 7, 7);
INSERT INTO `round_score` VALUES(2, 16, 9, 5);
INSERT INTO `round_score` VALUES(2, 5, 9, 7);
INSERT INTO `round_score` VALUES(2, 11, 9, 6);
INSERT INTO `round_score` VALUES(2, 4, 9, 7);
INSERT INTO `round_score` VALUES(2, 15, 8, 6);
INSERT INTO `round_score` VALUES(2, 9, 8, 6);
INSERT INTO `round_score` VALUES(2, 13, 8, 5);
INSERT INTO `round_score` VALUES(2, 12, 8, 6);
INSERT INTO `round_score` VALUES(2, 1, 8, 4);
INSERT INTO `round_score` VALUES(2, 3, 8, 4);
INSERT INTO `round_score` VALUES(2, 14, 8, 5);
INSERT INTO `round_score` VALUES(2, 6, 8, 4);
INSERT INTO `round_score` VALUES(2, 10, 8, 5);
INSERT INTO `round_score` VALUES(2, 8, 8, 5);
INSERT INTO `round_score` VALUES(2, 2, 8, 4);
INSERT INTO `round_score` VALUES(2, 7, 8, 4);
INSERT INTO `round_score` VALUES(2, 1, 9, 5);
INSERT INTO `round_score` VALUES(2, 3, 9, 4);
INSERT INTO `round_score` VALUES(2, 14, 9, 6);
INSERT INTO `round_score` VALUES(2, 6, 9, 7);
INSERT INTO `round_score` VALUES(2, 16, 10, 7);
INSERT INTO `round_score` VALUES(2, 5, 10, 6);
INSERT INTO `round_score` VALUES(2, 11, 10, 6);
INSERT INTO `round_score` VALUES(2, 4, 10, 8);
INSERT INTO `round_score` VALUES(2, 15, 9, 8);
INSERT INTO `round_score` VALUES(2, 9, 9, 5);
INSERT INTO `round_score` VALUES(2, 13, 9, 4);
INSERT INTO `round_score` VALUES(2, 12, 9, 8);
INSERT INTO `round_score` VALUES(2, 10, 9, 6);
INSERT INTO `round_score` VALUES(2, 8, 9, 4);
INSERT INTO `round_score` VALUES(2, 2, 9, 5);
INSERT INTO `round_score` VALUES(2, 7, 9, 4);
INSERT INTO `round_score` VALUES(2, 1, 10, 5);
INSERT INTO `round_score` VALUES(2, 3, 10, 5);
INSERT INTO `round_score` VALUES(2, 14, 10, 6);
INSERT INTO `round_score` VALUES(2, 6, 10, 6);
INSERT INTO `round_score` VALUES(2, 16, 11, 3);
INSERT INTO `round_score` VALUES(2, 5, 11, 5);
INSERT INTO `round_score` VALUES(2, 11, 11, 3);
INSERT INTO `round_score` VALUES(2, 4, 11, 4);
INSERT INTO `round_score` VALUES(2, 1, 11, 5);
INSERT INTO `round_score` VALUES(2, 3, 11, 3);
INSERT INTO `round_score` VALUES(2, 14, 11, 4);
INSERT INTO `round_score` VALUES(2, 6, 11, 3);
INSERT INTO `round_score` VALUES(2, 16, 12, 5);
INSERT INTO `round_score` VALUES(2, 5, 12, 3);
INSERT INTO `round_score` VALUES(2, 11, 12, 4);
INSERT INTO `round_score` VALUES(2, 4, 12, 4);
INSERT INTO `round_score` VALUES(2, 10, 10, 7);
INSERT INTO `round_score` VALUES(2, 8, 10, 7);
INSERT INTO `round_score` VALUES(2, 2, 10, 6);
INSERT INTO `round_score` VALUES(2, 7, 10, 5);
INSERT INTO `round_score` VALUES(2, 15, 10, 7);
INSERT INTO `round_score` VALUES(2, 9, 10, 6);
INSERT INTO `round_score` VALUES(2, 13, 10, 6);
INSERT INTO `round_score` VALUES(2, 12, 10, 5);
INSERT INTO `round_score` VALUES(2, 15, 11, 3);
INSERT INTO `round_score` VALUES(2, 9, 11, 4);
INSERT INTO `round_score` VALUES(2, 13, 11, 4);
INSERT INTO `round_score` VALUES(2, 12, 11, 3);
INSERT INTO `round_score` VALUES(2, 10, 11, 5);
INSERT INTO `round_score` VALUES(2, 8, 11, 4);
INSERT INTO `round_score` VALUES(2, 2, 11, 3);
INSERT INTO `round_score` VALUES(2, 7, 11, 4);
INSERT INTO `round_score` VALUES(2, 15, 12, 6);
INSERT INTO `round_score` VALUES(2, 9, 12, 4);
INSERT INTO `round_score` VALUES(2, 13, 12, 6);
INSERT INTO `round_score` VALUES(2, 12, 12, 6);
INSERT INTO `round_score` VALUES(2, 1, 12, 5);
INSERT INTO `round_score` VALUES(2, 3, 12, 6);
INSERT INTO `round_score` VALUES(2, 14, 12, 4);
INSERT INTO `round_score` VALUES(2, 6, 12, 4);
INSERT INTO `round_score` VALUES(2, 1, 13, 5);
INSERT INTO `round_score` VALUES(2, 3, 13, 4);
INSERT INTO `round_score` VALUES(2, 14, 13, 5);
INSERT INTO `round_score` VALUES(2, 6, 13, 5);
INSERT INTO `round_score` VALUES(2, 10, 12, 5);
INSERT INTO `round_score` VALUES(2, 8, 12, 5);
INSERT INTO `round_score` VALUES(2, 2, 12, 4);
INSERT INTO `round_score` VALUES(2, 7, 12, 5);
INSERT INTO `round_score` VALUES(2, 16, 13, 4);
INSERT INTO `round_score` VALUES(2, 5, 13, 6);
INSERT INTO `round_score` VALUES(2, 11, 13, 5);
INSERT INTO `round_score` VALUES(2, 4, 13, 6);
INSERT INTO `round_score` VALUES(2, 16, 14, 6);
INSERT INTO `round_score` VALUES(2, 5, 14, 4);
INSERT INTO `round_score` VALUES(2, 11, 14, 7);
INSERT INTO `round_score` VALUES(2, 4, 14, 6);
INSERT INTO `round_score` VALUES(2, 15, 13, 8);
INSERT INTO `round_score` VALUES(2, 9, 13, 5);
INSERT INTO `round_score` VALUES(2, 13, 13, 5);
INSERT INTO `round_score` VALUES(2, 12, 13, 6);
INSERT INTO `round_score` VALUES(2, 10, 13, 6);
INSERT INTO `round_score` VALUES(2, 8, 13, 4);
INSERT INTO `round_score` VALUES(2, 2, 13, 6);
INSERT INTO `round_score` VALUES(2, 7, 13, 5);
INSERT INTO `round_score` VALUES(2, 1, 14, 6);
INSERT INTO `round_score` VALUES(2, 3, 14, 5);
INSERT INTO `round_score` VALUES(2, 14, 14, 5);
INSERT INTO `round_score` VALUES(2, 6, 14, 4);
INSERT INTO `round_score` VALUES(2, 16, 15, 4);
INSERT INTO `round_score` VALUES(2, 5, 15, 7);
INSERT INTO `round_score` VALUES(2, 11, 15, 3);
INSERT INTO `round_score` VALUES(2, 4, 15, 6);
INSERT INTO `round_score` VALUES(2, 15, 14, 7);
INSERT INTO `round_score` VALUES(2, 9, 14, 7);
INSERT INTO `round_score` VALUES(2, 13, 14, 6);
INSERT INTO `round_score` VALUES(2, 12, 14, 6);
INSERT INTO `round_score` VALUES(2, 1, 15, 4);
INSERT INTO `round_score` VALUES(2, 3, 15, 2);
INSERT INTO `round_score` VALUES(2, 14, 15, 4);
INSERT INTO `round_score` VALUES(2, 6, 15, 6);
INSERT INTO `round_score` VALUES(2, 10, 14, 7);
INSERT INTO `round_score` VALUES(2, 8, 14, 6);
INSERT INTO `round_score` VALUES(2, 2, 14, 6);
INSERT INTO `round_score` VALUES(2, 7, 14, 6);
INSERT INTO `round_score` VALUES(2, 16, 16, 5);
INSERT INTO `round_score` VALUES(2, 5, 16, 7);
INSERT INTO `round_score` VALUES(2, 11, 16, 5);
INSERT INTO `round_score` VALUES(2, 4, 16, 5);
INSERT INTO `round_score` VALUES(2, 15, 15, 5);
INSERT INTO `round_score` VALUES(2, 9, 15, 6);
INSERT INTO `round_score` VALUES(2, 13, 15, 4);
INSERT INTO `round_score` VALUES(2, 12, 15, 8);
INSERT INTO `round_score` VALUES(2, 1, 16, 5);
INSERT INTO `round_score` VALUES(2, 3, 16, 5);
INSERT INTO `round_score` VALUES(2, 14, 16, 5);
INSERT INTO `round_score` VALUES(2, 6, 16, 5);
INSERT INTO `round_score` VALUES(2, 16, 17, 4);
INSERT INTO `round_score` VALUES(2, 5, 17, 3);
INSERT INTO `round_score` VALUES(2, 11, 17, 4);
INSERT INTO `round_score` VALUES(2, 4, 17, 3);
INSERT INTO `round_score` VALUES(2, 10, 15, 5);
INSERT INTO `round_score` VALUES(2, 8, 15, 3);
INSERT INTO `round_score` VALUES(2, 2, 15, 4);
INSERT INTO `round_score` VALUES(2, 7, 15, 4);
INSERT INTO `round_score` VALUES(2, 15, 16, 6);
INSERT INTO `round_score` VALUES(2, 9, 16, 6);
INSERT INTO `round_score` VALUES(2, 13, 16, 6);
INSERT INTO `round_score` VALUES(2, 12, 16, 5);
INSERT INTO `round_score` VALUES(2, 1, 17, 5);
INSERT INTO `round_score` VALUES(2, 3, 17, 4);
INSERT INTO `round_score` VALUES(2, 14, 17, 4);
INSERT INTO `round_score` VALUES(2, 6, 17, 4);
INSERT INTO `round_score` VALUES(2, 10, 16, 5);
INSERT INTO `round_score` VALUES(2, 8, 16, 4);
INSERT INTO `round_score` VALUES(2, 2, 16, 5);
INSERT INTO `round_score` VALUES(2, 7, 16, 4);
INSERT INTO `round_score` VALUES(2, 16, 18, 5);
INSERT INTO `round_score` VALUES(2, 5, 18, 7);
INSERT INTO `round_score` VALUES(2, 11, 18, 6);
INSERT INTO `round_score` VALUES(2, 4, 18, 6);
INSERT INTO `round_score` VALUES(2, 1, 18, 6);
INSERT INTO `round_score` VALUES(2, 3, 18, 5);
INSERT INTO `round_score` VALUES(2, 14, 18, 6);
INSERT INTO `round_score` VALUES(2, 6, 18, 6);
INSERT INTO `round_score` VALUES(2, 10, 17, 3);
INSERT INTO `round_score` VALUES(2, 8, 17, 4);
INSERT INTO `round_score` VALUES(2, 2, 17, 3);
INSERT INTO `round_score` VALUES(2, 7, 17, 4);
INSERT INTO `round_score` VALUES(2, 15, 17, 4);
INSERT INTO `round_score` VALUES(2, 9, 17, 4);
INSERT INTO `round_score` VALUES(2, 13, 17, 3);
INSERT INTO `round_score` VALUES(2, 12, 17, 5);
INSERT INTO `round_score` VALUES(2, 15, 18, 6);
INSERT INTO `round_score` VALUES(2, 9, 18, 7);
INSERT INTO `round_score` VALUES(2, 13, 18, 7);
INSERT INTO `round_score` VALUES(2, 12, 18, 8);
INSERT INTO `round_score` VALUES(2, 10, 18, 7);
INSERT INTO `round_score` VALUES(2, 8, 18, 6);
INSERT INTO `round_score` VALUES(2, 2, 18, 6);
INSERT INTO `round_score` VALUES(2, 7, 18, 6);
INSERT INTO `round_score` VALUES(3, 15, 1, 5);
INSERT INTO `round_score` VALUES(3, 8, 1, 7);
INSERT INTO `round_score` VALUES(3, 11, 1, 5);
INSERT INTO `round_score` VALUES(3, 6, 1, 5);
INSERT INTO `round_score` VALUES(3, 15, 2, 6);
INSERT INTO `round_score` VALUES(3, 8, 2, 8);
INSERT INTO `round_score` VALUES(3, 11, 2, 6);
INSERT INTO `round_score` VALUES(3, 6, 2, 4);
INSERT INTO `round_score` VALUES(3, 5, 1, 5);
INSERT INTO `round_score` VALUES(3, 3, 1, 5);
INSERT INTO `round_score` VALUES(3, 4, 1, 5);
INSERT INTO `round_score` VALUES(3, 7, 1, 5);
INSERT INTO `round_score` VALUES(3, 10, 1, 5);
INSERT INTO `round_score` VALUES(3, 9, 1, 4);
INSERT INTO `round_score` VALUES(3, 13, 1, 5);
INSERT INTO `round_score` VALUES(3, 12, 1, 5);
INSERT INTO `round_score` VALUES(3, 15, 3, 7);
INSERT INTO `round_score` VALUES(3, 8, 3, 7);
INSERT INTO `round_score` VALUES(3, 11, 3, 6);
INSERT INTO `round_score` VALUES(3, 6, 3, 6);
INSERT INTO `round_score` VALUES(3, 5, 2, 5);
INSERT INTO `round_score` VALUES(3, 3, 2, 4);
INSERT INTO `round_score` VALUES(3, 4, 2, 6);
INSERT INTO `round_score` VALUES(3, 7, 2, 7);
INSERT INTO `round_score` VALUES(3, 10, 2, 8);
INSERT INTO `round_score` VALUES(3, 9, 2, 7);
INSERT INTO `round_score` VALUES(3, 13, 2, 5);
INSERT INTO `round_score` VALUES(3, 12, 2, 5);
INSERT INTO `round_score` VALUES(3, 1, 1, 4);
INSERT INTO `round_score` VALUES(3, 16, 1, 6);
INSERT INTO `round_score` VALUES(3, 2, 1, 5);
INSERT INTO `round_score` VALUES(3, 14, 1, 4);
INSERT INTO `round_score` VALUES(3, 1, 2, 5);
INSERT INTO `round_score` VALUES(3, 16, 2, 5);
INSERT INTO `round_score` VALUES(3, 2, 2, 5);
INSERT INTO `round_score` VALUES(3, 14, 2, 6);
INSERT INTO `round_score` VALUES(3, 1, 3, 7);
INSERT INTO `round_score` VALUES(3, 16, 3, 6);
INSERT INTO `round_score` VALUES(3, 2, 3, 6);
INSERT INTO `round_score` VALUES(3, 14, 3, 6);
INSERT INTO `round_score` VALUES(3, 5, 3, 6);
INSERT INTO `round_score` VALUES(3, 3, 3, 8);
INSERT INTO `round_score` VALUES(3, 4, 3, 8);
INSERT INTO `round_score` VALUES(3, 7, 3, 8);
INSERT INTO `round_score` VALUES(3, 15, 4, 5);
INSERT INTO `round_score` VALUES(3, 8, 4, 7);
INSERT INTO `round_score` VALUES(3, 11, 4, 7);
INSERT INTO `round_score` VALUES(3, 6, 4, 7);
INSERT INTO `round_score` VALUES(3, 15, 5, 6);
INSERT INTO `round_score` VALUES(3, 8, 5, 4);
INSERT INTO `round_score` VALUES(3, 11, 5, 4);
INSERT INTO `round_score` VALUES(3, 6, 5, 5);
INSERT INTO `round_score` VALUES(3, 1, 4, 6);
INSERT INTO `round_score` VALUES(3, 16, 4, 4);
INSERT INTO `round_score` VALUES(3, 2, 4, 5);
INSERT INTO `round_score` VALUES(3, 14, 4, 4);
INSERT INTO `round_score` VALUES(3, 10, 3, 8);
INSERT INTO `round_score` VALUES(3, 9, 3, 6);
INSERT INTO `round_score` VALUES(3, 13, 3, 6);
INSERT INTO `round_score` VALUES(3, 12, 3, 6);
INSERT INTO `round_score` VALUES(3, 1, 5, 4);
INSERT INTO `round_score` VALUES(3, 16, 5, 4);
INSERT INTO `round_score` VALUES(3, 2, 5, 4);
INSERT INTO `round_score` VALUES(3, 14, 5, 4);
INSERT INTO `round_score` VALUES(3, 5, 4, 6);
INSERT INTO `round_score` VALUES(3, 3, 4, 8);
INSERT INTO `round_score` VALUES(3, 4, 4, 6);
INSERT INTO `round_score` VALUES(3, 7, 4, 4);
INSERT INTO `round_score` VALUES(3, 15, 6, 8);
INSERT INTO `round_score` VALUES(3, 8, 6, 6);
INSERT INTO `round_score` VALUES(3, 11, 6, 8);
INSERT INTO `round_score` VALUES(3, 6, 6, 8);
INSERT INTO `round_score` VALUES(3, 5, 5, 7);
INSERT INTO `round_score` VALUES(3, 3, 5, 4);
INSERT INTO `round_score` VALUES(3, 4, 5, 4);
INSERT INTO `round_score` VALUES(3, 7, 5, 5);
INSERT INTO `round_score` VALUES(3, 1, 6, 5);
INSERT INTO `round_score` VALUES(3, 16, 6, 6);
INSERT INTO `round_score` VALUES(3, 2, 6, 5);
INSERT INTO `round_score` VALUES(3, 14, 6, 6);
INSERT INTO `round_score` VALUES(3, 10, 4, 7);
INSERT INTO `round_score` VALUES(3, 9, 4, 5);
INSERT INTO `round_score` VALUES(3, 13, 4, 4);
INSERT INTO `round_score` VALUES(3, 12, 4, 5);
INSERT INTO `round_score` VALUES(3, 10, 5, 3);
INSERT INTO `round_score` VALUES(3, 9, 5, 4);
INSERT INTO `round_score` VALUES(3, 13, 5, 5);
INSERT INTO `round_score` VALUES(3, 12, 5, 4);
INSERT INTO `round_score` VALUES(3, 15, 7, 5);
INSERT INTO `round_score` VALUES(3, 8, 7, 5);
INSERT INTO `round_score` VALUES(3, 11, 7, 6);
INSERT INTO `round_score` VALUES(3, 6, 7, 6);
INSERT INTO `round_score` VALUES(3, 15, 8, 4);
INSERT INTO `round_score` VALUES(3, 8, 8, 4);
INSERT INTO `round_score` VALUES(3, 11, 8, 5);
INSERT INTO `round_score` VALUES(3, 6, 8, 3);
INSERT INTO `round_score` VALUES(3, 1, 7, 5);
INSERT INTO `round_score` VALUES(3, 16, 7, 4);
INSERT INTO `round_score` VALUES(3, 2, 7, 5);
INSERT INTO `round_score` VALUES(3, 14, 7, 4);
INSERT INTO `round_score` VALUES(3, 5, 6, 5);
INSERT INTO `round_score` VALUES(3, 3, 6, 5);
INSERT INTO `round_score` VALUES(3, 4, 6, 6);
INSERT INTO `round_score` VALUES(3, 7, 6, 6);
INSERT INTO `round_score` VALUES(3, 15, 9, 8);
INSERT INTO `round_score` VALUES(3, 8, 9, 4);
INSERT INTO `round_score` VALUES(3, 11, 9, 8);
INSERT INTO `round_score` VALUES(3, 6, 9, 5);
INSERT INTO `round_score` VALUES(3, 1, 8, 4);
INSERT INTO `round_score` VALUES(3, 16, 8, 4);
INSERT INTO `round_score` VALUES(3, 2, 8, 3);
INSERT INTO `round_score` VALUES(3, 14, 8, 4);
INSERT INTO `round_score` VALUES(3, 10, 6, 7);
INSERT INTO `round_score` VALUES(3, 9, 6, 6);
INSERT INTO `round_score` VALUES(3, 13, 6, 7);
INSERT INTO `round_score` VALUES(3, 12, 6, 6);
INSERT INTO `round_score` VALUES(3, 5, 7, 5);
INSERT INTO `round_score` VALUES(3, 3, 7, 5);
INSERT INTO `round_score` VALUES(3, 4, 7, 7);
INSERT INTO `round_score` VALUES(3, 7, 7, 5);
INSERT INTO `round_score` VALUES(3, 1, 9, 6);
INSERT INTO `round_score` VALUES(3, 16, 9, 5);
INSERT INTO `round_score` VALUES(3, 2, 9, 6);
INSERT INTO `round_score` VALUES(3, 14, 9, 5);
INSERT INTO `round_score` VALUES(3, 15, 10, 7);
INSERT INTO `round_score` VALUES(3, 8, 10, 4);
INSERT INTO `round_score` VALUES(3, 11, 10, 6);
INSERT INTO `round_score` VALUES(3, 6, 10, 5);
INSERT INTO `round_score` VALUES(3, 5, 8, 3);
INSERT INTO `round_score` VALUES(3, 3, 8, 3);
INSERT INTO `round_score` VALUES(3, 4, 8, 5);
INSERT INTO `round_score` VALUES(3, 7, 8, 4);
INSERT INTO `round_score` VALUES(3, 10, 7, 7);
INSERT INTO `round_score` VALUES(3, 9, 7, 5);
INSERT INTO `round_score` VALUES(3, 13, 7, 6);
INSERT INTO `round_score` VALUES(3, 12, 7, 6);
INSERT INTO `round_score` VALUES(3, 15, 11, 4);
INSERT INTO `round_score` VALUES(3, 8, 11, 4);
INSERT INTO `round_score` VALUES(3, 11, 11, 3);
INSERT INTO `round_score` VALUES(3, 6, 11, 4);
INSERT INTO `round_score` VALUES(3, 1, 10, 6);
INSERT INTO `round_score` VALUES(3, 16, 10, 5);
INSERT INTO `round_score` VALUES(3, 2, 10, 5);
INSERT INTO `round_score` VALUES(3, 14, 10, 6);
INSERT INTO `round_score` VALUES(3, 10, 8, 4);
INSERT INTO `round_score` VALUES(3, 9, 8, 3);
INSERT INTO `round_score` VALUES(3, 13, 8, 3);
INSERT INTO `round_score` VALUES(3, 12, 8, 5);
INSERT INTO `round_score` VALUES(3, 5, 9, 7);
INSERT INTO `round_score` VALUES(3, 3, 9, 4);
INSERT INTO `round_score` VALUES(3, 4, 9, 7);
INSERT INTO `round_score` VALUES(3, 7, 9, 4);
INSERT INTO `round_score` VALUES(3, 1, 11, 6);
INSERT INTO `round_score` VALUES(3, 16, 11, 3);
INSERT INTO `round_score` VALUES(3, 2, 11, 3);
INSERT INTO `round_score` VALUES(3, 14, 11, 3);
INSERT INTO `round_score` VALUES(3, 15, 12, 7);
INSERT INTO `round_score` VALUES(3, 8, 12, 5);
INSERT INTO `round_score` VALUES(3, 11, 12, 6);
INSERT INTO `round_score` VALUES(3, 6, 12, 3);
INSERT INTO `round_score` VALUES(3, 10, 9, 6);
INSERT INTO `round_score` VALUES(3, 9, 9, 7);
INSERT INTO `round_score` VALUES(3, 13, 9, 5);
INSERT INTO `round_score` VALUES(3, 12, 9, 6);
INSERT INTO `round_score` VALUES(3, 1, 12, 5);
INSERT INTO `round_score` VALUES(3, 16, 12, 5);
INSERT INTO `round_score` VALUES(3, 2, 12, 4);
INSERT INTO `round_score` VALUES(3, 14, 12, 4);
INSERT INTO `round_score` VALUES(3, 5, 10, 6);
INSERT INTO `round_score` VALUES(3, 3, 10, 4);
INSERT INTO `round_score` VALUES(3, 4, 10, 6);
INSERT INTO `round_score` VALUES(3, 7, 10, 5);
INSERT INTO `round_score` VALUES(3, 15, 13, 6);
INSERT INTO `round_score` VALUES(3, 8, 13, 5);
INSERT INTO `round_score` VALUES(3, 11, 13, 6);
INSERT INTO `round_score` VALUES(3, 6, 13, 5);
INSERT INTO `round_score` VALUES(3, 5, 11, 4);
INSERT INTO `round_score` VALUES(3, 3, 11, 4);
INSERT INTO `round_score` VALUES(3, 4, 11, 5);
INSERT INTO `round_score` VALUES(3, 7, 11, 4);
INSERT INTO `round_score` VALUES(3, 1, 13, 6);
INSERT INTO `round_score` VALUES(3, 16, 13, 3);
INSERT INTO `round_score` VALUES(3, 2, 13, 5);
INSERT INTO `round_score` VALUES(3, 14, 13, 4);
INSERT INTO `round_score` VALUES(3, 10, 10, 7);
INSERT INTO `round_score` VALUES(3, 9, 10, 5);
INSERT INTO `round_score` VALUES(3, 13, 10, 7);
INSERT INTO `round_score` VALUES(3, 12, 10, 6);
INSERT INTO `round_score` VALUES(3, 15, 14, 6);
INSERT INTO `round_score` VALUES(3, 8, 14, 8);
INSERT INTO `round_score` VALUES(3, 11, 14, 6);
INSERT INTO `round_score` VALUES(3, 6, 14, 4);
INSERT INTO `round_score` VALUES(3, 5, 12, 4);
INSERT INTO `round_score` VALUES(3, 3, 12, 6);
INSERT INTO `round_score` VALUES(3, 4, 12, 6);
INSERT INTO `round_score` VALUES(3, 7, 12, 4);
INSERT INTO `round_score` VALUES(3, 10, 11, 4);
INSERT INTO `round_score` VALUES(3, 9, 11, 4);
INSERT INTO `round_score` VALUES(3, 13, 11, 4);
INSERT INTO `round_score` VALUES(3, 12, 11, 5);
INSERT INTO `round_score` VALUES(3, 1, 14, 7);
INSERT INTO `round_score` VALUES(3, 16, 14, 5);
INSERT INTO `round_score` VALUES(3, 2, 14, 6);
INSERT INTO `round_score` VALUES(3, 14, 14, 6);
INSERT INTO `round_score` VALUES(3, 15, 15, 6);
INSERT INTO `round_score` VALUES(3, 8, 15, 4);
INSERT INTO `round_score` VALUES(3, 11, 15, 5);
INSERT INTO `round_score` VALUES(3, 6, 15, 6);
INSERT INTO `round_score` VALUES(3, 5, 13, 4);
INSERT INTO `round_score` VALUES(3, 3, 13, 4);
INSERT INTO `round_score` VALUES(3, 4, 13, 6);
INSERT INTO `round_score` VALUES(3, 7, 13, 4);
INSERT INTO `round_score` VALUES(3, 10, 12, 4);
INSERT INTO `round_score` VALUES(3, 9, 12, 5);
INSERT INTO `round_score` VALUES(3, 13, 12, 4);
INSERT INTO `round_score` VALUES(3, 12, 12, 5);
INSERT INTO `round_score` VALUES(3, 15, 16, 8);
INSERT INTO `round_score` VALUES(3, 8, 16, 2);
INSERT INTO `round_score` VALUES(3, 11, 16, 5);
INSERT INTO `round_score` VALUES(3, 6, 16, 5);
INSERT INTO `round_score` VALUES(3, 1, 15, 7);
INSERT INTO `round_score` VALUES(3, 16, 15, 5);
INSERT INTO `round_score` VALUES(3, 2, 15, 6);
INSERT INTO `round_score` VALUES(3, 14, 15, 7);
INSERT INTO `round_score` VALUES(3, 10, 13, 4);
INSERT INTO `round_score` VALUES(3, 9, 13, 5);
INSERT INTO `round_score` VALUES(3, 13, 13, 8);
INSERT INTO `round_score` VALUES(3, 12, 13, 6);
INSERT INTO `round_score` VALUES(3, 15, 17, 6);
INSERT INTO `round_score` VALUES(3, 8, 17, 8);
INSERT INTO `round_score` VALUES(3, 11, 17, 6);
INSERT INTO `round_score` VALUES(3, 6, 17, 4);
INSERT INTO `round_score` VALUES(3, 5, 14, 5);
INSERT INTO `round_score` VALUES(3, 3, 14, 6);
INSERT INTO `round_score` VALUES(3, 4, 14, 7);
INSERT INTO `round_score` VALUES(3, 7, 14, 5);
INSERT INTO `round_score` VALUES(3, 1, 16, 4);
INSERT INTO `round_score` VALUES(3, 16, 16, 7);
INSERT INTO `round_score` VALUES(3, 2, 16, 4);
INSERT INTO `round_score` VALUES(3, 14, 16, 4);
INSERT INTO `round_score` VALUES(3, 10, 14, 7);
INSERT INTO `round_score` VALUES(3, 9, 14, 5);
INSERT INTO `round_score` VALUES(3, 13, 14, 5);
INSERT INTO `round_score` VALUES(3, 12, 14, 6);
INSERT INTO `round_score` VALUES(3, 1, 17, 5);
INSERT INTO `round_score` VALUES(3, 16, 17, 5);
INSERT INTO `round_score` VALUES(3, 2, 17, 6);
INSERT INTO `round_score` VALUES(3, 14, 17, 5);
INSERT INTO `round_score` VALUES(3, 5, 15, 5);
INSERT INTO `round_score` VALUES(3, 3, 15, 6);
INSERT INTO `round_score` VALUES(3, 4, 15, 5);
INSERT INTO `round_score` VALUES(3, 7, 15, 4);
INSERT INTO `round_score` VALUES(3, 15, 18, 7);
INSERT INTO `round_score` VALUES(3, 8, 18, 6);
INSERT INTO `round_score` VALUES(3, 11, 18, 8);
INSERT INTO `round_score` VALUES(3, 6, 18, 7);
INSERT INTO `round_score` VALUES(3, 10, 15, 7);
INSERT INTO `round_score` VALUES(3, 9, 15, 7);
INSERT INTO `round_score` VALUES(3, 13, 15, 6);
INSERT INTO `round_score` VALUES(3, 12, 15, 6);
INSERT INTO `round_score` VALUES(3, 5, 16, 4);
INSERT INTO `round_score` VALUES(3, 3, 16, 6);
INSERT INTO `round_score` VALUES(3, 4, 16, 4);
INSERT INTO `round_score` VALUES(3, 7, 16, 4);
INSERT INTO `round_score` VALUES(3, 1, 18, 5);
INSERT INTO `round_score` VALUES(3, 16, 18, 5);
INSERT INTO `round_score` VALUES(3, 2, 18, 7);
INSERT INTO `round_score` VALUES(3, 14, 18, 5);
INSERT INTO `round_score` VALUES(3, 10, 16, 5);
INSERT INTO `round_score` VALUES(3, 9, 16, 8);
INSERT INTO `round_score` VALUES(3, 13, 16, 3);
INSERT INTO `round_score` VALUES(3, 12, 16, 5);
INSERT INTO `round_score` VALUES(3, 5, 17, 6);
INSERT INTO `round_score` VALUES(3, 3, 17, 4);
INSERT INTO `round_score` VALUES(3, 4, 17, 6);
INSERT INTO `round_score` VALUES(3, 7, 17, 5);
INSERT INTO `round_score` VALUES(3, 10, 17, 5);
INSERT INTO `round_score` VALUES(3, 9, 17, 5);
INSERT INTO `round_score` VALUES(3, 13, 17, 5);
INSERT INTO `round_score` VALUES(3, 12, 17, 5);
INSERT INTO `round_score` VALUES(3, 5, 18, 7);
INSERT INTO `round_score` VALUES(3, 3, 18, 6);
INSERT INTO `round_score` VALUES(3, 4, 18, 6);
INSERT INTO `round_score` VALUES(3, 7, 18, 5);
INSERT INTO `round_score` VALUES(3, 10, 18, 8);
INSERT INTO `round_score` VALUES(3, 9, 18, 6);
INSERT INTO `round_score` VALUES(3, 13, 18, 7);
INSERT INTO `round_score` VALUES(3, 12, 18, 6);
INSERT INTO `round_score` VALUES(4, 9, 1, 6);
INSERT INTO `round_score` VALUES(4, 3, 1, 5);
INSERT INTO `round_score` VALUES(4, 14, 1, 4);
INSERT INTO `round_score` VALUES(4, 13, 1, 6);
INSERT INTO `round_score` VALUES(4, 15, 1, 6);
INSERT INTO `round_score` VALUES(4, 5, 1, 4);
INSERT INTO `round_score` VALUES(4, 11, 1, 6);
INSERT INTO `round_score` VALUES(4, 7, 1, 5);
INSERT INTO `round_score` VALUES(4, 9, 2, 3);
INSERT INTO `round_score` VALUES(4, 3, 2, 4);
INSERT INTO `round_score` VALUES(4, 14, 2, 5);
INSERT INTO `round_score` VALUES(4, 13, 2, 5);
INSERT INTO `round_score` VALUES(4, 1, 1, 7);
INSERT INTO `round_score` VALUES(4, 8, 1, 4);
INSERT INTO `round_score` VALUES(4, 2, 1, 5);
INSERT INTO `round_score` VALUES(4, 6, 1, 3);
INSERT INTO `round_score` VALUES(4, 9, 3, 3);
INSERT INTO `round_score` VALUES(4, 3, 3, 3);
INSERT INTO `round_score` VALUES(4, 14, 3, 4);
INSERT INTO `round_score` VALUES(4, 13, 3, 3);
INSERT INTO `round_score` VALUES(4, 15, 2, 8);
INSERT INTO `round_score` VALUES(4, 5, 2, 6);
INSERT INTO `round_score` VALUES(4, 11, 2, 5);
INSERT INTO `round_score` VALUES(4, 7, 2, 4);
INSERT INTO `round_score` VALUES(4, 1, 2, 5);
INSERT INTO `round_score` VALUES(4, 8, 2, 3);
INSERT INTO `round_score` VALUES(4, 2, 2, 6);
INSERT INTO `round_score` VALUES(4, 6, 2, 5);
INSERT INTO `round_score` VALUES(4, 9, 4, 6);
INSERT INTO `round_score` VALUES(4, 3, 4, 6);
INSERT INTO `round_score` VALUES(4, 14, 4, 5);
INSERT INTO `round_score` VALUES(4, 13, 4, 7);
INSERT INTO `round_score` VALUES(4, 15, 3, 3);
INSERT INTO `round_score` VALUES(4, 5, 3, 6);
INSERT INTO `round_score` VALUES(4, 11, 3, 4);
INSERT INTO `round_score` VALUES(4, 7, 3, 3);
INSERT INTO `round_score` VALUES(4, 15, 4, 7);
INSERT INTO `round_score` VALUES(4, 5, 4, 7);
INSERT INTO `round_score` VALUES(4, 11, 4, 6);
INSERT INTO `round_score` VALUES(4, 7, 4, 5);
INSERT INTO `round_score` VALUES(4, 1, 3, 3);
INSERT INTO `round_score` VALUES(4, 8, 3, 4);
INSERT INTO `round_score` VALUES(4, 2, 3, 3);
INSERT INTO `round_score` VALUES(4, 6, 3, 4);
INSERT INTO `round_score` VALUES(4, 9, 5, 4);
INSERT INTO `round_score` VALUES(4, 3, 5, 4);
INSERT INTO `round_score` VALUES(4, 14, 5, 7);
INSERT INTO `round_score` VALUES(4, 13, 5, 8);
INSERT INTO `round_score` VALUES(4, 1, 4, 5);
INSERT INTO `round_score` VALUES(4, 8, 4, 5);
INSERT INTO `round_score` VALUES(4, 2, 4, 5);
INSERT INTO `round_score` VALUES(4, 6, 4, 5);
INSERT INTO `round_score` VALUES(4, 9, 6, 3);
INSERT INTO `round_score` VALUES(4, 3, 6, 3);
INSERT INTO `round_score` VALUES(4, 14, 6, 4);
INSERT INTO `round_score` VALUES(4, 13, 6, 3);
INSERT INTO `round_score` VALUES(4, 1, 5, 5);
INSERT INTO `round_score` VALUES(4, 8, 5, 7);
INSERT INTO `round_score` VALUES(4, 2, 5, 3);
INSERT INTO `round_score` VALUES(4, 6, 5, 4);
INSERT INTO `round_score` VALUES(4, 15, 5, 4);
INSERT INTO `round_score` VALUES(4, 5, 5, 4);
INSERT INTO `round_score` VALUES(4, 11, 5, 4);
INSERT INTO `round_score` VALUES(4, 7, 5, 6);
INSERT INTO `round_score` VALUES(4, 15, 6, 3);
INSERT INTO `round_score` VALUES(4, 5, 6, 3);
INSERT INTO `round_score` VALUES(4, 11, 6, 5);
INSERT INTO `round_score` VALUES(4, 7, 6, 3);
INSERT INTO `round_score` VALUES(4, 1, 6, 3);
INSERT INTO `round_score` VALUES(4, 8, 6, 4);
INSERT INTO `round_score` VALUES(4, 2, 6, 4);
INSERT INTO `round_score` VALUES(4, 6, 6, 4);
INSERT INTO `round_score` VALUES(4, 9, 7, 5);
INSERT INTO `round_score` VALUES(4, 3, 7, 4);
INSERT INTO `round_score` VALUES(4, 14, 7, 6);
INSERT INTO `round_score` VALUES(4, 13, 7, 5);
INSERT INTO `round_score` VALUES(4, 9, 8, 4);
INSERT INTO `round_score` VALUES(4, 3, 8, 5);
INSERT INTO `round_score` VALUES(4, 14, 8, 5);
INSERT INTO `round_score` VALUES(4, 13, 8, 5);
INSERT INTO `round_score` VALUES(4, 1, 7, 4);
INSERT INTO `round_score` VALUES(4, 8, 7, 5);
INSERT INTO `round_score` VALUES(4, 2, 7, 6);
INSERT INTO `round_score` VALUES(4, 6, 7, 4);
INSERT INTO `round_score` VALUES(4, 15, 7, 5);
INSERT INTO `round_score` VALUES(4, 5, 7, 4);
INSERT INTO `round_score` VALUES(4, 11, 7, 5);
INSERT INTO `round_score` VALUES(4, 7, 7, 5);
INSERT INTO `round_score` VALUES(4, 15, 8, 7);
INSERT INTO `round_score` VALUES(4, 5, 8, 6);
INSERT INTO `round_score` VALUES(4, 11, 8, 5);
INSERT INTO `round_score` VALUES(4, 7, 8, 5);
INSERT INTO `round_score` VALUES(4, 9, 9, 5);
INSERT INTO `round_score` VALUES(4, 3, 9, 4);
INSERT INTO `round_score` VALUES(4, 14, 9, 5);
INSERT INTO `round_score` VALUES(4, 13, 9, 7);
INSERT INTO `round_score` VALUES(4, 1, 8, 3);
INSERT INTO `round_score` VALUES(4, 8, 8, 5);
INSERT INTO `round_score` VALUES(4, 2, 8, 5);
INSERT INTO `round_score` VALUES(4, 6, 8, 4);
INSERT INTO `round_score` VALUES(4, 15, 9, 8);
INSERT INTO `round_score` VALUES(4, 5, 9, 5);
INSERT INTO `round_score` VALUES(4, 11, 9, 6);
INSERT INTO `round_score` VALUES(4, 7, 9, 6);
INSERT INTO `round_score` VALUES(4, 9, 10, 5);
INSERT INTO `round_score` VALUES(4, 3, 10, 5);
INSERT INTO `round_score` VALUES(4, 14, 10, 4);
INSERT INTO `round_score` VALUES(4, 13, 10, 6);
INSERT INTO `round_score` VALUES(4, 1, 9, 6);
INSERT INTO `round_score` VALUES(4, 8, 9, 5);
INSERT INTO `round_score` VALUES(4, 2, 9, 7);
INSERT INTO `round_score` VALUES(4, 6, 9, 7);
INSERT INTO `round_score` VALUES(4, 9, 11, 5);
INSERT INTO `round_score` VALUES(4, 3, 11, 4);
INSERT INTO `round_score` VALUES(4, 14, 11, 4);
INSERT INTO `round_score` VALUES(4, 13, 11, 5);
INSERT INTO `round_score` VALUES(4, 15, 10, 8);
INSERT INTO `round_score` VALUES(4, 5, 10, 4);
INSERT INTO `round_score` VALUES(4, 11, 10, 4);
INSERT INTO `round_score` VALUES(4, 7, 10, 6);
INSERT INTO `round_score` VALUES(4, 1, 10, 6);
INSERT INTO `round_score` VALUES(4, 8, 10, 4);
INSERT INTO `round_score` VALUES(4, 2, 10, 3);
INSERT INTO `round_score` VALUES(4, 6, 10, 6);
INSERT INTO `round_score` VALUES(4, 15, 11, 5);
INSERT INTO `round_score` VALUES(4, 5, 11, 5);
INSERT INTO `round_score` VALUES(4, 11, 11, 3);
INSERT INTO `round_score` VALUES(4, 7, 11, 5);
INSERT INTO `round_score` VALUES(4, 1, 11, 4);
INSERT INTO `round_score` VALUES(4, 8, 11, 4);
INSERT INTO `round_score` VALUES(4, 2, 11, 7);
INSERT INTO `round_score` VALUES(4, 6, 11, 4);
INSERT INTO `round_score` VALUES(4, 9, 12, 6);
INSERT INTO `round_score` VALUES(4, 3, 12, 7);
INSERT INTO `round_score` VALUES(4, 14, 12, 8);
INSERT INTO `round_score` VALUES(4, 13, 12, 6);
INSERT INTO `round_score` VALUES(4, 15, 12, 7);
INSERT INTO `round_score` VALUES(4, 5, 12, 8);
INSERT INTO `round_score` VALUES(4, 11, 12, 6);
INSERT INTO `round_score` VALUES(4, 7, 12, 7);
INSERT INTO `round_score` VALUES(4, 1, 12, 6);
INSERT INTO `round_score` VALUES(4, 8, 12, 7);
INSERT INTO `round_score` VALUES(4, 2, 12, 7);
INSERT INTO `round_score` VALUES(4, 6, 12, 6);
INSERT INTO `round_score` VALUES(4, 9, 13, 4);
INSERT INTO `round_score` VALUES(4, 3, 13, 6);
INSERT INTO `round_score` VALUES(4, 14, 13, 5);
INSERT INTO `round_score` VALUES(4, 13, 13, 6);
INSERT INTO `round_score` VALUES(4, 9, 14, 5);
INSERT INTO `round_score` VALUES(4, 3, 14, 4);
INSERT INTO `round_score` VALUES(4, 14, 14, 5);
INSERT INTO `round_score` VALUES(4, 13, 14, 2);
INSERT INTO `round_score` VALUES(4, 1, 13, 5);
INSERT INTO `round_score` VALUES(4, 8, 13, 5);
INSERT INTO `round_score` VALUES(4, 2, 13, 4);
INSERT INTO `round_score` VALUES(4, 6, 13, 5);
INSERT INTO `round_score` VALUES(4, 9, 15, 6);
INSERT INTO `round_score` VALUES(4, 3, 15, 6);
INSERT INTO `round_score` VALUES(4, 14, 15, 6);
INSERT INTO `round_score` VALUES(4, 13, 15, 5);
INSERT INTO `round_score` VALUES(4, 1, 14, 4);
INSERT INTO `round_score` VALUES(4, 8, 14, 4);
INSERT INTO `round_score` VALUES(4, 2, 14, 3);
INSERT INTO `round_score` VALUES(4, 6, 14, 4);
INSERT INTO `round_score` VALUES(4, 15, 13, 5);
INSERT INTO `round_score` VALUES(4, 5, 13, 7);
INSERT INTO `round_score` VALUES(4, 11, 13, 5);
INSERT INTO `round_score` VALUES(4, 7, 13, 7);
INSERT INTO `round_score` VALUES(4, 10, 1, 8);
INSERT INTO `round_score` VALUES(4, 16, 1, 3);
INSERT INTO `round_score` VALUES(4, 12, 1, 8);
INSERT INTO `round_score` VALUES(4, 4, 1, 4);
INSERT INTO `round_score` VALUES(4, 15, 14, 4);
INSERT INTO `round_score` VALUES(4, 5, 14, 3);
INSERT INTO `round_score` VALUES(4, 11, 14, 2);
INSERT INTO `round_score` VALUES(4, 7, 14, 4);
INSERT INTO `round_score` VALUES(4, 10, 2, 5);
INSERT INTO `round_score` VALUES(4, 16, 2, 5);
INSERT INTO `round_score` VALUES(4, 12, 2, 5);
INSERT INTO `round_score` VALUES(4, 4, 2, 4);
INSERT INTO `round_score` VALUES(4, 15, 15, 5);
INSERT INTO `round_score` VALUES(4, 5, 15, 4);
INSERT INTO `round_score` VALUES(4, 11, 15, 5);
INSERT INTO `round_score` VALUES(4, 7, 15, 4);
INSERT INTO `round_score` VALUES(4, 10, 3, 4);
INSERT INTO `round_score` VALUES(4, 16, 3, 3);
INSERT INTO `round_score` VALUES(4, 12, 3, 4);
INSERT INTO `round_score` VALUES(4, 4, 3, 4);
INSERT INTO `round_score` VALUES(4, 1, 15, 6);
INSERT INTO `round_score` VALUES(4, 8, 15, 5);
INSERT INTO `round_score` VALUES(4, 2, 15, 6);
INSERT INTO `round_score` VALUES(4, 6, 15, 5);
INSERT INTO `round_score` VALUES(4, 10, 4, 7);
INSERT INTO `round_score` VALUES(4, 16, 4, 5);
INSERT INTO `round_score` VALUES(4, 12, 4, 5);
INSERT INTO `round_score` VALUES(4, 4, 4, 6);
INSERT INTO `round_score` VALUES(4, 9, 16, 5);
INSERT INTO `round_score` VALUES(4, 3, 16, 6);
INSERT INTO `round_score` VALUES(4, 14, 16, 5);
INSERT INTO `round_score` VALUES(4, 13, 16, 6);
INSERT INTO `round_score` VALUES(4, 10, 5, 6);
INSERT INTO `round_score` VALUES(4, 16, 5, 5);
INSERT INTO `round_score` VALUES(4, 12, 5, 4);
INSERT INTO `round_score` VALUES(4, 4, 5, 6);
INSERT INTO `round_score` VALUES(4, 10, 6, 3);
INSERT INTO `round_score` VALUES(4, 16, 6, 2);
INSERT INTO `round_score` VALUES(4, 12, 6, 3);
INSERT INTO `round_score` VALUES(4, 4, 6, 3);
INSERT INTO `round_score` VALUES(4, 10, 7, 4);
INSERT INTO `round_score` VALUES(4, 16, 7, 4);
INSERT INTO `round_score` VALUES(4, 12, 7, 5);
INSERT INTO `round_score` VALUES(4, 4, 7, 8);
INSERT INTO `round_score` VALUES(4, 10, 8, 5);
INSERT INTO `round_score` VALUES(4, 16, 8, 5);
INSERT INTO `round_score` VALUES(4, 12, 8, 6);
INSERT INTO `round_score` VALUES(4, 4, 8, 6);
INSERT INTO `round_score` VALUES(4, 10, 9, 6);
INSERT INTO `round_score` VALUES(4, 16, 9, 5);
INSERT INTO `round_score` VALUES(4, 12, 9, 6);
INSERT INTO `round_score` VALUES(4, 4, 9, 6);
INSERT INTO `round_score` VALUES(4, 10, 10, 6);
INSERT INTO `round_score` VALUES(4, 16, 10, 3);
INSERT INTO `round_score` VALUES(4, 12, 10, 5);
INSERT INTO `round_score` VALUES(4, 4, 10, 6);
INSERT INTO `round_score` VALUES(4, 10, 11, 4);
INSERT INTO `round_score` VALUES(4, 16, 11, 3);
INSERT INTO `round_score` VALUES(4, 12, 11, 3);
INSERT INTO `round_score` VALUES(4, 4, 11, 4);
INSERT INTO `round_score` VALUES(4, 10, 12, 5);
INSERT INTO `round_score` VALUES(4, 16, 12, 6);
INSERT INTO `round_score` VALUES(4, 12, 12, 6);
INSERT INTO `round_score` VALUES(4, 4, 12, 6);
INSERT INTO `round_score` VALUES(4, 10, 13, 6);
INSERT INTO `round_score` VALUES(4, 16, 13, 4);
INSERT INTO `round_score` VALUES(4, 12, 13, 6);
INSERT INTO `round_score` VALUES(4, 4, 13, 5);
INSERT INTO `round_score` VALUES(4, 10, 14, 4);
INSERT INTO `round_score` VALUES(4, 16, 14, 3);
INSERT INTO `round_score` VALUES(4, 12, 14, 4);
INSERT INTO `round_score` VALUES(4, 4, 14, 2);
INSERT INTO `round_score` VALUES(4, 10, 15, 5);
INSERT INTO `round_score` VALUES(4, 16, 15, 4);
INSERT INTO `round_score` VALUES(4, 12, 15, 5);
INSERT INTO `round_score` VALUES(4, 4, 15, 5);
INSERT INTO `round_score` VALUES(4, 10, 16, 6);
INSERT INTO `round_score` VALUES(4, 16, 16, 5);
INSERT INTO `round_score` VALUES(4, 12, 16, 7);
INSERT INTO `round_score` VALUES(4, 4, 16, 6);
INSERT INTO `round_score` VALUES(4, 10, 17, 6);
INSERT INTO `round_score` VALUES(4, 16, 17, 4);
INSERT INTO `round_score` VALUES(4, 12, 17, 6);
INSERT INTO `round_score` VALUES(4, 4, 17, 5);
INSERT INTO `round_score` VALUES(4, 10, 18, 7);
INSERT INTO `round_score` VALUES(4, 16, 18, 4);
INSERT INTO `round_score` VALUES(4, 12, 18, 7);
INSERT INTO `round_score` VALUES(4, 4, 18, 5);
INSERT INTO `round_score` VALUES(4, 15, 16, 8);
INSERT INTO `round_score` VALUES(4, 5, 16, 5);
INSERT INTO `round_score` VALUES(4, 11, 16, 7);
INSERT INTO `round_score` VALUES(4, 7, 16, 5);
INSERT INTO `round_score` VALUES(4, 9, 17, 6);
INSERT INTO `round_score` VALUES(4, 3, 17, 5);
INSERT INTO `round_score` VALUES(4, 14, 17, 5);
INSERT INTO `round_score` VALUES(4, 13, 17, 4);
INSERT INTO `round_score` VALUES(4, 1, 16, 5);
INSERT INTO `round_score` VALUES(4, 8, 16, 5);
INSERT INTO `round_score` VALUES(4, 2, 16, 5);
INSERT INTO `round_score` VALUES(4, 6, 16, 5);
INSERT INTO `round_score` VALUES(4, 15, 17, 6);
INSERT INTO `round_score` VALUES(4, 5, 17, 5);
INSERT INTO `round_score` VALUES(4, 11, 17, 8);
INSERT INTO `round_score` VALUES(4, 7, 17, 5);
INSERT INTO `round_score` VALUES(4, 9, 18, 5);
INSERT INTO `round_score` VALUES(4, 3, 18, 5);
INSERT INTO `round_score` VALUES(4, 14, 18, 4);
INSERT INTO `round_score` VALUES(4, 13, 18, 5);
INSERT INTO `round_score` VALUES(4, 1, 17, 5);
INSERT INTO `round_score` VALUES(4, 8, 17, 6);
INSERT INTO `round_score` VALUES(4, 2, 17, 3);
INSERT INTO `round_score` VALUES(4, 6, 17, 4);
INSERT INTO `round_score` VALUES(4, 15, 18, 7);
INSERT INTO `round_score` VALUES(4, 5, 18, 4);
INSERT INTO `round_score` VALUES(4, 11, 18, 6);
INSERT INTO `round_score` VALUES(4, 7, 18, 5);
INSERT INTO `round_score` VALUES(4, 1, 18, 4);
INSERT INTO `round_score` VALUES(4, 8, 18, 5);
INSERT INTO `round_score` VALUES(4, 2, 18, 4);
INSERT INTO `round_score` VALUES(4, 6, 18, 4);
INSERT INTO `round_score` VALUES(5, 1, 1, 4);
INSERT INTO `round_score` VALUES(5, 5, 1, 5);
INSERT INTO `round_score` VALUES(5, 12, 1, 4);
INSERT INTO `round_score` VALUES(5, 4, 1, 6);
INSERT INTO `round_score` VALUES(5, 9, 1, 4);
INSERT INTO `round_score` VALUES(5, 3, 1, 5);
INSERT INTO `round_score` VALUES(5, 2, 1, 4);
INSERT INTO `round_score` VALUES(5, 14, 1, 4);
INSERT INTO `round_score` VALUES(5, 15, 1, 8);
INSERT INTO `round_score` VALUES(5, 10, 1, 5);
INSERT INTO `round_score` VALUES(5, 13, 1, 4);
INSERT INTO `round_score` VALUES(5, 6, 1, 4);
INSERT INTO `round_score` VALUES(5, 1, 2, 5);
INSERT INTO `round_score` VALUES(5, 5, 2, 4);
INSERT INTO `round_score` VALUES(5, 12, 2, 6);
INSERT INTO `round_score` VALUES(5, 4, 2, 4);
INSERT INTO `round_score` VALUES(5, 9, 2, 3);
INSERT INTO `round_score` VALUES(5, 3, 2, 6);
INSERT INTO `round_score` VALUES(5, 2, 2, 5);
INSERT INTO `round_score` VALUES(5, 14, 2, 4);
INSERT INTO `round_score` VALUES(5, 1, 3, 5);
INSERT INTO `round_score` VALUES(5, 5, 3, 4);
INSERT INTO `round_score` VALUES(5, 12, 3, 6);
INSERT INTO `round_score` VALUES(5, 4, 3, 4);
INSERT INTO `round_score` VALUES(5, 9, 3, 6);
INSERT INTO `round_score` VALUES(5, 3, 3, 3);
INSERT INTO `round_score` VALUES(5, 2, 3, 4);
INSERT INTO `round_score` VALUES(5, 14, 3, 4);
INSERT INTO `round_score` VALUES(5, 15, 2, 8);
INSERT INTO `round_score` VALUES(5, 10, 2, 4);
INSERT INTO `round_score` VALUES(5, 13, 2, 4);
INSERT INTO `round_score` VALUES(5, 6, 2, 4);
INSERT INTO `round_score` VALUES(5, 15, 3, 7);
INSERT INTO `round_score` VALUES(5, 10, 3, 7);
INSERT INTO `round_score` VALUES(5, 13, 3, 4);
INSERT INTO `round_score` VALUES(5, 6, 3, 5);
INSERT INTO `round_score` VALUES(5, 1, 4, 6);
INSERT INTO `round_score` VALUES(5, 5, 4, 6);
INSERT INTO `round_score` VALUES(5, 12, 4, 6);
INSERT INTO `round_score` VALUES(5, 4, 4, 6);
INSERT INTO `round_score` VALUES(5, 1, 5, 3);
INSERT INTO `round_score` VALUES(5, 5, 5, 4);
INSERT INTO `round_score` VALUES(5, 12, 5, 4);
INSERT INTO `round_score` VALUES(5, 4, 5, 5);
INSERT INTO `round_score` VALUES(5, 15, 4, 8);
INSERT INTO `round_score` VALUES(5, 10, 4, 7);
INSERT INTO `round_score` VALUES(5, 13, 4, 6);
INSERT INTO `round_score` VALUES(5, 6, 4, 7);
INSERT INTO `round_score` VALUES(5, 9, 4, 5);
INSERT INTO `round_score` VALUES(5, 3, 4, 4);
INSERT INTO `round_score` VALUES(5, 2, 4, 5);
INSERT INTO `round_score` VALUES(5, 14, 4, 7);
INSERT INTO `round_score` VALUES(5, 9, 5, 4);
INSERT INTO `round_score` VALUES(5, 3, 5, 5);
INSERT INTO `round_score` VALUES(5, 2, 5, 3);
INSERT INTO `round_score` VALUES(5, 14, 5, 4);
INSERT INTO `round_score` VALUES(5, 1, 6, 4);
INSERT INTO `round_score` VALUES(5, 5, 6, 6);
INSERT INTO `round_score` VALUES(5, 12, 6, 5);
INSERT INTO `round_score` VALUES(5, 4, 6, 7);
INSERT INTO `round_score` VALUES(5, 15, 5, 4);
INSERT INTO `round_score` VALUES(5, 10, 5, 4);
INSERT INTO `round_score` VALUES(5, 13, 5, 4);
INSERT INTO `round_score` VALUES(5, 6, 5, 4);
INSERT INTO `round_score` VALUES(5, 9, 6, 5);
INSERT INTO `round_score` VALUES(5, 3, 6, 6);
INSERT INTO `round_score` VALUES(5, 2, 6, 5);
INSERT INTO `round_score` VALUES(5, 14, 6, 5);
INSERT INTO `round_score` VALUES(5, 1, 7, 4);
INSERT INTO `round_score` VALUES(5, 5, 7, 4);
INSERT INTO `round_score` VALUES(5, 12, 7, 3);
INSERT INTO `round_score` VALUES(5, 4, 7, 6);
INSERT INTO `round_score` VALUES(5, 15, 6, 6);
INSERT INTO `round_score` VALUES(5, 10, 6, 5);
INSERT INTO `round_score` VALUES(5, 13, 6, 5);
INSERT INTO `round_score` VALUES(5, 6, 6, 4);
INSERT INTO `round_score` VALUES(5, 9, 7, 5);
INSERT INTO `round_score` VALUES(5, 3, 7, 6);
INSERT INTO `round_score` VALUES(5, 2, 7, 5);
INSERT INTO `round_score` VALUES(5, 14, 7, 4);
INSERT INTO `round_score` VALUES(5, 1, 8, 5);
INSERT INTO `round_score` VALUES(5, 5, 8, 5);
INSERT INTO `round_score` VALUES(5, 12, 8, 4);
INSERT INTO `round_score` VALUES(5, 4, 8, 3);
INSERT INTO `round_score` VALUES(5, 15, 7, 4);
INSERT INTO `round_score` VALUES(5, 10, 7, 5);
INSERT INTO `round_score` VALUES(5, 13, 7, 6);
INSERT INTO `round_score` VALUES(5, 6, 7, 4);
INSERT INTO `round_score` VALUES(5, 9, 8, 4);
INSERT INTO `round_score` VALUES(5, 3, 8, 5);
INSERT INTO `round_score` VALUES(5, 2, 8, 5);
INSERT INTO `round_score` VALUES(5, 14, 8, 3);
INSERT INTO `round_score` VALUES(5, 15, 8, 4);
INSERT INTO `round_score` VALUES(5, 10, 8, 4);
INSERT INTO `round_score` VALUES(5, 13, 8, 6);
INSERT INTO `round_score` VALUES(5, 6, 8, 5);
INSERT INTO `round_score` VALUES(5, 1, 9, 4);
INSERT INTO `round_score` VALUES(5, 5, 9, 8);
INSERT INTO `round_score` VALUES(5, 12, 9, 7);
INSERT INTO `round_score` VALUES(5, 4, 9, 8);
INSERT INTO `round_score` VALUES(5, 9, 9, 8);
INSERT INTO `round_score` VALUES(5, 3, 9, 5);
INSERT INTO `round_score` VALUES(5, 2, 9, 6);
INSERT INTO `round_score` VALUES(5, 14, 9, 4);
INSERT INTO `round_score` VALUES(5, 15, 9, 7);
INSERT INTO `round_score` VALUES(5, 10, 9, 8);
INSERT INTO `round_score` VALUES(5, 13, 9, 6);
INSERT INTO `round_score` VALUES(5, 6, 9, 5);
INSERT INTO `round_score` VALUES(5, 1, 10, 4);
INSERT INTO `round_score` VALUES(5, 5, 10, 8);
INSERT INTO `round_score` VALUES(5, 12, 10, 5);
INSERT INTO `round_score` VALUES(5, 4, 10, 5);
INSERT INTO `round_score` VALUES(5, 9, 10, 6);
INSERT INTO `round_score` VALUES(5, 3, 10, 5);
INSERT INTO `round_score` VALUES(5, 2, 10, 5);
INSERT INTO `round_score` VALUES(5, 14, 10, 5);
INSERT INTO `round_score` VALUES(5, 1, 11, 4);
INSERT INTO `round_score` VALUES(5, 5, 11, 3);
INSERT INTO `round_score` VALUES(5, 12, 11, 4);
INSERT INTO `round_score` VALUES(5, 4, 11, 3);
INSERT INTO `round_score` VALUES(5, 9, 11, 5);
INSERT INTO `round_score` VALUES(5, 3, 11, 4);
INSERT INTO `round_score` VALUES(5, 2, 11, 4);
INSERT INTO `round_score` VALUES(5, 14, 11, 6);
INSERT INTO `round_score` VALUES(5, 15, 10, 5);
INSERT INTO `round_score` VALUES(5, 10, 10, 6);
INSERT INTO `round_score` VALUES(5, 13, 10, 4);
INSERT INTO `round_score` VALUES(5, 6, 10, 5);
INSERT INTO `round_score` VALUES(5, 1, 12, 4);
INSERT INTO `round_score` VALUES(5, 5, 12, 5);
INSERT INTO `round_score` VALUES(5, 12, 12, 6);
INSERT INTO `round_score` VALUES(5, 4, 12, 6);
INSERT INTO `round_score` VALUES(5, 15, 11, 5);
INSERT INTO `round_score` VALUES(5, 10, 11, 3);
INSERT INTO `round_score` VALUES(5, 13, 11, 3);
INSERT INTO `round_score` VALUES(5, 6, 11, 4);
INSERT INTO `round_score` VALUES(5, 9, 12, 6);
INSERT INTO `round_score` VALUES(5, 3, 12, 5);
INSERT INTO `round_score` VALUES(5, 2, 12, 5);
INSERT INTO `round_score` VALUES(5, 14, 12, 7);
INSERT INTO `round_score` VALUES(5, 15, 12, 7);
INSERT INTO `round_score` VALUES(5, 10, 12, 7);
INSERT INTO `round_score` VALUES(5, 13, 12, 5);
INSERT INTO `round_score` VALUES(5, 6, 12, 5);
INSERT INTO `round_score` VALUES(5, 1, 13, 6);
INSERT INTO `round_score` VALUES(5, 5, 13, 6);
INSERT INTO `round_score` VALUES(5, 12, 13, 6);
INSERT INTO `round_score` VALUES(5, 4, 13, 7);
INSERT INTO `round_score` VALUES(5, 9, 13, 4);
INSERT INTO `round_score` VALUES(5, 3, 13, 5);
INSERT INTO `round_score` VALUES(5, 2, 13, 5);
INSERT INTO `round_score` VALUES(5, 14, 13, 6);
INSERT INTO `round_score` VALUES(5, 15, 13, 7);
INSERT INTO `round_score` VALUES(5, 10, 13, 7);
INSERT INTO `round_score` VALUES(5, 13, 13, 6);
INSERT INTO `round_score` VALUES(5, 6, 13, 5);
INSERT INTO `round_score` VALUES(5, 1, 14, 4);
INSERT INTO `round_score` VALUES(5, 5, 14, 5);
INSERT INTO `round_score` VALUES(5, 12, 14, 5);
INSERT INTO `round_score` VALUES(5, 4, 14, 7);
INSERT INTO `round_score` VALUES(5, 9, 14, 5);
INSERT INTO `round_score` VALUES(5, 3, 14, 5);
INSERT INTO `round_score` VALUES(5, 2, 14, 3);
INSERT INTO `round_score` VALUES(5, 14, 14, 4);
INSERT INTO `round_score` VALUES(5, 1, 15, 4);
INSERT INTO `round_score` VALUES(5, 5, 15, 4);
INSERT INTO `round_score` VALUES(5, 12, 15, 6);
INSERT INTO `round_score` VALUES(5, 4, 15, 7);
INSERT INTO `round_score` VALUES(5, 15, 14, 7);
INSERT INTO `round_score` VALUES(5, 10, 14, 5);
INSERT INTO `round_score` VALUES(5, 13, 14, 4);
INSERT INTO `round_score` VALUES(5, 6, 14, 4);
INSERT INTO `round_score` VALUES(5, 9, 15, 5);
INSERT INTO `round_score` VALUES(5, 3, 15, 7);
INSERT INTO `round_score` VALUES(5, 2, 15, 4);
INSERT INTO `round_score` VALUES(5, 14, 15, 6);
INSERT INTO `round_score` VALUES(5, 1, 16, 5);
INSERT INTO `round_score` VALUES(5, 5, 16, 7);
INSERT INTO `round_score` VALUES(5, 12, 16, 5);
INSERT INTO `round_score` VALUES(5, 4, 16, 5);
INSERT INTO `round_score` VALUES(5, 15, 15, 6);
INSERT INTO `round_score` VALUES(5, 10, 15, 5);
INSERT INTO `round_score` VALUES(5, 13, 15, 7);
INSERT INTO `round_score` VALUES(5, 6, 15, 4);
INSERT INTO `round_score` VALUES(5, 1, 17, 4);
INSERT INTO `round_score` VALUES(5, 5, 17, 3);
INSERT INTO `round_score` VALUES(5, 12, 17, 5);
INSERT INTO `round_score` VALUES(5, 4, 17, 3);
INSERT INTO `round_score` VALUES(5, 15, 16, 7);
INSERT INTO `round_score` VALUES(5, 10, 16, 4);
INSERT INTO `round_score` VALUES(5, 13, 16, 8);
INSERT INTO `round_score` VALUES(5, 6, 16, 6);
INSERT INTO `round_score` VALUES(5, 15, 17, 5);
INSERT INTO `round_score` VALUES(5, 10, 17, 3);
INSERT INTO `round_score` VALUES(5, 13, 17, 3);
INSERT INTO `round_score` VALUES(5, 6, 17, 4);
INSERT INTO `round_score` VALUES(5, 1, 18, 6);
INSERT INTO `round_score` VALUES(5, 5, 18, 7);
INSERT INTO `round_score` VALUES(5, 12, 18, 7);
INSERT INTO `round_score` VALUES(5, 4, 18, 8);
INSERT INTO `round_score` VALUES(5, 9, 16, 5);
INSERT INTO `round_score` VALUES(5, 3, 16, 5);
INSERT INTO `round_score` VALUES(5, 2, 16, 5);
INSERT INTO `round_score` VALUES(5, 14, 16, 6);
INSERT INTO `round_score` VALUES(5, 9, 17, 5);
INSERT INTO `round_score` VALUES(5, 3, 17, 3);
INSERT INTO `round_score` VALUES(5, 2, 17, 3);
INSERT INTO `round_score` VALUES(5, 14, 17, 2);
INSERT INTO `round_score` VALUES(5, 9, 18, 5);
INSERT INTO `round_score` VALUES(5, 3, 18, 6);
INSERT INTO `round_score` VALUES(5, 2, 18, 6);
INSERT INTO `round_score` VALUES(5, 14, 18, 7);
INSERT INTO `round_score` VALUES(5, 15, 18, 6);
INSERT INTO `round_score` VALUES(5, 10, 18, 8);
INSERT INTO `round_score` VALUES(5, 13, 18, 7);
INSERT INTO `round_score` VALUES(5, 6, 18, 5);
INSERT INTO `round_score` VALUES(5, 7, 1, 5);
INSERT INTO `round_score` VALUES(5, 7, 2, 4);
INSERT INTO `round_score` VALUES(5, 7, 3, 5);
INSERT INTO `round_score` VALUES(5, 7, 4, 6);
INSERT INTO `round_score` VALUES(5, 7, 5, 3);
INSERT INTO `round_score` VALUES(5, 7, 6, 4);
INSERT INTO `round_score` VALUES(5, 7, 7, 4);
INSERT INTO `round_score` VALUES(5, 7, 8, 3);
INSERT INTO `round_score` VALUES(5, 7, 9, 6);
INSERT INTO `round_score` VALUES(5, 7, 10, 7);
INSERT INTO `round_score` VALUES(5, 7, 11, 5);
INSERT INTO `round_score` VALUES(5, 7, 12, 5);
INSERT INTO `round_score` VALUES(5, 7, 13, 5);
INSERT INTO `round_score` VALUES(5, 7, 14, 5);
INSERT INTO `round_score` VALUES(5, 7, 15, 4);
INSERT INTO `round_score` VALUES(5, 7, 16, 5);
INSERT INTO `round_score` VALUES(5, 7, 17, 3);
INSERT INTO `round_score` VALUES(5, 7, 18, 5);

-- --------------------------------------------------------

--
-- Table structure for table `round_tee_times`
--

CREATE TABLE `round_tee_times` (
  `tee_time_id` int(11) NOT NULL AUTO_INCREMENT,
  `round_id` int(11) NOT NULL,
  `tee_time` varchar(50) NOT NULL,
  PRIMARY KEY (`tee_time_id`,`round_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=21 ;

--
-- Dumping data for table `round_tee_times`
--

INSERT INTO `round_tee_times` VALUES(1, 1, 'Group 1');
INSERT INTO `round_tee_times` VALUES(2, 1, 'Group 2');
INSERT INTO `round_tee_times` VALUES(3, 1, 'Group 3');
INSERT INTO `round_tee_times` VALUES(4, 1, 'Group 4');
INSERT INTO `round_tee_times` VALUES(1, 2, 'Group 1');
INSERT INTO `round_tee_times` VALUES(2, 2, 'Group 2');
INSERT INTO `round_tee_times` VALUES(3, 2, 'Group 3');
INSERT INTO `round_tee_times` VALUES(4, 2, 'Group 4');
INSERT INTO `round_tee_times` VALUES(1, 3, 'Group 1');
INSERT INTO `round_tee_times` VALUES(2, 3, 'Group 2');
INSERT INTO `round_tee_times` VALUES(3, 3, 'Group 3');
INSERT INTO `round_tee_times` VALUES(4, 3, 'Group 4');
INSERT INTO `round_tee_times` VALUES(1, 4, 'Group 1');
INSERT INTO `round_tee_times` VALUES(2, 4, 'Group 2');
INSERT INTO `round_tee_times` VALUES(3, 4, 'Group 3');
INSERT INTO `round_tee_times` VALUES(4, 4, 'Group 4');
INSERT INTO `round_tee_times` VALUES(1, 5, 'Group 1');
INSERT INTO `round_tee_times` VALUES(2, 5, 'Group 2');
INSERT INTO `round_tee_times` VALUES(3, 5, 'Group 3');
INSERT INTO `round_tee_times` VALUES(4, 5, 'Group 4');
INSERT INTO `round_tee_times` VALUES(1, 6, 'Group 1');
INSERT INTO `round_tee_times` VALUES(2, 6, 'Group 2');
INSERT INTO `round_tee_times` VALUES(3, 6, 'Group 3');
INSERT INTO `round_tee_times` VALUES(4, 6, 'Group 4');

-- --------------------------------------------------------

--
-- Table structure for table `tee_time_golfers`
--

CREATE TABLE `tee_time_golfers` (
  `tee_time_id` int(11) NOT NULL,
  `golfer_id` int(11) NOT NULL,
  `round_id` int(11) NOT NULL,
  PRIMARY KEY (`tee_time_id`,`golfer_id`,`round_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tee_time_golfers`
--

INSERT INTO `tee_time_golfers` VALUES(1, 1, 5);
INSERT INTO `tee_time_golfers` VALUES(1, 1, 6);
INSERT INTO `tee_time_golfers` VALUES(1, 3, 1);
INSERT INTO `tee_time_golfers` VALUES(1, 4, 2);
INSERT INTO `tee_time_golfers` VALUES(1, 4, 4);
INSERT INTO `tee_time_golfers` VALUES(1, 4, 5);
INSERT INTO `tee_time_golfers` VALUES(1, 5, 2);
INSERT INTO `tee_time_golfers` VALUES(1, 5, 5);
INSERT INTO `tee_time_golfers` VALUES(1, 5, 6);
INSERT INTO `tee_time_golfers` VALUES(1, 6, 3);
INSERT INTO `tee_time_golfers` VALUES(1, 8, 3);
INSERT INTO `tee_time_golfers` VALUES(1, 10, 4);
INSERT INTO `tee_time_golfers` VALUES(1, 11, 1);
INSERT INTO `tee_time_golfers` VALUES(1, 11, 2);
INSERT INTO `tee_time_golfers` VALUES(1, 11, 3);
INSERT INTO `tee_time_golfers` VALUES(1, 12, 1);
INSERT INTO `tee_time_golfers` VALUES(1, 12, 4);
INSERT INTO `tee_time_golfers` VALUES(1, 12, 5);
INSERT INTO `tee_time_golfers` VALUES(1, 12, 6);
INSERT INTO `tee_time_golfers` VALUES(1, 15, 3);
INSERT INTO `tee_time_golfers` VALUES(1, 15, 6);
INSERT INTO `tee_time_golfers` VALUES(1, 16, 1);
INSERT INTO `tee_time_golfers` VALUES(1, 16, 2);
INSERT INTO `tee_time_golfers` VALUES(1, 16, 4);
INSERT INTO `tee_time_golfers` VALUES(2, 1, 1);
INSERT INTO `tee_time_golfers` VALUES(2, 1, 2);
INSERT INTO `tee_time_golfers` VALUES(2, 1, 3);
INSERT INTO `tee_time_golfers` VALUES(2, 2, 1);
INSERT INTO `tee_time_golfers` VALUES(2, 2, 3);
INSERT INTO `tee_time_golfers` VALUES(2, 2, 5);
INSERT INTO `tee_time_golfers` VALUES(2, 2, 6);
INSERT INTO `tee_time_golfers` VALUES(2, 3, 2);
INSERT INTO `tee_time_golfers` VALUES(2, 3, 4);
INSERT INTO `tee_time_golfers` VALUES(2, 3, 5);
INSERT INTO `tee_time_golfers` VALUES(2, 3, 6);
INSERT INTO `tee_time_golfers` VALUES(2, 5, 1);
INSERT INTO `tee_time_golfers` VALUES(2, 6, 1);
INSERT INTO `tee_time_golfers` VALUES(2, 6, 2);
INSERT INTO `tee_time_golfers` VALUES(2, 8, 6);
INSERT INTO `tee_time_golfers` VALUES(2, 9, 4);
INSERT INTO `tee_time_golfers` VALUES(2, 9, 5);
INSERT INTO `tee_time_golfers` VALUES(2, 9, 6);
INSERT INTO `tee_time_golfers` VALUES(2, 13, 4);
INSERT INTO `tee_time_golfers` VALUES(2, 14, 2);
INSERT INTO `tee_time_golfers` VALUES(2, 14, 3);
INSERT INTO `tee_time_golfers` VALUES(2, 14, 4);
INSERT INTO `tee_time_golfers` VALUES(2, 14, 5);
INSERT INTO `tee_time_golfers` VALUES(2, 16, 3);
INSERT INTO `tee_time_golfers` VALUES(3, 3, 3);
INSERT INTO `tee_time_golfers` VALUES(3, 4, 1);
INSERT INTO `tee_time_golfers` VALUES(3, 4, 3);
INSERT INTO `tee_time_golfers` VALUES(3, 5, 3);
INSERT INTO `tee_time_golfers` VALUES(3, 5, 4);
INSERT INTO `tee_time_golfers` VALUES(3, 6, 5);
INSERT INTO `tee_time_golfers` VALUES(3, 6, 6);
INSERT INTO `tee_time_golfers` VALUES(3, 7, 3);
INSERT INTO `tee_time_golfers` VALUES(3, 7, 4);
INSERT INTO `tee_time_golfers` VALUES(3, 8, 1);
INSERT INTO `tee_time_golfers` VALUES(3, 9, 1);
INSERT INTO `tee_time_golfers` VALUES(3, 9, 2);
INSERT INTO `tee_time_golfers` VALUES(3, 10, 5);
INSERT INTO `tee_time_golfers` VALUES(3, 10, 6);
INSERT INTO `tee_time_golfers` VALUES(3, 11, 4);
INSERT INTO `tee_time_golfers` VALUES(3, 11, 6);
INSERT INTO `tee_time_golfers` VALUES(3, 12, 2);
INSERT INTO `tee_time_golfers` VALUES(3, 13, 1);
INSERT INTO `tee_time_golfers` VALUES(3, 13, 2);
INSERT INTO `tee_time_golfers` VALUES(3, 13, 5);
INSERT INTO `tee_time_golfers` VALUES(3, 14, 6);
INSERT INTO `tee_time_golfers` VALUES(3, 15, 2);
INSERT INTO `tee_time_golfers` VALUES(3, 15, 4);
INSERT INTO `tee_time_golfers` VALUES(3, 15, 5);
INSERT INTO `tee_time_golfers` VALUES(4, 1, 4);
INSERT INTO `tee_time_golfers` VALUES(4, 2, 2);
INSERT INTO `tee_time_golfers` VALUES(4, 2, 4);
INSERT INTO `tee_time_golfers` VALUES(4, 4, 6);
INSERT INTO `tee_time_golfers` VALUES(4, 6, 4);
INSERT INTO `tee_time_golfers` VALUES(4, 7, 1);
INSERT INTO `tee_time_golfers` VALUES(4, 7, 2);
INSERT INTO `tee_time_golfers` VALUES(4, 7, 5);
INSERT INTO `tee_time_golfers` VALUES(4, 7, 6);
INSERT INTO `tee_time_golfers` VALUES(4, 8, 2);
INSERT INTO `tee_time_golfers` VALUES(4, 8, 4);
INSERT INTO `tee_time_golfers` VALUES(4, 8, 5);
INSERT INTO `tee_time_golfers` VALUES(4, 9, 3);
INSERT INTO `tee_time_golfers` VALUES(4, 10, 1);
INSERT INTO `tee_time_golfers` VALUES(4, 10, 2);
INSERT INTO `tee_time_golfers` VALUES(4, 10, 3);
INSERT INTO `tee_time_golfers` VALUES(4, 11, 5);
INSERT INTO `tee_time_golfers` VALUES(4, 12, 3);
INSERT INTO `tee_time_golfers` VALUES(4, 13, 3);
INSERT INTO `tee_time_golfers` VALUES(4, 13, 6);
INSERT INTO `tee_time_golfers` VALUES(4, 14, 1);
INSERT INTO `tee_time_golfers` VALUES(4, 15, 1);
INSERT INTO `tee_time_golfers` VALUES(4, 16, 5);
INSERT INTO `tee_time_golfers` VALUES(4, 16, 6);

-- --------------------------------------------------------

--
-- Table structure for table `tournament_golfer`
--

CREATE TABLE `tournament_golfer` (
  `tournament_id` int(11) NOT NULL,
  `golfer_id` int(11) NOT NULL,
  `team` int(11) DEFAULT NULL,
  `handicap` int(11) DEFAULT NULL,
  `level` varchar(25) DEFAULT NULL,
  `seed` int(11) DEFAULT NULL,
  PRIMARY KEY (`tournament_id`,`golfer_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1;

--
-- Dumping data for table `tournament_golfer`
--

INSERT INTO `tournament_golfer` VALUES(1, 1, 0, 10, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 2, 1, 6, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 3, 0, 7, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 4, 1, 13, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 5, 0, 11, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 6, 1, 6, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 7, 1, 13, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 8, 0, 15, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 9, 0, 16, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 10, 0, 21, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 11, 1, 17, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 12, 1, 19, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 13, 1, 14, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 14, 1, 9, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 15, 0, 27, NULL, NULL);
INSERT INTO `tournament_golfer` VALUES(1, 16, 0, 9, NULL, NULL);

-- --------------------------------------------------------

--
-- Table structure for table `tournament_information`
--

CREATE TABLE `tournament_information` (
  `tournament_id` int(11) NOT NULL AUTO_INCREMENT,
  `tournament_name` varchar(500) NOT NULL,
  `status` varchar(100) NOT NULL,
  `active_round` int(11) NOT NULL,
  PRIMARY KEY (`tournament_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=3 ;

--
-- Dumping data for table `tournament_information`
--

INSERT INTO `tournament_information` VALUES(1, '2016 Hawkeye Cup', 'HISTORY', 6);
INSERT INTO `tournament_information` VALUES(2, '2017 Hawkeye Cup', 'ACTIVE', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tournament_rounds`
--

CREATE TABLE `tournament_rounds` (
  `round_id` int(11) NOT NULL AUTO_INCREMENT,
  `round_name` varchar(500) NOT NULL,
  `tournament_id` int(11) NOT NULL,
  PRIMARY KEY (`round_id`)
) ENGINE=MyISAM  DEFAULT CHARSET=latin1 AUTO_INCREMENT=7 ;

--
-- Dumping data for table `tournament_rounds`
--

INSERT INTO `tournament_rounds` VALUES(1, 'Day 1 - OCN Crooked Cat', 1);
INSERT INTO `tournament_rounds` VALUES(2, 'Day 2 - OCN Panther Lake', 1);
INSERT INTO `tournament_rounds` VALUES(3, 'Day 3 - Reunion (Nicklaus Course)', 1);
INSERT INTO `tournament_rounds` VALUES(4, 'Day 4 - Southern Dunes', 1);
INSERT INTO `tournament_rounds` VALUES(5, 'Day 5 - Eagle Creek', 1);
INSERT INTO `tournament_rounds` VALUES(6, 'Practice - Mystic Dunes', 1);

-- --------------------------------------------------------

--
-- Table structure for table `tournament_team`
--

CREATE TABLE `tournament_team` (
  `tournament_id` int(11) NOT NULL,
  `team_id` int(11) NOT NULL AUTO_INCREMENT,
  `team_name` varchar(255) NOT NULL,
  `team_abrv` varchar(10) NOT NULL,
  PRIMARY KEY (`tournament_id`,`team_id`)
) ENGINE=MyISAM DEFAULT CHARSET=latin1 AUTO_INCREMENT=1 ;

--
-- Dumping data for table `tournament_team`
--

INSERT INTO `tournament_team` VALUES(1, 0, 'Team Black', 'BLK');
INSERT INTO `tournament_team` VALUES(1, 1, 'Team Gold', 'GLD');
