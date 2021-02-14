<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Validator;
use App\Helpers\APIHelpers;
use App\Category;
use App\Brand;
use App\SubCategory;


class CategoryController extends Controller
{
    public function __construct()
    {
        $this->middleware('auth:api' , ['except' => ['getcategories' , 'get_sub_categories']]);
    }

    public function getcategories(Request $request){
        if($request->lang == 'en'){
            $categories = Category::where('deleted' , 0)->select('id' , 'title_en as title' , 'image')->get();   
        }else{
            $categories = Category::where('deleted' , 0)->select('id' , 'title_ar as title' , 'image')->get();   
        }
         
        // for($i = 0 ; $i < count($categories); $i++){
        //     if($request->lang == 'en'){
        //         $categories[$i]['brands'] = Brand::where('deleted' , 0)->where('category_id' , $categories[$i]['id'])->select('id' , 'title_en as title')->get();
        //     }else{
        //         $categories[$i]['brands'] = Brand::where('deleted' , 0)->where('category_id' , $categories[$i]['id'])->select('id' , 'title_ar as title')->get();
        //     }

        //     for($j = 0; $j < count($categories[$i]['brands']); $j++){
        //         if($request->lang == 'en'){
        //             $categories[$i]['brands'][$j]['sub_categories'] = SubCategory::where('deleted' , 0)->where('brand_id' , $categories[$i]['brands'][$j]['id'])->where('category_id' , $categories[$i]['id'])->select('id' , 'image' , 'title_en as title')->get();
        //         }else{
        //             $categories[$i]['brands'][$j]['sub_categories'] = SubCategory::where('deleted' , 0)->where('brand_id' , $categories[$i]['brands'][$j]['id'])->where('category_id' , $categories[$i]['id'])->select('id' , 'image' , 'title_ar as title')->get();
        //         }
        //     }
            
        // }

        $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $categories , $request->lang);
        return response()->json($response , 200);
    }
	
	public function get_sub_categories(Request $request){


                if($request->lang == 'en'){
                    $data['category_name'] = Category::find($request->category_id)['title_en'];
                    $data['sub_categories'] = SubCategory::where('deleted' , 0)->where('category_id' , $request->category_id)->select('id' , 'image' , 'title_en as title')->limit(6)->get();
                }else{
                    $data['category_name'] = Category::find($request->category_id)['title_ar'];
                    $data['sub_categories'] = SubCategory::where('deleted' , 0)->where('category_id' , $request->category_id)->select('id' , 'image' , 'title_ar as title')->limit(6)->get();
                }
            
		
            $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $data , $request->lang);
            return response()->json($response , 200);
    }
    
    
	
	

}    