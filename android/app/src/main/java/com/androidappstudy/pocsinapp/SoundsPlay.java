package com.androidappstudy.pocsinapp;

import android.os.Bundle;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;
public class SoundsPlay extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.sounds_player);

        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();

    }
}
