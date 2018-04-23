<?php










	namespace app\odc\model;

	use think\Model as ThinkModel;

	/**
	 * Class RegionModel
	 * @package app\odc\model
	 */
	class RegionUserModel extends ThinkModel
	{
		// 设置当前模型对应的完整数据表名称
		protected $table = '__ODC_USER__';

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
			return self::where([])->column('id,region_name');
		}
	}