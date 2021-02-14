<?php
namespace App\Http\Controllers\Admin;
use App\Http\Controllers\Admin\AdminController;
use Illuminate\Http\Request;
use JD\Cloudder\Facades\Cloudder;
use Illuminate\Support\Facades\DB;
use App\Option;
use App\Category;

class OptionsController extends AdminController{
    // get all options
    public function show(){
        $data['options'] = Option::orderBy('id' , 'desc')->get();
        return view('admin.options' , ['data' => $data]);
    }

    // add get
    public function addGet() {
        $data['categories'] = Category::where('deleted', 0)->orderBy('id' , 'desc')->get();

        return view('admin.option_form', ['data' => $data]);
    }

    // add post
    public function addPost(Request $request) {
        Option::create($request->all());

        return redirect()->route('options.index');
    }

    // edit get
    public function editGet(Option $option) {
        $data['option'] = $option;
        $data['categories'] = Category::where('deleted', 0)->orderBy('id' , 'desc')->get();

        return view('admin.option_edit', ['data' => $data]);
    }

    // edit post
    public function editPost(Request $request, Option $option) {
        $option->update($request->all());

        return redirect()->route('options.index');
    }

    // delete
    public function delete(Option $option) {
        $option->delete();

        return redirect()->back();
    }
}