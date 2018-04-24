<?php










	namespace app\odc\admin;

	use app\admin\controller\Admin;
	use app\common\builder\ZBuilder;
	use app\odc\model\CategoryModel;
	use app\odc\model\ProductModel;


	/**
	 * Class Product
	 * @package app\odc\admin
	 */
	class Product extends BaseController
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
			if ($this->user['type'] != 1)
			{
				$map['user_id'] = session('user_auth')['uid'];
			}
			$data_list = ProductModel::where($map)->order($order)->paginate();

			// 使用ZBuilder快速创建数据表格

			$addColumns = [ // 批量添加数据列
							['id', 'ID'],
							['name', 'Name', 'text'],
							['category_id', 'Category', 'select', CategoryModel::getList()],
							['color', 'Color', 'text'],
							['weight', 'Weight', 'text'],
							['avatar', 'Avatar', 'text'],
							['quantity', 'Quantity', 'text'],
							['description', 'Description', 'text'],
							['status', 'Status', 'switch'],

							['right_button', 'Option', 'btn']
			];


			$ZBuilder = ZBuilder::make('table');
			if ($this->user['type'] != 0)
			{
				//$addColumns[0] = ['user_id', 'User', 'select', static::userlist()];
				$ZBuilder->addTopSelect('user_id', 'Select User', static::userlist('user'));
			}
			$ZBuilder_ = $ZBuilder->setSearch(['title' => 'titile'])// 设置搜索框
				->addColumns($addColumns)
				->addTopButtons('add,delete')// 批量添加顶部按钮
				->addRightButtons(['edit', 'delete' => ['data-tips' => 'Unable to recover after deletion.。']])// 批量添加右侧按钮
				->addOrder('id,name')
				->setRowList($data_list)// 设置表格数据
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
				$data = $this->request->post();dump($data);
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
				//->setPageTips('如果出现无法添加的情况，可能由于浏览器将本页面当成了广告，请尝试关闭浏览器的广告过滤功能再试。', 'warning')
				->addFormItems([
					['text', 'name', 'name'],
					['select', 'category_id', 'Category', '', CategoryModel::getParentTrue($map)],
					['text', 'color', 'color'],
					['text', 'weight', 'weight'],
					['text', 'avatar', 'avatar'],
					['text', 'quantity', 'quantity'],
					['text', 'description', 'description'],
					['radio', 'status', '立即启用', '', ['OFF', 'ON'], 1],
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

			// 显示Edit页面
			return ZBuilder::make('form')
				->setPageTips('如果出现无法添加的情况，可能由于浏览器将本页面当成了广告，请尝试关闭浏览器的广告过滤功能再试。', 'warning')
				->addFormItems([
					['text', 'name', 'name'],
					['select', 'category_id', 'Category', '', CategoryModel::getParentTrue()],
					['text', 'color', 'color'],
					['text', 'weight', 'weight'],
					['text', 'avatar', 'avatar'],
					['text', 'quantity', 'quantity'],
					['text', 'description', 'description'],
					['radio', 'status', '立即启用', '', ['OFF', 'ON'], 1]
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