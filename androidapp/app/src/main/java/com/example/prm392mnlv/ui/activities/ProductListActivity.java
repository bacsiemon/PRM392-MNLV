package com.example.prm392mnlv.ui.activities;

import android.os.Bundle;
import android.util.Log;
import android.widget.Toast;

import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.GridLayoutManager;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.data.dto.response.ProductResponse;
import com.example.prm392mnlv.data.mappings.ProductMapper;
import com.example.prm392mnlv.data.models.MenuItem;
import com.example.prm392mnlv.data.models.Product;
import com.example.prm392mnlv.retrofit.repositories.ProductRepository;
import com.example.prm392mnlv.stores.TokenManager;
import com.example.prm392mnlv.ui.adapters.MenuAdapter;
import com.example.prm392mnlv.ui.adapters.ProductAdapter;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class ProductListActivity extends AppCompatActivity {
    private RecyclerView rvProducts;
    private RecyclerView menuRecyclerView;
    private ProductAdapter productAdapter;
    private List<Product> productList = new ArrayList<>();
    private ProductRepository productRepository;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_product_list);

        // Lấy token từ TokenManager
        String token = TokenManager.INSTANCE.getTokenBlocking(TokenManager.ACCESS_TOKEN);
        Log.d("ProductListActivity", "Token: " + token);
        // Hiển thị token (tùy chọn)
        Toast.makeText(this, "Token: " + token, Toast.LENGTH_SHORT).show();

        menuRecyclerView = findViewById(R.id.menuRecyclerView);
        setupMenu();
        // Khởi tạo RecyclerView
        rvProducts = findViewById(R.id.rvProducts);
        rvProducts.setLayoutManager(new LinearLayoutManager(this));


        // Khởi tạo adapter và gán cho RecyclerView
        productAdapter = new ProductAdapter(this, productList);
        rvProducts.setAdapter(productAdapter);

        // Khởi tạo repository
        productRepository = new ProductRepository();

        // Gọi API để lấy danh sách sản phẩm
        fetchProducts();
    }

    private void fetchProducts() {
        // Nếu không có điều kiện filter thì truyền null
        productRepository.getProducts(null, null, null, new Callback<List<ProductResponse>>() {
            @Override
            public void onResponse(Call<List<ProductResponse>> call, Response<List<ProductResponse>> response) {
                if (response.isSuccessful() && response.body() != null) {
                    List<ProductResponse> responses = response.body();
                    productList.clear();

                    // Map từng ProductResponse sang Product dùng ProductMapper
                    for (ProductResponse pr : responses) {
                        Product product = ProductMapper.INSTANCE.toModel(pr);
                        productList.add(product);
                    }

                    // Cập nhật lại adapter
                    // Retrofit callback thường đã chạy trên UI thread nên runOnUiThread có thể không cần thiết
                    productAdapter.notifyDataSetChanged();
                } else {
                    Log.e("ProductListActivity", "Response không thành công hoặc rỗng");
                }
            }

            @Override
            public void onFailure(Call<List<ProductResponse>> call, Throwable t) {
                Log.e("ProductListActivity", "Lỗi khi gọi API: " + t.getMessage());
            }
        });
    }

    private void setupMenu() {
        menuRecyclerView.setLayoutManager(new GridLayoutManager(this, 3)); // 3 cột

        List<MenuItem> menuList = Arrays.asList(
                new MenuItem("Cart", R.drawable.ic_cart),
                new MenuItem("Map", R.drawable.ic_map),
                new MenuItem("Logout", R.drawable.ic_logout)
        );

        MenuAdapter adapter = new MenuAdapter(menuList, this);
        menuRecyclerView.setAdapter(adapter);
    }

}
