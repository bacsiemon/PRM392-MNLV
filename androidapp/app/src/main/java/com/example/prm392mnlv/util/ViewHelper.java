package com.example.prm392mnlv.util;

import android.content.Context;

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
}
