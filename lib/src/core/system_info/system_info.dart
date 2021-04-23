import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/core/device_info/device_info.dart';
import 'package:meta/meta.dart';

class SystemInfo implements DeviceInfo, PackageInformation {
  const SystemInfo({@required this.deviceInfo, @required this.packageInfo});

  final DeviceInfo deviceInfo;
  final PackageInformation packageInfo;

  @override
  String get version => packageInfo.version;

  @override
  String get appName => packageInfo.appName;

  @override
  String get packageName => packageInfo.packageName;

  @override
  String get buildNumber => packageInfo.buildNumber;

  @override
  String get brand => deviceInfo.brand;

  @override
  String get id => deviceInfo.id;

  @override
  String get manufacturer => deviceInfo.manufacturer;

  @override
  String get model => deviceInfo.model;

  @override
  String get os => deviceInfo.os;

  @override
  int get sdk => deviceInfo.sdk;

  Map<String, dynamic> get map => {
        "AppVersionName": appName,
        "AppVersionNumber": version,
        "Brand": brand,
        "GcmId": "na",
        "Manufacturer": manufacturer,
        "Model": model,
        "OSVersion": os,
        "SdkVersion": sdk,
        "Serial": id,
      };
}
