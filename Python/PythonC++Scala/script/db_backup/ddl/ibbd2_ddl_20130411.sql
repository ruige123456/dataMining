-- MySQL dump 10.13  Distrib 5.5.24, for Linux (x86_64)
--
-- Host: localhost    Database: ibbd2
-- ------------------------------------------------------
-- Server version	5.5.24-log

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `alipay_notify`
--

DROP TABLE IF EXISTS `alipay_notify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alipay_notify` (
  `user` varchar(30) DEFAULT NULL,
  `notify_time` datetime DEFAULT NULL,
  `notify_type` varchar(30) DEFAULT NULL,
  `notify_id` varchar(50) DEFAULT NULL,
  `trade_no` varchar(20) DEFAULT NULL,
  `out_trade_no` varchar(50) DEFAULT NULL,
  `payment_type` varchar(10) DEFAULT NULL,
  `trade_status` varchar(20) DEFAULT NULL,
  `gmt_create` datetime DEFAULT NULL,
  `gmt_payment` datetime DEFAULT NULL,
  `gmt_close` datetime DEFAULT NULL,
  `gmt_refund` datetime DEFAULT NULL,
  `refund_status` varchar(20) DEFAULT NULL,
  `seller_email` varchar(100) DEFAULT NULL,
  `seller_id` varchar(20) DEFAULT NULL,
  `buyer_email` varchar(100) DEFAULT NULL,
  `buyer_id` varchar(20) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `total_fee` decimal(10,2) DEFAULT NULL,
  `discount` decimal(10,2) DEFAULT NULL,
  `is_total_fee_adjust` varchar(5) DEFAULT NULL,
  `use_coupon` varchar(5) DEFAULT NULL,
  `out_channel_amount` varchar(200) DEFAULT NULL,
  `out_channel_inst` varchar(50) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `body` varchar(300) DEFAULT NULL,
  `sign_type` varchar(10) DEFAULT NULL,
  `sign` varchar(32) DEFAULT NULL,
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付宝 异步通知记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alipay_order`
--

DROP TABLE IF EXISTS `alipay_order`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alipay_order` (
  `user` varchar(30) DEFAULT NULL,
  `service` varchar(30) NOT NULL DEFAULT '' COMMENT '接口名称',
  `partner` varchar(16) NOT NULL DEFAULT '' COMMENT '商家ID',
  `notify_url` varchar(100) NOT NULL DEFAULT '' COMMENT '异步通知路径',
  `return_url` varchar(100) NOT NULL DEFAULT '' COMMENT '上午商户跳转链接',
  `out_trade_no` varchar(50) NOT NULL DEFAULT '' COMMENT 'IBBD交易ID',
  `payment_type` varchar(5) NOT NULL DEFAULT '' COMMENT '支付类型',
  `seller_id` varchar(16) DEFAULT NULL,
  `paymethod` varchar(10) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `body` varchar(250) DEFAULT NULL,
  `show_url` varchar(50) DEFAULT NULL,
  `_input_charset` varchar(10) DEFAULT NULL,
  `sign_type` varchar(10) DEFAULT NULL,
  `sign` varchar(32) DEFAULT NULL,
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付宝订单表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `alipay_trade`
--

DROP TABLE IF EXISTS `alipay_trade`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `alipay_trade` (
  `user` varchar(50) DEFAULT NULL,
  `out_trade_no` varchar(50) DEFAULT NULL,
  `trade_no` varchar(20) DEFAULT NULL,
  `trade_status` varchar(20) DEFAULT NULL,
  `is_success` varchar(5) DEFAULT NULL,
  `seller_email` varchar(100) DEFAULT NULL,
  `seller_id` varchar(20) DEFAULT NULL,
  `buyer_id` varchar(20) DEFAULT NULL,
  `buyer_email` varchar(100) DEFAULT NULL,
  `exterface` varchar(30) DEFAULT NULL,
  `payment_type` varchar(50) DEFAULT NULL,
  `total_fee` decimal(10,2) DEFAULT NULL,
  `notify_id` varchar(100) DEFAULT NULL,
  `notify_type` varchar(20) DEFAULT NULL,
  `notify_time` datetime DEFAULT NULL,
  `subject` varchar(100) DEFAULT NULL,
  `body` varchar(300) DEFAULT NULL,
  `sign_type` varchar(10) DEFAULT NULL,
  `sign` varchar(32) DEFAULT NULL,
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付宝交易记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backuphost`
--

DROP TABLE IF EXISTS `backuphost`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backuphost` (
  `hid` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主机ID序列号',
  `host` varchar(255) NOT NULL COMMENT '主机IP',
  `user` varchar(255) NOT NULL COMMENT '用户名',
  `passwd` varchar(255) NOT NULL COMMENT '密码',
  `port` int(10) DEFAULT '3306' COMMENT '端口',
  `timestamp` datetime NOT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`hid`,`host`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backupstatus`
--

DROP TABLE IF EXISTS `backupstatus`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backupstatus` (
  `type` tinyint(4) DEFAULT NULL COMMENT '备份状态（运行中0、停止1、出错2）',
  `backupTime` datetime NOT NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `backuptables`
--

DROP TABLE IF EXISTS `backuptables`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `backuptables` (
  `tid` int(255) unsigned NOT NULL AUTO_INCREMENT COMMENT '序列号',
  `hid` varchar(255) NOT NULL COMMENT '主机的时间戳',
  `tablename` varchar(255) NOT NULL COMMENT '表名称',
  `datefield` varchar(255) NOT NULL COMMENT '日期字段（若无填Null）',
  `num_field` int(11) DEFAULT NULL COMMENT '字段数量',
  `total_record` bigint(20) DEFAULT NULL COMMENT '总记录数',
  `updatetime` datetime DEFAULT NULL COMMENT '备份的最新时间',
  PRIMARY KEY (`tid`,`hid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `history_topuser_rfmconfig`
--

DROP TABLE IF EXISTS `history_topuser_rfmconfig`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `history_topuser_rfmconfig` (
  `top_nick` varchar(50) NOT NULL COMMENT '淘宝昵称',
  `r` int(11) NOT NULL COMMENT 'R值',
  `f` int(11) NOT NULL COMMENT 'F值',
  `m` int(11) NOT NULL COMMENT 'M值',
  `rw` float NOT NULL COMMENT 'R权重',
  `fw` float NOT NULL COMMENT 'F权重',
  `mw` float NOT NULL COMMENT 'M权重',
  `lmin` int(11) NOT NULL COMMENT 'L最小值',
  `lmax` int(11) NOT NULL COMMENT 'L最大值',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `top_nick` (`top_nick`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='历史表——淘宝用户最后一次RFM计算表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ibbd_recharge_his`
--

DROP TABLE IF EXISTS `ibbd_recharge_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ibbd_recharge_his` (
  `user` varchar(50) DEFAULT NULL,
  `out_trade_no` varchar(50) DEFAULT NULL,
  `trade_no` varchar(20) DEFAULT NULL,
  `package` varchar(50) DEFAULT NULL,
  `fee_start` datetime DEFAULT NULL,
  `fee_end` datetime DEFAULT NULL,
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='支付宝支付后充值记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lib_cat_id`
--

DROP TABLE IF EXISTS `lib_cat_id`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_cat_id` (
  `cat_id` int(11) NOT NULL AUTO_INCREMENT COMMENT '类目ID',
  `cat_name` varchar(50) NOT NULL DEFAULT '' COMMENT '类目名称',
  PRIMARY KEY (`cat_id`),
  KEY `cat_name` (`cat_name`)
) ENGINE=InnoDB AUTO_INCREMENT=611 DEFAULT CHARSET=utf8 COMMENT='知识库-类目ID表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lib_cat_industry_keyword_2`
--

DROP TABLE IF EXISTS `lib_cat_industry_keyword_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_cat_industry_keyword_2` (
  `cat` varchar(100) NOT NULL DEFAULT '' COMMENT '大类目',
  `industry` varchar(100) NOT NULL DEFAULT '' COMMENT '行业',
  `keyword` varchar(50) NOT NULL DEFAULT '' COMMENT '关键词',
  PRIMARY KEY (`cat`,`industry`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识库——行业类目-行业-关键词列表(校正版2)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lib_datelist`
--

DROP TABLE IF EXISTS `lib_datelist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_datelist` (
  `date_of` date DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lib_industry`
--

DROP TABLE IF EXISTS `lib_industry`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_industry` (
  `industry` varchar(100) DEFAULT NULL COMMENT '行业名称',
  KEY `industry` (`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识库——行业表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lib_industry_3`
--

DROP TABLE IF EXISTS `lib_industry_3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_industry_3` (
  `cat` varchar(50) NOT NULL DEFAULT '' COMMENT '行业类目',
  `industry` varchar(100) NOT NULL DEFAULT '' COMMENT '行业名称',
  PRIMARY KEY (`cat`,`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识库——类目行业表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lib_numlist`
--

DROP TABLE IF EXISTS `lib_numlist`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_numlist` (
  `num` int(4) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lib_province_map`
--

DROP TABLE IF EXISTS `lib_province_map`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_province_map` (
  `province_en` varchar(20) NOT NULL COMMENT '省份英文名',
  `province_cn` varchar(20) DEFAULT NULL COMMENT '省份中文名',
  `province_cn2` varchar(20) DEFAULT NULL COMMENT '省份中文简写',
  KEY `province_en` (`province_en`),
  KEY `province_cn` (`province_cn`),
  KEY `province_cn2` (`province_cn2`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识库-省份中英文对照表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `lib_rate_library`
--

DROP TABLE IF EXISTS `lib_rate_library`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `lib_rate_library` (
  `industry` varchar(20) NOT NULL COMMENT '关键词',
  `theme` varchar(20) DEFAULT NULL COMMENT '主题',
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键词',
  `appraisal` varchar(20) DEFAULT NULL COMMENT '评论词',
  `score` int(11) DEFAULT NULL COMMENT '评价词得分',
  KEY `industry` (`industry`,`theme`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='知识库-评论关键词得分表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_compete_index`
--

DROP TABLE IF EXISTS `quota_compete_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_compete_index` (
  `keyword` varchar(100) DEFAULT NULL COMMENT '关键词',
  `date_of` date DEFAULT NULL COMMENT '当期',
  `compete_index` float DEFAULT NULL COMMENT '竞争指数',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  KEY `keyword` (`keyword`,`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指数表-竞争指数(暂时弃用)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_pct_keyword`
--

DROP TABLE IF EXISTS `quota_pct_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_pct_keyword` (
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '当期',
  `trade_num` int(11) DEFAULT NULL COMMENT '交易单数',
  `volume` int(11) DEFAULT NULL COMMENT '销量',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `pct` float DEFAULT NULL COMMENT '客单价',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`keyword`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指数表-关键词客单价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_rate_evaluate`
--

DROP TABLE IF EXISTS `quota_rate_evaluate`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_rate_evaluate` (
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `item_id` varchar(20) DEFAULT NULL COMMENT '商品ID',
  `rate_id` varchar(30) DEFAULT NULL COMMENT '评价ID',
  `rate_time` datetime DEFAULT NULL COMMENT '评论时间',
  `content` varchar(500) NOT NULL COMMENT '评价内容',
  `theme` varchar(20) DEFAULT NULL COMMENT '评论主题',
  `appraisal` varchar(20) DEFAULT NULL COMMENT '评价词',
  `score` int(11) DEFAULT NULL COMMENT '主题得分',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `shop_id` (`shop_id`,`user_num_id`,`item_id`,`rate_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='计算结果表-评论得分评估表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_ratescore_table`
--

DROP TABLE IF EXISTS `quota_ratescore_table`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_ratescore_table` (
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `date_of` date NOT NULL COMMENT '当期',
  `rank` int(11) DEFAULT NULL COMMENT '关键词下排名',
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `item_name` varchar(250) NOT NULL COMMENT '商品名称',
  `item_pic` varchar(200) NOT NULL COMMENT '商品图片地址',
  `wangwang` varchar(200) NOT NULL COMMENT '店铺旺旺',
  `user_num_id` varchar(20) NOT NULL COMMENT '店铺用户ID',
  `score` float NOT NULL COMMENT '加权得分',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  KEY `keyword` (`keyword`,`date_of`),
  KEY `item_id` (`item_id`),
  KEY `score` (`score`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关键词下商品评论得分';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_sale_index`
--

DROP TABLE IF EXISTS `quota_sale_index`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_sale_index` (
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '城市',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '指标时间戳',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`province`,`city`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `province` (`province`),
  KEY `date_of` (`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指数表-销售额';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_shop_credit`
--

DROP TABLE IF EXISTS `quota_shop_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_shop_credit` (
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `province` varchar(20) NOT NULL DEFAULT '' COMMENT '省份',
  `city` varchar(20) NOT NULL DEFAULT '' COMMENT '城市',
  `credit_level` varchar(10) NOT NULL DEFAULT '' COMMENT '信用级别',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_num_id` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺用户ID',
  `shop_name` varchar(100) DEFAULT 'NULL' COMMENT '店铺名称',
  `shop_type` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`province`,`city`,`credit_level`,`user_num_id`),
  KEY `keyword` (`keyword`),
  KEY `province` (`province`),
  KEY `credit_level` (`credit_level`),
  KEY `shop_id` (`shop_id`),
  KEY `user_num_id` (`user_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指数表-店铺信用级别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `quota_tradingtime_aly`
--

DROP TABLE IF EXISTS `quota_tradingtime_aly`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `quota_tradingtime_aly` (
  `keyword` varchar(100) NOT NULL COMMENT '关键词',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '当期',
  `hour_of` int(11) NOT NULL DEFAULT '0' COMMENT '小时',
  `volume` int(11) DEFAULT NULL COMMENT '销售量',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`keyword`,`date_of`,`hour_of`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`),
  KEY `hour_of` (`hour_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='指数表-交易时段结果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `schedule_shop_monitor`
--

DROP TABLE IF EXISTS `schedule_shop_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `schedule_shop_monitor` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `shop_uid` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺用户数字ID',
  `update_tsmp` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '用户更新时间',
  `update_date` date NOT NULL DEFAULT '1900-01-01' COMMENT '用户更新日期',
  `schedule_start_tsmp` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '任务开始时间',
  `schedule_end_tsmp` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '任务结束时间',
  `schedule_status` varchar(5) NOT NULL DEFAULT '' COMMENT '人物状态 -1/-/1',
  `schedule_status_detail` varchar(100) NOT NULL DEFAULT '' COMMENT '任务详细进度',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`,`shop_uid`,`update_date`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='任务表-店铺监控进度';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_cat_dealprice`
--

DROP TABLE IF EXISTS `ststc_cat_dealprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_cat_dealprice` (
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `date_of` date NOT NULL COMMENT '日期',
  `avg_dealprice` float(10,2) NOT NULL COMMENT '平均成交价',
  `min_dealprice` float(10,2) NOT NULL COMMENT '最低成交价',
  `max_dealprice` float(10,2) NOT NULL COMMENT '最高成交价',
  `item_count` int(11) NOT NULL COMMENT '商品数量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——类目下商品的平均成交价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_cat_range_hotshops`
--

DROP TABLE IF EXISTS `ststc_cat_range_hotshops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_cat_range_hotshops` (
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `from_date` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `to_date` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `shop_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺ID',
  `user_num_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺用户ID',
  `wangwang` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺旺旺昵称',
  `item_amount` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `volume` int(11) NOT NULL DEFAULT '0' COMMENT '销售量',
  `trade_num` int(11) NOT NULL DEFAULT '0' COMMENT '交易单数',
  `sales` float(20,2) NOT NULL DEFAULT '0.00' COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`from_date`,`to_date`,`shop_id`),
  KEY `keyword` (`keyword`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `shop_id` (`shop_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——类目下时间区间内的热销店铺';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_cat_shop_sales_detail`
--

DROP TABLE IF EXISTS `ststc_cat_shop_sales_detail`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_cat_shop_sales_detail` (
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `date_of` date NOT NULL COMMENT '日期',
  `user_num_id` varchar(30) NOT NULL COMMENT '店铺用户ID',
  `wangwang` varchar(50) NOT NULL COMMENT '卖家旺旺昵称',
  `province` varchar(20) NOT NULL COMMENT '省份',
  `city` varchar(20) NOT NULL COMMENT '城市',
  `volume` int(11) NOT NULL COMMENT '销售件数',
  `trade_num` int(11) NOT NULL COMMENT '交易次数',
  `sales` float NOT NULL COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`date_of`,`user_num_id`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`),
  KEY `user_id` (`user_num_id`),
  KEY `province` (`province`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——类目&店铺销售统计表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_cat_site_dealprice`
--

DROP TABLE IF EXISTS `ststc_cat_site_dealprice`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_cat_site_dealprice` (
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `site_type` varchar(5) NOT NULL COMMENT '店铺类型',
  `date_of` date NOT NULL COMMENT '日期',
  `avg_dealprice` float(10,2) NOT NULL COMMENT '平均成交价',
  `min_dealprice` float(10,2) NOT NULL COMMENT '最低成交价',
  `max_dealprice` float(10,2) NOT NULL COMMENT '最高成交价',
  `item_count` int(11) NOT NULL COMMENT '商品数量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`site_type`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——类目&店铺类型对应的平均成交价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_item_ends`
--

DROP TABLE IF EXISTS `ststc_item_ends`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_item_ends` (
  `keyword` varchar(30) NOT NULL DEFAULT '',
  `rank` int(11) NOT NULL DEFAULT '0',
  `item_id` varchar(30) NOT NULL DEFAULT '',
  `title` varchar(250) NOT NULL DEFAULT '',
  `user_num_id` varchar(30) NOT NULL DEFAULT '',
  `wangwang` varchar(50) NOT NULL DEFAULT '',
  `price` float(5,2) DEFAULT '-1.00',
  `volume` int(11) NOT NULL DEFAULT '0',
  `ends` datetime NOT NULL DEFAULT '1900-01-01 00:00:00',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  KEY `keyword` (`keyword`),
  KEY `rank` (`rank`),
  KEY `item_id` (`item_id`),
  KEY `ends` (`ends`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-热卖商品下架时间';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_item_rate1`
--

DROP TABLE IF EXISTS `ststc_item_rate1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_item_rate1` (
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `rate_id` varchar(40) NOT NULL COMMENT '评论ID',
  `rate_date` datetime NOT NULL COMMENT '评论时间',
  `nick` varchar(20) NOT NULL COMMENT '评论人昵称',
  `user_id` varchar(20) NOT NULL DEFAULT '' COMMENT '评论人ID',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`item_id`,`rate_id`),
  KEY `rate_date` (`rate_date`),
  KEY `user_id` (`user_id`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `item_id` (`item_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-商品评价统计';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_keyword_hot_items`
--

DROP TABLE IF EXISTS `ststc_keyword_hot_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_keyword_hot_items` (
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `from_date` date DEFAULT NULL COMMENT '日期区间',
  `to_date` date DEFAULT NULL COMMENT '日期区间',
  `item_id` varchar(30) DEFAULT NULL COMMENT '商品ID',
  `user_num_id` varchar(30) DEFAULT NULL COMMENT '店铺用户ID',
  `volume` int(11) DEFAULT NULL COMMENT '销量',
  `trade_num` int(11) DEFAULT NULL COMMENT '交易次数',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `keyword` (`keyword`),
  KEY `from_date` (`from_date`),
  KEY `to_date` (`to_date`),
  KEY `item_id` (`item_id`),
  KEY `user_num_id` (`user_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——关键词下热销商品列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_keyword_reporter`
--

DROP TABLE IF EXISTS `ststc_keyword_reporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_keyword_reporter` (
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `shop_amount_b` int(11) NOT NULL DEFAULT '0' COMMENT 'B店店铺数量',
  `shop_amount_c` int(11) NOT NULL DEFAULT '0' COMMENT 'C点店铺数量',
  `item_amount_b` int(11) NOT NULL DEFAULT '0' COMMENT 'B店商品数量',
  `item_amount_c` int(11) NOT NULL DEFAULT '0' COMMENT 'C店商品数量',
  `volume_b` int(11) NOT NULL DEFAULT '0' COMMENT '商城销量',
  `volume_c` int(11) NOT NULL DEFAULT '0' COMMENT '集市销量',
  `trade_num_b` int(11) NOT NULL DEFAULT '0' COMMENT '商城交易单数',
  `trade_num_c` int(11) NOT NULL DEFAULT '0' COMMENT '集市交易单数',
  `avg_price` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '平均成交价',
  `avg_price_b` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '商城平均成交价',
  `avg_price_c` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '集市平均成交价',
  `sales_b` float(20,2) NOT NULL DEFAULT '0.00' COMMENT '商城销售额',
  `sales_c` float(20,2) NOT NULL DEFAULT '0.00' COMMENT '集市销售额',
  `pct` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '客单价',
  `pct_b` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '商城客单价',
  `pct_c` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '集市客单价',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类目统计报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_keyword_shop_pct`
--

DROP TABLE IF EXISTS `ststc_keyword_shop_pct`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_keyword_shop_pct` (
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `wangwang` varchar(50) NOT NULL DEFAULT '' COMMENT '旺旺昵称',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `item_count` int(11) DEFAULT NULL COMMENT '商品数量',
  `trade_num` int(11) DEFAULT NULL COMMENT '交易记录数',
  `volume` int(11) DEFAULT NULL COMMENT '销售件数',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `buyer_num` int(11) DEFAULT NULL COMMENT '买家数量',
  `pct` float DEFAULT NULL COMMENT '客单价',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`wangwang`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `wangwang` (`wangwang`),
  KEY `date_of` (`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关键词类目下店铺的客单价';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_price_keyword`
--

DROP TABLE IF EXISTS `ststc_price_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_price_keyword` (
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '当期',
  `avg_price` float DEFAULT NULL COMMENT '平均价',
  `max_price` float DEFAULT NULL COMMENT '最高价',
  `min_price` float DEFAULT NULL COMMENT '最低价',
  `item_num` int(11) DEFAULT NULL COMMENT '商品数量',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `date_of` (`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关键词下价格统计信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_shop_apriori`
--

DROP TABLE IF EXISTS `ststc_shop_apriori`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_shop_apriori` (
  `shop_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺ID',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '统计日期',
  `item_id1` varchar(30) NOT NULL DEFAULT '' COMMENT '商品1ID',
  `item_id2` varchar(30) NOT NULL DEFAULT '' COMMENT '商品2ID',
  `sup` float(5,2) NOT NULL DEFAULT '0.00' COMMENT '置信度',
  `num` int(11) NOT NULL DEFAULT '0' COMMENT '关联购买数量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`shop_id`,`item_id1`,`item_id2`),
  KEY `shop_id` (`shop_id`),
  KEY `date_of` (`date_of`),
  KEY `item_id1` (`item_id1`),
  KEY `item_id2` (`item_id2`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——店铺的关联搭配计算结果';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_shop_credit`
--

DROP TABLE IF EXISTS `ststc_shop_credit`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_shop_credit` (
  `province` varchar(20) DEFAULT NULL COMMENT '省份',
  `city` varchar(20) DEFAULT NULL COMMENT '城市',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `shop_name` varchar(100) DEFAULT 'NULL' COMMENT '店铺名称',
  `shop_type` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `credit_level` varchar(10) DEFAULT NULL COMMENT '信用级别',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  KEY `province` (`province`),
  KEY `user_num_id` (`user_num_id`),
  KEY `credit_level` (`credit_level`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-店铺信用级别表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_shop_monitor_reporter`
--

DROP TABLE IF EXISTS `ststc_shop_monitor_reporter`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_shop_monitor_reporter` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `shop_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺ID',
  `user_num_id` varchar(30) NOT NULL DEFAULT '' COMMENT '用户ID',
  `shop_type` varchar(5) NOT NULL DEFAULT '' COMMENT '店铺类型',
  `shop_name` varchar(100) NOT NULL DEFAULT '' COMMENT '店铺名称',
  `wangwang` varchar(50) NOT NULL DEFAULT '' COMMENT '旺旺昵称',
  `location` varchar(20) NOT NULL DEFAULT '' COMMENT '所在地',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '统计日期',
  `item_count` int(11) NOT NULL DEFAULT '0' COMMENT '监控商品数量',
  `lastest_volume` int(11) NOT NULL DEFAULT '0' COMMENT '最近30/all天销售量',
  `lastest_sales` int(11) NOT NULL DEFAULT '0' COMMENT '最近30/all天销售额',
  `coll_count` int(11) NOT NULL DEFAULT '0' COMMENT '收藏量',
  `con_rate` float(5,5) NOT NULL DEFAULT '0.00000' COMMENT '转化率',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`,`shop_id`,`date_of`),
  KEY `user` (`user`),
  KEY `shop_id` (`shop_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺概况报表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_shop_multi_buyer`
--

DROP TABLE IF EXISTS `ststc_shop_multi_buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_shop_multi_buyer` (
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `date_of` date DEFAULT NULL COMMENT '日期',
  `identifier` varchar(30) DEFAULT NULL COMMENT '买家识别标志',
  `buyer_id` varchar(20) DEFAULT NULL COMMENT '买家ID',
  `iids` varchar(300) NOT NULL COMMENT '购买ID列表',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  KEY `shop_id` (`shop_id`,`user_num_id`,`identifier`,`buyer_id`,`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-店铺内组合买家购买列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_shop_overview`
--

DROP TABLE IF EXISTS `ststc_shop_overview`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_shop_overview` (
  `user_num_id` varchar(30) NOT NULL DEFAULT '' COMMENT '用户数字ID',
  `shop_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺ID',
  `site_id` varchar(5) NOT NULL DEFAULT '' COMMENT '店铺类型',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '统计日期',
  `item_count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `volume` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `sales` int(11) NOT NULL DEFAULT '0' COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`shop_id`,`date_of`),
  KEY `user_num_id` (`user_num_id`),
  KEY `shop_id` (`shop_id`),
  KEY `site_id` (`site_id`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='店铺所有商品基本数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_shop_pct_nokeyword`
--

DROP TABLE IF EXISTS `ststc_shop_pct_nokeyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_shop_pct_nokeyword` (
  `shop_id` varchar(20) NOT NULL DEFAULT '',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `sales` int(11) DEFAULT NULL,
  `buyer_num` int(11) DEFAULT NULL,
  `trade_num` int(11) DEFAULT NULL,
  `volume` int(11) DEFAULT NULL,
  `item_count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量（多少商品当天有销量）',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`shop_id`,`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='客单价店铺统计表，不具有关键词信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_shop_recommend_items`
--

DROP TABLE IF EXISTS `ststc_shop_recommend_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_shop_recommend_items` (
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `user_num_id` varchar(20) DEFAULT NULL COMMENT '店铺用户ID',
  `date_of` date DEFAULT NULL COMMENT '日期',
  `iid1` varchar(20) NOT NULL COMMENT '商品1',
  `iid2` varchar(20) NOT NULL COMMENT '商品2',
  `sup` float NOT NULL COMMENT '支持度',
  `trade_num` int(11) NOT NULL COMMENT '组合成交笔数',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  KEY `shop_id` (`shop_id`,`user_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关联推荐结果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_shop_sale_in`
--

DROP TABLE IF EXISTS `ststc_shop_sale_in`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_shop_sale_in` (
  `user_num_id` varchar(30) NOT NULL COMMENT '店铺用户ID',
  `shop_id` varchar(30) DEFAULT '' COMMENT '店铺ID',
  `wangwang` varchar(100) DEFAULT '' COMMENT '旺旺昵称',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `volume` int(11) NOT NULL DEFAULT '0' COMMENT '销量',
  `sales` float(10,1) NOT NULL DEFAULT '0.0' COMMENT '销售额',
  `trade_num` int(11) NOT NULL DEFAULT '0' COMMENT '交易单数',
  `pct` float(10,1) NOT NULL DEFAULT '0.0' COMMENT '客单价',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user_num_id`,`date_of`),
  KEY `user_num_id` (`user_num_id`),
  KEY `shop_id` (`shop_id`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表——店铺每日销售数据(商品为监控列表中的商品)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_shop_sales_keyword`
--

DROP TABLE IF EXISTS `ststc_shop_sales_keyword`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_shop_sales_keyword` (
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `user_num_id` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺用户ID',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '当期',
  `volume` int(11) DEFAULT NULL COMMENT '销量',
  `trade_num` int(11) DEFAULT NULL COMMENT '交易单数',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`keyword`,`user_num_id`,`date_of`),
  KEY `keyword` (`keyword`),
  KEY `user_num_id` (`user_num_id`),
  KEY `date_of` (`date_of`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='统计表-关键词下店铺每日销售数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `ststc_ztc_shops`
--

DROP TABLE IF EXISTS `ststc_ztc_shops`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `ststc_ztc_shops` (
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `user_num_id` varchar(20) NOT NULL DEFAULT '' COMMENT '卖家用户ID',
  `wangwang` varchar(50) DEFAULT NULL COMMENT '掌柜昵称',
  PRIMARY KEY (`keyword`,`user_num_id`),
  KEY `keyword` (`keyword`),
  KEY `user_num_id` (`user_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_cat_items`
--

DROP TABLE IF EXISTS `top_cat_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_cat_items` (
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `item_id` varchar(30) NOT NULL DEFAULT '' COMMENT '商品ID',
  `site_id` varchar(5) NOT NULL COMMENT '店铺类型',
  `user_num_id` varchar(30) NOT NULL DEFAULT '' COMMENT '卖家用户ID',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`item_id`),
  KEY `keyword` (`keyword`),
  KEY `item_id` (`item_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='类目下商品列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_cat_search_result`
--

DROP TABLE IF EXISTS `top_cat_search_result`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_cat_search_result` (
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `rank` int(11) DEFAULT NULL COMMENT '排名',
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `item_name` varchar(250) NOT NULL COMMENT '商品名称',
  `item_pic` varchar(200) DEFAULT 'NULL' COMMENT '商品图片',
  `wangwang` varchar(100) NOT NULL COMMENT '旺旺昵称',
  `user_num_id` varchar(20) NOT NULL COMMENT '店铺用户ID',
  `price` float NOT NULL COMMENT '商品标价',
  `location` varchar(50) NOT NULL COMMENT '商品所在地',
  `volume` int(11) NOT NULL COMMENT '最近销量',
  `rate_num` int(11) NOT NULL COMMENT '商品评论量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`keyword`,`item_id`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `keyword` (`keyword`),
  KEY `rank` (`rank`),
  KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品搜索结果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item1`
--

DROP TABLE IF EXISTS `top_item1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item1` (
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `user_num_id` varchar(20) NOT NULL COMMENT '店铺用户ID',
  `shop_id` varchar(20) NOT NULL COMMENT '店铺ID',
  `shop_type` varchar(20) NOT NULL COMMENT '所属店铺类型',
  `date_of` datetime NOT NULL COMMENT '属性更新时间',
  `price` float NOT NULL DEFAULT '0' COMMENT '商品发布价格',
  `title` varchar(250) NOT NULL COMMENT '商品标题',
  `location` varchar(20) NOT NULL COMMENT '商品所在地',
  `location2` varchar(20) NOT NULL COMMENT '修正地址',
  `brand` varchar(30) NOT NULL COMMENT '商品品牌',
  `item_img` varchar(100) NOT NULL COMMENT '商品图片',
  `volume_month` int(11) NOT NULL DEFAULT '0' COMMENT '月销量',
  `volume_all` int(11) NOT NULL DEFAULT '0' COMMENT '总销量',
  `cid` varchar(20) NOT NULL COMMENT '类目',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`item_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `shop_id` (`shop_id`),
  KEY `date_of` (`date_of`),
  KEY `location` (`location`),
  KEY `location2` (`location2`),
  KEY `brand` (`brand`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item2`
--

DROP TABLE IF EXISTS `top_item2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item2` (
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '属性更新时间',
  `price` float DEFAULT NULL COMMENT '初始价格',
  `volume` int(11) DEFAULT NULL COMMENT '商品销量',
  `trade_num` int(11) DEFAULT NULL COMMENT '成交笔数',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `min_deal_price` float DEFAULT NULL COMMENT '商品最小成交价',
  `avg_deal_price` float DEFAULT NULL COMMENT '商品平均成交价',
  `buyer_num` int(11) DEFAULT NULL COMMENT '购买人数',
  `pct` float DEFAULT NULL COMMENT '客单价',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`item_id`,`date_of`),
  KEY `item_id` (`item_id`),
  KEY `shop_id` (`shop_id`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表2（统计表）'
/*!50500 PARTITION BY RANGE  COLUMNS(date_of)
(PARTITION p2012_11 VALUES LESS THAN ('2012-12-01') ENGINE = InnoDB,
 PARTITION p2012_12 VALUES LESS THAN ('2013-01-01') ENGINE = InnoDB,
 PARTITION p2013_01 VALUES LESS THAN ('2013-02-01') ENGINE = InnoDB,
 PARTITION p2013_02 VALUES LESS THAN ('2013-03-01') ENGINE = InnoDB,
 PARTITION p2013_03 VALUES LESS THAN ('2013-04-01') ENGINE = InnoDB,
 PARTITION p2013_04 VALUES LESS THAN ('2013-05-01') ENGINE = InnoDB,
 PARTITION p2013_05 VALUES LESS THAN ('2013-06-01') ENGINE = InnoDB,
 PARTITION p2013_06 VALUES LESS THAN ('2013-07-01') ENGINE = InnoDB,
 PARTITION p2013_07 VALUES LESS THAN ('2013-08-01') ENGINE = InnoDB,
 PARTITION p2013_08 VALUES LESS THAN ('2013-09-01') ENGINE = InnoDB,
 PARTITION p2013_09 VALUES LESS THAN ('2013-10-01') ENGINE = InnoDB,
 PARTITION p2013_10 VALUES LESS THAN ('2013-11-01') ENGINE = InnoDB,
 PARTITION p2013_11 VALUES LESS THAN ('2013-12-01') ENGINE = InnoDB,
 PARTITION p2013_12 VALUES LESS THAN ('2014-01-01') ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item2_partition`
--

DROP TABLE IF EXISTS `top_item2_partition`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item2_partition` (
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `shop_id` varchar(20) DEFAULT NULL COMMENT '店铺ID',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '属性更新时间',
  `price` float DEFAULT NULL COMMENT '初始价格',
  `volume` int(11) DEFAULT NULL COMMENT '商品销量',
  `trade_num` int(11) DEFAULT NULL COMMENT '成交笔数',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `min_deal_price` float DEFAULT NULL COMMENT '商品最小成交价',
  `avg_deal_price` float DEFAULT NULL COMMENT '商品平均成交价',
  `buyer_num` int(11) DEFAULT NULL COMMENT '购买人数',
  `pct` float DEFAULT NULL COMMENT '客单价',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  PRIMARY KEY (`item_id`,`date_of`),
  KEY `item_id` (`item_id`),
  KEY `shop_id` (`shop_id`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表2（统计表）'
/*!50500 PARTITION BY RANGE  COLUMNS(date_of)
SUBPARTITION BY KEY (item_id)
SUBPARTITIONS 20
(PARTITION p2012_11 VALUES LESS THAN ('2012-12-01') ENGINE = InnoDB,
 PARTITION p2012_12 VALUES LESS THAN ('2013-01-01') ENGINE = InnoDB,
 PARTITION p2013_01 VALUES LESS THAN ('2013-02-01') ENGINE = InnoDB,
 PARTITION p2013_02 VALUES LESS THAN ('2013-03-01') ENGINE = InnoDB,
 PARTITION p2013_03 VALUES LESS THAN ('2013-04-01') ENGINE = InnoDB,
 PARTITION p2013_04 VALUES LESS THAN ('2013-05-01') ENGINE = InnoDB,
 PARTITION p2013_05 VALUES LESS THAN ('2013-06-01') ENGINE = InnoDB,
 PARTITION p2013_06 VALUES LESS THAN ('2013-07-01') ENGINE = InnoDB,
 PARTITION p2013_07 VALUES LESS THAN ('2013-08-01') ENGINE = InnoDB,
 PARTITION p2013_08 VALUES LESS THAN ('2013-09-01') ENGINE = InnoDB,
 PARTITION p2013_09 VALUES LESS THAN ('2013-10-01') ENGINE = InnoDB,
 PARTITION p2013_10 VALUES LESS THAN ('2013-11-01') ENGINE = InnoDB,
 PARTITION p2013_11 VALUES LESS THAN ('2013-12-01') ENGINE = InnoDB,
 PARTITION p2013_12 VALUES LESS THAN ('2014-01-01') ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item3`
--

DROP TABLE IF EXISTS `top_item3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item3` (
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `attr_list` varchar(1500) NOT NULL DEFAULT '' COMMENT '商品属性',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`item_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表3——商品额外字段';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item4`
--

DROP TABLE IF EXISTS `top_item4`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item4` (
  `item_id` varchar(30) NOT NULL DEFAULT '' COMMENT '商品ID',
  `page_id` varchar(30) NOT NULL DEFAULT '' COMMENT '页面ID',
  `shop_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺ID',
  `user_num_id` varchar(30) NOT NULL DEFAULT '' COMMENT '用户数字ID',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '统计日期',
  `fav_num` int(11) NOT NULL DEFAULT '0' COMMENT '收藏量',
  `review_count` int(11) NOT NULL DEFAULT '0' COMMENT '浏览量',
  `starts` varchar(20) NOT NULL DEFAULT '' COMMENT '上架时间',
  `ends` varchar(20) NOT NULL DEFAULT '' COMMENT '下架时间',
  `user_tag` varchar(30) NOT NULL DEFAULT '' COMMENT '用户标签ID',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`item_id`,`date_of`),
  KEY `item_id` (`item_id`),
  KEY `shop_id` (`shop_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品属性表4(动态)';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_buyer`
--

DROP TABLE IF EXISTS `top_item_buyer`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_buyer` (
  `item_id` varchar(20) NOT NULL COMMENT '..ID',
  `date_of` date DEFAULT NULL COMMENT '..',
  `nick` varchar(20) DEFAULT NULL COMMENT '..',
  `rank` varchar(20) DEFAULT NULL COMMENT '....',
  `identifier` varchar(20) DEFAULT NULL COMMENT '.....',
  `trade_num` int(11) DEFAULT NULL COMMENT '....',
  `volume` int(11) DEFAULT NULL COMMENT '....',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '...',
  KEY `item_id` (`item_id`,`date_of`,`nick`,`rank`),
  KEY `identifier` (`identifier`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品买家列表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_promo`
--

DROP TABLE IF EXISTS `top_item_promo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_promo` (
  `item_id` varchar(30) NOT NULL DEFAULT '' COMMENT '商品ID',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `sku_key` varchar(30) NOT NULL DEFAULT '',
  `sku_id` varchar(30) NOT NULL DEFAULT '',
  `ori_price` float(8,2) DEFAULT '0.00' COMMENT '原始价格',
  `promo_type` varchar(30) NOT NULL DEFAULT '' COMMENT '促销类型',
  `promo_price` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '促销价格',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`item_id`,`date_of`,`sku_id`,`promo_type`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝-宝贝促销数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_sku`
--

DROP TABLE IF EXISTS `top_item_sku`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_sku` (
  `item_id` varchar(30) NOT NULL DEFAULT '' COMMENT '商品ID',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `sku_key` varchar(50) NOT NULL DEFAULT '',
  `sku_id` varchar(30) NOT NULL DEFAULT '',
  `price` float(8,2) NOT NULL DEFAULT '0.00' COMMENT '价格',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`item_id`,`date_of`,`sku_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝-宝贝sku信息';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_tradingtime`
--

DROP TABLE IF EXISTS `top_item_tradingtime`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_tradingtime` (
  `item_id` varchar(20) NOT NULL DEFAULT '' COMMENT '商品ID',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '日期',
  `hour_0` int(11) NOT NULL DEFAULT '0' COMMENT '0时销量',
  `hour_1` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_2` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_3` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_4` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_5` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_6` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_7` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_8` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_9` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_10` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_11` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_12` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_13` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_14` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_15` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_16` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_17` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_18` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_19` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_20` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_21` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_22` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `hour_23` int(11) NOT NULL DEFAULT '0' COMMENT '*时销量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`item_id`,`date_of`),
  KEY `item_id` (`item_id`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝-商品交易时段表'
/*!50500 PARTITION BY RANGE  COLUMNS(date_of)
(PARTITION p2012_11 VALUES LESS THAN ('2012-12-01') ENGINE = InnoDB,
 PARTITION p2012_12 VALUES LESS THAN ('2013-01-01') ENGINE = InnoDB,
 PARTITION p2013_01 VALUES LESS THAN ('2013-02-01') ENGINE = InnoDB,
 PARTITION p2013_02 VALUES LESS THAN ('2013-03-01') ENGINE = InnoDB,
 PARTITION p2013_03 VALUES LESS THAN ('2013-04-01') ENGINE = InnoDB,
 PARTITION p2013_04 VALUES LESS THAN ('2013-05-01') ENGINE = InnoDB,
 PARTITION p2013_05 VALUES LESS THAN ('2013-06-01') ENGINE = InnoDB,
 PARTITION p2013_06 VALUES LESS THAN ('2013-07-01') ENGINE = InnoDB,
 PARTITION p2013_07 VALUES LESS THAN ('2013-08-01') ENGINE = InnoDB,
 PARTITION p2013_08 VALUES LESS THAN ('2013-09-01') ENGINE = InnoDB,
 PARTITION p2013_09 VALUES LESS THAN ('2013-10-01') ENGINE = InnoDB,
 PARTITION p2013_10 VALUES LESS THAN ('2013-11-01') ENGINE = InnoDB,
 PARTITION p2013_11 VALUES LESS THAN ('2013-12-01') ENGINE = InnoDB,
 PARTITION p2013_12 VALUES LESS THAN ('2014-01-01') ENGINE = InnoDB) */;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_item_tradingtime_bak`
--

DROP TABLE IF EXISTS `top_item_tradingtime_bak`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_item_tradingtime_bak` (
  `item_id` varchar(20) NOT NULL DEFAULT '' COMMENT '商品ID',
  `date_of` date NOT NULL DEFAULT '0000-00-00' COMMENT '日期',
  `hour_of` int(11) NOT NULL DEFAULT '0' COMMENT '小时',
  `volume` int(11) DEFAULT NULL COMMENT '销量',
  `sales` float DEFAULT NULL COMMENT '销售额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`item_id`,`date_of`,`hour_of`),
  KEY `item_id` (`item_id`),
  KEY `date_of` (`date_of`),
  KEY `hour_of` (`hour_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='商品表-交易时段表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_itemsearchresult`
--

DROP TABLE IF EXISTS `top_itemsearchresult`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_itemsearchresult` (
  `keyword` varchar(20) NOT NULL COMMENT '搜索关键词',
  `rank` int(11) DEFAULT NULL COMMENT '排名',
  `item_id` varchar(20) NOT NULL COMMENT '商品ID',
  `item_name` varchar(250) NOT NULL COMMENT '商品名称',
  `item_pic` varchar(200) DEFAULT 'NULL' COMMENT '商品图片',
  `wangwang` varchar(100) NOT NULL COMMENT '旺旺昵称',
  `user_num_id` varchar(20) NOT NULL COMMENT '店铺用户ID',
  `price` float NOT NULL COMMENT '商品标价',
  `location` varchar(50) NOT NULL COMMENT '商品所在地',
  `volume` int(11) NOT NULL COMMENT '最近销量',
  `rate_num` int(11) NOT NULL COMMENT '商品评论量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `population_tsmp` (`population_tsmp`),
  KEY `keyword` (`keyword`),
  KEY `rank` (`rank`),
  KEY `location` (`location`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝商品搜索结果表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_shop1`
--

DROP TABLE IF EXISTS `top_shop1`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_shop1` (
  `shop_id` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺ID',
  `user_num_id` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺用户ID',
  `shop_name` varchar(100) DEFAULT 'NULL' COMMENT '店铺名称',
  `wangwang` varchar(50) DEFAULT NULL COMMENT '旺旺昵称',
  `shop_type` varchar(5) DEFAULT NULL COMMENT '店铺类型',
  `shop_rank` varchar(10) DEFAULT NULL COMMENT '店铺信用评级',
  `location` varchar(15) DEFAULT NULL COMMENT '所在地',
  `location2` varchar(20) DEFAULT NULL COMMENT '修正地区',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '更新时间戳',
  PRIMARY KEY (`shop_id`,`user_num_id`),
  KEY `shop_id` (`shop_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `location` (`location`),
  KEY `population_tsmp` (`population_tsmp`),
  KEY `shop_name` (`shop_name`),
  KEY `wangwang` (`wangwang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝店铺表1';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_shop2`
--

DROP TABLE IF EXISTS `top_shop2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_shop2` (
  `shop_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺ID',
  `user_num_id` varchar(30) NOT NULL DEFAULT '' COMMENT '用户数字ID',
  `date_of` date NOT NULL DEFAULT '1900-01-01' COMMENT '统计日期',
  `coll_count` int(11) NOT NULL DEFAULT '0' COMMENT '店铺收藏量',
  `item_count` int(11) NOT NULL DEFAULT '0' COMMENT '商品数量',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`shop_id`,`date_of`),
  KEY `shop_id` (`shop_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `date_of` (`date_of`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='基础表-店铺动态数据';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_tiny_shop`
--

DROP TABLE IF EXISTS `top_tiny_shop`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_tiny_shop` (
  `id` varchar(20) NOT NULL DEFAULT '',
  `user_num_id` varchar(20) NOT NULL DEFAULT '',
  `wangwang` varchar(255) DEFAULT NULL COMMENT '店铺旺旺',
  PRIMARY KEY (`id`,`user_num_id`),
  KEY `wangwang_id` (`wangwang`,`user_num_id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='简单的店铺表，可能数据不全';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_user`
--

DROP TABLE IF EXISTS `top_user`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_user` (
  `user_id` varchar(20) DEFAULT NULL COMMENT '用户公开ID',
  `nick` varchar(20) DEFAULT NULL COMMENT '昵称',
  `gender` varchar(2) DEFAULT NULL COMMENT '性别',
  `state` varchar(20) DEFAULT NULL COMMENT '用户所在省市',
  `city` varchar(20) DEFAULT NULL COMMENT '用户所在地',
  `created` datetime DEFAULT NULL COMMENT '用户创建时间',
  `last_visit` datetime DEFAULT NULL COMMENT '用户最后访问时间',
  `buyer_credit_good_num` int(11) DEFAULT NULL COMMENT '收到的好评总条数',
  `buyer_credit_level` int(11) DEFAULT NULL COMMENT '买家信用等级',
  `buyer_credit_score` int(11) DEFAULT NULL COMMENT '买家信用总分',
  `buyer_credit_total_num` int(11) DEFAULT NULL COMMENT '收到的评价总条数',
  `update_status` varchar(5) DEFAULT NULL COMMENT '更新计划状态',
  `population_tsmp` timestamp NULL DEFAULT NULL COMMENT '时间戳',
  KEY `user_id` (`user_id`),
  KEY `update_status` (`update_status`),
  KEY `nick` (`nick`),
  KEY `gender` (`gender`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='淘宝用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `top_ztc_sum`
--

DROP TABLE IF EXISTS `top_ztc_sum`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `top_ztc_sum` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT COMMENT '暂定使用item_id',
  `keyword` varchar(30) NOT NULL COMMENT '关键词',
  `key` varchar(50) NOT NULL COMMENT '搜索词',
  `item_id` bigint(20) NOT NULL COMMENT '商品id',
  `avg_rank` int(11) NOT NULL COMMENT '评价排名',
  `lastest_tsmp` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00' ON UPDATE CURRENT_TIMESTAMP COMMENT '最后更新时间',
  `shop_id` varchar(255) DEFAULT NULL COMMENT '卖家用户ID',
  PRIMARY KEY (`id`),
  KEY `index_item` (`item_id`),
  KEY `index_test` (`keyword`,`lastest_tsmp`,`shop_id`,`item_id`,`avg_rank`),
  KEY `index_keyword_tsmp` (`keyword`,`lastest_tsmp`)
) ENGINE=InnoDB AUTO_INCREMENT=23952536502 DEFAULT CHARSET=utf8 COMMENT='直通车排名';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user2`
--

DROP TABLE IF EXISTS `user2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user2` (
  `user` varchar(20) NOT NULL COMMENT '用户名',
  `passwd` varchar(30) NOT NULL COMMENT '登陆密码',
  `nick` varchar(30) NOT NULL COMMENT '用户昵称',
  `email` varchar(50) NOT NULL COMMENT '用户注册邮箱',
  `tel` varchar(20) DEFAULT NULL COMMENT '联系信息',
  `shop_link` varchar(50) DEFAULT NULL COMMENT '店铺域名',
  `wangwang` varchar(50) DEFAULT NULL COMMENT '用户店铺旺旺',
  `shop_name` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `shop_uid` varchar(30) DEFAULT NULL COMMENT '用户淘宝店铺ID',
  `location` varchar(20) DEFAULT NULL COMMENT '用户所在地',
  `industry` varchar(50) DEFAULT NULL COMMENT '用户所在行业',
  `create_time` datetime NOT NULL COMMENT '用户注册时间',
  `status` varchar(5) NOT NULL COMMENT '账户状态',
  `unused` varchar(200) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='IBBD-用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user3`
--

DROP TABLE IF EXISTS `user3`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user3` (
  `user` varchar(20) NOT NULL COMMENT '用户名',
  `passwd` varchar(30) NOT NULL COMMENT '登陆密码',
  `nick` varchar(30) NOT NULL COMMENT '用户昵称',
  `email` varchar(50) NOT NULL COMMENT '用户注册邮箱',
  `tel` varchar(20) DEFAULT NULL COMMENT '联系信息',
  `shop_link` varchar(50) DEFAULT NULL COMMENT '店铺域名',
  `wangwang` varchar(50) DEFAULT NULL COMMENT '用户店铺旺旺',
  `shop_name` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `shop_uid` varchar(30) DEFAULT NULL COMMENT '用户淘宝店铺ID',
  `location` varchar(20) DEFAULT NULL COMMENT '用户所在地',
  `industry` varchar(50) DEFAULT NULL COMMENT '用户所在行业',
  `create_time` datetime NOT NULL COMMENT '用户注册时间',
  `status` varchar(5) NOT NULL COMMENT '账户状态',
  `unused` varchar(200) DEFAULT NULL COMMENT '保留字段',
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='IBBD-用户表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_discount`
--

DROP TABLE IF EXISTS `user_discount`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_discount` (
  `admin` varchar(20) NOT NULL DEFAULT '' COMMENT '管理员',
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户',
  `discount` decimal(10,2) NOT NULL DEFAULT '1.00' COMMENT '折扣(7/8/9)',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '时间戳',
  PRIMARY KEY (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_discount_his`
--

DROP TABLE IF EXISTS `user_discount_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_discount_his` (
  `user` varchar(20) DEFAULT NULL,
  `out_trade_no` varchar(50) DEFAULT NULL,
  `package` varchar(20) DEFAULT NULL,
  `discount` decimal(5,2) DEFAULT NULL,
  `pre_price` decimal(10,2) DEFAULT NULL,
  `discount_price` decimal(10,2) DEFAULT NULL,
  `quantity` int(11) DEFAULT NULL,
  `valid` tinyint(4) DEFAULT NULL,
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  KEY `user` (`user`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_fee_his`
--

DROP TABLE IF EXISTS `user_fee_his`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_fee_his` (
  `user` varchar(20) NOT NULL COMMENT '用户',
  `admin_nick` varchar(20) NOT NULL COMMENT '操作管理员',
  `package` varchar(20) NOT NULL COMMENT '套餐类型',
  `amount` int(11) NOT NULL COMMENT '购买数量',
  `fee` float NOT NULL COMMENT '费用',
  `from_date` date NOT NULL COMMENT '计费开始日期',
  `to_date` date NOT NULL COMMENT '计费结束日期',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  KEY `user` (`user`),
  KEY `admin_nick` (`admin_nick`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表-付费记录';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_item_monitor`
--

DROP TABLE IF EXISTS `user_item_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_item_monitor` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `item_id` varchar(30) NOT NULL DEFAULT '' COMMENT '商品ID',
  `item_title` varchar(250) DEFAULT NULL COMMENT '商品名称',
  `item_pic` varchar(300) DEFAULT NULL COMMENT '商品图片',
  `wangwang` varchar(100) DEFAULT NULL COMMENT '卖家',
  `source` varchar(50) DEFAULT NULL COMMENT '监控来源',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`,`item_id`),
  KEY `wangwang` (`wangwang`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户商品监控配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_itemends_monitor`
--

DROP TABLE IF EXISTS `user_itemends_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_itemends_monitor` (
  `user` varchar(30) NOT NULL DEFAULT '',
  `keyword` varchar(50) NOT NULL DEFAULT '',
  `status` varchar(10) DEFAULT '' COMMENT '0/1',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`user`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户配置-热卖宝贝下架分布';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_keywords`
--

DROP TABLE IF EXISTS `user_keywords`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_keywords` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `industry` varchar(50) NOT NULL DEFAULT '' COMMENT '行业',
  `min_price` float DEFAULT '0' COMMENT '最低价格',
  `max_price` float DEFAULT '5000' COMMENT '最高价格',
  `location` varchar(200) DEFAULT NULL COMMENT '商品所在地区',
  `min_sale` float DEFAULT '10' COMMENT '最小销售额筛选',
  `status` varchar(5) DEFAULT '1' COMMENT '状态',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`,`keyword`),
  KEY `user` (`user`),
  KEY `keyword` (`keyword`),
  KEY `status` (`status`),
  KEY `industry` (`industry`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表-关键词配置表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_keywords_ztc`
--

DROP TABLE IF EXISTS `user_keywords_ztc`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_keywords_ztc` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户',
  `keyword` varchar(100) NOT NULL DEFAULT '' COMMENT '关键词',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`,`keyword`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户直通车监控配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_privileges`
--

DROP TABLE IF EXISTS `user_privileges`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_privileges` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `account_type` varchar(10) NOT NULL DEFAULT 'S' COMMENT '账户类型（公共用户P、私人用户S，管理员A）',
  `level` varchar(20) NOT NULL DEFAULT '免费版',
  `vip` int(11) NOT NULL DEFAULT '0' COMMENT 'VIP级别',
  `cats_limit` int(11) NOT NULL DEFAULT '5' COMMENT '自定义类目数量限制',
  `shop_limit` int(11) NOT NULL DEFAULT '3' COMMENT '监控店铺数量限制',
  `item_limit` int(11) NOT NULL DEFAULT '10' COMMENT '监控商品数量限制',
  `ztc_limit` int(11) NOT NULL DEFAULT '-1',
  `balance` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`),
  KEY `level` (`level`),
  KEY `vip` (`vip`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表-权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_privileges_2`
--

DROP TABLE IF EXISTS `user_privileges_2`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_privileges_2` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户昵称',
  `account_type` varchar(10) NOT NULL DEFAULT 'S' COMMENT '账户类型（公共用户P、私人用户S，管理员A）',
  `level` varchar(20) NOT NULL DEFAULT '',
  `vip` int(11) NOT NULL DEFAULT '0' COMMENT 'VIP级别',
  `industry_limit` int(11) NOT NULL DEFAULT '1' COMMENT '行业数量限制',
  `cats_limit` int(11) NOT NULL DEFAULT '10' COMMENT '自定义类目数量限制',
  `shop_limit` int(11) NOT NULL DEFAULT '10' COMMENT '监控店铺数量限制',
  `item_limit` int(11) NOT NULL DEFAULT '10' COMMENT '监控商品数量限制',
  `ztc_limit` int(11) NOT NULL DEFAULT '-1' COMMENT '直通车监控数据量限制',
  `balance` float(10,2) NOT NULL DEFAULT '0.00' COMMENT '余额',
  `fee_start` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '付费生效开始时间',
  `fee_end` datetime NOT NULL DEFAULT '2013-12-31 23:59:59' COMMENT '过期时间',
  `expired_user` varchar(20) NOT NULL DEFAULT 'baojianpin' COMMENT '过期马甲(如果账户过期则使用此马甲)',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`),
  KEY `level` (`level`),
  KEY `vip` (`vip`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表-权限';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_shop_monitor`
--

DROP TABLE IF EXISTS `user_shop_monitor`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_shop_monitor` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '昵称',
  `shop_link` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺链接',
  `shop_name` varchar(100) DEFAULT NULL COMMENT '店铺名称',
  `user_num_id` varchar(30) DEFAULT NULL COMMENT '店铺用户ID',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  PRIMARY KEY (`user`,`shop_link`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户-店铺监控表';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_shop_monitor_items`
--

DROP TABLE IF EXISTS `user_shop_monitor_items`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_shop_monitor_items` (
  `user` varchar(20) NOT NULL DEFAULT '' COMMENT '用户名',
  `shop_type` varchar(5) NOT NULL DEFAULT '' COMMENT '店铺类型',
  `shop_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺ID',
  `user_num_id` varchar(30) NOT NULL DEFAULT '' COMMENT '店铺数字ID',
  `item_id` varchar(30) NOT NULL DEFAULT '' COMMENT '商品ID',
  `status` varchar(5) NOT NULL DEFAULT '1' COMMENT '商品状态1/0',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`,`shop_id`,`user_num_id`,`item_id`),
  KEY `user` (`user`),
  KEY `shop_id` (`shop_id`),
  KEY `user_num_id` (`user_num_id`),
  KEY `item_id` (`item_id`),
  KEY `population_tsmp` (`population_tsmp`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户店铺监控商品配置';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Table structure for table `user_topverify`
--

DROP TABLE IF EXISTS `user_topverify`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
/*!40101 SET character_set_client = utf8 */;
CREATE TABLE `user_topverify` (
  `user` varchar(50) NOT NULL DEFAULT '' COMMENT '用户',
  `nick` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺所有者昵称',
  `shop_cid` varchar(10) NOT NULL DEFAULT '' COMMENT '店铺cid字段',
  `shop_sid` varchar(50) NOT NULL DEFAULT '' COMMENT '店铺sid字段',
  `shop_title` varchar(150) NOT NULL DEFAULT '' COMMENT '店铺标题',
  `shop_rank` varchar(20) NOT NULL DEFAULT '' COMMENT '店铺等级',
  `shop_created` datetime NOT NULL DEFAULT '1900-01-01 00:00:00' COMMENT '店铺创建时间',
  `population_tsmp` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP COMMENT '更新时间戳',
  PRIMARY KEY (`user`),
  KEY `shop_rank` (`shop_rank`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='用户表-店铺验证';
/*!40101 SET character_set_client = @saved_cs_client */;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2013-04-11 10:33:45
