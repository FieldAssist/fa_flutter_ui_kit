import 'package:fa_flutter_core/fa_flutter_core.dart';
import 'package:fa_flutter_ui_kit/src/data/contract/user_repository.dart';
import 'package:meta/meta.dart';

class UserRepositoryImpl implements UserRepository {
  UserRepositoryImpl({
    @required this.appPrefsClient,
    @required this.appHeader,
  });

  final AppPrefs appPrefsClient;
  final String appHeader;

  String get prefsToken => "${appHeader}_TOKEN";
  String get prefsIsUserLoggedIn => "${appHeader}_IS_USER_LOGGED_IN";
  String get prefsUserName => "${appHeader}_USER_NAME";
  String get prefsCompanyName => "${appHeader}_COMPANY_NAME";
  String get prefsCompanyId => "${appHeader}_COMPANY_ID";

  @override
  String get authToken => appPrefsClient.getString(prefsToken);

  @override
  set authToken(String value) => appPrefsClient.setString(prefsToken, value);

  @override
  bool get isUserLoggedIn =>
      appPrefsClient.getBool(prefsIsUserLoggedIn) ?? false;

  @override
  set isUserLoggedIn(bool value) =>
      appPrefsClient.setBool(prefsIsUserLoggedIn, value);

  @override
  Future<void> clearData() async {
    appPrefsClient
      ..setBool(prefsIsUserLoggedIn, false)
      ..setString(prefsToken, null);
  }

  @override
  String get userName => appPrefsClient.getString(prefsUserName);

  @override
  set userName(String value) => appPrefsClient.setString(prefsUserName, value);

  @override
  String get companyName => appPrefsClient.getString(prefsCompanyName);

  @override
  set companyName(String value) => appPrefsClient.setString(
        prefsCompanyName,
        value,
      );

  @override
  int get companyId => appPrefsClient.getInt(prefsCompanyId);

  @override
  set companyId(int value) => appPrefsClient.setInt(prefsCompanyId, value);
}
