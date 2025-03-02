package com.example.prm392mnlv.models;

import androidx.annotation.NonNull;

public class ModelBase {
    protected String id;

    protected ModelBase() {
        id = "";
    }

    @NonNull
    public String getId() {
        return id;
    }

    private void setId(@NonNull String id) {
        this.id = id;
    }

    /**
     * @noinspection unchecked
     */
    protected static abstract class Builder<
            TModel extends ModelBase,
            TBuilder extends Builder<TModel, TBuilder>> {

        protected final TModel mModel;

        protected Builder(TModel model) {
            mModel = model;
        }

        public TBuilder withId(@NonNull String id) {
            ((ModelBase) mModel).setId(id);
            return (TBuilder) this;
        }

        public TModel build() {
            // > We write model attributes using setters, but read directly.
            // The primary reason is too avoid compiler complaints on null check
            // (i.e., 'expression is always false') due to annotations.
            // > It also makes logical sense, as we want to validate the true, internal state;
            // instead of the possibly-edited public facing one.
            if (mModel.id.isBlank()) {
                throw new IllegalStateException("Model object of type " + mModel.getClass().getCanonicalName() + " cannot be initialized with null, empty, or blank Id.");
            }
            return mModel;
        }
    }
}
