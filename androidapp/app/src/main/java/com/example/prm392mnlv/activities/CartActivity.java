package com.example.prm392mnlv.activities;

import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;
import android.widget.Toast;

import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.adapters.CartItemAdapter;
import com.example.prm392mnlv.dto.response.CartItemResponse;
import com.example.prm392mnlv.dto.response.ProductResponse;
import com.example.prm392mnlv.mappings.CartItemMapper;
import com.example.prm392mnlv.mappings.ProductMapper;
import com.example.prm392mnlv.models.CartItem;
import com.example.prm392mnlv.models.Product;
import com.example.prm392mnlv.retrofit.repositories.CartItemRepository;
import com.example.prm392mnlv.retrofit.repositories.ProductRepository;

import java.math.BigDecimal;
import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CartActivity
        extends AppCompatActivity
        implements CartItemAdapter.CartItemChangeListener {

    private static final String TAG = "CartActivity";

    private CartItemRepository mCartItemRepo;
    private ProductRepository mProductRepo;
    private List<CartItem> mCartItems;
    private CartItemAdapter mCartItemAdapter;

    private RecyclerView mRvCartItems;
    private ViewGroup mLytError;
    private ImageView mIvErrorIcon;
    private TextView mTvErrorMessage;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_cart);

        mRvCartItems = findViewById(R.id.rvCartItems);
        mLytError = findViewById(R.id.lytError);
        mIvErrorIcon = findViewById(R.id.ivErrorIcon);
        mTvErrorMessage = findViewById(R.id.tvErrorMessage);

        mRvCartItems.setLayoutManager(new LinearLayoutManager(this, LinearLayoutManager.VERTICAL, false));
        mRvCartItems.setVisibility(View.VISIBLE);
        mLytError.setVisibility(View.GONE);
    }

    @Override
    protected void onStart() {
        super.onStart();

        mCartItemRepo = new CartItemRepository();
        mProductRepo = new ProductRepository();
        mCartItemRepo.getCartItemsAsync(new Callback<>() {
            @Override
            public void onResponse(@NonNull Call<List<CartItemResponse>> call, @NonNull Response<List<CartItemResponse>> response) {
                if (!response.isSuccessful()) {
                    showNetworkError();
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

                mCartItems.parallelStream().forEach(e ->
                        mProductRepo.getProducts(e.getProductId(), null, null, new Callback<>() {
                            @Override
                            public void onResponse(@NonNull Call<List<ProductResponse>> call, @NonNull Response<List<ProductResponse>> response) {
                                if (!response.isSuccessful()) {
                                    Log.w(TAG, "Failed to retrieve product for cart item " + e.getId());
                                    return;
                                }
                                List<ProductResponse> productDTOs = response.body();
                                assert productDTOs != null;
                                assert productDTOs.size() == 1;
                                Product product = ProductMapper.INSTANCE.toModel(productDTOs.get(0));
                                e.setProduct(product);
                            }

                            @Override
                            public void onFailure(@NonNull Call<List<ProductResponse>> call, @NonNull Throwable t) {
                                Log.w(TAG, "Failed to retrieve product for cart item " + e.getId(), t);
                            }
                        }));

                showCartItems();
            }

            @Override
            public void onFailure(@NonNull Call<List<CartItemResponse>> call, @NonNull Throwable t) {
                showNetworkError();
            }
        });
    }

    private void showCartItems() {
//        mCartItemAdapter = new CartItemAdapter(mCartItems);
        mCartItemAdapter = new CartItemAdapter(CART_ITEMS);
        mRvCartItems.setAdapter(mCartItemAdapter);
        mRvCartItems.setVisibility(View.VISIBLE);
        mLytError.setVisibility(View.GONE);
    }

    private void showEmptyCart() {
        mRvCartItems.setVisibility(View.GONE);
        mLytError.setVisibility(View.VISIBLE);
        mIvErrorIcon.setImageResource(R.drawable.cart_empty);
        mTvErrorMessage.setText(R.string.empty_cart);
    }

    private void showNetworkError() {
        mRvCartItems.setVisibility(View.GONE);
        mLytError.setVisibility(View.VISIBLE);
        mIvErrorIcon.setImageResource(R.drawable.network_issue);
        mTvErrorMessage.setText(R.string.network_error);
    }

    @Override
    public void onCartItemCheckChanged(int position, boolean checked) {
        mCartItems.get(position).setSelected(checked);
        // No need to invalidate the View; the CheckBox should've already updated itself.
    }

    @Override
    public void onCartItemQuantityChanged(int position, int delta) {
        CartItem cartItem = mCartItems.get(position);
        int newQuantity = cartItem.getQuantity() + delta;

        if (newQuantity <= 0) {
            onCartItemDeleted(position);
            return;
        }

        cartItem.setQuantity(newQuantity);
        mCartItemRepo.updateCartItemAsync(cartItem.getId(), cartItem, new Callback<>() {
            @Override
            public void onResponse(@NonNull Call<CartItemResponse> call, @NonNull Response<CartItemResponse> response) {
                if (!response.isSuccessful()) {
                    Toast.makeText(CartActivity.this, R.string.update_failed_cart_item, Toast.LENGTH_LONG).show();
                    return;
                }
                CartItem updatedCartItem = CartItemMapper.INSTANCE.toModel(response.body());
                mCartItems.set(position, updatedCartItem);
                mCartItemAdapter.notifyItemChanged(position);
            }

            @Override
            public void onFailure(@NonNull Call<CartItemResponse> call, @NonNull Throwable t) {
                Toast.makeText(CartActivity.this, R.string.update_failed_cart_item, Toast.LENGTH_LONG).show();
            }
        });
    }

    @Override
    public void onCartItemDeleted(int position) {
        mCartItemRepo.deleteCartItemAsync(mCartItems.get(position).getId(), new Callback<>() {
            @Override
            public void onResponse(@NonNull Call<Void> call, @NonNull Response<Void> response) {
                if (!response.isSuccessful()) {
                    Toast.makeText(CartActivity.this, R.string.delete_failed_cart_item, Toast.LENGTH_LONG).show();
                    return;
                }
                mCartItems.remove(position);
                mCartItemAdapter.notifyItemRemoved(position);
            }

            @Override
            public void onFailure(@NonNull Call<Void> call, @NonNull Throwable t) {
                Toast.makeText(CartActivity.this, R.string.delete_failed_cart_item, Toast.LENGTH_SHORT).show();
            }
        });
    }

    private static final List<CartItem> CART_ITEMS = new ArrayList<>() {{
        add(new CartItem("001", "ABC-XYZ", "MILK-001", BigDecimal.valueOf(2.5), 3));
        add(new CartItem("002", "ABC-XYZ", "MILK-002", BigDecimal.valueOf(3.5), 3));
        add(new CartItem("003", "ABC-XYZ", "CLOTH-001", BigDecimal.valueOf(5), 3));
        add(new CartItem("004", "ABC-XYZ", "CLOTH-002", BigDecimal.valueOf(1), 3));
        add(new CartItem("005", "ABC-XYZ", "TOY-001", BigDecimal.valueOf(0.35), 3));
    }};
}
