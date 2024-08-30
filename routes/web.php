<?php

use App\Http\Controllers\pagoscontroller;
use Illuminate\Support\Facades\Route;

Route::get('/', function () {
    return view('welcome');
});

Route::get('/pagos', [pagoscontroller::class, 'show'])->name('pagos.show');
