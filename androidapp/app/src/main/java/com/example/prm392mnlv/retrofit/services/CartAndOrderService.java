package com.example.prm392mnlv.retrofit.services;

import androidx.annotation.Nullable;

import com.example.prm392mnlv.dto.request.CartItemCreateRequest;
import com.example.prm392mnlv.dto.request.CartItemUpdateRequest;
import com.example.prm392mnlv.dto.response.CartItemResponse;
import com.google.gson.annotations.SerializedName;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.Body;
import retrofit2.http.DELETE;
import retrofit2.http.GET;
import retrofit2.http.POST;
import retrofit2.http.PUT;
import retrofit2.http.Path;
import retrofit2.http.Query;

public interface CartAndOrderService {
    String PATH_START = "api/orderdetails/";

    @GET(PATH_START + "get_personal_order_detail")
    Call<List<CartItemResponse>> getOrderDetails(@Query("orderId") @Nullable String orderId,
                                                 @Query("orderDetailStatus") @Nullable OrderDetailsStatus orderDetailsStatus,
                                                 @Query("page") int pageIndex,
                                                 @Query("pageSize") int pageSize);

    @POST(PATH_START + "add_to_cart")
    Call<CartItemResponse> createOrderDetails(@Body CartItemCreateRequest cartItemCreateRequest);

    @PUT(PATH_START + "{id}")
    Call<CartItemResponse> updateOrderDetails(@Path("id") String id, @Body CartItemUpdateRequest cartItemUpdateRequest);

    @DELETE(PATH_START + "{id}")
    Call<Void> deleteOrderDetails(@Path("id") String id);

    enum OrderDetailsStatus {
        @SerializedName("InCart")
        InCart,
        @SerializedName("Ordered")
        Ordered,
        @SerializedName("Cancelled")
        Cancelled,
    }
}
