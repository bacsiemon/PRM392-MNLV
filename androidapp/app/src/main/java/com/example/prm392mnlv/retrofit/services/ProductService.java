package com.example.prm392mnlv.retrofit.services;

import androidx.annotation.Nullable;

import com.example.prm392mnlv.dto.response.ProductResponse;

import java.util.List;

import retrofit2.Call;
import retrofit2.http.GET;
import retrofit2.http.Query;

public interface ProductService {
    String PATH_START = "api/products/";

    //                      v-- sic --v
    @GET(PATH_START + "getproduct & pagging")
    Call<List<ProductResponse>> getProducts(@Query("id") @Nullable String id,
                                            @Query("productname") @Nullable String productName,
                                            @Query("categoryname") @Nullable String categoryName,
                                            @Query("pageIndex") int pageIndex,
                                            @Query("pageSize") int pageSize);
}
