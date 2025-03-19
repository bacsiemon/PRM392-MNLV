package com.example.prm392mnlv.ui.activities;

import android.app.Activity;
import android.content.Intent;
import android.graphics.Paint;
import android.graphics.Typeface;
import android.graphics.drawable.Drawable;
import android.icu.text.DateFormat;
import android.icu.text.SimpleDateFormat;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.Button;
import android.widget.ImageView;
import android.widget.LinearLayout;
import android.widget.TextView;

import androidx.activity.result.ActivityResultLauncher;
import androidx.activity.result.contract.ActivityResultContracts;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.content.res.ResourcesCompat;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.data.dto.response.UserProfileResponse;
import com.example.prm392mnlv.data.mappings.UserMapper;
import com.example.prm392mnlv.data.models.CartItem;
import com.example.prm392mnlv.data.models.PaymentMethod;
import com.example.prm392mnlv.data.models.PaymentMethods;
import com.example.prm392mnlv.data.models.Product;
import com.example.prm392mnlv.data.models.ShippingMethod;
import com.example.prm392mnlv.data.models.ShippingMethods;
import com.example.prm392mnlv.data.models.User;
import com.example.prm392mnlv.retrofit.repositories.ProductRepository;
import com.example.prm392mnlv.retrofit.repositories.UserRepository;
import com.example.prm392mnlv.stores.TokenManager;
import com.example.prm392mnlv.util.ImageHelper;
import com.example.prm392mnlv.util.LogHelper;
import com.example.prm392mnlv.util.TextHelper;

import java.math.BigDecimal;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Date;
import java.util.List;
import java.util.Locale;
import java.util.concurrent.atomic.AtomicBoolean;

import io.reactivex.rxjava3.android.schedulers.AndroidSchedulers;
import io.reactivex.rxjava3.core.Flowable;
import io.reactivex.rxjava3.disposables.CompositeDisposable;
import io.reactivex.rxjava3.disposables.Disposable;
import io.reactivex.rxjava3.schedulers.Schedulers;
import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class CheckoutActivity extends AppCompatActivity {
    public static final String CART_ITEMS_KEY = "CartItems";

    private static final String TAG = "CheckoutActivity";

    private UserRepository mUserRepo;
    private ProductRepository mProductRepo;
    private User mUser;

    private TextView mTvUserName;
    private TextView mTvPhoneNumber;
    private TextView mTvShippingAddress;
    private ImageView mIvChangeAddress;

    private LinearLayout mLlCheckoutItems;

    private TextView mTvShippingMethod;
    private TextView mTvShippingFee;
    private TextView mTvEstimatedDelivery;
    private ImageView mIvChangeShipping;
    private ShippingMethod mShippingMethod;

    private TextView mTvItemCount;
    private TextView mTvSubtotal;

    private LinearLayout mLlPaymentMethod;

    private TextView mTvProductTotal;
    private TextView mTvShippingTotal;
    private TextView mTvDiscount;
    private TextView mTvOrderTotal;

    private TextView mTvFooterTotal;
    private Button mBtnPlaceOrder;

    private final AtomicBoolean mAddressChanged = new AtomicBoolean();
    private final List<ShippingMethod> mShippingMethods = new ArrayList<>(ShippingMethods.getMethods());
    private final CompositeDisposable disposables = new CompositeDisposable();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        // ************** DELETE AFTER TEST **************
        TokenManager.init(this);

        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_checkout);

        mUserRepo = new UserRepository();
        mProductRepo = new ProductRepository();

        mTvUserName = findViewById(R.id.tvUserName);
        mTvPhoneNumber = findViewById(R.id.tvPhoneNumber);
        mTvShippingAddress = findViewById(R.id.tvShippingAddress);
        mIvChangeAddress = findViewById(R.id.ivChangeAddress);
        mLlCheckoutItems = findViewById(R.id.llCheckoutItems);
        mTvShippingMethod = findViewById(R.id.tvShippingMethod);
        mTvShippingFee = findViewById(R.id.tvShippingFee);
        mTvEstimatedDelivery = findViewById(R.id.tvEstimatedDelivery);
        mIvChangeShipping = findViewById(R.id.ivChangeShipping);
        mTvItemCount = findViewById(R.id.tvItemCount);
        mTvSubtotal = findViewById(R.id.tvSubtotal);
        mLlPaymentMethod = findViewById(R.id.rgPaymentMethods);
        mTvProductTotal = findViewById(R.id.tvProductTotal);
        mTvShippingTotal = findViewById(R.id.tvShippingTotal);
        mTvDiscount = findViewById(R.id.tvDiscount);
        mTvOrderTotal = findViewById(R.id.tvOrderTotal);
        mTvFooterTotal = findViewById(R.id.tvFooterTotal);
        mBtnPlaceOrder = findViewById(R.id.btnPlaceOrder);

        mShippingMethod = ShippingMethods.get(0);
        calculateShippingAndSubtotal();

        ActivityResultLauncher<Intent> changeAddress = registerForActivityResult(
                new ActivityResultContracts.StartActivityForResult(),
                o -> {
                    if (o.getResultCode() != Activity.RESULT_OK) return;
                    Intent result = o.getData();
                    if (result != null) {
                        String address = result.getStringExtra(ShippingAddressActivity.RESULT_KEY);
                        if (address != null) {
                            mAddressChanged.set(true);
                            mUser.setShippingAddress(address);
                            setShippingAddress(address);
                        }
                    }
                });

        ActivityResultLauncher<Intent> changeShipping = registerForActivityResult(
                new ActivityResultContracts.StartActivityForResult(),
                o -> {
                    if (o.getResultCode() != Activity.RESULT_OK) return;
                    Intent result = o.getData();
                    if (result != null) {
                        int id = result.getIntExtra(ShippingMethodActivity.RESULT_KEY, 0);
                        mShippingMethod = mShippingMethods.get(id);
                        displayShippingMethodAndSubtotal();
                    }
                }
        );

        mIvChangeAddress.setOnClickListener(v -> {
            Intent intent = new Intent(CheckoutActivity.this, ShippingAddressActivity.class);
            changeAddress.launch(intent);
        });

        mIvChangeShipping.setOnClickListener(v -> {
            Intent intent = new Intent(CheckoutActivity.this, ShippingMethodActivity.class);
            intent.putExtra(ShippingMethodActivity.SHIPPING_METHODS_KEY, mShippingMethods.stream().toArray(ShippingMethod[]::new));
            changeShipping.launch(intent);
        });

        mBtnPlaceOrder.setOnClickListener(v -> {
            //TODO: Implement
        });
    }

    @Override
    protected void onStart() {
        super.onStart();

        displayShippingAddress();
//        displayProducts();
        displayShippingMethodAndSubtotal();
        displayPaymentMethod();
        displaySummary();
    }

    private void displayShippingAddress() {
        mUserRepo.getUserProfile(new Callback<>() {
            @Override
            public void onResponse(@NonNull Call<UserProfileResponse> call, @NonNull Response<UserProfileResponse> response) {
                if (!response.isSuccessful()) {
                    LogHelper.logErrorResponse(TAG, response);
                    return;
                }

                UserProfileResponse userResponse = response.body();
                assert userResponse != null;
                mUser = UserMapper.INSTANCE.toModel(userResponse);

                mTvUserName.setText(mUser.getName());
                mTvPhoneNumber.setText(mUser.getPhoneNumber());
                if (!mAddressChanged.get()) {
                    setShippingAddress(mUser.getShippingAddress());
                }
            }

            @Override
            public void onFailure(@NonNull Call<UserProfileResponse> call, @NonNull Throwable throwable) {
                LogHelper.logFailure(TAG, throwable);
                new AlertDialog.Builder(CheckoutActivity.this)
                        .setMessage("Failed to load user data.")
                        .setPositiveButton(android.R.string.ok, (dialog, which) -> finish())
                        .show();
            }
        });
    }

    private void setShippingAddress(String address) {
        if (address == null || address.isBlank()) {
            mTvShippingAddress.setText("Please enter your shipping address.");
            mTvShippingAddress.setTypeface(null, Typeface.ITALIC);
        } else {
            mTvShippingAddress.setText(address);
            mTvShippingAddress.setTypeface(null, Typeface.NORMAL);
            calculateShippingAndSubtotal();
            displayShippingMethodAndSubtotal();
        }
    }

    private void displayProducts() {
        Parcelable[] parcels = getIntent().getParcelableArrayExtra(CART_ITEMS_KEY);
        if (parcels == null) {
            throw new IllegalStateException("Checkout activity must be started with a cart item list.");
        }

        CartItem[] cartItems = Arrays.copyOf(parcels, parcels.length, CartItem[].class);
        List<CartItem> items = Arrays.asList(cartItems);
        LayoutInflater inflater = getLayoutInflater();
        items.forEach(item -> renderCheckoutItem(item, inflater));

        String itemCountTxt = items.size() + (items.size() == 1 ? "item" : "items");
        mTvItemCount.setText(itemCountTxt);
    }

    private void renderCheckoutItem(@NonNull CartItem item, @NonNull LayoutInflater inflater) {
        View view = inflater.inflate(R.layout.item_checkout, mLlCheckoutItems, false);

        ImageView ivProductImage = view.findViewById(R.id.ivProductImage);
        TextView tvProductName = view.findViewById(R.id.tvProductName);
        TextView tvCategory = view.findViewById(R.id.tvCategory);
        TextView tvOriginalPrice = view.findViewById(R.id.tvOriginalPrice);
        TextView tvPrice = view.findViewById(R.id.tvPrice);
        TextView tvQuantity = view.findViewById(R.id.tvQuantity);

        if (item.getProduct() != null) {
            Product product = item.getProduct();

            tvProductName.setText(product.getProductName());
            if (product.getCategory() != null) {
                tvCategory.setText(product.getCategory().getCategoryName());
            }

            Drawable loading = ResourcesCompat.getDrawable(getResources(), R.drawable.ic_loading, getTheme());
            Drawable noImage = ResourcesCompat.getDrawable(getResources(), R.drawable.no_image, getTheme());
            assert noImage != null;

            ivProductImage.setImageDrawable(loading);
            Disposable fetchImage = Flowable.fromSupplier(() -> ImageHelper.fetchDrawable(product.getImageUrl()))
                    .single(noImage)
                    .onErrorReturnItem(noImage)
                    .subscribeOn(Schedulers.io())
                    .observeOn(AndroidSchedulers.mainThread())
                    .subscribe(ivProductImage::setImageDrawable);
            disposables.add(fetchImage);
        }

        String unitPrice = TextHelper.formatPrice(item.getUnitPrice());
        tvPrice.setText(unitPrice);

        BigDecimal fakeOriginalPrice = item.getUnitPrice().multiply(BigDecimal.valueOf(1.25));
        String originalPrice = TextHelper.formatPrice(fakeOriginalPrice);
        tvOriginalPrice.setText(originalPrice);
        tvOriginalPrice.setPaintFlags(tvOriginalPrice.getPaintFlags() | Paint.STRIKE_THRU_TEXT_FLAG);

        tvQuantity.setText(item.getQuantity());

        mLlCheckoutItems.addView(view);
    }

    private void displayShippingMethodAndSubtotal() {
        mTvShippingMethod.setText(mShippingMethod.getName());
        mTvShippingFee.setText(TextHelper.formatPrice(mShippingMethod.getFee()));
        mTvEstimatedDelivery.setText(DateFormat.getDateInstance(DateFormat.FULL).format(mShippingMethod.getDeliveryTime()));
        mTvSubtotal.setText(TextHelper.formatPrice(BigDecimal.ZERO));
    }

    private void calculateShippingAndSubtotal() {
        //TODO: Implement
        double distance = 1337;
        for (ShippingMethod shippingMethod : mShippingMethods) {
            int feeClass = mShippingMethod.getFeeClass();
            BigDecimal shippingFee = BigDecimal.TEN;
            shippingMethod.setFee(shippingFee);

            int speedClass = mShippingMethod.getSpeedClass();
            DateFormat formatter = new SimpleDateFormat("yyyy-MM-dd", Locale.getDefault());
            Date eta;
            try {
                eta = formatter.parse("2040-12-31");
            } catch (ParseException e) {
                throw new RuntimeException(e);
            }
            shippingMethod.setDeliveryTime(eta);
        }
    }

    private void displayPaymentMethod() {
        mLlPaymentMethod.removeAllViews();
        List<PaymentMethod> items = new ArrayList<>(PaymentMethods.getMethods());
        LayoutInflater inflater = getLayoutInflater();
        items.forEach(item -> {
            View view = inflater.inflate(R.layout.item_payment_method, mLlPaymentMethod, false);
            ImageView ivPaymentMethodIcon = view.findViewById(R.id.ivPaymentMethodIcon);
            TextView tvPaymentMethodName = view.findViewById(R.id.tvPaymentMethodName);
            ivPaymentMethodIcon.setImageResource(item.getIcon());
            tvPaymentMethodName.setText(item.getName());
            mLlPaymentMethod.addView(view);
        });
    }

    private void displaySummary() {
        mTvProductTotal.setText(TextHelper.formatPrice(BigDecimal.ZERO));
        mTvShippingTotal.setText(TextHelper.formatPrice(BigDecimal.ZERO));
        mTvDiscount.setText(TextHelper.formatPrice(BigDecimal.ZERO));
        mTvOrderTotal.setText(TextHelper.formatPrice(BigDecimal.ZERO));
    }

    @Override
    protected void onDestroy() {
        disposables.dispose();
        super.onDestroy();
    }
}
