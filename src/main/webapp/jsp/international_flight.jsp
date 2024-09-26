<%@ page contentType="text/html;charset=UTF-8" language="java" import = "java.util.*" import = "com.airline.model.Flight"%>
<!DOCTYPE html>
<html>
<head>
    <title>International Flights</title>
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
        .logo {
            height: 60px; /* Adjust height as needed */
            margin-right: 20px; /* Space between logo and title */
        }

        /* Flex container for heading and back button */
        .header-container {
            display: flex;
            justify-content: center;
            align-items: center;
            background-color: #333;
            padding: 30px;
            color: white;
            position: relative; /* Allows the back button to be positioned absolutely */
        }

        h1 {
            margin: 0;
            padding: 0;
            text-align: center;
            flex-grow: 1; /* Ensures h1 takes up available space */
        }

        /* Styling for the back button */
        .back-button {
            position: absolute;
            right: 20px; /* Positions the button on the right while the h1 is centered */
        }

        .back-button input {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s, transform 0.3s;
        }

        .back-button input:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
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

        .center-button {
            text-align: center;
            margin: 20px 0;
        }

        a:hover {
            background-color: #0056b3;
            transform: scale(1.05);
        }

        /* Media queries for responsiveness */
        @media (max-width: 768px) {
        	.header-container {
                padding: 20px;
                flex-direction: column; /* Stack header items vertically */
                align-items: center; /* Align items to the start */
            }

            h1 {
                font-size: 20px; /* Adjust font size for tablets */
                text-align: center; /* Center text in tablet view */
                margin-bottom: 10px; /* Add space below heading */
            }
        	
            table, th, td {
                font-size: 14px;
            }

            th, td {
                padding: 8px;
            }

            a, .back-button input {
                font-size: 16px;
                padding: 8px 16px;
            }
        }

        @media (max-width: 480px) {
            .header-container {
                padding: 15px;
            }

            h1 {
                font-size: 18px; /* Adjust font size for smaller screens */
                margin-bottom: 10px; /* Add space below heading */
            }   
            table {
                font-size: 12px;
            }

            th, td {
                padding: 6px;
            }

            a, .back-button input {
                font-size: 14px;
                padding: 6px 12px;
            }
        }

    </style>
</head>

<body>
    <!-- Flex container for the heading and back button -->
    <div class="header-container">
        <h1>International Flights</h1>
        <div class="back-button">
            <form action="index.jsp"> 
                <input type="submit" value="Back">
            </form>
        </div>
    </div>

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
                    <th>Book Now</th>
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
                        <td><a id="aa" href="jsp/international_booking.jsp?flightId=<%= flight.getFlightId() %>&source_city=<%= flight.getSourceCity() %>&destination_city=<%= flight.getDestinationCity() %>">Book</a></td>
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

    <div class="center-button">
        <a href="<%= request.getContextPath() %>/index.jsp">Back to Home</a>
    </div>

</body>
</html>
