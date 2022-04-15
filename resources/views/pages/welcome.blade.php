@extends('layouts.app')
@section('content')
    <section class="vizew-post-area mb-50">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="all-posts-area">
                        <!-- Section Heading -->
                        <div class="section-heading style-2">
                            <h4>TV G.nioos</h4>
                            <div class="line"></div>
                        </div>

                        <!-- Featured Post Slides -->
                        <div class="featured-post-slides owl-carousel mb-30">
                            <!-- Single Feature Post -->
                            @foreach ($sliders as $slider)
                            <div class="single-feature-post video-post bg-img" style="background-image: url({{ Voyager::image($slider->image) }});">

                                <!-- Post Content -->
                                <div class="post-content">

                                    <p  class="post-title">
                                        {!! $slider->title1 !!}
                                    </p>
                                </div>


                            </div>
                            @endforeach
                        </div>
                    </div>
                   {!!setting('home.description_accueil') !!}
                </div>


            </div>
        </div>
    </section>
@endsection
