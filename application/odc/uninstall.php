<?php










use think\Db;
use think\Exception;
// odc模块卸载文件

// 是否清除数据
$clear = $this->request->get('clear');

if ($clear == 1) {
    // 内容模型的表名列表
    $table_list = Db::name('odc_model')->column('table');

    if ($table_list) {
        foreach ($table_list as $table) {
            // Delete内容模型表
            $sql = 'DROP TABLE IF EXISTS `'.$table.'`;';
            try {
                Db::execute($sql);
            } catch (\Exception $e) {
                throw new Exception('Delete表：'.$table.' 失败！', 1001);
            }
        }
    }
}
