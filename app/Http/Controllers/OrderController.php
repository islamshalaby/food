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


class OrderController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api' , ['except' => ['excute_pay' , 'pay_sucess' , 'pay_error']]);
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

        $user_id = auth()->user()->id;
        $visitor  = Visitor::where('unique_id' , $request->unique_id)->first();
        $user_id_unique_id = $visitor->user_id;
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

        $area_id = UserAddress::find($request->address_id)['area_id'];
        $delivery_cost = Area::find($area_id)['delivery_cost'];

    if($request->payment_method == 2 || $request->payment_method == 3){

        $order = new Order();
        $order->user_id = $user_id;
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
        $user = auth()->user();

        $path='https://apitest.myfatoorah.com/v2/SendPayment';
        $token="bearer fVysyHHk25iQP4clu6_wb9qjV3kEq_DTc1LBVvIwL9kXo9ncZhB8iuAMqUHsw-vRyxr3_jcq5-bFy8IN-C1YlEVCe5TR2iCju75AeO-aSm1ymhs3NQPSQuh6gweBUlm0nhiACCBZT09XIXi1rX30No0T4eHWPMLo8gDfCwhwkbLlqxBHtS26Yb-9sx2WxHH-2imFsVHKXO0axxCNjTbo4xAHNyScC9GyroSnoz9Jm9iueC16ecWPjs4XrEoVROfk335mS33PJh7ZteJv9OXYvHnsGDL58NXM8lT7fqyGpQ8KKnfDIGx-R_t9Q9285_A4yL0J9lWKj_7x3NAhXvBvmrOclWvKaiI0_scPtISDuZLjLGls7x9WWtnpyQPNJSoN7lmQuouqa2uCrZRlveChQYTJmOr0OP4JNd58dtS8ar_8rSqEPChQtukEZGO3urUfMVughCd9kcwx5CtUg2EpeP878SWIUdXPEYDL1eaRDw-xF5yPUz-G0IaLH5oVCTpfC0HKxW-nGhp3XudBf3Tc7FFq4gOeiHDDfS_I8q2vUEqHI1NviZY_ts7M97tN2rdt1yhxwMSQiXRmSQterwZWiICuQ64PQjj3z40uQF-VHZC38QG0BVtl-bkn0P3IjPTsTsl7WBaaOSilp4Qhe12T0SRnv8abXcRwW3_HyVnuxQly_OsZzZry4ElxuXCSfFP2b4D2-Q";

        $headers = array(
            'Authorization:' .$token,
            'Content-Type:application/json'
        );
        $price = $sub_total_price + $delivery_cost;
        $call_back_url = $root_url."/api/excute_pay?user_id=".$user->id."&unique_id=".$request->unique_id."&address_id=".$request->address_id."&payment_method=".$request->payment_method;
        $error_url = $root_url."/api/pay/error";
        $fields =array(
            "CustomerName" => $user->name,
            "NotificationOption" => "LNK",
            "InvoiceValue" => $price,
            "CallBackUrl" => $call_back_url,
            "ErrorUrl" => $error_url,
            "Language" => "AR",
            "CustomerEmail" => $user->email
        );  

        $payload =json_encode($fields);
        $curl_session =curl_init();
        curl_setopt($curl_session,CURLOPT_URL, $path);
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
        $user = User::find($request->user_id);
        $user_id = $user->id;
        $visitor  = Visitor::where('unique_id' , $request->unique_id)->first();
        $user_id_unique_id = $visitor->user_id;
        $visitor_id = $visitor->id;
        $cart = Cart::where('visitor_id' , $visitor_id)->get();


        $sub_total_price = 0;
        for($i = 0; $i < count($cart); $i++){
            $product = Product::select('id' , 'final_price' , 'remaining_quantity')->find($cart[$i]['product_id']);
       
                $product->remaining_quantity = $product->remaining_quantity - $cart[$i]['count'];
                // return $product->remaining_quantity ;
                $product->save();
    
            $sub_total_price = $sub_total_price + ($product['final_price'] * $cart[$i]['count']);

        }

        $area_id = UserAddress::find($request->address_id)['area_id'];
        $delivery_cost = Area::find($area_id)['delivery_cost'];


        $order = new Order();
        $order->user_id = $user_id;
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
                $product = Product::select('id' , 'title_en as title' , 'final_price')->find($ids[$i]['product_id']);
            }else{
                $product = Product::select('id' , 'title_ar as title' , 'final_price')->find($ids[$i]['product_id']);
            }
            $product['count'] = OrderItem::find($ids[$i]['id'])['count'];
            
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