package com.example.prm392mnlv.dto.response;

public class CartItemResponse extends ResponseBase {
    private String productId;
    private double unitPrice;
    private int quantity;

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
