<?php

namespace App\Models;

use App\Models\Country;
use Illuminate\Support\Str;
use Spatie\MediaLibrary\Models\Media;
use Illuminate\Notifications\Notifiable;
use Spatie\MediaLibrary\HasMedia\HasMedia;
use Spatie\MediaLibrary\HasMedia\HasMediaTrait;

class User extends \TCG\Voyager\Models\User implements HasMedia
{
    use Notifiable, HasMediaTrait;

    /**
     * The attributes that are mass assignable.
     *
     * @var array
     */
    protected $fillable = [
        'name', 'email', 'password', 'youtube_link', 'firstName', 'lastName', 'country_id', 'about', 'membership_type'
    ];

    /**
     * The attributes that should be hidden for arrays.
     *
     * @var array
     */
    protected $hidden = [
        'password', 'remember_token',
    ];

    /**
     * The attributes that should be cast to native types.
     *
     * @var array
     */
    protected $casts = [
        'email_verified_at' => 'datetime',
    ];

    protected $appends = ['fullName'];

    /**
     * Return the sluggable configuration array for this model.
     *
     * @return array
     */
    public function sluggable()
    {
        return [
            'slug' => [
                'source' => 'title'
            ]
        ];
    }

    public function getAvatarAttribute($value)
    {
        $img = $this->getFirstMediaUrl('thumbnails', 'thumb');

        if ($img) {
            return asset($img);
        }
        return asset('img/default.png');
    }

    public function getFullNameAttribute()
    {
        if (!empty($this->firstName)) {
            return $this->firstName . ' ' . $this->lastName;
        }
        return $this->name;
    }

    public function country()
    {
        return $this->belongsTo(Country::class, 'country_id');
    }

    public function membership()
    {
        return $this->belongsTo(MemberType::class, 'membership_type');
    }

    public function registerMediaCollections()
    {
        $this
            ->addMediaCollection('thumbnails')
            ->singleFile();
    }

    public function registerMediaConversions(Media $media = null)
    {
        $this->addMediaConversion('thumb')
            ->width(600)
            ->height(357);
    }


    public static function generateUsername(string $name)
    {
        $username = strtolower(Str::slug($name, '') . mt_rand(0, 100));

        // Ensure username does not exist
        // Generate new one if username already exists
        while (self::whereUsername($username)->count() > 0) {
            $username = self::generateUsername($name);
        }

        return $username;
    }
}
