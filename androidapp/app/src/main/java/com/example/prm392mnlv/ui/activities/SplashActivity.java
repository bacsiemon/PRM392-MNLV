package com.example.prm392mnlv.ui.activities;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.appcompat.app.AppCompatDelegate;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.datastore.preferences.core.Preferences;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.data.dto.response.CartItemResponse;
import com.example.prm392mnlv.data.dto.response.LoginResponse;
import com.example.prm392mnlv.data.dto.response.MessageResponse;
import com.example.prm392mnlv.data.dto.response.ProductResponse;
import com.example.prm392mnlv.data.mappings.CartItemMapper;
import com.example.prm392mnlv.data.mappings.ProductMapper;
import com.example.prm392mnlv.data.models.CartItem;
import com.example.prm392mnlv.data.models.Product;
import com.example.prm392mnlv.retrofit.repositories.AuthManager;
import com.example.prm392mnlv.retrofit.repositories.CartItemRepository;
import com.example.prm392mnlv.retrofit.repositories.ProductRepository;
import com.example.prm392mnlv.stores.TokenManager;
import com.example.prm392mnlv.util.LogHelper;

import java.util.List;
import java.util.concurrent.atomic.AtomicInteger;

import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.functions.Consumer;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class SplashActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        AppCompatDelegate.setDefaultNightMode(AppCompatDelegate.MODE_NIGHT_NO);
        setContentView(R.layout.activity_splash);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        runTest();
    }

    private final CompositeDisposable disposables = new CompositeDisposable();

    private void runTest() {
        TokenManager.init(this);

        AuthManager authManager = new AuthManager();
        authManager.login("test@example.com", "My1stPassword!", new Callback<>() {
            private static final String TAG = "LoginTest";

            @Override
            public void onResponse(@NonNull Call<LoginResponse> call, @NonNull Response<LoginResponse> response) {
                if (!response.isSuccessful()) {
                    LogHelper.logErrorResponse(TAG, response);
                    return;
                }

                LoginResponse loginResponse = response.body();
                assert loginResponse != null;

                AtomicInteger count = new AtomicInteger();
                Consumer<Preferences> callback = prefs -> {
                    if (count.incrementAndGet() < 2) return;
                    Log.d(TAG, "Access token: " + prefs.get(TokenManager.ACCESS_TOKEN) + "\nRefresh token: " + prefs.get(TokenManager.REFRESH_TOKEN));
                    fetchData();
                };

                disposables.add(TokenManager.INSTANCE.setToken(TokenManager.ACCESS_TOKEN, loginResponse.accessToken, callback));
                disposables.add(TokenManager.INSTANCE.setToken(TokenManager.REFRESH_TOKEN, loginResponse.refreshToken, callback));
            }

            @Override
            public void onFailure(@NonNull Call<LoginResponse> call, @NonNull Throwable throwable) {
                Log.e(TAG, "onFailure: ", throwable);
            }
        });
    }

    private void fetchData() {
        ProductRepository productRepo = new ProductRepository();
        productRepo.getProducts(null, null, null, new Callback<>() {
            private static final String TAG = "ProductTest";

            @Override
            public void onResponse(@NonNull Call<List<ProductResponse>> call, @NonNull Response<List<ProductResponse>> response) {
                if (!response.isSuccessful()) {
                    LogHelper.logErrorResponse(TAG, response);
                    return;
                }

                List<ProductResponse> productResponses = response.body();
                assert productResponses != null;
                for (ProductResponse productResponse : productResponses) {
                    Product product = ProductMapper.INSTANCE.toModel(productResponse);
                    Log.d(TAG, product.getProductName() + " : " + product.getDescription());
                }

                addToCart();
            }

            @Override
            public void onFailure(@NonNull Call<List<ProductResponse>> call, @NonNull Throwable throwable) {
                Log.e(TAG, "onFailure: ", throwable);
            }
        });
    }

    private void addToCart() {
        CartItemRepository cartRepo = new CartItemRepository();
        CartItem cartItem = new CartItem();
        cartItem.setProductId("9d0573250c404b6580123058ca971a0d");
        cartItem.setQuantity(1);
        cartRepo.createCartItem(cartItem, new Callback<>() {
            private static final String TAG = "AddCartTest";

            @Override
            public void onResponse(@NonNull Call<MessageResponse> call, @NonNull Response<MessageResponse> response) {
                if (!response.isSuccessful()) {
                    LogHelper.logErrorResponse(TAG, response);
                    return;
                }

                MessageResponse msgRes = response.body();
                assert msgRes != null;
                Log.d(TAG, msgRes.message);

                getCart();
            }

            @Override
            public void onFailure(@NonNull Call<MessageResponse> call, @NonNull Throwable throwable) {
                Log.e(TAG, "onFailure: ", throwable);
            }
        });
    }

    private void getCart() {
        CartItemRepository cartRepo = new CartItemRepository();
        cartRepo.getCartItems(new Callback<>() {
            private static final String TAG = "GetCartTest";

            @Override
            public void onResponse(@NonNull Call<List<CartItemResponse>> call, @NonNull Response<List<CartItemResponse>> response) {
                if (!response.isSuccessful()) {
                    LogHelper.logErrorResponse(TAG, response);
                    return;
                }

                List<CartItemResponse> cartResponse = response.body();
                assert cartResponse != null;
                for (var cartItemResponse : cartResponse) {
                    CartItem cartItem = CartItemMapper.INSTANCE.toModel(cartItemResponse);
                    Log.d(TAG, cartItem.getProductId() + " - " + cartItem.getQuantity());
                }
            }

            @Override
            public void onFailure(@NonNull Call<List<CartItemResponse>> call, @NonNull Throwable throwable) {
                Log.e(TAG, "onFailure: ", throwable);
            }
        });
    }

    @Override
    protected void onStart() {
        super.onStart();

        Intent intent = new Intent();
        intent.setClass(getApplicationContext(), LoginActivity.class);
        startActivity(intent);
    }

    @Override
    protected void onDestroy() {
        super.onDestroy();
        disposables.dispose();
    }
}
