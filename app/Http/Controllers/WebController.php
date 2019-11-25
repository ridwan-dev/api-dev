<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;
use App;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use Validator;
use App\GeneralHelper as Helper;
use URL;
use Session;

class WebController extends Controller
{
    
    public function set_lang($id) {
      $id = ($id != 'id') ? 'en' : 'id';
      Session::put('active_lang', $id);
      App::setLocale($id);
      return redirect()->back();
    }

    public function registrasi(){
        return view('register');
    }

    public function postregistrasi(Request $request){
      $a = $request->except(['_token']);
      $validator = Validator::make($request->all(), [
        'email' => 'required|unique:cms_users,email'
      ]);

      if (!$validator->fails()) {
        try{
          $a['password'] = \Hash::make($a['password']);
          $usr_role = DB::table('cms_privileges')->whereRaw("lower(name) = 'user'")->first();
          $a['id_cms_privileges'] = (empty($usr_role)) ? 0 : $usr_role->id;
          $a['status'] = "Inactive";
          DB::table('cms_users')->insert($a);
          $unique = base64_encode(md5($a['email'].$a['id_cms_privileges'].$a['name']."2018")."###".$a['email']);
          // echo route('verify', ['id'=>$unique]);exit;
          $content = "<p>Dear ".addslashes($a['name'])."</p>";
          $content .= "<p>Email anda berhasil terdaftar. Untuk mengaktifkan akun anda silahkan kunjungi link di bawah ini:</p>";
          $content .= "<p>".route('verify', ['id'=>$unique])."</p>";
          //scanning:https://github.com/aboul3la/Sublist3r
          Helper::sendEmail($a['email'], $content, "Verifikasi akun");
          return redirect('admin/login')->with('message','Periksa email anda untuk verifikasi akun.');
        }catch(\Exception $e){
          die($e->getMessage());
        }
      }else{
        return redirect()->back()->with('message', 'Email sudah terdaftar');
      }
    }

    public function verify($unique) {
      $split = explode("###", base64_decode($unique));
      // echo base64_decode($unique)."<br>";
      // print_r($split);
      try {
        $row = DB::table("cms_users")->where("email", addslashes($split[1]))->first();

        if (!empty($row)) {
          if (md5($row->email.$row->id_cms_privileges.$row->name."2018") == $split[0]) {
            DB::table("cms_users")->whereRaw("md5(id) = '".md5($row->id)."'")->update(["status"=>"Active"]);
            return redirect('admin/login')->with('message','Selamat Anda berhasil Daftar');
          }else{
            echo "Verikasi gagal!";
          }
        }
      }catch(\Exception $e) {
        echo "Something went wrong!";
      }
    }

    private function add_prefix($template) {
        $result = $this->prefix . $template;
        return $result;
    }

    private function add_title($page, $detail = null) {
        $new_title = $page . $this->limiter . $this->title;
        if ($detail != null) {
            $new_title = $detail . $this->limiter . $new_title;
        }
        return $new_title;
    }

}