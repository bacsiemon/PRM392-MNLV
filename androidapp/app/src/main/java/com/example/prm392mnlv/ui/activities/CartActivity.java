package com.example.prm392mnlv.ui.activities;

import android.Manifest;
import android.content.pm.PackageManager;
import androidx.core.app.ActivityCompat;
import androidx.core.content.ContextCompat;
import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Build;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.Button;
import android.widget.CheckBox;
import android.widget.CompoundButton;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.ui.adapters.CartItemAdapter;
import com.example.prm392mnlv.data.dto.response.CartItemResponse;
import com.example.prm392mnlv.data.dto.response.CategoryResponse;
import com.example.prm392mnlv.data.dto.response.MessageResponse;
import com.example.prm392mnlv.data.dto.response.ProductResponse;
import com.example.prm392mnlv.data.mappings.CartItemMapper;
import com.example.prm392mnlv.data.mappings.CategoryMapper;
import com.example.prm392mnlv.data.mappings.ProductMapper;
import com.example.prm392mnlv.data.models.CartItem;
import com.example.prm392mnlv.data.models.Category;
import com.example.prm392mnlv.data.models.Product;
import com.example.prm392mnlv.retrofit.repositories.CartItemRepository;
import com.example.prm392mnlv.retrofit.repositories.CategoryRepository;
import com.example.prm392mnlv.retrofit.repositories.ProductRepository;
import com.example.prm392mnlv.stores.TokenManager;
import com.example.prm392mnlv.util.LogHelper;
import com.example.prm392mnlv.util.NotificationHelper;
import com.example.prm392mnlv.util.TextHelper;

import java.math.BigDecimal;
import java.util.List;
import java.util.Locale;
import java.util.Set;
import java.util.concurrent.atomic.AtomicBoolean;
import java.util.concurrent.atomic.AtomicInteger;
import java.util.concurrent.atomic.AtomicReference;
import java.util.stream.Collectors;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CartActivity
        extends AppCompatActivity
        implements CartItemAdapter.Listener {

    private static final String TAG = "CartActivity";

    private CartItemRepository mCartItemRepo;
    private ProductRepository mProductRepo;
    private CategoryRepository mCategoryRepo;

    private List<CartItem> mCartItems;
    private CartItemAdapter mCartItemAdapter;

    private TextView mTvCartTitle;
    private RecyclerView mRvCartItems;
    private ViewGroup mLytError;
    private ImageView mIvErrorIcon;
    private TextView mTvErrorMessage;
    private CheckBox mCbSelectAll;
    private TextView mTvTotal;
    private Button mBtnCheckout;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // ************** DELETE AFTER TEST **************
        TokenManager.init(this);

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cart);

        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.TIRAMISU) {
            if (ContextCompat.checkSelfPermission(this, Manifest.permission.POST_NOTIFICATIONS)
                    != PackageManager.PERMISSION_GRANTED) {
                ActivityCompat.requestPermissions(this,
                        new String[]{Manifest.permission.POST_NOTIFICATIONS},
                        100);
            }
        }

        mTvCartTitle = findViewById(R.id.tvCartTitle);
        mRvCartItems = findViewById(R.id.rvCartItems);
        mLytError = findViewById(R.id.lytError);
        mIvErrorIcon = findViewById(R.id.ivErrorIcon);
        mTvErrorMessage = findViewById(R.id.tvErrorMessage);
        mCbSelectAll = findViewById(R.id.cbSelectAll);
        mTvTotal = findViewById(R.id.tvFooterTotal);
        mBtnCheckout = findViewById(R.id.btnCheckout);

        mRvCartItems.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        mRvCartItems.setVisibility(View.VISIBLE);
        mLytError.setVisibility(View.GONE);

        mCartItemRepo = new CartItemRepository();
        mProductRepo = new ProductRepository();
        mCategoryRepo = new CategoryRepository();
    }

    @Override
    protected void onStart() {
        super.onStart();
        fetchCartItems();
    }

    private void fetchCartItems() {
        mCartItemRepo.getCartItems(new Callback<>() {
            @Override
            public void onResponse(@NonNull Call<List<CartItemResponse>> call, @NonNull Response<List<CartItemResponse>> response) {
                if (!response.isSuccessful()) {
                    LogHelper.logErrorResponse(TAG, response);
                    showLoadError();
                    return;
                }

                List<CartItemResponse> cartItemDTOs = response.body();
                assert cartItemDTOs != null;
                if (cartItemDTOs.isEmpty()) {
                    showEmptyCart();
                    return;
                }

                mCartItems = cartItemDTOs.parallelStream()
                        .map(CartItemMapper.INSTANCE::toModel)
                        .collect(Collectors.toList());

                fetchProductInfo();
            }

            @Override
            public void onFailure(@NonNull Call<List<CartItemResponse>> call, @NonNull Throwable throwable) {
                LogHelper.logFailure(TAG, throwable);
                showLoadError();
            }
        });
    }

    private void fetchProductInfo() {
        AtomicInteger count = new AtomicInteger();
        int size = mCartItems.size();
        mCartItems.parallelStream()
                .forEach(cartItem -> mProductRepo.getProducts(cartItem.getProductId(), null, null, new Callback<>() {
                    @Override
                    public void onResponse(@NonNull Call<List<ProductResponse>> call, @NonNull Response<List<ProductResponse>> response) {
                        if (!response.isSuccessful()) {
                            LogHelper.logErrorResponse(TAG, response);
                            return;
                        }

                        List<ProductResponse> productDTOs = response.body();
                        assert productDTOs != null;
                        assert productDTOs.size() == 1;
                        Product product = ProductMapper.INSTANCE.toModel(productDTOs.get(0));
                        cartItem.setProduct(product);
                        cartItem.setUnitPrice(product.getPrice());

                        checkProgress();
                    }

                    @Override
                    public void onFailure(@NonNull Call<List<ProductResponse>> call, @NonNull Throwable throwable) {
                        Log.e(TAG, "onFailure: Failed to retrieve product #_" + cartItem.getProductId(), throwable);
                        checkProgress();
                    }

                    private void checkProgress() {
                        if (count.incrementAndGet() < size) return;
                        fetchCategoryInfo();
                    }
                }));
    }

    private void fetchCategoryInfo() {
        Set<String> categoryIds = mCartItems.stream()
                .map(e -> e.getProduct() != null ? e.getProduct().getCategoryId() : null)
                .collect(Collectors.toSet());
        categoryIds.remove(null);

        AtomicInteger count = new AtomicInteger();
        int size = categoryIds.size();

        categoryIds.parallelStream().forEach(id -> mCategoryRepo.getCategories(id, new Callback<>() {
            @Override
            public void onResponse(@NonNull Call<List<CategoryResponse>> call, @NonNull Response<List<CategoryResponse>> response) {
                if (!response.isSuccessful()) {
                    LogHelper.logErrorResponse(TAG, response);
                    return;
                }

                List<CategoryResponse> categoryDTOs = response.body();
                assert categoryDTOs != null;
                assert categoryDTOs.size() == 1;

                Category category = CategoryMapper.INSTANCE.toModel(categoryDTOs.get(0));
                mCartItems.forEach(cartItem -> {
                    Product product = cartItem.getProduct();
                    if (product != null && category.getId().equals(product.getCategoryId())) {
                        product.setCategory(category);
                    }
                });

                checkProgress();
            }

            @Override
            public void onFailure(@NonNull Call<List<CategoryResponse>> call, @NonNull Throwable throwable) {
                Log.e(TAG, "onFailure: Failed to retrieve category #_" + id, throwable);
                checkProgress();
            }

            private void checkProgress() {
                if (count.incrementAndGet() < size) return;
                showCartItems();
            }
        }));
    }

    private void showEmptyCart() {
        mRvCartItems.setVisibility(View.GONE);
        mLytError.setVisibility(View.VISIBLE);
        mIvErrorIcon.setImageResource(R.drawable.cart_empty);
        mTvErrorMessage.setText(R.string.empty_cart);
    }

    private void showLoadError() {
        mRvCartItems.setVisibility(View.GONE);
        mLytError.setVisibility(View.VISIBLE);
        mIvErrorIcon.setImageResource(R.drawable.network_issue);
        mTvErrorMessage.setText(R.string.network_error);
    }

    private void showCartItems() {
        mRvCartItems.setVisibility(View.VISIBLE);
        mLytError.setVisibility(View.GONE);
        mCartItemAdapter = new CartItemAdapter(mCartItems);
        mRvCartItems.setAdapter(mCartItemAdapter);

        mTvCartTitle.setText(String.format(Locale.getDefault(), "Cart (%d)", mCartItems.size()));
        mTvTotal.setText(TextHelper.formatPrice(BigDecimal.ZERO));
        mCbSelectAll.setOnCheckedChangeListener(this::onSelectAll);
        mBtnCheckout.setOnClickListener(this::onCheckout);
    }

    //FIXME: There should really be an API for this.
    private void updateTotalPrice() {
        List<CartItem> selectedItems = mCartItems.parallelStream().filter(CartItem::isSelected).collect(Collectors.toList());
        int size = selectedItems.size();
        AtomicInteger count = new AtomicInteger();
        AtomicBoolean failed = new AtomicBoolean();
        AtomicReference<BigDecimal> total = new AtomicReference<>(BigDecimal.ZERO);

        selectedItems.forEach(cartItem -> mProductRepo.getProducts(cartItem.getProductId(), null, null, new Callback<>() {
            @Override
            public void onResponse(@NonNull Call<List<ProductResponse>> call, @NonNull Response<List<ProductResponse>> response) {
                if (failed.get()) return;

                if (!response.isSuccessful()) {
                    LogHelper.logErrorResponse(TAG, response);
                    return;
                }

                List<ProductResponse> productResponses = response.body();
                assert productResponses != null;
                assert productResponses.size() == 1;

                Product product = ProductMapper.INSTANCE.toModel(productResponses.get(0));
                if (cartItem.getProduct() != null) {
                    cartItem.getProduct().setPrice(product.getPrice());
                }
                addToTotal(product.getPrice());
            }

            @Override
            public void onFailure(@NonNull Call<List<ProductResponse>> call, @NonNull Throwable throwable) {
                LogHelper.logFailure(TAG, throwable);
                failed.set(true);
            }

            private void addToTotal(BigDecimal price) {
                if (!failed.get()) {
                    total.accumulateAndGet(price, BigDecimal::add);
                }
                if (count.incrementAndGet() < size) return;
                if (failed.get()) {
                    Toast.makeText(CartActivity.this, "Failed to calculate total.", Toast.LENGTH_SHORT).show();
                }

                String totalPrice = TextHelper.formatPrice(total.get());
                mTvTotal.setText(totalPrice);
            }
        }));
    }

    @SuppressLint("NotifyDataSetChanged")
    private void onSelectAll(CompoundButton buttonView, boolean isChecked) {
        mCartItems.forEach(cartItem -> cartItem.setSelected(isChecked));
        mCartItemAdapter.notifyDataSetChanged();
        updateTotalPrice();
    }

    @Override
    public void onCartItemCheckChanged(int position, boolean isChecked) {
        // No need to invalidate the View; the CheckBox should've already updated itself.
        mCartItems.get(position).setSelected(isChecked);
        mCbSelectAll.setChecked(mCartItems.stream().allMatch(CartItem::isSelected));
        updateTotalPrice();
    }

    @Override
    public void onCartItemQuantityChanged(int position, int delta) {
        CartItem cartItem = mCartItems.get(position);
        int newQuantity = cartItem.getQuantity() + delta;

        if (newQuantity <= 0) {
            onCartItemDeleted(position);
            return;
        }

        CartItem toBeCartItem = new CartItem();
        toBeCartItem.setProductId(cartItem.getProductId());
        toBeCartItem.setQuantity(newQuantity);

        mCartItemRepo.updateCartItem(cartItem.getId(), toBeCartItem, new Callback<>() {
            @Override
            public void onResponse(@NonNull Call<MessageResponse> call, @NonNull Response<MessageResponse> response) {
                if (!response.isSuccessful()) {
                    LogHelper.logErrorResponse(TAG, response);
                    Toast.makeText(CartActivity.this, R.string.update_failed_cart_item, Toast.LENGTH_LONG).show();
                    return;
                }
                cartItem.setQuantity(newQuantity);
                mCartItems.set(position, cartItem);
                mCartItemAdapter.notifyItemChanged(position);
            }

            @Override
            public void onFailure(@NonNull Call<MessageResponse> call, @NonNull Throwable throwable) {
                LogHelper.logFailure(TAG, throwable);
                Toast.makeText(CartActivity.this, R.string.update_failed_cart_item, Toast.LENGTH_LONG).show();
            }
        });
    }

    @Override
    public void onCartItemDeleted(int position) {
        mCartItemRepo.deleteCartItem(mCartItems.get(position).getId(), new Callback<>() {
            @Override
            public void onResponse(@NonNull Call<MessageResponse> call, @NonNull Response<MessageResponse> response) {
                if (!response.isSuccessful()) {
                    LogHelper.logErrorResponse(TAG, response);
                    Toast.makeText(CartActivity.this, R.string.delete_failed_cart_item, Toast.LENGTH_LONG).show();
                    return;
                }
                mCartItems.remove(position);
                mCartItemAdapter.notifyItemRemoved(position);
            }

            @Override
            public void onFailure(@NonNull Call<MessageResponse> call, @NonNull Throwable throwable) {
                LogHelper.logFailure(TAG, throwable);
                Toast.makeText(CartActivity.this, R.string.delete_failed_cart_item, Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void onCheckout(View view) {
        CartItem[] selectedItems = mCartItems.stream().filter(CartItem::isSelected).toArray(CartItem[]::new);
        if (selectedItems.length == 0) {
            new AlertDialog.Builder(CartActivity.this)
                    .setMessage("You have not selected any product.")
                    .setPositiveButton(android.R.string.ok, (dialog, which) -> {})
                    .show();
            return;
        }
        Intent intent = new Intent(this, CheckoutActivity.class);
        intent.putExtra(CheckoutActivity.CART_ITEMS_KEY, selectedItems);
        startActivity(intent);
    }

    @Override
    protected void onDestroy() {
        mCartItemAdapter.onDestroy();
        super.onDestroy();
    }

    @Override
    protected void onStop() {
        super.onStop();
        if (mCartItems != null && !mCartItems.isEmpty()) {
            NotificationHelper.showCartNotification(this, mCartItems.size());
        } else {
            NotificationHelper.clearBadge(this);
        }
    }

}
