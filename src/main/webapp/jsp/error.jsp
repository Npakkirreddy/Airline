<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/logo.jpg" type="image/x-icon">
    <title>
        <% 
        String status = (String) request.getAttribute("status");
        String booked = "booked";
        String bookingFailed = (String) request.getAttribute("booking_failed");
        
        if ("failed".equals(status)) { 
            out.print("Error: No Seats Available"); 
        } else if ("booking_failed".equals(bookingFailed)) { 
            out.print("Error: Booking Failed"); 
        } else { 
            out.print("Airline Reservation System"); 
        }
        %>
    </title>
    <!-- JS Libraries -->
    <script src="vendor/jquery/jquery.min.js"></script>
    <script src="js/main.js"></script>
    <script src="https://unpkg.com/sweetalert/dist/sweetalert.min.js"></script>
    <link rel="stylesheet" href="https://unpkg.com/sweetalert/dist/sweetalert.css">
   
</head>
<body>
    <!-- Hidden inputs to pass status messages -->
    <input type="hidden" id="status" value="<%= status %>">

    <input type="hidden" id="booking_failed" value="<%= bookingFailed %>">

    <!-- Alerts Based on Status -->
    <script type="text/javascript">
        var status = document.getElementById("status").value;
   
        var booking_failed = document.getElementById("booking_failed").value;

        if (status === "failed") {
            swal("Sorry", "No Seats Available", "error")
            .then(() => {
                window.location.href = "index.jsp";
            });
        } else if (booking_failed === "booking_failed") {
            swal("Sorry", "Booking Failed", "error")
            .then(() => {
                window.location.href = "index.jsp";
            });
        } 
    </script>
</body>
</html>
