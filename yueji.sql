-- phpMyAdmin SQL Dump
-- version 4.1.14
-- http://www.phpmyadmin.net
--
-- Host: 127.0.0.1
-- Generation Time: 2017-12-13 11:55:32
-- 服务器版本： 5.6.17
-- PHP Version: 5.5.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Database: `yueji`
--

-- --------------------------------------------------------

--
-- 表的结构 `banners`
--

CREATE TABLE IF NOT EXISTS `banners` (
  `bid` int(10) NOT NULL AUTO_INCREMENT,
  `bthumb` int(255) NOT NULL,
  PRIMARY KEY (`bid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `manager`
--

CREATE TABLE IF NOT EXISTS `manager` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `username` varchar(20) NOT NULL,
  `password` varchar(20) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `navs`
--

CREATE TABLE IF NOT EXISTS `navs` (
  `nid` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `nname` varchar(20) NOT NULL COMMENT '分类名称',
  PRIMARY KEY (`nid`)
) ENGINE=InnoDB  DEFAULT CHARSET=utf8 COMMENT='导航分类表' AUTO_INCREMENT=5 ;

--
-- 转存表中的数据 `navs`
--

INSERT INTO `navs` (`nid`, `nname`) VALUES
(1, '新品热卖'),
(2, '美妆必败'),
(3, '购物车'),
(4, '个人中心');

-- --------------------------------------------------------

--
-- 表的结构 `newhot`
--

CREATE TABLE IF NOT EXISTS `newhot` (
  `hid` int(10) NOT NULL AUTO_INCREMENT COMMENT '新品热卖id',
  `hname` int(20) NOT NULL COMMENT '新品热卖分类名称',
  `hename` int(100) NOT NULL COMMENT '新品热卖分类英文名称',
  PRIMARY KEY (`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='新品热卖分类' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `shop`
--

CREATE TABLE IF NOT EXISTS `shop` (
  `sid` int(10) NOT NULL AUTO_INCREMENT COMMENT '商品id',
  `sname` varchar(50) NOT NULL COMMENT '商品名称',
  `sthumb` varchar(255) NOT NULL COMMENT '商品图片',
  `zhidi` varchar(20) NOT NULL COMMENT '产品质地',
  `baozhuang` varchar(20) NOT NULL COMMENT '产品包装',
  `guige` varchar(20) NOT NULL COMMENT '产品规格',
  `sdate` varchar(30) NOT NULL COMMENT '限用日期',
  `people` varchar(30) NOT NULL COMMENT '适用人群',
  `price` varchar(20) NOT NULL COMMENT '售价',
  `oldprice` varchar(20) NOT NULL COMMENT '原价',
  `address` varchar(50) NOT NULL COMMENT '产地',
  `tip` varchar(100) NOT NULL COMMENT '温馨提示',
  `fid` int(10) NOT NULL COMMENT '商品分类',
  `tid` int(10) NOT NULL COMMENT '商品特点',
  `cid` int(10) NOT NULL COMMENT '色彩分类',
  `rid` int(10) NOT NULL COMMENT '评论',
  PRIMARY KEY (`sid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品详情表' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `shopcolor`
--

CREATE TABLE IF NOT EXISTS `shopcolor` (
  `cid` int(10) NOT NULL AUTO_INCREMENT COMMENT '色彩id',
  `cname` varchar(20) NOT NULL COMMENT '色彩名称',
  `cthumb` int(11) NOT NULL COMMENT '色彩图片',
  `sid` int(11) NOT NULL COMMENT '对应商品',
  PRIMARY KEY (`cid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品色彩分类' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `shopfenlei`
--

CREATE TABLE IF NOT EXISTS `shopfenlei` (
  `fid` int(10) NOT NULL AUTO_INCREMENT COMMENT '分类id',
  `fname` int(20) NOT NULL COMMENT '分类名称 ',
  PRIMARY KEY (`fid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品分类' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `shopreview`
--

CREATE TABLE IF NOT EXISTS `shopreview` (
  `rid` int(10) NOT NULL AUTO_INCREMENT COMMENT '评论id',
  `rhead` varchar(255) NOT NULL COMMENT '评论头像',
  `rname` varchar(30) NOT NULL COMMENT '网名',
  `rcontent` varchar(255) NOT NULL COMMENT '评论内容',
  `rcolor` varchar(10) NOT NULL COMMENT '颜色分类',
  `rthumb` varchar(255) NOT NULL COMMENT '评论图片',
  `sid` int(10) NOT NULL COMMENT '对应商品',
  PRIMARY KEY (`rid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品评论' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `shopspecialty`
--

CREATE TABLE IF NOT EXISTS `shopspecialty` (
  `tid` int(10) NOT NULL AUTO_INCREMENT COMMENT '特点id',
  `tname` varchar(20) NOT NULL COMMENT '特点名称',
  `tename` varchar(100) NOT NULL COMMENT '特点英文名称',
  `tdescribe` varchar(100) NOT NULL COMMENT '特点描述',
  `sid` int(10) NOT NULL COMMENT '对应商品',
  PRIMARY KEY (`tid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品特点' AUTO_INCREMENT=1 ;

-- --------------------------------------------------------

--
-- 表的结构 `user`
--

CREATE TABLE IF NOT EXISTS `user` (
  `uid` int(10) NOT NULL AUTO_INCREMENT COMMENT '用户id',
  `uname` varchar(20) NOT NULL COMMENT '用户名称',
  `upass` varchar(20) NOT NULL COMMENT '用户密码',
  `uhead` varchar(255) NOT NULL COMMENT '用户头像',
  PRIMARY KEY (`uid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表' AUTO_INCREMENT=1 ;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
