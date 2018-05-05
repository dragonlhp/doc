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


			$data_list = ProductModel::where($map)->order($order)->paginate();


			// 使用ZBuilder快速创建数据表格

			$addColumns = [ // 批量添加数据列
							['id', 'ID'],
							['name', 'Name', 'text'],
							['category_id', 'Category', 'select', CategoryModel::getList()],
							['color', 'Color', 'text'],
							['weight', 'Weight', 'text'],
							['quantity', 'Quantity', 'text'],
							['description', 'Description', 'text'],
							['status', 'Status', 'switch'],
							['right_button', 'Option', 'btn']
			];

			// 字段管理按钮
			$btnField = [
				'title' => 'Buy',
				'icon'  => 'fa fa-fw fa-shopping-cart',
				'href'  => url('Bazaar/buy', ['id' => '__id__'])
			];
			$ZBuilder = ZBuilder::make('table');
			$ZBuilder->addTopSelect('user_id', 'Select User', static::userlist('user'));
			$ZBuilder_ = $ZBuilder->setSearch(['name' => 'name'])// 设置搜索框
			->addColumns($addColumns)
				->addTopButtons(['buy' => $btnField])// 批量添加顶部按钮
				->addRightButtons(['buy' => $btnField])// 批量添加右侧按钮
				->addOrder('id,name')
				->setRowList($data_list)// 设置表格数据
				->fetch(); // 渲染模板

			return $ZBuilder_;
		}

		public function bay(){

		}


	}