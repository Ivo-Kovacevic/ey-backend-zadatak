<?php
    function voucherEndpoint() {

        global $dbc;

        if (validateToken()) {
            http_response_code(401);
            echo json_encode(['error' => 'Unauthorized']);
            return;
        }

        $voucher_provider = $_GET['voucher_provider'];
        $voucher_amount = $_GET['voucher_amount'];
        $currentDateTime = date("Y-m-d H:i:s");

        $query = "SELECT voucher_number, expires_at FROM vouchers 
                    WHERE voucher_provider = '$voucher_provider' 
                    AND voucher_amount = '$voucher_amount' 
                    AND expires_at > '$currentDateTime' 
                    AND used = 0
                    LIMIT 1";
        $result = mysqli_query($dbc, $query);

        if ($result) {
            if (mysqli_num_rows($result) > 0) {
                http_response_code(200);
                $row = mysqli_fetch_assoc($result);
                $voucherNumber = $row['voucher_number'];
                $expiresAt = $row['expires_at'];

                $response = [
                    'Voucher Number' => $voucherNumber,
                    'Expires At' => $expiresAt,
                ];
                echo json_encode($response);

                $token = $_GET['token'];
                $query = "UPDATE tokens
                            SET used = 1
                            WHERE token = '$token';
                        
                            UPDATE vouchers
                            SET used = 1
                            WHERE voucher_number = '$voucherNumber'";
                $result = mysqli_multi_query($dbc, $query);
            } else {
                http_response_code(422);
                echo json_encode(['error' => 'Voucher not available']);
            }
        } else {
            echo "Greška u izvršavanju upita: " . mysqli_error($dbc);
        }
    }

    function validateToken() {
        global $dbc;
        $token = $_GET['token'];
        $query = "SELECT * FROM tokens WHERE token = '$token' AND used = 0";
        $result = mysqli_query($dbc, $query);
        if (mysqli_num_rows($result) > 0) {
            return false;
        } else {
            return true;
        }
    }
?>