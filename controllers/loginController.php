<?php

class loginController extends Controller{

	private $_login;
	public function __construct(){
		parent::__construct();
		$this->_login=$this->loadModel('login');
	}

	public function index(){
		if(isset($_GET['request']))
		{
			Session::set('requestUrl',$_GET['request']);
		}else{
			Session::destroy('requestUrl');
		}

		$this->_view->renderizar('index',false,false,'login');
	}

	public function login(){
		if(!$this->getSql('usuario') && !$this->getSql('password')){			
			exit;
		}
		
		$log=$this->_login->auth($this->getSql('usuario'),$this->getSql('password'));
		if(count($log)>0){
			$login_user=$log[0]['username'];
			$login_privilegio=$log[0]['privilegio'];
			Session::set('idusers',$log[0]['idusers']);
		}else{
			$use_curl=true;//usaremos curl
			$pid="82e6aa3b-64d8-4108-90e7-e1b85bb56aed";
			$user=$this->getSql('usuario');
			$pwd=$this->getSql('password');
			$url="http://desandresbello.mastabeats.com/json/ValidarUsuario.ashx?action=accesoUsuario&pid=".$pid."&usuario=".$user."&password=".$pwd;
			if ($use_curl) {
			 	$ch = curl_init();
			 	curl_setopt($ch, CURLOPT_URL, $url);
			 	curl_setopt($ch, CURLOPT_RETURNTRANSFER, 1);
			 	curl_setopt($ch, CURLOPT_CONNECTTIMEOUT, 5);
			 	$dJson = curl_exec($ch);
			 	curl_close($ch);
			} else {
				$dJson = @file_get_contents($url);
			}

			$json = json_decode($dJson, true);


			if(count($json['Usuario'])>0){			
				$login_user=$json['Usuario'];
				$login_privilegio='Lector';
			}else{ 				
				//mandamos al login de nuevo no existe
				if(Session::get('requestUrl')){
					$this->redireccionar('login?request='.Session::get('requestUrl'));
				}else{
					$this->redireccionar('login');
				}
				
			}
		}
		
		//seteamos las sessiones
		Session::set('login',true);
		Session::set('usuario',$login_user);
		Session::set('privilegio',$login_privilegio);
		if(Session::get('requestUrl')){
			$this->redireccionar(Session::get('requestUrl'));
		}else{
			$this->redireccionar();
		}	

	}

	public function logout(){
		Session::destroy();
		$this->redireccionar('login');
	}
}

?>