<?php

namespace App;

use Illuminate\Database\Eloquent\Model;


class Product extends Model
{
    protected $fillable = [
        'barcode',
        'stored_number',
        'title_en',
        'title_ar',
        'offer', 
        'description_ar', 
        'description_en', 
        'final_price', 
        'price_before_offer',
        'offer_percentage',
        'category_id',
        'brand_id',
        'sub_category_id',
        'deleted',
        'total_quatity',
        'remaining_quantity',
        'rate', 
        'hidden',
        'sort'
    ];

    public function images() {
        return $this->hasMany('App\ProductImage', 'product_id');
    }

    public function category() {
        return $this->belongsTo('App\Category', 'category_id');
    }

    public function brand() {
        return $this->belongsTo('App\Brand', 'brand_id');
    }

    public function subCategory() {
        return $this->belongsTo('App\SubCategory', 'sub_category_id');
    }

    public function options() {
        return $this->hasMany('App\ProductOption', 'product_id');
    }

    public function orderItems() {
        return $this->hasMany('App\OrderItem', 'product_id');
    }

    public function orders() {
        return $this->belongsToMany('App\Order', 'order_items', 'product_id','order_id')->withPivot('count');
    }

    // public function element() {
    //     return $this->hasOne('App\HomeElement', 'element_id')->with('sections')->whereHas('sections', function ($q) {
    //         $q->where('type', 4);
    //     });
    // }
}
