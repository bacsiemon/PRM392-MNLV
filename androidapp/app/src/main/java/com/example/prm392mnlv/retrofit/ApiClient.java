package com.example.prm392mnlv.retrofit;

import com.google.gson.GsonBuilder;

import retrofit2.Retrofit;
import retrofit2.converter.gson.GsonConverterFactory;

public class ApiClient {
    private static final String MOCK_URL = "https://6713c00e690bf212c75fa0c3.mockapi.io/";
    private static final String MOCK_URL_hieu = "https://67d0ff7c825945773eb29ba8.mockapi.io/";
    private static final String DEV_URL = "https://localhost:7286/api/";
    private static final String PROD_URL = "";

    private static final Retrofit retrofit = new Retrofit.Builder()
            .baseUrl(MOCK_URL_hieu)
            .addConverterFactory(GsonConverterFactory.create(
                    new GsonBuilder()
//                            .setFieldNamingPolicy(FieldNamingPolicy.UPPER_CAMEL_CASE)
                            .create()))
            .build();

    public static Retrofit getClient() {
        return retrofit;
    }
}
