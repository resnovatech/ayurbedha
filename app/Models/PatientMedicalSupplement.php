<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;

class PatientMedicalSupplement extends Model
{
    use HasFactory;


    protected $fillable = [
        'doctor_id','doctor_appointment_id','patient_id','patient_history_id','name',
        'quantity'
    ];



    public function doctor()
    {
        return $this->belongsTo('App\Models\Doctor');
    }

    public function doctor_appointment()
    {
        return $this->belongsTo('App\Models\DoctorAppointment');
    }

    public function patient_history()
    {
        return $this->belongsTo('App\Models\PatientHistory');
    }
}
