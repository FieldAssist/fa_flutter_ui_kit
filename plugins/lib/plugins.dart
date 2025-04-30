
import 'plugins_platform_interface.dart';

class Plugins {
  Future<String?> getPlatformVersion() {
    return PluginsPlatform.instance.getPlatformVersion();
  }

  Future<bool?> isAutoTimeZoneEnabled() {
    return PluginsPlatform.instance.isAutoTimeZoneEnabled();
  }

  Future<bool?> isAutoTimeEnabled() {
    return PluginsPlatform.instance.isAutoTimeEnabled();
  }

}
