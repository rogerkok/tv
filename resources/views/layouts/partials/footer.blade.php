<footer class="footer-area">
    <div class="container">
        <div class="row">
            <!-- Footer Widget Area -->
            <div class="col-md-4">
                <div class="footer-widget mb-70">
                    <!-- Logo -->
                    <a href="" class="foo-logo d-block mb-4">
                        <img src="{{ Voyager::image(setting('site.logo') ) }}" alt="{{ config('app.name') }}">
                    </a>
                    <p>{{ setting('home.footer_intro') }}</p>
                    <!-- Footer Newsletter Area -->
                    <div class="footer-nl-area">
                        <form action="#" method="post">
                            <input type="email" name="nl-email" class="form-control" id="nlEmail" placeholder="Your email">
                            <button type="submit"><i class="fa fa-paper-plane" aria-hidden="true"></i></button>
                        </form>
                    </div>
                </div>
            </div>

            <!-- Footer Widget Area -->
            <div class="col-md-4">
                <div class="footer-widget mb-70">
                    <h6 class="widget-title">Derniers Tweets</h6>
                    <!-- Twitter Slides -->
                    <div class="twitter-slides owl-carousel">

                        <!-- Single Twitter Slide -->
                        <div class="single--twitter-slide">
                            <!-- Single Twit -->
                            <div class="single-twit">
                                <p><i class="fa fa-twitter"></i> <span>@gnioos</span>
                                Lorem ipsum dolor sit amet consectetur adipisicing elit. Laudantium vitae assumenda, quod nulla ab quia?
                                </p>
                            </div>
                            <!-- Single Twit -->
                            <div class="single-twit">
                                <p><i class="fa fa-twitter"></i> <span>@solidarityworld</span>
                                Lorem ipsum dolor sit amet, consectetur adipisicing elit. Veritatis reiciendis necessitatibus itaque ducimus repudiandae non?</p>
                            </div>
                        </div>

                        <!-- Single Twitter Slide -->
                        <div class="single--twitter-slide">
                            <!-- Single Twit -->
                            <div class="single-twit">
                                <p><i class="fa fa-twitter"></i> <span>@solidarityworld</span> Lorem ipsum dolor sit amet consectetur adipisicing elit. Soluta, eligendi.</p>
                            </div>
                            <!-- Single Twit -->
                            <div class="single-twit">
                                <p><i class="fa fa-twitter"></i> <span>@gnioos</span> Lorem ipsum dolor sit amet consectetur adipisicing elit. Molestiae ullam impedit enim.</p>
                            </div>
                        </div>

                    </div>
                </div>
            </div>

            <!-- Footer Widget Area -->
            <div class="col-md-4">
                <div class="footer-widget mb-70">
                    <h6 class="widget-title">Notre adresse</h6>
                    <!-- Contact Address -->
                    <div class="contact-address">
                        <p>{!! nl2br(setting('home.adresse')) !!}
                    </div>
                    <!-- Footer Social Area -->
                    <div class="footer-social-area">
                        <a href="{{ setting('site.facebook') }}" target="_blank" class="facebook"><i class="fa fa-facebook"></i></a>
                        <a href="{{ setting('site.instagram') }}" target="_blank" class="instagram"><i class="fa fa-instagram"></i></a>
                        <a href="{{ setting('site.twitter') }}" target="_blank" class="twitter"><i class="fa fa-twitter"></i></a>
                        <a href="{{ setting('site.linkedin') }}" target="_blank" class="linkedin"><i class="fa fa-linkedin"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Copywrite Area -->
    <div class="copywrite-area">
        <div class="container">
            <div class="row align-items-center">
                <!-- Copywrite Text -->
                <div class="col-12 col-sm-6">
                    <p class="copywrite-text">{{ setting('site.footer_page') }}</p>
                </div>
                <div class="col-12 col-sm-6">
                    <nav class="footer-nav">
                        <ul>
                            <li><a href="{{ url('/') }}">Acceuil</a></li>
                            <li><a href="{{ route('video-presentation') }}">Présentations</a></li>
                            <li><a href="#">Privacy</a></li>
                        </ul>
                    </nav>
                </div>
            </div>
        </div>
    </div>
</footer>
