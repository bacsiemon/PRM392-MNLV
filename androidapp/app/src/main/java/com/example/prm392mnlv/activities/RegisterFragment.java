package com.example.prm392mnlv.activities;

import android.os.Bundle;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.fragment.app.Fragment;

import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.EditText;
import android.widget.TextView;
import android.widget.Toast;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.dto.response.RegisterResponse;
import com.example.prm392mnlv.retrofit.repositories.AuthManager;

import java.util.regex.Pattern;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;

/**
 * A simple {@link Fragment} subclass.
 * Use the {@link RegisterFragment#} factory method to
 * create an instance of this fragment.
 */
public class RegisterFragment extends Fragment {

    private EditText mName;
    private EditText mEmail;
    private EditText mPhoneNumber;
    private EditText mPassword;
    private EditText mConfirmPassword;
    private TextView mStatus;
    private AuthManager authManager;

    private final Pattern emailPattern = Pattern.compile("^(?=.{1,64}@)[A-Za-z0-9_-]+(\\.[A-Za-z0-9_-]+)*@"
            + "[^-][A-Za-z0-9-]+(\\.[A-Za-z0-9-]+)*(\\.[A-Za-z]{2,})$");

    @Nullable
    @Override
    public View onCreateView(@NonNull LayoutInflater inflater, @Nullable ViewGroup container, @Nullable Bundle savedInstanceState) {
        return inflater.inflate(R.layout.fragment_register, container, false);
    }

    @Override
    public void onViewCreated(@NonNull View view, @Nullable Bundle savedInstanceState) {
        super.onViewCreated(view, savedInstanceState);
        configureView(view);
    }

    @Override
    public void onStart() {
        super.onStart();
        if (authManager == null) authManager = new AuthManager();
    }

    private void configureView(View view) {
        mName = view.findViewById(R.id.editText_Name);
        mEmail = view.findViewById(R.id.editText_Email);
        mPhoneNumber = view.findViewById(R.id.editText_PhoneNumber);
        mPassword = view.findViewById(R.id.editText_Password);
        mConfirmPassword = view.findViewById(R.id.editText_ConfirmPassword);
        mStatus = view.findViewById(R.id.textView_Status);
        view.findViewById(R.id.button_Register).setOnClickListener(v -> onRegister());
        view.findViewById(R.id.textView_ToLogin).setOnClickListener(v -> {
            if (getActivity() != null) {
                getActivity().finish();
            }
        });
    }

    private void onRegister() {
        if (!validate()) return;

        String name = "TEST_NAME";
        String phoneNumber = "0333666999";
        String email = mEmail.getText().toString().trim();
        String password = mPassword.getText().toString().trim();

        Callback<RegisterResponse> callback = new Callback<>() {
            @Override
            public void onResponse(@NonNull Call<RegisterResponse> call, @NonNull Response<RegisterResponse> response) {
                mStatus.setText(response.message());
                if (!response.isSuccessful()) {
                    return;
                }
                if (getContext() != null) {
                    Toast.makeText(getContext(), R.string.REGISTER_CONFIRMATION_MAIL_SENT, Toast.LENGTH_SHORT).show();
                    if (getActivity() != null) {
                        getActivity().finish();
                    }
                }
            }

            @Override
            public void onFailure(@NonNull Call<RegisterResponse> call, @NonNull Throwable t) {
                mStatus.setText(t.getMessage());
            }
        };
        authManager.register(name, email, phoneNumber, password, callback);
    }

    private boolean validate() {
        if (mName.getText().toString().trim().isEmpty()) {
            mStatus.setText(R.string.ERR_NAME_EMPTY);
            return false;
        }

        if (mEmail.getText().toString().trim().isEmpty()) {
            mStatus.setText(R.string.ERR_EMAIL_EMPTY);
            return false;
        }

        if (!emailPattern.matcher(mEmail.getText().toString().trim()).matches()) {
            mStatus.setText(R.string.ERR_EMAIL_INVALID);
            return false;
        }

        if (mPhoneNumber.getText().toString().trim().isEmpty()) {
            mStatus.setText(R.string.ERR_PHONE_NUMBER_EMPTY);
            return false;
        }

        if (mPassword.getText().toString().trim().isEmpty()) {
            mStatus.setText(R.string.ERR_PASSWORD_EMPTY);
            return false;
        }

        if (!mPassword.getText().toString().trim().equals(mConfirmPassword.getText().toString().trim())) {
            mStatus.setText(R.string.ERR_PASSWORD_NOT_MATCH);
            return false;
        }

        mStatus.setText("");
        return true;
    }
}