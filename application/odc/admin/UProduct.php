<?php

	namespace app\odc\admin;

	use app\admin\controller\Admin;
	use app\common\builder\ZBuilder;
	use app\odc\model\CategoryModel;
	use app\odc\model\ProductModel;
	use app\odc\model\RegionModel;

	/**
	 * Class Product
	 * @package app\odc\admin
	 */
	class UProduct extends BaseController
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

			$data_list = ProductModel::where([]);
			$This_user = session('user_auth')['uid'];
			// 数据列表
			$map['user_id'] = $This_user;
			$data_list->where($map);
			$datas = $data_list->order($order)->paginate();
			// 使用ZBuilder快速创建数据表格
			$addColumns = [ // 批量添加数据列
							['id', 'ID'],
							['avatar', 'Image', 'picture'],
							['name', 'Name', 'text'],
							['category_id', 'Category', 'select', CategoryModel::getList()],
							['price', 'Price', 'text'],
							['color', 'Color', 'text'],
							['weight', 'Weight', 'text'],
							['quantity', 'Quantity', 'text'],
							['description', 'Description', 'text'],
							['status', 'Status', 'switch'],
							['right_button', 'Option', 'btn']
			];


			$ZBuilder = ZBuilder::make('table');

			$ZBuilder_ = $ZBuilder->setSearch(['title' => 'titile'])// 设置搜索框
			->addColumns($addColumns)
				->addTopButtons('add,delete')// 批量添加顶部按钮
				->addRightButtons(['edit', 'delete' => ['data-tips' => 'Unable to recover after deletion.。']])// 批量添加右侧按钮
				->addOrder('id,name')
				->setRowList($datas)// 设置表格数据
				->fetch(); // 渲染模板

			return $ZBuilder_;
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
				if ($advert = ProductModel::create($data))
				{
					$this->success('Create success', 'index');
				} else
				{
					$this->error('Create failure');
				}
			}
			// 显示添加页面
			$map['id'] = ['>', 0];
			$map['status'] = 1;
			if ($this->user['type'] != 1)
			{
				$map['user_id'] = $this->user['uid'];
			}
			return ZBuilder::make('form')
				->addFormItems([
					['text', 'name', 'name'],
					['images', 'avatar', 'Image'],
					['select', 'category_id', 'Category', '', CategoryModel::getParentTrue($map)],
					['text', 'price', 'Price'],
					['text', 'color', 'color'],
					['text', 'weight', 'weight'],
					['text', 'quantity', 'quantity'],
					['text', 'description', 'description'],
					['radio', 'status', 'effective immediately', '', ['OFF', 'ON'], 1],
				])
				->addHidden('user_id', $this->user['uid'])
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

				if (ProductModel::update($data, ['id' => $id]))
				{
					// 记录行为
					$this->success('Edit success', 'index');
				} else
				{
					$this->error('Edit failure');
				}
			}

			$info = ProductModel::get($id);


			$map['status'] = 1;

			$map['user_id'] = $this->user['uid'];

			// 显示Edit页面
			return ZBuilder::make('form')
				->setPageTips($this->user['All'])
				->addFormItems([
					['images', 'avatar', 'Image'],
					['text', 'name', 'name'],
					['select', 'category_id', 'Category', '', CategoryModel::getParentTrue($map)],
					['text', 'price', 'Price'],
					['text', 'color', 'color'],
					['text', 'weight', 'weight'],
					['text', 'quantity', 'quantity'],
					['text', 'description', 'description'],
					['radio', 'status', 'effective immediately', '', ['OFF', 'ON'], 1]
				])
				->addHidden('user_id', $this->user['uid'])
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
			$advert_name = ProductModel::where('id', 'in', $ids)->column('name');
			return parent::setStatus($type, ['advert_' . $type, 'odc_advert', 0, UID, implode('、', $advert_name)]);
		}

	}