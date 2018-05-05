<?php

	namespace app\odc\admin;

	use app\admin\controller\Admin;
	use app\common\builder\ZBuilder;
	use app\odc\model\CategoryModel;
	use app\odc\model\InventoryModel;
	use app\odc\model\OrderModel;
	use app\odc\model\ProductModel;
	use app\odc\model\RegionModel;
	use app\odc\model\RegionUserModel;
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
			if (isset($map['pname|cname']))
			{
				$map['p.name'] = $map['pname|cname'];
				$map['c.name'] = $map['pname|cname'];
				unset($map['pname|cname']);

			}
			if (isset($map['cname']))
			{
				$map['c.name'] = $map['cname'];
				unset($map['cname']);

			}
			if (isset($map['pname']))
			{
				$map['p.name'] = $map['pname'];
				unset($map['pname']);

			}


			// 排序
			$order = $this->getOrder('i.id asc');

			// 数据列表
//			$datas = InventoryModel::where($map)->order($order)->paginate();
			$datas = Db::name('odc_inventory')->alias('i')
				->field('i.*,c.name as cname')
				->join('odc_product p', 'p.id = i.product_id')
				->join('odc_category c', 'c.id = p.category_id')
				->where($map)->order($order)->paginate();
//			dump($datas);die;
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
				['cname', 'Category Name', 'text'],
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

			$ORCUser = RegionUserModel::where(['user_id' => $this->user['uid']])->find();

			$ZBuilder = ZBuilder::make('table')->setExtraHtml("<h3> your Balance :$ {$ORCUser->balance}</h3>", 'toolbar_top');
			$ZBuilder->addTopSelect('user_id', 'Select User', static::userlist('user'));

			//'title' => '酒店列表',
			//'icon' => 'fa fa-shopping-cart',
			//'href' => url('bazaar/bay', ['id' => '__id__'])

			return $ZBuilder = $ZBuilder->setSearch(['pname' => 'Product Name', 'cname' => 'Category Name'])// 设置搜索框
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

				$data['order_id'] = time() . $this->generate_code(5);
				$data['product_id'] = $id;
				$Product = ProductModel::get($id);
				$Inventory = InventoryModel::get($id);
				$BuyerInfo = OrderModel::getBuyerInfo($this->user['uid']);

				if (!$Product)
				{
					$this->error('产品不存在');
				}
				$data['buyer_id'] = $this->user['uid'];
				$data['supplier_id'] = $Product->user_id;


				$data['price'] = $Product->price * $data['num'];

				if ($Inventory->max_quantity < $data['num'])
				{
					$this->error('数量不足！请重新输入！', '', [$Inventory, $data]);
				}

				if ($BuyerInfo['balance'] == '')
				{
					$this->error('金额为空，不能购买！', '', $BuyerInfo);
				}

				if ($BuyerInfo['balance'] < $data['price'])
				{
					$this->error('钱包金额不足！', '', [$BuyerInfo, $data]);
				}
//				dump($data);die;
				if ($advert = OrderModel::buy($id, $data))
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

		function generate_code($length = 11)
		{
			return rand(pow(10, ($length - 1)), pow(10, $length) - 1);
		}


	}