package com.airline.dao;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

import javax.security.auth.message.callback.PrivateKeyCallback.Request;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.catalina.connector.Response;

import com.airline.model.Bookings;
import com.airline.model.Flight;
import com.airline.util.DatabaseUtil;

public class FlightDAO {
    
    public BigDecimal getAmount(String classeb, boolean e, int fd) throws SQLException {
// List<Flight> flights = new ArrayList<>();
    	 String query = "Select * from domestic_flights where flight_id = ?";
    	 try (Connection conn = DatabaseUtil.getConnection();
    			 
                 PreparedStatement ps = conn.prepareStatement(query)){
    		 ps.setInt(1, fd);
    		 
                 ResultSet rs = ps.executeQuery();
                 Flight flight = new Flight();
    	 while (rs.next()) {
             
            
             flight.setEconomyFare(rs.getBigDecimal("economy_fare"));
             flight.setBusinessFare(rs.getBigDecimal("business_fare"));
    
//             flights.add(flight);
         }
    	 if(e) {
    		 return flight.getEconomyFare();
    	 }else {
    		 return flight.getBusinessFare();
    	 }
    	 
    }
    	
    }
    
    public List<Flight> data(String query) throws SQLException {
    	 List<Flight> flights = new ArrayList<>();
    	 
    	 try (Connection conn = DatabaseUtil.getConnection();
                 PreparedStatement ps = conn.prepareStatement(query)){
                 ResultSet rs = ps.executeQuery();
    	 
    	 while (rs.next()) {
             Flight flight = new Flight();
             flight.setFlightId(rs.getInt("flight_id"));
             flight.setSourceCity(rs.getString("source_city"));
             flight.setDestinationCity(rs.getString("destination_city"));
             flight.setDepartureTime(rs.getTimestamp("departure_time"));
             flight.setArrivalTime(rs.getTimestamp("arrival_time"));
             flight.setEconomyFare(rs.getBigDecimal("economy_fare"));
             flight.setBusinessFare(rs.getBigDecimal("business_fare"));
             flight.setSeatsAvailable(rs.getInt("seats_available"));
             flights.add(flight);
         }
    	 return flights;
    }
    }
    
   
    
    public List<Flight> datasd(String query, String s, String d) throws SQLException {
   	 List<Flight> flights = new ArrayList<>();
   	 
   	 try (Connection conn = DatabaseUtil.getConnection();
                PreparedStatement ps = conn.prepareStatement(query)){
   		 		ps.setString(1, s);
   		 		ps.setString(2, d);
                ResultSet rs = ps.executeQuery();
   	 
   	 while (rs.next()) {
            Flight flight = new Flight();
            flight.setFlightId(rs.getInt("flight_id"));
            flight.setSourceCity(rs.getString("source_city"));
            flight.setDestinationCity(rs.getString("destination_city"));
            flight.setDepartureTime(rs.getTimestamp("departure_time"));
            flight.setArrivalTime(rs.getTimestamp("arrival_time"));
            flight.setEconomyFare(rs.getBigDecimal("economy_fare"));
            flight.setBusinessFare(rs.getBigDecimal("business_fare"));
            flight.setSeatsAvailable(rs.getInt("seats_available"));
            flights.add(flight);
        }
   	 return flights;
   }
   }
    public List<Flight> getDomesticFlights() throws SQLException {
    	FlightDAO f = new FlightDAO();
        String query = "SELECT * FROM domestic_flights";
        
        return f.data(query);
                  
        }
        
    
    
    public List<Flight> getDomesticFlights1(String s,String d) throws SQLException {
    	FlightDAO f = new FlightDAO();
        String query = "select * from domestic_flights where source_city = ? and destination_city = ?";
        return f.datasd(query,s,d);
    }


    public List<Flight> getInternationalFlights() throws SQLException {
    	FlightDAO f = new FlightDAO();
        String query = "SELECT * FROM international_flights";
        return f.data(query);
    }
    
    public List<Flight> getInternationalFlights1(String s, String d) throws SQLException{
    	FlightDAO f = new FlightDAO();
        String query = "select * from international_flights where source_city = ? and destination_city = ?";
        return f.datasd(query, s, d);
        
    }
    
    public Flight getFlightById(int flightId, boolean isDomestic) throws SQLException {
        Flight flight = null;
        String query = isDomestic ? 
            "SELECT * FROM domestic_flights WHERE flight_id = ?" :
            "SELECT * FROM international_flights WHERE flight_id = ?";

        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, flightId);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    flight = new Flight(
                        rs.getInt("flight_id"),
                        rs.getString("source_city"),
                        rs.getString("destination_city"),
                        rs.getTimestamp("departure_time"),
                        rs.getTimestamp("arrival_time"),
                        rs.getBigDecimal("economy_fare"),
                        rs.getBigDecimal("business_fare"),
                        rs.getInt("seats_available")
                    );
                }
            }
        }
        return flight;
    }

    
    public boolean updateSeats(int flightId, int newSeatsAvailable, boolean isDomestic, HttpServletRequest request, HttpServletResponse response, ResultSet rs) 
    	    throws SQLException, ServletException, IOException {
    	    
    	    // Ensure we move the cursor to the first row of the ResultSet
    	    if (rs.next() && newSeatsAvailable <= rs.getInt("seats_available")) {

    	        String updateSeatsQuery = isDomestic
    	            ? "UPDATE domestic_flights SET seats_available = seats_available - ? WHERE flight_id = ?"
    	            : "UPDATE international_flights SET seats_available = seats_available - ? WHERE flight_id = ?";
    	        
    	        try (Connection conn = DatabaseUtil.getConnection()) {
    	            
    	            // Execute the seats update query
    	            try (PreparedStatement ps1 = conn.prepareStatement(updateSeatsQuery)) {
    	                ps1.setInt(1, newSeatsAvailable);
    	                ps1.setInt(2, flightId);
    	                int updatedRows = ps1.executeUpdate();
    	                
    	                if (updatedRows > 0) {
    	                    return true; // Seats successfully updated
    	                } else {
    	                    // Handle case where no rows were updated
    	                    request.setAttribute("status", "failed");
    	                    request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
    	                    return false;
    	                }
    	            }

    	        } catch (SQLException e) {
    	            // Log and rethrow the exception for higher-level handling
    	            e.printStackTrace();
    	            throw e;
    	        }

    	    } else {
    	        // Handle case where requested seats exceed available seats
    	        request.setAttribute("status", "failed");
    	        request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
    	        return false;
    	    }
    	}

    
    public List<Bookings> datab(String query, String users) throws SQLException {
      	 List<Bookings> book = new ArrayList<>();
      	 
      	 
      	 
      	 try (Connection conn = DatabaseUtil.getConnection();
                   PreparedStatement ps = conn.prepareStatement(query)){
      		 	   ps.setString(1, users);
                   ResultSet rs = ps.executeQuery();
      	 
      	 while (rs.next()) {
      		 	Bookings b = new Bookings();
               b.setBooking_id(rs.getInt("Booking_id"));
               b.setFlight_id(rs.getInt("flight_id"));
               b.setPassenger_name(rs.getString("passenger_name"));
               b.setSeat_class(rs.getString("seat_class"));
               b.setNum_passengers(rs.getInt("num_passengers"));
               b.setBooking_date(rs.getDate("booking_date"));
               b.setAmount(rs.getInt("paid"));
               b.setIs_international(rs.getBoolean("is_international"));
               book.add(b);
           }
      	 return book;
      }
      }

}
