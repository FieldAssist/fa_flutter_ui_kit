import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/core/device_info/device_info.dart';
import 'package:fa_flutter_ui_kit/src/core/system_info/system_info.dart';
import 'package:fa_flutter_ui_kit/src/data/models/country/country.dart';
import 'package:fa_flutter_ui_kit/src/data/remote/api_endpoints.dart';
import 'package:fa_flutter_ui_kit/src/data/remote/api_helper.dart';
import 'package:fa_flutter_ui_kit/src/data/repo/login_repository_impl.dart';
import 'package:fa_flutter_ui_kit/src/data/repo/user_repository_impl.dart';
import 'package:fa_flutter_ui_kit/src/navigator/navigator.dart';
import 'package:fa_flutter_ui_kit/src/utils/log_utils.dart';
import 'package:flutter/services.dart';

class AppConfig {
  //Object of ApiHelper to make network calls
  ApiHelper apiHelper;

  //ApiEndpoint contains baseurl and endpoints in the form of map
  ApiEndPoints apiEndPoints;

  //Contains navigation map
  FANavigator navigator;

  //App Header [e.g. - MT , GT ]
  String appHeader;

  //List of Countries
  List<Country> _listOfCountries;

  List<Country> get countryList => [..._listOfCountries];

  //---------------------------Repositories--------------------------------//
  LoginRepositoryImpl loginRepositoryImpl;
  UserRepositoryImpl userRepositoryImpl;

  //---------------------------Helpers--------------------------------//
  SystemInfo systemInfo;
  AppPrefs appPrefs;

  static AppConfig _instance = AppConfig._();

  static AppConfig get instance => _instance;

  AppConfig._();

  factory AppConfig({
    ApiHelper apiHelper,
    ApiEndPoints apiEndPoints,
    FANavigator navigator,
    String appHeader,
  }) {
    _instance.apiHelper = apiHelper;
    _instance.apiEndPoints = apiEndPoints;
    _instance.navigator = navigator;
    _instance.appHeader = appHeader;
    return _instance;
  }

  void initCountries() async {
    try {
      final list = await rootBundle.loadStructuredData(
        'assets/data/countries.json',
        (value) async => (jsonDecode(value) as List)
            .map((item) => Country.fromJson(item))
            .toList(growable: false),
      );
      _listOfCountries = list ?? [];
    } catch (e, s) {
      logger.e(e, s);
      rethrow;
    }
  }

  void initRepos() async {
    //Shared Preference
    appPrefs = SharedAppPrefs();
    await appPrefs.initialise();

    //Device Info
    DeviceInfo deviceInfo;
    if (isMobile) {
      final deviceInfoData = Platform.isAndroid
          ? await DeviceInfoPlugin().androidInfo
          : await DeviceInfoPlugin().iosInfo;
      if (Platform.isAndroid) {
        deviceInfo = AndroidDeviceInfoImpl(androidDeviceInfo: deviceInfoData);
      } else {
        deviceInfo = IosDeviceInfoImpl(iosDeviceInfo: deviceInfoData);
      }
    } else {
      deviceInfo = UnknownDeviceInfoImpl();
    }

    //Package Info
    final packageInfo = await PackageInformationImpl.getPackageInfo();

    //System Info
    systemInfo = SystemInfo(deviceInfo: deviceInfo, packageInfo: packageInfo);

    //Login Repository
    loginRepositoryImpl = LoginRepositoryImpl(
        apiHelper: apiHelper,
        systemInfo: systemInfo,
        apiEndPoints: apiEndPoints);

    //User Repository
    userRepositoryImpl = UserRepositoryImpl(
      appPrefsClient: appPrefs,
      appHeader: appHeader,
    );
  }
}
