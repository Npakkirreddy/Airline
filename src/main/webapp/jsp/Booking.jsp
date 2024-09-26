<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.util.*" import = "com.airline.model.Bookings"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/logo.jpg" type="image/x-icon">
<style>
       /* Basic styling for the body and page elements */
body {
    font-family: Arial, sans-serif;
    background-color: #f4f4f4;
    margin: 0;
    padding: 0;
}

h1 {
    background-color: #333;
    color: #fff;
    padding: 10px;
    text-align: center;
    margin: 0;
}

table {
    width: 100%;
    border-collapse: collapse;
    margin: 20px 0;
    overflow-x: auto; /* Allow scrolling on small screens */
}

table, th, td {
    border: 1px solid #ddd;
}

th, td {
    padding: 12px;
    text-align: left;
}

th {
    background-color: #f2f2f2;
}

tr:nth-child(even) {
    background-color: #f9f9f9;
}

tr:hover {
    background-color: #f1f1f1;
}

a {
    display: inline-block;
    padding: 10px 20px;
    text-decoration: none;
    background-color: #007BFF;
    color: #fff;
    border-radius: 5px;
    transition: background-color 0.3s, transform 0.3s;
    align-items: center;
}

.center-button a {
    margin-left: 0; /* Override the global margin */
    padding: 10px 20px;
    display: inline-block;
    text-decoration: none;
    background-color: #007BFF;
    color: #fff;
    border-radius: 5px;
    transition: background-color 0.3s, transform 0.3s;
}

.center-button {
    text-align: center; /* Center the content inside the div */
    margin: 20px 0;
}

.center-button a:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}

.center-button a:active {
    background-color: #003d7a;
    transform: scale(0.98);
}

a:hover {
    background-color: #0056b3;
    transform: scale(1.05);
}

.error {
    color: red;
    font-weight: bold;
    text-align: center;
    margin: 20px;
}

/* Responsive styling */
@media screen and (max-width: 768px) {
    table, th, td {
        font-size: 14px;
    }

    th, td {
        padding: 10px;
    }

    a {
        padding: 8px 15px;
        font-size: 14px;
        margin: 10px auto;
        display: block;
    }
}

@media screen and (max-width: 480px) {
    h1 {
        font-size: 20px;
        padding: 8px;
    }

    table, th, td {
        font-size: 12px;
    }

    th, td {
        padding: 8px;
    }

    a {
        padding: 8px 12px;
        font-size: 12px;
        margin: 10px auto;
        display: block;
    }

    body {
        padding: 0 10px;
    }
}

    </style>
</head>

<body>
    <h1>My Bookings</h1>

    <% 
        // Check for and display error message if present
        String error = (String) request.getAttribute("error");
        if (error != null) {
            out.println("<p class='error'>" + error + "</p>");
        }

        List<Bookings> b = (List<Bookings>) request.getAttribute("book");
        
        if (b != null && !b.isEmpty()) {
    %>
        <table>
            <thead>
                <tr>
                    <th>Booking_ID</th>
                    <th>Flight_ID</th>
                    <th>Passenger_Name</th>
                    <th>Seat_Class</th>
                    <th>Num_Passengers</th>
                    <th>Booking_Date</th>
                    <th>Paid Amount</th>
                    <th>Is_International</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Iterate through flights and display them
                    for (Bookings flight : b) {
                %>
                    <tr>
                        <td><%= flight.getBooking_id() %></td>
                        <td><%= flight.getFlight_id() %></td>
                        <td><%= flight.getPassenger_name() %></td>
                        <td><%= flight.getSeat_class() %></td>
                        <td><%= flight.getNum_passengers() %></td>
                        <td><%= flight.getBooking_date() %></td>
                        <td><%= flight.getAmount() %> </td>
                        <td><%= flight.isIs_international() ? "International" : "Domestic" %></td>

                    </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    <% 
        } else {
            out.println("<p>No Bookings available.</p>");
        }
    %>

    <div class="center-button">
    	<a href="<%= request.getContextPath() %>/index.jsp">Back to Home</a>
	</div>
    
</body>
</html>
