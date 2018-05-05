<?php

	namespace app\odc\admin;

	use app\admin\controller\Admin;
	use app\common\builder\ZBuilder;
	use app\odc\model\CategoryModel;
	use app\odc\model\InventoryModel;
	use app\odc\model\ProductModel;
	use app\odc\model\RegionModel;

	/**
	 * Class Product
	 * @package app\odc\admin
	 */
	class Bazaar extends BaseController
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


			$data_list->where($map);


			$datas = $data_list->order($order)->paginate();
			// 使用ZBuilder快速创建数据表格
			// 批量添加数据列
			$addColumns = [
				['id', 'ID'],
				['avatar', 'Avatar', 'picture'],
				[
					'product_id', 'Product', 'callback', function($value)
				{
					$data = ProductModel::getList();
					return isset($data[$value]) ? $data[$value] : '';
				}
				],
				[
					'region_id', 'Region', 'callback', function($value)
				{
					$data = RegionModel::getList();
					return isset($data[$value]) ? $data[$value] : '';
				}
				],
				[
					'user_id', 'User Name', 'test', function($value)
				{
					$data = self::userlist('user');
					return isset($data[$value]) ? $data[$value] : '';
				}
				],
				['max_quantity', 'max quantity', 'text'],
				['status', 'Status', 'yesno'],
				['right_button', 'Options', 'btn']
			];
			$ZBuilder = ZBuilder::make('table');

			$ZBuilder->addTopSelect('user_id', 'Select User', static::userlist('user'));

			return $ZBuilder = $ZBuilder->setSearch(['title' => '标题'])// 设置搜索框
			->setPageTips($this->user['All'])
				->addColumns($addColumns)
				->addTopButtons(['add' => ['title' => 'Send',], 'delete'])// 批量添加顶部按钮
				->addRightButtons(['edit', 'delete' => ['data-tips' => 'Unable to recover after deletion.。']])// 批量添加右侧按钮
				->addOrder('id,name')
				->setRowList($datas)// 设置表格数据
				->fetch(); // 渲染模板
		}

		public function bay()
		{

		}


	}