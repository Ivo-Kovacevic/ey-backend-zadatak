# ey-zadatak

## Upute za pokretanje

Korak 1: Pokretanje XAMPP-a
Pokrenite XAMPP.

Korak 2: Pokretanje Apache i MySQL servera
Pokrenite Apache i MySQL pritiskom na Start.

Korak 3: Uvezite bazu podataka
Kliknite na Admin u sučelju XAMPP-a ili u pregledniku upišite "http://localhost/phpmyadmin/". Napravite novu bazu podataka naziva "ey" i u nju uvezite "ey.sql" podatke.

Korak 4: Otvorite router.php datoteku
Otvorite router.php datoteku u pregledniku. Ovisno gdje ste ju postavili, putanja može izgledati ovako "localhost/router.php".

Korak 5: Unesite secret
Na stranici zatim možete upisati secret, koji ako je točan će generirati i ispisati token.

Korak 6: Unesite token, voucher_provider i voucher_amount
Zatim možete upisati token koji ste dobili zajedno s "voucher_amount" i "voucher_provider". Ako su svi podaci ispravni, na ekranu će se ispisati "voucher_number" i "expires_at".
