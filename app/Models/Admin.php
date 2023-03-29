<?php

namespace App\Models;

use Illuminate\Database\Eloquent\Factories\HasFactory;
use Illuminate\Database\Eloquent\Model;
use Illuminate\Contracts\Auth\MustVerifyEmail;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Illuminate\Notifications\Notifiable;
use Illuminate\Support\Facades\DB;
use Spatie\Permission\Traits\HasRoles;
class Admin extends Authenticatable
{
    use HasFactory,Notifiable, HasRoles;

    public $table = "admins";

    protected $fillable = [
        'name', 'email', 'password','staff_id','therapist_id','phone','username','image','status','position'
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

    public function doctors()
    {
        return $this->hasMany('App\Models\Doctor');
    }

    public function walkByPatients()
    {
        return $this->hasMany('App\Models\WalkByPatient');
    }


    public function patients()
    {
        return $this->hasMany('App\Models\Patient');
    }


    public function patientAdmits()
    {
        return $this->hasMany('App\Models\PatientAdmit');
    }


    public function doctorAppointments()
    {
        return $this->hasMany('App\Models\DoctorAppointment');
    }


    public function patientHistories()
    {
        return $this->hasMany('App\Models\PatientHistory');
    }

    public function therapyAppointments()
    {
        return $this->hasMany('App\Models\TherapyAppointment');
    }

    public function staff()
    {
        return $this->hasMany('App\Models\Staff');
    }



    public function therapists()
    {
        return $this->hasMany('App\Models\Therapist');
    }


    public function therapyAppointmentDateAndTimes()
    {
        return $this->hasMany('App\Models\TherapyAppointmentDateAndTime');
    }





    public static function getpermissionGroups()
    {
        $permission_groups = DB::table('permissions')
            ->select('group_name as name')
            ->groupBy('group_name')
            ->get();
        return $permission_groups;
    }

    public static function getpermissionsByGroupName($group_name)
    {
        $permissions = DB::table('permissions')
            ->select('name', 'id')
            ->where('group_name', $group_name)
            ->get();
        return $permissions;
    }

    public static function roleHasPermissions($role, $permissions)
    {
        $hasPermission = true;
        foreach ($permissions as $permission) {
            if (!$role->hasPermissionTo($permission->name)) {
                $hasPermission = false;
                return $hasPermission;
            }
        }
        return $hasPermission;
    }
}
