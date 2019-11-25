<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\MstArea as MstArea;
use App\Models\AppStasiun as AppStasiun;
use Session;
use CRUDBooster;
use Storage;
use App\GeneralHelper as Helper;
use App;

class DashboardController extends Controller
{
    
    public function __construct() {
      $this->middleware(function ($request, $next){
        App::setlocale(Session::get("active_lang"));
        return $next($request);
      });
    }

    public function index()
    {
      //Provinsi
      $mst_area   = DB::table('terumbukarang')
        ->select('location')
        ->groupBy('location')
        ->get();

      //Tahun
      $year = DB::table('terumbukarang')
      ->select('year')
      ->groupBy('year')
      ->get();

      return view('dashboard',[
        'areas' => $mst_area,
        'years' => $year
      ]);
    }

    public function landing()
    {
      return view('landing');
    }

    public function files(Request $req)
    {
      $where = "deleted_at IS NULL";
      if ($req->keyword != null && $req->keyword != "") {
        $where .= " AND (lower(judul) LIKE '%".addslashes(strtolower(urldecode($req->keyword)))."%'";
        $where .= " OR lower(penerbit) LIKE '%".addslashes(strtolower(urldecode($req->keyword)))."%'";
        $where .= ")";
      }
      $data['page_title'] = "download";
      $data['list'] = DB::table("app_doc")->select(DB::raw("app_doc.*, app_jenis_publikasi.jenis_publikasi as jenis,cms_users.name as uploader"))
      ->join('app_jenis_publikasi', 'app_jenis_publikasi.id', '=', 'app_doc.jenis_publikasi')
      ->join('cms_users', 'cms_users.id', '=', 'app_doc.cms_user_id')
      ->whereRaw($where)->orderBy('judul', 'ASC')->paginate(15);
      return view('files', $data);
    }

    public function download($id){
      if (Session::get('admin_id') < 1) {
        Session::flash("pesan", "Harap login untuk mengunduh file");
        return redirect()->route('files');exit;
      }else{
        $row = DB::table('app_doc')->whereRaw("md5(id) = '".$id."'")->first();
        if (!empty($row)){
          DB::table('app_doc')->whereRaw("md5(id) = '".$id."'")->update(['downloaded'=>($row->downloaded + 1)]);
          return response()->download(Storage::path($row->file_upload));
        }
      }
    }
}
