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
                    <h1>Registration completed successfully. Your regustration no is: <span style="color: green">{{
                            $registration_no }}</span></h1>
                </div>
            </div><!-- Login Form -->
        </div><!-- /COL MD -->
    </div><!-- ./ -->
</div><!-- ./ -->
</div>
<!-- container wrap-ui -->

@endsection

@section('javascript')

@if (session('notification'))
<script type="text/javascript">
    $('#signup_form, #dangerAlert').remove();


</script>
@endif
@endsection
