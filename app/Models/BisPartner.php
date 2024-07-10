<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class BisPartner extends Model
{
    use HasFactory;

    protected $primaryKey = 'bis_partner_id';

    /**
     * 加盟店追加情報のレコードを取得
     */
    public function detail()
    {
        return BizPartnerDetail::where('bp_code', $this->bp_code)->first();
    }

    /**
     * 達人ステータスのレコードを取得
     */
    public function master_status()
    {
        return MasterStatus::where('bp_code', $this->bp_code)->first();
    }

    /**
     * BP対応可能エリアのレコードを取得
     */
    public function regional_ranges()
    {
        return BisPartnerRegionalRange::where([
            ['bp_code', '=', $this->bp_code],
            ['is_approval', '=', '1']
        ])->get();
    }

    public function getBisPartner($where = [])
    {
        $default = [
            ['bp_code', '>=', '1000'],
            ['is_approval', '=', '1'],
            ['division_id', '=', '5'],
            ['bp_status', '!=', '3']
        ];
        if (!empty($where)) array_push($default, $where);
        return BisPartner::where($where);
    }

    /**
     * 見積請求ヘッダーのレコードを取得
     */
    public function quote_headers()
    {
        return QuoteHeader::where('bp_code', $this->bp_code)->get();
    }
}
