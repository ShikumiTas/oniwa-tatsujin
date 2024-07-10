<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class Pref extends Model
{
    /**
     * 市区町村のレコードを取得
     */
    public function cities()
    {
        return City::where('bp_pref', $this->pref_id);
    }
}
