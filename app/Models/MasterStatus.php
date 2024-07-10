<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

use App\Presenters\MasterStatusPresenter;
use Robbo\Presenter\PresentableInterface;

class MasterStatus extends Model implements PresentableInterface
{
    use HasFactory;

    protected $table = 'masters_status';
    protected $primaryKey = 'masters_id';

    /**
     * 加盟店情報のレコードを取得
     */
    public function bis_partner()
    {
        return BisPartner::where('bp_code', $this->bp_code)->first();
    }

    /**
     * Return a created presenter.
     *
     * @return Robbo\Presenter\Presenter
     */
    public function getPresenter()
    {
        return new MasterStatusPresenter($this);
    }
}
