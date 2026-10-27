<?php
declare(strict_types=1);

/**
 * Movie Ticket Booking System
 *
 * Public Application Entry Point
 */

// Set the response content type
header('Content-Type: text/html; charset=UTF-8');

// Escape dynamic values before HTML output
$appName = htmlspecialchars(
    'Movie Ticket Booking System',
    ENT_QUOTES,
    'UTF-8'
);

?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1.0">

    <title><?= $appName ?></title>

    <style>
        * {
            box-sizing: border-box;
        }

        body {
            margin: 0;
            min-height: 100vh;
            display: flex;
            justify-content: center;
            align-items: center;
            background: #101827;
            color: #ffffff;
            font-family: Arial, sans-serif;
        }

        .container {
            max-width: 650px;
            padding: 40px;
            text-align: center;
        }

        h1 {
            color: #facc15;
            margin-bottom: 20px;
        }

        p {
            color: #cbd5e1;
            line-height: 1.7;
        }

        .status {
            display: inline-block;
            margin-top: 20px;
            padding: 12px 20px;
            border-radius: 8px;
            background: #14532d;
            color: #bbf7d0;
        }
    </style>
</head>
<body>

    <main class="container">

        <h1><?= $appName ?></h1>

        <p>
            Welcome to our online Movie Ticket
            Booking Platform.
        </p>

        <p>
            Our application is currently
            under development.
        </p>

        <div class="status">
            PHP Application Running Successfully
        </div>

    </main>

</body>
</html>
    