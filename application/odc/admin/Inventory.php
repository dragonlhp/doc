<?php
// +----------------------------------------------------------------------
// | 海豚PHP框架 [ DolphinPHP ]
// +----------------------------------------------------------------------
// | 版权所有 2016~2017 河源市卓锐科技有限公司 [ http://www.zrthink.com ]
// +----------------------------------------------------------------------
// | 官方网站: http://dolphinphp.com
// +----------------------------------------------------------------------
// | 开源协议 ( http://www.apache.org/licenses/LICENSE-2.0 )
// +----------------------------------------------------------------------

	namespace app\odc\admin;

	use app\admin\controller\Admin;
	use app\common\builder\ZBuilder;
	use app\odc\model\InventoryModel;
	use app\odc\model\ProductModel;
	use app\odc\model\RegionModel;

	/**
	 * Class Inventory
	 * @package app\odc\admin
	 */
	class Inventory extends BaseController
	{
		/**
		 * @return mixed
		 * @throws \think\Exception
		 */
		public function index()
		{
			// 查询
			$map = $this->getMap();
			// 排序
			$order = $this->getOrder('id asc');
			if ($this->user['type'] != 1)
			{
				$map['user_id'] = session('user_auth')['uid'];
			}
			// 数据列表
			$data_list = InventoryModel::where($map)->order($order)->paginate();

			// 使用ZBuilder快速创建数据表格
			// 批量添加数据列
			$addColumns = [
				['id', 'ID'],
				['product_id', 'product', 'select', ProductModel::getList()],
				['region_id', 'region', 'select', RegionModel::getList()],
				['avatar', 'avatar', 'text'],
				['max_quantity', 'max_quantity', 'text'],
				['status', 'Status', 'switch'],
				['right_button', 'Options', 'btn']
			];
			$ZBuilder = ZBuilder::make('table');
			if ($this->user['type'] != 0)
			{
				//$addColumns[0] = ['user_id', 'User', 'select', static::userlist()];
				$ZBuilder->addTopSelect('user_id', 'Select User', static::userlist('user'));
			}
			return $ZBuilder = $ZBuilder->setSearch(['title' => '标题'])// 设置搜索框
			->addColumns($addColumns)
				->addTopButtons('add,delete')// 批量添加顶部按钮
				->addRightButtons(['edit', 'delete' => ['data-tips' => 'Unable to recover after deletion.。']])// 批量添加右侧按钮
				->addOrder('id,name')
				->setRowList($data_list)// 设置表格数据
				->fetch(); // 渲染模板
		}

		/**
		 * @return mixed
		 * @throws \think\Exception
		 */
		public function add()
		{
			// 保存数据
			if ($this->request->isPost())
			{
				$data = $this->request->post();
				if ($advert = InventoryModel::create($data))
				{
					$this->success('新增成功', 'index');
				} else
				{
					$this->error('新增失败');
				}
			}
			// 显示添加页面
			return ZBuilder::make('form')
				->setPageTips('如果出现无法添加的情况，可能由于浏览器将本页面当成了广告，请尝试关闭浏览器的广告过滤功能再试。', 'warning')
				->addFormItems([
					['select', 'product_id', 'product', '', ProductModel::getList()],
					['select', 'region_id', 'region', '', RegionModel::getList()],
					['text', 'avatar', 'avatar'],
					['text', 'max_quantity', 'max_quantity'],
					['radio', 'status', '立即启用', '', ['OFF', 'ON'], 1],
				])
				->addHidden('user_id', $this->user['uid'])
				->setTrigger('timeset', '1', 'start_time')
				->fetch();
		}

		/**
		 * @param null $id
		 * @return mixed
		 * @throws \think\Exception
		 * @throws \think\exception\DbException
		 */
		public function edit($id = null)
		{
			if ($id === null)
				$this->error('缺少参数');

			// 保存数据
			if ($this->request->isPost())
			{
				// 表单数据
				$data = $this->request->post();

				if (InventoryModel::update($data, ['id' => $id]))
				{
					// 记录行为
					$this->success('编辑成功', 'index');
				} else
				{
					$this->error('编辑失败');
				}
			}

			$list_type = InventoryModel::where([])->select();
			array_unshift($list_type, '默认分类');

			$info = InventoryModel::get($id);

			// 显示编辑页面
			return ZBuilder::make('form')
				->setPageTips('如果出现无法添加的情况，可能由于浏览器将本页面当成了广告，请尝试关闭浏览器的广告过滤功能再试。', 'warning')
				->addFormItems([
					['select', 'product_id', 'Product', '', ProductModel::getList()],
					['select', 'region_id', 'Region', '', RegionModel::getList()],
					['text', 'avatar', 'avatar'],
					['text', 'max_quantity', 'MaxQuantity'],
					['radio', 'status', 'Now ON', '', ['OFF', 'ON'], 1],
				])
				->addHidden('user_id', $this->user['uid'])
				->setTrigger('timeset', '1', 'start_time')
				->setFormData($info)
				->fetch();
		}

		/**
		 * @param array $record
		 * @return mixed
		 */
		public function delete($record = [])
		{
			return $this->setStatus('delete');
		}


		/**
		 * @param string $type
		 * @param array $record
		 * @return mixed
		 */
		public function setStatus($type = '', $record = [])
		{
			$ids = $this->request->isPost() ? input('post.ids/a') : input('param.ids');
			$advert_name = InventoryModel::where('id', 'in', $ids)->column('name');
			return parent::setStatus($type, ['advert_' . $type, 'odc_advert', 0, UID, implode('、', $advert_name)]);
		}


	}