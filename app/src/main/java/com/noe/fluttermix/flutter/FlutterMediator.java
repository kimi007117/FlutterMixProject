package com.noe.fluttermix.flutter;

import android.app.Application;
import android.content.Context;
import android.util.Log;

import com.idlefish.flutterboost.FlutterBoost;
import com.idlefish.flutterboost.Platform;
import com.idlefish.flutterboost.Utils;
import com.idlefish.flutterboost.interfaces.INativeRouter;

import java.util.Map;

import io.flutter.embedding.android.FlutterView;
import io.flutter.plugin.common.MethodChannel;

/**
 * Created by lijie on 2019-11-01.
 */
public class FlutterMediator {
    public static void init(final Application app) {
        INativeRouter router = new INativeRouter() {
            @Override
            public void openContainer(Context context, String url, Map<String, Object> urlParams, int requestCode, Map<String, Object> exts) {
                String assembleUrl = Utils.assembleUrl(url, urlParams);
                PageRouter.openPageByUrl(context, assembleUrl, urlParams);
            }
        };

        FlutterBoost.BoostLifecycleListener lifecycleListener = new FlutterBoost.BoostLifecycleListener() {
            @Override
            public void beforeCreateEngine() {

            }

            @Override
            public void onEngineCreated() {

            }

            @Override
            public void onPluginsRegistered() {
                MethodChannel mMethodChannel = new MethodChannel(FlutterBoost.instance().engineProvider().getDartExecutor(), "methodChannel");
                Log.e("MyApplication", "MethodChannel create");
                TextPlatformViewPlugin.register(FlutterBoost.instance().getPluginRegistry().registrarFor("TextPlatformViewPlugin"));
            }

            @Override
            public void onEngineDestroy() {

            }
        };
        Platform platform = new FlutterBoost
                .ConfigBuilder(app, router)
                .isDebug(true)
                .whenEngineStart(FlutterBoost.ConfigBuilder.ANY_ACTIVITY_CREATED)
                .renderMode(FlutterView.RenderMode.texture)
                .lifecycleListener(lifecycleListener)
                .build();

        FlutterBoost.instance().init(platform);
    }
}
