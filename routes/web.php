<?php

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/

// Route::get('/', function () {
//     return view('welcome');
// });

Route::get('/set_lang/{id?}', 'WebController@set_lang')->name('set_lang');
Route::get('/', 'DashboardController@landing');
Route::get('/files', 'DashboardController@files')->name('files');
Route::get('/download/{id}', 'DashboardController@download')->name('download');
Route::get('/crmis', 'DashboardController@index');

/*** JSON dashboard ***/
Route::get('/json', 'JsonController@index');
Route::get('/json/getyear/{datatipe}', 'JsonController@getYear');
Route::get('/json/stasiun', 'JsonController@stasiun');
Route::get('/json/prov/{id}', 'JsonController@prov');
Route::get('/json/kab/{id}', 'JsonController@kab');
Route::get('/json/corals/{id?}', 'JsonController@coral');
Route::get('/json/coral_top/{id}', 'JsonController@coral_top');
Route::get('/json/coral_bot/{id?}', 'JsonController@coral_bot');
Route::get('/json/coral_bot_mangrove/{id?}', 'JsonController@coral_bot_mangrove');
Route::get('/json/coral_bot_seagrass/{id?}', 'JsonController@coral_bot_seagrass');
Route::get('/json/coral/condition/{id?}', 'JsonController@coralCondition');
Route::get('/json/coral/conditiontable', 'JsonController@coralConditiontable');
Route::get('/json/mangrove/condition/{id?}', 'JsonController@MangroveCondition');
Route::get('/json/mangrove/conditiontable/{id?}', 'JsonController@MangroveConditionTable');
Route::get('/json/lamun/condition/{id?}', 'JsonController@LamunCondition');
Route::get('/json/lamun/conditiontable/{id?}', 'JsonController@LamunConditionTable');
Route::get('/json/ecosystem/{id?}', 'JsonController@ecosystem');
Route::get('/json/year', 'JsonController@tahun');
Route::get('/json/tahun/{id}', 'JsonController@tahunData');
Route::get('/json/stasiun/{year}/{subdistict}/{datatype}', 'JsonController@getStationByYearSubDisctrictDataType');
Route::get('/json/corals/{tipe?}/{id?}/{year?}', 'JsonController@coral');
Route::get('/json/coral_bot/{tipe?}/{id?}/{year?}', 'JsonController@coral_bot');
Route::get('/json/ecosystem/{tipe?}/{id?}/{year?}', 'JsonController@ecosystem');



Route::get('/json/getprov/{year}/{datatype}', 'JsonController@provByYearAndDataType');
Route::get('/json/getkab/{prov}/{year}/{datatype}', 'JsonController@getKabByProvYearDataType');

/** JSON crmis **/
Route::get('/json/coral_condition/{year}/{location}', 'JsonController@coral_condition_json');
Route::get('/json/coral_condition_tahun/{year}/{location}', 'JsonController@coral_condition_json_tahun');

Route::group(['prefix' => 'api'], function(){
  Route::get('data_in_histories/{id}', 'GeneralApiController@data_from_table')->name('data_in_db');
  Route::get('get_chained_data', 'GeneralApiController@get_chained_data')->name('chained_data');
});

Route::get('registrasi', 'WebController@registrasi')->name("registrasi");
Route::get('verify/{id}', 'WebController@verify')->name("verify");
Route::post('postSignup', 'WebController@postregistrasi')->name('postSignup');