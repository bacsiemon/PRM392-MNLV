package com.example.prm392mnlv.data.dto.response;

import androidx.annotation.NonNull;

public class ProductResponse {
    public final @NonNull String id;
    public final @NonNull String productName;
    public final @NonNull String description;
    public final double price;
    public final int quantityInStock;
    public final @NonNull String imageUrl;
    public final @NonNull String categoryId;

    public ProductResponse(@NonNull String id,
                           @NonNull String productName,
                           @NonNull String description,
                           double price,
                           int quantityInStock,
                           @NonNull String imageUrl,
                           @NonNull String categoryId) {
        this.id = id;
        this.productName = productName;
        this.description = description;
        this.price = price;
        this.quantityInStock = quantityInStock;
        this.imageUrl = imageUrl;
        this.categoryId = categoryId;
    }
}
