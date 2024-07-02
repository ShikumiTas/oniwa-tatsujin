<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Database\Eloquent\Relations\BelongsTo;

class Answer extends Model
{
    use HasFactory;

    /**
     * 回答の親である質問を取得する
     */
    public function question(): BelongsTo
    {
        return $this->belongsTo(Question::class);
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
            'question_id' => $this->question_id,
            'name' => $this->name,
            'image' => $this->image,
            'extra_field' => $this->extra_field,
            'add_question_id' => $this->add_question_id,
        ];
    }
}
