<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Model;

class City extends Model
{
    /**s
     * 市区町村のレコードを取得
     */
    public function pref()
    {
        return Pref::where('pref_id', $this->bp_pref)->first();
    }
}
