package com.example.prm392mnlv.util;

import android.Manifest;
import android.app.Notification;
import android.app.NotificationChannel;
import android.app.NotificationManager;
import android.content.Context;
import android.content.pm.PackageManager;
import android.os.Build;

import androidx.core.app.ActivityCompat;
import androidx.core.app.NotificationCompat;
import androidx.core.app.NotificationManagerCompat;

public class NotificationHelper {

    public static final String ORDERS_CHANNEL_ID = "orders_channel";

    public static void createOrdersChannel(Context context){
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.O){
            NotificationManager notificationManager = (NotificationManager) context.getSystemService(Context.NOTIFICATION_SERVICE);

            if (notificationManager != null && notificationManager.getNotificationChannel(ORDERS_CHANNEL_ID) == null){
                NotificationChannel channel = new NotificationChannel(ORDERS_CHANNEL_ID, "Orders Channel", NotificationManager.IMPORTANCE_HIGH);
                channel.setDescription("Orders Notification Channel");
                notificationManager.createNotificationChannel(channel);
            }
        }
    }

    public static void sendOrdersNotificaiton(Context context, String title, String body){
        NotificationCompat.Builder builder = new NotificationCompat.Builder(context, ORDERS_CHANNEL_ID)
                .setContentTitle(title)
                .setContentText(body)
                .setPriority(NotificationCompat.PRIORITY_DEFAULT);
        NotificationManagerCompat compat = NotificationManagerCompat.from(context);
        if (ActivityCompat.checkSelfPermission(context, Manifest.permission.POST_NOTIFICATIONS) != PackageManager.PERMISSION_GRANTED) {
            compat.notify(1455, builder.build());
            // TODO: Consider calling
            //    ActivityCompat#requestPermissions
            // here to request the missing permissions, and then overriding
            //   public void onRequestPermissionsResult(int requestCode, String[] permissions,
            //                                          int[] grantResults)
            // to handle the case where the user grants the permission. See the documentation
            // for ActivityCompat#requestPermissions for more details.
            return;
        }

    }
}
