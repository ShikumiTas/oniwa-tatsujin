<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BizPartnerDetail extends Model
{
    use HasFactory;

    protected $primaryKey = 'biz_partner_detail_id';

    /**
     * 加盟店情報のレコードを取得
     */
    public function bis_partner()
    {
        return BisPartner::where('bp_code', $this->bp_code)->first();
    }
}
