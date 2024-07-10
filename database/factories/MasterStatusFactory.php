<?php

namespace Database\Factories;

use App\Models\MasterStatus;
use Illuminate\Database\Eloquent\Factories\Factory;

class MasterStatusFactory extends Factory
{
    /**
     * The name of the factory's corresponding model.
     *
     * @var string
     */
    protected $model = MasterStatus::class;

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
            'certified_rank' => rand(1, 4),
            'earned_points' => 11,
            'required_point_up_to_next_term_title' => 12,
            'current_month_construction_project_number' => 3,
            'current_month_sales_amount' => 100000,
            'current_term_construction_project_number' => 30,
            'current_term_order_count' => 0,
            'current_term_average_review_evaluation' => 0,
            'current_term_review_number' => 0,
            'level_up_count' => 0,
            'login_days' => 0
        ];
    }
}
