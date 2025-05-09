import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'fa_safe_device_method_channel.dart';

abstract class FaSafeDevicePlatform extends PlatformInterface {
  /// Constructs a FaSafeDevicePlatform.
  FaSafeDevicePlatform() : super(token: _token);

  static final Object _token = Object();

  static FaSafeDevicePlatform _instance = MethodChannelFaSafeDevice();

  /// The default instance of [FaSafeDevicePlatform] to use.
  ///
  /// Defaults to [MethodChannelFaSafeDevice].
  static FaSafeDevicePlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [FaSafeDevicePlatform] when
  /// they register themselves.
  static set instance(FaSafeDevicePlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  Future<String?> getPlatformVersion() {
    throw UnimplementedError('platformVersion() has not been implemented.');
  }

  Future<bool> isAutoTimeZoneEnabled() {
    throw UnimplementedError('isAutoTimeZoneEnabled() has not been implemented.');
  }

  Future<bool> isAutoTimeEnabled() {
    throw UnimplementedError('isAutoTimeEnabled() has not been implemented.');
  }

  Future<bool>  isDeveloperModeEnabled() {
    throw UnimplementedError('isDeveloperModeEnabled() has not been implemented.');
  }
}
