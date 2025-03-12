package com.example.prm392mnlv.retrofit.repositories;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.prm392mnlv.dto.request.LoginRequest;
import com.example.prm392mnlv.dto.request.RegisterRequest;
import com.example.prm392mnlv.dto.response.LoginResponse;
import com.example.prm392mnlv.dto.response.RegisterResponse;
import com.example.prm392mnlv.retrofit.clients.ApiClient;
import com.example.prm392mnlv.retrofit.services.AuthService;

import retrofit2.Callback;

public class AuthManager {
    private final AuthService mAuthService;

    public AuthManager() {
        mAuthService = ApiClient.getClient().create(AuthService.class);
    }

    public void logIn(@NonNull String email, @NonNull String password, Callback<LoginResponse> callback) {
        LoginRequest loginRequest = new LoginRequest(email, password);
        mAuthService.logIn(loginRequest).enqueue(callback);
    }

    public void register(@NonNull String name, @NonNull String email, @Nullable String phoneNumber, @NonNull String password, Callback<RegisterResponse> callback) {
        RegisterRequest registerRequest = new RegisterRequest(name, email, phoneNumber, password);
        mAuthService.register(registerRequest).enqueue(callback);
    }
}
