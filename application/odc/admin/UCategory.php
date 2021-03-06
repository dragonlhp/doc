<?php

	namespace app\odc\admin;

	use app\common\builder\ZBuilder;
	use app\odc\model\CategoryModel;
	use app\odc\model\RegionModel;
	use app\user\model\Role as RoleModel;
	use think\Cache;
	use util\Tree;

	/**
	 * Class Category
	 * @package app\admin\controller
	 */
	class UCategory extends BaseController
	{
		/**
		 * @param string $group
		 * @return mixed
		 * @throws \Exception
		 */
		public function index()
		{
			// 查询
			$map = $this->getMap();

			// 数据列表
			$map['id'] = ['>', 0];
			$map['status'] = 1;
			$data_lists = CategoryModel::where([]);

			$map['user_id'] = $this->user['uid'];
			$data_lists->where($map);


			$data_list = $data_lists->select();

			$data = [];
			foreach ($data_list as &$item)
			{
				$data[] = $item->toArray();
			}
			$data_list = Tree::config(['title' => 'name'])->toList($data);

			// 使用ZBuilder快速创建数据表格
			$addColumns = [ // 批量添加数据列
							['id', 'ID'],
							['title_display', 'Name', 'text'],
							//['sort', 'sort', 'text'],
							['status', 'status', 'switch'],
							['description', 'description', 'text'],
							['right_button', 'Options', 'btn']
			];


			$ZBuilder = ZBuilder::make('table');
			//$ZBuilder->setPageTips($this->user['All']);

			$ZBuilder_str = $ZBuilder->setSearch(['title_display' => 'Category Name'])// 设置搜索框
			->addColumns($addColumns)
				->addTopButtons('add,delete')// 批量添加顶部按钮
				->addRightButtons(['edit', 'delete' => ['data-tips' => 'Unable to recover after deletion.。']])// 批量添加右侧按钮
				->addOrder('id,name')
				->setRowList($data_list)// 设置表格数据
				->fetch(); // 渲染模板
			return $ZBuilder_str;
		}


		/**
		 * @param string $module
		 * @param string $pid
		 * @return mixed
		 * @throws \think\Exception
		 */
		public function add($pid = '')
		{
			// 保存数据
			if ($this->request->isPost())
			{
				$data = $this->request->post();

				if ($advert = CategoryModel::create($data))
				{
					$this->success('Create success', 'index');
				} else
				{
					$this->error('Create failure');
				}
			}
			// 显示添加页面
			//->setPageTips('如果出现无法添加的情况，可能由于浏览器将本页面当成了广告，请尝试关闭浏览器的广告过滤功能再试。', 'warning')

			$map['status'] = 1;

			$map['user_id'] = $this->user['uid'];

			return ZBuilder::make('form')
				->addFormItems([
					['select', 'pid', 'Parent category', 'parent category', CategoryModel::getParentTrue($map)],
					['text', 'name', 'Category name'],
					//['text', 'sort', 'Sort'],
					['radio', 'status', 'effective immediately', '', ['OFF', 'ON'], 1],
					['text', 'description', 'Ddescription'],
				])
				->addHidden('user_id', $this->user['uid'])
				->setTrigger('timeset', '1', 'start_time')
				->fetch();

		}


		/**
		 * @param int $id
		 * @return mixed
		 * @throws \think\Exception
		 * @throws \think\db\exception\DataNotFoundException
		 * @throws \think\db\exception\ModelNotFoundException
		 * @throws \think\exception\DbException
		 */
		public function edit($id = 0)
		{
			if ($id === null)
				$this->error('Lack of parameter');

			// 保存数据
			if ($this->request->isPost())
			{
				// 表单数据
				$data = $this->request->post();

				if (CategoryModel::update($data, ['id' => $id]))
				{
					// 记录行为
					$this->success('Edit success', 'index');
				} else
				{
					$this->error('Edit failure');
				}
			}

			$info = CategoryModel::get($id);
			$map['status'] = 1;

			$map['user_id'] = $this->user['uid'];

			// 显示Edit页面
			return ZBuilder::make('form')
				//->setPageTips('如果出现无法添加的情况，可能由于浏览器将本页面当成了广告，请尝试关闭浏览器的广告过滤功能再试。', 'warning')
				->addFormItems([
					['select', 'pid', 'Parent category', '', CategoryModel::getParentTrue($map, $id)],
					['text', 'name', 'Category name'],
					//['text', 'sort', 'Sort'],
					['radio', 'status', 'effective immediately', '', ['OFF', 'ON'], 1],
					['text', 'description', 'Ddescription'],
				])
				->addHidden('user_id', $this->user['uid'])
				->setTrigger('timeset', '1', 'start_time')
				->setFormData($info)
				->fetch();
		}



		/**
		 * 启用节点
		 * @param array $record 行为日志
		 * @return void
		 */
		public function enable($record = [])
		{
			$id = input('param.ids');
			$menu = CategoryModel::where('id', $id)->find();
			$details = '节点ID(' . $id . '),节点标题(' . $menu['title'] . '),节点链接(' . $menu['url_value'] . ')';
			$this->setStatus('enable', ['menu_enable', 'admin_menu', $id, UID, $details]);
		}

		/**
		 * 禁用节点
		 * @param array $record 行为日志
		 * @return void
		 */
		public function disable($record = [])
		{
			$id = input('param.ids');
			$menu = CategoryModel::where('id', $id)->find();
			$details = '节点ID(' . $id . '),节点标题(' . $menu['title'] . '),节点链接(' . $menu['url_value'] . ')';
			$this->setStatus('disable', ['menu_disable', 'admin_menu', $id, UID, $details]);
		}

		/**
		 * 设置状态
		 * @param string $type 类型
		 * @param array $record 行为日志
		 * @author 小乌 <82950492@qq.com>
		 * @return void
		 */
		public function setStatus($type = '', $record = [])
		{
			$id = input('param.ids');

			$status = $type == 'enable' ? 1 : 0;

			if (false !== CategoryModel::where('id', $id)->setField('status', $status))
			{
				Cache::clear();
				// 记录行为日志
				if (!empty($record))
				{
					call_user_func_array('action_log', $record);
				}
				$this->success('操作 success');
			} else
			{
				$this->error('操作 failure');
			}
		}
	}
