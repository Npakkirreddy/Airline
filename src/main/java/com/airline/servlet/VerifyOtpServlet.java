package com.airline.servlet;

// VerifyOtpServlet.java
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

@WebServlet("/VerifyOtpServlet")
public class VerifyOtpServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String enteredOtp = request.getParameter("otp");
        HttpSession session = request.getSession();
        String email = (String) session.getAttribute("email"); // You can carry this from the previous page/session
        
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            con = DriverManager.getConnection("jdbc:mysql://localhost:3306/mydatabase", "root", "Pakkir@123");

            // Validate OTP and check expiration_
            String hass_otp=null;
            try {
				 hass_otp = hashOtp(enteredOtp);
			} catch (NoSuchAlgorithmException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
            String query = "SELECT * FROM userdetails WHERE uemail=? AND otp=? AND otp_expiration > NOW()";
            ps = con.prepareStatement(query);
            ps.setString(1, email);
            ps.setString(2, hass_otp);
            rs = ps.executeQuery();

            if (rs.next()) {
                // OTP is valid, redirect to password reset page
                response.sendRedirect("jsp/password_reset.jsp" );
            } else {
                response.getWriter().println("Invalid or expired OTP!");
            }

        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            try { rs.close(); ps.close(); con.close(); } catch (Exception e) { e.printStackTrace(); }
        }
    }
    private String hashOtp(String otp) throws NoSuchAlgorithmException {
        MessageDigest md = MessageDigest.getInstance("SHA-256");
        
        byte[] hashedBytes = md.digest(otp.getBytes());
        return Base64.getEncoder().encodeToString(hashedBytes); // Convert to Base64 encoded string
    }
}