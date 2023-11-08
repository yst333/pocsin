package com.androidappstudy.pocsinapp;

import android.content.Intent;
import android.os.Bundle;
import android.os.Handler;
import android.os.Looper;
import androidx.annotation.Nullable;
import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

public class MainActivity extends AppCompatActivity {
    private static final int SPLASH_DISPLAY_LENGTH = 6000; // 5초 동안 스플래시 화면을 표시

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_main);

        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();

        new Handler(Looper.getMainLooper()).postDelayed(() -> {
            // 스플래시 화면 이후 LoginActivity로 전환
            Intent loginIntent = new Intent(MainActivity.this, LoginActivity.class);
            startActivity(loginIntent);
            finish(); // 스플래시 액티비티 종료
        }, SPLASH_DISPLAY_LENGTH);
    }
}