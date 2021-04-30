import 'package:flutter/material.dart';

import '../flavor/flavor.dart';

class FlavorBanner extends StatelessWidget {
  const FlavorBanner({
    required this.flavor,
    required this.child,
    this.visible = false,
    Key? key,
  }) : super(key: key);

  final Widget child;
  final Flavor flavor;
  final bool visible;

  @override
  Widget build(BuildContext context) {
    if (!visible) {
      return child;
    }
    switch (flavor) {
      case Flavor.DEV:
        return Directionality(
          textDirection: TextDirection.ltr,
          child: Banner(
            color: flavor.color,
            message: flavor.name.toUpperCase(),
            location: BannerLocation.topStart,
            child: child,
          ),
        );
      case Flavor.PROD:
      default:
        return child;
    }
  }
}
