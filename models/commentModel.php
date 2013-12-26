<?php

class commentModel extends Model{

	public function __construct(){
		parent::__construct();
	}

	public function get($idpost){
		$data=$this->_db->prepare(
			"select * from comments where idpost=?"
			);
		$data->execute(array($idpost));
		
		return $data->fetchAll();
	}

	public function add($autor,$content,$idpost){
		$query=$this->_db->prepare(
			"insert into comments (autor,content,created,state,idpost)values(
			 :autor,:content,now(),1,:idpost)"
			);
		$query->execute(array(
			':autor' => $autor,
			':content' => $content,
			':idpost' => $idpost
			));
	}
}
?>