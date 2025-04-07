@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-7">
            <div class="card">
                <div class="card-header">{{ __('Registrarse') }}</div>

                <div class="card-body">
                    <form method="POST" action="{{ route('register') }}">
                        @csrf

                        <!-- Primer Nombre -->
                        <div class="row mb-3">
                            <label for="primer_nombre" class="col-md-4 col-form-label text-md-end">{{ __('Primer nombre') }}</label>
                            <div class="col-md-6">
                                <input id="primer_nombre" type="text" class="form-control @error('primer_nombre') is-invalid @enderror" name="primer_nombre" value="{{ old('primer_nombre') }}" required autofocus>
                                @error('primer_nombre')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>
                        <!-- Segundo Nombre -->
                        <div class="row mb-3">
                            <label for="segundo_nombre" class="col-md-4 col-form-label text-md-end">{{ __('Segundo nombre') }}</label>
                            <div class="col-md-6">
                                <input id="segundo_nombre" type="text" class="form-control @error('segundo_nombre') is-invalid @enderror" name="segundo_nombre" value="{{ old('segundo_nombre') }}" required>
                                @error('segundo_nombre')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <!-- Email -->

                    <div class="row mb-3">
                            <label for="correo" class="col-md-4 col-form-label text-md-end">{{ __('Correo Electrónico') }}</label>
                        <div class="col-md-6">
                             <input id="correo" type="email" class="form-control @error('correo') is-invalid @enderror" name="correo" value="{{ old('correo') }}" required>
                             @error('correo')
                               <span class="invalid-feedback" role="alert">
                                  <strong>{{ $message }}</strong>
                               </span>
                            @enderror
                       </div>
                    </div>

                        <!-- Password -->
                        <div class="row mb-3">
                            <label for="password" class="col-md-4 col-form-label text-md-end">{{ __('Contraseña') }}</label>
                            <div class="col-md-6">
                                <input id="password" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="new-password">
                                @error('password')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                @enderror
                            </div>
                        </div>

                        <!-- Confirmación de Password -->
                        <div class="row mb-3">
                            <label for="password-confirm" class="col-md-4 col-form-label text-md-end">{{ __('Confirma la Contraseña') }}</label>
                            <div class="col-md-6">
                                <input id="password-confirm" type="password" class="form-control" name="password_confirmation" required autocomplete="new-password">
                            </div>
                        </div>

                        <!-- (Opcional) Rol - si es seleccionable -->
                        {{-- 
                        <div class="row mb-3">
                            <label for="fkid_rol" class="col-md-4 col-form-label text-md-end">Rol</label>
                            <div class="col-md-6">
                                <select name="fkid_rol" id="fkid_rol" class="form-control">
                                    <option value="1">Administrador</option>
                                    <option value="2" selected>Usuario</option>
                                </select>
                            </div>
                        </div>
                        --}}

                        <div class="row mb-0">
                            <div class="col-md-6 offset-md-4">
                                <button type="submit" class="btn btn-success">
                                    {{ __('Crear Cuenta') }}
                                </button>
                            </div>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
