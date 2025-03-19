package com.example.prm392mnlv.data.models;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import com.example.prm392mnlv.R;

import java.util.Collection;
import java.util.HashMap;
import java.util.Map;

public final class PaymentMethods {
    private static final Map<Integer, PaymentMethod> PAYMENT_METHODS = new HashMap<>() {{
        put(0, new PaymentMethod("Cash on delivery", R.drawable.ic_cash));
        put(1, new PaymentMethod("ZaloPay", R.drawable.zalo));
    }};

    private PaymentMethods() {}

    @Nullable
    public static PaymentMethod get(int id) {
        return PAYMENT_METHODS.getOrDefault(id, null);
    }

    @NonNull
    public static Collection<Integer> getIds() {
        return PAYMENT_METHODS.keySet();
    }

    @NonNull
    public static Collection<PaymentMethod> getMethods() {
        return PAYMENT_METHODS.values();
    }
}
