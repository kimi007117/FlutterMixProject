package com.noe.fluttermix.base;

import android.app.Application;
import android.content.Intent;

import com.noe.fluttermix.NativePageActivity;
import com.noe.fluttermix.flutter.FlutterMediator;

import io.flutter.embedding.engine.FlutterEngine;
import io.flutter.embedding.engine.FlutterEngineCache;
import io.flutter.embedding.engine.dart.DartExecutor;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;

public class BaseApplication extends Application {


    @Override
    public void onCreate() {
        super.onCreate();
        FlutterMediator.init(this);
        FlutterEngine flutterEngine = new FlutterEngine(this);
        // Configure an initial route.
//        flutterEngine.getNavigationChannel().setInitialRoute("your/route/here");
        // Start executing Dart code to pre-warm the FlutterEngine.
        flutterEngine.getDartExecutor().executeDartEntrypoint(
                DartExecutor.DartEntrypoint.createDefault()
        );
        // Cache the FlutterEngine to be used by FlutterActivity or FlutterFragment.
        FlutterEngineCache
                .getInstance()
                .put("my_engine_id", flutterEngine);

    }

}
