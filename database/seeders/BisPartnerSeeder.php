<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class BisPartnerSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $create_nums = 10;
        \App\Models\BisPartner::truncate();
        \App\Models\BisPartner::factory($create_nums)->create();
        \App\Models\BizPartnerDetail::truncate();
        \App\Models\BizPartnerDetail::factory($create_nums)->create();
        \App\Models\MasterStatus::truncate();
        \App\Models\MasterStatus::factory($create_nums)->create();
        \App\Models\Demand::truncate();
        \App\Models\Demand::factory($create_nums * 5)->create();
        \App\Models\QuoteHeader::truncate();
        \App\Models\QuoteHeader::factory($create_nums * 20)->create();
        \App\Models\BisPartnerRegionalRange::truncate();
        \App\Models\BisPartnerRegionalRange::factory($create_nums * 20)->create();
    }
}
