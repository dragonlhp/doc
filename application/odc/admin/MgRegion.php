<?php

	namespace app\odc\admin;

	use app\admin\controller\Admin;
	use app\common\builder\ZBuilder;

	use app\odc\model\RegionModel;
	use app\user\model\User;
	use think\Validate;

	/**
	 * Class Region
	 * @package app\odc\admin
	 */
	class MgRegion extends BaseController
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
			$data_list = RegionModel::where($map)->order($order)->paginate();


			// 使用ZBuilder快速创建数据表格
			return ZBuilder::make('table')
							->setPageTips($this->user['All'])
				->setSearch(['region_name' => 'Region Name', 'wh_name' => 'WH_NAME'])// 设置搜索框
				->addColumns([ // 批量添加数据列
							   ['id', 'ID'],
							   ['mg_user_id', 'Mnager', 'callback', function($value)
							   {
								   $data = self::userlist('mg');
 								   return isset($data[$value]) ? $data[$value] : '';
							   }],
							   ['region_name', 'Region Name', 'text'],
							   ['wh_name', 'Warehouse Name', 'text'],
							   ['wh_address', 'Warehouse Address', 'text'],
							   ['wh_desc', 'Warehouse Desc', 'text'],
							   ['right_button', 'Options', 'btn']
				])
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
				if ($advert = RegionModel::create($data))
				{
					$this->success('Create success', 'index');
				} else
				{
					$this->error('Create failure');
				}
			}
			// 显示添加页面
			return ZBuilder::make('form')
 				->addFormItems([
					['select', 'mg_user_id', 'MgUserId', 'Manager User', self::userlist()],
					['text', 'region_name', 'RegionName'],
					['text', 'wh_name', 'whName'],
					['text', 'wh_address', 'whAddress'],
					['text', 'wh_desc', 'whDesc'],
					['text', 'region_desc', 'RegionDesc'],
				])
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

				if (RegionModel::update($data, ['id' => $id]))
				{
					// 记录行为
					$this->success('Edit success', 'index');
				} else
				{
					$this->error('Edit failure');
				}
			}

			$list_type = RegionModel::where([])->select();
			array_unshift($list_type, '默认分类');

			$info = RegionModel::get($id);

			// 显示Edit页面
			return ZBuilder::make('form')
				//->setPageTips('如果出现无法添加的情况，可能由于浏览器将本页面当成了广告，请尝试关闭浏览器的广告过滤功能再试。', 'warning')
				->addFormItems([
					['select', 'mg_user_id', 'MgUserId', 'Manager User', self::userlist()],
					['text', 'region_name', 'RegionName'],
					['text', 'wh_name', 'whName'],
					['text', 'wh_address', 'whAddress'],
					['text', 'wh_desc', 'whDesc'],
					['text', 'region_desc', 'RegionDesc'],
				])
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
			$advert_name = RegionModel::where('id', 'in', $ids)->column('name');
			return parent::setStatus($type, ['advert_' . $type, 'odc_advert', 0, UID, implode('、', $advert_name)]);
		}


	}