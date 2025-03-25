package com.example.prm392mnlv.util;

import android.content.Context;
import android.graphics.Color;
import android.graphics.PorterDuff;
import android.view.View;

import androidx.annotation.NonNull;
import androidx.annotation.StringRes;
import androidx.appcompat.app.AlertDialog;

public final class ViewHelper {

    private ViewHelper() {}

    public static void showAlert(Context context, @StringRes int message) {
        new AlertDialog.Builder(context)
                .setMessage(message)
                .setPositiveButton(android.R.string.ok, (dialog, which) -> {})
                .show();
    }

    public static void showAlert(Context context, String message) {
        new AlertDialog.Builder(context)
                .setMessage(message)
                .setPositiveButton(android.R.string.ok, (dialog, which) -> {})
                .show();
    }

    public static void enable(@NonNull View view) {
        view.getBackground().setColorFilter(Color.WHITE, PorterDuff.Mode.MULTIPLY);
        view.setEnabled(true);
    }

    public static void disable(@NonNull View view) {
        view.getBackground().setColorFilter(Color.GRAY, PorterDuff.Mode.MULTIPLY);
        view.setEnabled(false);
    }
}
