<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Question;
use App\Models\Answer;

class QuestionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $data_list = [
            [
                [
                    'question' => [
                        'title' => '刈込剪定する植栽の種類をお教えください。',
                        'body' => '刈込剪定する植栽の種類をお教えください。',
                        'selectable_answers' => 2,
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
                            'name' => '生垣（垣根）',
                            'add_question' => [
                                [
                                    'question' => [
                                        'title' => '木の高さ',
                                        'body' => '木の高さ',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => '高さ１ｍ以下'
                                        ],
                                        [
                                            'name' => '高さ１ｍ～２ｍ'
                                        ],
                                        [
                                            'name' => '高さ２ｍ～３ｍ'
                                        ],
                                        [
                                            'name' => '高さ３ｍ以上'
                                        ]
                                    ]
                                ],
                                [
                                    'question' => [
                                        'title' => '距離（延長）',
                                        'body' => '距離（延長）',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => '20ｍ未満'
                                        ],
                                        [
                                            'name' => '20ｍ～40ｍ未満'
                                        ],
                                        [
                                            'name' => '40ｍ～60ｍ未満'
                                        ],
                                        [
                                            'name' => '60ｍ～80ｍ未満'
                                        ],
                                        [
                                            'name' => '80ｍ～100ｍ未満'
                                        ],
                                        [
                                            'name' => '100ｍ以上'
                                        ]
                                    ]
                                ],
                                [
                                    'question' => [
                                        'title' => '作業で発生する枝葉の処分も希望しますか？',
                                        'body' => '作業で発生する枝葉の処分も希望しますか？',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => 'はい'
                                        ],
                                        [
                                            'name' => 'いいえ'
                                        ],
                                        [
                                            'name' => 'その他',
                                            'extra_field' => '<input size="100" type="text" />'
                                        ]
                                    ]
                                ]
                            ]
                        ],
                        [
                            'name' => '植込み・花壇植栽',
                            'add_question' => [
                                [
                                    'question' => [
                                        'title' => '木の高さ',
                                        'body' => '木の高さ',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => '高さ１ｍ以下'
                                        ],
                                        [
                                            'name' => '高さ１ｍ～２ｍ'
                                        ],
                                        [
                                            'name' => '高さ２ｍ以上'
                                        ]
                                    ]
                                ],
                                [
                                    'question' => [
                                        'title' => '面積',
                                        'body' => '面積',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => '20㎡未満'
                                        ],
                                        [
                                            'name' => '20㎡～40㎡未満'
                                        ],
                                        [
                                            'name' => '40㎡～60㎡未満'
                                        ],
                                        [
                                            'name' => '60㎡～80㎡未満'
                                        ],
                                        [
                                            'name' => '80㎡～100㎡未満'
                                        ],
                                        [
                                            'name' => '100㎡以上'
                                        ]
                                    ],
                                    [
                                        'question' => [
                                            'title' => '作業で発生する枝葉の処分も希望しますか？',
                                            'body' => '作業で発生する枝葉の処分も希望しますか？',
                                            'selectable_answers' => 1,
                                            'validation' => [
                                                'rules' => [
                                                    'required' => true
                                                ],
                                                'messages' => [
                                                    'required' => '選択必須です'
                                                ]
                                            ]
                                        ],
                                        'answers' => [
                                            [
                                                'name' => 'はい'
                                            ],
                                            [
                                                'name' => 'いいえ'
                                            ],
                                            [
                                                'name' => 'その他',
                                                'extra_field' => '<input size="100" type="text" />'
                                            ]
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ],
            [
                [
                    'question' => [
                        'title' => '伐採する植栽の種類をお教えください。',
                        'body' => '伐採する植栽の種類をお教えください。',
                        'selectable_answers' => 3,
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
                            'name' => '庭木（単独の木）',
                            'add_question' => [
                                [
                                    'question' => [
                                        'title' => '木の高さ',
                                        'body' => '木の高さ',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => '高さ１ｍ以下'
                                        ],
                                        [
                                            'name' => '高さ１ｍ～２ｍ'
                                        ],
                                        [
                                            'name' => '高さ２ｍ～３ｍ'
                                        ],
                                        [
                                            'name' => '高さ３ｍ～４ｍ未満'
                                        ],
                                        [
                                            'name' => '高さ４ｍ～５ｍ未満'
                                        ],
                                        [
                                            'name' => '高さ５ｍ～６ｍ未満'
                                        ],
                                        [
                                            'name' => '高さ６ｍ～７ｍ未満'
                                        ],
                                        [
                                            'name' => '高さ７ｍ以上'
                                        ]
                                    ]
                                ],
                                [
                                    'question' => [
                                        'title' => '本数',
                                        'body' => '本数',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => 'プルダウン'
                                        ]
                                    ]
                                ],
                                [
                                    'question' => [
                                        'title' => '幹の太さ（根元直径）',
                                        'body' => '幹の太さ（根元直径）',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => '根元直径5cm未満'
                                        ],
                                        [
                                            'name' => '根元直径5cm～10㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径10cm～15㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径15cm～20㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径20cm～25㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径25cm～30㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径30cm～35㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径35cm～40㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径40cm以上'
                                        ]
                                    ]
                                ],
                                [
                                    'question' => [
                                        'title' => '作業で発生する枝葉の処分も希望しますか？',
                                        'body' => '作業で発生する枝葉の処分も希望しますか？',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => 'はい'
                                        ],
                                        [
                                            'name' => 'いいえ'
                                        ],
                                        [
                                            'name' => 'その他',
                                            'extra_field' => '<input size="100" type="text" />'
                                        ]
                                    ]
                                ]
                            ]
                        ],
                        [
                            'name' => '生垣（垣根）',
                            'add_question' => [
                                [
                                    'question' => [
                                        'title' => '木の高さ',
                                        'body' => '木の高さ',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => '高さ１ｍ未満'
                                        ],
                                        [
                                            'name' => '高さ１ｍ～２ｍ未満'
                                        ],
                                        [
                                            'name' => '高さ２ｍ～３ｍ未満'
                                        ],
                                        [
                                            'name' => '高さ３ｍ以上'
                                        ]
                                    ]
                                ],
                                [
                                    'question' => [
                                        'title' => '距離（延長）',
                                        'body' => '距離（延長）',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => '20ｍ未満'
                                        ],
                                        [
                                            'name' => '20ｍ～40ｍ未満'
                                        ],
                                        [
                                            'name' => '40ｍ～60ｍ未満'
                                        ],
                                        [
                                            'name' => '60ｍ～80ｍ未満'
                                        ],
                                        [
                                            'name' => '80ｍ～100ｍ未満'
                                        ],
                                        [
                                            'name' => '100ｍ以上'
                                        ]
                                    ]
                                ],
                                [
                                    'question' => [
                                        'title' => '幹の太さ（根元直径）',
                                        'body' => '幹の太さ（根元直径）',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => '根元直径5cm未満'
                                        ],
                                        [
                                            'name' => '根元直径5cm～10㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径10cm～15㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径15cm～20㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径20cm以上'
                                        ]
                                    ]
                                ],
                                [
                                    'question' => [
                                        'title' => '作業で発生する枝葉の処分も希望しますか？',
                                        'body' => '作業で発生する枝葉の処分も希望しますか？',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => 'はい'
                                        ],
                                        [
                                            'name' => 'いいえ'
                                        ],
                                        [
                                            'name' => 'その他',
                                            'extra_field' => '<input size="100" type="text" />'
                                        ]
                                    ]
                                ]
                            ]
                        ],
                        [
                            'name' => '植込み・花壇植栽',
                            'add_question' => [
                                [
                                    'question' => [
                                        'title' => '木の高さ',
                                        'body' => '木の高さ',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => '高さ１ｍ以下'
                                        ],
                                        [
                                            'name' => '高さ１ｍ～２ｍ'
                                        ],
                                        [
                                            'name' => '高さ２ｍ以上'
                                        ]
                                    ]
                                ],
                                [
                                    'question' => [
                                        'title' => '面積',
                                        'body' => '面積',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => '20㎡未満'
                                        ],
                                        [
                                            'name' => '20㎡～40㎡未満'
                                        ],
                                        [
                                            'name' => '40㎡～60㎡未満'
                                        ],
                                        [
                                            'name' => '60㎡～80㎡未満'
                                        ],
                                        [
                                            'name' => '80㎡～100㎡未満'
                                        ],
                                        [
                                            'name' => '100㎡以上'
                                        ]
                                    ]
                                ],
                                [
                                    'question' => [
                                        'title' => '幹の太さ（根元直径）',
                                        'body' => '幹の太さ（根元直径）',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => '根元直径5cm未満'
                                        ],
                                        [
                                            'name' => '根元直径5cm～10㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径10cm～15㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径15cm～20㎝未満'
                                        ],
                                        [
                                            'name' => '根元直径20cm以上'
                                        ]
                                    ]
                                ],
                                [
                                    'question' => [
                                        'title' => '作業で発生する枝葉の処分も希望しますか？',
                                        'body' => '作業で発生する枝葉の処分も希望しますか？',
                                        'selectable_answers' => 1,
                                        'validation' => [
                                            'rules' => [
                                                'required' => true
                                            ],
                                            'messages' => [
                                                'required' => '選択必須です'
                                            ]
                                        ]
                                    ],
                                    'answers' => [
                                        [
                                            'name' => 'はい'
                                        ],
                                        [
                                            'name' => 'いいえ'
                                        ],
                                        [
                                            'name' => 'その他',
                                            'extra_field' => '<input size="100" type="text" />'
                                        ]
                                    ]
                                ]
                            ]
                        ]
                    ]
                ]
            ]
        ];

        foreach($data_list as $data) {
            $this->makeInit($data);
        }
    }

    public function makeInit(array $data_list): int
    {
        $question_id = null;
        $reverse_data_list = array_reverse($data_list);
        foreach($reverse_data_list as $data) {
            $question = $this->makeQuestion($question_id, $data['question']);
            $question_id = $question->id;
            foreach($data['answers'] as $answer_data) {
                $add_question_id = null;
                if (!empty($answer_data['add_question'])) {                    
                    $add_question_id = $this->makeInit($answer_data['add_question']);
                }
                $answer = $this->makeAnswer($question_id, $answer_data, $add_question_id);
            }
        }

        return $question_id;
    }

    public function makeQuestion(?int $question_id, array $question_data): Question
    {
        if (!empty($question_id)) {
            $question_data['question_id'] = $question_id;
        }
        $question = Question::create($question_data);

        return $question;
    }

    public function makeAnswer(int $question_id, array $answer_data, ?int $add_question_id): Answer
    {
        $answer_data['question_id'] = $question_id;
        $answer_data['add_question_id'] = $add_question_id;
        unset($answer_data['add_question']);
        $answer = Answer::create($answer_data);

        return $answer;
    }
}
