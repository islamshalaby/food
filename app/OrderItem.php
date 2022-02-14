<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class OrderItem extends Model
{
    protected $fillable = ['order_id', 'product_id', 'count'];

    public function product()
    {
        return $this->belongsTo('App\Product', 'product_id');
    }

    public function order()
    {
        return $this->belongsTo('App\Order', 'order_id');
    }

    public function rate() {
        return $this->hasOne('App\Rate', 'order_id');
    }
}
