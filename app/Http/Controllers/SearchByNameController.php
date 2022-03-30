<?php
namespace App\Http\Controllers;

use Illuminate\Http\Request;
use App\Product;
use App\ProductImage;
use App\Category;
use App\Helpers\APIHelpers;

class SearchByNameController extends Controller
{
        public function Search(Request $request)
        {
            $search = $request->query('search');

            if(! $search){
                $response = APIHelpers::createApiResponse(true , 406 , 'Missing Required Fields' , 'بعض الحقول مفقودة' , null, $request->lang);
                return response()->json($response , 406);
            }

            if($request->lang == 'en'){
                $products = Product::select('title_en as title'  , 'id' , 'offer' , 'price_before_offer' , 'final_price' , 'offer_percentage' , 'category_id', 'rate')->where('deleted' , 0)->where('hidden' , 0)->where('remaining_quantity', '>', 0)->Where(function($query) use ($search) {
                    $query->Where('title_en', 'like', '%' . $search . '%')->orWhere('title_ar', 'like', '%' . $search . '%');
                })->orderBy('sort', 'asc')->get(); 
            }else{
                $products = Product::select('title_ar as title'  , 'id' , 'offer' , 'price_before_offer' , 'final_price' , 'offer_percentage' , 'category_id', 'rate')->where('deleted' , 0)->where('hidden' , 0)->where('remaining_quantity', '>', 0)->Where(function($query) use ($search) {
                    $query->Where('title_en', 'like', '%' . $search . '%')->orWhere('title_ar', 'like', '%' . $search . '%');
                })->orderBy('sort', 'asc')->get(); 
            }

            for($i =0; $i < count($products); $i++){
                $products[$i]['image'] = ProductImage::where('product_id' , $products[$i]['id'])->pluck('image')->first();
				if($request->lang == 'en'){
				$products[$i]['category_name'] = Category::where('id' , $products[$i]['category_id'])->pluck('title_en')->first();
				}else{
				$products[$i]['category_name'] = Category::where('id' , $products[$i]['category_id'])->pluck('title_ar')->first();
				}
            }


            $response = APIHelpers::createApiResponse(false , 200 , '' , '' , $products , $request->lang) ;
            return response()->json($response , 200);
        }
}
