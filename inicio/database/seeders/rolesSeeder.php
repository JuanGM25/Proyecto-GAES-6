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
        ['id_rol' => 1],
        ['rol' => 'administrador']
    );

    DB::table('roles')->updateOrInsert(
        ['id_rol' => 2],
        ['rol' => 'aprendiz']
    );

    DB::table('roles')->updateOrInsert(
        ['id_rol' => 3],
        ['rol' => 'instructor']
    );
}

}

