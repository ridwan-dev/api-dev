<!doctype html>
<html class="no-js" lang="en">

    <head>
        <!-- META DATA -->
        <meta charset="utf-8">
        <meta http-equiv="X-UA-Compatible" content="IE=edge">
        <meta name="viewport" content="width=device-width, initial-scale=1">
        <!-- The above 3 meta tags *must* come first in the head; any other head content must come *after* these tags -->
    
    

        <!--font-family-->
    <link href="https://fonts.googleapis.com/css?family=Playfair+Display:400,400i,700,700i,900,900i" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css?family=Poppins:100,200,300,400,500,600,700,800,900" rel="stylesheet">
    
    <link href="https://fonts.googleapis.com/css?family=Lato:100,300,400,700,900" rel="stylesheet">
    
        <!-- TITLE OF SITE -->
        <title>CRMIS Landing Page</title>

        <!-- for title img -->
    <link rel="shortcut icon" type="image/icon" href="{{ url('assets_landing') }}/images/logo/favicon.png"/>
       
        <!--font-awesome.min.css-->
        <link rel="stylesheet" href="{{ url('assets_landing') }}/css/font-awesome.min.css">
    
    <!--linear icon css-->
    <link rel="stylesheet" href="https://cdn.linearicons.com/free/1.0.0/icon-font.min.css">
    
    <!--animate.css-->
        <link rel="stylesheet" href="{{ url('assets_landing') }}/css/animate.css">
    
    <!--hover.css-->
        <link rel="stylesheet" href="{{ url('assets_landing') }}/css/hover-min.css">
    
    <!--vedio player css-->
        <link rel="stylesheet" href="{{ url('assets_landing') }}/css/magnific-popup.css">

    <!--owl.carousel.css-->
        <link rel="stylesheet" href="{{ url('assets_landing') }}/css/owl.carousel.min.css">
    <link href="{{ url('assets_landing') }}/css/owl.theme.default.min.css" rel="stylesheet"/>


        <!--bootstrap.min.css-->
        <link rel="stylesheet" href="{{ url('assets_landing') }}/css/bootstrap.min.css">
    
    <!-- bootsnav -->
    <link href="{{ url('assets_landing') }}/css/bootsnav.css" rel="stylesheet"/>  
        
        <!--style.css-->
        <link rel="stylesheet" href="{{ url('assets_landing') }}/css/style.css">
        
        <!--responsive.css-->
        <link rel="stylesheet" href="{{ url('assets_landing') }}/css/responsive.css">
        
        <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
        <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    
        <!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.3/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
        <![endif]-->

    </head>
  
  <body>
    <!--[if lte IE 9]>
            <p class="browserupgrade">You are using an <strong>outdated</strong> browser. Please <a href="https://browsehappy.com/">upgrade your browser</a> to improve your experience and security.</p>
        <![endif]-->

    <!--menu start-->
    <section id="menu">
      @include('top_menu')
    </section><!--/#menu-->
    <!--menu end-->
    
    <!-- header-slider-area start -->
      <div class="row" style=" background: #fff">
        <div class="col-sm-10 col-sm-offset-1">
           <div class="col-sm-12" style="padding-top: 3%;padding-bottom: 1%">
               @if (!Session::get('admin_id'))
                  <p class="text-info" style="margin-bottom: 11px"><button onclick="javacript:window.location.href='{{ route('registrasi') }}'" class="btn btn-primary"> @lang('landing.data.register') </button></p>
                @endif
                        
                        <div class="col-sm-12" style="padding: 0;margin-bottom: 15px;">
                          <div class="col-sm-6" style="padding: 0;">
                            <form action="{{ route('files') }}">
                              <input type="text" name="keyword">
                              <button type="submit"> &nbsp;<i class="fa fa-search"></i> @lang("landing.data.search") &nbsp;</button>
                            </form>
                          </div>
                          <div class="col-sm-6" style="padding: 0;">
                            @if (Session::get('admin_id') > 0)
                              <div class='text-right'><a href="{{ URL::to('admin/uploaded_documents') }}"><span class='btn btn-success'><i class='fa fa-upload'> UPLOAD </i></span></a></div>
                            @endif
                          </div>
                        </div>
                        @if (Session::get('pesan'))
                          <p class='text-danger'>{{ Session::get('pesan') }}</p>
                        @endif
                        <br />
                       
                        <table class="table table-bordered table-striped table-hover" style=" background: #fff">
                          <thead>
                            <tr style="background: #333; color: #eee">
                              <th>@lang("landing.data.title")</th>
                              <th>@lang("landing.data.name")</th>
                              <th>@lang("landing.data.type_publish")</th>
                              <th>@lang("landing.data.publisher")</th>
                              <th>@lang("landing.data.year")</th>
                              <th>@lang("landing.data.download")</th>
                              <th>@lang("landing.data.uploaded_date")</th>
                              @if (Session::get('admin_id'))
                                <th>Download</th>
                              @endif
                            </tr>
                          </thead>
                          <tbody>
                            @foreach($list as $l)
                              <tr>
                                <td>{{ $l->judul }}</td>
                                <td>{{ $l->uploader }}</td>
                                <td>{{ $l->jenis }}</td>
                                <td>{{ $l->penerbit }}</td>
                                <td>{{ $l->tahun_terbit }}</td>
                                <td>{{ $l->downloaded }}x</td>
                                <td><?=Date('d/m/Y', strtotime($l->created_at));?></td>
                                @if (Session::get('admin_id'))
                                <td><a href="{{ route('download', ['id'=>md5($l->id)]) }}"><i class="fa fa-download"></i> @lang("landing.data.download") </a></td>
                                @endif
                              </tr>
                            @endforeach
                          </tbody>
                        </table>
                        {{ $list->links() }}     
            </div><!-- /.col-->
        </div>
      </div>
  
<!-- /.header-slider-area-->
    <!-- header-slider-area end -->
    
    
    <!-- footer-copyright start -->
    <footer class="footer-copyright">
      <div class="container">
        <div class="row">
          <div class="col-sm-7">
            <div class="foot-copyright pull-left">
              <p>
                &copy; All Rights Reserve
                <a href="http://oseanografi.lipi.go.id">Puslit Oceanografi LIPI</a>
              </p>
            </div><!--/.foot-copyright-->
          </div><!--/.col-->
          <div class="col-sm-5">
            <div class="foot-menu pull-right
            ">    
              
            </div><!-- /.foot-menu-->
          </div><!--/.col-->
        </div><!--/.row-->
        <div id="scroll-Top">
          <i class="fa fa-angle-double-up return-to-top" id="scroll-top" data-toggle="tooltip" data-placement="top" title="" data-original-title="Back to Top" aria-hidden="true"></i>
        </div><!--/.scroll-Top-->
      </div><!-- /.container-->

    </footer><!-- /.footer-copyright-->
    <!-- footer-copyright end -->



    <!-- jaquery link -->

    <script src="{{ url('assets_landing') }}/js/jquery.js"></script>
        <!-- Include all compiled plugins (below), or include individual files as needed -->
        
        <!--modernizr.min.js-->
        <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
    
    
    <!--bootstrap.min.js-->
        <script type="text/javascript" src="{{ url('assets_landing') }}/js/bootstrap.min.js"></script>
    
    <!-- bootsnav js -->
    <script src="{{ url('assets_landing') }}/js/bootsnav.js"></script>
    
    <!-- for manu -->
    <script src="{{ url('assets_landing') }}/js/jquery.hc-sticky.min.js" type="text/javascript"></script>

    
    <!-- vedio player js -->
    <script src="{{ url('assets_landing') }}/js/jquery.magnific-popup.min.js"></script>


    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>

    <!-- isotope js -->
    <!-- <script src="{{ url('assets_landing') }}/js/masonry.min.js"></script>
    <script src="{{ url('assets_landing') }}/js/isotop-custom.js"></script> -->

        <!--owl.carousel.js-->
        <script type="text/javascript" src="{{ url('assets_landing') }}/js/owl.carousel.min.js"></script>
    
    <!-- counter js -->
    <script src="{{ url('assets_landing') }}/js/jquery.counterup.min.js"></script>
    <script src="{{ url('assets_landing') }}/js/waypoints.min.js"></script>
    
        <!--Custom JS-->
        <script type="text/javascript" src="{{ url('assets_landing') }}/js/jak-menusearch.js"></script>
        <script type="text/javascript" src="{{ url('assets_landing') }}/js/custom.js"></script>
    

    </body>
  
</html>



