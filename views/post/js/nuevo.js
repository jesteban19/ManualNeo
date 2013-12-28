$(function () {
	//$('#contenido').wysihtml5();
	$('#contenido').redactor({
        plugins : ['btn_success','fullscreen'],
        linebreaks : true,
		lang : 'es',
        linkNofollow: true,
		tabSpaces: 4,
        fileUpload : BASE_URL+'post/uploadFile',
		imageUpload : BASE_URL+'post/uploadImage',
        clipboardUploadUrl : BASE_URL+'post/uploadCopyImage'
	});

    //validar
    $("#frm-entrada").validate({
        rules: {
            titulo : "required",
            subtitulo : "required",
            categoria : "required",
        },
        messages: {
            titulo : "Necesita escribir un titulo.",
            subtitulo : "Necesita escribir una descripci&oacute;n"
        }
    });

    $(".tm-input").tagsManager({
        tagClass : 'tm-tag tm-tag-info',
        tagCloseIcon : '×',
        output : "#hidden-tags"
    });

});