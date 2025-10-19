@extends('app')

@section('title') {{trans('auth.sign_up')}} -@endsection

@section('content')
<div class="py-5 bg-primary bg-sections">
    <div class="btn-block text-center text-white position-relative">
        <h1>Register</h1>
    </div>
</div><!-- container -->

<div class="py-5 bg-white text-center">
    <div class="container margin-bottom-40">
        <style>
            .register-form {
                width: 100%;
            }

            .file-upload {
                display: flex;
                align-items: center;
                gap: 10px;
            }

            .file-upload label {
                background-color: #f45302;
                color: #fff;
                padding: 8px 16px;
                border-radius: 8px;
                cursor: pointer;
                font-weight: 500;
                transition: background 0.2s;
            }

            .file-upload label:hover {
                background-color: #3730a3;
            }

            .file-upload span {
                font-size: 14px;
                color: #555;
            }
        </style>
        <div class="row">
            <!-- Col MD -->
            <div class="col-md-12">
                <div class="d-flex justify-content-center">

                    <form enctype="multipart/form-data" action="{{ url('perticipation/register') }}" method="post"
                        class="register-form text-left @if (count($errors) > 0)vivify shake @endif" name="form"
                        id="signup_form">

                        @csrf

                        @include('errors.errors-forms')

                        @if (session('login_required'))
                        <div class="alert alert-danger" id="dangerAlert">
                            <i class="fa fa-warning"></i> {{ session('login_required') }}
                        </div>
                        @endif

                        @if (session('notification'))
                        <div class="alert alert-success text-center">
                            <i class="fa fa-check-circle mr-1"></i> {{ session('notification') }}
                        </div>
                        @endif

                        <div class="row">
                            @php
                            $t_shirt_size = \DB::table('ref_tshirt_size')->get();
                            $t_gender = \DB::table('ref_gender')->get();
                            $t_ref_dietary = \DB::table('ref_dietary')->get();
                            $batch_year = \DB::table('batch_year')->get();
                            $packages = \DB::table('package')->get();
                            $blood_group = \DB::table('blood_group')->get();
                            @endphp
                            <div class="col-md-9">
                                <div class="row">
                                    <div class="form-group col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                                            <input type="text" class="form-control" required value="{{ old('name') }}"
                                                name="name" placeholder="{{ trans('auth.full_name') }}"
                                                title="{{ trans('users.full_name') }}">
                                        </div>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fa fa-envelope"></i></span>
                                            <input type="email" class="form-control" required value="{{ old('email') }}"
                                                name="email" placeholder="{{ trans('auth.email') }}"
                                                title="{{ trans('auth.email') }}">
                                        </div>
                                    </div>
                                    <div class="col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fa fa-seedling"></i></span>
                                            <select required class="form-select" id="batch_year" name="batch_year">
                                                <option value="">Batch year</option>
                                                @foreach ($batch_year as $batch )
                                                <option data-year="{{ $batch->year }}" value="{{ $batch->year }}">{{
                                                    $batch->title }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fa fa-phone"></i></span>
                                            <input type="text" class="form-control" required value="{{ old('phone') }}"
                                                name="phone" placeholder="Phone Number" title="">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fa fa-user"></i></span>
                                            <select required class="form-select" name="gender">
                                                <option value="">{{ trans('misc.gender') }}</option>
                                                @foreach ($t_gender as $gender )
                                                <option value="{{ $gender->gender_code }}">{{ $gender->label }}</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fa fa-heartbeat"></i></span>
                                            <select required class="form-select" name="blood_group">
                                                <option value="">Blood group</option>
                                                @foreach ($blood_group as $blood )
                                                <option value="{{ $blood->blood_group_id }}">{{ $blood->group_name }}
                                                </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fa fa-place-of-worship"></i></span>
                                            <input type="text" class="form-control" required
                                                value="{{ old('religion') }}" name="religion" placeholder="Religion"
                                                title="">
                                        </div>
                                    </div>
                                    <div class=" form-group col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fa fa-tshirt"></i></span>
                                            <select required class="form-select" name="tshirt_size">
                                                <option value="">{{ trans('misc.t_shirt_size') }}</option>
                                                @foreach ($t_shirt_size as $size )
                                                <option value="{{ $size->size_code }}">{{ $size->label }} ({{ $size->size_code }})</option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>

                                    <div class="form-group col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fa fa-seedling"></i></span>
                                            <select required class="form-select" name="dietary">
                                                <option value="">{{ trans('misc.dietary') }}</option>
                                                @foreach ($t_ref_dietary as $dietary )
                                                <option value="{{ $dietary->dietary_code }}">{{ $dietary->label }}
                                                </option>
                                                @endforeach
                                            </select>
                                        </div>
                                    </div>


                                    <div class="form-group col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fa fa-id-card"></i></span>
                                            <input type="text" class="form-control" required value="{{ old('nid') }}"
                                                name="nid" placeholder="NID" title="">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fa fa-briefcase"></i></span>
                                            <input type="text" class="form-control" required
                                                value="{{ old('occupation') }}" name="occupation"
                                                placeholder="Occupation" title="">
                                        </div>
                                    </div>

                                    <div class=" form-group col-md-8">
                                        <div class="input-group">
                                            <span class="input-group-text"><i class="fa fa-address-book"></i></span>
                                            <input type="text" class="form-control" required
                                                value="{{ old('address_line') }}" name="address_line"
                                                placeholder="Address" title="">
                                        </div>
                                    </div>
                                    <div class="form-group col-md-4">
                                        <div class="input-group">
                                            <div class="file-upload">
                                                <label for="fileInput">Choose Photo</label>
                                                <input id="fileInput" name="photo" type="file" hidden
                                                    onchange="showFileName(this)">
                                                <span id="fileName">Choose photo</span>
                                            </div>
                                        </div>
                                    </div>

                                    {{-- guest --}}

                                    <div class="form-group col-md-12">
                                        <div class="input-group" style="gap:20px; align-items:center">
                                            <label for="">Guest Y/N</label>
                                            <input style="width:30px; height:30px" type="checkbox"
                                                class="form-check-input" id="guest_yn" name="guest_yn"
                                                id="customControlInline" value="1">
                                        </div>
                                    </div>
                                    <div class="col-md-12" id="guest_area">
                                        <div class="row align-items-end mb-2 guest-row">
                                            <!-- Guest Name -->
                                            <div class="col-12 col-md-4 mb-2 mb-md-0">
                                                <input type="text" class="form-control" name="guest_name[]" value="{{ old('guest_name') }}"
                                                    placeholder="Guest Name" title="">
                                            </div>

                                            <!-- Guest Package -->
                                            <div class="col-12 col-md-3 mb-2 mb-md-0">
                                                <select onchange="calculateGuest(0)" id="guest_package_0"
                                                    required class="form-select guest_package" name="guest_package[]">
                                                    @foreach ($packages as $package)
                                                    <option data-price="{{ $package->price }}" value="{{ $package->package_id }}">
                                                        {{ $package->name }}
                                                    </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <!-- T-Shirt Size -->
                                            <div class="col-12 col-md-3 mb-2 mb-md-0">
                                                <select id="guest_t_shirt_0" class="form-select" name="guest_t_shirt[]">
                                                    <option value="">{{ trans('misc.t_shirt_size') }}</option>
                                                    @foreach ($t_shirt_size as $size)
                                                    <option value="{{ $size->size_code }}">
                                                        {{ $size->label }} ({{ $size->size_code }})
                                                    </option>
                                                    @endforeach
                                                </select>
                                            </div>

                                            <!-- Add Button -->

                                        </div>
                                    </div>
                                    <div class="col-8 text-md-start text-center">

                                    </div>
                                    <div class="col-4 col-md-2 text-md-start text-center">
                                        <button id="addGuest" class="btn btn-success w-100 w-md-auto" type="button">
                                            <i class="fa fa-plus"></i>
                                        </button>
                                    </div>
                                </div>
                            </div>
                            <div class="col-md-3">
                                <table class="table table-bordered table-hover">
                                    <thead>
                                        <tr>
                                            <th>Regestration Amount</th>
                                            <td style="text-align: right" id="registration_amount">0</td>
                                            <input type="hidden" hidden name="registration_amount"
                                                id="registration_amount_hidden">
                                        </tr>
                                        <tr>
                                            <th>
                                                Guest Registration Amount
                                            </th>
                                            <td style="text-align: right" id="guest_registration_amount">0</td>
                                            <input type="hidden" hidden name="guest_registration_amount"
                                                id="guest_registration_amount_hidden">
                                        </tr>

                                    </thead>
                                    <tbody>
                                        <tr>
                                            <th>Total</th>
                                            <td style="text-align: right" id="total_amount">0</td>
                                            <input type="hidden" hidden name="total_amount" id="total_amount_hidden">
                                        </tr>
                                        <tr style="border: none !important">
                                            <th colspan="2">
                                                <button type="submit"
                                                    class="btn btn-block mt-2 py-2 btn-primary font-weight-light">
                                                    Pay & Register
                                                </button>
                                            </th>
                                        </tr>
                                    </tbody>
                                </table>
                            </div>
                        </div>
                </div>
                </form>
            </div><!-- Login Form -->
        </div><!-- /COL MD -->
    </div><!-- ./ -->
</div><!-- ./ -->
</div>
<!-- container wrap-ui -->

@endsection

@section('javascript')
<script>
    $('#guest_area').hide();
    $('#addGuest').hide();
    $('#guest_yn').on('change', function() {
        if ($(this).is(':checked')) {
            $('#guest_area').show();
            $('#addGuest').show();
            calculateGuest(0);
        } else {
            $('#guest_area').hide();
            $('#addGuest').hide();
            calculateGuest(0);
        }
    })

    function calculateGuest(index) {

        var totalGuestPrice = 0;
        if($('#guest_yn').is(':checked')){
            let package = $('#guest_package_'+index).find(':selected').val();

            if(package == 1 || package == 4){
                $('#guest_t_shirt_'+index).prop('required', true);
                $('#guest_t_shirt_'+index).show();
            }else{
                $('#guest_t_shirt_'+index).prop('required', false);
                $('#guest_t_shirt_'+index).hide();
            }

            // Loop through each select with class 'guest_package'
            $('.guest_package').each(function() {
                var selectedPrice = $(this).find(':selected').data('price') || 0;
                totalGuestPrice += parseFloat(selectedPrice);
            });
        }

        // Add registration amount
        $('#guest_registration_amount').html(totalGuestPrice);
        var registrationAmount = parseFloat($('#registration_amount').html()) || 0;
        var total = totalGuestPrice + registrationAmount;

        // Show final total
        $('#total_amount').html(total);

        $('#guest_registration_amount_hidden').val(totalGuestPrice);
        $('#total_amount_hidden').val(total);
    }

    var index = 0;
    $('#addGuest').on('click', function() {
        index++;
        var html = `<div class="row align-items-end mb-2 guest-row">
                        <!-- Guest Name -->
                        <div class="col-12 col-md-4 mb-2 mb-md-0">
                            <input type="text" class="form-control" required name="guest_name[]" placeholder="Guest Name" title="">
                        </div>

                        <!-- Guest Package -->
                        <div class="col-12 col-md-3 mb-2 mb-md-0">
                            <select onchange="calculateGuest(${index})" id="guest_package_${index}" required
                                class="form-select guest_package" name="guest_package[]">
                                @foreach ($packages as $package)
                                <option data-price="{{ $package->price }}" value="{{ $package->package_id }}">
                                    {{ $package->name }}
                                </option>
                                @endforeach
                            </select>
                        </div>

                        <!-- T-Shirt Size -->
                        <div class="col-12 col-md-3 mb-2 mb-md-0">
                            <select id="guest_t_shirt_${index}" class="form-select" name="guest_t_shirt[]">
                                <option value="">{{ trans('misc.t_shirt_size') }}</option>
                                @foreach ($t_shirt_size as $size)
                                <option value="{{ $size->size_code }}">{{ $size->label }} ({{ $size->size_code }})</option>
                                @endforeach
                            </select>
                        </div>

                        <!-- Remove Button -->
                        <div class="col-12 col-md-2 text-md-start text-center">
                            <button id="removeGuest" class="btn btn-danger w-100 w-md-auto" type="button">
                                <i class="fa fa-times"></i>
                            </button>
                        </div>
                    </div>
                    `;
        $('#guest_area').append(html);
        calculateGuest(index);
    })

    $('#guest_area').on('click', '#removeGuest', function() {
        $(this).parent().parent().remove();
        calculateGuest(0);
    })
    var yearInclude = [6,7,8,9,10,11]
    $('#batch_year').on('change', function() {

        var year = $(this).find(':selected').data('year');

        console.log(year);
        if(yearInclude.includes(year)){
            $('#registration_amount').html('500');
            $('#registration_amount_hidden').val('500');
        }else{
            $('#registration_amount').html('1000');
            $('#registration_amount_hidden').val('1000');
        }

    });


</script>
@if (session('notification'))
<script type="text/javascript">
    $('#signup_form, #dangerAlert').remove();


</script>
@endif
@endsection
