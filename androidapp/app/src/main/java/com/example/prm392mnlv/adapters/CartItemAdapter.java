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

import java.util.List;

public class CartItemAdapter extends RecyclerView.Adapter<CartItemAdapter.CartItemHolder> {

    private final List<CartItem> mItems;

    public CartItemAdapter(List<CartItem> mItems) {
        this.mItems = mItems;
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
        // TODO

        holder.mTvOriginalPrice.setPaintFlags(holder.mTvOriginalPrice.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);
    }

    @Override
    public int getItemCount() {
        return mItems.size();
    }

    public class CartItemHolder extends RecyclerView.ViewHolder {

        private final CheckBox mCbSelectItem;
        private final ImageView mIvProductImage;
        private final TextView mTvProductName;
        private final TextView mTvCategory;
        private final Spinner mSpnVariant;
        private final TextView mTvPrice;
        private final TextView mTvOriginalPrice;
        private final ImageButton mBtnDecrease;
        private final ImageButton mBtnIncrease;

        public CartItemHolder(@NonNull View itemView) {
            super(itemView);

            mCbSelectItem = itemView.findViewById(R.id.cbSelectItem);
            mIvProductImage = itemView.findViewById(R.id.ivProductImage);
            mTvProductName = itemView.findViewById(R.id.tvProductName);
            mTvCategory = itemView.findViewById(R.id.tvCategory);
            mSpnVariant = itemView.findViewById(R.id.spnVariant);
            mTvPrice = itemView.findViewById(R.id.tvPrice);
            mTvOriginalPrice = itemView.findViewById(R.id.tvOriginalPrice);
            mBtnDecrease = itemView.findViewById(R.id.btnDecrease);
            mBtnIncrease = itemView.findViewById(R.id.btnIncrease);
        }
    }
}
