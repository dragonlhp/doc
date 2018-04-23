<?php
	/**
	 * Created by PhpStorm.
	 * User: mybook-lhp
	 * Date: 18/4/21
	 * Time: 下午9:02
	 */

	namespace app\odc\admin;


	use app\admin\controller\Admin;
	use app\odc\model\RegionUserModel;

	class BaseController extends Admin
	{
		protected $user = [];

		public function _initialize()
		{
			parent::_initialize(); // TODO: Change the autogenerated stub
			$this->user = session('user_auth');

			$this->user['type'] = RegionUserModel::where(['user_id' => $this->user['uid']])->column('type')[0];

		}

		static public function userlist($type = false)
		{
			$where = [];
			if ($type == 'mg')
			{
				$where['type'] = 1;
			} else if ($type == 'user')
			{
				$where['type'] = 0;
			}

			return RegionUserModel::where($where)
				->field('admin_user.id,admin_user.username')
				->join('admin_user', 'admin_user.id = dp_odc_user.user_id')
				->column('admin_user.id,admin_user.username');
		}


	}