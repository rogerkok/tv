<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

class ChangeMembershipTypeToIntOnUsers extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropColumn('membership_type');
        });
        Schema::table('users', function (Blueprint $table) {
            $table->unsignedBigInteger('membership_type')->after('country_id')->nullable()->default(NULL);
            $table->foreign('membership_type')->references('id')->on('member_types');
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::table('users', function (Blueprint $table) {
            $table->dropForeign('users_membership_type_foreign');
            $table->dropIndex('users_membership_type_foreign');
            $table->dropColumn('membership_type');
        });
        Schema::table('users', function (Blueprint $table) {
            $table->string('membership_type');
        });
    }
}
