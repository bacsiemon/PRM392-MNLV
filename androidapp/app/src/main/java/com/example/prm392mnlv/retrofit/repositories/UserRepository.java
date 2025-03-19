package com.example.prm392mnlv.retrofit.repositories;

import com.example.prm392mnlv.data.dto.response.UserProfileResponse;
import com.example.prm392mnlv.retrofit.client.ApiClient;
import com.example.prm392mnlv.retrofit.services.UserService;

import retrofit2.Callback;

public class UserRepository {
    private final UserService mService;

    public UserRepository() {
        mService = ApiClient.getClient().create(UserService.class);
    }

    public void getUserProfile(Callback<UserProfileResponse> callback) {
        mService.getUserProfile().enqueue(callback);
    }
}
