<?php

	namespace app\odc\admin;

	use app\admin\controller\Admin;
	use app\common\builder\ZBuilder;

	use app\odc\model\AddressModel;
	use app\odc\model\RegionModel;
	use app\odc\model\RegionUserModel;
	use app\user\model\Role as RoleModel;

	/**
	 * Class Region
	 * @package app\odc\admin
	 */
	class MgUser extends BaseController
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
			$order = $this->getOrder('admin_user.id asc');
			// 数据列表
//			$map['admin_user.id'] = ['>', 1];
			$data_list = RegionUserModel::where($map);
			if ($this->CheckManager() && !$this->CheckAdmin() && !isset($map['user_id']))
			{
				$data_list->whereIn('admin_user.id', RegionModel::getMgRegUserIDS($this->user['uid']));
			}
			$datas = $data_list->field('*')
				->join('admin_user', 'admin_user.id = dp_odc_user.user_id')
				->order($order)->paginate();

			// 使用ZBuilder快速创建数据表格
			$maps = [];
			if (!$this->CheckManager())
			{
				$maps['user_id'] = $this->user['uid'];
			}

			//  dump([AddressModel::getList($maps)]);die;
			return ZBuilder::make('table')
				->setPageTips($this->user['All'])
				//->setSearch(['region_name' => 'Region Name', 'wh_name' => 'WH_NAME'])// 设置搜索框
				->addColumns([ // 批量添加数据列
							   ['id', 'ID'],
							   ['username', 'User Name'],
							   ['nickname', 'Nick Name'],
							   ['balance', 'balance'],
							   ['region_id', 'Region Name', 'text', '', RegionModel::where([])->column('id,region_name')],
							   ['address_id', 'Default Address', 'text', '', AddressModel::getList($maps)],
							   ['email', 'E-Mail'],
							   ['mobile', 'Phone'],
							   ['type', 'IS Manager', 'text', '', ["1" => 'Warehouse Manager', "0" => 'Customer']],
				])
				->addRightButtons(['edit', 'delete' => ['data-tips' => 'Unable to recover after deletion.']])// 批量添加右侧按钮
				->addOrder('id,name')
				->setRowList($datas)// 设置表格数据
				->fetch(); // 渲染模板
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
				$this->error('Lack of parameter');

			// 保存数据
			if ($this->request->isPost())
			{
				// 表单数据
				$data = $this->request->post();

				if (RegionUserModel::update($data, ['id' => $id]))
				{
					// 记录行为
					$this->success('Edit Success', 'index');
				} else
				{
					$this->error('Edit failure');
				}
			}

			$info = RegionModel::get($id);

			// 显示Edit页面
			return ZBuilder::make('form')
				//->setPageTips('如果出现无法添加的情况，可能由于浏览器将本页面当成了广告，请尝试关闭浏览器的广告过滤功能再试。', 'warning')
				->addFormItems([
					['text', 'region_id', 'RegionName'],
					['text', 'balance', 'balance'],
				])
				->setTrigger('timeset', '1', 'start_time')
				->setFormData($info)
				->fetch();
		}

		/**
		 * @param string $type
		 * @param array $record
		 * @return mixed
		 */
		public function setStatus($type = '', $record = [])
		{
			$ids = $this->request->isPost() ? input('post.ids/a') : input('param.ids');
			$advert_name = RegionUserModel::where('id', 'in', $ids)->column('name');
			return parent::setStatus($type, ['advert_' . $type, 'odc_advert', 0, UID, implode('、', $advert_name)]);
		}


	}