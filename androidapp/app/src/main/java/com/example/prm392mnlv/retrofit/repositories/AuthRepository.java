package com.example.prm392mnlv.retrofit.repositories;

import androidx.annotation.NonNull;

import com.example.prm392mnlv.dto.request.LoginRequest;
import com.example.prm392mnlv.dto.request.RegisterRequest;
import com.example.prm392mnlv.dto.response.LoginResponse;
import com.example.prm392mnlv.retrofit.ApiClient;
import com.example.prm392mnlv.retrofit.services.AuthService;

import retrofit2.Callback;


public class AuthRepository {

    private final AuthService authService;

    public AuthRepository() {
        this.authService = ApiClient.getClient().create(AuthService.class);
    }

    public void login(LoginRequest request, Callback<LoginResponse> callback){
        authService.login(request).enqueue(callback);
    }

    public void register(RegisterRequest request, Callback<Void> callback) {
        authService.register(request).enqueue(callback);
    }

}
