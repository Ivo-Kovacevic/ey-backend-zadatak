<?php
    require_once 'config.php';
    require_once 'auth.php';
    require_once 'voucher.php';
?>

<!DOCTYPE html>
<html>
    <head>
        <title>Index</title>
        <link rel='stylesheet' href='styles.css'>
    </head>
    <body>
        <div class='column'>
            <form method='POST'>
                <label for='secret'>Secret</label><br>
                <input type='text' id='secret' name='secret'><br><br>
                <input class='button' id='submit' type='submit' value='SUBMIT'>
            </form>

            <?php
                if ($_SERVER['REQUEST_METHOD'] === 'POST') {
                    authEndpoint();
                }
            ?>

            <br><br><br>
            <form method='GET'>
                <label for='token'>Token</label><br>
                <input type='text' id='token' name='token' required><br><br>

                <label for='voucher_provider'>Voucher Provider</label><br>
                <input type='text' id='voucher_provider' name='voucher_provider' maxlength="3" placeholder="foo/bar" title="Enter 'foo' or 'bar'" required><br><br>

                <label for='voucher_amount'>Voucher Amount</label><br>
                <input type='text' id='voucher_amount' name='voucher_amount' placeholder="00.0" pattern="\d{2}\.\d" title="E.g. '10.0' or '20.0'" required><br><br>

                <input class='button' id='voucher' type='submit' value='VOUCHER'>
            </form>

            <?php
                 if ($_SERVER['REQUEST_METHOD'] === 'GET' && isset($_GET['token'])) {
                    voucherEndpoint();
                }
            ?>

        </div>
    </body>
</html>


