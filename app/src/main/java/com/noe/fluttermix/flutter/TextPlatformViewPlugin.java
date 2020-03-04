package com.noe.fluttermix.flutter;

import io.flutter.plugin.common.PluginRegistry;
import io.flutter.plugin.common.StandardMessageCodec;
import io.flutter.plugin.platform.PlatformViewRegistry;

/**
 * Created by lijie on 2019-11-01.
 */
public class TextPlatformViewPlugin {
    public static void register(PlatformViewRegistry platformViewRegistry) {
        platformViewRegistry.registerViewFactory("plugins.test/view",
                new TextPlatformViewFactory(StandardMessageCodec.INSTANCE));
    }
}
