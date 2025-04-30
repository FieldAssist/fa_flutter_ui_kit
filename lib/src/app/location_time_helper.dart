import 'package:fa_flutter_ui_kit/src/utils/log_utils.dart';
import 'package:flutter/services.dart';
import 'package:safe_device/safe_device.dart';

class DeviceTrustChecker {
  static const MethodChannel _channel = MethodChannel("plugins");
  Future<bool> checkIfDeveloperModeEnabled() async {
    final isMockedLocation = await SafeDevice.isMockLocation;
    final isDevelopmentMode = await SafeDevice.isDevelopmentModeEnable;
    return isMockedLocation || isDevelopmentMode;
  }

  Future<bool> checkIfAutoTimeZoneEnabled() async {
    try {
      final isAutoTimeZoneEnabled =
      await _channel.invokeMethod("isAutoTimeZoneEnabled");
      logger.i("Auto time zone enabled: $isAutoTimeZoneEnabled");
      return isAutoTimeZoneEnabled;
    } on PlatformException catch (e, s) {
      logger.e(e, s);
      return false;
    } catch (e, s) {
      logger.e(e, s);
      return false;
    }
  }

  Future<bool> checkIfAutoTimeEnabled() async {
    try {
      final isAutoTimeEnabled =
      await _channel.invokeMethod("isAutoTimeEnabled");
      logger.i("Auto time enabled: $isAutoTimeEnabled");
      return isAutoTimeEnabled;
    } on PlatformException catch (e, s) {
      logger.e(e, s);
      return false;
    } catch (e, s) {
      logger.e(e, s);
      return false;
    }
  }

  // Future<void> checkIfProceed() async {
  //   isDeveloperMode = await checkIfDeveloperModeEnabled();
  //   isAutoTimeZoneEnabled = await checkIfAutoTimeZoneEnabled();
  //   isAutoTimeEnabled = await checkIfAutoTimeEnabled();
  //   _subject
  //       .add(!isDeveloperMode && isAutoTimeZoneEnabled && isAutoTimeEnabled);
  //   logger.i(
  //       "Device trust status - Developer Mode: $isDeveloperMode, Auto Time Zone is enabled: $isAutoTimeZoneEnabled, Auto Time is enabled: $isAutoTimeEnabled");
  // }
}