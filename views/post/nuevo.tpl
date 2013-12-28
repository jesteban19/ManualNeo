<div class="whity content">
  <!-- Main Content Starts Here -->
  <!-- Content should be encloased inside div with the class "posts" -->
  <div class="posts">
    <!-- Each entry should be enclosed inside div with the class "entry" -->
    <div class="entry">
     <div class="padd">
       <!-- Contact Page title -->
       <h2>Nuevo Manual</h2>
       <!-- Contact Page Para -->
       <p>Agregue un nuevo manual para el sistema ZeusIntranet , puede agregar videos , imagenes ,textos,etc.</p>
     </div>

     <div class="row">
       <div class="col-md-12">
        <div class="padd">
         <div class="co-form">
           <form class="form-horizontal" id="frm-entrada" action="{$_layoutParams.base_url}post/add" method="post">
             <fieldset>
               <div class="form-group">
                 <label class="control-label col-md-3"  for="titutlo">Titulo</label>
                 <div class="col-md-9">
                   <input type="text" class="form-control" name="titulo" maxlength="200" id="titulo">
                 </div>
               </div>
               <div class="form-group">
                 <label class="control-label col-md-3" for="email">Descripci&oacute;n</label>
                 <div class="col-md-9">
                   <input type="text" class="form-control" name="subtitulo" maxlength="200" id="email">
                 </div>
               </div>
                 <div class="form-group">
                 <label class="control-label col-md-3" for="categoria">Categoria</label>
                 <div class="col-md-9">
                   <select name="categoria" id="categoria" class="form-control">
                    {foreach item=row from=$menuCategory}
                      <option value="{$row.idcategory}" {if $post.idcategory==$row.idcategory}selected{/if}>{$row.name}</option>
                    {/foreach}
                   </select>
                 </div>
               </div>
               <div class="form-group">
                 <label class="control-label col-md-3" for="comment">Contenido</label>
                 <div class="col-md-9">
                   <textarea class="form-control" name="contenido" id="contenido" rows="10"></textarea>
                 </div>
               </div>
                <div class="form-group">
                 <label class="control-label col-md-3" for="tags">Tags</label>
                 <div class="col-md-9">
                   <input type="text" class="form-control tm-input" placeholder="Ingrese Tags..." autocomplete="off" id="tags" />
                   <input type="hidden" name="tags"  id="hidden-tags" />
                 </div>
               </div>
               <div class="form-group">
                <div class="col-md-offset-3 col-md-9">
                 <button type="submit" class="btn btn-success"><i class="fa fa-check"></i> Publicar Manual</button>
               </div>
             </div>
           </fieldset>
         </form>
       </div>
     </div>
   </div>

</div>
</div>
</div>
<!-- Main Content Ends Here -->
</div>