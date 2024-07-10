<?php

namespace Database\Factories;

use App\Models\TestAddress;
use App\Models\Demand;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class DemandFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = Demand::class;

    /**
     * Define the model's default state.
     *s
     * @return array
     */
    public function definition()
    {
        $address = TestAddress::inRandomOrder()->first();

        return [
            'division_id' => 5,
            'represent_work_code' => rand(1, 30),
            'demand_zip' => (int) str_replace('-', '', $address->zip),
            'demand_pref' => $address->ken_id,
            'demand_address' => $address->city_name . $address->town_name,
            'city_cd' => strval($address->city_id),
            'formal_agreement_confirmation' => rand(0, 1)
        ];
    }
}
