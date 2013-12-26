<?php

class categoryModel extends Model{
	public function __construct(){
		parent::__construct();
	}

	public function select(){
		$data=$this->_db->prepare(
			"select * from category"
			);
		$data->execute();
		return $data->fetchAll();
	}
}

?>