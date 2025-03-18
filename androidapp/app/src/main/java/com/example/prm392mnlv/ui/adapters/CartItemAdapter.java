package com.example.prm392mnlv.ui.adapters;

import android.content.Context;
import android.graphics.Paint;
import android.graphics.drawable.Drawable;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.CheckBox;
import android.widget.ImageButton;
import android.widget.ImageView;
import android.widget.Spinner;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.core.content.res.ResourcesCompat;
import androidx.recyclerview.widget.RecyclerView;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.data.models.CartItem;
import com.example.prm392mnlv.data.models.Product;
import com.example.prm392mnlv.util.ImageHelper;
import com.example.prm392mnlv.util.TextHelper;

import java.math.BigDecimal;
import java.util.List;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.core.Flowable;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.disposables.Disposable;
import io.reactivex.rxjava3.schedulers.Schedulers;

public class CartItemAdapter extends RecyclerView.Adapter<CartItemAdapter.CartItemHolder> {
    private final List<CartItem> mItems;
    private final CompositeDisposable mDisposables = new CompositeDisposable();

    private Drawable mLoading;
    private Drawable mNoImage;

    public interface Listener {

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
        View view = inflater.inflate(R.layout.item_cart, parent, false);

        mLoading = ResourcesCompat.getDrawable(context.getResources(), R.drawable.ic_loading, context.getTheme());
        mNoImage = ResourcesCompat.getDrawable(context.getResources(), R.drawable.no_image, context.getTheme());

        return new CartItemHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull CartItemHolder holder, int position) {
        CartItem item = mItems.get(position);

        holder.mCbSelectItem.setChecked(item.isSelected());

        if (item.getProduct() != null) {
            Product product = item.getProduct();

            holder.mTvProductName.setText(product.getProductName());
            if (product.getCategory() != null) {
                holder.mTvCategory.setText(product.getCategory().getCategoryName());
            }

            holder.mIvProductImage.setImageDrawable(mLoading);
            Disposable imgFetch = Flowable.fromSupplier(() -> ImageHelper.fetchDrawable(product.getImageUrl()))
                    .single(mNoImage)
                    .onErrorReturnItem(mNoImage)
                    .subscribeOn(Schedulers.io())
                    .observeOn(AndroidSchedulers.mainThread())
                    .subscribe(holder.mIvProductImage::setImageDrawable);
            mDisposables.add(imgFetch);

            if (product.getQuantityInStock() <= 0) {
                holder.mSpnVariant.setVisibility(View.GONE);
                holder.mLytPrices.setVisibility(View.GONE);
                holder.mLytQuantities.setVisibility(View.GONE);

                holder.mTvOutOfStock.setText(R.string.out_of_stock);
                holder.mTvOutOfStock.setVisibility(View.VISIBLE);
                return;
            }
        } else {
            holder.mTvProductName.setText(R.string.placeholder_product_name);
            holder.mTvCategory.setText(R.string.placeholder_category_name);
            holder.mIvProductImage.setImageDrawable(mNoImage);
        }

        //TODO: Dialog Spinner

        String unitPrice = TextHelper.formatPrice(item.getUnitPrice());
        holder.mTvPrice.setText(unitPrice);

        BigDecimal fakeOriginalPrice = item.getUnitPrice().multiply(BigDecimal.valueOf(1.25));
        String originalPrice = TextHelper.formatPrice(fakeOriginalPrice);
        holder.mTvOriginalPrice.setText(originalPrice);
        holder.mTvOriginalPrice.setPaintFlags(holder.mTvOriginalPrice.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);

        holder.mTvQuantity.setText(String.valueOf(item.getQuantity()));
    }

    @Override
    public int getItemCount() {
        return mItems.size();
    }

    public void onDestroy() {
        mDisposables.dispose();
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

            mCbSelectItem = itemView.findViewById(R.id.cbSelectAll);
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
            if (!(context instanceof Listener)) {
                throw new IllegalStateException("Context must implement " + Listener.class.getName());
            }
            Listener listener = (Listener) context;

            mCbSelectItem.setOnCheckedChangeListener((buttonView, isChecked) -> listener.onCartItemCheckChanged(getBindingAdapterPosition(), isChecked));
            mBtnDecrease.setOnClickListener(v -> listener.onCartItemQuantityChanged(getBindingAdapterPosition(), -1));
            mBtnIncrease.setOnClickListener(v -> listener.onCartItemQuantityChanged(getBindingAdapterPosition(), +1));
        }
    }
}
