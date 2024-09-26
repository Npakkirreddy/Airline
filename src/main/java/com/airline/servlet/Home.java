package com.airline.servlet;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import com.airline.dao.FlightDAO;
import com.airline.model.Flight;

/**
 * Servlet implementation class Home
 */
@WebServlet("/Home")
public class Home extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		session.setAttribute("a", false);
		String b = request.getParameter("b");
		if(b.equals("true") || b.equals("domestic")) {
		session.setAttribute("sor", request.getParameter("Sor"));
		session.setAttribute("Des", request.getParameter("Des"));
		session.setAttribute("Sel", request.getParameter("Sel"));
		}
		String sor = (String) session.getAttribute("sor");
		String Des = (String) session.getAttribute("Des");
		String Sel = (String) session.getAttribute("Sel");
		 FlightDAO flightDAO = new FlightDAO();
		if(Sel.equals("International")) {
		 List<Flight> flights = null;
			try {
				flights = flightDAO.getInternationalFlights1(sor, Des);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        request.setAttribute("flights", flights);
	        request.getRequestDispatcher("jsp/international_flight.jsp").forward(request, response);
		}
		else {
			List<Flight> flights = null;
			try {
				flights = flightDAO.getDomesticFlights1(sor, Des);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        request.setAttribute("flights", flights);
	        request.getRequestDispatcher("jsp/domestic_flight.jsp").forward(request, response);
		}
			
			
				
			}
		}
	

