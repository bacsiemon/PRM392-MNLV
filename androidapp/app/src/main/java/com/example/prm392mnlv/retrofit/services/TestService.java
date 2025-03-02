package com.example.prm392mnlv.retrofit.services;

import com.example.prm392mnlv.models.CartItem;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.Path;

public interface TestService {
    @GET("cart-item")
    Call<List<CartItem>> getCartItems();

    @GET("cart-item/{id}")
    Call<CartItem> getCartItem(@Path("id") int id);

    @POST("cart-item/{id}")
    Call<CartItem> createCartItem(@Path("id") int id, @Body CartItem cartItem);
}
