package com.example.prm392mnlv.data.dto.request;

import androidx.annotation.NonNull;

public class RefreshTokenRequest {
    public final @NonNull String refreshToken;

    public RefreshTokenRequest(@NonNull String refreshToken) {this.refreshToken = refreshToken;}
}
