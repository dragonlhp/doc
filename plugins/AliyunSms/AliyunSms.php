<?php
namespace plugins\AliyunSms;
use app\common\controller\Plugin;

/**
 * User jingkewen
 * Class AliyunSms
 * @package plugins\AliyunSms
 */
class AliyunSms extends Plugin {
    /**
     * @var array 插件信息
     */
    public $info = [
        // 插件名[必填]
        'name'        => 'AliyunSms',
        // 插件标题[必填]
        'title'       => '阿里云短信发送插件',
        // 插件唯一标识[必填],格式：插件名.开发者标识.plugin
        'identifier'  => 'aliyunsms.jing.plugin',
        // 插件图标[选填]
        'icon'        => 'fa fa-fw fa-commenting',
        // 插件描述[选填]
        'description' => '阿里云短信发送插件',
        // 插件作者[必填]
        'author'      => 'jing',
        // 作者主页[选填]
        'author_url'  => 'http://www.yunqinet.com',
        // 插件版本[必填],格式采用三段式：主版本号.次版本号.修订版本号
        'version'     => '1.0.0',
        // 是否有后台管理功能[选填]
        'admin'       => '0',
    ];
    /**
     * 安装方法
     * @return bool
     */
    public function install() {
        return true;
    }

    /**
     * 卸载方法
     * @return bool
     */
    public function uninstall() {
        return true;
    }
}