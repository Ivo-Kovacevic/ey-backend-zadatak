# Voucher retrieval API

## Description

API with 2 endpoints for retrieving tokens and vouchers from database.

## Prerequisites

Ensure you have the following installed:

-   PHP
-   Composer
-   Laravel
-   MySQL

## How to start API

1. Clone repository:

```
git clone git@github.com:Ivo-Kovacevic/ey-backend-zadatak.git
```

2. Navigate into directory:
   
```
cd ey-backend-zadatak
```

3. Install dependencies with Composer:

```
composer install
```

4. Make MySQL database called `ey_backend`:

```
CREATE DATABASE ey_backend;
```

5. Setup `.env` file:

```
DB_CONNECTION=mysql
DB_HOST=127.0.0.1
DB_PORT=3306
DB_DATABASE=ey_backend
DB_USERNAME=USE_YOUR_USERNAME_HERE
DB_PASSWORD=USE_YOUR_PASSWORD_HERE
```

6. Make database tables and then seed them:

```
php artisan migrate
```
```
php artisan db:seed
```

or alternatively import `ey_backend.sql` file from this database folder by connecting to `ey_backend` and running:

```
source /path/to/ey_backend.sql
```

7. Start API with:

```
php artisan serve
```

8. Test endpoints

## API endpoints

| Endpoint       | Method | Description                                   | Request Body                                            | Headers                                      |
| -------------- | ------ | --------------------------------------------- | ------------------------------------------------------- | -------------------------------------------- |
| `/api/auth`    | POST   | Authenticates the user and generates a token. | `{ "secret": "top_secret_code" }`                       | None                                         |
| `/api/voucher` | GET    | Retrieves a voucher from the database.        | `{ "voucher_provider": "foo", "voucher_amount": 20.0 }` | `Authorization: Bearer <token>`                |


## Notes

- default secret is "top_secret_code"
- key is `Authorization` and value is `Bearer <token>`