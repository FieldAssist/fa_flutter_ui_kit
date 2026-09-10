import 'fa_icon_asset.dart';

abstract final class FaIcons {
  static const package2 = FaIconAsset('package_2', width: 15, height: 16);
  static const download = FaIconAsset('download', width: 13, height: 13);
  static const factCheck = FaIconAsset('fact_check', width: 16, height: 15);
  static const arrowOutward =
      FaIconAsset('arrow_outward', width: 10, height: 10);
  static const verified = FaIconAsset('verified', width: 12, height: 11);

  // Multi-colour gradient glyph; tinting would flatten it.
  static const addAPhoto =
      FaIconAsset('add_a_photo', width: 18, height: 16, tintable: false);
}
