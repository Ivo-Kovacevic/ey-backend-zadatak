<?php
    function authEndpoint() {

        global $dbc;
        global $secretCode;

        if (empty($_POST)) {
            return;
        } else {
            $receivedSecret = $_POST['secret'];
        }

        if ($receivedSecret === $secretCode) {
            $token = generateToken();
            http_response_code(200);
            echo json_encode(['token' => $token]);
            
            $query = "INSERT INTO tokens (token, used) VALUES ('$token', 0)";
            $result = mysqli_query($dbc, $query);

        } else {
            http_response_code(401);
            echo json_encode(['error' => 'Unauthorized']);
        }
    }
    
    function generateToken() {
        $tokenLength = 32;
        $characters = '0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ';
        $token = '';
        for ($i = 0; $i < $tokenLength; $i++) {
            $token .= $characters[random_int(0, strlen($characters) - 1)];
        }
        return $token;
    }
?>