package com.airline.servlet;

import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.airline.dao.FlightDAO;
import com.airline.model.Flight;

@WebServlet("/internationalFlight")
public class InternationalFlightServlet extends HttpServlet{
	private static final long serialVersionUID = 1L;
	private FlightDAO flightDAO = new FlightDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
       
        List<Flight> flights = null;
		try {
			flights = flightDAO.getInternationalFlights();
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
        request.setAttribute("flights", flights);
        request.getRequestDispatcher("jsp/international_flight.jsp").forward(request, response);
    }
}
