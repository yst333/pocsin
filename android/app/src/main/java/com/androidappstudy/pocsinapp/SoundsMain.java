package com.androidappstudy.pocsinapp;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Intent;
import android.media.MediaPlayer;
import android.os.Bundle;
import android.os.SystemClock;
import android.view.View;
import android.widget.ImageButton;
import android.widget.SeekBar;

public class SoundsMain extends AppCompatActivity {
    MediaPlayer mPlayer;
    SeekBar pbMP3;
    ImageButton switch1, switch2, switch3, switch4;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.sounds_main);

        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();

        ImageButton todayMedia = (ImageButton)findViewById(R.id.imageButton5);
        todayMedia.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), SoundsPlay.class);
                startActivity(intent);
            }
        });

        getSupportActionBar().setDisplayShowHomeEnabled(true);

        pbMP3 = findViewById(R.id.seekBar);
        switch1 = findViewById(R.id.imageButton1);
        switch2 = findViewById(R.id.imageButton2);
        switch3 = findViewById(R.id.imageButton3);
        switch4 = findViewById(R.id.imageButton4);

        switch1.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (switch1.isEnabled()) { // isEnabled()를 사용하여 버튼 활성화 여부 확인
                    stopMedia(); // 이전 미디어 재생을 중지하고 리소스 해제
                    mPlayer = MediaPlayer.create(getApplicationContext(), R.raw.whitenoise);
                    mPlayer.start();
                    makeThread();
                } else {
                    stopMedia();
                }
            }
        });

        switch2.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (switch2.isEnabled()) {
                    stopMedia();
                    mPlayer = MediaPlayer.create(getApplicationContext(), R.raw.asmr);
                    mPlayer.start();
                    makeThread();
                } else {
                    stopMedia();
                }
            }
        });

        switch3.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (switch3.isEnabled()) {
                    stopMedia();
                    mPlayer = MediaPlayer.create(getApplicationContext(), R.raw.meditation);
                    mPlayer.start();
                    makeThread();
                } else {
                    stopMedia();
                }
            }
        });

        switch4.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                if (switch4.isEnabled()) {
                    stopMedia();
                    mPlayer = MediaPlayer.create(getApplicationContext(), R.raw.classicalmusic);
                    mPlayer.start();
                    makeThread();
                } else {
                    stopMedia();
                }
            }
        });


        pbMP3.setOnSeekBarChangeListener(new SeekBar.OnSeekBarChangeListener() {
            @Override
            public void onProgressChanged(SeekBar seekBar, int progress, boolean fromUser) {
                if (fromUser){
                    mPlayer.seekTo(progress);
                }
            }

            @Override
            public void onStartTrackingTouch(SeekBar seekBar) {
            }

            @Override
            public void onStopTrackingTouch(SeekBar seekBar) {
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

    void makeThread() {
        new Thread(){
            @Override
            public void run() {
                // 음악이 계속 작동중이라면
                while (mPlayer.isPlaying()){
                    // 음악의 시간을 최대로 설정
                    pbMP3.setMax(mPlayer.getDuration());
                    // 현재 위치를 지정
                    pbMP3.setProgress(mPlayer.getCurrentPosition());
                    SystemClock.sleep(100);
                }
                pbMP3.setProgress(0);
            }
        }.start();
    }

    // 이전 미디어 재생을 중지하고 리소스 해제하는 함수
    private void stopMedia() {
        if (mPlayer != null) {
            if (mPlayer.isPlaying()) {
                mPlayer.stop();
            }
            mPlayer.release();
            mPlayer = null;
        }
    }
}
