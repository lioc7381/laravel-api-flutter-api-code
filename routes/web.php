<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Api\CategoryController;

Route::group(['prefix' => 'api'], function () {
    Route::resource('categories', CategoryController::class);
});

Route::get('/', function () {
    return view('welcome');
});
