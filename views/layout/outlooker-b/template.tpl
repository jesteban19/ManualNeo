<!DOCTYPE html>
<html lang="es">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  <meta charset="utf-8">
  <title>{$titulo|default:'Sin titulo'}</title>
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="keywords" content="">

  <!-- HTML5 Support for IE -->
  <!--[if lt IE 9]>
  <script src="js/html5shim.js"></script>
  <![endif]-->
  
  <!-- Google Web Font -->
  <!--<link href='http://fonts.googleapis.com/css?family=Dosis:200,400,600' rel='stylesheet' type='text/css'>-->
  
  <!-- Stylesheets -->
  <link href="{$_layoutParams.ruta_css}bootstrap.css" rel="stylesheet">
  <link rel="stylesheet" href="{$_layoutParams.ruta_css}font-awesome.css">
  

  <!--[if IE 7]>
  <link rel="stylesheet" href="{$_layoutParams.ruta_css}font-awesome-ie7.css">
  <![endif]-->		

  <link href="{$_layoutParams.ruta_css}ddlevelsmenu-base.css" rel="stylesheet">
  <link href="{$_layoutParams.ruta_css}ddlevelsmenu-topbar.css" rel="stylesheet">
  <link href="{$_layoutParams.ruta_css}ui.totop.css" rel="stylesheet">
  <link href="{$_layoutParams.ruta_css}style.css" rel="stylesheet">
  <!-- Change the template color below. Supported colors blue,red and green. -->
  <link href="{$_layoutParams.ruta_css}blue.css" rel="stylesheet">
  
  <link href="{$_layoutParams.ruta_css}flexslider.css" rel="stylesheet">
  <link href="{$_layoutParams.ruta_css}prettyPhoto.css" rel="stylesheet">
  <!--<link rel="stylesheet" type="text/css" href="{$_layoutParams.ruta_css}bootstrap-wysihtml5-0.0.2.css">-->
  <link rel="stylesheet" href="{$_layoutParams.ruta_css}redactor.css">
  <link rel="stylesheet" type="text/css" href="{$_layoutParams.ruta_css}tagmanager.css">
  <!-- Favicon -->
  <link rel="shortcut icon" href="{$_layoutParams.ruta_img}favicon.ico">
</head>

<body>

  <!-- Sliding share panel. Click "Share it" to see. -->

  <div class="sharepanel">
    <div class="container">
      <div class="row">
        <div class="col-md-8">
          <div class="padd spara"> 
            <!-- Small para -->
            <p>Comparte con tus redes sociales </p>
          </div>
        </div>
        <div class="col-md-4">
          <div class="padd">
            <div class="social">
              <!-- Social media icons. Repalce # with your profile links -->
              <a href="#"><img src="{$_layoutParams.ruta_img}facebook.png" alt="" width="40"/></a>
              <a href="#"><img src="{$_layoutParams.ruta_img}twitter.png" alt="" width="40"/></a>
              <a href="#"><img src="{$_layoutParams.ruta_img}linkedin.png" alt="" width="40"/></a>
              <a href="#"><img src="{$_layoutParams.ruta_img}googleplus.png" alt="" width="40"/></a>
              <a href="#"><img src="{$_layoutParams.ruta_img}rss.png" alt="" width="40"/></a>
            </div>
          </div>
        </div>
      </div>
      <div class="clearfix"></div>
    </div>
  </div>

  <!-- Header -->

  <div class="fixedbar">
    <div class="container">
      <div class="row">
        <div class="col-md-12">
          <div class="logo">
            <div class="pull-left">
              <!-- Logo with font awesome icon (icon-camera-retro). Replace it with your logo. Replace # with your site link -->
              <h1><a href="{$_layoutParams.base_url}"><i class="fa fa-try"></i> {$_layoutParams.config.app_name}</a></h1>
            </div>
            <div class="navi">
              <!-- Navigation Starts Here -->
              <div class="pull-left">
                <div id="ddtopmenubar" class="mattblackmenu">
                  <!-- Main navigation -->
                  <ul>
                    <!-- Main navigation -->
                    <li><a href="blog.html" rel="ddsubmenu2">Manuales</a>
                      <!-- Sub Navigation -->
                      <ul id="ddsubmenu2" class="ddsubmenustyle">
                        {foreach item=row from=$menuCategory}
                        <li><a href="{$_layoutParams.base_url}category/{$row.name}">{$row.name}</a></li>
                        {/foreach}
                      </ul>
                    </li>
                    {if Session::get('privilegio')!='Lector'}
                    <li><a href="{$_layoutParams.base_url}post/nuevo">Nuevo Manual !</a></li>
                    {/if}
                    <li><a href="#"><i class="fa fa-user"></i> {Session::get('usuario')} |  <i class="fa fa-key"></i> {Session::get('privilegio')}</a></li>
                    <li><a href="{$_layoutParams.base_url}login/logout"><i class="fa fa-home"></i> Salir</a></li>
                  </ul>
                </div>
              </div>
              <!-- Navigation Ends Here -->
            </div>
          </div>
          <div class="share">
            <div class="pull-right">
              <!-- Share it link for slider -->
              <p><a href="#" class="open"><span class="hidden-xs">Comparte esto! <i class="fa fa-share-square"></i></span></a></p>
            </div>
          </div>  
        </div>
        <div class="clearfix"></div>
      </div>
    </div>
  </div>

  <!-- Main content -->

  <div class="main">
    <div class="container">
      <div class="row">
        <div class="col-md-12 hidden-lg">
          <div class="padd"><div class="navis"></div></div>
        </div>
        <div class="visible-lg">
          <div class="col-md-3 sidey">
            <!-- Sidebar Starts Here -->
            <div class="padd sidebar">
              <!-- Each sidebar should be enclosed inside "widget class" -->
              <!-- 1st widget -->
              <div class="widget">
                <!-- Sidebar heading enclosed inside h3. Don't forget to add the class "matopen". -->
                <h3 class="matopen">Buscar</h3>
                <!-- Sidebar content should be enclosed inside div with the class "matter". -->
                <div class="matter">
                  <!-- Search form -->
                  <form class="form-inline" action="{$_layoutParams.base_url}index/search" method="post">
                    <input type="text" {if isset($search)} value="{$search}" {/if} name="search" class="form-control search-form" autocomplete="off" placeholder="Titulo,formulario,acci&oacute;n...">
                  </form>
                </div>
              </div>
              <!-- 2nd widget -->
              <div class="widget">
                <h3 class="matopen">Categorias</h3>
                <div class="matter">
                 <ul>
                   {foreach item=row from=$menuCategory}
                   <li><a href="{$_layoutParams.base_url}category/{$row.name}">{$row.name}</a></li>             
                   {/foreach}
                 </ul>
               </div>
             </div>
             <!-- 3rd widget -->
             <div class="widget">
              <h3 class="matopen">Manuales Recientes</h3>
              <div class="matter">
                <ul>
                  {foreach item=row from=$lastPost}
                  <li><a href="{$_layoutParams.base_url}post/{$row.plug}-{$row.idpost}">{$row.titulo}</a></li>
                  {/foreach}         
                </ul>
              </div>
            </div>
          </div>
          <!-- Sidebar Ends Here -->
        </div>
      </div>
      <div class="col-md-9">
       {include file=$_contenido}
       <!-- contenedor de la pagina -->
     </div>
     
     <div class="mobily hidden-lg">
      
     </div>
   </div>
 </div>
</div> 

<!-- Foot -->

<!-- Three column footer -->

<div class="foot">
  <div class="container">
    <div class="row">
      <div class="col-md-4">
        <div class="padd">
          <!-- Add class "widget" -->
          <div class="widget">
           <!-- Title -->
           <h3>Morbi dictum nibh gravida</h3>
           <!-- Content -->
           <!-- Below is the blockquote -->
           <blockquote>
             <p>Fusce imperdiet, risus eget viverra faucibus, diam mi vestibulum libero, ut vestibulum tellus magna nec enim. Nunc dapibus varius interdum. Phasellus at lorem ut lectus fermentum convallis. Sed diam nisi, pulvinar vitae molestie hendrerit, venenatis eget mauris. Integer porta erat ac eros porta ultrices. </p>
             <!-- Author information -->
             <small>Ashok</small>
           </blockquote>
         </div>
       </div>
     </div>
     <div class="col-md-4">
      <div class="padd">
        <div class="widget">
          <h3>Sed a interdum mauris</h3>
          <ul>
            <li><a href="#">Sed eu leo orci, condimentum gravida metus</a></li>
            <li><a href="#">Etiam at nulla ipsum, in rhoncus purus</a></li>
            <li><a href="#">Fusce vel magna faucibus felis dapibus facilisis</a></li>
            <li><a href="#">Vivamus scelerisque dui in massa</a></li>
            <li><a href="#">Pellentesque eget adipiscing dui semper</a></li>
          </ul>
        </div>
      </div>
    </div>
    <div class="col-md-4">
      <div class="padd">
        <div class="widget">
          <h3>Service</h3>
          <ul>
            <li><a href="#">Sed eu leo gravida metus</a></li>
            <li><a href="#">Etiam at rhoncus purus</a></li>
            <li><a href="#">Fusce vel dapibus facilisis</a></li>
            <li><a href="#">Vivamus scelerisque dui in massa</a></li>
            <li><a href="#">Pellentesque eget  dui semper</a></li>
          </ul>
        </div>
      </div>
    </div>
  </div>
</div>
</div>

<!-- Footer -->
<footer>
  <div class="container">
    <div class="row">
      <div class="col-md-12">
        <!-- Copyright information -->
        <div class="fpadd">Copyright &copy; 2013 - <a href="{$_layoutParams.config.app_name}">{$_layoutParams.config.app_name}</a> / <a href="#">Disclaimer</a> / <a href="#">Privacy Policy</a></div>
      </div>
    </div>
    <div class="clearfix"></div>
  </div>
</footer>		

<!-- JS -->
<script src="{$_layoutParams.ruta_js}jquery.js"></script>
<script src="{$_layoutParams.ruta_js}easing.js"></script>
<script src="{$_layoutParams.ruta_js}wysihtml5-0.3.0.js"></script>
<script src="{$_layoutParams.ruta_js}bootstrap.js"></script>
<script src="{$_layoutParams.ruta_js}bootstrap-typehead.js"></script>
<script type="text/javascript" src="{$_layoutParams.ruta_js}jquery.color.js"></script>
<script type="text/javascript" src="{$_layoutParams.ruta_js}bootstrap-tags.js"></script>
<script type="text/javascript" src="{$_layoutParams.ruta_js}ddlevelsmenu.js"></script>
<script type="text/javascript" src="{$_layoutParams.ruta_js}flexslider.js"></script>
<script type="text/javascript" src="{$_layoutParams.ruta_js}isotope.js"></script>
<script type="text/javascript" src="{$_layoutParams.ruta_js}jquery.prettyPhoto.js"></script>
<script type="text/javascript" src="{$_layoutParams.ruta_js}jquery.ui.totop.js"></script>
<script type="text/javascript" src="{$_layoutParams.ruta_js}validate/jquery.validate.min.js"></script>
<!--<script type="text/javascript" src="{$_layoutParams.ruta_js}bootstrap-wysihtml5-0.0.2.js"></script>-->
<script type="text/javascript" src="{$_layoutParams.ruta_js}redactor/redactor.js"></script>
<script type="text/javascript" src="{$_layoutParams.ruta_js}redactor/plugins/plugin.neo.js"></script>
<script type="text/javascript" src="{$_layoutParams.ruta_js}redactor/langs/es.js"></script>
<script type="text/javascript" src="{$_layoutParams.ruta_js}custom.js"></script>
<script type="text/javascript">
  var BASE_URL="{$_layoutParams.base_url}";
  var SITE_URL="{$_layoutParams.site_url}";
</script>

<!-- load Js -->
{if isset($_layoutParams.js) && count($_layoutParams.js)}
{foreach item=js from=$_layoutParams.js}
<script type="text/javascript" src="{$js}"></script>
{/foreach}
{/if}

<!-- load Plugins -->
{if isset($_layoutParams.jsPlug) && count($_layoutParams.jsPlug)}
{foreach item=js from=$_layoutParams.jsPlug}
<script type="text/javascript" src="{$js}"></script>
{/foreach}
{/if}

</body>
</html>