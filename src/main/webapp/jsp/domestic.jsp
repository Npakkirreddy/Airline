<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" import="java.util.*, com.airline.model.Flight" %>
<!DOCTYPE html>
<html>

<head>
    <title>Welcome to Domestic Flights Bookings</title>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="icon" href="images/logo.jpg" type="image/x-icon">
    <!-- Link to external stylesheet if needed -->
    <!-- <link rel="stylesheet" type="text/css" href="css/style.css"> -->
 <style>
	    body 
	    {
	    font-family: Arial, sans-serif;
	    background-color: #f4f4f4;
	    margin: 0;
	    padding: 0;
	    display: flex;
	    flex-direction: column;
	    align-items: center;
	    justify-content: center;
	    min-height: 100vh;
	    color: #333;
	}
	
	h1 {
	    color: #35424a;
	    margin-bottom: 20px;
	    font-size: 2em;
	    text-align: center;
	}
	
	table {
	    width: 100%;
	    max-width: 1200px;
	    border-collapse: collapse;
	    background-color: #ffffff;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    margin: 20px 0;
	}
	
	th, td {
	    padding: 12px;
	    text-align: left;
	    border-bottom: 1px solid #ddd;
	    font-size: 1em;
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
	
	.error {
	    color: #ff0000;
	    font-weight: bold;
	    margin: 20px;
	}
	
	.form-container {
	    background-color: #ffffff;
	    padding: 20px;
	    border-radius: 8px;
	    box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
	    width: 90%;
	    max-width: 500px;
	    margin-bottom: 20px;
	}
	
	label {
	    display: block;
	    margin-bottom: 8px;
	    font-weight: bold;
	}
	
	input[type="text"], input[type="number"], input[type="radio"] {
	    margin-bottom: 12px;
	}
	
	input[type="text"], input[type="number"] {
	    width: calc(100% - 22px);
	    padding: 10px;
	    border: 1px solid #ddd;
	    border-radius: 5px;
	    font-size: 16px;
	}
	
	.radio-group {
	    margin-bottom: 12px;
	}
	
	.radio-group label {
	    display: inline-block;
	    margin-right: 20px;
	}
	
	input[type="submit"] {
	    background-color: #007bff;
	    border: none;
	    color: #ffffff;
	    padding: 10px 20px;
	    font-size: 18px;
	    border-radius: 5px;
	    cursor: pointer;
	    transition: background-color 0.3s, transform 0.3s;
	}
	
	input[type="submit"]:hover {
	    background-color: #0056b3;
	    transform: scale(1.05);
	}
	
	input[type="submit"]:active {
	    background-color: #003d7a;
	    transform: scale(0.98);
	}
	
	.back-home {
	    text-decoration: none;
	    color: #ffffff;
	    font-size: 18px;
	    display: inline-block;
	    padding: 10px 20px;
	    background-color: #28a745;
	    border: 2px solid #28a745;
	    border-radius: 5px;
	    margin-top: 20px;
	    transition: background-color 0.3s, color 0.3s, border-color 0.3s, transform 0.3s;
	}
	
	.back-home:hover {
	    background-color: #218838;
	    border-color: #218838;
	    color: #ffffff;
	    transform: scale(1.05);
	}
	
	.back-home:active {
	    background-color: #1e7e34;
	    border-color: #1e7e34;
	    color: #ffffff;
	    transform: scale(0.98);
	}
	
	/* Responsive Styles */
	@media (max-width: 768px) {
	    h1 {
	        font-size: 1.8em;
	    }
	
	    th, td {
	        padding: 10px;
	        font-size: 0.9em;
	    }
	
	    input[type="submit"], .back-home {
	        font-size: 16px;
	        padding: 8px 16px;
	    }
	
	    .form-container {
	        width: 95%;
	    }
	}
	
	@media (max-width: 480px) {
	    body {
	        padding: 20px;
	    }
	
	    h1 {
	        font-size: 1.5em;
	    }
	
	    table {
	        width: 100%;
	    }
	
	    th, td {
	        padding: 8px;
	        font-size: 0.8em;
	    }
	
	    input[type="submit"], .back-home {
	        font-size: 14px;
	        padding: 8px 12px;
	    }
	
	    .form-container {
	        padding: 15px;
	        width: 100%;
	    }
	}

</style>

</head>

<body>
    <h1>Domestic Flights</h1>

    <% 
        // Check for and display error message if present
        String error = (String) request.getAttribute("error");
        if (error != null) {
            out.println("<p class='error'>" + error + "</p>");
        }

        List<Flight> flights = (List<Flight>) request.getAttribute("flights");
        
        if (flights != null && !flights.isEmpty()) {
    %>
        <table>
            <thead>
                <tr>
                    <th>Flight ID</th>
                    <th>Source City</th>
                    <th>Destination City</th>
                    <th>Departure Time</th>
                    <th>Arrival Time</th>
                    <th>Economy Fare</th>
                    <th>Business Fare</th>
                    <th>Seats Available</th>
                </tr>
            </thead>
            <tbody>
                <% 
                    // Iterate through flights and display them
                    for (Flight flight : flights) {
                %>
                    <tr>
                        <td><%= flight.getFlightId() %></td>
                        <td><%= flight.getSourceCity() %></td>
                        <td><%= flight.getDestinationCity() %></td>
                        <td><%= flight.getDepartureTime() %></td>
                        <td><%= flight.getArrivalTime() %></td>
                        <td><%= flight.getEconomyFare() %></td>
                        <td><%= flight.getBusinessFare() %></td>
                        <td><%= flight.getSeatsAvailable() %></td>
                        <td><a id="aa" href="jsp/domestic_booking.jsp?flightId=<%= flight.getFlightId() %>&source_city=<%= flight.getSourceCity() %>&destination_city=<%= flight.getDestinationCity() %>&a=<%= true %>">Book</a>
</td>
                    </tr>
                <% 
                    }
                %>
            </tbody>
        </table>
    <% 
        } else {
            out.println("<p>No flights available.</p>");
        }
    %>

   
    
    <a href="index.jsp" class="back-home">Home</a>
</body>

</html>
