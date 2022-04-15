<?php

namespace App\Observers;

use App\Models\User;

class UserObserver
{
    /**
     * Listen to the User created event.
     *
     * @param User $user
     */
    public function creating(User $user)
    {
        // If We Didnt Passed Any  Username On user Creation then We Generate One
        if (is_null($user->username)) {
            $user->username = User::generateUsername($user->name);
        }
    }

    /**
     * Listen to the User deleting event.
     *
     * @param User $user
     */
    public function deleting(User $user)
    {
    }
}
