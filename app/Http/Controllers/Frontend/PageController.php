<?php

namespace App\Http\Controllers\Frontend;

use Illuminate\Http\Request;
use Illuminate\Support\Facades\DB;
use App\Http\Controllers\Controller;
use App\Models\{Country, MemberType, Slider, User};
use Illuminate\Support\Facades\Auth;

class PageController extends Controller
{
    public function index()
    {
        $sliders = Slider::all();
        $settings = DB::table('setting')->select('accueil_text')->get();

        return view('pages.welcome', compact('sliders', 'settings'));
    }

    public function presentations(Request $request)
    {
        $title = 'SOLIDARITY WORLD - PRESENTATIONS';
        $filter = 'Tous';

        $usersQueryB = User::with('membership', 'country')->whereNotNull('youtube_link')
            ->orderByRaw("RAND()");

        if ($request->has('country')) {
            $country = Country::find($request->input('country'));
            if (!is_null($country)) {
                $title = 'PAYS - ' . $country->name;
                $usersQueryB->where('country_id', $country->id);
            }
        }
        if ($request->has('member-type')) {
            $memberType = MemberType::findBySlug($request->input('member-type'));
            if (!is_null($memberType)) {
                $title .= ' | ' . $memberType->label;
                $filter = 'Filtre : ' . $memberType->label;

                $usersQueryB->where('membership_type', $memberType->id);
            }
        }

        $users = $usersQueryB->paginate(10);

        return view('pages.presentations', compact('users', 'title', 'filter'));
    }

    public function showVideo(User $user)
    {
        $related = User::whereNotNull('youtube_link')
            ->orderByRaw("RAND()")
            ->where('email', '!=', $user->email)
            ->inRandomOrder()
            ->take(3)
            ->get();

        $payload = explode('=', $user->youtube_link);

        $youtubeLink = isset($payload[1])
            ? $payload[1]
            :  str_replace('https://youtu.be/', '', $user->youtube_link);
        return view('pages.presentation', compact('user', 'related', 'youtubeLink'));
    }

    public function updateProfile()
    {
        $user = Auth::user();

        return view('pages.profile.form', compact('user'));
    }

    public function postUpdateProfile(Request $request)
    {

        $user = auth()->user();

        $user->name = $request->name;
        $user->membership_type = $request->membership_type;
        $user->lastName = $request->lastName;
        $user->firstName = $request->firstName;
        $user->facebook = $request->facebook;
        $user->github = $request->github;
        $user->twitter = $request->twitter;
        $user->linkedin = $request->linkedin;
        $user->email = $request->email;
        $user->country_id = $request->country_id;

        $user->youtube_link = $request->youtube_link;

        if (isset($request->thumbnail)) {
            $user->addMediaFromRequest('thumbnail')->toMediaCollection('thumbnails');
        }

        $user->save();

        return back();
    }
}
