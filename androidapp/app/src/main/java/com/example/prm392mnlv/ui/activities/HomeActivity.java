package com.example.prm392mnlv.ui.activities;

import android.os.Bundle;
import android.view.MenuItem;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.prm392mnlv.R;
import com.google.android.material.bottomnavigation.BottomNavigationView;
import com.google.android.material.navigation.NavigationBarView;

public class HomeActivity extends AppCompatActivity {

    private BottomNavigationView navigationView;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_home);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
        configureNavBar();
    }

    private void configureNavBar(){
        navigationView = findViewById(R.id.bottom_nav_menu);
        navigationView.setOnItemSelectedListener(item -> {
            if (item.getItemId() == R.id.item_home) {
                Toast.makeText(HomeActivity.this, "Home", Toast.LENGTH_SHORT).show();
            }

            if (item.getItemId() == R.id.item_cart) {
                Toast.makeText(HomeActivity.this, "Cart", Toast.LENGTH_SHORT).show();
            }

            if (item.getItemId() == R.id.item_map) {
                Toast.makeText(HomeActivity.this, "map", Toast.LENGTH_SHORT).show();
            }

            if (item.getItemId() == R.id.item_account) {
                Toast.makeText(HomeActivity.this, "Account", Toast.LENGTH_SHORT).show();
            }
            return true;
        });
    }
}
