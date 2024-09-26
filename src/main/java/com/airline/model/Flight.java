package com.airline.model;

import java.math.BigDecimal;
import java.util.Date;

public class Flight {
    private int flightId;
    private String sourceCity;
    private String destinationCity;
    private Date departureTime;
    private Date arrivalTime;
    private BigDecimal economyFare;
    private BigDecimal businessFare;
    private int seatsAvailable;

    public Flight(int flightId, String sourceCity, String destinationCity, Date departureTime, Date arrivalTime, BigDecimal economyFare, BigDecimal businessFare, int seatsAvailable) {
        this.flightId = flightId;
        this.sourceCity = sourceCity;
        this.destinationCity = destinationCity;
        this.departureTime = departureTime;
        this.arrivalTime = arrivalTime;
        this.economyFare = economyFare;
        this.businessFare = businessFare;
        this.seatsAvailable = seatsAvailable;
    }

    // Getters and setters for all fields

    public Flight() {
		// TODO Auto-generated constructor stub
	}

	public int getFlightId() {
        return flightId;
    }

    public void setFlightId(int flightId) {
        this.flightId = flightId;
    }

    public String getSourceCity() {
        return sourceCity;
    }

    public void setSourceCity(String sourceCity) {
        this.sourceCity = sourceCity;
    }

    public String getDestinationCity() {
        return destinationCity;
    }

    public void setDestinationCity(String destinationCity) {
        this.destinationCity = destinationCity;
    }

    public Date getDepartureTime() {
        return departureTime;
    }

    public void setDepartureTime(Date departureTime) {
        this.departureTime = departureTime;
    }

    public Date getArrivalTime() {
        return arrivalTime;
    }

    public void setArrivalTime(Date arrivalTime) {
        this.arrivalTime = arrivalTime;
    }

    public BigDecimal getEconomyFare() {
        return economyFare;
    }

    public void setEconomyFare(BigDecimal economyFare) {
        this.economyFare = economyFare;
    }

    public BigDecimal getBusinessFare() {
        return businessFare;
    }

    public void setBusinessFare(BigDecimal businessFare) {
        this.businessFare = businessFare;
    }

    public int getSeatsAvailable() {
        return seatsAvailable;
    }

    public void setSeatsAvailable(int seatsAvailable) {
        this.seatsAvailable = seatsAvailable;
    }
}
