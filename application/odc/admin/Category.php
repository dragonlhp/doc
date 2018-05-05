<?php










	namespace app\odc\admin;

	use app\common\builder\ZBuilder;
	use app\odc\model\CategoryModel;
	use app\odc\model\RegionModel;
	use app\user\model\Role as RoleModel;
	use think\Cache;
	use app\admin\controller\Admin;
	use util\Tree;

	/**
	 * Class Category
	 * @package app\admin\controller
	 */
	class Category extends BaseController
	{
		/**
		 * @param string $group
		 * @return mixed
		 * @throws \Exception
		 */
		public function index()
		{
			// 查询
			$map = $this->getMap();

			// 数据列表
			$map['id'] = ['>', 0];
			$map['status'] = 1;
			$This_user = session('user_auth')['uid'];
			$data_lists = CategoryModel::where([]);
			if ($this->user['type'] != 1)
			{
				$map['user_id'] = $this->user['uid'];
				$data_lists->where($map);
			}else{

				if (isset($map['user_id'])){

					$data_lists->where($map);
				}else{
					$data_lists->whereIn('user_id',RegionModel::getMgRegUserIDS($This_user));
				}

			}

			$data_list=	$data_lists->select();

			$data = [];
			foreach ($data_list as &$item)
			{
				$data[] = $item->toArray();
			}
			$data_list = Tree::config(['title' => 'name'])->toList($data);

			// 使用ZBuilder快速创建数据表格
			$addColumns = [ // 批量添加数据列
							['id', 'ID'],
							['title_display', 'Name', 'text'],
							['sort', 'sort', 'text'],
							['user_id', 'User', 'text'],
							['status', 'status', 'switch'],
							['description', 'description', 'text'],
							['create_time', 'create_time', 'date'],
							['create_time', 'update_time', 'date'],
							['right_button', 'Options', 'btn']
			];


			$ZBuilder = ZBuilder::make('table');
			if ($this->user['type'] != 0)
			{
				//$addColumns[0] = ['user_id', 'User', 'select', static::userlist()];
				$ZBuilder->addTopSelect('user_id', 'Select User', static::userlist('user'));
			} else
			{

				$ZBuilder->addTopSelect('user_id', 'Select User', RegionModel::getMgRegUserName($This_user));

			}

			$ZBuilder_str = $ZBuilder->setSearch(['region_name' => 'Region Name', 'wh_name' => 'WH_NAME'])// 设置搜索框
			->addColumns($addColumns)
				->addTopButtons('add,delete')// 批量添加顶部按钮
				->addRightButtons(['edit', 'delete' => ['data-tips' => 'Unable to recover after deletion.。']])// 批量添加右侧按钮
				->addOrder('id,name')
				->setRowList($data_list)// 设置表格数据
				->fetch(); // 渲染模板
			return $ZBuilder_str;
		}


		/**
		 * @param string $module
		 * @param string $pid
		 * @return mixed
		 * @throws \think\Exception
		 */
		public function add($pid = '')
		{
			// 保存数据
			if ($this->request->isPost())
			{
				$data = $this->request->post();
				if ($advert = CategoryModel::create($data))
				{
					$this->success('Create success', 'index');
				} else
				{
					$this->error('Create failure');
				}
			}
			// 显示添加页面
            //->setPageTips('如果出现无法添加的情况，可能由于浏览器将本页面当成了广告，请尝试关闭浏览器的广告过滤功能再试。', 'warning')
            $map['id'] = ['>', 0];
            $map['status'] = 1;
            if ($this->user['type'] != 1)
            {
                $map['user_id'] = $this->user['uid'];
            }
			return ZBuilder::make('form')

				->addFormItems([
					['select', 'pid', 'Parent category', 'parent category', CategoryModel::getParentTrue($map)],
					['text', 'name', 'Category name'],
					['text', 'sort', 'Sort'],
					['radio', 'status', 'effective immediately', '', ['OFF', 'ON'], 1],
					['text', 'description', 'Ddescription'],
				])
				->addHidden('user_id', $this->user['uid'])
				->setTrigger('timeset', '1', 'start_time')
				->fetch();

		}


		/**
		 * @param int $id
		 * @return mixed
		 * @throws \think\Exception
		 * @throws \think\db\exception\DataNotFoundException
		 * @throws \think\db\exception\ModelNotFoundException
		 * @throws \think\exception\DbException
		 */
		public function edit($id = 0)
		{
			if ($id === null)
				$this->error('Lack of parameter');

			// 保存数据
			if ($this->request->isPost())
			{
				// 表单数据
				$data = $this->request->post();

				if (CategoryModel::update($data, ['id' => $id]))
				{
					// 记录行为
					$this->success('Edit success', 'index');
				} else
				{
					$this->error('Edit failure');
				}
			}

			$info = CategoryModel::get($id);
            $map['id'] = ['>', 0];
            $map['status'] = 1;
            if ($this->user['type'] != 1)
            {
                $map['user_id'] = $this->user['uid'];
            }
			// 显示Edit页面
			return ZBuilder::make('form')
				//->setPageTips('如果出现无法添加的情况，可能由于浏览器将本页面当成了广告，请尝试关闭浏览器的广告过滤功能再试。', 'warning')
				->addFormItems([
					['select', 'pid', 'Parent category', '', CategoryModel::getParentTrue($map,$id)],
					['text', 'name', 'Category name'],
					['text', 'sort', 'Sort'],
					['radio', 'status', 'effective immediately', '', ['OFF', 'ON'], 1],
					['text', 'description', 'Ddescription'],
				])
				->addHidden('user_id', $this->user['uid'])
				->setTrigger('timeset', '1', 'start_time')
				->setFormData($info)
				->fetch();
		}

		/**
		 * 设置角色权限
		 * @param string $role_id 角色id
		 * @param array $roles 角色id

		 */
		private function setRoleMenu($role_id = '', $roles = [])
		{
			$RoleModel = new RoleModel();

			// 该节点的所有子节点，包括本身节点
			$menu_child = CategoryModel::getChildsId($role_id);
			$menu_child[] = (int)$role_id;
			// 该节点的所有上下级节点
			$menu_all = CategoryModel::getLinkIds($role_id);
			$menu_all = array_map('strval', $menu_all);

			if (!empty($roles))
			{
				// 拥有该节点的所有角色id及节点权限
				$role_menu_auth = RoleModel::getRoleWithMenu($role_id, true);
				// 已有该节点权限的角色id
				$role_exists = array_keys($role_menu_auth);
				// 新节点权限的角色
				$role_new = $roles;
				// 原有权限角色差集
				$role_diff = array_diff($role_exists, $role_new);
				// 新权限角色差集
				$role_diff_new = array_diff($role_new, $role_exists);
				// 新节点角色权限
				$role_new_auth = RoleModel::getAuthWithRole($roles);

				// Delete原先角色的该节点权限
				if ($role_diff)
				{
					$role_del_auth = [];
					foreach ($role_diff as $role)
					{
						$auth = json_decode($role_menu_auth[$role], true);
						$auth_new = array_diff($auth, $menu_child);
						$role_del_auth[] = [
							'id'        => $role,
							'menu_auth' => array_values($auth_new)
						];
					}
					if ($role_del_auth)
					{
						$RoleModel->saveAll($role_del_auth);
					}
				}

				// Create权限角色
				if ($role_diff_new)
				{
					$role_update_auth = [];
					foreach ($role_new_auth as $role => $auth)
					{
						$auth = json_decode($auth, true);
						if (in_array($role, $role_diff_new))
						{
							$auth = array_unique(array_merge($auth, $menu_all));
						}
						$role_update_auth[] = [
							'id'        => $role,
							'menu_auth' => array_values($auth)
						];
					}
					if ($role_update_auth)
					{
						$RoleModel->saveAll($role_update_auth);
					}
				}
			} else
			{
				$role_menu_auth = RoleModel::getRoleWithMenu($role_id, true);
				$role_del_auth = [];
				foreach ($role_menu_auth as $role => $auth)
				{
					$auth = json_decode($auth, true);
					$auth_new = array_diff($auth, $menu_child);
					$role_del_auth[] = [
						'id'        => $role,
						'menu_auth' => array_values($auth_new)
					];
				}
				if ($role_del_auth)
				{
					$RoleModel->saveAll($role_del_auth);
				}
			}
		}

		/**
		 * Delete节点
		 * @param array $record 行为日志内容

		 * @return mixed
		 */
		public function delete($record = [])
		{
			$id = $this->request->param('id');
			$menu = CategoryModel::where('id', $id)->find();

			if ($menu['system_menu'] == '1')
				$this->error('系统节点，禁止Delete');

			// 获取该节点的所有后辈节点id
			$menu_childs = CategoryModel::getChildsId($id);

			// 要Delete的所有节点id
			$all_ids = array_merge([(int)$id], $menu_childs);

			// Delete节点
			if (CategoryModel::destroy($all_ids))
			{
				Cache::clear();
				// 记录行为
				$details = '节点ID(' . $id . '),节点标题(' . $menu['title'] . '),节点链接(' . $menu['url_value'] . ')';
				action_log('menu_delete', 'admin_menu', $id, UID, $details);
				$this->success('Delete success');
			} else
			{
				$this->error('Delete failure');
			}
		}

		/**
		 * 保存节点排序

		 * @return mixed
		 */
		public function save()
		{
			if ($this->request->isPost())
			{
				$data = $this->request->post();
				if (!empty($data))
				{
					$menus = $this->parseMenu($data['menus']);
					foreach ($menus as $menu)
					{
						if ($menu['pid'] == 0)
						{
							continue;
						}
						CategoryModel::update($menu);
					}
					Cache::clear();
					$this->success('保存 success');
				} else
				{
					$this->error('没有需要保存的节点');
				}
			}
			$this->error('非法请求');
		}

		/**
		 * 添加子节点
		 * @param array $data 节点数据
		 * @param string $pid 父节点id

		 */
		private function createChildNode($data = [], $pid = '')
		{
			$url_value = substr($data['url_value'], 0, strrpos($data['url_value'], '/')) . '/';
			$child_node = [];
			$data['pid'] = $pid;

			foreach ($data['child_node'] as $item)
			{
				switch ($item)
				{
					case 'add':
						$data['title'] = 'Create';
						break;
					case 'edit':
						$data['title'] = 'Edit';
						break;
					case 'delete':
						$data['title'] = 'Delete';
						break;
					case 'enable':
						$data['title'] = '启用';
						break;
					case 'disable':
						$data['title'] = '禁用';
						break;
					case 'quickedit':
						$data['title'] = '快速Edit';
						break;
				}
				$data['url_value'] = $url_value . $item;
				$data['create_time'] = $this->request->time();
				$data['update_time'] = $this->request->time();
				$child_node[] = $data;
			}

			if ($child_node)
			{
				$CategoryModel = new CategoryModel();
				$CategoryModel->insertAll($child_node);
			}
		}

		/**
		 * 递归解析节点
		 * @param array $menus 节点数据
		 * @param int $pid 上级节点id

		 * @return array 解析成可以写入数据库的格式
		 */
		private function parseMenu($menus = [], $pid = 0)
		{
			$sort = 1;
			$result = [];
			foreach ($menus as $menu)
			{
				$result[] = [
					'id'   => (int)$menu['id'],
					'pid'  => (int)$pid,
					'sort' => $sort,
				];
				if (isset($menu['children']))
				{
					$result = array_merge($result, $this->parseMenu($menu['children'], $menu['id']));
				}
				$sort ++;
			}
			return $result;
		}

		/**
		 * 获取嵌套式节点
		 * @param array $lists 原始节点数组
		 * @param int $pid 父级id
		 * @param int $max_level 最多返回多少层，0为不限制
		 * @param int $curr_level 当前层数

		 * @return string
		 */
		private function getNestMenu($lists = [], $max_level = 0, $pid = 0, $curr_level = 1)
		{
			$result = '';
			foreach ($lists as $key => $value)
			{
				if ($value['pid'] == $pid)
				{
					$disable = $value['status'] == 0 ? 'dd-disable' : '';

					// 组合节点
					$result .= '<li class="dd-item dd3-item ' . $disable . '" data-id="' . $value['id'] . '">';
					$result .= '<div class="dd-handle dd3-handle">拖拽</div><div class="dd3-content"><i class="' . $value['icon'] . '"></i> ' . $value['title'];
					if ($value['url_value'] != '')
					{
						$result .= '<span class="link"><i class="fa fa-link"></i> ' . $value['url_value'] . '</span>';
					}
					$result .= '<div class="action">';
					$result .= '<a href="' . url('add', ['module' => $value['module'], 'pid' => $value['id']]) . '" data-toggle="tooltip" data-original-title="Create子节点"><i class="list-icon fa fa-plus fa-fw"></i></a><a href="' . url('edit', ['id' => $value['id']]) . '" data-toggle="tooltip" data-original-title="Edit"><i class="list-icon fa fa-pencil fa-fw"></i></a>';
					if ($value['status'] == 0)
					{
						// 启用
						$result .= '<a href="javascript:void(0);" data-ids="' . $value['id'] . '" class="enable" data-toggle="tooltip" data-original-title="启用"><i class="list-icon fa fa-check-circle-o fa-fw"></i></a>';
					} else
					{
						// 禁用
						$result .= '<a href="javascript:void(0);" data-ids="' . $value['id'] . '" class="disable" data-toggle="tooltip" data-original-title="禁用"><i class="list-icon fa fa-ban fa-fw"></i></a>';
					}
					$result .= '<a href="' . url('delete', ['id' => $value['id'], 'table' => 'admin_menu']) . '" data-toggle="tooltip" data-original-title="Delete" class="ajax-get confirm"><i class="list-icon fa fa-times fa-fw"></i></a></div>';
					$result .= '</div>';

					if ($max_level == 0 || $curr_level != $max_level)
					{
						unset($lists[$key]);
						// 下级节点
						$children = $this->getNestMenu($lists, $max_level, $value['id'], $curr_level + 1);
						if ($children != '')
						{
							$result .= '<ol class="dd-list">' . $children . '</ol>';
						}
					}

					$result .= '</li>';
				}
			}
			return $result;
		}

		/**
		 * 启用节点
		 * @param array $record 行为日志

		 * @return void
		 */
		public function enable($record = [])
		{
			$id = input('param.ids');
			$menu = CategoryModel::where('id', $id)->find();
			$details = '节点ID(' . $id . '),节点标题(' . $menu['title'] . '),节点链接(' . $menu['url_value'] . ')';
			$this->setStatus('enable', ['menu_enable', 'admin_menu', $id, UID, $details]);
		}

		/**
		 * 禁用节点
		 * @param array $record 行为日志

		 * @return void
		 */
		public function disable($record = [])
		{
			$id = input('param.ids');
			$menu = CategoryModel::where('id', $id)->find();
			$details = '节点ID(' . $id . '),节点标题(' . $menu['title'] . '),节点链接(' . $menu['url_value'] . ')';
			$this->setStatus('disable', ['menu_disable', 'admin_menu', $id, UID, $details]);
		}

		/**
		 * 设置状态
		 * @param string $type 类型
		 * @param array $record 行为日志
		 * @author 小乌 <82950492@qq.com>
		 * @return void
		 */
		public function setStatus($type = '', $record = [])
		{
			$id = input('param.ids');

			$status = $type == 'enable' ? 1 : 0;

			if (false !== CategoryModel::where('id', $id)->setField('status', $status))
			{
				Cache::clear();
				// 记录行为日志
				if (!empty($record))
				{
					call_user_func_array('action_log', $record);
				}
				$this->success('操作 success');
			} else
			{
				$this->error('操作 failure');
			}
		}
	}
