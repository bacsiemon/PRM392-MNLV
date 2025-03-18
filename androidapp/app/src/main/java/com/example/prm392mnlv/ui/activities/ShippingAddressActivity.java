package com.example.prm392mnlv.ui.activities;

import android.app.Activity;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.widget.Button;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;

import com.example.prm392mnlv.R;
import com.google.android.material.textfield.TextInputLayout;

import java.util.Objects;

public class ShippingAddressActivity extends AppCompatActivity {
    public static final String RESULT_KEY = "ShippingAddress";

    private TextInputLayout mEtAddress;
    private Button mBtnConfirmAddress;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_shipping_address);

        mEtAddress = findViewById(R.id.etLayoutShippingAddress);
        mBtnConfirmAddress = findViewById(R.id.btnConfirm);

        mEtAddress.setEndIconMode(TextInputLayout.END_ICON_CLEAR_TEXT);
        mEtAddress.setOnFocusChangeListener((v, hasFocus) -> {
            if (!hasFocus) {
                getAndValidateInput();
            }
        });
        mBtnConfirmAddress.setOnClickListener(this::returnShippingAddress);
    }

    private void returnShippingAddress(View v) {
        String address = getAndValidateInput();
        if (address == null) return;

        Intent result = new Intent();
        result.putExtra(RESULT_KEY, address);
        setResult(Activity.RESULT_OK, result);
        finish();
    }

    @Nullable
    private String getAndValidateInput() {
        String address = Objects.requireNonNull(mEtAddress.getEditText()).getText().toString();
        if (address.isBlank()) {
            mEtAddress.setError("Please input an address.");
            return null;
        }
        if (address.length() < 5) {
            mEtAddress.setError("Address too short. Must be at least 5 characters long.");
            return null;
        }
        return address;
    }
}
