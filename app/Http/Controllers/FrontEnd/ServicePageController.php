<?php

namespace App\Http\Controllers\FrontEnd;

use Inertia\Inertia;
use App\Models\Services;
use Illuminate\Http\Request;
use App\Http\Controllers\Controller;

class ServicePageController extends Controller
{
       //service page by category
    public function serviceByCategory($id){
        $services=Services::where('service_category_id',$id)->with('serviceCategory')->orderBy('rank', 'asc')->get();
        return Inertia::render('FrontEnd/ServiceByCategoryPage',['services'=>$services]);
    }
}
