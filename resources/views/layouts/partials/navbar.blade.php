<header class="header-area">
    <!-- Top Header Area -->
    <div class="top-header-area">
        <div class="container">
            <div class="row align-items-center">
                <div class="col-12 col-md-6">
                    <!-- Breaking News Widget -->
                    <div class="breaking-news-area d-flex align-items-center">
                        <div class="news-title">
                            <p>News:</p>
                        </div>
                        <div id="breakingNewsTicker" class="ticker">
                            <ul>
                                <li><a>FINANCEMENT PARTICIPATIF</a></li>
                                <li><a>COWORKING</a></li>
                                <li><a>TOURISME PARTICIPATIF</a></li>
                                <li><a>CONSOMMATION COLLABORATIVE</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
                <div class="col-12 col-md-6">
                    <div class="top-meta-data d-flex align-items-center justify-content-end">
                        <!-- Top Social Info -->
                        <div class="top-social-info">
                            <a href="{{ setting('site.facebook') }}" target="_blank"><i class="fa fa-facebook"></i></a>
                            <a href="{{ setting('site.twitter') }}" target="_blank"><i class="fa fa-twitter"></i></a>
                            <a href="{{ setting('site.linkedin') }}" target="_blank"><i class="fa fa-linkedin"></i></a>
                            <a href="{{ setting('site.youtube') }}" target="_blank"><i class="fa fa-youtube-play"></i></a>
                        </div>

                        <!-- Login -->
                        @guest
                        <a href="{{route('login')}}" class="login-btn" title="Connexion"><i class="fa fa-lock" aria-hidden="true"></i></a>
                        <a href="{{route('register')}}" class="login-btn" title="Inscription"><i class="fa fa-user" aria-hidden="true"></i></a>
                        @else
                        <a href="#" class="login-btn" title="{{ auth()->user()->name }}"><i class="fa fa-user" aria-hidden="true"></i></a>
                        <a href="{{ route('logout') }}" onclick="event.preventDefault();
                        document.getElementById('logout-form').submit();" class="login-btn" title="{{ auth()->user()->name }}">
                            Déconnexion
                            <i class="fa fa-power-off" aria-hidden="true"></i>
                        </a>
                        <form id="logout-form" action="{{ route('logout') }}" method="POST" style="display: none;">
                            @csrf
                        </form>
                        @endguest

                    </div>
                </div>
            </div>
        </div>
    </div>

    <!-- Navbar Area -->
    <div class="vizew-main-menu" id="sticker">
        <div class="classy-nav-container breakpoint-off">
            <div class="container">

                <!-- Menu -->
                <nav class="classy-navbar justify-content-between" id="vizewNav">

                    <!-- Nav brand -->
                    <a href="/" class="nav-brand">
                        <img src="{{ Voyager::image(setting('site.logo') ) }}" alt="{{ config('app.name') }}">
                    </a>

                    <!-- Navbar Toggler -->
                    <div class="classy-navbar-toggler">
                        <span class="navbarToggler"><span></span><span></span><span></span></span>
                    </div>

                    <div class="classy-menu">

                        <!-- Close Button -->
                        <div class="classycloseIcon">
                            <div class="cross-wrap"><span class="top"></span><span class="bottom"></span></div>
                        </div>

                        <!-- Nav Start -->
                        <div class="classynav">
                            <ul>
                                <li class="">
                                    <a href="{{route('homepage')}}">Accueil</a></li>
                                <li class=""><a href="{{ route('video-presentation') }}">Présentations</a></li>
                                <li class=""><a href="#">Categorie</a>
                                    <ul class="dropdown" style="width: 250px;">
                                        @foreach(\App\Models\MemberType::orderBy('label', 'ASC')->get() as $membership)
                                            <li>
                                                <a href="{{ route('presentations', ['member-type' => $membership->slug]) }}">
                                                    {{ $membership->label }}
                                                </a>
                                            </li>
                                        @endforeach
                                    </ul>
                                </li>
                                <li class=""><a href="#">Pays</a>
                                    <div class="megamenu">
                                        @foreach(\App\Models\Country::orderBy('name', 'ASC')->get()->split(4) as $chunkedCountries)
                                            <ul class="single-mega cn-col-4">
                                                @foreach ($chunkedCountries as $country)
                                                    <li>
                                                        <a href="{{ route('presentations', ['country' => $country]) }}">
                                                            {{ $country->name }}
                                                        </a>
                                                    </li>
                                                @endforeach
                                            </ul>
                                        @endforeach

                                    </div>
                                </li>

                                @guest
                                @else
                                <li><a href="#">{{ auth()->user()->name }}</a>
                                    <div class="dropdown">
                                        <ul class="single-mega cn-col-4">
                                            <li><a href="{{ route('updateProfile') }}">Modifier Profile</a></li>
                                        </ul>
                                    </div>
                                </li>
                                @endguest

                            </ul>
                        </div>
                        <!-- Nav End -->
                    </div>
                </nav>
            </div>
        </div>
    </div>
</header>
