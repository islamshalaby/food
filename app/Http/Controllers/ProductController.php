<?php

namespace App\Http\Controllers;

use Illuminate\Support\Facades\Auth;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Helpers\APIHelpers;
use App\Product;
use App\Category;
use App\Brand;
use App\SubCategory;
use App\ProductImage;
use App\Option;
use App\ProductOption;
use App\Favorite;
use App\OrderItem;
use App\Rate;

class ProductController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api' , ['except' => ['getdetails' , 'getproducts' , 'getbrandproducts', 'getProductRates']]);
    }


    public function getdetails(Request $request){
        $id = $request->id;
        if($request->lang == 'en'){
            $data['product'] = Product::select('id' , 'title_en as title' , 'description_en as description' , 'offer' , 'price_before_offer' , 'final_price' , 'offer_percentage' , 'category_id', 'rate')->find($id);
            $data['product']['category_name'] = Category::select('title_en')->find($data['product']['category_id'])->title_en;

            $product_options = ProductOption::where('product_id' , $data['product']['id'])->select('id' , 'option_id' , 'value_en as value')->get();
            for($i = 0 ; $i < count($product_options) ; $i++){
                $product_options[$i]['key'] = Option::find($product_options[$i]['option_id'])->title_en;
            }

        }else{
            $data['product'] = Product::select('id' , 'title_ar as title' , 'description_ar as description' , 'offer' , 'price_before_offer' , 'final_price' , 'offer_percentage' , 'category_id', 'rate')->find($id);
            $data['product']['category_name'] = Category::select('title_ar')->find($data['product']['category_id'])->title_ar;

            $product_options = ProductOption::where('product_id' , $data['product']['id'])->select('id' , 'option_id' , 'value_ar as value')->get();
            for($i = 0 ; $i < count($product_options) ; $i++){
                $product_options[$i]['key'] = Option::find($product_options[$i]['option_id'])->title_ar;
            }
        }
        $data['product']['images'] = ProductImage::where('product_id' , $data['product']['id'])->pluck('image');

        if(auth()->user()){
            $user_id = auth()->user()->id;

            $prevfavorite = Favorite::where('product_id' , $data['product']['id'])->where('user_id' , $user_id)->first();
            if($prevfavorite){
                $data['product']['favorite'] = true;
            }else{
                $data['product']['favorite'] = false;
            }

        }else{
            $data['product']['favorite'] = false;
        }

        $data['product']['options'] = $product_options;

        $orders = OrderItem::where("product_id", $id)->pluck("id")->toArray();
        $data['product']['rate_count'] = Rate::whereIn("order_id", $orders)->count("id");
        $data['product']['rates'] = Rate::whereIn("order_id", $orders)->with('user')->orderBy("rate", "desc")->take(3)->get();
        
        if($request->lang == 'en'){
            $data['related'] = Product::select('id', 'title_en as title' , 'final_price' , 'price_before_offer' , 'offer' , 'offer_percentage' , 'category_id', 'rate' )->where('deleted' , 0)->where('category_id' , $data['product']['category_id'])->where('id' , '!=' , $data['product']['id'])->get();
        }else{
            $data['related'] = Product::select('id', 'title_ar as title' , 'final_price' , 'price_before_offer' , 'offer' , 'offer_percentage' , 'category_id', 'rate')->where('deleted' , 0)->where('category_id' , $data['product']['category_id'])->where('id' , '!=' , $data['product']['id'])->get();
        }
        
        for($j = 0; $j < count($data['related']) ; $j++){
            // $data['related'][$j]['favorite'] = false;

            if(auth()->user()){
                $user_id = auth()->user()->id;
    
                $prevfavorite = Favorite::where('product_id' , $data['related'][$j]['id'])->where('user_id' , $user_id)->first();
                if($prevfavorite){
                    $data['related'][$j]['favorite'] = true;
                }else{
                    $data['related'][$j]['favorite'] = false;
                }
    
            }else{
                $data['related'][$j]['favorite'] = false;
            }


            if($request->lang == 'en'){
                $data['related'][$j]['category_name'] = Category::where('id' , $data['related'][$j]['category_id'])->pluck('title_en as title')->first();
            }else{
                $data['related'][$j]['category_name'] = Category::where('id' , $data['related'][$j]['category_id'])->pluck('title_ar as title')->first();
            }
            

            $data['related'][$j]['image'] = ProductImage::where('product_id' , $data['related'][$j]['id'])->pluck('image')->first();;
        }


        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $data , $request->lang);
        return response()->json($response , 200);
    }

    public function getproducts(Request $request){
        $validator = Validator::make($request->all(), [
            'category_id' => 'required',
        ]);

        if ($validator->fails()) {
            $response = APIHelpers::createApiResponse(true , 406 , 'Missing Required Fields' , 'بعض الحقول مفقودة' , null , $request->lang);
            return response()->json($response , 406);
        }

        $category_id = $request->category_id;
        $sub_category_id = $request->sub_category_id;

        // if($request->lang == 'en'){
        //     $categories = Category::where('deleted' , 0)->select('id' , 'title_en as title' , 'image')->get();   
        // }else{
        //     $categories = Category::where('deleted' , 0)->select('id' , 'title_ar as title' , 'image')->get();   
        // }

        // for($i = 0; $i < count($categories); $i++){
            // if($categories[$i]['id'] == $request->category_id){
            //     $categories[$i]['selected'] = 1;
                if($request->lang == 'en'){
                    $subcategories = SubCategory::where('deleted' , 0)->where('category_id' , $request->category_id)->select('id' , 'title_en as title')->get()->toArray();
                    $all_element = array();
                    $all_element['id'] = 0;
                    $all_element['title'] = 'All';
                    array_unshift($subcategories , $all_element);
                }else{
                    $subcategories = SubCategory::where('deleted' , 0)->where('category_id' , $request->category_id)->select('id' , 'title_en as title')->get()->toArray();
                    $all_element = array();
                    $all_element['id'] = 0;
                    $all_element['title']  = 'الكل';
                    array_unshift($subcategories , $all_element);
                }

                for($j =0; $j < count($subcategories); $j++){
                    if($subcategories[$j]['id'] == $request->sub_category_id){
                        $subcategories[$j]['selected'] = 1;
                    }else{
                        $subcategories[$j]['selected'] = 0;
                    }

                }

                // $categories[$i]['subcategories'] = $subcategories;
                
            // }else{
            //     $categories[$i]['selected'] = 0;
            // }
        // }

        $data['sub_categories'] = $subcategories;

        if($request->sub_category_id == 0){
            if($request->lang == 'en'){
                $products = Product::select('id', 'title_en as title' , 'final_price' , 'price_before_offer' , 'offer' , 'offer_percentage' , 'category_id', 'rate' )->where('deleted' , 0)->where('hidden' , 0)->where('remaining_quantity', '>', 0)->where('category_id' , $request->category_id)->orderBy('sort', 'asc')->simplePaginate(100);
            }else{
                $products = Product::select('id', 'title_ar as title' , 'final_price' , 'price_before_offer' , 'offer' , 'offer_percentage' , 'category_id', 'rate' )->where('deleted' , 0)->where('hidden' , 0)->where('remaining_quantity', '>', 0)->where('category_id' , $request->category_id)->orderBy('sort', 'asc')->simplePaginate(100);
            }
        }else{
            if($request->lang == 'en'){
                $products = Product::select('id', 'title_en as title' , 'final_price' , 'price_before_offer' , 'offer' , 'offer_percentage' , 'category_id', 'rate' )->where('deleted' , 0)->where('hidden' , 0)->where('remaining_quantity', '>', 0)->where('category_id' , $request->category_id)->where('sub_category_id' , $request->sub_category_id)->orderBy('sort', 'asc')->simplePaginate(100);
            }else{
                $products = Product::select('id', 'title_ar as title' , 'final_price' , 'price_before_offer' , 'offer' , 'offer_percentage' , 'category_id', 'rate' )->where('deleted' , 0)->where('hidden' , 0)->where('remaining_quantity', '>', 0)->where('category_id' , $request->category_id)->where('sub_category_id' , $request->sub_category_id)->orderBy('sort', 'asc')->simplePaginate(100);
            }
        }

        for($i = 0; $i < count($products); $i++){
            
            if(auth()->user()){
                $user_id = auth()->user()->id;

                $prevfavorite = Favorite::where('product_id' , $products[$i]['id'])->where('user_id' , $user_id)->first();
                if($prevfavorite){
                    $products[$i]['favorite'] = true;
                }else{
                    $products[$i]['favorite'] = false;
                }

            }else{
                $products[$i]['favorite'] = false;
            }

            if($request->lang == 'en'){
                $products[$i]['category_name'] = Category::where('id' , $products[$i]['category_id'])->pluck('title_en as title')->first();
            }else{
                $products[$i]['category_name'] = Category::where('id' , $products[$i]['category_id'])->pluck('title_ar as title')->first();
            }
            
            $products[$i]['image'] = ProductImage::where('product_id' , $products[$i]['id'])->pluck('image')->first();
        }
        
        $data['products'] = $products;
        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $data , $request->lang);
        return response()->json($response , 200);
    }

    public function getbrandproducts(Request $request){
        if($request->lang == 'en'){
            $products = Product::select('id', 'title_en as title' , 'final_price' , 'price_before_offer' , 'offer' , 'offer_percentage' , 'category_id', 'rate' )->where('deleted' , 0)->where('hidden' , 0)->where('remaining_quantity', '>', 0)->where('brand_id' , $request->brand_id)->orderBy('sort', 'asc')->simplePaginate(16);
        }else{
            $products = Product::select('id', 'title_ar as title' , 'final_price' , 'price_before_offer' , 'offer' , 'offer_percentage' , 'category_id', 'rate' )->where('deleted' , 0)->where('hidden' , 0)->where('remaining_quantity', '>', 0)->where('brand_id' , $request->brand_id)->orderBy('sort', 'asc')->simplePaginate(16);
        }


        for($i = 0; $i < count($products); $i++){
            
            if(auth()->user()){
                $user_id = auth()->user()->id;

                $prevfavorite = Favorite::where('product_id' , $products[$i]['id'])->where('user_id' , $user_id)->first();
                if($prevfavorite){
                    $products[$i]['favorite'] = true;
                }else{
                    $products[$i]['favorite'] = false;
                }

            }else{
                $products[$i]['favorite'] = false;
            }

            if($request->lang == 'en'){
                $products[$i]['category_name'] = Category::where('id' , $products[$i]['category_id'])->pluck('title_en as title')->first();
            }else{
                $products[$i]['category_name'] = Category::where('id' , $products[$i]['category_id'])->pluck('title_ar as title')->first();
            }
            
            $products[$i]['image'] = ProductImage::where('product_id' , $products[$i]['id'])->pluck('image')->first();
        }
        
        $data['products'] = $products;
        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $data , $request->lang);
        return response()->json($response , 200);

    }

    // get product rates
    public function getProductRates(Request $request) {
        $product = Product::where('id', $request->product_id)->select('id', 'rate')->first();
        $data['rate'] = 0;
        if ($product) {
            $data['rate'] = $product->rate;
        }
        $orders = OrderItem::where("product_id", $request->product_id)->pluck("id")->toArray();
        $data['rate_count'] = Rate::whereIn("order_id", $orders)->count("id");
        $data['rates'] = Rate::whereIn("order_id", $orders)->with('user')->orderBy("rate", "desc")->simplePaginate(16);

        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $data , $request->lang);
        return response()->json($response , 200);
    }

}