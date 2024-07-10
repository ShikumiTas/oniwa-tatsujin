<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;

use App\Models\Question;
use App\Models\Answer;

use File;

class QuestionSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
        $path = database_path('seeders/questions/*');
        $json_files = glob($path);

        $data_list = array_map(
            function ($json_file) {
                $contents = File::get($json_file);
                return json_decode(json: $contents, associative: true);
            },
            $json_files
        );

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
