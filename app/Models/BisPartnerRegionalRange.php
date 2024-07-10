<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BisPartnerRegionalRange extends Model
{
    use HasFactory;

    /**
     * 加盟店情報のレコードを取得
     */
    public function bis_partner()
    {
        return BizPartner::where('bp_code', $this->bp_code)->first();
    }

    /**
     * 市区郡マスタのレコードを取得
     */
    public function city()
    {
        return City::where('city_cd', $this->area_code)->first();
    }
}
