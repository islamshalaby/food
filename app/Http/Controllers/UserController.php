<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;
use App\Helpers\APIHelpers;
use App\UserNotification;
use App\Notification;


class UserController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api' , ['except' => ['resetforgettenpassword' , 'checkphoneexistance' , 'checkphoneexistanceandroid']]);
    }

    public function getprofile(Request $request){
        $user = auth()->user();
        $returned_user['user_name'] = $user['name'];
        $returned_user['phone'] = $user['phone'];
        $returned_user['email'] = $user['email'];
        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $returned_user , $request->lang);
        return response()->json($response , 200);  
    }

    public function updateprofile(Request $request){
        $validator = Validator::make($request->all(), [
            'name' => 'required',
            'phone' => 'required',
            "email" => 'required',
        ]);

        if ($validator->fails()) {
            $response = APIHelpers::createApiResponse(true , 406 , 'Missing Required Fields' , 'بعض الحقول مفقودة' , null , $request->lang);
            return response()->json($response , 406);
        }

        $currentuser = auth()->user();
        $user_by_phone = User::where('phone' , '!=' , $currentuser->phone )->where('phone', $request->phone)->first();
        if($user_by_phone){
            $response = APIHelpers::createApiResponse(true , 409 , 'Phone Exists Before' , 'رقم الهاتف موجود من قبل' , null , $request->lang);
            return response()->json($response , 409);
        }

        $user_by_email = User::where('email' , '!=' ,$currentuser->email)->where('email' , $request->email)->first();
        if($user_by_email){
            $response = APIHelpers::createApiResponse(true , 409 , 'Email Exists Before' , 'البريد الإلكتروني موجود من قبل' , null , $request->lang);
            return response()->json($response , 409); 
        }

        User::where('id' , $currentuser->id)->update([
            'name' => $request->name , 
            'phone' => $request->phone , 
            'email' => $request->email  ]);

        $newuser = User::find($currentuser->id);
        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $newuser , $request->lang);
        return response()->json($response , 200);    
    }


    public function resetpassword(Request $request){
        $validator = Validator::make($request->all() , [
            'password' => 'required',
			"old_password" => 'required'
        ]);

        if($validator->fails()) {
            $response = APIHelpers::createApiResponse(true , 406 , 'Missing Required Fields' , 'بعض الحقول مفقودة' , null , $request->lang);
            return response()->json($response , 406);
        }

        $user = auth()->user();
		if(!Hash::check($request->old_password, $user->password)){
			$response = APIHelpers::createApiResponse(true , 406 , 'Wrong old password' , 'كلمه المرور السابقه خطأ' , null , $request->lang);
            return response()->json($response , 406);
		}
		if($request->old_password == $request->password){
			$response = APIHelpers::createApiResponse(true , 406 , 'You cannot set the same previous password' , 'لا يمكنك تعيين نفس كلمه المرور السابقه' , null , $request->lang);
            return response()->json($response , 406);
		}
        User::where('id' , $user->id)->update(['password' => Hash::make($request->password)]);
        $newuser = User::find($user->id);
        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $newuser , $request->lang);
        return response()->json($response , 200);
    }

    public function resetforgettenpassword(Request $request){
        $validator = Validator::make($request->all() , [
            'password' => 'required',
            'phone' => 'required'
        ]);

        if($validator->fails()) {
            $response = APIHelpers::createApiResponse(true , 406 , 'Missing Required Fields' , 'بعض الحقول مفقودة' , null , $request->lang);
            return response()->json($response , 406);
        }

        $user = User::where('phone', $request->phone)->first();
        if(! $user){
            $response = APIHelpers::createApiResponse(true , 403 , 'Phone Not Exists Before' , 'رقم الهاتف غير موجود' , null , $request->lang);
            return response()->json($response , 403);
        }

        User::where('phone' , $user->phone)->update(['password' => Hash::make($request->password)]);
        $newuser = User::where('phone' , $user->phone)->first();
		
		$token = auth()->login($newuser);
        $newuser->token = $this->respondWithToken($token);
		
        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $newuser , $request->lang);
        return response()->json($response , 200);
    }

    // check if phone exists before or not
    public function checkphoneexistance(Request $request)
    {
        $validator = Validator::make($request->all() , [
            'phone' => 'required'
        ]);

        // dd($request->all());
        if($validator->fails()) {
            $response = APIHelpers::createApiResponse(true , 406 , 'Missing Required Fields' , 'حقل الهاتف اجباري' , null , $request->lang);
            return response()->json($response , 406);
        }
        
        $user = User::where('phone' , $request->phone)->first();
        if($user){
			
		if($request->email){
			$user_email = User::where('email' , $request->email)->first();
		if($user_email){
            $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $user_email , $request->lang);
			$response['phone'] = true;
			$response['email'] = true;
            return response()->json($response , 200);
        }else{
		            $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $user , $request->lang);
			$response['phone'] = true;
			$response['email'] = false;
            return response()->json($response , 200);
		}
			
		}
			$response = APIHelpers::createApiResponse(false , 200 , '' , '' , $user , $request->lang);
            return response()->json($response , 200);
        }
		if($request->email){
			$user_email = User::where('email' , $request->email)->first();
		if($user_email){
            $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $user_email , $request->lang);
			$response['phone'] = false;
			$response['email'] = true;
            return response()->json($response , 200);
        }
			
		}

        $response = APIHelpers::createApiResponse(true , 403 , 'Phone and Email Not Exists Before' , 'الهاتف و البريد غير موجودين من قبل' , null , $request->lang);
		$response['phone'] = false;
		$response['email'] = false;
		
        return response()->json($response , 403);

    }

 
public function checkphoneexistanceandroid(Request $request)
    {
        $validator = Validator::make($request->all() , [
            'phone' => 'required'
        ]);

        if($validator->fails()) {
            $response = APIHelpers::createApiResponse(true , 406 , 'Missing Required Fields' , 'حقل الهاتف اجباري' , (object)[] , $request->lang);
            return response()->json($response , 406);
        }
        
        $user = User::where('phone' , $request->phone)->first();
	
        if($user){
			
		if($request->email){
			$user_email = User::where('email' , $request->email)->first();
		if($user_email){
            $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $user_email , $request->lang);
			$response['phone'] = true;
			$response['email'] = true;
			
            return response()->json($response , 200);
        }else{
			
		            $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $user , $request->lang);
			$response['phone'] = true;
			$response['email'] = false;
            return response()->json($response , 200);
		}
			
		}
			
			$response = APIHelpers::createApiResponse(false , 200 , '' , '' , $user , $request->lang);
            return response()->json($response , 200);
        }
		if($request->email){
			$user_email = User::where('email' , $request->email)->first();
		if($user_email){
            $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $user_email , $request->lang);
			$response['phone'] = false;
			$response['email'] = true;
            return response()->json($response , 200);
        }
			
		}

        $response = APIHelpers::createApiResponse(false , 200 , 'Phone and Email Not Exists Before' , 'الهاتف و البريد غير موجودين من قبل' , (object)[] , $request->lang);
		$response['phone'] = false;
		$response['email'] = false;
		
        return response()->json($response , 200);

    }

	
	
	
    // get notifications
    public function notifications(Request $request){
        $user = auth()->user();
        if($user->active == 0){
            $response = APIHelpers::createApiResponse(true , 406 , 'Your Account Blocked By Admin' , 'تم حظر حسابك من الادمن' , null , $request->lang);
            return response()->json($response , 406);
        }

        $user_id = $user->id;
        $notifications_ids = UserNotification::where('user_id' , $user_id)->orderBy('id' , 'desc')->select('notification_id')->get();
        $notifications = [];
        for($i = 0; $i < count($notifications_ids); $i++){
            $notifications[$i] = Notification::select('id','title' , 'body' ,'image' , 'created_at')->find($notifications_ids[$i]['notification_id']);
        }
        $data['notifications'] = $notifications;
        $response = APIHelpers::createApiResponse(false , 200 ,  '' , '' ,$data['notifications'] , $request->lang);
        return response()->json($response , 200);  
    }
	
	    protected function respondWithToken($token)
    {
        return [
            'access_token' => $token,
            'token_type' => 'bearer',
            'expires_in' => auth()->factory()->getTTL() * 432000
        ];
    }


}
