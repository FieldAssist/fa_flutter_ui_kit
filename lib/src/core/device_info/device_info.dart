import 'package:device_info/device_info.dart';
import 'package:meta/meta.dart';

abstract class DeviceInfo {
  String get brand;

  String get manufacturer;

  String get model;

  String get os;

  int? get sdk;

  String get id;
}

class IosDeviceInfoImpl implements DeviceInfo {
  final IosDeviceInfo iosDeviceInfo;

  const IosDeviceInfoImpl({required this.iosDeviceInfo});

  @override
  String get brand => 'Apple Inc';

  @override
  String get manufacturer => 'Apple Inc';

  @override
  String get model => iosDeviceInfo.model;

  @override
  String get os => '${iosDeviceInfo.systemName} ${iosDeviceInfo.systemVersion}';

  @override
  int? get sdk => null;

  @override
  String get id => iosDeviceInfo.identifierForVendor;
}

class AndroidDeviceInfoImpl implements DeviceInfo {
  final AndroidDeviceInfo androidDeviceInfo;

  const AndroidDeviceInfoImpl({required this.androidDeviceInfo});

  @override
  String get brand => androidDeviceInfo.brand;

  @override
  String get manufacturer => androidDeviceInfo.manufacturer;

  @override
  String get model => androidDeviceInfo.model;

  @override
  String get os => 'Android ${androidDeviceInfo.version.release}';

  @override
  int get sdk => androidDeviceInfo.version.sdkInt;

  @override
  String get id => androidDeviceInfo.id;
}

class UnknownDeviceInfoImpl implements DeviceInfo {
  const UnknownDeviceInfoImpl();

  @override
  String get brand => "NA";

  @override
  String get manufacturer => "NA";

  @override
  String get model => "NA";

  @override
  String get os => "NA";

  @override
  int get sdk => 0;

  @override
  String get id => "NA";
}
