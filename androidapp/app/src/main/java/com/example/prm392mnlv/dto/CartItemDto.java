package com.example.prm392mnlv.dto;

import androidx.annotation.Nullable;

public class CartItemDto extends DtoBase {
    private String productId;
    private double unitPrice;
    private int quantity;

    @Nullable
    public String getProductId() {
        return productId;
    }

    public double getUnitPrice() {
        return unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }
}
