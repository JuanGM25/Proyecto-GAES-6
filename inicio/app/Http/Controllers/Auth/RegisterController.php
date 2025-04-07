<?php

namespace App\Http\Controllers\Auth;

use App\Http\Controllers\Controller;
use App\Models\Usuario;
use Illuminate\Foundation\Auth\RegistersUsers;
use Illuminate\Support\Facades\Hash;
use Illuminate\Support\Facades\Validator;

class RegisterController extends Controller
{
    use RegistersUsers;

    protected $redirectTo = '/home';

    public function __construct()
    {
        $this->middleware('guest');
    }

    /**
     * Validación del formulario de registro.
     */
    protected function validator(array $data)
    {
        return Validator::make($data, [
            'primer_nombre' => ['required', 'string', 'max:255'],
            'segundo_nombre' => ['required', 'string', 'max:255'],
            'correo' => ['required', 'string', 'email', 'max:255', 'unique:usuario'], 
            'password' => ['required', 'string', 'min:8', 'confirmed'],
        ]);
    }

    protected function create(array $data)
    {
        return Usuario::create([
            'primer_nombre' => $data['primer_nombre'],
            'segundo_nombre' => $data['segundo_nombre'],
            'correo' => $data['correo'],
            'password' => Hash::make($data['password']),
            'fkid_rol' => 2, 
        ]);
    }
}

