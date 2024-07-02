<?php

namespace Database\Seeders;

use App\Models\User;
// use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use App\Models\Question;
use App\Models\Answer;

class DatabaseSeeder extends Seeder
{
    /**
     * Seed the application's database.
     */
    public function run(): void
    {
        // User::factory(10)->create();

        // User::factory()->create([
        //     'name' => 'Test User',
        //     'email' => 'test@example.com',
        // ]);

        $data_list = [
            [
                'question' => [
                    'title' => 'サービス先',
                    'body' => 'サービス先との関係性をお教えください。',
                    'selectable_answers' => 1,
                    'validation' => [
                        'rules' => [
                            'required' => true,
                            'minlength' => 1
                        ],
                        'messages' => [
                            'required' => '選択必須です',
                            'minlength' => '最低{0}つは選択してください',
                        ]
                    ]
                ],
                'answers' => [
                    [
                        'name' => '自宅・事務所・店舗'
                    ],
                    [
                        'name' => '空き家・自社所有物件'
                    ],
                    [
                        'name' => '自社管理物件'
                    ],
                    [
                        'name' => '自社工事物件'
                    ],
                    [
                        'name' => 'その他',
                        'extra_field' => '<input size="100" type="text" />'
                    ]
                ]
            ],
            [
                'question' => [
                    'title' => 'ご提案や工事',
                    'body' => 'ご提案や工事に最も重要視する項目を最大2妻で選んでください。',
                    'selectable_answers' => 2,
                    'validation' => [
                        'rules' => [
                            'required' => true,
                            'minlength' => 1,
                            'maxlength' => 2
                        ],
                        'messages' => [
                            'required' => '選択必須です',
                            'minlength' => '最低{0}つは選択してください',
                            'maxlength' => '選択できるのは最大{0}つまでです'
                        ]
                    ]
                ],
                'answers' => [
                    [
                        'name' => '価格'
                    ],
                    [
                        'name' => '見た目・デザイン'
                    ],
                    [
                        'name' => 'サービス品質・技術'
                    ],
                    [
                        'name' => '機能性'
                    ],
                    [
                        'name' => '問題解決力'
                    ],
                    [
                        'name' => 'その他',
                        'extra_field' => '<input size="100" type="text" />'
                    ]
                ]
            ]
        ];

        $question_id = null;
        $reverse_data_list = array_reverse($data_list);
        foreach($reverse_data_list as $data) {
            // eval(\Psy\sh());
            $data['question']['question_id'] = $question_id;
            $question = Question::create($data['question']);
            $question_id = $question->id;
            $question->answers()->createMany($data['answers']);
        }
    }
}
