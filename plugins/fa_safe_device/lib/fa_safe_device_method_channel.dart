import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:safe_device/safe_device.dart';
import 'fa_safe_device_platform_interface.dart';

/// An implementation of [FaSafeDevicePlatform] that uses method channels.
class MethodChannelFaSafeDevice extends FaSafeDevicePlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('fa_safe_device');

  @override
  Future<String?> getPlatformVersion() async {
    final version =
        await methodChannel.invokeMethod<String>('getPlatformVersion');
    return version;
  }

  @override
  Future<bool> isAutoTimeZoneEnabled() async {
    final isAutoTimeZoneEnabled =
        await methodChannel.invokeMethod<bool>('isAutoTimeZoneEnabled');
    return isAutoTimeZoneEnabled ?? false;
  }

  @override
  Future<bool> isAutoTimeEnabled() async {
    final isAutoTimeEnabled =
        await methodChannel.invokeMethod<bool>('isAutoTimeEnabled');
    return isAutoTimeEnabled ?? false;
  }

  @override
  Future<bool> isDeveloperModeEnabled() async {
    final isDeveloperModeEnabled = await SafeDevice.isDevelopmentModeEnable ||
        await SafeDevice.isMockLocation;
    return isDeveloperModeEnabled;
  }
}
