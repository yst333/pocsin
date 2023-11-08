package com.androidappstudy.pocsinapp;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageButton;
import android.widget.ImageView;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

public class GridView3 extends AppCompatActivity {

    ImageButton btnTab01, btnTab02, btnTab03;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.gridview1);

        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();

        btnTab01 = (ImageButton)findViewById(R.id.tab01);
        btnTab01.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), GridView1.class);
                startActivity(intent);
            }
        });

        btnTab02 = (ImageButton)findViewById(R.id.tab02);
        btnTab02.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), GridView2.class);
                startActivity(intent);
            }
        });

        btnTab03 = (ImageButton)findViewById(R.id.tab03);
        btnTab03.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Intent intent = new Intent(getApplicationContext(), GridView3.class);
                startActivity(intent);
            }
        });

        final GridView gv = (GridView) findViewById(R.id.gridview1);
        GridView3.MyGridAdapter gAdapter = new GridView3.MyGridAdapter(this);
        gv.setAdapter(gAdapter);

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

    public class MyGridAdapter extends BaseAdapter {
        Context context;

        public MyGridAdapter(Context context) {
            this.context = context;
        }

        @Override
        public int getCount() {
            return posterID.length;
        }

        Integer[] posterID = {R.drawable.pajamas01, R.drawable.pajamas02, R.drawable.pajamas03, R.drawable.pajamas04, R.drawable.pajamas05, R.drawable.pajamas06, R.drawable.pajamas07, R.drawable.pajamas08, R.drawable.pajamas09, R.drawable.pajamas10, R.drawable.pajamas11, R.drawable.pajamas12, R.drawable.pajamas01, R.drawable.pajamas02, R.drawable.pajamas03, R.drawable.pajamas04, R.drawable.pajamas05, R.drawable.pajamas06, R.drawable.pajamas07, R.drawable.pajamas08, R.drawable.pajamas09, R.drawable.pajamas10, R.drawable.pajamas11, R.drawable.pajamas12};

        // 다이얼로그 팝업창의 Title 내용에 들어갈 posterTitle 배열 내용을 정의함
        String[] posterTitle = { "포인트 잔체크", "줄무늬 홈웨어", "홀텐 테디베어", " 비소리 가습기","간이가습기",
                "긴팔 커플 잠옷", "반팔 커플 잠옷", "무지기모면 파자마 ", "블루 체크 반바지", "남자 고급 수면잠옷", "감성 레이스 체크",
                "굿베어 순면 파자마", "베이지블룸 순면", "멜로체크 커플용","드리밍 파자마",
                "플란넬 파자마", "코튼파자마", "극세사 소프트", "심플 파자마", "순면 파자마",
                "플레인 긴팔", "울랄라 파자마", "코튼텐셀 파자마", "실크배색 파자마","사이드 심리스",
                "테리 파자마 셋업", "노르딕 슬립 파자마", "긴팔 무지", "수면잠옷", "사계절 면잠옷"};

        @Override
        public Object getItem(int i) {
            return null;
        }

        @Override
        public long getItemId(int i) {
            return 0;
        }

        @Override
        public View getView(int position, View convertView, ViewGroup parent) {
            ImageView imageView = new ImageView(context);
            imageView.setLayoutParams(new ViewGroup.LayoutParams(400, 400));
            imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
            imageView.setPadding(5, 5, 5, 50);
            imageView.setImageResource(posterID[position]);

            final int pos = position;
            imageView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    View dialogView = (View) View.inflate(GridView3.this, R.layout.dialog, null);
                    AlertDialog.Builder dlg = new AlertDialog.Builder(GridView3.this);
                    ImageView ivPoster = (ImageView) dialogView.findViewById(R.id.ivPoster);
                    ivPoster.setImageResource(posterID[pos]);
                    // 다이얼로그 팝업창의 Title 내용에 posterTitle 배열 내용 적용함
                    dlg.setTitle("제품명 : " + posterTitle[pos]);
                    dlg.setIcon(R.drawable.store_icon);
                    dlg.setView(dialogView);
                    dlg.setNegativeButton("닫기", null);
                    dlg.show();
                }
            });
            return imageView;
        }
    }
}
