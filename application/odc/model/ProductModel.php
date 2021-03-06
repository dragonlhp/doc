<?php










	namespace app\odc\model;

	use think\Model as ThinkModel;

	/**
	 * Class ProductModel
	 * @package app\odc\model
	 */
	class ProductModel extends ThinkModel
	{
		// 设置当前模型对应的完整数据表名称
		protected $table = '__ODC_PRODUCT__';

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

		static public function getList()
		{
			return self::where([])->column('id,name');
		}
		static public function getMyList($user_id)
		{
			return self::where(['user_id'=>$user_id])->column('id,name');
		}
	}