package com.example.prm392mnlv.ui.activities;

import android.app.Activity;
import android.content.Intent;
import android.icu.text.DateFormat;
import android.os.Bundle;
import android.os.Parcelable;
import android.view.LayoutInflater;
import android.view.View;
import android.widget.RadioButton;
import android.widget.RadioGroup;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.data.models.ShippingMethod;
import com.example.prm392mnlv.util.TextHelper;

import java.util.Arrays;
import java.util.List;
import java.util.stream.Collectors;

public class ShippingMethodActivity extends AppCompatActivity {

    public static final String SHIPPING_METHODS_KEY = "ShippingMethods";
    public static final String RESULT_KEY = "SelectedId";

    private RadioGroup mRgShippingMethods;

    private int mSelected;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_shipping_method);

        Parcelable[] parcels = getIntent().getParcelableArrayExtra(SHIPPING_METHODS_KEY);
        if (parcels == null) {
            throw new IllegalStateException("Shipping method activity must be started with a list of shipping methods.");
        }
        List<ShippingMethod> shippingMethods = Arrays.stream(parcels)
                .map(e -> (ShippingMethod) e)
                .collect(Collectors.toList());

        mRgShippingMethods = findViewById(R.id.rgShippingMethods);

        LayoutInflater inflater = getLayoutInflater();
        for (int i = 0; i < shippingMethods.size(); ++i) {
            ShippingMethod method = shippingMethods.get(i);

            View view = inflater.inflate(R.layout.item_shipping_method, mRgShippingMethods, false);

            TextView tvShippingMethod = view.findViewById(R.id.tvShippingMethod);
            TextView tvShippingFee = view.findViewById(R.id.tvShippingFee);
            TextView tvEstimatedDelivery = view.findViewById(R.id.tvEstimatedDelivery);
            RadioButton rbSelect = view.findViewById(R.id.rbSelect);

            tvShippingMethod.setText(method.getName());
            tvShippingFee.setText(TextHelper.formatPrice(method.getFee()));
            tvEstimatedDelivery.setText(DateFormat.getDateInstance().format(method.getDeliveryTime()));

            int id = i;
            view.setOnClickListener(v -> {
                rbSelect.setChecked(true);
                mSelected = id;
            });

            mRgShippingMethods.addView(view);
        }

        findViewById(R.id.btnConfirm).setOnClickListener(v -> {
            Intent result = new Intent();
            result.putExtra(RESULT_KEY, mSelected);
            setResult(Activity.RESULT_OK, result);
            finish();
        });
    }
}
