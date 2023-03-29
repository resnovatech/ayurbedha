<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class TherapyList extends Model
{
    use HasFactory;

    protected $fillable = [
        'name','amount'
    ];


    public function therapyDetails()
    {
        return $this->hasMany('App\Models\TherapyDetail');
    }


}
