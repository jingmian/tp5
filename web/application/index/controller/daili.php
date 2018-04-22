<?phpnamespace app\index\controller;use think\db;use Move\ext\page;class daili extends home{	public function __construct()	{		parent::__construct();		// $this->is_game('daili');	}	public function index()	{		$this->set_title('代理充值');		$this->token = token('home_daili_buy');		$mymc_coin = new \mymc\coin();		$coin_list = $mymc_coin->select(1);		$this->assign('coin_list', $coin_list);		$this->display();	}	public function log()	{		$this->set_title('充值记录');		if ($this->userid) {			$count = db::table("daili_log")->where(["dailiid" => $this->userid])->count();			$PageObj = new page($count, 15);			$show = $PageObj->show();			$list = db::table("daili_log")->where(["dailiid" => session("userid")])->order("id desc")->limit($PageObj->firstRow, $PageObj->listRows)->select();			if ($list) {				foreach ($list as $k => $v) {					$list[$k]["username"] = db::table("user")->where(["id" => $v["userid"]])->find('username');				}			}		} else {			$show = [];			$list = [];		}		$pages = ['show' => $show, 'list' => $list];		$this->assign('pages', $pages);		$this->display();	}	public function invit()	{		$this->set_title('充值赠送');		if ($this->userid) {			$where = ["userid" => $this->userid];			$count = db::table("daili_invit")->where($where)->count();			$PageObj = new page($count, 12);			$show = $PageObj->show();			$list = db::table("daili_invit")->where($where)->order("id desc")->limit($PageObj->firstRow, $PageObj->listRows)->select();			if ($list) {				foreach ($list as $k => $v) {					if ($v['invit'] != 0) {						$username = db::table('user')->where(["id" => $v['id']])->find("username");						$coin = md('coin')->getById($v['feecoin']);						$list[$k]['coin_title'] = isset($coin['title']) ? $coin['title'] : '';						$list[$k]['invitname'] = substr_replace(str_replace("|", " ", $username), '**', 3, 2);					} else {						$list[$k]['invitname'] = '系统';					}				}			}		} else {			$show = [];			$list = [];		}		$pages = ['show' => $show, 'list' => $list];		$this->assign('pages', $pages);		$this->display();	}	public function up()	{		$this->check_up('代理充值提交充值');		if (!session('home_daili_buy')) {			ajax('非法访问');		}		$token = iv("post.token", 'dw', '令牌错误');		$coinname = iv('post.coinname', 'w', '币种类型错误');		$num = iv('post.num', 'xnb', '充值数量格式错误');		$paypassword = iv('post.paypassword', 'password', '交易密码格式错误');		$username = iv('post.username', 'username', '充值用户名格式错误');		if (!$token || $token != session('home_daili_buy')) {			ajax('恶意访问');		}		if (!$this->userid) {			ajax("请先登录");		}		$res = md('daili')->up($this->userid, $coinname, $num, $paypassword, $username);		if (isset($res[1]) && $res[1]) {			session('home_daili_buy', null);			ajax($res[0], 1);		} else {			ajax($res[0]);		}	}}