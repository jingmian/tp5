/*
Navicat MySQL Data Transfer

Source Server         : 001本地数据库
Source Server Version : 50629
Source Host           : 192.168.5.88:3306
Source Database       : move_demo

Target Server Type    : MYSQL
Target Server Version : 50629
File Encoding         : 65001

Date: 2016-11-05 20:02:08
*/

SET FOREIGN_KEY_CHECKS=0;

-- ----------------------------
-- Table structure for move_sys_menu
-- ----------------------------
DROP TABLE IF EXISTS `move_sys_menu`;
CREATE TABLE `move_sys_menu` (
	`id` INT(10) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT 'ID',
	`title` VARCHAR(50) NOT NULL COMMENT '标题',
	`pid` INT(10) UNSIGNED NOT NULL COMMENT '上级分类ID',
	`sort` INT(10) UNSIGNED NOT NULL COMMENT '排序（同级有效）',
	`url` CHAR(255) NOT NULL COMMENT '链接地址',
	`hide` TINYINT(1) UNSIGNED NOT NULL COMMENT '是否隐藏',
	`tip` VARCHAR(255) NOT NULL COMMENT '提示',
	`group` VARCHAR(50) NULL DEFAULT NULL COMMENT '分组',
	`is_dev` TINYINT(1) UNSIGNED NOT NULL COMMENT '是否仅开发者模式可见',
	`ico_name` VARCHAR(50) NOT NULL,
	PRIMARY KEY (`id`),
	INDEX `pid` (`pid`)
)
COMMENT='授权菜单'
COLLATE='utf8_general_ci'
ENGINE=InnoDB
AUTO_INCREMENT=75023
;


-- ----------------------------
-- Records of move_sys_menu
-- ----------------------------
INSERT INTO `move_sys_menu` VALUES ('1000', '系统', '0', '1', 'index/index', '0', '', '', '0', 'home');
INSERT INTO `move_sys_menu` VALUES ('1001', '系统概览', '1000', '1', 'index/index', '0', '', '系统管理', '0', 'home');
INSERT INTO `move_sys_menu` VALUES ('1006', '安全中心', '1000', '6', 'index/sms', '0', '', '系统管理', '0', 'home');
	INSERT INTO `move_sys_menu` VALUES ('10061', '处理', '1006', '1', 'index/sms_chuli', '1', '', '系统管理', '0', 'home');


INSERT INTO `move_sys_menu` VALUES ('1100', '设置', '0', '2', 'config/index', '0', '', '', '0', 'cog');
INSERT INTO `move_sys_menu` VALUES ('1101', '基本配置', '1100', '1', 'config/index', '0', '', '系统配置', '0', 'cog');
INSERT INTO `move_sys_menu` VALUES ('1102', '访问配置', '1100', '2', 'config/sys', '0', '', '系统配置', '0', 'cog');
INSERT INTO `move_sys_menu` VALUES ('1103', '客服配置', '1100', '3', 'config/contact', '0', '', '系统配置', '0', 'cog');
INSERT INTO `move_sys_menu` VALUES ('1105', '其他配置', '1100', '5', 'config/qita', '0', '', '系统配置', '0', 'cog');
INSERT INTO `move_sys_menu` VALUES ('1106', '短信配置', '1100', '6', 'config/sms', '0', '', '系统配置', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('11061', '编辑添加', '1106', '1', 'config/sms_edit', '1', '', '系统配置', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('11062', '修改状态', '1106', '2', 'config/sms_status', '1', '', '系统配置', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('11063', '启用', '1106', '3', 'config/sms_qiyong', '1', '', '系统配置', '0', 'cog');
INSERT INTO `move_sys_menu` VALUES ('1107', '邮箱配置', '1100', '7', 'config/email', '0', '', '系统配置', '0', 'cog');
INSERT INTO `move_sys_menu` VALUES ('1108', '注册配置', '1100', '8', 'config/reg', '0', '', '系统配置', '0', 'cog');
INSERT INTO `move_sys_menu` VALUES ('1109', '页面配置', '1100', '9', 'config/seo', '0', '', '系统配置', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('11091', '编辑添加', '1109', '1', 'config/seo_edit', '1', '', '系统配置', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('11092', '修改状态', '1109', '2', 'config/seo_status', '1', '', '系统配置', '0', 'cog');


-- INSERT INTO `move_sys_menu` VALUES ('1110', '标题配置', '1100', '1', 'config/peizhi', '0', '', '自定义财务配置', '0', 'cog');
-- INSERT INTO `move_sys_menu` VALUES ('1111', '承兑页面编辑', '1100', '2', 'config/chengdui', '0', '', '自定义财务配置', '0', 'cog');
-- INSERT INTO `move_sys_menu` VALUES ('1112', '充值图片配置', '1100', '3', 'config/setImg', '0', '', '自定义财务配置', '0', 'cog');
--   INSERT INTO `move_sys_menu` VALUES ('11121', '编辑添加', '1112', '1', 'config/setImg_edit', '1', '', '系统配置', '0', 'cog');
-- 	INSERT INTO `move_sys_menu` VALUES ('11122', '修改状态', '1112', '2', 'config/setImg_status', '1', '', '系统配置', '0', 'cog');





INSERT INTO `move_sys_menu` VALUES ('1200', '内容', '0', '3', 'article/index', '0', '', '', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('1201', '文章管理', '1200', '1', 'article/index', '0', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12011', '编辑添加', '1201', '1', 'article/edit', '1', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12012', '修改状态', '1201', '2', 'article/status', '1', '', '内容管理', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('1202', '文章类型', '1200', '2', 'article/type', '0', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12021', '编辑添加', '1202', '1', 'article/type_edit', '1', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12022', '修改状态', '1202', '2', 'article/type_status', '1', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12023', '默认设置', '1202', '3', 'article/type_mr', '1', '', '内容管理', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('1203', '广告管理', '1200', '3', 'article/adver', '0', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12031', '编辑添加', '1203', '1', 'article/adver_edit', '1', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12032', '修改状态', '1203', '2', 'article/adver_status', '1', '', '内容管理', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('1204', '友情链接', '1200', '4', 'article/link', '0', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12041', '编辑添加', '1204', '1', 'article/link_edit', '1', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12042', '修改状态', '1204', '2', 'article/link_status', '1', '', '内容管理', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('1206', '多语言', '1200', '6', 'article/lang', '0', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12061', '编辑添加', '1206', '1', 'article/lang_edit', '1', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12062', '修改状态', '1206', '2', 'article/lang_status', '1', '', '内容管理', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('1207', '多语言类型', '1200', '7', 'article/lang_type', '0', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12071', '编辑添加', '1207', '1', 'article/lang_type_edit', '1', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12072', '修改状态', '1207', '2', 'article/lang_type_status', '1', '', '内容管理', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('1208', '导航配置', '1200', '8', 'article/daohang', '0', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12081', '编辑添加', '1208', '1', 'article/daohang_edit', '1', '', '内容管理', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('12082', '修改状态', '1208', '2', 'article/daohang_status', '1', '', '内容管理', '0', 'list-alt');









INSERT INTO `move_sys_menu` VALUES ('1300', '用户', '0', '4', 'user/index', '0', '', '', '0', 'user');
INSERT INTO `move_sys_menu` VALUES ('1301', '用户管理', '1300', '1', 'user/index', '0', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13011', '编辑添加', '1301', '1', 'user/edit', '1', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13012', '修改状态', '1301', '2', 'user/status', '1', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13013', '查看实名认证', '1301', '3', 'user/idcard_rz', '1', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13014', '操作实名认证', '1301', '4', 'user/idcard_check', '1', '', '用户管理', '0', 'user');
INSERT INTO `move_sys_menu` VALUES ('1302', '管理员管理', '1300', '2', 'user/admin', '0', '', '管理员管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13021', '编辑添加', '1302', '1', 'user/admin_edit', '1', '', '管理员管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13022', '修改状态', '1302', '2', 'user/admin_status', '1', '', '管理员管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13023', '修改密码', '1302', '3', 'user/setpwd', '1', '', '管理员管理', '0', 'user');
INSERT INTO `move_sys_menu` VALUES ('1303', '权限列表', '1300', '3', 'auth/index', '0', '', '管理员管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13031', '编辑添加', '1303', '1', 'auth/edit', '1', '', '管理员管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13032', '修改状态', '1303', '2', 'auth/status', '1', '', '管理员管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13033', '访问授权', '1303', '4', 'auth/auth_rule_select', '1', '', '管理员管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13034', '成员授权', '1303', '6', 'auth/user', '1', '', '管理员管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13035', '成员修改状态', '1303', '7', 'auth/user_status', '1', '', '管理员管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13036', '成员授权添加', '1303', '8', 'auth/user_add', '1', '', '管理员管理', '0', 'user');
INSERT INTO `move_sys_menu` VALUES ('1304', '操作日志', '1300', '4', 'user/log', '0', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13041', '编辑添加', '1304', '1', 'user/log_edit', '1', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13042', '修改状态', '1304', '2', 'user/log_status', '1', '', '用户管理', '0', 'user');
INSERT INTO `move_sys_menu` VALUES ('1305', '用户钱包', '1300', '5', 'user/qianbao', '0', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13051', '编辑添加', '1305', '1', 'user/qianbao_edit', '1', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13052', '修改状态', '1305', '2', 'user/qianbao_status', '1', '', '用户管理', '0', 'user');
INSERT INTO `move_sys_menu` VALUES ('1306', '提现地址', '1300', '6', 'user/bank', '0', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13061', '编辑添加', '1306', '1', 'user/bank_edit', '1', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13062', '修改状态', '1306', '2', 'user/bank_status', '1', '', '用户管理', '0', 'user');
INSERT INTO `move_sys_menu` VALUES ('1307', '用户财产', '1300', '7', 'user/coin', '0', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13071', '编辑添加', '1307', '1', 'user/coin_edit', '1', '', '用户管理', '0', 'user');
INSERT INTO `move_sys_menu` VALUES ('1308', '收货地址', '1300', '8', 'user/goods', '0', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13081', '编辑添加', '1308', '1', 'user/goods_edit', '1', '', '用户管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13082', '修改状态', '1308', '2', 'user/goods_status', '1', '', '用户管理', '0', 'user');
INSERT INTO `move_sys_menu` VALUES ('1309', '管理员日志', '1300', '2', 'user/admin_log', '0', '', '管理员管理', '0', 'user');
INSERT INTO `move_sys_menu` VALUES ('1310', '转入地址', '1300', '9', 'user/wallet', '0', '', '用户管理', '0', 'user');
INSERT INTO `move_sys_menu` VALUES ('1311', '行为管理', '1300', '10', 'user/action', '0', '', '行为管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13111', '编辑添加', '1308', '1', 'user/action_edit', '1', '', '行为管理', '0', 'user');
	INSERT INTO `move_sys_menu` VALUES ('13112', '修改状态', '1308', '2', 'user/action_status', '1', '', '行为管理', '0', 'user');
INSERT INTO `move_sys_menu` VALUES ('1312', '行为日志', '1300', '11', 'user/action_log', '0', '', '行为管理', '0', 'user');







INSERT INTO `move_sys_menu` VALUES ('1400', '财务', '0', '5', 'finan/index', '0', '', '', '0', 'th-list');
INSERT INTO `move_sys_menu` VALUES ('1401', '财务管理', '1400', '1', 'finan/index', '0', '', '财务管理', '0', 'th-list');
INSERT INTO `move_sys_menu` VALUES ('1402', '万能充值', '1400', '2', 'finan/wanneng', '0', '', '财务管理', '0', 'th-list');
INSERT INTO `move_sys_menu` VALUES ('1411', '万能扣钱', '1400', '3', 'finan/kouqian', '0', '', '财务管理', '0', 'th-list');
INSERT INTO `move_sys_menu` VALUES ('1410', '财务统计', '1400', '4', 'finan/stats', '0', '', '财务管理', '0', 'th-list');
INSERT INTO `move_sys_menu` VALUES ('1413', '资产排名', '1400', '5', 'finan/paiming', '0', '', '财务管理', '0', 'th-list');


INSERT INTO `move_sys_menu` VALUES ('1403', '账户充值', '1400', '2', 'finan/pay', '0', '', '充值提现', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14031', '编辑添加', '1403', '1', 'finan/pay_queren', '1', '', '充值提现', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14032', '修改状态', '1403', '2', 'finan/pay_status', '1', '', '充值提现', '0', 'th-list');
INSERT INTO `move_sys_menu` VALUES ('1404', '充值方式', '1400', '3', 'finan/type', '0', '', '充值提现', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14041', '编辑添加', '1404', '1', 'finan/type_edit', '1', '', '充值提现', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14042', '修改状态', '1404', '2', 'finan/type_status', '1', '', '充值提现', '0', 'th-list');
INSERT INTO `move_sys_menu` VALUES ('1412', '充值配置', '1400', '3', 'finan/config', '0', '', '充值提现', '0', 'th-list');



INSERT INTO `move_sys_menu` VALUES ('1405', '账户提现', '1400', '4', 'finan/out', '0', '', '充值提现', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14051', '处理', '1405', '1', 'finan/out_chuli', '1', '', '充值提现', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14052', '撤销', '1405', '2', 'finan/out_chexiao', '1', '', '充值提现', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14053', '修改状态', '1405', '3', 'finan/out_status', '1', '', '充值提现', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14054', '确认处理', '1405', '4', 'finan/out_huakuan', '1', '', '充值提现', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14055', '导出', '1405', '5', 'finan/out_excel', '1', '', '充值提现', '0', 'th-list');
INSERT INTO `move_sys_menu` VALUES ('1406', '提现配置', '1400', '5', 'finan/out_config', '0', '', '充值提现', '0', 'th-list');
INSERT INTO `move_sys_menu` VALUES ('1407', '虚拟币转入', '1400', '6', 'finan/coinin', '0', '', '虚拟币管理', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14071', '确认到账', '1407', '1', 'finan/coinin_queren', '1', '', '虚拟币管理', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14072', '撤销', '1407', '2', 'finan/coinin_chexiao', '1', '', '虚拟币管理', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14073', '修改状态', '1407', '3', 'finan/coinin_status', '1', '', '虚拟币管理', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14074', '漏单检查', '1407', '4', 'finan/coinin_loudan', '1', '', '虚拟币管理', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14075', '漏单查询', '1407', '5', 'finan/coinin_loudan_cha', '1', '', '虚拟币管理', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14076', '漏单到账', '1407', '6', 'finan/coinin_loudan_daohzhang', '1', '', '虚拟币管理', '0', 'th-list');
INSERT INTO `move_sys_menu` VALUES ('1408', '虚拟币转出', '1400', '7', 'finan/coinout', '0', '', '虚拟币管理', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14081', '确认转出', '1408', '1', 'finan/coinout_queren', '1', '', '虚拟币管理', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14082', '撤销', '1408', '2', 'finan/coinout_chexiao', '1', '', '虚拟币管理', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14083', '重新补发', '1408', '3', 'finan/coinout_bufa', '1', '', '虚拟币管理', '0', 'th-list');
	INSERT INTO `move_sys_menu` VALUES ('14084', '人工处理', '1408', '4', 'finan/coinout_rengong', '1', '', '虚拟币管理', '0', 'th-list');
INSERT INTO `move_sys_menu` VALUES ('1409', '推荐奖励', '1400', '8', 'finan/invit', '0', '', '用户奖励', '0', 'th-list');





INSERT INTO `move_sys_menu` VALUES ('1500', '工具', '0', '6', 'tools/index', '0', '', '', '0', 'wrench');
INSERT INTO `move_sys_menu` VALUES ('1501', '清理缓存', '1500', '1', 'tools/index', '0', '', '系统工具', '0', 'wrench');
	INSERT INTO `move_sys_menu` VALUES ('15011', '清理缓存', '1501', '1', 'tools/delcache', '1', '', '系统工具', '0', 'wrench');
INSERT INTO `move_sys_menu` VALUES ('1502', '队列检查', '1500', '2', 'tools/queue', '0', '', '系统检查', '0', 'wrench');
INSERT INTO `move_sys_menu` VALUES ('1503', '钱包检查', '1500', '3', 'tools/qianbao', '0', '', '系统检查', '0', 'wrench');
INSERT INTO `move_sys_menu` VALUES ('1504', '核心检查', '1500', '6', 'tools/moveso', '0', '', '系统检查', '0', 'wrench');
INSERT INTO `move_sys_menu` VALUES ('1507', '备份数据', '1500', '4', 'tools/export', '0', '', '备份还原', '0', 'wrench');
INSERT INTO `move_sys_menu` VALUES ('15071', '导出数据表', '1507', '1', 'tools/excel', '1', '', '备份还原', '0', 'wrench');
INSERT INTO `move_sys_menu` VALUES ('15072', '立即备份', '1507', '2', 'tools/export_up', '1', '', '备份还原', '0', 'wrench');
INSERT INTO `move_sys_menu` VALUES ('15073', '优化表', '1507', '2', 'tools/optimize', '1', '', '备份还原', '0', 'wrench');
INSERT INTO `move_sys_menu` VALUES ('15074', '修复表', '1507', '2', 'tools/repair', '1', '', '备份还原', '0', 'wrench');
INSERT INTO `move_sys_menu` VALUES ('1508', '还原数据', '1500', '5', 'tools/import', '0', '', '备份还原', '0', 'wrench');
INSERT INTO `move_sys_menu` VALUES ('1509', '附件管理', '1500', '6', 'tools/files', '0', '', '附件管理', '0', 'wrench');
	INSERT INTO `move_sys_menu` VALUES ('15091', '删除附件', '1509', '1', 'tools/files_del', '1', '', '附件管理', '0', 'wrench');




INSERT INTO `move_sys_menu` VALUES ('1600', '扩展', '0', '7', 'cloud/index', '0', '', '', '0', 'tasks');
INSERT INTO `move_sys_menu` VALUES ('1601', '扩展中心', '1600', '1', 'cloud/index', '0', '', '扩展中心', '0', 'tasks');
INSERT INTO `move_sys_menu` VALUES ('1602', '自动升级', '1600', '2', 'cloud/update', '0', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16021', '初始化', '1602', '1', 'cloud/shengji', '1', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16022', '覆盖源码', '1602', '1', 'cloud/shengji_copy', '1', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16023', '升级数据库', '1602', '1', 'cloud/shengji_database', '1', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16024', '升级完成', '1602', '1', 'cloud/shengji_info', '1', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16025', '下载请求', '1602', '1', 'cloud/shengji_up', '1', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16026', '覆盖请求', '1602', '1', 'cloud/shengji_copy_up', '1', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16027', '数据库请求', '1602', '1', 'cloud/shengji_database_up', '1', '', '扩展中心', '0', 'tasks');
INSERT INTO `move_sys_menu` VALUES ('1603', '应用管理', '1600', '3', 'cloud/game', '0', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16031', '应用卸载', '1603', '1', 'cloud/game_uninstall', '1', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16032', '应用状态', '1603', '1', 'cloud/game_status', '1', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16033', '应用更新', '1603', '1', 'cloud/game_gengxin', '1', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16034', '应用卸载', '1603', '1', 'cloud/game_uninstall', '1', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16035', '应用前台显示', '1603', '1', 'cloud/game_menu', '1', '', '扩展中心', '0', 'tasks');
	INSERT INTO `move_sys_menu` VALUES ('16036', '应用编辑', '1603', '1', 'cloud/game_edit', '1', '', '扩展中心', '0', 'tasks');
INSERT INTO `move_sys_menu` VALUES ('1604', '联系客服', '1600', '4', 'cloud/kefu', '0', '', '扩展中心', '0', 'tasks');
INSERT INTO `move_sys_menu` VALUES ('1605', '主题模板', '1600', '5', 'cloud/theme', '0', '', '扩展中心', '0', 'tasks');
INSERT INTO `move_sys_menu` VALUES ('1606', '系统配色', '1600', '6', 'cloud/blendent', '0', '', '扩展中心', '0', 'tasks');




INSERT INTO `move_sys_menu` VALUES ('1700', '华晟众筹', '0', '0', 'raise/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('1701', '众筹管理', '1700', '0', 'raise/index', '0', '', '华晟众筹', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('17011', '编辑添加', '1701', '1', 'raise/edit', '0', '', '华晟众筹', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('17012', '修改状态', '1701', '2', 'raise/status', '0', '', '华晟众筹', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1702', '众筹记录', '1700', '1', 'raise/log', '0', '', '华晟众筹', '0', 'globe');



INSERT INTO `move_sys_menu` VALUES ('1800', '新版商城', '0', '0', 'shop_yx/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('1801', '商家管理', '1800', '0', 'shop_yx/index', '0', '', '新版商城', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('18011', '编辑添加', '1801', '1', 'shop_yx/edit', '0', '', '新版商城', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('18012', '修改状态', '1801', '2', 'shop_yx/status', '0', '', '新版商城', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1802', '商品管理', '1800', '1', 'shop_yx/shop', '0', '', '新版商城', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('18021', '编辑添加', '1802', '1', 'shop_yx/shop_edit', '0', '', '新版商城', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('18022', '修改状态', '1802', '2', 'shop_yx/shop_status', '0', '', '新版商城', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1803', '购物记录', '1800', '2', 'shop_yx/log', '0', '', '新版商城', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('18031', '编辑添加', '1803', '1', 'shop_yx/log_edit', '0', '', '新版商城', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('18032', '修改状态', '1803', '2', 'shop_yx/log_status', '0', '', '新版商城', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1804', '类型管理', '1800', '3', 'shop_yx/type', '0', '', '新版商城', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('18041', '编辑添加', '1804', '1', 'shop_yx/type_edit', '0', '', '新版商城', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('18042', '修改状态', '1804', '2', 'shop_yx/type_status', '0', '', '新版商城', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1805', '图片管理', '1800', '4', 'shop_yx/img', '0', '', '新版商城', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('18051', '编辑添加', '1805', '1', 'shop_yx/img_edit', '0', '', '新版商城', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('18052', '修改状态', '1805', '2', 'shop_yx/img_status', '0', '', '新版商城', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1806', '币种管理', '1800', '5', 'shop_yx/coinpay', '0', '', '新版商城', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('18061', '编辑添加', '1806', '1', 'shop_yx/coinpay_edit', '0', '', '新版商城', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('18062', '修改状态', '1806', '2', 'shop_yx/coinpay_status', '0', '', '新版商城', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1807', '等级管理', '1800', '6', 'shop_yx/rank', '0', '', '新版商城', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('18071', '编辑添加', '1807', '1', 'shop_yx/rank_edit', '0', '', '新版商城', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('18072', '修改状态', '1807', '2', 'shop_yx/rank_status', '0', '', '新版商城', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1808', '分红管理', '1800', '7', 'shop_yx/fenhong', '0', '', '新版商城', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('18081', '编辑添加', '1808', '1', 'shop_yx/fenhong_edit', '0', '', '新版商城', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('18082', '修改状态', '1808', '2', 'shop_yx/fenhong_status', '0', '', '新版商城', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1809', '用户管理', '1800', '8', 'shop_yx/user', '0', '', '新版商城', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1810', '会员购买设置', '1800', '9', 'shop_yx/center', '0', '', '新版商城', '0', 'globe');







INSERT INTO `move_sys_menu` VALUES ('1900', '拍卖中心', '0', '0', 'sale/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('1901', '商品管理', '1900', '0', 'sale/index', '0', '', '拍卖中心', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('19011', '编辑添加', '1901', '1', 'sale/edit', '0', '', '拍卖中心', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('19012', '修改状态', '1901', '2', 'sale/status', '0', '', '拍卖中心', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1902', '出价管理', '1900', '1', 'sale/log', '0', '', '拍卖中心', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('19021', '编辑添加', '1902', '1', 'sale/log_edit', '0', '', '拍卖中心', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('19022', '修改状态', '1902', '2', 'sale/log_status', '0', '', '拍卖中心', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1903', '担保记录', '1900', '2', 'sale/danbaolog', '0', '', '拍卖中心', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('19031', '编辑添加', '1903', '1', 'sale/danbaolog_edit', '0', '', '拍卖中心', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('19032', '修改状态', '1903', '2', 'sale/danbaolog_status', '0', '', '拍卖中心', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1904', '图片管理', '1900', '3', 'sale/img', '0', '', '拍卖中心', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('19041', '编辑添加', '1904', '1', 'sale/img_edit', '0', '', '拍卖中心', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('19042', '修改状态', '1904', '2', 'sale/img_status', '0', '', '拍卖中心', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('1905', '类型管理', '1900', '4', 'sale/type', '0', '', '拍卖中心', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('19051', '编辑添加', '1905', '1', 'sale/type_edit', '0', '', '拍卖中心', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('19052', '修改状态', '1905', '2', 'sale/type_status', '0', '', '拍卖中心', '0', 'globe');


INSERT INTO `move_sys_menu` VALUES ('2000', '增值计划', '0', '0', 'hongli/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('2001', '计划管理', '2000', '0', 'hongli/index', '0', '', '增值计划', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('20011', '编辑添加', '2001', '1', 'hongli/edit', '0', '', '增值计划', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('20012', '修改状态', '2001', '2', 'hongli/status', '0', '', '增值计划', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2002', '计划记录', '2000', '1', 'hongli/log', '0', '', '增值计划', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2003', '计划利息', '2000', '2', 'hongli/fee', '0', '', '增值计划', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2004', '计划类型', '2000', '3', 'hongli/type', '0', '', '增值计划', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('20041', '编辑添加', '2004', '1', 'hongli/type_edit', '0', '', '增值计划', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('20042', '修改状态', '2004', '2', 'hongli/type_status', '0', '', '增值计划', '0', 'globe');



INSERT INTO `move_sys_menu` VALUES ('2100', '理财中心', '0', '0', 'money_yx/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('2101', '代理商理财信息', '2100', '1', 'money_yx/index', '0', '', '理财中心', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2102', '理财市场管理', '2100', '1', 'money_yx/money', '0', '', '理财中心', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('21021', '编辑添加', '2102', '1', 'money_yx/edit', '0', '', '理财中心', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('21022', '修改状态', '2102', '2', 'money_yx/status', '0', '', '理财中心', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2103', '用户理财管理', '2100', '1', 'money_yx/log', '0', '', '理财中心', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2104', '收益记录', '2100', '2', 'money_yx/fee', '0', '', '理财中心', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2105', '广告管理', '2100', '3', 'money_yx/gg', '0', '', '理财中心', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('21051', '编辑添加', '2105', '1', 'money_yx/gg_edit', '0', '', '理财中心', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('21052', '修改状态', '2105', '2', 'money_yx/gg_status', '0', '', '理财中心', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2106', '广告类型管理', '2100', '4', 'money_yx/ggtype', '0', '', '理财中心', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('21061', '编辑添加', '2106', '1', 'money_yx/ggtype_edit', '0', '', '理财中心', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('21062', '修改状态', '2106', '2', 'money_yx/ggtype_status', '0', '', '理财中心', '0', 'globe');



INSERT INTO `move_sys_menu` VALUES ('2200', 'WAP管理', '0', '0', 'wap/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('2201', 'WAP设置', '2200', '1', 'wap/index', '0', '', 'WAP管理', '0', 'globe');



INSERT INTO `move_sys_menu` VALUES ('2300', '投票', '0', '0', 'vote/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('2301', '投票管理', '2300', '1', 'vote/index', '0', '', '投票管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('23011', '编辑添加', '2301', '1', 'vote/edit', '1', '', '投票管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('23012', '修改状态', '2301', '2', 'vote/status', '1', '', '投票管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2302', '投票记录', '2300', '2', 'vote/log', '0', '', '投票管理', '0', 'globe');



INSERT INTO `move_sys_menu` VALUES ('2400', '卡密管理', '0', '0', 'charge/card', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('2401', '卡密记录', '2400', '1', 'charge/index', '0', '', '卡密管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('24011', '修改状态', '2401', '1', 'charge/status', '1', '', '卡密管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2402', '卡密管理', '2400', '2', 'charge/card', '0', '', '卡密管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('24021', '编辑添加', '2402', '1', 'charge/card_edit', '1', '', '卡密管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('24022', '修改状态', '2402', '2', 'charge/card_status', '1', '', '卡密管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('24023', '批量生成', '2402', '3', 'charge/cards_edit', '1', '', '卡密管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('24024', '导出', '2402', '4', 'charge/out_excel', '1', '', '卡密管理', '0', 'globe');






INSERT INTO `move_sys_menu` VALUES ('2500', '认购', '0', '0', 'issue/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('2501', '认购管理', '2500', '1', 'issue/index', '0', '', '认购管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('25011', '编辑添加', '2501', '1', 'issue/edit', '1', '', '认购管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('25012', '修改状态', '2501', '2', 'issue/status', '1', '', '认购管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2502', '认购记录', '2500', '2', 'issue/log', '0', '', '认购管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2503', '认购赠送', '2500', '3', 'issue/invit', '0', '', '认购管理', '0', 'globe');




INSERT INTO `move_sys_menu` VALUES ('2600', '商城', '0', '0', 'shop/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('2601', '商品管理', '2600', '1', 'shop/index', '0', '', '商品管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('26011', '编辑添加', '2601', '1', 'shop/edit', '1', '', '商品管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('26012', '修改状态', '2601', '2', 'shop/status', '1', '', '商品管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2602', '商品类型', '2600', '2', 'shop/type', '0', '', '商品管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('26021', '编辑添加', '2602', '1', 'shop/type_edit', '1', '', '商品管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('26022', '修改状态', '2602', '2', 'shop/type_status', '1', '', '商品管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2603', '购物记录', '2600', '3', 'shop/log', '0', '', '商品管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('26031', '编辑添加', '2603', '1', 'shop/log_edit', '1', '', '商品管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('26032', '修改状态', '2603', '2', 'shop/log_status', '1', '', '商品管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('26033', '撤销订单', '2603', '3', 'shop/log_chexiao', '1', '', '商品管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2604', '商品图片', '2600', '4', 'shop/img', '0', '', '商品管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('26041', '编辑添加', '2604', '1', 'shop/img_edit', '1', '', '商品管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('26042', '修改状态', '2604', '2', 'shop/img_status', '1', '', '商品管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2605', '付款币种', '2600', '4', 'shop/coinpay', '0', '', '商品管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('26051', '编辑添加', '2605', '1', 'shop/coinpay_edit', '1', '', '商品管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('26052', '修改状态', '2605', '2', 'shop/coinpay_status', '1', '', '商品管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2606', '商城配置', '2600', '4', 'shop/config', '0', '', '商品管理', '0', 'globe');





INSERT INTO `move_sys_menu` VALUES ('2700', '理财', '0', '0', 'money/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('2701', '理财管理', '2700', '1', 'money/index', '0', '', '理财管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('27011', '编辑添加', '2701', '1', 'money/edit', '1', '', '理财管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('27012', '修改状态', '2701', '2', 'money/status', '1', '', '理财管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2702', '理财记录', '2700', '2', 'money/log', '0', '', '理财管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2703', '理财利息', '2700', '3', 'money/fee', '0', '', '理财管理', '0', 'globe');





INSERT INTO `move_sys_menu` VALUES ('2800', '分红', '0', '0', 'fenhong/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('2801', '分红管理', '2800', '1', 'fenhong/index', '0', '', '分红管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('28011', '编辑添加', '2801', '1', 'fenhong/edit', '1', '', '分红管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('28012', '修改状态', '2801', '2', 'fenhong/status', '1', '', '分红管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('28013', '开始分红', '2801', '3', 'fenhong/kaishi', '1', '', '分红管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2802', '分红记录', '2800', '2', 'fenhong/log', '0', '', '分红管理', '0', 'globe');



INSERT INTO `move_sys_menu` VALUES ('2900', '矿机工厂', '0', '0', 'pool/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('2901', '用户矿机', '2900', '0', 'pool/index', '0', '', '矿机工厂', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('29011', '编辑添加', '2901', '1', 'pool/edit', '1', '', '矿机工厂', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('29012', '修改状态', '2901', '2', 'pool/status', '1', '', '矿机工厂', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2902', '矿机市场管理', '2900', '1', 'pool/market', '0', '', '矿机工厂', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('29021', '编辑添加', '2902', '1', 'pool/market_edit', '1', '', '矿机工厂', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('29022', '修改状态', '2902', '2', 'pool/market_status', '1', '', '矿机工厂', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('2903', '收矿记录', '2900', '2', 'pool/log', '0', '', '矿机工厂', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('29031', '编辑添加', '2903', '1', 'pool/log_edit', '1', '', '矿机工厂', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('29032', '修改状态', '2903', '2', 'pool/log_status', '1', '', '矿机工厂', '0', 'globe');



INSERT INTO `move_sys_menu` VALUES ('3000', '每日签到', '0', '0', 'qiandao/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('3001', '签到记录', '3000', '0', 'qiandao/index', '0', '', '每日签到', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3002', '签到奖励', '3000', '1', 'qiandao/award', '0', '', '每日签到', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('30021', '编辑添加', '3002', '1', 'qiandao/award_edit', '1', '', '每日签到', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('30022', '修改状态', '3002', '2', 'qiandao/award_status', '1', '', '每日签到', '0', 'globe');



INSERT INTO `move_sys_menu` VALUES ('3100', '集市交易', '0', '0', 'bazaar/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('3101', '集市交易', '3100', '0', 'bazaar/index', '0', '', '集市交易', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3102', '集市配置', '3100', '0', 'bazaar/market', '0', '', '集市交易', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('31021', '编辑添加', '3102', '1', 'bazaar/edit', '1', '', '集市交易', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('31022', '修改状态', '3102', '2', 'bazaar/status', '1', '', '集市交易', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3103', '成交记录', '3100', '0', 'bazaar/log', '0', '', '集市交易', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3104', '推荐奖励', '3100', '0', 'bazaar/invit', '0', '', '集市交易', '0', 'globe');



INSERT INTO `move_sys_menu` VALUES ('3200', '一元夺宝', '0', '0', 'duobao/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('3201', '一元夺宝', '3200', '1', 'duobao/index', '0', '', '一元夺宝', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('32011', '编辑添加', '3201', '1', 'duobao/edit', '1', '', '一元夺宝', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('32012', '修改状态', '3201', '2', 'duobao/status', '2', '', '一元夺宝', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('32013', '开奖', '3201', '3', 'duobao/kai', '3', '', '一元夺宝', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3202', '夺宝记录', '3200', '2', 'duobao/log', '0', '', '一元夺宝', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('32021', '编辑添加', '3202', '1', 'duobao/log_edit', '1', '', '一元夺宝', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('32022', '修改状态', '3202', '2', 'duobao/log_status', '2', '', '一元夺宝', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3203', '宝贝类型', '3200', '3', 'duobao/type', '0', '', '一元夺宝', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('32031', '编辑添加', '3203', '1', 'duobao/type_edit', '1', '', '一元夺宝', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('32032', '修改状态', '3203', '2', 'duobao/type_status', '2', '', '一元夺宝', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3204', '宝贝图片', '3200', '4', 'duobao/img', '0', '', '一元夺宝', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('32041', '编辑添加', '3204', '1', 'duobao/img_edit', '1', '', '一元夺宝', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('32042', '修改状态', '3204', '2', 'duobao/img_status', '2', '', '一元夺宝', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3205', '币种管理', '3200', '5', 'duobao/coinpay', '0', '', '一元夺宝', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('32051', '编辑添加', '3205', '1', 'duobao/coinpay_edit', '1', '', '一元夺宝', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('32052', '修改状态', '3205', '2', 'duobao/coinpay_status', '2', '', '一元夺宝', '0', 'globe');




INSERT INTO `move_sys_menu` VALUES ('3300', '交易中心', '0', '0', 'trade/index', '1', '', '', '0', 'stats');
INSERT INTO `move_sys_menu` VALUES ('3301', '交易管理', '3300', '1', 'trade/index', '0', '', '交易管理', '0', 'stats');
	INSERT INTO `move_sys_menu` VALUES ('33011', '撤销委托', '3301', '1', 'trade/chexiao', '1', '', '交易管理', '0', 'stats');
INSERT INTO `move_sys_menu` VALUES ('3304', '交易市场', '3300', '4', 'trade/market', '0', '', '交易管理', '0', 'stats');
	INSERT INTO `move_sys_menu` VALUES ('33041', '编辑添加', '3304', '1', 'trade/market_edit', '1', '', '交易管理', '0', 'stats');
	INSERT INTO `move_sys_menu` VALUES ('33042', '修改状态', '3304', '2', 'trade/market_status', '1', '', '交易管理', '0', 'stats');
INSERT INTO `move_sys_menu` VALUES ('3305', '市场分区', '3300', '5', 'trade/qu', '0', '', '交易管理', '0', 'stats');
	INSERT INTO `move_sys_menu` VALUES ('33051', '编辑添加', '3305', '1', 'trade/qu_edit', '1', '', '交易管理', '0', 'stats');
	INSERT INTO `move_sys_menu` VALUES ('33052', '修改状态', '3305', '2', 'trade/qu_status', '1', '', '交易管理', '0', 'stats');
INSERT INTO `move_sys_menu` VALUES ('3306', '交易记录', '3300', '6', 'trade/log', '0', '', '交易管理', '0', 'stats');
	INSERT INTO `move_sys_menu` VALUES ('33062', '交易手动赠送', '3306', '2', 'trade/zengsong', '1', '', '交易管理', '0', 'stats');
-- INSERT INTO `move_sys_menu` VALUES ('3307', '委托统计', '3300', '7', 'trade/entrust', '0', '', '统计管理', '0', 'stats');
INSERT INTO `move_sys_menu` VALUES ('3308', '成交统计', '3300', '8', 'trade/logsta', '0', '', '统计管理', '0', 'stats');
INSERT INTO `move_sys_menu` VALUES ('3309', '交易误差', '3300', '9', 'trade/err', '0', '', '交易管理', '0', 'stats');
INSERT INTO `move_sys_menu` VALUES ('3310', '自动撤单', '3300', '10', 'trade/che', '0', '', '交易管理', '0', 'stats');
	INSERT INTO `move_sys_menu` VALUES ('33101', '编辑添加', '3310', '1', 'trade/che_edit', '1', '', '交易管理', '0', 'stats');
	INSERT INTO `move_sys_menu` VALUES ('33102', '修改状态', '3310', '2', 'trade/che_status', '1', '', '交易管理', '0', 'stats');
INSERT INTO `move_sys_menu` VALUES ('3311', '交易设置', '3300', '11', 'trade/config', '0', '', '交易管理', '0', 'stats');
INSERT INTO `move_sys_menu` VALUES ('3312', '测试交易', '3300', '10', 'trade/moni', '0', '', '测试功能', '0', 'stats');
	INSERT INTO `move_sys_menu` VALUES ('33121', '编辑添加', '3312', '1', 'trade/moni_edit', '1', '', '测试功能', '0', 'stats');
	INSERT INTO `move_sys_menu` VALUES ('33122', '修改状态', '3312', '2', 'trade/moni_status', '1', '', '测试功能', '0', 'stats');
	INSERT INTO `move_sys_menu` VALUES ('33123', '执行挂单', '3312', '3', 'trade/moni_status', '1', '', '测试功能', '0', 'stats');




INSERT INTO `move_sys_menu` VALUES ('3400', '问答管理', '0', '0', 'question/index', '1', '', '', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3401', '问题管理', '3400', '1', 'question/index', '0', '', '问答管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('34011', '编辑添加', '3401', '0', 'question/edit', '0', '', '问答管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('34012', '修改状态', '3401', '0', 'question/status', '0', '', '问答管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3402', '问题类型管理', '3400', '2', 'question/type', '0', '', '问答管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('34021', '编辑添加', '3402', '0', 'question/type_edit', '0', '', '问答管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('34022', '修改状态', '3402', '0', 'question/type_status', '0', '', '问答管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3403', '问题答案管理', '3400', '3', 'question/ans', '0', '', '问答管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('34031', '编辑添加', '3403', '0', 'question/ans_edit', '0', '', '问答管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('34032', '修改状态', '3403', '0', 'question/ans_status', '0', '', '问答管理', '0', 'globe');





INSERT INTO `move_sys_menu` VALUES ('3500', '话费充值', '0', '0', 'huafei/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('3501', '话费充值', '3500', '0', 'huafei/index', '0', '', '话费充值', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('35011', '编辑添加', '3501', '0', 'huafei/edit', '0', '', '话费充值', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('35012', '修改状态', '3501', '0', 'huafei/status', '0', '', '话费充值', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3502', '币种管理', '3500', '0', 'huafei/cointype', '0', '', '话费充值', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('35021', '编辑添加', '3502', '0', 'huafei/cointype_edit', '0', '', '话费充值', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('35022', '修改状态', '3502', '0', 'huafei/cointype_status', '0', '', '话费充值', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3503', '充值类型管理', '3500', '0', 'huafei/type', '0', '', '话费充值', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('35031', '编辑添加', '3503', '0', 'huafei/type_edit', '0', '', '话费充值', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('35032', '修改状态', '3503', '0', 'huafei/type_status', '0', '', '话费充值', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3504', '配置管理', '3500', '0', 'huafei/peizhi', '0', '', '话费充值', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('35041', '编辑添加', '3504', '0', 'huafei/peizhi_edit', '0', '', '话费充值', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('35042', '修改状态', '3504', '0', 'huafei/peizhi_status', '0', '', '话费充值', '0', 'globe');


INSERT INTO `move_sys_menu` VALUES ('3600', '众筹管理', '0', '0', 'crowd/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('3601', '众筹管理', '3600', '0', 'crowd/index', '0', '', '众筹管理', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('36011', '编辑添加', '3601', '1', 'crowd/edit', '0', '', '众筹管理', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('36012', '修改状态', '3601', '2', 'crowd/status', '0', '', '众筹管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3602', '众筹记录', '3600', '1', 'crowd/log', '0', '', '众筹管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3603', '众筹收益', '3600', '2', 'crowd/fee', '1', '', '众筹管理', '0', 'globe');


INSERT INTO `move_sys_menu` VALUES ('3700', '威客升级版', '0', '0', 'sweike/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('3701', '威客管理', '3700', '0', 'sweike/index', '0', '', '威客升级版', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('37011', '编辑添加', '3701', '1', 'sweike/edit', '0', '', '威客升级版', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('37012', '修改状态', '3701', '2', 'sweike/status', '0', '', '威客升级版', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3702', '投标记录', '3700', '1', 'sweike/tender', '0', '', '威客升级版', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3703', '类型管理', '3700', '2', 'sweike/type', '0', '', '威客升级版', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('37031', '编辑添加', '3703', '1', 'sweike/type_edit', '0', '', '威客升级版', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('37032', '修改状态', '3703', '2', 'sweike/type_status', '0', '', '威客升级版', '0', 'globe');


INSERT INTO `move_sys_menu` VALUES ('3800', '理财升级版', '0', '0', 'smoney/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('3801', '理财管理', '3800', '0', 'smoney/index', '0', '', '理财升级版', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('38011', '编辑添加', '3801', '1', 'smoney/edit', '0', '', '理财升级版', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('38012', '修改状态', '3801', '2', 'smoney/status', '0', '', '理财升级版', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3802', '理财记录', '3800', '1', 'smoney/log', '0', '', '理财升级版', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('3803', '赠送记录', '3800', '2', 'smoney/fee', '0', '', '理财升级版', '0', 'globe');


-- INSERT INTO `move_sys_menu` VALUES ('3900', '有借有还', '0', '0', 'lend/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('3901', '借款管理', '3900', '0', 'lend/index', '0', '', '有借有还', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('3902', '还款账单', '3900', '1', 'lend/lend_back', '0', '', '有借有还', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('3903', '担保人管理', '3900', '2', 'lend/lend_danbao', '0', '', '有借有还', '0', 'globe');
--   INSERT INTO `move_sys_menu` VALUES ('39031', '编辑添加', '3903', '1', 'lend/danbao_edit', '0', '', '有借有还', '0', 'globe');
-- 	INSERT INTO `move_sys_menu` VALUES ('39032', '修改状态', '3903', '2', 'lend/danbao_status', '0', '', '有借有还', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('3904', '系统配置', '3900', '3', 'lend/lend_set', '0', '', '有借有还', '0', 'globe');
--   INSERT INTO `move_sys_menu` VALUES ('39041', '编辑添加', '3904', '1', 'lend/lend_set_edit', '0', '', '有借有还', '0', 'globe');
-- 	INSERT INTO `move_sys_menu` VALUES ('39042', '修改状态', '3904', '2', 'lend/lend_set_status', '0', '', '有借有还', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('3905', '借款期限配置', '3900', '4', 'lend/lend_qi', '0', '', '有借有还', '0', 'globe');
--   INSERT INTO `move_sys_menu` VALUES ('39051', '编辑添加', '3905', '1', 'lend/lend_qi_edit', '0', '', '有借有还', '0', 'globe');
-- 	INSERT INTO `move_sys_menu` VALUES ('39052', '修改状态', '3905', '2', 'lend/lend_qi_status', '0', '', '有借有还', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('3906', '担保人记录', '3900', '5', 'lend/lend_fee', '0', '', '有借有还', '0', 'globe');



-- INSERT INTO `move_sys_menu` VALUES ('4000', '养殖工厂', '0', '0', 'factory/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('4001', '用户养殖工具', '4000', '0', 'factory/index', '0', '', '养殖工厂', '0', 'globe');
--   INSERT INTO `move_sys_menu` VALUES ('40011', '编辑添加', '4001', '1', 'factory/edit', '1', '', '养殖工厂', '0', 'globe');
-- 	INSERT INTO `move_sys_menu` VALUES ('40012', '修改状态', '4001', '2', 'factory/status', '1', '', '养殖工厂', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('4002', '市场管理', '4000', '1', 'factory/goodsManage', '0', '', '养殖工厂', '0', 'globe');
--   INSERT INTO `move_sys_menu` VALUES ('40021', '编辑添加', '4002', '1', 'factory/goodsManage_edit', '1', '', '养殖工厂', '0', 'globe');
-- 	INSERT INTO `move_sys_menu` VALUES ('40022', '修改状态', '4002', '2', 'factory/goodsManage_status', '1', '', '养殖工厂', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('4003', '用户养殖饲料管理', '4000', '2', 'factory/foodManage', '0', '', '养殖工厂', '0', 'globe');
--   INSERT INTO `move_sys_menu` VALUES ('40031', '编辑添加', '4003', '1', 'factory/food_edit', '1', '', '养殖工厂', '0', 'globe');
-- 	INSERT INTO `move_sys_menu` VALUES ('40032', '修改状态', '4003', '2', 'factory/goodsStatus', '1', '', '养殖工厂', '0', 'globe');


-- INSERT INTO `move_sys_menu` VALUES ('4100', '新矿机工厂', '0', '0', 'poolgbw/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('4101', '用户矿机', '4100', '0', 'poolgbw/index', '0', '', '新矿机工厂', '0', 'globe');
--   INSERT INTO `move_sys_menu` VALUES ('41011', '编辑添加', '4101', '1', 'poolgbw/edit', '1', '', '新矿机工厂', '0', 'globe');
-- 	INSERT INTO `move_sys_menu` VALUES ('41012', '修改状态', '4101', '2', 'poolgbw/status', '1', '', '新矿机工厂', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('4102', '矿机市场管理', '4100', '1', 'poolgbw/market', '0', '', '新矿机工厂', '0', 'globe');
--   INSERT INTO `move_sys_menu` VALUES ('41021', '编辑添加', '4102', '1', 'poolgbw/market_edit', '1', '', '新矿机工厂', '0', 'globe');
-- 	INSERT INTO `move_sys_menu` VALUES ('41022', '修改状态', '4102', '2', 'poolgbw/market_status', '1', '', '新矿机工厂', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('4103', '收矿记录', '4100', '2', 'poolgbw/log', '0', '', '新矿机工厂', '0', 'globe');
--   INSERT INTO `move_sys_menu` VALUES ('41031', '编辑添加', '4103', '1', 'poolgbw/log_edit', '1', '', '新矿机工厂', '0', 'globe');
-- 	INSERT INTO `move_sys_menu` VALUES ('41032', '修改状态', '4103', '2', 'poolgbw/log_status', '1', '', '新矿机工厂', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('4104', '规则说明', '4100', '3', 'poolgbw/rule', '0', '', '新矿机工厂', '0', 'globe');
--   INSERT INTO `move_sys_menu` VALUES ('41041', '编辑添加', '4104', '1', 'poolgbw/rule_edit', '1', '', '新矿机工厂', '0', 'globe');
-- 	INSERT INTO `move_sys_menu` VALUES ('41042', '修改状态', '4104', '2', 'poolgbw/rule_status', '1', '', '新矿机工厂', '0', 'globe');



INSERT INTO `move_sys_menu` VALUES ('4200', '红包管理', '0', '0', 'hongbao/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('4201', '红包管理', '4200', '0', 'hongbao/index', '0', '', '红包管理', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('42011', '编辑添加', '4201', '1', 'hongbao/edit', '0', '', '红包管理', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('42012', '修改状态', '4201', '2', 'hongbao/status', '0', '', '红包管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('4202', '红包记录', '4200', '1', 'hongbao/log', '0', '', '红包管理', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('42021', '编辑添加', '4202', '1', 'hongbao/log_edit', '0', '', '红包管理', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('42022', '修改状态', '4202', '2', 'hongbao/log_status', '0', '', '红包管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('4203', '红包币种', '4200', '2', 'hongbao/type', '0', '', '红包管理', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('42031', '编辑添加', '4203', '1', 'hongbao/type_edit', '0', '', '红包管理', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('42032', '修改状态', '4203', '2', 'hongbao/type_status', '0', '', '红包管理', '0', 'globe');




INSERT INTO `move_sys_menu` VALUES ('4300', '威客管理', '0', '0', 'weike/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('4301', '威客管理', '4300', '0', 'weike/index', '0', '', '威客管理', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('43011', '编辑添加', '4301', '1', 'weike/edit', '1', '', '威客管理', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('43012', '修改状态', '4301', '2', 'weike/status', '1', '', '威客管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('4302', '威客类型', '4300', '1', 'weike/type', '0', '', '威客管理', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('43021', '编辑添加', '4302', '1', 'weike/type_edit', '1', '', '威客管理', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('43022', '修改状态', '4302', '2', 'weike/type_status', '1', '', '威客管理', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('4303', '投标管理', '4300', '2', 'weike/tender', '0', '', '威客管理', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('43031', '编辑添加', '4303', '1', 'weike/tender_edit', '1', '', '威客管理', '0', 'globe');
   INSERT INTO `move_sys_menu` VALUES ('43032', '修改状态', '4303', '2', 'weike/tender_status', '1', '', '威客管理', '0', 'globe');


INSERT INTO `move_sys_menu` VALUES ('4400', '币币兑换', '0', '0', 'duihuan/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('4401', '币币兑换', '4400', '0', 'duihuan/index', '0', '', '币币兑换', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('44011', '编辑添加', '4401', '1', 'duihuan/edit', '1', '', '币币兑换', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('44012', '修改状态', '4401', '2', 'duihuan/status', '1', '', '币币兑换', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('4402', '兑换记录', '4400', '1', 'duihuan/log', '0', '', '币币兑换', '0', 'globe');




INSERT INTO `move_sys_menu` VALUES ('4500', '幸运抽奖', '0', '0', 'choujiang/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('4501', '奖品管理', '4500', '0', 'choujiang/index', '0', '', '幸运抽奖', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('45011', '编辑添加', '4501', '1', 'choujiang/edit', '0', '', '幸运抽奖', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('45012', '修改状态', '4501', '2', 'choujiang/status', '0', '', '幸运抽奖', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('4502', '抽奖记录', '4500', '1', 'choujiang/log', '0', '', '幸运抽奖', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('45021', '编辑添加', '4502', '1', 'choujiang/log_edit', '0', '', '幸运抽奖', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('45022', '修改状态', '4502', '2', 'choujiang/log_status', '0', '', '幸运抽奖', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('4503', '币种管理', '4500', '2', 'choujiang/coinlist', '0', '', '幸运抽奖', '0', 'globe');
  INSERT INTO `move_sys_menu` VALUES ('45031', '编辑添加', '4503', '1', 'choujiang/coinlist_edit', '0', '', '幸运抽奖', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('45032', '修改状态', '4503', '2', 'choujiang/coinlisy_status', '0', '', '幸运抽奖', '0', 'globe');


--
--
-- INSERT INTO `move_sys_menu` VALUES ('4600', '鸡生蛋', '0', '0', 'egg/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('4601', '我的鸡场', '4600', '1', 'egg/index', '0', '', '鸡生蛋', '0', 'globe');
--   INSERT INTO `move_sys_menu` VALUES ('46011', '编辑添加', '4601', '1', 'egg/edit', '0', '', '鸡生蛋', '0', 'globe');
-- 	INSERT INTO `move_sys_menu` VALUES ('46012', '修改状态', '4601', '2', 'egg/status', '0', '', '鸡生蛋', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('4602', '鸡蛋市场', '4600', '2', 'egg/market', '0', '', '鸡生蛋', '0', 'globe');
--   INSERT INTO `move_sys_menu` VALUES ('46021', '编辑添加', '4602', '1', 'egg/market_edit', '0', '', '鸡生蛋', '0', 'globe');
-- 	INSERT INTO `move_sys_menu` VALUES ('46022', '修改状态', '4602', '2', 'egg/market_status', '0', '', '鸡生蛋', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('4603', '交易记录', '4600', '3', 'egg/log', '0', '', '鸡生蛋', '0', 'globe');
-- INSERT INTO `move_sys_menu` VALUES ('4604', '鸡场记录', '4600', '4', 'egg/farm', '0', '', '鸡生蛋', '0', 'globe');


INSERT INTO `move_sys_menu` VALUES ('4700', '财产排名', '0', '0', 'paiming/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('4701', '财产排名', '4700', '0', 'paiming/index', '0', '', '财产排名', '0', '');


INSERT INTO `move_sys_menu` VALUES ('4800', '动说收款宝', '0', '0', 'eyuyan/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('4801', '收款宝配置', '4800', '0', 'eyuyan/index', '0', '', '动说收款宝', '0', '');
INSERT INTO `move_sys_menu` VALUES ('4802', '收款宝记录', '4800', '0', 'eyuyan/log', '0', '', '动说收款宝', '0', '');
	INSERT INTO `move_sys_menu` VALUES ('48021', '修改状态', '4802', '2', 'eyuyan/log_status', '0', '', '动说收款宝', '0', '');



INSERT INTO `move_sys_menu` VALUES ('4900', '代理管理', '0', '0', 'daili/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('4901', '代理管理', '4900', '0', 'daili/index', '0', '', '代理管理', '0', '');
  INSERT INTO `move_sys_menu` VALUES ('49011', '编辑添加', '4901', '1', 'daili/edit', '0', '', '代理管理', '0', '');
	INSERT INTO `move_sys_menu` VALUES ('49012', '修改状态', '4901', '2', 'daili/status', '0', '', '代理管理', '0', '');
INSERT INTO `move_sys_menu` VALUES ('4902', '充值记录', '4900', '0', 'daili/log', '0', '', '代理管理', '0', '');
INSERT INTO `move_sys_menu` VALUES ('4903', '推荐记录', '4900', '0', 'daili/invit', '0', '', '代理管理', '0', '');






INSERT INTO `move_sys_menu` VALUES ('5100', '移动APP', '0', '0', 'app/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('5101', '移动APP', '5100', '0', 'app/index', '0', '', '移动APP', '0', '');

INSERT INTO `move_sys_menu` VALUES ('5200', '微博管理', '0', '0', 'weibo/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('5201', '微博管理', '5200', '0', 'weibo/index', '0', '', '微博管理', '0', '');


--
-- INSERT INTO `move_sys_menu` VALUES ('5500', '活动管理', '0', '0', 'huodong/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('5501', '活动管理', '5500', '0', 'huodong/index', '0', '', '活动管理', '0', '');

-- INSERT INTO `move_sys_menu` VALUES ('5600', '国际管理', '0', '0', 'guoji/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('5601', '国际管理', '5600', '0', 'guoji/index', '0', '', '国际管理', '0', '');

-- INSERT INTO `move_sys_menu` VALUES ('5700', '文档管理', '0', '0', 'doc/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('5701', '文档管理', '5700', '0', 'doc/index', '0', '', '文档管理', '0', '');

INSERT INTO `move_sys_menu` VALUES ('5800', 'API管理', '0', '0', 'api/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('5801', 'API管理', '5800', '0', 'api/index', '0', '', 'API管理', '0', '');
INSERT INTO `move_sys_menu` VALUES ('5802', 'API记录', '5800', '2', 'api/log', '0', '', 'API管理', '0', 'share');
	INSERT INTO `move_sys_menu` VALUES ('58021', '编辑添加', '5802', '1', 'api/log_edit', '1', '', 'API管理', '0', 'share');
	INSERT INTO `move_sys_menu` VALUES ('58022', '修改状态', '5802', '2', 'api/log_status', '1', '', 'API管理', '0', 'share');

INSERT INTO `move_sys_menu` VALUES ('5900', '持有认购	', '0', '0', 'hold/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('5901', '持有认购	', '5900', '1', 'hold/index', '0', '', '持有认购	', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('59011', '编辑添加', '5901', '1', 'hold/edit', '1', '', '持有认购	', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('59012', '修改状态', '5901', '2', 'hold/status', '1', '', '持有认购	', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('59013', '结算认购', '5901', '2', 'hold/end_rengou', '1', '', '持有认购	', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('5902', '认购记录', '5900', '2', 'hold/log', '0', '', '持有认购	', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('5903', '认购赠送', '5900', '3', 'hold/invit', '0', '', '持有认购	', '0', 'globe');


INSERT INTO `move_sys_menu` VALUES ('6000', '币种模块	', '0', '0', 'coin/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('6001', '币种管理', '6000', '1', 'coin/index', '0', '', '币种模块', '0', 'share');
	INSERT INTO `move_sys_menu` VALUES ('60011', '编辑添加', '6001', '1', 'coin/edit', '1', '', '币种模块', '0', 'share');
	INSERT INTO `move_sys_menu` VALUES ('60012', '修改状态', '6001', '2', 'coin/status', '1', '', '币种模块', '0', 'share');
	INSERT INTO `move_sys_menu` VALUES ('60013', '查看钱包', '6001', '3', 'coin/info', '1', '', '币种模块', '0', 'share');
INSERT INTO `move_sys_menu` VALUES ('6005', '默认币种', '6000', '2', 'coin/mr', '0', '', '币种模块', '0', 'home');


INSERT INTO `move_sys_menu` VALUES ('6002', '评价币种', '6000', '3', 'coin/discu', '0', '', '币种模块', '0', 'share');
	INSERT INTO `move_sys_menu` VALUES ('60021', '编辑添加', '6002', '1', 'coin/discu_edit', '1', '', '币种模块', '0', 'share');
	INSERT INTO `move_sys_menu` VALUES ('60022', '修改状态', '6002', '2', 'coin/discu_status', '1', '', '币种模块', '0', 'share');
INSERT INTO `move_sys_menu` VALUES ('6003', '币种链接', '6000', '4', 'coin/link', '0', '', '币种模块', '0', 'stats');
	INSERT INTO `move_sys_menu` VALUES ('60031', '编辑添加', '6003', '1', 'coin/link_edit', '1', '', '币种模块', '0', 'share');
	INSERT INTO `move_sys_menu` VALUES ('60032', '修改状态', '6003', '2', 'coin/link_status', '1', '', '币种模块', '0', 'share');
INSERT INTO `move_sys_menu` VALUES ('6004', '币种统计', '6000', '5', 'coin/stats', '0', '', '币种模块', '0', 'home');


INSERT INTO `move_sys_menu` VALUES ('6100', 'PUSH资产	', '0', '0', 'push/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('6101', 'PUSH配置', '6100', '1', 'push/index', '0', '', 'PUSH配置', '0', 'share');
	INSERT INTO `move_sys_menu` VALUES ('61011', '编辑添加', '6101', '1', 'push/edit', '1', '', 'PUSH配置', '0', 'share');
	INSERT INTO `move_sys_menu` VALUES ('61012', '修改状态', '6101', '2', 'push/status', '1', '', 'PUSH配置', '0', 'share');
INSERT INTO `move_sys_menu` VALUES ('6102', 'PUSH记录', '6100', '2', 'push/log', '0', '', 'PUSH配置', '0', 'share');
	INSERT INTO `move_sys_menu` VALUES ('61021', '编辑添加', '6102', '1', 'push/edit', '1', '', 'PUSH配置', '0', 'share');
	INSERT INTO `move_sys_menu` VALUES ('61022', '修改状态', '6102', '2', 'push/status', '1', '', 'PUSH配置', '0', 'share');


INSERT INTO `move_sys_menu` VALUES ('6200', '华盈认购', '0', '0', 'hyissue/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('6201', '认购管理', '6200', '1', 'hyissue/index', '0', '', '华盈认购', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('62011', '编辑添加', '6201', '1', 'hyissue/edit', '1', '', '华盈认购', '0', 'globe');
	INSERT INTO `move_sys_menu` VALUES ('62012', '修改状态', '6201', '2', 'hyissue/status', '1', '', '华盈认购', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('6202', '认购记录', '6200', '2', 'hyissue/log', '0', '', '华盈认购', '0', 'globe');
INSERT INTO `move_sys_menu` VALUES ('6203', '认购赠送', '6200', '3', 'hyissue/invit', '0', '', '华盈认购', '0', 'globe');


INSERT INTO `move_sys_menu` VALUES ('6300', '工单中心', '0', '0', 'help/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('6301', '问题中心', '6300', '8', 'help/index', '0', '', '工单中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('63011', '编辑添加', '6301', '1', 'help/edit', '1', '', '工单中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('63012', '修改状态', '6301', '2', 'help/status', '1', '', '工单中心', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('6302', '问题类型', '6300', '9', 'help/type', '0', '', '工单中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('63021', '编辑添加', '6302', '1', 'help/type_edit', '1', '', '工单中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('63022', '修改状态', '6302', '2', 'help/type_status', '1', '', '工单中心', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('6303', '消息管理', '6300', '10', 'help/news', '0', '', '工单中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('63031', '编辑添加', '6303', '1', 'help/news_edit', '1', '', '工单中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('63032', '修改状态', '6303', '2', 'help/news_status', '1', '', '工单中心', '0', 'list-alt');

INSERT INTO `move_sys_menu` VALUES ('6500', '交流中心', '0', '0', 'bbs/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('6501', '话题中心', '6500', '1', 'bbs/index', '0', '', '交流中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('65011', '编辑添加', '6501', '1', 'bbs/edit', '1', '', '交流中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('65012', '修改状态', '6501', '2', 'bbs/status', '1', '', '交流中心', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('6502', '话题类型', '6500', '2', 'bbs/type', '0', '', '交流中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('65021', '编辑添加', '6502', '1', 'bbs/type_edit', '1', '', '交流中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('65022', '修改状态', '6502', '2', 'bbs/type_status', '1', '', '交流中心', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('6503', '文章管理', '6500', '3', 'bbs/act', '0', '', '交流中心', '0', 'list-alt');
  INSERT INTO `move_sys_menu` VALUES ('65031', '编辑添加', '6503', '1', 'bbs/act_edit', '1', '', '交流中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('65032', '修改状态', '6503', '2', 'bbs/act_status', '1', '', '交流中心', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('6504', '评论管理', '6500', '4', 'bbs/disc', '0', '', '交流中心', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('6505', '用户管理', '6500', '5', 'bbs/user', '0', '', '交流中心', '0', 'list-alt');
  INSERT INTO `move_sys_menu` VALUES ('65051', '编辑添加', '6505', '1', 'bbs/user_edit', '1', '', '交流中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('65052', '修改状态', '6505', '2', 'bbs/user_status', '1', '', '交流中心', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('6506', 'BBS配置', '6500', '6', 'bbs/config', '0', '', '交流中心', '0', 'list-alt');

INSERT INTO `move_sys_menu` VALUES ('6600', '分红中心', '0', '0', 'fenhong98/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('6601', '分红管理', '6600', '1', 'fenhong98/index', '0', '', '分红中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('66011', '编辑添加', '6601', '1', 'fenhong98/edit', '1', '', '分红中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('66012', '修改状态', '6601', '2', 'fenhong98/status', '1', '', '分红中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('66013', '开始分红', '6601', '3', 'fenhong98/kaishi', '1', '', '分红中心', '0', 'list-alt');

INSERT INTO `move_sys_menu` VALUES ('6603', '分红记录', '6600', '2', 'fenhong98/fenhonglog', '0', '', '分红中心', '0', 'list-alt');
  INSERT INTO `move_sys_menu` VALUES ('66031', '编辑添加', '6603', '1', 'fenhong98/fenhonglog_edit', '1', '', '分红中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('66032', '修改状态', '6603', '2', 'fenhong98/fenhonglog_status', '1', '', '分红中心', '0', 'list-alt');

INSERT INTO `move_sys_menu` VALUES ('6602', '分红池管理', '6600', '3', 'fenhong98/pool', '0', '', '分红中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('66021', '编辑添加', '6602', '1', 'fenhong98/pool_edit', '1', '', '分红中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('66022', '修改状态', '6602', '2', 'fenhong98/pool_status', '1', '', '分红中心', '0', 'list-alt');

INSERT INTO `move_sys_menu` VALUES ('6604', '分红池记录', '6600', '5', 'fenhong98/poollog', '0', '', '分红中心', '0', 'list-alt');
  INSERT INTO `move_sys_menu` VALUES ('66051', '编辑添加', '6604', '1', 'fenhong98/poollog_edit', '1', '', '分红中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('66052', '修改状态', '6604', '2', 'fenhong98/poollog_status', '1', '', '分红中心', '0', 'list-alt');

INSERT INTO `move_sys_menu` VALUES ('6700', '分红中心', '0', '0', 'fenhong_tsb/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('6701', '分红管理', '6700', '1', 'fenhong_tsb/index', '0', '', '新分红中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('67011', '编辑添加', '6701', '1', 'fenhong_tsb/edit', '1', '', '新分红中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('67012', '修改状态', '6701', '2', 'fenhong_tsb/status', '1', '', '新分红中心', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('6702', '分红比例管理', '6700', '2', 'fenhong_tsb/bili', '1', '', '新分红中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('67021', '编辑添加', '6702', '1', 'fenhong_tsb/bili_edit', '1', '', '新分红中心', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('67022', '修改状态', '6702', '2', 'fenhong_tsb/bili_status', '1', '', '新分红中心', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('6703', '分红记录', '6700', '3', 'fenhong_tsb/log', '0', '', '新分红中心', '0', 'list-alt');

-- INSERT INTO `move_sys_menu` VALUES ('6800', '返现大厅', '0', '0', 'back_cny/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('6801', '返现管理', '6800', '1', 'back_cny/index', '0', '', '返现大厅', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('68011', '编辑添加', '6801', '1', 'back_cny/edit', '1', '', '返现大厅', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('68012', '修改状态', '6801', '2', 'back_cny/status', '1', '', '返现大厅', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('6802', '返现记录', '6800', '2', 'back_cny/log', '0', '', '返现大厅', '0', 'list-alt');

INSERT INTO `move_sys_menu` VALUES ('6900', 'PUSH集市', '0', '0', 'push_js/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('6901', 'PUSH集市', '6900', '2', 'push_js/push', '0', '', 'PUSH集市', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('6902', 'PUSH管理', '6900', '1', 'push_js/index', '0', '', 'PUSH集市', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('69021', '编辑添加', '6902', '1', 'push_js/edit', '1', '', 'PUSH集市', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('69022', '修改状态', '6902', '2', 'push_js/status', '1', '', 'PUSH集市', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('6903', 'PUSH记录', '6900', '3', 'push_js/log', '0', '', 'PUSH集市', '0', 'list-alt');

--
-- INSERT INTO `move_sys_menu` VALUES ('7000', 'ICO众筹', '0', '0', 'ico/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('7001', 'ICO众筹', '7000', '1', 'ico/index', '0', '', 'ICO众筹', '0', 'list-alt');
--   INSERT INTO `move_sys_menu` VALUES ('70011', '编辑添加', '7001', '1', 'ico/edit', '1', '', 'ICO众筹', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('70012', '修改状态', '7001', '2', 'ico/status', '1', '', 'ICO众筹', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7002', '回报管理', '7000', '2', 'ico/bili', '1', '', 'ICO众筹', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('70021', '编辑添加', '7002', '1', 'ico/bili_edit', '1', '', 'ICO众筹', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('70022', '修改状态', '7002', '2', 'ico/bili_status', '1', '', 'ICO众筹', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7003', '众筹记录', '7000', '3', 'ico/log', '0', '', 'ICO众筹', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7004', '分发回报', '7000', '4', 'ico/send', '1', '', 'ICO众筹', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7005', '撤销项目', '7000', '5', 'ico/chexiao', '1', '', 'ICO众筹', '0', 'list-alt');

--
-- INSERT INTO `move_sys_menu` VALUES ('7100', '新闻中心', '0', '0', 'news/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('7101', '新闻中心', '7100', '1', 'news/index', '0', '', '新闻中心', '0', 'list-alt');
--
--
--
-- INSERT INTO `move_sys_menu` VALUES ('7400', '便捷订餐', '0', '0', 'dingcan/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('7401', '餐品管理', '7400', '1', 'dingcan/index', '0', '', '便捷订餐', '0', 'list-alt');
--   INSERT INTO `move_sys_menu` VALUES ('74011', '编辑添加', '7401', '1', 'dingcan/edit', '1', '', '便捷订餐', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('74012', '修改状态', '7401', '2', 'dingcan/status', '1', '', '便捷订餐', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7402', '商家管理', '7400', '2', 'dingcan/seller', '0', '', '便捷订餐', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('74021', '编辑添加', '7402', '1', 'dingcan/seller_edit', '1', '', '便捷订餐', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('74022', '修改状态', '7402', '2', 'dingcan/seller_status', '1', '', '便捷订餐', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7403', '餐品类型1', '7400', '3', 'dingcan/type', '0', '', '便捷订餐', '0', 'list-alt');
--   INSERT INTO `move_sys_menu` VALUES ('74031', '编辑添加', '7403', '1', 'dingcan/type_edit', '1', '', '便捷订餐', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('74032', '修改状态', '7403', '2', 'dingcan/type_status', '1', '', '便捷订餐', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7405', '餐品类型1', '7400', '4', 'dingcan/type_list', '0', '', '便捷订餐', '0', 'list-alt');
--   INSERT INTO `move_sys_menu` VALUES ('74051', '编辑添加', '7405', '1', 'dingcan/type_list_edit', '1', '', '便捷订餐', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('74052', '修改状态', '7405', '2', 'dingcan/type_list_status', '1', '', '便捷订餐', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7406', '餐品图片', '7400', '5', 'dingcan/img', '1', '', '便捷订餐', '0', 'list-alt');
--   INSERT INTO `move_sys_menu` VALUES ('74061', '编辑添加', '7406', '1', 'dingcan/img_edit', '1', '', '便捷订餐', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('74062', '修改状态', '7406', '2', 'dingcan/img_status', '1', '', '便捷订餐', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7407', '地址管理', '7400', '6', 'dingcan/addr', '1', '', '便捷订餐', '0', 'list-alt');
--   INSERT INTO `move_sys_menu` VALUES ('74071', '编辑添加', '7407', '1', 'dingcan/addr_edit', '1', '', '便捷订餐', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('74072', '修改状态', '7407', '2', 'dingcan/addr_status', '1', '', '便捷订餐', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7408', '消费记录', '7400', '7', 'dingcan/log', '0', '', '便捷订餐', '0', 'list-alt');
--
-- INSERT INTO `move_sys_menu` VALUES ('7500', '分区导航', '0', '0', 'cen_qu/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('7501', '导航管理', '7500', '1', 'cen_qu/index', '0', '', '分区导航', '0', 'list-alt');
--   INSERT INTO `move_sys_menu` VALUES ('75011', '编辑添加', '7501', '1', 'cen_qu/cen_qu_edit', '1', '', '分区导航', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('75012', '修改状态', '7501', '2', 'cen_qu/status', '1', '', '分区导航', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7502', '分类管理', '7500', '2', 'cen_qu/type', '0', '', '分区导航', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('75021', '编辑添加', '7502', '1', 'cen_qu/type_edit', '1', '', '分区导航', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('75022', '修改状态', '7502', '2', 'cen_qu/type_status', '1', '', '分区导航', '0', 'list-alt');

INSERT INTO `move_sys_menu` VALUES ('7600', '幸运砸蛋', '0', '0', 'luck/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('7601', '幸运砸蛋', '7600', '1', 'luck/index', '0', '', '幸运砸蛋', '0', 'list-alt');
  INSERT INTO `move_sys_menu` VALUES ('76011', '编辑添加', '7601', '1', 'luck/edit', '1', '', '幸运砸蛋', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('76012', '修改状态', '7601', '2', 'luck/status', '1', '', '幸运砸蛋', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('7602', '砸蛋记录', '7600', '2', 'luck/log', '0', '', '幸运砸蛋', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('7603', '功能配置', '7600', '3', 'luck/config', '0', '', '幸运砸蛋', '0', 'list-alt');
--
-- INSERT INTO `move_sys_menu` VALUES ('7700', 'ICO众筹(独立版)', '0', '0', 'ico_s/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('7701', 'ICO众筹(独立版)', '7700', '1', 'ico_s/index', '0', '', 'ICO众筹(独立版)', '0', 'list-alt');
--   INSERT INTO `move_sys_menu` VALUES ('77011', '编辑添加', '7701', '1', 'ico_s/edit', '1', '', 'ICO众筹(独立版)', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('77012', '修改状态', '7701', '2', 'ico_s/status', '1', '', 'ICO众筹(独立版)', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7702', '回报管理', '7700', '2', 'ico_s/bili', '1', '', 'ICO众筹(独立版)', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('77021', '编辑添加', '7702', '1', 'ico_s/bili_edit', '1', '', 'ICO众筹(独立版)', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('77022', '修改状态', '7702', '2', 'ico_s/bili_status', '1', '', 'ICO众筹(独立版)', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7703', '众筹记录', '7700', '3', 'ico_s/log', '0', '', 'ICO众筹(独立版)', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7704', '分发回报', '7700', '4', 'ico_s/send', '1', '', 'ICO众筹(独立版)', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7705', '撤销项目', '7700', '5', 'ico_s/chexiao', '1', '', 'ICO众筹(独立版)', '0', 'list-alt');
--
-- INSERT INTO `move_sys_menu` VALUES ('7800', 'ICO众筹(定制版)', '0', '0', 'ico_y/index', '1', '', '', '0', '');
-- INSERT INTO `move_sys_menu` VALUES ('7801', 'ICO众筹(定制版)', '7800', '1', 'ico_y/index', '0', '', 'ICO众筹(定制版)', '0', 'list-alt');
--   INSERT INTO `move_sys_menu` VALUES ('78011', '编辑添加', '7801', '1', 'ico_y/edit', '1', '', 'ICO众筹(定制版)', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('78012', '修改状态', '7801', '2', 'ico_y/status', '1', '', 'ICO众筹(定制版)', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7802', '回报管理', '7800', '2', 'ico_y/bili', '1', '', 'ICO众筹(定制版)', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('78021', '编辑添加', '7802', '1', 'ico_y/bili_edit', '1', '', 'ICO众筹(定制版)', '0', 'list-alt');
-- 	INSERT INTO `move_sys_menu` VALUES ('78022', '修改状态', '7802', '2', 'ico_y/bili_status', '1', '', 'ICO众筹(定制版)', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7803', '众筹记录', '7800', '3', 'ico_y/log', '0', '', 'ICO众筹(定制版)', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7804', '分发回报', '7800', '4', 'ico_y/send', '1', '', 'ICO众筹(定制版)', '0', 'list-alt');
-- INSERT INTO `move_sys_menu` VALUES ('7805', '撤销项目', '7800', '5', 'ico_y/chexiao', '1', '', 'ICO众筹(定制版)', '0', 'list-alt');

INSERT INTO `move_sys_menu` VALUES ('7900', '分享送币', '0', '0', 'share/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('7901', '分享送币', '7900', '1', 'share/index', '0', '', '分享送币', '0', 'list-alt');
  INSERT INTO `move_sys_menu` VALUES ('79011', '编辑添加', '7901', '1', 'share/edit', '1', '', '分享送币', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('79012', '修改状态', '7901', '2', 'share/status', '1', '', '分享送币', '0', 'list-alt');
  INSERT INTO `move_sys_menu` VALUES ('79013', '分发奖励', '7901', '3', 'share/reward', '1', '', '分享送币', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('7902', '分享地址', '7900', '2', 'share/user_addr', '0', '', '分享送币', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('7903', '分享记录', '7900', '3', 'share/log', '0', '', '分享送币', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('7904', '奖励发放记录', '7900', '4', 'share/reward_log', '0', '', '分享送币', '0', 'list-alt');

INSERT INTO `move_sys_menu` VALUES ('8000', '摇一摇送币', '0', '0', 'shake/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('8001', '送币设置', '8000', '1', 'shake/index', '0', '', '摇一摇送币', '0', 'list-alt');
  INSERT INTO `move_sys_menu` VALUES ('80011', '编辑添加', '8001', '1', 'shake/edit', '1', '', '摇一摇送币', '0', 'list-alt');
	INSERT INTO `move_sys_menu` VALUES ('80012', '修改状态', '8001', '2', 'shake/status', '1', '', '摇一摇送币', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('8002', '访问设置', '8000', '2', 'shake/baseconfig', '0', '', '摇一摇送币', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('8003', '用户列表', '8000', '2', 'shake/user', '0', '', '摇一摇送币', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('8004', '摇币记录', '8000', '3', 'shake/mine_log', '0', '', '摇一摇送币', '0', 'list-alt');

INSERT INTO `move_sys_menu` VALUES ('9100', 'C2C交易', '0', '0', 'c2c/index', '1', '', '', '0', '');
INSERT INTO `move_sys_menu` VALUES ('9101', 'C2C挂单', '9100', '1', 'c2c/index', '0', '', 'C2C交易', '0', 'list-alt');
   INSERT INTO `move_sys_menu` VALUES ('91011', 'C2C挂单审核', '9101', '1', 'c2c/edit', '1', '', 'C2C交易', '0', 'list-alt');
   INSERT INTO `move_sys_menu` VALUES ('91012', '挂单状态修改', '9101', '2', 'c2c/status', '1', '', 'C2C交易', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('9102', 'C2C交易区', '9100', '2', 'c2c/qu', '0', '', 'C2C交易', '0', 'list-alt');
	 INSERT INTO `move_sys_menu` VALUES ('91021', 'C2C交易区编辑', '9102', '1', 'c2c/qu_edit', '1', '', 'C2C交易', '0', 'list-alt');
	 INSERT INTO `move_sys_menu` VALUES ('91022', 'C2C交易区状态', '9102', '2', 'c2c/qu_status', '1', '', 'C2C交易', '0', 'list-alt');
INSERT INTO `move_sys_menu` VALUES ('9103', 'C2C记录', '9100', '3', 'c2c/log', '0', '', 'C2C交易', '0', 'list-alt');
	 INSERT INTO `move_sys_menu` VALUES ('91031', '强制确认', '9103', '1', 'c2c/sure', '1', '', 'C2C交易', '0', 'list-alt');
	 INSERT INTO `move_sys_menu` VALUES ('91032', '强制取消', '9103', '2', 'c2c/cancel', '1', '', 'C2C交易', '0', 'list-alt');



INSERT INTO `move_sys_menu` VALUES ('10000', 'OTC市场', '0', '0', 'otc/index', '1', '', '', '0', 'stats');
INSERT INTO `move_sys_menu` VALUES ('10101', 'OTC市场', '10000', '1', 'otc/index', '0', '', '市场管理', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('101001', '编辑添加', '10101', '1', 'otc/edit', '1', '', '市场管理', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('101002', '修改状态', '10101', '2', 'otc/status', '1', '', '市场管理', '0', 'cog');
INSERT INTO `move_sys_menu` VALUES ('10102', 'OTC市场分区', '10000', '2', 'otc/area', '0', '', '市场管理', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('101021', '编辑添加', '10102', '1', 'otc/area_edit', '1', '', '市场管理', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('101022', '修改状态', '10102', '2', 'otc/area_status', '1', '', '市场管理', '0', 'cog');
INSERT INTO `move_sys_menu` VALUES ('10103', 'OTC交易订单', '10000', '3', 'otc/log', '0', '', '市场管理', '0', 'cog');
  INSERT INTO `move_sys_menu` VALUES ('101031', '取消交易', '10103', '1', 'otc/chexiao', '1', '', '市场管理', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('101032', '资金已到账', '10103', '2', 'otc/paymoney', '1', '', '市场管理', '0', 'cog');
INSERT INTO `move_sys_menu` VALUES ('10104', 'OTC市场币种', '10000', '4', 'otc/coin', '0', '', '市场管理', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('101041', '编辑添加', '10104', '1', 'otc/coin_edit', '1', '', '市场管理', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('101042', '修改状态', '10104', '2', 'otc/coin_status', '1', '', '市场管理', '0', 'cog');
INSERT INTO `move_sys_menu` VALUES ('10105', 'OTC付款方式', '10000', '4', 'otc/payway', '0', '', '市场管理', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('101051', '编辑添加', '10104', '1', 'otc/payway_edit', '1', '', '市场管理', '0', 'cog');
	INSERT INTO `move_sys_menu` VALUES ('101052', '修改状态', '10104', '2', 'otc/payway_status', '1', '', '市场管理', '0', 'cog');

