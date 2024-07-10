<?php

namespace Database\Seeders;

use Illuminate\Database\Seeder;

class MasterSeeder extends Seeder
{
    /**
     * Run the database seeds.
     *
     * @return void
     */
    public function run()
    {
        $db = \Config::get('database.connections.mysql.database');
        $user = \Config::get('database.connections.mysql.username');
        $pass = \Config::get('database.connections.mysql.password');
        $host = \Config::get('database.connections.mysql.host');

        $path = __DIR__ . '/sql/zenkoku.sql';
        exec("mysql -u " . $user . " -h" . $host . " -p" . $pass . " " . $db . " < ". $path);
    }
}
