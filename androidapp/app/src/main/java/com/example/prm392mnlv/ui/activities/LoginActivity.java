package com.example.prm392mnlv.ui.activities;

import android.annotation.SuppressLint;
import android.content.Intent;
import android.os.Bundle;
import android.widget.EditText;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.annotation.NonNull;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.data.dto.response.LoginResponse;
import com.example.prm392mnlv.retrofit.repositories.AuthManager;

import java.util.regex.Pattern;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;


public class LoginActivity extends AppCompatActivity {

    private EditText mEmail;
    private EditText mPassword;
    private AuthManager authManager;
    private TextView mStatus;

    private final Pattern emailPattern = Pattern.compile("^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
            + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$");


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
        configureView();
    }

    @Override
    protected void onStart() {
        super.onStart();
        if (authManager == null) authManager = new AuthManager();
    }

    private void configureView() {
        mEmail = findViewById(R.id.editText_Email);
        mPassword = findViewById(R.id.editText_Password);
        mStatus = findViewById(R.id.textView_Status);
        findViewById(R.id.button_Login).setOnClickListener(v -> onLogin());
        findViewById(R.id.textView_ToLogin).setOnClickListener(v -> {
            Intent intent = new Intent();
            intent.setClass(this, RegisterActivity.class);
            startActivity(intent);
        });
    }

    private void onLogin() {
        if (!validate()) return;

        String email = mEmail.getText().toString().trim();
        String password = mPassword.getText().toString().trim();
        Callback<LoginResponse> callback = new Callback<>() {
            @SuppressLint("SetTextI18n")
            @Override
            public void onResponse(@NonNull Call<LoginResponse> call, @NonNull Response<LoginResponse> response) {
                if (!response.isSuccessful()) {
                    mStatus.setText(response.message());
                    return;
                }
                mStatus.setText("Success");
                LoginResponse loginResponse = response.body();
            }

            @Override
            public void onFailure(@NonNull Call<LoginResponse> call, @NonNull Throwable throwable) {
                mStatus.setText(throwable.getMessage());
            }
        };
        authManager.login(email, password, callback);
    }

    //TODO
    private boolean validate() {
        if (mEmail.getText().toString().trim().isEmpty()) {
            mStatus.setText(R.string.ERR_EMAIL_EMPTY);
            return false;
        }

        if (!emailPattern.matcher(mEmail.getText().toString().trim()).matches()) {
            mStatus.setText(R.string.ERR_EMAIL_INVALID);
            return false;
        }

        if (mPassword.getText().toString().trim().isEmpty()) {
            mStatus.setText(R.string.ERR_PASSWORD_EMPTY);
            return false;
        }
        mStatus.setText("");
        return true;
    }
}
