<?php

namespace App\Http\Controllers;

use DB;
use Illuminate\Http\Request;

use App\Http\Requests;
use App\Http\Controllers\Controller;
use App\Models\AppCoral as AppCoral;
use App\Models\AppGraph as AppGraph;
use App\Models\AppStasiun as AppStasiun;
use App\Models\AppEco as AppEco;
use App\Models\AppKarang as AppKarang;
use App\Models\AppBenthos as AppBenthos;
use App\Models\AppIkan as AppIkan;
use App\Models\AppLamun as AppLamun;
use App\Models\AppMangrove as AppMangrove;
use App\Models\MstProv as MstProv;
use App\Models\MstKab as MstKab;

use App\Models\AppCoralCondition as AppCoralCondition;

class JsonController extends Controller {
    public function getStationByYearSubDisctrictDataType($year,$subdistrict, $datatype) {
        
        $table = $this->getTable($datatype);
        $sql = DB::table($table)->select(DB::raw('*'))
            ->whereRaw('md5(kabupaten) = "'.$subdistrict.'"')
            ->where('year',$year)
            ->orderBy('station')
            ->get();

        # init geojson array
        $geojson = ['type' => 'FeatureCollection', 'features' => array() ];

        # iterate transformed data and push it into geojson array
        foreach ($sql as $item) {

          if($item->hc < 25){
            $icon = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|FF0000";
            $color = "";
          }else if ($item->hc < 50) {
            $icon = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|FFFF00";
          }else if ($item->hc < 75) {
            $icon = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|008000";
          }else {
            $icon = "http://chart.apis.google.com/chart?chst=d_map_pin_letter&chld=%E2%80%A2|0000FF";
          }
          # init properties with data
          $properties = array(
            'id' => $item->id,
            'stat_code' => $item->station,
            'provinsi' => $item->provinsi,
            'kabupaten' => $item->kabupaten,
            'location' => $item->location,
            'area' => $item->location,
            'lat' => $item->lat,
            'lng' => $item->lng,
            'hc' => $item->hc,
            'tahun' => $item->year,
            'icon' => $icon,
            'tipe' => $datatype,
          );

          if ($datatype == 'seagrass') {
            $properties['tutupan'] = $item->ratatutupan;
            $n_jenis = 0;
            $item->ea > 1 ? $n_jenis++:0;
            $item->th > 1 ? $n_jenis++:0;
            $item->cs > 1 ? $n_jenis++:0;
            $item->cr > 1 ? $n_jenis++:0;
            $item->hu > 1 ? $n_jenis++:0;
            $item->hp > 1 ? $n_jenis++:0;
            $item->ho > 1 ? $n_jenis++:0;
            $item->si > 1 ? $n_jenis++:0;
            $item->tc > 1 ? $n_jenis++:0;

            $properties['n_jenis'] = $n_jenis;
          }

          if ($datatype == 'mangrove') {
            $properties['cover'] = $item->cover;
            $properties['kerapatan'] = $item->kerapatan;
          }

          # set geometry from shape data
          $geometry = array(
            "type" => "Point",
            "coordinates" => [$item->lng, $item->lat]
          );

          
          $feature = array(
            'type' => 'Feature',
            'properties' => $properties,
            'geometry' => $geometry
            
          );

          # Add feature arrays to feature collection array
          array_push($geojson['features'], $feature);
        }

        # init result with geojson array
        $result = $geojson;

        return response()->json($result, 200, [], JSON_NUMERIC_CHECK);
    }

    public function coral($tipe,$id = null,$year) {
      if ($tipe=="kab") {
        $sql = DB::table('terumbukarang')
                ->select(DB::raw('avg(hc) hc,avg(dc) dc, avg(dca) dca,year'))
                ->where('year',$year)
                ->whereRaw('md5(kabupaten)="'.$id.'"')
                ->groupBy('kabupaten')
                ->get();
      } else {
        $sql = DB::table('terumbukarang')->select(DB::raw('*'))
            ->where('id', $id)
            ->get();
      }

      $color = array("#FFFFFF", "#03A9F4", "#FFEB04");
      $total = 0;
      
      //dd($sql);
      foreach ($sql as $k => $item) {
        $properties[] = array(
          'title' => 'hc',
          'value' => $item->hc,
          'year' => $item->year,
          'color' => $color[0]
        );

        $properties[] = array(
          'title' => 'dc',
          'value' => $item->dc,
          'year' => $item->year,
          'color' => $color[1]
        );

        $properties[] = array(
          'title' => 'dca',
          'value' => $item->dca,
          'year' => $item->year,
          'color' => $color[2]
        );

      }

      return response()->json($properties);
    }

    public function coral_top($id) {
      $sql = AppGraph::select(DB::raw('hc, dc, dca'))
          ->where('id_app_stasiun', $id)
          ->get();

      foreach ($sql as $item) {
        $properties = array(
          array(
            'title' => 'HC',
            'value' => $item->hc,
            'color' => "#FFEB04"
          ),
          array(
            'title' => 'DC',
            'value' => $item->dc,
            "color" => "#03A9F4"
          ),
          array(
            'title' => 'DCA',
            'value' => $item->dca,
            "color" => "#FFFFFF"
          )
        );
      }

      return response()->json($properties);
    }

    //Grafik Spider
    public function coral_bot($tipe,$id = null,$year) {
      

      if ($tipe=="kab") {
        $sql = DB::table('terumbukarang')
                ->select(DB::raw('avg(hc) hc,year,station'))
                ->where('year',$year)
                ->whereRaw('md5(kabupaten)="'.$id.'"')
                ->groupBy('station')
                ->get();
        
        foreach ($sql as $k => $item) {
          $properties[] = array(
            'id' => $item->id,
            'species' => $item->station,
            'value' => round($item->hc,2)
          );
        }
      } else {
        $sql = DB::table('terumbukarang')->select(DB::raw('*'))
            ->where('id', $id)
            ->get();
        
        foreach ($sql as $k => $item) {
          
          foreach($item as $key => $val){
            if($key != "id" and $key != "location" and $key != "kabupaten" and $key != "provinsi" and $key != "year" and $key != "lat" and $key != "lng" and $key != "station"  ){
              $properties[] = array(
                'id' => $key,
                'species' => $key,
                'value' => round($val,2)
              );
            }
            
          }
          
        }
      }


      

      return response()->json($properties);
    }

    public function coral_bot_seagrass($id = null) {
      if (!$id) {
        $sql = AppLamun::select(DB::raw('app_cruinfo.id AS id,
        app_cruinfo.area AS species,
        AVG(app_lamun_new.tutupan) AS value'))
            ->join('app_stasiun', 'app_lamun_new.stasiun_id', '=', 'app_stasiun.stat_code')
            ->join('app_cruinfo', 'app_stasiun.id_app_cruinfo', '=', 'app_cruinfo.id')
            ->groupBy('app_stasiun.id_app_cruinfo')
            ->get();
      } else {
        //$sql = AppGraph::select(DB::raw('app_stasiun.stat_code AS stasiun, app_graph.hc, app_graph.dc, app_graph.dca, app_graph.sc, app_graph.sp, app_graph.fs, app_graph.ot, app_graph.r, app_graph.s, app_graph.si'))
        $sql = AppLamun::select(DB::raw('app_stasiun.id AS id,
         app_stasiun.stat_code AS species,
         AVG(app_lamun_new.tutupan) AS value'))
             ->leftJoin('app_stasiun', 'app_lamun_new.stasiun_id', '=', 'app_stasiun.stat_code')
             ->where('app_stasiun.id_app_cruinfo', $id)
             ->groupBy('app_lamun_new.stasiun_id')
             ->get();
      }

      return response()->json($sql);
    }

    public function coral_bot_mangrove($id = null) {
      if (!$id) {
        $sql = AppMangrove::select(DB::raw('app_cruinfo.id AS id,
        app_cruinfo.area AS species,
        AVG(app_mangrove_new.tutupan) AS value'))
            ->join('app_stasiun', 'app_mangrove_new.stat_id', '=', 'app_stasiun.id')
            ->join('app_cruinfo', 'app_stasiun.id_app_cruinfo', '=', 'app_cruinfo.id')
            ->groupBy('app_stasiun.id_app_cruinfo')
            ->get();
      } else {
        //$sql = AppGraph::select(DB::raw('app_stasiun.stat_code AS stasiun, app_graph.hc, app_graph.dc, app_graph.dca, app_graph.sc, app_graph.sp, app_graph.fs, app_graph.ot, app_graph.r, app_graph.s, app_graph.si'))
        $sql = AppMangrove::select(DB::raw('app_stasiun.id AS id,
         app_stasiun.stat_code AS species,
         AVG(app_mangrove_new.tutupan) AS value'))
             ->leftJoin('app_stasiun', 'app_mangrove_new.stat_id', '=', 'app_stasiun.id')
             ->where('app_stasiun.id_app_cruinfo', $id)
             ->groupBy('app_mangrove_new.stat_id')
             ->get();
      }

      return response()->json($sql);
    }

    public function coralCondition($id = 0) {
          $sql = DB::select('select year,status,count(0) total from terumbukarang where status is not null
          group by year,status');
          
          $data = [];
          foreach($sql as $val){
            if($val->status == "Poor")
              $isi[$val->year]['value'] = $val->total;
            else if($val->status == "Moderate")
              $isi[$val->year]['value2'] = $val->total;
            else if($val->status == "Good")
              $isi[$val->year]['value3'] = $val->total;
            else if($val->status == "Excellent")
              $isi[$val->year]['value4'] = $val->total;
            else 
              $isi[$val->year]['value4'] = $val->total;
            
            $isi[$val->year]['date'] = $val->year;
          }

          foreach($isi as $val){
            $data[] = $val;
          }

      return response()->json($data);
    }

    public function coralConditiontable($id = 0) {
          $sql = DB::select('select year,status,count(0) total from terumbukarang where status is not null
          group by year,status');
          //dd($sql);
          $data = [];
          foreach($sql as $val){
            if($val->status == "Poor")
              $isi[$val->year]['value'] = $val->total;
            else if($val->status == "Moderate")
              $isi[$val->year]['value2'] = $val->total;
            else if($val->status == "Good")
              $isi[$val->year]['value3'] = $val->total;
            else if($val->status == "Excellent")
              $isi[$val->year]['value4'] = $val->total;
            else 
              $isi[$val->year]['value4'] = 0;
            
            $isi[$val->year]['date'] = $val->year;
          }
          
          $cetak = "";
          foreach($isi as $val){
            $val4 = $val['value4'] ? $val['value4'] : 0;
            $cetak .= '<tr>
            <td align="center"><strong>'.$val['date'].'</strong></td>
            <td align="center">'.$val['value'].'</td>
            <td align="center">'.$val['value2'].'</td>
            <td align="center">'.$val['value3'].'</td>
            <td align="center">'.$val4 .'</td>
          </tr>';
          }
      echo $cetak;
    }

    public function ecosystem($tipe,$id = null,$year) {
        $properties = DB::table('terumbukarang')->select(DB::raw('station as stasiun,avg(dc) dc,avg(dca) dca,avg(fs) fs,avg(hc) hc,avg(ot) ot,avg(r) r,avg(s) s,avg(si) si,avg(sc) sc,avg(sp) sp'))
          ->where('year',$year)
          ->whereRaw('md5(kabupaten) = "'.$id.'"')
          ->groupBy('station')   
          ->limit(20) 
          ->get();

        return response()->json($properties);
    }

    public function prov($id) {
      $sql = MstProv::select(DB::raw('mst_prov.id, mst_prov.name'))
          ->where('id_area', $id)
          ->where('coremap', '1')
          ->get();

      return response()->json($sql);
    }

    public function provByYearAndDataType($year,$datatype) {
      
      $table = $this->getTable($datatype);
      
      $sql = DB::table($table)->select(DB::raw('provinsi,md5(provinsi) id'))
          ->where('year', $year)
          ->where('provinsi','!=',"")
          ->groupBy('provinsi')
          ->get();

      return response()->json($sql);
    }

    public function getKabByProvYearDataType($prov,$year,$datatype) {
      
      $table = $this->getTable($datatype);

      $sql = DB::table($table)->select(DB::raw('kabupaten,md5(kabupaten) id'))
          ->whereRaw('md5(provinsi) = "'.$prov.'"' )
          ->where('year',$year)
          ->where('kabupaten', '!=' , "")
          ->groupBy('kabupaten')
          ->get();

      return response()->json($sql);
    }

    public function kab($id) {
      $sql = MstKab::select(DB::raw('mst_kabkot.id, mst_kabkot.name'))
          ->where('id_mst_prov', $id)
          ->get();

      return response()->json($sql);
    }

   public function tahunData($id) {
      $sql = AppStasiun::select(DB::raw('YEAR(date) as tahun'))
          ->where('date', '<>', '0000-00-00')
          ->where('id', $id)
          ->whereNotNull('date')
          ->groupBy('date')
          ->get();

      return response()->json($sql);
   }

    public function coral_condition_json($year = 2016,$location = 'all'){
        $coraljson = array();
        if($location == 'west'){
          for($i=4;$i>=0;$i--){
            $year_last_5 = $year - $i;
            $sql = AppCoralCondition::select(DB::raw('year AS date, WestCond1 AS poor, WestCond2 AS fair, WestCond3 AS good, WestCond4 AS excellent'))
            ->where('Year', $year_last_5)
            ->get();
            foreach ($sql as $item) {
              $datacoral = array(
                'date' => $item->date,
                'value'=> $item->poor,
                'value2'=> $item->fair,
                'value3'=> $item->good,
                'value4'=> $item->excellent
              );
              array_push($coraljson, $datacoral);
            }
          }

        }else if($location == 'east'){
          for($i=4;$i>=0;$i--){
            $year_last_5 = $year - $i;
            $sql = AppCoralCondition::select(DB::raw('year AS date, EastCond1 AS poor, EastCond2 AS fair, EastCond3 AS good, EastCond4 AS excellent'))
            ->where('Year', $year_last_5)
            ->get();
            foreach ($sql as $item) {
              $datacoral = array(
                'date' => $item->date,
                'value'=> $item->poor,
                'value2'=> $item->fair,
                'value3'=> $item->good,
                'value4'=> $item->excellent
              );
              array_push($coraljson, $datacoral);
            }
          }
        }else if($location == 'central'){
          for($i=4;$i>=0;$i--){
            $year_last_5 = $year - $i;
            $sql = AppCoralCondition::select(DB::raw('year AS date, CentralCond1 AS poor, CentralCond2 AS fair, CentralCond3 AS good, CentralCond4 AS excellent'))
            ->where('Year', $year_last_5)
            ->get();
            foreach ($sql as $item) {
              $datacoral = array(
                'date' => $item->date,
                'value'=> $item->poor,
                'value2'=> $item->fair,
                'value3'=> $item->good,
                'value4'=> $item->excellent
              );
              array_push($coraljson, $datacoral);
            }
          }
        }else if($location == 'all'){
          for($i=4;$i>=0;$i--){
            $year_last_5 = $year - $i;
            $sql = AppCoralCondition::select(DB::raw('year AS date, InaCond1 AS poor, InaCond2 AS fair, InaCond3 AS good, InaCond4 AS excellent'))
            ->where('Year', $year_last_5)
            ->get();
            foreach ($sql as $item) {
              $datacoral = array(
                'date' => $item->date,
                'value'=> $item->poor,
                'value2'=> $item->fair,
                'value3'=> $item->good,
                'value4'=> $item->excellent
              );
              array_push($coraljson, $datacoral);
            }
          }
        }



      return response()->json($coraljson);
    }


    public function coral_condition_json_tahun($year = 2016,$location = 'west'){
        $coraljson = array();
        if($location == 'west'){
                $sql = AppCoralCondition::select(DB::raw('year AS date, WestCond1 AS poor, WestCond2 AS fair, WestCond3 AS good, WestCond4 AS excellent'))
                    ->where('Year', $year)
                    ->get();
                foreach ($sql as $item) {

                    $json = array(array('kondisi'=>'Poor','value'=>$item->poor,'color'=>'#FF0F00'),
                        array('kondisi'=>'Fair','value'=>$item->fair,'color'=>'#FF6600'),
                        array('kondisi'=>'Good','value'=>$item->good,'color'=>'#FF9E01'),
                        array('kondisi'=>'Excellent','value'=>$item->excellent,'color'=>'#FCD202')
                    );
                    array_push($coraljson, $json);
            }

        }else if($location == 'east'){
                $sql = AppCoralCondition::select(DB::raw('year AS date, EastCond1 AS poor, EastCond2 AS fair, EastCond3 AS good, EastCond4 AS excellent'))
                    ->where('Year', $year)
                    ->get();
                foreach ($sql as $item) {

                    $json = array(array('kondisi'=>'Poor','value'=>$item->poor,'color'=>'#FF0F00'),
                        array('kondisi'=>'Fair','value'=>$item->fair,'color'=>'#FF6600'),
                        array('kondisi'=>'Good','value'=>$item->good,'color'=>'#FF9E01'),
                        array('kondisi'=>'Excellent','value'=>$item->excellent,'color'=>'#FCD202')
                    );
                    array_push($coraljson, $json);

            }
        }else if($location == 'central'){
                 $sql = AppCoralCondition::select(DB::raw('year AS date, CentralCond1 AS poor, CentralCond2 AS fair, CentralCond3 AS good, CentralCond4 AS excellent'))
                    ->where('Year', $year)
                    ->get();
                foreach ($sql as $item) {

                    $json = array(array('kondisi'=>'Poor','value'=>$item->poor,'color'=>'#FF0F00'),
                        array('kondisi'=>'Fair','value'=>$item->fair,'color'=>'#FF6600'),
                        array('kondisi'=>'Good','value'=>$item->good,'color'=>'#FF9E01'),
                        array('kondisi'=>'Excellent','value'=>$item->excellent,'color'=>'#FCD202')
                    );
                    array_push($coraljson, $json);
                }

        }else if($location == 'all'){
                $sql = AppCoralCondition::select(DB::raw('year AS date, InaCond1 AS poor, InaCond2 AS fair, InaCond3 AS good, InaCond4 AS excellent'))
                    ->where('Year', $year)
                    ->get();
                foreach ($sql as $item) {

                    $json = array(array('kondisi'=>'Poor','value'=>$item->poor,'color'=>'#FF0F00'),
                        array('kondisi'=>'Fair','value'=>$item->fair,'color'=>'#FF6600'),
                        array('kondisi'=>'Good','value'=>$item->good,'color'=>'#FF9E01'),
                        array('kondisi'=>'Excellent','value'=>$item->excellent,'color'=>'#FCD202')
                        );
                    array_push($coraljson, $json);
                }

        }
        return response()->json($json);
    }

    public function getYear($datatype = "coral") {
      $data = [];
      if ($datatype == "coral") {
        $table = "terumbukarang";
      } else if ($datatype == "seagrass") {
        $table = "data_lamun";
      } else if ($datatype == "mangrove") {
        $table = "data_mangrove";
      } else {
        $data[] = array("year"=>"Please Choose Data First");
      }
 
      if (count($data) == 0) {
        $data = DB::table($table)->select('year')
          ->groupBy('year')
          ->get();
      }

      return response()->json($data);
    }

    function getTable($datatype) {
      if ($datatype == "coral") {
        $table = "terumbukarang";
      } else if ($datatype == "seagrass") {
        $table = "data_lamun";
      } else if ($datatype == "mangrove") {
        $table = "data_mangrove";
      }

      return $table;
    }

    /*--- rahmat changes --*/
    public function LamunCondition($id = 0) {
      $sql_year = DB::select('select distinct(year) as year from data_lamun where ratatutupan is not null');
      $isi = [];
      foreach ($sql_year as $value) {
        $isi[$value->year]['miskin'] = 0;
        $isi[$value->year]['miskin_ids'] = "";
        $isi[$value->year]['kurang_sehat'] = 0;
        $isi[$value->year]['kurang_sehat_ids'] = "";
        $isi[$value->year]['sehat_ids'] = 0;
        $isi[$value->year]['sehat_ids'] = "";
      }

      $data = [];

      $sql = DB::select('select year,id,ratatutupan from data_lamun where ratatutupan is not null');
      
      foreach($sql as $val){
        if($val->ratatutupan < 30) {
          $isi[$val->year]['miskin'] += 1;
          $isi[$val->year]['miskin_ids'] .= ",".$val->id;
        }else if( $val->ratatutupan >= 60){
          $isi[$val->year]['sehat'] += 1;
          $isi[$val->year]['sehat_ids'] .= ",".$val->id;
        }else{
          $isi[$val->year]['kurang_sehat'] += 1;
          $isi[$val->year]['kurang_sehat_ids'] .= ",".$val->id;
        }
        $isi[$val->year]['date'] = $val->year;
      }

      foreach($isi as $val){
        $data[] = $val;
      }

      return response()->json($data);
    }

    public function LamunConditionTable($id = 0) {
      $sql_year = DB::select('select distinct(year) as year from data_lamun where ratatutupan is not null ORDER BY year DESC LIMIT 5');
      $isi = [];
      $years = [];

      foreach ($sql_year as $value) {
        $years[] = $value->year;
        $isi[$value->year]['miskin'] = 0;
        $isi[$value->year]['miskin_ids'] = "";
        $isi[$value->year]['kurang_sehat'] = 0;
        $isi[$value->year]['kurang_sehat_ids'] = "";
        $isi[$value->year]['sehat_ids'] = 0;
        $isi[$value->year]['sehat_ids'] = "";
      }

      $data = [];

      $sql = DB::select('select year,id,ratatutupan from data_lamun where year IN ('.implode(',', $years).') AND ratatutupan is not null');
      
      foreach($sql as $val){
        if($val->ratatutupan < 30) {
          $isi[$val->year]['miskin'] += 1;
          $isi[$val->year]['miskin_ids'] .= ",".$val->id;
        }else if( $val->ratatutupan >= 60){
          $isi[$val->year]['sehat'] += 1;
          $isi[$val->year]['sehat_ids'] .= ",".$val->id;
        }else{
          $isi[$val->year]['kurang_sehat'] += 1;
          $isi[$val->year]['kurang_sehat_ids'] .= ",".$val->id;
        }
        $isi[$val->year]['date'] = $val->year;
      }

      $table = "";
      foreach($isi as $val){
        $table .= "<tr align='center'>";
        $table .= "<td>".$val['date']."</td>";
        $table .= "<td>".$val['miskin']."</td>";
        $table .= "<td>".$val['kurang_sehat']."</td>";
        $table .= "<td>".$val['sehat']."</td>";
        $table .= "</tr>";
      }
      echo $table;
    }
    /*-- end of lamun --*/

    public function MangroveCondition($id = 0) {
      $sql_year = DB::select('select distinct(year) as year from data_mangrove where (cover is not null AND kerapatan IS NOT NULL)');
      $isi = [];
      foreach ($sql_year as $value) {
        $isi[$value->year]['rusak'] = 0;
        $isi[$value->year]['rusak_ids'] = "";
        $isi[$value->year]['sedang'] = 0;
        $isi[$value->year]['sedang_ids'] = "";
        $isi[$value->year]['baik_ids'] = 0;
        $isi[$value->year]['baik_ids'] = "";
        $isi[$value->year]['lainnya'] = 0;
        $isi[$value->year]['lainnya_ids'] = "";
      }

      $data = [];

      $sql = DB::select('select year,id,cover,kerapatan from data_mangrove where (cover is not null AND kerapatan IS NOT NULL)');
      
      foreach($sql as $val){
        /*
        if($val->cover < 50 && $val->kerapatan < 1000) {
          $isi[$val->year]['rusak'] += 1;
          $isi[$val->year]['rusak_ids'] .= ",".$val->id;
        }else if( ($val->cover >= 50 && $val->cover <= 75) && ($val->kerapatan >= 1000 && $val->kerapatan < 1500) ){
          $isi[$val->year]['sedang'] += 1;
          $isi[$val->year]['sedang_ids'] .= ",".$val->id;
        }else if($val->cover >= 75 && $val->kerapatan >= 15000){
          $isi[$val->year]['baik'] += 1;
          $isi[$val->year]['baik_ids'] .= ",".$val->id;
        }
        */
        if($val->cover < 50) {
          $isi[$val->year]['rusak'] += 1;
          $isi[$val->year]['rusak_ids'] .= ",".$val->id;
        }else if( $val->cover >= 50 && $val->cover < 75 ){
          $isi[$val->year]['sedang'] += 1;
          $isi[$val->year]['sedang_ids'] .= ",".$val->id;
        }else if($val->cover >= 75){
          $isi[$val->year]['baik'] += 1;
          $isi[$val->year]['baik_ids'] .= ",".$val->id;
        }
        $isi[$val->year]['date'] = $val->year;
      }

      foreach($isi as $val){
        $data[] = $val;
      }

      return response()->json($data);
    }

    public function MangroveConditionTable($id = 0) {
      $sql_year = DB::select('select distinct(year) as year from data_mangrove where (cover is not null AND kerapatan IS NOT NULL)');
      $isi = [];
      foreach ($sql_year as $value) {
        $isi[$value->year]['rusak'] = 0;
        $isi[$value->year]['rusak_ids'] = "";
        $isi[$value->year]['sedang'] = 0;
        $isi[$value->year]['sedang_ids'] = "";
        $isi[$value->year]['baik_ids'] = 0;
        $isi[$value->year]['baik_ids'] = "";
        $isi[$value->year]['lainnya'] = 0;
        $isi[$value->year]['lainnya_ids'] = "";
      }

      $data = [];

      $sql = DB::select('select year,id,cover,kerapatan from data_mangrove where (cover is not null AND kerapatan IS NOT NULL)');
      
      foreach($sql as $val){
        if($val->cover < 50) {
          $isi[$val->year]['rusak'] += 1;
          $isi[$val->year]['rusak_ids'] .= ",".$val->id;
        }else if( $val->cover >= 50 && $val->cover < 75 ){
          $isi[$val->year]['sedang'] += 1;
          $isi[$val->year]['sedang_ids'] .= ",".$val->id;
        }else if($val->cover >= 75){
          $isi[$val->year]['baik'] += 1;
          $isi[$val->year]['baik_ids'] .= ",".$val->id;
        }
        $isi[$val->year]['date'] = $val->year;
      }

      $table = "";
      foreach($isi as $val){
        $table .= "<tr align='center'>";
        $table .= "<td>".$val['date']."</td>";
        $table .= "<td>".$val['rusak']."</td>";
        $table .= "<td>".$val['sedang']."</td>";
        $table .= "<td>".$val['baik']."</td>";
        $table .= "</tr>";
      }
      echo $table;
    }
}
