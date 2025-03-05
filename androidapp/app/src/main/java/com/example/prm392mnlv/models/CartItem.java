package com.example.prm392mnlv.models;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.math.BigDecimal;

public class CartItem extends ModelBase {
    private String userId;
    private String productId;
    private BigDecimal unitPrice;
    private int quantity;

    private Product product;
    private boolean selected;

    public CartItem() {}

    public CartItem(String id, String userId, String productId, BigDecimal unitPrice, int quantity) {
        setId(id);
        setUserId(userId);
        setProductId(productId);
        setUnitPrice(unitPrice);
        setQuantity(quantity);
    }

    @NonNull
    public String getUserId() {
        return userId;
    }

    public void setUserId(@NonNull String userId) {
        this.userId = userId;
    }

    @NonNull
    public String getProductId() {
        return productId;
    }

    public void setProductId(@NonNull String productId) {
        this.productId = productId;
    }

    @NonNull
    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    public void setUnitPrice(@NonNull BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    @Nullable
    public Product getProduct() {
        return product;
    }

    public void setProduct(@NonNull Product product) {
        this.product = product;
    }

    public boolean isSelected() {
        return selected;
    }

    public void setSelected(boolean selected) {
        this.selected = selected;
    }
}
