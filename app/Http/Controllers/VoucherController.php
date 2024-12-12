<?php

namespace App\Http\Controllers;

use App\Models\Token;
use App\Models\Voucher;
use App\Services\VoucherService;
use Exception;
use Illuminate\Http\Request;

class VoucherController extends Controller
{
    protected $voucherService;

    public function __construct(VoucherService $voucherService)
    {
        $this->voucherService = $voucherService;
    }

    public function getVoucher(Request $request)
    {
        try {
            $bearerToken = $request->bearerToken();
            $token = $this->voucherService->validateToken($bearerToken);
            
            if (!$token) {
                return response()->json(["error" => "Unauthorized"], 401);
            }
            
            $voucherProvider = $request->input('voucher_provider');
            $voucherAmount = $request->input('voucher_amount');

            $voucher = $this->voucherService->findAvailableVoucher($voucherProvider, $voucherAmount);

            if (!$voucher) {
                return response()->json(["error" => "Voucher not available"], 422);
            }
            
            $this->voucherService->setToUsed($voucher, $token);
            
            return response()->json([
                'voucher_number' => $voucher->voucher_number,
                'expires_at' => $voucher->expires_at,
            ]);
        } catch (Exception $e) {
            return response()->json(["error" => "Error retrieving voucher"], 500);
        }
    }
}
