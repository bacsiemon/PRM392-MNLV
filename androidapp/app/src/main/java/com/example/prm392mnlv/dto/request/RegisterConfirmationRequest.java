package com.example.prm392mnlv.dto.request;

public class RegisterConfirmationRequest {
    private String email;
    private String otp;

    public RegisterConfirmationRequest(String otp, String email) {
        this.otp = otp;
        this.email = email;
    }
}
