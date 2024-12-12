<?php

namespace App\Http\Controllers;

use App\Models\Token;
use App\Services\AuthService;
use Exception;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    protected $authService;

    public function __construct(AuthService $authService)
    {
        $this->authService = $authService;
    }

    public function authenticate(Request $request)
    {
        try {
            $secret = $request->input("secret");

            if (!$this->authService->validateSecret($secret)) {
                return response()->json(["error" => "Unauthorized"], 401);
            }

            $token = $this->authService->generateToken();

            return response()->json(["token" => $token->token], 200);
        } catch (Exception $e) {
            return response()->json(["error" => "Error creating token"], 500);
        }
    }
}
