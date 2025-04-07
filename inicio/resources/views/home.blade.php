@extends('layouts.app')

@section('content')
<div class="container">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="card">
                @if(Auth::user()->id_rango == 2)                
                    <div class="card-header">{{ __('Bienvenido Administrador:' ) }} {{ Auth::user()->name }}</div>
                @else
                    <div class="card-header">{{ __('Explora ahora entre cientos de cursos') }}</div>
                @endif

                <div class="card-body">
                    @if (session('status'))
                        <div class="alert alert-success" role="alert">
                            {{ session('status') }}
                        </div>
                    @endif

                    @if(Auth::user()->id_rango == 2)                
                        {{ __('Opciones') }}
                    @else
                        {{ __('Mi cuenta') }}
                    @endif
                </div>
            </div>
        </div>
    </div>
</div>
@endsection
