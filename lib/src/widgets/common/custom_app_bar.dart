import 'package:flutter/material.dart';

class BaseAppBar extends AppBar {
  BaseAppBar({
    Widget? leading,
    required Widget title,
    List<Widget>? actions,
    PreferredSizeWidget? bottom,
    bool automaticallyImplyLeading = true,
    IconThemeData? iconTheme,
    bool? centerTitle,
    double? leadingWidth,
  }) : super(
          automaticallyImplyLeading: automaticallyImplyLeading,
          iconTheme: iconTheme,
          leadingWidth: leadingWidth,
          centerTitle: centerTitle,
          leading: leading,
          title: title,
          actions: [
            if (actions != null) ...actions,
          ],
          bottom: bottom,
        );
}
