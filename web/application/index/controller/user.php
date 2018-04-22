<?phpnamespace app\index\controller;use think\db;use Move\ext\page;class user extends home{	public $user_goods = [];	public function __construct()	{		parent::__construct();		$this->is_login();		$this->is_goole();	}	public function index()	{		$this->set_title('安全中心');		$whitelist = db::table('user_ip')->where(['userid' => session('userid')])->find();		if (empty($whitelist)) {			$whitelist['whitelist'] = '你还没有绑定IP';		}		$this->assign('whitelist', $whitelist);		$this->display();	}	public function yidi_up()	{		$yidi = iv('post.user_yidi');		$paypassword = iv('post.paypassword', 'password', $this->ajax_lang('交易密码格式错误'));		if (!$this->userid) {			ajax($this->ajax_lang('请先登录'));		}		$res = md('user')->yidi_up($this->userid, $yidi, $paypassword);		if (isset($res[1]) && $res[1]) {			ajax($this->ajax_lang($res[0]), 1);		} else {			ajax($this->ajax_lang($res[0]));		}	}	public function truename()	{		$this->set_title('实名认证');		if (isset($this->user['idcard']) && $this->user['idcard_rz']) {			$this->user['idcard'] = substr_replace($this->user['idcard'], '********', 4, 10);		}		$this->display();	}	public function imgUser()	{		$data_id = iv('post.data_id', 'd', $this->ajax_lang('类型错误'));		if (!session('userid')) {			ajax($this->ajax_lang('请先登录'));		}		if (!$_FILES['img']) {			ajax($this->ajax_lang('请选择图片'));		}		if ($_FILES['img']['size'] > 750000) {			ajax($this->ajax_lang('图片过大'));		}		$image = base64_encode(file_get_contents($_FILES['img']['tmp_name']));		$time = date('ymd', time());		$userId = hashs($this->userid);		if (!file_exists(APP_PATH . '/upload/user/')) {			mkdir(APP_PATH . '/upload/user/');		}		if (!file_exists('./upload/user/' . $time . '/')) {			mkdir('./upload/user/' . $time . '/');		}		$res = file_put_contents('./upload/user/' . $time . '/' . $userId . $data_id, $image);		$idcard_img = json_decode($this->user['idcard_img'], true);		$idcard_img[$data_id] = './upload/user/' . $time . '/' . $userId . $data_id;		$idcard_img = json_encode($idcard_img);		if ($res) {			$rs = db::table('user')->where(['id' => $this->userid])->save(['idcard_img' => $idcard_img]);			if (!$rs) {				ajax($this->ajax_lang('上传失败'));			}			ajax($this->ajax_lang('上传成功'), 1);		} else {			ajax($this->ajax_lang('上传失败'));		}	}	public function backup()	{		$user_img = db::table('user_img')->order('userid desc')->find();		if (!$user_img) {			echo '数据为空';			exit;		}		$userId = hashs($user_img['userid']);		$res[] = file_put_contents('./upload/user/backup/' . $userId . '1', $user_img['img1']);		$res[] = file_put_contents('./upload/user/backup/' . $userId . '2', $user_img['img2']);		$res[] = file_put_contents('./upload/user/backup/' . $userId . '3', $user_img['img3']);		$idcard_img = [];		if (check_arr($res)) {			$idcard_img[1] = './upload/user/backup/' . $userId . '1';			$idcard_img[2] = './upload/user/backup/' . $userId . '2';			$idcard_img[3] = './upload/user/backup/' . $userId . '3';			$idcard_img = json_encode($idcard_img);			$rs = db::table('user')->where(['id' => $user_img['userid']])->save(['idcard_img' => $idcard_img]);			$rs = db::table('user_img')->where(['userid' => $user_img['userid']])->delete();			if (check_arr($rs)) {				echo '备份成功';			} else {				echo '备份失败';			}		} else {			echo '备份失败';		}	}	public function truename_upII()	{		$truename = iv("post.truename", 'truename', $this->ajax_lang('真实姓名格式错误'));		$idcardtype = iv("post.idcardtype", 'c', $this->ajax_lang('证件类型格式错误'));		$idcard = iv("post.idcard", 'dw', $this->ajax_lang('证件号码格式错误'));		$userinfo = db::table("user")->where(["id" => session("userid")])->find();		if ($userinfo["idcard_rz"]) {			ajax($this->ajax_lang("你已认证,请勿反复提交"));		}		if ($idcardtype == "身份证") {			$year = substr($idcard, 6, 4);			$year = intval($year);			if (date("Y") < $year || $year < "1900") {				ajax("身份证错误2");			}			$month = intval(substr($idcard, 10, 2));			$month = intval($month);			if ("12" < $month || $month = "0") {				ajax("身份证错误3");			}			$day = substr($idcard, 12, 2);			$day = intval($day);			if ("31" < $day || $day = "0") {				ajax("身份证错误4");			}			$idcard_base = substr($idcard, 0, 17);			$verify_code = substr($idcard, 17, 1);			$factor = array(7, 9, 10, 5, 8, 4, 2, 1, 6, 3, 7, 9, 10, 5, 8, 4, 2);			$verify_code_list = array('1', '0', 'X', '9', '8', '7', '6', '5', '4', '3', '2');			$total = 0;			for ($i = 0; $i < 17; $i++) {				$total += substr($idcard_base, $i, 1) * $factor[$i];			}			$mod = $total % 11;			if ($verify_code != $verify_code_list[$mod]) {				ajax("身份证错误");			}		}		$check_idcard = db::table('user')->where(['idcard' => $idcard])->find();		if ($check_idcard && $check_idcard['id'] != $this->userid) {			ajax($this->ajax_lang("该身份证已被认证了"));		}		$res = md('user')->truename_upII($userinfo['id'], $truename, $idcardtype, $idcard);		if (isset($res[1]) && $res[1]) {			ajax($this->ajax_lang($res[0]), 1);		} else {			ajax($this->ajax_lang($res[0]));		}	}	public function password()	{		if (empty($_POST)) {			$this->set_title('修改登录密码');			$this->display();		} else {			$this->check_up("修改登录密码");			$oldpassword = iv('post.oldpassword', 'password', $this->ajax_lang('旧登录密码格式错误'));			$newpassword = iv('post.newpassword', 'password', $this->ajax_lang('新登录密码格式错误'));			$res = md('user')->set_password($this->userid, $oldpassword, $newpassword);			if (isset($res[1]) && $res[1]) {				ajax($this->ajax_lang($res[0]), 1);			} else {				ajax($this->ajax_lang($res[0]));			}		}	}	public function paypassword()	{		if (empty($_POST)) {			$this->set_title('修改交易密码');			$this->display();		} else {			$this->check_up("修改交易密码");			$type = iv('post.type', 'd', $this->ajax_lang('类型错误'));			if ($type == 1) {				$oldpaypassword = iv('post.oldpaypassword', 'password', $this->ajax_lang('旧交易密码格式错误'));				$newpaypassword = iv('post.newpaypassword', 'password' . $this->ajax_lang('新交易密码格式错误'));				$res = md('user')->set_paypassword($this->userid, $oldpaypassword, $newpaypassword);				if (isset($res[1]) && $res[1]) {					ajax($this->ajax_lang($res[0]), 1);				} else {					ajax($this->ajax_lang($res[0]));				}			}			if ($type == 2) {				$paypassword = iv('post.paypassword', 'password', $this->ajax_lang('交易密码格式错误'));				$tpwdsetting = iv('post.tpwdsetting', 'd', $this->ajax_lang('请选择方式'));				$res = md('user')->set_tpwdsetting($this->userid, $paypassword, $tpwdsetting);				if (isset($res[1]) && $res[1]) {					ajax($this->ajax_lang($res[0]), 1);				} else {					ajax($this->ajax_lang($res[0]));				}			}		}	}	public function google()	{		$this->set_title('谷歌验证器');		if (isset($this->user['google']) && $this->user['google']) {			$arr = explode('|', $this->user['google']);			$this->ga_login = $arr[1];			$this->ga_transfer = $arr[2];			$this->ga_trade = $arr[3];		} else {			$ga = md('user')->google();			$asecret = $ga->createSecret();			session('asecret', $asecret);			if (isset($this->user['id']) && $this->user['id']) {				$qrCodeUrl = $ga->getQRCodeGoogleUrl($this->user['id'] . '%20-%20' . $_SERVER['HTTP_HOST'], $asecret);			} else {				$qrCodeUrl = '';			}			$this->assign("asecret", $asecret);			$this->assign("qrCodeUrl", $qrCodeUrl);		}		$this->display();	}	public function google_up()	{		$this->check_up("谷歌验证器_设置1");		$ga_code = iv('post.ga', 'wd', $this->ajax_lang('双重验证密码格式错误'));		$ga_login = iv('post.ga_login') == false ? 0 : 1;		$ga_transfer = iv('post.ga_transfer') == false ? 0 : 1;		$ga_trade = iv('post.ga_trade') == false ? 0 : 1;		$asecret = session('asecret');		(!$asecret) && ajax($this->ajax_lang('验证码已经失效,请刷新网页'));		$ga = md('user')->google();		if ($ga->verifyCode($asecret, $ga_code, 1)) {			$ga_val = $asecret . '|' . $ga_login . '|' . $ga_transfer . '|' . $ga_trade;			$this->show(md('user')->set_google($this->userid, $ga_val));		} else {			ajax($this->ajax_lang('验证失败'));		}	}	public function google_set()	{		$this->check_up("谷歌验证器_设置2");		$ga_code = iv('post.ga', 'a', $this->ajax_lang('双重验证密码格式错误'));		$ga_login = iv('post.ga_login') == false ? 0 : 1;		$ga_transfer = iv('post.ga_transfer') == false ? 0 : 1;		$ga_trade = iv('post.ga_trade') == false ? 0 : 1;		$user = db::table("user")->where(["id" => $this->userid])->find();		$arr = explode('|', $user['google']);		$asecret = $arr['0'];		(!$asecret) && ajax($this->ajax_lang('验证码已经失效'));		$ga = md('user')->google();		if ($ga->verifyCode($asecret, $ga_code, 1)) {			$ga_val = $asecret . '|' . $ga_login . '|' . $ga_transfer . '|' . $ga_trade;			$this->show(md('user')->set_google($this->userid, $ga_val));		} else {			ajax($this->ajax_lang('验证失败'));		}	}	public function google_del()	{		$this->check_up("谷歌验证器_关闭");		$ga_code = iv('post.ga', 'a', $this->ajax_lang('双重验证密码格式错误'));		$user = db::table("user")->where(["id" => $this->userid])->find();		$arr = explode('|', $user['google']);		$asecret = $arr['0'];		(!$asecret) && ajax($this->ajax_lang('验证码已经失效'));		$ga = md('user')->google();		if ($ga->verifyCode($asecret, $ga_code, 1)) {			$ga_val = '';			$this->show(md('user')->set_google($this->userid, $ga_val));		} else {			ajax($this->ajax_lang('验证失败'));		}	}	public function moble()	{		$this->set_title('手机绑定');		$sys_sms = db::table('sys_sms')->where(['status' => 1])->find();		if (!$sys_sms) {			$sys_sms['sms'] = 0;			$sys_sms['tel'] = 0;		}		$this->assign('sys_sms', $sys_sms);		$this->display();	}	public function moble_new()	{		$this->check_up("手机绑定更新");		$moble_new = iv('post.moble_new', 'moble', $this->ajax_lang('手机号码格式错误'));		$mobles_new = iv('post.mobles_new');		if (!check($mobles_new, 'd', '+')) {			ajax($this->ajax_lang('国家编号错误'));		}		$moble_verify_new = iv('post.moble_verify_new');		if (!$moble_verify_new || $moble_verify_new != session('moble_verify_new')) {			ajax($this->ajax_lang('短信验证码错误'));		}		$moble_new = $mobles_new . '|' . $moble_new;		$res = md('user')->set_moble($this->userid, $moble_new);		if (isset($res[1]) && $res[1]) {			ajax($this->ajax_lang($res[0]), 1);		} else {			ajax($this->ajax_lang($res[0]));		}	}	public function moble_set()	{		$this->check_up("手机绑定更新");		$moble = iv('post.moble', 'moble', $this->ajax_lang('手机号码格式错误'));		$mobles = iv('post.mobles');		if (!check($mobles, 'd', '+')) {			ajax($this->ajax_lang('国家编号错误'));		}		$moble_verify = iv('post.moble_verify');		$moble_new = $mobles . '|' . $moble;		$res = md('user')->cha_moble($moble_new);		if (isset($res[1])) {			ajax($this->ajax_lang('新手机号码已存在'));		}		if (!$moble_verify || $moble_verify != session('moble_verify')) {			ajax($this->ajax_lang('短信验证码错误'));		}		$res = md('user')->set_moble($this->userid, $moble_new);		if (isset($res[1]) && $res[1]) {			ajax($this->ajax_lang($res[0]), 1);		} else {			ajax($this->ajax_lang($res[0]));		}	}	public function email()	{		$this->set_title('邮箱绑定');		$this->display();	}	public function email_up()	{		$this->check_up("邮箱绑定");		$email_new = iv('post.email', 'email', $this->ajax_lang('邮箱格式错误'));		$verify_email_setemail = iv('post.setemail');		if (!$verify_email_setemail || $verify_email_setemail != session('verify_email_setemail')) {			ajax($this->ajax_lang('验证码错误'));		}		$check_email = db::table('user')->where(['email' => $email_new])->find();		if ($check_email && $check_email['id'] != session('userid')) {			ajax($this->ajax_lang('邮箱已存在'));		}		$res = db::table('user')->where(['id' => session('userid')])->save(['email' => $email_new]);		if ($res) {			ajax($this->ajax_lang('操作成功'), 1);		} else {			ajax($this->ajax_lang('操作失败'));		}	}	public function goods()	{		$this->set_title('钱包地址管理');		$where = ['userid' => $this->userid];		$count = db::table("user_goods")->where($where)->count();		$PageObj = new page($count, 10);		$show = $PageObj->show();		$list = db::table("user_goods")->where($where)->order("id desc")->limit($PageObj->firstRow, $PageObj->listRows)->select();		$pages = ["list" => $list, "show" => $show];		if ($pages['list']) {			foreach ($pages['list'] as $k => $v) {				$pages['list'][$k]['moble'] = substr_replace(str_replace("|", " ", $v['moble']), '****', 3, 4);			}		}		$this->assign("pages", $pages);		$this->display();	}	public function goods_up()	{		$this->check_up("添加联系地址");		$name = iv('post.name', 'a', $this->ajax_lang('备注名称格式错误'));		$truename = iv('post.truename', 'truename', $this->ajax_lang('联系姓名格式错误'));		$moble = iv('post.moble', 'moble', $this->ajax_lang('联系电话格式错误'));		$prov = iv('post.prov', 'a', $this->ajax_lang('省份错误'));		$city = iv('post.city', 'a', $this->ajax_lang('城市错误'));		$addr = iv('post.addr', 'a', $this->ajax_lang('联系地址格式错误'));		$paypassword = iv('post.paypassword', 'password', $this->ajax_lang('交易密码格式错误'));		$res = md('user')->add_goods($this->userid, $name, $truename, $moble, $prov, $city, $addr, $paypassword);		if (isset($res[1]) && $res[1]) {			ajax($this->ajax_lang($res[0]), 1);		} else {			ajax($this->ajax_lang($res[0]));		}	}	public function goods_del()	{		$this->check_up("删除联系地址");		$id = iv('post.id', 'd', $this->ajax_lang('删除编号格式错误'));		$paypassword = iv('post.paypassword', 'password', $this->ajax_lang('交易密码格式错误'));		$res = md('user')->del_goods($this->userid, $id, $paypassword);		if (isset($res[1]) && $res[1]) {			ajax($this->ajax_lang($res[0]), 1);		} else {			ajax($this->ajax_lang($res[0]));		}	}	public function log()	{		$this->set_title('登录日志');		$where['userid'] = $this->userid;		$count = db::table("user_log")->where($where)->count();		$PageObj = new page($count, 15);		$show = $PageObj->show();		$list = db::table("user_log")->where($where)->order("id desc")->limit($PageObj->firstRow, $PageObj->listRows)->select();		$pages = ['show' => $show, 'list' => $list];		$this->assign("pages", $pages);		$this->display();	}	public function help()	{		$news = db::table("help_news")->where(["userid" => session("userid"), "status" => 2])->count();		$help_type = db::table("help_type")->where(["status" => 1])->select();		$username = db::table("user")->where(["id" => session("userid")])->find();		$this->assign("news", $news);		$this->assign("help_type", $help_type);		$this->assign("username", $username);		$this->display();	}	public function help_up()	{		$this->check_up("提交问题");		$type = iv("post.type", "d", $this->ajax_lang("问题类型格式错误"));		$contact = iv("post.contact");		$content = iv("post.content", "a", $this->ajax_lang("问题内容格式错误"));		$paypassword = iv("post.paypassword", "dw", $this->ajax_lang("密码格式错误"));		$user1 = db::table("user")->where(["id" => session('userid')])->find();		if (!$user1) {			ajax($this->ajax_lang("请先登录"));		}		if (mb_strlen($content) > 200) {			ajax($this->ajax_lang("问题过长"));		}		if (hashs($paypassword) != $user1["paypassword"]) {			ajax($this->ajax_lang("交易密码错误"));		}		$help_type = db::table("help_type")->where(["id" => $type])->find();		if (!$help_type) {			ajax($this->ajax_lang("问题类型错误"));		}		$rs = db::table("help")->add(["userid" => session("userid"), "type" => $type, "content" => $content, "contact" => $contact, "addtime" => time(), "status" => 2]);		if ($rs) {			ajax($this->ajax_lang("保存成功,请耐心等待客服回答"), 1);		} else {			ajax($this->ajax_lang("操作失败"));		}	}	public function helplog()	{		$news = db::table("help_news")->where(["userid" => session("userid"), "status" => 2])->count();		$count = db::table("help")->where(["userid" => session("userid")])->count();		$PageObj = new page($count, 15);		$show = $PageObj->show();		$list = db::table("help")->where(["userid" => session("userid")])->order("id desc")->limit($PageObj->firstRow, $PageObj->listRows)->select();		foreach ($list as $k => $v) {			$username = db::table("user")->where(["id" => session("userid")])->find();			$typelist = db::table("help_type")->where(["id" => $v["type"]])->find();			$list[$k]["username"] = $username["username"];			$list[$k]["typetitle"] = $typelist["type"];		}		$pages = ['show' => $show, 'list' => $list];		$this->assign('news', $news);		$this->assign('pages', $pages);		$this->display();	}	public function sort()	{		$status = iv("status");		if (!$status) {			redirect("/user/helplog");			exit();		}		$count = db::table("help")->where(["userid" => session("userid"), "status" => $status])->count();		$PageObj = new page($count, 15);		$show = $PageObj->show();		$list = db::table("help")->where(["userid" => session("userid"), "status" => $status])->order("id desc")->limit($PageObj->firstRow, $PageObj->listRows)->select();		foreach ($list as $k => $v) {			$username = db::table("user")->where(["id" => session("userid")])->find();			$typelist = db::table("help_type")->where(["id" => $v["type"]])->find();			$list[$k]["username"] = $username["username"];			$list[$k]["typetitle"] = $typelist["type"];		}		$pages = ['show' => $show, 'list' => $list];		$this->assign('pages', $pages);		$this->display("helplog");	}	public function news()	{		$count = db::table("help_news")->where(["userid" => session("userid"), "status#!=" => 0])->count();		$PageObj = new page($count, 15);		$show = $PageObj->show();		$list = db::table("help_news")->where(["userid" => session("userid"), "status#!=" => 0])->order("id desc")->limit($PageObj->firstRow, $PageObj->listRows)->select();		$pages = ['show' => $show, 'list' => $list];		$this->assign('pages', $pages);		$this->display();	}	public function newssort()	{		$status = iv("status");		if (!$status) {			redirect("/user/news");			exit();		}		$count = db::table("help_news")->where(["userid" => session("userid"), "status" => $status])->count();		$PageObj = new page($count, 15);		$show = $PageObj->show();		$list = db::table("help_news")->where(["userid" => session("userid"), "status" => $status])->order("id desc")->limit($PageObj->firstRow, $PageObj->listRows)->select();		$pages = ['show' => $show, 'list' => $list];		$this->assign('pages', $pages);		$this->display("news");	}	public function log_del()	{		$id = iv("post.id", "d", $this->ajax_lang("问题ID格式错误"));		$paypassword = iv("post.paypassword", "dw", $this->ajax_lang("密码格式错误"));		$user1 = db::table("user")->where(["id" => session('userid')])->find();		if (!$user1) {			ajax($this->ajax_lang("请先登录"));		}		if (hashs($paypassword) != $user1["paypassword"]) {			ajax($this->ajax_lang("交易密码错误"));		}		$help = db::table("help")->where(["id" => $id, "userid" => session("userid")])->find();		if (!$help) {			ajax($this->ajax_lang("问题不存在"));		}		$rs = db::table("help")->where(["id" => $id])->delete();		if ($rs) {			ajax($this->ajax_lang("删除成功"), 1);		} else {			ajax($this->ajax_lang("删除失败"));		}	}	public function news_del()	{		$id = iv("post.id", "d", $this->ajax_lang("问题ID格式错误"));		$paypassword = iv("post.paypassword", "dw", $this->ajax_lang("密码格式错误"));		$user1 = db::table("user")->where(["id" => session('userid')])->find();		if (!$user1) {			ajax($this->ajax_lang("请先登录"));		}		if (hashs($paypassword) != $user1["paypassword"]) {			ajax($this->ajax_lang("交易密码错误"));		}		$news = db::table("help_news")->where(["userid" => session("userid"), "id" => $id])->find();		if (!$news) {			ajax($this->ajax_lang("消息不存在"));		}		$rs = db::table("help_news")->where(["id" => $id])->delete();		if ($rs) {			ajax($this->ajax_lang("操作成功"), 1);		} else {			ajax($this->ajax_lang("操作失败"));		}	}	public function news_yes()	{		$id = iv("post.id", "d", $this->ajax_lang("参数错误"));		$user1 = db::table("user")->where(["id" => session('userid')])->find();		if (!$user1) {			ajax($this->ajax_lang("请先登录"));		}		$news = db::table("help_news")->where(["userid" => session("userid"), "id" => $id])->find();		if (!$news) {			ajax($this->ajax_lang("消息不存在"));		}		$status = 0;		if ($news["status"] == 2) {			$status = 1;		} elseif ($news["status"] == 1) {			$status = 2;		} else {			ajax($this->ajax_lang("消息状态错误"));		}		$rs = db::table("help_news")->where(["id" => $id])->save(["status" => $status]);		if ($rs) {			ajax($this->ajax_lang("操作成功"), 1);		} else {			ajax($this->ajax_lang("操作失败"));		}	}	public function api()	{		$this->set_title('API申请');		$api = db::table('api')->where(['userid' => $this->userid])->find();		if (!$api) {			$api = '';		}		$this->assign('api', $api);		$this->display();	}	public function api_up()	{		$this->check_up("API申请");		$api = db::table('api')->where(['userid' => $this->userid])->find();		if ($api) {			ajax($this->ajax_lang('您已经申请过API'));		}		$time = time();		$api_key = md5($this->userid . 'key' . $time);		$api_secret_key = md5($this->userid . 'secret_key' . $time);		$res = db::table('api')->add(['userid' => $this->userid, 'key' => $api_key, 'secret_key' => $api_secret_key, 'addtime' => $time, 'status' => 0,]);		if ($res) {			ajax($this->ajax_lang('操作成功'), 1);		} else {			ajax($this->ajax_lang('操作失败'));		}	}	public function IPwhite()	{		$this->set_title('IP白名单');		$whitelist = db::table('user_ip')->where(['userid' => session('userid')])->find();		if (empty($whitelist)) {			$whitelist['whitelist'] = '你还没有绑定IP';		}		$this->assign('whitelist', $whitelist);		$sys_sms = db::table('sys_sms')->where(['status' => 1])->find();		if (!$sys_sms) {			$sys_sms['sms'] = 0;			$sys_sms['tel'] = 0;		}		$this->assign('sys_sms', $sys_sms);		$this->display();	}	public function whitelist_up()	{		$this->check_up("IP白名单修改");		$whitelist = iv('post.whitelist', 'a', $this->ajax_lang('IP白名单格式错误'));		$moble_verify = iv('post.moble_verify', 'dw', '验证码格式错误');		if ($moble_verify != session('moble_verify_whitelist')) {			$this->ajax_lang('短信验证码错误');		}		if ($userip = db('user_ip')->where(['userid' => session('userid')])->find()) {			$res = db('user_ip')->where(['userid' => session('userid')])->save(['whitelist' => $whitelist, 'addtime' => time()]);		} else {			$res = db('user_ip')->add(['userid' => session('userid'), 'whitelist' => $whitelist, 'addtime' => time()]);		}		if ($res) {			ajax($this->ajax_lang('操作成功'), 1);		} else {			ajax($this->ajax_lang('操作失败'));		}	}}