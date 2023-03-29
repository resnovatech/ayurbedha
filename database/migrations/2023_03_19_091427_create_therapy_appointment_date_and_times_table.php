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
        Schema::create('therapy_appointment_date_and_times', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('therapy_appointment_id')->unsigned();
            //$table->foreign('therapy_appointment_id')->references('id')->on('therapy_appointments');
            $table->string('therapist');
            $table->string('therapy');
            $table->string('date');
            $table->string('start_time');
            $table->string('end_time');
            $table->string('serial');
            $table->string('status');
            $table->string('patient_id');
            $table->string('admin_id');
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
        Schema::dropIfExists('therapy_appointment_date_and_times');
    }
};
