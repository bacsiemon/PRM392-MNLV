package com.example.prm392mnlv.adapters;

import android.content.Context;
import android.graphics.Paint;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.models.CartItem;
import com.example.prm392mnlv.models.Product;

import java.math.BigDecimal;
import java.text.NumberFormat;
import java.util.List;
import java.util.Locale;

public class CartItemAdapter extends RecyclerView.Adapter<CartItemAdapter.CartItemHolder> {
    private final List<CartItem> mItems;

    public interface CartItemChangeListener {

        void onCartItemCheckChanged(int position, boolean checked);

        void onCartItemQuantityChanged(int position, int delta);

        void onCartItemDeleted(int position);
    }

    public CartItemAdapter(List<CartItem> items) {
        mItems = items;
    }

    @NonNull
    @Override
    public CartItemHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        Context context = parent.getContext();
        LayoutInflater inflater = LayoutInflater.from(context);
        View view = inflater.inflate(R.layout.card_cart_item, parent, false);
        return new CartItemHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull CartItemHolder holder, int position) {
        CartItem item = mItems.get(position);

        holder.mCbSelectItem.setChecked(item.isSelected());

//        assert item.getProduct() != null;
//        holder.mIvProductImage.setImageURI(item.getProduct().getImageUrl());
        holder.mIvProductImage.setImageResource(R.drawable.placeholder_product);

        String productName = "PRODUCT NAME";
        String categoryName = "CATEGORY";
        if (item.getProduct() != null) {
            Product product = item.getProduct();
            productName = product.getProductName();
            if (product.getCategory() != null) {
                categoryName = product.getCategory().getCategoryName();
            }
        }
        holder.mTvProductName.setText(productName);
        holder.mTvCategory.setText(categoryName);

        if (item.getProduct().getQuantityInStock() <= 0) {
            holder.mSpnVariant.setVisibility(View.GONE);
            holder.mLytPrices.setVisibility(View.GONE);
            holder.mLytQuantities.setVisibility(View.GONE);

            holder.mTvOutOfStock.setText(R.string.out_of_stock);
            holder.mTvOutOfStock.setVisibility(View.VISIBLE);
            return;
        }

        //TODO: Dialog Spinner

        Locale locale = Locale.forLanguageTag("vi-VN");
        NumberFormat formatter = NumberFormat.getCurrencyInstance(locale);
        formatter.setMaximumFractionDigits(0);

        String unitPrice = formatter.format(item.getUnitPrice());
        holder.mTvPrice.setText(unitPrice);

        BigDecimal fakeOriginalPrice = item.getUnitPrice().multiply(BigDecimal.valueOf(1.25));
        String originalPrice = formatter.format(fakeOriginalPrice);
        holder.mTvOriginalPrice.setText(originalPrice);
        holder.mTvOriginalPrice.setPaintFlags(holder.mTvOriginalPrice.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);

        holder.mTvQuantity.setText(String.valueOf(item.getQuantity()));
    }

    @Override
    public int getItemCount() {
        return mItems.size();
    }

    public static class CartItemHolder extends RecyclerView.ViewHolder {
        private final CheckBox mCbSelectItem;
        private final ImageView mIvProductImage;
        private final TextView mTvProductName;
        private final TextView mTvCategory;
        private final Spinner mSpnVariant;
        private final TextView mTvPrice;
        private final TextView mTvOriginalPrice;
        private final TextView mTvQuantity;
        private final ImageButton mBtnDecrease;
        private final ImageButton mBtnIncrease;
        private final TextView mTvOutOfStock;
        private final ViewGroup mLytPrices;
        private final ViewGroup mLytQuantities;

        public CartItemHolder(@NonNull View itemView) {
            super(itemView);

            mCbSelectItem = itemView.findViewById(R.id.cbSelectItem);
            mIvProductImage = itemView.findViewById(R.id.ivProductImage);
            mTvProductName = itemView.findViewById(R.id.tvProductName);
            mTvCategory = itemView.findViewById(R.id.tvCategory);
            mSpnVariant = itemView.findViewById(R.id.spnVariant);
            mTvPrice = itemView.findViewById(R.id.tvPrice);
            mTvOriginalPrice = itemView.findViewById(R.id.tvOriginalPrice);
            mTvQuantity = itemView.findViewById(R.id.tvQuantity);
            mBtnDecrease = itemView.findViewById(R.id.btnDecrease);
            mBtnIncrease = itemView.findViewById(R.id.btnIncrease);
            mTvOutOfStock = itemView.findViewById(R.id.tvOutOfStock);
            mLytPrices = itemView.findViewById(R.id.lytPrices);
            mLytQuantities = itemView.findViewById(R.id.lytQuantities);

            Context context = itemView.getContext();
            if (!(context instanceof CartItemChangeListener)) {
                throw new IllegalStateException("Context must implement " + CartItemChangeListener.class.getName());
            }
            CartItemChangeListener listener = (CartItemChangeListener) context;

            mCbSelectItem.setOnCheckedChangeListener((btn, checked) -> listener.onCartItemCheckChanged(getBindingAdapterPosition(), checked));
            mBtnDecrease.setOnClickListener(v -> listener.onCartItemQuantityChanged(getBindingAdapterPosition(), -1));
            mBtnIncrease.setOnClickListener(v -> listener.onCartItemQuantityChanged(getBindingAdapterPosition(), +1));
        }
    }
}
