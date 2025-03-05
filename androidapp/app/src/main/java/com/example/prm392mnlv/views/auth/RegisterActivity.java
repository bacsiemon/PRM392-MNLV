package com.example.prm392mnlv.views.auth;

import android.os.Bundle;
import android.widget.Button;
import android.widget.EditText;
import android.widget.TextView;

import androidx.activity.EdgeToEdge;
import androidx.appcompat.app.AppCompatActivity;
import androidx.core.graphics.Insets;
import androidx.core.view.ViewCompat;
import androidx.core.view.WindowInsetsCompat;

import com.example.prm392mnlv.R;

public class RegisterActivity extends AppCompatActivity {

    private EditText emailAddressEditText;
    private EditText passwordEditText;
    private EditText confirmPasswordEditText;
    private TextView errorEditText;
    private Button registerButton;
    private TextView toLoginButton;

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
        configureRegister();
    }

    private void configureRegister(){
        emailAddressEditText = findViewById(R.id.editText_EmailAddress);
        passwordEditText = findViewById(R.id.editText_Password);
        confirmPasswordEditText = findViewById(R.id.editText_ConfirmPassword);
        errorEditText = findViewById(R.id.textView_Error);
        registerButton = findViewById(R.id.button_Login);
        registerButton.setOnClickListener(v -> onRegister());
    }

    private void onRegister(){

    }
}