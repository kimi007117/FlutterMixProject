package com.noe.fluttermix.flutter;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;

/**
 * Created by lijie on 2019-11-01.
 */
public class TextPlatformViewPlugin {
    public static void register(PluginRegistry.Registrar registrar) {
        registrar.platformViewRegistry().registerViewFactory("plugins.test/view",
                new TextPlatformViewFactory(StandardMessageCodec.INSTANCE));
    }
}
