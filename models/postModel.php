<?php

class postModel extends Model
{

	public function __construct(){
		parent::__construct();
	}

	public function select($limit=10,$inicio=0){
		$data=$this->_db->prepare(
			"select p.*,c.name 'categoria',u.username 'usuario' from post as p inner join users as u on u.idusers=p.idusers inner join category as c on c.idcategory=p.idcategory
		     where p.state>-1 order by created desc
			 LIMIT $inicio,$limit"
			);
		$data->execute();
		return $data->fetchAll();
	}

	public function selectCategory($name,$limit=10,$inicio=0){
		$data=$this->_db->prepare(
			"select p.*,c.name 'categoria',u.username 'usuario' from post as p inner join users as u on u.idusers=p.idusers inner join category as c on c.idcategory=p.idcategory
		     where c.name=:name order by created desc
			 LIMIT $inicio,$limit"
			);
		$data->execute(array(':name'=> $name));
		return $data->fetchAll();
	}

	public function search($key){
		$data=$this->_db->prepare(
			"select * from post where titulo like concat('%',:key,'%')  or sub_title like concat('%',:key,'%') or content like concat('%',:key,'%') or tags like concat('%',:key,'%')"
			);
		$data->execute(array(':key' => $key));
		return $data->fetchAll();
	}
	public function add($titulo,$subtitulo,$plug,$categoria,$contenido,$tags,$iduser){
		$data=$this->_db->prepare(
			"insert into post(titulo,sub_title,content,plug,created,post.like,dislike,views,state,tags,idusers,idcategory)values
			(:titulo,:subtitulo,'".$contenido."',:plug,now(),0,0,0,1,:tags,:iduser,:categoria)"
			);
		$data->execute(array(
			':titulo' => $titulo,
			':subtitulo' => $subtitulo,
			':plug' => $plug,
			':tags' => $tags,
			':iduser' => $iduser,
			':categoria' => $categoria
			));
	}

	public function update($titulo,$subtitulo,$plug,$categoria,$contenido,$tags,$idpost){
		$data=$this->_db->prepare(
			"update post set titulo=:titulo,sub_title='".$subtitulo."',content='".$contenido."',plug=:plug,tags=:tags,idcategory=:categoria,last_editing=now() where idpost=:idpost"
			);
		$data->execute(array(
			':titulo' => $titulo,
			':plug' => $plug,
			':tags' => $tags,
			':idpost' => $idpost,
			':categoria' => $categoria
			));

	}

	public function delete($idpost){
		$data=$this->_db->prepare(
			"update post set state=-1 where idpost=:id"
			);
		$data->execute(array(':id'=>$idpost));
	}

	public function views($idpost){
		$data=$this->_db->prepare(
			"update post set views=views+1 where idpost=:id"
			);
		$data->execute(array(':id'=>$idpost));
	}

	public function like($idpost){
		$data=$this->_db->prepare(
			"update post set post.like=post.like+1 where idpost=:id"
			);
		$data->execute(array(':id'=>$idpost));
	}
	public function dislike($idpost){
		$data=$this->_db->prepare(
			"update post set dislike=dislike+1 where idpost=:id"
			);
		$data->execute(array(':id'=>$idpost));
	}

	public function getId($id){
		$data=$this->_db->prepare(
			"select p.*,c.name 'categoria',u.username 'usuario' from post as p inner join users as u on u.idusers=p.idusers inner join category as c on c.idcategory=p.idcategory
		     where p.idpost=?"
			);
		$data->execute(array($id));
		return $data->fetch();
	}

	public function get($id){
		$data=$this->_db->prepare(
			"select p.*,c.name 'categoria',u.username 'usuario' from post as p inner join users as u on u.idusers=p.idusers inner join category as c on c.idcategory=p.idcategory
		     where concat_ws('-',p.plug,p.idpost)=?"
			);
		$data->execute(array($id));
		return $data->fetch();
	}

	public function setContent($content,$idpost){
		$data=$this->_db->prepare(
			"update post set content='".$content."',last_editing=now() where idpost=:id"
			);
		$data->execute(array(':id'=>$idpost));
	}

}

?>