package com.example.prm392mnlv.models;

import android.net.Uri;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;

import java.math.BigDecimal;

public class Product extends ModelBase {
    private String productName;
    private String description;
    private BigDecimal price;
    private int quantityInStock;
    private Uri imageUrl;
    private String categoryId;

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
    public Uri getImageUrl() {
        return imageUrl;
    }

    public void setImageUrl(@NonNull Uri imageUrl) {
        this.imageUrl = imageUrl;
    }

    @NonNull
    public String getCategoryId() {
        return categoryId;
    }


    public void setCategoryId(@NonNull String categoryId) {
        this.categoryId = categoryId;
    }

    @Nullable
    public Category getCategory() {
        return category;
    }

    public void setCategory(@NonNull Category category) {
        this.category = category;
    }
}
