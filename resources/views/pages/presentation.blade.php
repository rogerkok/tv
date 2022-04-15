@extends('layouts.app')

@section('content')
	<div class="banner-slider" style="background-image: url({{ Voyager::image(setting('site.banner_img')) }})">
		<div class="bg"></div>
		<div class="bannder-table">
			<div class="banner-text">
				<h1>PRESENTATION - {{ $user->fullName }}</h1>
			</div>
		</div>
    </div>

    <div class="single-service-area pt_50 pb_60 common-text">
        <div class="container">
            <div class="row">
                <div class="col-md-8">

                    <div class="row">
                        <div class="col-12">
                            <div class="single-video-area">
                                <iframe src="https://www.youtube.com/embed/{{ $youtubeLink }}" allow="accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture" allowfullscreen></iframe>
                            </div>
                        </div>
                    </div>

                    <div class="row justify-content-center">
                        <!-- Post Details Content Area -->
                        <div class="col-12 p-3">
                            <div class="post-details-content d-flex">
                                <!-- Post Share Info -->
                                <div class="post-share-info">
                                    <a href="{{ $user->facebook }}" target="_blank" class="facebook"><i class="fa fa-facebook"></i></a>
                                    <a href="{{ $user->twitter }}" target="_blank" class="twitter"><i class="fa fa-twitter"></i></a>
                                    <a href="{{ $user->linkedin }}" target="_blank" class="linkedin"><i class="fa fa-linkedin"></i></a>
                                    <a href="{{ $user->github }}" target="_blank" class="instagram"><i class="fa fa-github"></i></a>
                                </div>

                                <!-- Blog Content -->
                                <div class="blog-content">

                                    <!-- Post Content -->
                                    <div class="post-content mt-0">
                                        @if ($user->country)

                                        Pays : <a href="{{ route('presentations', [$user->country]) }}" class="post-cata cata-sm cata-danger">{{ $user->country->name }}</a> <br>
                                        @endif
                                        Type de membre :
                                        @if ($user->membership)

                                        <a href="{{ route('presentations', ['country' => $user->country, 'member-type' => $user->membership->slug]) }}" class="post-cata cata-sm cata-success">{{ $user->membership->label }}</a>
                                        @endif
                                        <a href="#" class="post-title mb-2 color-blue">{{ $user->fullName }}</a>

                                    </div>

                                    <p>{!! $user->about !!}</p>

                                </div>
                            </div>
                            <div class="related-post-area mt-5">
                                <!-- Section Title -->
                                <div class="section-heading style-2">
                                    <h4>Autres presentations qui peuvent vous intéresser</h4>
                                    <div class="line"></div>
                                </div>

                                <div class="row">
                                    @foreach ($related as $item)
                                        <div class="col-md-12">
                                            <div class="card bg-white user-card-full">
                                                <div class="row m-l-0 m-r-0">
                                                    <div class="col-sm-4 bg-c-lite-green user-profile">
                                                        <div class="card-block text-center text-white">
                                                            <div class="m-b-25">
                                                                <img src="{{ $item->avatar  }}" class="img-radius" alt="{{ $item->fullName }}">
                                                            </div>
                                                            <h6 class="f-w-600 color-white">{{ $item->fullName }}</h6>
                                                            <p class="text-center color-white">
                                                                {{ $item->membership ? $item->membership->label : '' }}
                                                            </p>
                                                        </div>
                                                    </div>
                                                    <div class="col-sm-8">
                                                        <div class="card-block">
                                                            <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <p class="m-b-10 f-w-600">Email</p>
                                                                    <h6 class="text-muted f-w-400">{{ $item->email }}</h6>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <p class="m-b-10 f-w-600">Pays</p>
                                                                    @if ($item->country)

                                                                    <h6 class="f-w-600">
                                                                        <a class="color-blue" href="{{ route('presentations', ['country' => $item->country]) }}">
                                                                            {{ $item->country->name }}
                                                                        </a>
                                                                    </h6>
                                                                    @endif
                                                                </div>
                                                            </div>
                                                            <div class="row">
                                                                <div class="col-sm-6">
                                                                    <p class="m-b-10 f-w-600">Type membre</p>
                                                                    <h6 class="text-muted f-w-400">{{ $item->membership ? $item->membership->label : '' }}</h6>
                                                                </div>
                                                                <div class="col-sm-6">
                                                                    <p class="m-b-10 f-w-600">Date ajout</p>
                                                                    <h6 class="text-muted f-w-400">{{ $item->created_at->diffForHumans() }}</h6>
                                                                </div>
                                                            </div>
                                                            <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Lien sociaux</h6>
                                                            <div class="row">
                                                                <div class="col-md-6">
                                                                    <ul class="social-link list-unstyled m-0">
                                                                        <li><a href="{{ $item->facebook }}" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                                                        <li><a href="{{ $item->twitter }}" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                                                        <li><a href="{{ $item->linkedin }}" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                                                                        <li><a href="{{ $item->github }}" target="_blank"><i class="fa fa-github"></i></a></li>
                                                                    </ul>
                                                                </div>
                                                                <div class="col-md-6">
                                                                    <a href="{{ route('showV', Str::slug($item->username )) }}" class="btn btn-primary mt-3 btn-rounded waves-effect w-md waves-light pull-right">
                                                                        Accèder à la présentation
                                                                    </a>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    @endforeach
                                </div>
                            </div>
                        </div>

                    </div>
                </div>

                @include('pages.partials.sidebar')
            </div>
        </div>
    </div>

@endsection
