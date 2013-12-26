<?php

class loginModel extends Model{
	public function __construct(){
		parent::__construct();
	}

	public function auth($user,$pwd){
		$data=$this->_db->prepare(
			"select idusers,username,password,r.name 'privilegio' from users as u inner join roles as r on r.idroles=u.idroles where username=:user and password=:pwd and state=1"
			);
		$data->execute(array(
			':user' => $user,
			':pwd' => $pwd
			));
		return $data->fetchAll();
	}

}

?>