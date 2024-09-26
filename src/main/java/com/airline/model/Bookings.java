package com.airline.model;
import java.util.Date;
public class Bookings {

		// TODO Auto-generated method stub
		private int booking_id;
		private	int flight_id;
		private String passenger_name;
		private String seat_class;
		private int num_passengers;
		private Date booking_date;
		private int amount;
		private boolean is_international;
		
		public int getBooking_id() {
			return booking_id;
		}
		public void setBooking_id(int booking_id) {
			this.booking_id = booking_id;
		}
		public int getFlight_id() {
			return flight_id;
		}
		public void setFlight_id(int flight_id) {
			this.flight_id = flight_id;
		}
		public String getPassenger_name() {
			return passenger_name;
		}
		public void setPassenger_name(String passenger_name) {
			this.passenger_name = passenger_name;
		}
		public String getSeat_class() {
			return seat_class;
		}
		public void setSeat_class(String seat_class) {
			this.seat_class = seat_class;
		}
		public int getNum_passengers() {
			return num_passengers;
		}
		public void setNum_passengers(int num_passengers) {
			this.num_passengers = num_passengers;
		}
		public Date getBooking_date() {
			return booking_date;
		}
		public void setBooking_date(Date booking_date) {
			this.booking_date = booking_date;
		}
		public boolean isIs_international() {
			return is_international;
		}
		public void setIs_international(boolean is_international) {
			this.is_international = is_international;
		}
		public int getAmount() {
			return amount;
		}
		public void setAmount(int amount) {
			this.amount = amount;
		}

}

