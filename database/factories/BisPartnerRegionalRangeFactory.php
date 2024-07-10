<?php

namespace Database\Factories;

use App\Models\TestAddress;
use App\Models\BisPartner;
use App\Models\BisPartnerRegionalRange;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class BisPartnerRegionalRangeFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = BisPartnerRegionalRange::class;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        $address = TestAddress::inRandomOrder()->first();

        return [
            'bp_code' => BisPartner::inRandomOrder()->first()->bp_code,
            'is_approval' => rand(0, 1),
            'which_season' => rand(1, 4),
            'area_code' => strval($address->city_id)
        ];
    }
}
