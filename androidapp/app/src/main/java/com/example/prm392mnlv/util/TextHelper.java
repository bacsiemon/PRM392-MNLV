package com.example.prm392mnlv.util;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.Locale;

public final class TextHelper {
    private static final NumberFormat formatter;

    static {
        formatter = NumberFormat.getCurrencyInstance(Locale.forLanguageTag("vi-VN"));
        formatter.setMaximumFractionDigits(0);
    }

    private TextHelper() {}

    public static String formatPrice(BigDecimal price) {
        return formatter.format(price);
    }
}
