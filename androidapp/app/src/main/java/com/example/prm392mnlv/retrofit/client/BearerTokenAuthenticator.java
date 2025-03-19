package com.example.prm392mnlv.retrofit.client;

import android.util.Log;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.prm392mnlv.data.dto.request.RefreshTokenRequest;
import com.example.prm392mnlv.data.dto.response.RefreshTokenResponse;
import com.example.prm392mnlv.retrofit.services.AuthService;
import com.example.prm392mnlv.stores.TokenManager;

import java.io.IOException;
import java.util.List;

import okhttp3.Authenticator;
import okhttp3.Challenge;
import okhttp3.Request;
import okhttp3.Response;
import okhttp3.Route;

public class BearerTokenAuthenticator implements Authenticator {
    private static final String TAG = "BearerAuth";

    private static final String TOKEN_REFRESH_ENDPOINT = "/api/auth/refreshtoken";
    private static final int MAX_RETRIES = 1;

    private AuthService mAuthService;

    @Nullable
    @Override
    public Request authenticate(Route route, @NonNull Response response) {
        if (response.request().url().encodedPath().equals(TOKEN_REFRESH_ENDPOINT)) {
            // We're on the secondary request chain, attempting to refresh our access token.
            // The server somehow returned a 401. Bail now rather than loop to retry limit.
            return null;
        }

        // Check whether our access token expired, or we simply haven't signed in.
        if (response.request().header("Authorization") == null) {
            // We haven't signed in.
            return quit();
        }

        // We'd successfully refreshed the token, but somehow still failed to authenticate.
        if (retryCount(response) > MAX_RETRIES) {
            return quit();
        }

        List<Challenge> challenges = response.challenges();
        if (challenges.isEmpty() || !hasBearerChallenge(challenges)) {
            return quit();
        }

        String refreshToken = TokenManager.INSTANCE.getToken(TokenManager.REFRESH_TOKEN);
        if (refreshToken.isEmpty()) {
            return quit();
        }

        String newAccessToken = refreshToken(refreshToken);
        if (newAccessToken == null) {
            return quit();
        }

        return response.request().newBuilder()
                .header("Authorization", "Bearer " + newAccessToken)
                .build();
    }

    private int retryCount(@NonNull Response response) {
        int count = 0;
        while ((response = response.priorResponse()) != null) {
            ++count;
        }
        return count;
    }

    private boolean hasBearerChallenge(@NonNull List<Challenge> challenges) {
        return challenges.stream().anyMatch(challenge -> "Bearer".equalsIgnoreCase(challenge.scheme()));
    }

    @Nullable
    private Request quit() {
        //TODO: Decide whether to give up or redirect to login.
        return null;
    }

    @Nullable
    private String refreshToken(String refreshToken) {
        if (mAuthService == null) {
            mAuthService = ApiClient.getClient().create(AuthService.class);
        }

        try {
            RefreshTokenRequest req = new RefreshTokenRequest(refreshToken);
            retrofit2.Response<RefreshTokenResponse> response = mAuthService.refreshToken(req).execute();
            if (!response.isSuccessful()) {
                return null;
            }

            RefreshTokenResponse refTknResponse = response.body();
            assert refTknResponse != null;
            boolean accTknSaved = TokenManager.INSTANCE.setToken(TokenManager.ACCESS_TOKEN, refTknResponse.accessToken);
            boolean refTknSaved = TokenManager.INSTANCE.setToken(TokenManager.REFRESH_TOKEN, refTknResponse.refreshToken);

            if (!accTknSaved) {
                // Save the refresh token anyway. We'll need it quite soon.
                Log.wtf(TAG, "Failed to save access token!");
                return null;
            }
            if (!refTknSaved) {
                // Save the access token anyway. Maybe the user will log off in a few minutes...
                Log.wtf(TAG, "Failed to save refresh token!");
            }

            return refTknResponse.accessToken;
        } catch (IOException e) {
            return null;
        }
    }
}
