import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/core/system_info/system_info.dart';
import 'package:fa_flutter_ui_kit/src/data/models/country/country.dart';
import 'package:fa_flutter_ui_kit/src/data/remote/api_endpoints.dart';
import 'package:fa_flutter_ui_kit/src/data/remote/api_helper.dart';
import 'package:fa_flutter_ui_kit/src/data/repo/login_repository_impl.dart';
import 'package:fa_flutter_ui_kit/src/data/repo/user_repository_impl.dart';
import 'package:fa_flutter_ui_kit/src/navigator/navigator.dart';
// import 'package:fa_flutter_ui_kit/src/utils/log_utils.dart';

class AppConfig {
  //Object of ApiHelper to make network calls
  ApiHelper? apiHelper;

  //ApiEndpoint contains baseurl and endpoints in the form of map
  ApiEndPoints? apiEndPoints;

  //Contains navigation map
  FANavigator? navigator;

  //App Header [e.g. - MT , GT ]
  String? appHeader;

  //System Info
  SystemInfo? systemInfo;

  //AppPrefs Client
  AppPrefs? appPrefs;

  //List of Countries
  List<Country> _listOfCountries = <Country>[];

  List<Country> get countryList => [..._listOfCountries];

  //---------------------------Repositories--------------------------------//
  //
  LoginRepositoryImpl? loginRepositoryImpl;
  UserRepositoryImpl? userRepositoryImpl;
  //
  //-----------------------------------------------------------------------//

  static AppConfig _instance = AppConfig._();

  static AppConfig get instance => _instance;

  AppConfig._();

  factory AppConfig(
      {ApiHelper? apiHelper,
      ApiEndPoints? apiEndPoints,
      FANavigator? navigator,
      String? appHeader,
      SystemInfo? systemInfo,
      AppPrefs? appPrefs}) {
    _instance.apiHelper = apiHelper;
    _instance.apiEndPoints = apiEndPoints;
    _instance.navigator = navigator;
    _instance.appHeader = appHeader;
    _instance.systemInfo = systemInfo;
    _instance.appPrefs = appPrefs;
    return _instance;
  }

  Future<void> initialize() async {
    await _initRepos();
  }


  Future<void> _initRepos() async {
    //Login Repository
    loginRepositoryImpl = LoginRepositoryImpl(
        apiHelper: _instance.apiHelper,
        systemInfo: _instance.systemInfo,
        apiEndPoints: _instance.apiEndPoints);

    //User Repository
    userRepositoryImpl = UserRepositoryImpl(
      appPrefsClient: _instance.appPrefs!,
      appHeader: _instance.appHeader,
    );
  }
}
