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

 Date: 05/05/2018 17:10:56
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
) ENGINE=MyISAM AUTO_INCREMENT=71 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='行为日志表';

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
) ENGINE=MyISAM AUTO_INCREMENT=549 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='后台菜单表';

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
INSERT INTO `dp_admin_menu` VALUES (548, 545, 'odc', 'Delete', '', 'module_admin', 'odc/order/delete', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (547, 545, 'odc', 'Edit', '', 'module_admin', 'odc/order/edit', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (545, 540, 'odc', 'Order', 'fa fa-fw fa-list', 'module_admin', 'odc/order/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (546, 545, 'odc', 'Create', '', 'module_admin', 'odc/order/add', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (542, 541, 'odc', 'Create', '', 'module_admin', 'odc/bazaar/add', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (543, 541, 'odc', 'Edit', '', 'module_admin', 'odc/bazaar/edit', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (544, 541, 'odc', 'Delete', '', 'module_admin', 'odc/bazaar/delete', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (541, 540, 'odc', 'bazaar', 'fa fa-fw fa-list', 'module_admin', 'odc/bazaar/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (538, 536, 'odc', 'Edit', '', 'module_admin', 'odc/u_inventory/edit', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (539, 536, 'odc', 'Delete', '', 'module_admin', 'odc/u_inventory/delete', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (540, 493, 'odc', 'ODC_Bazaar', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (537, 536, 'odc', 'Create', '', 'module_admin', 'odc/u_inventory/add', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (535, 532, 'odc', 'Delete', '', 'module_admin', 'odc/u_product/delete', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (536, 519, 'odc', 'Inventory', 'fa fa-fw fa-recycle', 'module_admin', 'odc/u_inventory/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (534, 532, 'odc', 'Edit', '', 'module_admin', 'odc/u_product/edit', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (533, 532, 'odc', 'Create', '', 'module_admin', 'odc/u_product/add', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (532, 519, 'odc', 'Product', 'fa fa-fw fa-file-word-o', 'module_admin', 'odc/u_product/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (529, 528, 'odc', 'Create', '', 'module_admin', 'odc/u_category/add', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (531, 528, 'odc', 'Delete', '', 'module_admin', 'odc/u_category/delete', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (530, 528, 'odc', 'Edit', '', 'module_admin', 'odc/u_category/edit', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (528, 519, 'odc', 'Category', 'fa fa-fw fa-recycle', 'module_admin', 'odc/u_category/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (523, 520, 'odc', 'Delete', '', 'module_admin', 'odc/u_address/delete', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (521, 520, 'odc', 'Create', '', 'module_admin', 'odc/u_address/add', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (522, 520, 'odc', 'Edit', '', 'module_admin', 'odc/u_address/edit', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (519, 493, 'odc', 'ODC_User', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (520, 519, 'odc', 'Address', 'fa fa-fw fa-list', 'module_admin', 'odc/u_address/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (518, 515, 'odc', 'Delete', '', 'module_admin', 'odc/mg_inventory/delete', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (516, 515, 'odc', 'Create', '', 'module_admin', 'odc/mg_inventory/add', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (517, 515, 'odc', 'Edit', '', 'module_admin', 'odc/mg_inventory/edit', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (515, 494, 'odc', 'Inventory', 'fa fa-fw fa-recycle', 'module_admin', 'odc/mg_inventory/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (513, 511, 'odc', 'Edit', '', 'module_admin', 'odc/mg_product/edit', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (514, 511, 'odc', 'Delete', '', 'module_admin', 'odc/mg_product/delete', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (512, 511, 'odc', 'Create', '', 'module_admin', 'odc/mg_product/add', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (511, 494, 'odc', 'Product', 'fa fa-fw fa-file-word-o', 'module_admin', 'odc/mg_product/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (509, 507, 'odc', 'Edit', '', 'module_admin', 'odc/mg_category/edit', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (510, 507, 'odc', 'Delete', '', 'module_admin', 'odc/mg_category/delete', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (508, 507, 'odc', 'Create', '', 'module_admin', 'odc/mg_category/add', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (507, 494, 'odc', 'Category', 'fa fa-fw fa-recycle', 'module_admin', 'odc/mg_category/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (506, 503, 'odc', 'Delete', '', 'module_admin', 'odc/mg_region/delete', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (505, 503, 'odc', 'Edit', '', 'module_admin', 'odc/mg_region/edit', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (504, 503, 'odc', 'Create', '', 'module_admin', 'odc/mg_region/add', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (502, 499, 'odc', 'Delete', '', 'module_admin', 'odc/mg_user/delete', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (503, 494, 'odc', 'Region', 'fa fa-fw fa-list', 'module_admin', 'odc/mg_region/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (500, 499, 'odc', 'Create', '', 'module_admin', 'odc/mg_user/add', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (501, 499, 'odc', 'Edit', '', 'module_admin', 'odc/mg_user/edit', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (499, 494, 'odc', 'User', 'fa fa-fw fa-list', 'module_admin', 'odc/mg_user/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (498, 495, 'odc', 'Delete', '', 'module_admin', 'odc/mg_address/delete', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (497, 495, 'odc', 'Edit', '', 'module_admin', 'odc/mg_address/edit', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (496, 495, 'odc', 'Create', '', 'module_admin', 'odc/mg_address/add', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (495, 494, 'odc', 'Address', 'fa fa-fw fa-list', 'module_admin', 'odc/mg_address/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (494, 493, 'odc', 'ODC_Manager', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
INSERT INTO `dp_admin_menu` VALUES (493, 0, 'odc', 'ODC', 'fa fa-fw fa-newspaper-o', 'module_admin', 'odc/index/index', '_self', 0, 1525502591, 1525502591, 100, 0, 1, '');
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
) ENGINE=MyISAM AUTO_INCREMENT=9 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='模块表';

-- ----------------------------
-- Records of dp_admin_module
-- ----------------------------
BEGIN;
INSERT INTO `dp_admin_module` VALUES (1, 'admin', '系统', 'fa fa-fw fa-gear', '系统模块，DolphinPHP的核心模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'admin.dolphinphp.module', 1, 1468204902, 1468204902, 100, 1);
INSERT INTO `dp_admin_module` VALUES (2, 'user', '用户', 'fa fa-fw fa-user', '用户模块，DolphinPHP自带模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'user.dolphinphp.module', 1, 1468204902, 1468204902, 100, 1);
INSERT INTO `dp_admin_module` VALUES (8, 'odc', 'ODC', 'fa fa-fw fa-newspaper-o', 'ODC模块', 'worldli', '', NULL, NULL, '1.0.0', 'odc.wl.module', 0, 1525502591, 1525502591, 100, 1);
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
INSERT INTO `dp_admin_role` VALUES (2, 3, 'user', 'user', '[\"1\",\"2\",\"3\",\"51\",\"70\",\"212\",\"213\",\"222\",\"223\",\"224\",\"493\",\"519\",\"520\",\"521\",\"522\",\"523\",\"524\",\"525\",\"526\",\"527\",\"528\",\"529\",\"530\",\"531\",\"532\",\"533\",\"534\",\"535\",\"536\",\"537\",\"538\",\"539\",\"540\",\"541\",\"542\",\"543\",\"544\",\"545\",\"546\",\"547\",\"548\"]', 100, 1524281342, 1525502833, 1, 1, 1);
INSERT INTO `dp_admin_role` VALUES (3, 1, 'Manager', 'Manager', '[\"1\",\"2\",\"3\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"51\",\"67\",\"68\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"212\",\"213\",\"214\",\"215\",\"216\",\"217\",\"218\",\"219\",\"220\",\"221\",\"222\",\"223\",\"224\",\"493\",\"494\",\"495\",\"496\",\"497\",\"498\",\"499\",\"500\",\"501\",\"502\",\"503\",\"504\",\"505\",\"506\",\"507\",\"508\",\"509\",\"510\",\"511\",\"512\",\"513\",\"514\",\"515\",\"516\",\"517\",\"518\",\"540\",\"541\",\"542\",\"543\",\"544\",\"545\",\"546\",\"547\",\"548\"]', 100, 1524291162, 1525502849, 1, 1, 1);
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
) ENGINE=MyISAM AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC COMMENT='用户表';

-- ----------------------------
-- Records of dp_admin_user
-- ----------------------------
BEGIN;
INSERT INTO `dp_admin_user` VALUES (1, 'admin', 'administrator', '$2y$10$Brw6wmuSLIIx3Yabid8/Wu5l8VQ9M/H/CG3C9RqN9dUCwZW3ljGOK', '', 0, '', 0, 0, 0.00, 0, 1, 0, 0, 1476065410, 1525495988, 1525495988, 0, 100, 1);
INSERT INTO `dp_admin_user` VALUES (2, 'user10', 'user10', '$2y$10$5k/fs1HR4S1bIqdW/ZDcpupD3kT2gdbZKXFV2Y5aMFZnzE/2mJWZC', 'user10@qq.com', 0, '', 0, 0, 0.00, 0, 2, 0, 0, 1525510725, 1525510725, 0, 0, 100, 1);
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
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dp_odc_address
-- ----------------------------
BEGIN;
INSERT INTO `dp_odc_address` VALUES (1, 2, 'user10.user10.user10.user10.us', 1, 0, 0);
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

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
INSERT INTO `dp_odc_region` VALUES (1, 2, 'Center America', 'Center America Warehouse', 'Panama', 'Center America warehouse', 'Center America warehouse', 1524237035, 1525015259);
INSERT INTO `dp_odc_region` VALUES (2, 2, 'North America', 'North America warehouse', 'South Halsted Chicago IL US', 'North America warehouse', 'North America warehouse', 1524273965, 1525015040);
INSERT INTO `dp_odc_region` VALUES (3, 2, 'South America', 'South America warehouse', 'Rio  Brazil', 'South America warehouse', 'South America', 1524273976, 1525015087);
INSERT INTO `dp_odc_region` VALUES (4, 1, 'Africa/Middle East', 'Africa/Middle East warehouse', 'South Africa', 'Africa/Middle East warehouse', 'Africa/Middle East', 1524273988, 1525015130);
INSERT INTO `dp_odc_region` VALUES (5, 2, 'Asia', 'Asia warehouse', 'Beijing China', 'Asia warehouse', 'Asia', 1524273995, 1525015176);
INSERT INTO `dp_odc_region` VALUES (6, 1, 'Europe', 'Europe warehouse', 'London UK', 'Europe warehouse', 'Europe ', 1524274005, 1525015233);
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
) ENGINE=InnoDB AUTO_INCREMENT=3 DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

-- ----------------------------
-- Records of dp_odc_user
-- ----------------------------
BEGIN;
INSERT INTO `dp_odc_user` VALUES (1, 1, 9, 1, NULL, 1, NULL, NULL);
INSERT INTO `dp_odc_user` VALUES (2, 2, 12, 1, NULL, 0, 1525510725, 1525510725);
COMMIT;

SET FOREIGN_KEY_CHECKS = 1;
