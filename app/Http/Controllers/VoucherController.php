<?php

namespace App\Http\Controllers;

use App\Models\Token;
use App\Models\Voucher;
use Illuminate\Http\Request;

class VoucherController extends Controller
{
    public function getVoucher(Request $request) {
        $bearerToken = $request->bearerToken();
        $token = Token::where("token", $bearerToken)->first();
        if (!$token) {
            return response()->json(["error" => "Unauthorized"], 401);
        }

        $voucherProvider = $request->input('voucher_provider');
        $voucherAmount = $request->input('voucher_amount');

        $voucher = Voucher::where("voucher_provider", $voucherProvider)
            ->where("voucher_amount", $voucherAmount)
            ->where('expires_at', '>', now())
            ->where('used', false)
            ->first();

        if (!$voucher) {
            return response()->json(["error" => "Voucher not available"], 422);
        }

        return response()->json([
            'voucher_number' => $voucher->voucher_number,
            'expires_at' => $voucher->expires_at,
        ]);
    }
}
