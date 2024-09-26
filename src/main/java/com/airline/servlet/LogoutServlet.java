package com.airline.servlet;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/logout")
public class LogoutServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Invalidate the session if it exists
    	RequestDispatcher dispatcher = null;
        if (request.getSession(false) == null) {
            request.getSession().invalidate();
        }
        
        // Redirect to the login page or home page
        request.setAttribute("Logout", "s");
        dispatcher = request.getRequestDispatcher("login.jsp");
        dispatcher.forward(request,response);// Adjust this to your actual login page or home page URL
    }
}
