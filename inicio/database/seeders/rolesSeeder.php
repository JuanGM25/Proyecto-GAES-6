<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;

class rolesSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
{
    DB::table('roles')->updateOrInsert(
        ['id_rango' => 1],
        ['rango' => 'usuario']
    );

    DB::table('roles')->updateOrInsert(
        ['id_rango' => 2],
        ['rango' => 'administrador']
    );
}

}

