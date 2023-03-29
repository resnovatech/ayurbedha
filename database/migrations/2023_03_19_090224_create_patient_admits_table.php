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
        Schema::create('patient_admits', function (Blueprint $table) {
            $table->id();
            $table->bigInteger('admin_id')->unsigned();
            $table->foreign('admin_id')->references('id')->on('admins');
            $table->string('patient_type');
            $table->string('patient_id');
            $table->unsignedBigInteger('doctor_id');
            // $table->foreign('doctor_id')->references('id')->on('doctors');
            $table->string('name');
            $table->string('age',10);
            $table->string('gender',20);
            $table->text('address');
            $table->string('email_address');
            $table->string('phone_or_mobile_number',11);
            $table->string('nid_number',25);
            $table->string('nationality',100);
            $table->text('type_of_accommodation');
            $table->string('recommended_doctor_name');
            $table->string('start_date');
            $table->string('end_date');
            $table->string('treatment_package_name');
            $table->string('routine');
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
        Schema::dropIfExists('patient_admits');
    }
};
