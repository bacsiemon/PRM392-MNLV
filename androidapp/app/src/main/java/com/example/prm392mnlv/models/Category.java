package com.example.prm392mnlv.models;

import androidx.annotation.NonNull;

import com.example.prm392mnlv.utils.ThrowHelper;

public class Category extends ModelBase {
    private String categoryName;

    @NonNull
    public String getCategoryName() {
        return categoryName;
    }

    private void setCategoryName(@NonNull String categoryName) {
        this.categoryName = categoryName;
    }

    public static class Builder extends ModelBase.Builder<Category, Builder> {

        public Builder() {
            super(new Category());
        }

        public Builder withCategoryName(@NonNull String categoryName) {
            mModel.setCategoryName(categoryName);
            return this;
        }

        @Override
        public Category build() {
            if (mModel.categoryName == null || mModel.categoryName.isBlank()) {
                ThrowHelper.throwNullOrBlank(mModel, "name");
            }
            return super.build();
        }
    }
}
