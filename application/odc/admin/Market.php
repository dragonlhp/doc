<?php

	namespace app\odc\admin;

	use app\admin\controller\Admin;
	use app\common\builder\ZBuilder;
	use app\odc\model\CategoryModel;
	use app\odc\model\InventoryModel;
	use app\odc\model\OrderModel;
	use app\odc\model\ProductModel;
	use app\odc\model\RegionModel;
	use think\Db;

	/**
	 * Class Product
	 * @package app\odc\admin
	 */
	class Market extends BaseController
	{
		/**
		 * @return mixed
		 * @throws \think\Exception
		 */
		public function index()
		{
			// 查询
			$map = $this->getMap();
			if (!$this->CheckManager())
			{
				$map['region_id'] = $this->user['region_id'];
			}

			// 排序
			$order = $this->getOrder('id asc');

			// 数据列表
			$datas = $data_list = InventoryModel::where($map)->order($order)->paginate();
//			dump([$datas,Db::name('')->getLastSql(),$this->user['region_id']]);die;
			// 使用ZBuilder快速创建数据表格
			// 批量添加数据列
			$addColumns = [
				['id', 'ID'],
				['avatar', 'Image', 'picture'],
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
					'user_id', 'User Name', 'callback', function($value)
				{
					$data = self::userlist('user');

					return isset($data[$value]) ? $data[$value] : '';
				}
				],
				['max_quantity', 'Quantity', 'text'],
				['status', 'Status', 'yesno'],
				['right_button', 'Options', 'btn']
			];
			$ZBuilder = ZBuilder::make('table');

			$ZBuilder->addTopSelect('user_id', 'Select User', static::userlist('user'));

			//'title' => '酒店列表',
			//'icon' => 'fa fa-shopping-cart',
			//'href' => url('bazaar/bay', ['id' => '__id__'])

			return $ZBuilder = $ZBuilder->setSearch(['title' => '标题'])// 设置搜索框
			->setPageTips($this->user['All'])
				->addColumns($addColumns)
				->addRightButton('buy', [
					'title' => 'Buy',
					'icon'  => 'fa fa fa-shopping-cart',
					'href'  => url('edit', ['id' => '__id__'])
				])
				->setRowList($datas)// 设置表格数据
				->fetch(); // 渲染模板
		}

		public function edit($id = null)
		{
			// 保存数据
			if ($this->request->isPost())
			{
				$data = $this->request->post();

				$data['order_id'] = time() . uniqid(mt_rand());
				$data['product_id'] = $id;
				$Product = ProductModel::get($id);
				$Inventory = InventoryModel::get($id);
				$BuyerInfo = OrderModel::getBuyerInfo($Product->user_id);

				if (!$Product)
				{
					$this->error('产品不存在');
				}
				$data['buyer_id'] = $this->user['uid'];
				$data['supplier_id'] = $Product->user_id;


				$data['price'] = $Product->price * $data['num'];

				if ($Inventory->max_quantity < $data['num'])
				{
					$this->error('数量不足！请重新输入！');
				}
				if ($BuyerInfo['balance'] == '')
				{
					$this->error('金额为空，不能购买！');
				}
				if ($BuyerInfo['balance'] < $data['price'])
				{
					$this->error('钱包金额不足！');
				}

				if ($advert = OrderModel::buy($data))
				{
					$this->success('Buy success', 'index');
				} else
				{
					$this->error('Buy failure');
				}
			}


			// 显示添加页面
			return ZBuilder::make('form')
				->addFormItems([
					['text', 'num', 'Buy Number'],
				])
				->addHidden('user_id', $this->user['uid'])
				->setTrigger('timeset', '1', 'start_time')
				->fetch();

		}


	}