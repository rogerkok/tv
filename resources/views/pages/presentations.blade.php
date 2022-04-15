@extends('layouts.app')

@section('styles')
<style>


</style>
@endsection

@section('content')
	<div class="banner-slider" style="background-image: url({{ Voyager::image(setting('site.banner_img')) }})">
		<div class="bg"></div>
		<div class="bannder-table">
			<div class="banner-text">
				<h1>{{ $title }}</h1>
			</div>
		</div>
	</div>
    @include('pages.partials.content-presentation')
@endsection
