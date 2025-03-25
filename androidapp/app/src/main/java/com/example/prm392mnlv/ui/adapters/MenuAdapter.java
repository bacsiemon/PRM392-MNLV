package com.example.prm392mnlv.ui.adapters;

import android.content.Context;
import android.content.Intent;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ImageView;
import android.widget.TextView;

import androidx.annotation.NonNull;
import androidx.recyclerview.widget.RecyclerView;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.ui.activities.*;

import com.example.prm392mnlv.data.models.MenuItem;

import java.util.List;

public class MenuAdapter extends RecyclerView.Adapter<MenuAdapter.MenuViewHolder> {
    private final List<MenuItem> list;
    private final Context context;

    public MenuAdapter(List<MenuItem> list, Context context) {
        this.list = list;
        this.context = context;
    }

    @NonNull
    @Override
    public MenuViewHolder onCreateViewHolder(@NonNull ViewGroup parent, int viewType) {
        View view = LayoutInflater.from(context).inflate(R.layout.item_home_menu, parent, false);
        return new MenuViewHolder(view);
    }

    @Override
    public void onBindViewHolder(@NonNull MenuViewHolder holder, int position) {
        MenuItem item = list.get(position);
        holder.label.setText(item.title);
        holder.icon.setImageResource(item.icon);

        holder.itemView.setOnClickListener(v -> {
            switch (item.title) {
                case "Search":
                    context.startActivity(new Intent(context, ProductListActivity.class));
                    break;
                case "Product Details":
                    context.startActivity(new Intent(context, ProductDetailActivity.class));
                    break;
                case "Cart":
                    context.startActivity(new Intent(context, CartActivity.class));
                    break;
                case "Checkout":
                    context.startActivity(new Intent(context, CheckoutActivity.class));
                    break;
                case "Order Details":
                    context.startActivity(new Intent(context, OrderDetailsActivity.class));
                    break;
                case "Map":
                    context.startActivity(new Intent(context, MapActivity.class));
                    break;
            }
        });
    }

    @Override
    public int getItemCount() {
        return list.size();
    }

    static class MenuViewHolder extends RecyclerView.ViewHolder {
        ImageView icon;
        TextView label;

        public MenuViewHolder(@NonNull View itemView) {
            super(itemView);
            icon = itemView.findViewById(R.id.menuIcon);
            label = itemView.findViewById(R.id.menuLabel);
        }
    }
}
