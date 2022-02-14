<?php

use Illuminate\Http\Request;

/*
|--------------------------------------------------------------------------
| API Routes
|--------------------------------------------------------------------------
|
| Here is where you can register API routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| is assigned the "api" middleware group. Enjoy building your API!
|
*/

Route::group([
    'middleware' => 'api',
    'prefix' => 'auth'
], function ($router) {
    Route::post('login/{lang}/{v}', [ 'as' => 'login', 'uses' => 'AuthController@login'])->middleware('checkguest');
    Route::post('logout/{lang}/{v}', 'AuthController@logout');
    Route::post('refresh/{lang}/{v}', 'AuthController@refresh');
    Route::post('me/{lang}/{v}', 'AuthController@me');
    Route::post('register/{lang}/{v}' , [ 'as' => 'register', 'uses' => 'AuthController@register'])->middleware('checkguest');
});

Route::get('/invalid/{lang}/{v}', [ 'as' => 'invalid', 'uses' => 'AuthController@invalid']);


// users apis group
Route::group([
    'middleware' => 'api',
    'prefix' => 'user'
], function($router) {
    Route::get('profile/{lang}/{v}' , 'UserController@getprofile');
    Route::put('profile/{lang}/{v}' , 'UserController@updateprofile');
    Route::put('resetpassword/{lang}/{v}' , 'UserController@resetpassword');
    Route::put('resetforgettenpassword/{lang}/{v}' , 'UserController@resetforgettenpassword')->middleware('checkguest');
    Route::post('checkphoneexistance/{lang}/{v}' , 'UserController@checkphoneexistance')->middleware('checkguest');
    Route::post('checkphoneexistanceandroid/{lang}/{v}' , 'UserController@checkphoneexistanceandroid')->middleware('checkguest');
	
    Route::get('notifications/{lang}/{v}' , 'UserController@notifications');

});


// favorites
Route::group([
    'middleware' => 'api',
    'prefix' => 'favorites'
] , function($router){
    Route::get('/{lang}/{v}' , 'FavoriteController@getfavorites');
    Route::post('/{lang}/{v}' , 'FavoriteController@addtofavorites');
    Route::delete('/{lang}/{v}' , 'FavoriteController@removefromfavorites');
});

// favorites
Route::group([
    'middleware' => 'api',
    'prefix' => 'addresses'
] , function($router){
    Route::get('/{lang}/{v}' , 'AddressController@getaddress');
    Route::post('/{lang}/{v}' , 'AddressController@addaddress');
    Route::delete('/{lang}/{v}' , 'AddressController@removeaddress');
    Route::post('/setdefault/{lang}/{v}' , 'AddressController@setmain');
    Route::get('/areas/{lang}/{v}' , 'AddressController@getareas')->middleware('checkguest');
    Route::get('/details/{id}/{lang}/{v}' , 'AddressController@getdetails');
});

Route::group([
    'middleware' => 'api',
    'prefix' => 'orders'
] , function($router){
    Route::post('create/{lang}/{v}' , 'OrderController@create');
    Route::get('{lang}/{v}' , 'OrderController@getorders');
    Route::get('{id}/{lang}/{v}' , 'OrderController@orderdetails');
});

Route::get('/excute_pay' , 'OrderController@excute_pay');
Route::get('/pay/success' , 'OrderController@pay_sucess');
Route::get('/pay/error' , 'OrderController@pay_error');

Route::get('offers/{lang}/{v}' , 'OfferController@getoffers')->middleware('checkguest');
Route::get('offers_android/{lang}/{v}' , 'OfferController@getoffersandroid')->middleware('checkguest');

Route::get('delivery_price/{lang}/{v}' , 'AddressController@getdeliveryprice')->middleware('checkguest');

// visitors
Route::group([
    'middleware' => 'api',
    'prefix' => 'visitors'
], function($router){
    Route::post('create/{lang}/{v}' , 'VisitorController@create')->middleware('checkguest');
    Route::post('cart/add/{lang}/{v}' , 'VisitorController@add')->middleware('checkguest');
    Route::delete('cart/delete/{lang}/{v}' , 'VisitorController@delete')->middleware('checkguest');
    Route::post('cart/get/{lang}/{v}' , 'VisitorController@get')->middleware('checkguest');
    Route::put('cart/changecount/{lang}/{v}' , 'VisitorController@changecount')->middleware('checkguest');
    Route::post('cart/count/{lang}/{v}' , 'VisitorController@getcartcount')->middleware('checkguest');
});

// get home data
Route::get('categories/{lang}/{v}' , 'CategoryController@getcategories')->middleware('checkguest');
Route::get('sub_categories/{category_id}/{lang}/{v}' , 'CategoryController@get_sub_categories')->middleware('checkguest');


// get home data
Route::get('home/{lang}/{v}' , 'HomeController@getdata')->middleware('checkguest');
Route::get('famous_brands/{id}/{lang}/{v}' , 'HomeController@getbrands')->middleware('checkguest');
Route::get('famous_offers/{id}/{lang}/{v}' , 'HomeController@getoffers')->middleware('checkguest');

// send contact us message
Route::post('/contactus/{lang}/{v}' , 'ContactUsController@SendMessage')->middleware('checkguest');

// get app number
Route::get('/getappnumber/{lang}/{v}' , 'SettingController@getappnumber')->middleware('checkguest');

// get whats app number
Route::get('/getwhatsappnumber/{lang}/{v}' , 'SettingController@getwhatsapp')->middleware('checkguest');

// get products 
Route::get('/products/{lang}/{v}' , 'ProductController@getproducts')->middleware('checkguest');

// get products 
Route::get('/products/rates/{product_id}/{lang}/{v}' , 'ProductController@getProductRates')->middleware('checkguest');

// get products brand
Route::get('/products/brand/{brand_id}/{lang}/{v}' , 'ProductController@getbrandproducts')->middleware('checkguest');

// get product details
Route::get('/products/{id}/{lang}/{v}' , 'ProductController@getdetails')->middleware('checkguest');

// rates
// get rates 
Route::get('/rate/{order_id}/{lang}/{v}' , 'RateController@getrates')->middleware('checkguest');
// add rate
Route::post('/rate/{lang}/{v}' , 'RateController@addrate');

Route::get('/search/{lang}/{v}' , 'SearchByNameController@search' )->middleware('checkguest');


