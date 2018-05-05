<?php

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
	class UInventory extends BaseController
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

			// 数据列表
			$data_list = InventoryModel::where([]);
			// 数据列表

			$map['user_id'] = $this->user['uid'];
			$data_list->where($map);

			$datas = $data_list->order($order)->paginate();

			// 使用ZBuilder快速创建数据表格
			// 批量添加数据列
			$addColumns = [
				['id', 'ID'],
				['avatar', 'Image', 'picture'],
				['product_id', 'product', 'select', ProductModel::getList()],
				['max_quantity', 'Quantity', 'text'],
				['status', 'Status', 'switch'],
				['right_button', 'Options', 'btn']
			];
			$ZBuilder = ZBuilder::make('table');

			return $ZBuilder = $ZBuilder
				->addColumns($addColumns)
				->addTopButtons(['add' => ['title' => 'Send',], 'delete'])// 批量添加顶部按钮
				->addRightButtons(['edit', 'delete' => ['data-tips' => 'Unable to recover after deletion.。']])// 批量添加右侧按钮
				->addOrder('id,name')
				->setRowList($datas)// 设置表格数据
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
				$avatar = ProductModel::where(['id' => $data['product_id']])->column('avatar');
				$data['avatar'] = $avatar[0];
				$data['region_id'] = $this->user['region_id'];
				if ($advert = InventoryModel::create($data))
				{
					$this->success('Create success', 'index');
				} else
				{
					$this->error('Create failure');
				}
			}
			// 显示添加页面
			return ZBuilder::make('form')
				->setPageTips($this->user['All'])
				->addFormItems([
					['select', 'product_id', 'product', '', ProductModel::getList()],
					//					['select', 'region_id', 'region', '', RegionModel::getList()],
					['text', 'max_quantity', 'Quantity'],
					['radio', 'status', 'effective immediately', '', ['OFF', 'ON'], 1],
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
				$avatar = ProductModel::where(['id' => $data['product_id']])->column('avatar');
				$data['avatar'] = $avatar[0];
				$data['region_id'] = $this->user['region_id'];
				if (InventoryModel::update($data, ['id' => $id]))
				{
					// 记录行为
					$this->success('Edit success', 'index');
				} else
				{
					$this->error('Edit failure');
				}
			}

			$list_type = InventoryModel::where([])->select();
			array_unshift($list_type, '默认分类');

			$info = InventoryModel::get($id);

			// 显示Edit页面
			return ZBuilder::make('form')
				->addFormItems([
					['select', 'product_id', 'Product', '', ProductModel::getList()],
					//					['select', 'region_id', 'Region', '', RegionModel::getList()],
					['text', 'max_quantity', 'Quantity'],
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