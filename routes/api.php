<?php

use Illuminate\Http\Request;



/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::middleware('auth:api')->get('/user', function (Request $request) {
    return $request->user();
});

Route::get('terumbu_karang', 'ApiTrumbukarangController@terumbu_karang')->middleware('jwt.verify');
Route::get('terumbu_karang_prop', 'ApiTrumbukarangController@terumbu_karang_prop');
Route::get('mangrove', 'ApiTrumbukarangController@mangrove');

Route::post('user/register', 'APIRegisterController@register');
Route::post('user/login', 'APILoginController@login');

