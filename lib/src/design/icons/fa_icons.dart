import 'fa_icon_asset.dart';

/// Icons the kit's own components draw. Apps bundle their screen icons
/// themselves (`FaIconAsset(..., package: null)`).
abstract final class FaIcons {
  // Multi-colour glyph; tinting would flatten it.
  static const addAPhoto =
      FaIconAsset('add_a_photo', width: 18, height: 16, tintable: false);
}
