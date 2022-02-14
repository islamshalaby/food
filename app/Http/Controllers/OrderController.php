<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\User;
use App\UserAddress;
use App\Area;
use App\Visitor;
use App\Product;
use App\ProductImage;
use App\Cart;
use App\Order;
use App\OrderItem;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Helpers\APIHelpers;
use App\Setting;

class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api' , ['except' => ['excute_pay' , 'pay_sucess' , 'pay_error', 'create']]);
    }
    
    public function create(Request $request){
        $validator = Validator::make($request->all(), [
            'unique_id' => 'required',
            'address_id' => 'required',
            'payment_method' => 'required'
        ]);

        if ($validator->fails()) {
            $response = APIHelpers::createApiResponse(true , 406 , 'Missing Required Fields' , 'بعض الحقول مفقودة'  , null , $request->lang);
            return response()->json($response , 406);
        }

        $user = auth()->user();

        $visitor  = Visitor::where('unique_id' , $request->unique_id)->first();
        $visitor_id = $visitor->id;
        $cart = Cart::where('visitor_id' , $visitor_id)->get();

        if(count($cart) == 0){
            $response = APIHelpers::createApiResponse(true , 406 , 'Missing Required Fields' , 'بعض الحقول مفقودة'  , null , $request->lang);
            return response()->json($response , 406);
        }

        $sub_total_price = 0;
        for($i = 0; $i < count($cart); $i++){
            $product = Product::select('id' , 'final_price' , 'remaining_quantity')->find($cart[$i]['product_id']);
            if($product->remaining_quantity < $cart[$i]['count']){
                $response = APIHelpers::createApiResponse(true , 406 , 'The remaining amount of the product is not enough' , 'الكميه المتبقيه من المنتج غير كافيه'  , null , $request->lang);
                return response()->json($response , 406);
            }
            if($request->payment_method == 2 || $request->payment_method == 3){
                $product->remaining_quantity = $product->remaining_quantity - $cart[$i]['count'];
                // return $product->remaining_quantity ;
                $product->save();
    
                
            }
            $sub_total_price = $sub_total_price + ($product['final_price'] * $cart[$i]['count']);

        }
        $minOrder = Setting::where('id', 1)->select('min_order')->first()['min_order'];

        if ($sub_total_price < $minOrder) {
            $response = APIHelpers::createApiResponse(true , 406 , 'Minimum order value is more than your order value' , 'قيمة طلب لم تصل بعد للحد الأدنى للطلب'  , null , $request->lang);
            return response()->json($response , 406);
        }

        $area_id = UserAddress::find($request->address_id)['area_id'];
        $delivery_cost = Area::find($area_id)['delivery_cost'];

    if($request->payment_method == 2 || $request->payment_method == 3){

        $order = new Order();
        if($user) {
            $order->user_id = $user->id;
        }
        $order->address_id = $request->address_id;
        $order->payment_method = $request->payment_method;
        $order->subtotal_price = $sub_total_price;
        $order->delivery_cost = $delivery_cost;
        $order->total_price = $sub_total_price + $delivery_cost;
        $order->order_number = substr(time() , -7);
        $order->save();

        for($i = 0; $i < count($cart); $i++){
            $order_item =  new OrderItem();
            $order_item->order_id = $order->id;
            $order_item->product_id = $cart[$i]['product_id'];
            $order_item->count = $cart[$i]['count'];
            $order_item->save();
            $cartItem = Cart::find($cart[$i]['id']);
            $cartItem->delete();                       
        }

        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , [] , $request->lang);
		$response['androidData'] = new \stdClass();
		
        return response()->json($response , 200);
    }else{
        $root_url = $request->root();
        $customerName = $request->unique_id;
        $customerEmail = "visitor@visitor.com";
        $userId = 0;
        if ($user) {
            $customerName = $user->name;
            $customerEmail = $user->email;
            $userId = $user->id;
        }

        $path='https://apitest.myfatoorah.com/v2/SendPayment';
        $livePath = "https://api.myfatoorah.com/v2/SendPayment";
        $token="bearer rLtt6JWvbUHDDhsZnfpAhpYk4dxYDQkbcPTyGaKp2TYqQgG7FGZ5Th_WD53Oq8Ebz6A53njUoo1w3pjU1D4vs_ZMqFiz_j0urb_BH9Oq9VZoKFoJEDAbRZepGcQanImyYrry7Kt6MnMdgfG5jn4HngWoRdKduNNyP4kzcp3mRv7x00ahkm9LAK7ZRieg7k1PDAnBIOG3EyVSJ5kK4WLMvYr7sCwHbHcu4A5WwelxYK0GMJy37bNAarSJDFQsJ2ZvJjvMDmfWwDVFEVe_5tOomfVNt6bOg9mexbGjMrnHBnKnZR1vQbBtQieDlQepzTZMuQrSuKn-t5XZM7V6fCW7oP-uXGX-sMOajeX65JOf6XVpk29DP6ro8WTAflCDANC193yof8-f5_EYY-3hXhJj7RBXmizDpneEQDSaSz5sFk0sV5qPcARJ9zGG73vuGFyenjPPmtDtXtpx35A-BVcOSBYVIWe9kndG3nclfefjKEuZ3m4jL9Gg1h2JBvmXSMYiZtp9MR5I6pvbvylU_PP5xJFSjVTIz7IQSjcVGO41npnwIxRXNRxFOdIUHn0tjQ-7LwvEcTXyPsHXcMD8WtgBh-wxR8aKX7WPSsT1O8d8reb2aR7K3rkV3K82K_0OgawImEpwSvp9MNKynEAJQS6ZHe_J_l77652xwPNxMRTMASk1ZsJL";
        $liveToken = "bearer sgp2x0_W2ky4uH7w8HaeiD3ugkaq873yGgeWjI1AOOpOmX0W-iGAbwwD8IKuj9OeDHeMq-XxqfoZznSbMdJc51_uxb8TU03rcrc3a5Hc4_GqslLOmTr0F-03D1jajvv5Fx42cnCi3Bb-VlLadqhI-38WIz1fa07Rj0MSFxQQ2cfnh1xjMhYI3V777sTeMiMyRmUH7NoH38hNyBmByYbkvBd8jLNTwqiNqQCVhY0FYp9Ky1v4bx9SNnpnouqBpgNC_tnC7KDIoY4cmoY7xOqAEyXcGKZIV6kEPESWT5SeoIPGAIRXUORADA6tiBJm12-Mjewwuko-qPF7sHvXfUrp2G0zM0ALVokhUOUNpdYodHKSwitJcqyeT4zkNCPmVZ8wwY0fy9THFrhzMJEn_U4Hv38ERieBjFq4c5japGXjd7pjYdZtu4op_nny_Sc1sIQjSXd68v4t7hs04ZxuDB1gO1GiHU7x9DQ3Rju_7wYg6C4aOYHwid1M4zuGmweRRrdLr0VJleMJQq4f5WbE8q_hILzU1ZwGoSWwc9lRnH-nQ6pBbsp6u-pZTZZnxh_jQmIYrtrkAYiNzYP-zW-D78gnZeaiepJNmOPAxSovMf1A4zYxLfNG6N7TdQM9m8ASkpScJrYZTgk0bkw9apI0q8uf3he0DO7qzeadoTG9vlzfBq2S9t_lvBNwgcOPEmkEBR5aK0cAzk40I5MvHsxilMh_qj4V4AqqRCq03Ru7-rfiX_AV0Q_Q";

        $headers = array(
            'Authorization:' .$liveToken,
            'Content-Type:application/json'
        );
        $price = $sub_total_price + $delivery_cost;
        $call_back_url = $root_url."/api/excute_pay?user_id=".$userId."&unique_id=".$request->unique_id."&address_id=".$request->address_id."&payment_method=".$request->payment_method;
        $error_url = $root_url."/api/pay/error";
        $fields =array(
            "CustomerName" => $customerName,
            "NotificationOption" => "LNK",
            "InvoiceValue" => $price,
            "CallBackUrl" => $call_back_url,
            "ErrorUrl" => $error_url,
            "Language" => "AR",
            "CustomerEmail" => $customerEmail
        );  

        $payload =json_encode($fields);
        $curl_session =curl_init();
        curl_setopt($curl_session,CURLOPT_URL, $livePath);
        curl_setopt($curl_session,CURLOPT_POST, true);
        curl_setopt($curl_session,CURLOPT_HTTPHEADER, $headers);
        curl_setopt($curl_session,CURLOPT_RETURNTRANSFER,true);
        curl_setopt($curl_session,CURLOPT_SSL_VERIFYPEER, false);
        curl_setopt($curl_session,CURLOPT_IPRESOLVE, CURLOPT_IPRESOLVE);
        curl_setopt($curl_session,CURLOPT_POSTFIELDS, $payload);
        $result=curl_exec($curl_session);
        
        curl_close($curl_session);
        $result = json_decode($result);
		$data['url'] = $result->Data->InvoiceURL;
		
        $response = APIHelpers::createApiResponse(false , 200 ,  '' , '' , $data , $request->lang );
		$response['androidData'] = new \stdClass();
		$response['androidData']->url = $result->Data->InvoiceURL;
        return response()->json($response , 200); 

    }
    }


    public function excute_pay(Request $request){
        $user_id = 0;
        if ($request->user_id != 0) {
            $user = User::find($request->user_id);
            $user_id = $user->id;
        }
        
        $visitor  = Visitor::where('unique_id' , $request->unique_id)->first();
        $visitor_id = $visitor->id;
        $cart = Cart::where('visitor_id' , $visitor_id)->get();


        $sub_total_price = 0;
        for($i = 0; $i < count($cart); $i++){
            $product = Product::select('id' , 'final_price' , 'remaining_quantity')->find($cart[$i]['product_id']);
            $product->remaining_quantity = $product->remaining_quantity - $cart[$i]['count'];
            $product->save();
    
            $sub_total_price = $sub_total_price + ($product['final_price'] * $cart[$i]['count']);

        }

        $area_id = UserAddress::find($request->address_id)['area_id'];
        $delivery_cost = Area::find($area_id)['delivery_cost'];


        $order = new Order();
        if ($request->user_id != 0) {
            $order->user_id = $user_id;
        }else {
            $order->visitor_id = $visitor_id;
        }
        $order->address_id = $request->address_id;
        $order->payment_method = $request->payment_method;
        $order->subtotal_price = $sub_total_price;
        $order->delivery_cost = $delivery_cost;
        $order->total_price = $sub_total_price + $delivery_cost;
        $order->order_number = substr(time() , -7);
        $order->save();

        for($i = 0; $i < count($cart); $i++){
            $order_item =  new OrderItem();
            $order_item->order_id = $order->id;
            $order_item->product_id = $cart[$i]['product_id'];
            $order_item->count = $cart[$i]['count'];
            $order_item->save();
            $cartItem = Cart::find($cart[$i]['id']);
            $cartItem->delete();                       
        }




        return redirect('api/pay/success'); 
    }

    public function pay_sucess(){
        return "Please wait ...";
    }

    public function pay_error(){
        return "Please wait ...";
    }


    public function getorders(Request $request){
        $user_id = auth()->user()->id;
        $orders = Order::where('user_id' , $user_id)->select('id' , 'status' , 'order_number' , 'created_at as date' , 'total_price' , 'status')->orderBy('id' , 'desc')->get();
        for($i = 0; $i < count($orders); $i++){
            $date = date_create($orders[$i]['date']);
            $orders[$i]['date'] = date_format($date , "d/m/Y"); 
            $ordercount = OrderItem::where('order_id' , $orders[$i]['id'])->pluck('count')->toArray();
            $orders[$i]['count'] = array_sum($ordercount);
        }
        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $orders , $request->lang);
        return response()->json($response , 200);
    }
    
    public function orderdetails(Request $request){
        $order_id = $request->id;
        $order = Order::find($order_id);
        $data['id'] = $order->id;
        $data['order_number'] = $order->order_number;
        $date = date_create($order->created_at);
        $data['date'] = date_format($date ,  'd/m/Y');
        $data['status'] = $order->status;
        $data['payment_method'] = $order->payment_method;
        $data['subtotal_price'] = $order->subtotal_price;
        $data['delivery_cost'] = $order->delivery_cost;
        $data['total_price'] = $order->total_price;
        $data['products_count'] = OrderItem::where('order_id' , $order_id)->count();
        $ids = OrderItem::where('order_id' , $order_id)->select('id','product_id')->get()->toArray();
        $products = [];
        for($i = 0; $i < count($ids); $i++){
            if($request->lang == 'en'){
                $product = Product::select('id' , 'title_en as title' , 'final_price', 'rate')->find($ids[$i]['product_id']);
            }else{
                $product = Product::select('id' , 'title_ar as title' , 'final_price')->find($ids[$i]['product_id']);
            }
            $product['count'] = OrderItem::find($ids[$i]['id'])['count'];
            $product['order_id'] = $ids[$i]['id'];
            $orderItem = OrderItem::where('id', $ids[$i]['id'])->select('id')->first();
            $product['rate'] = 0;
            if ($orderItem->rate) {
                $product['rate'] = $orderItem->rate->rate;
            }
            $product['image'] = ProductImage::where('product_id' , $product->id)->first()['image'];
            array_push($products , $product);
        }
        $address = UserAddress::select('gaddah' , 'building' , 'floor' , 'apartment_number' , 'street')->find($order->address_id);
        if($address){
            $data['address'] = $address;
        }else{
            $data['address'] = new \stdClass();
        }

        $data['products'] = $products;
        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $data , $request->lang);
        return response()->json($response , 200);

    }

}