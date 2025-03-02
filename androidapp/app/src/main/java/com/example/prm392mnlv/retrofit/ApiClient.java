package com.example.prm392mnlv.retrofit;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public enum ApiClient {
    INSTANCE;

    private static final String MOCK_URL = "https://6713c00e690bf212c75fa0c3.mockapi.io/";
    private static final String DEV_URL = "https://localhost:7286/api/";
    private static final String PROD_URL = "";

    private final Retrofit retrofit = new Retrofit.Builder()
            .baseUrl(DEV_URL)
            .addConverterFactory(GsonConverterFactory.create())
            .build();

    public Retrofit getClient() {
        return retrofit;
    }
}
