package com.androidappstudy.pocsinapp;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AlertDialog;
import androidx.appcompat.app.AppCompatActivity;

import android.content.Context;
import android.content.Intent;
import android.os.Bundle;
import android.view.View;
import android.view.ViewGroup;
import android.widget.BaseAdapter;
import android.widget.GridView;
import android.widget.ImageButton;
import android.widget.ImageView;

public class GridView1 extends AppCompatActivity {

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
        MyGridAdapter gAdapter = new MyGridAdapter(this);
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

    public class MyGridAdapter extends BaseAdapter{
        Context context;

        public MyGridAdapter(Context context) {
            this.context = context;
        }

        @Override
        public int getCount() {
            return posterID.length;
        }

        Integer[] posterID = {R.drawable.light01, R.drawable.light02, R.drawable.light03, R.drawable.light04, R.drawable.light05, R.drawable.light06, R.drawable.light07, R.drawable.light08, R.drawable.light09, R.drawable.light10, R.drawable.light11, R.drawable.light12, R.drawable.light01, R.drawable.light02, R.drawable.light03, R.drawable.light04, R.drawable.light05, R.drawable.light06, R.drawable.light07, R.drawable.light08, R.drawable.light09, R.drawable.light10, R.drawable.light11, R.drawable.light12};

        // 다이얼로그 팝업창의 Title 내용에 들어갈 posterTitle 배열 내용을 정의함
        String[] posterTitle = { "맑은잠수면등", "구름조명 무드등", "취침등", " 선라이즈 웨이크업","파워 LED 플러그 조명등",
                "미라클모닝 수면등", "인테리어 무드등", "휴대용 삼각 LED 무드등 ", "패브릭 침실 수면등", "LED 무선 스탠드", "LED 아르민 스탠드",
                "해피 포에버 수면등", "디어문 큐브 무드등", "수면등","취침등",
                "무드등", "메리토 무드등", "헤이홈 스마트등", "스마티 프리미엄등", "레토 무선 갓 LED등",
                "아임라이트", "탁상조명", "침실 무드등", "Utorch 무드등","이지탭 미니 무드등",
                "무선 조명등", "LED 스마트 취침등", "광센서 조명", "높이조절 LED등", "충전식 무드등"};

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
            imageView.setLayoutParams(new ViewGroup.LayoutParams(350, 350));
            imageView.setScaleType(ImageView.ScaleType.FIT_CENTER);
            imageView.setPadding(5, 5, 5, 50);
            imageView.setImageResource(posterID[position]);

            final int pos = position;
            imageView.setOnClickListener(new View.OnClickListener() {
                @Override
                public void onClick(View view) {
                    View dialogView = (View) View.inflate(GridView1.this, R.layout.dialog, null);
                    AlertDialog.Builder dlg = new AlertDialog.Builder(GridView1.this);
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
