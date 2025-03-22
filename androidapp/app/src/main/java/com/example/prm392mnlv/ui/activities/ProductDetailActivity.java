package com.example.prm392mnlv.ui.activities;

import static android.content.Intent.getIntent;

import android.os.Bundle;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.appcompat.app.AppCompatActivity;

import com.bumptech.glide.Glide;
import com.example.prm392mnlv.R;

public class ProductDetailActivity extends AppCompatActivity {

    private ImageView ivProductImage;
    private TextView tvProductName, tvDescription, tvPrice, tvStock, tvCategory;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_detail);

        ivProductImage = findViewById(R.id.ivProductImage);
        tvProductName = findViewById(R.id.tvProductName);
        tvDescription = findViewById(R.id.tvDescription);
        tvPrice = findViewById(R.id.tvPrice);
        tvStock = findViewById(R.id.tvStock);
        tvCategory = findViewById(R.id.tvCategory);

        // Lấy dữ liệu từ Intent
        if (getIntent() != null) {
            String productName = getIntent().getStringExtra("productName");
            String description = getIntent().getStringExtra("description");
            double price = getIntent().getDoubleExtra("price", 0);
            int quantityInStock = getIntent().getIntExtra("quantityInStock", 0);
            String imageUrl = getIntent().getStringExtra("imageUrl");
            String categoryId = getIntent().getStringExtra("categoryId");

            tvProductName.setText(productName);
            tvDescription.setText(description);
            tvPrice.setText("$" + price);
            tvStock.setText("Stock: " + quantityInStock);
            tvCategory.setText("Category: " + categoryId);

            Glide.with(this)
                    .load(imageUrl)
                    .placeholder(R.drawable.placeholder_product)
                    .into(ivProductImage);
        }
    }
}
