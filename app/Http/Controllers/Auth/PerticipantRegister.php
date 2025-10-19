<?php

namespace App\Http\Controllers\Auth;

use App\Models\User;
use Validator;
use App\Models\AdminSettings;
use App\Http\Controllers\Controller;
use Illuminate\Foundation\Auth\RegistersUsers;
use Mail;
use DB;
use Illuminate\Http\Request;
use App\Library\SslCommerz\SslCommerzNotification;
use App\Models\TempPayment;
use Illuminate\Support\Facades\DB as FacadesDB;
use Illuminate\Support\Facades\Storage;
use Illuminate\Support\Facades\Http;

class PerticipantRegister extends Controller
{

    public function register(Request $request)
    {

        $data = $request->input();
        $photoUrl = null;
        if ($request->hasFile('photo')) {
            $photo = $request->file('photo');
            $fileName = time() . '.' . $photo->getClientOriginalExtension();
            $uploadPath = public_path('uploads/participants');

            if (!file_exists($uploadPath)) {
                mkdir($uploadPath, 0777, true);
            }

            $photo->move($uploadPath, $fileName);
            $photoUrl = url('public/uploads/participants/' . $fileName);
        }

        $data['photo_url'] = $photoUrl;
        $data['qr_token'] = uniqid();
        $tempPayment = DB::table('temp_payments')->insert([
            'session_id' => $data['qr_token'],
            'data' => json_encode($data),
        ]);
        // dd($tempPayment);

        $post_data = array();
        $post_data['total_amount'] = $request->total_amount; # You cant not pay less than 10
        // $post_data['total_amount'] = '10'; # You cant not pay less than 10
        $post_data['currency'] = "BDT";
        $post_data['tran_id'] = $data['qr_token'];

        # CUSTOMER INFORMATION
        $post_data['cus_name'] = $request->name;
        $post_data['cus_email'] = $request->email;
        $post_data['cus_add1'] = $request->address_line;
        $post_data['cus_phone'] = $request->phone;
        // $post_data['success_url'] = '/reg-user';

        $post_data['shipping_method'] = "NO";
        $post_data['product_name'] = "Registration";
        $post_data['product_category'] = "Registration";
        $post_data['product_profile'] = "Registration";

        $sslc = new SslCommerzNotification();
        # initiate(Transaction Data , false: Redirect to SSLCOMMERZ gateway/ true: Show all the Payement gateway here )
        $payment_options = $sslc->makePayment($post_data, 'hosted');

        if (!is_array($payment_options)) {
            print_r($payment_options);
            $payment_options = array();
        }
    }


    public function success(Request $request)
    {
        // dd($request->input());
        $tran_id = $request->input('tran_id');
        $amount = $request->input('amount');
        $currency = $request->input('currency');

        // DB::beginTransaction();

        // try {

            $tempPayment = TempPayment::where('session_id', $tran_id)->firstOrFail();

            $data = json_decode($tempPayment->data, true);
            $registration_no = $this->registration_no();

            $participant_id = DB::table('participant')->insertGetId([
                'first_name' => $data['name'],
                'batch_year' => $data['batch_year'],
                'email' => $data['email'],
                'phone' => $data['phone'],
                'address_line' => $data['address_line'],
                'qr_token' => uniqid(),
                'registration_no' => $registration_no,
                'gender' => $data['gender'],
                'no_of_guest' => count($data['guest_name'] ?? []),
                'registration_amount' => $data['registration_amount'],
                'guest_registration_amount' => $data['guest_registration_amount'],
                'nid' => $data['nid'],
                'blood_group' => $data['blood_group'],
                'tshirt_size' => $data['tshirt_size'],
                'dietary_code' => $data['dietary'],
                'religion' => $data['religion'],
                'photo_url' => $data['photo_url'],
                'created_at' => now(),
            ]);

            if (!empty($data['guest_name'])) {
                foreach ($data['guest_name'] as $key => $guest_name) {
                    $t_shirt_size = null;
                    if (in_array($data['guest_package'][$key], [1, 4])) {
                        $t_shirt_size = $data['guest_t_shirt'][$key];
                    }

                    DB::table('guest_detail')->insert([
                        'participant_id' => $participant_id,
                        'name' => $guest_name ?? '',
                        'tshirt_size' => $t_shirt_size ?? '',
                        'package' => $data['guest_package'][$key],
                    ]);
                }
            }

            DB::table('payment')->insert([
                'registration_id' => $participant_id,
                'method' => $request->card_issuer ?? '',
                'txn_id' => $tran_id,
                'amount' => $amount ?? 0,
                'currency' => 'BDT',
                'status' => 'paid',
                'gateway_payload' => json_encode($request->input()),
                'created_at' => now(),
            ]);

            $message = "Successfully registered. Thank you for your participation. Your registration id: " . $registration_no;

            Http::asForm()->post('https://portal.adnsms.com/api/v1/secure/send-sms', [
                'api_key'       => 'KEY-8k5mofuga3dl5gpmz5eae2w3xzb0mvxd',
                'api_secret'    => '@rhhyKpJUGHOeyoP',
                'request_type'  => 'SINGLE_SMS',
                'message_type'  => 'TEXT',
                'mobile'        => $data['phone'],
                'message_body'  => $message,
            ]);

            $tempPayment->update(['status' => 'success']);

            DB::commit();

            return view('auth.success-register-message', ['registration_no' => $registration_no]);
        // } catch (\Throwable $e) {
        //     DB::rollBack();
        //     \Log::error('SSLCommerz Success Error: ' . $e->getMessage());
        //     abort(500, 'Something went wrong during registration. Please contact support.');
        // }
    }

    public function showRegistrationForm()
    {
        $settings = AdminSettings::first();
        return view('auth.perticipation_register');
        // if($settings->registration_active == 'on')	{
        // 	return view('auth.register');
        // } else {
        // 	return redirect('/');
        // }
    }

    function registration_no()
    {
        // Get today's date in ddmmyy format
        $datePart = now()->format('dmy');

        // Get the latest registration number for today
        $lastParticipant = DB::table('participant')
            ->where('registration_no', 'like', 'CHSDJ26_' . $datePart . '%')
            ->orderByDesc('registration_no')
            ->first();

        // Determine next increment
        if ($lastParticipant) {
            // Extract last two digits
            $lastIncrement = (int) substr($lastParticipant->registration_no, -2);
            $nextIncrement = str_pad($lastIncrement + 1, 2, '0', STR_PAD_LEFT);
        } else {
            $nextIncrement = '01';
        }

        // Generate new registration number
        $registrationNo = 'CHSDJ26_' . $datePart . $nextIncrement;

        return $registrationNo;
    }
}