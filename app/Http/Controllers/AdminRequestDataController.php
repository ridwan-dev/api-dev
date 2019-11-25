<?php namespace App\Http\Controllers;

  use Session;
  use Request;
  use DB;
  use CRUDBooster;
  use App\GeneralHelper as Helper;
  use App\RequestData;
  use PDF;
  use URL;

  class AdminRequestDataController extends \crocodicstudio\crudbooster\controllers\CBController {

      public function cbInit() {
      $button_valid = true;
      if (!in_array(strtolower(CRUDBooster::myPrivilegeName()), ['admin', 'super administrator', 'moderator'])){
        $row = DB::table('cms_users')->whereRaw("id = '".CRUDBooster::myid()."' AND status = 'Active'")->count();
        if ($row < 1) {
          $this->alert[] = ["message"=>"Anda belum melengkapi data diri","type"=>"warning"];
          $button_valid = false;
        }
      }

			# START CONFIGURATION DO NOT REMOVE THIS LINE
			$this->title_field = "id";
			$this->limit = "20";
			$this->orderby = "id,desc";
			$this->global_privilege = false;
			$this->button_table_action = true;
			$this->button_bulk_action = false;
			$this->button_action_style = "button_icon";
			$this->button_add = $button_valid;
			$this->button_edit = true;
			$this->button_delete = true;
			$this->button_detail = true;
			$this->button_show = false;
			$this->button_filter = true;
			$this->button_import = false;
			$this->button_export = false;
			$this->table = "request_data";
			# END CONFIGURATION DO NOT REMOVE THIS LINE

			# START COLUMNS DO NOT REMOVE THIS LINE
      $this->col = [];
      $this->col[] = ["label"=>"Data","name"=>"mapping_data_id"];
      $this->col[] = ["label"=>"Status","name"=>"status"];
      $this->col[] = ["label"=>"tahun","name"=>"tahun"];
      $this->col[] = ["label"=>"lokasi","name"=>"lokasi"];
      $this->col[] = ["label"=>"Pembuat","name"=>"cms_user_id","join"=>"cms_users,name"];
      $this->col[] = ["label"=>"Tanggal Buat","name"=>"created_at"];
      $this->col[] = ["label"=>"Tanggal Status","name"=>"status_date"];
      // $this->col[] = ["label"=>"data_lainnya","name"=>"requested_data"];
      # END COLUMNS DO NOT REMOVE THIS LINE

			# START FORM DO NOT REMOVE THIS LINE
			$this->form = [];
			$this->form[] = ['label'=>'Data','name'=>'mapping_data_id','type'=>'select2','validation'=>'required','width'=>'col-sm-10','dataenum'=>'data_lamun;data_mangrove;terumbukarang;data_lainnya'];
			$this->form[] = ['label'=>'Lainnya','name'=>'requested_data','type'=>'textarea','validation'=>'string','width'=>'col-sm-10'];
      if (in_array(strtolower(CRUDBooster::myPrivilegeName()), ['admin', 'super administrator']))
        $this->form[] = ['label'=>'File','name'=>'requested_file','type'=>'upload','width'=>'col-sm-10'];
      $this->form[] = ['label'=>'Tahun','name'=>'tahun','type'=>'select','validation'=>'integer','width'=>'col-sm-9'];
			$this->form[] = ['label'=>'Lokasi','name'=>'lokasi','type'=>'select','validation'=>'string','width'=>'col-sm-9'];
			$this->form[] = ['label'=>'Keperluan','name'=>'keperluan','type'=>'textarea','validation'=>'required|string|min:5|max:5000','width'=>'col-sm-10'];
			# END FORM DO NOT REMOVE THIS LINE

			# OLD START FORM
			//$this->form = [];
			//$this->form[] = ['label'=>'Data','name'=>'mapping_data_id','type'=>'radio','validation'=>'required','width'=>'col-sm-10','datatenum'=>'data_lamun|data_lamun;data_mangrove|data_mangrove;terumbukarang|terumbukarang'];
			//$this->form[] = ['label'=>'Lainnya','name'=>'requested_data','type'=>'textarea','validation'=>'string', 'width'=>'col-sm-10'];
			//if (in_array(strtolower(CRUDBooster::myPrivilegeName()), ['admin', 'super administrator']))
			//$this->form[] = ['label'=>'File','name'=>'requested_file','type'=>'upload','width'=>'col-sm-10'];
			//$this->form[] = ['label'=>'Tahun','name'=>'tahun','type'=>'select','validation'=>'integer','width'=>'col-sm-9'];
			//$this->form[] = ['label'=>'Lokasi','name'=>'lokasi','type'=>'select','validation'=>'string','width'=>'col-sm-9'];
			//$this->form[] = ['label'=>'Keperluan','name'=>'keperluan','type'=>'textarea','validation'=>'required|string|min:5|max:5000','width'=>'col-sm-10'];
			# OLD END FORM

			/* 
          | ---------------------------------------------------------------------- 
          | Sub Module
          | ----------------------------------------------------------------------     
      | @label          = Label of action 
      | @path           = Path of sub module
      | @foreign_key    = foreign key of sub table/module
      | @button_color   = Bootstrap Class (primary,success,warning,danger)
      | @button_icon    = Font Awesome Class  
      | @parent_columns = Sparate with comma, e.g : name,created_at
          | 
          */
          $this->sub_module = array();


          /* 
          | ---------------------------------------------------------------------- 
          | Add More Action Button / Menu
          | ----------------------------------------------------------------------     
          | @label       = Label of action 
          | @url         = Target URL, you can use field alias. e.g : [id], [name], [title], etc
          | @icon        = Font awesome class icon. e.g : fa fa-bars
          | @color     = Default is primary. (primary, warning, succecss, info)     
          | @showIf      = If condition when action show. Use field alias. e.g : [id] == 1
          | 
          */
          $this->addaction = array();
          if (in_array(strtolower(CRUDBooster::myPrivilegeName()), ['admin', 'super administrator'])){
            $this->addaction[] = ['label'=>'Accept','url'=>CRUDBooster::mainpath('set-status/1/[id]'),'icon'=>'fa fa-check','color'=>'success','showIf'=>"[status] == 0", 'confirmation' => true];
            $this->addaction[] = ['label'=>'Reject','url'=>CRUDBooster::mainpath('set-status/2/[id]'),'icon'=>'fa fa-ban','color'=>'warning','showIf'=>"[status] == 0", 'confirmation' => true];
          }
          $this->addaction[] = ['label'=>'Download','url'=>CRUDBooster::mainpath('download/[id]'),'icon'=>'fa fa-download','color'=>'warning','showIf'=>"[status] == 1"];



          /* 
          | ---------------------------------------------------------------------- 
          | Add More Button Selected
          | ----------------------------------------------------------------------     
          | @label       = Label of action 
          | @icon      = Icon from fontawesome
          | @name      = Name of button 
          | Then about the action, you should code at actionButtonSelected method 
          | 
          */
          $this->button_selected = array();

                  
          /* 
          | ---------------------------------------------------------------------- 
          | Add alert message to this module at overheader
          | ----------------------------------------------------------------------     
          | @message = Text of message 
          | @type    = warning,success,danger,info        
          | 
          */
          $this->alert        = array();
          if (!in_array(strtolower(CRUDBooster::myPrivilegeName()), ['admin', 'super administrator', 'moderator'])){
            $row = DB::table('cms_users')->whereRaw("id = '".CRUDBooster::myid()."' AND status = 'Active'")->count();
            if ($row < 1) {
              $this->alert[] = ["message"=>"<a href='".URL::to('admin/users/profile')."'>Anda belum melengkapi data diri</a>","type"=>"warning"];
            }
          }

                  

          
          /* 
          | ---------------------------------------------------------------------- 
          | Add more button to header button 
          | ----------------------------------------------------------------------     
          | @label = Name of button 
          | @url   = URL Target
          | @icon  = Icon from Awesome.
          | 
          */
          $this->index_button = array();



          /* 
          | ---------------------------------------------------------------------- 
          | Customize Table Row Color
          | ----------------------------------------------------------------------     
          | @condition = If condition. You may use field alias. E.g : [id] == 1
          | @color = Default is none. You can use bootstrap success,info,warning,danger,primary.        
          | 
          */
          $this->table_row_color = array();                 

          
          /*
          | ---------------------------------------------------------------------- 
          | You may use this bellow array to add statistic at dashboard 
          | ---------------------------------------------------------------------- 
          | @label, @count, @icon, @color 
          |
          */
          $this->index_statistic = array();



          /*
          | ---------------------------------------------------------------------- 
          | Add javascript at body 
          | ---------------------------------------------------------------------- 
          | javascript code in the variable 
          | $this->script_js = "function() { ... }";
          |
          */
          function select2($field, $results){
            $script = "$('#".$field."').select2({        
                ajax: {
                  cache: false,
                  placeholder: 'Search for a location',
                  url: '".URL::to('api/data_in_histories/')."' + '/' + $('#mapping_data_id').val(),
                  type: 'GET',
                  processResults: function (data) {
                    console.log('result', data)
                    return {
                      results: data.".$results."
                    };
                  }
                }
              });";
              return $script;
          }

          $this->script_js = "
            $(document).ready(function(){
              var tblName = $('#mapping_data_id option:selected').text();
              
              if (tblName == 'data_lainnya') {
                $('#form-group-requested_data').css('display', 'block');
                $('#mapping_data_id').prop('readonly', true);
                // $('#requested_data').prop('readonly', true);
                $('#form-group-requested_file').css('display', 'block');
                $('#form-group-requested_file').prop('disabled', true);
              }else{
                $('#form-group-requested_data').css('display', 'none');
                $('#form-group-requested_data').prop('disabled', true);
                $('#form-group-requested_file').css('display', 'none');
                $('#form-group-requested_file').prop('disabled', true);
              }

              $('#tahun').change(function(){
                $('#lokasi').select2({
                  ajax: {
                    cache: false,
                    placeholder: 'Search for a location',
                    url: '".URL::to('api/get_chained_data')."' + '?table='+ $('#mapping_data_id').val() + '&term=' + $('#tahun').val(),
                    type: 'GET',
                    processResults: function (data) {
                      return {
                        results: data
                      };
                    }
                  }
                });
              })

              $('#mapping_data_id').change(function(){
                tblName = $('#mapping_data_id option:selected').text();
                console.log(tblName);
                if (tblName == 'data_lainnya') {
                  $('#form-group-requested_data').css('display', 'block');
                  $('#mapping_data_id').prop('readonly', true);
                  
                  $('#form-group-requested_file').css('display', 'block');
                  $('#form-group-requested_file').prop('disabled', true);
                  $('#Lokasi').prop('disabled', true);
                  $('#lokasi').prop('disabled', true);
                  $('#Tahun').prop('disabled', true);
                  $('#tahun').prop('disabled', true);
                }else{
                  $('#form-group-requested_data').css('display', 'none');
                  $('#form-group-requested_data').prop('disabled', true);
                  $('#form-group-requested_file').css('display', 'none');
                  $('#form-group-requested_file').prop('disabled', true);
                  
                  $('#Lokasi').prop('disabled', false);
                  $('#lokasi').prop('disabled', false);
                  $('#Tahun').prop('disabled', false);
                  $('#tahun').prop('disabled', false);
                  ".select2('tahun', 'years')."
                }
              });
            });";


            /*
          | ---------------------------------------------------------------------- 
          | Include HTML Code before index table 
          | ---------------------------------------------------------------------- 
          | html code to display it before index table
          | $this->pre_index_html = "<p>test</p>";
          |
          */
          $this->pre_index_html = null;
          
          
          
          /*
          | ---------------------------------------------------------------------- 
          | Include HTML Code after index table 
          | ---------------------------------------------------------------------- 
          | html code to display it after index table
          | $this->post_index_html = "<p>test</p>";
          |
          */
          $this->post_index_html = null;
          
          
          
          /*
          | ---------------------------------------------------------------------- 
          | Include Javascript File 
          | ---------------------------------------------------------------------- 
          | URL of your javascript each array 
          | $this->load_js[] = asset("myfile.js");
          |
          */
          $this->load_js = array();
          $this->load_js[] = asset('/vendor/crudbooster/assets/select2/dist/js/select2.full.min.js');

          
          
          
          /*
          | ---------------------------------------------------------------------- 
          | Add css style at body 
          | ---------------------------------------------------------------------- 
          | css code in the variable 
          | $this->style_css = ".style{....}";
          |
          */
          $this->style_css = NULL;
          $this->style_css[] = asset('/vendor/crudbooster/assets/select2/dist/css/select2.min.css');
          
          
          
          /*
          | ---------------------------------------------------------------------- 
          | Include css File 
          | ---------------------------------------------------------------------- 
          | URL of your css each array 
          | $this->load_css[] = asset("myfile.css");
          |
          */
          $this->load_css = array();          
      }


      /*
      | ---------------------------------------------------------------------- 
      | Hook for button selected
      | ---------------------------------------------------------------------- 
      | @id_selected = the id selected
      | @button_name = the name of button
      |
      */
      public function actionButtonSelected($id_selected,$button_name) {
          //Your code here
              
      }


      /*
      | ---------------------------------------------------------------------- 
      | Hook for manipulate query of index result 
      | ---------------------------------------------------------------------- 
      | @query = current sql query 
      |
      */
      public function hook_query_index(&$query) {
        //Your code here
        if( strtolower(CRUDBooster::myPrivilegeID()) == 3){
          $query->where('request_data.cms_user_id', CRUDBooster::myId());
        }
              
      }

      /*
      | ---------------------------------------------------------------------- 
      | Hook for manipulate row of index table html 
      | ---------------------------------------------------------------------- 
      |
      */    
      public function hook_row_index($column_index,&$column_value) {          
        //Your code here
        if ($column_index == 1){
          $arr = [0 => 'Menunggu',  1=> 'Disetujui', 2=>'Ditolak'];
          $column_value = $arr[$column_value];
        }
      }

      /*
      | ---------------------------------------------------------------------- 
      | Hook for manipulate data input before add data is execute
      | ---------------------------------------------------------------------- 
      | @arr
      |
      */
      public function hook_before_add(&$postdata) {        
          //Your code here          
          $postdata['cms_user_id'] = Session::get('admin_id');

      }

      /* 
      | ---------------------------------------------------------------------- 
      | Hook for execute command after add public static function called 
      | ---------------------------------------------------------------------- 
      | @id = last insert id
      | 
      */
      public function hook_after_add($id) {        
        //Your code here
        $bcc = CRUDBooster::getSetting('email_receiver');  
        $tb = RequestData::find($id); 
        $content = "Request data baru anda untuk data ".$tb->mapping_data_id." telah terkirim";
        $content2 = "Request data baru dari ".$tb->maker->name." untuk data ".$tb->mapping_data_id;
        Helper::sendEmail($tb->maker->email, $content);
        Helper::sendEmail($bcc, $content2);
      }

      /* 
      | ---------------------------------------------------------------------- 
      | Hook for manipulate data input before update data is execute
      | ---------------------------------------------------------------------- 
      | @postdata = input post data 
      | @id       = current id 
      | 
      */
      public function hook_before_edit(&$postdata,$id) {        
          //Your code here

      }

      /* 
      | ---------------------------------------------------------------------- 
      | Hook for execute command after edit public static function called
      | ----------------------------------------------------------------------     
      | @id       = current id 
      | 
      */
      public function hook_after_edit($id) {
          //Your code here 

      }

      /* 
      | ---------------------------------------------------------------------- 
      | Hook for execute command before delete public static function called
      | ----------------------------------------------------------------------     
      | @id       = current id 
      | 
      */
      public function hook_before_delete($id) {
          //Your code here

      }

      /* 
      | ---------------------------------------------------------------------- 
      | Hook for execute command after delete public static function called
      | ----------------------------------------------------------------------     
      | @id       = current id 
      | 
      */
      public function hook_after_delete($id) {
          //Your code here

      }



      //By the way, you can still create your own method in here... :) 

      public function getSetStatus($status, $id) {
        if (!in_array(strtolower(CRUDBooster::myPrivilegeName()), ['admin', 'super administrator', 'moderator'])){
          CRUDBooster::redirect($_SERVER['HTTP_REFERER'],"Anda tidak bisa melakukan update !","warning");exit;
        }

        DB::table('request_data')->where('id', $id)->update(['status'=> $status, 'updated_by'=>Session::get('admin_id'), 'status_date'=>Date('y-m-d H:i:s')]);
        $row = RequestData::find($id);
        if ($row->mapping_data_id == 'data_lainnya'){
          return $this->getUpload($id);
        }else{
          //This will redirect back and gives a message
          CRUDBooster::redirect($_SERVER['HTTP_REFERER'],"The status request has been updated !","info");
        }
      }

      public function getDownload($id){
        $row = RequestData::find($id);

        if (!empty($row)) {
          if ($row->status != 1){
            CRUDBooster::redirect($_SERVER['HTTP_REFERER'],"File belum mendapat persetujuan !","warning");exit;
          }

          if ($row->requested_file != null && $row->requested_file != ""){
            try{
              return response()->download($row->requested_file);
            }catch(\Exception $e){
             CRUDBooster::redirect($_SERVER['HTTP_REFERER'], $e->getMessage(),"warning");exit; 
            }
          }

          $rows = Helper::getData($row->mapping_data_id, $row->tahun, $row->lokasi);
          $pdf = PDF::setPaper('legal', 'landscape')->loadView('html_pdf_view', ['list'=>$rows, "title" => $row->mapping_data_id]);
          // return View('html_pdf_view', ['list'=>$rows, "title" => $mapping->name]);
          return $pdf->download(str_replace(" ", "-", $row->mapping_data_id).".pdf");
        }
      }

      public function getUpload($id) {
        $data['page_title'] = "Upload Document";
        $data['row']        = RequestData::find($id);    
        // return View('upload_document', $data); 
        $this->button_addmore = FALSE;
        $this->button_cancel  = FALSE;
        $this->button_show    = FALSE;      
        $this->button_add     = FALSE;
        $this->button_delete  = FALSE;  
        $this->hide_form    = ['tahun', 'lokasi', 'keperluan'];
        $data['page_title'] = " Upload Document";
        // $data['row']        = CRUDBooster::first('cms_users',CRUDBooster::myId());    
        $this->cbView('crudbooster::default.form',$data);      
      }
  }