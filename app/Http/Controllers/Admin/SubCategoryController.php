<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Admin\AdminController;
use Illuminate\Http\Request;
use JD\Cloudder\Facades\Cloudder;
use Illuminate\Support\Facades\DB;
use App\Category;
use App\SubCategory;

class SubCategoryController extends AdminController{
    // get all sub categories
    public function show(){
        $data['sub_categories'] = SubCategory::where('deleted', 0)->orderBy('id' , 'desc')->get();
        return view('admin.sub_categories' , ['data' => $data]);
    }

    // add get
    public function addGet() {
        $data['categories'] = Category::where('deleted', 0)->orderBy('id' , 'desc')->get();

        return view('admin.sub_categories_form', ['data' => $data]);
    }

    // add post
    public function AddPost(Request $request){
        $image_name = $request->file('image')->getRealPath();
        Cloudder::upload($image_name, null);
        $imagereturned = Cloudder::getResult();
        $image_id = $imagereturned['public_id'];
        $image_format = $imagereturned['format'];    
        $image_new_name = $image_id.'.'.$image_format;
        $post = $request->all();
        $post['image'] = $image_new_name;
        SubCategory::create($post);

        return redirect()->route('sub_categories.index');
    }

    // edit get
    public function EditGet(SubCategory $subCategory) {
        $data['sub_category'] = $subCategory;
        $data['categories'] = Category::where('deleted', 0)->orderBy('id' , 'desc')->get();
        // dd($data['categories']);
        return view('admin.sub_categories_edit', ['data' => $data]);
    }

      // post edit
      public function EditPost(Request $request, SubCategory $subCategory) {
        $post = $request->all();
        if($request->file('image')){
            $image = $subCategory->image;
            $publicId = substr($image, 0 ,strrpos($image, "."));    
            Cloudder::delete($publicId);
            $image_name = $request->file('image')->getRealPath();
            Cloudder::upload($image_name, null);
            $imagereturned = Cloudder::getResult();
            $image_id = $imagereturned['public_id'];
            $image_format = $imagereturned['format'];    
            $image_new_name = $image_id.'.'.$image_format;
            $post['image'] = $image_new_name;
        }

        // dd($post);
        $subCategory->update($post);

        return redirect()->route('sub_categories.index');
    }

    // fetch brands
    public function fetchBrands(Category $category) {
        $row = $category->brands()->where('deleted', 0)->get();
        $data = json_decode($row);
        
        return response($data, 200);
    }

    // details
    public function details(SubCategory $subCategory) {
        $data['sub_category'] = $subCategory;

        return view('admin.sub_category_details', ['data' => $data]);
    }

    // delete sub category
    public function delete(SubCategory $subCategory){
        $subCategory->update(['deleted' => 1]);
        // dd($subCategory);
        
        return redirect()->back();
    }
}