package com.airline.servlet;

import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.airline.dao.BookingDAO;
import com.airline.dao.FlightDAO;
import com.airline.model.Bookings;
import com.airline.util.DatabaseUtil;

@WebServlet("/bookDomesticFlight")
public class DomesticBookingServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private BookingDAO bookingDAO = new BookingDAO();
    private FlightDAO flightDAO = new FlightDAO();
    Bookings b = new Bookings();
    
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	
    	
    	HttpSession session = request.getSession();
        String users =  (String) session.getAttribute("name");
        BigDecimal amount = null;
     
    	int flightId = Integer.parseInt(request.getParameter("flightId").trim());
    	
        String passengerName = request.getParameter("passengerName");
        
        String source_city = request.getParameter("source_city");

        String destination_city = request.getParameter("destination_city");

        String seatClass = request.getParameter("seatClass");

        int numPassengers = Integer.parseInt(request.getParameter("numPassengers"));
        
        boolean isDomestic = Boolean.parseBoolean(request.getParameter("isD"));

        b.setIs_international(!(Boolean.parseBoolean(request.getParameter("isD"))));
        
        try {
			amount = flightDAO.getAmount(seatClass, seatClass.equals("Economy"), flightId);
		} catch (SQLException e) {
			e.printStackTrace();
		}
        BigDecimal paid = amount.multiply(BigDecimal.valueOf(numPassengers));
         
    	 request.setAttribute("flightId", flightId);
    	 request.setAttribute("source_city", source_city);
    	 request.setAttribute("destination_city", destination_city);
         request.setAttribute("passengerName", passengerName);
         request.setAttribute("seatClass", seatClass);
         request.setAttribute("numPassengers", numPassengers);
         request.setAttribute("paid", paid);
         request.setAttribute("isD", isDomestic);
         
         
         // a = true;
         String click = request.getParameter("click");
         if("Confirm".equals(click)) {
        	 
        ResultSet rs = null;
        try {
			Connection con = DatabaseUtil.getConnection();
			PreparedStatement ps = con.prepareStatement("SELECT * FROM domestic_flights");
			rs = ps.executeQuery();
		} catch (SQLException e) {
			e.printStackTrace();
		}
        
        try {
            boolean success = flightDAO.updateSeats(flightId, numPassengers, isDomestic, request, response, rs);
            
            if (success) {
            	
            	success = bookingDAO.bookFlight(flightId, passengerName, seatClass, numPassengers, isDomestic, paid, users);
                if (success) {
                	
                	response.sendRedirect("jsp/BookConfrim.jsp");
                	return;
                    
                } else {
                	request.setAttribute("booking_failed", "booking_failed");
                	request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
                }
            } else {
            	request.setAttribute("booking_failed", "booking_failed");
            	request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
            }
        } catch (SQLException e) {
            e.printStackTrace();
            request.setAttribute("booking_failed", "booking_failed");
            request.getRequestDispatcher("jsp/error.jsp").forward(request, response);
        }
       }else {
    	   request.setAttribute("booking_failed", "booking_failed");
    	   request.getRequestDispatcher("jsp/BookingConfirmation_Domestic.jsp").forward(request, response);
       }
       }
    }

