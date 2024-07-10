<?php

namespace Database\Factories;

use app\Models\BizPartnerDetail;
use Illuminate\Database\Eloquent\Factories\Factory;

class BizPartnerDetailFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = BizPartnerDetail::class;

    // bp_code用の連番
    private static int $sequence = 999;

    /**
     * Define the model's default state.
     *s
     * @return array
     */
    public function definition()
    {
        self::$sequence++;

        return [
            'bp_code' => self::$sequence,
            'is_approval' => 1, // 認証済み
            'bp_image' => 'http://127.0.0.1:8000/img/demo_01.jpg',
            'store_manager_image_path' => 'http://127.0.0.1:8000/img/demo_01.jpg',
            'bp_comment' => $this->faker->realText(200, 5),
            'message_to_customer' => $this->faker->realText(200, 5),
            'bp_image_id_check_1' => 0,
            'bp_image_id_check_2' => 0,
            'bp_image_id_check_3' => 0,
            'bp_image_id_check_4' => 0,
            'bp_image_id_check_5' => 0,
            'bp_image_id_check_6' => 0,
            'bp_image_id_check_7' => 0,
            'bp_image_id_check_8' => 0,
            'bp_image_id_check_9' => 0,
            'bp_image_id_check_11' => 0,
            'bp_certification_check_1' => 0,
            'bp_certification_check_2' => 0,
            'bp_certification_check_3' => 0,
            'bp_certification_check_4' => 0,
            'bp_certification_check_5' => 0,
            'bp_certification_check_6' => 0,
            'bp_certification_check_7' => 0,
            'bp_certification_check_8' => 0,
            'bp_certification_check_9' => 0,
            'bp_certification_check_10' => 0,
            'bp_certification_check_11' => 0,
            'bp_certification_check_12' => 0,
            'bp_certification_check_13' => 0,
            'bp_certification_check_14' => 0,
            'bp_certification_check_15' => 0,
            'bp_certification_check_16' => 0,
            'bp_certification_check_17' => 0,
            'bp_certification_check_18' => 0,
            'bp_certification_check_19' => 0,
            'bp_certification_check_20' => 0,
            'bp_certification_check_21' => 0,
            'bp_certification_check_22' => 0,
            'bp_certification_check_23' => 0,
            'bp_certification_check_24' => 0,
            'bp_certification_check_25' => 0,
            'bp_certification_check_26' => 0,
            'bp_certification_check_27' => 0,
            'bp_certification_check_28' => 0,
            'bp_certification_check_29' => 0,
            'bp_certification_check_30' => 0,
            'bp_certification_check_31' => 0,
            'bp_certification_check_32' => 0,
            'bp_certification_check_33' => 0,
            'bp_certification_check_34' => 0,
            'bp_certification_check_35' => 0,
            'bp_certification_check_36' => 0,
            'bp_certification_37' => 0,
            'bp_certification_check_37' => 0,
            'bp_certification_38' => 0,
            'bp_certification_check_38' => 0,
            'bp_certification_39' => 0,
            'bp_certification_check_39' => 0,
            'bp_certification_40' => 0,
            'bp_certification_check_40' => 0,
            'bp_certification_41' => 0,
            'bp_certification_check_41' => 0,
            'bp_certification_42' => 0,
            'bp_certification_check_42' => 0,
            'bp_certification_43' => 0,
            'bp_certification_check_43' => 0,
            'bp_certification_44' => 0,
            'bp_certification_check_44' => 0,
            'bp_certification_45' => 0,
            'bp_certification_check_45' => 0,
            'bp_certification_46' => 0,
            'bp_certification_check_46' => 0,
            'bp_certification_47' => 0,
            'bp_certification_check_47' => 0
        ];
    }
}
