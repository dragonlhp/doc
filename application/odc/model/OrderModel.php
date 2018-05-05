<?php

	namespace app\odc\model;

	use think\Db;
	use think\Model as ThinkModel;

	/**
	 * Class ProductModel
	 * @package app\odc\model
	 */
	class OrderModel extends ThinkModel
	{
		// 设置当前模型对应的完整数据表名称
		protected $table = '__ODC_ORDER__';

		// 自动写入时间戳
		protected $autoWriteTimestamp = true;

		// 定义修改器
		public function setStartTimeAttr($value)
		{
			return $value != '' ? strtotime($value) : 0;
		}

		public function setEndTimeAttr($value)
		{
			return $value != '' ? strtotime($value) : 0;
		}

		public function getStartTimeAttr($value)
		{
			return $value != 0 ? date('Y-m-d', $value) : '';
		}

		public function getEndTimeAttr($value)
		{
			return $value != 0 ? date('Y-m-d', $value) : '';
		}

		static public function getList($map)
		{
			return self::where($map)->column('user_id as id,address');
		}


		/**
		 * 获取买家信息
		 */
		static public function getBuyerInfo($id)
		{
			return db('odc_user')->where(['user_id' => $id])->find();
		}

		static public function buy($order)
		{

			$flge = false;
			// 启动事务
			Db::startTrans();
			try
			{
				///保存订单
				self::create($order);
				//扣除买家金额
				$ODCUser = RegionUserModel::where(['user_id' => $order['buyer_id']])->find();
				$ODCUser->balance = $ODCUser->balance - $order['price'];
				$ODCUser->save();

				//添加卖家金额
				$ODCUser = RegionUserModel::where(['user_id' => $order['supplier_id']])->find();
				$ODCUser->balance = $ODCUser->balance + $order['price'];
				$ODCUser->save();

				//扣除卖家数量
				$ODCUser = InventoryModel::where(['product_id' => $order['product_id']])->find();
				$ODCUser->max_quantity = $ODCUser->max_quantity - $order['num'];
				$ODCUser->save();
				// 提交事务
				Db::commit();
				$flge = true;
			} catch (\Exception $e)
			{
				dump($e);
				// 回滚事务
				Db::rollback();
				$flge = false;
			}
			return $flge;

		}

	}