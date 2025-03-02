package com.example.prm392mnlv.models;

import androidx.annotation.NonNull;

import com.example.prm392mnlv.utils.ThrowHelper;

import java.math.BigDecimal;

public class Product extends ModelBase {
    private String productName;
    private String description;
    private BigDecimal price;
    private int quantityInStock;
    private String imageUrl;
    private Category category;

    @NonNull
    public String getProductName() {
        return productName;
    }

    public void setProductName(@NonNull String productName) {
        this.productName = productName;
    }

    @NonNull
    public String getDescription() {
        return description;
    }

    public void setDescription(@NonNull String description) {
        this.description = description;
    }

    @NonNull
    public BigDecimal getPrice() {
        return price;
    }

    public void setPrice(@NonNull BigDecimal price) {
        this.price = price;
    }

    public int getQuantityInStock() {
        return quantityInStock;
    }

    public void setQuantityInStock(int quantityInStock) {
        this.quantityInStock = quantityInStock;
    }

    @NonNull
    public String getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(@NonNull String imageUrl) {
        this.imageUrl = imageUrl;
    }

    @NonNull
    public Category getCategory() {
        return category;
    }

    public void setCategory(@NonNull Category category) {
        this.category = category;
    }

    public static class Builder extends ModelBase.Builder<Product, Builder> {

        protected Builder() {
            super(new Product());
        }

        public Builder withProductName(@NonNull String productName) {
            mModel.setProductName(productName);
            return this;
        }

        public Builder withDescription(@NonNull String description) {
            mModel.setDescription(description);
            return this;
        }

        public Builder withPrice(@NonNull BigDecimal price) {
            mModel.setPrice(price);
            return this;
        }

        public Builder withQuantityInStock(int quantityInStock) {
            mModel.setQuantityInStock(quantityInStock);
            return this;
        }

        public Builder withImageUrl(@NonNull String imageUrl) {
            mModel.setImageUrl(imageUrl);
            return this;
        }

        @Override
        public Product build() {
            if (mModel.productName == null || mModel.productName.isBlank()) {
                ThrowHelper.throwNullOrBlank(mModel, "productName");
            }
            if (mModel.description == null || mModel.description.isBlank()) {
                ThrowHelper.throwNullOrBlank(mModel, "description");
            }
            if (mModel.price == null || mModel.price.compareTo(BigDecimal.ZERO) < 0) {
                ThrowHelper.throwMustBeNonNegative(mModel, "unitPrice");
            }
            if (mModel.quantityInStock < 0) {
                ThrowHelper.throwMustBeNonNegative(mModel, "quantityInStock");
            }
            if (mModel.imageUrl == null || mModel.imageUrl.isBlank()) {
                ThrowHelper.throwNullOrBlank(mModel, "imageUrl");
            }
            return super.build();
        }
    }
}
