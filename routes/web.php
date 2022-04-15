<?php

use Illuminate\Support\Facades\Route;

/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::group(['namespace' => 'Frontend'], function () {
    Route::redirect('/home', '/');
    Route::redirect('/videos-presentation', '/presentations')->name('video-presentation');
    Route::get('/', 'PageController@index')->name('homepage');
    Route::get('/contact', 'PageController@getContact')->name('getContact');
    Route::get('/presentations', 'PageController@presentations')->name('presentations');
    Route::get('/watch?videos-presentation/{video}', 'PageController@showVideo')->name('showVideo');
    // Route::get('/show-by-country/{country}', 'PageController@showByCountry')->name('show-by-country');
    Route::get('/profile/update', 'PageController@updateProfile')->name('updateProfile');
    Route::post('/profile/update', 'PageController@postUpdateProfile');
    Route::get('membres/{user:username}', 'PageController@showVideo')->name('showV');

    // Route::get('/videos-presentation', 'PageController@presentations')->name('video-presentation');

});
Auth::routes();

Route::group(['prefix' => 'admin'], function () {
    Voyager::routes();
});
