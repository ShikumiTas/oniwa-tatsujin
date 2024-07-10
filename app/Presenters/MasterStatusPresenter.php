<?php

namespace App\Presenters;

use Robbo\Presenter\Presenter;

class MasterStatusPresenter extends Presenter
{
    public function certifiedRank() {
        if ($this->certified_rank === 1) {
            return '素人ガーデナー';
        } else if ($this->certified_rank === 2) {
            return '見習いガーデナー';
        } else if ($this->certified_rank === 3) {
            return '準認定ガーデナー';
        } else if ($this->certified_rank === 4) {
            return '認定ガーデナー';
        } else {
            return '';
        }
    }
}