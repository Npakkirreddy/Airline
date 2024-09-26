package com.airline.servlet;

import java.io.IOException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.Base64;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

@WebServlet("/forgot")
public class Forgot_servlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database connection details
    private static final String DB_URL = "jdbc:mysql://localhost:3306/mydatabase"; // Replace with your database URL
    private static final String DB_USER = "root"; // Replace with your database username
    private static final String DB_PASSWORD = "Pakkir@123"; // Replace with your database password

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get email and new password from request
        String email = request.getParameter("email");
        String newPassword = request.getParameter("password");
        RequestDispatcher dispatcher = null;
        
        if (email != null && !email.trim().isEmpty() && newPassword != null && !newPassword.trim().isEmpty()) {
            Connection conn = null;
            PreparedStatement pstmt = null;
            try {
                // Load database driver
                Class.forName("com.mysql.cj.jdbc.Driver");
                
                // Hash the new password
                String hashedPassword = hashPassword(newPassword);
                
                // Establish connection
                conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);
                
                // SQL query to update the password
                String sql = "UPDATE userdetails SET upwd = ? WHERE email = ?";
                pstmt = conn.prepareStatement(sql);
                
                // Set parameters
                pstmt.setString(1, hashedPassword);
                pstmt.setString(2, email);
                
                // Execute update
                int rowsAffected = pstmt.executeUpdate();
                
                if (rowsAffected > 0) {
                	request.setAttribute("status", "okay");
                	dispatcher = request.getRequestDispatcher("login.jsp");
    				dispatcher.forward(request, response);// Redirect to login page with success status
                } else {
                    response.sendRedirect("ForgotPassword.jsp"); // Redirect with error status
                }
            } catch (ClassNotFoundException | SQLException e) {
                e.printStackTrace();
                response.sendRedirect("ForgotPassword.jsp"); // Redirect with error status
            } finally {
                // Close resources
                if (pstmt != null) {
                    try {
                        pstmt.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
                if (conn != null) {
                    try {
                        conn.close();
                    } catch (SQLException e) {
                        e.printStackTrace();
                    }
                }
            }
        } else {
            response.sendRedirect("ForgotPassword.jsp"); // Redirect with error status
        }
    }
    
    // Method to hash the password using SHA-256
    private String hashPassword(String password) {
        try {
            MessageDigest md = MessageDigest.getInstance("SHA-256");
            byte[] hashBytes = md.digest(password.getBytes());
            return Base64.getEncoder().encodeToString(hashBytes);
        } catch (NoSuchAlgorithmException e) {
            throw new RuntimeException("Error hashing password", e);
        }
    }
}