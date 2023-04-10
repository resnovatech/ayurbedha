<?php

use Illuminate\Support\Facades\Route;
use App\Http\Controllers\Backend\DashboardController;
use App\Http\Controllers\Backend\RolesController;
use App\Http\Controllers\Backend\UsersController;
use App\Http\Controllers\Backend\PermissionController;
use App\Http\Controllers\Backend\AdminsController;
use App\Http\Controllers\Backend\ProfileController;
use App\Http\Controllers\Backend\SystemInformationController;
use App\Http\Controllers\Backend\Auth\LoginController;
use App\Http\Controllers\Admin\SessionController;
use App\Http\Controllers\Admin\ForgetPasswordController;
use App\Http\Controllers\WalkByPatientController;
use App\Http\Controllers\PatientController;
use App\Http\Controllers\DoctorController;
use App\Http\Controllers\PatientAdmitController;
use App\Http\Controllers\DietChartController;
use App\Http\Controllers\MedicineController;
use App\Http\Controllers\HealthSupplementController;
use App\Http\Controllers\TherapyListController;
use App\Http\Controllers\TherapyIngredientController;
use App\Http\Controllers\StaffController;
use App\Http\Controllers\RewardController;
use App\Http\Controllers\TherapistController;
use App\Http\Controllers\DoctorAppointmentController;
use App\Http\Controllers\TherapyAppointmentController;
use App\Http\Controllers\DoctorWaitingListController;
use App\Http\Controllers\PatientPrecriptionController;
use App\Http\Controllers\WalkByPatientTherapyController;
use App\Http\Controllers\BillingController;
use App\Http\Controllers\RevisedBillingController;
/*
|--------------------------------------------------------------------------
| Web Routes
|--------------------------------------------------------------------------
|
| Here is where you can register web routes for your application. These
| routes are loaded by the RouteServiceProvider within a group which
| contains the "web" middleware group. Now create something great!
|
*/


Route::get('/', function () {
    return view('backend.auth.login');
});

Route::get('/clear', function() {
    \Illuminate\Support\Facades\Artisan::call('cache:clear');
    \Illuminate\Support\Facades\Artisan::call('config:clear');
    \Illuminate\Support\Facades\Artisan::call('config:cache');
    \Illuminate\Support\Facades\Artisan::call('view:clear');
    \Illuminate\Support\Facades\Artisan::call('route:clear');
    return redirect()->back();
});

Auth::routes();

Route::get('/home', [App\Http\Controllers\HomeController::class, 'index'])->name('home');

Route::group(['prefix' => 'admin'], function () {
    Route::get('/', [DashboardController::class, 'index'])->name('admin.dashboard');

    //waiting_list_controller

    Route::controller(DoctorWaitingListController::class)->group(function () {

        Route::get('/doctorWaitingList', 'doctorWaitingList')->name('DoctorWaitingList');
        Route::get('/addPatientHistory/{id}', 'addPatientHistory')->name('addPatientHistory');
        Route::get('/addPatientPrescriptionInfo/{id}', 'addPatientPrescriptionInfo')->name('addPatientPrescriptionInfo');
        Route::post('/postPatientHistory', 'postPatientHistory')->name('postPatientHistory');
        Route::post('/postPatientPrescriptionInfo', 'postPatientPrescriptionInfo')->name('postPatientPrescriptionInfo');
    });
    //end_waiting_list_controller



       //revisedBilling_controller
       Route::resource('revisedBillings', RevisedBillingController::class);
       //revisedBilling_controller


        //billing_controller
        Route::resource('billings', BillingController::class);

        Route::controller(BillingController::class)->group(function () {
             Route::get('/medicineList/{id}', 'medicineList')->name('medicineList');
             Route::get('/therapyListFromHistory/{id}', 'therapyListFromHistory')->name('therapyListFromHistory');
             
             
            Route::post('/paymentMoney', 'paymentMoney')->name('paymentMoney');
            Route::get('/printInvoice/{id}', 'printInvoice')->name('printInvoice');
            Route::get('/moveToReversed/{id}', 'moveToReversed')->name('moveToReversed');
        });
        //billing_controller

         //walkByPatientTherapyController
         Route::resource('walkByPatientTherapy', WalkByPatientTherapyController::class);

         Route::controller(WalkByPatientTherapyController::class)->group(function () {

            Route::get('/walkByPatientTherapyMain', 'walkByPatientTherapyMain')->name('walkByPatientTherapyMain');
        });


         //WalkByPatientTherapyController


     //PatientPrecription_list_controller
     Route::resource('patientPrecriptions', PatientPrecriptionController::class);
    //PatientPrecription_list_controller





    //walk_by_patient_route
      Route::resource('walkByPatients', WalkByPatientController::class);

      Route::controller(WalkByPatientController::class)->group(function () {

        Route::get('/transferToPatientList/{id}', 'transferToPatientList')->name('transferToPatientList');
    });
    //end_walk_by_patient_route

    //patient_route
     Route::resource('patients', PatientController::class);

     Route::controller(PatientController::class)->group(function () {

        Route::post('/patientFileUpdate', 'patientFileUpdate')->name('patientFileUpdate');

        Route::delete('patientFileDelete/{id}','patientFileDelete')->name('patientFileDelete');
    });
    //patient_route


    //patient_admit_route
    Route::resource('patientAdmits', PatientAdmitController::class);


    //patient_admit_route

    //doctor_apoinment_controller
    Route::resource('doctorAppointments', DoctorAppointmentController::class);
    //doctor_apointment_controller


    //therapy_apoinment_controller
    Route::resource('therapyAppointments', TherapyAppointmentController::class);

    Route::controller(TherapyAppointmentController::class)->group(function () {
        Route::get('/getTherapyAppointmentDetail', 'getTherapyAppointmentDetail')->name('getTherapyAppointmentDetail');
        Route::get('/getTherapyListDetail', 'getTherapyListDetail')->name('getTherapyListDetail');

    });

    //therapy_apoinment_controller


    //doctor_route
    Route::controller(DoctorController::class)->group(function () {
        Route::get('/doctorCreate', 'create')->name('doctorCreate');
        Route::get('/doctorList', 'index')->name('doctorList');
        Route::post('/doctorStore', 'store')->name('doctorStore');
        Route::post('/doctorUpdate', 'update')->name('doctorUpdate');
        Route::get('/doctorEdit/{id}', 'edit')->name('doctorEdit');
        Route::get('/doctorView/{id}', 'view')->name('doctorView');
        Route::delete('doctorDelete/{id}','delete')->name('doctorDelete');
    });

    //doctor_route

    //Prescription Equipment  Route

    Route::resource('dietCharts', DietChartController::class);
    Route::resource('medicineLists', MedicineController::class);
    Route::resource('healthSupplements', HealthSupplementController::class);
    Route::resource('therapyLists', TherapyListController::class);
    Route::resource('therapyIngredients', TherapyIngredientController::class);

// Prescription Equipment  Route


//staff route add
Route::resource('staff',StaffController::class);
//end staff route


//reward route start
Route::resource('reward',RewardController::class);
//end reward route

//therapist route
Route::resource('therapist',TherapistController::class);
//end therapist route



    Route::get('systemInformation', [SystemInformationController::class, 'index'])->name('admin.system_information');
    Route::post('systemInformation/store', [SystemInformationController::class, 'store'])->name('admin.system_information.store');
    Route::post('systemInformation/update', [SystemInformationController::class, 'update'])->name('admin.system_information.update');
    Route::post('systemInformation/delete/{id}', [SystemInformationController::class, 'delete'])->name('admin.system_information.delete');

    Route::get('roles', [RolesController::class, 'index'])->name('admin.roles');
    Route::get('roles/create', [RolesController::class, 'create'])->name('admin.roles.create');
    Route::post('roles/store', [RolesController::class, 'store'])->name('admin.roles.store');
    Route::get('roles/edit/{id}', [RolesController::class, 'edit'])->name('admin.roles.edit');
    Route::post('roles/update', [RolesController::class, 'update'])->name('admin.roles.update');

    Route::delete('roles/delete/{id}', [RolesController::class, 'delete'])->name('admin.roles.delete');


    Route::get('users', [UsersController::class, 'index'])->name('admin.users');
    Route::get('users/create', [UsersController::class, 'create'])->name('admin.users.create');
    Route::post('users/store', [UsersController::class, 'store'])->name('admin.users.store');
    Route::get('users/edit/{id}', [UsersController::class, 'edit'])->name('admin.users.edit');
    Route::post('users/update/{id}', [UsersController::class, 'update'])->name('admin.users.update');
    Route::delete('users/delete/{id}', [UsersController::class, 'delete'])->name('admin.users.delete');


    Route::get('permission', [PermissionController::class, 'index'])->name('admin.permission');
    Route::get('permission/create', [PermissionController::class, 'create'])->name('admin.permission.create');
    Route::post('permission/store', [PermissionController::class, 'store'])->name('admin.permission.store');
    Route::get('permission/edit/{id}', [PermissionController::class, 'edit'])->name('admin.permission.edit');
    Route::get('permission/view/{gname}', [PermissionController::class, 'view'])->name('admin.permission.view');
    Route::post('permission/update', [PermissionController::class, 'update'])->name('admin.permission.update');

    Route::delete('permission/delete/{id}', [PermissionController::class, 'delete'])->name('admin.permission.delete');




    Route::get('admins', [AdminsController::class, 'index'])->name('admin.admins');
    Route::get('admins/create', [AdminsController::class, 'create'])->name('admin.admins.create');
    Route::post('admins/store', [AdminsController::class, 'store'])->name('admin.admins.store');
    Route::get('admins/edit/{id}', [AdminsController::class, 'edit'])->name('admin.admins.edit');
    Route::post('admins/update', [AdminsController::class, 'update'])->name('admin.admins.update');
    Route::delete('admins/delete/{id}', [AdminsController::class, 'delete'])->name('admin.admins.delete');


    Route::get('profile', [ProfileController::class, 'index'])->name('admin.profile');
    Route::get('profile/edit/{id}', [ProfileController::class, 'edit'])->name('admin.profile.edit');
    Route::put('profile/update/{id}', [ProfileController::class, 'update'])->name('admin.profile.update');

    Route::post('password/update',[ProfileController::class, 'updatePassword'])->name('admin.password.update');



    Route::get('settings',[ProfileController::class, 'setting'])->name('admin.settings');
    Route::get('view_profile',[ProfileController::class, 'profile_view'])->name('admin.profile_view');







    // Login Routes
    Route::get('/login',[LoginController::class,'showLoginForm'])->name('admin.login');
    Route::post('/login/submit',[LoginController::class,'login'])->name('admin.login.submit');

    // Logout Routes
    Route::post('/logout/submit',[LoginController::class,'logout'])->name('admin.logout.submit');

    Route::get('/recovery_password',[SessionController::class,'recovery_password'])->name('admin.recovery_password');

    Route::get('/logout_session',[SessionController::class,'logout_session'])->name('admin.logout_session');
    Route::get('/lock_screen/{email}',[SessionController::class,'lock_screen'])->name('admin.lock_screen');
    Route::post('/login_from_session',[SessionController::class,'login_from_session'])->name('admin.login_from_session');
    // Forget Password Routes

    Route::get('/check_mail_from_list',[ForgetPasswordController::class,'check_mail_from_list'])->name('check_mail_from_list');
    Route::post('/send_mail_get_from_list',[ForgetPasswordController::class,'send_mail_get_from_list'])->name('send_mail_get_from_list');
    Route::get('/password_reset_page/{id}',[ForgetPasswordController::class,'password_reset_page'])->name('password_reset_page');
    Route::get('/successfully_mail_send/{id}',[ForgetPasswordController::class,'successfully_mail_send'])->name('successfully_mail_send');

    Route::post('/password_change_confirmed',[ForgetPasswordController::class,'password_change_confirmed'])->name('password_change_confirmed');

    Route::get('/password/reset',[ForgetPasswordController::class,'showLinkRequestForm'])->name('admin.password.request');

});
