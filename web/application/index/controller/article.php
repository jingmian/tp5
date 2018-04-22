<?phpnamespace app\index\controller;use think\db;use move\ext\page;class article extends home{	public function __construct()	{		parent::__construct();	}	public function index()	{		$this->set_title('文章中心');		$type['id'] = iv('get.typeid', 'd', '参数错误', 1);		if (!$type['id']) {			$type = db::table("article_type")->where(["mr" => 1, 'type' => 1])->find();		} else {			$type = db::table("article_type")->where(["id" => $type['id']])->find();		}		if (!$type['id']) {			$type = db::table("article_type")->where(["status" => 1, 'type' => 1])->find();		}		$this->assign('type', $type);		$type_arr = db::table("article_type")->where(["status" => "1", 'type' => $type['type']])->order("sort asc ,id desc ,addtime desc")->limit(6)->select();		$this->assign('type_arr', $type_arr);		$lang = cookie("lang");		if (!cookie("lang")) {			$lang = 'cn';		}		$where = ["status" => 1, 'type_id' => $type['id'], 'lang' => $lang];		$count = db::table("article")->where($where)->count();		$PageObj = new page($count, 10);		$show = $PageObj->show();		$list = db::table("article")->where($where)->order("sort asc ,id desc ,addtime desc")->limit($PageObj->firstRow, $PageObj->listRows)->select();		foreach ($list as $k => $v) {			$list[$k]['jian'] = mb_substr(strip_tags($v['value']), 0, 130) . '...';			$pattern = "/<[img|IMG].*?src=[\'|\"](.*?(?:[\.gif|\.jpg|\.png]))[\'|\"].*?[\/]?>/";			preg_match($pattern, $v['value'], $match);			if ($match) {				$list[$k]['img'] = $match[1];			} else {				$list[$k]['img'] = '/static/default/home/img/noimg.png';			}		}		$pages = ['show' => $show, 'list' => $list];		$this->assign('pages', $pages);		$type_hot = db::table("article")->where($where)->limit(10)->order("hot desc ,sort asc ,id desc ,addtime desc")->select();		$this->assign('type_hot', $type_hot);		$this->display();	}	public function detail()	{		$this->set_title('文章详情');		$article['id'] = iv('get.id', 'd', '参数错误', 1);		if (!$article['id']) {			$article = db::table("article")->find();		} else {			$article = db::table("article")->where(["id" => $article['id']])->find();		}		$article['jian'] = mb_substr(strip_tags($article['value']), 0, 100) . '...';		$this->assign('article', $article);		$type = db::table("article_type")->where(["id" => $article['type_id']])->find();		$this->assign('type', $type);		$type_arr = db::table("article_type")->where(["status" => "1", 'type' => $type['type']])->order("sort asc ,id desc ,addtime desc")->limit(6)->select();		$this->assign('type_arr', $type_arr);		$type_hot = db::table("article")->where(["status" => "1", 'type_id' => $type['id']])->limit(10)->order("hot desc ,sort asc ,id desc ,addtime desc")->select();		$this->assign('type_hot', $type_hot);		$shang = db::table("article")->where(['id#<' => $article['id'], 'type_id' => $article['type_id'], 'status' => 1])->order("sort asc ,id desc ,addtime desc")->find();		if (!$shang) {			$shang['id'] = $article['id'];			$shang['title'] = '没有了';		}		$this->assign('shang', $shang);		$xia = db::table("article")->where(['id#>' => $article['id'], 'type_id' => $article['type_id'], 'status' => 1])->find();		if (!$xia) {			$xia['id'] = $article['id'];			$xia['title'] = '没有了';		}		$this->assign('xia', $xia);		$this->display();	}}