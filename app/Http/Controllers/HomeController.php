<?php
namespace App\Http\Controllers;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Validator;
use App\Helpers\APIHelpers;
use App\HomeElement;
use App\HomeSection;
use App\Brand;
use App\Category;
use App\Favorite;
use App\Ad;
use App\Product;
use App\ProductImage;


class HomeController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api' , ['except' => ['getdata' , 'getbrands' , 'getoffers']]);
    }

    public function getdata(Request $request){
        $home_data = HomeSection::orderBy('sort' , 'Asc')->get();
        $data = [];
        for($i = 0; $i < count($home_data); $i++){
            $element = [];
			$element['id'] = $home_data[$i]['id'];
            $element['type'] = $home_data[$i]['type'];
            if($request->lang == 'en'){
                $element['title'] = $home_data[$i]['title_en'];
            }else{
                $element['title'] = $home_data[$i]['title_ar'];
            }
            $ids = HomeElement::where('home_id' , $home_data[$i]['id'])->pluck('element_id');
            
            if($home_data[$i]['type'] == 1){
                
                $element['data'] = Ad::select('id' ,'image' , 'type' , 'content')->whereIn('id' , $ids)->get();

                array_push($data , $element);

            }elseif($home_data[$i]['type'] == 2){
                
                if($request->lang == 'en'){
                    $element['data'] = Category::select('id' ,'image' , 'title_en as title')->where('deleted' , 0)->whereIn('id' , $ids)->get();
                }else{
                    $element['data'] = Category::select('id' ,'image' , 'title_ar as title')->where('deleted' , 0)->whereIn('id' , $ids)->get(); 
                }

                array_push($data , $element);

            }elseif($home_data[$i]['type'] == 3){

                if($request->lang == 'en'){
                    $element['data'] = Brand::select('id' ,'image' , 'title_en as title')->where('deleted' , 0)->whereIn('id' , $ids)->limit(5)->get();
                }else{
                    $element['data'] = Brand::select('id' ,'image' , 'title_ar as title')->where('deleted' , 0)->whereIn('id' , $ids)->limit(5)->get(); 
                }                

                array_push($data , $element);

            }elseif($home_data[$i]['type'] == 4){
                if($request->lang == 'en'){
                    $element['data'] = Product::select('id', 'title_en as title' , 'final_price' , 'price_before_offer' , 'offer' , 'offer_percentage' , 'category_id', 'rate' )->where('deleted' , 0)->where('hidden' , 0)->where('remaining_quantity', '>', 0)->whereIn('id' , $ids)->limit(5)->orderBy('sort', 'asc')->get();
                }else{
                    $element['data'] = Product::select('id', 'title_ar as title' , 'final_price' , 'price_before_offer' , 'offer' , 'offer_percentage' , 'category_id', 'rate')->where('deleted' , 0)->where('hidden' , 0)->where('remaining_quantity', '>', 0)->whereIn('id' , $ids)->limit(5)->orderBy('sort', 'asc')->get();
                }
                
                for($j = 0; $j < count($element['data']) ; $j++){
                    // $element['data'][$j]['favorite'] = false;

                    if(auth()->user()){
                        $user_id = auth()->user()->id;

                        $prevfavorite = Favorite::where('product_id' , $element['data'][$j]['id'])->where('user_id' , $user_id)->first();
                        if($prevfavorite){
                            $element['data'][$j]['favorite'] = true;
                        }else{
                            $element['data'][$j]['favorite'] = false;
                        }

                    }else{
                        $element['data'][$j]['favorite'] = false;
                    }

                    if($request->lang == 'en'){
                        $element['data'][$j]['category_name'] = Category::where('id' , $element['data'][$j]['category_id'])->pluck('title_en as title')->first();
                    }else{
                        $element['data'][$j]['category_name'] = Category::where('id' , $element['data'][$j]['category_id'])->pluck('title_ar as title')->first();
                    }
                    

                    $element['data'][$j]['image'] = ProductImage::where('product_id' , $element['data'][$j]['id'])->pluck('image')->first();
                }

                array_push($data , $element);

            }elseif($home_data[$i]['type'] == 5){

                $element['data'][0] = Ad::select('id' ,'image' , 'type' , 'content')->whereIn('id' , $ids)->first();
				if ($element['data'][0]) {
                    array_push($data , $element);
                }
                

            }
        }
        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $data , $request->lang);
        return response()->json($response , 200);
    }
	
	public function getbrands(Request $request){
		$id = $request->id;
		$ids = HomeElement::where('home_id' , $id)->pluck('element_id');
		                if($request->lang == 'en'){
                    $brands = Brand::select('id' ,'image' , 'title_en as title')->where('deleted' , 0)->whereIn('id' , $ids)->get();
                }else{
                    $brands = Brand::select('id' ,'image' , 'title_ar as title')->where('deleted' , 0)->whereIn('id' , $ids)->get(); 
                }
		        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $brands , $request->lang);
        return response()->json($response , 200);
		
	}
	
	public function getoffers(Request $request){
		$id = $request->id;
		$ids = HomeElement::where('home_id' , $id)->pluck('element_id');
		                if($request->lang == 'en'){
                    $element['data'] = Product::select('id', 'title_en as title' , 'final_price' , 'price_before_offer' , 'offer' , 'offer_percentage' , 'category_id', 'rate' )->where('deleted' , 0)->where('hidden' , 0)->where('remaining_quantity', '>', 0)->whereIn('id' , $ids)->get();
                }else{
                    $element['data'] = Product::select('id', 'title_ar as title' , 'final_price' , 'price_before_offer' , 'offer' , 'offer_percentage' , 'category_id', 'rate')->where('deleted' , 0)->where('hidden' , 0)->where('remaining_quantity', '>', 0)->whereIn('id' , $ids)->get();
                }
                
                for($j = 0; $j < count($element['data']) ; $j++){
                    // $element['data'][$j]['favorite'] = false;

                    if(auth()->user()){
                        $user_id = auth()->user()->id;

                        $prevfavorite = Favorite::where('product_id' , $element['data'][$j]['id'])->where('user_id' , $user_id)->first();
                        if($prevfavorite){
                            $element['data'][$j]['favorite'] = true;
                        }else{
                            $element['data'][$j]['favorite'] = false;
                        }

                    }else{
                        $element['data'][$j]['favorite'] = false;
                    }

                    if($request->lang == 'en'){
                        $element['data'][$j]['category_name'] = Category::where('id' , $element['data'][$j]['category_id'])->pluck('title_en as title')->first();
                    }else{
                        $element['data'][$j]['category_name'] = Category::where('id' , $element['data'][$j]['category_id'])->pluck('title_ar as title')->first();
                    }
                    

                    $element['data'][$j]['image'] = ProductImage::where('product_id' , $element['data'][$j]['id'])->pluck('image')->first();
                }
		
				        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $element['data'] , $request->lang);
        return response()->json($response , 200);
		
		
	}

    

}
