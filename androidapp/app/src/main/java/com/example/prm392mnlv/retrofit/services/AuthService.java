package com.example.prm392mnlv.retrofit.services;


import com.example.prm392mnlv.data.dto.request.LoginRequest;
import com.example.prm392mnlv.data.dto.request.RefreshTokenRequest;
import com.example.prm392mnlv.data.dto.request.RegisterConfirmationRequest;
import com.example.prm392mnlv.data.dto.request.RegisterRequest;
import com.example.prm392mnlv.data.dto.request.ResendOtpRequest;
import com.example.prm392mnlv.data.dto.response.LoginResponse;
import com.example.prm392mnlv.data.dto.response.RefreshTokenResponse;
import com.example.prm392mnlv.data.dto.response.MessageResponse;
import com.example.prm392mnlv.retrofit.json.JsonPath;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.PATCH;
import retrofit2.http.POST;

public interface AuthService {
    String SEGMENT = "auth/";
    String TOKEN_REFRESH_ENDPOINT = "/api/auth/refreshtoken";
    @JsonPath("data")
    @POST(SEGMENT + "auth_account")
    Call<LoginResponse> logIn(@Body LoginRequest loginRequest);

    @POST(SEGMENT + "new_account")
    Call<MessageResponse> register(@Body RegisterRequest registerRequest);

    @JsonPath("data")
    @POST(SEGMENT + "refreshtoken")
    Call<RefreshTokenResponse> refreshToken(@Body RefreshTokenRequest refreshTokenRequest);
    @POST(TOKEN_REFRESH_ENDPOINT)
    Call<RefreshTokenResponse> refreshToken(@Body String refreshToken);

    @PATCH(SEGMENT + "confirm_email")
    Call<MessageResponse> confirmEmail(@Body RegisterConfirmationRequest request);

    @PATCH(SEGMENT + "resend_confirmation_email")
    Call<MessageResponse> resendConfirmationEmail(@Body ResendOtpRequest request);
}
