<div class="padd whity content">
  <!-- Main Content Starts Here -->
  <!-- Content should be encloased inside div with the class "posts" -->
  <div class="posts">
   <!-- Each entry should be enclosed inside div with the class "entry" -->

   <div class="entry">
    <h2 class="title"><i class="fa fa-book"></i> <a href="{$_layoutParams.base_url}post/{$post.plug}-{$post.idpost}">{$post.titulo}</a></h2>
    {assign var=tags value=","|explode:$post.tags} 

    <p class="meta"><i class="fa fa-clock-o"></i>&nbsp;{$post.created} - <i class="fa fa-user"></i>&nbsp;{$post.usuario} - 

      &nbsp;<i class="fa fa-tags"></i>
      {foreach item=r from=$tags}
      <code><a href="#">{$r}</a></code>
      {/foreach}

      - &nbsp;<i class="fa fa-eye"></i>{$post.views}
      - &nbsp;<i class="fa fa-thumbs-o-up"></i>{$post.like}
      - &nbsp;<i class="fa fa-thumbs-o-down"></i>{$post.dislike}
    </p>

    <br/>
    
    <div id="content_post">
      {$post.content}
    </div>
    <br/>
    <hr/>
    <!-- buttons ,like dislike etc. -->
    
    <div class="panel panel-default">
      <div class="panel-heading">Botones Sociales</div>
      <div class="panel-body">
       
        <button class="btn btn-success" id="btn-like" data-idpost="{$post.idpost}"><i class="fa fa-thumbs-o-up"></i> Ayuda!</button>
        <button class="btn btn-default"  id="btn-dislike" data-idpost="{$post.idpost}"><i class="fa fa-thumbs-o-down"></i> No me ayuda</button>
        {if Session::get('privilegio')!='Lector'}
        <a href="{$_layoutParams.base_url}post/exportPdf/{$post.idpost}" class="btn btn-primary"><i class="fa fa-paperclip"></i> Exportar PDF</a>
        <button class="btn btn-warning" id="btn-editar"><i class="fa fa-edit"></i> Edici&oacute;n R&aacute;pida</button>        
        <a class="btn btn-info" href="{$_layoutParams.base_url}post/edit/{$post.idpost}"><i class="fa fa-cog"></i> Editar</a>
        <button class="btn btn-primary" id="btn-save" data-idpost="{$post.idpost}" style="display:none;"><i class="fa fa-check"></i> Guardar</button>
        <a class="btn btn-danger" id="btn-delete" data-idpost="{$post.idpost}" href="{$_layoutParams.base_url}post/delete/{$post.idpost}"><i class="fa fa-times"></i> Eliminar</a>
        {/if}
      </div>
    </div>

  </div>

  <div class="comments">
    <div class="comment-list">
      <h3>{count($comments)} Comentarios</h3>
      {foreach item=row from=$comments}      
      <div class="comment-entry">
       <div class="c-author"><a href="#">{$row.autor}</a></div>
       <div class="c-meta">Comentado <i class="fa fa-clock-o"></i>{$row.created}</div>
       <div class="comment">{$row.content}</div>
     </div>
     {/foreach}
   </div>  
 </div>


 <div class="make-comment">
  <h3>Dejar Comentario</h3>
  <hr>
  <div class="c-form">
    <form class="form-horizontal" id="frm_comentario">
      <fieldset>
        <div class="form-group">
          <label class="control-label col-md-2" for="name">Usuario</label>
          <div class="col-md-7">
            <input type="text" class="form-control" id="name" value="{Session::get('usuario')}" disabled="">
            <input type="hidden" value="{Session::get('usuario')}" name="name">
            <input type="hidden" value="{$post.idpost}" name="idpost">
          </div>
        </div>

        <div class="form-group">
          <label class="control-label col-md-2" for="comment">Comentario</label>
          <div class="col-md-7">
            <textarea class="form-control" id="comment" name="comment" rows="5" placeholder="Escriba un comentario..."></textarea>
          </div>
        </div>
        <div class="form-group">
         <div class="col-md-offset-2 col-md-7">
          <button id="btn-send-comment" class="btn btn-default">Enviar Comentario</button>
        </div>
      </div>
    </fieldset>
  </form>
</div>
</div>
</div>
<!-- Navigation links -->
<ul class="pager">
  <li class="previous">
    <a href="{$_layoutParams.base_url}">← Regresar</a>
  </li>
</ul>
</div>
