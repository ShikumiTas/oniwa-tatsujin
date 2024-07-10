<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class QuoteHeader extends Model
{
    use HasFactory;

    protected $primaryKey = 'quote_header_id';

    /**
     * 案件情報のレコードを取得
     */
    public function demand()
    {
        return Demand::where('demand_id', $this->demand_id)->first();
    }

    /**
     * 加盟店情報のレコードを取得
     */
    public function bis_partner()
    {
        return BisPartner::where('bis_partner_id', $this->bis_partner_id)->first();
    }
}
