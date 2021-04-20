abstract class UserRepository {
  String get authToken;

  set authToken(String value);

  String get userName;

  set userName(String value);

  String get companyName;

  set companyName(String value);

  int get companyId;

  set companyId(int value);

  bool get isUserLoggedIn;

  set isUserLoggedIn(bool value);

  Future<void> clearData();
}
