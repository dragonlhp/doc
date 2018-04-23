<?php
namespace plugins\AliyunSms\controller;
use app\common\controller\Common;
use think\Db;

/**
 * User jingkewen
 * Class WeChat 微信SDK操作接口类
 * @package plugins\CloudWeChatSDK\controller
 */
class AliyunSms extends Common {
    //阿里短信接口
    public function sendSms($phoneCode,$phoneNum){
        // 读取微信插件配置
        $Config = plugin_config('AliyunSms');
        // 插件启用状态检测
        $Status = $this->getPluginStatus();
        if (!$Status) $this->error('阿里短信插件未开启或未安装!');
        // 检测插件必填项
        if (!$Config['AppKey'] || !$Config['AppSecret'] || !$Config['SignName'] || !$Config['TemplateCode']) {
            $this->error('短信AAppID/ppSecret/SignName/TemplateCode配置不完整!');
        }
        $request_paras = array(
            'ParamString' => '{"name":"'.$phoneCode.'"}',
            'RecNum' => $phoneNum,
            'SignName' =>$Config['SignName'],
            'TemplateCode' => $Config['TemplateCode']
        );
        $request_host = "http://sms.market.alicloudapi.com";
        $request_uri = "/singleSendSms";
        $request_method = "GET";
        $info = "";
        $content = $this->do_get($Config['AppKey'], $Config['AppSecret'], $request_host, $request_uri, $request_method, $request_paras, $info);
        return json_decode($content,true); // API返回值
    }
    /**
     * 检测插件是否安装和开启
     * @return bool
     */
    private function getPluginStatus() {
        $pluginRecord = Db::name('admin_plugin')->where('identifier', '=', 'aliyunsms.jing.plugin')->find();
        if (is_null($pluginRecord)) {
            return false;
        } else {
            // 检测插件是否开启
            $Status = $pluginRecord['status'];
            return $Status != 1 ? false : true;
        }
    }
    protected function do_get($app_key, $app_secret, $request_host, $request_uri, $request_method, $request_paras, &$info) {
        ksort($request_paras);
        $request_header_accept = "application/json;charset=utf-8";
        $content_type = "";
        $headers = array(
            'X-Ca-Key' => $app_key,
            'Accept' => $request_header_accept
        );
        ksort($headers);
        $header_str = "";
        $header_ignore_list = array('X-CA-SIGNATURE', 'X-CA-SIGNATURE-HEADERS', 'ACCEPT', 'CONTENT-MD5', 'CONTENT-TYPE', 'DATE');
        $sig_header = array();
        foreach($headers as $k => $v) {
            if(in_array(strtoupper($k), $header_ignore_list)) {
                continue;
            }
            $header_str .= $k . ':' . $v . "\n";
            array_push($sig_header, $k);
        }
        $url_str = $request_uri;
        $para_array = array();
        foreach($request_paras as $k => $v) {
            array_push($para_array, $k .'='. $v);
        }
        if(!empty($para_array)) {
            $url_str .= '?' . join('&', $para_array);
        }
        $content_md5 = "";
        $date = "";
        $sign_str = "";
        $sign_str .= $request_method ."\n";
        $sign_str .= $request_header_accept."\n";
        $sign_str .= $content_md5."\n";
        $sign_str .= "\n";
        $sign_str .= $date."\n";
        $sign_str .= $header_str;
        $sign_str .= $url_str;

        $sign = base64_encode(hash_hmac('sha256', $sign_str, $app_secret, true));
        $headers['X-Ca-Signature'] = $sign;
        $headers['X-Ca-Signature-Headers'] = join(',', $sig_header);
        $request_header = array();
        foreach($headers as $k => $v) {
            array_push($request_header, $k .': ' . $v);
        }

        $ch = curl_init();

        curl_setopt($ch, CURLOPT_URL, $request_host . $url_str);
        //curl_setopt($ch, CURLOPT_HEADER, true);
        curl_setopt($ch, CURLINFO_HEADER_OUT, true);
        curl_setopt($ch, CURLOPT_VERBOSE, true);
        curl_setopt($ch, CURLOPT_SSL_VERIFYHOST, 0);
        curl_setopt($ch, CURLOPT_SSL_VERIFYPEER, 0);
        curl_setopt($ch, CURLOPT_HTTPHEADER, $request_header);
        curl_setopt($ch, CURLOPT_RETURNTRANSFER, true);
        $ret = curl_exec($ch);
        $info = curl_getinfo($ch);
        curl_close($ch);
        return $ret;
    }
}