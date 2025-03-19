package com.example.prm392mnlv.data.models;

import android.os.Parcel;
import android.os.Parcelable;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import org.jetbrains.annotations.Contract;

import java.math.BigDecimal;
import java.util.Date;

public class ShippingMethod implements Parcelable {
    private String name;
    private int feeClass;
    private int speedClass;

    private BigDecimal fee;
    private Date deliveryTime;

    public ShippingMethod() {}

    public ShippingMethod(String name, int feeClass, int speedClass) {
        this.name = name;
        this.feeClass = feeClass;
        this.speedClass = speedClass;
    }

    protected ShippingMethod(@NonNull Parcel in) {
        name = in.readString();
        feeClass = in.readInt();
        speedClass = in.readInt();
        fee = (BigDecimal) in.readSerializable();
        deliveryTime = (Date) in.readSerializable();
    }

    public static final Creator<ShippingMethod> CREATOR = new Creator<>() {
        @NonNull
        @Contract("_ -> new")
        @Override
        public ShippingMethod createFromParcel(Parcel in) {
            return new ShippingMethod(in);
        }

        @NonNull
        @Contract(value = "_ -> new", pure = true)
        @Override
        public ShippingMethod[] newArray(int size) {
            return new ShippingMethod[size];
        }
    };

    @Override
    public int describeContents() {
        return 0;
    }

    @Override
    public void writeToParcel(@NonNull Parcel dest, int flags) {
        dest.writeString(name);
        dest.writeInt(feeClass);
        dest.writeInt(speedClass);
        dest.writeSerializable(fee);
        dest.writeSerializable(deliveryTime);
    }

    @NonNull
    public String getName() {
        return name;
    }

    public void setName(@NonNull String name) {
        this.name = name;
    }

    public int getFeeClass() {
        return feeClass;
    }

    public void setFeeClass(int feeClass) {
        this.feeClass = feeClass;
    }

    public int getSpeedClass() {
        return speedClass;
    }

    public void setSpeedClass(int speedClass) {
        this.speedClass = speedClass;
    }

    @Nullable
    public BigDecimal getFee() {
        return fee;
    }

    public void setFee(@Nullable BigDecimal fee) {
        this.fee = fee;
    }

    @Nullable
    public Date getDeliveryTime() {
        return deliveryTime;
    }

    public void setDeliveryTime(@Nullable Date deliveryTime) {
        this.deliveryTime = deliveryTime;
    }
}
