class SettingsPlugins {
    private fun autoTimeZoneChecks(@NonNull flutterEngine: FlutterEngine) {
        MethodChannel(
            flutterEngine.dartExecutor.binaryMessenger,
            GT_APP_CHANNEL
        ).setMethodCallHandler { call, result ->
            if (call.method == "isAutoTimeZoneEnabled") {
                val isAutoTimeZoneEnabled = android.provider.Settings.Global.getInt(
                    contentResolver,
                    android.provider.Settings.Global.AUTO_TIME_ZONE,
                    0
                ) == 1
                result.success(isAutoTimeZoneEnabled)
            } else if (call.method == "isAutoTimeEnabled") {
                val isAutoTimeEnabled = android.provider.Settings.Global.getInt(
                    contentResolver,
                    android.provider.Settings.Global.AUTO_TIME,
                    0
                ) == 1
                result.success(isAutoTimeEnabled)
            } else {
                result.notImplemented()
            }
        }
    }
}

