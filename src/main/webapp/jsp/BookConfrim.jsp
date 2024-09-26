<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/flight3.jpg" type="image/x-icon">
    <title>
        <% 
        
        String booked = "booked";
       
        
        if ("booked".equals(booked)) { 
            out.print("Success: Tickets Booked"); 
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
 
    <input type="hidden" id="booked" value="<%= booked %>">
 

    <!-- Alerts Based on Status -->
    <script type="text/javascript">
    
        var booked = document.getElementById("booked").value;
        
		if (booked === "booked") {
            swal("Success", "Tickets Booked Successfully!", "success")
            .then(() => {
                window.location.href = "../BookingServlet";
            });
        }
    </script>
</body>
</html>
