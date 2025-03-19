package com.example.prm392mnlv.activities;

import android.os.Bundle;
import android.view.Window;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.dto.request.RegisterConfirmationRequest;
import com.example.prm392mnlv.retrofit.repositories.AuthManager;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class RegisterConfirmationActivity extends AppCompatActivity {

    private EditText otpEditText;
    private TextView statusTextView;

    private AuthManager authManager;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_register_confirmation);
        ViewCompat.setOnApplyWindowInsetsListener(findViewById(R.id.main), (v, insets) -> {
            Insets systemBars = insets.getInsets(WindowInsetsCompat.Type.systemBars());
            v.setPadding(systemBars.left, systemBars.top, systemBars.right, systemBars.bottom);
            return insets;
        });

        configureView();
    }

    private void configureView() {
        otpEditText = findViewById(R.id.editText_Otp);
        statusTextView = findViewById(R.id.textView_Status);
        authManager = new AuthManager();
        findViewById(R.id.button_Register).setOnClickListener(v -> onRegisterConfirm());
        findViewById(R.id.button_ResendOtp).setOnClickListener(v -> onResendConfirmationEmail());

    }


    private void onRegisterConfirm(){
        RegisterConfirmationRequest request = new RegisterConfirmationRequest(
                    otpEditText.getText().toString(),
                    getIntent().getStringExtra("email"));

        Callback<Void> callback = new Callback<Void>() {
            @Override
            public void onResponse(Call<Void> call, Response<Void> response) {
                if (!response.isSuccessful()){
                    statusTextView.setText(response.message());
                    return;
                }
                finish();
            }

            @Override
            public void onFailure(Call<Void> call, Throwable throwable) {

            }
        };
        authManager.confirmEmail(request, callback);
    }

    private void onResendConfirmationEmail(){
        Callback<Void> callback = new Callback<Void>() {
            @Override
            public void onResponse(Call<Void> call, Response<Void> response) {
                if (!response.isSuccessful()){
                    statusTextView.setText(response.message());
                    return;
                }
                Toast.makeText(getApplicationContext(), R.string.REGISTER_CONFIRMATION_MAIL_SENT, Toast.LENGTH_SHORT).show();
            }

            @Override
            public void onFailure(Call<Void> call, Throwable throwable) {

            }
        };
        authManager.resendConfirmationEmail(getIntent().getStringExtra("email"), callback);
    }
}