package com.example.prm392mnlv.models;

import androidx.annotation.NonNull;

public abstract class ModelBase {
    private String id;

    @NonNull
    public String getId() {
        return id;
    }

    public void setId(@NonNull String id) {
        this.id = id;
    }
}
