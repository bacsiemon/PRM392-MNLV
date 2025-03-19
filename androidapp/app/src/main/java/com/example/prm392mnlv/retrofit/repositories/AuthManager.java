package com.example.prm392mnlv.retrofit.repositories;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.prm392mnlv.data.dto.request.LoginRequest;
import com.example.prm392mnlv.data.dto.request.RegisterRequest;
import com.example.prm392mnlv.data.dto.response.LoginResponse;
import com.example.prm392mnlv.data.dto.response.MessageResponse;
import com.example.prm392mnlv.retrofit.client.ApiClient;
import com.example.prm392mnlv.retrofit.services.AuthService;

import retrofit2.Callback;

public class AuthManager {
    private final AuthService mAuthService;

    public AuthManager() {
        mAuthService = ApiClient.getClient().create(AuthService.class);
    }

    public void login(@NonNull String email, @NonNull String password, Callback<LoginResponse> callback) {
        LoginRequest loginRequest = new LoginRequest(email, password);
        mAuthService.logIn(loginRequest).enqueue(callback);
    }

    public void register(@NonNull String name, @NonNull String email, @Nullable String phoneNumber, @NonNull String password, Callback<MessageResponse> callback) {
        RegisterRequest registerRequest = new RegisterRequest(name, email, phoneNumber, password);
        mAuthService.register(registerRequest).enqueue(callback);
    }

    public void confirmEmail(RegisterConfirmationRequest request, Callback<Void> callback){
        mAuthService.confirmEmail(request).enqueue(callback);
    }

    public void resendConfirmationEmail(String email, Callback<Void> callback){
        mAuthService.resendConfirmationEmail(email).enqueue(callback);
    }
}
