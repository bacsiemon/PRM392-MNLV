package com.example.prm392mnlv.retrofit.services;

import com.example.prm392mnlv.dto.request.LoginRequest;
import com.example.prm392mnlv.dto.request.RegisterRequest;
import com.example.prm392mnlv.dto.response.LoginResponse;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.POST;

public interface AuthService {
    String PATH_START = "api/";

    @POST(PATH_START + "login")
    Call<LoginResponse> login(@Body LoginRequest loginRequest);

    @POST(PATH_START + "register")
    Call<Void> register(@Body RegisterRequest registerRequest);
}
