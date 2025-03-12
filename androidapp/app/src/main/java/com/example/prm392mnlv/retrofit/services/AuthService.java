package com.example.prm392mnlv.retrofit.services;

import com.example.prm392mnlv.dto.request.LoginRequest;
import com.example.prm392mnlv.dto.request.RegisterRequest;
import com.example.prm392mnlv.dto.response.LoginResponse;
import com.example.prm392mnlv.dto.response.RefreshTokenResponse;
import com.example.prm392mnlv.dto.response.RegisterResponse;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.POST;

public interface AuthService {
    String SEGMENT = "auth/";
    String TOKEN_REFRESH_ENDPOINT = SEGMENT + "refreshtoken";

    @POST(SEGMENT + "auth_account")
    Call<LoginResponse> logIn(@Body LoginRequest loginRequest);

    @POST(SEGMENT + "new_account")
    Call<RegisterResponse> register(@Body RegisterRequest registerRequest);

    @POST(TOKEN_REFRESH_ENDPOINT)
    Call<RefreshTokenResponse> refreshToken(@Body String refreshToken);
}
