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

public class GridView2 extends AppCompatActivity {

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
        GridView2.MyGridAdapter gAdapter = new GridView2.MyGridAdapter(this);
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

        Integer[] posterID = {R.drawable.humidifier01, R.drawable.humidifier02, R.drawable.humidifier03, R.drawable.humidifier04, R.drawable.humidifier05, R.drawable.humidifier06, R.drawable.humidifier07, R.drawable.humidifier08, R.drawable.humidifier09, R.drawable.humidifier10, R.drawable.humidifier11, R.drawable.humidifier12, R.drawable.humidifier01, R.drawable.humidifier02, R.drawable.humidifier03, R.drawable.humidifier04, R.drawable.humidifier05, R.drawable.humidifier06, R.drawable.humidifier07, R.drawable.humidifier08, R.drawable.humidifier09, R.drawable.humidifier10, R.drawable.humidifier11, R.drawable.humidifier12};

        // 다이얼로그 팝업창의 Title 내용에 들어갈 posterTitle 배열 내용을 정의함
        String[] posterTitle = { "큐브라이트 가습기", "스퀘어미니 가습기", "무선미니가습기", " 비소리 가습기","간이가습기",
                "무중력 물멍 가습기", "센스S 무선 가습기", "미니 가습기 ", "스팀 가습기", "온도조절 가습기", "무드 가습기",
                "간편세척 가습기", "스마트 가습기", "음성제어 가습기","충전식 가습기",
                "초음파 가습기", "터치식 가습기", "무선 가습기", "향균 가습기", "기화식 가습기",
                "복합식 가습기", "휴대용 가습기", "무드등 가습기", "자연 가습기","USB 가습기",
                "사무실 가습기", "침실용 가습기", "UV-C 가습기", "아로마 가습기", "무선충전 가습기"};

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
                    View dialogView = (View) View.inflate(GridView2.this, R.layout.dialog, null);
                    AlertDialog.Builder dlg = new AlertDialog.Builder(GridView2.this);
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