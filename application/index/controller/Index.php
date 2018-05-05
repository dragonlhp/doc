<?php

	namespace app\index\controller;

	use app\odc\model\AddressModel;
	use app\odc\model\RegionModel;
	use app\odc\model\RegionUserModel;
	use app\user\model\User;
	use think\Db;

	/**
	 * 前台首页控制器
	 * @package app\index\controller
	 */
	class Index extends Home
	{
		public function index()
		{
			$this->redirect('admin/index/index');
			// 默认跳转模块
			if (config('home_default_module') != 'index')
			{
				$this->redirect(config('home_default_module') . '/index/index');
			}
			return '<style type="text/css">*{ padding: 0; margin: 0; } .think_default_text{ padding: 4px 48px;} a{color:#2E5CD5;cursor: pointer;text-decoration: none} a:hover{text-decoration:underline; } body{ background: #fff; font-family: "Century Gothic","Microsoft yahei"; color: #333;font-size:18px} h1{ font-size: 100px; font-weight: normal; margin-bottom: 12px; } p{ line-height: 1.6em; font-size: 42px }</style><div style="padding: 24px 48px;"> <h1>:)</h1><p> ' . config("dolphin.product_name") . ' ' . config("dolphin.product_version") . '<br/><span style="font-size:30px">极速 · 极简 · 极致</span></p></div>';
		}

		public function user()
		{

			for ($j = 1; $j < 7; $j ++)
			{
				for ($i = 1; $i <= 10; $i ++)
				{
					$USer = User::create([
						'username' => "user{$j}{$i}",
						'nickname' => "user{$j}{$i}",
						'password' => "user{$j}{$i}",
						'email'    => "user{$j}{$i}@qq.com",
						'status'   => 1,
						'role'     => 2,
					]);

					$Address = AddressModel::create([
						'user_id' => $USer->id,
						'address' => "user{$i}.user{$j}.user{$i}.user{$j}.user{$j}",
						'status'
					]);
					RegionUserModel::create([
						'user_id'    => $USer->id,
						'balance'  => 10000,
						'region_id' => $j,
						'address_id' => $Address->id
					]);


				}
			}

		}

		public function mg()
		{

			for ($j = 1; $j < 7; $j ++)
			{

				$USer = User::create([
					'username' => "manager{$j}",
					'nickname' => "Manager{$j}",
					'password' => "manager{$j}",
					'email'    => "Manager{$j}@qq.com",
					'status'   => 1,
					'role'     => 3,
				]);

				$Region = RegionUserModel::create([
					'user_id'   => $USer->id,

					'type'      => 1
				]);

				RegionModel::update(['mg_user_id'=>$USer->id],['id' => $j]);


			}

		}
		public function run(){
			$this->user();
			$this->mg();
		}

		public function pwd()
		{
			$USer = User::update([

				'password' => 'useruser',

			], 'id >0');
		}
	}
