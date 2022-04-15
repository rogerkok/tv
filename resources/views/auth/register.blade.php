@extends('layouts.app')

@section('content')

    <!-- ##### Login Area Start ##### -->
    <div class="vizew-login-area section-padding-50">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="login-content">
                        <!-- Section Title -->
                        <div class="section-heading">
                            <h4>Inscription des membres Solidarityworld et participants du projet G.nioos</h4>
                            <div class="line"></div>
                        </div>

                        <form method="POST" action="{{ route('register') }}" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input id="firstName" placeholder="{{ __('Prénom') }}" type="text" class="form-control @error('firstName') is-invalid @enderror" name="firstName" value="{{ old('firstName') }}" required autocomplete="firstName" autofocus>

                                        @error('firstName')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <input id="lastName" placeholder="{{ __('Nom') }}" type="text" class="form-control @error('lastName') is-invalid @enderror" name="lastName" value="{{ old('lastName') }}" required autocomplete="lastName" autofocus>

                                        @error('lastName')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <input id="youtube_link" placeholder="{{ __('Lien Youtube') }}" type="text" class="form-control @error('youtube_link') is-invalid @enderror" name="youtube_link" value="{{ old('youtube_link') }}" required autocomplete="youtube_link" autofocus>
                                        @error('youtube_link')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                   <div class="form-group">
                                       <input id="email" placeholder="{{ __('Adresse email') }}"  type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ old('email') }}" required autocomplete="email" autofocus>

                                       @error('email')
                                       <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                       @enderror
                                   </div>
                                    <div class="form-group">
                                        <input title="Selectionnez votre photo de profil" id="thumbnail"  type="file" class="form-control @error('thumbnail') is-invalid @enderror" name="thumbnail" required autocomplete="thumbnail" autofocus>

                                        @error('thumbnail')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <select required name="country_id" id="country" class="form-control @error('country_id') is-invalid @enderror">
                                            <option value="">Selectionnez votre pays</option>
                                            @foreach(\App\Models\Country::orderBy('name', 'ASC')->get() as $country)
                                                <option {{ old('country_id') == $country->id ? 'selected' : '' }} value="{{ $country->id }}">{{$country->name}}</option>
                                            @endforeach
                                        </select>
                                        @error('country')
                                            <span class="invalid-feedback" role="alert">
                                                <strong>{{ $message }}</strong>
                                            </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <select name="membership_type" id="" class="form-control" required>
                                            <option value="">Choix du type de membre</option>
                                            @foreach (\App\Models\MemberType::orderBy('label', 'ASC')->get() as $membership)
                                                <option value="{{ $membership->id }}">{{ $membership->label }}</option>
                                            @endforeach
                                        </select>
                                        @error('mebership_type')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                    <div class="form-group">
                                        <input id="name" placeholder="{{ __("Nom d'utilisateur") }}" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ old('name') }}" required autocomplete="name" autofocus>

                                        @error('name')
                                        <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                        @enderror
                                    </div>
                                   <div class="form-group">
                                       <input id="password" placeholder="Mot de passe" type="password" class="form-control @error('password') is-invalid @enderror" name="password" required autocomplete="current-password">

                                       @error('password')
                                       <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                       @enderror
                                   </div>
                                   <div class="form-group">
                                       <input  id="password-confirm"
                                               name="password_confirmation" placeholder="Confirmation mot de passe" type="password" class="form-control"  required autocomplete="new-password">

                                       @error('password')
                                       <span class="invalid-feedback" role="alert">
                                            <strong>{{ $message }}</strong>
                                        </span>
                                       @enderror
                                   </div>
                                </div>

                            </div>
                            <button type="submit" class="btn vizew-btn w-100 mt-30">{{ __('Register') }}</button>
                            @if (Route::has('login'))
                                <a class="btn btn-link" href="{{ route('login') }}">
                                    J'ai déjà un compte ? {{ __('Login') }}
                                </a>
                            @endif

                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>
    <!-- ##### Login Area End ##### -->
@endsection
