<?php

namespace Database\Seeders;

use Illuminate\Database\Console\Seeds\WithoutModelEvents;
use Illuminate\Database\Seeder;
use Illuminate\Support\Facades\DB;
use Illuminate\Support\Facades\Hash;

class usuarioSeeder extends Seeder
{
    /**
     * Run the database seeds.
     */
    public function run(): void
    {
         DB::table('usuario')->insert([
            'primer_nombre' => 'tim',
            'segundo_nombre' => 'burton',
            'correo' => 'burton@gmail.com',
            'password' => Hash::make('tim1234'),
            'fkid_rol' => 1,
        ]);
    }
}
