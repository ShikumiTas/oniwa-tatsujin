<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\HasMany;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Question extends Model
{
    use HasFactory;

    /**
     * 次の質問を取得する
     */
    public function nextQuestion()
    {
        return $this->BelongsTo(Question::class, 'question_id');
    }

    /**
     * 前の質問を取得する
     */
    public function prevQuestion()
    {
        return $this->hasOne(Question::class, 'question_id');
    }

    /**
     * 質問に対する回答群を取得する
     */
    public function answers(): HasMany
    {
        return $this->hasMany(Answer::class);
    }

    /**
     * JSONシリアライザー
     *
     * @var array
     */
    public function jsonSerialize(): Array
    {
        return [
            'id' => $this->id,
            'title' => $this->title,
            'body' => $this->body,
            'note' => $this->note,
            'selectable_answers' => $this->selectable_answers,
            'validation' => $this->validation,
            'prev_question_id' => $this->prevQuestion?->id,
            'next_question_id' => $this->nextQuestion?->id,
            'answers' => $this->answers
        ];
    }

    /**
     * ネイティブなタイプへキャストする属性
     *
     * @var array
     */
    protected $casts = [
        'validation' => 'array',
    ];
}
