$(function(){
	$("#btn-like").on('click',function(){
		$btn=$(this);
		$btn.fadeOut('fast');
		$.post(BASE_URL+'post/like',{'idpost' : $(this).data('idpost') },
		 function(data) {
		 	$btn.fadeIn('fast');
		 	$btn.addClass('disabled');		 	
		});
	});

	$("#btn-dislike").on('click',function(){
		$btn=$(this);
		$btn.fadeOut('fast');
		$.post(BASE_URL+'post/dislike',{'idpost' : $(this).data('idpost') },
		 function(data) {
		 	$btn.fadeIn('fast');
		 	$btn.addClass('disabled');		 	
		});
	});

	$("#btn-send-comment").on('click',function(e){
		e.preventDefault();
		$btn=$(this);
		$btn.fadeOut('fast');
		$.post(BASE_URL+'post/addComment', 
		 $("#frm_comentario").serialize()
		 ,
		 function(data) {
		 	$("#frm_comentario").find('textarea').val('');
		 	$btn.fadeIn('fast');
		 	$btn.addClass('disabled');	
		 	$("#frm_comentario").before('<div class="alert alert-success">Comentario publicado correctamente!</div>');
		});

	});

	$("#btn-editar").on('click',function(e){
		$("#btn-save").show();
		$("#btn-delete").hide();
		$(this).hide();
		$("#content_post").redactor({
			plugins : ['btn_success'],
			linkNofollow: true,
			linebreaks : true,
        	lang : 'es',
        	focus : true,
			tabSpaces: 4,
			imageUpload : BASE_URL+'post/uploadImage'
    	});
	});

	$("#btn-save").on('click',function(e){		
		var idpost=$(this).data('idpost');
		$("#btn-save").hide();
		var html = $('#content_post').redactor('get');
		$.post(BASE_URL+'post/updateManual',
			{ 'content' : html, 'idpost' : idpost }
			, function(data) {				
				//show buttons
				$("#btn-delete").show();
				$("#btn-editar").show();
				// destroy editor
	    		$('#content_post').redactor('destroy').fadeOut().fadeIn();
		});
		
	});

	$("#btn-delete").on('click',function(e){
		var idpost=$(this).data('idpost');
		if(confirm('Esta seguro(a) de eliminar el manual?')){
			$(this).hide();			
		}else{
			e.preventDefault();			
		}
	});
})