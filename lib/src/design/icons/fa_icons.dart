import 'fa_icon_asset.dart';

abstract final class FaIcons {
  static const package2 = FaIconAsset('package_2', width: 15, height: 16);
  static const download = FaIconAsset('download', width: 13, height: 13);
  static const factCheck = FaIconAsset('fact_check', width: 16, height: 15);
  static const arrowOutward =
      FaIconAsset('arrow_outward', width: 10, height: 10);
  static const verified = FaIconAsset('verified', width: 12, height: 11);
  static const lock = FaIconAsset('lock', width: 14, height: 18);
  static const visibility = FaIconAsset('visibility', width: 16, height: 11);
  static const logout = FaIconAsset('logout', width: 24, height: 24);
  static const addShoppingCart =
      FaIconAsset('add_shopping_cart', width: 24, height: 24);

  // Multi-colour glyphs; tinting would flatten them.
  static const addAPhoto =
      FaIconAsset('add_a_photo', width: 18, height: 16, tintable: false);
  static const warning =
      FaIconAsset('warning', width: 40, height: 36, tintable: false);
}
