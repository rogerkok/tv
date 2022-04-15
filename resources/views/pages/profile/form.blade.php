@extends('layouts.app')

@section('styles')
    <link rel="stylesheet" href="{{ mix('css/profile.css') }}">
@endsection
@section('content')
    <!-- ##### Login Area Start ##### -->
    <div class="vizew-login-area section-padding-50">
        <div class="container">
            <div class="row justify-content-center">
                <div class="col-12">
                    <div class="login-content">
                        <!-- Section Title -->
                        <div class="section-heading">
                            <h4>Modification profil</h4>
                            <div class="line"></div>
                        </div>

                        <div class="row">
                            <div class="col-md-12">
                                <div class="card hovercard">
                                    <div class="cardheader">

                                    </div>
                                    <div class="avatar">
                                        <img alt="{{ $user->fullName  }}" src="{{ $user->avatar  }}">
                                    </div>
                                    <div class="info">
                                        <div class="title">
                                            <a  href="#">{{ $user->name  }}</a>
                                        </div>
                                        <div class="desc">{{ $user->membership ? $user->membership->label : '' }}</div>
                                        <div class="desc">{{ $user->country ? $user->country->name : '' }}</div>
                                    </div>
                                    <div class="bottom">
                                        <a class="btn btn-primary btn-twitter btn-sm"
                                         href="{{ $user->twitter }}">
                                            <i class="fa fa-twitter"></i>
                                        </a>
                                        <a class="btn btn-primary btn-sm" rel="publisher"
                                        href="{{ $user->facebook }}">
                                            <i class="fa fa-facebook"></i>
                                        </a>
                                        <a class="btn btn-primary btn-sm" rel="publisher"
                                        href="{{ $user->linkedin }}">
                                            <i class="fa fa-linkedin"></i>
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>

                        <form method="POST" action="{{ route('updateProfile') }}" enctype="multipart/form-data">
                            @csrf
                            <div class="row">
                                <div class="col-md-12">
                                    <div class="form-group">
                                        <label for="">Choix du membre</label>
                                        <select name="membership_type" id="" class="form-control" required>
                                            <option value="">Choix du type de membre</option>
                                            @foreach (\App\Models\MemberType::orderBy('label', 'ASC')->get() as $membership)
                                                <option {{ $user->membership && $user->membership->id == $membership->id ? 'selected' : '' }} value="{{ $membership->id }}">{{ $membership->label }}</option>
                                            @endforeach
                                        </select>
                                        @error('mebership_type')
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input id="name" placeholder="{{ __("Nom d'utilisateur") }}" type="text" class="form-control @error('name') is-invalid @enderror" name="name" value="{{ $user->name ?? old('name') }}" required autocomplete="name" autofocus>

                                        @error('name')
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                        @enderror
                                    </div>
                                </div>
                               <div class="col-md-6">
                                   <div class="form-group">
                                       <input id="email" placeholder="{{ __('Adresse email') }}"  type="email" class="form-control @error('email') is-invalid @enderror" name="email" value="{{ $user->email ?? old('email') }}" required autocomplete="email" autofocus>

                                       @error('email')
                                       <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                       @enderror
                                   </div>
                               </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input id="firstName" placeholder="{{ __('Prénom') }}" type="text" class="form-control @error('firstName') is-invalid @enderror" name="firstName" value="{{ $user->firstName ?? old('firstName') }}" required autocomplete="firstName" autofocus>

                                        @error('firstName')
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input id="lastName" placeholder="{{ __('Nom') }}" type="text" class="form-control @error('lastName') is-invalid @enderror" name="lastName" value="{{$user->lastName ?? old('lastName') }}" required autocomplete="lastName" autofocus>

                                        @error('lastName')
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <input id="youtube_link" placeholder="{{ __('Lien Youtube') }}" type="text" class="form-control @error('youtube_link') is-invalid @enderror" name="youtube_link" value="{{$user->youtube_link ?? old('youtube_link') }}" required autocomplete="youtube_link" autofocus>
                                        @error('youtube_link')
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                        @enderror
                                    </div>
                                </div>
                                <div class="col-md-6">
                                    <div class="form-group">
                                        <select name="country_id" id="country" class="form-control @error('country_id') is-invalid @enderror">
                                            <option value="">Selectionnez votre pays</option>
                                            @foreach(\App\Models\Country::orderBy('name', 'ASC')->get() as $country)
                                                <option {{ $user->country && $user->country->id == $country->id ? 'selected' : '' }} value="{{$country->id}}">{{$country->name}}</option>
                                            @endforeach
                                        </select>
                                        @error('country')
                                        <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                        @enderror
                                    </div>
                                </div>
                               <div class="col-md-6">
                                   <div class="form-group">
                                       <input id="facebook" placeholder="{{ __('Facebook') }}" type="text" value="{{ $user->facebook ?? old('facebook')}}" class="form-control @error('facebook') is-invalid @enderror" name="facebook">

                                       @error('facebook')
                                       <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                       @enderror
                                   </div>
                               </div>
                               <div class="col-md-6">
                                   <div class="form-group">
                                       <input  id="linkedin"
                                               name="linkedin" placeholder="{{ __('Linkedin') }}" type="text" class="form-control" value="{{ $user->linkedin ?? old('linkedin') }}">

                                       @error('linkedin')
                                       <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                       @enderror
                                   </div>
                               </div>
                               <div class="col-md-6">
                                <div class="form-group">
                                    <input id="github" placeholder="{{ __('Github') }}" type="text" value="{{ $user->github ?? old('github')}}" class="form-control @error('github') is-invalid @enderror" name="github">

                                    @error('github')
                                    <span class="invalid-feedback" role="alert">
                                     <strong>{{ $message }}</strong>
                                 </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input  id="linkedin"
                                            name="twitter" placeholder="{{ __('Twitter') }}" type="text" class="form-control" value="{{$user->twitter ?? old('twitter') }}">

                                    @error('twitter')
                                    <span class="invalid-feedback" role="alert">
                                     <strong>{{ $message }}</strong>
                                 </span>
                                    @enderror
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="form-group">
                                    <input title="Selectionnez votre photo de profil" id="thumbnail"  type="file" class="form-control @error('thumbnail') is-invalid @enderror" name="thumbnail">

                                    @error('thumbnail')
                                    <span class="invalid-feedback" role="alert">
                                        <strong>{{ $message }}</strong>
                                    </span>
                                    @enderror
                                </div>
                            </div>

                            </div>
                            <button type="submit" class="btn vizew-btn w-100 mt-30">{{ __('Mettre à jour mon profile') }}</button>
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
