<?php










namespace app\cms\admin;

use app\admin\controller\Admin;
use app\common\builder\ZBuilder;
use app\cms\model\Link as LinkModel;

/**
 * 友情链接控制器
 * @package app\cms\admin
 */
class Link extends Admin
{
    /**
     * 友情链接列表

     * @return mixed
     */
    public function index()
    {
        // 查询
        $map = $this->getMap();
        // 排序
        $order = $this->getOrder('update_time desc');
        // 数据列表
        $data_list = LinkModel::where($map)->order($order)->paginate();

        // 使用ZBuilder快速创建数据表格
        return ZBuilder::make('table')
            ->setSearch(['title' => '标题']) // 设置搜索框
            ->addColumns([ // 批量添加数据列
                ['id', 'ID'],
                ['title', '标题', 'text.edit'],
                ['url', '链接', 'text.edit'],
                ['type', '类型', 'text', '', [1 => '文字链接', 2 => '图片链接']],
                ['create_time', '创建时间', 'datetime'],
                ['update_time', '更新时间', 'datetime'],
                ['status', '状态', 'switch'],
                ['right_button', '操作', 'btn']
            ])
            ->addTopButtons('add,enable,disable,delete') // 批量添加顶部按钮
            ->addRightButtons(['edit', 'delete' => ['data-tips' => 'Delete后无法恢复。']]) // 批量添加右侧按钮
            ->addOrder('id,title,type,create_time,update_time')
            ->setRowList($data_list) // 设置表格数据
            ->addValidate('Link', 'title,url')
            ->fetch(); // 渲染模板
    }

    /**
     * Create

     * @return mixed
     */
    public function add()
    {
        // 保存数据
        if ($this->request->isPost()) {
            // 表单数据
            $data = $this->request->post();

            // 验证
            $result = $this->validate($data, 'Link');
            if(true !== $result) $this->error($result);

            if ($link = LinkModel::create($data)) {
                // 记录行为
                action_log('link_add', 'cms_link', $link['id'], UID, $data['title']);
                $this->success('Create成功', 'index');
            } else {
                $this->error('Create失败');
            }
        }

        // 显示添加页面
        return ZBuilder::make('form')
            ->addFormItems([
                ['radio', 'type', '链接类型', '', [1 => '文字链接', 2 => '图片链接'], 1],
                ['text', 'title', '链接标题'],
                ['text', 'url', '链接地址', '请以 <code>http</code> 或 <code>https</code>开头'],
                ['image', 'logo', '链接LOGO'],
                ['tags', 'keywords', '关键词'],
                ['textarea', 'contact', '联系方式'],
                ['text', 'sort', '排序', '', 100],
                ['radio', 'status', '立即启用', '', ['否', '是'], 1]
            ])
            ->setTrigger('type', 2, 'logo')
            ->fetch();
    }

    /**
     * Edit
     * @param null $id 链接id

     */
    public function edit($id = null)
    {
        if ($id === null) $this->error('缺少参数');

        // 保存数据
        if ($this->request->isPost()) {
            // 表单数据
            $data = $this->request->post();

            // 验证
            $result = $this->validate($data, 'Link');
            if(true !== $result) $this->error($result);

            if (LinkModel::update($data)) {
                // 记录行为
                action_log('link_edit', 'cms_link', $id, UID, $data['title']);
                $this->success('Edit成功', 'index');
            } else {
                $this->error('Edit失败');
            }
        }

        $info = LinkModel::get($id);

        // 显示Edit页面
        return ZBuilder::make('form')
            ->addFormItems([
                ['hidden', 'id'],
                ['radio', 'type', '链接类型', '', [1 => '文字链接', 2 => '图片链接']],
                ['text', 'title', '链接标题'],
                ['text', 'url', '链接地址', '请以 <code>http</code> 或 <code>https</code>开头'],
                ['image', 'logo', '链接LOGO'],
                ['tags', 'keywords', '关键词'],
                ['textarea', 'contact', '联系方式'],
                ['text', 'sort', '排序'],
                ['radio', 'status', '立即启用', '', ['否', '是']]
            ])
            ->setTrigger('type', 2, 'logo')
            ->setFormData($info)
            ->fetch();
    }

    /**
     * Delete友情链接
     * @param array $record 行为日志

     * @return mixed
     */
    public function delete($record = [])
    {
        return $this->setStatus('delete');
    }

    /**
     * 启用友情链接
     * @param array $record 行为日志

     * @return mixed
     */
    public function enable($record = [])
    {
        return $this->setStatus('enable');
    }

    /**
     * 禁用友情链接
     * @param array $record 行为日志

     * @return mixed
     */
    public function disable($record = [])
    {
        return $this->setStatus('disable');
    }

    /**
     * 设置友情链接状态：Delete、禁用、启用
     * @param string $type 类型：delete/enable/disable
     * @param array $record

     * @return mixed
     */
    public function setStatus($type = '', $record = [])
    {
        $ids        = $this->request->isPost() ? input('post.ids/a') : input('param.ids');
        $link_title = LinkModel::where('id', 'in', $ids)->column('title');
        return parent::setStatus($type, ['link_'.$type, 'cms_link', 0, UID, implode('、', $link_title)]);
    }

    /**
     * 快速Edit
     * @param array $record 行为日志

     * @return mixed
     */
    public function quickEdit($record = [])
    {
        $id      = input('post.pk', '');
        $field   = input('post.name', '');
        $value   = input('post.value', '');
        $link    = LinkModel::where('id', $id)->value($field);
        $details = '字段(' . $field . ')，原值(' . $link . ')，新值：(' . $value . ')';
        return parent::quickEdit(['link_edit', 'cms_link', $id, UID, $details]);
    }
}