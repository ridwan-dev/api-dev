<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">

<!-- Global site tag (gtag.js) - Google Analytics -->
<script async src="https://www.googletagmanager.com/gtag/js?id=UA-114578183-3"></script>
<script>
  window.dataLayer = window.dataLayer || [];
  function gtag(){dataLayer.push(arguments);}
  gtag('js', new Date());

  gtag('config', 'UA-114578183-3');
</script>

    <title>CRMIS</title>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/2.2.3/jquery.min.js" integrity="sha384-I6F5OKECLVtK/BL+8iSLDEHowSAfUo76ZL9+kGAgTRdiByINKJaqTPH/QVNS1VDb" crossorigin="anonymous"></script>
    
    <!-- Fonts -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css" integrity="sha384-XdYbMnZ/QjLh6iI4ogqCTaIjrFk87ip+ekIjefZch0Y+PvJ8CDYtEs1ipDmPorQ+" crossorigin="anonymous">
    <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700">

    <!-- Styles -->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/css/bootstrap.min.css" integrity="sha384-1q8mTJOASx8j1Au+a5WDVnPi2lkFfwwEAa8hDDdjZlpLegxhjVME1fgjWPGmkzs7" crossorigin="anonymous">
    <link rel="stylesheet" href="{{ url('css/crmis.css') }}"/>
    <link rel="stylesheet" href="{{ url('css/col-same-height.css') }}"/>
    {{-- <link href="{{ elixir('css/app.css') }}" rel="stylesheet"> --}}

    <!-- AmCharts -->
    <script src="{{ url('extras/amcharts/amcharts.js') }}"></script>
    <script src="{{ url('extras/amcharts/serial.js') }}"></script>
    <script src="{{ url('extras/amcharts/pie.js') }}"></script>
    <script src="{{ url('extras/amcharts/radar.js') }}"></script>
    <script src="{{ url('extras/amcharts/plugins/export/export.min.js') }}"></script>
    <script src="{{ url('extras/amcharts/plugins/dataloader/dataloader.min.js') }}"></script>
    <link rel="stylesheet" href="{{ url('extras/amcharts/plugins/export/export.css') }}" type="text/css" media="all" />
    <script src="{{ url('extras/amcharts/themes/black.js') }} "></script>

    <style>
        body {
            font-family: 'Lato';
        }

        .fa-btn {
            margin-right: 6px;
        }
    </style>
</head>
<body class="theme-bg" id="app-layout">
    <nav class="navbar navbar-default navbar-static-top">
        <div class="container">
            <div class="navbar-header">

                <!-- Collapsed Hamburger -->
                <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#app-navbar-collapse">
                    <span class="sr-only">Toggle Navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>

                <!-- Branding Image -->
                <a class="navbar-brand" href="{{ url('/') }}">
                    CRMIS
                </a>
            </div>

            <div class="collapse navbar-collapse" id="app-navbar-collapse">
                <!-- Right Side Of Navbar -->
                <ul class="nav navbar-nav navbar-right">
                    <!-- Authentication Links -->
                    @if (Auth::guest())
                        
                    @else
                        <li class="dropdown">
                            <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">
                                {{ Auth::user()->name }} <span class="caret"></span>
                            </a>

                            <ul class="dropdown-menu" role="menu">
                                <li><a href="{{ url('/logout') }}"><i class="fa fa-btn fa-sign-out"></i>Logout</a></li>
                            </ul>
                        </li>
                    @endif
                <?php
                if(Session::get('active_lang') != 'id') {
                  $lang_url = route('set_lang', ['id'=>'id']);
                  $lang_txt = 'ID';
                }else{
                  $lang_url = route('set_lang', ['id'=>'en']);
                  $lang_txt = 'EN';
                }
                ?>
          <li><a href="#" onclick="window.location.href='<?=$lang_url;?>'">{{ $lang_txt }}</a></li>
                </ul>
            </div>
        </div>
    </nav>

    @yield('content')

    <div class="footer">
      <div class="container">
        <div class="row">
          <div class="col-md-10 col-md-offset-1">
            <span>CRMIS - P2O LIPI © 2016</span>
          </div>
        </div>
      </div>
    </div>

    <!-- Maps -->
    <script src="https://maps.googleapis.com/maps/api/js?key=AIzaSyBAl4y-7WWFw9VfR8jYDlUX4Kj5i5GyTSs&callback=initMap" async defer></script>

    <!-- JavaScripts -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/twitter-bootstrap/3.3.6/js/bootstrap.min.js" integrity="sha384-0mSbJDEHialfmuBBQP6A4Qrprq5OVfW37PRR3j5ELqxss1yVqOtnepnHVP9aJ7xS" crossorigin="anonymous"></script>
    <script src="{{ url('js/app.js') }}" type="text/javascript"></script>

</body>
</html>
