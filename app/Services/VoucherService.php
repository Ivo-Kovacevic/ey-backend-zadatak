<?php

namespace App\Services;

use App\Models\Token;
use App\Models\Voucher;
use Carbon\Carbon;

class VoucherService
{
    public function validateToken(string $token): ?Token
    {
        $tokenModel = Token::where("token", $token)->first();
        return $tokenModel && !$tokenModel->used ? $tokenModel : null;
    }

    public function findAvailableVoucher(string $provider, int $amount): ?Voucher
    {
        return Voucher::where("voucher_provider", $provider)
            ->where("voucher_amount", $amount)
            ->where('expires_at', '>', Carbon::now())
            ->where('used', false)
            ->first();
    }

    public function setToUsed(Voucher $voucher, Token $token) {
        $voucher->used = true;
        $voucher->save();

        $token->used = true;
        $token->save();
    }
}
