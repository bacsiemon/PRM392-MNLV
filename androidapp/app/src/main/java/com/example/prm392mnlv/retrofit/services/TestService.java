package com.example.prm392mnlv.retrofit.services;

import com.example.prm392mnlv.dto.response.CartItemResponse;
import com.example.prm392mnlv.dto.response.ProductResponse;
import com.example.prm392mnlv.models.CartItem;
import com.example.prm392mnlv.models.Product;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface TestService {
    @GET("cart-items")
    Call<List<CartItemResponse>> getCartItems();

    @GET("cart-items/{id}")
    Call<CartItemResponse> getCartItem(@Path("id") int id);

    @POST("cart-items/{id}")
    Call<CartItemResponse> createCartItem(@Path("id") int id, @Body CartItem cartItem);

    @GET("products")
    Call<List<ProductResponse>> getProducts();

    @POST("products/{id}")
    Call<ProductResponse> createProduct(@Path("id") int id, @Body Product product);
}
