package com.example.prm392mnlv.activities;

import android.os.Bundle;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.models.CartItem;
import com.example.prm392mnlv.retrofit.repositories.CartItemRepository;

import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class LoginActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_login);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        RunTest();
    }

    private void RunTest() {
        CartItemRepository repo = new CartItemRepository();
        repo.getCartItemsAsync(new Callback<>() {
            @Override
            public void onResponse(@NonNull Call<List<CartItem>> call, @NonNull Response<List<CartItem>> response) {
                if (!response.isSuccessful()) {
                    Toast.makeText(LoginActivity.this, "Failed to retrieve data.", Toast.LENGTH_SHORT).show();
                    return;
                }
                Toast.makeText(LoginActivity.this, "Data successfully retrieved.", Toast.LENGTH_SHORT).show();
                List<CartItem> cartItems = response.body();
            }

            @Override
            public void onFailure(@NonNull Call<List<CartItem>> call, @NonNull Throwable t) {
                Toast.makeText(LoginActivity.this, "An unexpected error occurred.", Toast.LENGTH_SHORT).show();
            }
        });
    }
}
