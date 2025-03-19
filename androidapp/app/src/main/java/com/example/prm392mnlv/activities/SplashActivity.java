package com.example.prm392mnlv.activities;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.stores.TokenManager;

public class SplashActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_splash);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });
        TokenManager.init(getApplicationContext());
    }

    @Override
    protected void onStart() {
        super.onStart();
        Intent intent = new Intent();
        String token = TokenManager.INSTANCE.getToken(TokenManager.ACCESS_TOKEN);
        if (token.isEmpty()){
            intent.setClass(getApplicationContext(), LoginActivity.class);
            startActivity(intent);
            return;
        }

        intent.setClass(getApplicationContext(), HomeActivity.class);
        startActivity(intent);

    }
}
