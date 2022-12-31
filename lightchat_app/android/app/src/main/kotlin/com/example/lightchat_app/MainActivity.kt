package com.example.lightchat_app

import io.flutter.embedding.android.FlutterActivity

//引入
import android.os.Build;
import android.os.Bundle;

class MainActivity: FlutterActivity() {
    //设置状态栏沉浸式透明（修改flutter状态栏黑色半透明为全透明）
    override fun onCreate(savedInstanceState: Bundle?) {
        super.onCreate(savedInstanceState);
        if (Build.VERSION.SDK_INT >= Build.VERSION_CODES.LOLLIPOP) {
            window.statusBarColor = 0
        }
    }
}
