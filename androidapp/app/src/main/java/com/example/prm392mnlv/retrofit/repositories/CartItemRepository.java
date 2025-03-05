package com.example.prm392mnlv.retrofit.repositories;

import androidx.annotation.NonNull;

import com.example.prm392mnlv.dto.request.CartItemCreateRequest;
import com.example.prm392mnlv.dto.request.CartItemUpdateRequest;
import com.example.prm392mnlv.dto.response.CartItemResponse;
import com.example.prm392mnlv.mappings.CartItemMapper;
import com.example.prm392mnlv.models.CartItem;
import com.example.prm392mnlv.retrofit.ApiClient;
import com.example.prm392mnlv.retrofit.services.CartAndOrderService;

import java.util.List;

import retrofit2.Callback;

public class CartItemRepository {
    private static final CartAndOrderService.OrderDetailsStatus IN_CART = CartAndOrderService.OrderDetailsStatus.InCart;

    private final CartAndOrderService mCartService;

    public CartItemRepository() {
        mCartService = ApiClient.getClient().create(CartAndOrderService.class);
    }

    public void getCartItemsAsync(Callback<List<CartItemResponse>> callback) {
        mCartService.getOrderDetails(null, IN_CART, 1, 999)
                .enqueue(callback);
    }

    public void createCartItemAsync(CartItem cartItem, Callback<CartItemResponse> callback) {
        CartItemCreateRequest dto = CartItemMapper.INSTANCE.toCreateRequest(cartItem);
        mCartService.createOrderDetails(dto).enqueue(callback);
    }

    public void updateCartItemAsync(@NonNull String id, CartItem cartItem, Callback<CartItemResponse> callback) {
        CartItemUpdateRequest dto = CartItemMapper.INSTANCE.toUpdateRequest(cartItem);
        mCartService.updateOrderDetails(id, dto).enqueue(callback);
    }

    public void deleteCartItemAsync(@NonNull String id, Callback<Void> callback) {
        mCartService.deleteOrderDetails(id).enqueue(callback);
    }
}
