<?php

Route::get('/', function () {
  return redirect('/home');
});

Route::group(array('prefix' => 'api', 'namespace' => 'api'), function () {
    Route::group(array('prefix' => 'personal1', 'namespace' => 'personal1'), function () {
        Route::get('/', array(
            'uses' => '\App\Http\Controllers\Personal1Controller@getIndex',
            'as'   => 'personal1',
        ));
        Route::get('/ajaxcenter', array(
            'uses' => '\App\Http\Controllers\Personal1Controller@getAjaxCenter',
            'as'   => 'personal1.ajaxcenter',
        ));
    });

    Route::group(array('prefix' => 'personal2', 'namespace' => 'personal1'), function () {
        Route::get('/', array(
            'uses' => '\App\Http\Controllers\Personal2Controller@getIndex',
            'as'   => 'personal2',
        ));
        Route::get('/ajaxcenter', array(
            'uses' => '\App\Http\Controllers\Personal2Controller@getAjaxCenter',
            'as'   => 'personal2.ajaxcenter',
        ));
    });

    Route::group(array('prefix' => 'work1', 'namespace' => 'work1'), function () {
        Route::get('/', array(
            'uses' => '\App\Http\Controllers\Work1Controller@getIndex',
            'as'   => 'work1',
        ));
        Route::get('/ajaxcenter', array(
            'uses' => '\App\Http\Controllers\Work1Controller@getAjaxCenter',
            'as'   => 'work1.ajaxcenter',
        ));
    });

    Route::group(array('prefix' => 'work2', 'namespace' => 'work1'), function () {
        Route::get('/', array(
            'uses' => '\App\Http\Controllers\Work2Controller@getIndex',
            'as'   => 'work2',
        ));
        Route::get('/ajaxcenter', array(
            'uses' => '\App\Http\Controllers\Work2Controller@getAjaxCenter',
            'as'   => 'work2.ajaxcenter',
        ));
    });

    Route::group(array('prefix' => 'bio', 'namespace' => 'bio'), function () {
        Route::get('/', array(
            'uses' => '\App\Http\Controllers\BioController@getIndex',
            'as'   => 'bio',
        ));
        Route::get('/ajaxcenter', array(
            'uses' => '\App\Http\Controllers\BioController@getAjaxCenter',
            'as'   => 'bio.ajaxcenter',
        ));
    });

    Route::group(array('prefix' => 'contact', 'namespace' => 'contact'), function () {
        Route::get('/', array(
            'uses' => '\App\Http\Controllers\ContactController@getIndex',
            'as'   => 'contact',
        ));
        Route::get('/ajaxcenter', array(
            'uses' => '\App\Http\Controllers\ContactController@getAjaxCenter',
            'as'   => 'contact.ajaxcenter',
        ));
    });
});

Route::any('{any}', function () {
  return view('welcome');
});