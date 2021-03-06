<?php

class indexController extends Controller
{
	private $_post;
	private $_category;

	public function __construct(){
		parent::__construct();
		if(!Session::get('login')){
			$this->redireccionar('login');
		}
		$this->_post=$this->loadModel('post');
		$this->_category=$this->loadModel('category');
	}
	public function index($page=1)
	{	
		if($this->filtrarInt($page)==0){
			$page=1;
		}

		$total_post=5;
		$limite=$total_post;//$page*$total_post;
		$inicio=($page-1)*$total_post;

		$post=$this->_post->select($limite,$inicio);

		if(count($post)==0){
			//$this->redireccionar();//si no hay manuales rediccionar al inicio
			$this->_view->assign('blank',true);
		}
		//reseteo los valores
		for($i=0;$i<count($post);$i++){
			$post[$i]['created']=$this->timeago(strtotime($post[$i]['created']));		
			if($post[$i]['last_editing']!=null)
				$post[$i]['last_editing']="Actualizado ".$this->timeago(strtotime($post[$i]['last_editing']));
		}

		$this->_view->assign('titulo','Manuales Docs. ZeusIntranet V1');		
		$this->_view->assign('post',$post);
		$this->_view->assign('page',$page);
		$this->_view->assign('lastPost',$this->_post->select(5));
		$this->_view->assign('menuCategory',$this->_category->select());
		$this->_view->renderizar('index');
	}

	public function search(){
		if(!$this->getSql('search')){
			$this->redireccionar();
		}
		$post=$this->_post->search($this->getSql('search'));
		if(count($post)==0){
			//$this->redireccionar();//si no hay manuales rediccionar al inicio
			$this->_view->assign('blank',true);
		}

		for($i=0;$i<count($post);$i++){
			$post[$i]['created']=$this->timeago(strtotime($post[$i]['created']));		
			if($post[$i]['last_editing']!=null)
				$post[$i]['last_editing']="Actualizado ".$this->timeago(strtotime($post[$i]['last_editing']));
		}
		
		$this->_view->assign('titulo','Resultado : '.$this->getSql('search').' | Manuales Docs. ZeusIntranet V1');		
		$this->_view->assign('post',$post);
		$this->_view->assign('search',$this->getSql('search'));
		$this->_view->assign('lastPost',$this->_post->select(5));
		$this->_view->assign('menuCategory',$this->_category->select());
		$this->_view->renderizar('index');
	}

}
?>