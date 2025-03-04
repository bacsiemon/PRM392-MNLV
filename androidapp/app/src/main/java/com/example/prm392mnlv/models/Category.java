package com.example.prm392mnlv.models;

import androidx.annotation.NonNull;

public class Category extends ModelBase {
    private String categoryName;

    @NonNull
    public String getCategoryName() {
        return categoryName;
    }

    public void setCategoryName(@NonNull String categoryName) {
        this.categoryName = categoryName;
    }
}
