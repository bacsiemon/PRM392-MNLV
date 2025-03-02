package com.example.prm392mnlv.retrofit.services;

import com.example.prm392mnlv.dto.CartItemDto;
import com.google.gson.annotations.SerializedName;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

public interface ShopService {
    @GET("Get_personal_order_detail")
    Call<List<CartItemDto>> getOrderDetails(@Query("orderId") String orderId,
                                            @Query("orderDetailStatus") OrderDetailsStatus orderDetailsStatus,
                                            @Query("page") int pageIndex,
                                            @Query("pageSize") int pageSize);

    public static enum OrderDetailsStatus {
        @SerializedName("InCart")
        InCart,
        @SerializedName("Ordered")
        Ordered,
        @SerializedName("Cancelled")
        Cancelled,
    }
}
