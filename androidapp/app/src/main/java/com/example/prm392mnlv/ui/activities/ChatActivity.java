package com.example.prm392mnlv.ui.activities;

import android.os.Bundle;
import android.text.TextUtils;
import android.widget.Button;
import android.widget.EditText;

import androidx.annotation.NonNull;
import androidx.annotation.Nullable;
import androidx.appcompat.app.AppCompatActivity;
import androidx.recyclerview.widget.LinearLayoutManager;
import androidx.recyclerview.widget.RecyclerView;

import com.example.prm392mnlv.R;
import com.example.prm392mnlv.data.models.Message;
import com.example.prm392mnlv.stores.TokenManager;
import com.example.prm392mnlv.ui.adapters.MessageAdapter;
import com.example.prm392mnlv.util.TokenHelper;
import com.google.firebase.database.DataSnapshot;
import com.google.firebase.database.DatabaseError;
import com.google.firebase.database.DatabaseReference;
import com.google.firebase.database.FirebaseDatabase;

public class ChatActivity extends AppCompatActivity {

    private RecyclerView recyclerViewMessages;
    private EditText edtMessage;
    private Button btnSend;

    private MessageAdapter adapter;
    private DatabaseReference chatRef;
    private String currentUserId;

    @Override
    protected void onCreate(@Nullable Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_chat);

        String token = TokenManager.INSTANCE.getTokenBlocking(TokenManager.ACCESS_TOKEN);
        TokenHelper.setToken(token);
        // Lấy userId từ JWT token
        currentUserId = TokenHelper.getUserId();
        if (currentUserId != null) {
            currentUserId = currentUserId.toUpperCase();
        }
        String receiverId = getIntent().getStringExtra("receiverId");
        if (receiverId != null) {
            receiverId = receiverId.toUpperCase();
        }
        String chatId = getChatId(currentUserId, receiverId);

        recyclerViewMessages = findViewById(R.id.recyclerViewMessages);
        edtMessage = findViewById(R.id.edtMessage);
        btnSend = findViewById(R.id.btnSend);

        recyclerViewMessages.setLayoutManager(new LinearLayoutManager(this));
        adapter = new MessageAdapter(currentUserId);
        recyclerViewMessages.setAdapter(adapter);
        recyclerViewMessages.setAdapter(adapter);

        chatRef = FirebaseDatabase.getInstance().getReference("chats").child(chatId);

        // Lắng nghe tin nhắn mới
        chatRef.addChildEventListener(new com.google.firebase.database.ChildEventListener() {
            @Override
            public void onChildAdded(@NonNull DataSnapshot snapshot, @Nullable String previousChildName) {
                Message message = snapshot.getValue(Message.class);
                if (message != null) {
                    adapter.addMessage(message);
                    recyclerViewMessages.scrollToPosition(adapter.getItemCount() - 1);
                }
            }

            @Override public void onChildChanged(@NonNull DataSnapshot snapshot, @Nullable String previousChildName) {}
            @Override public void onChildRemoved(@NonNull DataSnapshot snapshot) {}
            @Override public void onChildMoved(@NonNull DataSnapshot snapshot, @Nullable String previousChildName) {}
            @Override public void onCancelled(@NonNull DatabaseError error) {}
        });

        // Gửi tin nhắn
        btnSend.setOnClickListener(v -> {
            String text = edtMessage.getText().toString().trim();
            if (!TextUtils.isEmpty(text)) {
                Message message = new Message(currentUserId, text, System.currentTimeMillis());
                chatRef.push().setValue(message);
                edtMessage.setText("");
            }
        });
    }

    private String getChatId(String userId1, String userId2) {
        if (userId1.compareTo(userId2) < 0) {
            return userId1 + "_" + userId2;
        } else {
            return userId2 + "_" + userId1;
        }
    }
}
