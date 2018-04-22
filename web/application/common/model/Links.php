<?php
namespace app\common\model;

use think\db;

class Links extends Common
{
	public function index_lists($size = 20)
	{
		return db::table("sys_link")->where(["status" => 1])->order("sort asc")->limit($size)->select();
	}
}