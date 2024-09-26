package com.airline.util;

//Utility class for generating OTP
public class Otp_util {
 public static String generateOTP() {
     int randomPin = (int) (Math.random() * 900000) + 100000; // 6 digit random number
     return String.valueOf(randomPin);
 }
}
