<?php










	/**
	 * 菜单信息
	 */
	return [
		[
			'title'       => 'ODC',
			'icon'        => 'fa fa-fw fa-newspaper-o',
			'url_type'    => 'module_admin',
			'url_value'   => 'odc/index/index',
			'url_target'  => '_self',
			'online_hide' => 0,
			'sort'        => 100,
			'child'       => [
				[
					'title'       => 'ODC',
					'icon'        => 'fa fa-fw fa-folder-open-o',
					'url_type'    => 'module_admin',
					'url_value'   => '',
					'url_target'  => '_self',
					'online_hide' => 0,
					'sort'        => 100,
					'child'       => [
						[
							'title'       => 'Address',
							'icon'        => 'fa fa-fw fa-list',
							'url_type'    => 'module_admin',
							'url_value'   => 'odc/address/index',
							'url_target'  => '_self',
							'online_hide' => 0,
							'sort'        => 100,
							'child'       => [
								[
									'title'       => 'Create',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/address/add',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
								[
									'title'       => 'Edit',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/address/edit',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
								[
									'title'       => 'Delete',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/address/delete',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],

							],
						],
						[
							'title'       => 'User',
							'icon'        => 'fa fa-fw fa-list',
							'url_type'    => 'module_admin',
							'url_value'   => 'odc/user/index',
							'url_target'  => '_self',
							'online_hide' => 0,
							'sort'        => 100,
							'child'       => [
								[
									'title'       => 'Create',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/user/add',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
								[
									'title'       => 'Edit',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/user/edit',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
								[
									'title'       => 'Delete',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/user/delete',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],

							],
						],
						[
							'title'       => 'Region',
							'icon'        => 'fa fa-fw fa-list',
							'url_type'    => 'module_admin',
							'url_value'   => 'odc/region/index',
							'url_target'  => '_self',
							'online_hide' => 0,
							'sort'        => 100,
							'child'       => [
								[
									'title'       => 'Create',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/region/add',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
								[
									'title'       => 'Edit',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/region/edit',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
								[
									'title'       => 'Delete',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/region/delete',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],

							],
						],
						[
							'title'       => 'Category',
							'icon'        => 'fa fa-fw fa-recycle',
							'url_type'    => 'module_admin',
							'url_value'   => 'odc/category/index',
							'url_target'  => '_self',
							'online_hide' => 0,
							'sort'        => 100,
							'child'       => [
								[
									'title'       => 'Create',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/category/add',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
								[
									'title'       => 'Edit',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/category/edit',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
								[
									'title'       => 'Delete',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/category/delete',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
							],
						],
						[
							'title'       => 'Product',
							'icon'        => 'fa fa-fw fa-file-word-o',
							'url_type'    => 'module_admin',
							'url_value'   => 'odc/product/index',
							'url_target'  => '_self',
							'online_hide' => 0,
							'sort'        => 100,
							'child'       => [
								[
									'title'       => 'Create',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/product/add',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
								[
									'title'       => 'Edit',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/product/edit',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
								[
									'title'       => 'Delete',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/product/delete',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
							],
						],

						[
							'title'       => 'Inventory',
							'icon'        => 'fa fa-fw fa-recycle',
							'url_type'    => 'module_admin',
							'url_value'   => 'odc/inventory/index',
							'url_target'  => '_self',
							'online_hide' => 0,
							'sort'        => 100,
							'child'       => [
								[
									'title'       => 'Create',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/inventory/add',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
								[
									'title'       => 'Edit',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/inventory/edit',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
								[
									'title'       => 'Delete',
									'icon'        => '',
									'url_type'    => 'module_admin',
									'url_value'   => 'odc/inventory/delete',
									'url_target'  => '_self',
									'online_hide' => 0,
									'sort'        => 100,
								],
							],
						],
					],
				],
			],
		],
	];
