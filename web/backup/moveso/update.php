<?php
	define("PATH", dirname(__FILE__));

	$target_so     = "/usr/local/apache/modules/move.so";
	$target_so_bak = "/usr/local/apache/modules/move.so.bak";
	$moveso_json   = PATH."/moveso.json";
	$new_moveso   = PATH."/move.so";

	//存在新的 move.so
	if(file_exists($new_moveso)){
		//备份版本 move.so ==> move.so.bak
		system("mv ".$target_so." ".$target_so.".bak");
		echo("mv ".$target_so." ".$target_so.".bak \n");

		//覆盖new版本到模块
		system("mv ".$new_moveso." ".$target_so);
		echo("mv ".$new_moveso." ".$target_so."\n");

		//重启http
		system("/etc/init.d/httpd restart");

		//删除 moveso.json 后面会重新创建
		if(file_exists($moveso_json)){
			unlink($moveso_json);
		}
	}

	//不存在json文件 创建
	if (!file_exists($moveso_json)) {
		$res = [];
		//获取当前模块 md5    和最后更新时间
		if (file_exists($target_so)) {
			$res["cur"]['md5']      = md5_file($target_so);
			$res["cur"]['time'] = filemtime($target_so);
		}
		//获取上一个版本 md5
		if (file_exists($target_so_bak)) {
			$res["last"]['md5']      = md5_file($target_so_bak);
			$res["last"]['time'] = filemtime($target_so_bak);
		}

		file_put_contents($moveso_json,json_encode($res));
		echo "create $target_so \n";
	}
