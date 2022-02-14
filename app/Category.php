<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Category extends Model
{
    protected $fillable = ['image', 'title_en', 'title_ar', 'deleted', 'sort'];

    public function brands() {
        return $this->hasMany('App\Brand', 'category_id');
    }

    public function products() {
        return $this->hasMany('App\Product', 'category_id');
    }

    public function options() {
        return $this->hasMany('App\Option', 'category_id');
    }

    public function subCategories() {
        return $this->hasMany('App\SubCategory', 'category_id');
    }
}
