<?php

use Illuminate\Http\Request;
use Illuminate\Support\Facades\Route;
use App\Http\Controllers\ApiQuestionController;

Route::apiResource('questions', ApiQuestionController::class)->only(['show']);