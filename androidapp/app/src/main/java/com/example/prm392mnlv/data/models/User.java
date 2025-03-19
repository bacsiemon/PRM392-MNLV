package com.example.prm392mnlv.data.models;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

public class User {
    private String name;
    private String email;
    private String phoneNumber;
    private String shippingAddress;

    @NonNull
    public String getName() {
        return name;
    }

    public void setName(@NonNull String name) {
        this.name = name;
    }

    @NonNull
    public String getEmail() {
        return email;
    }

    public void setEmail(@NonNull String email) {
        this.email = email;
    }

    @NonNull
    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(@NonNull String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    @Nullable
    public String getShippingAddress() {
        return shippingAddress;
    }

    public void setShippingAddress(@Nullable String shippingAddress) {
        this.shippingAddress = shippingAddress;
    }
}
