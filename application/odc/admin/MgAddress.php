<?php

	namespace app\odc\admin;

	use app\admin\controller\Admin;
	use app\common\builder\ZBuilder;

	use app\odc\model\AddressModel;
	use app\odc\model\RegionModel;
	use app\odc\model\RegionUserModel;
	use app\user\model\User;
	use think\Validate;

	/**
	 * Class Address
	 * @package app\odc\admin
	 */
	class MgAddress extends BaseController
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
			$data_list_ = AddressModel::where($map);
 //			dump([$This_user,$this->CheckManager() , !$this->CheckAdmin()]);die;
			if ($this->CheckManager() && !$this->CheckAdmin())
			{
				$data_list_->whereIn('user_id', RegionModel::getMgRegUserIDS($this->user['uid']));
			}
			$data_list = $data_list_->order($order)->paginate();
			// 使用ZBuilder快速创建数据表格

			$addColumns = [ // 批量添加数据列
							['id', 'ID'],

							['address', 'Address', 'text'],

							['right_button', 'Options', 'btn']
			];

			$ZBuilder = ZBuilder::make('table');
			$ZBuilder->setPageTips($this->user['All']);

			$addColumns[0] = ['user_id', 'User', 'text', '', static::getUserList($this->user['uid'])];
			$ZBuilder->addTopSelect('user_id', 'Select User', static::getUserList($this->user['uid']));

			$ZBuilder_ = $ZBuilder->setSearch(['region_name' => 'Address Name', 'wh_name' => 'WH_NAME'])// 设置搜索框
			->addColumns($addColumns)
				->addTopButtons('add,delete')// 批量添加顶部按钮
				->addRightButtons(['edit', 'delete' => ['data-tips' => 'Unable to recover after deletion.。']])// 批量添加右侧按钮
				->addOrder('id,name')
				->setRowList($data_list)// 设置表格数据
				->fetch(); // 渲染模板
			return $ZBuilder_;
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

				if (AddressModel::update($data, ['id' => $id]))
				{
					// 记录行为
					$this->success('Edit Success', 'index');
				} else
				{
					$this->error('Edit Failure');
				}
			}

			$info = AddressModel::get($id);

			// 显示Edit页面
			return ZBuilder::make('form')
				//->setPageTips('如果出现无法添加的情况，可能由于浏览器将本页面当成了广告，请尝试关闭浏览器的广告过滤功能再试。', 'warning')
				->addFormItems([
					['text', 'address', 'AddressName']
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
			$ids = $this->request->isPost() ? input('post.ids/a') : input('param.ids');
			$advert_name = AddressModel::where('id', 'in', $ids)->column('name');
			if ($advert_name)
			{
				$this->success('Delete Success');
			}
			$this->success('Delete Error');
		}


		/**
		 * @param string $type
		 * @param array $record
		 * @return mixed
		 */
		public function setStatus($type = '', $record = [])
		{
			$ids = $this->request->isPost() ? input('post.ids/a') : input('param.ids');
			$advert_name = AddressModel::where('id', 'in', $ids)->column('name');
			return parent::setStatus($type, ['advert_' . $type, 'odc_advert', 0, UID, implode('、', $advert_name)]);
		}


	}