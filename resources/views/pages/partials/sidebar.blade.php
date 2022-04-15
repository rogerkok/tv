<div class="col-md-4">
    <div class="sidebar">

        <div class="widget">
            <h4>Dernières présentations</h4>

            @foreach (\App\Models\User::whereNotNull('youtube_link')
                    ->latest()
                    ->limit(5)
                    ->get() as $latest)

                <div class="card user-card">
                    <div class="img-avatar" style="background-image: none;height: 72px;">
                        <img class="img-radius" style="height: 60px;width: 60px;" src="{{ $latest->avatar  }}" alt="{{ $latest->fullName }}" />
                    </div>
                    <div class="card-text">
                        <div class="portada"></div>
                        <div class="title-total">
                            @if ($latest->country)

                            <div class="title">
                                <a class="color-blue" href="{{ route('presentations', ['country' => $latest->country]) }}">
                                    {{ $latest->country->name }}
                                </a>
                            </div>
                            @endif
                            <h2>
                                <a class="color-blue" href="{{ route('showV', Str::slug($latest->username )) }}">
                                    {{ $latest->fullName }}
                                </a>
                            </h2>
                            <hr/>
                            <div class="desc">
                                {{ $latest->membership ? $latest->membership->label : '' }}
                            </div>
                            <div class="actions">
                                <a href="{{ $latest->facebook }}" target="_blank"><i class="fa fa-facebook"></i></a>
                                <a href="{{ $latest->twitter }}" target="_blank"><i class="fa fa-twitter"></i></a>
                                <a href="{{ $latest->linkedin }}" target="_blank"><i class="fa fa-linkedin"></i></a>
                            </div>
                        </div>
                    </div>
                </div>


            @endforeach
        </div>
    </div>
</div>
