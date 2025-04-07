<?php

namespace App\Models;

use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Database\Eloquent\Factories\HasFactory;

class Usuario extends Authenticatable
{
    use HasFactory, Notifiable;

    protected $table = 'usuario'; // nombre de tu tabla
    protected $primaryKey = 'id_usuario'; // clave primaria personalizada
    public $timestamps = false; // si no tenés created_at y updated_at

    protected $fillable = [
        'primer_nombre',
        'segundo_nombre',
        'correo',
        'password',
        'fkid_rol',
    ];

    protected $hidden = [
        'password',
        'remember_token',
    ];

    protected $casts = [
        'password' => 'hashed',
    ];
}



