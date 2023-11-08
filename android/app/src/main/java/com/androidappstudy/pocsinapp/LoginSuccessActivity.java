package com.androidappstudy.pocsinapp;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.net.Uri;
import android.os.Bundle;
import android.view.View;
import android.webkit.WebSettings;
import android.webkit.WebView;
import android.webkit.WebViewClient;
import android.widget.Button;
import android.widget.ImageButton;

import androidx.annotation.Nullable;

public class LoginSuccessActivity extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.login_success);

        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();

        ImageButton btnSounds = (ImageButton)findViewById(R.id.sounds_icon);
        btnSounds.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), SoundsMain.class);
                startActivity(intent);
            }
        });

        ImageButton btnHome = (ImageButton)findViewById(R.id.home_icon);
        btnHome.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), LoginSuccessActivity.class);
                startActivity(intent);
            }
        });

        ImageButton btnCalendar = (ImageButton)findViewById(R.id.calendar_icon);
        btnCalendar.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), LoginSuccessActivity.class);
                startActivity(intent);
            }
        });

        ImageButton btnStore = (ImageButton)findViewById(R.id.store_icon);
        btnStore.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), GridView1.class);
                startActivity(intent);
            }
        });

        ImageButton btnLocation = (ImageButton)findViewById(R.id.building_icon);
        btnLocation.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), LoginSuccessActivity.class);
                startActivity(intent);
            }
        });

        ImageButton btnLogout = (ImageButton)findViewById(R.id.logout_icon);
        btnLogout.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), LoginSuccessActivity.class);
                startActivity(intent);
            }
        });

    }

}
