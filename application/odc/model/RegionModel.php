<?php










	namespace app\odc\model;

	use think\Db;
	use think\Model as ThinkModel;

	/**
	 * Class RegionModel
	 * @package app\odc\model
	 */
	class RegionModel extends ThinkModel
	{
		// 设置当前模型对应的完整数据表名称
		protected $table = '__ODC_REGION__';

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


		static public function getMgRegUserIDS($manager_id){

		$data=	 Db::query("select  user_id   from   dp_odc_user  u, dp_odc_region  r where u.region_id=r.id and u.type=0 and   r.mg_user_id={$manager_id}");
			$datas=[];
			foreach ($data as $key => $item)
			{
				$datas[]=$item['user_id'];
			}
			return $datas;
		}
		static public function getMgRegUserName($manager_id){

		return	 Db::query("select  user_id,username , u.region_id ,  r.mg_user_id from   dp_odc_user  u, dp_odc_region r , dp_admin_user du where u.region_id=r.id and u.type=0  and  du.id=u.user_id and  r.mg_user_id={$manager_id}");
			$datas=[];
			foreach ($data as $key => $item)
			{
				$datas[]=$item['user_id'];
			}
			return $datas;
		}
	}