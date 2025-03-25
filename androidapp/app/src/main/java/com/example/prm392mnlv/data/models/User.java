package com.example.prm392mnlv.data.models;

import android.os.Parcel;
import android.os.Parcelable;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.jetbrains.annotations.Contract;

public class User implements Parcelable {
    private String name;
    private String email;
    private String phoneNumber;
    private String shippingAddress;

    public User() {}

    protected User(@NonNull Parcel in) {
        name = in.readString();
        email = in.readString();
        phoneNumber = in.readString();
        shippingAddress = in.readString();
    }

    public static final Creator<User> CREATOR = new Creator<>() {
        @NonNull
        @Contract("_ -> new")
        @Override
        public User createFromParcel(Parcel in) {
            return new User(in);
        }

        @NonNull
        @Contract(value = "_ -> new", pure = true)
        @Override
        public User[] newArray(int size) {
            return new User[size];
        }
    };

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(@NonNull Parcel dest, int flags) {
        dest.writeString(name);
        dest.writeString(email);
        dest.writeString(phoneNumber);
        dest.writeString(shippingAddress);
    }

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
