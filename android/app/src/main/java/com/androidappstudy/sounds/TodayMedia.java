package com.androidappstudy.sounds;

import android.os.Bundle;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

public class TodayMedia extends AppCompatActivity {

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.sound_youtube_player);

        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();

    }

}
