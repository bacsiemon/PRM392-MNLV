package com.example.prm392mnlv.dto.response;

import androidx.annotation.NonNull;

public class CartItemResponse extends ResponseBase {
    public final @NonNull String productId;
    public final double unitPrice;
    public final int quantity;

    public CartItemResponse(@NonNull String productId, double unitPrice, int quantity) {
        this.productId = productId;
        this.unitPrice = unitPrice;
        this.quantity = quantity;
    }
}
