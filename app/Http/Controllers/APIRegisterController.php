<?php

namespace App\Http\Controllers;
use App\Http\Controllers\Controller;
use Illuminate\Http\Request;
use App\User;
use JWTFactory;
use JWTAuth;
use Validator;
use Response;
use DB;

class APIRegisterController extends Controller
{
    public function register(Request $request)
    {
        $validator = Validator::make($request->all(), [
            //'email' => 'required|string|email|max:255|unique:users',
            'email' => 'required|string|email|max:255',
            'name' => 'required',
            'password'=> 'required'
        ]);
        if ($validator->fails()) {
            return response()->json($validator->errors());
        }
        $user_db = DB::table("cms_users");
        //App\User::create([
        User::create([
            'name' => $request->get('name'),
            'email' => $request->get('email'),
            'password' => bcrypt($request->get('password')),
        ]);

        

        $user = User::orderBy('id','desc')->first();
        $token = JWTAuth::fromUser($user);
        
        return Response::json(compact('token'));
    }
}
