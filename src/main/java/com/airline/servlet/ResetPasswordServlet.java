package com.airline.servlet;



// ResetPasswordServlet.java
import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.*;
import java.util.Base64;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/ResetPasswordServlet")
public class ResetPasswordServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    	HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email");
        String newPassword = request.getParameter("password");

        Connection con = null;
        PreparedStatement ps = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Pakkir@123");
            
            String hashedPassword = hashPassword(newPassword);
            // Update the password
            String updateQuery = "UPDATE userdetails SET upwd=? WHERE uemail=?";
            ps = con.prepareStatement(updateQuery);
            ps.setString(1, hashedPassword);
            ps.setString(2, email);
            int result = ps.executeUpdate();

            if (result > 0) {
            	request.setAttribute("status", "Reset");
//                response.getWriter().println("Password successfully reset!");
            	request.getRequestDispatcher("login.jsp").forward(request, response);
            } else {
                response.getWriter().println("Password reset failed!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { ps.close(); con.close(); } 
            catch (Exception e) { e.printStackTrace();}
            session.invalidate();
        }
    }
    
    private String hashPassword(String password) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        byte[] hashedBytes = md.digest(password.getBytes());
        return Base64.getEncoder().encodeToString(hashedBytes); // Convert to Base64 encoded string
    }
}