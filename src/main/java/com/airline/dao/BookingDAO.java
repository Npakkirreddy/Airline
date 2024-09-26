package com.airline.dao;

import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import com.airline.util.DatabaseUtil;

public class BookingDAO {

    static {
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    public boolean bookFlight(int flightId, String passengerName, String seatClass, int numPassengers, boolean isDomestic, BigDecimal amount, String users) throws SQLException {
        String query = "INSERT INTO bookings (flight_id, passenger_name, seat_class, num_passengers, booking_date, is_international, paid, user) VALUES (?, ?, ?, ?, NOW(),?,?,?)";
        
        try (Connection conn = DatabaseUtil.getConnection();
             PreparedStatement ps = conn.prepareStatement(query)) {
            ps.setInt(1, flightId);
            ps.setString(2, passengerName);
            ps.setString(3, seatClass);
            ps.setInt(4, numPassengers);
            ps.setBoolean(5, !(isDomestic));
            ps.setBigDecimal(6, amount);
            ps.setString(7, users);

            return ps.executeUpdate() > 0;
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return false;
    }
}
