<?php

namespace App\Services;

use App\Models\Token;
use Exception;

class AuthService
{
    public function validateSecret(string $secret): bool
    {
        return $secret === config('auth.secret_key');
    }

    public function generateToken(): Token
    {
        $newToken = uniqid("token_", true);
        return Token::create(["token" => $newToken]);
    }
}
