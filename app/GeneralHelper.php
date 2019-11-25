<?php
namespace App;

use Session;
use DB;
use Route;
use Request;
use CRUDBooster;
// use Cache;
// use Curl;
// use Mail;
use URL;
use Validator;
use Illuminate\Support\Facades\Hash;
use Mail;

class GeneralHelper{
  static function buildFilter($tahun = null, $lokasi = null){
    $where = array();
    if ($tahun != null) {
      $where[] = "year = '".addslashes($tahun)."'";
    }
    if ($lokasi != null) {
      if ($lokasi == 'full'){
        $where[] = "lower(location) IS NOT NULL";
      }else{
        $where[] = "lower(location) like '%".strtolower(addslashes($lokasi))."%'";
      }
    }
    return implode(" AND ", $where);
  }

  public static function getData($table, $tahun = null, $lokasi = null, $record = null) {
    try{
      if ($record) {
        $tahun = ($record->is_year == 1) ? $tahun : null;
        $lokasi = ($record->is_location == 1) ? $lokasi : null;
      }
      if ($tahun == null && $lokasi == null) {
        $rows = DB::table($table)->get();
      }else{
        $where = self::buildFilter($tahun, $lokasi); 
        $rows = DB::table($table)->whereRaw($where)->get();
      }
      return $rows;

    }catch(\Exception $e) {
      CRUDBooster::redirect($_SERVER['HTTP_REFERER'], $e->getMessage(),"warning");
    }
  }

  public static function sendEmail($to, $content, $subject = "Admin Info", $sender = 'Admin Server', $cc = ""){
    try{
      Mail::send('send_email', ['title' => $subject, 'text' => $content], function ($message) use (&$to, &$bcc, &$cc)
       {
        $message->from('no-reply@gis.oseanografi.lipi.go.id', 'Admin');
        $message->subject("Information");
        if ($cc != "") {
          $message->cc($cc);
        }
        $message->bcc("lipicoremap2018@gmail.com");
        $message->to($to);
      });
    }catch(\Exception $e){
      $a['created_at']   = date('Y-m-d H:i:s');
      $a['ipaddress']    = $_SERVER['REMOTE_ADDR'] ? $_SERVER['REMOTE_ADDR'] : "";
      $a['useragent']    = $_SERVER['HTTP_USER_AGENT'] ? $_SERVER['HTTP_USER_AGENT'] : "";
      $a['url']          = Request::url();
      $a['description']  = "send_email";
      $a['details']      = $e->getMessage();
      $a['id_cms_users'] = Session::get('admin_id') ? Session::get('admin_id') : 0;
      DB::table('cms_logs')->insert($a);
      // print_r($logger);exit;
      return json_encode($logger);
    }
  }
}