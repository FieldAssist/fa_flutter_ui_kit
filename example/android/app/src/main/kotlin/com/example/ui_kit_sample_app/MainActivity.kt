package com.example.ui_kit_sample_app
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine
import io.flutter.plugin.common.MethodChannel
import androidx.annotation.NonNull

class MainActivity: FlutterActivity() {
    private val GT_APP_CHANNEL = "GT_APP_CHANNEL"

    override fun configureFlutterEngine(@NonNull flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            GT_APP_CHANNEL
        ).setMethodCallHandler { call, result ->
            if(call.method=="isAutoTimeZoneEnabled"){
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
    }

}
