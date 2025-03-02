package com.example.prm392mnlv.models;

import androidx.annotation.NonNull;

import com.example.prm392mnlv.utils.ThrowHelper;

import java.math.BigDecimal;

public class CartItem extends ModelBase {
    private String userId;
    private Product product;
    private BigDecimal unitPrice;
    private int quantity;

    @NonNull
    public String getUserId() {
        return userId;
    }

    private void setUserId(@NonNull String userId) {
        this.userId = userId;
    }

    @NonNull
    public Product getProduct() {
        return product;
    }

    private void setProduct(@NonNull Product product) {
        this.product = product;
    }

    @NonNull
    public BigDecimal getUnitPrice() {
        return unitPrice;
    }

    private void setUnitPrice(@NonNull BigDecimal unitPrice) {
        this.unitPrice = unitPrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public static class Builder extends ModelBase.Builder<CartItem, Builder> {

        public Builder() {
            super(new CartItem());
        }

        public Builder withUserId(@NonNull String userId) {
            mModel.setUserId(userId);
            return this;
        }

        public Builder withProduct(@NonNull Product product) {
            mModel.setProduct(product);
            return this;
        }

        public Builder withUnitPrice(@NonNull BigDecimal unitPrice) {
            mModel.setUnitPrice(unitPrice);
            return this;
        }

        public Builder withQuantity(int quantity) {
            mModel.setQuantity(quantity);
            return this;
        }

        @Override
        public CartItem build() {
            if (mModel.userId == null || mModel.userId.isBlank()) {
                ThrowHelper.throwNullOrBlank(mModel, "userId");
            }
            if (mModel.product == null) {
                ThrowHelper.throwNullOrBlank(mModel, "product");
            }
            if (mModel.unitPrice == null) {
                ThrowHelper.throwNullOrBlank(mModel, "unitPrice");
            }
            return super.build();
        }
    }

}
