package com.example.prm392mnlv.activities;

import android.os.Bundle;
import android.widget.EditText;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.dto.request.RegisterRequest;
import com.example.prm392mnlv.retrofit.repositories.AuthRepository;

import java.util.regex.Pattern;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

public class RegisterActivity extends AppCompatActivity {

    private EditText mEmail;
    private EditText mPassword;
    private EditText mConfirmPassword;

    private TextView mStatus;
    private AuthRepository authRepository;

    private final Pattern emailPattern = Pattern.compile("^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
            + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$");

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        EdgeToEdge.enable(this);
        setContentView(R.layout.activity_register);
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
        if (authRepository == null) authRepository = new AuthRepository();
    }

    private void configureView(){
        mEmail = findViewById(R.id.editText_Email);
        mPassword = findViewById(R.id.editText_Password);
        mConfirmPassword = findViewById(R.id.editText_ConfirmPassword);
        mStatus = findViewById(R.id.textView_Status);
        findViewById(R.id.button_Register).setOnClickListener(v -> onRegister());
        findViewById(R.id.textView_ToLogin).setOnClickListener(v -> {
            finish();
        });
    }

    private void onRegister(){
        if (!validate()) return;

        RegisterRequest request = new RegisterRequest();
        request.setEmail(mEmail.getText().toString().trim());
        request.setPassword(mPassword.getText().toString().trim());
        Callback<Void> callback = new Callback<Void>() {
            @Override
            public void onResponse(Call<Void> call, Response<Void> response) {
                if (!response.isSuccessful()) {
                    mStatus.setText(response.message());
                    return;
                }
                finish();
            }
            @Override
            public void onFailure(Call<Void> call, Throwable t) {
                mStatus.setText(t.getMessage());
            }
        };
        authRepository.register(request, callback);
    }

    //TODO
    private boolean validate(){
        if (mEmail.getText().toString().trim().isEmpty()){
            mStatus.setText(R.string.ERR_EMAIL_EMPTY);
            return false;
        }

        if (!emailPattern.matcher(mEmail.getText().toString().trim()).matches()){
            mStatus.setText(R.string.ERR_EMAIL_INVALID);
            return false;
        }

        if (mPassword.getText().toString().trim().isEmpty()){
            mStatus.setText(R.string.ERR_PASSWORD_EMPTY);
            return false;
        }

        if (!mPassword.getText().toString().trim().equals(mConfirmPassword.getText().toString().trim())){
            mStatus.setText(R.string.ERR_PASSWORD_NOT_MATCH);
            return false;
        }

        mStatus.setText("");
        return true;
    }
}