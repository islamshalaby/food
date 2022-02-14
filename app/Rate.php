<?php

namespace App;

use Illuminate\Database\Eloquent\Model;

class Rate extends Model
{
    public function order() {
        return $this->belongsTo('App\OrderItem', 'order_id');
    }

    public function user() {
        return $this->belongsTo('App\User', 'user_id');
    }
}
