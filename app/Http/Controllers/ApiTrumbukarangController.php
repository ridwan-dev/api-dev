<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use Illuminate\Contracts\Auth\Guard;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Mail;



use App\Http\Requests;

class ApiTrumbukarangController extends Controller
{
    public function __construct(Request $request) {        
        $this->year = $request->input('year');
        $this->page = $request->input('page');
        $this->size = $request->input('size');
        $this->propinsi = $request->input('propinsi');

        (int)$this->sizex = !$this->size ? 5 : $this->size;
        (int)$this->pagex = !$this->page ? 0 : (int)($this->page-1)*(int)$this->sizex;
        
    }
    

    public function terumbu_karang(){
        
        return $this->json_view('terumbukarang',['year'=>$this->year],['id','desc']);
    }
    
    public function terumbu_karang_prop(){
        
        return $this->json_view('terumbukarang',['year'=>$this->year,'provinsi'=>$this->propinsi],['id','desc']);
    }
    
    public function mangrove(){
        
        return $this->json_view('data_mangrove',['year'=>$this->year],['id','desc']);
    }

    /* TOKEN */
    private function api_token($methode="GET"){

        
	
	$url=url()->current();
	
	$postData = array(
		"Authorization" => "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJpc3MiOiJodHRwOi8vMTI3LjEuMS4xMTo5MC9hcGkvdXNlci9yZWdpc3RlciIsImlhdCI6MTU3NDU5MjY1NiwiZXhwIjoxNTc0NTk2MjU2LCJuYmYiOjE1NzQ1OTI2NTYsImp0aSI6IjI2VDNnNmZ4aVZ5RkIxenEiLCJzdWIiOjU3LCJwcnYiOiI4N2UwYWYxZWY5ZmQxNTgxMmZkZWM5NzE1M2ExNGUwYjA0NzU0NmFhIn0._pR2QHxedh1Dnpy4CL92OofbUhobPAeuXw8v9e9yIvY"
	);
	
	$header = array(
            "Content-Type: application/x-www-form-urlencoded",
            "Content-Length: ".strlen(http_build_query($postData))
        );
	
	$params = array('http' =>
		array(
		'method'  => $methode,
		'header' => $header,
		'content' => http_build_query($postData)
		)
	);

	$context = stream_context_create($params);
	$file = file_get_contents($url, false, $context);
	
	return ($file);



    }

    /* LOGIC */
    private function json_view( $dbdata=null, $where=array() , $orderby=array() ){
        
        $all_data = DB::table( $dbdata)->get();
        $c_data = count($all_data);
        
        $data = DB::table( $dbdata)
                    ->where($where)
                    ->orderBy($orderby[0],$orderby[1])
                    ->offset($this->pagex)
                    ->limit($this->sizex)
                    ->get();

        $data_thn = DB::table( $dbdata)->where($where)->get();
                        
        if(count($data_thn)>0){
            $total = count($data_thn);
        }else{
            $total = 0 ;
        }	
            
        if(count($data) > 0){
            
            (int)$pagenext = !(int)$this->page ? 0 : (int)($this->page)*(int)$this->sizex;
            $datanext = DB::table( $dbdata)
                                ->where($where)
                                ->orderBy($orderby[0],$orderby[1])
                                ->offset($this->pagenext)
                                ->limit($this->sizex)
                                ->get();		
            
            if(count($datanext) <= 0){
                $next_page = false;
            }else{
                $next_page = true;
            }
            
            $data = json_decode(strtolower(json_encode($data)));
            $result = array(
                "data" => $data,
                "error" => '',
                "cursorInfo" => array(
                    "year" => (int)$this->year,
                    "page"=> (int)$this->page,
                    "size"=> (int)$this->size,
                    "totalData"=> (int)$total,
                    "hasMore"=> $next_page
                )
            );
            
        }else{
            
            $data = DB::table( $dbdata)->where($where)->get();

            if(count($data)>0){
                $total = count($data);
            }else{
                $total = 0 ;
            }			
            
            $result = array(
                "data" => array(),
                "error" => 'data not found',
                "cursorInfo" => array(
                    "year" => (int)$this->year,
                    "page"=> (int)$this->page,
                    "size"=> (int)$this->size,
                    "totalData"=> (int)$total,
                    "hasMore"=> false
                )
            );
        }
	
        return response()->json($result, 200);
    }
}
