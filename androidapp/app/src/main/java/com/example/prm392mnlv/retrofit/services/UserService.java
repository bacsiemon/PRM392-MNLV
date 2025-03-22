package com.example.prm392mnlv.retrofit.services;

import com.example.prm392mnlv.data.dto.response.UserProfileResponse;
import com.example.prm392mnlv.retrofit.json.JsonPath;

import retrofit2.Call;
import retrofit2.http.GET;

public interface UserService {
    String SEGMENT = "users/";

    @JsonPath("data")
    @GET(SEGMENT + "profile")
    Call<UserProfileResponse> getUserProfile();
}
