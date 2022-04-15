<div class="single-service-area pt_50 pb_60 common-text">
    <div class="container">
        <div class="row">
            <div class="col-md-8">
                <div class="archive-catagory-view mb-50 d-flex align-items-center justify-content-between">
                    <!-- Catagory -->
                    <div class="archive-catagory">
                        <h4><i class="fa fa-video" aria-hidden="true"></i> {{ $filter }} </h4>
                    </div>
                    <!-- View Options -->
                    <div class="view-options">
                        Filtrer
                        @foreach (\App\Models\MemberType::all() as $membership)
                        <a title="Filtrer : {{ $membership->label }}" class="color-blue" href="{{ route('presentations', ['member-type' => $membership->slug]) }}">
                            <i class="fa fa-list-ul" aria-hidden="true"></i>
                        </a>
                        @endforeach
                    </div>
                </div>
                @forelse ($users as $user)
                <div class="card bg-white user-card-full">
                    <div class="row m-l-0 m-r-0">
                        <div class="col-sm-4 bg-c-lite-green user-profile">
                            <div class="card-block text-center text-white">
                                <div class="m-b-25">
                                    <img src="{{ $user->avatar  }}" class="img-radius" alt="{{ $user->fullName }}">
                                </div>
                                <h6 class="f-w-600 color-white">{{ $user->fullName }}</h6>
                                <p class="text-center color-white">
                                    {{ $user->membership ? $user->membership->label : '' }}
                                </p>
                            </div>
                        </div>
                        <div class="col-sm-8">
                            <div class="card-block">
                                <h6 class="m-b-20 p-b-5 b-b-default f-w-600">Information</h6>
                                <div class="row">
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Email</p>
                                        <h6 class="text-muted f-w-400">{{ $user->email }}</h6>
                                    </div>
                                    @if ($user->country)

                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Pays</p>
                                        <h6 class="f-w-600">
                                            <a class="color-blue" href="{{ route('presentations', ['country' => $user->country]) }}">
                                                {{ $user->country->name }}
                                            </a>
                                        </h6>
                                    </div>
                                    @endif
                                </div>
                                <div class="row">
                                    @if (!is_null($user->membership))
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Type membre</p>
                                        <h6 class="text-muted f-w-400">
                                            <a class="color-blue" href="{{ route('presentations', ['country' => $user->country, 'member-type' => $user->membership->slug]) }}">
                                                {{ $user->membership->label }}
                                            </a>
                                        </h6>
                                    </div>
                                    @endif
                                    <div class="col-sm-6">
                                        <p class="m-b-10 f-w-600">Date ajout</p>
                                        <h6 class="text-muted f-w-400">{{ $user->created_at->diffForHumans() }}</h6>
                                    </div>
                                </div>
                                <h6 class="m-b-20 m-t-40 p-b-5 b-b-default f-w-600">Lien sociaux</h6>
                                <div class="row">
                                    <div class="col-md-6">
                                        <ul class="social-link list-unstyled m-0">
                                            <li><a href="{{ $user->facebook }}" target="_blank"><i class="fa fa-facebook"></i></a></li>
                                            <li><a href="{{ $user->twitter }}" target="_blank"><i class="fa fa-twitter"></i></a></li>
                                            <li><a href="{{ $user->linkedin }}" target="_blank"><i class="fa fa-linkedin"></i></a></li>
                                            <li><a href="{{ $user->github }}" target="_blank"><i class="fa fa-github"></i></a></li>
                                        </ul>
                                    </div>
                                    <div class="col-md-6">
                                        <a href="{{ route('showV', Str::slug($user->username )) }}" class="btn btn-primary mt-3 btn-rounded waves-effect w-md waves-light pull-right">
                                            Accèder à la présentation
                                        </a>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
                @empty
                <div class="p-3">
                    <div class="text-center">
                        <h1>Aucune donnée trouvée</h1>
                    </div>
                </div>
                @endforelse
                <div class="text-center">
                    {!! $users->links() !!}
                </div>
            </div>

            @include('pages.partials.sidebar')
        </div>
    </div>
</div>
