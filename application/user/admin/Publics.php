<?php


	namespace app\user\admin;

	use app\admin\model\Access;
	use app\common\controller\Common;
	use app\odc\model\RegionModel;
	use app\odc\model\RegionUserModel;
	use app\user\model\User as UserModel;
	use app\user\model\Role as RoleModel;
	use app\admin\model\Menu as MenuModel;
	use think\Hook;

	/**
	 * 用户公开控制器，不经过权限认证
	 * @package app\user\admin
	 */
	class Publics extends Common
	{
		/**
		 * 用户登录
		 * @return mixed
		 */
		public function signin()
		{
			if ($this->request->isPost())
			{
				// 获取post数据
				$data = $this->request->post();
				$rememberme = isset($data['remember-me']) ? true : false;

				// 登录钩子
				$hook_result = Hook::listen('signin', $data);
				if (!empty($hook_result) && true !== $hook_result[0])
				{
					$this->error($hook_result[0]);
				}

				// 验证数据
				$result = $this->validate($data, 'User.signin');
				if (true !== $result)
				{
					// 验证失败 输出错误信息
					$this->error($result);
				}

				// 验证码
				if (config('captcha_signin'))
				{
					$captcha = $this->request->post('captcha', '');
					$captcha == '' && $this->error('Input verification code again.');
					if (!captcha_check($captcha, '', config('captcha')))
					{
						//验证失败
						$this->error('Invalid verification code.');
					};
				}

				// 登录
				$UserModel = new UserModel;
				$uid = $UserModel->login($data['username'], $data['password'], $rememberme);
				if ($uid)
				{
					// 记录行为
					action_log('user_signin', 'admin_user', $uid, $uid);
					$this->jumpUrl();
				} else
				{
					$this->error($UserModel->getError());
				}
			} else
			{
				$hook_result = Hook::listen('signin_sso');
				if (!empty($hook_result) && true !== $hook_result[0])
				{
					if (isset($hook_result[0]['url']))
					{
						$this->redirect($hook_result[0]['url']);
					}
					if (isset($hook_result[0]['error']))
					{
						$this->error($hook_result[0]['error']);
					}
				}

				if (is_signin())
				{
					$this->jumpUrl();
				} else
				{
					return $this->fetch();
				}
			}
		}

		/**
		 * 跳转到第一个有权限访问的url
		 * @return mixed|string
		 */
		private function jumpUrl()
		{
			if (session('user_auth.role') == 1)
			{
				$this->success('登录成功', url('admin/index/index'));
			}

			$default_module = RoleModel::where('id', session('user_auth.role'))->value('default_module');
			$menu = MenuModel::get($default_module);
			if (!$menu)
			{
				$this->error('当前角色未指定默认跳转模块！');
			}

			if ($menu['url_type'] == 'link')
			{
				$this->success('登录成功', $menu['url_value']);
			}

			$menu_url = explode('/', $menu['url_value']);
			role_auth();
			$url = action('admin/ajax/getSidebarMenu', ['module_id' => $default_module, 'module' => $menu['module'], 'controller' => $menu_url[1]]);
			if ($url == '')
			{
				$this->error('权限不足');
			} else
			{
				$this->success('登录成功', $url);
			}
		}

		/**
		 * 退出登录
		 */
		public function signout()
		{
			$hook_result = Hook::listen('signout_sso');
			if (!empty($hook_result) && true !== $hook_result[0])
			{
				if (isset($hook_result[0]['url']))
				{
					$this->redirect($hook_result[0]['url']);
				}
				if (isset($hook_result[0]['error']))
				{
					$this->error($hook_result[0]['error']);
				}
			}

			session(null);
			cookie('uid', null);
			cookie('signin_token', null);

			$this->redirect('signin');
		}

		/**
		 * @return mixed
		 */
		public function register()
		{

			// 保存数据
			if ($this->request->isPost())
			{
				$data = $this->request->post();
				if ($data['password'] !== $data['repassword'])
				{
					$this->error('The two passwords do not match.');
				}
				if (empty($data['address']) || $data['address'] == '')
				{
					$this->error('地址不能为空.');
				}

				$user_data = [
					'username' => $data['username'],
					'nickname' => $data['username'],
					'password' => $data['password'],
					'email'    => $data['email'],
					'balance'  => 10000.00,
					'type'     => 0,
					'status'   => 1,
					'role'     => 2,
				];
				// 验证
				$result = $this->validate($user_data, 'User');
				// 验证失败 输出错误信息
				if (true !== $result)
					$this->error($result);

				if ($user = UserModel::create($user_data))
				{
					$address = Access::create(['user_id' => $user->id, 'address' => $data['address'], 'status' => 1]);

					RegionUserModel::create(['user_id' => $user->id, 'region_id' => $data['region_id'], 'address_id' => $address->id]);

					$this->success('Register Success', url('user/publics/signin'));
				} else
				{
					$this->error('Register Failure');
				}
			}
			$this->assign('region', RegionModel::getList());

			return $this->fetch();
		}
	}
