<div class="container">
  <div class="menubar">
    <nav class="navbar navbar-default">
    
      <!-- Brand and toggle get grouped for better mobile display -->
      <div class="navbar-header">
        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
          <span class="sr-only">Toggle navigation</span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
          <span class="icon-bar"></span>
        </button>
        <a class="navbar-brand" href="{{ URL::to('/') }}">
          <span style="font-weight: bold; color: white">CRMIS - Pusat Penelitian Oseanografi LIPI</> 
        </a>
      </div><!--/.navbar-header -->

      <!-- Collect the nav links, forms, and other content for toggling -->
      <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
        <ul class="nav navbar-nav navbar-right">
          <li class="smooth-menu">
            <?php
              if(Session::get('active_lang') != 'id') {
                $lang_url = route('set_lang', ['id'=>'id']);
                $lang_txt = 'ID';
              }else{
                $lang_url = route('set_lang', ['id'=>'en']);
                $lang_txt = 'EN';
              }

              if(Session::get('admin_id') > 0) {
                $menu_text = \Lang::get('landing.logout');
                $menu_url = URL::to('admin/logout');
              }else{
                $menu_text = \Lang::get('landing.login');
                $menu_url = URL::to('admin/login');
              }
            ?>
            <a href="#" onclick="window.location.href='<?=$menu_url;?>'">{{ $menu_text }}</a>
          </li>
          <li><a href="#" onclick="window.location.href='<?=$lang_url;?>'">{{ $lang_txt }}</a></li>
        </ul>
      </div><!-- /.navbar-collapse -->

    </nav><!--/nav -->
  </div><!--/.menubar -->
</div><!-- /.container -->