<?php

namespace App\Http\Controllers;

use App\Models\Question;
use Illuminate\Http\Request;

class ApiQuestionController extends Controller
{
    /**
     * Question IDから質問群を取得する。
     */
    public function show(Question $question)
    {
        $data = [];
        do {
            array_push($data, $question);
            $question = $question?->nextQuestion;
        } while(!empty($question));
        
        return response()->json($data, 200);
    }

}
