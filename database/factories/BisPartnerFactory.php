<?php

namespace Database\Factories;

use App\Models\TestAddress;
use App\Models\BisPartner;
use Illuminate\Database\Eloquent\Factories\Factory;
use Illuminate\Support\Str;

class BisPartnerFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = BisPartner::class;

    // bp_code用の連番
    private static int $sequence = 999;

    /**
     * Define the model's default state.
     *
     * @return array
     */
    public function definition()
    {
        self::$sequence++;
        $address = TestAddress::where('office_flg', '=', '1')->inRandomOrder()->first();

        return [
            'division_id' => 5,
            'bp_code' => self::$sequence,
            'is_approval' => rand(0, 1),
            'bp_status' => rand(1, 3),
            'corporate_private_kbn' => 1,
            'bp_name' => $address->office_name,
            'bp_name_kana' => $address->office_furi,
            'bp_corporate_name' => $address->office_name,
            'bp_manager_name' => '店長 ' . strval(self::$sequence),
            'bp_manager_name_kana' => 'テンチョウ ' . strval(self::$sequence),
            'bp_zip' => (int) str_replace('-', '', $address->zip),
            'bp_pref' => $address->ken_id,
            'bp_address' => $address->city_name . $address->town_name,
            'bp_block' => $address->block_name,
            'bp_phone' => $this->faker->numerify('##########'),
            'bp_phone_2' => $this->faker->numerify('##########'),
            'bp_city_cd' => strval($address->city_id),
            'bp_lat' => 0,
            'bp_lng' => 0
        ];
    }
}
