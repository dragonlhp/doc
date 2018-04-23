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

	use app\odc\model\AddressModel;
	use app\odc\model\RegionModel;
	use app\odc\model\RegionUserModel;
	use app\user\model\Role as RoleModel;

	/**
	 * Class Region
	 * @package app\odc\admin
	 */
	class User extends BaseController
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
//			$map['dp_odc_user.type'] = 0;
			$map['admin_user.id'] = ['>', 1];
			$data_list = RegionUserModel::where($map)
				->field('*')
				->join('admin_user', 'admin_user.id = dp_odc_user.user_id')
				->order($order)->paginate();

			// 使用ZBuilder快速创建数据表格
			return ZBuilder::make('table')
				//->setSearch(['region_name' => 'Region Name', 'wh_name' => 'WH_NAME'])// 设置搜索框
				->addColumns([ // 批量添加数据列
							   ['id', 'ID'],
							   ['username', 'User Name'],
							   ['nickname', 'Nick Name'],
							   ['region_id', 'Region Name', 'select', RegionModel::where([])->column('id,region_name')],
							   ['address_id', 'Default Address', 'select', AddressModel::getList()],
							   ['email', 'E-Mail'],
							   ['mobile', 'Phone'],
							   ['type', 'IS Manager', 'switch'],
							   ['create_time', 'create_time', 'date'],
							   ['create_time', 'update_time', 'date'],

				])
				->addRightButtons(['edit', 'delete' => ['data-tips' => 'Unable to recover after deletion.']])// 批量添加右侧按钮
				->addOrder('id,name')
				->setRowList($data_list)// 设置表格数据
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

			// 显示编辑页面
			return ZBuilder::make('form')
				//->setPageTips('如果出现无法添加的情况，可能由于浏览器将本页面当成了广告，请尝试关闭浏览器的广告过滤功能再试。', 'warning')
				->addFormItems([
					['text', 'region_id', 'RegionName'],
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
			$advert_name = RegionUserModel::where('id', 'in', $ids)->column('name');
			return parent::setStatus($type, ['advert_' . $type, 'odc_advert', 0, UID, implode('、', $advert_name)]);
		}


	}