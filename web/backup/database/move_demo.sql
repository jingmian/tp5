/*
Navicat MySQL Data Transfer

Source Server         : 002本地服务器
Source Server Version : 50629
Source Host           : 192.168.5.88:3306
Source Database       : move_demo

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2017-06-19 13:15:24
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for move_admin
-- ----------------------------
DROP TABLE IF EXISTS `move_admin`;
CREATE TABLE `move_admin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(50) NOT NULL COMMENT '用户名',
  `password` varchar(50) NOT NULL COMMENT '密码',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `moble` varchar(255) NOT NULL COMMENT '手机',
  `admin_ip` varchar(255) NOT NULL COMMENT '允许ip',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `username` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 COMMENT='管理员表';

-- ----------------------------
-- Table structure for move_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `move_admin_log`;
CREATE TABLE `move_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL COMMENT '管理员ID',
  `type` varchar(255) NOT NULL COMMENT '日志类型',
  `remark` varchar(255) NOT NULL COMMENT '日志备注',
  `addip` varchar(255) NOT NULL COMMENT '操作IP',
  `addr` varchar(255) NOT NULL COMMENT '操作地址',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=707 DEFAULT CHARSET=utf8 COMMENT='管理日志表';

-- ----------------------------
-- Table structure for move_api
-- ----------------------------
DROP TABLE IF EXISTS `move_api`;
CREATE TABLE `move_api` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL COMMENT '用户id',
  `key` varchar(255) NOT NULL COMMENT '公钥',
  `secret_key` varchar(255) NOT NULL COMMENT '私钥',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='API管理表';

-- ----------------------------
-- Table structure for move_article
-- ----------------------------
DROP TABLE IF EXISTS `move_article`;
CREATE TABLE `move_article` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `type_id` int(11) unsigned NOT NULL COMMENT '类型',
  `value` text NOT NULL COMMENT '内容',
  `lang` varchar(50) NOT NULL COMMENT '语言',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `hot` int(11) unsigned NOT NULL COMMENT '热门',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `username` varchar(255) NOT NULL COMMENT '用户',
  `exts` text NOT NULL COMMENT '额外',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `type` (`type_id`),
  KEY `adminid` (`username`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='文章表';

-- ----------------------------
-- Table structure for move_article_type
-- ----------------------------
DROP TABLE IF EXISTS `move_article_type`;
CREATE TABLE `move_article_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `lang` varchar(50) NOT NULL COMMENT '语言',
  `type` int(11) unsigned NOT NULL COMMENT '类型',
  `mr` int(11) unsigned NOT NULL COMMENT '默认',
  `sy` int(11) unsigned NOT NULL COMMENT '首页',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='文章类型表';

-- ----------------------------
-- Table structure for move_auth_action
-- ----------------------------
DROP TABLE IF EXISTS `move_auth_action`;
CREATE TABLE `move_auth_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `adminid` int(11) unsigned NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '行为标识',
  `title` varchar(255) NOT NULL COMMENT '行为标题',
  `remark` varchar(255) NOT NULL COMMENT '行为备注',
  `module` varchar(255) NOT NULL COMMENT '模块',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=258 DEFAULT CHARSET=utf8 COMMENT='后台行为表';

-- ----------------------------
-- Table structure for move_auth_action_log
-- ----------------------------
DROP TABLE IF EXISTS `move_auth_action_log`;
CREATE TABLE `move_auth_action_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `adminid` int(11) unsigned NOT NULL COMMENT '用户',
  `name` varchar(255) NOT NULL COMMENT '行为标识',
  `ip` varchar(255) NOT NULL COMMENT '行为标题',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=147 DEFAULT CHARSET=utf8 COMMENT='行为日志表';

-- ----------------------------
-- Table structure for move_auth_group
-- ----------------------------
DROP TABLE IF EXISTS `move_auth_group`;
CREATE TABLE `move_auth_group` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `module` varchar(255) NOT NULL COMMENT '模块',
  `type` tinyint(4) unsigned NOT NULL COMMENT '组类型',
  `title` varchar(50) NOT NULL COMMENT '用户组中文名称',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `rules` text NOT NULL COMMENT '规则',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='授权组表';

-- ----------------------------
-- Table structure for move_auth_user
-- ----------------------------
DROP TABLE IF EXISTS `move_auth_user`;
CREATE TABLE `move_auth_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `uid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `group_id` int(11) unsigned NOT NULL COMMENT '组ID',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  UNIQUE KEY `uid_group_id` (`uid`,`group_id`),
  KEY `uid` (`uid`),
  KEY `group_id` (`group_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='授权关联表';

-- ----------------------------
-- Table structure for move_back_cny
-- ----------------------------
DROP TABLE IF EXISTS `move_back_cny`;
CREATE TABLE `move_back_cny` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) NOT NULL,
  `ckcoin` varchar(255) NOT NULL,
  `mum` decimal(20,0) unsigned NOT NULL,
  `content` text NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `fhcoin` varchar(10) NOT NULL,
  `ci` int(11) NOT NULL,
  `week` varchar(255) NOT NULL,
  `data_arr` varchar(255) NOT NULL,
  `jd` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='分红表';

-- ----------------------------
-- Table structure for move_back_cny_data
-- ----------------------------
DROP TABLE IF EXISTS `move_back_cny_data`;
CREATE TABLE `move_back_cny_data` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `type` varchar(255) NOT NULL,
  `userid` int(11) NOT NULL,
  `logid` int(11) NOT NULL,
  `backbili` decimal(20,4) NOT NULL,
  `status` tinyint(4) NOT NULL,
  `addtime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_back_cny_log
-- ----------------------------
DROP TABLE IF EXISTS `move_back_cny_log`;
CREATE TABLE `move_back_cny_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `data_id` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `ckcoin` varchar(255) NOT NULL,
  `fhcoin` varchar(255) NOT NULL,
  `mum` varchar(255) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `content` varchar(255) NOT NULL,
  `week` varchar(255) NOT NULL,
  `ci` int(11) NOT NULL COMMENT '总次数 ',
  `jd` int(11) NOT NULL COMMENT '+1',
  `sort` tinyint(3) NOT NULL,
  `bili` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `fenhong_id` (`data_id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8 COMMENT='分红记录';

-- ----------------------------
-- Table structure for move_bazaar
-- ----------------------------
DROP TABLE IF EXISTS `move_bazaar`;
CREATE TABLE `move_bazaar` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `market` varchar(255) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `deal` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `fee` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='集市交易表';

-- ----------------------------
-- Table structure for move_bazaar_conf
-- ----------------------------
DROP TABLE IF EXISTS `move_bazaar_conf`;
CREATE TABLE `move_bazaar_conf` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `price_min` decimal(20,8) unsigned NOT NULL COMMENT '最小交易价格',
  `price_max` decimal(20,8) unsigned NOT NULL COMMENT '最大交易价格',
  `num_mix` decimal(20,8) unsigned NOT NULL COMMENT '最小交易数量',
  `num_max` decimal(20,8) unsigned NOT NULL COMMENT '最大交易数量',
  `invit_coin` varchar(255) NOT NULL,
  `invit_1` decimal(20,8) unsigned NOT NULL COMMENT '一代赠送比例',
  `invit_2` decimal(20,8) unsigned NOT NULL COMMENT '二代赠送比例',
  `invit_3` decimal(20,8) unsigned NOT NULL COMMENT '三代赠送比例',
  `fee` varchar(255) NOT NULL,
  `default` tinyint(2) unsigned NOT NULL COMMENT '默认',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `coinname` (`name`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集市配置';

-- ----------------------------
-- Table structure for move_bazaar_invit
-- ----------------------------
DROP TABLE IF EXISTS `move_bazaar_invit`;
CREATE TABLE `move_bazaar_invit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `invit` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=302 DEFAULT CHARSET=utf8 COMMENT='集市推荐';

-- ----------------------------
-- Table structure for move_bazaar_log
-- ----------------------------
DROP TABLE IF EXISTS `move_bazaar_log`;
CREATE TABLE `move_bazaar_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `peerid` int(11) unsigned NOT NULL,
  `market` varchar(255) NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `fee_buy` decimal(20,8) unsigned NOT NULL,
  `fee_sell` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`),
  KEY `peerid` (`peerid`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='集市交易记录表';

-- ----------------------------
-- Table structure for move_bazaar_market
-- ----------------------------
DROP TABLE IF EXISTS `move_bazaar_market`;
CREATE TABLE `move_bazaar_market` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `price_min` decimal(20,8) unsigned NOT NULL COMMENT '最小交易价格',
  `price_max` decimal(20,8) unsigned NOT NULL COMMENT '最大交易价格',
  `num_min` decimal(20,8) unsigned NOT NULL COMMENT '最小交易数量',
  `num_max` decimal(20,8) unsigned NOT NULL COMMENT '最大交易数量',
  `mum_min` double(20,8) unsigned NOT NULL,
  `mum_max` double(20,8) unsigned NOT NULL,
  `invit_kai` int(11) unsigned NOT NULL,
  `invit_coin` varchar(255) NOT NULL,
  `invit_fee` decimal(20,2) unsigned NOT NULL COMMENT '一代赠送比例',
  `invit_1` decimal(20,2) unsigned NOT NULL COMMENT '一代赠送比例',
  `invit_2` decimal(20,2) unsigned NOT NULL COMMENT '二代赠送比例',
  `invit_3` decimal(20,2) unsigned NOT NULL COMMENT '三代赠送比例',
  `sinvit_kai` int(11) unsigned NOT NULL,
  `sinvit_coin` varchar(50) NOT NULL,
  `sinvit_fee` decimal(20,2) unsigned NOT NULL,
  `sinvit_1` decimal(20,2) unsigned NOT NULL,
  `sinvit_2` decimal(20,2) unsigned NOT NULL,
  `sinvit_3` decimal(20,2) unsigned NOT NULL,
  `fee_buy` decimal(20,2) unsigned NOT NULL COMMENT '手续费',
  `fee_sell` decimal(20,2) unsigned NOT NULL COMMENT '手续费',
  `default` tinyint(2) unsigned NOT NULL COMMENT '默认',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `coinname` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='集市配置';

-- ----------------------------
-- Table structure for move_bbs
-- ----------------------------
DROP TABLE IF EXISTS `move_bbs`;
CREATE TABLE `move_bbs` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` int(11) unsigned NOT NULL COMMENT '话题类型',
  `logo` varchar(255) NOT NULL COMMENT '话题图片',
  `title` varchar(255) NOT NULL COMMENT '话题标题',
  `num` int(11) unsigned NOT NULL COMMENT '讨论数',
  `zan` int(11) unsigned NOT NULL COMMENT '关注数',
  `content` varchar(255) NOT NULL COMMENT '话题说明',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_bbs_act
-- ----------------------------
DROP TABLE IF EXISTS `move_bbs_act`;
CREATE TABLE `move_bbs_act` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `pid` int(11) unsigned NOT NULL COMMENT '话题ID',
  `title` varchar(255) NOT NULL COMMENT '话题标题',
  `content` text NOT NULL COMMENT '内容',
  `zan` int(11) unsigned NOT NULL COMMENT '关注数',
  `num` int(11) unsigned NOT NULL COMMENT '讨论数',
  `view` int(11) unsigned NOT NULL COMMENT '浏览数',
  `type` int(11) unsigned NOT NULL COMMENT '文章类型',
  `jh` int(11) unsigned NOT NULL COMMENT '精华帖',
  `tj` int(11) unsigned NOT NULL COMMENT '推荐',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_bbs_disc
-- ----------------------------
DROP TABLE IF EXISTS `move_bbs_disc`;
CREATE TABLE `move_bbs_disc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int(11) unsigned NOT NULL COMMENT '文章ID',
  `qid` int(11) unsigned NOT NULL COMMENT '评论ID',
  `userid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `content` text NOT NULL COMMENT '内容',
  `zan` int(11) unsigned NOT NULL COMMENT '赞',
  `num` int(11) unsigned NOT NULL COMMENT '讨论数',
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_bbs_img
-- ----------------------------
DROP TABLE IF EXISTS `move_bbs_img`;
CREATE TABLE `move_bbs_img` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `img` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_bbs_type
-- ----------------------------
DROP TABLE IF EXISTS `move_bbs_type`;
CREATE TABLE `move_bbs_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_bbs_user
-- ----------------------------
DROP TABLE IF EXISTS `move_bbs_user`;
CREATE TABLE `move_bbs_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `img` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `qus` int(11) unsigned NOT NULL,
  `ans` int(11) unsigned NOT NULL,
  `zan` int(11) unsigned NOT NULL,
  `data` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_cen_btc
-- ----------------------------
DROP TABLE IF EXISTS `move_cen_btc`;
CREATE TABLE `move_cen_btc` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `pid` int(11) NOT NULL,
  `title` varchar(50) NOT NULL,
  `url` varchar(255) NOT NULL,
  `addtime` int(10) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `sort` int(11) NOT NULL COMMENT '排序',
  `user_id` int(11) NOT NULL,
  `img` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `hot` tinyint(1) NOT NULL,
  `endtime` int(10) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=460 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_cen_hangq
-- ----------------------------
DROP TABLE IF EXISTS `move_cen_hangq`;
CREATE TABLE `move_cen_hangq` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL COMMENT '英文名称',
  `title` varchar(50) NOT NULL COMMENT '中文标题',
  `img` varchar(255) NOT NULL COMMENT '币种图片',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `price` varchar(255) NOT NULL COMMENT '价格',
  `sf` varchar(50) NOT NULL COMMENT '核心算法',
  `sl` varchar(50) NOT NULL COMMENT '全网算力',
  `zl` varchar(255) NOT NULL COMMENT '流通数量',
  `gk` varchar(50) NOT NULL COMMENT '区块奖励',
  `fb` varchar(50) NOT NULL COMMENT '发布时间',
  `fs` varchar(50) NOT NULL COMMENT '挖矿方式',
  `gj` varchar(50) NOT NULL COMMENT '国家',
  `deg` varchar(255) NOT NULL COMMENT '24小时涨跌幅',
  `bz` varchar(255) NOT NULL COMMENT '不足',
  `ts` varchar(255) NOT NULL COMMENT '特色',
  `amount` varchar(255) NOT NULL DEFAULT '' COMMENT '成交量',
  `gw` varchar(255) NOT NULL COMMENT '官网',
  `amount_24` varchar(255) NOT NULL COMMENT '24小时成交量',
  `jj` text NOT NULL COMMENT '简介',
  `market` varchar(255) NOT NULL COMMENT '交易市场',
  `publishtime` varchar(20) NOT NULL COMMENT '币种发布时间',
  `qs` varchar(255) NOT NULL COMMENT '趋势',
  `bag` varchar(255) NOT NULL COMMENT '钱包地址',
  `qu` varchar(255) NOT NULL COMMENT '区块浏览',
  `pt` varchar(2500) NOT NULL COMMENT '交易平台',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_cen_hangq_type
-- ----------------------------
DROP TABLE IF EXISTS `move_cen_hangq_type`;
CREATE TABLE `move_cen_hangq_type` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(20) NOT NULL,
  `title` varchar(50) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `addtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_charge_card
-- ----------------------------
DROP TABLE IF EXISTS `move_charge_card`;
CREATE TABLE `move_charge_card` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cointype` varchar(255) NOT NULL,
  `cardnum` varchar(255) NOT NULL,
  `price` double(15,0) unsigned NOT NULL,
  `password` varchar(255) NOT NULL,
  `dnum` int(10) unsigned NOT NULL,
  `wnum` int(10) unsigned NOT NULL,
  `pnum` int(10) unsigned NOT NULL,
  `check` int(10) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=218 DEFAULT CHARSET=utf8 COMMENT='卡密充值';

-- ----------------------------
-- Table structure for move_charge_log
-- ----------------------------
DROP TABLE IF EXISTS `move_charge_log`;
CREATE TABLE `move_charge_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `cointype` varchar(255) NOT NULL,
  `cardnum` varchar(255) NOT NULL,
  `price` double(15,0) unsigned NOT NULL,
  `gettime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='卡密记录';

-- ----------------------------
-- Table structure for move_choujiang
-- ----------------------------
DROP TABLE IF EXISTS `move_choujiang`;
CREATE TABLE `move_choujiang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) NOT NULL,
  `value` float(255,2) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `gailv` float unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8 COMMENT='抽奖表';

-- ----------------------------
-- Table structure for move_choujiang_coinlist
-- ----------------------------
DROP TABLE IF EXISTS `move_choujiang_coinlist`;
CREATE TABLE `move_choujiang_coinlist` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `price` float(5,2) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='抽奖币种';

-- ----------------------------
-- Table structure for move_choujiang_log
-- ----------------------------
DROP TABLE IF EXISTS `move_choujiang_log`;
CREATE TABLE `move_choujiang_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `cjid` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=266 DEFAULT CHARSET=utf8 COMMENT='抽奖记录表';

-- ----------------------------
-- Table structure for move_choujiang_num
-- ----------------------------
DROP TABLE IF EXISTS `move_choujiang_num`;
CREATE TABLE `move_choujiang_num` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='抽奖数量';

-- ----------------------------
-- Table structure for move_coin
-- ----------------------------
DROP TABLE IF EXISTS `move_coin`;
CREATE TABLE `move_coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `wallet` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `round` varchar(255) NOT NULL,
  `sell_bili` varchar(255) NOT NULL,
  `sell_jin` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `dj_zj` varchar(255) NOT NULL,
  `dj_dk` varchar(255) NOT NULL,
  `dj_yh` varchar(255) NOT NULL,
  `dj_mm` varchar(255) NOT NULL,
  `dj_jm` varchar(255) NOT NULL,
  `zr_zs` varchar(255) NOT NULL,
  `zr_jz` varchar(255) NOT NULL,
  `zr_dz` varchar(255) NOT NULL,
  `zr_sm` varchar(255) NOT NULL,
  `zc_sm` varchar(255) NOT NULL,
  `zc_fee` varchar(255) NOT NULL,
  `zc_user` varchar(255) NOT NULL,
  `zc_min` varchar(255) NOT NULL,
  `zc_max` varchar(255) NOT NULL,
  `zc_jz` varchar(255) NOT NULL,
  `zc_zd` varchar(255) NOT NULL,
  `js_yw` varchar(255) NOT NULL,
  `js_sm` text NOT NULL,
  `js_qb` varchar(255) NOT NULL,
  `js_ym` varchar(255) NOT NULL,
  `js_gw` varchar(255) NOT NULL,
  `js_lt` varchar(255) NOT NULL,
  `js_wk` varchar(255) NOT NULL,
  `cs_yf` varchar(255) NOT NULL,
  `cs_sf` varchar(255) NOT NULL,
  `cs_fb` varchar(255) NOT NULL,
  `cs_qk` varchar(255) NOT NULL,
  `cs_zl` varchar(255) NOT NULL,
  `cs_cl` varchar(255) NOT NULL,
  `cs_zm` varchar(255) NOT NULL,
  `cs_nd` varchar(255) NOT NULL,
  `cs_jl` varchar(255) NOT NULL,
  `cs_ts` varchar(255) NOT NULL,
  `cs_bz` varchar(255) NOT NULL,
  `tp_zs` varchar(255) NOT NULL,
  `tp_js` varchar(255) NOT NULL,
  `tp_yy` varchar(255) NOT NULL,
  `tp_qj` varchar(255) NOT NULL,
  `finan_kaiqi` varchar(255) NOT NULL,
  `finan_zhang` varchar(255) NOT NULL,
  `finan_die` varchar(255) NOT NULL,
  `jk_zy` varchar(255) NOT NULL,
  `jk_bc` varchar(255) NOT NULL,
  `jk_zc` varchar(255) NOT NULL,
  `jk_dc` varchar(255) NOT NULL,
  `jk_js` varchar(255) NOT NULL,
  `jk_jy` varchar(255) NOT NULL,
  `jk_gz` varchar(255) NOT NULL,
  `jk_wz` varchar(255) NOT NULL,
  `tsb_addr` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='币种表';

-- ----------------------------
-- Table structure for move_coin_discu
-- ----------------------------
DROP TABLE IF EXISTS `move_coin_discu`;
CREATE TABLE `move_coin_discu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `cjz` int(11) unsigned NOT NULL,
  `tzy` int(11) unsigned NOT NULL,
  `xcd` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='币种讨论';

-- ----------------------------
-- Table structure for move_coin_in
-- ----------------------------
DROP TABLE IF EXISTS `move_coin_in`;
CREATE TABLE `move_coin_in` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL COMMENT '用户ID',
  `coinname` varchar(255) NOT NULL COMMENT '币种名称',
  `zhuanchu` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `txid` varchar(255) NOT NULL,
  `queren` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL COMMENT '转入类型',
  `num` decimal(20,8) unsigned NOT NULL COMMENT '转入数量',
  `mum` decimal(20,8) unsigned NOT NULL COMMENT '转入总额',
  `fee` decimal(20,8) unsigned NOT NULL COMMENT '转入赠送',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB AUTO_INCREMENT=37 DEFAULT CHARSET=utf8 COMMENT='转入表';

-- ----------------------------
-- Table structure for move_coin_link
-- ----------------------------
DROP TABLE IF EXISTS `move_coin_link`;
CREATE TABLE `move_coin_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` tinyint(4) unsigned NOT NULL COMMENT '类型',
  `value` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `exts` text NOT NULL COMMENT '额外',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='币种链接表';

-- ----------------------------
-- Table structure for move_coin_out
-- ----------------------------
DROP TABLE IF EXISTS `move_coin_out`;
CREATE TABLE `move_coin_out` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `txid` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='转出表';

-- ----------------------------
-- Table structure for move_crowd
-- ----------------------------
DROP TABLE IF EXISTS `move_crowd`;
CREATE TABLE `move_crowd` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `csa` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `price` int(11) unsigned NOT NULL,
  `num_min` int(11) unsigned NOT NULL,
  `num_max` int(11) unsigned NOT NULL,
  `tiqian` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `num` bigint(20) unsigned NOT NULL,
  `deal` int(11) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='众筹中心';

-- ----------------------------
-- Table structure for move_crowd_fee
-- ----------------------------
DROP TABLE IF EXISTS `move_crowd_fee`;
CREATE TABLE `move_crowd_fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `dsc` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `content` decimal(20,0) unsigned NOT NULL,
  `crowd_ma` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `price` decimal(20,0) unsigned NOT NULL,
  `csa` varchar(255) NOT NULL,
  `crowd_id` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=90 DEFAULT CHARSET=utf8 COMMENT='众筹费用';

-- ----------------------------
-- Table structure for move_crowd_log
-- ----------------------------
DROP TABLE IF EXISTS `move_crowd_log`;
CREATE TABLE `move_crowd_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `crowd_id` int(11) unsigned NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `fee` decimal(10,0) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `price` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `crowd_ma` varchar(255) NOT NULL,
  `tiqian` varchar(255) NOT NULL,
  `csa` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=171 DEFAULT CHARSET=utf8 COMMENT='收益记录';

-- ----------------------------
-- Table structure for move_daili
-- ----------------------------
DROP TABLE IF EXISTS `move_daili`;
CREATE TABLE `move_daili` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `cny` decimal(20,8) unsigned NOT NULL,
  `dsg` decimal(20,8) unsigned NOT NULL,
  `dsc` decimal(20,8) unsigned NOT NULL,
  `csa` decimal(20,8) unsigned NOT NULL,
  `ysc` decimal(20,8) unsigned NOT NULL,
  `rgc` decimal(20,8) unsigned NOT NULL,
  `tsc` decimal(20,8) unsigned NOT NULL,
  `usd` decimal(20,8) unsigned NOT NULL,
  `invit_kai` int(1) unsigned NOT NULL,
  `invit_coin` varchar(50) NOT NULL,
  `invit_1` decimal(20,8) unsigned NOT NULL,
  `invit_2` decimal(20,8) unsigned NOT NULL,
  `invit_3` decimal(20,8) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `invit_cz` decimal(20,8) NOT NULL,
  `invit_dl` decimal(20,8) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='代理管理表';

-- ----------------------------
-- Table structure for move_daili_invit
-- ----------------------------
DROP TABLE IF EXISTS `move_daili_invit`;
CREATE TABLE `move_daili_invit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `invit` int(11) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  `name` varchar(50) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `feecoin` varchar(50) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_daili_log
-- ----------------------------
DROP TABLE IF EXISTS `move_daili_log`;
CREATE TABLE `move_daili_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL COMMENT '充值用户',
  `dailiid` int(11) unsigned NOT NULL COMMENT '代理用户',
  `coinname` varchar(255) NOT NULL COMMENT '充值币种',
  `num` decimal(20,8) unsigned NOT NULL COMMENT '充值数量',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='代理记录表';

-- ----------------------------
-- Table structure for move_dingcan
-- ----------------------------
DROP TABLE IF EXISTS `move_dingcan`;
CREATE TABLE `move_dingcan` (
  `id` int(10) NOT NULL,
  `title` varchar(225) NOT NULL COMMENT '套餐标题',
  `content` varchar(225) NOT NULL COMMENT '套餐内容',
  `price` decimal(10,0) NOT NULL COMMENT '价格',
  `coin_data` int(11) NOT NULL COMMENT '支持币种',
  `num` decimal(25,0) NOT NULL COMMENT '余量',
  `yuyue` tinyint(3) NOT NULL COMMENT '是否需要预约',
  `addtime` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `endtime` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_dingcan_addr
-- ----------------------------
DROP TABLE IF EXISTS `move_dingcan_addr`;
CREATE TABLE `move_dingcan_addr` (
  `id` int(10) NOT NULL,
  `title` varchar(225) NOT NULL,
  `num` int(10) NOT NULL COMMENT '商家数',
  `sort` int(10) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `addtime` int(10) NOT NULL,
  `endtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_dingcan_img
-- ----------------------------
DROP TABLE IF EXISTS `move_dingcan_img`;
CREATE TABLE `move_dingcan_img` (
  `id` int(10) NOT NULL,
  `pid` int(10) NOT NULL COMMENT '商品ID',
  `img` varchar(225) NOT NULL,
  `tj` int(10) NOT NULL COMMENT '是否主图',
  `sort` int(10) NOT NULL,
  `status` tinyint(3) NOT NULL,
  `addtime` int(10) NOT NULL,
  `endtime` int(10) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_dingcan_log
-- ----------------------------
DROP TABLE IF EXISTS `move_dingcan_log`;
CREATE TABLE `move_dingcan_log` (
  `id` int(10) NOT NULL,
  `dc_id` int(10) NOT NULL COMMENT '商品号',
  `no` int(10) NOT NULL COMMENT '订单编号',
  `userid` int(10) NOT NULL COMMENT '用户ID',
  `sellerid` int(10) NOT NULL COMMENT '商家id',
  `price` decimal(22,4) NOT NULL,
  `num` decimal(22,4) NOT NULL COMMENT '付款数量',
  `coin` int(10) NOT NULL COMMENT '付款币种',
  `time` int(10) NOT NULL,
  `ren` int(10) NOT NULL COMMENT '用餐人数',
  `addtime` int(10) NOT NULL,
  `endtimr` int(10) NOT NULL,
  `sort` int(10) NOT NULL,
  `status` tinyint(3) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_dingcan_seller
-- ----------------------------
DROP TABLE IF EXISTS `move_dingcan_seller`;
CREATE TABLE `move_dingcan_seller` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `title` varchar(225) NOT NULL COMMENT '店名',
  `userid` int(10) NOT NULL COMMENT '店主',
  `zhizhao` tinyint(3) NOT NULL COMMENT '是否有营业执照',
  `danbao` tinyint(3) NOT NULL COMMENT '是否有保证金',
  `addr_id` int(10) NOT NULL COMMENT '地址ID',
  `addr` varchar(225) NOT NULL COMMENT '详细地址',
  `img` varchar(225) NOT NULL COMMENT '商家图片',
  `tel` varchar(20) NOT NULL COMMENT '联系方式',
  `yuding` tinyint(3) NOT NULL,
  `num` int(10) NOT NULL COMMENT '消费次数',
  `wifi` tinyint(3) NOT NULL,
  `park` tinyint(3) NOT NULL,
  `kaitime` int(10) NOT NULL COMMENT '开始预定时间',
  `endtime` int(10) NOT NULL COMMENT '预定截止时间',
  `addtime` int(10) NOT NULL COMMENT '注册时间',
  `sort` int(10) NOT NULL,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_doc
-- ----------------------------
DROP TABLE IF EXISTS `move_doc`;
CREATE TABLE `move_doc` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `value` text NOT NULL COMMENT '内容',
  `lang` varchar(50) NOT NULL COMMENT '语言',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `hot` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `username` varchar(255) NOT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `exts` text NOT NULL COMMENT '额外',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_doc_type
-- ----------------------------
DROP TABLE IF EXISTS `move_doc_type`;
CREATE TABLE `move_doc_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `lang` varchar(50) NOT NULL COMMENT '语言',
  `type` int(11) unsigned NOT NULL COMMENT '类型',
  `mr` int(11) unsigned NOT NULL COMMENT '默认',
  `sy` int(11) unsigned NOT NULL COMMENT '首页',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_duihuan
-- ----------------------------
DROP TABLE IF EXISTS `move_duihuan`;
CREATE TABLE `move_duihuan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `strtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `limit` int(11) unsigned NOT NULL,
  `numid` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `coin1` varchar(255) NOT NULL,
  `coin2` varchar(255) NOT NULL,
  `coin3` varchar(255) NOT NULL,
  `coin4` varchar(255) NOT NULL,
  `num1` double unsigned NOT NULL,
  `num2` double unsigned NOT NULL,
  `num3` double unsigned NOT NULL,
  `num4` double unsigned NOT NULL,
  `content` text NOT NULL,
  `content_kai` int(11) unsigned NOT NULL,
  `status` int(11) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_duihuan_cointype
-- ----------------------------
DROP TABLE IF EXISTS `move_duihuan_cointype`;
CREATE TABLE `move_duihuan_cointype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `sellnum` int(11) unsigned NOT NULL,
  `buynum` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_duihuan_log
-- ----------------------------
DROP TABLE IF EXISTS `move_duihuan_log`;
CREATE TABLE `move_duihuan_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `coin1` varchar(255) NOT NULL,
  `coin2` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `num` float(11,6) unsigned NOT NULL,
  `dhid` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `coin3` varchar(255) NOT NULL,
  `coin4` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=30 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_duobao
-- ----------------------------
DROP TABLE IF EXISTS `move_duobao`;
CREATE TABLE `move_duobao` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `getnum` int(11) unsigned NOT NULL,
  `neednum` int(11) unsigned NOT NULL,
  `mum` int(11) unsigned NOT NULL,
  `img` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `limit` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `caihao` int(11) unsigned NOT NULL,
  `jianghao` int(11) unsigned NOT NULL,
  `logid` int(11) unsigned NOT NULL,
  `kaitime` int(11) unsigned NOT NULL,
  `timesum` int(11) unsigned NOT NULL,
  `changenum` int(11) unsigned NOT NULL,
  `coindata` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_duobao_coinpay
-- ----------------------------
DROP TABLE IF EXISTS `move_duobao_coinpay`;
CREATE TABLE `move_duobao_coinpay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `dbid` int(11) unsigned NOT NULL,
  `coinpay` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `bili` double(8,4) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='付款币种';

-- ----------------------------
-- Table structure for move_duobao_img
-- ----------------------------
DROP TABLE IF EXISTS `move_duobao_img`;
CREATE TABLE `move_duobao_img` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `dbid` int(11) unsigned NOT NULL,
  `img` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=19 DEFAULT CHARSET=utf8 COMMENT='商品图片';

-- ----------------------------
-- Table structure for move_duobao_log
-- ----------------------------
DROP TABLE IF EXISTS `move_duobao_log`;
CREATE TABLE `move_duobao_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `dbid` int(11) unsigned NOT NULL,
  `hao` text NOT NULL,
  `name` varchar(255) NOT NULL,
  `coinpay` varchar(255) NOT NULL,
  `fee` double unsigned NOT NULL,
  `jianghao` int(11) unsigned NOT NULL,
  `kaitime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `back` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=64 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_duobao_old
-- ----------------------------
DROP TABLE IF EXISTS `move_duobao_old`;
CREATE TABLE `move_duobao_old` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `getnum` int(11) unsigned NOT NULL,
  `neednum` int(11) unsigned NOT NULL,
  `mum` int(11) unsigned NOT NULL,
  `img` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `limit` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `caihao` int(11) unsigned NOT NULL,
  `jianghao` int(11) unsigned NOT NULL,
  `logid` int(11) unsigned NOT NULL,
  `kaitime` int(11) unsigned NOT NULL,
  `timesum` int(11) unsigned NOT NULL,
  `changenum` int(11) unsigned NOT NULL,
  `coindata` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_duobao_type
-- ----------------------------
DROP TABLE IF EXISTS `move_duobao_type`;
CREATE TABLE `move_duobao_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `pid` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='商城分类表';

-- ----------------------------
-- Table structure for move_duobao_type_old
-- ----------------------------
DROP TABLE IF EXISTS `move_duobao_type_old`;
CREATE TABLE `move_duobao_type_old` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_egg
-- ----------------------------
DROP TABLE IF EXISTS `move_egg`;
CREATE TABLE `move_egg` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `buytime` int(11) unsigned NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `gettime` int(11) unsigned NOT NULL,
  `period` decimal(55,2) unsigned NOT NULL,
  `market_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `day` int(11) unsigned NOT NULL,
  `sell_price` decimal(10,0) unsigned NOT NULL,
  `sell_pricetype` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=153 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_egg_farm
-- ----------------------------
DROP TABLE IF EXISTS `move_egg_farm`;
CREATE TABLE `move_egg_farm` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `farm_id` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=451 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_egg_log
-- ----------------------------
DROP TABLE IF EXISTS `move_egg_log`;
CREATE TABLE `move_egg_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `type_id` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `price` decimal(10,0) unsigned NOT NULL,
  `price_type` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `mum` varchar(255) NOT NULL,
  `sort` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=125 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_egg_market
-- ----------------------------
DROP TABLE IF EXISTS `move_egg_market`;
CREATE TABLE `move_egg_market` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(255) NOT NULL,
  `buy_price` decimal(10,0) unsigned NOT NULL,
  `buy_pricetype` varchar(255) NOT NULL,
  `num_max` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `period` decimal(55,2) unsigned NOT NULL,
  `sell_price` decimal(10,0) unsigned NOT NULL,
  `sell_pricetype` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `num_min` int(11) unsigned NOT NULL,
  `day` int(11) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_egg_user
-- ----------------------------
DROP TABLE IF EXISTS `move_egg_user`;
CREATE TABLE `move_egg_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `chicken` varchar(255) NOT NULL,
  `egg` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_factory
-- ----------------------------
DROP TABLE IF EXISTS `move_factory`;
CREATE TABLE `move_factory` (
  `id` int(11) unsigned NOT NULL COMMENT '自增id',
  `factroyName` varchar(40) NOT NULL,
  `toolName` varchar(40) NOT NULL,
  `foodName` varchar(40) NOT NULL,
  `productName` varchar(40) NOT NULL,
  `productPrice` double(20,4) unsigned NOT NULL,
  `productPayCoin` varchar(20) NOT NULL,
  `productSpeed` double(20,4) unsigned NOT NULL COMMENT '每天生产的量(个)',
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_factory_buylog
-- ----------------------------
DROP TABLE IF EXISTS `move_factory_buylog`;
CREATE TABLE `move_factory_buylog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goodsName` varchar(40) NOT NULL COMMENT '购买的商品名',
  `userid` int(11) unsigned NOT NULL COMMENT '购买者ID',
  `num` double(20,0) unsigned NOT NULL,
  `price` double(40,4) unsigned NOT NULL COMMENT '购买时单价',
  `coin` varchar(11) NOT NULL,
  `addtime` int(11) unsigned NOT NULL COMMENT '购买时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_factory_feedlog
-- ----------------------------
DROP TABLE IF EXISTS `move_factory_feedlog`;
CREATE TABLE `move_factory_feedlog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `toolName` varchar(40) NOT NULL,
  `toolId` int(11) unsigned NOT NULL COMMENT '工厂财产表中的id',
  `foodName` varchar(40) NOT NULL,
  `foodNum` double(20,4) unsigned NOT NULL COMMENT '本次喂食消耗的食物数量',
  `addtime` int(11) unsigned NOT NULL COMMENT '喂食时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_factory_getproduct
-- ----------------------------
DROP TABLE IF EXISTS `move_factory_getproduct`;
CREATE TABLE `move_factory_getproduct` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `productName` varchar(40) NOT NULL COMMENT '产品名',
  `num` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_factory_goods
-- ----------------------------
DROP TABLE IF EXISTS `move_factory_goods`;
CREATE TABLE `move_factory_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `goodsName` varchar(40) NOT NULL,
  `leftNum` int(11) unsigned NOT NULL COMMENT '库存',
  `type` int(2) unsigned NOT NULL COMMENT '1工具,2消耗品',
  `price` double(20,4) unsigned NOT NULL,
  `coin` varchar(11) NOT NULL,
  `lifeLength` double(11,0) unsigned NOT NULL COMMENT '寿命(天)',
  `food` varchar(40) NOT NULL COMMENT '食物',
  `feedCycle` double(11,2) unsigned NOT NULL,
  `feedNum` double(11,2) unsigned NOT NULL,
  `productName` varchar(40) NOT NULL,
  `productNum` int(11) unsigned NOT NULL COMMENT '每个喂食周期的产量',
  `productPrice` double(20,2) unsigned NOT NULL COMMENT '产品单价',
  `addtime` int(11) unsigned NOT NULL,
  `addUserid` int(11) unsigned NOT NULL,
  `modifyTime` int(11) unsigned NOT NULL,
  `modifyUserid` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_factory_proterty
-- ----------------------------
DROP TABLE IF EXISTS `move_factory_proterty`;
CREATE TABLE `move_factory_proterty` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL COMMENT '物品所属用户的id',
  `protertyName` varchar(40) NOT NULL COMMENT '物品名',
  `type` int(2) unsigned NOT NULL COMMENT '1工具,2消耗品,3产品',
  `num` double(20,2) unsigned NOT NULL COMMENT '物品个数',
  `life` double(20,2) unsigned NOT NULL COMMENT '工具的剩余生命周期,-1表示无生命周期的物品',
  `addtime` int(11) unsigned NOT NULL,
  `lastFeedTime` int(11) unsigned NOT NULL COMMENT '上次喂食时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=72 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_fenhong
-- ----------------------------
DROP TABLE IF EXISTS `move_fenhong`;
CREATE TABLE `move_fenhong` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `coinjian` varchar(255) NOT NULL,
  `num` decimal(20,0) unsigned NOT NULL,
  `content` text NOT NULL,
  `yonghu` varchar(255) NOT NULL,
  `chiyou` varchar(255) NOT NULL,
  `dange` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='分红表';

-- ----------------------------
-- Table structure for move_fenhong_log
-- ----------------------------
DROP TABLE IF EXISTS `move_fenhong_log`;
CREATE TABLE `move_fenhong_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `fenhong_id` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `coinjian` varchar(255) NOT NULL,
  `fenzong` varchar(255) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `fenhong_id` (`fenhong_id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 COMMENT='分红记录';

-- ----------------------------
-- Table structure for move_fenhong_tsb
-- ----------------------------
DROP TABLE IF EXISTS `move_fenhong_tsb`;
CREATE TABLE `move_fenhong_tsb` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) NOT NULL,
  `ckcoin` varchar(255) NOT NULL,
  `bili` varchar(255) NOT NULL,
  `mum` decimal(20,0) unsigned NOT NULL,
  `content` text NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL COMMENT '上次分红时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `fhcoin` varchar(10) NOT NULL,
  `ci` int(11) NOT NULL,
  `week` varchar(255) NOT NULL,
  `jd` int(11) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='分红表';

-- ----------------------------
-- Table structure for move_fenhong_tsb_bili
-- ----------------------------
DROP TABLE IF EXISTS `move_fenhong_tsb_bili`;
CREATE TABLE `move_fenhong_tsb_bili` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `min` int(11) NOT NULL,
  `max` int(11) NOT NULL,
  `bili` decimal(20,4) NOT NULL,
  `pid` int(11) NOT NULL,
  `sort` tinyint(3) NOT NULL,
  `addtime` int(10) NOT NULL,
  `status` tinyint(3) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_fenhong_tsb_log
-- ----------------------------
DROP TABLE IF EXISTS `move_fenhong_tsb_log`;
CREATE TABLE `move_fenhong_tsb_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `fenhong_id` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `ckcoin` varchar(255) NOT NULL,
  `fhcoin` varchar(255) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL COMMENT '分红的数量',
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `content` varchar(255) NOT NULL,
  `ci` int(11) NOT NULL COMMENT '总次数 ',
  `jd` int(11) NOT NULL COMMENT '+1',
  `sort` tinyint(3) NOT NULL,
  `bili` decimal(20,0) NOT NULL,
  `mum` decimal(20,4) NOT NULL COMMENT '该次分红是用户持有量',
  PRIMARY KEY (`id`),
  KEY `fenhong_id` (`fenhong_id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=45 DEFAULT CHARSET=utf8 COMMENT='分红记录';

-- ----------------------------
-- Table structure for move_fenhong98
-- ----------------------------
DROP TABLE IF EXISTS `move_fenhong98`;
CREATE TABLE `move_fenhong98` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `poolid` int(11) NOT NULL,
  `gaincoin` varchar(20) NOT NULL COMMENT '奖励币种',
  `num` decimal(20,8) NOT NULL COMMENT '分红总量',
  `holdtime` double(20,8) NOT NULL COMMENT '分红币在分红池中持有的最短时间(天)',
  `content` text,
  `status` tinyint(2) NOT NULL COMMENT '1未开始 2已结束',
  `addtime` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `endtime` int(11) DEFAULT NULL COMMENT '发放时间',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_fenhong98_log
-- ----------------------------
DROP TABLE IF EXISTS `move_fenhong98_log`;
CREATE TABLE `move_fenhong98_log` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `fenhongid` int(11) NOT NULL,
  `poolid` int(11) NOT NULL COMMENT '分红池id',
  `addtime` int(11) DEFAULT NULL,
  `userid` int(11) NOT NULL,
  `coin` varchar(256) NOT NULL,
  `num` decimal(20,8) NOT NULL,
  `status` int(11) NOT NULL,
  `sort` int(2) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=5101 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_fenhong98_pool
-- ----------------------------
DROP TABLE IF EXISTS `move_fenhong98_pool`;
CREATE TABLE `move_fenhong98_pool` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `poolid` int(11) NOT NULL,
  `userid` int(11) NOT NULL,
  `coin` varchar(20) NOT NULL,
  `fee` double(20,8) NOT NULL,
  `status` tinyint(2) NOT NULL COMMENT '1已存入 2已取出',
  `addtime` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `num` decimal(20,8) NOT NULL COMMENT '存入分红池的币的数量',
  `endtime` int(11) DEFAULT '0' COMMENT '取出时间',
  `dealflag` int(11) DEFAULT '0' COMMENT '0 未处理  其他值,表示id为这个值的分红还没处理完',
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=1437 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_fenhong98_poolconfig
-- ----------------------------
DROP TABLE IF EXISTS `move_fenhong98_poolconfig`;
CREATE TABLE `move_fenhong98_poolconfig` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `coin` varchar(20) NOT NULL,
  `fee` double(20,8) NOT NULL,
  `status` tinyint(2) NOT NULL,
  `addtime` int(11) DEFAULT NULL,
  `sort` int(11) DEFAULT NULL,
  `min` decimal(20,8) DEFAULT NULL COMMENT '最小存入的币种',
  `name` varchar(256) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_finan
-- ----------------------------
DROP TABLE IF EXISTS `move_finan`;
CREATE TABLE `move_finan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL COMMENT '可用',
  `num_d` decimal(20,8) unsigned NOT NULL COMMENT '冻结',
  `fee` decimal(20,8) unsigned NOT NULL COMMENT '操作数量',
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nameid` int(11) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='财产明细表';

-- ----------------------------
-- Table structure for move_finan_eyuyan
-- ----------------------------
DROP TABLE IF EXISTS `move_finan_eyuyan`;
CREATE TABLE `move_finan_eyuyan` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL COMMENT '到账用户',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `num` decimal(20,2) unsigned NOT NULL COMMENT '金额',
  `tradeno` varchar(255) NOT NULL COMMENT '订单',
  `remark` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL COMMENT '时间',
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='财务收款宝表';

-- ----------------------------
-- Table structure for move_finan_out
-- ----------------------------
DROP TABLE IF EXISTS `move_finan_out`;
CREATE TABLE `move_finan_out` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `fee` decimal(20,2) unsigned NOT NULL COMMENT '手续费',
  `type` decimal(20,2) unsigned NOT NULL COMMENT '类型',
  `mum` decimal(20,2) unsigned NOT NULL COMMENT '到账金额',
  `truename` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `bankprov` varchar(255) NOT NULL,
  `bankcity` varchar(255) NOT NULL,
  `bankaddr` varchar(255) NOT NULL,
  `bankcard` varchar(255) NOT NULL,
  `out_coin` varchar(255) NOT NULL,
  `out_coin_fee` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=26 DEFAULT CHARSET=utf8 COMMENT='财务提现表';

-- ----------------------------
-- Table structure for move_finan_pay
-- ----------------------------
DROP TABLE IF EXISTS `move_finan_pay`;
CREATE TABLE `move_finan_pay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `num` decimal(20,2) unsigned NOT NULL,
  `fee` decimal(20,2) unsigned NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `mum` decimal(20,2) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `tradeno` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=651 DEFAULT CHARSET=utf8 COMMENT='财务充值表';

-- ----------------------------
-- Table structure for move_finan_type
-- ----------------------------
DROP TABLE IF EXISTS `move_finan_type`;
CREATE TABLE `move_finan_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `truename` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `shuoming` text NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `min` varchar(255) NOT NULL,
  `max` varchar(255) NOT NULL,
  `exts` text NOT NULL COMMENT '扩展',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=17 DEFAULT CHARSET=utf8 COMMENT='财务充值方式表';

-- ----------------------------
-- Table structure for move_finan_zd_cny
-- ----------------------------
DROP TABLE IF EXISTS `move_finan_zd_cny`;
CREATE TABLE `move_finan_zd_cny` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL COMMENT '可用',
  `num_d` decimal(20,8) unsigned NOT NULL COMMENT '冻结',
  `fee` decimal(20,8) unsigned NOT NULL COMMENT '操作数量',
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `nameid` int(11) unsigned NOT NULL,
  `remark` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_help
-- ----------------------------
DROP TABLE IF EXISTS `move_help`;
CREATE TABLE `move_help` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `contact` varchar(255) NOT NULL,
  `back` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_help_news
-- ----------------------------
DROP TABLE IF EXISTS `move_help_news`;
CREATE TABLE `move_help_news` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `content` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `newsid` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=763 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_help_newslog
-- ----------------------------
DROP TABLE IF EXISTS `move_help_newslog`;
CREATE TABLE `move_help_newslog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) NOT NULL,
  `content` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_help_type
-- ----------------------------
DROP TABLE IF EXISTS `move_help_type`;
CREATE TABLE `move_help_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_hold
-- ----------------------------
DROP TABLE IF EXISTS `move_hold`;
CREATE TABLE `move_hold` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `buycoin` varchar(255) NOT NULL,
  `num` bigint(20) unsigned NOT NULL,
  `deal` int(11) unsigned NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `limit` varchar(255) NOT NULL,
  `ci` varchar(255) NOT NULL,
  `jian` varchar(255) NOT NULL,
  `jiedong` varchar(255) NOT NULL,
  `min` varchar(255) NOT NULL,
  `max` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `invit_kai` varchar(255) NOT NULL,
  `invit_coin` varchar(255) NOT NULL,
  `invit_fee` varchar(255) NOT NULL,
  `invit_1` varchar(255) NOT NULL,
  `invit_2` varchar(255) NOT NULL,
  `invit_3` varchar(255) NOT NULL,
  `chi_coin` varchar(255) NOT NULL COMMENT '持有币种',
  `chi_num` varchar(255) NOT NULL COMMENT '持有数量',
  `ed_bili` varchar(255) NOT NULL COMMENT '额度计算比例',
  `ed_time` varchar(255) NOT NULL COMMENT '额度计算时间',
  `sort` int(11) unsigned NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `sndtime` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `buy_log_show` varchar(255) NOT NULL,
  `type` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '1普通认购, 2超募认购',
  `jiesuan` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '超募认购有效,  1认购已结算 2认购未结算',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8 COMMENT='持有认购表';

-- ----------------------------
-- Table structure for move_hold_invit
-- ----------------------------
DROP TABLE IF EXISTS `move_hold_invit`;
CREATE TABLE `move_hold_invit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `invit` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `invitname` varchar(255) NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='持有认购赠送表';

-- ----------------------------
-- Table structure for move_hold_log
-- ----------------------------
DROP TABLE IF EXISTS `move_hold_log`;
CREATE TABLE `move_hold_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `holdid` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `buycoin` varchar(255) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `ci` int(11) unsigned NOT NULL,
  `jian` varchar(255) NOT NULL,
  `jiedong` varchar(255) NOT NULL,
  `jd` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `type` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '1限量认购  2超募认购',
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5052 DEFAULT CHARSET=utf8 COMMENT='持有认购记录表';

-- ----------------------------
-- Table structure for move_hongbao
-- ----------------------------
DROP TABLE IF EXISTS `move_hongbao`;
CREATE TABLE `move_hongbao` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `money` double(11,7) unsigned NOT NULL,
  `money_type` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `userid` varchar(255) NOT NULL,
  `hongbao` text NOT NULL,
  `get` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `endtime` datetime NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=60 DEFAULT CHARSET=utf8 COMMENT='红包管理';

-- ----------------------------
-- Table structure for move_hongbao_log
-- ----------------------------
DROP TABLE IF EXISTS `move_hongbao_log`;
CREATE TABLE `move_hongbao_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `hbid` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `money` float(11,7) unsigned NOT NULL,
  `money_type` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=190 DEFAULT CHARSET=utf8 COMMENT='红包记录';

-- ----------------------------
-- Table structure for move_hongbao_type
-- ----------------------------
DROP TABLE IF EXISTS `move_hongbao_type`;
CREATE TABLE `move_hongbao_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `money_type` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 COMMENT='红包类型';

-- ----------------------------
-- Table structure for move_hongli
-- ----------------------------
DROP TABLE IF EXISTS `move_hongli`;
CREATE TABLE `move_hongli` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `qi` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `min` int(11) unsigned NOT NULL,
  `limit` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `num` bigint(20) unsigned NOT NULL DEFAULT '0',
  `deal` int(11) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `fee` decimal(20,4) unsigned NOT NULL,
  `invit_kai` varchar(255) NOT NULL,
  `invit_coin` varchar(255) NOT NULL,
  `invit_1` varchar(255) NOT NULL,
  `invit_2` varchar(255) NOT NULL,
  `invit_3` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `tiqian` double(6,2) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='理财表';

-- ----------------------------
-- Table structure for move_hongli_fee
-- ----------------------------
DROP TABLE IF EXISTS `move_hongli_fee`;
CREATE TABLE `move_hongli_fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `hongli_log_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `fee` decimal(20,4) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `lixi` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `type` tinyint(4) unsigned zerofill NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=86 DEFAULT CHARSET=utf8 COMMENT='理财明细';

-- ----------------------------
-- Table structure for move_hongli_log
-- ----------------------------
DROP TABLE IF EXISTS `move_hongli_log`;
CREATE TABLE `move_hongli_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `hongliid` int(11) unsigned NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `tiqian` int(11) unsigned NOT NULL,
  `fee` decimal(20,4) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `back` double(6,2) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=85 DEFAULT CHARSET=utf8 COMMENT='理财记录表';

-- ----------------------------
-- Table structure for move_hongli_type
-- ----------------------------
DROP TABLE IF EXISTS `move_hongli_type`;
CREATE TABLE `move_hongli_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `deal` double(11,8) unsigned NOT NULL,
  `lixi` double(11,8) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_huafei
-- ----------------------------
DROP TABLE IF EXISTS `move_huafei`;
CREATE TABLE `move_huafei` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `moble` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `type` varchar(50) NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='话费';

-- ----------------------------
-- Table structure for move_huafei_coin
-- ----------------------------
DROP TABLE IF EXISTS `move_huafei_coin`;
CREATE TABLE `move_huafei_coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `coinname` varchar(50) NOT NULL,
  `price` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=gbk COMMENT='话费记录';

-- ----------------------------
-- Table structure for move_huafei_cointype
-- ----------------------------
DROP TABLE IF EXISTS `move_huafei_cointype`;
CREATE TABLE `move_huafei_cointype` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `coinpay` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `bili` double(11,6) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=gbk COMMENT='话费记录';

-- ----------------------------
-- Table structure for move_huafei_log
-- ----------------------------
DROP TABLE IF EXISTS `move_huafei_log`;
CREATE TABLE `move_huafei_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `price` double(5,2) unsigned NOT NULL,
  `cointype` varchar(255) NOT NULL,
  `fee` double unsigned NOT NULL,
  `moble` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=gbk COMMENT='话费类型';

-- ----------------------------
-- Table structure for move_huafei_peizhi
-- ----------------------------
DROP TABLE IF EXISTS `move_huafei_peizhi`;
CREATE TABLE `move_huafei_peizhi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `appkey` varchar(255) NOT NULL,
  `openid` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_huafei_type
-- ----------------------------
DROP TABLE IF EXISTS `move_huafei_type`;
CREATE TABLE `move_huafei_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` int(11) unsigned NOT NULL,
  `price` float(5,2) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=gbk COMMENT='话费类型';

-- ----------------------------
-- Table structure for move_hyissue
-- ----------------------------
DROP TABLE IF EXISTS `move_hyissue`;
CREATE TABLE `move_hyissue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `buycoin` varchar(255) NOT NULL,
  `num` bigint(20) unsigned NOT NULL,
  `deal` int(11) unsigned NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `limit` varchar(255) NOT NULL,
  `ci` varchar(255) NOT NULL,
  `jian` varchar(255) NOT NULL,
  `jiedong` varchar(255) NOT NULL,
  `min` varchar(255) NOT NULL,
  `max` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `invit_kai` varchar(255) NOT NULL,
  `invit_coin` varchar(255) NOT NULL,
  `invit_fee` varchar(255) NOT NULL,
  `invit_1` varchar(255) NOT NULL,
  `invit_2` varchar(255) NOT NULL,
  `invit_3` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `sndtime` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `buy_log_show` varchar(255) NOT NULL,
  `up` decimal(20,8) unsigned NOT NULL,
  `up_bz` int(11) unsigned NOT NULL,
  `max_price` decimal(20,8) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8 COMMENT='认购表';

-- ----------------------------
-- Table structure for move_hyissue_invit
-- ----------------------------
DROP TABLE IF EXISTS `move_hyissue_invit`;
CREATE TABLE `move_hyissue_invit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `invit` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `invitname` varchar(255) NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_hyissue_log
-- ----------------------------
DROP TABLE IF EXISTS `move_hyissue_log`;
CREATE TABLE `move_hyissue_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `issueid` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `buycoin` varchar(255) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `ci` int(11) unsigned NOT NULL,
  `jian` varchar(255) NOT NULL,
  `jiedong` varchar(255) NOT NULL,
  `jd` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=36 DEFAULT CHARSET=utf8 COMMENT='认购记录';

-- ----------------------------
-- Table structure for move_issue
-- ----------------------------
DROP TABLE IF EXISTS `move_issue`;
CREATE TABLE `move_issue` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `buycoin` varchar(255) NOT NULL,
  `num` bigint(20) unsigned NOT NULL,
  `deal` int(11) unsigned NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `limit` varchar(255) NOT NULL,
  `ci` varchar(255) NOT NULL,
  `jian` varchar(255) NOT NULL,
  `jiedong` varchar(255) NOT NULL,
  `min` varchar(255) NOT NULL,
  `max` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `invit_kai` varchar(255) NOT NULL,
  `invit_coin` varchar(255) NOT NULL,
  `invit_fee` varchar(255) NOT NULL,
  `invit_1` varchar(255) NOT NULL,
  `invit_2` varchar(255) NOT NULL,
  `invit_3` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `sndtime` int(11) unsigned NOT NULL,
  `buy_log_show` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB AUTO_INCREMENT=11 DEFAULT CHARSET=utf8 COMMENT='认购表';

-- ----------------------------
-- Table structure for move_issue_invit
-- ----------------------------
DROP TABLE IF EXISTS `move_issue_invit`;
CREATE TABLE `move_issue_invit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `invit` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `invitname` varchar(255) NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=27 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_issue_log
-- ----------------------------
DROP TABLE IF EXISTS `move_issue_log`;
CREATE TABLE `move_issue_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `issueid` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `buycoin` varchar(255) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `ci` int(11) unsigned NOT NULL,
  `jian` varchar(255) NOT NULL,
  `jiedong` varchar(255) NOT NULL,
  `jd` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=54 DEFAULT CHARSET=utf8 COMMENT='认购记录';

-- ----------------------------
-- Table structure for move_lend
-- ----------------------------
DROP TABLE IF EXISTS `move_lend`;
CREATE TABLE `move_lend` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `danbaoid` int(11) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `backtype` int(11) unsigned NOT NULL,
  `qi` int(11) unsigned NOT NULL,
  `back` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `shen` decimal(20,8) unsigned NOT NULL,
  `moble` int(16) unsigned NOT NULL,
  `nowqi` int(11) unsigned NOT NULL,
  `lixi` decimal(20,8) unsigned NOT NULL,
  `sendtime` int(20) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_lend_back
-- ----------------------------
DROP TABLE IF EXISTS `move_lend_back`;
CREATE TABLE `move_lend_back` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `lendid` int(11) unsigned NOT NULL,
  `backtime` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `should` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `qi` int(11) unsigned NOT NULL,
  `danbaofee` decimal(20,8) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=13 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_lend_danbao
-- ----------------------------
DROP TABLE IF EXISTS `move_lend_danbao`;
CREATE TABLE `move_lend_danbao` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_lend_fee
-- ----------------------------
DROP TABLE IF EXISTS `move_lend_fee`;
CREATE TABLE `move_lend_fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `lendid` int(11) unsigned NOT NULL,
  `qi` int(11) unsigned NOT NULL,
  `num` decimal(20,8) unsigned NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_lend_qi
-- ----------------------------
DROP TABLE IF EXISTS `move_lend_qi`;
CREATE TABLE `move_lend_qi` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `qi` int(11) unsigned NOT NULL,
  `lixi` decimal(20,8) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_lend_set
-- ----------------------------
DROP TABLE IF EXISTS `move_lend_set`;
CREATE TABLE `move_lend_set` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `min` int(11) unsigned NOT NULL,
  `max` int(11) unsigned NOT NULL,
  `danbao_fee` decimal(20,8) unsigned NOT NULL,
  `late_fee` decimal(20,8) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `backtime` int(11) unsigned NOT NULL,
  `limit` decimal(20,8) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_mine
-- ----------------------------
DROP TABLE IF EXISTS `move_mine`;
CREATE TABLE `move_mine` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `ore` int(11) unsigned NOT NULL,
  `worker` int(11) unsigned NOT NULL,
  `machine` int(11) unsigned NOT NULL,
  `auto_machine` int(11) unsigned NOT NULL,
  `strength` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=5 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_mine_log
-- ----------------------------
DROP TABLE IF EXISTS `move_mine_log`;
CREATE TABLE `move_mine_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `get` int(11) unsigned NOT NULL,
  `tolid` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=38 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_mine_market
-- ----------------------------
DROP TABLE IF EXISTS `move_mine_market`;
CREATE TABLE `move_mine_market` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(255) NOT NULL,
  `period` varchar(255) NOT NULL,
  `use` int(11) unsigned NOT NULL,
  `strength` int(11) unsigned NOT NULL,
  `pd` int(11) unsigned NOT NULL,
  `price` int(11) unsigned NOT NULL,
  `price_type` varchar(255) NOT NULL,
  `maxstrength` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_mine_rate
-- ----------------------------
DROP TABLE IF EXISTS `move_mine_rate`;
CREATE TABLE `move_mine_rate` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(255) NOT NULL,
  `rate` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_mine_supply
-- ----------------------------
DROP TABLE IF EXISTS `move_mine_supply`;
CREATE TABLE `move_mine_supply` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(255) NOT NULL,
  `strength` int(11) unsigned NOT NULL,
  `price` int(11) unsigned NOT NULL,
  `price_type` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_mine_supplylog
-- ----------------------------
DROP TABLE IF EXISTS `move_mine_supplylog`;
CREATE TABLE `move_mine_supplylog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `strength` int(11) unsigned NOT NULL,
  `price` int(11) unsigned NOT NULL,
  `price_type` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_mine_worker
-- ----------------------------
DROP TABLE IF EXISTS `move_mine_worker`;
CREATE TABLE `move_mine_worker` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `period` int(11) unsigned NOT NULL,
  `age` int(11) unsigned NOT NULL,
  `strength` int(11) unsigned NOT NULL,
  `maxage` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `maxstrength` int(11) unsigned NOT NULL,
  `lastendtime` int(11) unsigned NOT NULL,
  `pd` int(11) unsigned NOT NULL,
  `price` int(11) unsigned NOT NULL,
  `price_type` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_money
-- ----------------------------
DROP TABLE IF EXISTS `move_money`;
CREATE TABLE `move_money` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `bianhao` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `min` int(11) unsigned NOT NULL,
  `max` int(11) unsigned NOT NULL,
  `limit` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `num` bigint(20) unsigned NOT NULL DEFAULT '0',
  `tiqian` bigint(20) unsigned NOT NULL DEFAULT '0',
  `deal` int(11) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `fee` decimal(20,4) unsigned NOT NULL,
  `invit_kai` varchar(255) NOT NULL,
  `invit_coin` varchar(255) NOT NULL,
  `invit_fee` varchar(255) NOT NULL,
  `invit_1` varchar(255) NOT NULL,
  `invit_2` varchar(255) NOT NULL,
  `invit_3` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8 COMMENT='理财表';

-- ----------------------------
-- Table structure for move_money_fee
-- ----------------------------
DROP TABLE IF EXISTS `move_money_fee`;
CREATE TABLE `move_money_fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `money_log_id` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `fee` decimal(20,4) unsigned NOT NULL,
  `ci` int(11) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `lixi` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `type` tinyint(4) unsigned zerofill NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=1711 DEFAULT CHARSET=utf8 COMMENT='理财明细';

-- ----------------------------
-- Table structure for move_money_log
-- ----------------------------
DROP TABLE IF EXISTS `move_money_log`;
CREATE TABLE `move_money_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `feecoin` varchar(255) NOT NULL,
  `moneyid` int(11) unsigned NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `tiqian` int(11) unsigned NOT NULL,
  `fee` decimal(20,4) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `ci` int(11) unsigned NOT NULL,
  `tiana` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='理财记录表';

-- ----------------------------
-- Table structure for move_pool
-- ----------------------------
DROP TABLE IF EXISTS `move_pool`;
CREATE TABLE `move_pool` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `life` int(11) unsigned NOT NULL,
  `lastlife` int(11) unsigned NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `gettime` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `pd` double(11,4) unsigned NOT NULL,
  `pd_type` varchar(255) NOT NULL,
  `market_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `limit1` int(11) unsigned NOT NULL,
  `limit2` int(11) unsigned NOT NULL,
  `qita` double unsigned NOT NULL,
  `guoqi` double unsigned NOT NULL,
  `minguoqi` double unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=32 DEFAULT CHARSET=utf8 COMMENT='矿机管理';

-- ----------------------------
-- Table structure for move_pool_log
-- ----------------------------
DROP TABLE IF EXISTS `move_pool_log`;
CREATE TABLE `move_pool_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `workerid` int(11) unsigned NOT NULL,
  `gettime` int(11) unsigned NOT NULL,
  `pd` double(11,4) unsigned NOT NULL,
  `pd_type` varchar(255) NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=21 DEFAULT CHARSET=utf8 COMMENT='收益记录';

-- ----------------------------
-- Table structure for move_pool_market
-- ----------------------------
DROP TABLE IF EXISTS `move_pool_market`;
CREATE TABLE `move_pool_market` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `life` int(11) unsigned NOT NULL,
  `pd` double(11,4) unsigned NOT NULL,
  `pd_type` varchar(255) NOT NULL,
  `price` double(11,4) unsigned NOT NULL,
  `price_type` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `limit` int(11) unsigned NOT NULL,
  `limit1` int(11) unsigned NOT NULL,
  `limit2` int(11) unsigned NOT NULL,
  `qita` double unsigned NOT NULL,
  `guoqi` double unsigned NOT NULL,
  `minguoqi` double unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='矿机购买';

-- ----------------------------
-- Table structure for move_poolgbw
-- ----------------------------
DROP TABLE IF EXISTS `move_poolgbw`;
CREATE TABLE `move_poolgbw` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `life` int(11) unsigned NOT NULL,
  `lastlife` int(11) unsigned NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `gettime` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `pd` double(11,4) unsigned NOT NULL,
  `leftpd` double(11,4) unsigned NOT NULL COMMENT '剩余产能',
  `pd_type` varchar(255) NOT NULL,
  `market_id` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `limit1` int(11) unsigned NOT NULL,
  `limit2` int(11) unsigned NOT NULL,
  `qita` double unsigned NOT NULL,
  `guoqi` double unsigned NOT NULL,
  `minguoqi` double unsigned NOT NULL,
  `shoufei` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否收费',
  `startPrice` decimal(20,8) unsigned NOT NULL,
  `startPrice_type` varchar(255) NOT NULL,
  `reducepd` decimal(10,8) unsigned NOT NULL COMMENT '剩余产能每次减少的比例',
  `minpd` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '剩余产能的最低值',
  `shuilv` decimal(10,0) unsigned NOT NULL DEFAULT '0' COMMENT '收矿时的税率',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=44363 DEFAULT CHARSET=utf8 COMMENT='矿机管理';

-- ----------------------------
-- Table structure for move_poolgbw_log
-- ----------------------------
DROP TABLE IF EXISTS `move_poolgbw_log`;
CREATE TABLE `move_poolgbw_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `workerid` int(11) unsigned NOT NULL,
  `gettime` int(11) unsigned NOT NULL,
  `pd` double(11,4) unsigned NOT NULL,
  `pd_type` varchar(255) NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `pdshui` double(11,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '本次收益支付的税值',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=28 DEFAULT CHARSET=utf8 COMMENT='收益记录';

-- ----------------------------
-- Table structure for move_poolgbw_market
-- ----------------------------
DROP TABLE IF EXISTS `move_poolgbw_market`;
CREATE TABLE `move_poolgbw_market` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `life` int(11) unsigned NOT NULL,
  `pd` double(11,4) unsigned NOT NULL COMMENT '产能值',
  `minpd` double(11,4) unsigned NOT NULL DEFAULT '0.0000' COMMENT '最低产能',
  `reducepd` double(11,4) unsigned NOT NULL COMMENT '每次使用减少的产能比',
  `pd_type` varchar(255) NOT NULL,
  `price` double(11,4) unsigned NOT NULL,
  `price_type` varchar(255) NOT NULL,
  `shoufei` int(2) unsigned NOT NULL DEFAULT '1' COMMENT '是否收费',
  `startPrice` double(11,4) unsigned NOT NULL COMMENT '矿机开始工作的收费',
  `startPrice_type` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `limit` int(11) unsigned NOT NULL,
  `limit1` int(11) unsigned NOT NULL,
  `limit2` int(11) unsigned NOT NULL,
  `qita` double unsigned NOT NULL,
  `guoqi` double unsigned NOT NULL,
  `minguoqi` double unsigned NOT NULL,
  `shuilv` double(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '收矿时抽取税率',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='矿机购买';

-- ----------------------------
-- Table structure for move_poolgbw_shuoming
-- ----------------------------
DROP TABLE IF EXISTS `move_poolgbw_shuoming`;
CREATE TABLE `move_poolgbw_shuoming` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `step` varchar(2048) NOT NULL DEFAULT '暂无内容',
  `rule` varchar(2048) NOT NULL DEFAULT '暂无内容',
  `example` varchar(2048) NOT NULL DEFAULT '暂无内容',
  `alert` varchar(2048) NOT NULL DEFAULT '暂无数据' COMMENT '禁用提示',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_push_config
-- ----------------------------
DROP TABLE IF EXISTS `move_push_config`;
CREATE TABLE `move_push_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `coinid` int(11) unsigned NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `shouxufeibili` decimal(20,8) unsigned NOT NULL DEFAULT '0.00000000' COMMENT '手续费比例',
  `can_push` int(2) unsigned NOT NULL DEFAULT '0' COMMENT '是否支持push, 0不能push  1支持push',
  `addtime` int(11) unsigned DEFAULT NULL,
  `endtime` int(11) unsigned DEFAULT NULL,
  `sort` int(2) unsigned DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_push_log
-- ----------------------------
DROP TABLE IF EXISTS `move_push_log`;
CREATE TABLE `move_push_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `send_id` int(11) unsigned NOT NULL,
  `rev_id` int(11) unsigned NOT NULL,
  `buynum` int(11) unsigned NOT NULL,
  `goods_coin` varchar(255) NOT NULL,
  `pay_coin` varchar(255) NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `addtime` int(11) unsigned DEFAULT NULL COMMENT '发起时间',
  `shouxufeibili` decimal(20,8) unsigned DEFAULT NULL COMMENT '手续费比例',
  `sort` int(2) unsigned DEFAULT NULL,
  `endtime` int(11) unsigned DEFAULT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=39 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_qiandao
-- ----------------------------
DROP TABLE IF EXISTS `move_qiandao`;
CREATE TABLE `move_qiandao` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `day` int(11) unsigned NOT NULL,
  `total` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='签到记录';

-- ----------------------------
-- Table structure for move_qiandao_award
-- ----------------------------
DROP TABLE IF EXISTS `move_qiandao_award`;
CREATE TABLE `move_qiandao_award` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='签到奖励';

-- ----------------------------
-- Table structure for move_question
-- ----------------------------
DROP TABLE IF EXISTS `move_question`;
CREATE TABLE `move_question` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(10) unsigned NOT NULL,
  `view` int(10) unsigned NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `ans` int(50) unsigned NOT NULL,
  `content` varchar(100) NOT NULL,
  `title` varchar(50) NOT NULL,
  `type` int(1) unsigned NOT NULL,
  `username` varchar(11) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=33 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_question_ans
-- ----------------------------
DROP TABLE IF EXISTS `move_question_ans`;
CREATE TABLE `move_question_ans` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `content` varchar(100) NOT NULL,
  `addtime` int(20) unsigned NOT NULL,
  `endtime` int(20) unsigned NOT NULL,
  `qusid` int(1) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `ansid` int(11) unsigned NOT NULL,
  `zan` int(11) unsigned NOT NULL,
  `cai` int(11) unsigned NOT NULL,
  `username` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=78 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_question_type
-- ----------------------------
DROP TABLE IF EXISTS `move_question_type`;
CREATE TABLE `move_question_type` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(20) NOT NULL,
  `addtime` int(10) unsigned NOT NULL,
  `endtime` int(10) unsigned NOT NULL,
  `sort` int(1) unsigned NOT NULL,
  `userid` int(10) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_raise
-- ----------------------------
DROP TABLE IF EXISTS `move_raise`;
CREATE TABLE `move_raise` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `icon` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `total` decimal(20,2) unsigned NOT NULL COMMENT '总数',
  `share` decimal(20,2) unsigned NOT NULL COMMENT '众筹份数。如一份=1万，众筹1.25亿=12500份',
  `pay_type` varchar(255) NOT NULL,
  `price` decimal(20,2) unsigned NOT NULL COMMENT '众筹份数单价，如0.1元一份',
  `begin_time` int(11) unsigned NOT NULL,
  `end_time` int(11) unsigned NOT NULL,
  `rule_content` text NOT NULL COMMENT '规则描述,富文本',
  `introduce` text NOT NULL COMMENT '介绍，富文本',
  `is_delete` tinyint(1) unsigned NOT NULL COMMENT '逻辑删除0未删 1删除',
  `save_time` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `money_thaw` int(11) unsigned NOT NULL,
  `max_shop` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=40 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_raise_money
-- ----------------------------
DROP TABLE IF EXISTS `move_raise_money`;
CREATE TABLE `move_raise_money` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `raise_id` int(11) unsigned NOT NULL,
  `user_id` int(11) unsigned NOT NULL,
  `money` decimal(20,2) unsigned NOT NULL COMMENT '打钱数',
  `money_type` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `user_id` (`user_id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_raise_order
-- ----------------------------
DROP TABLE IF EXISTS `move_raise_order`;
CREATE TABLE `move_raise_order` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) unsigned NOT NULL,
  `raise_id` int(11) unsigned NOT NULL,
  `buy_share` decimal(20,2) unsigned NOT NULL COMMENT '购买份数',
  `spend_money` decimal(20,8) unsigned NOT NULL COMMENT '花费金额',
  `add_time` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=253 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_reword
-- ----------------------------
DROP TABLE IF EXISTS `move_reword`;
CREATE TABLE `move_reword` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `vuserid` int(11) unsigned NOT NULL,
  `title` varchar(50) NOT NULL,
  `content` text NOT NULL,
  `price` decimal(20,8) unsigned NOT NULL,
  `coin` tinyint(3) unsigned NOT NULL,
  `type` tinyint(3) unsigned NOT NULL,
  `limit` varchar(50) NOT NULL,
  `joins` int(11) unsigned NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `tuoguan` decimal(20,8) unsigned NOT NULL,
  `step` int(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=15 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_reword_log
-- ----------------------------
DROP TABLE IF EXISTS `move_reword_log`;
CREATE TABLE `move_reword_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `pid` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `getprice` decimal(20,8) unsigned NOT NULL,
  `coin` int(3) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `sort` int(3) unsigned NOT NULL,
  `author` varchar(30) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_reword_type
-- ----------------------------
DROP TABLE IF EXISTS `move_reword_type`;
CREATE TABLE `move_reword_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(50) NOT NULL,
  `pid` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `sort` int(3) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_sale
-- ----------------------------
DROP TABLE IF EXISTS `move_sale`;
CREATE TABLE `move_sale` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `minprice` decimal(20,2) unsigned NOT NULL DEFAULT '0.00',
  `content` text NOT NULL,
  `hot` int(11) unsigned NOT NULL,
  `invit_kai` varchar(255) NOT NULL,
  `invit_coin` varchar(255) NOT NULL,
  `invit_fee` varchar(255) NOT NULL,
  `invit_1` varchar(255) NOT NULL,
  `invit_2` varchar(255) NOT NULL,
  `invit_3` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `coin` varchar(255) NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `fudu` double(20,2) unsigned NOT NULL DEFAULT '0.00',
  `price` decimal(10,0) unsigned NOT NULL DEFAULT '0',
  `tj` int(11) unsigned NOT NULL,
  `danbao` double(10,2) unsigned NOT NULL DEFAULT '0.00',
  `baochou` double(10,4) unsigned NOT NULL DEFAULT '0.0000',
  `time` int(11) unsigned NOT NULL,
  `keepprice` double(8,2) unsigned NOT NULL DEFAULT '0.00',
  `type2` int(11) unsigned NOT NULL,
  `type3` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `back_kai` tinyint(3) NOT NULL,
  `backtime` varchar(255) NOT NULL,
  `backbili` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=31 DEFAULT CHARSET=utf8 COMMENT='商城商品表';

-- ----------------------------
-- Table structure for move_sale_danbaolog
-- ----------------------------
DROP TABLE IF EXISTS `move_sale_danbaolog`;
CREATE TABLE `move_sale_danbaolog` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `saleid` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `danbao` double(10,2) unsigned NOT NULL DEFAULT '0.00',
  `coin` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 COMMENT='商品记录表';

-- ----------------------------
-- Table structure for move_sale_img
-- ----------------------------
DROP TABLE IF EXISTS `move_sale_img`;
CREATE TABLE `move_sale_img` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `saleid` int(11) unsigned NOT NULL,
  `img` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=20 DEFAULT CHARSET=utf8 COMMENT='商品图片';

-- ----------------------------
-- Table structure for move_sale_log
-- ----------------------------
DROP TABLE IF EXISTS `move_sale_log`;
CREATE TABLE `move_sale_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `saleid` varchar(255) NOT NULL,
  `price` decimal(20,2) unsigned NOT NULL DEFAULT '0.00',
  `saletitle` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `addr` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `back` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='商城记录表';

-- ----------------------------
-- Table structure for move_sale_type
-- ----------------------------
DROP TABLE IF EXISTS `move_sale_type`;
CREATE TABLE `move_sale_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `type2` int(11) unsigned NOT NULL,
  `type3` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `pid` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=25 DEFAULT CHARSET=utf8 COMMENT='商城分类表';

-- ----------------------------
-- Table structure for move_shop
-- ----------------------------
DROP TABLE IF EXISTS `move_shop`;
CREATE TABLE `move_shop` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `price` decimal(20,2) unsigned NOT NULL DEFAULT '0.00',
  `price_coin` varchar(255) NOT NULL,
  `market_price` decimal(20,2) unsigned NOT NULL COMMENT '市场价',
  `num` decimal(20,0) unsigned NOT NULL DEFAULT '0',
  `deal` decimal(20,0) unsigned NOT NULL DEFAULT '0',
  `content` text NOT NULL,
  `tj` int(11) unsigned NOT NULL,
  `hot` int(11) unsigned NOT NULL,
  `invit_kai` varchar(255) NOT NULL,
  `invit_coin` varchar(255) NOT NULL,
  `invit_fee` varchar(255) NOT NULL,
  `invit_1` varchar(255) NOT NULL,
  `invit_2` varchar(255) NOT NULL,
  `invit_3` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `coindata` varchar(255) NOT NULL,
  `type1` int(11) unsigned NOT NULL,
  `type2` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `back_kai` tinyint(4) NOT NULL,
  `backtime` varchar(255) NOT NULL,
  `backbili` decimal(20,4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`),
  KEY `deal` (`deal`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='商城商品表';

-- ----------------------------
-- Table structure for move_shop_banner
-- ----------------------------
DROP TABLE IF EXISTS `move_shop_banner`;
CREATE TABLE `move_shop_banner` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `img` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `href` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='商城图片表';

-- ----------------------------
-- Table structure for move_shop_coinpay
-- ----------------------------
DROP TABLE IF EXISTS `move_shop_coinpay`;
CREATE TABLE `move_shop_coinpay` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `bili` double(11,4) unsigned NOT NULL,
  `coinpay` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `title` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8 COMMENT='付款币种';

-- ----------------------------
-- Table structure for move_shop_img
-- ----------------------------
DROP TABLE IF EXISTS `move_shop_img`;
CREATE TABLE `move_shop_img` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `shopid` int(11) unsigned NOT NULL,
  `img` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=24 DEFAULT CHARSET=utf8 COMMENT='商品图片';

-- ----------------------------
-- Table structure for move_shop_log
-- ----------------------------
DROP TABLE IF EXISTS `move_shop_log`;
CREATE TABLE `move_shop_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `shopid` varchar(255) NOT NULL,
  `price` decimal(20,2) unsigned NOT NULL DEFAULT '0.00',
  `coinname` varchar(255) NOT NULL,
  `buycoin` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `mum` decimal(20,2) unsigned NOT NULL DEFAULT '0.00',
  `xuyao` decimal(20,8) unsigned NOT NULL COMMENT '价',
  `addr` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `kuaidi` varchar(255) NOT NULL,
  `status` int(11) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `back` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='商城记录表';

-- ----------------------------
-- Table structure for move_shop_type
-- ----------------------------
DROP TABLE IF EXISTS `move_shop_type`;
CREATE TABLE `move_shop_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `pid` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=50 DEFAULT CHARSET=utf8 COMMENT='商城分类表';

-- ----------------------------
-- Table structure for move_smoney
-- ----------------------------
DROP TABLE IF EXISTS `move_smoney`;
CREATE TABLE `move_smoney` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `num` bigint(20) unsigned NOT NULL,
  `deal` int(11) unsigned NOT NULL,
  `limit` varchar(255) NOT NULL,
  `ci` varchar(255) NOT NULL,
  `jian` varchar(255) NOT NULL,
  `min` varchar(255) NOT NULL,
  `max` varchar(255) NOT NULL,
  `content` text NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `strtime` int(11) unsigned NOT NULL,
  `sndtime` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `buy_log_show` varchar(255) NOT NULL,
  `fee` decimal(5,2) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `img` varchar(255) NOT NULL,
  `bili` decimal(20,8) unsigned NOT NULL,
  `invit_kai` int(1) unsigned NOT NULL,
  `invit1` decimal(20,8) unsigned NOT NULL,
  `invit2` decimal(20,8) unsigned NOT NULL,
  `invit3` decimal(20,8) unsigned NOT NULL,
  `invitday` int(11) unsigned NOT NULL,
  `coin_kai` int(11) unsigned NOT NULL,
  `invit_coin1` decimal(20,8) unsigned NOT NULL,
  `invit_coin2` decimal(20,8) unsigned NOT NULL,
  `invit_coin3` decimal(20,8) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 COMMENT='认购表';

-- ----------------------------
-- Table structure for move_smoney_fee
-- ----------------------------
DROP TABLE IF EXISTS `move_smoney_fee`;
CREATE TABLE `move_smoney_fee` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `smoneyid` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `invitday` int(11) unsigned NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=88 DEFAULT CHARSET=utf8 COMMENT='理财明细';

-- ----------------------------
-- Table structure for move_smoney_log
-- ----------------------------
DROP TABLE IF EXISTS `move_smoney_log`;
CREATE TABLE `move_smoney_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `smoneyid` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `ci` int(11) unsigned NOT NULL,
  `jian` varchar(255) NOT NULL,
  `jiedong` varchar(255) NOT NULL,
  `jd` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `tian` int(11) unsigned NOT NULL,
  `fee` decimal(20,8) unsigned NOT NULL,
  `get` decimal(20,8) unsigned NOT NULL,
  `coin` decimal(20,8) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='认购记录';

-- ----------------------------
-- Table structure for move_sweike
-- ----------------------------
DROP TABLE IF EXISTS `move_sweike`;
CREATE TABLE `move_sweike` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL COMMENT '参数',
  `price` decimal(20,8) unsigned NOT NULL COMMENT '额外',
  `step` varchar(255) NOT NULL,
  `view` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `adress` varchar(255) NOT NULL,
  `price_type` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `tj` int(11) unsigned NOT NULL,
  `fee` decimal(4,2) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `adminid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=110 DEFAULT CHARSET=utf8 COMMENT='威客管理';

-- ----------------------------
-- Table structure for move_sweike_tender
-- ----------------------------
DROP TABLE IF EXISTS `move_sweike_tender`;
CREATE TABLE `move_sweike_tender` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `weikeid` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `content` text NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `price` double(20,8) unsigned NOT NULL,
  `price_type` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=58 DEFAULT CHARSET=utf8 COMMENT='威客记录';

-- ----------------------------
-- Table structure for move_sweike_type
-- ----------------------------
DROP TABLE IF EXISTS `move_sweike_type`;
CREATE TABLE `move_sweike_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `pid` int(11) unsigned NOT NULL,
  `hot` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=116 DEFAULT CHARSET=utf8 COMMENT='威客类型';

-- ----------------------------
-- Table structure for move_sys_ad
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_ad`;
CREATE TABLE `move_sys_ad` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `data` text NOT NULL,
  `height` varchar(255) NOT NULL,
  `lang` varchar(50) NOT NULL COMMENT '语言',
  `url` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=42 DEFAULT CHARSET=utf8 COMMENT='系统幻灯片';

-- ----------------------------
-- Table structure for move_sys_config
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_config`;
CREATE TABLE `move_sys_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `type` tinyint(3) unsigned NOT NULL COMMENT '类型',
  `value` text NOT NULL COMMENT '参数',
  `exts` text NOT NULL COMMENT '额外',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=129 DEFAULT CHARSET=utf8 COMMENT='系统配置表';

-- ----------------------------
-- Table structure for move_sys_daohang
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_daohang`;
CREATE TABLE `move_sys_daohang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `value` text NOT NULL COMMENT '参数',
  `exts` text NOT NULL COMMENT '额外',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=gbk COMMENT='系统导航表';

-- ----------------------------
-- Table structure for move_sys_err
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_err`;
CREATE TABLE `move_sys_err` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `value` text NOT NULL,
  `sms` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='系统错误';

-- ----------------------------
-- Table structure for move_sys_lang
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_lang`;
CREATE TABLE `move_sys_lang` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `name` varchar(255) NOT NULL COMMENT '中文默认语言',
  `en` varchar(255) NOT NULL COMMENT '对应英文',
  `th` varchar(255) NOT NULL,
  `vn` varchar(255) NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=786 DEFAULT CHARSET=utf8 COMMENT='多语言支持';

-- ----------------------------
-- Table structure for move_sys_lang_type
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_lang_type`;
CREATE TABLE `move_sys_lang_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=utf8 COMMENT='多语言类型表';

-- ----------------------------
-- Table structure for move_sys_link
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_link`;
CREATE TABLE `move_sys_link` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `type` tinyint(4) unsigned NOT NULL COMMENT '类型',
  `value` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `exts` text NOT NULL COMMENT '额外',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 COMMENT='系统链接表';

-- ----------------------------
-- Table structure for move_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_menu`;
CREATE TABLE `move_sys_menu` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT COMMENT 'ID',
  `title` varchar(50) NOT NULL COMMENT '标题',
  `pid` int(10) unsigned NOT NULL COMMENT '上级分类ID',
  `sort` int(10) unsigned NOT NULL COMMENT '排序（同级有效）',
  `url` char(255) NOT NULL COMMENT '链接地址',
  `hide` tinyint(1) unsigned NOT NULL COMMENT '是否隐藏',
  `tip` varchar(255) NOT NULL COMMENT '提示',
  `group` varchar(50) DEFAULT NULL COMMENT '分组',
  `is_dev` tinyint(1) unsigned NOT NULL COMMENT '是否仅开发者模式可见',
  `ico_name` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `pid` (`pid`)
) ENGINE=InnoDB AUTO_INCREMENT=68013 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='授权菜单';

-- ----------------------------
-- Table structure for move_sys_sdk
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_sdk`;
CREATE TABLE `move_sys_sdk` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `key` varchar(255) NOT NULL,
  `secret` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `truename` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `code` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `value` varchar(255) NOT NULL,
  `min` varchar(255) NOT NULL,
  `max` varchar(255) NOT NULL,
  `exts` text NOT NULL COMMENT '扩展',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='第三方登录';

-- ----------------------------
-- Table structure for move_sys_seo
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_seo`;
CREATE TABLE `move_sys_seo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL COMMENT '页面路径',
  `title` varchar(255) NOT NULL COMMENT '页面标题',
  `value` text NOT NULL COMMENT '提示文字',
  `show` int(11) unsigned NOT NULL COMMENT '默认显示',
  `keywords` varchar(255) NOT NULL COMMENT '关键字',
  `description` varchar(255) NOT NULL COMMENT '描述',
  `login` int(11) unsigned NOT NULL COMMENT '需要登录访问',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `name` (`name`)
) ENGINE=InnoDB AUTO_INCREMENT=35 DEFAULT CHARSET=utf8 COMMENT='系统SEO';

-- ----------------------------
-- Table structure for move_sys_sms
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_sms`;
CREATE TABLE `move_sys_sms` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `username` varchar(255) NOT NULL,
  `password` varchar(255) NOT NULL,
  `g_username` varchar(255) NOT NULL,
  `g_password` varchar(255) NOT NULL,
  `sms` int(11) unsigned NOT NULL,
  `tel` int(11) unsigned NOT NULL,
  `guoji` int(11) unsigned NOT NULL,
  `reg` varchar(255) NOT NULL,
  `findpwd` varchar(255) NOT NULL,
  `findpwd_pay` varchar(255) NOT NULL,
  `setmoble` varchar(255) NOT NULL,
  `newmoble` varchar(255) NOT NULL,
  `out` varchar(255) NOT NULL,
  `yidi` varchar(255) NOT NULL,
  `jiankong` varchar(255) NOT NULL,
  `coinout` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='短信服务商';

-- ----------------------------
-- Table structure for move_sys_stats
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_stats`;
CREATE TABLE `move_sys_stats` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `fee` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `addtime` (`addtime`),
  KEY `name` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=4760 DEFAULT CHARSET=utf8 COMMENT='统计表';

-- ----------------------------
-- Table structure for move_talk
-- ----------------------------
DROP TABLE IF EXISTS `move_talk`;
CREATE TABLE `move_talk` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `userid` int(10) NOT NULL,
  `type` varchar(225) NOT NULL COMMENT '话题类型',
  `title` varchar(225) NOT NULL COMMENT '标题内容 ',
  `content` varchar(225) NOT NULL COMMENT '提问内容',
  `peerid` int(10) NOT NULL,
  `answer` varchar(225) NOT NULL COMMENT '回复内容',
  `addtime` int(11) NOT NULL,
  `endtime` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `status` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_talk_type
-- ----------------------------
DROP TABLE IF EXISTS `move_talk_type`;
CREATE TABLE `move_talk_type` (
  `id` int(10) NOT NULL AUTO_INCREMENT,
  `name` varchar(225) NOT NULL,
  `status` int(10) NOT NULL,
  `addtime` int(11) NOT NULL,
  `sort` int(11) NOT NULL,
  `dell` int(11) NOT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_test
-- ----------------------------
DROP TABLE IF EXISTS `move_test`;
CREATE TABLE `move_test` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `mum` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='调试测试表';

-- ----------------------------
-- Table structure for move_trade
-- ----------------------------
DROP TABLE IF EXISTS `move_trade`;
CREATE TABLE `move_trade` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `market` varchar(255) NOT NULL,
  `price` decimal(20,6) unsigned NOT NULL COMMENT '价格',
  `num` decimal(20,6) unsigned NOT NULL COMMENT '数量',
  `mum` decimal(20,6) unsigned NOT NULL,
  `deal` decimal(20,6) unsigned NOT NULL COMMENT '已成交',
  `fee` decimal(20,8) unsigned NOT NULL COMMENT '手续费',
  `type` tinyint(2) unsigned NOT NULL COMMENT '类型',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`),
  KEY `market` (`market`)
) ENGINE=InnoDB AUTO_INCREMENT=705484 DEFAULT CHARSET=utf8 COMMENT='交易委托表';

-- ----------------------------
-- Table structure for move_trade_che
-- ----------------------------
DROP TABLE IF EXISTS `move_trade_che`;
CREATE TABLE `move_trade_che` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `market` varchar(50) NOT NULL COMMENT '市场',
  `maxtime` int(11) unsigned NOT NULL COMMENT '超过多少时间',
  `buy` int(11) unsigned NOT NULL COMMENT '买单',
  `sell` int(11) unsigned NOT NULL COMMENT '卖单',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COMMENT='交易撤单表';

-- ----------------------------
-- Table structure for move_trade_json
-- ----------------------------
DROP TABLE IF EXISTS `move_trade_json`;
CREATE TABLE `move_trade_json` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `market` varchar(255) NOT NULL,
  `data` varchar(255) NOT NULL,
  `type` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `market` (`market`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=263437 DEFAULT CHARSET=utf8 COMMENT='交易行情表';

-- ----------------------------
-- Table structure for move_trade_log
-- ----------------------------
DROP TABLE IF EXISTS `move_trade_log`;
CREATE TABLE `move_trade_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `market` varchar(255) NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `peerid` int(11) unsigned NOT NULL,
  `fee_buy` decimal(20,8) unsigned NOT NULL COMMENT '买家手续费',
  `fee_sell` decimal(20,8) unsigned NOT NULL COMMENT '卖家手续费',
  `price` decimal(20,6) unsigned NOT NULL COMMENT '单价',
  `num` decimal(20,6) unsigned NOT NULL COMMENT '数据',
  `mum` decimal(20,8) unsigned NOT NULL COMMENT '总额',
  `invit` int(10) unsigned NOT NULL COMMENT '是否赠送',
  `type` tinyint(2) unsigned NOT NULL COMMENT '类型',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `market` (`market`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=626205 DEFAULT CHARSET=utf8 COMMENT='交易记录表';

-- ----------------------------
-- Table structure for move_trade_market
-- ----------------------------
DROP TABLE IF EXISTS `move_trade_market`;
CREATE TABLE `move_trade_market` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `round` varchar(255) NOT NULL,
  `new_price` decimal(20,8) unsigned NOT NULL,
  `buy_price` decimal(20,8) unsigned NOT NULL,
  `sell_price` decimal(20,8) unsigned NOT NULL,
  `min_price` decimal(20,8) unsigned NOT NULL,
  `max_price` decimal(20,8) unsigned NOT NULL,
  `volume` decimal(20,8) unsigned NOT NULL,
  `change` varchar(255) NOT NULL,
  `change_type` int(10) unsigned NOT NULL COMMENT '涨跌计算规则',
  `tendency` text NOT NULL,
  `buy_min` decimal(20,6) unsigned NOT NULL COMMENT '最小买入',
  `buy_max` decimal(20,6) unsigned NOT NULL COMMENT '最大买入',
  `sell_min` decimal(20,6) unsigned NOT NULL COMMENT '最小卖出',
  `sell_max` decimal(20,6) unsigned NOT NULL COMMENT '最大卖出',
  `shou_price` decimal(20,8) unsigned NOT NULL COMMENT '收盘价格',
  `kai_price` decimal(20,8) unsigned NOT NULL COMMENT '开盘价格',
  `zhang` decimal(20,2) unsigned NOT NULL COMMENT '涨幅',
  `die` decimal(20,2) unsigned NOT NULL COMMENT '跌幅',
  `fee_buy` decimal(10,2) unsigned NOT NULL,
  `fee_sell` decimal(10,2) unsigned NOT NULL,
  `trade_min` decimal(20,6) unsigned NOT NULL,
  `trade_max` decimal(20,6) unsigned NOT NULL,
  `trade` int(11) unsigned NOT NULL,
  `kai_time` int(11) unsigned NOT NULL,
  `shou_time` int(11) unsigned NOT NULL,
  `invit_buy_kai` int(11) unsigned NOT NULL,
  `invit_sell_kai` int(11) unsigned NOT NULL,
  `invit_buy_coin` varchar(50) NOT NULL,
  `invit_sell_coin` varchar(50) NOT NULL,
  `invit_buy_0` decimal(10,4) unsigned NOT NULL,
  `invit_buy_1` decimal(10,4) unsigned NOT NULL,
  `invit_buy_2` decimal(10,4) unsigned NOT NULL,
  `invit_buy_3` decimal(10,4) unsigned NOT NULL,
  `invit_sell_0` decimal(10,4) unsigned NOT NULL,
  `invit_sell_1` decimal(10,4) unsigned NOT NULL,
  `invit_sell_2` decimal(10,4) unsigned NOT NULL,
  `invit_sell_3` decimal(10,4) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=14 DEFAULT CHARSET=gbk COMMENT='交易市场表';

-- ----------------------------
-- Table structure for move_trade_qu
-- ----------------------------
DROP TABLE IF EXISTS `move_trade_qu`;
CREATE TABLE `move_trade_qu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` char(50) NOT NULL COMMENT '名称',
  `title` varchar(255) NOT NULL COMMENT '标题',
  `sort_rule` varchar(255) NOT NULL,
  `data` text NOT NULL COMMENT '数据',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=utf8 COMMENT='交易分区表';

-- ----------------------------
-- Table structure for move_user
-- ----------------------------
DROP TABLE IF EXISTS `move_user`;
CREATE TABLE `move_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `moble` varchar(255) NOT NULL COMMENT '手机号',
  `password` varchar(255) NOT NULL COMMENT '登录密码',
  `paypassword` varchar(255) NOT NULL COMMENT '交易密码',
  `tpwdsetting` varchar(255) NOT NULL COMMENT '交易密码模式',
  `alipay` varchar(255) NOT NULL COMMENT '支付宝',
  `email` varchar(255) NOT NULL COMMENT '邮箱',
  `invit` varchar(255) NOT NULL COMMENT '推荐码',
  `invit_1` varchar(255) NOT NULL COMMENT '上一级推荐人',
  `invit_2` varchar(255) NOT NULL COMMENT '上二级推荐人',
  `invit_3` varchar(255) NOT NULL COMMENT '上三级推荐人',
  `truename` varchar(255) NOT NULL COMMENT '真实姓名',
  `idcardtype` varchar(255) NOT NULL COMMENT '证件类型',
  `idcard` varchar(255) NOT NULL COMMENT '证件号码',
  `idcard_rz` int(11) unsigned NOT NULL,
  `idcard_img` varchar(255) NOT NULL,
  `logins` int(11) unsigned NOT NULL COMMENT '登录次数',
  `zzc` decimal(20,8) unsigned NOT NULL COMMENT '总资产',
  `zzc_pc` varchar(255) NOT NULL,
  `trade_sh` varchar(255) NOT NULL COMMENT '交易审核',
  `google` varchar(255) NOT NULL COMMENT '谷歌验证',
  `addip` varchar(255) NOT NULL COMMENT '注册ip',
  `addr` varchar(255) NOT NULL COMMENT '注册地址',
  `yidi` varchar(255) NOT NULL COMMENT '异地登录',
  `token` varchar(255) NOT NULL COMMENT '令牌',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `content` varchar(255) NOT NULL,
  `question` int(10) NOT NULL,
  `answer` int(10) NOT NULL,
  `zan` int(10) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `username` (`username`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=142 DEFAULT CHARSET=utf8 COMMENT='用户信息表';

-- ----------------------------
-- Table structure for move_user_bank
-- ----------------------------
DROP TABLE IF EXISTS `move_user_bank`;
CREATE TABLE `move_user_bank` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL COMMENT '用户id',
  `name` varchar(255) NOT NULL COMMENT '名称',
  `truename` varchar(255) NOT NULL,
  `bank` varchar(255) NOT NULL,
  `bankprov` varchar(255) NOT NULL,
  `bankcity` varchar(255) NOT NULL,
  `bankaddr` varchar(255) NOT NULL,
  `bankcard` varchar(255) NOT NULL,
  `exts` text NOT NULL COMMENT '扩展',
  `coinname` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='用户提现表';

-- ----------------------------
-- Table structure for move_user_coin
-- ----------------------------
DROP TABLE IF EXISTS `move_user_coin`;
CREATE TABLE `move_user_coin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `cny` decimal(20,8) unsigned NOT NULL,
  `cnyd` decimal(20,8) unsigned NOT NULL,
  `dsg` decimal(20,8) unsigned NOT NULL,
  `dsgd` decimal(20,8) unsigned NOT NULL,
  `dsc` decimal(20,8) unsigned NOT NULL,
  `dscd` decimal(20,8) unsigned NOT NULL,
  `csa` decimal(20,8) unsigned NOT NULL,
  `csad` decimal(20,8) unsigned NOT NULL,
  `ysc` decimal(20,8) unsigned NOT NULL,
  `yscd` decimal(20,8) unsigned NOT NULL,
  `rgc` decimal(20,8) unsigned NOT NULL,
  `rgcd` decimal(20,8) unsigned NOT NULL,
  `tsc` decimal(20,8) unsigned NOT NULL,
  `tscd` decimal(20,8) unsigned NOT NULL,
  `usd` decimal(20,8) unsigned NOT NULL,
  `usdd` decimal(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `adada` decimal(20,8) unsigned NOT NULL,
  `adadad` decimal(20,8) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=135 DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci COMMENT='用户财产表';

-- ----------------------------
-- Table structure for move_user_goods
-- ----------------------------
DROP TABLE IF EXISTS `move_user_goods`;
CREATE TABLE `move_user_goods` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `name` varchar(255) NOT NULL,
  `truename` varchar(255) NOT NULL,
  `idcard` varchar(255) NOT NULL,
  `moble` varchar(255) NOT NULL,
  `prov` varchar(255) NOT NULL,
  `city` varchar(255) NOT NULL,
  `addr` varchar(255) NOT NULL,
  `default` varchar(255) NOT NULL,
  `exts` text NOT NULL COMMENT '扩展',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 COMMENT='用户地址表';

-- ----------------------------
-- Table structure for move_user_invit
-- ----------------------------
DROP TABLE IF EXISTS `move_user_invit`;
CREATE TABLE `move_user_invit` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL COMMENT '奖励用户',
  `invit` int(11) unsigned NOT NULL COMMENT '下家用户',
  `gameid` int(11) unsigned NOT NULL COMMENT '明细id',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `name` varchar(255) NOT NULL COMMENT '名称 备注',
  `num` decimal(20,8) unsigned NOT NULL COMMENT '操作数量',
  `invitname` varchar(255) NOT NULL COMMENT '推进用户',
  `fee` decimal(20,8) unsigned NOT NULL COMMENT '奖励数量',
  `feecoin` varchar(255) NOT NULL COMMENT '奖励币种',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '更新时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `invit` (`invit`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=56119 DEFAULT CHARSET=utf8 COMMENT='用户赠送表';

-- ----------------------------
-- Table structure for move_user_log
-- ----------------------------
DROP TABLE IF EXISTS `move_user_log`;
CREATE TABLE `move_user_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `remark` varchar(255) NOT NULL,
  `addip` varchar(255) NOT NULL,
  `addr` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=2491 DEFAULT CHARSET=utf8 COMMENT='用户日志表';

-- ----------------------------
-- Table structure for move_user_qianbao
-- ----------------------------
DROP TABLE IF EXISTS `move_user_qianbao`;
CREATE TABLE `move_user_qianbao` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `coinname` varchar(255) NOT NULL,
  `name` varchar(255) NOT NULL,
  `addr` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `userid` (`userid`),
  KEY `coinname` (`coinname`)
) ENGINE=InnoDB AUTO_INCREMENT=53 DEFAULT CHARSET=utf8 COMMENT='用户钱包表';

-- ----------------------------
-- Table structure for move_user_wallet
-- ----------------------------
DROP TABLE IF EXISTS `move_user_wallet`;
CREATE TABLE `move_user_wallet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `dsg` varchar(255) NOT NULL,
  `dsc` varchar(255) NOT NULL,
  `csa` varchar(255) NOT NULL,
  `ysc` varchar(255) NOT NULL,
  `rgc` varchar(255) NOT NULL,
  `tsc` varchar(255) NOT NULL,
  `usd` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  `adada` varchar(255) NOT NULL,
  PRIMARY KEY (`id`),
  KEY `userid` (`userid`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=80 DEFAULT CHARSET=gbk COMMENT='用户转入表';

-- ----------------------------
-- Table structure for move_version
-- ----------------------------
DROP TABLE IF EXISTS `move_version`;
CREATE TABLE `move_version` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `log` text NOT NULL COMMENT '更新日志',
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=56 DEFAULT CHARSET=utf8 COMMENT='系统版本表';

-- ----------------------------
-- Table structure for move_version_game
-- ----------------------------
DROP TABLE IF EXISTS `move_version_game`;
CREATE TABLE `move_version_game` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `shuoming` varchar(255) NOT NULL,
  `gongsi` varchar(255) NOT NULL,
  `anzhuang` int(11) unsigned NOT NULL,
  `menu` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `number` (`name`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=47 DEFAULT CHARSET=utf8 COMMENT='系统应用表';

-- ----------------------------
-- Table structure for move_version_tmp
-- ----------------------------
DROP TABLE IF EXISTS `move_version_tmp`;
CREATE TABLE `move_version_tmp` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `url` varchar(255) NOT NULL,
  `class` varchar(255) NOT NULL,
  `shuoming` varchar(255) NOT NULL,
  `gongsi` varchar(255) NOT NULL,
  `anzhuang` int(11) unsigned NOT NULL,
  `menu` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_vote
-- ----------------------------
DROP TABLE IF EXISTS `move_vote`;
CREATE TABLE `move_vote` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `name` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `img` varchar(255) NOT NULL,
  `cs` varchar(255) NOT NULL,
  `zc` int(11) unsigned NOT NULL,
  `fd` int(11) unsigned NOT NULL,
  `zj` int(11) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=16 DEFAULT CHARSET=gbk COMMENT='新币投票';

-- ----------------------------
-- Table structure for move_vote_log
-- ----------------------------
DROP TABLE IF EXISTS `move_vote_log`;
CREATE TABLE `move_vote_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `coinid` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `type` int(11) unsigned NOT NULL,
  `ext` varchar(255) NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=18 DEFAULT CHARSET=gbk COMMENT='投票记录';

-- ----------------------------
-- Table structure for move_weibo
-- ----------------------------
DROP TABLE IF EXISTS `move_weibo`;
CREATE TABLE `move_weibo` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `title` varchar(255) NOT NULL DEFAULT '',
  `content` varchar(255) NOT NULL COMMENT '内容',
  `auther_id` int(11) unsigned NOT NULL,
  `sort` int(4) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_weibo_config
-- ----------------------------
DROP TABLE IF EXISTS `move_weibo_config`;
CREATE TABLE `move_weibo_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) unsigned NOT NULL,
  `img` int(4) unsigned NOT NULL,
  `sort` int(4) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_weibo_guanzhu
-- ----------------------------
DROP TABLE IF EXISTS `move_weibo_guanzhu`;
CREATE TABLE `move_weibo_guanzhu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `user_id` int(11) unsigned NOT NULL,
  `guanzhu_id` int(11) unsigned NOT NULL,
  `sort` int(4) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_weibo_img
-- ----------------------------
DROP TABLE IF EXISTS `move_weibo_img`;
CREATE TABLE `move_weibo_img` (
  `id` int(4) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `img` varchar(255) NOT NULL,
  `sort` int(4) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=9 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_weibo_log
-- ----------------------------
DROP TABLE IF EXISTS `move_weibo_log`;
CREATE TABLE `move_weibo_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `zan` int(4) unsigned NOT NULL COMMENT '是否点赞',
  `shouchang` int(4) unsigned NOT NULL COMMENT '是否收藏',
  `user_id` int(11) unsigned NOT NULL,
  `art_id` int(11) unsigned NOT NULL,
  `sort` int(4) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=23 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_weibo_pinlun
-- ----------------------------
DROP TABLE IF EXISTS `move_weibo_pinlun`;
CREATE TABLE `move_weibo_pinlun` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `art_id` int(11) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `user_id` int(11) unsigned NOT NULL COMMENT '评论人id',
  `type` int(4) unsigned NOT NULL COMMENT '是评论还是回复  1 评论 2 回复',
  `reply_id` int(11) unsigned NOT NULL,
  `pinlun_id` int(11) unsigned NOT NULL,
  `sort` int(4) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL,
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=91 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Table structure for move_weike
-- ----------------------------
DROP TABLE IF EXISTS `move_weike`;
CREATE TABLE `move_weike` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `userid` int(11) unsigned NOT NULL,
  `type` varchar(255) NOT NULL,
  `title` varchar(255) NOT NULL,
  `content` text NOT NULL COMMENT '参数',
  `price` decimal(20,8) unsigned NOT NULL COMMENT '额外',
  `step` varchar(255) NOT NULL,
  `view` int(11) unsigned NOT NULL,
  `price_type` varchar(255) NOT NULL,
  `num` int(11) unsigned NOT NULL,
  `adress` varchar(255) NOT NULL,
  `sort` int(4) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`),
  KEY `type` (`type`),
  KEY `adminid` (`userid`)
) ENGINE=InnoDB AUTO_INCREMENT=29 DEFAULT CHARSET=utf8 COMMENT='威客管理';

-- ----------------------------
-- Table structure for move_weike_tender
-- ----------------------------
DROP TABLE IF EXISTS `move_weike_tender`;
CREATE TABLE `move_weike_tender` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `weikeid` int(11) unsigned NOT NULL,
  `userid` int(11) unsigned NOT NULL,
  `content` varchar(255) NOT NULL,
  `price_type` varchar(255) NOT NULL,
  `price` double(20,8) unsigned NOT NULL,
  `sort` int(11) unsigned NOT NULL,
  `addtime` int(11) unsigned NOT NULL,
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=57 DEFAULT CHARSET=utf8 COMMENT='威客记录';

-- ----------------------------
-- Table structure for move_weike_type
-- ----------------------------
DROP TABLE IF EXISTS `move_weike_type`;
CREATE TABLE `move_weike_type` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '自增id',
  `type` varchar(255) NOT NULL COMMENT '类型',
  `username` varchar(255) NOT NULL COMMENT '用户名',
  `sort` int(11) unsigned NOT NULL COMMENT '排序',
  `addtime` int(11) unsigned NOT NULL COMMENT '添加时间',
  `endtime` int(11) unsigned NOT NULL COMMENT '编辑时间',
  `status` tinyint(3) unsigned NOT NULL COMMENT '状态',
  PRIMARY KEY (`id`),
  KEY `status` (`status`)
) ENGINE=InnoDB AUTO_INCREMENT=6 DEFAULT CHARSET=utf8 COMMENT='威客类型';
