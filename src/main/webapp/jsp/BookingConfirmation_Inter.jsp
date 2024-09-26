<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/logo.jpg" type="image/x-icon">
    <title>Booking Confirmation</title>
    <style>
		body { 
		    font-family: Arial, sans-serif; 
		    background-color: #f4f4f4; 
		    margin: 0; 
		    padding: 20px; 
		    display: flex; 
		    flex-direction: column; 
		    align-items: center; 
		    background-image: url("images/flight2.jpg"); /* Ensure this path is correct */
		    background-size: cover;
		    background-position: center;
		    height: 100vh;
		    position: relative; /* Add relative positioning */
		}
		
		/* Add a transparent overlay */
		body::before {
		    content: '';
		    position: absolute;
		    top: 0;
		    left: 0;
		    width: 100%;
		    height: 100%;
		    background-color: rgba(0, 0, 0, 0.1); /* Adjust opacity */
		    z-index: 1; /* Set z-index to ensure it layers correctly */
		}
		
		h1, p, table, .button-container {
		    position: relative;
		    z-index: 2; /* Ensure content is above the background overlay */
		} 

        h1 { 
            color: blue;
            margin-bottom: 20px; 
            text-shadow: 3px 3px 5px rgba(255, 255, 255, 0.4);
        }
        p { 
            font-size: 16px; 
            color: #333; 
        }
        table { 
            width: 100%; 
            border-collapse: collapse; 
            margin-top: 20px; 
            background-color: #ffffff; 
        }
        table, th, td { 
            border: 1px solid #ddd; 
        }
        th, td { 
            padding: 12px; 
            text-align: left; 
        }
        th { 
            background-color: #35424a; 
            color: #ffffff; 
        }
        tr:nth-child(even) { 
            background-color: #f9f9f9; 
        }
        tr:hover { 
            background-color: #e0e0e0; 
        }
        .button { 
            padding: 10px 20px; 
            border: none; 
            border-radius: 5px; 
            cursor: pointer; 
            transition: background-color 0.3s; 
            font-size: 16px; 
            color: #fff; 
        }
        .button-logout { 
            background-color: #dc3545; 
        }
        .button-confirm{
        background-color: #28a745;
        }
        .button-logout:hover { 
            background-color: #c82333; 
        }
        .button-home { 
            background-color: #28a745; 
        }
        .button-home:hover { 
            background-color: #218838; 
        }
        .button-back { 
            background-color: #17a2b8; 
        }
        .button-back:hover { 
            background-color: #138496; 
        }
        .button-container { 
            width: 100%; 
            display: flex; 
            justify-content: space-between; 
            margin-top: 20px; 
        }
        .button-container .button { 
            margin: 0 10px; 
        }
        @media (max-width: 768px) {
            .button-container {
                flex-direction: column;
                align-items: center;
            }
            .button-container .button {
                margin: 10px 0;
            }
        }
    </style>
</head>
<body>
    <h1>Booking Confirmation</h1>
    <!-- Buttons for Confirm and Cancel -->
    <div class='button-container'>
        <form action='bookInternationalFlight' method='post'>
            <!-- Hidden fields to pass data back to domestic_booking.jsp -->
            <input type="hidden" name="flightId" value="<%= request.getAttribute("flightId") %>">
            <input type="hidden" name="passengerName" value="<%= request.getAttribute("passengerName") %>">
            <input type="hidden" name="seatClass" value="<%= request.getAttribute("seatClass") %>">
            <input type="hidden" name="numPassengers" value="<%= request.getAttribute("numPassengers") %>">
            <input type="hidden" name="action" value="cancel">
           <input type='submit' name='click' value='Cancel' class='button button-logout' />
        </form>
        <form action='bookInternationalFlight' method='post'>
            <!-- Hidden fields to pass data -->
            <input type="hidden" name="flightId" value="<%= request.getAttribute("flightId") %>">
            <input type="hidden" name="passengerName" value="<%= request.getAttribute("passengerName") %>">
            <input type="hidden" name="seatClass" value="<%= request.getAttribute("seatClass") %>">
            <input type="hidden" name="numPassengers" value="<%= request.getAttribute("numPassengers") %>">
            <input type="hidden" name="isD" value="<%= request.getAttribute("isD") %>">
             <input type="hidden" name="a" value="<%= false %>">
            <input type="hidden" name="action" value="Confirm">
			<input type='submit' name='click' value='Confirm' class='button button-confirm' />
        </form>


    </div>
    
    
    
    <!--  <form action='bookDomesticFlight' method='post'>
            <input type='submit' name='click' value='Confrim' class='button button-logout' />
        </form>
         <form action='bookDomesticFlight' method='post'>
            <input type='submit' name='click' value='Cancel' class='button button-logout' />
        </form> -->
    <table>
        <thead>
            <tr>
                <th>Flight ID</th>
                <th>Passenger Name</th>
                <th>Seat Class</th>
                <th>Number of Passengers</th>
                <th>Total Amount</th>
            </tr>
        </thead>
        <tbody>
            <tr>
                <td><%= request.getAttribute("flightId") %></td>
                <td><%= request.getAttribute("passengerName") %></td>
                <td><%= request.getAttribute("seatClass") %></td>
                <td><%= request.getAttribute("numPassengers") %></td>
                <td><%= request.getAttribute("paid") %></td>
            </tr>
        </tbody>
    </table>

    <!-- Button container with alignment -->
    <div class='button-container'>
       <% 
    Boolean a = (Boolean) session.getAttribute("a"); 
%>
<!-- Button container with alignment -->
<div class='button-container'>

<% if (a) { %>
    <!-- Form with GET method -->
    <a href="jsp/international_booking.jsp?flightId=<%= request.getAttribute("flightId") %> &source_city=<%= request.getAttribute("source_city") %> &destination_city=<%= request.getAttribute("destination_city")%>"><button class='button button-back'>Back</button></a>
<% } else { %>
    <!-- Form with POST method -->
 
    <a href="jsp/international_booking.jsp?flightId=<%= request.getAttribute("flightId") %> &source_city=<%= request.getAttribute("source_city") %> &destination_city=<%= request.getAttribute("destination_city")%>"><button class='button button-back'>Back</button></a>
<% } %>

    
    <a href='index.jsp'><button class='button button-home'>Go to Home</button></a>
    
   

</body>
</html>
