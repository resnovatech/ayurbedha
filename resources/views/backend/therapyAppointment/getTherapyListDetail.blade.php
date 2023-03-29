<div class="row">

    @foreach($patientTherapyList as $allPatientTherapyList)
    <?php

$therapyId = DB::table('therapy_lists')
        ->where('name', $allPatientTherapyList->name)->value('id');

$therapyDetailList = DB::table('therapy_details')
        ->where('therapy_list_id', $therapyId)->get();
        $therapyName = DB::table('therapy_lists')
        ->where('id', $therapyId)->value('name');
    ?>
    <div class="col-lg-6">
        <div class="card">
            <div class="card-header align-items-center d-flex">
                <h4 class="card-title mb-0 flex-grow-1">Therapy Name: {{ $therapyName }}</h4>
            </div><!-- end card header -->
            <div class="card-body">
                <p class="text-muted">Add Ingredient</p>

                    <table class="table table-bordered" id="dynamicAddRemove1">
                        <tr>
                            <th>Name</th>
                            <th>Amount</th>
                        </tr>
                        @foreach($therapyDetailList as $allTherapyDetailList)

                        <?php

$therapyDetailListName = DB::table('therapy_ingredients')
        ->where('id', $allTherapyDetailList->therapy_ingredient_id)->value('name');

    ?>


                        <tr>
                            <td>
                                <input type="text" value="{{$therapyDetailListName}}" name="ingridient_name[]"
                                       class="form-control" required/>

                                       <input type="hidden" value="{{$therapyId}}" name="therapy_id[]"
                                       class="form-control"/>


                            </td>
                            <td>
                                <input type="text" value="{{ $allTherapyDetailList->quantity }}{{ $allTherapyDetailList->unit }}" name="ingridient_amount[]"
                                       class="form-control" required/>
                            </td>

                        </tr>
                        @endforeach
                    </table>
   

                <!--end col-->
            </div>
        </div>
    </div>
    @endforeach

</div>
</div>

<div class="row">
<div class="col-lg-12">
    <div class="card">
        <div class="card-header align-items-center d-flex">
            <h4 class="card-title mb-0 flex-grow-1">Therapy Appointment Date & Time</h4>
        </div><!-- end card header -->
        <div class="card-body">


                <table class="table table-bordered" id="dynamicAddRemove">
                    <tr>
                        <th>Therapist</th>
                        <th>Therapy</th>
                        <th>Date</th>
                        <th>Start Time</th>
                        <th>End Time</th>
                    </tr>
                    <tr>
                        <td>
                            <select class="form-select mb-3" required aria-label="Default select example" name="therapist[]">
                                @foreach($therapistList as $allTherapistList)
                                <option value="{{ $allTherapistList->id }}">{{ $allTherapistList->name }}</option>
                                @endforeach

                            </select>
                        </td>
                        <td>
                            <select class="form-select mb-3" required aria-label="Default select example" name="therapy[]">
                                @foreach($patientTherapyList as $allPatientTherapyList)


                                <option value="{{ $allPatientTherapyList->name }}">{{ $allPatientTherapyList->name }}</option>
                                @endforeach

                            </select>
                        </td>
                        <td>
                            <input type="date" required  name="date[]" value=""
                                   class="form-control"/>
                        </td>
                        <td>
                            <input type="time" required name="start_time[]" value=""
                                   class="form-control"/>
                        </td>
                        <td>
                            <input type="time" required name="end_time[]" value=""
                                   class="form-control"/>
                        </td>
                        <td>
                            <button type="button" name="add" id="dynamic-ar"
                                    class="btn btn-outline-primary">Add New Therapy
                            </button>
                        </td>
                    </tr>
                </table>

        </div>
    </div>
</div>
<!--end col-->
</div>


<div class="text-end mb-3">
<button type="submit" class="btn btn-primary w-sm" >Submit
</button>
</div>

<script type="text/javascript">
    var i = 0;
    $("#dynamic-ar").click(function () {
        ++i;
        $("#dynamicAddRemove").append('<tr><td><select required class="form-select mb-3" aria-label="Default select example" name="therapist[]">@foreach($therapistList as $allTherapistList)<option value="{{ $allTherapistList->id }}">{{ $allTherapistList->name }}</option>@endforeach</select></td><td><select class="form-select mb-3" aria-label="Default select example" required name="therapy[]">@foreach($patientTherapyList as $allPatientTherapyList)<option value="{{ $allPatientTherapyList->name }}">{{ $allPatientTherapyList->name }}</option>@endforeach</select></td><td><input type="date" name="date[]" value="" class="form-control" required/></td><td><input type="time" name="start_time[]" value="" class="form-control" required /></td><td><input type="time" name="end_time[]" value="" required class="form-control"/></td><td><button type="button" class="btn btn-outline-danger remove-input-field">Delete</button></td></tr>');
    });
    $(document).on('click', '.remove-input-field', function () {
        $(this).parents('tr').remove();
    });
</script>
