import 'fa_safe_device_platform_interface.dart';

class FaSafeDevice {
  Future<String?> getPlatformVersion() {
    return FaSafeDevicePlatform.instance.getPlatformVersion();
  }

  Future<bool> isAutoTimeZoneEnabled() {
    return FaSafeDevicePlatform.instance.isAutoTimeZoneEnabled();
  }

  Future<bool> isAutoTimeEnabled() {
    return FaSafeDevicePlatform.instance.isAutoTimeEnabled();
  }
  Future<bool> isDeveloperModeEnabled(){
    return FaSafeDevicePlatform.instance.isDeveloperModeEnabled();
  }
}
