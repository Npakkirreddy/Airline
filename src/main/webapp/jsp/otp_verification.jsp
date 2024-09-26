<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
    <title>Verify OTP</title>
    <link rel="icon" href="images/logo.jpg" type="image/x-icon">
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f4;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
        }
        
        .container {
            background-color: #fff;
            padding: 40px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            text-align: center;
            width: 100%;
            max-width: 300px; /* Added max-width for larger screens */
        }

        h1 {
            color: #4CAF50;
            font-size: 24px;
            margin-bottom: 20px;
        }

        h2 {
            color: #333;
            margin-bottom: 20px;
        }

        label {
            display: block;
            font-size: 16px;
            margin-bottom: 10px;
            color: #555;
        }

        input[type="text"] {
            width: 100%;
            padding: 10px;
            margin-bottom: 20px;
            border: 1px solid #ccc;
            border-radius: 5px;
            box-sizing: border-box;
        }

        input[type="submit"] {
            background-color: #4CAF50;
            color: white;
            padding: 10px 15px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }

        input[type="submit"]:hover {
            background-color: #45a049;
        }

        .message {
            margin-bottom: 20px;
            color: #333;
        }

        /* Media query for devices with a max width of 600px */
        @media (max-width: 600px) {
            .container {
                padding: 20px;
            }
            input[type="text"], input[type="submit"] {
                padding: 8px;
                font-size: 14px;
            }
            h1 {
                font-size: 20px;
            }
            h2 {
                font-size: 18px;
            }
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Otp Sent Successfully</h1><br><br>
        <h2>Enter OTP</h2>
        <form action="../VerifyOtpServlet" method="post">
            <label for="otp">Enter the OTP:</label>
            <input type="text" name="otp" id="otp" required>
            <input type="submit" value="Verify OTP">
        </form>
    </div>
</body>
</html>