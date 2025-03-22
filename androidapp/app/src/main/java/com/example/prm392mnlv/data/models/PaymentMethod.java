package com.example.prm392mnlv.data.models;

import androidx.annotation.DrawableRes;
import androidx.annotation.NonNull;

public class PaymentMethod {
    private String name;
    private @DrawableRes int icon;

    public PaymentMethod() {}

    public PaymentMethod(@NonNull String name, @DrawableRes int icon) {
        this.name = name;
        this.icon = icon;
    }

    @NonNull
    public String getName() {
        return name;
    }

    public void setName(@NonNull String name) {
        this.name = name;
    }

    public int getIcon() {
        return icon;
    }

    public void setIcon(int icon) {
        this.icon = icon;
    }
}
