$(function () {
	//$('#contenido').wysihtml5();
	$('#contenido').redactor({
		lang : 'es',
		tabSpaces: 4,
        fileUpload : BASE_URL+'post/uploadFile',
		imageUpload : BASE_URL+'post/uploadImage',
        clipboardUploadUrl : BASE_URL+'post/uploadCopyImage',
		buttonsAdd: ['|', 'pre'],
        activeButtonsAdd: {
            pre: 'pre'
        },
        buttonsCustom: {
            pre: {
                title: 'Code',
                callback: function()
                {
                    this.formatBlocks('pre');
                }
            }
        }
	});
    $("#btn-Line").click(function(e){
        e.preventDefault();
       $('#contenido').redactor('inlineFormat', 'span');
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
});