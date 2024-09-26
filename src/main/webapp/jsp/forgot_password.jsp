<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name='viewport' content='width=device-width, initial-scale=1.0'>
<title>Forgot Password</title>
<link rel="icon" href="images/logo.jpg" type="image/x-icon">
<style>
    body {
        font-family: Arial, sans-serif;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
        background-color: #f0f0f0;
    }
    .container {
        background-color: white;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 300px; /* Added max-width for larger screens */
        text-align: center;
    }
    label {
        display: block;
        margin-bottom: 8px;
        font-weight: bold;
    }
    input[type="email"], input[type="password"] {
        width: 100%;
        padding: 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 4px;
        box-sizing: border-box;
    }
    input[type="submit"] {
        width: 100%;
        padding: 10px;
        background-color: #4CAF50;
        color: white;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }

    /* Media query for devices with a max width of 600px */
    @media (max-width: 600px) {
        .container {
            padding: 15px;
        }
        input[type="email"], input[type="password"], input[type="submit"] {
            padding: 8px;
            margin-bottom: 12px;
        }
    }
</style>
</head>
<body>
    <div class="container">
        <h2>Forgot Password</h2>
        <form action="../SendOtpServlet" method="post">
            <label for="email">Enter your registered email:</label>
        	<input type="email" name="email" id="email" required>
        	<input type="submit" value="Send OTP">
        </form>
    </div>
</body>
</html>