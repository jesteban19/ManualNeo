
<div class="padd whity content">
  <!-- Main Content Starts Here -->
  <!-- Content should be encloased inside div with the class "posts" -->
  <div class="posts">
    <!-- Each entry should be enclosed inside div with the class "entry" -->
    {foreach item=row from=$post}
      <div class="entry">
        <h2 class="title"><i class="fa fa-book"></i> <a href="{$_layoutParams.base_url}post/{$row.plug}-{$row.idpost}">{$row.titulo}</a></h2>
        {assign var=tags value=","|explode:$row.tags} 

        <p class="meta"><i class="fa fa-clock-o"></i>&nbsp;{$row.created} - <i class="fa fa-user"></i>&nbsp;{$row.usuario} - 

        &nbsp;<i class="fa fa-tags"></i>
        {foreach item=r from=$tags}
           <a href="#">{$r}</a>,
        {/foreach}
          - &nbsp;<i class="fa fa-eye"></i>{$row.views}
          - &nbsp;<i class="fa fa-thumbs-o-up"></i>{$row.like}
          - &nbsp;<i class="fa fa-thumbs-o-down"></i>{$row.dislike}
        </p>
        
        <!--<p class="thumbnail"><img src="{$_layoutParams.ruta_img}photos/s2.jpg" alt="" class="img-responsive" /></p>-->

        <p>{$row.sub_title}</p>
        <p><a class="btn btn-default" href="{$_layoutParams.base_url}post/{$row.plug}-{$row.idpost}"> <i class="fa fa-arrow-right"></i> Leer Manual...</a></p>
      </div>
    {/foreach}
    
    <!-- Navigation links -->
    {if !isset($blank)}
    <ul class="pager">
      {if $page!=1}
      <li class="previous">
        <a href="{$_layoutParams.base_url}index/{$page-1}">&larr; Atras</a>
      </li>
      {/if}
      
      <li class="next">
        <a href="{$_layoutParams.base_url}index/{$page+1}">Siguiente &rarr;</a>
      </li>
    </ul>
    {/if}
  </div><!-- end posts -->
  <!-- Main Content Ends Here -->
</div>


<div class="mobily hidden-lg">

</div>