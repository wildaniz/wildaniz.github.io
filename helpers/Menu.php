<?php
/**
 * Menu Items
 * All Project Menu
 * @category  Menu List
 */

class Menu{
	
	
			public static $navbarsideleft = array(
		array(
			'path' => 'home', 
			'label' => 'Home', 
			'icon' => '<i class="fa fa-dashcube "></i>'
		),
		
		array(
			'path' => 'keuangan', 
			'label' => 'Keuangan', 
			'icon' => '<i class="fa fa-dollar "></i>'
		),
		
		array(
			'path' => 'dana_masuk', 
			'label' => 'Dana Masuk', 
			'icon' => '<i class="fa fa-credit-card "></i>'
		),
		
		array(
			'path' => 'dana_keluar', 
			'label' => 'Dana Keluar', 
			'icon' => '<i class="fa fa-credit-card-alt "></i>'
		),
		
		array(
			'path' => 'kelas', 
			'label' => 'Kelas', 
			'icon' => ''
		)
	);
		
			public static $navbartopleft = array(
		array(
			'path' => 'user', 
			'label' => 'User', 
			'icon' => '<i class="fa fa-user "></i>'
		)
	);
		
	
	
			public static $roles = array(
		array(
			"value" => "admin", 
			"label" => "admin", 
		),
		array(
			"value" => "user", 
			"label" => "user", 
		),
		array(
			"value" => "kepsek", 
			"label" => "kepsek", 
		),);
		
			public static $keterangan = array(
		array(
			"value" => "Transfer", 
			"label" => "Transfer", 
		),
		array(
			"value" => "Cash", 
			"label" => "Cash", 
		),
		array(
			"value" => "-", 
			"label" => "-", 
		),);
		
}