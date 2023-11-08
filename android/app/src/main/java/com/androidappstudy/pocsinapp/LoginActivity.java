package com.androidappstudy.pocsinapp;

import android.content.Intent;
import android.os.Bundle;
import android.util.Log;
import android.view.View;
import android.widget.Button;
import android.widget.EditText;
import android.widget.Toast;

import androidx.appcompat.app.ActionBar;
import androidx.appcompat.app.AppCompatActivity;

import com.androidappstudy.pocsinapp.retrofit.User;
import com.androidappstudy.pocsinapp.retrofit.UserApi;
//import com.cookandroidappstudy.pocsin_main.retrofit.User;
//import com.cookandroidappstudy.pocsin_main.retrofit.UserApi;
import com.squareup.moshi.Moshi;

import retrofit2.Call;
import retrofit2.Callback;
import retrofit2.Response;
import retrofit2.Retrofit;
import retrofit2.converter.moshi.MoshiConverterFactory;

public class LoginActivity extends AppCompatActivity {
    private final String TAG = getClass().getSimpleName();

    Button btnSignIn;
    EditText signInId, signInPw;

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        setContentView(R.layout.activity_login);

        ActionBar actionBar = getSupportActionBar();
        actionBar.hide();

        signInId = (EditText)findViewById(R.id.signInId);
        signInPw = (EditText)findViewById(R.id.signInPw);

//        btnGoSignUp = (Button) findViewById(R.id.btnGoSignUp);
        btnSignIn = (Button) findViewById(R.id.btnSignIn);



        // 로그인 버튼만 클릭하면 메인화면(SignUpSuccess.class)으로 넘어가게 할때
        // 아래 구문들은 주석 처리를 합니다.
        btnSignIn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {

                String id = signInId.getText().toString();
                String pw = signInPw.getText().toString();

                User loginInfo = new User();
                loginInfo.setUserId(id);
                loginInfo.setUserPassword(pw);

                Moshi moshi = new Moshi.Builder().build();

                // 아래 String json = moshi.adapter(User.class).indent("  ").toJson(loginInfo); 구문을 실행하면
                // 좌측 json 변수에, 위에서 loginInfo 변수에 설정된 userId, userPassword 정보를
                // User loginInfo = new User();
                // loginInfo.setUserId(id);
                // loginInfo.setUserPassword(pw);
                String json = moshi.adapter(User.class).indent("  ").toJson(loginInfo);

                // 아래 System.out.println(json); 구문을 실행하면
                // 안드로이드 스튜디오 하단 "Run" 클릭했을때, 다음과 같이 화면 출력 확인이 가능합니다.
                // I/System.out: {
                // I/System.out:   "userId": "test",
                //                "userPassword": "1234"
                // }
                System.out.println(json);

                // Retrofit 객체 생성 및 MoshiConverter 추가
                Retrofit retrofit = new Retrofit.Builder()
                        .baseUrl("http://192.168.0.42:9003/")
                        .addConverterFactory(MoshiConverterFactory.create(moshi))
                        .build();

                UserApi api = retrofit.create(UserApi.class);

                Call<Boolean> call = api.postUser(loginInfo);
                call.enqueue(new Callback<Boolean>() {
                    // Controller에서 response.isSuccessful 응답 성공(또는 실패) 시 처리할 프로세스 정의
                    @Override
                    public void onResponse(Call<Boolean> call, Response<Boolean> response) {
                        if (response.isSuccessful()){
                            boolean userExists = response.body();

                            if(userExists){
                                Intent intent = new Intent(getApplicationContext(), LoginSuccessActivity.class);
                                startActivity(intent);
                            } else {
                                Toast.makeText(getApplicationContext(), "아이디 혹은 비밀번호가 일치하지 않습니다!", Toast.LENGTH_SHORT).show();
                            }
                        } else {
                            Log.d(TAG, "Status Code : " + response.code());
                        }
                    }

                    @Override
                    public void onFailure(Call<Boolean> call, Throwable t) {
                        Log.d(TAG, "Fail msg : " + t.getMessage());
                    }
                });
            }
        });
    }
}

