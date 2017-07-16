<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Controller;

class Personal1Controller extends Controller
{
    public function __construct()
    {

    }

    public function getIndex()
    {
        return view('welcome');
    }

    public function getAjaxCenter()
    {
        return null;
    }
}
