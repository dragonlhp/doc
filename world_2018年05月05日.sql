/*
 Navicat Premium Data Transfer

 Source Server         : local
 Source Server Type    : MySQL
 Source Server Version : 50638
 Source Host           : localhost:3306
 Source Schema         : world

 Target Server Type    : MySQL
 Target Server Version : 50638
 File Encoding         : 65001

 Date: 05/05/2018 23:12:11
*/

SET NAMES utf8mb4;
SET FOREIGN_KEY_CHECKS = 0;

-- ----------------------------
-- Table structure for dp_admin_access
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_access`;
CREATE TABLE `dp_admin_access` (
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模型名称',
  `group` varchar(16) NOT NULL DEFAULT '' COMMENT '权限分组标识',
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `nid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '授权节点id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='统一授权表';

-- ----------------------------
-- Table structure for dp_admin_action
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_action`;
CREATE TABLE `dp_admin_action` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '所属模块名',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '行为标题',
  `remark` varchar(128) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=100 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统行为表';

-- ----------------------------
-- Records of dp_admin_action
-- ----------------------------
BEGIN;
INSERT INTO `dp_admin_action` VALUES (1, 'user', 'user_add', '添加用户', '添加用户', '', '[user|get_nickname] 添加了用户：[record|get_nickname]', 1, 1480156399, 1480163853);
INSERT INTO `dp_admin_action` VALUES (2, 'user', 'user_edit', '编辑用户', '编辑用户', '', '[user|get_nickname] 编辑了用户：[details]', 1, 1480164578, 1480297748);
INSERT INTO `dp_admin_action` VALUES (3, 'user', 'user_delete', '删除用户', '删除用户', '', '[user|get_nickname] 删除了用户：[details]', 1, 1480168582, 1480168616);
INSERT INTO `dp_admin_action` VALUES (4, 'user', 'user_enable', '启用用户', '启用用户', '', '[user|get_nickname] 启用了用户：[details]', 1, 1480169185, 1480169185);
INSERT INTO `dp_admin_action` VALUES (5, 'user', 'user_disable', '禁用用户', '禁用用户', '', '[user|get_nickname] 禁用了用户：[details]', 1, 1480169214, 1480170581);
INSERT INTO `dp_admin_action` VALUES (6, 'user', 'user_access', '用户授权', '用户授权', '', '[user|get_nickname] 对用户：[record|get_nickname] 进行了授权操作。详情：[details]', 1, 1480221441, 1480221563);
INSERT INTO `dp_admin_action` VALUES (7, 'user', 'role_add', '添加角色', '添加角色', '', '[user|get_nickname] 添加了角色：[details]', 1, 1480251473, 1480251473);
INSERT INTO `dp_admin_action` VALUES (8, 'user', 'role_edit', '编辑角色', '编辑角色', '', '[user|get_nickname] 编辑了角色：[details]', 1, 1480252369, 1480252369);
INSERT INTO `dp_admin_action` VALUES (9, 'user', 'role_delete', '删除角色', '删除角色', '', '[user|get_nickname] 删除了角色：[details]', 1, 1480252580, 1480252580);
INSERT INTO `dp_admin_action` VALUES (10, 'user', 'role_enable', '启用角色', '启用角色', '', '[user|get_nickname] 启用了角色：[details]', 1, 1480252620, 1480252620);
INSERT INTO `dp_admin_action` VALUES (11, 'user', 'role_disable', '禁用角色', '禁用角色', '', '[user|get_nickname] 禁用了角色：[details]', 1, 1480252651, 1480252651);
INSERT INTO `dp_admin_action` VALUES (12, 'user', 'attachment_enable', '启用附件', '启用附件', '', '[user|get_nickname] 启用了附件：附件ID([details])', 1, 1480253226, 1480253332);
INSERT INTO `dp_admin_action` VALUES (13, 'user', 'attachment_disable', '禁用附件', '禁用附件', '', '[user|get_nickname] 禁用了附件：附件ID([details])', 1, 1480253267, 1480253340);
INSERT INTO `dp_admin_action` VALUES (14, 'user', 'attachment_delete', '删除附件', '删除附件', '', '[user|get_nickname] 删除了附件：附件ID([details])', 1, 1480253323, 1480253323);
INSERT INTO `dp_admin_action` VALUES (15, 'admin', 'config_add', '添加配置', '添加配置', '', '[user|get_nickname] 添加了配置，[details]', 1, 1480296196, 1480296196);
INSERT INTO `dp_admin_action` VALUES (16, 'admin', 'config_edit', '编辑配置', '编辑配置', '', '[user|get_nickname] 编辑了配置：[details]', 1, 1480296960, 1480296960);
INSERT INTO `dp_admin_action` VALUES (17, 'admin', 'config_enable', '启用配置', '启用配置', '', '[user|get_nickname] 启用了配置：[details]', 1, 1480298479, 1480298479);
INSERT INTO `dp_admin_action` VALUES (18, 'admin', 'config_disable', '禁用配置', '禁用配置', '', '[user|get_nickname] 禁用了配置：[details]', 1, 1480298506, 1480298506);
INSERT INTO `dp_admin_action` VALUES (19, 'admin', 'config_delete', '删除配置', '删除配置', '', '[user|get_nickname] 删除了配置：[details]', 1, 1480298532, 1480298532);
INSERT INTO `dp_admin_action` VALUES (20, 'admin', 'database_export', '备份数据库', '备份数据库', '', '[user|get_nickname] 备份了数据库：[details]', 1, 1480298946, 1480298946);
INSERT INTO `dp_admin_action` VALUES (21, 'admin', 'database_import', '还原数据库', '还原数据库', '', '[user|get_nickname] 还原了数据库：[details]', 1, 1480301990, 1480302022);
INSERT INTO `dp_admin_action` VALUES (22, 'admin', 'database_optimize', '优化数据表', '优化数据表', '', '[user|get_nickname] 优化了数据表：[details]', 1, 1480302616, 1480302616);
INSERT INTO `dp_admin_action` VALUES (23, 'admin', 'database_repair', '修复数据表', '修复数据表', '', '[user|get_nickname] 修复了数据表：[details]', 1, 1480302798, 1480302798);
INSERT INTO `dp_admin_action` VALUES (24, 'admin', 'database_backup_delete', '删除数据库备份', '删除数据库备份', '', '[user|get_nickname] 删除了数据库备份：[details]', 1, 1480302870, 1480302870);
INSERT INTO `dp_admin_action` VALUES (25, 'admin', 'hook_add', '添加钩子', '添加钩子', '', '[user|get_nickname] 添加了钩子：[details]', 1, 1480303198, 1480303198);
INSERT INTO `dp_admin_action` VALUES (26, 'admin', 'hook_edit', '编辑钩子', '编辑钩子', '', '[user|get_nickname] 编辑了钩子：[details]', 1, 1480303229, 1480303229);
INSERT INTO `dp_admin_action` VALUES (27, 'admin', 'hook_delete', '删除钩子', '删除钩子', '', '[user|get_nickname] 删除了钩子：[details]', 1, 1480303264, 1480303264);
INSERT INTO `dp_admin_action` VALUES (28, 'admin', 'hook_enable', '启用钩子', '启用钩子', '', '[user|get_nickname] 启用了钩子：[details]', 1, 1480303294, 1480303294);
INSERT INTO `dp_admin_action` VALUES (29, 'admin', 'hook_disable', '禁用钩子', '禁用钩子', '', '[user|get_nickname] 禁用了钩子：[details]', 1, 1480303409, 1480303409);
INSERT INTO `dp_admin_action` VALUES (30, 'admin', 'menu_add', '添加节点', '添加节点', '', '[user|get_nickname] 添加了节点：[details]', 1, 1480305468, 1480305468);
INSERT INTO `dp_admin_action` VALUES (31, 'admin', 'menu_edit', '编辑节点', '编辑节点', '', '[user|get_nickname] 编辑了节点：[details]', 1, 1480305513, 1480305513);
INSERT INTO `dp_admin_action` VALUES (32, 'admin', 'menu_delete', '删除节点', '删除节点', '', '[user|get_nickname] 删除了节点：[details]', 1, 1480305562, 1480305562);
INSERT INTO `dp_admin_action` VALUES (33, 'admin', 'menu_enable', '启用节点', '启用节点', '', '[user|get_nickname] 启用了节点：[details]', 1, 1480305630, 1480305630);
INSERT INTO `dp_admin_action` VALUES (34, 'admin', 'menu_disable', '禁用节点', '禁用节点', '', '[user|get_nickname] 禁用了节点：[details]', 1, 1480305659, 1480305659);
INSERT INTO `dp_admin_action` VALUES (35, 'admin', 'module_install', '安装模块', '安装模块', '', '[user|get_nickname] 安装了模块：[details]', 1, 1480307558, 1480307558);
INSERT INTO `dp_admin_action` VALUES (36, 'admin', 'module_uninstall', '卸载模块', '卸载模块', '', '[user|get_nickname] 卸载了模块：[details]', 1, 1480307588, 1480307588);
INSERT INTO `dp_admin_action` VALUES (37, 'admin', 'module_enable', '启用模块', '启用模块', '', '[user|get_nickname] 启用了模块：[details]', 1, 1480307618, 1480307618);
INSERT INTO `dp_admin_action` VALUES (38, 'admin', 'module_disable', '禁用模块', '禁用模块', '', '[user|get_nickname] 禁用了模块：[details]', 1, 1480307653, 1480307653);
INSERT INTO `dp_admin_action` VALUES (39, 'admin', 'module_export', '导出模块', '导出模块', '', '[user|get_nickname] 导出了模块：[details]', 1, 1480307682, 1480307682);
INSERT INTO `dp_admin_action` VALUES (40, 'admin', 'packet_install', '安装数据包', '安装数据包', '', '[user|get_nickname] 安装了数据包：[details]', 1, 1480308342, 1480308342);
INSERT INTO `dp_admin_action` VALUES (41, 'admin', 'packet_uninstall', '卸载数据包', '卸载数据包', '', '[user|get_nickname] 卸载了数据包：[details]', 1, 1480308372, 1480308372);
INSERT INTO `dp_admin_action` VALUES (42, 'admin', 'system_config_update', '更新系统设置', '更新系统设置', '', '[user|get_nickname] 更新了系统设置：[details]', 1, 1480309555, 1480309642);
COMMIT;

-- ----------------------------
-- Table structure for dp_admin_attachment
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_attachment`;
CREATE TABLE `dp_admin_attachment` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `uid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(128) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` char(8) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `width` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(8) unsigned NOT NULL DEFAULT '0' COMMENT '图片高度',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='附件表';

-- ----------------------------
-- Records of dp_admin_attachment
-- ----------------------------
BEGIN;
INSERT INTO `dp_admin_attachment` VALUES (1, 25, '代金券.png', 'odc', 'uploads/images/20180505/06bf983dc39989c7d6ebf05353672d15.png', '', '', 'image/png', 'png', 119875, '670b474c717c7ec8d67ff321ca17d45d', 'c8f4aa849e35a49eedb4d55f7cd63b606c1c599b', 'local', 0, 1525498132, 1525498132, 100, 1, 369, 151);
INSERT INTO `dp_admin_attachment` VALUES (2, 25, '1_2017092902485560056.jpg', 'odc', 'uploads/images/20180505/3cd90236aabe48d950edbc04fbae3da1.jpg', '', '', 'image/jpeg', 'jpg', 64280, 'bbad08379bc1928ee7614b085cb0923e', '31322cd4c1b6eb24caa58a251024843fffe7a76e', 'local', 0, 1525498132, 1525498132, 100, 1, 430, 430);
COMMIT;

-- ----------------------------
-- Table structure for dp_admin_config
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_config`;
CREATE TABLE `dp_admin_config` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(64) NOT NULL DEFAULT '' COMMENT '名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '标题',
  `group` varchar(32) NOT NULL DEFAULT '' COMMENT '配置分组',
  `type` varchar(32) NOT NULL DEFAULT '' COMMENT '类型',
  `value` text NOT NULL COMMENT '配置值',
  `options` text NOT NULL COMMENT '配置项',
  `tips` varchar(256) NOT NULL DEFAULT '' COMMENT '配置提示',
  `ajax_url` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框ajax地址',
  `next_items` varchar(256) NOT NULL DEFAULT '' COMMENT '联动下拉框的下级下拉框名，多个以逗号隔开',
  `param` varchar(32) NOT NULL DEFAULT '' COMMENT '联动下拉框请求参数名',
  `format` varchar(32) NOT NULL DEFAULT '' COMMENT '格式，用于格式文本',
  `table` varchar(32) NOT NULL DEFAULT '' COMMENT '表名，只用于快速联动类型',
  `level` tinyint(2) unsigned NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=39 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='系统配置表';

-- ----------------------------
-- Records of dp_admin_config
-- ----------------------------
BEGIN;
INSERT INTO `dp_admin_config` VALUES (1, 'web_site_status', '站点开关', 'base', 'switch', '1', '', '站点关闭后将不能访问，后台可正常登录', '', '', '', '', '', 2, '', '', '', '', 1475240395, 1477403914, 1, 1);
INSERT INTO `dp_admin_config` VALUES (2, 'web_site_title', '站点标题', 'base', 'text', 'Online Distribution Center', '', '调用方式：<code>config(\'web_site_title\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475240646, 1477710341, 2, 1);
INSERT INTO `dp_admin_config` VALUES (3, 'web_site_slogan', '站点标语', 'base', 'text', 'Online Distribution Center', '', '站点口号，调用方式：<code>config(\'web_site_slogan\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475240994, 1477710357, 3, 1);
INSERT INTO `dp_admin_config` VALUES (4, 'web_site_logo', '站点LOGO', 'base', 'image', '', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241067, 1475241067, 4, 1);
INSERT INTO `dp_admin_config` VALUES (5, 'web_site_description', '站点描述', 'base', 'textarea', '', '', '网站描述，有利于搜索引擎抓取相关信息', '', '', '', '', '', 2, '', '', '', '', 1475241186, 1475241186, 6, 1);
INSERT INTO `dp_admin_config` VALUES (6, 'web_site_keywords', '站点关键词', 'base', 'text', '海豚PHP、PHP开发框架、后台框架', '', '网站搜索引擎关键字', '', '', '', '', '', 2, '', '', '', '', 1475241328, 1475241328, 7, 1);
INSERT INTO `dp_admin_config` VALUES (7, 'web_site_copyright', '版权信息', 'base', 'text', 'Copyright © 2015-2017 DolphinPHP All rights reserved.', '', '调用方式：<code>config(\'web_site_copyright\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241416, 1477710383, 8, 1);
INSERT INTO `dp_admin_config` VALUES (8, 'web_site_icp', '备案信息', 'base', 'text', '', '', '调用方式：<code>config(\'web_site_icp\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241441, 1477710441, 9, 1);
INSERT INTO `dp_admin_config` VALUES (9, 'web_site_statistics', '站点统计', 'base', 'textarea', '', '', '网站统计代码，支持百度、Google、cnzz等，调用方式：<code>config(\'web_site_statistics\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241498, 1477710455, 10, 1);
INSERT INTO `dp_admin_config` VALUES (10, 'config_group', '配置分组', 'system', 'array', 'base:基本\r\nsystem:系统\r\nupload:上传\r\ndevelop:开发\r\ndatabase:数据库', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241716, 1477649446, 100, 1);
INSERT INTO `dp_admin_config` VALUES (11, 'form_item_type', '配置类型', 'system', 'array', 'text:单行文本\r\ntextarea:多行文本\r\nstatic:静态文本\r\npassword:密码\r\ncheckbox:复选框\r\nradio:单选按钮\r\ndate:日期\r\ndatetime:日期+时间\r\nhidden:隐藏\r\nswitch:开关\r\narray:数组\r\nselect:下拉框\r\nlinkage:普通联动下拉框\r\nlinkages:快速联动下拉框\r\nimage:单张图片\r\nimages:多张图片\r\nfile:单个文件\r\nfiles:多个文件\r\nueditor:UEditor 编辑器\r\nwangeditor:wangEditor 编辑器\r\neditormd:markdown 编辑器\r\nckeditor:ckeditor 编辑器\r\nicon:字体图标\r\ntags:标签\r\nnumber:数字\r\nbmap:百度地图\r\ncolorpicker:取色器\r\njcrop:图片裁剪\r\nmasked:格式文本\r\nrange:范围\r\ntime:时间', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241835, 1495853193, 100, 1);
INSERT INTO `dp_admin_config` VALUES (12, 'upload_file_size', '文件上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', 2, '', '', '', '', 1475241897, 1477663520, 100, 1);
INSERT INTO `dp_admin_config` VALUES (13, 'upload_file_ext', '允许上传的文件后缀', 'upload', 'tags', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', 2, '', '', '', '', 1475241975, 1477649489, 100, 1);
INSERT INTO `dp_admin_config` VALUES (14, 'upload_image_size', '图片上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', 2, '', '', '', '', 1475242015, 1477663529, 100, 1);
INSERT INTO `dp_admin_config` VALUES (15, 'upload_image_ext', '允许上传的图片后缀', 'upload', 'tags', 'gif,jpg,jpeg,bmp,png', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', 2, '', '', '', '', 1475242056, 1477649506, 100, 1);
INSERT INTO `dp_admin_config` VALUES (16, 'list_rows', '分页数量', 'system', 'number', '20', '', '每页的记录数', '', '', '', '', '', 2, '', '', '', '', 1475242066, 1476074507, 101, 1);
INSERT INTO `dp_admin_config` VALUES (17, 'system_color', '后台配色方案', 'system', 'radio', 'default', 'default:Default\r\namethyst:Amethyst\r\ncity:City\r\nflat:Flat\r\nmodern:Modern\r\nsmooth:Smooth', '', '', '', '', '', '', 2, '', '', '', '', 1475250066, 1477316689, 102, 1);
INSERT INTO `dp_admin_config` VALUES (18, 'develop_mode', '开发模式', 'develop', 'radio', '1', '0:关闭\r\n1:开启', '', '', '', '', '', '', 2, '', '', '', '', 1476864205, 1476864231, 100, 1);
INSERT INTO `dp_admin_config` VALUES (19, 'app_trace', '显示页面Trace', 'develop', 'radio', '0', '0:否\r\n1:是', '', '', '', '', '', '', 2, '', '', '', '', 1476866355, 1476866355, 100, 1);
INSERT INTO `dp_admin_config` VALUES (21, 'data_backup_path', '数据库备份根路径', 'database', 'text', '../data/', '', '路径必须以 / 结尾', '', '', '', '', '', 2, '', '', '', '', 1477017745, 1477018467, 100, 1);
INSERT INTO `dp_admin_config` VALUES (22, 'data_backup_part_size', '数据库备份卷大小', 'database', 'text', '20971520', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', '', '', '', '', 2, '', '', '', '', 1477017886, 1477017886, 100, 1);
INSERT INTO `dp_admin_config` VALUES (23, 'data_backup_compress', '数据库备份文件是否启用压缩', 'database', 'radio', '1', '0:否\r\n1:是', '压缩备份文件需要PHP环境支持 <code>gzopen</code>, <code>gzwrite</code>函数', '', '', '', '', '', 2, '', '', '', '', 1477017978, 1477018172, 100, 1);
INSERT INTO `dp_admin_config` VALUES (24, 'data_backup_compress_level', '数据库备份文件压缩级别', 'database', 'radio', '9', '1:最低\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', '', '', '', '', 2, '', '', '', '', 1477018083, 1477018083, 100, 1);
INSERT INTO `dp_admin_config` VALUES (25, 'top_menu_max', '顶部导航模块数量', 'system', 'text', '10', '', '设置顶部导航默认显示的模块数量', '', '', '', '', '', 2, '', '', '', '', 1477579289, 1477579289, 103, 1);
INSERT INTO `dp_admin_config` VALUES (26, 'web_site_logo_text', '站点LOGO文字', 'base', 'image', '', '', '', '', '', '', '', '', 2, '', '', '', '', 1477620643, 1477620643, 5, 1);
INSERT INTO `dp_admin_config` VALUES (27, 'upload_image_thumb', '缩略图尺寸', 'upload', 'text', '', '', '不填写则不生成缩略图，如需生成 <code>300x300</code> 的缩略图，则填写 <code>300,300</code> ，请注意，逗号必须是英文逗号', '', '', '', '', '', 2, '', '', '', '', 1477644150, 1477649513, 100, 1);
INSERT INTO `dp_admin_config` VALUES (28, 'upload_image_thumb_type', '缩略图裁剪类型', 'upload', 'radio', '1', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放', '该项配置只有在启用生成缩略图时才生效', '', '', '', '', '', 2, '', '', '', '', 1477646271, 1477649521, 100, 1);
INSERT INTO `dp_admin_config` VALUES (29, 'upload_thumb_water', '添加水印', 'upload', 'switch', '0', '', '', '', '', '', '', '', 2, '', '', '', '', 1477649648, 1477649648, 100, 1);
INSERT INTO `dp_admin_config` VALUES (30, 'upload_thumb_water_pic', '水印图片', 'upload', 'image', '', '', '只有开启水印功能才生效', '', '', '', '', '', 2, '', '', '', '', 1477656390, 1477656390, 100, 1);
INSERT INTO `dp_admin_config` VALUES (31, 'upload_thumb_water_position', '水印位置', 'upload', 'radio', '9', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '', '', '', '', '', 2, '', '', '', '', 1477656528, 1477656528, 100, 1);
INSERT INTO `dp_admin_config` VALUES (32, 'upload_thumb_water_alpha', '水印透明度', 'upload', 'text', '50', '', '请输入0~100之间的数字，数字越小，透明度越高', '', '', '', '', '', 2, '', '', '', '', 1477656714, 1477661309, 100, 1);
INSERT INTO `dp_admin_config` VALUES (33, 'wipe_cache_type', '清除缓存类型', 'system', 'checkbox', 'TEMP_PATH', 'TEMP_PATH:应用缓存\r\nLOG_PATH:应用日志\r\nCACHE_PATH:项目模板缓存', '清除缓存时，要删除的缓存类型', '', '', '', '', '', 2, '', '', '', '', 1477727305, 1477727305, 100, 1);
INSERT INTO `dp_admin_config` VALUES (34, 'captcha_signin', '后台验证码开关', 'system', 'switch', '0', '', '后台登录时是否需要验证码', '', '', '', '', '', 2, '', '', '', '', 1478771958, 1478771958, 99, 1);
INSERT INTO `dp_admin_config` VALUES (35, 'home_default_module', '前台默认模块', 'system', 'select', 'index', '', '前台默认访问的模块，该模块必须有Index控制器和index方法', '', '', '', '', '', 0, '', '', '', '', 1486714723, 1486715620, 104, 1);
INSERT INTO `dp_admin_config` VALUES (36, 'minify_status', '开启minify', 'system', 'switch', '0', '', '开启minify会压缩合并js、css文件，可以减少资源请求次数，如果不支持minify，可关闭', '', '', '', '', '', 0, '', '', '', '', 1487035843, 1487035843, 99, 1);
INSERT INTO `dp_admin_config` VALUES (37, 'upload_driver', '上传驱动', 'upload', 'radio', 'local', 'local:本地', '图片或文件上传驱动', '', '', '', '', '', 0, '', '', '', '', 1501488567, 1501490821, 100, 1);
INSERT INTO `dp_admin_config` VALUES (38, 'system_log', '系统日志', 'system', 'switch', '1', '', '是否开启系统日志功能', '', '', '', '', '', 0, '', '', '', '', 1512635391, 1512635391, 99, 1);
COMMIT;

-- ----------------------------
-- Table structure for dp_admin_hook
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_hook`;
CREATE TABLE `dp_admin_hook` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子来自哪个插件',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子描述',
  `system` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统钩子',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=18 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钩子表';

-- ----------------------------
-- Records of dp_admin_hook
-- ----------------------------
BEGIN;
INSERT INTO `dp_admin_hook` VALUES (1, 'admin_index', '', '后台首页', 1, 1468174214, 1477757518, 1);
INSERT INTO `dp_admin_hook` VALUES (2, 'plugin_index_tab_list', '', '插件扩展tab钩子', 1, 1468174214, 1468174214, 1);
INSERT INTO `dp_admin_hook` VALUES (3, 'module_index_tab_list', '', '模块扩展tab钩子', 1, 1468174214, 1468174214, 1);
INSERT INTO `dp_admin_hook` VALUES (4, 'page_tips', '', '每个页面的提示', 1, 1468174214, 1468174214, 1);
INSERT INTO `dp_admin_hook` VALUES (5, 'signin_footer', '', '登录页面底部钩子', 1, 1479269315, 1479269315, 1);
INSERT INTO `dp_admin_hook` VALUES (6, 'signin_captcha', '', '登录页面验证码钩子', 1, 1479269315, 1479269315, 1);
INSERT INTO `dp_admin_hook` VALUES (7, 'signin', '', '登录控制器钩子', 1, 1479386875, 1479386875, 1);
INSERT INTO `dp_admin_hook` VALUES (8, 'upload_attachment', '', '附件上传钩子', 1, 1501493808, 1501493808, 1);
INSERT INTO `dp_admin_hook` VALUES (9, 'page_plugin_js', '', '页面插件js钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (10, 'page_plugin_css', '', '页面插件css钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (11, 'signin_sso', '', '单点登录钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (12, 'signout_sso', '', '单点退出钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (13, 'user_add', '', '添加用户钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (14, 'user_edit', '', '编辑用户钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (15, 'user_delete', '', '删除用户钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (16, 'user_enable', '', '启用用户钩子', 1, 1503633591, 1503633591, 1);
INSERT INTO `dp_admin_hook` VALUES (17, 'user_disable', '', '禁用用户钩子', 1, 1503633591, 1503633591, 1);
COMMIT;

-- ----------------------------
-- Table structure for dp_admin_hook_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_hook_plugin`;
CREATE TABLE `dp_admin_hook_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `hook` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子id',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标识',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) unsigned NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='钩子-插件对应表';

-- ----------------------------
-- Table structure for dp_admin_icon
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_icon`;
CREATE TABLE `dp_admin_icon` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '图标名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图标css地址',
  `prefix` varchar(32) NOT NULL DEFAULT '' COMMENT '图标前缀',
  `font_family` varchar(32) NOT NULL DEFAULT '' COMMENT '字体名',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='图标表';

-- ----------------------------
-- Table structure for dp_admin_icon_list
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_icon_list`;
CREATE TABLE `dp_admin_icon_list` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `icon_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '所属图标id',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '图标标题',
  `class` varchar(255) NOT NULL DEFAULT '' COMMENT '图标类名',
  `code` varchar(128) NOT NULL DEFAULT '' COMMENT '图标关键词',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='详细图标列表';

-- ----------------------------
-- Table structure for dp_admin_log
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_log`;
CREATE TABLE `dp_admin_log` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '主键',
  `action_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` longtext NOT NULL COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '执行行为的时间',
  PRIMARY KEY (`id`) USING BTREE,
  KEY `action_ip_ix` (`action_ip`) USING BTREE,
  KEY `action_id_ix` (`action_id`) USING BTREE,
  KEY `user_id_ix` (`user_id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=75 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行为日志表';

-- ----------------------------
-- Records of dp_admin_log
-- ----------------------------
BEGIN;
INSERT INTO `dp_admin_log` VALUES (1, 35, 1, 0, 'admin_module', 0, '超级管理员 安装了模块：门户', 1, 1523534797);
INSERT INTO `dp_admin_log` VALUES (2, 36, 1, 0, 'admin_module', 0, '超级管理员 卸载了模块：门户', 1, 1524233804);
INSERT INTO `dp_admin_log` VALUES (3, 35, 1, 0, 'admin_module', 0, '超级管理员 安装了模块：ODC', 1, 1524239262);
INSERT INTO `dp_admin_log` VALUES (4, 1, 1, 0, 'admin_user', 2, '超级管理员 添加了用户：manager', 1, 1524281188);
INSERT INTO `dp_admin_log` VALUES (5, 1, 1, 0, 'admin_user', 3, '超级管理员 添加了用户：user', 1, 1524281215);
INSERT INTO `dp_admin_log` VALUES (6, 7, 1, 0, 'admin_role', 2, '超级管理员 添加了角色：user', 1, 1524281341);
INSERT INTO `dp_admin_log` VALUES (7, 8, 1, 0, 'admin_role', 2, '超级管理员 编辑了角色：user', 1, 1524281495);
INSERT INTO `dp_admin_log` VALUES (8, 2, 1, 0, 'admin_user', 3, '超级管理员 编辑了用户：字段(role)，原值(1)，新值：(2)', 1, 1524281523);
INSERT INTO `dp_admin_log` VALUES (9, 7, 1, 0, 'admin_role', 3, '超级管理员 添加了角色：Manager', 1, 1524291162);
INSERT INTO `dp_admin_log` VALUES (10, 8, 1, 0, 'admin_role', 3, '超级管理员 编辑了角色：字段(access)，原值(0)，新值：(true)', 1, 1524291174);
INSERT INTO `dp_admin_log` VALUES (11, 2, 1, 0, 'admin_user', 2, '超级管理员 编辑了用户：字段(role)，原值(1)，新值：(3)', 1, 1524291189);
INSERT INTO `dp_admin_log` VALUES (12, 2, 1, 0, 'admin_user', 2, '超级管理员 编辑了用户：字段(role)，原值(3)，新值：(1)', 1, 1524291197);
INSERT INTO `dp_admin_log` VALUES (13, 8, 1, 0, 'admin_role', 3, '超级管理员 编辑了角色：Manager', 1, 1524291210);
INSERT INTO `dp_admin_log` VALUES (14, 8, 1, 0, 'admin_role', 3, '超级管理员 编辑了角色：Manager', 1, 1524291262);
INSERT INTO `dp_admin_log` VALUES (15, 2, 1, 0, 'admin_user', 3, '超级管理员 编辑了用户：字段(role)，原值(2)，新值：(1)', 1, 1524291342);
INSERT INTO `dp_admin_log` VALUES (16, 8, 1, 0, 'admin_role', 2, '超级管理员 编辑了角色：user', 1, 1524291374);
INSERT INTO `dp_admin_log` VALUES (17, 8, 1, 0, 'admin_role', 2, '超级管理员 编辑了角色：user', 1, 1524291382);
INSERT INTO `dp_admin_log` VALUES (18, 36, 1, 0, 'admin_module', 0, '超级管理员 卸载了模块：ODC', 1, 1524312444);
INSERT INTO `dp_admin_log` VALUES (19, 35, 1, 0, 'admin_module', 0, '超级管理员 安装了模块：ODC', 1, 1524312451);
INSERT INTO `dp_admin_log` VALUES (20, 2, 1, 0, 'admin_user', 3, '超级管理员 编辑了用户：字段(role)，原值(1)，新值：(2)', 1, 1524319668);
INSERT INTO `dp_admin_log` VALUES (21, 8, 1, 0, 'admin_role', 2, '超级管理员 编辑了角色：user', 1, 1524319698);
INSERT INTO `dp_admin_log` VALUES (22, 8, 1, 0, 'admin_role', 2, '超级管理员 编辑了角色：user', 1, 1524319747);
INSERT INTO `dp_admin_log` VALUES (23, 2, 1, 0, 'admin_user', 3, '超级管理员 编辑了用户：user', 1, 1524319773);
INSERT INTO `dp_admin_log` VALUES (24, 2, 1, 0, 'admin_user', 2, '超级管理员 编辑了用户：字段(role)，原值(1)，新值：(3)', 1, 1524319899);
INSERT INTO `dp_admin_log` VALUES (25, 2, 1, 0, 'admin_user', 2, '超级管理员 编辑了用户：manager', 1, 1524319913);
INSERT INTO `dp_admin_log` VALUES (26, 8, 1, 0, 'admin_role', 3, '超级管理员 编辑了角色：Manager', 1, 1524319938);
INSERT INTO `dp_admin_log` VALUES (27, 42, 1, 2130706433, 'admin_config', 0, '超级管理员 更新了系统设置：分组(base)', 1, 1525013998);
INSERT INTO `dp_admin_log` VALUES (28, 31, 1, 2130706433, 'admin_menu', 1, 'administrator 编辑了节点：节点ID(1)', 1, 1525014128);
INSERT INTO `dp_admin_log` VALUES (29, 31, 1, 2130706433, 'admin_menu', 4, 'administrator 编辑了节点：节点ID(4)', 1, 1525014148);
INSERT INTO `dp_admin_log` VALUES (30, 31, 1, 2130706433, 'admin_menu', 68, 'administrator 编辑了节点：节点ID(68)', 1, 1525014233);
INSERT INTO `dp_admin_log` VALUES (31, 31, 1, 2130706433, 'admin_menu', 364, 'administrator 编辑了节点：节点ID(364)', 1, 1525443604);
INSERT INTO `dp_admin_log` VALUES (32, 31, 1, 2130706433, 'admin_menu', 348, 'administrator 编辑了节点：节点ID(348)', 1, 1525443632);
INSERT INTO `dp_admin_log` VALUES (33, 31, 1, 2130706433, 'admin_menu', 352, 'administrator 编辑了节点：节点ID(352)', 1, 1525443653);
INSERT INTO `dp_admin_log` VALUES (34, 31, 1, 2130706433, 'admin_menu', 356, 'administrator 编辑了节点：节点ID(356)', 1, 1525443672);
INSERT INTO `dp_admin_log` VALUES (35, 31, 1, 2130706433, 'admin_menu', 360, 'administrator 编辑了节点：节点ID(360)', 1, 1525443688);
INSERT INTO `dp_admin_log` VALUES (36, 31, 1, 2130706433, 'admin_menu', 364, 'administrator 编辑了节点：节点ID(364)', 1, 1525443707);
INSERT INTO `dp_admin_log` VALUES (37, 31, 1, 2130706433, 'admin_menu', 365, 'administrator 编辑了节点：节点ID(365)', 1, 1525443725);
INSERT INTO `dp_admin_log` VALUES (38, 31, 1, 2130706433, 'admin_menu', 366, 'administrator 编辑了节点：节点ID(366)', 1, 1525443740);
INSERT INTO `dp_admin_log` VALUES (39, 31, 1, 2130706433, 'admin_menu', 368, 'administrator 编辑了节点：节点ID(368)', 1, 1525443758);
INSERT INTO `dp_admin_log` VALUES (40, 31, 1, 2130706433, 'admin_menu', 369, 'administrator 编辑了节点：节点ID(369)', 1, 1525443773);
INSERT INTO `dp_admin_log` VALUES (41, 31, 1, 2130706433, 'admin_menu', 370, 'administrator 编辑了节点：节点ID(370)', 1, 1525443785);
INSERT INTO `dp_admin_log` VALUES (42, 31, 1, 2130706433, 'admin_menu', 348, 'administrator 编辑了节点：节点ID(348)', 1, 1525443897);
INSERT INTO `dp_admin_log` VALUES (43, 31, 1, 2130706433, 'admin_menu', 352, 'administrator 编辑了节点：节点ID(352)', 1, 1525443912);
INSERT INTO `dp_admin_log` VALUES (44, 31, 1, 2130706433, 'admin_menu', 356, 'administrator 编辑了节点：节点ID(356)', 1, 1525443950);
INSERT INTO `dp_admin_log` VALUES (45, 31, 1, 2130706433, 'admin_menu', 360, 'administrator 编辑了节点：节点ID(360)', 1, 1525443963);
INSERT INTO `dp_admin_log` VALUES (46, 31, 1, 2130706433, 'admin_menu', 368, 'administrator 编辑了节点：节点ID(368)', 1, 1525443976);
INSERT INTO `dp_admin_log` VALUES (47, 31, 1, 2130706433, 'admin_menu', 364, 'administrator 编辑了节点：节点ID(364)', 1, 1525443990);
INSERT INTO `dp_admin_log` VALUES (48, 30, 1, 0, 'admin_menu', 371, 'administrator 添加了节点：所属模块(odc),所属节点ID(346),节点标题(Buy),节点链接(odc/buy/index)', 1, 1525494891);
INSERT INTO `dp_admin_log` VALUES (49, 31, 1, 0, 'admin_menu', 371, 'administrator 编辑了节点：节点ID(371)', 1, 1525494958);
INSERT INTO `dp_admin_log` VALUES (50, 31, 1, 0, 'admin_menu', 371, 'administrator 编辑了节点：节点ID(371)', 1, 1525494970);
INSERT INTO `dp_admin_log` VALUES (51, 30, 1, 0, 'admin_menu', 372, 'administrator 添加了节点：所属模块(odc),所属节点ID(371),节点标题(odc/Bazaar/bay),节点链接()', 1, 1525495535);
INSERT INTO `dp_admin_log` VALUES (52, 31, 1, 0, 'admin_menu', 371, 'administrator 编辑了节点：节点ID(371)', 1, 1525496077);
INSERT INTO `dp_admin_log` VALUES (53, 31, 1, 0, 'admin_menu', 372, 'administrator 编辑了节点：节点ID(372)', 1, 1525496357);
INSERT INTO `dp_admin_log` VALUES (54, 31, 1, 0, 'admin_menu', 372, 'administrator 编辑了节点：节点ID(372)', 1, 1525496370);
INSERT INTO `dp_admin_log` VALUES (55, 8, 1, 0, 'admin_role', 2, 'administrator 编辑了角色：user', 1, 1525497767);
INSERT INTO `dp_admin_log` VALUES (56, 8, 1, 0, 'admin_role', 3, 'administrator 编辑了角色：Manager', 1, 1525497776);
INSERT INTO `dp_admin_log` VALUES (57, 31, 1, 0, 'admin_menu', 347, 'administrator 编辑了节点：节点ID(347)', 1, 1525500655);
INSERT INTO `dp_admin_log` VALUES (58, 31, 1, 0, 'admin_menu', 347, 'administrator 编辑了节点：节点ID(347)', 1, 1525500677);
INSERT INTO `dp_admin_log` VALUES (59, 36, 1, 0, 'admin_module', 0, 'administrator 卸载了模块：ODC', 1, 1525501478);
INSERT INTO `dp_admin_log` VALUES (60, 35, 1, 0, 'admin_module', 0, 'administrator 安装了模块：ODC', 1, 1525501577);
INSERT INTO `dp_admin_log` VALUES (61, 8, 1, 0, 'admin_role', 2, 'administrator 编辑了角色：user', 1, 1525501642);
INSERT INTO `dp_admin_log` VALUES (62, 8, 1, 0, 'admin_role', 3, 'administrator 编辑了角色：Manager', 1, 1525501661);
INSERT INTO `dp_admin_log` VALUES (63, 36, 1, 0, 'admin_module', 0, 'administrator 卸载了模块：ODC', 1, 1525502480);
INSERT INTO `dp_admin_log` VALUES (64, 35, 1, 0, 'admin_module', 0, 'administrator 安装了模块：ODC', 1, 1525502487);
INSERT INTO `dp_admin_log` VALUES (65, 36, 1, 0, 'admin_module', 0, 'administrator 卸载了模块：ODC', 1, 1525502583);
INSERT INTO `dp_admin_log` VALUES (66, 35, 1, 0, 'admin_module', 0, 'administrator 安装了模块：ODC', 1, 1525502590);
INSERT INTO `dp_admin_log` VALUES (67, 8, 1, 0, 'admin_role', 2, 'administrator 编辑了角色：user', 1, 1525502833);
INSERT INTO `dp_admin_log` VALUES (68, 8, 1, 0, 'admin_role', 3, 'administrator 编辑了角色：Manager', 1, 1525502848);
INSERT INTO `dp_admin_log` VALUES (69, 8, 1, 0, 'admin_role', 3, 'administrator 编辑了角色：Manager', 1, 1525502849);
INSERT INTO `dp_admin_log` VALUES (70, 32, 1, 0, 'admin_menu', 524, 'administrator 删除了节点：节点ID(524),节点标题(Region),节点链接(odc/u_region/index)', 1, 1525504956);
INSERT INTO `dp_admin_log` VALUES (71, 36, 1, 0, 'admin_module', 0, 'administrator 卸载了模块：ODC', 1, 1525532705);
INSERT INTO `dp_admin_log` VALUES (72, 35, 1, 0, 'admin_module', 0, 'administrator 安装了模块：ODC', 1, 1525532718);
INSERT INTO `dp_admin_log` VALUES (73, 8, 1, 0, 'admin_role', 2, 'administrator 编辑了角色：user', 1, 1525532815);
INSERT INTO `dp_admin_log` VALUES (74, 8, 1, 0, 'admin_role', 3, 'administrator 编辑了角色：Manager', 1, 1525532855);
COMMIT;

-- ----------------------------
-- Table structure for dp_admin_menu
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_menu`;
CREATE TABLE `dp_admin_menu` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模块名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url_type` varchar(16) NOT NULL DEFAULT '' COMMENT '链接类型（link：外链，module：模块）',
  `url_value` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `url_target` varchar(16) NOT NULL DEFAULT '_self' COMMENT '链接打开方式：_blank,_self',
  `online_hide` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '网站上线后是否隐藏',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `system_menu` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统菜单，系统菜单不可删除',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `params` varchar(255) NOT NULL DEFAULT '' COMMENT '参数',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=599 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台菜单表';

-- ----------------------------
-- Records of dp_admin_menu
-- ----------------------------
BEGIN;
INSERT INTO `dp_admin_menu` VALUES (1, 0, 'admin', 'Home', 'fa fa-fw fa-home', 'module_admin', 'admin/index/index', '_self', 0, 1467617722, 1525014128, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (2, 1, 'admin', '快捷操作', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1467618170, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (3, 2, 'admin', '清空缓存', 'fa fa-fw fa-trash-o', 'module_admin', 'admin/index/wipecache', '_self', 0, 1467618273, 1489049773, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (4, 0, 'admin', 'System', 'fa fa-fw fa-gear', 'module_admin', 'admin/system/index', '_self', 0, 1467618361, 1525014149, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (5, 4, 'admin', '系统功能', 'si si-wrench', 'module_admin', '', '_self', 0, 1467618441, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (6, 5, 'admin', '系统设置', 'fa fa-fw fa-wrench', 'module_admin', 'admin/system/index', '_self', 0, 1467618490, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (7, 5, 'admin', '配置管理', 'fa fa-fw fa-gears', 'module_admin', 'admin/config/index', '_self', 0, 1467618618, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (8, 7, 'admin', '新增', '', 'module_admin', 'admin/config/add', '_self', 0, 1467618648, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (9, 7, 'admin', '编辑', '', 'module_admin', 'admin/config/edit', '_self', 0, 1467619566, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (10, 7, 'admin', '删除', '', 'module_admin', 'admin/config/delete', '_self', 0, 1467619583, 1477710695, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (11, 7, 'admin', '启用', '', 'module_admin', 'admin/config/enable', '_self', 0, 1467619609, 1477710695, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (12, 7, 'admin', '禁用', '', 'module_admin', 'admin/config/disable', '_self', 0, 1467619637, 1477710695, 5, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (13, 5, 'admin', '节点管理', 'fa fa-fw fa-bars', 'module_admin', 'admin/menu/index', '_self', 0, 1467619882, 1477710695, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (14, 13, 'admin', '新增', '', 'module_admin', 'admin/menu/add', '_self', 0, 1467619902, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (15, 13, 'admin', '编辑', '', 'module_admin', 'admin/menu/edit', '_self', 0, 1467620331, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (16, 13, 'admin', '删除', '', 'module_admin', 'admin/menu/delete', '_self', 0, 1467620363, 1477710695, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (17, 13, 'admin', '启用', '', 'module_admin', 'admin/menu/enable', '_self', 0, 1467620386, 1477710695, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (18, 13, 'admin', '禁用', '', 'module_admin', 'admin/menu/disable', '_self', 0, 1467620404, 1477710695, 5, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (19, 68, 'user', '权限管理', 'fa fa-fw fa-key', 'module_admin', '', '_self', 0, 1467688065, 1477710702, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (20, 19, 'user', '用户管理', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', 0, 1467688137, 1477710702, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (21, 20, 'user', '新增', '', 'module_admin', 'user/index/add', '_self', 0, 1467688177, 1477710702, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (22, 20, 'user', '编辑', '', 'module_admin', 'user/index/edit', '_self', 0, 1467688202, 1477710702, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (23, 20, 'user', '删除', '', 'module_admin', 'user/index/delete', '_self', 0, 1467688219, 1477710702, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (24, 20, 'user', '启用', '', 'module_admin', 'user/index/enable', '_self', 0, 1467688238, 1477710702, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (25, 20, 'user', '禁用', '', 'module_admin', 'user/index/disable', '_self', 0, 1467688256, 1477710702, 5, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (211, 64, 'admin', '日志详情', '', 'module_admin', 'admin/log/details', '_self', 0, 1480299320, 1480299320, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (32, 4, 'admin', '扩展中心', 'si si-social-dropbox', 'module_admin', '', '_self', 0, 1467688853, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (33, 32, 'admin', '模块管理', 'fa fa-fw fa-th-large', 'module_admin', 'admin/module/index', '_self', 0, 1467689008, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (34, 33, 'admin', '导入', '', 'module_admin', 'admin/module/import', '_self', 0, 1467689153, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (35, 33, 'admin', '导出', '', 'module_admin', 'admin/module/export', '_self', 0, 1467689173, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (36, 33, 'admin', '安装', '', 'module_admin', 'admin/module/install', '_self', 0, 1467689192, 1477710695, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (37, 33, 'admin', '卸载', '', 'module_admin', 'admin/module/uninstall', '_self', 0, 1467689241, 1477710695, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (38, 33, 'admin', '启用', '', 'module_admin', 'admin/module/enable', '_self', 0, 1467689294, 1477710695, 5, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (39, 33, 'admin', '禁用', '', 'module_admin', 'admin/module/disable', '_self', 0, 1467689312, 1477710695, 6, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (40, 33, 'admin', '更新', '', 'module_admin', 'admin/module/update', '_self', 0, 1467689341, 1477710695, 7, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (41, 32, 'admin', '插件管理', 'fa fa-fw fa-puzzle-piece', 'module_admin', 'admin/plugin/index', '_self', 0, 1467689527, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (42, 41, 'admin', '导入', '', 'module_admin', 'admin/plugin/import', '_self', 0, 1467689650, 1477710695, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (43, 41, 'admin', '导出', '', 'module_admin', 'admin/plugin/export', '_self', 0, 1467689665, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (44, 41, 'admin', '安装', '', 'module_admin', 'admin/plugin/install', '_self', 0, 1467689680, 1477710695, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (45, 41, 'admin', '卸载', '', 'module_admin', 'admin/plugin/uninstall', '_self', 0, 1467689700, 1477710695, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (46, 41, 'admin', '启用', '', 'module_admin', 'admin/plugin/enable', '_self', 0, 1467689730, 1477710695, 5, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (47, 41, 'admin', '禁用', '', 'module_admin', 'admin/plugin/disable', '_self', 0, 1467689747, 1477710695, 6, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (48, 41, 'admin', '设置', '', 'module_admin', 'admin/plugin/config', '_self', 0, 1467689789, 1477710695, 7, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (49, 41, 'admin', '管理', '', 'module_admin', 'admin/plugin/manage', '_self', 0, 1467689846, 1477710695, 8, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (50, 5, 'admin', '附件管理', 'fa fa-fw fa-cloud-upload', 'module_admin', 'admin/attachment/index', '_self', 0, 1467690161, 1477710695, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (51, 70, 'admin', '文件上传', '', 'module_admin', 'admin/attachment/upload', '_self', 0, 1467690240, 1489049773, 1, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (52, 50, 'admin', '下载', '', 'module_admin', 'admin/attachment/download', '_self', 0, 1467690334, 1477710695, 2, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (53, 50, 'admin', '启用', '', 'module_admin', 'admin/attachment/enable', '_self', 0, 1467690352, 1477710695, 3, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (54, 50, 'admin', '禁用', '', 'module_admin', 'admin/attachment/disable', '_self', 0, 1467690369, 1477710695, 4, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (55, 50, 'admin', '删除', '', 'module_admin', 'admin/attachment/delete', '_self', 0, 1467690396, 1477710695, 5, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (56, 41, 'admin', '删除', '', 'module_admin', 'admin/plugin/delete', '_self', 0, 1467858065, 1477710695, 11, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (57, 41, 'admin', '编辑', '', 'module_admin', 'admin/plugin/edit', '_self', 0, 1467858092, 1477710695, 10, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (60, 41, 'admin', '新增', '', 'module_admin', 'admin/plugin/add', '_self', 0, 1467858421, 1477710695, 9, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (61, 41, 'admin', '执行', '', 'module_admin', 'admin/plugin/execute', '_self', 0, 1467879016, 1477710695, 14, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (62, 13, 'admin', '保存', '', 'module_admin', 'admin/menu/save', '_self', 0, 1468073039, 1477710695, 6, 1, 1, '');
INSERT INTO `dp_admin_menu` VALUES (64, 5, 'admin', '系统日志', 'fa fa-fw fa-book', 'module_admin', 'admin/log/index', '_self', 0, 1476111944, 1477710695, 6, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (65, 5, 'admin', '数据库管理', 'fa fa-fw fa-database', 'module_admin', 'admin/database/index', '_self', 0, 1476111992, 1477710695, 8, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (66, 32, 'admin', '数据包管理', 'fa fa-fw fa-database', 'module_admin', 'admin/packet/index', '_self', 0, 1476112326, 1477710695, 4, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (67, 19, 'user', '角色管理', 'fa fa-fw fa-users', 'module_admin', 'user/role/index', '_self', 0, 1476113025, 1477710702, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (68, 0, 'user', 'User', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', 0, 1476193348, 1525014233, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (69, 32, 'admin', '钩子管理', 'fa fa-fw fa-anchor', 'module_admin', 'admin/hook/index', '_self', 0, 1476236193, 1477710695, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (70, 2, 'admin', '后台首页', 'fa fa-fw fa-tachometer', 'module_admin', 'admin/index/index', '_self', 0, 1476237472, 1489049773, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (71, 67, 'user', '新增', '', 'module_admin', 'user/role/add', '_self', 0, 1476256935, 1477710702, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (72, 67, 'user', '编辑', '', 'module_admin', 'user/role/edit', '_self', 0, 1476256968, 1477710702, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (73, 67, 'user', '删除', '', 'module_admin', 'user/role/delete', '_self', 0, 1476256993, 1477710702, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (74, 67, 'user', '启用', '', 'module_admin', 'user/role/enable', '_self', 0, 1476257023, 1477710702, 4, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (75, 67, 'user', '禁用', '', 'module_admin', 'user/role/disable', '_self', 0, 1476257046, 1477710702, 5, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (76, 20, 'user', '授权', '', 'module_admin', 'user/index/access', '_self', 0, 1476375187, 1477710702, 6, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (77, 69, 'admin', '新增', '', 'module_admin', 'admin/hook/add', '_self', 0, 1476668971, 1477710695, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (78, 69, 'admin', '编辑', '', 'module_admin', 'admin/hook/edit', '_self', 0, 1476669006, 1477710695, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (79, 69, 'admin', '删除', '', 'module_admin', 'admin/hook/delete', '_self', 0, 1476669375, 1477710695, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (80, 69, 'admin', '启用', '', 'module_admin', 'admin/hook/enable', '_self', 0, 1476669427, 1477710695, 4, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (81, 69, 'admin', '禁用', '', 'module_admin', 'admin/hook/disable', '_self', 0, 1476669564, 1477710695, 5, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (183, 66, 'admin', '安装', '', 'module_admin', 'admin/packet/install', '_self', 0, 1476851362, 1477710695, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (184, 66, 'admin', '卸载', '', 'module_admin', 'admin/packet/uninstall', '_self', 0, 1476851382, 1477710695, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (185, 5, 'admin', '行为管理', 'fa fa-fw fa-bug', 'module_admin', 'admin/action/index', '_self', 0, 1476882441, 1477710695, 7, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (186, 185, 'admin', '新增', '', 'module_admin', 'admin/action/add', '_self', 0, 1476884439, 1477710695, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (187, 185, 'admin', '编辑', '', 'module_admin', 'admin/action/edit', '_self', 0, 1476884464, 1477710695, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (188, 185, 'admin', '启用', '', 'module_admin', 'admin/action/enable', '_self', 0, 1476884493, 1477710695, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (189, 185, 'admin', '禁用', '', 'module_admin', 'admin/action/disable', '_self', 0, 1476884534, 1477710695, 4, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (190, 185, 'admin', '删除', '', 'module_admin', 'admin/action/delete', '_self', 0, 1476884551, 1477710695, 5, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (191, 65, 'admin', '备份数据库', '', 'module_admin', 'admin/database/export', '_self', 0, 1476972746, 1477710695, 1, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (192, 65, 'admin', '还原数据库', '', 'module_admin', 'admin/database/import', '_self', 0, 1476972772, 1477710695, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (193, 65, 'admin', '优化表', '', 'module_admin', 'admin/database/optimize', '_self', 0, 1476972800, 1477710695, 3, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (194, 65, 'admin', '修复表', '', 'module_admin', 'admin/database/repair', '_self', 0, 1476972825, 1477710695, 4, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (195, 65, 'admin', '删除备份', '', 'module_admin', 'admin/database/delete', '_self', 0, 1476973457, 1477710695, 5, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (210, 41, 'admin', '快速编辑', '', 'module_admin', 'admin/plugin/quickedit', '_self', 0, 1477713981, 1477713981, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (209, 185, 'admin', '快速编辑', '', 'module_admin', 'admin/action/quickedit', '_self', 0, 1477713939, 1477713939, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (208, 7, 'admin', '快速编辑', '', 'module_admin', 'admin/config/quickedit', '_self', 0, 1477713808, 1477713808, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (207, 69, 'admin', '快速编辑', '', 'module_admin', 'admin/hook/quickedit', '_self', 0, 1477713770, 1477713770, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (212, 2, 'admin', '个人设置', 'fa fa-fw fa-user', 'module_admin', 'admin/index/profile', '_self', 0, 1489049767, 1489049773, 2, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (213, 70, 'admin', '检查版本更新', '', 'module_admin', 'admin/index/checkupdate', '_self', 0, 1490588610, 1490588610, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (214, 68, 'user', '消息管理', 'fa fa-fw fa-comments-o', 'module_admin', '', '_self', 0, 1520492129, 1520492129, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (215, 214, 'user', '消息列表', 'fa fa-fw fa-th-list', 'module_admin', 'user/message/index', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (216, 215, 'user', '新增', '', 'module_admin', 'user/message/add', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (217, 215, 'user', '编辑', '', 'module_admin', 'user/message/edit', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (218, 215, 'user', '删除', '', 'module_admin', 'user/message/delete', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (219, 215, 'user', '启用', '', 'module_admin', 'user/message/enable', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (220, 215, 'user', '禁用', '', 'module_admin', 'user/message/disable', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (221, 215, 'user', '快速编辑', '', 'module_admin', 'user/message/quickedit', '_self', 0, 1520492195, 1520492195, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (222, 2, 'admin', '消息中心', 'fa fa-fw fa-comments-o', 'module_admin', 'admin/message/index', '_self', 0, 1520495992, 1520496254, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (223, 222, 'admin', '删除', '', 'module_admin', 'admin/message/delete', '_self', 0, 1520495992, 1520496263, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (224, 222, 'admin', '启用', '', 'module_admin', 'admin/message/enable', '_self', 0, 1520495992, 1520496270, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (225, 32, 'admin', '图标管理', 'fa fa-fw fa-tint', 'module_admin', 'admin/icon/index', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (226, 225, 'admin', '新增', '', 'module_admin', 'admin/icon/add', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (227, 225, 'admin', '编辑', '', 'module_admin', 'admin/icon/edit', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (228, 225, 'admin', '删除', '', 'module_admin', 'admin/icon/delete', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (229, 225, 'admin', '启用', '', 'module_admin', 'admin/icon/enable', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (230, 225, 'admin', '禁用', '', 'module_admin', 'admin/icon/disable', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (231, 225, 'admin', '快速编辑', '', 'module_admin', 'admin/icon/quickedit', '_self', 0, 1520908295, 1520908295, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (232, 225, 'admin', '图标列表', '', 'module_admin', 'admin/icon/items', '_self', 0, 1520923368, 1520923368, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (233, 225, 'admin', '更新图标', '', 'module_admin', 'admin/icon/reload', '_self', 0, 1520931908, 1520931908, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (589, 588, 'odc', 'Create', '', 'module_admin', 'odc/u_inventory/add', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (588, 575, 'odc', 'Inventory', 'fa fa-fw fa-recycle', 'module_admin', 'odc/u_inventory/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (587, 584, 'odc', 'Delete', '', 'module_admin', 'odc/u_product/delete', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (586, 584, 'odc', 'Edit', '', 'module_admin', 'odc/u_product/edit', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (585, 584, 'odc', 'Create', '', 'module_admin', 'odc/u_product/add', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (584, 575, 'odc', 'Product', 'fa fa-fw fa-file-word-o', 'module_admin', 'odc/u_product/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (583, 580, 'odc', 'Delete', '', 'module_admin', 'odc/u_category/delete', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (582, 580, 'odc', 'Edit', '', 'module_admin', 'odc/u_category/edit', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (581, 580, 'odc', 'Create', '', 'module_admin', 'odc/u_category/add', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (580, 575, 'odc', 'Category', 'fa fa-fw fa-recycle', 'module_admin', 'odc/u_category/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (579, 576, 'odc', 'Delete', '', 'module_admin', 'odc/u_address/delete', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (578, 576, 'odc', 'Edit', '', 'module_admin', 'odc/u_address/edit', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (577, 576, 'odc', 'Create', '', 'module_admin', 'odc/u_address/add', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (576, 575, 'odc', 'Address', 'fa fa-fw fa-list', 'module_admin', 'odc/u_address/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (575, 549, 'odc', 'ODC_User', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (574, 571, 'odc', 'Delete', '', 'module_admin', 'odc/mg_inventory/delete', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (573, 571, 'odc', 'Edit', '', 'module_admin', 'odc/mg_inventory/edit', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (572, 571, 'odc', 'Create', '', 'module_admin', 'odc/mg_inventory/add', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (571, 550, 'odc', 'Inventory', 'fa fa-fw fa-recycle', 'module_admin', 'odc/mg_inventory/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (570, 567, 'odc', 'Delete', '', 'module_admin', 'odc/mg_product/delete', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (569, 567, 'odc', 'Edit', '', 'module_admin', 'odc/mg_product/edit', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (568, 567, 'odc', 'Create', '', 'module_admin', 'odc/mg_product/add', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (567, 550, 'odc', 'Product', 'fa fa-fw fa-file-word-o', 'module_admin', 'odc/mg_product/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (566, 563, 'odc', 'Delete', '', 'module_admin', 'odc/mg_category/delete', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (565, 563, 'odc', 'Edit', '', 'module_admin', 'odc/mg_category/edit', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (564, 563, 'odc', 'Create', '', 'module_admin', 'odc/mg_category/add', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (563, 550, 'odc', 'Category', 'fa fa-fw fa-recycle', 'module_admin', 'odc/mg_category/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (562, 559, 'odc', 'Delete', '', 'module_admin', 'odc/mg_region/delete', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (561, 559, 'odc', 'Edit', '', 'module_admin', 'odc/mg_region/edit', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (560, 559, 'odc', 'Create', '', 'module_admin', 'odc/mg_region/add', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (559, 550, 'odc', 'Region', 'fa fa-fw fa-list', 'module_admin', 'odc/mg_region/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (558, 555, 'odc', 'Delete', '', 'module_admin', 'odc/mg_user/delete', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (557, 555, 'odc', 'Edit', '', 'module_admin', 'odc/mg_user/edit', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (556, 555, 'odc', 'Create', '', 'module_admin', 'odc/mg_user/add', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (555, 550, 'odc', 'User', 'fa fa-fw fa-list', 'module_admin', 'odc/mg_user/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (554, 551, 'odc', 'Delete', '', 'module_admin', 'odc/mg_address/delete', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (553, 551, 'odc', 'Edit', '', 'module_admin', 'odc/mg_address/edit', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (552, 551, 'odc', 'Create', '', 'module_admin', 'odc/mg_address/add', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (551, 550, 'odc', 'Address', 'fa fa-fw fa-list', 'module_admin', 'odc/mg_address/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (550, 549, 'odc', 'ODC_Manager', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (549, 0, 'odc', 'ODC', 'fa fa-fw fa-newspaper-o', 'module_admin', 'odc/index/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (590, 588, 'odc', 'Edit', '', 'module_admin', 'odc/u_inventory/edit', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (591, 588, 'odc', 'Delete', '', 'module_admin', 'odc/u_inventory/delete', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (592, 549, 'odc', 'ODC_Market', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (593, 592, 'odc', 'market', 'fa fa-fw fa-list', 'module_admin', 'odc/market/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (594, 593, 'odc', 'Create', '', 'module_admin', 'odc/market/add', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (595, 593, 'odc', 'Edit', '', 'module_admin', 'odc/market/edit', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (596, 593, 'odc', 'Delete', '', 'module_admin', 'odc/market/delete', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (597, 592, 'odc', 'Buyer Order', 'fa fa-fw fa-list', 'module_admin', 'odc/buyer_order/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (598, 592, 'odc', 'Supplier Order', 'fa fa-fw fa-list', 'module_admin', 'odc/supplier_order/index', '_self', 0, 1525532719, 1525532719, 100, 0, 1, '');
COMMIT;

-- ----------------------------
-- Table structure for dp_admin_message
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_message`;
CREATE TABLE `dp_admin_message` (
  `id` bigint(20) unsigned NOT NULL AUTO_INCREMENT,
  `uid_receive` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '接收消息的用户id',
  `uid_send` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '发送消息的用户id',
  `type` varchar(128) NOT NULL DEFAULT '' COMMENT '消息分类',
  `content` text NOT NULL COMMENT '消息内容',
  `status` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `read_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '阅读时间',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='消息表';

-- ----------------------------
-- Table structure for dp_admin_module
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_module`;
CREATE TABLE `dp_admin_module` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名称（标识）',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '模块标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text COMMENT '配置信息',
  `access` text COMMENT '授权配置',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '模块唯一标识符',
  `system_module` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否为系统模块',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=10 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块表';

-- ----------------------------
-- Records of dp_admin_module
-- ----------------------------
BEGIN;
INSERT INTO `dp_admin_module` VALUES (1, 'admin', '系统', 'fa fa-fw fa-gear', '系统模块，DolphinPHP的核心模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'admin.dolphinphp.module', 1, 1468204902, 1468204902, 100, 1);
INSERT INTO `dp_admin_module` VALUES (2, 'user', '用户', 'fa fa-fw fa-user', '用户模块，DolphinPHP自带模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'user.dolphinphp.module', 1, 1468204902, 1468204902, 100, 1);
INSERT INTO `dp_admin_module` VALUES (9, 'odc', 'ODC', 'fa fa-fw fa-newspaper-o', 'ODC模块', 'worldli', '', NULL, NULL, '1.0.0', 'odc.wl.module', 0, 1525532719, 1525532719, 100, 1);
COMMIT;

-- ----------------------------
-- Table structure for dp_admin_packet
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_packet`;
CREATE TABLE `dp_admin_packet` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包名',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包标题',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者url',
  `version` varchar(16) NOT NULL,
  `tables` text NOT NULL COMMENT '数据表名',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='数据包表';

-- ----------------------------
-- Table structure for dp_admin_plugin
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_plugin`;
CREATE TABLE `dp_admin_plugin` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '插件描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text NOT NULL COMMENT '配置信息',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `admin` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否有后台管理',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='插件表';

-- ----------------------------
-- Table structure for dp_admin_role
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_role`;
CREATE TABLE `dp_admin_role` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT COMMENT '角色id',
  `pid` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '上级角色',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述',
  `menu_auth` text NOT NULL COMMENT '菜单权限',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `access` tinyint(4) unsigned NOT NULL DEFAULT '0' COMMENT '是否可登录后台',
  `default_module` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '默认访问模块',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=4 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='角色表';

-- ----------------------------
-- Records of dp_admin_role
-- ----------------------------
BEGIN;
INSERT INTO `dp_admin_role` VALUES (1, 0, 'administrator', 'It\'s a super user created by default.', '', 0, 1476270000, 1468117612, 1, 1, 0);
INSERT INTO `dp_admin_role` VALUES (2, 3, 'user', 'user', '[\"1\",\"2\",\"3\",\"51\",\"70\",\"212\",\"213\",\"222\",\"223\",\"224\",\"549\",\"575\",\"576\",\"577\",\"578\",\"579\",\"580\",\"581\",\"582\",\"583\",\"584\",\"585\",\"586\",\"587\",\"588\",\"589\",\"590\",\"591\",\"592\",\"593\",\"594\",\"595\",\"596\",\"597\",\"598\"]', 100, 1524281342, 1525532815, 1, 1, 1);
INSERT INTO `dp_admin_role` VALUES (3, 1, 'Manager', 'Manager', '[\"1\",\"2\",\"3\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"51\",\"67\",\"68\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"212\",\"213\",\"214\",\"215\",\"216\",\"217\",\"218\",\"219\",\"220\",\"221\",\"222\",\"223\",\"224\",\"549\",\"550\",\"551\",\"552\",\"553\",\"554\",\"555\",\"556\",\"557\",\"558\",\"559\",\"560\",\"561\",\"562\",\"563\",\"564\",\"565\",\"566\",\"567\",\"568\",\"569\",\"570\",\"571\",\"572\",\"573\",\"574\",\"592\",\"593\",\"594\",\"595\",\"596\",\"597\",\"598\"]', 100, 1524291162, 1525532856, 1, 1, 1);
COMMIT;

-- ----------------------------
-- Table structure for dp_admin_user
-- ----------------------------
DROP TABLE IF EXISTS `dp_admin_user`;
CREATE TABLE `dp_admin_user` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(96) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `email_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定邮箱地址',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_bind` tinyint(1) unsigned NOT NULL DEFAULT '0' COMMENT '是否绑定手机号码',
  `avatar` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '头像',
  `money` decimal(11,2) unsigned NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '积分',
  `role` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '角色ID',
  `group` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '部门id',
  `signup_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '注册ip',
  `create_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) unsigned NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_login_ip` bigint(20) unsigned NOT NULL DEFAULT '0' COMMENT '登录ip',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：0禁用，1启用',
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=MyISAM AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of dp_admin_user
-- ----------------------------
BEGIN;
INSERT INTO `dp_admin_user` VALUES (1, 'admin', 'administrator', '$2y$10$Brw6wmuSLIIx3Yabid8/Wu5l8VQ9M/H/CG3C9RqN9dUCwZW3ljGOK', '', 0, '', 0, 0, 0.00, 0, 1, 0, 0, 1476065410, 1525532688, 1525532688, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (2, 'user10', 'user10', '$2y$10$5k/fs1HR4S1bIqdW/ZDcpupD3kT2gdbZKXFV2Y5aMFZnzE/2mJWZC', 'user10@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525510725, 1525531912, 1525531912, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (3, 'user11', 'user11', '$2y$10$ABrwTpJCSqeKDIPZv.16oO2QTzSpoiVGhf8iv6Y2P41Dxq4OoZp8m', 'user11@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514767, 1525529419, 1525529419, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (4, 'user12', 'user12', '$2y$10$J0u34Bu9vnhAOeoNcneioOqaECaMBfNpy02rL0MzWnZ9prOn8fgaG', 'user12@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514767, 1525514767, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (5, 'user13', 'user13', '$2y$10$5ccSTOztmN8CvmlqnZWXJuG./nfQUBx9bKBeZlck8dp1faPtZedK2', 'user13@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514767, 1525514767, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (6, 'user14', 'user14', '$2y$10$Qb9oaH/SHXqTNeLG.SJ.0OGCJduvn/eN9KfKPRmv924v.xBBsusgu', 'user14@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514768, 1525514768, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (7, 'user15', 'user15', '$2y$10$4QfFNL4svbveEjdrTbUJjuJt5lTAEk4Ecs36F413Deu4LPNX2L0Ee', 'user15@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514768, 1525514768, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (8, 'user16', 'user16', '$2y$10$toOxRGbkq8W.1EB9ESvBVuJht7jPg1pyXl9owrT9N0sftiYw0P5Fm', 'user16@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514768, 1525514768, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (9, 'user17', 'user17', '$2y$10$nCn02O0xjb4YpR/odNrkaexkmEUN5BeIbJoVP1VeqsVI1r2tn24Wq', 'user17@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514769, 1525514769, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (10, 'user18', 'user18', '$2y$10$3N5mr4Pg3jSLJqx7E.t.5uSrt/2dh97I5Ow0NpDgJjpGqH0ZW1iwa', 'user18@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514769, 1525514769, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (11, 'user19', 'user19', '$2y$10$r9m7yg6.EdSxcJ/DCQ0v5efpGDL1gcMUo3J8S/ukHj1Dp2eevecoy', 'user19@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514769, 1525514769, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (12, 'user110', 'user110', '$2y$10$2r86AWGrXdbOg3H5YdN0quMkz2WmwiNgjlbqyoiCyolYUHrabkDJ.', 'user110@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514770, 1525514770, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (13, 'user21', 'user21', '$2y$10$WYZUn2I5wCKk7H8Ya47C/elbGlzDaoX9UCRk3tRuYJCJ.DLuCclia', 'user21@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514770, 1525514770, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (14, 'user22', 'user22', '$2y$10$DIpNrX0xmBBbO6TX47m5VO1WraKksGhYHQY629MsToaIisRgAXxU2', 'user22@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514770, 1525514770, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (15, 'user23', 'user23', '$2y$10$JyCjYRxlcqRFMpMaVBno4u9ZRm8tVJm8qlu5AujsM32kpM96lY/Re', 'user23@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514771, 1525514771, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (16, 'user24', 'user24', '$2y$10$yhoBOXQu.GiI.tV7QEIBVuopxe0duqOddc0B3jY8jB9W25lvCnnDy', 'user24@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514771, 1525514771, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (17, 'user25', 'user25', '$2y$10$nE/5CFJm.G243W2zrWIMQOh9Jk222.BLnIcN2MtsHKRdEEV.cV6zu', 'user25@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514771, 1525514771, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (18, 'user26', 'user26', '$2y$10$0UTB5.WzjbxCAvbwMQ1GCOi97EkbAPwfKxLM/TUNUE2YhqberFtni', 'user26@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514772, 1525514772, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (19, 'user27', 'user27', '$2y$10$jPty1nfpYAAoZXB2e/4f2uQrRoHM6KDOp0SXoSG80GQqlrdPSjFuC', 'user27@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514772, 1525514772, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (20, 'user28', 'user28', '$2y$10$73iWqFa8Pc/GFZPlzv5T3udqudut9jimxquF6vSx5ejKULdjtJQ2S', 'user28@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514772, 1525514772, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (21, 'user29', 'user29', '$2y$10$tjkcMFBMYaLFQ8lIBDkApebJaE1BkOsqYN7lO5/E/7QbuoF8dgiYa', 'user29@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514773, 1525514773, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (22, 'user210', 'user210', '$2y$10$TZjGmLJEEOQ4NrK87nurSe3eIBXrC6jSE3yNyK/nDh7IeoZkVSPze', 'user210@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514773, 1525514773, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (23, 'user31', 'user31', '$2y$10$ojKYabal0tfqc78tPgGmbeoLLeOLWoCaXbgr4gZyDfjihkpaOk3Z2', 'user31@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514773, 1525514773, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (24, 'user32', 'user32', '$2y$10$Wtq0YYbha3HI45yhvmVepOHNq6Y.sYabv01sbmr4TunTwl6KRXG9.', 'user32@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514774, 1525514774, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (25, 'user33', 'user33', '$2y$10$y6ngmZXoEjIdl/HoJvWxyeVj1cbbSPdzNOYC0D7iEdDi8RUgb7oPK', 'user33@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514774, 1525514774, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (26, 'user34', 'user34', '$2y$10$5biFJSnnVJOMUDFM8YuRtelDPFZ6T8N1pcZTyUAo1t0FRTtVbiLa6', 'user34@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514774, 1525514774, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (27, 'user35', 'user35', '$2y$10$bkigdYNLQLZauCNhvTkxw.J2BKHUcC7aFXKHjLkwhkoYZ2GNLjGA.', 'user35@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514775, 1525514775, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (28, 'user36', 'user36', '$2y$10$7J24U5zpWODnMPr82Mmm/uZVIPZZSjbS8mgkoHYMRpd.xbogNshw6', 'user36@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514775, 1525514775, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (29, 'user37', 'user37', '$2y$10$vx5UJOspxTb1w0cGjA2mWuRlnMUOYNZPvkaWTlprdcbdqr2jFcpF2', 'user37@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514775, 1525514775, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (30, 'user38', 'user38', '$2y$10$N8f8WMVsKCR7WEE.kveOx.jgb6wL79IXuSFGUQcUkdnaR47h/5zca', 'user38@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514775, 1525514775, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (31, 'user39', 'user39', '$2y$10$qKI5neWDSN.epOUNQKA2.uYjV8bp8iEwz0VA9IYvwrUC67KhlEkMK', 'user39@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514776, 1525514776, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (32, 'user310', 'user310', '$2y$10$ZPE8FmNIoN9Ptnq0HbV9kubNUykPpJWwokwzxogo5a7/POOhKd.O.', 'user310@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514776, 1525514776, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (33, 'user41', 'user41', '$2y$10$r7NfvjZKU.GmDm0KN2HbpulhEqwxd7LIIjOW/vB2w/gr0I8NZQFJ.', 'user41@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514776, 1525514776, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (34, 'user42', 'user42', '$2y$10$hOcUXPfDVxAMtRy6Q5kmX.0D2giiJoFtqLqK55CeCQARGok4FVrPe', 'user42@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514777, 1525514777, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (35, 'user43', 'user43', '$2y$10$OcpQVHCUBSpmd9dJVkPRW.JLvx3gMoyw.pIXfg6qr2qeD8.dRxj1m', 'user43@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514777, 1525514777, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (36, 'user44', 'user44', '$2y$10$ObyfHibs7oI8Yx6Dd/e9fu0HmNu2fTEnv6o4vMKnAST8sJJULMbda', 'user44@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514777, 1525514777, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (37, 'user45', 'user45', '$2y$10$vCUIqkgNKaQFO19hKo0O/.fdsX51r5f0/shMPk5t2TZWUiUwe/xZC', 'user45@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514778, 1525514778, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (38, 'user46', 'user46', '$2y$10$OW1x686GdUPS9l2wenDxzuaG/1Pyirbv0TjD0tXwaQC4taSnxIwfC', 'user46@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514778, 1525514778, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (39, 'user47', 'user47', '$2y$10$XyU8KZuqTztKdFs75iR.8uB066JWLu0N3HwySB5QRednFC7XiT6du', 'user47@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514778, 1525514778, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (40, 'user48', 'user48', '$2y$10$2xwvXax72kS1hnHWdcuMKumttBscAB1Tqb07t5IE8DEu7N88lA47a', 'user48@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514779, 1525514779, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (41, 'user49', 'user49', '$2y$10$xIBrSXQ5RwvIQwjbJn10XuXZFgKdrPjiVd.a7KhDmBORPQ1dWPXPG', 'user49@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514779, 1525514779, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (42, 'user410', 'user410', '$2y$10$I9TrtY2xdf1FBy3K7L8fYOgEiT0hx1sZe0BCFKb1hbfRQ1fZfTrYm', 'user410@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514779, 1525514779, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (43, 'user51', 'user51', '$2y$10$AmVED2aKuQCdJoQm9LKqQuy.fxcX8Ah9wo.rDP8btdA94UAdziEam', 'user51@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514780, 1525514780, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (44, 'user52', 'user52', '$2y$10$JCYXIOfORiaSWdUg6/6SOOOJeSGWZV7N4St8VDbbPzfa0zOvRZNiW', 'user52@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514780, 1525514780, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (45, 'user53', 'user53', '$2y$10$OJyoVFyFGzhfcX5ikx5sn.tK2robMRY6GEzfR67.mAaNWH1XpojBC', 'user53@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514780, 1525514780, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (46, 'user54', 'user54', '$2y$10$pDGARTHqIA8s9L3YjLHDLeFmcYGfn3xX6RSJr0zbjjqlUa10OqsWi', 'user54@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514781, 1525514781, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (47, 'user55', 'user55', '$2y$10$mXTzW2QukLh2YKo88a6KM.st1G16hGt/.GK6XevN/8GlhbeVsqDb6', 'user55@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514781, 1525514781, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (48, 'user56', 'user56', '$2y$10$d5wKKq7lC/9FkPmg6.Y.Puk0ZsQZriszf6tRR26zGh8vxa2/EvZzu', 'user56@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514781, 1525514781, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (49, 'user57', 'user57', '$2y$10$rQD0OF2v8My9R/zIDm6vM.2SoXAi1YTh6wRFZo2zx/atMiRi0LSdi', 'user57@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514782, 1525514782, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (50, 'user58', 'user58', '$2y$10$oGNicbu7VFxokMDG28/fdOEl8EQjlIXBsTeAthdoSMxZSMpSs76/a', 'user58@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514782, 1525514782, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (51, 'user59', 'user59', '$2y$10$xHGLiGfU3Xz0d3ZtC97h6eNAvxDiCg7og0UPqWafKnlJ1l7FOxxEC', 'user59@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514782, 1525514782, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (52, 'user510', 'user510', '$2y$10$xJmiRt2JYK.OtZ3zSCbbsOv330zWQnb7ri5pr1J3JwLzXGQF/tH1K', 'user510@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514783, 1525514783, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (53, 'user61', 'user61', '$2y$10$rhyXPQ1sY4S.ZKhVMgBWAuC86zYS0jxQLXzLuYAxUy5mKv1EwxkMq', 'user61@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514783, 1525514783, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (54, 'user62', 'user62', '$2y$10$usvUcN0njoiHuRSueFyRAeSjYZM4d9NfY3ow4djltqW1gb7AP75rm', 'user62@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514783, 1525514783, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (55, 'user63', 'user63', '$2y$10$T1C/.358EfkNMvr3EzQVgefFQOQiHxg.82In8laM7GhSo/ogSH9UW', 'user63@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514784, 1525514784, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (56, 'user64', 'user64', '$2y$10$wsfO6UpDPpL3s/OKfPuJcexqshTYdTgscrq2T5DAGNfS4f5eFzX.a', 'user64@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514784, 1525514784, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (57, 'user65', 'user65', '$2y$10$c7R4f8OqLzWvVK69jnVgwex52w0v5uOpQoOcxqPzux5DhkMBFW.62', 'user65@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514784, 1525514784, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (58, 'user66', 'user66', '$2y$10$IbNKQ9UFQKgAutEn1o0/Wu9sXV/K9Cq/4ox/PyHOAE55NZXtGTopm', 'user66@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514785, 1525514785, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (59, 'user67', 'user67', '$2y$10$3clAECNHEUO9aqUwki7SdOvDodgjmF135/4xBG3n307OWz/cZFRgW', 'user67@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514785, 1525514785, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (60, 'user68', 'user68', '$2y$10$skhIzGhnZiCr5xHPNMjQuOlHoaiJkg1Mi0UuU5zZv/mPswtLI8vQK', 'user68@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514785, 1525514785, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (61, 'user69', 'user69', '$2y$10$dab2in5ru/jBOwCXqgTgJub2dmzMb8pIMya4JSm5/Q7DZu3NX9Lbm', 'user69@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514786, 1525514786, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (62, 'user610', 'user610', '$2y$10$/RdU6o10jtwYBq/2pJ4DXezMcy.3fdOlTwSYfCJtUaeEITFKbdI5a', 'user610@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525514786, 1525514786, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (63, 'manager1', 'Manager1', '$2y$10$W9fkn64pEDGeK4i2WWLw6OMy/2Ngyx4U0VFqGqV9yv.TGOTfh6uIW', 'Manager1@qq.com', 0, '', 0, 0, 0.00, 0, 3, 0, 0, 1525514786, 1525514786, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (64, 'manager2', 'Manager2', '$2y$10$iRDFV0IzoKbptU9bVbB3uu7X1pmtVJHqj7RbRFrDw9WMH2jJ8ZWVW', 'Manager2@qq.com', 0, '', 0, 0, 0.00, 0, 3, 0, 0, 1525514787, 1525514787, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (65, 'manager3', 'Manager3', '$2y$10$WubRRIYi6V1j3POUcPezAuH442uwFnWfcUiJA/9m.d97FlNGmJ3yy', 'Manager3@qq.com', 0, '', 0, 0, 0.00, 0, 3, 0, 0, 1525514787, 1525514787, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (66, 'manager4', 'Manager4', '$2y$10$hnZ0RbhUirlh7bNoYC4bBu/S8hRGkcIuPBLRwafIixKt7kWjdQtry', 'Manager4@qq.com', 0, '', 0, 0, 0.00, 0, 3, 0, 0, 1525514787, 1525514787, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (67, 'manager5', 'Manager5', '$2y$10$dViqLgEjzxc9EsVLG.BncOfwWmCv2NxUiHiSmoYuJ.rXZXWuqABQ2', 'Manager5@qq.com', 0, '', 0, 0, 0.00, 0, 3, 0, 0, 1525514788, 1525514788, 0, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (68, 'manager6', 'Manager6', '$2y$10$fu6QabNSPG4xGuildqRi0.Xi1UV5JYAYCnWOCpAr9D0CaZQ1Km0x6', 'Manager6@qq.com', 0, '', 0, 0, 0.00, 0, 3, 0, 0, 1525514788, 1525514788, 0, 0, 100, 1);
COMMIT;

-- ----------------------------
-- Table structure for dp_odc_address
-- ----------------------------
DROP TABLE IF EXISTS `dp_odc_address`;
CREATE TABLE `dp_odc_address` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) NOT NULL,
  `address` varchar(30) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=62 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dp_odc_address
-- ----------------------------
BEGIN;
INSERT INTO `dp_odc_address` VALUES (1, 2, 'user10.user10.user10.user10.us', 1, 0, 0);
INSERT INTO `dp_odc_address` VALUES (2, 3, 'user1.user1.user1.user1.user1', 0, 1525514767, 1525514767);
INSERT INTO `dp_odc_address` VALUES (3, 4, 'user2.user1.user2.user1.user1', 0, 1525514767, 1525514767);
INSERT INTO `dp_odc_address` VALUES (4, 5, 'user3.user1.user3.user1.user1', 0, 1525514767, 1525514767);
INSERT INTO `dp_odc_address` VALUES (5, 6, 'user4.user1.user4.user1.user1', 0, 1525514768, 1525514768);
INSERT INTO `dp_odc_address` VALUES (6, 7, 'user5.user1.user5.user1.user1', 0, 1525514768, 1525514768);
INSERT INTO `dp_odc_address` VALUES (7, 8, 'user6.user1.user6.user1.user1', 0, 1525514768, 1525514768);
INSERT INTO `dp_odc_address` VALUES (8, 9, 'user7.user1.user7.user1.user1', 0, 1525514769, 1525514769);
INSERT INTO `dp_odc_address` VALUES (9, 10, 'user8.user1.user8.user1.user1', 0, 1525514769, 1525514769);
INSERT INTO `dp_odc_address` VALUES (10, 11, 'user9.user1.user9.user1.user1', 0, 1525514769, 1525514769);
INSERT INTO `dp_odc_address` VALUES (11, 12, 'user10.user1.user10.user1.user', 0, 1525514770, 1525514770);
INSERT INTO `dp_odc_address` VALUES (12, 13, 'user1.user2.user1.user2.user2', 0, 1525514770, 1525514770);
INSERT INTO `dp_odc_address` VALUES (13, 14, 'user2.user2.user2.user2.user2', 0, 1525514770, 1525514770);
INSERT INTO `dp_odc_address` VALUES (14, 15, 'user3.user2.user3.user2.user2', 0, 1525514771, 1525514771);
INSERT INTO `dp_odc_address` VALUES (15, 16, 'user4.user2.user4.user2.user2', 0, 1525514771, 1525514771);
INSERT INTO `dp_odc_address` VALUES (16, 17, 'user5.user2.user5.user2.user2', 0, 1525514771, 1525514771);
INSERT INTO `dp_odc_address` VALUES (17, 18, 'user6.user2.user6.user2.user2', 0, 1525514772, 1525514772);
INSERT INTO `dp_odc_address` VALUES (18, 19, 'user7.user2.user7.user2.user2', 0, 1525514772, 1525514772);
INSERT INTO `dp_odc_address` VALUES (19, 20, 'user8.user2.user8.user2.user2', 0, 1525514772, 1525514772);
INSERT INTO `dp_odc_address` VALUES (20, 21, 'user9.user2.user9.user2.user2', 0, 1525514773, 1525514773);
INSERT INTO `dp_odc_address` VALUES (21, 22, 'user10.user2.user10.user2.user', 0, 1525514773, 1525514773);
INSERT INTO `dp_odc_address` VALUES (22, 23, 'user1.user3.user1.user3.user3', 0, 1525514773, 1525514773);
INSERT INTO `dp_odc_address` VALUES (23, 24, 'user2.user3.user2.user3.user3', 0, 1525514774, 1525514774);
INSERT INTO `dp_odc_address` VALUES (24, 25, 'user3.user3.user3.user3.user3', 0, 1525514774, 1525514774);
INSERT INTO `dp_odc_address` VALUES (25, 26, 'user4.user3.user4.user3.user3', 0, 1525514774, 1525514774);
INSERT INTO `dp_odc_address` VALUES (26, 27, 'user5.user3.user5.user3.user3', 0, 1525514775, 1525514775);
INSERT INTO `dp_odc_address` VALUES (27, 28, 'user6.user3.user6.user3.user3', 0, 1525514775, 1525514775);
INSERT INTO `dp_odc_address` VALUES (28, 29, 'user7.user3.user7.user3.user3', 0, 1525514775, 1525514775);
INSERT INTO `dp_odc_address` VALUES (29, 30, 'user8.user3.user8.user3.user3', 0, 1525514775, 1525514775);
INSERT INTO `dp_odc_address` VALUES (30, 31, 'user9.user3.user9.user3.user3', 0, 1525514776, 1525514776);
INSERT INTO `dp_odc_address` VALUES (31, 32, 'user10.user3.user10.user3.user', 0, 1525514776, 1525514776);
INSERT INTO `dp_odc_address` VALUES (32, 33, 'user1.user4.user1.user4.user4', 0, 1525514776, 1525514776);
INSERT INTO `dp_odc_address` VALUES (33, 34, 'user2.user4.user2.user4.user4', 0, 1525514777, 1525514777);
INSERT INTO `dp_odc_address` VALUES (34, 35, 'user3.user4.user3.user4.user4', 0, 1525514777, 1525514777);
INSERT INTO `dp_odc_address` VALUES (35, 36, 'user4.user4.user4.user4.user4', 0, 1525514777, 1525514777);
INSERT INTO `dp_odc_address` VALUES (36, 37, 'user5.user4.user5.user4.user4', 0, 1525514778, 1525514778);
INSERT INTO `dp_odc_address` VALUES (37, 38, 'user6.user4.user6.user4.user4', 0, 1525514778, 1525514778);
INSERT INTO `dp_odc_address` VALUES (38, 39, 'user7.user4.user7.user4.user4', 0, 1525514778, 1525514778);
INSERT INTO `dp_odc_address` VALUES (39, 40, 'user8.user4.user8.user4.user4', 0, 1525514779, 1525514779);
INSERT INTO `dp_odc_address` VALUES (40, 41, 'user9.user4.user9.user4.user4', 0, 1525514779, 1525514779);
INSERT INTO `dp_odc_address` VALUES (41, 42, 'user10.user4.user10.user4.user', 0, 1525514779, 1525514779);
INSERT INTO `dp_odc_address` VALUES (42, 43, 'user1.user5.user1.user5.user5', 0, 1525514780, 1525514780);
INSERT INTO `dp_odc_address` VALUES (43, 44, 'user2.user5.user2.user5.user5', 0, 1525514780, 1525514780);
INSERT INTO `dp_odc_address` VALUES (44, 45, 'user3.user5.user3.user5.user5', 0, 1525514780, 1525514780);
INSERT INTO `dp_odc_address` VALUES (45, 46, 'user4.user5.user4.user5.user5', 0, 1525514781, 1525514781);
INSERT INTO `dp_odc_address` VALUES (46, 47, 'user5.user5.user5.user5.user5', 0, 1525514781, 1525514781);
INSERT INTO `dp_odc_address` VALUES (47, 48, 'user6.user5.user6.user5.user5', 0, 1525514781, 1525514781);
INSERT INTO `dp_odc_address` VALUES (48, 49, 'user7.user5.user7.user5.user5', 0, 1525514782, 1525514782);
INSERT INTO `dp_odc_address` VALUES (49, 50, 'user8.user5.user8.user5.user5', 0, 1525514782, 1525514782);
INSERT INTO `dp_odc_address` VALUES (50, 51, 'user9.user5.user9.user5.user5', 0, 1525514782, 1525514782);
INSERT INTO `dp_odc_address` VALUES (51, 52, 'user10.user5.user10.user5.user', 0, 1525514783, 1525514783);
INSERT INTO `dp_odc_address` VALUES (52, 53, 'user1.user6.user1.user6.user6', 0, 1525514783, 1525514783);
INSERT INTO `dp_odc_address` VALUES (53, 54, 'user2.user6.user2.user6.user6', 0, 1525514783, 1525514783);
INSERT INTO `dp_odc_address` VALUES (54, 55, 'user3.user6.user3.user6.user6', 0, 1525514784, 1525514784);
INSERT INTO `dp_odc_address` VALUES (55, 56, 'user4.user6.user4.user6.user6', 0, 1525514784, 1525514784);
INSERT INTO `dp_odc_address` VALUES (56, 57, 'user5.user6.user5.user6.user6', 0, 1525514784, 1525514784);
INSERT INTO `dp_odc_address` VALUES (57, 58, 'user6.user6.user6.user6.user6', 0, 1525514785, 1525514785);
INSERT INTO `dp_odc_address` VALUES (58, 59, 'user7.user6.user7.user6.user6', 0, 1525514785, 1525514785);
INSERT INTO `dp_odc_address` VALUES (59, 60, 'user8.user6.user8.user6.user6', 0, 1525514785, 1525514785);
INSERT INTO `dp_odc_address` VALUES (60, 61, 'user9.user6.user9.user6.user6', 0, 1525514786, 1525514786);
INSERT INTO `dp_odc_address` VALUES (61, 62, 'user10.user6.user10.user6.user', 0, 1525514786, 1525514786);
COMMIT;

-- ----------------------------
-- Table structure for dp_odc_category
-- ----------------------------
DROP TABLE IF EXISTS `dp_odc_category`;
CREATE TABLE `dp_odc_category` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `sort` int(255) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dp_odc_category
-- ----------------------------
BEGIN;
INSERT INTO `dp_odc_category` VALUES (1, 0, 2, 'shoe', 'shoe', 1, 1, 1525522566, 1525522566);
COMMIT;

-- ----------------------------
-- Table structure for dp_odc_inventory
-- ----------------------------
DROP TABLE IF EXISTS `dp_odc_inventory`;
CREATE TABLE `dp_odc_inventory` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `product_id` float DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `max_quantity` float DEFAULT NULL,
  `status` int(16) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dp_odc_inventory
-- ----------------------------
BEGIN;
INSERT INTO `dp_odc_inventory` VALUES (1, 1, 1, 2, '2', 52, 1, 1525522898, 1525531395);
COMMIT;

-- ----------------------------
-- Table structure for dp_odc_order
-- ----------------------------
DROP TABLE IF EXISTS `dp_odc_order`;
CREATE TABLE `dp_odc_order` (
  `id` int(11) NOT NULL AUTO_INCREMENT,
  `order_id` int(11) DEFAULT NULL,
  `product_id` int(11) DEFAULT NULL,
  `buyer_id` int(11) DEFAULT NULL,
  `supplier_id` int(11) DEFAULT NULL,
  `price` decimal(10,2) DEFAULT NULL,
  `num` int(11) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=8 DEFAULT CHARSET=utf8;

-- ----------------------------
-- Records of dp_odc_order
-- ----------------------------
BEGIN;
INSERT INTO `dp_odc_order` VALUES (3, 2147483647, 1, 3, 2, 110.00, 11, 1525531210);
INSERT INTO `dp_odc_order` VALUES (4, 2147483647, 1, 3, 2, 110.00, 11, 1525531264);
INSERT INTO `dp_odc_order` VALUES (5, 2147483647, 1, 3, 2, 110.00, 11, 1525531335);
INSERT INTO `dp_odc_order` VALUES (6, 2147483647, 1, 3, 2, 50.00, 5, 1525531375);
INSERT INTO `dp_odc_order` VALUES (7, 2147483647, 1, 3, 2, 100.00, 10, 1525531395);
COMMIT;

-- ----------------------------
-- Table structure for dp_odc_product
-- ----------------------------
DROP TABLE IF EXISTS `dp_odc_product`;
CREATE TABLE `dp_odc_product` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `name` varchar(30) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `color` varchar(30) NOT NULL,
  `price` decimal(10,2) NOT NULL,
  `weight` float NOT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `quantity` float NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `UK_f1lygoborvothkuaqghjy8exw` (`name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dp_odc_product
-- ----------------------------
BEGIN;
INSERT INTO `dp_odc_product` VALUES (1, 'shoe', 1, 2, '', 10.00, 0, '2', 0, '', 1, 1525522590, 1525522590);
COMMIT;

-- ----------------------------
-- Table structure for dp_odc_region
-- ----------------------------
DROP TABLE IF EXISTS `dp_odc_region`;
CREATE TABLE `dp_odc_region` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `mg_user_id` int(11) DEFAULT NULL,
  `region_name` varchar(30) DEFAULT NULL,
  `wh_name` varchar(30) DEFAULT NULL,
  `wh_address` varchar(100) DEFAULT NULL,
  `wh_desc` varchar(100) DEFAULT NULL,
  `region_desc` varchar(100) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE,
  UNIQUE KEY `name` (`region_name`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=7 DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dp_odc_region
-- ----------------------------
BEGIN;
INSERT INTO `dp_odc_region` VALUES (1, 63, 'Center America', 'Center America Warehouse', 'Panama', 'Center America warehouse', 'Center America warehouse', 1524237035, 1525514786);
INSERT INTO `dp_odc_region` VALUES (2, 64, 'North America', 'North America warehouse', 'South Halsted Chicago IL US', 'North America warehouse', 'North America warehouse', 1524273965, 1525514787);
INSERT INTO `dp_odc_region` VALUES (3, 65, 'South America', 'South America warehouse', 'Rio  Brazil', 'South America warehouse', 'South America', 1524273976, 1525514787);
INSERT INTO `dp_odc_region` VALUES (4, 66, 'Africa/Middle East', 'Africa/Middle East warehouse', 'South Africa', 'Africa/Middle East warehouse', 'Africa/Middle East', 1524273988, 1525514787);
INSERT INTO `dp_odc_region` VALUES (5, 67, 'Asia', 'Asia warehouse', 'Beijing China', 'Asia warehouse', 'Asia', 1524273995, 1525514788);
INSERT INTO `dp_odc_region` VALUES (6, 68, 'Europe', 'Europe warehouse', 'London UK', 'Europe warehouse', 'Europe ', 1524274005, 1525514788);
COMMIT;

-- ----------------------------
-- Table structure for dp_odc_user
-- ----------------------------
DROP TABLE IF EXISTS `dp_odc_user`;
CREATE TABLE `dp_odc_user` (
  `id` bigint(20) NOT NULL AUTO_INCREMENT,
  `user_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `balance` decimal(10,2) DEFAULT NULL,
  `type` int(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL,
  PRIMARY KEY (`id`) USING BTREE
) ENGINE=InnoDB AUTO_INCREMENT=69 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dp_odc_user
-- ----------------------------
BEGIN;
INSERT INTO `dp_odc_user` VALUES (1, 1, 0, 1, NULL, 1, NULL, NULL);
INSERT INTO `dp_odc_user` VALUES (2, 2, 1, 1, 10480.00, 0, 1525510725, 1525531395);
INSERT INTO `dp_odc_user` VALUES (3, 3, 1, 2, 9520.00, 0, 1525514767, 1525531395);
INSERT INTO `dp_odc_user` VALUES (4, 4, 1, 3, 10000.00, 0, 1525514767, 1525514767);
INSERT INTO `dp_odc_user` VALUES (5, 5, 1, 4, 10000.00, 0, 1525514767, 1525514767);
INSERT INTO `dp_odc_user` VALUES (6, 6, 1, 5, 10000.00, 0, 1525514768, 1525514768);
INSERT INTO `dp_odc_user` VALUES (7, 7, 1, 6, 10000.00, 0, 1525514768, 1525514768);
INSERT INTO `dp_odc_user` VALUES (8, 8, 1, 7, 10000.00, 0, 1525514768, 1525514768);
INSERT INTO `dp_odc_user` VALUES (9, 9, 1, 8, 10000.00, 0, 1525514769, 1525514769);
INSERT INTO `dp_odc_user` VALUES (10, 10, 1, 9, 10000.00, 0, 1525514769, 1525514769);
INSERT INTO `dp_odc_user` VALUES (11, 11, 1, 10, 10000.00, 0, 1525514769, 1525514769);
INSERT INTO `dp_odc_user` VALUES (12, 12, 1, 11, 10000.00, 0, 1525514770, 1525514770);
INSERT INTO `dp_odc_user` VALUES (13, 13, 2, 12, 10000.00, 0, 1525514770, 1525514770);
INSERT INTO `dp_odc_user` VALUES (14, 14, 2, 13, 10000.00, 0, 1525514770, 1525514770);
INSERT INTO `dp_odc_user` VALUES (15, 15, 2, 14, 10000.00, 0, 1525514771, 1525514771);
INSERT INTO `dp_odc_user` VALUES (16, 16, 2, 15, 10000.00, 0, 1525514771, 1525514771);
INSERT INTO `dp_odc_user` VALUES (17, 17, 2, 16, 10000.00, 0, 1525514771, 1525514771);
INSERT INTO `dp_odc_user` VALUES (18, 18, 2, 17, 10000.00, 0, 1525514772, 1525514772);
INSERT INTO `dp_odc_user` VALUES (19, 19, 2, 18, 10000.00, 0, 1525514772, 1525514772);
INSERT INTO `dp_odc_user` VALUES (20, 20, 2, 19, 10000.00, 0, 1525514772, 1525514772);
INSERT INTO `dp_odc_user` VALUES (21, 21, 2, 20, 10000.00, 0, 1525514773, 1525514773);
INSERT INTO `dp_odc_user` VALUES (22, 22, 2, 21, 10000.00, 0, 1525514773, 1525514773);
INSERT INTO `dp_odc_user` VALUES (23, 23, 3, 22, 10000.00, 0, 1525514773, 1525514773);
INSERT INTO `dp_odc_user` VALUES (24, 24, 3, 23, 10000.00, 0, 1525514774, 1525514774);
INSERT INTO `dp_odc_user` VALUES (25, 25, 3, 24, 10000.00, 0, 1525514774, 1525514774);
INSERT INTO `dp_odc_user` VALUES (26, 26, 3, 25, 10000.00, 0, 1525514774, 1525514774);
INSERT INTO `dp_odc_user` VALUES (27, 27, 3, 26, 10000.00, 0, 1525514775, 1525514775);
INSERT INTO `dp_odc_user` VALUES (28, 28, 3, 27, 10000.00, 0, 1525514775, 1525514775);
INSERT INTO `dp_odc_user` VALUES (29, 29, 3, 28, 10000.00, 0, 1525514775, 1525514775);
INSERT INTO `dp_odc_user` VALUES (30, 30, 3, 29, 10000.00, 0, 1525514775, 1525514775);
INSERT INTO `dp_odc_user` VALUES (31, 31, 3, 30, 10000.00, 0, 1525514776, 1525514776);
INSERT INTO `dp_odc_user` VALUES (32, 32, 3, 31, 10000.00, 0, 1525514776, 1525514776);
INSERT INTO `dp_odc_user` VALUES (33, 33, 4, 32, 10000.00, 0, 1525514776, 1525514776);
INSERT INTO `dp_odc_user` VALUES (34, 34, 4, 33, 10000.00, 0, 1525514777, 1525514777);
INSERT INTO `dp_odc_user` VALUES (35, 35, 4, 34, 10000.00, 0, 1525514777, 1525514777);
INSERT INTO `dp_odc_user` VALUES (36, 36, 4, 35, 10000.00, 0, 1525514777, 1525514777);
INSERT INTO `dp_odc_user` VALUES (37, 37, 4, 36, 10000.00, 0, 1525514778, 1525514778);
INSERT INTO `dp_odc_user` VALUES (38, 38, 4, 37, 10000.00, 0, 1525514778, 1525514778);
INSERT INTO `dp_odc_user` VALUES (39, 39, 4, 38, 10000.00, 0, 1525514778, 1525514778);
INSERT INTO `dp_odc_user` VALUES (40, 40, 4, 39, 10000.00, 0, 1525514779, 1525514779);
INSERT INTO `dp_odc_user` VALUES (41, 41, 4, 40, 10000.00, 0, 1525514779, 1525514779);
INSERT INTO `dp_odc_user` VALUES (42, 42, 4, 41, 10000.00, 0, 1525514779, 1525514779);
INSERT INTO `dp_odc_user` VALUES (43, 43, 5, 42, 10000.00, 0, 1525514780, 1525514780);
INSERT INTO `dp_odc_user` VALUES (44, 44, 5, 43, 10000.00, 0, 1525514780, 1525514780);
INSERT INTO `dp_odc_user` VALUES (45, 45, 5, 44, 10000.00, 0, 1525514780, 1525514780);
INSERT INTO `dp_odc_user` VALUES (46, 46, 5, 45, 10000.00, 0, 1525514781, 1525514781);
INSERT INTO `dp_odc_user` VALUES (47, 47, 5, 46, 10000.00, 0, 1525514781, 1525514781);
INSERT INTO `dp_odc_user` VALUES (48, 48, 5, 47, 10000.00, 0, 1525514781, 1525514781);
INSERT INTO `dp_odc_user` VALUES (49, 49, 5, 48, 10000.00, 0, 1525514782, 1525514782);
INSERT INTO `dp_odc_user` VALUES (50, 50, 5, 49, 10000.00, 0, 1525514782, 1525514782);
INSERT INTO `dp_odc_user` VALUES (51, 51, 5, 50, 10000.00, 0, 1525514782, 1525514782);
INSERT INTO `dp_odc_user` VALUES (52, 52, 5, 51, 10000.00, 0, 1525514783, 1525514783);
INSERT INTO `dp_odc_user` VALUES (53, 53, 6, 52, 10000.00, 0, 1525514783, 1525514783);
INSERT INTO `dp_odc_user` VALUES (54, 54, 6, 53, 10000.00, 0, 1525514783, 1525514783);
INSERT INTO `dp_odc_user` VALUES (55, 55, 6, 54, 10000.00, 0, 1525514784, 1525514784);
INSERT INTO `dp_odc_user` VALUES (56, 56, 6, 55, 10000.00, 0, 1525514784, 1525514784);
INSERT INTO `dp_odc_user` VALUES (57, 57, 6, 56, 10000.00, 0, 1525514784, 1525514784);
INSERT INTO `dp_odc_user` VALUES (58, 58, 6, 57, 10000.00, 0, 1525514785, 1525514785);
INSERT INTO `dp_odc_user` VALUES (59, 59, 6, 58, 10000.00, 0, 1525514785, 1525514785);
INSERT INTO `dp_odc_user` VALUES (60, 60, 6, 59, 10000.00, 0, 1525514785, 1525514785);
INSERT INTO `dp_odc_user` VALUES (61, 61, 6, 60, 10000.00, 0, 1525514786, 1525514786);
INSERT INTO `dp_odc_user` VALUES (62, 62, 6, 61, 10000.00, 0, 1525514786, 1525514786);
INSERT INTO `dp_odc_user` VALUES (63, 63, NULL, NULL, NULL, 1, 1525514786, 1525514786);
INSERT INTO `dp_odc_user` VALUES (64, 64, NULL, NULL, NULL, 1, 1525514787, 1525514787);
INSERT INTO `dp_odc_user` VALUES (65, 65, NULL, NULL, NULL, 1, 1525514787, 1525514787);
INSERT INTO `dp_odc_user` VALUES (66, 66, NULL, NULL, NULL, 1, 1525514787, 1525514787);
INSERT INTO `dp_odc_user` VALUES (67, 67, NULL, NULL, NULL, 1, 1525514788, 1525514788);
INSERT INTO `dp_odc_user` VALUES (68, 68, NULL, NULL, NULL, 1, 1525514788, 1525514788);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
