<?php

namespace App\Http\Controllers;

use App\Models\Token;
use Exception;
use Illuminate\Http\Request;

class AuthController extends Controller
{
    public function authenticate(Request $request) {
        try {
            $secret = $request->input("secret");
            $validSecret = env("SECRET_KEY");
            if ($secret !== $validSecret) {
                return response()->json(["error" => "Unauthorized"], 401);
            }
    
            $newToken = uniqid("token_", true);
            $token = Token::create(["token" => $newToken]);
    
            return response()->json(["token" => $token->token], 200);
        } catch (Exception $e) {
            return response()->json(["message" => "Error creating token", "error" => $e->getMessage()], 500);
        }
    }
}
