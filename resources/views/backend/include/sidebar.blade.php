 @php
     $usr = Auth::guard('admin')->user();
 @endphp


@include('backend.include.header');

<!-- removeNotificationModal -->
<div id="removeNotificationModal">
</div><!-- /.modal -->
<!-- ========== App Menu ========== -->
<div class="app-menu navbar-menu">
    <!-- LOGO -->
    <div class="navbar-brand-box">
        <!-- Dark Logo-->
        <a href="{{ route('admin.dashboard') }}" class="logo logo-dark">
                    <span class="logo-sm">
                        <img src="{{ asset('/') }}{{ $logo }}" alt="" height="22">
                    </span>
            <span class="logo-lg">
                        <img src="{{ asset('/') }}{{ $logo }}" alt="" height="17">
                    </span>
        </a>
        <!-- Light Logo-->
        <a href="{{ route('admin.dashboard') }}" class="logo logo-light">
                    <span class="logo-sm">
                        <img src="{{ asset('/') }}{{ $logo }}" alt="" height="22">
                    </span>
            <span class="logo-lg">
                        <img src="{{ asset('/') }}{{ $logo }}" alt="" height="17">
                    </span>
        </a>
        <button type="button" class="btn btn-sm p-0 fs-20 header-item float-end btn-vertical-sm-hover"
                id="vertical-hover">
            <i class="ri-record-circle-line"></i>
        </button>
    </div>

    <div id="scrollbar">
        <div class="container-fluid">

            <div id="two-column-menu">
            </div>
            <ul class="navbar-nav" id="navbar-nav">
                <li class="menu-title"><span data-key="t-menu">Dashboard</span></li>
                <li class="nav-item">
                    <a class="nav-link menu-link  {{ Route::is('admin.dashboard') ? 'active' : '' }}" href="{{ route('admin.dashboard') }}">
                        <i class="ri-dashboard-2-line"></i> <span data-key="t-widgets">Dashboard</span>
                    </a>
                </li>

                <li class="menu-title"><span data-key="t-menu">Reception</span></li>

                @if (Route::is('patientAdmits.edit') || Route::is('patientAdmits.create') || Route::is('patientAdmits.index') || Route::is('walkByPatients.edit') || Route::is('walkByPatients.create') || Route::is('walkByPatients.index') || Route::is('patients.edit') || Route::is('patients.create') || Route::is('patients.index')  )
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#patient" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarLanding">
                        <i class="ri-apps-2-line"></i> <span data-key="t-landing">Patient</span>
                    </a>
                    <div class="collapse menu-dropdown show" id="patient">
                        <ul class="nav nav-sm flex-column">
                            @if ( $usr->can('WalkByPatientAdd')  || $usr->can('WalkByPatientView') ||  $usr->can('WalkByPatientDelete') ||  $usr->can('WalkByPatientUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('walkByPatients.index') }}" class="nav-link {{ Route::is('walkByPatients.edit') || Route::is('walkByPatients.create') || Route::is('walkByPatients.index')  ? 'active' : '' }}" data-key="t-one-page">Walk By Patient</a>
                            </li>
                            @endif
                            @if ( $usr->can('PatientAdd')  || $usr->can('PatientView') ||  $usr->can('PatientDelete') ||  $usr->can('PatientUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('patients.index') }}" class="nav-link {{ Route::is('patients.edit') || Route::is('patients.create') || Route::is('patients.index')  ? 'active' : '' }}" data-key="t-nft-landing"> Patient </a>
                            </li>
                            @endif
                            @if ( $usr->can('PatientAdmitAdd')  || $usr->can('PatientAdmitView') ||  $usr->can('PatientAdmitDelete') ||  $usr->can('PatientAdmitUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('patientAdmits.index') }}" class="nav-link {{ Route::is('patientAdmits.edit') || Route::is('patientAdmits.create') || Route::is('patientAdmits.index')  ? 'active' : '' }}" data-key="t-nft-landing">Patient Admit</a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </li>

                @else
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#patient" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarLanding">
                        <i class="ri-apps-2-line"></i> <span data-key="t-landing">Patient</span>
                    </a>
                    <div class="collapse menu-dropdown" id="patient">
                        <ul class="nav nav-sm flex-column">
                            @if ( $usr->can('WalkByPatientAdd')  || $usr->can('WalkByPatientView') ||  $usr->can('WalkByPatientDelete') ||  $usr->can('WalkByPatientUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('walkByPatients.index') }}" class="nav-link {{ Route::is('walkByPatients.edit') || Route::is('walkByPatients.create') || Route::is('walkByPatients.index')  ? 'active' : '' }}" data-key="t-one-page">Walk By Patient</a>
                            </li>
                            @endif
                            @if ( $usr->can('PatientAdd')  || $usr->can('PatientView') ||  $usr->can('PatientDelete') ||  $usr->can('PatientUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('patients.index') }}" class="nav-link {{ Route::is('patients.edit') || Route::is('patients.create') || Route::is('patients.index')  ? 'active' : '' }}" data-key="t-nft-landing"> Patient </a>
                            </li>
                            @endif
                            @if ( $usr->can('PatientAdmitAdd')  || $usr->can('PatientAdmitView') ||  $usr->can('PatientAdmitDelete') ||  $usr->can('PatientAdmitUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('patientAdmits.index') }}" class="nav-link {{ Route::is('patientAdmits.edit') || Route::is('patientAdmits.create') || Route::is('patientAdmits.index')  ? 'active' : '' }}" data-key="t-nft-landing">Patient Admit</a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </li>
@endif
@if ($usr->can('doctorAppointmentAdd') || $usr->can('doctorAppointmentView') ||  $usr->can('doctorAppointmentDelete') ||  $usr->can('doctorAppointmentUpdate'))
@if (Route::is('doctorAppointments.index') ||  Route::is('doctorAppointments.create') || Route::is('doctorAppointments.edit') || Route::is('doctorAppointments.show'))

                <li class="nav-item">
                    <a class="nav-link menu-link" href="#doctorAppointment" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarLanding">
                        <i class="ri-baidu-fill"></i> <span data-key="t-landing">Doctor Appointment</span>
                    </a>
                    <div class="collapse menu-dropdown show" id="doctorAppointment">
                        <ul class="nav nav-sm flex-column">
                            @if ($usr->can('doctorAppointmentAdd'))
                            <li class="nav-item">
                                <a href="{{ route('doctorAppointments.create') }}" class="nav-link {{ Route::is('doctorAppointments.create')  ? 'active' : '' }}" data-key="t-one-page">Add New Doctor Appointment</a>
                            </li>
                            @endif
                            @if ($usr->can('doctorAppointmentView') ||  $usr->can('doctorAppointmentDelete') ||  $usr->can('doctorAppointmentUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('doctorAppointments.index') }}" class="nav-link {{ Route::is('doctorAppointments.index') || Route::is('doctorAppointments.edit') || Route::is('doctorAppointments.show') ? 'active' : '' }}" data-key="t-nft-landing"> Appointment List </a>
                            </li>
                            @endif
                        </ul>

                    </div>
                </li>
                @else
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#doctorAppointment" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarLanding">
                        <i class="ri-baidu-fill"></i> <span data-key="t-landing">Doctor Appointment</span>
                    </a>
                    <div class="collapse menu-dropdown" id="doctorAppointment">
                        <ul class="nav nav-sm flex-column">
                            @if ($usr->can('doctorAppointmentAdd'))
                            <li class="nav-item">
                                <a href="{{ route('doctorAppointments.create') }}" class="nav-link {{ Route::is('doctorAppointments.create')  ? 'active' : '' }}" data-key="t-one-page">Add New Doctor Appointment</a>
                            </li>
                            @endif
                            @if ($usr->can('doctorAppointmentView') ||  $usr->can('doctorAppointmentDelete') ||  $usr->can('doctorAppointmentUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('doctorAppointments.index') }}" class="nav-link {{ Route::is('doctorAppointments.index') || Route::is('doctorAppointments.edit') || Route::is('doctorAppointments.show') ? 'active' : '' }}" data-key="t-nft-landing"> Appointment List </a>
                            </li>
                            @endif
                        </ul>

                    </div>
                </li>

                @endif
                @endif
                @if ($usr->can('walkByPatientTherapyAdd') || $usr->can('walkByPatientTherapyView') ||  $usr->can('walkByPatientTherapyDelete') ||  $usr->can('walkByPatientTherapyUpdate'))
                @if (Route::is('walkByPatientTherapy.index') ||  Route::is('walkByPatientTherapy.create') || Route::is('walkByPatientTherapy.edit') || Route::is('walkByPatientTherapy.show'))
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#therapyAppointment23" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarLanding">
                        <i class="bx bx-receipt"></i> <span data-key="t-landing">Single Therapy Appointment</span>
                    </a>
                    <div class="collapse menu-dropdown show" id="therapyAppointment23">
                        <ul class="nav nav-sm flex-column">
                            @if ($usr->can('walkByPatientTherapyAdd'))
                            <li class="nav-item">
                                <a href="{{ route('walkByPatientTherapy.create') }}" class="nav-link {{ Route::is('walkByPatientTherapy.create')  ? 'active' : '' }}" data-key="t-one-page">Add New Therapy Appointment</a>
                            </li>
                            @endif
                            @if ($usr->can('walkByPatientTherapyView') ||  $usr->can('walkByPatientTherapyDelete') ||  $usr->can('walkByPatientTherapyUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('walkByPatientTherapy.index') }}" class="nav-link {{ Route::is('walkByPatientTherapy.index') || Route::is('walkByPatientTherapy.edit') || Route::is('walkByPatientTherapy.show') ? 'active' : '' }}" data-key="t-nft-landing"> Therapy Appointment List </a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </li>
                @else
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#therapyAppointment23" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarLanding">
                        <i class="bx bx-receipt"></i> <span data-key="t-landing">Single Therapy Appointment</span>
                    </a>
                    <div class="collapse menu-dropdown" id="therapyAppointment23">
                        <ul class="nav nav-sm flex-column">
                            @if ($usr->can('walkByPatientTherapyAdd'))
                            <li class="nav-item">
                                <a href="{{ route('walkByPatientTherapy.create') }}" class="nav-link {{ Route::is('walkByPatientTherapy.create')  ? 'active' : '' }}" data-key="t-one-page">Add New Therapy Appointment</a>
                            </li>
                            @endif
                            @if ($usr->can('walkByPatientTherapyView') ||  $usr->can('walkByPatientTherapyDelete') ||  $usr->can('walkByPatientTherapyUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('walkByPatientTherapy.index') }}" class="nav-link {{ Route::is('walkByPatientTherapy.index') || Route::is('walkByPatientTherapy.edit') || Route::is('walkByPatientTherapy.show') ? 'active' : '' }}" data-key="t-nft-landing"> Therapy Appointment List </a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </li>

                @endif
                @endif
                @if ($usr->can('therapyAppointmentAdd') || $usr->can('therapyAppointmentView') ||  $usr->can('therapyAppointmentDelete') ||  $usr->can('therapyAppointmentUpdate'))
                @if (Route::is('therapyAppointments.index') ||  Route::is('therapyAppointments.create') || Route::is('therapyAppointments.edit') || Route::is('therapyAppointments.show'))
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#therapyAppointment" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarLanding">
                        <i class="bx bx-receipt"></i> <span data-key="t-landing">Therapy Appointment</span>
                    </a>
                    <div class="collapse menu-dropdown show" id="therapyAppointment">
                        <ul class="nav nav-sm flex-column">
                            @if ($usr->can('therapyAppointmentAdd'))
                            <li class="nav-item">
                                <a href="{{ route('therapyAppointments.create') }}" class="nav-link {{ Route::is('therapyAppointments.create')  ? 'active' : '' }}" data-key="t-one-page">Add New Therapy Appointment</a>
                            </li>
                            @endif
                            @if ($usr->can('therapyAppointmentView') ||  $usr->can('therapyAppointmentDelete') ||  $usr->can('therapyAppointmentUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('therapyAppointments.index') }}" class="nav-link {{ Route::is('therapyAppointments.index') || Route::is('therapyAppointments.edit') || Route::is('therapyAppointments.show') ? 'active' : '' }}" data-key="t-nft-landing"> Therapy Appointment List </a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </li>
                @else
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#therapyAppointment" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarLanding">
                        <i class="bx bx-receipt"></i> <span data-key="t-landing">Therapy Appointment</span>
                    </a>
                    <div class="collapse menu-dropdown" id="therapyAppointment">
                        <ul class="nav nav-sm flex-column">
                            @if ($usr->can('therapyAppointmentAdd'))
                            <li class="nav-item">
                                <a href="{{ route('therapyAppointments.create') }}" class="nav-link {{ Route::is('therapyAppointments.create')  ? 'active' : '' }}" data-key="t-one-page">Add New Therapy Appointment</a>
                            </li>
                            @endif
                            @if ($usr->can('therapyAppointmentView') ||  $usr->can('therapyAppointmentDelete') ||  $usr->can('therapyAppointmentUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('therapyAppointments.index') }}" class="nav-link {{ Route::is('therapyAppointments.index') || Route::is('therapyAppointments.edit') || Route::is('therapyAppointments.show') ? 'active' : '' }}" data-key="t-nft-landing"> Therapy Appointment List </a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </li>

                @endif
                @endif

                @if ($usr->can('BillingAdd') || $usr->can('BillingView') ||  $usr->can('BillingDelete') ||  $usr->can('BillingUpdate') || $usr->can('revisedBillingAdd') || $usr->can('revisedBillingView') ||  $usr->can('revisedBillingDelete') ||  $usr->can('revisedBillingUpdate'))
                @if (Route::is('billings.index') ||  Route::is('billings.create') || Route::is('billings.edit') || Route::is('billings.show') ||  Route::is('revisedBillings.index') ||  Route::is('revisedBillings.create') || Route::is('revisedBillings.edit') || Route::is('revisedBillings.show'))
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#sidebarTables" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarTables">
                        <i class="ri-layout-grid-line"></i> <span data-key="t-tables">Billing</span>
                    </a>
                    <div class="collapse menu-dropdown show" id="sidebarTables">
                        <ul class="nav nav-sm flex-column">
                            @if ($usr->can('BillingAdd') ||  $usr->can('BillingView') ||  $usr->can('BillingDelete') ||  $usr->can('BillingUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('billings.index') }}" class="nav-link {{ Route::is('billings.index') || Route::is('billings.create') || Route::is('billings.edit') || Route::is('billings.show') ? 'active' : '' }}" data-key="t-basic-tables">Billing List</a>
                            </li>
                            @endif
                            @if ($usr->can('revisedBillingAdd') ||  $usr->can('revisedBillingView') ||  $usr->can('revisedBillingDelete') ||  $usr->can('revisedBillingUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('revisedBilling.index') }}" class="nav-link {{ Route::is('revisedBillings.index') || Route::is('revisedBillings.index') || Route::is('revisedBillings.edit') || Route::is('revisedBillings.show') ? 'active' : '' }}" data-key="t-grid-js">Revised Bill Quotation</a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </li>
                @else
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#sidebarTables" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarTables">
                        <i class="ri-layout-grid-line"></i> <span data-key="t-tables">Billing</span>
                    </a>
                    <div class="collapse menu-dropdown" id="sidebarTables">
                        <ul class="nav nav-sm flex-column">
                            @if ($usr->can('BillingAdd') ||  $usr->can('BillingView') ||  $usr->can('BillingDelete') ||  $usr->can('BillingUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('billings.index') }}" class="nav-link {{ Route::is('billings.index') || Route::is('billings.create') || Route::is('billings.edit') || Route::is('billings.show') ? 'active' : '' }}" data-key="t-basic-tables">Billing List</a>
                            </li>
                            @endif
                            @if ($usr->can('revisedBillingAdd') ||  $usr->can('revisedBillingView') ||  $usr->can('revisedBillingDelete') ||  $usr->can('revisedBillingUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('revisedBillings.index') }}" class="nav-link {{ Route::is('revisedBillings.index') || Route::is('revisedBillings.index') || Route::is('revisedBillings.edit') || Route::is('revisedBillings.show') ? 'active' : '' }}" data-key="t-grid-js">Revised Bill Quotation</a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </li>
                @endif
                @endif

                <li class="menu-title"><span data-key="t-menu">Doctor Section</span></li>

                @if (Route::is('patientPrecriptions.index') ||  Route::is('addPatientPrescriptionInfo') || Route::is('addPatientHistory') || Route::is('DoctorWaitingList') || Route::is('patientPrecriptions.show'))
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#doctorWaiting" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarTables">
                        <i class="ri-hail-line"></i> <span data-key="t-tables">Doctor Attend</span>
                    </a>
                    <div class="collapse menu-dropdown show" id="doctorWaiting">
                        <ul class="nav nav-sm flex-column">

                            @if ($usr->can('doctorWaitingListAdd') ||  $usr->can('doctorWaitingListView') ||  $usr->can('doctorWaitingListDelete') ||  $usr->can('doctorWaitingListUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('DoctorWaitingList') }}" class="nav-link {{ Route::is('addPatientPrescriptionInfo') || Route::is('DoctorWaitingList') || Route::is('addPatientHistory') ? 'active' : '' }}" data-key="t-basic-tables">Doctor Waiting List</a>
                            </li>
@endif

@if ($usr->can('patientPrescriptionListAdd') ||  $usr->can('patientPrescriptionListView') ||  $usr->can('patientPrescriptionListDelete') ||  $usr->can('patientPrescriptionListUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('patientPrecriptions.index') }}" class="nav-link {{ Route::is('patientPrecriptions.index') || Route::is('patientPrecriptions.show') ? 'active' : '' }}" data-key="t-grid-js">Patient Prescription List</a>
                            </li>
@endif


                        </ul>
                    </div>
                </li>
                @else
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#doctorWaiting" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarTables">
                        <i class="ri-hail-line"></i> <span data-key="t-tables">Doctor Attend</span>
                    </a>
                    <div class="collapse menu-dropdown" id="doctorWaiting">
                        <ul class="nav nav-sm flex-column">

                            @if ($usr->can('doctorWaitingListAdd') ||  $usr->can('doctorWaitingListView') ||  $usr->can('doctorWaitingListDelete') ||  $usr->can('doctorWaitingListUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('DoctorWaitingList') }}" class="nav-link {{ Route::is('addPatientPrescriptionInfo') || Route::is('DoctorWaitingList') || Route::is('addPatientHistory') ? 'active' : '' }}" data-key="t-basic-tables">Doctor Waiting List</a>
                            </li>
@endif

@if ($usr->can('patientPrescriptionListAdd') ||  $usr->can('patientPrescriptionListView') ||  $usr->can('patientPrescriptionListDelete') ||  $usr->can('patientPrescriptionListUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('patientPrecriptions.index') }}" class="nav-link {{ Route::is('patientPrecriptions.index') || Route::is('patientPrecriptions.show') ? 'active' : '' }}" data-key="t-grid-js">Patient Prescription List</a>
                            </li>
@endif


                        </ul>
                    </div>
                </li>

                @endif

                @if ($usr->can('doctorAdd') || $usr->can('doctorView') ||  $usr->can('doctorDelete') ||  $usr->can('doctorUpdate'))
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#doctorList" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarTables">
                        <i class="ri-hail-line"></i> <span data-key="t-tables">Doctor List</span>
                    </a>
                    <div class="collapse menu-dropdown" id="doctorList">
                        <ul class="nav nav-sm flex-column">
                            @if ($usr->can('doctorAdd'))
                            <li class="nav-item">
                                <a href="{{ route('doctorCreate') }}" class="nav-link {{ Route::is('doctorCreate')  ? 'active' : '' }}" data-key="t-basic-tables">Add New Doctor</a>
                            </li>
                            @endif
                            @if ( $usr->can('doctorView') ||  $usr->can('doctorDelete') ||  $usr->can('doctorUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('doctorList') }}" class="nav-link {{ Route::is('doctorCreate') || Route::is('doctorEdit') ? 'active' : '' }}" data-key="t-grid-js">Doctor List</a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </li>
                @endif


                @if (Route::is('dietCharts.index') ||  Route::is('medicineLists.index') || Route::is('healthSupplements.index') || Route::is('therapyIngredients.index') || Route::is('therapyLists.index'))


                <li class="nav-item">
                    <a class="nav-link menu-link" href="#prescriptionList" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarTables">
                        <i class="ri-landscape-line"></i> <span data-key="t-tables">Prescription Equipment </span>
                    </a>
                    <div class="collapse menu-dropdown show" id="prescriptionList">
                        <ul class="nav nav-sm flex-column">
                            @if ( $usr->can('dietChartsAdd')  || $usr->can('dietChartsView') ||  $usr->can('dietChartsDelete') ||  $usr->can('dietChartsUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('dietCharts.index') }}" class="nav-link {{ Route::is('dietCharts.index') ? 'active' : '' }}" data-key="t-basic-tables">Diet Chart</a>
                            </li>
                            @endif
                            @if ( $usr->can('medicineListsAdd')  || $usr->can('medicineListsView') ||  $usr->can('medicineListsDelete') ||  $usr->can('medicineListsUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('medicineLists.index') }}" class="nav-link {{ Route::is('medicineLists.index') ? 'active' : '' }}" data-key="t-grid-js">Medicine List</a>
                            </li>
                            @endif
                            @if ( $usr->can('healthSupplementsAdd')  || $usr->can('healthSupplementsView') ||  $usr->can('healthSupplementsDelete') ||  $usr->can('healthSupplementsUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('healthSupplements.index') }}" class="nav-link {{ Route::is('healthSupplements.index') ? 'active' : '' }}" data-key="t-grid-js">Health Supplement</a>
                            </li>
                            @endif

                            @if ( $usr->can('therapyIngredientsAdd')  || $usr->can('therapyIngredientsView') ||  $usr->can('therapyIngredientsDelete') ||  $usr->can('therapyIngredientsUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('therapyIngredients.index') }}" class="nav-link {{ Route::is('therapyIngredients.index') ? 'active' : '' }}" data-key="t-grid-js">Therapy Ingredient</a>
                            </li>
                            @endif

                            @if ( $usr->can('therapyListsAdd')  || $usr->can('therapyListsView') ||  $usr->can('therapyListsDelete') ||  $usr->can('therapyListsUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('therapyLists.index') }}" class="nav-link {{ Route::is('therapyLists.index') ? 'active' : '' }}" data-key="t-grid-js">Therapy List</a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </li>
                @else



                <li class="nav-item">
                    <a class="nav-link menu-link" href="#prescriptionList" data-bs-toggle="collapse" role="button"
                       aria-expanded="false" aria-controls="sidebarTables">
                        <i class="ri-landscape-line"></i> <span data-key="t-tables">Prescription Equipment </span>
                    </a>
                    <div class="collapse menu-dropdown" id="prescriptionList">
                        <ul class="nav nav-sm flex-column">
                            @if ( $usr->can('dietChartsAdd')  || $usr->can('dietChartsView') ||  $usr->can('dietChartsDelete') ||  $usr->can('dietChartsUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('dietCharts.index') }}" class="nav-link {{ Route::is('dietCharts.index') ? 'active' : '' }}" data-key="t-basic-tables">Diet Chart</a>
                            </li>
                            @endif
                            @if ( $usr->can('medicineListsAdd')  || $usr->can('medicineListsView') ||  $usr->can('medicineListsDelete') ||  $usr->can('medicineListsUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('medicineLists.index') }}" class="nav-link {{ Route::is('medicineLists.index') ? 'active' : '' }}" data-key="t-grid-js">Medicine List</a>
                            </li>
                            @endif
                            @if ( $usr->can('healthSupplementsAdd')  || $usr->can('healthSupplementsView') ||  $usr->can('healthSupplementsDelete') ||  $usr->can('healthSupplementsUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('healthSupplements.index') }}" class="nav-link {{ Route::is('healthSupplements.index') ? 'active' : '' }}" data-key="t-grid-js">Health Supplement</a>
                            </li>
                            @endif

                            @if ( $usr->can('therapyIngredientsAdd')  || $usr->can('therapyIngredientsView') ||  $usr->can('therapyIngredientsDelete') ||  $usr->can('therapyIngredientsUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('therapyIngredients.index') }}" class="nav-link {{ Route::is('therapyIngredients.index') ? 'active' : '' }}" data-key="t-grid-js">Therapy Ingredient</a>
                            </li>
                            @endif

                            @if ( $usr->can('therapyListsAdd')  || $usr->can('therapyListsView') ||  $usr->can('therapyListsDelete') ||  $usr->can('therapyListsUpdate'))
                            <li class="nav-item">
                                <a href="{{ route('therapyLists.index') }}" class="nav-link {{ Route::is('therapyLists.index') ? 'active' : '' }}" data-key="t-grid-js">Therapy List</a>
                            </li>
                            @endif
                        </ul>
                    </div>
                </li>



                @endif

                <li class="menu-title"><span data-key="t-menu">HR Section</span></li>

                <li class="nav-item">
                    <a class="nav-link menu-link {{ Route::is('staff.index') ? 'active' : '' }}" href="{{ route('staff.index') }}">
                        <i class="ri-align-justify"></i> <span data-key="t-widgets">Staff</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link {{ Route::is('reward.index') ? 'active' : '' }}" href="{{ route('reward.index') }}">
                        <i class="ri-paypal-fill"></i> <span data-key="t-widgets">Reward</span>
                    </a>
                </li>
                <li class="nav-item">
                    <a class="nav-link menu-link {{ Route::is('therapist.index') ? 'active' : '' }}" href="{{ route('therapist.index') }}">
                        <i class="ri-barricade-fill"></i> <span data-key="t-widgets">Therapist</span>
                    </a>
                </li>

                <li class="menu-title"><span data-key="t-menu">Setting</span></li>


                @if (Route::is('admin.system_information') ||  Route::is('admin.admins') || Route::is('admin.admins.create') || Route::is('admin.admins.edit') || Route::is('admin.roles') || Route::is('admin.roles.create') || Route::is('admin.roles.edit')|| Route::is('admin.permission') || Route::is('admin.permission.create') || Route::is('admin.permission.edit'))


                @if ($usr->can('system_information_add') || $usr->can('system_information_view') ||  $usr->can('system_information_update') ||  $usr->can('system_information_delete'))
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#sidebarIcons" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarIcons">
                        <i class="ri-settings-2-fill"></i> <span data-key="t-icons">System Setting</span>
                    </a>
                    <div class="collapse menu-dropdown show" id="sidebarIcons">
                        <ul class="nav nav-sm flex-column">


                            @if ($usr->can('system_information_add') || $usr->can('system_information_view') ||  $usr->can('system_information_update') ||  $usr->can('system_information_delete'))
                            <li class="nav-item"><a data-key="t-remix" href="{{ route('admin.system_information') }}" class="nav-link {{ Route::is('admin.system_information')  ? 'active' : '' }}"> <span>System Information</span> </a></li>

                    @endif


                    @if ($usr->can('admin.create') || $usr->can('admin.view') ||  $usr->can('admin.edit') ||  $usr->can('admin.delete'))
                    <li class="nav-item">
                    <a data-key="t-boxicons" href="{{ route('admin.admins') }}" class=" nav-link {{ Route::is('admin.admins') || Route::is('admin.admins.create') || Route::is('admin.admins.edit') ? 'active' : '' }}"><span>User</span> </a>
                    </li>

                    @endif


                       @if ($usr->can('role.create') || $usr->can('role.view') ||  $usr->can('role.edit') ||  $usr->can('role.delete'))
                            <li class="nav-item"><a data-key="t-material-design" href="{{ route('admin.roles') }}" class=" nav-link {{ Route::is('admin.roles') || Route::is('admin.roles.create') || Route::is('admin.roles.edit') ? 'active' : '' }}"> <span>Role List</span> </a></li>

                    @endif
                       @if ($usr->can('permission.create') || $usr->can('permission.view') ||  $usr->can('permission.edit') ||  $usr->can('permission.delete'))
                         <li class="nav-item">
                                <a data-key="t-line-awesome" href="{{ route('admin.permission') }}" class=" nav-link {{ Route::is('admin.permission') || Route::is('admin.permission.create') || Route::is('admin.permission.edit') ? 'active' : '' }}"><span>Permission</span> </a>
                            </li>
                    @endif

                        </ul>
                    </div>
                </li>
                @endif


                @else


                @if ($usr->can('system_information_add') || $usr->can('system_information_view') ||  $usr->can('system_information_update') ||  $usr->can('system_information_delete'))
                <li class="nav-item">
                    <a class="nav-link menu-link" href="#sidebarIcons" data-bs-toggle="collapse" role="button" aria-expanded="false" aria-controls="sidebarIcons">
                        <i class="ri-settings-2-fill"></i> <span data-key="t-icons">System Setting</span>
                    </a>
                    <div class="collapse menu-dropdown" id="sidebarIcons">
                        <ul class="nav nav-sm flex-column">


                            @if ($usr->can('system_information_add') || $usr->can('system_information_view') ||  $usr->can('system_information_update') ||  $usr->can('system_information_delete'))
                            <li class="nav-item"><a data-key="t-remix" href="{{ route('admin.system_information') }}" class="nav-link {{ Route::is('admin.system_information')  ? 'active' : '' }}"> <span>System Information</span> </a></li>

                    @endif


                    @if ($usr->can('admin.create') || $usr->can('admin.view') ||  $usr->can('admin.edit') ||  $usr->can('admin.delete'))
                    <li class="nav-item">
                    <a data-key="t-boxicons" href="{{ route('admin.admins') }}" class=" nav-link {{ Route::is('admin.admins') || Route::is('admin.admins.create') || Route::is('admin.admins.edit') ? 'active' : '' }}"><span>User</span> </a>
                    </li>

                    @endif


                       @if ($usr->can('role.create') || $usr->can('role.view') ||  $usr->can('role.edit') ||  $usr->can('role.delete'))
                            <li class="nav-item"><a data-key="t-material-design" href="{{ route('admin.roles') }}" class=" nav-link {{ Route::is('admin.roles') || Route::is('admin.roles.create') || Route::is('admin.roles.edit') ? 'active' : '' }}"> <span>Role List</span> </a></li>

                    @endif
                       @if ($usr->can('permission.create') || $usr->can('permission.view') ||  $usr->can('permission.edit') ||  $usr->can('permission.delete'))
                         <li class="nav-item">
                                <a data-key="t-line-awesome" href="{{ route('admin.permission') }}" class=" nav-link {{ Route::is('admin.permission') || Route::is('admin.permission.create') || Route::is('admin.permission.edit') ? 'active' : '' }}"><span>Permission</span> </a>
                            </li>
                    @endif

                        </ul>
                    </div>
                </li>
                @endif
                @endif
            </ul>
        </div>
        <!-- Sidebar -->
    </div>

    <div class="sidebar-background"></div>
</div>
<!-- Left Sidebar End -->
<!-- Vertical Overlay-->
<div class="vertical-overlay"></div>
