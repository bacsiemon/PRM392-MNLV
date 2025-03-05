package com.example.prm392mnlv.retrofit.repositories;

import androidx.annotation.Nullable;

import com.example.prm392mnlv.dto.response.ProductResponse;
import com.example.prm392mnlv.retrofit.ApiClient;
import com.example.prm392mnlv.retrofit.services.ProductService;

import java.util.List;

import retrofit2.Callback;

public class ProductRepository {
    private final ProductService mProductService;

    public ProductRepository() {
        mProductService = ApiClient.getClient().create(ProductService.class);
    }

    public void getProducts(@Nullable String id,
                            @Nullable String productName,
                            @Nullable String categoryName,
                            Callback<List<ProductResponse>> callback) {
        mProductService.getProducts(id, productName, categoryName, 1, 999)
                .enqueue(callback);
    }
}
