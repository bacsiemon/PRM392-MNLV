package com.example.prm392mnlv.ui.activities;

import android.content.Intent;
import android.os.Bundle;
import android.view.View;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.ui.adapters.MenuAdapter;
import com.example.prm392mnlv.data.models.MenuItem;

import java.util.Arrays;
import java.util.List;

public class HomeActivity extends AppCompatActivity {

    private RecyclerView recyclerView;

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

        recyclerView = findViewById(R.id.homeMenuRecyclerView);
        setupMenu();
    }

    private void setupMenu() {
        recyclerView.setLayoutManager(new GridLayoutManager(this, 2)); // 2 cột

        List<MenuItem> menuList = Arrays.asList(
                new MenuItem("Search", R.drawable.ic_search),
                new MenuItem("Product Details", R.drawable.ic_product),
                new MenuItem("Cart", R.drawable.ic_cart),
                new MenuItem("Order Details", R.drawable.ic_order),
                new MenuItem("Map", R.drawable.ic_map)
        );

        MenuAdapter adapter = new MenuAdapter(menuList, this);
        recyclerView.setAdapter(adapter);
    }
}