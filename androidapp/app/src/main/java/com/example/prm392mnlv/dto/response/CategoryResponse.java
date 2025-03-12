package com.example.prm392mnlv.dto.response;

import androidx.annotation.NonNull;

public class CategoryResponse extends ResponseBase {
    public final @NonNull String categoryName;

    public CategoryResponse(@NonNull String categoryName) {this.categoryName = categoryName;}
}
