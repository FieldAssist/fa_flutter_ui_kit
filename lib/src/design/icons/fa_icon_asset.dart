import 'package:flutter/foundation.dart';

@immutable
class FaIconAsset {
  const FaIconAsset(
    this.name, {
    required this.width,
    required this.height,
    this.tintable = true,
    this.package = 'fa_flutter_ui_kit',
  });

  final String name;
  final double width;
  final double height;
  final bool tintable;

  /// `null` for an icon bundled by the app itself.
  final String? package;

  String get path => 'assets/icons/$name.svg';
}
