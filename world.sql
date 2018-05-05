-- phpMyAdmin SQL Dump
-- version 4.8.0
-- https://www.phpmyadmin.net/
--
-- Host: 127.0.0.1
-- Generation Time: May 04, 2018 at 05:49 PM
-- Server version: 10.1.31-MariaDB
-- PHP Version: 7.2.4

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Database: `world`
--

-- --------------------------------------------------------

--
-- Table structure for table `admin_access`
--

CREATE TABLE `admin_access` (
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模型名称',
  `group` varchar(16) NOT NULL DEFAULT '' COMMENT '权限分组标识',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `nid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '授权节点id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='统一授权表';

-- --------------------------------------------------------

--
-- Table structure for table `admin_action`
--

CREATE TABLE `admin_action` (
  `id` int(11) UNSIGNED NOT NULL,
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '所属模块名',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '行为标题',
  `remark` varchar(128) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统行为表';

--
-- Dumping data for table `admin_action`
--

INSERT INTO `admin_action` (`id`, `module`, `name`, `title`, `remark`, `rule`, `log`, `status`, `create_time`, `update_time`) VALUES
(1, 'user', 'user_add', '添加用户', '添加用户', '', '[user|get_nickname] 添加了用户：[record|get_nickname]', 1, 1480156399, 1480163853),
(2, 'user', 'user_edit', 'Edit用户', 'Edit用户', '', '[user|get_nickname] Edit了用户：[details]', 1, 1480164578, 1480297748),
(3, 'user', 'user_delete', 'Delete用户', 'Delete用户', '', '[user|get_nickname] Delete了用户：[details]', 1, 1480168582, 1480168616),
(4, 'user', 'user_enable', '启用用户', '启用用户', '', '[user|get_nickname] 启用了用户：[details]', 1, 1480169185, 1480169185),
(5, 'user', 'user_disable', '禁用用户', '禁用用户', '', '[user|get_nickname] 禁用了用户：[details]', 1, 1480169214, 1480170581),
(6, 'user', 'user_access', '用户授权', '用户授权', '', '[user|get_nickname] 对用户：[record|get_nickname] 进行了授权操作。详情：[details]', 1, 1480221441, 1480221563),
(7, 'user', 'role_add', '添加角色', '添加角色', '', '[user|get_nickname] 添加了角色：[details]', 1, 1480251473, 1480251473),
(8, 'user', 'role_edit', 'Edit角色', 'Edit角色', '', '[user|get_nickname] Edit了角色：[details]', 1, 1480252369, 1480252369),
(9, 'user', 'role_delete', 'Delete角色', 'Delete角色', '', '[user|get_nickname] Delete了角色：[details]', 1, 1480252580, 1480252580),
(10, 'user', 'role_enable', '启用角色', '启用角色', '', '[user|get_nickname] 启用了角色：[details]', 1, 1480252620, 1480252620),
(11, 'user', 'role_disable', '禁用角色', '禁用角色', '', '[user|get_nickname] 禁用了角色：[details]', 1, 1480252651, 1480252651),
(12, 'user', 'attachment_enable', '启用附件', '启用附件', '', '[user|get_nickname] 启用了附件：附件ID([details])', 1, 1480253226, 1480253332),
(13, 'user', 'attachment_disable', '禁用附件', '禁用附件', '', '[user|get_nickname] 禁用了附件：附件ID([details])', 1, 1480253267, 1480253340),
(14, 'user', 'attachment_delete', 'Delete附件', 'Delete附件', '', '[user|get_nickname] Delete了附件：附件ID([details])', 1, 1480253323, 1480253323),
(15, 'admin', 'config_add', '添加配置', '添加配置', '', '[user|get_nickname] 添加了配置，[details]', 1, 1480296196, 1480296196),
(16, 'admin', 'config_edit', 'Edit配置', 'Edit配置', '', '[user|get_nickname] Edit了配置：[details]', 1, 1480296960, 1480296960),
(17, 'admin', 'config_enable', '启用配置', '启用配置', '', '[user|get_nickname] 启用了配置：[details]', 1, 1480298479, 1480298479),
(18, 'admin', 'config_disable', '禁用配置', '禁用配置', '', '[user|get_nickname] 禁用了配置：[details]', 1, 1480298506, 1480298506),
(19, 'admin', 'config_delete', 'Delete配置', 'Delete配置', '', '[user|get_nickname] Delete了配置：[details]', 1, 1480298532, 1480298532),
(20, 'admin', 'database_export', '备份数据库', '备份数据库', '', '[user|get_nickname] 备份了数据库：[details]', 1, 1480298946, 1480298946),
(21, 'admin', 'database_import', '还原数据库', '还原数据库', '', '[user|get_nickname] 还原了数据库：[details]', 1, 1480301990, 1480302022),
(22, 'admin', 'database_optimize', '优化数据表', '优化数据表', '', '[user|get_nickname] 优化了数据表：[details]', 1, 1480302616, 1480302616),
(23, 'admin', 'database_repair', '修复数据表', '修复数据表', '', '[user|get_nickname] 修复了数据表：[details]', 1, 1480302798, 1480302798),
(24, 'admin', 'database_backup_delete', 'Delete数据库备份', 'Delete数据库备份', '', '[user|get_nickname] Delete了数据库备份：[details]', 1, 1480302870, 1480302870),
(25, 'admin', 'hook_add', '添加钩子', '添加钩子', '', '[user|get_nickname] 添加了钩子：[details]', 1, 1480303198, 1480303198),
(26, 'admin', 'hook_edit', 'Edit钩子', 'Edit钩子', '', '[user|get_nickname] Edit了钩子：[details]', 1, 1480303229, 1480303229),
(27, 'admin', 'hook_delete', 'Delete钩子', 'Delete钩子', '', '[user|get_nickname] Delete了钩子：[details]', 1, 1480303264, 1480303264),
(28, 'admin', 'hook_enable', '启用钩子', '启用钩子', '', '[user|get_nickname] 启用了钩子：[details]', 1, 1480303294, 1480303294),
(29, 'admin', 'hook_disable', '禁用钩子', '禁用钩子', '', '[user|get_nickname] 禁用了钩子：[details]', 1, 1480303409, 1480303409),
(30, 'admin', 'menu_add', '添加节点', '添加节点', '', '[user|get_nickname] 添加了节点：[details]', 1, 1480305468, 1480305468),
(31, 'admin', 'menu_edit', 'Edit节点', 'Edit节点', '', '[user|get_nickname] Edit了节点：[details]', 1, 1480305513, 1480305513),
(32, 'admin', 'menu_delete', 'Delete节点', 'Delete节点', '', '[user|get_nickname] Delete了节点：[details]', 1, 1480305562, 1480305562),
(33, 'admin', 'menu_enable', '启用节点', '启用节点', '', '[user|get_nickname] 启用了节点：[details]', 1, 1480305630, 1480305630),
(34, 'admin', 'menu_disable', '禁用节点', '禁用节点', '', '[user|get_nickname] 禁用了节点：[details]', 1, 1480305659, 1480305659),
(35, 'admin', 'module_install', '安装模块', '安装模块', '', '[user|get_nickname] 安装了模块：[details]', 1, 1480307558, 1480307558),
(36, 'admin', 'module_uninstall', '卸载模块', '卸载模块', '', '[user|get_nickname] 卸载了模块：[details]', 1, 1480307588, 1480307588),
(37, 'admin', 'module_enable', '启用模块', '启用模块', '', '[user|get_nickname] 启用了模块：[details]', 1, 1480307618, 1480307618),
(38, 'admin', 'module_disable', '禁用模块', '禁用模块', '', '[user|get_nickname] 禁用了模块：[details]', 1, 1480307653, 1480307653),
(39, 'admin', 'module_export', '导出模块', '导出模块', '', '[user|get_nickname] 导出了模块：[details]', 1, 1480307682, 1480307682),
(40, 'admin', 'packet_install', '安装数据包', '安装数据包', '', '[user|get_nickname] 安装了数据包：[details]', 1, 1480308342, 1480308342),
(41, 'admin', 'packet_uninstall', '卸载数据包', '卸载数据包', '', '[user|get_nickname] 卸载了数据包：[details]', 1, 1480308372, 1480308372),
(42, 'admin', 'system_config_update', '更新系统设置', '更新系统设置', '', '[user|get_nickname] 更新了系统设置：[details]', 1, 1480309555, 1480309642);

-- --------------------------------------------------------

--
-- Table structure for table `admin_attachment`
--

CREATE TABLE `admin_attachment` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(128) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` char(8) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `width` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片高度'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表';

-- --------------------------------------------------------

--
-- Table structure for table `admin_config`
--

CREATE TABLE `admin_config` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统配置表';

--
-- Dumping data for table `admin_config`
--

INSERT INTO `admin_config` (`id`, `name`, `title`, `group`, `type`, `value`, `options`, `tips`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 'web_site_status', '站点开关', 'base', 'switch', '1', '', '站点关闭后将不能访问，后台可正常登录', '', '', '', '', '', 2, '', '', '', '', 1475240395, 1477403914, 1, 1),
(2, 'web_site_title', '站点标题', 'base', 'text', 'PHP', '', '调用方式：<code>config(\'web_site_title\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475240646, 1477710341, 2, 1),
(3, 'web_site_slogan', '站点标语', 'base', 'text', 'PHP，极简、极速、极致', '', '站点口号，调用方式：<code>config(\'web_site_slogan\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475240994, 1477710357, 3, 1),
(4, 'web_site_logo', '站点LOGO', 'base', 'image', '', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241067, 1475241067, 4, 1),
(5, 'web_site_description', '站点描述', 'base', 'textarea', '', '', '网站描述，有利于搜索引擎抓取相关信息', '', '', '', '', '', 2, '', '', '', '', 1475241186, 1475241186, 6, 1),
(6, 'web_site_keywords', '站点关键词', 'base', 'text', 'PHP、PHP开发框架、后台框架', '', '网站搜索引擎关键字', '', '', '', '', '', 2, '', '', '', '', 1475241328, 1475241328, 7, 1),
(7, 'web_site_copyright', '版权信息', 'base', 'text', 'Copyright © 2015-2017 PHP All rights reserved.', '', '调用方式：<code>config(\'web_site_copyright\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241416, 1477710383, 8, 1),
(8, 'web_site_icp', '备案信息', 'base', 'text', '', '', '调用方式：<code>config(\'web_site_icp\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241441, 1477710441, 9, 1),
(9, 'web_site_statistics', '站点统计', 'base', 'textarea', '', '', '网站统计代码，支持百度、Google、cnzz等，调用方式：<code>config(\'web_site_statistics\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241498, 1477710455, 10, 1),
(10, 'config_group', '配置分组', 'system', 'array', 'base:基本\r\nsystem:系统\r\nupload:上传\r\ndevelop:开发\r\ndatabase:数据库', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241716, 1477649446, 100, 1),
(11, 'form_item_type', '配置类型', 'system', 'array', 'text:单行文本\r\ntextarea:多行文本\r\nstatic:静态文本\r\npassword:密码\r\ncheckbox:复选框\r\nradio:单选按钮\r\ndate:日期\r\ndatetime:日期+时间\r\nhidden:隐藏\r\nswitch:开关\r\narray:数组\r\nselect:下拉框\r\nlinkage:普通联动下拉框\r\nlinkages:快速联动下拉框\r\nimage:单张图片\r\nimages:多张图片\r\nfile:单个文件\r\nfiles:多个文件\r\nueditor:UEditor Edit器\r\nwangeditor:wangEditor Edit器\r\neditormd:markdown Edit器\r\nckeditor:ckeditor Edit器\r\nicon:字体图标\r\ntags:标签\r\nnumber:数字\r\nbmap:百度地图\r\ncolorpicker:取色器\r\njcrop:图片裁剪\r\nmasked:格式文本\r\nrange:范围\r\ntime:时间', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241835, 1495853193, 100, 1),
(12, 'upload_file_size', '文件上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', 2, '', '', '', '', 1475241897, 1477663520, 100, 1),
(13, 'upload_file_ext', '允许上传的文件后缀', 'upload', 'tags', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', 2, '', '', '', '', 1475241975, 1477649489, 100, 1),
(14, 'upload_image_size', '图片上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', 2, '', '', '', '', 1475242015, 1477663529, 100, 1),
(15, 'upload_image_ext', '允许上传的图片后缀', 'upload', 'tags', 'gif,jpg,jpeg,bmp,png', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', 2, '', '', '', '', 1475242056, 1477649506, 100, 1),
(16, 'list_rows', '分页数量', 'system', 'number', '20', '', '每页的记录数', '', '', '', '', '', 2, '', '', '', '', 1475242066, 1476074507, 101, 1),
(17, 'system_color', '后台配色方案', 'system', 'radio', 'default', 'default:Default\r\namethyst:Amethyst\r\ncity:City\r\nflat:Flat\r\nmodern:Modern\r\nsmooth:Smooth', '', '', '', '', '', '', 2, '', '', '', '', 1475250066, 1477316689, 102, 1),
(18, 'develop_mode', '开发模式', 'develop', 'radio', '1', '0:关闭\r\n1:开启', '', '', '', '', '', '', 2, '', '', '', '', 1476864205, 1476864231, 100, 1),
(19, 'app_trace', '显示页面Trace', 'develop', 'radio', '0', '0:否\r\n1:是', '', '', '', '', '', '', 2, '', '', '', '', 1476866355, 1476866355, 100, 1),
(21, 'data_backup_path', '数据库备份根路径', 'database', 'text', '../data/', '', '路径必须以 / 结尾', '', '', '', '', '', 2, '', '', '', '', 1477017745, 1477018467, 100, 1),
(22, 'data_backup_part_size', '数据库备份卷大小', 'database', 'text', '20971520', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', '', '', '', '', 2, '', '', '', '', 1477017886, 1477017886, 100, 1),
(23, 'data_backup_compress', '数据库备份文件是否启用压缩', 'database', 'radio', '1', '0:否\r\n1:是', '压缩备份文件需要PHP环境支持 <code>gzopen</code>, <code>gzwrite</code>函数', '', '', '', '', '', 2, '', '', '', '', 1477017978, 1477018172, 100, 1),
(24, 'data_backup_compress_level', '数据库备份文件压缩级别', 'database', 'radio', '9', '1:最低\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', '', '', '', '', 2, '', '', '', '', 1477018083, 1477018083, 100, 1),
(25, 'top_menu_max', '顶部导航模块数量', 'system', 'text', '10', '', '设置顶部导航默认显示的模块数量', '', '', '', '', '', 2, '', '', '', '', 1477579289, 1477579289, 103, 1),
(26, 'web_site_logo_text', '站点LOGO文字', 'base', 'image', '', '', '', '', '', '', '', '', 2, '', '', '', '', 1477620643, 1477620643, 5, 1),
(27, 'upload_image_thumb', '缩略图尺寸', 'upload', 'text', '', '', '不填写则不生成缩略图，如需生成 <code>300x300</code> 的缩略图，则填写 <code>300,300</code> ，请注意，逗号必须是英文逗号', '', '', '', '', '', 2, '', '', '', '', 1477644150, 1477649513, 100, 1),
(28, 'upload_image_thumb_type', '缩略图裁剪类型', 'upload', 'radio', '1', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放', '该项配置只有在启用生成缩略图时才生效', '', '', '', '', '', 2, '', '', '', '', 1477646271, 1477649521, 100, 1),
(29, 'upload_thumb_water', '添加水印', 'upload', 'switch', '0', '', '', '', '', '', '', '', 2, '', '', '', '', 1477649648, 1477649648, 100, 1),
(30, 'upload_thumb_water_pic', '水印图片', 'upload', 'image', '', '', '只有开启水印功能才生效', '', '', '', '', '', 2, '', '', '', '', 1477656390, 1477656390, 100, 1),
(31, 'upload_thumb_water_position', '水印位置', 'upload', 'radio', '9', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '', '', '', '', '', 2, '', '', '', '', 1477656528, 1477656528, 100, 1),
(32, 'upload_thumb_water_alpha', '水印透明度', 'upload', 'text', '50', '', '请输入0~100之间的数字，数字越小，透明度越高', '', '', '', '', '', 2, '', '', '', '', 1477656714, 1477661309, 100, 1),
(33, 'wipe_cache_type', '清除缓存类型', 'system', 'checkbox', 'TEMP_PATH', 'TEMP_PATH:应用缓存\r\nLOG_PATH:应用日志\r\nCACHE_PATH:项目模板缓存', '清除缓存时，要Delete的缓存类型', '', '', '', '', '', 2, '', '', '', '', 1477727305, 1477727305, 100, 1),
(34, 'captcha_signin', '后台验证码开关', 'system', 'switch', '0', '', '后台登录时是否需要验证码', '', '', '', '', '', 2, '', '', '', '', 1478771958, 1478771958, 99, 1),
(35, 'home_default_module', '前台默认模块', 'system', 'select', 'index', '', '前台默认访问的模块，该模块必须有Index控制器和index方法', '', '', '', '', '', 0, '', '', '', '', 1486714723, 1486715620, 104, 1),
(36, 'minify_status', '开启minify', 'system', 'switch', '0', '', '开启minify会压缩合并js、css文件，可以减少资源请求次数，如果不支持minify，可关闭', '', '', '', '', '', 0, '', '', '', '', 1487035843, 1487035843, 99, 1),
(37, 'upload_driver', '上传驱动', 'upload', 'radio', 'local', 'local:本地', '图片或文件上传驱动', '', '', '', '', '', 0, '', '', '', '', 1501488567, 1501490821, 100, 1),
(38, 'system_log', '系统日志', 'system', 'switch', '1', '', '是否开启系统日志功能', '', '', '', '', '', 0, '', '', '', '', 1512635391, 1512635391, 99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_hook`
--

CREATE TABLE `admin_hook` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子来自哪个插件',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子描述',
  `system` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为系统钩子',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='钩子表';

--
-- Dumping data for table `admin_hook`
--

INSERT INTO `admin_hook` (`id`, `name`, `plugin`, `description`, `system`, `create_time`, `update_time`, `status`) VALUES
(1, 'admin_index', '', '后台首页', 1, 1468174214, 1477757518, 1),
(2, 'plugin_index_tab_list', '', '插件扩展tab钩子', 1, 1468174214, 1468174214, 1),
(3, 'module_index_tab_list', '', '模块扩展tab钩子', 1, 1468174214, 1468174214, 1),
(4, 'page_tips', '', '每个页面的提示', 1, 1468174214, 1468174214, 1),
(5, 'signin_footer', '', '登录页面底部钩子', 1, 1479269315, 1479269315, 1),
(6, 'signin_captcha', '', '登录页面验证码钩子', 1, 1479269315, 1479269315, 1),
(7, 'signin', '', '登录控制器钩子', 1, 1479386875, 1479386875, 1),
(8, 'upload_attachment', '', '附件上传钩子', 1, 1501493808, 1501493808, 1),
(9, 'page_plugin_js', '', '页面插件js钩子', 1, 1503633591, 1503633591, 1),
(10, 'page_plugin_css', '', '页面插件css钩子', 1, 1503633591, 1503633591, 1),
(11, 'signin_sso', '', '单点登录钩子', 1, 1503633591, 1503633591, 1),
(12, 'signout_sso', '', '单点退出钩子', 1, 1503633591, 1503633591, 1),
(13, 'user_add', '', '添加用户钩子', 1, 1503633591, 1503633591, 1),
(14, 'user_edit', '', 'Edit用户钩子', 1, 1503633591, 1503633591, 1),
(15, 'user_delete', '', 'Delete用户钩子', 1, 1503633591, 1503633591, 1),
(16, 'user_enable', '', '启用用户钩子', 1, 1503633591, 1503633591, 1),
(17, 'user_disable', '', '禁用用户钩子', 1, 1503633591, 1503633591, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_hook_plugin`
--

CREATE TABLE `admin_hook_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `hook` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子id',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标识',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='钩子-插件对应表';

--
-- Dumping data for table `admin_hook_plugin`
--

INSERT INTO `admin_hook_plugin` (`id`, `hook`, `plugin`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 'admin_index', 'SystemInfo', 1477757503, 1477757503, 1, 1),
(2, 'admin_index', 'DevTeam', 1477755780, 1477755780, 2, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_icon`
--

CREATE TABLE `admin_icon` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '图标名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图标css地址',
  `prefix` varchar(32) NOT NULL DEFAULT '' COMMENT '图标前缀',
  `font_family` varchar(32) NOT NULL DEFAULT '' COMMENT '字体名',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图标表';

-- --------------------------------------------------------

--
-- Table structure for table `admin_icon_list`
--

CREATE TABLE `admin_icon_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '所属图标id',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '图标标题',
  `class` varchar(255) NOT NULL DEFAULT '' COMMENT '图标类名',
  `code` varchar(128) NOT NULL DEFAULT '' COMMENT '图标关键词'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='详细图标列表';

-- --------------------------------------------------------

--
-- Table structure for table `admin_log`
--

CREATE TABLE `admin_log` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `action_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` longtext NOT NULL COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行为日志表' ROW_FORMAT=FIXED;

-- --------------------------------------------------------

--
-- Table structure for table `admin_menu`
--

CREATE TABLE `admin_menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模块名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url_type` varchar(16) NOT NULL DEFAULT '' COMMENT '链接类型（link：外链，module：模块）',
  `url_value` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `url_target` varchar(16) NOT NULL DEFAULT '_self' COMMENT '链接打开方式：_blank,_self',
  `online_hide` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '网站上线后是否隐藏',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `system_menu` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为系统菜单，系统菜单不可Delete',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `params` varchar(255) NOT NULL DEFAULT '' COMMENT '参数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台菜单表';

--
-- Dumping data for table `admin_menu`
--

INSERT INTO `admin_menu` (`id`, `pid`, `module`, `title`, `icon`, `url_type`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`) VALUES
(1, 0, 'admin', '首页', 'fa fa-fw fa-home', 'module_admin', 'admin/index/index', '_self', 0, 1467617722, 1477710540, 1, 1, 1, ''),
(2, 1, 'admin', '快捷操作', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1467618170, 1477710695, 1, 1, 1, ''),
(3, 2, 'admin', '清空缓存', 'fa fa-fw fa-trash-o', 'module_admin', 'admin/index/wipecache', '_self', 0, 1467618273, 1489049773, 3, 1, 1, ''),
(4, 0, 'admin', '系统', 'fa fa-fw fa-gear', 'module_admin', 'admin/system/index', '_self', 0, 1467618361, 1477710540, 2, 1, 1, ''),
(5, 4, 'admin', '系统功能', 'si si-wrench', 'module_admin', '', '_self', 0, 1467618441, 1477710695, 1, 1, 1, ''),
(6, 5, 'admin', '系统设置', 'fa fa-fw fa-wrench', 'module_admin', 'admin/system/index', '_self', 0, 1467618490, 1477710695, 1, 1, 1, ''),
(7, 5, 'admin', '配置管理', 'fa fa-fw fa-gears', 'module_admin', 'admin/config/index', '_self', 0, 1467618618, 1477710695, 2, 1, 1, ''),
(8, 7, 'admin', 'Create', '', 'module_admin', 'admin/config/add', '_self', 0, 1467618648, 1477710695, 1, 1, 1, ''),
(9, 7, 'admin', 'Edit', '', 'module_admin', 'admin/config/edit', '_self', 0, 1467619566, 1477710695, 2, 1, 1, ''),
(10, 7, 'admin', 'Delete', '', 'module_admin', 'admin/config/delete', '_self', 0, 1467619583, 1477710695, 3, 1, 1, ''),
(11, 7, 'admin', '启用', '', 'module_admin', 'admin/config/enable', '_self', 0, 1467619609, 1477710695, 4, 1, 1, ''),
(12, 7, 'admin', '禁用', '', 'module_admin', 'admin/config/disable', '_self', 0, 1467619637, 1477710695, 5, 1, 1, ''),
(13, 5, 'admin', '节点管理', 'fa fa-fw fa-bars', 'module_admin', 'admin/menu/index', '_self', 0, 1467619882, 1477710695, 3, 1, 1, ''),
(14, 13, 'admin', 'Create', '', 'module_admin', 'admin/menu/add', '_self', 0, 1467619902, 1477710695, 1, 1, 1, ''),
(15, 13, 'admin', 'Edit', '', 'module_admin', 'admin/menu/edit', '_self', 0, 1467620331, 1477710695, 2, 1, 1, ''),
(16, 13, 'admin', 'Delete', '', 'module_admin', 'admin/menu/delete', '_self', 0, 1467620363, 1477710695, 3, 1, 1, ''),
(17, 13, 'admin', '启用', '', 'module_admin', 'admin/menu/enable', '_self', 0, 1467620386, 1477710695, 4, 1, 1, ''),
(18, 13, 'admin', '禁用', '', 'module_admin', 'admin/menu/disable', '_self', 0, 1467620404, 1477710695, 5, 1, 1, ''),
(19, 68, 'user', '权限管理', 'fa fa-fw fa-key', 'module_admin', '', '_self', 0, 1467688065, 1477710702, 1, 1, 1, ''),
(20, 19, 'user', '用户管理', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', 0, 1467688137, 1477710702, 1, 1, 1, ''),
(21, 20, 'user', 'Create', '', 'module_admin', 'user/index/add', '_self', 0, 1467688177, 1477710702, 1, 1, 1, ''),
(22, 20, 'user', 'Edit', '', 'module_admin', 'user/index/edit', '_self', 0, 1467688202, 1477710702, 2, 1, 1, ''),
(23, 20, 'user', 'Delete', '', 'module_admin', 'user/index/delete', '_self', 0, 1467688219, 1477710702, 3, 1, 1, ''),
(24, 20, 'user', '启用', '', 'module_admin', 'user/index/enable', '_self', 0, 1467688238, 1477710702, 4, 1, 1, ''),
(25, 20, 'user', '禁用', '', 'module_admin', 'user/index/disable', '_self', 0, 1467688256, 1477710702, 5, 1, 1, ''),
(211, 64, 'admin', '日志详情', '', 'module_admin', 'admin/log/details', '_self', 0, 1480299320, 1480299320, 100, 0, 1, ''),
(32, 4, 'admin', '扩展中心', 'si si-social-dropbox', 'module_admin', '', '_self', 0, 1467688853, 1477710695, 2, 1, 1, ''),
(33, 32, 'admin', '模块管理', 'fa fa-fw fa-th-large', 'module_admin', 'admin/module/index', '_self', 0, 1467689008, 1477710695, 1, 1, 1, ''),
(34, 33, 'admin', '导入', '', 'module_admin', 'admin/module/import', '_self', 0, 1467689153, 1477710695, 1, 1, 1, ''),
(35, 33, 'admin', '导出', '', 'module_admin', 'admin/module/export', '_self', 0, 1467689173, 1477710695, 2, 1, 1, ''),
(36, 33, 'admin', '安装', '', 'module_admin', 'admin/module/install', '_self', 0, 1467689192, 1477710695, 3, 1, 1, ''),
(37, 33, 'admin', '卸载', '', 'module_admin', 'admin/module/uninstall', '_self', 0, 1467689241, 1477710695, 4, 1, 1, ''),
(38, 33, 'admin', '启用', '', 'module_admin', 'admin/module/enable', '_self', 0, 1467689294, 1477710695, 5, 1, 1, ''),
(39, 33, 'admin', '禁用', '', 'module_admin', 'admin/module/disable', '_self', 0, 1467689312, 1477710695, 6, 1, 1, ''),
(40, 33, 'admin', '更新', '', 'module_admin', 'admin/module/update', '_self', 0, 1467689341, 1477710695, 7, 1, 1, ''),
(41, 32, 'admin', '插件管理', 'fa fa-fw fa-puzzle-piece', 'module_admin', 'admin/plugin/index', '_self', 0, 1467689527, 1477710695, 2, 1, 1, ''),
(42, 41, 'admin', '导入', '', 'module_admin', 'admin/plugin/import', '_self', 0, 1467689650, 1477710695, 1, 1, 1, ''),
(43, 41, 'admin', '导出', '', 'module_admin', 'admin/plugin/export', '_self', 0, 1467689665, 1477710695, 2, 1, 1, ''),
(44, 41, 'admin', '安装', '', 'module_admin', 'admin/plugin/install', '_self', 0, 1467689680, 1477710695, 3, 1, 1, ''),
(45, 41, 'admin', '卸载', '', 'module_admin', 'admin/plugin/uninstall', '_self', 0, 1467689700, 1477710695, 4, 1, 1, ''),
(46, 41, 'admin', '启用', '', 'module_admin', 'admin/plugin/enable', '_self', 0, 1467689730, 1477710695, 5, 1, 1, ''),
(47, 41, 'admin', '禁用', '', 'module_admin', 'admin/plugin/disable', '_self', 0, 1467689747, 1477710695, 6, 1, 1, ''),
(48, 41, 'admin', '设置', '', 'module_admin', 'admin/plugin/config', '_self', 0, 1467689789, 1477710695, 7, 1, 1, ''),
(49, 41, 'admin', '管理', '', 'module_admin', 'admin/plugin/manage', '_self', 0, 1467689846, 1477710695, 8, 1, 1, ''),
(50, 5, 'admin', '附件管理', 'fa fa-fw fa-cloud-upload', 'module_admin', 'admin/attachment/index', '_self', 0, 1467690161, 1477710695, 4, 1, 1, ''),
(51, 70, 'admin', '文件上传', '', 'module_admin', 'admin/attachment/upload', '_self', 0, 1467690240, 1489049773, 1, 1, 1, ''),
(52, 50, 'admin', '下载', '', 'module_admin', 'admin/attachment/download', '_self', 0, 1467690334, 1477710695, 2, 1, 1, ''),
(53, 50, 'admin', '启用', '', 'module_admin', 'admin/attachment/enable', '_self', 0, 1467690352, 1477710695, 3, 1, 1, ''),
(54, 50, 'admin', '禁用', '', 'module_admin', 'admin/attachment/disable', '_self', 0, 1467690369, 1477710695, 4, 1, 1, ''),
(55, 50, 'admin', 'Delete', '', 'module_admin', 'admin/attachment/delete', '_self', 0, 1467690396, 1477710695, 5, 1, 1, ''),
(56, 41, 'admin', 'Delete', '', 'module_admin', 'admin/plugin/delete', '_self', 0, 1467858065, 1477710695, 11, 1, 1, ''),
(57, 41, 'admin', 'Edit', '', 'module_admin', 'admin/plugin/edit', '_self', 0, 1467858092, 1477710695, 10, 1, 1, ''),
(60, 41, 'admin', 'Create', '', 'module_admin', 'admin/plugin/add', '_self', 0, 1467858421, 1477710695, 9, 1, 1, ''),
(61, 41, 'admin', '执行', '', 'module_admin', 'admin/plugin/execute', '_self', 0, 1467879016, 1477710695, 14, 1, 1, ''),
(62, 13, 'admin', '保存', '', 'module_admin', 'admin/menu/save', '_self', 0, 1468073039, 1477710695, 6, 1, 1, ''),
(64, 5, 'admin', '系统日志', 'fa fa-fw fa-book', 'module_admin', 'admin/log/index', '_self', 0, 1476111944, 1477710695, 6, 0, 1, ''),
(65, 5, 'admin', '数据库管理', 'fa fa-fw fa-database', 'module_admin', 'admin/database/index', '_self', 0, 1476111992, 1477710695, 8, 0, 1, ''),
(66, 32, 'admin', '数据包管理', 'fa fa-fw fa-database', 'module_admin', 'admin/packet/index', '_self', 0, 1476112326, 1477710695, 4, 0, 1, ''),
(67, 19, 'user', '角色管理', 'fa fa-fw fa-users', 'module_admin', 'user/role/index', '_self', 0, 1476113025, 1477710702, 3, 0, 1, ''),
(68, 0, 'user', '用户', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', 0, 1476193348, 1477710540, 3, 0, 1, ''),
(69, 32, 'admin', '钩子管理', 'fa fa-fw fa-anchor', 'module_admin', 'admin/hook/index', '_self', 0, 1476236193, 1477710695, 3, 0, 1, ''),
(70, 2, 'admin', '后台首页', 'fa fa-fw fa-tachometer', 'module_admin', 'admin/index/index', '_self', 0, 1476237472, 1489049773, 1, 0, 1, ''),
(71, 67, 'user', 'Create', '', 'module_admin', 'user/role/add', '_self', 0, 1476256935, 1477710702, 1, 0, 1, ''),
(72, 67, 'user', 'Edit', '', 'module_admin', 'user/role/edit', '_self', 0, 1476256968, 1477710702, 2, 0, 1, ''),
(73, 67, 'user', 'Delete', '', 'module_admin', 'user/role/delete', '_self', 0, 1476256993, 1477710702, 3, 0, 1, ''),
(74, 67, 'user', '启用', '', 'module_admin', 'user/role/enable', '_self', 0, 1476257023, 1477710702, 4, 0, 1, ''),
(75, 67, 'user', '禁用', '', 'module_admin', 'user/role/disable', '_self', 0, 1476257046, 1477710702, 5, 0, 1, ''),
(76, 20, 'user', '授权', '', 'module_admin', 'user/index/access', '_self', 0, 1476375187, 1477710702, 6, 0, 1, ''),
(77, 69, 'admin', 'Create', '', 'module_admin', 'admin/hook/add', '_self', 0, 1476668971, 1477710695, 1, 0, 1, ''),
(78, 69, 'admin', 'Edit', '', 'module_admin', 'admin/hook/edit', '_self', 0, 1476669006, 1477710695, 2, 0, 1, ''),
(79, 69, 'admin', 'Delete', '', 'module_admin', 'admin/hook/delete', '_self', 0, 1476669375, 1477710695, 3, 0, 1, ''),
(80, 69, 'admin', '启用', '', 'module_admin', 'admin/hook/enable', '_self', 0, 1476669427, 1477710695, 4, 0, 1, ''),
(81, 69, 'admin', '禁用', '', 'module_admin', 'admin/hook/disable', '_self', 0, 1476669564, 1477710695, 5, 0, 1, ''),
(183, 66, 'admin', '安装', '', 'module_admin', 'admin/packet/install', '_self', 0, 1476851362, 1477710695, 1, 0, 1, ''),
(184, 66, 'admin', '卸载', '', 'module_admin', 'admin/packet/uninstall', '_self', 0, 1476851382, 1477710695, 2, 0, 1, ''),
(185, 5, 'admin', '行为管理', 'fa fa-fw fa-bug', 'module_admin', 'admin/action/index', '_self', 0, 1476882441, 1477710695, 7, 0, 1, ''),
(186, 185, 'admin', 'Create', '', 'module_admin', 'admin/action/add', '_self', 0, 1476884439, 1477710695, 1, 0, 1, ''),
(187, 185, 'admin', 'Edit', '', 'module_admin', 'admin/action/edit', '_self', 0, 1476884464, 1477710695, 2, 0, 1, ''),
(188, 185, 'admin', '启用', '', 'module_admin', 'admin/action/enable', '_self', 0, 1476884493, 1477710695, 3, 0, 1, ''),
(189, 185, 'admin', '禁用', '', 'module_admin', 'admin/action/disable', '_self', 0, 1476884534, 1477710695, 4, 0, 1, ''),
(190, 185, 'admin', 'Delete', '', 'module_admin', 'admin/action/delete', '_self', 0, 1476884551, 1477710695, 5, 0, 1, ''),
(191, 65, 'admin', '备份数据库', '', 'module_admin', 'admin/database/export', '_self', 0, 1476972746, 1477710695, 1, 0, 1, ''),
(192, 65, 'admin', '还原数据库', '', 'module_admin', 'admin/database/import', '_self', 0, 1476972772, 1477710695, 2, 0, 1, ''),
(193, 65, 'admin', '优化表', '', 'module_admin', 'admin/database/optimize', '_self', 0, 1476972800, 1477710695, 3, 0, 1, ''),
(194, 65, 'admin', '修复表', '', 'module_admin', 'admin/database/repair', '_self', 0, 1476972825, 1477710695, 4, 0, 1, ''),
(195, 65, 'admin', 'Delete备份', '', 'module_admin', 'admin/database/delete', '_self', 0, 1476973457, 1477710695, 5, 0, 1, ''),
(210, 41, 'admin', '快速Edit', '', 'module_admin', 'admin/plugin/quickedit', '_self', 0, 1477713981, 1477713981, 100, 0, 1, ''),
(209, 185, 'admin', '快速Edit', '', 'module_admin', 'admin/action/quickedit', '_self', 0, 1477713939, 1477713939, 100, 0, 1, ''),
(208, 7, 'admin', '快速Edit', '', 'module_admin', 'admin/config/quickedit', '_self', 0, 1477713808, 1477713808, 100, 0, 1, ''),
(207, 69, 'admin', '快速Edit', '', 'module_admin', 'admin/hook/quickedit', '_self', 0, 1477713770, 1477713770, 100, 0, 1, ''),
(212, 2, 'admin', '个人设置', 'fa fa-fw fa-user', 'module_admin', 'admin/index/profile', '_self', 0, 1489049767, 1489049773, 2, 0, 1, ''),
(213, 70, 'admin', '检查版本更新', '', 'module_admin', 'admin/index/checkupdate', '_self', 0, 1490588610, 1490588610, 100, 0, 1, ''),
(214, 68, 'user', '消息管理', 'fa fa-fw fa-comments-o', 'module_admin', '', '_self', 0, 1520492129, 1520492129, 100, 0, 1, ''),
(215, 214, 'user', '消息列表', 'fa fa-fw fa-th-list', 'module_admin', 'user/message/index', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(216, 215, 'user', 'Create', '', 'module_admin', 'user/message/add', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(217, 215, 'user', 'Edit', '', 'module_admin', 'user/message/edit', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(218, 215, 'user', 'Delete', '', 'module_admin', 'user/message/delete', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(219, 215, 'user', '启用', '', 'module_admin', 'user/message/enable', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(220, 215, 'user', '禁用', '', 'module_admin', 'user/message/disable', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(221, 215, 'user', '快速Edit', '', 'module_admin', 'user/message/quickedit', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(222, 2, 'admin', '消息中心', 'fa fa-fw fa-comments-o', 'module_admin', 'admin/message/index', '_self', 0, 1520495992, 1520496254, 100, 0, 1, ''),
(223, 222, 'admin', 'Delete', '', 'module_admin', 'admin/message/delete', '_self', 0, 1520495992, 1520496263, 100, 0, 1, ''),
(224, 222, 'admin', '启用', '', 'module_admin', 'admin/message/enable', '_self', 0, 1520495992, 1520496270, 100, 0, 1, ''),
(225, 32, 'admin', '图标管理', 'fa fa-fw fa-tint', 'module_admin', 'admin/icon/index', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(226, 225, 'admin', 'Create', '', 'module_admin', 'admin/icon/add', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(227, 225, 'admin', 'Edit', '', 'module_admin', 'admin/icon/edit', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(228, 225, 'admin', 'Delete', '', 'module_admin', 'admin/icon/delete', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(229, 225, 'admin', '启用', '', 'module_admin', 'admin/icon/enable', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(230, 225, 'admin', '禁用', '', 'module_admin', 'admin/icon/disable', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(231, 225, 'admin', '快速Edit', '', 'module_admin', 'admin/icon/quickedit', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(232, 225, 'admin', '图标列表', '', 'module_admin', 'admin/icon/items', '_self', 0, 1520923368, 1520923368, 100, 0, 1, ''),
(233, 225, 'admin', '更新图标', '', 'module_admin', 'admin/icon/reload', '_self', 0, 1520931908, 1520931908, 100, 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `admin_message`
--

CREATE TABLE `admin_message` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid_receive` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '接收消息的用户id',
  `uid_send` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发送消息的用户id',
  `type` varchar(128) NOT NULL DEFAULT '' COMMENT '消息分类',
  `content` text NOT NULL COMMENT '消息内容',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `read_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阅读时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表';

-- --------------------------------------------------------

--
-- Table structure for table `admin_module`
--

CREATE TABLE `admin_module` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `system_module` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为系统模块',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模块表';

--
-- Dumping data for table `admin_module`
--

INSERT INTO `admin_module` (`id`, `name`, `title`, `icon`, `description`, `author`, `author_url`, `config`, `access`, `version`, `identifier`, `system_module`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 'admin', '系统', 'fa fa-fw fa-gear', '系统模块，PHP的核心模块', 'PHP', '', '', '', '1.0.0', 'admin.PHP.module', 1, 1468204902, 1468204902, 100, 1),
(2, 'user', '用户', 'fa fa-fw fa-user', '用户模块，PHP自带模块', 'PHP', '', '', '', '1.0.0', 'user.PHP.module', 1, 1468204902, 1468204902, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_packet`
--

CREATE TABLE `admin_packet` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包名',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包标题',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者url',
  `version` varchar(16) NOT NULL,
  `tables` text NOT NULL COMMENT '数据表名',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数据包表';

-- --------------------------------------------------------

--
-- Table structure for table `admin_plugin`
--

CREATE TABLE `admin_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '插件描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text NOT NULL COMMENT '配置信息',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `admin` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否有后台管理',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表';

--
-- Dumping data for table `admin_plugin`
--

INSERT INTO `admin_plugin` (`id`, `name`, `title`, `icon`, `description`, `author`, `author_url`, `config`, `version`, `identifier`, `admin`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 'SystemInfo', '系统环境信息', 'fa fa-fw fa-info-circle', '在后台首页显示服务器信息', '蔡伟明', 'http://www.caiweiming.com', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'system_info.ming.plugin', 0, 1477757503, 1477757503, 100, 1),
(2, 'DevTeam', '开发团队成员信息', 'fa fa-fw fa-users', '开发团队成员信息', '蔡伟明', 'http://www.caiweiming.com', '{\"display\":\"1\",\"width\":\"6\"}', '1.0.0', 'dev_team.ming.plugin', 0, 1477755780, 1477755780, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `admin_role`
--

CREATE TABLE `admin_role` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '角色id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级角色',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述',
  `menu_auth` text NOT NULL COMMENT '菜单权限',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `access` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否可登录后台',
  `default_module` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '默认访问模块'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色表';

--
-- Dumping data for table `admin_role`
--

INSERT INTO `admin_role` (`id`, `pid`, `name`, `description`, `menu_auth`, `sort`, `create_time`, `update_time`, `status`, `access`, `default_module`) VALUES
(1, 0, 'administrator', 'Super user created by default.', '', 0, 1476270000, 1468117612, 1, 1, 0);

-- --------------------------------------------------------

--
-- Table structure for table `admin_user`
--

CREATE TABLE `admin_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(96) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `email_bind` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否绑定邮箱地址',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_bind` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否绑定手机号码',
  `avatar` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '头像',
  `money` decimal(11,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '积分',
  `role` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '角色ID',
  `group` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '部门id',
  `signup_ip` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册ip',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_login_ip` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录ip',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：0禁用，1启用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表';

--
-- Dumping data for table `admin_user`
--

INSERT INTO `admin_user` (`id`, `username`, `nickname`, `password`, `email`, `email_bind`, `mobile`, `mobile_bind`, `avatar`, `money`, `score`, `role`, `group`, `signup_ip`, `create_time`, `update_time`, `last_login_time`, `last_login_ip`, `sort`, `status`) VALUES
(1, 'admin', 'administrator', '$2y$10$Brw6wmuSLIIx3Yabid8/Wu5l8VQ9M/H/CG3C9RqN9dUCwZW3ljGOK', '', 0, '', 0, 0, '0.00', 0, 1, 0, 0, 1476065410, 1477794539, 1477794539, 2130706433, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_access`
--

CREATE TABLE `dp_admin_access` (
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模型名称',
  `group` varchar(16) NOT NULL DEFAULT '' COMMENT '权限分组标识',
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `nid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '授权节点id'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='统一授权表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_action`
--

CREATE TABLE `dp_admin_action` (
  `id` int(11) UNSIGNED NOT NULL,
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '所属模块名',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '行为唯一标识',
  `title` varchar(80) NOT NULL DEFAULT '' COMMENT '行为标题',
  `remark` varchar(128) NOT NULL DEFAULT '' COMMENT '行为描述',
  `rule` text NOT NULL COMMENT '行为规则',
  `log` text NOT NULL COMMENT '日志规则',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统行为表' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_admin_action`
--

INSERT INTO `dp_admin_action` (`id`, `module`, `name`, `title`, `remark`, `rule`, `log`, `status`, `create_time`, `update_time`) VALUES
(1, 'user', 'user_add', '添加用户', '添加用户', '', '[user|get_nickname] 添加了用户：[record|get_nickname]', 1, 1480156399, 1480163853),
(2, 'user', 'user_edit', '编辑用户', '编辑用户', '', '[user|get_nickname] 编辑了用户：[details]', 1, 1480164578, 1480297748),
(3, 'user', 'user_delete', '删除用户', '删除用户', '', '[user|get_nickname] 删除了用户：[details]', 1, 1480168582, 1480168616),
(4, 'user', 'user_enable', '启用用户', '启用用户', '', '[user|get_nickname] 启用了用户：[details]', 1, 1480169185, 1480169185),
(5, 'user', 'user_disable', '禁用用户', '禁用用户', '', '[user|get_nickname] 禁用了用户：[details]', 1, 1480169214, 1480170581),
(6, 'user', 'user_access', '用户授权', '用户授权', '', '[user|get_nickname] 对用户：[record|get_nickname] 进行了授权操作。详情：[details]', 1, 1480221441, 1480221563),
(7, 'user', 'role_add', '添加角色', '添加角色', '', '[user|get_nickname] 添加了角色：[details]', 1, 1480251473, 1480251473),
(8, 'user', 'role_edit', '编辑角色', '编辑角色', '', '[user|get_nickname] 编辑了角色：[details]', 1, 1480252369, 1480252369),
(9, 'user', 'role_delete', '删除角色', '删除角色', '', '[user|get_nickname] 删除了角色：[details]', 1, 1480252580, 1480252580),
(10, 'user', 'role_enable', '启用角色', '启用角色', '', '[user|get_nickname] 启用了角色：[details]', 1, 1480252620, 1480252620),
(11, 'user', 'role_disable', '禁用角色', '禁用角色', '', '[user|get_nickname] 禁用了角色：[details]', 1, 1480252651, 1480252651),
(12, 'user', 'attachment_enable', '启用附件', '启用附件', '', '[user|get_nickname] 启用了附件：附件ID([details])', 1, 1480253226, 1480253332),
(13, 'user', 'attachment_disable', '禁用附件', '禁用附件', '', '[user|get_nickname] 禁用了附件：附件ID([details])', 1, 1480253267, 1480253340),
(14, 'user', 'attachment_delete', '删除附件', '删除附件', '', '[user|get_nickname] 删除了附件：附件ID([details])', 1, 1480253323, 1480253323),
(15, 'admin', 'config_add', '添加配置', '添加配置', '', '[user|get_nickname] 添加了配置，[details]', 1, 1480296196, 1480296196),
(16, 'admin', 'config_edit', '编辑配置', '编辑配置', '', '[user|get_nickname] 编辑了配置：[details]', 1, 1480296960, 1480296960),
(17, 'admin', 'config_enable', '启用配置', '启用配置', '', '[user|get_nickname] 启用了配置：[details]', 1, 1480298479, 1480298479),
(18, 'admin', 'config_disable', '禁用配置', '禁用配置', '', '[user|get_nickname] 禁用了配置：[details]', 1, 1480298506, 1480298506),
(19, 'admin', 'config_delete', '删除配置', '删除配置', '', '[user|get_nickname] 删除了配置：[details]', 1, 1480298532, 1480298532),
(20, 'admin', 'database_export', '备份数据库', '备份数据库', '', '[user|get_nickname] 备份了数据库：[details]', 1, 1480298946, 1480298946),
(21, 'admin', 'database_import', '还原数据库', '还原数据库', '', '[user|get_nickname] 还原了数据库：[details]', 1, 1480301990, 1480302022),
(22, 'admin', 'database_optimize', '优化数据表', '优化数据表', '', '[user|get_nickname] 优化了数据表：[details]', 1, 1480302616, 1480302616),
(23, 'admin', 'database_repair', '修复数据表', '修复数据表', '', '[user|get_nickname] 修复了数据表：[details]', 1, 1480302798, 1480302798),
(24, 'admin', 'database_backup_delete', '删除数据库备份', '删除数据库备份', '', '[user|get_nickname] 删除了数据库备份：[details]', 1, 1480302870, 1480302870),
(25, 'admin', 'hook_add', '添加钩子', '添加钩子', '', '[user|get_nickname] 添加了钩子：[details]', 1, 1480303198, 1480303198),
(26, 'admin', 'hook_edit', '编辑钩子', '编辑钩子', '', '[user|get_nickname] 编辑了钩子：[details]', 1, 1480303229, 1480303229),
(27, 'admin', 'hook_delete', '删除钩子', '删除钩子', '', '[user|get_nickname] 删除了钩子：[details]', 1, 1480303264, 1480303264),
(28, 'admin', 'hook_enable', '启用钩子', '启用钩子', '', '[user|get_nickname] 启用了钩子：[details]', 1, 1480303294, 1480303294),
(29, 'admin', 'hook_disable', '禁用钩子', '禁用钩子', '', '[user|get_nickname] 禁用了钩子：[details]', 1, 1480303409, 1480303409),
(30, 'admin', 'menu_add', '添加节点', '添加节点', '', '[user|get_nickname] 添加了节点：[details]', 1, 1480305468, 1480305468),
(31, 'admin', 'menu_edit', '编辑节点', '编辑节点', '', '[user|get_nickname] 编辑了节点：[details]', 1, 1480305513, 1480305513),
(32, 'admin', 'menu_delete', '删除节点', '删除节点', '', '[user|get_nickname] 删除了节点：[details]', 1, 1480305562, 1480305562),
(33, 'admin', 'menu_enable', '启用节点', '启用节点', '', '[user|get_nickname] 启用了节点：[details]', 1, 1480305630, 1480305630),
(34, 'admin', 'menu_disable', '禁用节点', '禁用节点', '', '[user|get_nickname] 禁用了节点：[details]', 1, 1480305659, 1480305659),
(35, 'admin', 'module_install', '安装模块', '安装模块', '', '[user|get_nickname] 安装了模块：[details]', 1, 1480307558, 1480307558),
(36, 'admin', 'module_uninstall', '卸载模块', '卸载模块', '', '[user|get_nickname] 卸载了模块：[details]', 1, 1480307588, 1480307588),
(37, 'admin', 'module_enable', '启用模块', '启用模块', '', '[user|get_nickname] 启用了模块：[details]', 1, 1480307618, 1480307618),
(38, 'admin', 'module_disable', '禁用模块', '禁用模块', '', '[user|get_nickname] 禁用了模块：[details]', 1, 1480307653, 1480307653),
(39, 'admin', 'module_export', '导出模块', '导出模块', '', '[user|get_nickname] 导出了模块：[details]', 1, 1480307682, 1480307682),
(40, 'admin', 'packet_install', '安装数据包', '安装数据包', '', '[user|get_nickname] 安装了数据包：[details]', 1, 1480308342, 1480308342),
(41, 'admin', 'packet_uninstall', '卸载数据包', '卸载数据包', '', '[user|get_nickname] 卸载了数据包：[details]', 1, 1480308372, 1480308372),
(42, 'admin', 'system_config_update', '更新系统设置', '更新系统设置', '', '[user|get_nickname] 更新了系统设置：[details]', 1, 1480309555, 1480309642);

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_attachment`
--

CREATE TABLE `dp_admin_attachment` (
  `id` int(11) UNSIGNED NOT NULL,
  `uid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '用户id',
  `name` varchar(255) NOT NULL DEFAULT '' COMMENT '文件名',
  `module` varchar(32) NOT NULL DEFAULT '' COMMENT '模块名，由哪个模块上传的',
  `path` varchar(255) NOT NULL DEFAULT '' COMMENT '文件路径',
  `thumb` varchar(255) NOT NULL DEFAULT '' COMMENT '缩略图路径',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '文件链接',
  `mime` varchar(128) NOT NULL DEFAULT '' COMMENT '文件mime类型',
  `ext` char(8) NOT NULL DEFAULT '' COMMENT '文件类型',
  `size` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '文件大小',
  `md5` char(32) NOT NULL DEFAULT '' COMMENT '文件md5',
  `sha1` char(40) NOT NULL DEFAULT '' COMMENT 'sha1 散列值',
  `driver` varchar(16) NOT NULL DEFAULT 'local' COMMENT '上传驱动',
  `download` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '下载次数',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上传时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `width` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片宽度',
  `height` int(8) UNSIGNED NOT NULL DEFAULT '0' COMMENT '图片高度'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='附件表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_config`
--

CREATE TABLE `dp_admin_config` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `level` tinyint(2) UNSIGNED NOT NULL DEFAULT '2' COMMENT '联动级别，只用于快速联动类型',
  `key` varchar(32) NOT NULL DEFAULT '' COMMENT '键字段，只用于快速联动类型',
  `option` varchar(32) NOT NULL DEFAULT '' COMMENT '值字段，只用于快速联动类型',
  `pid` varchar(32) NOT NULL DEFAULT '' COMMENT '父级id字段，只用于快速联动类型',
  `ak` varchar(32) NOT NULL DEFAULT '' COMMENT '百度地图appkey',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态：0禁用，1启用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='系统配置表' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_admin_config`
--

INSERT INTO `dp_admin_config` (`id`, `name`, `title`, `group`, `type`, `value`, `options`, `tips`, `ajax_url`, `next_items`, `param`, `format`, `table`, `level`, `key`, `option`, `pid`, `ak`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 'web_site_status', '站点开关', 'base', 'switch', '1', '', '站点关闭后将不能访问，后台可正常登录', '', '', '', '', '', 2, '', '', '', '', 1475240395, 1477403914, 1, 1),
(2, 'web_site_title', '站点标题', 'base', 'text', 'Online Distribution Center', '', '调用方式：<code>config(\'web_site_title\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475240646, 1477710341, 2, 1),
(3, 'web_site_slogan', '站点标语', 'base', 'text', 'Online Distribution Center', '', '站点口号，调用方式：<code>config(\'web_site_slogan\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475240994, 1477710357, 3, 1),
(4, 'web_site_logo', '站点LOGO', 'base', 'image', '', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241067, 1475241067, 4, 1),
(5, 'web_site_description', '站点描述', 'base', 'textarea', '', '', '网站描述，有利于搜索引擎抓取相关信息', '', '', '', '', '', 2, '', '', '', '', 1475241186, 1475241186, 6, 1),
(6, 'web_site_keywords', '站点关键词', 'base', 'text', '海豚PHP、PHP开发框架、后台框架', '', '网站搜索引擎关键字', '', '', '', '', '', 2, '', '', '', '', 1475241328, 1475241328, 7, 1),
(7, 'web_site_copyright', '版权信息', 'base', 'text', 'Copyright © 2015-2017 DolphinPHP All rights reserved.', '', '调用方式：<code>config(\'web_site_copyright\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241416, 1477710383, 8, 1),
(8, 'web_site_icp', '备案信息', 'base', 'text', '', '', '调用方式：<code>config(\'web_site_icp\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241441, 1477710441, 9, 1),
(9, 'web_site_statistics', '站点统计', 'base', 'textarea', '', '', '网站统计代码，支持百度、Google、cnzz等，调用方式：<code>config(\'web_site_statistics\')</code>', '', '', '', '', '', 2, '', '', '', '', 1475241498, 1477710455, 10, 1),
(10, 'config_group', '配置分组', 'system', 'array', 'base:基本\r\nsystem:系统\r\nupload:上传\r\ndevelop:开发\r\ndatabase:数据库', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241716, 1477649446, 100, 1),
(11, 'form_item_type', '配置类型', 'system', 'array', 'text:单行文本\r\ntextarea:多行文本\r\nstatic:静态文本\r\npassword:密码\r\ncheckbox:复选框\r\nradio:单选按钮\r\ndate:日期\r\ndatetime:日期+时间\r\nhidden:隐藏\r\nswitch:开关\r\narray:数组\r\nselect:下拉框\r\nlinkage:普通联动下拉框\r\nlinkages:快速联动下拉框\r\nimage:单张图片\r\nimages:多张图片\r\nfile:单个文件\r\nfiles:多个文件\r\nueditor:UEditor 编辑器\r\nwangeditor:wangEditor 编辑器\r\neditormd:markdown 编辑器\r\nckeditor:ckeditor 编辑器\r\nicon:字体图标\r\ntags:标签\r\nnumber:数字\r\nbmap:百度地图\r\ncolorpicker:取色器\r\njcrop:图片裁剪\r\nmasked:格式文本\r\nrange:范围\r\ntime:时间', '', '', '', '', '', '', '', 2, '', '', '', '', 1475241835, 1495853193, 100, 1),
(12, 'upload_file_size', '文件上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', 2, '', '', '', '', 1475241897, 1477663520, 100, 1),
(13, 'upload_file_ext', '允许上传的文件后缀', 'upload', 'tags', 'doc,docx,xls,xlsx,ppt,pptx,pdf,wps,txt,rar,zip,gz,bz2,7z', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', 2, '', '', '', '', 1475241975, 1477649489, 100, 1),
(14, 'upload_image_size', '图片上传大小限制', 'upload', 'text', '0', '', '0为不限制大小，单位：kb', '', '', '', '', '', 2, '', '', '', '', 1475242015, 1477663529, 100, 1),
(15, 'upload_image_ext', '允许上传的图片后缀', 'upload', 'tags', 'gif,jpg,jpeg,bmp,png', '', '多个后缀用逗号隔开，不填写则不限制类型', '', '', '', '', '', 2, '', '', '', '', 1475242056, 1477649506, 100, 1),
(16, 'list_rows', '分页数量', 'system', 'number', '20', '', '每页的记录数', '', '', '', '', '', 2, '', '', '', '', 1475242066, 1476074507, 101, 1),
(17, 'system_color', '后台配色方案', 'system', 'radio', 'default', 'default:Default\r\namethyst:Amethyst\r\ncity:City\r\nflat:Flat\r\nmodern:Modern\r\nsmooth:Smooth', '', '', '', '', '', '', 2, '', '', '', '', 1475250066, 1477316689, 102, 1),
(18, 'develop_mode', '开发模式', 'develop', 'radio', '1', '0:关闭\r\n1:开启', '', '', '', '', '', '', 2, '', '', '', '', 1476864205, 1476864231, 100, 1),
(19, 'app_trace', '显示页面Trace', 'develop', 'radio', '0', '0:否\r\n1:是', '', '', '', '', '', '', 2, '', '', '', '', 1476866355, 1476866355, 100, 1),
(21, 'data_backup_path', '数据库备份根路径', 'database', 'text', '../data/', '', '路径必须以 / 结尾', '', '', '', '', '', 2, '', '', '', '', 1477017745, 1477018467, 100, 1),
(22, 'data_backup_part_size', '数据库备份卷大小', 'database', 'text', '20971520', '', '该值用于限制压缩后的分卷最大长度。单位：B；建议设置20M', '', '', '', '', '', 2, '', '', '', '', 1477017886, 1477017886, 100, 1),
(23, 'data_backup_compress', '数据库备份文件是否启用压缩', 'database', 'radio', '1', '0:否\r\n1:是', '压缩备份文件需要PHP环境支持 <code>gzopen</code>, <code>gzwrite</code>函数', '', '', '', '', '', 2, '', '', '', '', 1477017978, 1477018172, 100, 1),
(24, 'data_backup_compress_level', '数据库备份文件压缩级别', 'database', 'radio', '9', '1:最低\r\n4:一般\r\n9:最高', '数据库备份文件的压缩级别，该配置在开启压缩时生效', '', '', '', '', '', 2, '', '', '', '', 1477018083, 1477018083, 100, 1),
(25, 'top_menu_max', '顶部导航模块数量', 'system', 'text', '10', '', '设置顶部导航默认显示的模块数量', '', '', '', '', '', 2, '', '', '', '', 1477579289, 1477579289, 103, 1),
(26, 'web_site_logo_text', '站点LOGO文字', 'base', 'image', '', '', '', '', '', '', '', '', 2, '', '', '', '', 1477620643, 1477620643, 5, 1),
(27, 'upload_image_thumb', '缩略图尺寸', 'upload', 'text', '', '', '不填写则不生成缩略图，如需生成 <code>300x300</code> 的缩略图，则填写 <code>300,300</code> ，请注意，逗号必须是英文逗号', '', '', '', '', '', 2, '', '', '', '', 1477644150, 1477649513, 100, 1),
(28, 'upload_image_thumb_type', '缩略图裁剪类型', 'upload', 'radio', '1', '1:等比例缩放\r\n2:缩放后填充\r\n3:居中裁剪\r\n4:左上角裁剪\r\n5:右下角裁剪\r\n6:固定尺寸缩放', '该项配置只有在启用生成缩略图时才生效', '', '', '', '', '', 2, '', '', '', '', 1477646271, 1477649521, 100, 1),
(29, 'upload_thumb_water', '添加水印', 'upload', 'switch', '0', '', '', '', '', '', '', '', 2, '', '', '', '', 1477649648, 1477649648, 100, 1),
(30, 'upload_thumb_water_pic', '水印图片', 'upload', 'image', '', '', '只有开启水印功能才生效', '', '', '', '', '', 2, '', '', '', '', 1477656390, 1477656390, 100, 1),
(31, 'upload_thumb_water_position', '水印位置', 'upload', 'radio', '9', '1:左上角\r\n2:上居中\r\n3:右上角\r\n4:左居中\r\n5:居中\r\n6:右居中\r\n7:左下角\r\n8:下居中\r\n9:右下角', '只有开启水印功能才生效', '', '', '', '', '', 2, '', '', '', '', 1477656528, 1477656528, 100, 1),
(32, 'upload_thumb_water_alpha', '水印透明度', 'upload', 'text', '50', '', '请输入0~100之间的数字，数字越小，透明度越高', '', '', '', '', '', 2, '', '', '', '', 1477656714, 1477661309, 100, 1),
(33, 'wipe_cache_type', '清除缓存类型', 'system', 'checkbox', 'TEMP_PATH', 'TEMP_PATH:应用缓存\r\nLOG_PATH:应用日志\r\nCACHE_PATH:项目模板缓存', '清除缓存时，要删除的缓存类型', '', '', '', '', '', 2, '', '', '', '', 1477727305, 1477727305, 100, 1),
(34, 'captcha_signin', '后台验证码开关', 'system', 'switch', '0', '', '后台登录时是否需要验证码', '', '', '', '', '', 2, '', '', '', '', 1478771958, 1478771958, 99, 1),
(35, 'home_default_module', '前台默认模块', 'system', 'select', 'index', '', '前台默认访问的模块，该模块必须有Index控制器和index方法', '', '', '', '', '', 0, '', '', '', '', 1486714723, 1486715620, 104, 1),
(36, 'minify_status', '开启minify', 'system', 'switch', '0', '', '开启minify会压缩合并js、css文件，可以减少资源请求次数，如果不支持minify，可关闭', '', '', '', '', '', 0, '', '', '', '', 1487035843, 1487035843, 99, 1),
(37, 'upload_driver', '上传驱动', 'upload', 'radio', 'local', 'local:本地', '图片或文件上传驱动', '', '', '', '', '', 0, '', '', '', '', 1501488567, 1501490821, 100, 1),
(38, 'system_log', '系统日志', 'system', 'switch', '1', '', '是否开启系统日志功能', '', '', '', '', '', 0, '', '', '', '', 1512635391, 1512635391, 99, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_hook`
--

CREATE TABLE `dp_admin_hook` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子名称',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子来自哪个插件',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '钩子描述',
  `system` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为系统钩子',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='钩子表' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_admin_hook`
--

INSERT INTO `dp_admin_hook` (`id`, `name`, `plugin`, `description`, `system`, `create_time`, `update_time`, `status`) VALUES
(1, 'admin_index', '', '后台首页', 1, 1468174214, 1477757518, 1),
(2, 'plugin_index_tab_list', '', '插件扩展tab钩子', 1, 1468174214, 1468174214, 1),
(3, 'module_index_tab_list', '', '模块扩展tab钩子', 1, 1468174214, 1468174214, 1),
(4, 'page_tips', '', '每个页面的提示', 1, 1468174214, 1468174214, 1),
(5, 'signin_footer', '', '登录页面底部钩子', 1, 1479269315, 1479269315, 1),
(6, 'signin_captcha', '', '登录页面验证码钩子', 1, 1479269315, 1479269315, 1),
(7, 'signin', '', '登录控制器钩子', 1, 1479386875, 1479386875, 1),
(8, 'upload_attachment', '', '附件上传钩子', 1, 1501493808, 1501493808, 1),
(9, 'page_plugin_js', '', '页面插件js钩子', 1, 1503633591, 1503633591, 1),
(10, 'page_plugin_css', '', '页面插件css钩子', 1, 1503633591, 1503633591, 1),
(11, 'signin_sso', '', '单点登录钩子', 1, 1503633591, 1503633591, 1),
(12, 'signout_sso', '', '单点退出钩子', 1, 1503633591, 1503633591, 1),
(13, 'user_add', '', '添加用户钩子', 1, 1503633591, 1503633591, 1),
(14, 'user_edit', '', '编辑用户钩子', 1, 1503633591, 1503633591, 1),
(15, 'user_delete', '', '删除用户钩子', 1, 1503633591, 1503633591, 1),
(16, 'user_enable', '', '启用用户钩子', 1, 1503633591, 1503633591, 1),
(17, 'user_disable', '', '禁用用户钩子', 1, 1503633591, 1503633591, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_hook_plugin`
--

CREATE TABLE `dp_admin_hook_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `hook` varchar(32) NOT NULL DEFAULT '' COMMENT '钩子id',
  `plugin` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标识',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '添加时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) UNSIGNED NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='钩子-插件对应表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_icon`
--

CREATE TABLE `dp_admin_icon` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '图标名称',
  `url` varchar(255) NOT NULL DEFAULT '' COMMENT '图标css地址',
  `prefix` varchar(32) NOT NULL DEFAULT '' COMMENT '图标前缀',
  `font_family` varchar(32) NOT NULL DEFAULT '' COMMENT '字体名',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='图标表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_icon_list`
--

CREATE TABLE `dp_admin_icon_list` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `icon_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '所属图标id',
  `title` varchar(128) NOT NULL DEFAULT '' COMMENT '图标标题',
  `class` varchar(255) NOT NULL DEFAULT '' COMMENT '图标类名',
  `code` varchar(128) NOT NULL DEFAULT '' COMMENT '图标关键词'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='详细图标列表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_log`
--

CREATE TABLE `dp_admin_log` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '主键',
  `action_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '行为id',
  `user_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行用户id',
  `action_ip` bigint(20) NOT NULL COMMENT '执行行为者ip',
  `model` varchar(50) NOT NULL DEFAULT '' COMMENT '触发行为的表',
  `record_id` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '触发行为的数据id',
  `remark` longtext NOT NULL COMMENT '日志备注',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '执行行为的时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='行为日志表' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_admin_log`
--

INSERT INTO `dp_admin_log` (`id`, `action_id`, `user_id`, `action_ip`, `model`, `record_id`, `remark`, `status`, `create_time`) VALUES
(1, 35, 1, 0, 'admin_module', 0, '超级管理员 安装了模块：门户', 1, 1523534797),
(2, 36, 1, 0, 'admin_module', 0, '超级管理员 卸载了模块：门户', 1, 1524233804),
(3, 35, 1, 0, 'admin_module', 0, '超级管理员 安装了模块：ODC', 1, 1524239262),
(4, 1, 1, 0, 'admin_user', 2, '超级管理员 添加了用户：manager', 1, 1524281188),
(5, 1, 1, 0, 'admin_user', 3, '超级管理员 添加了用户：user', 1, 1524281215),
(6, 7, 1, 0, 'admin_role', 2, '超级管理员 添加了角色：user', 1, 1524281341),
(7, 8, 1, 0, 'admin_role', 2, '超级管理员 编辑了角色：user', 1, 1524281495),
(8, 2, 1, 0, 'admin_user', 3, '超级管理员 编辑了用户：字段(role)，原值(1)，新值：(2)', 1, 1524281523),
(9, 7, 1, 0, 'admin_role', 3, '超级管理员 添加了角色：Manager', 1, 1524291162),
(10, 8, 1, 0, 'admin_role', 3, '超级管理员 编辑了角色：字段(access)，原值(0)，新值：(true)', 1, 1524291174),
(11, 2, 1, 0, 'admin_user', 2, '超级管理员 编辑了用户：字段(role)，原值(1)，新值：(3)', 1, 1524291189),
(12, 2, 1, 0, 'admin_user', 2, '超级管理员 编辑了用户：字段(role)，原值(3)，新值：(1)', 1, 1524291197),
(13, 8, 1, 0, 'admin_role', 3, '超级管理员 编辑了角色：Manager', 1, 1524291210),
(14, 8, 1, 0, 'admin_role', 3, '超级管理员 编辑了角色：Manager', 1, 1524291262),
(15, 2, 1, 0, 'admin_user', 3, '超级管理员 编辑了用户：字段(role)，原值(2)，新值：(1)', 1, 1524291342),
(16, 8, 1, 0, 'admin_role', 2, '超级管理员 编辑了角色：user', 1, 1524291374),
(17, 8, 1, 0, 'admin_role', 2, '超级管理员 编辑了角色：user', 1, 1524291382),
(18, 36, 1, 0, 'admin_module', 0, '超级管理员 卸载了模块：ODC', 1, 1524312444),
(19, 35, 1, 0, 'admin_module', 0, '超级管理员 安装了模块：ODC', 1, 1524312451),
(20, 2, 1, 0, 'admin_user', 3, '超级管理员 编辑了用户：字段(role)，原值(1)，新值：(2)', 1, 1524319668),
(21, 8, 1, 0, 'admin_role', 2, '超级管理员 编辑了角色：user', 1, 1524319698),
(22, 8, 1, 0, 'admin_role', 2, '超级管理员 编辑了角色：user', 1, 1524319747),
(23, 2, 1, 0, 'admin_user', 3, '超级管理员 编辑了用户：user', 1, 1524319773),
(24, 2, 1, 0, 'admin_user', 2, '超级管理员 编辑了用户：字段(role)，原值(1)，新值：(3)', 1, 1524319899),
(25, 2, 1, 0, 'admin_user', 2, '超级管理员 编辑了用户：manager', 1, 1524319913),
(26, 8, 1, 0, 'admin_role', 3, '超级管理员 编辑了角色：Manager', 1, 1524319938),
(27, 42, 1, 2130706433, 'admin_config', 0, '超级管理员 更新了系统设置：分组(base)', 1, 1525013998),
(28, 31, 1, 2130706433, 'admin_menu', 1, 'administrator 编辑了节点：节点ID(1)', 1, 1525014128),
(29, 31, 1, 2130706433, 'admin_menu', 4, 'administrator 编辑了节点：节点ID(4)', 1, 1525014148),
(30, 31, 1, 2130706433, 'admin_menu', 68, 'administrator 编辑了节点：节点ID(68)', 1, 1525014233),
(31, 31, 1, 2130706433, 'admin_menu', 364, 'administrator 编辑了节点：节点ID(364)', 1, 1525443604),
(32, 31, 1, 2130706433, 'admin_menu', 348, 'administrator 编辑了节点：节点ID(348)', 1, 1525443632),
(33, 31, 1, 2130706433, 'admin_menu', 352, 'administrator 编辑了节点：节点ID(352)', 1, 1525443653),
(34, 31, 1, 2130706433, 'admin_menu', 356, 'administrator 编辑了节点：节点ID(356)', 1, 1525443672),
(35, 31, 1, 2130706433, 'admin_menu', 360, 'administrator 编辑了节点：节点ID(360)', 1, 1525443688),
(36, 31, 1, 2130706433, 'admin_menu', 364, 'administrator 编辑了节点：节点ID(364)', 1, 1525443707),
(37, 31, 1, 2130706433, 'admin_menu', 365, 'administrator 编辑了节点：节点ID(365)', 1, 1525443725),
(38, 31, 1, 2130706433, 'admin_menu', 366, 'administrator 编辑了节点：节点ID(366)', 1, 1525443740),
(39, 31, 1, 2130706433, 'admin_menu', 368, 'administrator 编辑了节点：节点ID(368)', 1, 1525443758),
(40, 31, 1, 2130706433, 'admin_menu', 369, 'administrator 编辑了节点：节点ID(369)', 1, 1525443773),
(41, 31, 1, 2130706433, 'admin_menu', 370, 'administrator 编辑了节点：节点ID(370)', 1, 1525443785),
(42, 31, 1, 2130706433, 'admin_menu', 348, 'administrator 编辑了节点：节点ID(348)', 1, 1525443897),
(43, 31, 1, 2130706433, 'admin_menu', 352, 'administrator 编辑了节点：节点ID(352)', 1, 1525443912),
(44, 31, 1, 2130706433, 'admin_menu', 356, 'administrator 编辑了节点：节点ID(356)', 1, 1525443950),
(45, 31, 1, 2130706433, 'admin_menu', 360, 'administrator 编辑了节点：节点ID(360)', 1, 1525443963),
(46, 31, 1, 2130706433, 'admin_menu', 368, 'administrator 编辑了节点：节点ID(368)', 1, 1525443976),
(47, 31, 1, 2130706433, 'admin_menu', 364, 'administrator 编辑了节点：节点ID(364)', 1, 1525443990);

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_menu`
--

CREATE TABLE `dp_admin_menu` (
  `id` int(11) UNSIGNED NOT NULL,
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级菜单id',
  `module` varchar(16) NOT NULL DEFAULT '' COMMENT '模块名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '菜单标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '菜单图标',
  `url_type` varchar(16) NOT NULL DEFAULT '' COMMENT '链接类型（link：外链，module：模块）',
  `url_value` varchar(255) NOT NULL DEFAULT '' COMMENT '链接地址',
  `url_target` varchar(16) NOT NULL DEFAULT '_self' COMMENT '链接打开方式：_blank,_self',
  `online_hide` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '网站上线后是否隐藏',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `system_menu` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为系统菜单，系统菜单不可删除',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `params` varchar(255) NOT NULL DEFAULT '' COMMENT '参数'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='后台菜单表' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_admin_menu`
--

INSERT INTO `dp_admin_menu` (`id`, `pid`, `module`, `title`, `icon`, `url_type`, `url_value`, `url_target`, `online_hide`, `create_time`, `update_time`, `sort`, `system_menu`, `status`, `params`) VALUES
(1, 0, 'admin', 'Home', 'fa fa-fw fa-home', 'module_admin', 'admin/index/index', '_self', 0, 1467617722, 1525014128, 1, 1, 1, ''),
(2, 1, 'admin', '快捷操作', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1467618170, 1477710695, 1, 1, 1, ''),
(3, 2, 'admin', '清空缓存', 'fa fa-fw fa-trash-o', 'module_admin', 'admin/index/wipecache', '_self', 0, 1467618273, 1489049773, 3, 1, 1, ''),
(4, 0, 'admin', 'System', 'fa fa-fw fa-gear', 'module_admin', 'admin/system/index', '_self', 0, 1467618361, 1525014149, 2, 1, 1, ''),
(5, 4, 'admin', '系统功能', 'si si-wrench', 'module_admin', '', '_self', 0, 1467618441, 1477710695, 1, 1, 1, ''),
(6, 5, 'admin', '系统设置', 'fa fa-fw fa-wrench', 'module_admin', 'admin/system/index', '_self', 0, 1467618490, 1477710695, 1, 1, 1, ''),
(7, 5, 'admin', '配置管理', 'fa fa-fw fa-gears', 'module_admin', 'admin/config/index', '_self', 0, 1467618618, 1477710695, 2, 1, 1, ''),
(8, 7, 'admin', '新增', '', 'module_admin', 'admin/config/add', '_self', 0, 1467618648, 1477710695, 1, 1, 1, ''),
(9, 7, 'admin', '编辑', '', 'module_admin', 'admin/config/edit', '_self', 0, 1467619566, 1477710695, 2, 1, 1, ''),
(10, 7, 'admin', '删除', '', 'module_admin', 'admin/config/delete', '_self', 0, 1467619583, 1477710695, 3, 1, 1, ''),
(11, 7, 'admin', '启用', '', 'module_admin', 'admin/config/enable', '_self', 0, 1467619609, 1477710695, 4, 1, 1, ''),
(12, 7, 'admin', '禁用', '', 'module_admin', 'admin/config/disable', '_self', 0, 1467619637, 1477710695, 5, 1, 1, ''),
(13, 5, 'admin', '节点管理', 'fa fa-fw fa-bars', 'module_admin', 'admin/menu/index', '_self', 0, 1467619882, 1477710695, 3, 1, 1, ''),
(14, 13, 'admin', '新增', '', 'module_admin', 'admin/menu/add', '_self', 0, 1467619902, 1477710695, 1, 1, 1, ''),
(15, 13, 'admin', '编辑', '', 'module_admin', 'admin/menu/edit', '_self', 0, 1467620331, 1477710695, 2, 1, 1, ''),
(16, 13, 'admin', '删除', '', 'module_admin', 'admin/menu/delete', '_self', 0, 1467620363, 1477710695, 3, 1, 1, ''),
(17, 13, 'admin', '启用', '', 'module_admin', 'admin/menu/enable', '_self', 0, 1467620386, 1477710695, 4, 1, 1, ''),
(18, 13, 'admin', '禁用', '', 'module_admin', 'admin/menu/disable', '_self', 0, 1467620404, 1477710695, 5, 1, 1, ''),
(19, 68, 'user', '权限管理', 'fa fa-fw fa-key', 'module_admin', '', '_self', 0, 1467688065, 1477710702, 1, 1, 1, ''),
(20, 19, 'user', '用户管理', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', 0, 1467688137, 1477710702, 1, 1, 1, ''),
(21, 20, 'user', '新增', '', 'module_admin', 'user/index/add', '_self', 0, 1467688177, 1477710702, 1, 1, 1, ''),
(22, 20, 'user', '编辑', '', 'module_admin', 'user/index/edit', '_self', 0, 1467688202, 1477710702, 2, 1, 1, ''),
(23, 20, 'user', '删除', '', 'module_admin', 'user/index/delete', '_self', 0, 1467688219, 1477710702, 3, 1, 1, ''),
(24, 20, 'user', '启用', '', 'module_admin', 'user/index/enable', '_self', 0, 1467688238, 1477710702, 4, 1, 1, ''),
(25, 20, 'user', '禁用', '', 'module_admin', 'user/index/disable', '_self', 0, 1467688256, 1477710702, 5, 1, 1, ''),
(211, 64, 'admin', '日志详情', '', 'module_admin', 'admin/log/details', '_self', 0, 1480299320, 1480299320, 100, 0, 1, ''),
(32, 4, 'admin', '扩展中心', 'si si-social-dropbox', 'module_admin', '', '_self', 0, 1467688853, 1477710695, 2, 1, 1, ''),
(33, 32, 'admin', '模块管理', 'fa fa-fw fa-th-large', 'module_admin', 'admin/module/index', '_self', 0, 1467689008, 1477710695, 1, 1, 1, ''),
(34, 33, 'admin', '导入', '', 'module_admin', 'admin/module/import', '_self', 0, 1467689153, 1477710695, 1, 1, 1, ''),
(35, 33, 'admin', '导出', '', 'module_admin', 'admin/module/export', '_self', 0, 1467689173, 1477710695, 2, 1, 1, ''),
(36, 33, 'admin', '安装', '', 'module_admin', 'admin/module/install', '_self', 0, 1467689192, 1477710695, 3, 1, 1, ''),
(37, 33, 'admin', '卸载', '', 'module_admin', 'admin/module/uninstall', '_self', 0, 1467689241, 1477710695, 4, 1, 1, ''),
(38, 33, 'admin', '启用', '', 'module_admin', 'admin/module/enable', '_self', 0, 1467689294, 1477710695, 5, 1, 1, ''),
(39, 33, 'admin', '禁用', '', 'module_admin', 'admin/module/disable', '_self', 0, 1467689312, 1477710695, 6, 1, 1, ''),
(40, 33, 'admin', '更新', '', 'module_admin', 'admin/module/update', '_self', 0, 1467689341, 1477710695, 7, 1, 1, ''),
(41, 32, 'admin', '插件管理', 'fa fa-fw fa-puzzle-piece', 'module_admin', 'admin/plugin/index', '_self', 0, 1467689527, 1477710695, 2, 1, 1, ''),
(42, 41, 'admin', '导入', '', 'module_admin', 'admin/plugin/import', '_self', 0, 1467689650, 1477710695, 1, 1, 1, ''),
(43, 41, 'admin', '导出', '', 'module_admin', 'admin/plugin/export', '_self', 0, 1467689665, 1477710695, 2, 1, 1, ''),
(44, 41, 'admin', '安装', '', 'module_admin', 'admin/plugin/install', '_self', 0, 1467689680, 1477710695, 3, 1, 1, ''),
(45, 41, 'admin', '卸载', '', 'module_admin', 'admin/plugin/uninstall', '_self', 0, 1467689700, 1477710695, 4, 1, 1, ''),
(46, 41, 'admin', '启用', '', 'module_admin', 'admin/plugin/enable', '_self', 0, 1467689730, 1477710695, 5, 1, 1, ''),
(47, 41, 'admin', '禁用', '', 'module_admin', 'admin/plugin/disable', '_self', 0, 1467689747, 1477710695, 6, 1, 1, ''),
(48, 41, 'admin', '设置', '', 'module_admin', 'admin/plugin/config', '_self', 0, 1467689789, 1477710695, 7, 1, 1, ''),
(49, 41, 'admin', '管理', '', 'module_admin', 'admin/plugin/manage', '_self', 0, 1467689846, 1477710695, 8, 1, 1, ''),
(50, 5, 'admin', '附件管理', 'fa fa-fw fa-cloud-upload', 'module_admin', 'admin/attachment/index', '_self', 0, 1467690161, 1477710695, 4, 1, 1, ''),
(51, 70, 'admin', '文件上传', '', 'module_admin', 'admin/attachment/upload', '_self', 0, 1467690240, 1489049773, 1, 1, 1, ''),
(52, 50, 'admin', '下载', '', 'module_admin', 'admin/attachment/download', '_self', 0, 1467690334, 1477710695, 2, 1, 1, ''),
(53, 50, 'admin', '启用', '', 'module_admin', 'admin/attachment/enable', '_self', 0, 1467690352, 1477710695, 3, 1, 1, ''),
(54, 50, 'admin', '禁用', '', 'module_admin', 'admin/attachment/disable', '_self', 0, 1467690369, 1477710695, 4, 1, 1, ''),
(55, 50, 'admin', '删除', '', 'module_admin', 'admin/attachment/delete', '_self', 0, 1467690396, 1477710695, 5, 1, 1, ''),
(56, 41, 'admin', '删除', '', 'module_admin', 'admin/plugin/delete', '_self', 0, 1467858065, 1477710695, 11, 1, 1, ''),
(57, 41, 'admin', '编辑', '', 'module_admin', 'admin/plugin/edit', '_self', 0, 1467858092, 1477710695, 10, 1, 1, ''),
(60, 41, 'admin', '新增', '', 'module_admin', 'admin/plugin/add', '_self', 0, 1467858421, 1477710695, 9, 1, 1, ''),
(61, 41, 'admin', '执行', '', 'module_admin', 'admin/plugin/execute', '_self', 0, 1467879016, 1477710695, 14, 1, 1, ''),
(62, 13, 'admin', '保存', '', 'module_admin', 'admin/menu/save', '_self', 0, 1468073039, 1477710695, 6, 1, 1, ''),
(64, 5, 'admin', '系统日志', 'fa fa-fw fa-book', 'module_admin', 'admin/log/index', '_self', 0, 1476111944, 1477710695, 6, 0, 1, ''),
(65, 5, 'admin', '数据库管理', 'fa fa-fw fa-database', 'module_admin', 'admin/database/index', '_self', 0, 1476111992, 1477710695, 8, 0, 1, ''),
(66, 32, 'admin', '数据包管理', 'fa fa-fw fa-database', 'module_admin', 'admin/packet/index', '_self', 0, 1476112326, 1477710695, 4, 0, 1, ''),
(67, 19, 'user', '角色管理', 'fa fa-fw fa-users', 'module_admin', 'user/role/index', '_self', 0, 1476113025, 1477710702, 3, 0, 1, ''),
(68, 0, 'user', 'User', 'fa fa-fw fa-user', 'module_admin', 'user/index/index', '_self', 0, 1476193348, 1525014233, 3, 0, 1, ''),
(69, 32, 'admin', '钩子管理', 'fa fa-fw fa-anchor', 'module_admin', 'admin/hook/index', '_self', 0, 1476236193, 1477710695, 3, 0, 1, ''),
(70, 2, 'admin', '后台首页', 'fa fa-fw fa-tachometer', 'module_admin', 'admin/index/index', '_self', 0, 1476237472, 1489049773, 1, 0, 1, ''),
(71, 67, 'user', '新增', '', 'module_admin', 'user/role/add', '_self', 0, 1476256935, 1477710702, 1, 0, 1, ''),
(72, 67, 'user', '编辑', '', 'module_admin', 'user/role/edit', '_self', 0, 1476256968, 1477710702, 2, 0, 1, ''),
(73, 67, 'user', '删除', '', 'module_admin', 'user/role/delete', '_self', 0, 1476256993, 1477710702, 3, 0, 1, ''),
(74, 67, 'user', '启用', '', 'module_admin', 'user/role/enable', '_self', 0, 1476257023, 1477710702, 4, 0, 1, ''),
(75, 67, 'user', '禁用', '', 'module_admin', 'user/role/disable', '_self', 0, 1476257046, 1477710702, 5, 0, 1, ''),
(76, 20, 'user', '授权', '', 'module_admin', 'user/index/access', '_self', 0, 1476375187, 1477710702, 6, 0, 1, ''),
(77, 69, 'admin', '新增', '', 'module_admin', 'admin/hook/add', '_self', 0, 1476668971, 1477710695, 1, 0, 1, ''),
(78, 69, 'admin', '编辑', '', 'module_admin', 'admin/hook/edit', '_self', 0, 1476669006, 1477710695, 2, 0, 1, ''),
(79, 69, 'admin', '删除', '', 'module_admin', 'admin/hook/delete', '_self', 0, 1476669375, 1477710695, 3, 0, 1, ''),
(80, 69, 'admin', '启用', '', 'module_admin', 'admin/hook/enable', '_self', 0, 1476669427, 1477710695, 4, 0, 1, ''),
(81, 69, 'admin', '禁用', '', 'module_admin', 'admin/hook/disable', '_self', 0, 1476669564, 1477710695, 5, 0, 1, ''),
(183, 66, 'admin', '安装', '', 'module_admin', 'admin/packet/install', '_self', 0, 1476851362, 1477710695, 1, 0, 1, ''),
(184, 66, 'admin', '卸载', '', 'module_admin', 'admin/packet/uninstall', '_self', 0, 1476851382, 1477710695, 2, 0, 1, ''),
(185, 5, 'admin', '行为管理', 'fa fa-fw fa-bug', 'module_admin', 'admin/action/index', '_self', 0, 1476882441, 1477710695, 7, 0, 1, ''),
(186, 185, 'admin', '新增', '', 'module_admin', 'admin/action/add', '_self', 0, 1476884439, 1477710695, 1, 0, 1, ''),
(187, 185, 'admin', '编辑', '', 'module_admin', 'admin/action/edit', '_self', 0, 1476884464, 1477710695, 2, 0, 1, ''),
(188, 185, 'admin', '启用', '', 'module_admin', 'admin/action/enable', '_self', 0, 1476884493, 1477710695, 3, 0, 1, ''),
(189, 185, 'admin', '禁用', '', 'module_admin', 'admin/action/disable', '_self', 0, 1476884534, 1477710695, 4, 0, 1, ''),
(190, 185, 'admin', '删除', '', 'module_admin', 'admin/action/delete', '_self', 0, 1476884551, 1477710695, 5, 0, 1, ''),
(191, 65, 'admin', '备份数据库', '', 'module_admin', 'admin/database/export', '_self', 0, 1476972746, 1477710695, 1, 0, 1, ''),
(192, 65, 'admin', '还原数据库', '', 'module_admin', 'admin/database/import', '_self', 0, 1476972772, 1477710695, 2, 0, 1, ''),
(193, 65, 'admin', '优化表', '', 'module_admin', 'admin/database/optimize', '_self', 0, 1476972800, 1477710695, 3, 0, 1, ''),
(194, 65, 'admin', '修复表', '', 'module_admin', 'admin/database/repair', '_self', 0, 1476972825, 1477710695, 4, 0, 1, ''),
(195, 65, 'admin', '删除备份', '', 'module_admin', 'admin/database/delete', '_self', 0, 1476973457, 1477710695, 5, 0, 1, ''),
(210, 41, 'admin', '快速编辑', '', 'module_admin', 'admin/plugin/quickedit', '_self', 0, 1477713981, 1477713981, 100, 0, 1, ''),
(209, 185, 'admin', '快速编辑', '', 'module_admin', 'admin/action/quickedit', '_self', 0, 1477713939, 1477713939, 100, 0, 1, ''),
(208, 7, 'admin', '快速编辑', '', 'module_admin', 'admin/config/quickedit', '_self', 0, 1477713808, 1477713808, 100, 0, 1, ''),
(207, 69, 'admin', '快速编辑', '', 'module_admin', 'admin/hook/quickedit', '_self', 0, 1477713770, 1477713770, 100, 0, 1, ''),
(212, 2, 'admin', '个人设置', 'fa fa-fw fa-user', 'module_admin', 'admin/index/profile', '_self', 0, 1489049767, 1489049773, 2, 0, 1, ''),
(213, 70, 'admin', '检查版本更新', '', 'module_admin', 'admin/index/checkupdate', '_self', 0, 1490588610, 1490588610, 100, 0, 1, ''),
(214, 68, 'user', '消息管理', 'fa fa-fw fa-comments-o', 'module_admin', '', '_self', 0, 1520492129, 1520492129, 100, 0, 1, ''),
(215, 214, 'user', '消息列表', 'fa fa-fw fa-th-list', 'module_admin', 'user/message/index', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(216, 215, 'user', '新增', '', 'module_admin', 'user/message/add', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(217, 215, 'user', '编辑', '', 'module_admin', 'user/message/edit', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(218, 215, 'user', '删除', '', 'module_admin', 'user/message/delete', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(219, 215, 'user', '启用', '', 'module_admin', 'user/message/enable', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(220, 215, 'user', '禁用', '', 'module_admin', 'user/message/disable', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(221, 215, 'user', '快速编辑', '', 'module_admin', 'user/message/quickedit', '_self', 0, 1520492195, 1520492195, 100, 0, 1, ''),
(222, 2, 'admin', '消息中心', 'fa fa-fw fa-comments-o', 'module_admin', 'admin/message/index', '_self', 0, 1520495992, 1520496254, 100, 0, 1, ''),
(223, 222, 'admin', '删除', '', 'module_admin', 'admin/message/delete', '_self', 0, 1520495992, 1520496263, 100, 0, 1, ''),
(224, 222, 'admin', '启用', '', 'module_admin', 'admin/message/enable', '_self', 0, 1520495992, 1520496270, 100, 0, 1, ''),
(225, 32, 'admin', '图标管理', 'fa fa-fw fa-tint', 'module_admin', 'admin/icon/index', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(226, 225, 'admin', '新增', '', 'module_admin', 'admin/icon/add', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(227, 225, 'admin', '编辑', '', 'module_admin', 'admin/icon/edit', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(228, 225, 'admin', '删除', '', 'module_admin', 'admin/icon/delete', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(229, 225, 'admin', '启用', '', 'module_admin', 'admin/icon/enable', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(230, 225, 'admin', '禁用', '', 'module_admin', 'admin/icon/disable', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(231, 225, 'admin', '快速编辑', '', 'module_admin', 'admin/icon/quickedit', '_self', 0, 1520908295, 1520908295, 100, 0, 1, ''),
(232, 225, 'admin', '图标列表', '', 'module_admin', 'admin/icon/items', '_self', 0, 1520923368, 1520923368, 100, 0, 1, ''),
(233, 225, 'admin', '更新图标', '', 'module_admin', 'admin/icon/reload', '_self', 0, 1520931908, 1520931908, 100, 0, 1, ''),
(360, 359, 'odc', 'Create', '', 'module_admin', 'odc/category/add', '_self', 0, 1524312451, 1525443963, 100, 0, 1, ''),
(359, 346, 'odc', 'Category', 'fa fa-fw fa-recycle', 'module_admin', 'odc/category/index', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(358, 355, 'odc', 'Delete', '', 'module_admin', 'odc/region/delete', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(357, 355, 'odc', 'Edit', '', 'module_admin', 'odc/region/edit', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(356, 355, 'odc', 'Create', '', 'module_admin', 'odc/region/add', '_self', 0, 1524312451, 1525443950, 100, 0, 1, ''),
(355, 346, 'odc', 'Region', 'fa fa-fw fa-list', 'module_admin', 'odc/region/index', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(354, 351, 'odc', 'Delete', '', 'module_admin', 'odc/user/delete', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(353, 351, 'odc', 'Edit', '', 'module_admin', 'odc/user/edit', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(352, 351, 'odc', 'Create', '', 'module_admin', 'odc/user/add', '_self', 0, 1524312451, 1525443913, 100, 0, 1, ''),
(351, 346, 'odc', 'User', 'fa fa-fw fa-list', 'module_admin', 'odc/user/index', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(350, 347, 'odc', 'Delete', '', 'module_admin', 'odc/address/delete', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(349, 347, 'odc', 'Edit', '', 'module_admin', 'odc/address/edit', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(348, 347, 'odc', 'Create', '', 'module_admin', 'odc/address/add', '_self', 0, 1524312451, 1525443898, 100, 0, 1, ''),
(347, 346, 'odc', 'Address', 'fa fa-fw fa-list', 'module_admin', 'odc/address/index', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(346, 345, 'odc', 'ODC', 'fa fa-fw fa-folder-open-o', 'module_admin', '', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(345, 0, 'odc', 'ODC', 'fa fa-fw fa-newspaper-o', 'module_admin', 'odc/index/index', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(361, 359, 'odc', 'Edit', '', 'module_admin', 'odc/category/edit', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(362, 359, 'odc', 'Delete', '', 'module_admin', 'odc/category/delete', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(363, 346, 'odc', 'Product', 'fa fa-fw fa-file-word-o', 'module_admin', 'odc/product/index', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(364, 363, 'odc', 'Create', '', 'module_admin', 'odc/product/add', '_self', 0, 1524312451, 1525443990, 100, 0, 1, ''),
(365, 363, 'odc', 'Edit', '', 'module_admin', 'odc/product/edit', '_self', 0, 1524312451, 1525443725, 100, 0, 1, ''),
(366, 363, 'odc', 'Delete', '', 'module_admin', 'odc/product/delete', '_self', 0, 1524312451, 1525443741, 100, 0, 1, ''),
(367, 346, 'odc', 'Inventory', 'fa fa-fw fa-recycle', 'module_admin', 'odc/inventory/index', '_self', 0, 1524312451, 1524312451, 100, 0, 1, ''),
(368, 367, 'odc', 'Create', '', 'module_admin', 'odc/inventory/add', '_self', 0, 1524312451, 1525443976, 100, 0, 1, ''),
(369, 367, 'odc', 'Edit', '', 'module_admin', 'odc/inventory/edit', '_self', 0, 1524312451, 1525443773, 100, 0, 1, ''),
(370, 367, 'odc', 'Delete', '', 'module_admin', 'odc/inventory/delete', '_self', 0, 1524312451, 1525443785, 100, 0, 1, '');

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_message`
--

CREATE TABLE `dp_admin_message` (
  `id` bigint(20) UNSIGNED NOT NULL,
  `uid_receive` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '接收消息的用户id',
  `uid_send` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '发送消息的用户id',
  `type` varchar(128) NOT NULL DEFAULT '' COMMENT '消息分类',
  `content` text NOT NULL COMMENT '消息内容',
  `status` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '状态',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `read_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '阅读时间'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='消息表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_module`
--

CREATE TABLE `dp_admin_module` (
  `id` int(11) UNSIGNED NOT NULL,
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
  `system_module` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否为系统模块',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='模块表' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_admin_module`
--

INSERT INTO `dp_admin_module` (`id`, `name`, `title`, `icon`, `description`, `author`, `author_url`, `config`, `access`, `version`, `identifier`, `system_module`, `create_time`, `update_time`, `sort`, `status`) VALUES
(1, 'admin', '系统', 'fa fa-fw fa-gear', '系统模块，DolphinPHP的核心模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'admin.dolphinphp.module', 1, 1468204902, 1468204902, 100, 1),
(2, 'user', '用户', 'fa fa-fw fa-user', '用户模块，DolphinPHP自带模块', 'DolphinPHP', 'http://www.dolphinphp.com', '', '', '1.0.0', 'user.dolphinphp.module', 1, 1468204902, 1468204902, 100, 1),
(5, 'odc', 'ODC', 'fa fa-fw fa-newspaper-o', 'ODC模块', 'worldli', '', NULL, NULL, '1.0.0', 'odc.wl.module', 0, 1524312451, 1524312451, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_packet`
--

CREATE TABLE `dp_admin_packet` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包名',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '数据包标题',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者url',
  `version` varchar(16) NOT NULL,
  `tables` text NOT NULL COMMENT '数据表名',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='数据包表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_plugin`
--

CREATE TABLE `dp_admin_plugin` (
  `id` int(11) UNSIGNED NOT NULL,
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '插件名称',
  `title` varchar(32) NOT NULL DEFAULT '' COMMENT '插件标题',
  `icon` varchar(64) NOT NULL DEFAULT '' COMMENT '图标',
  `description` text NOT NULL COMMENT '插件描述',
  `author` varchar(32) NOT NULL DEFAULT '' COMMENT '作者',
  `author_url` varchar(255) NOT NULL DEFAULT '' COMMENT '作者主页',
  `config` text NOT NULL COMMENT '配置信息',
  `version` varchar(16) NOT NULL DEFAULT '' COMMENT '版本号',
  `identifier` varchar(64) NOT NULL DEFAULT '' COMMENT '插件唯一标识符',
  `admin` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否有后台管理',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '安装时间',
  `update_time` int(11) NOT NULL DEFAULT '0' COMMENT '更新时间',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='插件表' ROW_FORMAT=DYNAMIC;

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_role`
--

CREATE TABLE `dp_admin_role` (
  `id` int(11) UNSIGNED NOT NULL COMMENT '角色id',
  `pid` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '上级角色',
  `name` varchar(32) NOT NULL DEFAULT '' COMMENT '角色名称',
  `description` varchar(255) NOT NULL DEFAULT '' COMMENT '角色描述',
  `menu_auth` text NOT NULL COMMENT '菜单权限',
  `sort` int(11) NOT NULL DEFAULT '0' COMMENT '排序',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `status` tinyint(2) NOT NULL DEFAULT '1' COMMENT '状态',
  `access` tinyint(4) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否可登录后台',
  `default_module` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '默认访问模块'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='角色表' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_admin_role`
--

INSERT INTO `dp_admin_role` (`id`, `pid`, `name`, `description`, `menu_auth`, `sort`, `create_time`, `update_time`, `status`, `access`, `default_module`) VALUES
(1, 0, 'administrator', 'It\'s a super user created by default.', '', 0, 1476270000, 1468117612, 1, 1, 0),
(2, 3, 'user', 'user', '[\"1\",\"2\",\"3\",\"51\",\"70\",\"212\",\"213\",\"222\",\"223\",\"224\",\"345\",\"346\",\"347\",\"348\",\"349\",\"350\",\"359\",\"360\",\"361\",\"362\",\"363\",\"364\",\"365\",\"366\",\"367\",\"368\",\"369\",\"370\"]', 100, 1524281342, 1524319748, 1, 1, 345),
(3, 1, 'Manager', 'Manager', '[\"1\",\"2\",\"3\",\"19\",\"20\",\"21\",\"22\",\"23\",\"24\",\"25\",\"51\",\"67\",\"68\",\"70\",\"71\",\"72\",\"73\",\"74\",\"75\",\"76\",\"212\",\"213\",\"214\",\"215\",\"216\",\"217\",\"218\",\"219\",\"220\",\"221\",\"222\",\"223\",\"224\",\"345\",\"346\",\"347\",\"348\",\"349\",\"350\",\"351\",\"352\",\"353\",\"354\",\"355\",\"356\",\"357\",\"358\",\"359\",\"360\",\"361\",\"362\",\"363\",\"364\",\"365\",\"366\",\"367\",\"368\",\"369\",\"370\"]', 100, 1524291162, 1524319938, 1, 1, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dp_admin_user`
--

CREATE TABLE `dp_admin_user` (
  `id` int(11) UNSIGNED NOT NULL,
  `username` varchar(32) NOT NULL DEFAULT '' COMMENT '用户名',
  `nickname` varchar(32) NOT NULL DEFAULT '' COMMENT '昵称',
  `password` varchar(96) NOT NULL DEFAULT '' COMMENT '密码',
  `email` varchar(64) NOT NULL DEFAULT '' COMMENT '邮箱地址',
  `email_bind` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否绑定邮箱地址',
  `mobile` varchar(11) NOT NULL DEFAULT '' COMMENT '手机号码',
  `mobile_bind` tinyint(1) UNSIGNED NOT NULL DEFAULT '0' COMMENT '是否绑定手机号码',
  `avatar` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '头像',
  `money` decimal(11,2) UNSIGNED NOT NULL DEFAULT '0.00' COMMENT '余额',
  `score` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '积分',
  `role` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '角色ID',
  `group` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '部门id',
  `signup_ip` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '注册ip',
  `create_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '创建时间',
  `update_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '更新时间',
  `last_login_time` int(11) UNSIGNED NOT NULL DEFAULT '0' COMMENT '最后一次登录时间',
  `last_login_ip` bigint(20) UNSIGNED NOT NULL DEFAULT '0' COMMENT '登录ip',
  `sort` int(11) NOT NULL DEFAULT '100' COMMENT '排序',
  `status` tinyint(2) NOT NULL DEFAULT '0' COMMENT '状态：0禁用，1启用'
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COMMENT='用户表' ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_admin_user`
--

INSERT INTO `dp_admin_user` (`id`, `username`, `nickname`, `password`, `email`, `email_bind`, `mobile`, `mobile_bind`, `avatar`, `money`, `score`, `role`, `group`, `signup_ip`, `create_time`, `update_time`, `last_login_time`, `last_login_ip`, `sort`, `status`) VALUES
(1, 'admin', 'administrator', '$2y$10$Brw6wmuSLIIx3Yabid8/Wu5l8VQ9M/H/CG3C9RqN9dUCwZW3ljGOK', '', 0, '', 0, 0, '0.00', 0, 1, 0, 0, 1476065410, 1525447254, 1525447254, 2130706433, 100, 1),
(2, 'manager', 'manager', '$2y$10$CQxBECVWuOBu.Sfs2hSOp.aP0ncAuVjfEskEnXywJu9AzpsXGTaxq', 'manager@qq.com', 0, '', 0, 0, '0.00', 0, 3, 0, 0, 1524281188, 1525442486, 1525442485, 2130706433, 100, 1),
(3, 'user', 'user', '$2y$10$MG/UxznRLRLc8gclOsVY9uM5Ko6sjH4b0scxcaXPa.FDk1Boan1fi', 'user@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1524281216, 1524576381, 1524576381, 2130706433, 100, 1),
(4, 'user1', 'user1', '$2y$10$tENUy.y2AADTHshjdFJ5LORv4K7RVP74IvVGr7VwQCNXXgOaPEus6', 'user1@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1524324620, 1524324636, 1524324636, 0, 100, 1),
(5, 'user2', 'user2', '$2y$10$U.FAXXoOX/dyB4b2YMuU2.P.6mywvJAuixtGcZncWp5SsWxK4s3T6', 'user2@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1524324807, 1524324940, 1524324940, 0, 100, 1),
(6, 'user11', 'user11', '$2y$10$NvtYBUTPbaEfxGFd0u6uZ.NF6ZrevVxuY4phDyLguUhO34y3jjhCO', 'user11@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1524576068, 1524581653, 1524581653, 2130706433, 100, 1),
(8, 'lichenjie', 'lichenjie', '$2y$10$EVTe5fYFn0Xqxgcg74YxCOL2alE/15gUfwvVYmBnrrJEjavCkIsEG', 'lichenjie@iit.edu', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525284139, 1525284174, 1525284174, 0, 100, 1),
(7, 'tom', 'tom', '$2y$10$QshM5D64CUNK60LydzQx7ebuN5U5/0iyafG9qebPRH1Hl/t7jq8Ia', 'tom@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525014615, 1525014627, 1525014627, 2130706433, 100, 1),
(9, 'lifangzheng', 'lifangzheng', '$2y$10$V30zM8gN4efpmcT2lr9YIeOEni6J7XhKYm8ewBboIh6QFo3FZVixG', 'lifangzheng@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525436564, 1525436577, 1525436576, 0, 100, 1),
(10, 'user10', 'user10', '$2y$10$G5BTc4Z7FWeeoeGaLQdJPOQGcyIEhHJK.Qln0Wc7j4AZF7aL160Gm', 'user10@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525437157, 1525437157, 0, 0, 100, 1),
(11, 'user12', 'user12', '$2y$10$b/m6GF4Ok8KBrOCSlYEbC.HLVnQPWalsVPElVnRasE1A9XmU4Uzou', 'user12@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525437223, 1525437223, 0, 0, 100, 1),
(12, 'user13', 'user13', '$2y$10$/CDutJiXkwHDgnuSgMEQzOBjw3.WSLDfPHIXglOaOMXRjbjXiiKde', 'user13@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525437242, 1525437242, 0, 0, 100, 1),
(13, 'user14', 'user14', '$2y$10$9RBqEVUr0Atl9gqpq2s.Qe9I2EFpj6fiHycqHQMgUneZzZraXHyJK', 'user14@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525437262, 1525437262, 0, 0, 100, 1),
(14, 'user15', 'user15', '$2y$10$TTgDGdrTziL3eTOuprk1TurayYrmXqLuA3EIwkKoluvlMGuTvrfju', 'user15@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525437287, 1525437287, 0, 0, 100, 1),
(15, 'user16', 'user16', '$2y$10$vf9HauGjsuqHZJllYJY7UeAKyBpZ0EuzlyaLLoFosKqLgz/L6AF32', 'user16@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525437306, 1525437306, 0, 0, 100, 1),
(16, 'user17', 'user17', '$2y$10$rxBnX.4aSn3ZX.s8LEsxIuLLM3nif8oyHdmlAwUFOjMRcRqr21a4W', 'user17@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525437328, 1525437328, 0, 0, 100, 1),
(17, 'user20', 'user20', '$2y$10$d1TCrGkICp3ffpdzYTl7oe6mWseN/OJFiI3c4Y8TQcwJaNU0YtmXe', 'user20@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525437460, 1525437566, 1525437565, 0, 100, 1),
(18, 'lily', 'lily', '$2y$10$wos7xD6vVW9XSMpTs.wFd.H8AJlsaU7589UdY46tmn8BwYbVhPJMS', 'lily@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525447221, 1525447231, 1525447231, 0, 100, 1),
(19, 'fangshiyu', 'fangshiyu', '$2y$10$Nvg4jdgI0HEr1SwALdfjs.oe85JnSJcI71qS39rWw0Q8v8Whd2FQq', 'fangshiyu@qq.com', 0, '', 0, 0, '0.00', 0, 2, 0, 0, 1525448449, 1525448459, 1525448458, 0, 100, 1);

-- --------------------------------------------------------

--
-- Table structure for table `dp_odc_address`
--

CREATE TABLE `dp_odc_address` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) NOT NULL,
  `address` varchar(30) NOT NULL,
  `status` int(1) NOT NULL DEFAULT '0',
  `create_time` int(11) NOT NULL,
  `update_time` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_odc_address`
--

INSERT INTO `dp_odc_address` (`id`, `user_id`, `address`, `status`, `create_time`, `update_time`) VALUES
(1, 5, 'a,12,3,4,4,5,6,77', 0, 1524324962, 1524324962),
(2, 3, 'aasdasdasda', 0, 1524575814, 1524575814),
(3, 3, '3fsdfasdf', 0, 1524575823, 1524575823),
(4, 4, 'fasdgag', 0, 1524581676, 1524581676),
(5, 6, 'asdfasdfa', 0, 1524582829, 1524582829),
(6, 1, 'twerrtretw', 0, 1524582937, 1524582937),
(8, 2, 'twerrtretw', 0, 1524583244, 1524583244),
(9, 6, 'twerrtretw', 0, 1524583456, 1524583456),
(10, 6, 'twerrtretw', 0, 1524583478, 1524583478),
(11, 6, 'twerrtretw', 0, 1524583506, 1524583506),
(12, 6, 'twerrtretw', 0, 1524583541, 1524583541),
(13, 7, 'Cape Town South Africa', 0, 1525014740, 1525014740),
(14, 7, 'Jonhsburg South Africa', 0, 1525014765, 1525014765),
(15, 17, '3500 S Halsted  Chicago IL', 0, 1525437670, 1525437670),
(16, 17, '3300 S Halsted Chicago IL US', 0, 1525437701, 1525437701),
(17, 18, '2900 wells street  Chicago', 0, 1525447350, 1525447350),
(18, 18, '3199 Michigan Ave Chicago US', 0, 1525447393, 1525447393),
(19, 19, '801 S Plymouth Chicago US  600', 0, 1525448504, 1525448504),
(20, 19, '3100 Federal State Chicago US ', 0, 1525448532, 1525448532);

-- --------------------------------------------------------

--
-- Table structure for table `dp_odc_category`
--

CREATE TABLE `dp_odc_category` (
  `id` bigint(20) NOT NULL,
  `pid` bigint(20) NOT NULL DEFAULT '0',
  `user_id` int(11) DEFAULT NULL,
  `name` varchar(30) NOT NULL,
  `description` varchar(100) NOT NULL,
  `sort` int(255) DEFAULT NULL,
  `status` int(1) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_odc_category`
--

INSERT INTO `dp_odc_category` (`id`, `pid`, `user_id`, `name`, `description`, `sort`, `status`, `create_time`, `update_time`) VALUES
(1, 0, 3, 'bad', '2222', 1, 1, 1524275048, 1525015299),
(2, 0, 3, '衣服', '', NULL, 1, NULL, NULL),
(3, 0, 3, '裤子', '', NULL, 1, NULL, NULL),
(4, 0, 3, '鞋子', '', NULL, 1, NULL, NULL),
(5, 0, 3, 'cap', '', 0, 1, NULL, 1525015447),
(6, 1, 3, '单肩包', '', 0, 1, NULL, 1524290945),
(7, 1, 3, '双肩包', '', NULL, 1, NULL, NULL),
(8, 1, 3, '手提包', '', NULL, 1, NULL, NULL),
(9, 1, 3, '挎包', '', NULL, 1, NULL, NULL),
(10, 2, 3, '羽绒服', '', NULL, 1, NULL, NULL),
(11, 2, 3, '体恤', '', NULL, 1, NULL, NULL),
(12, 2, 3, '外套', '', NULL, 1, NULL, NULL),
(13, 3, 3, '长裤', '', NULL, 1, NULL, NULL),
(14, 3, 3, '短裤', '', NULL, 1, NULL, NULL),
(15, 4, 3, '球鞋', '', NULL, 1, NULL, NULL),
(16, 4, 3, '皮鞋', '', NULL, 1, NULL, NULL),
(17, 4, 3, '布鞋', '', NULL, 1, NULL, NULL),
(18, 5, 3, '鸭舌帽', '', NULL, 1, NULL, NULL),
(19, 5, 3, '草帽', '', NULL, 1, NULL, NULL),
(20, 5, 3, '礼帽', '', NULL, 1, NULL, NULL),
(21, 5, 3, 'Beret', '', 0, 1, NULL, 1525015429),
(23, 6, 5, 'danjianbap', 'danjianbapdanjianbapdanjianbapdanjianbap', 0, 1, 1524325175, 1524325175),
(24, 0, 3, '顶级分类', '', NULL, 1, NULL, NULL),
(25, 0, 6, 'shoe', 'shoeshoeshoeshoeshoeshoeshoeshoeshoe', 1, 1, 1524576466, 1524576466),
(26, 25, 6, 'so11', 'so11so11so11so11', 1, 1, 1524576489, 1524576489),
(27, 0, 7, '', '', 0, 1, 1525014809, 1525014809),
(28, 0, 17, 'Clothe', 'Clothe category', 0, 1, 1525437820, 1525437820),
(29, 0, 17, 'Shoe', 'Shoe', 0, 1, 1525437835, 1525437835),
(30, 28, 17, 'Shirt', 'Shirt category', 0, 1, 1525437902, 1525437925),
(31, 0, 18, 'vehicle category', 'vehicle category', 0, 1, 1525447561, 1525447561),
(32, 31, 18, 'Toyata', '', 0, 1, 1525447618, 1525447618),
(33, 31, 18, 'VW category', 'VW category description', 0, 1, 1525447706, 1525447706),
(34, 0, 19, 'Toy', 'Toys', 0, 1, 1525448590, 1525448590),
(35, 34, 19, 'infant', 'infant toy', 0, 1, 1525448628, 1525448628);

-- --------------------------------------------------------

--
-- Table structure for table `dp_odc_inventory`
--

CREATE TABLE `dp_odc_inventory` (
  `id` bigint(20) NOT NULL,
  `product_id` float DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `max_quantity` float DEFAULT NULL,
  `status` int(16) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_odc_inventory`
--

INSERT INTO `dp_odc_inventory` (`id`, `product_id`, `region_id`, `user_id`, `avatar`, `max_quantity`, `status`, `create_time`, `update_time`) VALUES
(1, 2, 13, NULL, 'qq', 100, 1, 1524280218, 1524280218),
(2, 1, 13, 3, 'aa', 11, 1, 1524321341, 1524321341),
(3, 3, 11, 17, NULL, 200, 1, 1525439710, 1525439872),
(4, 5, 11, 17, NULL, 300, 1, 1525440650, 1525441435),
(5, 6, 14, 18, NULL, 20, 1, 1525447830, 1525447830);

-- --------------------------------------------------------

--
-- Table structure for table `dp_odc_product`
--

CREATE TABLE `dp_odc_product` (
  `id` bigint(20) NOT NULL,
  `name` varchar(30) NOT NULL,
  `category_id` int(11) DEFAULT NULL,
  `user_id` int(11) DEFAULT NULL,
  `color` varchar(30) NOT NULL,
  `weight` float NOT NULL,
  `avatar` varchar(256) DEFAULT NULL,
  `quantity` float NOT NULL,
  `description` varchar(512) DEFAULT NULL,
  `status` int(1) NOT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_odc_product`
--

INSERT INTO `dp_odc_product` (`id`, `name`, `category_id`, `user_id`, `color`, `weight`, `avatar`, `quantity`, `description`, `status`, `create_time`, `update_time`) VALUES
(1, 'qqqqq', 2, 3, 'qq', 0, 'qq', 0, 'qqqqq222', 1, 1524236861, 1524236918),
(2, '休闲双肩包', 7, 3, 'red', 10, '', 0, '', 1, 1524279462, 1524279462),
(3, 'Goodthreads Men\'s Standard-Fit', 30, 17, 'Red Tannin', 14.1, '', 10, 'An Amazon brand - This work- or weekend-perfect casual button-front shirt in two-tone check features a special wash for a soft feel and maximum comfort', 1, 1525438206, 1525438206),
(5, 'UNTUCKit Dunn Men\'s Button Dow', 30, 17, 'Grey Gingham', 1, '', 20, 'Yet another example of a classic gingham gone awesome-er. If grey is your thing then you\'re gonna love this shirt. The red sail adds spectacular flair, so this grey shirt is definitely not a blend color. 100% lightweight cotton poplin - Made from combed cotton, creating a strong but lightweight finished fabric. Looks like work, but worn like leisure.', 1, 1525438354, 1525438953),
(6, 'VW Jetta 2.0 ', 33, 18, 'blue', 1000, NULL, 2, 'VW Jetta 2.0 ', 1, 1525447796, 1525447796),
(9, 'LEGO DUPLO My First Emotions 1', 35, 19, 'blue', 10, NULL, 2, 'blue lego toys', 1, 1525448942, 1525448942);

-- --------------------------------------------------------

--
-- Table structure for table `dp_odc_region`
--

CREATE TABLE `dp_odc_region` (
  `id` bigint(20) NOT NULL,
  `mg_user_id` int(11) DEFAULT NULL,
  `region_name` varchar(30) DEFAULT NULL,
  `wh_name` varchar(30) DEFAULT NULL,
  `wh_address` varchar(100) DEFAULT NULL,
  `wh_desc` varchar(100) DEFAULT NULL,
  `region_desc` varchar(100) DEFAULT NULL,
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_odc_region`
--

INSERT INTO `dp_odc_region` (`id`, `mg_user_id`, `region_name`, `wh_name`, `wh_address`, `wh_desc`, `region_desc`, `create_time`, `update_time`) VALUES
(9, 2, 'Center America', 'Center America Warehouse', 'Panama', 'Center America warehouse', 'Center America warehouse', 1524237035, 1525015259),
(10, 2, 'North America', 'North America warehouse', 'South Halsted Chicago IL US', 'North America warehouse', 'North America warehouse', 1524273965, 1525015040),
(11, 2, 'South America', 'South America warehouse', 'Rio  Brazil', 'South America warehouse', 'South America', 1524273976, 1525015087),
(12, 1, 'Africa/Middle East', 'Africa/Middle East warehouse', 'South Africa', 'Africa/Middle East warehouse', 'Africa/Middle East', 1524273988, 1525015130),
(13, 2, 'Asia', 'Asia warehouse', 'Beijing China', 'Asia warehouse', 'Asia', 1524273995, 1525015176),
(14, 1, 'Europe', 'Europe warehouse', 'London UK', 'Europe warehouse', 'Europe ', 1524274005, 1525015233);

-- --------------------------------------------------------

--
-- Table structure for table `dp_odc_user`
--

CREATE TABLE `dp_odc_user` (
  `id` bigint(20) NOT NULL,
  `user_id` int(11) DEFAULT NULL,
  `region_id` int(11) DEFAULT NULL,
  `address_id` int(11) DEFAULT NULL,
  `type` int(1) DEFAULT '0',
  `create_time` int(11) DEFAULT NULL,
  `update_time` int(11) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8 ROW_FORMAT=DYNAMIC;

--
-- Dumping data for table `dp_odc_user`
--

INSERT INTO `dp_odc_user` (`id`, `user_id`, `region_id`, `address_id`, `type`, `create_time`, `update_time`) VALUES
(1, 1, 9, 1, 1, NULL, NULL),
(2, 2, 11, 2, 1, NULL, NULL),
(3, 3, 11, 2, 0, NULL, NULL),
(4, 4, 10, 4, 0, 1524324620, 1524324620),
(5, 5, 14, 1, 0, 1524324807, 1524324807),
(6, 6, 2, 6, 0, 1524576068, 1524583541),
(7, 7, 1, 7, 0, 1525014615, 1525014765),
(13, 9, 5, NULL, 0, 1525436564, 1525436564),
(14, 10, 1, NULL, 0, 1525437157, 1525437157),
(15, 11, 2, NULL, 0, 1525437223, 1525437223),
(16, 12, 3, NULL, 0, 1525437242, 1525437242),
(17, 13, 3, NULL, 0, 1525437262, 1525437262),
(18, 14, 4, NULL, 0, 1525437287, 1525437287),
(19, 15, 5, NULL, 0, 1525437306, 1525437306),
(20, 16, 6, NULL, 0, 1525437328, 1525437328),
(21, 17, 6, 17, 0, 1525437460, 1525437701),
(22, 18, 4, 18, 0, 1525447221, 1525447393),
(23, 19, 5, 19, 0, 1525448449, 1525448532);

--
-- Indexes for dumped tables
--

--
-- Indexes for table `admin_action`
--
ALTER TABLE `admin_action`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_attachment`
--
ALTER TABLE `admin_attachment`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_config`
--
ALTER TABLE `admin_config`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_hook`
--
ALTER TABLE `admin_hook`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_hook_plugin`
--
ALTER TABLE `admin_hook_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_icon`
--
ALTER TABLE `admin_icon`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_icon_list`
--
ALTER TABLE `admin_icon_list`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_log`
--
ALTER TABLE `admin_log`
  ADD PRIMARY KEY (`id`),
  ADD KEY `action_ip_ix` (`action_ip`),
  ADD KEY `action_id_ix` (`action_id`),
  ADD KEY `user_id_ix` (`user_id`);

--
-- Indexes for table `admin_menu`
--
ALTER TABLE `admin_menu`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_message`
--
ALTER TABLE `admin_message`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_module`
--
ALTER TABLE `admin_module`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_packet`
--
ALTER TABLE `admin_packet`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_plugin`
--
ALTER TABLE `admin_plugin`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_role`
--
ALTER TABLE `admin_role`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `admin_user`
--
ALTER TABLE `admin_user`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `dp_admin_action`
--
ALTER TABLE `dp_admin_action`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_attachment`
--
ALTER TABLE `dp_admin_attachment`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_config`
--
ALTER TABLE `dp_admin_config`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_hook`
--
ALTER TABLE `dp_admin_hook`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_hook_plugin`
--
ALTER TABLE `dp_admin_hook_plugin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_icon`
--
ALTER TABLE `dp_admin_icon`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_icon_list`
--
ALTER TABLE `dp_admin_icon_list`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_log`
--
ALTER TABLE `dp_admin_log`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD KEY `action_ip_ix` (`action_ip`) USING BTREE,
  ADD KEY `action_id_ix` (`action_id`) USING BTREE,
  ADD KEY `user_id_ix` (`user_id`) USING BTREE;

--
-- Indexes for table `dp_admin_menu`
--
ALTER TABLE `dp_admin_menu`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_message`
--
ALTER TABLE `dp_admin_message`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_module`
--
ALTER TABLE `dp_admin_module`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_packet`
--
ALTER TABLE `dp_admin_packet`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_plugin`
--
ALTER TABLE `dp_admin_plugin`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_role`
--
ALTER TABLE `dp_admin_role`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_admin_user`
--
ALTER TABLE `dp_admin_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_odc_address`
--
ALTER TABLE `dp_odc_address`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_odc_category`
--
ALTER TABLE `dp_odc_category`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_odc_inventory`
--
ALTER TABLE `dp_odc_inventory`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- Indexes for table `dp_odc_product`
--
ALTER TABLE `dp_odc_product`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `UK_f1lygoborvothkuaqghjy8exw` (`name`) USING BTREE;

--
-- Indexes for table `dp_odc_region`
--
ALTER TABLE `dp_odc_region`
  ADD PRIMARY KEY (`id`) USING BTREE,
  ADD UNIQUE KEY `name` (`region_name`) USING BTREE;

--
-- Indexes for table `dp_odc_user`
--
ALTER TABLE `dp_odc_user`
  ADD PRIMARY KEY (`id`) USING BTREE;

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `admin_action`
--
ALTER TABLE `admin_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=43;

--
-- AUTO_INCREMENT for table `admin_attachment`
--
ALTER TABLE `admin_attachment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_config`
--
ALTER TABLE `admin_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `admin_hook`
--
ALTER TABLE `admin_hook`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `admin_hook_plugin`
--
ALTER TABLE `admin_hook_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_icon`
--
ALTER TABLE `admin_icon`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_icon_list`
--
ALTER TABLE `admin_icon_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_log`
--
ALTER TABLE `admin_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键';

--
-- AUTO_INCREMENT for table `admin_menu`
--
ALTER TABLE `admin_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=234;

--
-- AUTO_INCREMENT for table `admin_message`
--
ALTER TABLE `admin_message`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_module`
--
ALTER TABLE `admin_module`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_packet`
--
ALTER TABLE `admin_packet`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `admin_plugin`
--
ALTER TABLE `admin_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `admin_role`
--
ALTER TABLE `admin_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id', AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `admin_user`
--
ALTER TABLE `admin_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=2;

--
-- AUTO_INCREMENT for table `dp_admin_action`
--
ALTER TABLE `dp_admin_action`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=100;

--
-- AUTO_INCREMENT for table `dp_admin_attachment`
--
ALTER TABLE `dp_admin_attachment`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dp_admin_config`
--
ALTER TABLE `dp_admin_config`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=39;

--
-- AUTO_INCREMENT for table `dp_admin_hook`
--
ALTER TABLE `dp_admin_hook`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=18;

--
-- AUTO_INCREMENT for table `dp_admin_hook_plugin`
--
ALTER TABLE `dp_admin_hook_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=3;

--
-- AUTO_INCREMENT for table `dp_admin_icon`
--
ALTER TABLE `dp_admin_icon`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dp_admin_icon_list`
--
ALTER TABLE `dp_admin_icon_list`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dp_admin_log`
--
ALTER TABLE `dp_admin_log`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '主键', AUTO_INCREMENT=48;

--
-- AUTO_INCREMENT for table `dp_admin_menu`
--
ALTER TABLE `dp_admin_menu`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=371;

--
-- AUTO_INCREMENT for table `dp_admin_message`
--
ALTER TABLE `dp_admin_message`
  MODIFY `id` bigint(20) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dp_admin_module`
--
ALTER TABLE `dp_admin_module`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dp_admin_packet`
--
ALTER TABLE `dp_admin_packet`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT for table `dp_admin_plugin`
--
ALTER TABLE `dp_admin_plugin`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dp_admin_role`
--
ALTER TABLE `dp_admin_role`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT COMMENT '角色id', AUTO_INCREMENT=4;

--
-- AUTO_INCREMENT for table `dp_admin_user`
--
ALTER TABLE `dp_admin_user`
  MODIFY `id` int(11) UNSIGNED NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=20;

--
-- AUTO_INCREMENT for table `dp_odc_address`
--
ALTER TABLE `dp_odc_address`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=21;

--
-- AUTO_INCREMENT for table `dp_odc_category`
--
ALTER TABLE `dp_odc_category`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=36;

--
-- AUTO_INCREMENT for table `dp_odc_inventory`
--
ALTER TABLE `dp_odc_inventory`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=6;

--
-- AUTO_INCREMENT for table `dp_odc_product`
--
ALTER TABLE `dp_odc_product`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=10;

--
-- AUTO_INCREMENT for table `dp_odc_region`
--
ALTER TABLE `dp_odc_region`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=15;

--
-- AUTO_INCREMENT for table `dp_odc_user`
--
ALTER TABLE `dp_odc_user`
  MODIFY `id` bigint(20) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=24;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
