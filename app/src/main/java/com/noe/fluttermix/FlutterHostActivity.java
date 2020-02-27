package com.noe.fluttermix;

import android.content.Intent;

import io.flutter.embedding.android.FlutterActivity;
import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class FlutterHostActivity extends FlutterActivity {

    public static final String CHANNEL_NAME = "com.zcm/demo";

    @Override
    public void configureFlutterEngine(FlutterEngine flutterEngine) {
        super.configureFlutterEngine(flutterEngine);
        new MethodChannel(flutterEngine.getDartExecutor().getBinaryMessenger(), CHANNEL_NAME)
                .setMethodCallHandler(new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall call, MethodChannel.Result result) {
                        methodCall(call, result);
                    }
                });

    }

    /**
     * 处理dart层传来的方法调用
     */
    private void methodCall(MethodCall call, MethodChannel.Result result) {
        if ("native//:nativePage".equals(call.method)) {
            startActivity(new Intent(this, NativePageActivity.class));
        }
    }
}
