/// Path of all the flare assets in defined here
/// Add flare to assets/flare at root and then add the path here.

class Flares {
  static final Flares _instance = Flares._internal();
  static Flares get instance => _instance;

  factory Flares() {
    return _instance;
  }

  Flares._internal();
  //TODO(Aashish): Set Base Path through Config.
  String _basePath = '';

  set setBasePath(String value) => _basePath = value;

  String get successCheck => '$_basePath/success_check.flr';
}
