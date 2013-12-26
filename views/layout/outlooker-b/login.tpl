
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="utf-8">
    <title>Login - ZeusIntranet Docs</title>
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta name="description" content="Zesintranet Docs. Manuales">
    <meta name="author" content="Joseph Esteban (esteban.programador@gmail.com)">

    <!-- Le styles -->
    <link href="{$_layoutParams.ruta_css}bootstrap2.min.css" rel="stylesheet">
    <link href="{$_layoutParams.ruta_css}bootstrap-responsive.min.css" rel="stylesheet">

    <link rel="stylesheet" href="{$_layoutParams.ruta_css}typica-login.css">

    <!-- Le HTML5 shim, for IE6-8 support of HTML5 elements -->
    <!--[if lt IE 9]>
      <script src="http://html5shim.googlecode.com/svn/trunk/html5.js"></script>
    <![endif]-->

    <!-- Le favicon -->
    <link rel="shortcut icon" href="{$_layoutParams.ruta_img}favicon.ico">

  </head>

  <body>

    <div class="navbar navbar-fixed-top">
      <div class="navbar-inner">
        <div class="container">
          <a class="btn btn-navbar" data-toggle="collapse" data-target=".nav-collapse">
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
            <span class="icon-bar"></span>
          </a>
          <a class="brand" href="{$_layoutParams.base_url}login"><img src="{$_layoutParams.ruta_img}zeus-logo.svg" alt="ZeusIntranet Docs !" style="position: relative;
    bottom: 25px;" height="40px" width="200px"></a>
        </div>
      </div>
    </div>

    <div class="container">

        <div id="login-wraper">
            <form class="form login-form" action="login/login" method="post">
                <legend>Iniciar sesión en <span class="blue">ZI Docs</span></legend>
            
                <div class="body">
                    <label>Usuario</label>
                    <input type="text" name="usuario" autocomplete="off">
                    
                    <label>Contraseña</label>
                    <input type="password" name="password">
                </div>
            
                <div class="footer">
                    <label class="checkbox inline">
                        <input type="checkbox" id="inlineCheckbox1" value="option1"> Recordarme
                    </label>
                                
                    <button type="submit" class="btn btn-success">Ingresar</button>
                </div>
            
            </form>
        </div>

    </div>

    <footer class="white navbar-fixed-bottom">
      ¿No tienes una cuenta todavía? <a href="http://helpdesk.zeusintranet.com" target="_blank" class="btn btn-black">Pidelo</a>
    </footer>


    <!-- Le javascript
    ================================================== -->
    <!-- Placed at the end of the document so the pages load faster -->
    
    <script src="{$_layoutParams.ruta_js}jquery.js"></script>
    <script src="{$_layoutParams.ruta_js}bootstrap.js"></script>
    <script src="{$_layoutParams.ruta_js}login/backstretch.min.js"></script>
    <script src="{$_layoutParams.ruta_js}login/typica-login.js"></script>
    <script type="text/javascript">
        var BASE_URL="{$_layoutParams.base_url}";
        var SITE_URL="{$_layoutParams.site_url}";
        var RUTA_IMG="{$_layoutParams.ruta_img}";
    </script>

  </body>
</html>