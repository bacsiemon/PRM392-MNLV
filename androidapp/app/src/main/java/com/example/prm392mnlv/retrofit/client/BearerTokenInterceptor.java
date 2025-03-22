package com.example.prm392mnlv.retrofit.client;

import androidx.annotation.NonNull;

import com.example.prm392mnlv.stores.TokenManager;

import java.io.IOException;

import okhttp3.Interceptor;
import okhttp3.Request;
import okhttp3.Response;

public class BearerTokenInterceptor implements Interceptor {
    @NonNull
    @Override
    public Response intercept(@NonNull Chain chain) throws IOException {
        String accessToken = TokenManager.INSTANCE.getToken(TokenManager.ACCESS_TOKEN);
        if (accessToken.isEmpty()) {
            return chain.proceed(chain.request());
        }

        Request request = chain.request().newBuilder()
                .addHeader("Authorization", "Bearer " + accessToken)
                .build();
        return chain.proceed(request);
    }
}
