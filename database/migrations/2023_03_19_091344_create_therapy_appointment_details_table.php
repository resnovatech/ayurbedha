<?php

use Illuminate\Database\Migrations\Migration;
use Illuminate\Database\Schema\Blueprint;
use Illuminate\Support\Facades\Schema;

return new class extends Migration
{
    /**
     * Run the migrations.
     *
     * @return void
     */
    public function up()
    {
        Schema::create('therapy_appointment_details', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('therapy_appointment_id')->unsigned();
            $table->foreign('therapy_appointment_id')->references('id')->on('therapy_appointments');
            $table->string('therapy_name');
            $table->text('name');
            $table->string('amount');
            $table->timestamps();
        });
    }

    /**
     * Reverse the migrations.
     *
     * @return void
     */
    public function down()
    {
        Schema::dropIfExists('therapy_appointment_details');
    }
};
