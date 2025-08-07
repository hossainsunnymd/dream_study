<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\BackEnd\CarouselController;






//carousels
Route::prefix('admin')->group(function () {
    Route::get('/carousels', [CarouselController::class, 'carouselList'])
        ->name('carousel-list')->middleware('permission:carousel-list');
    Route::get('/carousel-save-page', [CarouselController::class, 'carouselSavePage'])
        ->name('carousel-save-page')->middleware('permission:carousel-save-page');
    Route::post('/carousel', [CarouselController::class, 'carouselSave'])
        ->name('carousel-save')->middleware('permission:carousel-save');
    Route::post('/carousel/{id}', [CarouselController::class, 'carouselUpdate'])
        ->name('carousel-Update')->middleware('permission:carousel-update');
    Route::get('/carousel/{id}', [CarouselController::class, 'carouselDelete'])
        ->name('carousel-delete')->middleware('permission:carousel-delete');
});

