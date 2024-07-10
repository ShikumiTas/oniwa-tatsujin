<?php

namespace Database\Factories;

use App\Models\QuoteHeader;
use App\Models\Demand;
use App\Models\BisPartner;
use Illuminate\Database\Eloquent\Factories\Factory;

class QuoteHeaderFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = QuoteHeader::class;

    /**
     * Define the model's default state.
     *s
     * @return array
     */
    public function definition()
    {
        return [
            'demand_id' => Demand::inRandomOrder()->first()->demand_id,
            'bp_code' => BisPartner::inRandomOrder()->first()->bp_code,
            'quote_status' => 10
        ];
    }
}
