class Images {
  static final Images _instance = Images._internal();
  static Images get instance => _instance;

  factory Images() {
    return _instance;
  }

  Images._internal();
  //TODO(Aashish): Set Base Path through Config.
  String _basePath = '';

  set setBasePath(String value) => _basePath = value;

  String get fieldAssistLogo => '$_basePath/fieldassist_logo.jpeg';
  String get fieldAssistFullLogo => '$_basePath/fieldassist_full_logo.png';
  String get doubleRingLoader => '$_basePath/double_ring_loader.gif';
  String get acceleratingGrowth => '$_basePath/accelerating_growth.png';
  String get imagePlaceHolder => "$_basePath/image_placeholder.png";
  String get launchingGrowth => '$_basePath/launching_growth.png';
  String get thumbsUp => '$_basePath/thumbs_up.png';
  String get shopLocation => '$_basePath/shop_location.png';
  String get superCommander => '$_basePath/super_commander.png';
}
