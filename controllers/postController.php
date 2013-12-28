<?php
class postController extends Controller
{
	private $_post;
	private $_category;
	private $_comment;

	public function __construct(){
		parent::__construct();
		
		$this->_post=$this->loadModel('post');
		$this->_category=$this->loadModel('category');
		$this->_comment=$this->loadModel('comment');
	}
	private function userProhibited($pri){
		if(Session::get('privilegio')==$pri){
			$this->redireccionar();
		}
	}
	public function index($plug="-1")
	{	

		if(!Session::get('login')){
			//devolvemos al request el post solicitado
			$this->redireccionar('login?request=post/'.$plug);
		}

		//cargamos funciones javascript
		$this->_view->setJs(array('actions'));

		$post=$this->_post->get($plug);
		if(!isset($post['idpost'])){//salir si no hay datos
			$this->redireccionar();
		}

		//agregamos una vista por cada mirada en la web
		$this->_post->views($post['idpost']);
		$post=$this->_post->get($plug);//consultamos de nuevo
		$post['created']=$this->timeago(strtotime($post['created']));		

		$comments=$this->_comment->get($post['idpost']);
		for($i=0;$i<count($comments);$i++){
			$comments[$i]['created']=$this->timeago(strtotime($comments[$i]['created']));
		}

		$this->_view->assign('titulo',$post['titulo'].' | Manuales Docs. ZeusIntranet V1');		
		$this->_view->assign('post',$post);
		$this->_view->assign('comments',$comments);
		$this->_view->assign('lastPost',$this->_post->select(5));
		$this->_view->assign('menuCategory',$this->_category->select());
		$this->_view->renderizar('index');
	}

	public function exportPdf($idpost=0){		
		$idpost=$this->filtrarInt($idpost);
		if($idpost!=0){
			$post=$this->_post->getId($idpost);
			if(!isset($post['idpost'])){
				$this->redireccionar();
			}
			$this->getLibrary('dompdf/dompdf_config.inc');
			$html =utf8_decode($post['content']);
			$dompdf = new DOMPDF();
			$dompdf->load_html($html);
			$dompdf->set_paper('a4', 'portrait');
			$dompdf->render();
			$dompdf->stream($post['titulo'].".pdf", array("Attachment" => true));
		}else{
			$this->redireccionar();
		}
		
	}

	public function nuevo(){	
		$this->userProhibited('Lector');

		$this->_view->setJs(array('nuevo'));
		
		$this->_view->assign('titulo','Nuevo Manual | Manuales Docs. ZeusIntranet V1');
		$this->_view->assign('comments',$comments);
		$this->_view->assign('lastPost',$this->_post->select(5));
		$this->_view->assign('menuCategory',$this->_category->select());
		$this->_view->renderizar('nuevo');
	}

	//post -
	public function add(){
		/*if(!$this->getSql('titulo') &&  !$this->getSql('subtitulo') && !$this->getInt('categoria') && !$this->getPostParam('contenido') && !$this->getPostParam('tags') ){
			exit;
		}*/
		$idusuario=Session::get('idusers');
		$plug=$this->makeUrl($this->getSql('titulo'));
		$this->_post->add($this->getSql('titulo'),$this->getSql('subtitulo'),$plug,$this->getInt('categoria'),$this->getPostParam('contenido'),$this->getPostParam('tags'),$idusuario);
		$this->redireccionar();
	}

	public function delete($idpost){
		$this->userProhibited('Lector');

		$idpost=$this->filtrarInt($idpost);
		if($idpost!=0){
			$this->_post->delete($idpost);
		}		
		$this->redireccionar();
	}

	public function edit($idpost){
		$this->userProhibited('Lector');
		
		$idpost=$this->filtrarInt($idpost);
		if($idpost!=0){
			$this->_view->setJs(array('nuevo'));
			$post=$this->_post->getId($idpost);
			if(!isset($post['idpost'])){
				$this->redireccionar();
			}
			$this->_view->assign('titulo','Editando Manual | Manuales Docs. ZeusIntranet V1');		
			$this->_view->assign('post',$post);
			$this->_view->assign('lastPost',$this->_post->select(5));
			$this->_view->assign('menuCategory',$this->_category->select());
			$this->_view->renderizar('edit');
		}else{
			$this->redireccionar();
		}	
		
	}

	public function update(){
		if(!$this->getInt('idpost')){			
			$this->redireccionar();
			exit;
		}

		$plug=$this->makeUrl($this->getSql('titulo'));
		$this->_post->update($this->getSql('titulo'),$this->getPostParam('subtitulo'),$plug,$this->getInt('categoria'),$this->getPostParam('contenido'),$this->getPostParam('tags'),$this->getInt('idpost'));
		$this->redireccionar('post/'.$plug."-".$this->getInt('idpost'));
	}


	public function addComment(){
		if(!$this->getSql('name') &&  !$this->getSql('comment') && !$this->getInt('idpost')){			
			exit;
		}
		$this->_comment->add($this->getSql('name'),$this->getSql('comment'),$this->getInt('idpost'));
	}

	public function like(){
		if(!$this->getInt('idpost')){
			exit;
		}
		$this->_post->like($this->getInt('idpost'));
	}

	public function dislike(){
		if(!$this->getInt('idpost')){
			exit;
		}
		$this->_post->dislike($this->getInt('idpost'));
	}

	/**
	 * Actualiza el manual con los cambios echos por ajax
	 * @return [type] [description]
	 */
	public function updateManual(){
		if(!$this->getInt('idpost')){
			exit;
		}
		$this->_post->setContent($this->getPostParam('content'),$this->getInt('idpost'));
	}

	public function uploadFile(){
		$dir = ROOT.'tmp/files/';
		move_uploaded_file($_FILES['file']['tmp_name'], $dir.$_FILES['file']['name']);

		$array = array(
		    'filelink' => SITE_URL.'tmp/files/'.$_FILES['file']['name'],
		    'filename' => $_FILES['file']['name']
		);

		echo stripslashes(json_encode($array));
	}

	/**
	 * Cuando se copia una imagen al editor de texto se sube al sitio
	 * @return [json] [devuelve la ruta de la imagen]
	 */
	public function uploadCopyImage(){
		$dir = ROOT.'tmp/img/';
		$contentType = $_POST['contentType'];
		$data = base64_decode($_POST['data']);

		$filename = md5(date('YmdHis')).'.png';
		$file = $dir.$filename;

		file_put_contents($file, $data);

		echo json_encode(array('filelink' => SITE_URL.'tmp/img/'.$filename));
	}
	/**
	 * Sube las imagenes echas en el editor
	 * @return [type] [description]
	 */
	public function uploadImage(){
		$dir = ROOT.'tmp/img/';

		$_FILES['file']['type'] = strtolower($_FILES['file']['type']);

		if ($_FILES['file']['type'] == 'image/png'
		|| $_FILES['file']['type'] == 'image/jpg'
		|| $_FILES['file']['type'] == 'image/bmp'
		|| $_FILES['file']['type'] == 'image/gif'
		|| $_FILES['file']['type'] == 'image/jpeg'
		|| $_FILES['file']['type'] == 'image/pjpeg')
		{
		    // setting file's mysterious name
		    $name_img=md5(date('YmdHis')).'.jpg';
		    $file = $dir.$name_img;

		    // copying
		    move_uploaded_file($_FILES['file']['tmp_name'], $file);

		    // displaying file
		    $array = array(
		        'filelink' => SITE_URL.'tmp/img/'.$name_img
		    );

		    echo (json_encode($array));
		}else{
			$array = array(
		        'error' => 'Hubo un error al cargar la imagen'
		    );
			echo stripslashes(json_encode($array));
		}
	}

}
?>