package com.example.prm392mnlv.retrofit.repositories;

import com.example.prm392mnlv.models.CartItem;
import com.example.prm392mnlv.retrofit.ApiClient;
import com.example.prm392mnlv.retrofit.services.ShopService;
import com.example.prm392mnlv.retrofit.services.TestService;

import java.util.List;

import retrofit2.Callback;

public class CartItemRepository {
    private static final ShopService.OrderDetailsStatus ORDER_DETAILS_STATUS = ShopService.OrderDetailsStatus.InCart;

    private final TestService mShopService;

    public CartItemRepository() {
        mShopService = ApiClient.INSTANCE.getClient().create(TestService.class);
    }

    public void getCartItemsAsync(Callback<List<CartItem>> callback) {
        mShopService.getCartItems().enqueue(callback);
    }
}
