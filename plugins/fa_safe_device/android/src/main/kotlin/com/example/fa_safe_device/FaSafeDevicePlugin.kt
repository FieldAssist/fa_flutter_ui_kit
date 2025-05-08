package com.example.fa_safe_device

import io.flutter.embedding.engine.plugins.FlutterPlugin
import io.flutter.plugin.common.MethodCall
import io.flutter.plugin.common.MethodChannel
import io.flutter.plugin.common.MethodChannel.MethodCallHandler
import io.flutter.plugin.common.MethodChannel.Result

/** FaSafeDevicePlugin */
class FaSafeDevicePlugin: FlutterPlugin, MethodCallHandler {
  /// The MethodChannel that will the communication between Flutter and native Android
  ///
  /// This local reference serves to register the plugin with the Flutter Engine and unregister it
  /// when the Flutter Engine is detached from the Activity
  private lateinit var channel : MethodChannel

  override fun onAttachedToEngine(flutterPluginBinding: FlutterPlugin.FlutterPluginBinding) {
    channel = MethodChannel(flutterPluginBinding.binaryMessenger, "fa_safe_device")
    channel.setMethodCallHandler(this)
  }

  override fun onMethodCall(call: MethodCall, result: Result) {
    if (call.method == "getPlatformVersion") {
      result.success("Android ${android.os.Build.VERSION.RELEASE}")
    }else if(call.method=="isAutoTimeZoneEnabled"){
      val isAutoTimeZoneEnabled = android.provider.Settings.Global.getInt(
        contentResolver,
        android.provider.Settings.Global.AUTO_TIME_ZONE,
        0
      ) == 1
      result.success(isAutoTimeZoneEnabled)
    }else if(call.method=="isAutoTimeEnabled"){
      val isAutoTimeEnabled = android.provider.Settings.Global.getInt(
        contentResolver,
        android.provider.Settings.Global.AUTO_TIME,
        0
      ) == 1
      result.success(isAutoTimeEnabled)
    }
    else {
      result.notImplemented()
    }
  }

  override fun onDetachedFromEngine(binding: FlutterPlugin.FlutterPluginBinding) {
    channel.setMethodCallHandler(null)
  }
}
