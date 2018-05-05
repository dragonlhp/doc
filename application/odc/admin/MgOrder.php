<?php
	/**
	 * Created by PhpStorm.
	 * User: mybook-lhp
	 * Date: 18/5/5
	 * Time: 下午4:06
	 */

	namespace app\odc\admin;


	use app\common\builder\ZBuilder;
	use app\odc\model\OrderModel;
	use app\odc\model\ProductModel;

	class MgOrder extends BaseController
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
			$order = $this->getOrder('id desc');



			$data_list_ = OrderModel::where($map);
			if ($this->CheckManager() && !$this->CheckAdmin()&& !isset($map['user_id']))
			{
				$data_list_->whereIn('buyer_id', RegionModel::getMgRegUserIDS($this->user['uid']));
			}

			$data_list = $data_list_->order($order)->paginate();

			// 使用ZBuilder快速创建数据表格

			$addColumns = [ // 批量添加数据列
							['id', 'ID'],
							['order_id', 'OrderId', 'text'],
							['product_id', 'Product', 'text', '', ProductModel::getList()],
							['buyer_id', 'Buyer', 'text', '', self::userlist('user')],
							['supplier_id', 'Supplier', 'text', '', self::userlist('user')],
							['price', 'Price', 'text'],
							['num', 'number', 'text'],
			];

			$ZBuilder = ZBuilder::make('table');
			//$ZBuilder->setPageTips($this->user['All']);

			$ZBuilder_ = $ZBuilder->setSearch(['order_id' => 'Order ID',])// 设置搜索框
			->addColumns($addColumns)
				->setRowList($data_list)// 设置表格数据
				->fetch(); // 渲染模板
			return $ZBuilder_;
		}
	}