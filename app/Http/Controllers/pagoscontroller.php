<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;
use Illuminate\Http\Request;

class pagoscontroller extends Controller
{
    public function show(){


        return view('pagos');
    }
}
