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
		<section class="header-slider-area">
			<div id="carousel-example-generic" class="carousel slide carousel-fade" data-ride="carousel">
			
			  <!-- Indicators -->
				<ol class="carousel-indicators">
					<li data-target="#carousel-example-generic" data-slide-to="0" class="active"></li>
					<li data-target="#carousel-example-generic" data-slide-to="1"></li>
				</ol>

				<!-- Wrapper for slides -->
				<div class="carousel-inner" role="listbox">
					<div class="item active">
						<div class="single-slide-item slide-1">
							<div class="container">
								<div class="row">
									<div class="col-sm-12">
										<div class="single-slide-item-content">
											<h2>@lang("landing.welcome")<br>CRMIS</h2>
											<p>
												@lang("landing.description")
											</p>
											<button type="button" class="slide-btn" onclick="window.location.href='{{ URL::to('crmis') }}'">
											GIS
											</button>
											<button type="button" class="slide-btn" onclick="window.location.href='<?=route('files');?>'">
											Repository
											</button>
                      <button type="button" class="slide-btn" onclick="window.location.href='<?=(Session::get('admin_id') > 0) ? URL::to('admin/request_data') : route('registrasi') ;?>'">
                      Upload
                      </button>
											
										</div><!-- /.single-slide-item-content-->
									</div><!-- /.col-->
								</div><!-- /.row-->
							</div><!-- /.container-->
						</div><!-- /.single-slide-item-->
					</div><!-- /.item .active-->
					
				</div><!-- /.carousel-inner-->

				<!-- Controls -->
				<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev">
					<span class="lnr lnr-chevron-left"></span>
				</a>
				<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next">
					<span class="lnr lnr-chevron-right"></span>
				</a>
			</div><!-- /.carousel-->

		</section><!-- /.header-slider-area-->
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



