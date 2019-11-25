<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Http\Controllers\Controller;
use Cache;
use Session;
use DB;

class GeneralApiController extends Controller
{
  public function data_from_table($table){
    $data = null;
    $table = trim($table);
    $status = 200;
    try {
      $select = [];
      // $row = MappingData::where('table_name', $table)->first();
      $term = isset($_GET['term']) ? $_GET['term'] : '';
      $limit = isset($_GET['nolimit']) ? 5000 : 50;
      // if (!empty($row)) {
      //   if ($row->is_location == 1) {
          $rows = DB::table($table)->select(DB::raw('location as id, location as text'))
            ->whereRaw("lower(location) like '%".$term."%' ")->limit($limit)->groupBy('location')->get();
          $data['locations'] = $rows;
        // if ($row->is_year == 1) {
          $rows = DB::table($table)->select(DB::raw('year as id, year as text'))
          ->whereRaw("lower(year) like '%".$term."%' ")->limit($limit)->groupBy('year')->get();
          $data['years'] = $rows;
        // }
    }catch(\Exception $e){
      $message = $e->getMessage();
      $data['message'];
      $status = 500;
    }

    return response()->json($data, $status);
  }

  public function group_data(){
    $list = MappingGroup::getFromCache();
    $data['list'] = $list;
    return response()->json($data);
  }

  public function get_chained_data(Request $req) {
    $table = addslashes($req->table);
    if ($table > 0) {
      $row = MappingData::find($table);
      $table = $row->table_name;
    }

    $field = addslashes($req->field);
    $field = ($field != "" || !empty($field)) ? $field : 'year';
    $term = addslashes($req->term);
    $searchedField = in_array($field, ['tahun', 'year']) ? 'location' : 'year';

    $rows = DB::table($table)->select(DB::raw("$searchedField as id, $searchedField as text"))->
    whereRaw("lower($field) LIKE '%".strtolower($term)."%'")->orderBy($searchedField, 'ASC')->groupBy($searchedField)->get();
    return response()->json($rows);

  }
}
