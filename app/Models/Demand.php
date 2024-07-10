<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class Demand extends Model
{
    use HasFactory;

    protected $primaryKey = 'bis_partner_id';

    /**
     * 加盟店追加情報のレコードを取得
     */
    public function bis_partner()
    {
        return BisPartner::where('bis_partner_id', $this->bis_partner_id)->first();
    }

    /**
     * 見積請求ヘッダーのレコードを取得
     */
    public function quote_headers()
    {
        return QuoteHeader::where('demand_id', $this->demand_id)->get();
    }

    public function getDemand()
    {
        return Demand::where([
            ['division_id', '=', '5'],
            ['formal_agreement_confirmation', '=', '1']
        ]);
    }

    public function getGaikouDemand()
    {
        return $this->getDemand()->whereIn('represent_work_code', [
            15, 16, 17, 18, 19, 20, 21, 22, 23, 24, 25, 26, 27, 28, 29, 30
        ]);
    }
}
